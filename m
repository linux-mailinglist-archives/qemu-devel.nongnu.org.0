Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214766FF42B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:27:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7Ex-0001tg-Jp; Thu, 11 May 2023 10:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7Eu-0001sq-O6
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:25:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7Et-0008Oh-5A
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:25:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-305f0491e62so8355005f8f.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683815149; x=1686407149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SkyZOvx5qmGpsduQvq1ZNuG43m7DUiPCKnBykl3eb7A=;
 b=kcO99qNQ10y3Csiu0QV1nwZMtjt6pQq+YNOQFzTEP0W99IS86P3hogiNs9CjN7E0gT
 4Mp8YE/g+xKYc3UPCVTDjBhcZKpdfnyg3NpgB2MKfSXSfbDyqS81yj49jCUfiCfoQjw2
 E7j9QZ3Gs/N4FFLLvTb+7g8AWgxfOKkAbumXVVnxn8LToViHnC2NNY5n15DmouIMBrAW
 K7fsn84XtmHOVhUEzzvN8GLknotqprcZWAKX3C8A6gzXqo/8fS/6X2j2M4XIbI19vaza
 JEHG17ClJmiJGXySRqIHOOEoCyqMX+3/YS7MM7/jgh9n6g0SmgkBjFCN3KjLriMOWpYS
 k0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683815149; x=1686407149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkyZOvx5qmGpsduQvq1ZNuG43m7DUiPCKnBykl3eb7A=;
 b=jc/wOOHg/3/sVkvO4LTko5TAGM/CgEnt7dVoWr7OVrw2lpX08kVPd8a+r+OoRiqhSP
 Kbic3TVldK8F/WXU4ATtu38YM3/UGr5Mx54hQxUfapfAhELYnUNbO06+imViHvcjYxeI
 3jfVIxs3JDZVfBfru620y8sCDMCX/i7WUqrnHP/UPDQCn0lM+TQ1BascRBqr0aEX6TzL
 dmjJvLqnVmZGLc18leJrOZtTwLResM6d5iNLptGvUhDw2/ts3zNsNaUj3znDIeSUGwdl
 MIrXJfZ9VrWxOnWsGMz3ntgxLrXUsz2Ov+3Afk3fEZSvcJ+JHTQiM65+ibK9CRIl9IrC
 JoGg==
X-Gm-Message-State: AC+VfDxg1A58++VlIooVPNuTRcs2y9hC2IrCkLOcrcmi1lOuTWgyp3+l
 arir3EMcLU2sxdqKceL33k8=
X-Google-Smtp-Source: ACHHUZ6vEaH9Aojgk6BZANPEw9MVQELL/5I+FFf6agBqXqBGQ/9EMhyI0JK4h5Uu1PsLnGu1Lv9xCA==
X-Received: by 2002:a05:6000:100d:b0:306:26d1:230a with SMTP id
 a13-20020a056000100d00b0030626d1230amr14338261wrx.65.1683815149424; 
 Thu, 11 May 2023 07:25:49 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 p14-20020a1c740e000000b003f420667807sm15897024wmc.11.2023.05.11.07.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 07:25:48 -0700 (PDT)
Date: Thu, 11 May 2023 15:25:48 +0100
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Linux OpenRISC <linux-openrisc@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] target/openrisc: Allow fpcsr access in user mode
Message-ID: <ZFz67B+EehEOx6g7@antec>
References: <20230510153228.264954-1-shorne@gmail.com>
 <20230510153228.264954-2-shorne@gmail.com>
 <c7e792c1-8229-8b6c-8e6a-1eda14d77c03@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7e792c1-8229-8b6c-8e6a-1eda14d77c03@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 10, 2023 at 05:13:03PM +0100, Richard Henderson wrote:
> On 5/10/23 16:32, Stafford Horne wrote:
> >   void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
> >   {
> > -#ifndef CONFIG_USER_ONLY
> >       OpenRISCCPU *cpu = env_archcpu(env);
> > +#ifndef CONFIG_USER_ONLY
> >       CPUState *cs = env_cpu(env);
> 
> Pulled cpu out if ifdef here...
> 
> > @@ -204,10 +220,22 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
> >       OpenRISCCPU *cpu = env_archcpu(env);
> >       CPUState *cs = env_cpu(env);
> >       int idx;
> > +#else
> > +    OpenRISCCPU *cpu = env_archcpu(env);
> >   #endif
> 
> But replicated it here.

Right, let me make it consistent in this patch.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thank you,

-Stafford

