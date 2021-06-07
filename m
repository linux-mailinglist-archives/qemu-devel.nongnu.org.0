Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F306639E5F9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:56:03 +0200 (CEST)
Received: from localhost ([::1]:53990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJTn-0006JA-1e
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqIvl-00074i-PG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:20:53 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqIvg-0000Qs-PH
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:20:53 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso152920wmi.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SLm0vW/OirZ0zkzxBTAqwrO3Zyis9xnqm+BWXxoFCrs=;
 b=gerL5CHV3KcPb6Qhuk3831D1bBFRLhTyEy7s0uLWuJ1Zwk5sJ4Y2Wm4AbpwpZ2DXIL
 OzhOVwXA31FFpkyt1eydzc8ASzMIGcqttFPvJ1N8dBCzoeJWwxUR2IU6qCFlJgDJhHx+
 oy55GlhwWTyuXjfHn/GURBuw2ng2pdS/H4OjPz/u3kZalplxCKmM8VS8nJOOserYSYDx
 6qyVjB3htJm534/QcZt28u1UTdxSYbgcYNNWAKzRJEubAy2Yadap1gPDU11ON14EgsC8
 vHKag/X7yJ2n3D8hGDZIvF+x1CR0/u67Yx1+U1wrgUUAkZNwe8IRblh7K7YJ8U9+tD31
 UAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SLm0vW/OirZ0zkzxBTAqwrO3Zyis9xnqm+BWXxoFCrs=;
 b=lMl85A8wdmLErlprjinQimgGEFuETCrvpYeg4ygJdD/Zn8IpV+ecpGMHehsiN1rXan
 4MX5wwYFHrRzJQW8E8RhAwbj33HkaWOY0MpJ/I8nrQ4UeIBTQbExg+zXiM4Iyn9dRUdr
 BDILoK+oE60TCCU/fWeEM54qZBSAyXZ3/HD2QwBp83CM+i8UIWM5GuTtWuvXk0smLnhc
 5BngtioUyVebHUzGoSgWg90EgXJKHnbmBAA1AUXnq9XGmdk+iju9p3vpOChoodL6VtOC
 mKChFxfBg3Jkfd+sAw3Cii2iO3a9JF0eGmhnMQNx7xMdlBQwji0hjwOKEE0mfOdXVwEB
 UHdQ==
X-Gm-Message-State: AOAM533OYDm2zajrz/U+fwwrt6s4sjNM9o94Y11JHLdlgkuyskExoM55
 nulSyEI56uzj7DxqsLbqH1EZ47sDwLMR1Q==
X-Google-Smtp-Source: ABdhPJxsBANHf14SrooCh0M2Mc6u7E505vFhWRPLSTtv6c0xezCrCbw0WfSi15Oxz78zBmFYAFhcmQ==
X-Received: by 2002:a05:600c:5122:: with SMTP id
 o34mr9884472wms.168.1623086447262; 
 Mon, 07 Jun 2021 10:20:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y26sm8026148wma.33.2021.06.07.10.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:20:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C2BE1FF7E;
 Mon,  7 Jun 2021 18:20:45 +0100 (BST)
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
 <871r9dod1w.fsf@linaro.org>
 <31a70d8a-0b1c-9641-e2bf-3625690fa6b6@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Date: Mon, 07 Jun 2021 18:19:17 +0100
In-reply-to: <31a70d8a-0b1c-9641-e2bf-3625690fa6b6@linaro.org>
Message-ID: <87pmwxmw0i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: mmorrell@tachyum.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/7/21 8:35 AM, Alex Benn=C3=A9e wrote:
>> So I'm guessing Emilio had the original flush code split was to avoid
>> multiple checks against s->flush_inputs_to_zero in the code. The was
>> possibly a good reason, comparing the before/after of float32_mul:
>
> I assumed that the most important thing now is that we test
> floatN_is_denormal only once -- the test for flush_inputs_to_zero is
> fairly trivial.
>
> If you've got a better ordering of operations for this, do tell.

What I really want is to know which instructions translate into the if
(s->flush_inputs_to_zero) and verifying that is only checked once. Maybe
I'm just suspicious of compilers ability to optimise things away...

--=20
Alex Benn=C3=A9e

