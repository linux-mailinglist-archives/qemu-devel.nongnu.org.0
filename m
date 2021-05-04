Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B1372DF8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:23:38 +0200 (CEST)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxph-00047b-Bt
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldxnA-0002Rr-3b
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldxn4-0008UB-AL
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620145252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9Mk0Wll3trlZG3xn3lgMfBMzDwQ1Ma3432lfsEcW1s=;
 b=B3fDoC5yoIiGnnZrwOsxItVT9KNgGaZ54k0iiI8QKUmAk5L5zF2ICBTTXZ9k6UYafWAuNs
 /gQV1mcxOzDkC46VJNXaQVCrvfvgQR2zP/vj312vOTHQf55ySW5Dj2BcdLGK2klwucl67e
 4vMQORrMYQHL5rIia94kZbCtFpaoLjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-EkBG7Z3gOreQH5Ere-SJkQ-1; Tue, 04 May 2021 12:20:45 -0400
X-MC-Unique: EkBG7Z3gOreQH5Ere-SJkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D001927809;
 Tue,  4 May 2021 16:20:44 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99BFB2C01B;
 Tue,  4 May 2021 16:20:43 +0000 (UTC)
Subject: Re: [PATCH] qcow2: set bdi->is_dirty
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504160656.462836-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1e28df3d-02e9-54ef-9497-3f06ecc92d4c@redhat.com>
Date: Tue, 4 May 2021 11:20:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504160656.462836-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 11:06 AM, Vladimir Sementsov-Ogievskiy wrote:
> Set bdi->is_dirty, so that qemu-img info could show dirty flag.
> 
> After this commit the following check will show '"dirty-flag": true':
> 
> ./build/qemu-img create -f qcow2 -o lazy_refcounts=on x 1M
> ./build/qemu-io x
> qemu-io> write 0 1M
> 
>  After "write" command success, kill the qemu-io process:
> 
> kill -9 <qemu-io pid>
> 
> ./build/qemu-img info --output=json x
> 
> This will show '"dirty-flag": true' among other things. (before this
> commit it shows '"dirty-flag": false')
> 
> Note, that qcow2's dirty-bit is not a "dirty bit for the image". It
> only protects qcow2 lazy refcounts feature. So, there are a lot of
> conditions when qcow2 session may be not closed correctly, but bit is
> 0. Still, when bit is set, the last session is definitely not finished
> correctly and it's better to report it.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/qcow2.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Eric Blake <eblake@redhat.com>


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


