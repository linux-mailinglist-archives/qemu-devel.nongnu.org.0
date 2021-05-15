Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F0381ADF
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:54:29 +0200 (CEST)
Received: from localhost ([::1]:44370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li0Mm-0000fG-E7
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1li0LL-0007yg-Th
 for qemu-devel@nongnu.org; Sat, 15 May 2021 15:52:59 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:43471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1li0LK-0007Xf-5n
 for qemu-devel@nongnu.org; Sat, 15 May 2021 15:52:59 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MRCFw-1m5BWe015Q-00NBgg; Sat, 15 May 2021 21:52:56 +0200
Subject: Re: [PATCH v2 0/7] linux-user: sigaction fixes/cleanups
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210422230227.314751-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <673d3401-09c2-37d5-f9a0-1f5fdfa77250@vivier.eu>
Date: Sat, 15 May 2021 21:52:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422230227.314751-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BjmfmI2yhVRYfhmGKoLiCIQmBFEDCs3rozX09yTblhiuHAyxVfv
 AvCJnNnPSxCmAwoWrZYfAaF7QvIFym7fOqW2fZuvw0N49hq6ejZF2LOVSZifqmnESrM4r9K
 T3Z63YGC3BqkRrxityThm2aA+WrHhcuzlmB2MESbvMhxpt3ul8C0/yDzmGjMmBuQVZL5KFM
 BOqWB15gzBwxcQIRDprqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YNQTNNRptQQ=:VMI5KT+TZYePi5uvbPDt2n
 jw/Yke5F6Fg1beXat4pGH8RGNvkBxDjkOly5XolTijy59SybGigtz9UtXTUlTg1T5pSPgXHz5
 VoTDcouzMhasphB7Jj4lSjO+aDZJM8Qj8vy076I2bdMEk20NVjwfmhhUT8q3QvAVEsiq48dk3
 305/QmrveqaT+xsPkcCQmS7StnVykXqUVkb1G6XmmIMpcOnITZ4yb6JQQmDEkA2mhqp2o/35f
 PnbHUzAeaRlAOiiYZGP5H4aUoAI6T80rpeW2rGd59S7Tn+cexCoVN67AeCwJx6vFNoTlpWAML
 7TukNMhoSoH17ek+q9o0Mdpne2ZxIgFv2DBdT4n9hpRPOmfBfUOe+mEXvTM0KZjdSLK2+x4Sz
 /9NVphPL8FePSejCFinDZni5Z+A8Pd8ummUQPSAVVJEutxvEu7r1/sGX9AF/rLqv+p1iLlyIR
 rJYqfN3A2cZreTAmO+4xSkOiHclkqgKTOgM6FebKQYlSTx2j6JQdp6pEgVSL7PwOzGWNld0HV
 ZRDKn6/jt0C9VB7G3wkgcI=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/04/2021 à 01:02, Richard Henderson a écrit :
> Alpha had two bugs, one with the non-ka_restorer fallback
> using the wrong offset, and the other with the ka_restorer
> value getting lost in do_sigaction.
> 
> Sparc had another bug, where the ka_restorer field was
> written to user memory.
> 
> Version 2 splits patch 2 into 6.
> 
> 
> r~
> 
> 
> Richard Henderson (7):
>   linux-user/alpha: Fix rt sigframe return
>   linux-user/alpha: Rename the sigaction restorer field
>   linux-user: Pass ka_restorer to do_sigaction
>   linux-user: Honor TARGET_ARCH_HAS_SA_RESTORER in do_syscall
>   linux-user/alpha: Define TARGET_ARCH_HAS_KA_RESTORER
>   linux-user/alpha: Share code for TARGET_NR_sigaction
>   linux-user: Tidy TARGET_NR_rt_sigaction
> 
>  linux-user/alpha/target_signal.h |   1 +
>  linux-user/syscall_defs.h        |  29 ++-------
>  linux-user/alpha/signal.c        |  10 +--
>  linux-user/signal.c              |   5 +-
>  linux-user/syscall.c             | 107 ++++++++-----------------------
>  5 files changed, 43 insertions(+), 109 deletions(-)
> 


Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

