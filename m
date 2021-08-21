Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897BA3F3C32
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 21:01:14 +0200 (CEST)
Received: from localhost ([::1]:50300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHWEy-0002KC-Vc
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 15:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHWD7-0001Kt-L8
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 14:59:17 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHWD6-00060D-6f
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 14:59:17 -0400
Received: by mail-pg1-x533.google.com with SMTP id o2so12558064pgr.9
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 11:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lhDdN5OWxXKQkydRBX45zZZ7+QIWI9EFkLa58BWgVE=;
 b=CXLO1AwG6RCgC22wKhpQ9e/qB5uket20GcUTRadkZfGL6fgpcqSXLnQdIfmqWSxvxs
 P/adXX+IJydf0OugwSb3etAAN22Ru6gWc1pVe8R4wRATk9dsqbK6eUAoODnSGROw8rBF
 Jnyfv8X5FWVhkhIUI/6rbtB3+1O2e/lma5T8pYCL4jH5+oHifNC9aRkcgitkuWAYbPHW
 PGU59fOdf0ghDgAI2+tXWaU+QiSCDCaBQy8ARvg0eyz+0x0m9IVCnI/m38tmY9nD0B54
 04nLbWTdKyHdJfqvwREGYrjXCOpWpSMdfNoAWPCc4I/Bz68lWjkNHSoZHTbGWtAIgQhH
 BeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lhDdN5OWxXKQkydRBX45zZZ7+QIWI9EFkLa58BWgVE=;
 b=cigAVsjUkAgC37yQka0rtK4AzWf9DsEM9aYj1Pii1Zs1P1WHDqNL5JoQ+GOiFWD1dH
 VWIziuVxe5V7jhwCLj3dCSumZXGODHZ0inkK3ybVnEGBiubmOsmFTKjOanysSaYrCVgN
 KNUYoPVvTuBcXkRh/IWs36+am7pdGN0Ro+dyaZQDZ+M0MznTGxOX9PEmo3CfSMJViSM+
 fKScLNQ+Iz42uutmFCj2c/lSYMb1UgWaA1U8S/X5ZYxujAMfB9RgMwbRZWPF8vAgYqZi
 +R6+P2A/ippO9b3COzhOG465+QOJjrkDkSCQXx1uWLGswsOtQbtCkXInVBMYfsMjh+TA
 pfYA==
X-Gm-Message-State: AOAM532coVCIeKc1+HkrKJVeV03rBu44xWR1M/J17xfxuWKLKFX/G4CM
 yRoeFuYcu20W4JC1HHuYwxUWHw==
X-Google-Smtp-Source: ABdhPJyYByhSKMw+e3rZp97vdXSYpkp9C2s9p3lCLc7fLJT1JdU+09yCUeTElxDrmPD7WAYoo74vtw==
X-Received: by 2002:a63:6983:: with SMTP id
 e125mr24483545pgc.389.1629572354386; 
 Sat, 21 Aug 2021 11:59:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id e12sm11096513pfv.146.2021.08.21.11.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 11:59:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PATCH] target/arm: Take an exception if PSTATE.IL is set
Date: Sat, 21 Aug 2021 11:59:12 -0700
Message-Id: <20210821185912.22401-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817162118.24319-1-peter.maydell@linaro.org>
References: <20210817162118.24319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +static inline uint32_t syn_illegalstate(void)
> +{
> +    return EC_ILLEGALSTATE << ARM_EL_EC_SHIFT;
> +}

I just noticed this should have the IL bit set.


r~

