Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49762EB3EB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 21:08:37 +0100 (CET)
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwsdA-00024c-Jp
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 15:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matevz.langus@borea.si>)
 id 1kwscH-0001HU-A5
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 15:07:41 -0500
Received: from ris.borea.si ([193.77.156.21]:35722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matevz.langus@borea.si>)
 id 1kwscE-0006if-4I
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 15:07:40 -0500
Received: from ris.borea.si (ris.borea.si [127.0.0.1])
 by ris.borea.si (Postfix) with ESMTP id 4D9Nnw6FglzV2
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 20:07:32 +0000 (UTC)
Authentication-Results: ris.borea.si (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated, assumed good)" header.d=borea.si
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=borea.si; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:to:subject:subject; s=dkim; t=
 1609877252; x=1612469253; bh=hZtP1R2LLXMt7RlYNgC/AhYTXgsmGpx/q+j
 0YGpKF3w=; b=CQIDGfigph4buTbcdTUOuHHRP3MdKf6wVTXt1PI0Vq4Wo4UyvoO
 HAvAg1y2Y/RUdKmiz1gcgGOWrjTlpxQASmDFBbeonSP3CQJraA+oEFYBy+gz0tnj
 u97MWTJUQh7Okx/fAMw+SqtjABIO+1USHsYHyBWPtunJZ9IZhxCucf8E=
X-Virus-Scanned: Debian amavisd-new at ris.borea.si
Received: from ris.borea.si ([127.0.0.1])
 by ris.borea.si (ris.borea.si [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tHzbvL6WgrpY for <qemu-devel@nongnu.org>;
 Tue,  5 Jan 2021 20:07:32 +0000 (UTC)
Received: from Matevz-Languss-MacBookPro-3.local (_gateway [192.168.234.249])
 by ris.borea.si (Postfix) with ESMTPSA id 4D9Nnw3rjjzKq;
 Tue,  5 Jan 2021 20:07:32 +0000 (UTC)
Subject: Re: [PATCH] linux-user: Add ETHTOOL ioctl
To: Laurent Vivier <laurent@vivier.eu>
References: <9272ff58-82a7-d687-8a33-05796c643b5b@borea.si>
 <ee004b9f-5c7a-41d0-5a81-252ca3d4270c@vivier.eu>
From: Matevz Langus <matevz.langus@borea.si>
Message-ID: <b548119a-5fcf-6a78-edbb-44cde1a4769a@borea.si>
Date: Tue, 5 Jan 2021 21:07:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:52.0)
 Gecko/20100101 PostboxApp/7.0.43
MIME-Version: 1.0
In-Reply-To: <ee004b9f-5c7a-41d0-5a81-252ca3d4270c@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=193.77.156.21;
 envelope-from=matevz.langus@borea.si; helo=ris.borea.si
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

I know it must be more complex, but it worked for our case so I wanted 
to share it anyway as we did not find support for this in latest git, 
but forgot to check mailing list.

With this small patch + some others in Linux kernel we were able to 
execute Intel XL710 network adapter NVM Update utility (nvmupdate64e) 
which is x86_64 only binary on aarch64 Linux platform and upgrade NIC 
firmware.
At least we can try if this works OK with Shu-Chun's patch as well.

regards,
Matevz

