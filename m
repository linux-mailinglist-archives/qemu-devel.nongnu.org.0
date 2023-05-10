Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344726FDA76
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:12:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfrS-0003nE-03; Wed, 10 May 2023 05:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfrG-0003f4-EG
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:11:39 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfrE-0000oU-31
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:11:38 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3077d134028so3770176f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683709894; x=1686301894;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZ3uAiHSniXfodcNdJp9MqKvf82xb+cKa02xvjJ/7/0=;
 b=htoIUAGaTqUfO1aVSdxcnQaUgRbWV+S3EsdCQMsdaIsA28tYXMEuXnkFMJTAA242Dg
 1HyXSmkEp+TwjROWShQW0d/NKAD85lmwbZVYytqrGj4MaQXbEv/DpUXxM5kOhm0/+5eN
 ENTAy5qapqXRaxU9XY8Ko4PViLuD5wcqEYMxVj3Zw+1PLNR0no2UHiL3K5I0WhkzELlu
 Lqknbse1HicwLJaCp8EqxAluFxATTo5OpBMbSSF6GCfikTqhn1bmG6YsO8YRAest3dn0
 Hf1qngvW0l6ZlR0Fzzrbrwp9uys9brtgNoxpbl9+gKMeEvPtgTrVfTEz2NK/H5TzSvPV
 Ruew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709894; x=1686301894;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vZ3uAiHSniXfodcNdJp9MqKvf82xb+cKa02xvjJ/7/0=;
 b=iHfcpdpkEadg8yHZqgqKgqaKGxMbfvrPPs8SkX7LAzlEL2vZcBNRn/lQFL69sfRC91
 eyK6wP+TnHW2zYg6IHoHfdk3RomNxnMv7NN0VGtcyKPIhLyIapsh0p8IzoikyAT0AsPB
 fyBeID/y9MTxZs8vCGcP1XkInIdWMbLr6TPY65t6DmqA6FOuLzDSz8cW917cjRf85laa
 kijFy1cAmgBLlPpKZ0+/S6ke6IMa5eernPesyE1EG+056rcKDQfZYT7alzw3DqPRr+JV
 rjsEJQGsHy+g9GGCQ/MciYgNsmJnEIwimvY7vu/LJyA5knFwsDa8wSrYI9g8waFt2Cob
 s7qA==
X-Gm-Message-State: AC+VfDwhuJ6UKptiHhGtZTri0vV0HosLXK5ZcLy2X6iE5tWFt2k9TlTd
 SR3cqOWxh+B5y2LT/Y2CrL9Vjg==
X-Google-Smtp-Source: ACHHUZ4mPqlwWLUZK7izPhbejiwGhpGfZfFVJxB2SVaUgDZfiI4o0bX2HlHoDX9/YsaYSmGq5cyyLw==
X-Received: by 2002:adf:f887:0:b0:307:9256:3210 with SMTP id
 u7-20020adff887000000b0030792563210mr7884362wrp.1.1683709894691; 
 Wed, 10 May 2023 02:11:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfff92000000b00307bc4e39e5sm663209wrr.117.2023.05.10.02.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:11:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CCCE11FFBB;
 Wed, 10 May 2023 10:11:33 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-9-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 08/30] tcg/riscv: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:11:22 +0100
In-reply-to: <20230506072235.597467-9-richard.henderson@linaro.org>
Message-ID: <871qjoa6uy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

