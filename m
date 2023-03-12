Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DCC6B6BF1
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 23:27:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbU8w-0002Cy-Hz; Sun, 12 Mar 2023 18:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbU8t-0002CJ-Tw
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 18:26:16 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbU8s-0001ul-B8
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 18:26:15 -0400
Received: by mail-ed1-x534.google.com with SMTP id g10so12701201eda.1
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 15:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678659973;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L8qIkZZGxy+LRn8oi7XajbXy7vQKiqhBHGDgHBmfaDc=;
 b=bnXUrW7Bpl/JGtIRgxFL/U173smZ1yLlaxbaGf/Up5aesfm6TbvoDH4SQuhewlLjrn
 OZXofdnvf7GbImNGbe+84eihD+4hfQvZq3Xw8o79B62cebrcMoHe8Y/8YaTjl30dYL9R
 8ZUOqBXiabYVSZ+fpHwd3rTPL7INEdWoQAXvuHBuiBabEYml1NVx579SJ3N1p1OW0vyt
 BSP1kYxDSO1O2R8/I8LTLIUkRUonWyZPNmVk2WN4oZ5g2nmo/NtwJ+ozh4TAxbm2OFLi
 NG+X1iaGG021l5/DVc/dHmkyfmq9jw8NqJSHsEiQsyAESyTCTgVT5SIW2IpjzrAt8O1n
 YFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678659973;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L8qIkZZGxy+LRn8oi7XajbXy7vQKiqhBHGDgHBmfaDc=;
 b=s6uwDttGFA2wIBRnNzzRvrulxneHS3SbN1kDdFVk9f/LamuIB4FgeDiGKXg9LcF4XU
 DnUXphPLygmyGo8iB+aJxtgN8HKB5lvs9bJ2KQiDAGy01q3poizFflSl8aA96CLmd4ae
 x4g+XHXCjLPtDbNoQoXUStUvzsSjjJnhQhAXLIHnd/ZzL5tVYx6WOuBEBwO8eizC077T
 N4mN8T/Xf2T5PhOi5xgT5WYKUh384iZOLLJcADcHolmf8unKg/cg/RdrYkmeu5dZfVej
 wCGb1xpHqw3NeqeqFfbpv0AbhZMl9FELm1ZsISJu9Bsq8NNvDhBk+8jMozVus9ZKZipH
 Hr9Q==
X-Gm-Message-State: AO0yUKXXqO+RGRLV/gFmlmW/LX6TuJi1HJasEQavMrsbluT3U3O0GnLg
 gBgwGMsOjS5AcMvTXxeNmqU=
X-Google-Smtp-Source: AK7set8PdoiyjWhKKcpVpF+VUxOAiZlrha9QuSJ0GRL5DTUAYhb8mhaoOdtRheyGjLVefGMzt2Dl5g==
X-Received: by 2002:aa7:c056:0:b0:4fa:eccd:9849 with SMTP id
 k22-20020aa7c056000000b004faeccd9849mr4150624edo.9.1678659972673; 
 Sun, 12 Mar 2023 15:26:12 -0700 (PDT)
Received: from [127.0.0.1] ([77.13.79.143]) by smtp.gmail.com with ESMTPSA id
 ee25-20020a056402291900b004fb30fc1dabsm1461076edb.96.2023.03.12.15.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Mar 2023 15:26:12 -0700 (PDT)
Date: Sun, 12 Mar 2023 22:26:05 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
CC: Amarjargal Gundjalam <amarjargal16@gmail.com>, Bin Meng <bmeng@tinylab.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: Re: [PATCH v2 09/10] contrib/gitdm: add more individual contributors
In-Reply-To: <20230310180332.2274827-10-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
 <20230310180332.2274827-10-alex.bennee@linaro.org>
Message-ID: <5ECCA8A5-58ED-426B-933B-0602FA32FBE9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 10=2E M=C3=A4rz 2023 18:03:31 UTC schrieb "Alex Benn=C3=A9e" <alex=2Ebe=
nnee@linaro=2Eorg>:
>I'll only add names explicitly acked here=2E Let me know if you want
>contributions mapped to a company instead=2E
>
>Signed-off-by: Alex Benn=C3=A9e <alex=2Ebennee@linaro=2Eorg>
>Cc: Bernhard Beschow <shentey@gmail=2Ecom>
>Cc: Amarjargal Gundjalam <amarjargal16@gmail=2Ecom>
>Cc: Bin Meng <bmeng@tinylab=2Eorg>
>Cc: Jason A=2E Donenfeld <Jason@zx2c4=2Ecom>
>Cc: Strahinja Jankovic <strahinja=2Ep=2Ejankovic@gmail=2Ecom>
>---
> contrib/gitdm/group-map-individuals | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-ma=
p-individuals
>index e2263a5ee3=2E=2E0e4618f1ce 100644
>--- a/contrib/gitdm/group-map-individuals
>+++ b/contrib/gitdm/group-map-individuals
>@@ -38,3 +38,8 @@ paul@nowt=2Eorg
> git@xen0n=2Ename
> simon@simonsafar=2Ecom
> research_trasio@irq=2Ea4lg=2Ecom
>+shentey@gmail=2Ecom
>+bmeng@tinylab=2Eorg
>+amarjargal16@gmail=2Ecom
>+strahinjapjankovic@gmail=2Ecom
>+jason@zx2c4=2Ecom

Acked-by: Bernhard Beschow <shentey@gmail=2Ecom>

