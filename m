Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01E665AACC
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 18:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pC26l-0006Tf-Kq; Sun, 01 Jan 2023 12:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pC26j-0006TN-AB
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 12:26:49 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pC26h-0008Cy-Mv
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 12:26:49 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MjSLi-1oWgor0cGo-00ktua; Sun, 01 Jan 2023 18:26:46 +0100
Message-ID: <6a82b6a5-a7e8-e884-d24e-52b0439a5ed6@vivier.eu>
Date: Sun, 1 Jan 2023 18:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/4] target/m68k: fix FPSR quotient byte for frem
 instruction
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
 <20230101144339.60307-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230101144339.60307-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+4Lv5gphtjeaY3wJgv/f/cMN3ntY7epRgenlNbvOnO6F7VsFF5i
 0Gsr+AbApfuCMyU64ZzuH+8ElWDKBEB/pgpzQpibPDavXQ4tSel57s+EDZSNfS0mFNUD0b7
 +GxI6Sgxx1gfqNIp5IKj6RUt9nuOx70pjvw1c5wq0KM+hqRL+ATJJUTxJELGkiRv3BM/SAe
 EEw9mY5IFjXBN7Kiop9Zg==
UI-OutboundReport: notjunk:1;M01:P0:nmHotIfiw8Q=;aLzlKZ97IouOET+TOQSG/FF1JfG
 FB0dkh6Sq3Hm5qS7WZqjJq31U1utL5OVtesqg0+IwITPaQfPLFyEGe0NWkxkp9wZNP7UsJKai
 LlkXTI0ILmn9X1Z7l6OoSpclMuNixUqn6bKdVKCV9MkuGJQ3EA2mrml5A042wFCqrnPPBKRB1
 VV+hmI4SDLwaGbGhlaDdyTlWZQ71b6OQ/N9AsaNWMCopMQJpvOR6Z8/n8UsDHRjHHyEz2cBWS
 njkL6qjm9xE18JZqVP/aAMDE+dMVtcyvNDJyZtNR96Fm6bkokOAmVdNbJ3rYeyA9cY5O7GYET
 TmgjRrfWqNbGniIi344cSPA6Q749g/9zlqvE9iKcIgkKTMtS5VmPHHd5E0AB4h9vchy7T/rSs
 LOKqdypwAFOu/jtTdOvofVET/KsZQu4SuPQqG9kLGK3pEEMVSV2fvRStJWXNKRldVjxMzorEh
 23RvfVWi35j76T64iGb8za5GukX3Wre9AfdEHAEb3wpsuM05QVTl1d8wFZY2+6hjf0uMXFVkv
 d0KsbqKzxla7dEm5KZE0spEbtfTRWiM0k45Fzo3y7XmYoCUmpNI5MuSL05siZWElmv6LpG0DE
 X4NJFBMWKfaUtXXcNpu17b+49Q7K6ygF5llzwiPZ14BrdwYuoEKDC68WKdY5raEpzMtlY9fT4
 +f6l+c7jfflXa6TyxtEYmZOsTDQSqRKXIn2q06ENVQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.802,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 01/01/2023 à 15:43, Mark Cave-Ayland a écrit :
> The FPSR quotient byte should be set to the value of the quotient and not the
> result. Manually calculate the quotient in the frem helper in round to nearest
> even mode (note this is different from the quotient calculated internally for
> fmod), and use it to set the quotient byte accordingly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1314
> ---
>   target/m68k/fpu_helper.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


