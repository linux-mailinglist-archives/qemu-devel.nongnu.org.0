Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDBE2AD00C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 07:54:32 +0100 (CET)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcNXz-0007e3-Rv
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 01:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcNWl-0007Bl-32
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:53:15 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:59609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcNWj-0007Eu-43
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:53:14 -0500
Received: from [192.168.100.1] ([82.252.154.198]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWSJJ-1kn79c3Y4J-00XqqP; Tue, 10 Nov 2020 07:53:08 +0100
Subject: Re: [PATCH for-5.2 1/3] linux-user/sparc: Fix errors in
 target_ucontext structures
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201105212314.9628-1-peter.maydell@linaro.org>
 <20201105212314.9628-2-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d93ed16f-9f9d-1009-7236-1eb72b512015@vivier.eu>
Date: Tue, 10 Nov 2020 07:53:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105212314.9628-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0PFbTAVxcaAijAaHgP8Uu2gL2CQBKHJlK3h3CC/d+oUMZfWcGPS
 xKVIAkddvKLpJ/NK+Ga9ZDGb2oa2t82hUA2q5tKkIK5Rdg5tpPfyC1fYZiZoZP0zTDKo8sq
 /30d6IoRxBdbRTEe9SvDQ6PO4Fl12c3TbQDHt9UR6K09j2gjo36CVReZJQLoX++LrdePJhB
 Bb14ijkcrZkSjCIkw2QPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BphpdD08lD4=:NrVPOas/feqRSyYJMq3zOS
 FR46tAvnYIm1gSF5M38NP0hboUYlqFqUGXa+kUP5OdqywTDH8Dt98fwivwLblUMViNa8yzM3x
 z9cWX9GvOtrnWE9jQjNHQAAQCDKqYqKtD4lSUF6faOkKoKXjIEI4KxgtI7gGzmMNbZJKWvrDu
 k64ZNOiJHSnvw58xBETUnwBeP53R7Em2JQQZZHU31UMVD7SB4e+dtfFpW8FDITDCsQdMAMIIo
 hoKNMe7nfqL4VuVOHoJAiR2/0NkMYQRshCnsy9MUXQnac1mBITooESTZiZNzlvm3ijbft8xJI
 YJM6sTArFCzjVq+jH0nPYYz6ani6tkc2aGroU+37eK+NcaXMZepTLCDvEGF3kshN+LQR5zBxZ
 xv9uCyB+mFhYdzkci0ZVmc5BLDewo+GJo9wuGB4P3KX1E6ZwEU5oZBJBPBW+cJymUQrJZzGEk
 2IxjLS/hdw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 01:53:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/11/2020 à 22:23, Peter Maydell a écrit :
> The various structs that make up the SPARC target_ucontext had some
> errors:
>  * target structures must not include fields which are host pointers,
>    which might be the wrong size.  These should be abi_ulong instead
>  * because we don't have the 'long double' part of the mcfpu_fregs
>    union in our version of the target_mc_fpu struct, we need to
>    manually force it to be 16-aligned
> 
> In particular, the lack of 16-alignment caused sparc64_get_context()
> and sparc64_set_context() to read and write all the registers at the
> wrong offset, which triggered a guest glibc stack check in
> siglongjmp:
>   *** longjmp causes uninitialized stack frame ***: terminated
> when trying to run bash.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/sparc/signal.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index d796f50f665..57ea1593bfc 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -349,10 +349,15 @@ typedef abi_ulong target_mc_greg_t;
>  typedef target_mc_greg_t target_mc_gregset_t[SPARC_MC_NGREG];
>  
>  struct target_mc_fq {
> -    abi_ulong *mcfq_addr;
> +    abi_ulong mcfq_addr;
>      uint32_t mcfq_insn;
>  };
>  
> +/*
> + * Note the manual 16-alignment; the kernel gets this because it
> + * includes a "long double qregs[16]" in the mcpu_fregs union,
> + * which we can't do.
> + */
>  struct target_mc_fpu {
>      union {
>          uint32_t sregs[32];
> @@ -362,11 +367,11 @@ struct target_mc_fpu {
>      abi_ulong mcfpu_fsr;
>      abi_ulong mcfpu_fprs;
>      abi_ulong mcfpu_gsr;
> -    struct target_mc_fq *mcfpu_fq;
> +    abi_ulong mcfpu_fq;
>      unsigned char mcfpu_qcnt;
>      unsigned char mcfpu_qentsz;
>      unsigned char mcfpu_enab;
> -};
> +} __attribute__((aligned(16)));
>  typedef struct target_mc_fpu target_mc_fpu_t;
>  
>  typedef struct {
> @@ -377,7 +382,7 @@ typedef struct {
>  } target_mcontext_t;
>  
>  struct target_ucontext {
> -    struct target_ucontext *tuc_link;
> +    abi_ulong tuc_link;
>      abi_ulong tuc_flags;
>      target_sigset_t tuc_sigmask;
>      target_mcontext_t tuc_mcontext;
> 

Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent


