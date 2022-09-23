Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A4C5E7C18
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:41:22 +0200 (CEST)
Received: from localhost ([::1]:37662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obivg-0001bS-E4
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obitq-0007YK-Qh
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:39:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obitp-0000m1-4k
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:39:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id n12so28515wrx.9
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=dOxBhRb6RdNphcQk4v79EVathJVHkFOc86AgqdU641w=;
 b=ZiGaAG9W/5nh2YSiaZfcUKUPCG2bzHrTHibdFw7jRdXhDxDZK7nIwsQIUwBprlPXkH
 5SC77tIBS83n/YwlHv2SmOG0g3YJUl6D/x7a2wbLc1Vlwo+yGJ6AvKzG4HZ4kEypJ/HX
 O2zeoO0J6/rlQP2PLC7K6PLsfNsNjdQoh6vJUKMYrJbZkhsKRKz/2VN0ZYbxauCJuyni
 tvxmoqe4RtJ03kjhKP0344aS0S1TFxS5liAWmm5Hp1tDf0W2AjfITQUY3B+63bjLcRjC
 uWr3IqOrHW7ewdANvzGGC3RaoFWh+9gNI2AfEJzAcRuFcrknM/rauMW0uBpbiCSDQjPv
 pLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=dOxBhRb6RdNphcQk4v79EVathJVHkFOc86AgqdU641w=;
 b=Nd+GL9kCgo7BS8j7E8qDTLhiP0l13s/BRG0BoahnzspxlXGWSPelq9Y7oz2MUkoLbK
 YAS+0JqIte3q7Wc/nXeJDhxpsofONDrDs8N9l34xL5rmTBKfdIjRDPdNGk8PXe0Ach02
 l6kwyAoA5SWKNo2ajAun58beM7T7VV5Hrwibz7XoljoewyVHvq5G8dQVhadjFAvI/7Zw
 RuOgg7eN720WkvklSmIOamyu0fQYy1XgFQ+IvG0jDlpvxRHdYqs/P6PPyJMlWR/YqugP
 CRggdBS/En6ZfXoIzUhjo28Fvd6/3oln7evgaVqG7AvcjKKCNpj2qD9mHn21hi1TTaou
 SoBw==
X-Gm-Message-State: ACrzQf0JX0zAESXWC3AfQ/NzFAMo8nZZxg14sVJtnaqSVoQ0Q7ubk1Qd
 coYwAj/T2lgfw+EVLD740SmmHQ==
X-Google-Smtp-Source: AMsMyM7mvM4W6UK4NFk01PPS/N18eChrhuZiepL/Y9hOLuqUzwR2P3F4C75SSQh0g3sxlq1iE7BPyg==
X-Received: by 2002:adf:fbd1:0:b0:228:6406:23d8 with SMTP id
 d17-20020adffbd1000000b00228640623d8mr5270229wrs.45.1663940363394; 
 Fri, 23 Sep 2022 06:39:23 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a5d5953000000b00228c792aaaasm7463163wri.100.2022.09.23.06.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 06:39:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D05261FFB7;
 Fri, 23 Sep 2022 14:39:21 +0100 (BST)
References: <20220804115548.13024-1-anjo@rev.ng>
 <20220804115548.13024-9-anjo@rev.ng>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, ale@rev.ng, babush@rev.ng, nizzo@rev.ng,
 tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 richard.henderson@linaro.org
Subject: Re: [PATCH v11 08/15] target/hexagon: add flex/bison/glib2 to qemu.yml
Date: Fri, 23 Sep 2022 14:39:16 +0100
In-reply-to: <20220804115548.13024-9-anjo@rev.ng>
Message-ID: <87fsgiw6pi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Anton Johansson <anjo@rev.ng> writes:

> Note, the glib2-native mapping exists separately from the normal glib2
> mapping. The latter uses a `foreign` cross-policy-default, and
> libvirt-ci is not able to support package mappings for multiple
> cross-compilation policies.
>
> This will probably change in the future.
>
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

