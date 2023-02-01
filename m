Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666D56862F4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 10:39:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN9ZS-00058i-1a; Wed, 01 Feb 2023 04:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pN9ZQ-00058O-CQ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 04:38:24 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pN9ZO-0007Uo-O0
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 04:38:23 -0500
Received: by mail-wm1-x331.google.com with SMTP id k16so12186438wms.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 01:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WWhof7Y4v8QHjMw6FNjNjYEHcQln3Os0Y1GE4KzFLN0=;
 b=zyvDxakpN5j0t6D3XFw6gEu6vCLgjhcXYElf3JJzidCGFaLYniyaYXvd8wUVEZH0eL
 L84IDErR5im8m0mUEg4GpbCP3JNBd5IbzzZhs9hiXCncGxN9zzVbh63OgGJtIobJhKoX
 SepryiwdkZdRTTnYZ4/lAhXVtVK0JEPfZT1gg2oiJ9esiNfkBaOpHtwr01fOeI9ExRDj
 l7+uQo/KkAAQ3bS5yHiF2NfM+pQEf4MwP1zlZs8KeubCgb05XIryUmSqWbjhz3r42sHE
 cvwaIIaz6j9bcgBEWnOW4S0HXJO/Cq9LasEuX0Z5iHxpJkFQZcSSnSJZ8tBVWcIv48Cu
 qaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WWhof7Y4v8QHjMw6FNjNjYEHcQln3Os0Y1GE4KzFLN0=;
 b=sCU7bk3b6EfkKSystHEemQeEpXvY9Wn0c32wurXBqfMtE2LrIRtxGwaOKHGOAKpjEu
 LJNMIH3cF8sruwIvFQuH6GYPrkvtKvuiMORJMbZA6CBYm/hpP6vv3QIlLoj1Flf6cSxw
 8kCeTR4swuqJuSg9dunVL3ZFSvJDHoynH47zt2v/P6cTESb4eFXrGlmnXM23VI0e2TJm
 Z40UrxqnBb7KQKsOGNTVHcXl8GpK4wmQiQKfFwY069I70j9n6ls3xhO9YgLrXeckuSY7
 ccY5HakGjrDyidEBXVpO0CLrrq0WMLG05ew7ENGEFpsWtCUDzYncWnTvTh8tBvUm8mI8
 IWFw==
X-Gm-Message-State: AO0yUKWMh93R3zRVAx30+LOxZnav7EJAEiSdl0XjP344zoNwJ77IvItr
 6U0klHCSqH9VikJW0Ma5nqsZjQ==
X-Google-Smtp-Source: AK7set82jXH7Z2v+hOezV/fDklRDdo4G2+y+t2eyyqkTCDV3z15vwU9LycJ+feFD0fkWCGddfQFNPA==
X-Received: by 2002:a05:600c:2207:b0:3dd:638d:bc31 with SMTP id
 z7-20020a05600c220700b003dd638dbc31mr1506928wml.26.1675244301018; 
 Wed, 01 Feb 2023 01:38:21 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e38-20020a05600c4ba600b003dc434900e1sm1134757wmp.34.2023.02.01.01.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 01:38:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D6351FFB7;
 Wed,  1 Feb 2023 09:38:20 +0000 (GMT)
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-6-richard.henderson@linaro.org>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v6 05/36] tcg: Add TCG_CALL_{RET,ARG}_BY_REF
Date: Wed, 01 Feb 2023 09:38:15 +0000
In-reply-to: <20230130214844.1158612-6-richard.henderson@linaro.org>
Message-ID: <87cz6tu3n7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> These will be used by some hosts, both 32 and 64-bit, to pass and
> return i128.  Not yet used, because allocation is not yet enabled.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

