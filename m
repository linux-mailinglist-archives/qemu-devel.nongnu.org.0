Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457F6FF7E3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 19:00:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9dl-00034A-Ev; Thu, 11 May 2023 12:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9dj-00033e-CX
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:59:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9dh-00029K-Sc
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:59:39 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f4ec041fc3so6363145e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683824376; x=1686416376;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20mL6ahqZNIiZWHzDkwRRqSTrSHs5qvtBtXea5jtm1c=;
 b=Rdd3Su+BW4CIPfYQnHjXDPq5bLX+lVK9x1lMVGgL291FWpRNg/tH74d2vHOkL2H+dx
 BUreKd40DBgQTJG53Ncc2mcYiabsgzkjX/mQQVj7/BRxncUVvM0opDCEZt73M9MCHJVk
 PdAZgyV6iEvS4MWrKT0gVnOzt5zzcsneC93krLdp2RPgGk5HSHJX+GqQ7/FQ7LenDkNv
 dPcSxAp9/+rCQcwoCigCzvDgO2h9QrLZ0lZP83ucggWJCejtbXWbhi9QvQxEgLpTJaXI
 QkvMvk62BR4k268peburMPNLSAKY7FsmMN52SaYRRYtSTGsUyRahKvWJqYoDtM/ZVyyF
 fqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683824376; x=1686416376;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=20mL6ahqZNIiZWHzDkwRRqSTrSHs5qvtBtXea5jtm1c=;
 b=NkzR2/2vb/gLkJi/t9avNyt+1BIJrg2z5BN46XaaXWwb6shiDyhVnOIGzRwPNtNkmg
 0Eo170PGnl20aFVGSpYi22fSK2lda9TBGTyN+JoO+jpKTXdANXrKo8o/zB+wj3aS5yMy
 a8rHzqTocRQ5AXt+dG9BY0unn0MRS7USY3vFdzRg666kJ4qbXJPIUo2ptmI+dzYHx47k
 U+5LlcRqdSmQTqIFHVHbhXdCqFEqGu6fqRy4G4WPX5kjlbHcyeFqRKzdcn6Hf7TYZUKi
 EKy7ayZO76KcH9jBPgxwpyRJ98g5xC7MzVEepzvRLyQL/TMa0K1PcLBaLVbYyZ6lfKoI
 qQIQ==
X-Gm-Message-State: AC+VfDz9amqgW52V/uM/wLQ65fSu+dRlxNSfNEwSqHgjVZyeA4xRzvLO
 evRQUbCr3NVIxqJ2jXRq4ulUJA==
X-Google-Smtp-Source: ACHHUZ6yHBIv0vJUq58wFUQg6D168AnYtl8VNIE/A1bHqxlCkKaiQmrEV9aFZpaiyqeTcsGT4zPqpw==
X-Received: by 2002:a7b:c397:0:b0:3f4:2bb3:a5ab with SMTP id
 s23-20020a7bc397000000b003f42bb3a5abmr7889757wmj.31.1683824376197; 
 Thu, 11 May 2023 09:59:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a7bc34b000000b003f195d2f1a9sm26135829wmj.15.2023.05.11.09.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:59:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 461C81FFBB;
 Thu, 11 May 2023 17:59:35 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-23-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 22/84] tcg/aarch64: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Thu, 11 May 2023 17:59:30 +0100
In-reply-to: <20230503072331.1747057-23-richard.henderson@linaro.org>
Message-ID: <877cteztvs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> All uses replaced with TCGContext.addr_type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

