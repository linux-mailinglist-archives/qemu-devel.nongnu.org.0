Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB79C6C81D7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:53:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfhif-0002BJ-PD; Fri, 24 Mar 2023 09:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pfhid-0002B6-VH; Fri, 24 Mar 2023 09:44:35 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pfhiX-0004PY-Vv; Fri, 24 Mar 2023 09:44:35 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 240B21FE4A;
 Fri, 24 Mar 2023 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679665160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EKNHligrjPRdlgVc04rgv1n6X+WDwQRTw7AKZrer5xc=;
 b=XeY5bdhEWl9ykg78NSgQ184RXOW67DTTBPKC06+BSJY31FutqnGEVHzRR6cT/JI5Bhb+Hc
 j7rTgvGG+muienBZGsFQ/tpXmjSpl3d0n2j3Ujb8LjIeulBK4dU5jAPIsjO6VynRBHYP1u
 CsX6mZcm7efMnmvVZ2LNOWq/BPHQQrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679665160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EKNHligrjPRdlgVc04rgv1n6X+WDwQRTw7AKZrer5xc=;
 b=1CONdDjhAEaXze7dX1K4BPF1oCoKNa/CPnefgnFX/hrKdYWrjLScGHGGWObbbmZY6UEDcs
 kksjp50DqyXDoqCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A28A8133E5;
 Fri, 24 Mar 2023 13:39:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Jtd8GgeoHWQ3MAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 24 Mar 2023 13:39:19 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/6] target/ppc: Alignment faults do not set DSISR in
 ISA v3.0 onward
In-Reply-To: <20230323022237.1807512-4-npiggin@gmail.com>
References: <20230323022237.1807512-1-npiggin@gmail.com>
 <20230323022237.1807512-4-npiggin@gmail.com>
Date: Fri, 24 Mar 2023 10:39:17 -0300
Message-ID: <87wn36feuy.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Nicholas Piggin <npiggin@gmail.com> writes:

> This optional behavior was removed from the ISA in v3.0, see
> Summary of Changes preface:
>
>   Data Storage Interrupt Status Register for Alignment Interrupt:
>   Simplifies the Alignment interrupt by remov- ing the Data Storage
>   Interrupt Status Register (DSISR) from the set of registers modified
>   by the Alignment interrupt.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  target/ppc/excp_helper.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 5f0e363363..c8b8eca3b1 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1456,13 +1456,22 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>          break;
>      }
>      case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
> -        /* Get rS/rD and rA from faulting opcode */
> -        /*
> -         * Note: the opcode fields will not be set properly for a
> -         * direct store load/store, but nobody cares as nobody
> -         * actually uses direct store segments.
> -         */
> -        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
> +        switch (env->excp_model) {

Slightly better would be to check on (env->insn_flags2 & PPC2_ISA300).
We were trying to phase out the usage of "exception models" wherever
possible in favor of specific feature/isa level flags.

> +        case POWERPC_EXCP_970:
> +        case POWERPC_EXCP_POWER7:
> +        case POWERPC_EXCP_POWER8:
> +            /* Get rS/rD and rA from faulting opcode */
> +            /*
> +             * Note: the opcode fields will not be set properly for a
> +             * direct store load/store, but nobody cares as nobody
> +             * actually uses direct store segments.
> +             */
> +            env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
> +            break;
> +        default:
> +            /* Optional DSISR update was removed from ISA v3.0 */
> +            break;
> +        }
>          break;
>      case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
>          switch (env->error_code & ~0xF) {

