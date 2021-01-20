Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E42FDCD8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 00:17:16 +0100 (CET)
Received: from localhost ([::1]:46414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Mix-00059X-Bc
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 18:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2MhV-0004DT-Tp
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 18:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2MhU-00030i-F4
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 18:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611184543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B7tOvdbr5ix+6euSE+EeWicE8Sox34df4l4xyhWcGrE=;
 b=Voo28ySaIsoOyF+xkMMnRe/Xyflc6JmbWo1uVRZ7++DKbSlyFEtAAfScov8vPWXW1yCIye
 OGIelN6aSOp1OLGJFFvPmCiQV7MnnkzipzVHOQfPSZxlLyq8vjZsk9V21BpHctrgc0hebE
 9tQpD+GadsvGND2y1pE9Hl4x5kxWJRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-d3Bzr4jsO-C9WVIkp5EPcw-1; Wed, 20 Jan 2021 18:15:39 -0500
X-MC-Unique: d3Bzr4jsO-C9WVIkp5EPcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52EDB15722;
 Wed, 20 Jan 2021 23:15:38 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B8A41A3D8;
 Wed, 20 Jan 2021 23:15:34 +0000 (UTC)
Subject: Re: [PATCH 03/11] block/raw-format: implement .bdrv_cancel_in_flight
 handler
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-4-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0484adfa-2822-dfd6-b311-e947892d7376@redhat.com>
Date: Wed, 20 Jan 2021 17:15:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201118180433.11931-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
> We are going to cancel in-flight requests on mirror nbd target on job
> cancel. Still nbd is often used not directly but as raw-format child.
> So, add pass-through handler here.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/raw-format.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Should all filters do this automatically (or rather, should the block
layer do this automatically for all filters)?  But I understand that it
does NOT make sense for format drivers in general (cancelling a guest
request may still require metadata updates), where raw-format is the
exception, so doing it in raw-format instead of the block layer makes sense.


>  BlockDriver bdrv_raw = {
>      .format_name          = "raw",
>      .instance_size        = sizeof(BDRVRawState),
> @@ -608,6 +613,7 @@ BlockDriver bdrv_raw = {
>      .bdrv_has_zero_init   = &raw_has_zero_init,
>      .strong_runtime_opts  = raw_strong_runtime_opts,
>      .mutable_opts         = mutable_opts,
> +    .bdrv_cancel_in_flight = raw_cancel_in_flight,

A demonstration of why I don't like aligning the =.  But it's merely
cosmetic, so doesn't affect:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


