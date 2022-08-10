Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666BA58ED93
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:48:03 +0200 (CEST)
Received: from localhost ([::1]:56114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLm42-0001yt-GJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlba-0005M0-0J
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:18:38 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlbY-00049N-KM
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:18:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso1000985wma.2
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=hhs2ox7W3Hv5imDeyYbLLYfMQsFDhbUnHQXlbLBIr6I=;
 b=ftcI4HwIIS9JuzdCRZ6kGF8mJYf4fQIE8RHyDPmc4tXZml0WK6c2/81PSqoH4nYGsJ
 sU5GeHu7351iJcAy6TXyg3fLRTyCWqKNODLd6/GH0xYUcc35WdprBTm2HtKssuzMOfgN
 LuI3VtBVlISKRptWX0B+aHTzg3bGaqfCobS5Z/0ynqV/IMRzF5oqR3FB+KrlcFTjAJDB
 +01qsYj5qdI3W8wLcGv/GVU+mME6mtQlzF9VBN6pxt+8DZb9D2fo3xsusQCivEtOmScU
 O2q0a+1x5umCsnOsa96BFTV925v1p+PP5zmN7ugiI/T81MVhcGfM032FodHVRYpKncNL
 a3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=hhs2ox7W3Hv5imDeyYbLLYfMQsFDhbUnHQXlbLBIr6I=;
 b=sM09iGu+Af4PN/wVmfpozjW2fR73lkMxOWoQdpEl+JqrTlCibiT2QbiZbZ+xM2cLnK
 2Tdrx5gbOXU353mFL4HaLcC7HT57dpSVoiCZAkkVs6taInXtdVk9WO20P1YrJJhrw+8Y
 6Uk6r0ByKZUhBPtSeG0ZQ2QUdOwnRvyM59bEPaAIcTiGZjG5ha9HeHN5o0TNsumBPI2n
 +obXntGatTM9XIXpmaxPgZ0/gK1XrR+oVoKtp1jK55yVMLqSbG2RmV8XBO0nI2Wau+j8
 mJQOjHRW/kgIvtXiajn9kxxTuvZ2+dieFU/ny34o2NtCgBD+GQV4b7mhMurQA2rqLnKH
 ymBg==
X-Gm-Message-State: ACgBeo3YgUYBAJoRB1/+nH/Qc+zoWyV9I5LoFMPdq/6nB9yB33JTy63O
 PBg65/QFtOexgikGCMdr/kkxvfhpvW32pQ==
X-Google-Smtp-Source: AA6agR47DPSvwwXgQr7IyijKOZXlswYR1dqRne8J0sY+XWFHWr9qyVLtMK4Bc5QxQXztieEUt7mWaQ==
X-Received: by 2002:a1c:4c0d:0:b0:3a5:98fa:3a4a with SMTP id
 z13-20020a1c4c0d000000b003a598fa3a4amr2480620wmf.92.1660137514929; 
 Wed, 10 Aug 2022 06:18:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adfd08c000000b00220592005edsm16087164wrh.85.2022.08.10.06.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:18:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E82E51FFB7;
 Wed, 10 Aug 2022 14:18:33 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-27-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 26/62] target/arm: Add is_secure parameter to
 regime_translation_disabled
Date: Wed, 10 Aug 2022 14:18:28 +0100
In-reply-to: <20220703082419.770989-27-richard.henderson@linaro.org>
Message-ID: <87y1vwjkye.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the use of regime_is_secure from regime_translation_disabled.
>
> This fixes a bug in S1_ptw_translate and get_phys_addr where we had
> passed ARMMMUIdx_Stage2 and not ARMMMUIdx_Stage2_S to determine if
> Stage2 is disabled, affecting FEAT_SEL2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

