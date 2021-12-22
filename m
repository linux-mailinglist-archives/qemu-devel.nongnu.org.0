Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF647D83A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:19:23 +0100 (CET)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0854-0006dH-7h
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:19:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n084D-0005Tu-8w
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:18:29 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:45063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n084B-0004Fk-Mw
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:18:28 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N7Qgn-1mPXLx44jd-017p8w; Wed, 22 Dec 2021 21:18:25 +0100
Message-ID: <29ef5fa8-9671-c6b1-6feb-635e07392283@vivier.eu>
Date: Wed, 22 Dec 2021 21:18:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/7] linux-user/nios2: Map a real kuser page
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
 <20211221025012.1057923-5-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211221025012.1057923-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hZzyjbH2fMFLaOm0W86EQNJXgol5QrAwJYkRgnsb4R7RelEh1Eb
 Uht0Lb1PI8niRiIiEI5U2T2tZvGF2Izc1KLljxGqOijFhhw38y7qZZTZJ6yWBC24TWxbUbo
 hJnp6qKpB0iuJVZ8x2FeJpxnkGytXZX38bOmLiiKKtHaA48XP/bcntgtYqDwn9TmaJx+Vfo
 aqoxqxQ5kE3/ttJupI6GA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XSbR/tvAHbs=:hXwPHs8W6kRKqSbKA2P24/
 P/on4/9I/VD4GXXRJJYRotLNlkkl3e51ta21rO2ivn8uGA3gskAtG0vmkT8YAPXrkniz2ZutL
 ie+idEPT7AsyBcqC8/t/voXtd8w+EoH2JOs1DqUqzKqKKWeHWcPvZiW0klXbqZNOBLtbHnx1N
 EBfRlisB2Awo4NBVn90aJCnt+RgCBy9AdJwOgcUcH+M3JKP/YJKbHJ1HIl1QPltwvM3NOLfgC
 Ujzmw+p6uSeO3Jzd/w69Np9XcuIzl9x8BrNGDb6MzekZ0Yfd1Bhh2u1DTTdUoT532DJ7vdkpm
 /ElF2Py5gqEAkMZeQSS8XPSqN2vEy+PZ7Hj9wzyY8WY16XDumN3iNAt3SYvheBOq7Wyanw62Y
 Q8afGP5Pepvt5x30tlCBGz+GAf0WOCeWvt/bMA0QvXjNx1zLUExCnnP2HoxngfZGe9LNZrb3M
 KfFI5cGpTLU8KK4WA4utc33oamsTM7KJEhpb6NQLGXE0MrIEYSYbwEzBpDMLa0iwoRt3LO4k5
 FDqGnZkn1aTxorzy1ZxQqL9FuugClmHuF/YlE84PNd2Bp4lvd6E+hTDrU1wT7yJbEaSS5XpYb
 HVWjN+3ASOkJH/dpsROpD6+KqR63fiADPYGVwxnQzhKQM8dSpveBPUeB/TIVqAM7DZG3b4KyL
 pkEmlzAebf1Ni3J9lgxF1JZRFkYTWqJ+cVDd2y2HDxmPltSH6upL51ENiRUWxmLBiUh0=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
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

Le 21/12/2021 à 03:50, Richard Henderson a écrit :
> The first word of page1 is data, so the whole thing
> can't be implemented with emulation of addresses.
> Use init_guest_commpage for the allocation.
> 
> Hijack trap number 16 to implement cmpxchg.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c        | 50 ++++++++++++++++++++++++++++++++++++-
>   linux-user/nios2/cpu_loop.c | 50 ++++++++++++++++++++-----------------
>   target/nios2/translate.c    |  9 -------
>   3 files changed, 76 insertions(+), 33 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


