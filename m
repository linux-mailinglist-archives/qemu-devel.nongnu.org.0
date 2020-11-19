Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFBD2B9C30
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:41:18 +0100 (CET)
Received: from localhost ([::1]:49312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfqk1-0006G9-4g
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfqQD-00027i-W0
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:20:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfqQ1-00049c-3G
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605817233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20bBKBzqiZUtB7OhkwELvTXA6OQKlpSJeFm+EhCKTOE=;
 b=g3HLjHfEAC8Hs2qj9F+uk9iaJ+PGrSZfZBO4qoyuuZRElejqAqINPDNJNV6qwr2VeTYdma
 bISrPLIJHKnc2Yrh6bj6JA7MHQPVyZlpaemP92Cp7ozvbgxHoIkbxgP/GnV1GBRz/34gP0
 GD0Wd8YUT6SaftiK4/QlU6KGE+v/2ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-uUDs_YJLOSWtUxYC3crfrw-1; Thu, 19 Nov 2020 15:20:30 -0500
X-MC-Unique: uUDs_YJLOSWtUxYC3crfrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE992801B13;
 Thu, 19 Nov 2020 20:20:28 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-109.ams2.redhat.com [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1485C1D1;
 Thu, 19 Nov 2020 20:20:26 +0000 (UTC)
Subject: Re: [PATCH 2/2] pc-bios: s390x: Give precedence to reset PSW
To: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201119165729.63351-1-farman@linux.ibm.com>
 <20201119165729.63351-3-farman@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8595991c-5776-3021-ca16-deebba287be1@redhat.com>
Date: Thu, 19 Nov 2020 21:20:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201119165729.63351-3-farman@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Jason Herne <jjherne@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2020 17.57, Eric Farman wrote:
> Let's look at the Reset PSW first instead of the contents of memory.
> It might be leftover from an earlier system boot when processing
> a chreipl.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  pc-bios/s390-ccw/jump2ipl.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
> index fbae45b03c..67b4afb6a0 100644
> --- a/pc-bios/s390-ccw/jump2ipl.c
> +++ b/pc-bios/s390-ccw/jump2ipl.c
> @@ -72,16 +72,6 @@ void jump_to_IPL_code(uint64_t address)
>  
>  void jump_to_low_kernel(void)
>  {
> -    /*
> -     * If it looks like a Linux binary, i.e. there is the "S390EP" magic from
> -     * arch/s390/kernel/head.S here, then let's jump to the well-known Linux
> -     * kernel start address (when jumping to the PSW-at-zero address instead,
> -     * the kernel startup code fails when we booted from a network device).
> -     */
> -    if (!memcmp((char *)0x10008, "S390EP", 6)) {
> -        jump_to_IPL_code(KERN_IMAGE_START);
> -    }
> -
>      /* Trying to get PSW at zero address */
>      if (*((uint64_t *)0) & RESET_PSW_MASK) {
>          /*
> @@ -92,6 +82,16 @@ void jump_to_low_kernel(void)
>          jump_to_IPL_code(0);
>      }
>  
> +    /*
> +     * If it looks like a Linux binary, i.e. there is the "S390EP" magic from
> +     * arch/s390/kernel/head.S here, then let's jump to the well-known Linux
> +     * kernel start address (when jumping to the PSW-at-zero address instead,
> +     * the kernel startup code fails when we booted from a network device).
> +     */
> +    if (!memcmp((char *)0x10008, "S390EP", 6)) {
> +        jump_to_IPL_code(KERN_IMAGE_START);
> +    }

That feels a little bit dangerous ... I assume the order has been that way
for a reason, e.g. I think we had to jump to KERN_IMAGE_START for some older
versions of the Linux kernel since the startup code that was referenced by
the PSW at address zero was not working in KVM...

What do you think about this alternate idea instead: Clear the memory at
location 0x10008 at the very beginning of the main() function (or maybe in
boot_setup())? Then we can be sure that there is no stale S390EP magic
dangling around anymore once we've loaded the new kernel...

 Thomas


