Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553363E088
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 20:14:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0SVq-0006Mo-GR; Wed, 30 Nov 2022 14:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0SVo-0006ML-5Y
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 14:12:52 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0SVl-0003wC-Fn
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 14:12:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id g12so28670477wrs.10
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 11:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cL+sRGZoTKHb0lwPFPXUuo+Os+NnC5WeFz385BhT+s8=;
 b=spNNc+xtM9EzDnRZyT2d4FeTHHr2zjevFmoTYW9DXwDjGmmEtfos+NltQeS9AGyVpN
 3yohIeDxM6c/GUx25wcCu1yAq8L5WChzy12jopZbi+UFerqqNGtWNL1W1JsE4qDXvF8n
 u5QLHO1byHXOd+FfZWhc+Or22ERGhcMaeZIfsFNqbZ/2ljJ8qQwQvooVIqLmA+fHj2+0
 E7gkZvnH9wtN4LGpmEvAO9YHHQ1lnnoijxLkytw1FT+z+whzNQMBTrOGLbpwK32FRh3A
 Dbb9hPqkXRQdaWWU96O5RcA+1iIVyXM/nvEWBkwcv2BB8R8sVv3IWpQeK/7/bssiLPur
 Hggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cL+sRGZoTKHb0lwPFPXUuo+Os+NnC5WeFz385BhT+s8=;
 b=I1oDrVsIuvfK3UPWsOwVZKS78FTJwv4FznEX/lvaBe8hiRgRTp6VKG7kZlRlMIG6jN
 6d/gbfKYUC+WwHZQnU4ZwTWJiS9YBtVGNiGufrLusRQTJQAlSUG78KrCfeHMEuLs92LV
 emJt3H89irHTTQE+KUN5zSZzOKWOrhNEncmFa3WI4DevOx8cmuftaAe3IWm6xY4yY0XP
 +zAknVaRf62T1WqfYSCMGsJH4LGyIGl2XDH21d5HlkUfy7XGql4oUo/8S1BNqxMtbpTg
 ZHoM4e4wIbuS8dx/f9kLcOfzCY2bZ5Mwo75rQzTfLld2VzjGOk4j8c4nX0H4t1A6Arr9
 a0ZA==
X-Gm-Message-State: ANoB5pkI2TtejKobildpX4Eedxzqrn8kuVtQMdSRoZZRwCPdmRTq+neK
 UphWiAPOtqcKhA/awUc3IY7aOg==
X-Google-Smtp-Source: AA0mqf5qaS6ryeTUichC9Ih12EsOGCsAXXyjvCm5sc7p1kR0oxyysGZml0pV0qRHtaLtH/Gulo+G6w==
X-Received: by 2002:adf:dc85:0:b0:242:2ae7:c0cc with SMTP id
 r5-20020adfdc85000000b002422ae7c0ccmr3094845wrj.577.1669835567478; 
 Wed, 30 Nov 2022 11:12:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c310d00b003a2f2bb72d5sm8149292wmo.45.2022.11.30.11.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 11:12:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C4C21FFB7;
 Wed, 30 Nov 2022 19:12:46 +0000 (GMT)
References: <166982763526.10484.9925072056712598801-0@git.sr.ht>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: ~axelheider <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 daniel.thompson@linaro.org, ~axelheider <axelheider@git.sr.ht>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: make second UART available
Date: Wed, 30 Nov 2022 19:11:21 +0000
In-reply-to: <166982763526.10484.9925072056712598801-0@git.sr.ht>
Message-ID: <87o7socl3l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


~axelheider <axelheider@git.sr.ht> writes:

> This is a follow-up on older attempts to make a second UART
> available for the arm-virt machine in normal world. The use case
> is, that this give a simple I/O channel in addition to stdout, as this
> simplifies various test scenarios. Especially for non-Linux operating
> system,s (e.g. seL4) where arm-virt is handy as a generic machine
> for testing purposes.
>
> There are existing discussions about this topic at:
> - https://lists.gnu.org/archive/html/qemu-arm/2017-12/msg00063.html
> - https://lists.nongnu.org/archive/html/qemu-
> discuss/2018-11/msg00001.html
> - https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg01613.html
>
> This patch tries to address the concerns raised there and also
> avoid breaking compatibility with existing setups.
>
> Axel Heider (1):
>   hw/arm/virt: make second UART available
>
>  hw/arm/virt-acpi-build.c | 12 ++++-----
>  hw/arm/virt.c            | 55 ++++++++++++++++++++++++++++++----------
>  include/hw/arm/virt.h    |  4 +--
>  3 files changed, 49 insertions(+), 22 deletions(-)

It would also be worth updating ./docs/system/arm/virt.rst to document
this feature.=20

--=20
Alex Benn=C3=A9e

