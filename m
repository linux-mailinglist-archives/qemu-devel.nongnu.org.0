Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7DE5B7690
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 18:35:14 +0200 (CEST)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY8sT-0007vw-5s
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 12:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oY8n4-00043m-VK
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:29:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oY8n2-00068c-SY
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mMHuEKqugBgkzoKJQf80UNH0hwMju0dG7gOYJLWKTko=; b=sJaz1Ntq6khlM7OyHmkIIaDSXI
 r6Ga18ozfosirRPJnDGx0CKSdFTrc09KRK8ZAmUpMXe8U0jqZ7jN2HtYKdDUqW958JbrJJkvCmiib
 b0oDyBjh8BYEB6QyiigpqFdUcWR+191YTpC+opUXQ9WgJXlZgzb3yZ5RkS03qnrWS6GWGcXP1R/2x
 JB4pLBd3IEjsNDY3u62x1oTc1gGZSGT0f2utjNzPhEUt1AQFqNJE4AMwtQNZ/B1NFPT8jPtETJHw0
 OhisgUj8BB5kWj5u2PmEYARRwksgyy7AAlTlEolvCCliBLFEASFBGZ9k9qRbjunoT6tcKKKQczvHN
 GyFoov5B8Hatz1jdGGKf6QejuaZe0AuofXnQUHaSpxISx+kTOLbiZlDMfpKtzvSAjiw/AnLkUX+qJ
 td9DB3RUnlfDTyht+U4fA8+4kgPrO3QM7n9xPPAj9Q33C98x99d5q9KFhoyzzw/oPsMcBRbYMbrjY
 mslF5RYgZRd0akNJiO4MAMNAzJ7HwdlkzEp5ZkbRTu7moc94pCSKnyhTQoywSx1JwnoEAEWUNUVHf
 v34t4XTOI9IaeGcT87fU//n0kn7yIBtOY0U+nvz3JZ8+SDLVKfXXjaZO/6OgaQgoqyfrYe2WLckrE
 f150dpi2BkNMJFAk45LUGL84L3dl1HkJP+8/sb5rA=;
Received: from [93.119.27.212] (helo=[172.16.15.173])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oY8lM-000BuV-Q7; Tue, 13 Sep 2022 17:27:56 +0100
Message-ID: <5880ddb1-3a7c-139d-3833-9902b98caf01@ilande.co.uk>
Date: Tue, 13 Sep 2022 17:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220913142818.7802-1-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220913142818.7802-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 93.119.27.212
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/2] target/m68k: fix two writes to %sr
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.628,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2022 15:28, Richard Henderson wrote:

> The second was described by Mark in the lobby of KVM Forum.
> The first was found by inspection of other uses of gen_helper_set_sr.
> 
> r~
> 
> Richard Henderson (2):
>    target/m68k: Fix MACSR to CCR
>    target/m68k: Perform writback before modifying SR
> 
>   target/m68k/translate.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

I've applied these on top of my MacOS virtual memory branch at 
https://github.com/mcayland/qemu/commits/q800.upstream2-vm and I can confirm that 
MacOS 8.1 now boots here with virtual memory enabled :)

Possibly it might be worth including a tidied-up version of the "WIP: target/m68k: 
always exit_tb when changing sr with andi/ori/eori" commit from that branch which is 
also related to switching between supervisor and user modes under MacOS. Shall I tidy 
it up and send it to the list?


ATB,

Mark.

