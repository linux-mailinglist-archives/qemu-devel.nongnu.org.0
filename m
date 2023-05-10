Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28666FDEBC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:40:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwk2y-000379-Ei; Wed, 10 May 2023 09:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk2l-00032e-6a
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:39:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk2h-0007es-IM
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:39:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so6862386f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683725982; x=1686317982;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsminFS3XLyksBmpaEcl2jVCd9XbIRCOmqz74DmSzYg=;
 b=QYOs8q/Xaa54pJGXYBAaivVPXM2LQCEqlXJ6RFNXfAn9U8jVBwRUR51bNNpZ81pjH2
 O92UtaoiF4eeGtY8s5GKUD+L90fdf1SpMN0VzTdQRKs3rUliknrpCrqGw1lW3jAuClh1
 s6WyxdZFQ7K6cs/Kp+9OeEMOh1/o8xTnHaYv0WGR9uzI/v2W/5XtszSqErl7vpkkk+Ug
 aIE5I5OmqWdeZuDH50/zmZYm44wG7kcFJ7GYtvks9+TYKULKNBMavRPjKoI/d/wU2PMo
 uvBMaE91cJaJrQFihK9OfYPyQyoq5OEQ2O9etOkC/zBqv28zwef+2CiVAH6Tf3KNIz3p
 WrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683725982; x=1686317982;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XsminFS3XLyksBmpaEcl2jVCd9XbIRCOmqz74DmSzYg=;
 b=MQzuBcL2jSOAy6UtkIa3jdHPbLL462JvIUGZv3FECvBepZrhoDWSd7XU+hKZ2OpiQz
 DAyFirAlkOGZ4BJkPNLdmDr2fU2f/8m+DXSN6kcQgNfML3fP4r26KzrjStyDOP/C2YHJ
 9sZMfa1HLY0tjOJCk465qF3fv2StrhrlVA6JgpuhCCCfcHcNaSRAJO2L2GDen78J021O
 zE/bG8kntqc+mpG67i1C5xn5m9xTinmawXJ+Oqbm7Zhyoh3jpv+nohjkrw7A2tBtH3mU
 TusIvNZq7Qnbds/UizmIP7VZk7Les1zIon2Qutc45hq4rcqmZ/eHMEjk3rcfpakjYKN7
 b1tQ==
X-Gm-Message-State: AC+VfDzFQ/JlpzGVKSuvt/EaE30q+dsHJR7FqBnApgNlS4B2CU8ZwoqU
 bSUPW5tFzLL+Zl0Ch5UpTuc/2g==
X-Google-Smtp-Source: ACHHUZ6RUp/+Pv9LaLiDYCpsjCEFs3cRZih84k0+tL+AgFXtKdz9h/xNXgE1fzNEUWHEuUESXJi3Mw==
X-Received: by 2002:a5d:5266:0:b0:2e9:bb2f:ce03 with SMTP id
 l6-20020a5d5266000000b002e9bb2fce03mr13679713wrc.0.1683725981853; 
 Wed, 10 May 2023 06:39:41 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6101000000b003062b57ffd1sm17581239wrt.50.2023.05.10.06.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:39:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 153C61FFBB;
 Wed, 10 May 2023 14:39:41 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-17-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 16/30] tcg/mips: Convert tcg_out_qemu_{ld, st}_slow_path
Date: Wed, 10 May 2023 14:39:26 +0100
In-reply-to: <20230506072235.597467-17-richard.henderson@linaro.org>
Message-ID: <87ttwk71b6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

> Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
> and tcg_out_st_helper_args.  This allows our local
> tcg_out_arg_* infrastructure to be removed.
>
> We are no longer filling the call or return branch
> delay slots, nor are we tail-calling for the store,
> but this seems a small price to pay.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

