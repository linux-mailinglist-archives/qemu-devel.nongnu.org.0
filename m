Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E256A6FF7A0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:40:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9L0-0004hT-QA; Thu, 11 May 2023 12:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9Ky-0004gu-IG
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:40:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9Kx-0007J0-3b
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:40:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f475366522so15961615e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683823213; x=1686415213;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2O9scusjOsscsOPVpWRgKquzbX1T0zSJLwu8/vyuvA=;
 b=bhCwkm1Exh6Cdz8qtlgOt/RtX3xJ2ljzygY3Y0kIG3y4lV1hKx2NB0VKiohMm6sdTn
 jNNkXHNdn+UOFsbxndRuq3FJN03o9xY538GiMVIu/7G5xjmE9MunyNHDueo70n1B5M4L
 WNs18yr1H8U6RuS9ktEkpg/qk8MPFyiqcOAr5BQMTxJITvcIM9h3mqxBJEC/1f6kIzV7
 8NpXLBppWbhNGB7b9aEDJp5dfBwHx+XU7NagRZ6PyczPu5VYdHkoPj5rgrfwev64mGdE
 UiLqoiljxCOCcl1Gxlcxfi0lxxEgjBaB8hjh0i0658VZ652oinVLHOErS4uf42ogV2um
 I5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683823213; x=1686415213;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=g2O9scusjOsscsOPVpWRgKquzbX1T0zSJLwu8/vyuvA=;
 b=e/KVzlAAWt0M0dCgaSN1C64LUs8US4cL5OQkmz0dSquo4xKjxIDoSi4LEhLMRKkOLK
 esUDqH7l4U+kNq3g1G9GjC4dNWtEtOy0c+PLxZ7GZii6OYr0GaDw57nesbNnBKOZP1Ss
 lcGh4zG883Z9XeSrfyf7yoJKSYmXmVIEar4epNQd+CKPnhVAup0FmziC/xCEqA0MfrGD
 8kmfI7EFEpngnul06SrZMHPeDJ+ZWEpwWJGo08XV6F0Xsp2kGN7qlr8nZvEdugq4FKph
 liiXuqB3s5cE8Wum541KwHrnBZ/9GTFlpv7HcsfHxMqeCZTJJejQNTiJ59IbxLWM14A5
 AdYg==
X-Gm-Message-State: AC+VfDwXhF7MObfXye3Y4k0DcdVZPE7041PLr5BfqFgDkREpsUPOf1cW
 DkrOMiPl6TmLNNkk9+Ov+hI+UNV+2EMrdvfhhlsJhQ==
X-Google-Smtp-Source: ACHHUZ5Ln83K2PceRt0QwT/xMK4CO915xZAnVbgsI4SYcrWk5jymRDxobUCDUeUYNoOSc0rlmcXOdw==
X-Received: by 2002:a7b:c3cf:0:b0:3f4:220a:bbf8 with SMTP id
 t15-20020a7bc3cf000000b003f4220abbf8mr11882099wmj.34.1683823213355; 
 Thu, 11 May 2023 09:40:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b003f31cb7a203sm25898581wmc.14.2023.05.11.09.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:40:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98ACC1FFBB;
 Thu, 11 May 2023 17:40:12 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-20-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 19/84] tcg/i386: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Thu, 11 May 2023 17:40:08 +0100
In-reply-to: <20230503072331.1747057-20-richard.henderson@linaro.org>
Message-ID: <87o7mqzus3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

> All uses can be infered from the INDEX_op_qemu_*_a{32,64}_* opcode
> being used.  Add a field into TCGLabelQemuLdst to record the usage.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

