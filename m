Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A8696E11
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:44:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS1Dl-00052y-8a; Tue, 14 Feb 2023 14:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS1Di-00052T-Pk; Tue, 14 Feb 2023 14:44:06 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS1Dh-0004fq-9j; Tue, 14 Feb 2023 14:44:06 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA08F2189A;
 Tue, 14 Feb 2023 19:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676403843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f0g3Ft0Om9pHJo683P8iITADAnW1FyKd817G7e/5RS8=;
 b=KAuEBfkeckIJPdunv9m1SUD6w36NQBIl/jK1CofQxE23/Xq4AtdU3ieJC44z6LsV3D+WSC
 2gFI6MtwxoCZeBdS4/SneymFMYAYFh46EmAQNFExy7LlgZ5UuX4nLWD/Nb8ay5W/rid7ZX
 BPPKJKP5GO7Xs/ji/Z9/11p4ZcPE29s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676403843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f0g3Ft0Om9pHJo683P8iITADAnW1FyKd817G7e/5RS8=;
 b=FoxlAr4nACyFbQDcIZxvbGcXSlkoJ+C9dbWSv1YDddriUxe4SEfSwxIJXIPC6dVFkm5WqS
 kLkt7SiibvBg3hAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A696138E3;
 Tue, 14 Feb 2023 19:44:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1HVMEYPk62P1XQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 14 Feb 2023 19:44:03 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 06/14] target/arm: Hoist pred_width in
 arm_gen_dynamic_svereg_xml
In-Reply-To: <20230214163048.903964-7-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-7-richard.henderson@linaro.org>
Date: Tue, 14 Feb 2023 16:44:01 -0300
Message-ID: <871qmskp6m.fsf@suse.de>
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/gdbstub64.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 8d174ff6e0..02a0256c5c 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -283,6 +283,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
>      GString *s = g_string_new(NULL);
>      DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
>      int reg_width = cpu->sve_max_vq * 128;
> +    int pred_width = cpu->sve_max_vq * 16;
>      int base_reg = orig_base_reg;
>      int i;
>  
> @@ -319,14 +320,14 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
>          g_string_append_printf(s,
>                                 "<reg name=\"p%d\" bitsize=\"%d\""
>                                 " regnum=\"%d\" type=\"svep\"/>",
> -                               i, cpu->sve_max_vq * 16, base_reg++);
> +                               i, pred_width, base_reg++);
>          info->num++;
>      }
>      g_string_append_printf(s,
>                             "<reg name=\"ffr\" bitsize=\"%d\""
>                             " regnum=\"%d\" group=\"vector\""
>                             " type=\"svep\"/>",
> -                           cpu->sve_max_vq * 16, base_reg++);
> +                           pred_width, base_reg++);
>  
>      /* Define the vector length pseudo-register. */
>      g_string_append_printf(s,

Reviewed-by: Fabiano Rosas <farosas@suse.de>

