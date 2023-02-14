Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AFA696E0F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:43:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS1CY-0002xE-SG; Tue, 14 Feb 2023 14:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS1CK-0002rh-FD; Tue, 14 Feb 2023 14:42:40 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS1CI-0004WY-RN; Tue, 14 Feb 2023 14:42:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0F09D218A2;
 Tue, 14 Feb 2023 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676403756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0taNcI0BH7qm+otWN0m+SySACtsZfs01z6+3ERND1g=;
 b=hsLJyO0nR61FgVdo5lNUKqHkfsKlmMuKgvzVc4WkTJIDi5Ubg6jC0oYAAHfw8c9in9skTY
 r/qGwPQng7gKN/D8lkra9/xIsTMrDHBeagi9Ch5nf1QVYFXCJGiRjsehZR1fzf3u3ZZ3yn
 XrS5uWQcA4oVyrnr+4sPT46E34CYH0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676403756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0taNcI0BH7qm+otWN0m+SySACtsZfs01z6+3ERND1g=;
 b=i59v/GNaGQ3jbstcs/t62v038tfxDO2gdnT/bCbH/EkOwBM7gJTrJR8LdP9yjmIsLB1lf3
 dUWWWJP+y33AP2Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91043138E3;
 Tue, 14 Feb 2023 19:42:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Zx5oFivk62NGXQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 14 Feb 2023 19:42:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
In-Reply-To: <20230214163048.903964-6-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-6-richard.henderson@linaro.org>
Date: Tue, 14 Feb 2023 16:42:33 -0300
Message-ID: <875yc4kp92.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Richard Henderson <richard.henderson@linaro.org> writes:

> Rather than increment base_reg and num, compute num
> from the change to base_reg at the end.  Clean up some
> nearby comments.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/gdbstub64.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 811833d8de..8d174ff6e0 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -277,32 +277,35 @@ static void output_vector_union_type(GString *s, int reg_width)
>      g_string_append(s, "</union>");
>  }
>  
> -int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
> +int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      GString *s = g_string_new(NULL);
>      DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
> -    int i, reg_width = (cpu->sve_max_vq * 128);
> -    info->num = 0;
> +    int reg_width = cpu->sve_max_vq * 128;
> +    int base_reg = orig_base_reg;
> +    int i;
> +
>      g_string_printf(s, "<?xml version=\"1.0\"?>");
>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>      g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
>  
> +    /* Create the vector union type. */
>      output_vector_union_type(s, reg_width);
>  
> -    /* Finally the sve prefix type */
> +    /* Create the predicate vector type. */
>      g_string_append_printf(s,
>                             "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
>                             reg_width / 8);
>  
> -    /* Then define each register in parts for each vq */
> +    /* Define the vector registers. */
>      for (i = 0; i < 32; i++) {
>          g_string_append_printf(s,
>                                 "<reg name=\"z%d\" bitsize=\"%d\""
>                                 " regnum=\"%d\" type=\"svev\"/>",
>                                 i, reg_width, base_reg++);
> -        info->num++;
>      }
> +
>      /* fpscr & status registers */
>      g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
>                             " regnum=\"%d\" group=\"float\""
> @@ -310,8 +313,8 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>      g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
>                             " regnum=\"%d\" group=\"float\""
>                             " type=\"int\"/>", base_reg++);
> -    info->num += 2;
>  
> +    /* Define the predicate registers. */
>      for (i = 0; i < 16; i++) {

There's a info->num++; at the end of this loop.

>          g_string_append_printf(s,
>                                 "<reg name=\"p%d\" bitsize=\"%d\""
> @@ -324,13 +327,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>                             " regnum=\"%d\" group=\"vector\""
>                             " type=\"svep\"/>",
>                             cpu->sve_max_vq * 16, base_reg++);
> +
> +    /* Define the vector length pseudo-register. */
>      g_string_append_printf(s,
>                             "<reg name=\"vg\" bitsize=\"64\""
>                             " regnum=\"%d\" type=\"int\"/>",
>                             base_reg++);
> -    info->num += 2;
> -    g_string_append_printf(s, "</feature>");
> -    info->desc = g_string_free(s, false);
>  
> +    g_string_append_printf(s, "</feature>");
> +
> +    info->desc = g_string_free(s, false);
> +    info->num = base_reg - orig_base_reg;
>      return info->num;
>  }

