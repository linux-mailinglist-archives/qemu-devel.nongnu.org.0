Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0E2216F6B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 16:54:58 +0200 (CEST)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsozp-00028o-Ts
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 10:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jsoz6-0001ee-6w
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 10:54:12 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45565
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jsoz2-0000R9-Sz
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 10:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594133647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPsaSJ3Ibt/zAyyMJ8BUS1GvDGHPFLHfe2Y8HmliNh0=;
 b=EUTp+6/8PSITqqu0udDWAl88VNXpljYeYDX7rlxE/UAgi7eBdRBHwk1m8CnlBzwpMq1PHh
 tdMq1fr6mvQNSEucXoER+95SnIhex+Ypd4RN7CIB3RUCtJJiAL4353Y53AQ9HxwB8N8H+C
 6usoD1t3doWtCxrStV+k6+hl2+PX4TI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-MW-mXTPWPH-FXUmptxdC9g-1; Tue, 07 Jul 2020 10:54:05 -0400
X-MC-Unique: MW-mXTPWPH-FXUmptxdC9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32D90107ACCA;
 Tue,  7 Jul 2020 14:54:04 +0000 (UTC)
Received: from [10.3.113.97] (ovpn-113-97.phx2.redhat.com [10.3.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C896E1001901;
 Tue,  7 Jul 2020 14:54:03 +0000 (UTC)
Subject: Re: [PATCH] qemu-img map: Don't limit block status request size
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200707144629.51235-1-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9f74d8dc-9c4e-d519-9dd7-0895ece3de17@redhat.com>
Date: Tue, 7 Jul 2020 09:54:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707144629.51235-1-kwolf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:31:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/20 9:46 AM, Kevin Wolf wrote:
> Limiting each loop iteration of qemu-img map to 1 GB was arbitrary from
> the beginning, though it only cut the maximum in half then because the
> interface a signed 32 bit byte count. These days, bdrv_block_status()
> supports a 64 bit byte count, so the arbitrary limit is even worse.
> 
> On file-posix, bdrv_block_status() eventually maps to SEEK_HOLE and
> SEEK_DATA, which don't support a limit, but always do all of the work
> necessary to find the start of the next hole/data. Much of this work may
> be repeated if we don't use this information fully, but query with an
> only slightly larger offset in the next loop iteration. Therefore, if
> bdrv_block_status() is called in a loop, it should always pass the
> full number of bytes that the whole loop is interested in.
> 
> This removes the arbitrary limit and speeds up 'qemu-img map'
> significantly on heavily fragmented images.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   qemu-img.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Do you want this in 5.1?  It seems like a nice optimization.

> 
> diff --git a/qemu-img.c b/qemu-img.c
> index bdb9f6aa46..74946f81ca 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -3217,12 +3217,9 @@ static int img_map(int argc, char **argv)
>       curr.start = start_offset;
>       while (curr.start + curr.length < length) {
>           int64_t offset = curr.start + curr.length;
> -        int64_t n;
> +        int64_t n = length - offset;
>   
> -        /* Probe up to 1 GiB at a time.  */
> -        n = MIN(1 * GiB, length - offset);
>           ret = get_block_status(bs, offset, n, &next);
> -
>           if (ret < 0) {
>               error_report("Could not read file metadata: %s", strerror(-ret));
>               goto out;
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


