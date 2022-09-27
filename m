Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59D5EBFE7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:39:40 +0200 (CEST)
Received: from localhost ([::1]:36472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od804-0001ZO-09
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7uZ-00042s-FX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:34:00 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:35573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7uX-0006bL-7D
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:33:59 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MgARS-1pAXBX2dCg-00hbsz; Tue, 27 Sep 2022 12:33:53 +0200
Message-ID: <96c804dc-a603-1ed2-f5a6-f0f32becc947@vivier.eu>
Date: Tue, 27 Sep 2022 12:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 7/8] linux-user: Lock log around strace
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829021006.67305-1-richard.henderson@linaro.org>
 <20220829021006.67305-8-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829021006.67305-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rEt0wfUC+K0YN+PcpV0nTVqaN6VebUUQZW0dq3L/zJkfwmZRT5r
 UphIYun76iALbg0Z4ByePtk26H2gKiCuzXxR4wiKStaEWcijZmWv6Cv5Hb3n7j7lssUx25k
 2dIb+4M2L966watp486Jp0JxAEdSu/4n8UrI8mQLKbaWyLPDW/IgqXAcTmc5SlR8ChFnI7R
 Xf8d+oHucdc9+zJuNw9eA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bi0kCFmFZNI=:21W5FcyLpYZwz8siU1Uipk
 W/u0wfSYVxAmKsjIV5ubcuRaertF/NjIYDbIxjb14nBeWGYLkKWaVaulJ/4x2DBSSXJf0INmu
 H/eieYou0doUbLSN2/c9IrFBq1bztmPVyDw5I2UDorSpbTjvQzQ0NsACFS40Mirhwv1ltRPhN
 VtWO42XynfVNAI0vo6K/fH2s/5WaNH7fgsTVqg+QFYCkm/NpJtRlPcPxbQRivU/q0D4lXmCT4
 AcyX9yTmYg4mh5guX4ldW0lHLuCNix/HwWcYr5hxebeu/2ys49GGLwVBn1Deq3cMeZX26LS3A
 3IA6S4hdambstmEsDjLRjJwFbsiLHBj+Px5R+3SqJE8I5vKdJXOUlxgdBG+NkoDCec2lRcwax
 r8DGobM4YEi88hrIKCHV1o+Xs04CSVwDIhbDOybGYOqwbtW/66BTAQDGBwNM2UGNcFGOvfFMI
 8gweBIPXNvUKNES7uRcLIpgg20othWSw4H7dgnwBUbNuiNsA4OGzEGAutUNi4p5HCzj+hJEew
 bz/ysqgHNS5fENqL0KblhjnBdJ2NKFcwt6BE3ptBcm5i+iK31lVnte0yermrCexQ03r6q/Ndj
 Rbfm2xdd5ZeYIfJem4vl771zSgyTcWITz5nDS8kTe7jbjiZitrjHLpTlW0Wp3qaggiHArD+45
 qt/UZbxqCdmMqbnfrSYdecMCshHhCxCnNA+0UjdsrEnke2qqW/bqV1JSGN7M8KMmRyy7DeAT9
 jNE4PcPsW3fSbhnGc+BS+pwInLCVT7vc8O4n2V6WCzwJry2pwfSv6Tp1swUwudzE2UBc3Kyo5
 GEeQfw1
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/08/2022 à 04:10, Richard Henderson a écrit :
> Do not allow syscall arguments to be interleaved between threads.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/strace.c | 65 ++++++++++++++++++++++++++++++++-------------
>   1 file changed, 46 insertions(+), 19 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


