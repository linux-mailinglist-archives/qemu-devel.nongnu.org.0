Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3341244C532
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:39:43 +0100 (CET)
Received: from localhost ([::1]:48020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqdS-0005P2-C9
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:39:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkqXK-0001iB-HY; Wed, 10 Nov 2021 11:33:22 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:45103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkqXI-0005g5-Js; Wed, 10 Nov 2021 11:33:22 -0500
Received: from [192.168.100.42] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MqapC-1mOewh3h4a-00mbAP; Wed, 10 Nov 2021 17:33:12 +0100
Message-ID: <fed70819-21be-b375-b2b8-2c34618f3d11@vivier.eu>
Date: Wed, 10 Nov 2021 17:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 03/54] target/ppc: Move load and store floating point
 instructions to decodetree
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, peter.maydell@linaro.org,
 clg@kaod.org, danielhb413@gmail.com, groug@kaod.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
 <20211109055204.230765-4-david@gibson.dropbear.id.au>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211109055204.230765-4-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cBnkTz2TAbv9hcMfXeqi2PymM9veNhZx2YcZD5yzNS52DsB9SLe
 rnBOALdDBJ7PpMnRQ9tV6hKD7Ppfh8GWnfkjVk1AtbXDtLf19yrC4TeY3llxVIVwJev8uKU
 jHk8aowyvqZyW/JNHVSbINJY2LDQntF0J5TBE24/3oZRL4XjE7i3wO00dB8J13jYxYmVSfs
 ivv98Cd1/KUDzbyX0lukQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MGTwzeB4VIA=:yEnOMFkqNPq4m8Fg6bg+bm
 +8+QLwMlJdHA471aKui3nbCbq3IiDODM9bRsKKz3sd3xQxulRagZDHgAmLIRM0JjRbFApV2Es
 1RHsPVjaZ2n3Xli9z97CzIK32Ywf5jck24WWrC+n4Wyb6mpBD0VeF64EZhlr0yd6vgtW82ahI
 //F4x5Q8GTdYBihN82xkkAdVF+Usw3Ekift7NEv1luErDpW8zXiT/n/RRTV/DRJbrc8rnwg+w
 oGN4NgqCAKt4MweOe0H4t8ZAWFPd6KhxoQuUHmWTk4C5OhizlAewa7hSlZcQpUm9jAnIPv6ee
 mkHd9WCZ5VeSXUlyUhreKfrREHhdn+0GpSOTrMVY1PCJMimjzySrQDkUDCg9vs4hczwQWp3Nk
 MolOtwRQdUPIG9C/knXbl2HYyPR1LyyqlS/HVqpw7Tli2wd187Ft6cOlVLiYq6ntyUS6v8ZVY
 Wefw8ZOw/+gW3bsxG4f/4SIseXUXPqsqWrw4jpmzUtOdaewDheMbub2c0ywU848Cy2uw5BAWm
 LM8sEA0gcNwT0fAJwp2PI6YPKMgjuv34TnH5gRMm128h9eRJCfgzCG694AXae+myArtCYzKHx
 1p5l6jQ++Kd5WNNjEoh/LRAsAQJ+dB2ikt6u3AGZzCSlmhJ9hRTWrq0WybYBq6vYm13znTno3
 DQq2WiO2Ugr3kQmgZE/rT2kVODN1KB5g+lNDDzaiQlYGjbKb1lvcHkiYFfwLdGhRNDGo=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
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
Cc: Fernando Eckhardt Valle <phervalle@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/2021 06:51, David Gibson wrote:
> From: Fernando Eckhardt Valle <phervalle@gmail.com>
> 
> Move load floating point instructions (lfs, lfsu, lfsx, lfsux, lfd, lfdu, lfdx, lfdux)
> and store floating point instructions(stfs, stfsu, stfsx, stfsux, stfd, stfdu, stfdx,
> stfdux) from legacy system to decodetree.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Message-Id: <20211029202424.175401-4-matheus.ferst@eldorado.org.br>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>   target/ppc/insn32.decode           |  24 +++
>   target/ppc/translate/fp-impl.c.inc | 247 +++++++++--------------------
>   target/ppc/translate/fp-ops.c.inc  |  29 ----
>   3 files changed, 95 insertions(+), 205 deletions(-)
> 

This patch breaks qemu linux-user with an ubuntu bionic chroot.

The fix proposed by Matheus [1] fixes it for me.
When will it be merged?
It's needed in 6.2

Thanks,
Laurent

[1] 
https://patchew.org/QEMU/20211029202424.175401-1-matheus.ferst@eldorado.org.br/20211029202424.175401-4-matheus.ferst@eldorado.org.br/#c799859a-4fdc-9d69-7a87-5e69cee15ef3@eldorado.org.br

diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index d1dbb1b96b..c9e05201d9 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -1328,7 +1328,7 @@ static bool do_lsfpsd(DisasContext *ctx, int rt, int ra, TCGv displ,
          set_fpr(rt, t0);
      }
      if (update) {
-        tcg_gen_mov_tl(cpu_gpr[rt], ea);
+        tcg_gen_mov_tl(cpu_gpr[ra], ea);
      }
      tcg_temp_free_i64(t0);
      tcg_temp_free(ea);

