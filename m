Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA960C75C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:05:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFkd-0007k6-PS; Tue, 25 Oct 2022 04:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFdN-0006iJ-6J
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:05 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFdC-0007T2-BL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:04 -0400
Received: by mail-wr1-x429.google.com with SMTP id g12so6857581wrs.10
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 01:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1oKW60iAUYoOrd0M7VF8rXHtJCEbbAd760//Vo4VNM4=;
 b=GSFpbtiw+wisWNdnFKbxYA2ThGKCO7SFUk2iWIpIkI51FrNwy7kiwcCdX3y9jPtG1I
 wfeme2SHJ4J5oeFIiGCcTVRgLJC1bk2FhmjXuF8ucBidjAV+w/nlLlH3mVnCwcr/T6eD
 cugbFKOxzPmZjM/z5ZGNu5nBGyCdufsiVfw2HG8QtDhoSLxMUucvqSsuOxskqtmvKLNU
 B2ylF+twhYpxUY/zyIiJ/9H6vFhBzzezPvxcJZ8bukYcSYAG2+aubKsEueovplahU3qk
 GAyl8+t86YYG0lSsEy0tbCgejmTEODOqnwpH353svtaANEkWtnrSgZvVzCnXx7dWX1V6
 MLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1oKW60iAUYoOrd0M7VF8rXHtJCEbbAd760//Vo4VNM4=;
 b=sGTpvrEatRJuaE+QoSTtL9henLFiibJie1smVBfqbR2Z3/f9oIa87ZAZ3dFLRrMMm/
 wTUMrshSON7unRGnF9p8m02Bfhdvbzj0YnpZFBgqubzCppQIBt1fDTpp0JkEesf1xLhp
 /Ul3fLRuc5mEeReckGQcKgfiN8ABC22YDo/N0cI2hP4ZHZJVy4v3P+LtgBPHenr7f1Zs
 DhP9XNnsmluYPa2Rc4rJSLgTVJJImtUlccPc7Aw1v8j2IRPkw9FN7OElHIYvsQpNe7ly
 bw2zuCyPTd5whhGBRR8BuXcSBOCUuZqobH3gTVWoX4HfKq4a3wwX7XsMWgl419mfNmuF
 2JcQ==
X-Gm-Message-State: ACrzQf1R9xmn2ksVK+6CIWQwZ+/y/hq9mXEyAjjLsrQMKwLxxKB85TIL
 y59ygPeWa8BKjuJ9e2tGRY8l4Q==
X-Google-Smtp-Source: AMsMyM6I9D17e456s52ActF3lTz42/Kr3VOHg6pyQj8a3zTdbMlNIAOIS3mut1l4pbRf6JjsObw1Og==
X-Received: by 2002:a05:6000:1c2:b0:236:6e69:db3d with SMTP id
 t2-20020a05600001c200b002366e69db3dmr7360085wrx.144.1666687781943; 
 Tue, 25 Oct 2022 01:49:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c425400b003b3307fb98fsm1905380wmm.24.2022.10.25.01.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 01:49:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D9131FFB7;
 Tue, 25 Oct 2022 09:49:41 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-6-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 05/24] accel/tcg: Split out tb-maint.c
Date: Tue, 25 Oct 2022 09:49:33 +0100
In-reply-to: <20221006031113.1139454-6-richard.henderson@linaro.org>
Message-ID: <87czag8eze.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Move all of the TranslationBlock flushing and page linking
> code from translate-all.c to tb-maint.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

