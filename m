Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C290464F9D7
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 16:26:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Z5F-0004Za-Pn; Sat, 17 Dec 2022 10:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>)
 id 1p6Z5D-0004Uw-0Z; Sat, 17 Dec 2022 10:26:39 -0500
Received: from mail.xenproject.org ([104.130.215.37])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>)
 id 1p6Z5A-0005fs-Sh; Sat, 17 Dec 2022 10:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID;
 bh=pmPoEEycSInrIphKy1irRiK7vbaRkCFjmE5wIu5XwFM=; b=j4O7wqMWqAt2Ch36xr/Y2tGP25
 gxU9rGKFvWYpkc5GEXJjnPlXqx6ikVlMOUxHktUcy3oDataYPfKB44iCqkKxq/W9L6VGBdIflg8fe
 jMmaXgV7nWcGu3CmHmyY4bjWo/1YOBaOYrcYh4vHDjxFBjOjMksigJXMg3G8ATdFc+10=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p6Z53-0008Qd-AF; Sat, 17 Dec 2022 15:26:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p6Z53-0000vI-42; Sat, 17 Dec 2022 15:26:29 +0000
Message-ID: <d87025d8-b653-d80e-22c0-05f052447706@xen.org>
Date: Sat, 17 Dec 2022 15:26:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
To: Stefano Stabellini <sstabellini@kernel.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com> <871qphc0p3.fsf@linaro.org>
 <ade61d47-f8c0-09cc-1a44-faaaff87d76a@amd.com>
 <alpine.DEB.2.22.394.2212021429220.4039@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
In-Reply-To: <alpine.DEB.2.22.394.2212021429220.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=104.130.215.37; envelope-from=julien@xen.org;
 helo=mail.xenproject.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 02/12/2022 22:36, Stefano Stabellini wrote:
>> Do you know what Xen version your build env has?
> 
> I think Alex is just building against upstream Xen. GUEST_TPM_BASE is
> not defined there yet. I think we would need to introduce in
> xen_common.h something like:
> 
> #ifndef GUEST_TPM_BASE
> #define GUEST_TPM_BASE 0x0c000000
> #endif

I think this would be a big mistake to add the two lines above in QEMU.

Libxl is responsible for creating the domain and generating the firwmare 
tables. Any mismatch of values will be a real pain to debug.

Even if...

> 
> We already have similar code in xen_common.h for other things.  Also, it
> would be best to get GUEST_TPM_BASE defined upstream in Xen first.

... we introduce upstream first, the guest layout is not part of the 
stable ABI and therefore could change from release to release.

> 
> 
>> Another way to fix this(as Julien suggested) is by setting this GUEST_TPM_BASE
>> value via a property or something and user can set it via command line.
>>
>> @sstabellini@kernel.org, do you think of any other fix?
> 
> Setting the TPM address from the command line is nice and preferable to
> hardcoding the value in xen_common.h. It comes with the challenge that
> it is not very scalable (imagine we have a dozen emulated devices) but
> for now it is fine and a good way to start if you can arrange it.

It is not clear which one you think is not scalable. If this is the 
command line option approach, then I think this is unrealistic to ask 
every user to rebuild there QEMU just because the guest layout has changed.

Today the rebuild may only be necessary when switching to a new release. 
But in the future we may imagine a per-domain layout (e.g. for legacy 
purpose). So you will now need to request the user to have one QEMU 
built per domain.

How is that scalable?

Cheers,

-- 
Julien Grall

