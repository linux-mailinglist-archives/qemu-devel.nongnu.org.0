Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE406A3FB3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:50:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWb5E-0004gi-Tm; Mon, 27 Feb 2023 05:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWb51-0004e9-Gd
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:50:07 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWb4y-0005gQ-JC
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:50:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id p26so3919910wmc.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 02:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbLMhSt3yU8Ef6Q8oVEiz3A7CDdXqwIxhjVTphTA+rA=;
 b=osy9mg3Za0TOd/fbnkgdF8rYgX2PhHjFeLnLm517nkPnv6KxNJlOBdekzEd10BnEHF
 AV0GhvZ8kWhRv8KEAttdpthCymkb+OgrFAhAEXfoy91ag6P79tTcN+vnErqcqrcQ/s2E
 MJqf3OKUZBDXD1X+cgVidJVJ108DLZaaiuIowIGPblYgALBR8IGA04x4Rd74w/kABWgc
 b7gEngOzUMYBhDk3a7wrp5pyIFEvoKYpWa1FyiZopu2sN2KKkgCf42bjrFV7/gzEV5Ws
 XB30D3lH9pVATi2orgJsWRMzfUS5QB2slwlYyxxhD4mvAiH7IVT+Qgcm2VnPv2pgtBMt
 cGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JbLMhSt3yU8Ef6Q8oVEiz3A7CDdXqwIxhjVTphTA+rA=;
 b=BKISx8ISbePHnobgXxcWp9bZKjv7RoMAfHNceNtHj3aqxqyxBtEv+lmKeO+yOs4LSd
 /GFCDYL3CllYW6V3jC0bPRpp9kEOtYUGKAH32IhAKUi/h3OweEp5kQS+Xe67lf0xFmQj
 nDuze1TPo/zqKky+76ApP57UV0+PQqecPjEcIMxdsfo8ox70r8xbmj9jhqTi8ACk32oK
 2dO1MHo+Vm9a5cIHwpS8/qZVMpzZ/oTbF2DXNjXNDjPPA+I8OV9Y5dm/MEqnkIZguFLM
 fwLx1+8LanpPmDB+34PXl5FYMl+AMCAmhpmzkmBMUMpJAgcFSPLHdJ+R9T3gciFvtnM9
 nYwA==
X-Gm-Message-State: AO0yUKV0d8RSz07ZM0GKV1OGuZuaBAre+oUt33gN3FYSFephS8Nfvih+
 HIlJQLvo1R5RaPpWrqF9wb6jCg==
X-Google-Smtp-Source: AK7set/V1CEOl5MXUzhxDrLATNHhXT9XLzzn19UQ9lqWCoEaGMJIhGYY0GyDNhrkM69paUG/NpXDZA==
X-Received: by 2002:a05:600c:32af:b0:3ea:ea8a:a94a with SMTP id
 t47-20020a05600c32af00b003eaea8aa94amr9673522wmp.27.1677494998537; 
 Mon, 27 Feb 2023 02:49:58 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a5d5267000000b002c8ed82c56csm6744383wrc.116.2023.02.27.02.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:49:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B57711FFB7;
 Mon, 27 Feb 2023 10:49:57 +0000 (GMT)
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-3-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, John Snow
 <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 02/24] hw/ide/mmio: Use CamelCase for MMIO_IDE state
 name
Date: Mon, 27 Feb 2023 10:49:53 +0000
In-reply-to: <20230220091358.17038-3-philmd@linaro.org>
Message-ID: <87zg8zidre.fsf@linaro.org>
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

> Following docs/devel/style.rst guidelines, rename MMIOIDEState
> as MmioIdeState.
>
> Having the structure name and its typedef named equally,
> we can manually convert from the old DECLARE_INSTANCE_CHECKER()
> macro to the more recent OBJECT_DECLARE_SIMPLE_TYPE().
>
> Note, due to that name mismatch, this macro wasn't automatically
> converted during commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE
> when possible").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

