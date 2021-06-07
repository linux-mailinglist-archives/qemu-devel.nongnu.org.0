Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE239E79F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:39:52 +0200 (CEST)
Received: from localhost ([::1]:34000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqL6F-0007S1-Ej
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqL4s-0005CC-27
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 15:38:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqL4p-0005KY-Dh
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 15:38:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so355168wmg.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 12:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jwzinfTO4lfFDUVnW0Smnnlxm9fGMekxeI5wBEJkEbA=;
 b=CxnPwoU9pq2bgm1qysqhLZGkQF28u6oEE053L9cJOd/3odXwQd0FwWjIeJbiSNxAyO
 NlU37tekSoOjA2LA0HPnR3yo0rhYRmuBrwJGSs37FpxMGpGX5VNPT37xQqEamJvxhQsI
 /O5C54jO8T1zrfqR5HBTOD/2TRo/U9ARIfu0DwhLEWBNJ8HlNaX45JL1OFzHmPP2Ni2Z
 r8WsYeZNOS0MVeugrVKj9VtBFW78VbKKnJqv0khCDmzzTcGFjt9x93fY1X1mGjukY9TT
 1CI1/82ISxoLWtR3Tr+WgzT0LI9beVV2h3D58OC3cv5JLx+jcTNbqtUuyJxVqqWXrd8I
 mO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jwzinfTO4lfFDUVnW0Smnnlxm9fGMekxeI5wBEJkEbA=;
 b=JR8eLhueCLLi0+O6/urMycP+S/iZghR25ZPrl5UkReJBMuZFY6QJr8UN5G1dv9ljRv
 Ap+3DttDJEXl68rG4hDQpQ1cd4oEfG1F/FYbWIRPtfDOaZMD2AY0Fu00pZ1REUdnPYLZ
 IwM0txhypjebZyqGujLDORwreyXvVnEJRX7hoGDn8p31fJLsNB7M1QZeKCz1I60wWwH9
 qTibCb9JCIeXvMbxFnjCqDwkgsv0PdR3BLMvoucpbRHyCPilQPlnvIii6FV9vPxekBAa
 TCkgVmfKjTPjt4XJXi5lPXTqxr09YITfAxYrWOx9T1P+0SBiUA+sI4mUGQ2G9ugUYb9g
 O5qQ==
X-Gm-Message-State: AOAM532e6LDQSrBlfEZaea7u7YNQMCqDVNjAO5c+8HubmtgbNbSdu+oH
 JSZnqN9dVYlRyWxRcLs3XJ0f/RPxFg8f0Q==
X-Google-Smtp-Source: ABdhPJwgAShiORoatMm0rOGJgnQSM8B5vO6/BixLSBypmSt2fpuUmIzbqySWVr70XmwG8gNFJOu8fg==
X-Received: by 2002:a7b:c849:: with SMTP id c9mr662607wml.84.1623094701809;
 Mon, 07 Jun 2021 12:38:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b188sm630390wmh.18.2021.06.07.12.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 12:38:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82ECB1FF7E;
 Mon,  7 Jun 2021 20:38:20 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 02/28] meson: Split out fpu/meson.build
Date: Mon, 07 Jun 2021 20:38:16 +0100
In-reply-to: <20210502231844.1977630-3-richard.henderson@linaro.org>
Message-ID: <87k0n5mpn7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

