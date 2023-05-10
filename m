Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A76FDABA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:28:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwg5l-0000oA-M3; Wed, 10 May 2023 05:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwg5Y-0000m3-39
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:26:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwg5V-0003dw-Dq
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:26:23 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30796c0cbcaso3299339f8f.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683710778; x=1686302778;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZ3uAiHSniXfodcNdJp9MqKvf82xb+cKa02xvjJ/7/0=;
 b=ZJPHxbdEKzs+Byar500+kpHElLU4uLt61GkeWaE83H0Bo1B4o5PXVwf7GUvKEKJCo1
 hzOybM8VAqBzFE3L4nhN5b67QhN37gzMqDAJPp6ta+9M+OPyCLqKZVRHy5w1jYLcX9X5
 n/hTCUSKutIMoqaXanTnosGDVUSP+bejNLmPTLLdqRminLXL3mh3vfFCX6UQRrj46kzp
 ENSJ8Dq1DAjQjzSMDeNZvGS4FZrC6ZP1GhcILSGJu2hPgYNYt1KvP1Bbjd9IvDq1N2fe
 Wcof/LQq9LJXHx4yrd3iajyg0g4E340CpiD99caYwSd+lbbFQDl7DQPa1R35KeCB4Igy
 W+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683710778; x=1686302778;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vZ3uAiHSniXfodcNdJp9MqKvf82xb+cKa02xvjJ/7/0=;
 b=Q3Be+vtbWqjndPaVBMDuBWpMDMaEw8r4iXb+l51zlaGrjYeb0URJBen/ch2bIqy2OM
 msBdbu7iTMgOKuuZQ0XzQTyNLrKvp7crmd2SWQU4akoLRaLvi8ri4me/xlwKL8IRwHD1
 0th0PP94qteotJOLFz4I9I3uKUnp0JWp53p2Ie+oYRFswNcgFBTS2QzXbdwhVcRoD/Uw
 hkb8EVc5PDtDOUFDDliFXvzaQIPas6BRq+LnLGzhwHcMRo7JMJMVFLbA9Wwu/JEd4tVi
 SAVriTjAJrU9mR0q9PacXt5DjFmo3Uh8vMBIn9m3vyb41eMvJ1G00oZ8YowwqRX/Ji/E
 btaw==
X-Gm-Message-State: AC+VfDx57ATObGxfHVYX1TvQFMBoDy2sj9H/kil9WABeAiatYaj4KpiA
 A4tonn/GKPMEVd8sb0JCz7M3nA==
X-Google-Smtp-Source: ACHHUZ6UhHZtUInomG3PIsrT/kC98yAqnGngWKIClxdN0dA7m0ugyfD9JruoxhB+OakovWg8wROllg==
X-Received: by 2002:a5d:43c4:0:b0:2f8:2d4:74ef with SMTP id
 v4-20020a5d43c4000000b002f802d474efmr12318425wrr.43.1683710778387; 
 Wed, 10 May 2023 02:26:18 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfff92000000b00307bc4e39e5sm704101wrr.117.2023.05.10.02.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:26:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BDB51FFBB;
 Wed, 10 May 2023 10:26:17 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-9-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 08/30] tcg/riscv: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:26:10 +0100
In-reply-to: <20230506072235.597467-9-richard.henderson@linaro.org>
Message-ID: <87wn1g8rly.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

> Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
> and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
> into one function that returns TCGReg and TCGLabelQemuLdst.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

