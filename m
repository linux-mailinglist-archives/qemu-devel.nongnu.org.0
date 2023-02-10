Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C0669250A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 19:10:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQXpM-0005Nx-UJ; Fri, 10 Feb 2023 13:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pQXpK-0005Ku-Tf
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 13:08:50 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pQXpI-0001ST-0R
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 13:08:50 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso4653953wms.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 10:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4MMKLhxRBN0RBzX0zGlv/Tbr/Ai8XG6lzKS0FZP/2jQ=;
 b=C1jeKOtC0r3iY0Z9aihNisFbqbMJS6iGfVzO/wn3K0Whm+POCoDFMjvL8s/4n9NV2L
 V8/oT7w0xD0tFBs1vsTdRx+tyAP1GzFdzgZSOLXjRCQxXDtbZe8SGy2+vEBM5uctazVj
 7Deyoxo70Ap09rlyifWNjcEHQfazjVjsZ7k6UOOppC7H2zCiaEef4XDdNtdPv9DDE8wh
 JEWdgpriC0VPgfOsxIJdcg5x2ZDGwJCSoDDX+U5uk0ZId07U6r9cZL8qNc/qfQ6uD3SX
 6xVbHlomF3wBlnf5NSY/VXYFZ6XVdd36Xsa7fXVwQUAIEaBHUIEP9sXAjZH/46hS2hUk
 8ewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4MMKLhxRBN0RBzX0zGlv/Tbr/Ai8XG6lzKS0FZP/2jQ=;
 b=EcLj5+XtWio1VGuNefIpBMd/xuEEfRL5Og4/FjE39DdVSL+6iAnYK7iPcA56XCj624
 bE15cOIkKXyid/nRcVp5tBwlRpw0g8GRiLC6OCpCvDL4joJxf2bGX+VQdeGoAvQDBjxe
 ccJULWJshcoXGODP+nE7Oach9obNTcrEiQxoW3TKG26D/yLsPhztdCzkQfSJQ2P2MrmS
 9EGUKvhsG+MjaEDPU682xC5dVf2g+Hf8CoVX0H0Zb7pVr7XC9JLP11JwD2+6sdod/7Gb
 Ghyl448mJTwm2wo/K08qZMAdEPAxQ5G3saGT2ozplnrynxp95Q0SDeBS6To1Z7HDFdjD
 aH1w==
X-Gm-Message-State: AO0yUKUH8rYZHwgDC/BcLC7mwkrMoRB1lNF8gp2+BR43mZcK77nMS4fS
 Mneh/WflMKy5qXM85kQEuR0ffw==
X-Google-Smtp-Source: AK7set/i4TA6PM9eB3xu9Kb9mGsBecQknVbTy80D+2zJ75CGKa9jj64ZJ+dixBki9UKVeUzqvaQJlw==
X-Received: by 2002:a05:600c:540b:b0:3df:f3cb:e8cb with SMTP id
 he11-20020a05600c540b00b003dff3cbe8cbmr242032wmb.4.1676052525355; 
 Fri, 10 Feb 2023 10:08:45 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003dd19baf45asm6427978wmq.40.2023.02.10.10.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 10:08:44 -0800 (PST)
Date: Fri, 10 Feb 2023 18:08:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y+aIJy56YYEKkpgW@google.com>
References: <20230207181933.1999817-1-smostafa@google.com>
 <CAFEAcA_WW1_d3y6qE3G99cZKyPPwycKAbkGDM=5_6B9t1uDQ6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_WW1_d3y6qE3G99cZKyPPwycKAbkGDM=5_6B9t1uDQ6Q@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=smostafa@google.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Fri, Feb 10, 2023 at 04:11:37PM +0000, Peter Maydell wrote:
> 
> I think we should check the whole register against its reset value,
> not just the ABORT bit. Otherwise if the guest writes the other fields
> to non default values we won't migrate them. That doesn't change the
> device behaviour now but it will have the weird effect that the guest
> could write the register and then after a migration find it reading
> back as a different value. Plus if in future we implement actual
> functionality for any of the other fields then we'll want to know
> what their true values written by the guest are.
> 
> Linux never changes any fields except ABORT so for the most interesting
> guest it won't make a difference right now.

I agree, I was trying to achieve maximum backward compatibility as we
don’t care about other fields, but this can be weird for forward
migration, if the register is not fully migrated.
And if SW touches this register it would probably want to configure the
ABORT at some point, so it won’t help much for backward migration.

I will update this in v4.

Thanks,
Mostafa


