Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B488669821C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:32:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLdc-0007iJ-Vv; Wed, 15 Feb 2023 12:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLdb-0007gl-Fk
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:32:11 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLdZ-00082H-VC
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:32:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso2114598wmo.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kf1C8CrXEBma0QsNPJ5YqW2c+PrPyXNm/UJr9gahaxM=;
 b=d/4F4boeCwYZag983GJvhrD/TGXxX5XYiNOpUGty2d6ljEe6kRj/PjBzruFMi6z6ra
 8dDv6E/Mm3dyVk5Sa1xRQOujh70+oq1NIfVftvNzSIfTnfKS+AvtnF8VHzBSPjAs6cEA
 U1bpzuqM/DNpoa+w+m41EIioFA+CS3POhMnMtBlcwSQ/+crfvjjUYFB+4joRhSJVjxKV
 ZBSlbqPSOoubJCFZ3IaVcs1SCDTtN00Nt86v5rjrWM9KtSTUYMGwkDIXeqpvRvfWuQw0
 98gu28V+ifRyS5BDaZ5Ils3UFYnGsd46dXHmv6mnAn5rgGiEWf6uYf+O7cinyldnN8Xl
 BHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kf1C8CrXEBma0QsNPJ5YqW2c+PrPyXNm/UJr9gahaxM=;
 b=NPMdqKukNrrWMDADX7S0TCWk8JLC9OOujJIELf938wTJdGZI2q8E8GzX5yFriRlZN5
 XZ1fT/sXPVT1JQ9Bx/UMLQg7eiAqBB4fQJ9+LAQUS+Qd0xYKxmy5JfP255GadjtYsGWJ
 P/1jaZJ/ApV4dVGEHi2jd65LIxtIgrdSazJ5M6ZyxZrqbQ+JENgsCW0lg+/a22LUOljJ
 8JHelNkfwy31o1Z+54gq+Pcm71wQIkBbcwCeGwJB5tAW66gV1ZYFvBoIV4RrB/fVoCi5
 m+w/H6nI8nWFQ3eTyipPushgHyJEq8iORI3crV/VP3Wkn7YQBKW5y+ldHehPz619XUl4
 ma8g==
X-Gm-Message-State: AO0yUKX5A1DMitJkAbzA/i9FAb6UKQL46lr2xQJ1sYo9hmKoc8hJO4F5
 SNzOqsv2HUKcZyDd1j+Wx5jjaw==
X-Google-Smtp-Source: AK7set9tQRc90p3FBuUZKeO1fuK3vtNmifzHBdtwxT7cby+PeJlGbnBFfnYIQeqlM5CkziqhlNN5iA==
X-Received: by 2002:a05:600c:474b:b0:3d2:2d2a:d581 with SMTP id
 w11-20020a05600c474b00b003d22d2ad581mr2618643wmo.30.1676482328055; 
 Wed, 15 Feb 2023 09:32:08 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b003e001afa274sm3105822wmq.2.2023.02.15.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:32:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D5D51FFB7;
 Wed, 15 Feb 2023 17:32:07 +0000 (GMT)
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-4-philmd@linaro.org>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, John Snow
 <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Magnus
 Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 03/20] hw/ide/mmio: Extract TYPE_MMIO_IDE declarations
 to 'hw/ide/mmio.h'
Date: Wed, 15 Feb 2023 17:32:02 +0000
In-reply-to: <20230215112712.23110-4-philmd@linaro.org>
Message-ID: <871qmqal7s.fsf@linaro.org>
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> "hw/ide.h" is a mixed bag of lost IDE declarations.
>
> Extract mmio_ide_init_drives() and the TYPE_MMIO_IDE QOM
> declarations to a new "hw/ide/mmio.h" header.
>
> Document the SysBus interface.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

