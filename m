Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE4466018E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 14:52:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDn8K-0002DA-LJ; Fri, 06 Jan 2023 08:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDn85-000297-0J
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:51:29 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDn83-0006aq-Co
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:51:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso1099472wms.5
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 05:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krIha8f9CWT0wQrBqCDHacga2WtNxaiH0mnicRc3Asc=;
 b=Ma8Fx7tDvP4jHIXQf1E34SKVOr3rGN2IFj+v2npvMn//RV9Jp2mNPahcHmX4dLm+SS
 Mb+grouQNgbm4DH3hoTsgWryAsrO2AT+AEE9EGHPXf3gGcdnCU0j1ufRjMgc/w/Q3RVC
 Afw4JPpmQbw15x436+3BfRQ1Wh5HdVRWpPpkYzbSl1qMDF0T8gIIC0RIlyX4GeRsebQb
 CQhx0Pfhut3ls7ApVN86wgbJEi68VmmVAiiz4i651lGN+CQsqSmrt4qjZkZfdHVohyAg
 MK3hhg63r0+HTWf6f9nq1XEdcZO40eUVF56BltEIi41XPSn1BVTt+RXF3RqmGin/nRj6
 ftmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=krIha8f9CWT0wQrBqCDHacga2WtNxaiH0mnicRc3Asc=;
 b=3BqWhqzXyM4LeHzSL7h7MIwfpz09Y8pRYXLhSBUOMKA95RlzY+esjQd6BSgUm4kw4I
 KgWz3haWZSHZfpc4YSWxfIvD/F8epRJZPUa4P/MHWi8Yx1fu9OsGxJxAKUUf9YJwTCyR
 ec1qKdYBOWQcps7vHOS8+AZBqFosoqSkCm6Qh7UWA7WDoGWYzhDp8oaeD7UQLBfaCB60
 bOeQ5ChCrRpi+T8XS2mtajElSuMn3GA3TQqCc13pppykrDjuBgTt+6zIbLAvYCGGvaN6
 84HrtzxetW4vVlZ2XRdi3KAgxMZFcYfZla3HVBZsXsGfovNzvy18r8IgyYf6l9Xl0OmC
 ZR+w==
X-Gm-Message-State: AFqh2kpabo85l3uRVrlIASraCYT6sG853MtKG6sFGKk+Z2FZWlNOCuHQ
 FBBu69wlDk0sbw2zMIXsYFDfGw==
X-Google-Smtp-Source: AMrXdXvOE+/dRiajgQnpaJ7pPQfsQU+knhezOo3EByxdbfuKCdr4D5NzPs+SUbeEqplXLN2sPqD44g==
X-Received: by 2002:a05:600c:3b2a:b0:3d9:7950:dc6d with SMTP id
 m42-20020a05600c3b2a00b003d97950dc6dmr29071434wms.40.1673013085556; 
 Fri, 06 Jan 2023 05:51:25 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a05600c0ad200b003d9c97d82f2sm1824941wmr.8.2023.01.06.05.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:51:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9869F1FFB7;
 Fri,  6 Jan 2023 13:51:24 +0000 (GMT)
References: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-devel@nongnu.org, bmeng.cn@gmail.com, philmd@linaro.org
Subject: Re: [PATCH v2] semihosting: add O_BINARY flag in host_open for NT
 compatibility
Date: Fri, 06 Jan 2023 13:51:18 +0000
In-reply-to: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
Message-ID: <87a62vpy8z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Evgeny Iakovlev <eiakovlev@linux.microsoft.com> writes:

> Windows open(2) implementation opens files in text mode by default and
> needs a Windows-only O_BINARY flag to open files as binary. QEMU already
> knows about that flag in osdep and it is defined to 0 on non-Windows,
> so we can just add it to the host_flags for better compatibility.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Queued to semihosting/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

