Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C826F5429
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:13:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8X3-0002Ia-9R; Wed, 03 May 2023 05:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pu8X1-0002Gc-S3
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:15 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pu8X0-0005lw-Bq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f315712406so15368395e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683105132; x=1685697132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/zod5xsswpVBR7hlKEzwTqzhAu9kilTeSo6vjGfoZzY=;
 b=fl3+0HTDclChX9Eoz4UASBvCMsATTbetGEowrH/weZ1bDHTMayoXkdjPDhUGyAS4ke
 12DrV+kTixHFmWaEElgDO8rQqcfacOi8lPYKQNOklhO7iYa6vI/Vth5YSpjrL5Cxh540
 lwMBXm7o4A3QvMfGN1mL/DqJW7lw9xCSdHgpdXnotShWRWOw94HMhvGPPKE4l3MmrEkN
 3ZSh5OtOxwDtz3wD4HAocDuJPZdgC9wz8raJawwZmgXxu2ea/el8as7ktCUn64bkYLpv
 egBn3ML+2xI+xkPEnGZK9OIoEPXC5wkxvwvtSDDW+94uCRJUfGfU1tzqbJ2+k+AH2W/B
 xAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105132; x=1685697132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zod5xsswpVBR7hlKEzwTqzhAu9kilTeSo6vjGfoZzY=;
 b=W2+vGllDaArogsmmkh9zFZ4nevB3PwbOg96ff4TlGdn+fLjBjOY0KKc0ZrIeGafah3
 w2yFBbjI4/Iwez7k88BxmTtAlWW/ldhNLZDBcCBPyrFCI6bbYvBbr526T64H3a75KGKk
 rMZT4YjAN0+RPID7Qer3pZ7uBcbIxIrlLYV10MderprZ2b40Dtn4R/xLLNC40iLyadFL
 bpbGCqyjC/DNyJvbbRj4c4NchPg/ogSFLMnkXqXIY/8a0vYcbl5wE0WmsS8PaMbFkWO0
 aFxngFmJbp7iJycUyuIjrJUzwwi3dQLY90pMWPZ0/GgGqFGuZRSxOCDNpuBHrPYtTWUc
 FMKg==
X-Gm-Message-State: AC+VfDzeXEXbVA89byozypHlaWlQYMR4kgs8mhqzcdWeP7kNcXulT0dj
 K5W5zAlpJW9nQFVR7dBRalg=
X-Google-Smtp-Source: ACHHUZ7kWoco+FaWmgUXPr0oeiUX9ydgEiurzrvHGnGrKsx0JQOfPK27JvaMG+qFbQYk6+dUhLlByA==
X-Received: by 2002:adf:f8cc:0:b0:306:2639:a1a2 with SMTP id
 f12-20020adff8cc000000b003062639a1a2mr1036581wrq.31.1683105132475; 
 Wed, 03 May 2023 02:12:12 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003f07ef4e3e0sm53270511wmq.0.2023.05.03.02.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:12 -0700 (PDT)
Date: Wed, 3 May 2023 10:12:11 +0100
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Linux OpenRISC <linux-openrisc@vger.kernel.org>
Subject: Re: [PATCH 2/3] target/openrisc: Set PC to cpu state on FPU exception
Message-ID: <ZFIla2Jlaa5gCr6o@antec>
References: <20230502185731.3543420-1-shorne@gmail.com>
 <20230502185731.3543420-3-shorne@gmail.com>
 <baea6704-7a22-6934-54f3-76ff4c0fc298@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baea6704-7a22-6934-54f3-76ff4c0fc298@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x32c.google.com
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

On Wed, May 03, 2023 at 08:36:13AM +0100, Richard Henderson wrote:
> On 5/2/23 19:57, Stafford Horne wrote:
> > @@ -55,6 +56,9 @@ void HELPER(update_fpcsr)(CPUOpenRISCState *env)
> >           if (tmp) {
> >               env->fpcsr |= tmp;
> >               if (env->fpcsr & FPCSR_FPEE) {
> > +                CPUState *cs = env_cpu(env);
> > +
> > +                cpu_restore_state(cs, GETPC());
> >                   helper_exception(env, EXCP_FPE);
> 
> Better to mirror do_range().

OK.

