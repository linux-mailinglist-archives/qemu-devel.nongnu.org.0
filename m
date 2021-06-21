Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0013AE43A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 09:36:18 +0200 (CEST)
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvETh-0006ht-SG
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 03:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvESm-0005wH-OC
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 03:35:20 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:41009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvESk-00008f-Qo
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 03:35:20 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MT9zD-1lqXNL0BTz-00UZbY; Mon, 21 Jun 2021 09:35:16 +0200
Subject: Re: [PATCH 11/26] target/m68k: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-12-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2d323a1d-31fb-8efb-b79a-061175393d5f@vivier.eu>
Date: Mon, 21 Jun 2021 09:35:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621013439.1791385-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+LfVqSo9m0b/xfUVvT+dpnUjgi8VRermaRwcpvWcecQsZDTpBbi
 iVS9g3asEJRsN73ohC4OBC73MLCAsEJzDbwkzonfSj5kStvNzV12EZo360TFzuN1qRedG7K
 3tFC0Q1sHXoiN6HGm5G+EvVyLQN5rUhdwFULlGfxoL0YZBgUzxzgNtv/2zuMbCPVkCfhYSX
 ADGd6+07eeFnpHKeqYMoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ps3RbyCiCQI=:024jd16F5/gwnuhQF0i+Qa
 YcFRcHnBIxY714R1GRLcwiNCdfwW8eZYLTuLiB1AzoGDU/LVV8VMtLfJa8gog/GQOBR2cLmgb
 eo1R4Ra9OK2o+Ren19Zbw0Oe8JdUK8UZT+lkkI/T2Q7B15+t5E/ZcGn+APolLg1a9exm0amcR
 2GCqvR5nPEWWaoVxMpag+TDVDfYzoa90JNS9YXu0L0f9+IM/zdaGXKiAqpnfiUCWeGiWgZh82
 iDcncF5C7XH8JNY0+SwYGGfSNFynEjb0ECtlLoSs+wvV2S5nX9tMoj3lpH/tGRV530FBmBKBx
 SW2Hn5Qrjtnw/ab9Alj0oqbKPzqiG44PItth+GS0oXNXEeHMZP56oSZ0H+BGSR2hw4gvMOxR+
 Ehv4tp+9nw5n9I9oTgaD3XxxbFc5zv8OdPvdMpBxIJ3jbmva8W2bT1cF3/pgIxUtnOn+9InSu
 +V0CnYqeqafAk8VQOJ/DS9TUswPzweFDEYUr7h2lNWMHf7w8HjciroYO48DM17AwAJw6FGuzk
 DVZhVCB8Wp+HcGOGlEi9Ps=
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/06/2021 à 03:34, Richard Henderson a écrit :
> Just use translator_use_goto_tb directly at the one call site,
> rather than maintaining a local wrapper.
> 
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index f0c5bf9154..05b96fdda7 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -1520,16 +1520,6 @@ static void gen_exit_tb(DisasContext *s)
>          }                                                               \
>      } while (0)
>  
> -static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
> -{
> -#ifndef CONFIG_USER_ONLY
> -    return (s->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)
> -        || (s->base.pc_next & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
> -#else
> -    return true;
> -#endif
> -}
> -
>  /* Generate a jump to an immediate address.  */
>  static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
>  {
> @@ -1537,7 +1527,7 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
>          update_cc_op(s);
>          tcg_gen_movi_i32(QREG_PC, dest);
>          gen_singlestep_exception(s);
> -    } else if (use_goto_tb(s, dest)) {
> +    } else if (translator_use_goto_tb(&s->base, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_i32(QREG_PC, dest);
>          tcg_gen_exit_tb(s->base.tb, n);
> 

Acked-by: Laurent Vivier <laurent@vivier.eu>

