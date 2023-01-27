Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635AD67E721
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 14:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLPAq-0005w0-Ji; Fri, 27 Jan 2023 08:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLPAo-0005v4-PO
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:53:46 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLPAn-0004m0-62
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:53:46 -0500
Received: by mail-wr1-x431.google.com with SMTP id h12so5022562wrv.10
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 05:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+XMTZhQF+TZEKGK4m++h6a815EX2DCtr4KtEiGguLNE=;
 b=EC25NrHyqlJ9o30jG+dylGLvOwDo+b2W7dYSDUE6gW43unO98cBu/FfZMv+gA+ujCg
 yEhtUoCzwKV0i2TVbvKGQuRfLp76RId5yZb3IvJvXDytlE4/UykZuaJ4Jw8OjsKYJGrz
 CnzmZ0QI++j21BAwoFe58Uws5zJ0uLWcsPNlyj6p/XCJNJcgsH12STl20V3ZHZTjKXGL
 chEywogB4iKgbj4jdhtx6uiYZ3lK7o0T4AG4EHnKmN+t4LhIobwNCGu9gNuotLaPkiZC
 Ki7mEDxhb67mqYu1aVq1mEk4DSJlFmHR//NexXEApKiwrQimqciVQv5tGpNYkxEgSi8L
 eqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+XMTZhQF+TZEKGK4m++h6a815EX2DCtr4KtEiGguLNE=;
 b=m2J3xfCsC+zKw0wQfhJHTKL4mBm/sA67ru5+pEFe8XoWCuEfIShJiR4iVD9InmC8kJ
 kGi7SC5VhC9j5ZKcrcOXEF+Chs3Z0vd+21UglpdKok2a6n0McWkKSXp9Su/sp+1TifDa
 V3xqhQTKFcO0cbqwauOomCdMxlfuUva6QnJRuWsqBcC/gyQrnbcUAeZ1ASZXBzH6WYa5
 XKUHeutRKMQzvZ7UqEj/n7JGzfJuWsILBpcm8HMct7zSQvOTJyJs6hwFShEEukiz/rN9
 klEtzKqRXQOe5bNgTCfprX3aDYCRC/dbjn8XvHZxm17ttHTcb5mBKQIuwwMfl1SOrooS
 WFaQ==
X-Gm-Message-State: AO0yUKWpPQ/GW1K4vSFMDx2SGXiNPh6dXm1EAsL8wtPPcxU3uehvp0Bj
 GwGJ4jt3fpwkrO/tuLC0vqHJpsxOzTsuA5eq
X-Google-Smtp-Source: AK7set9dbDOu3Qmg61ptaLNbOO1+cxXIGIe7YzViNZKwXf+6jqTzZTXY04q4qOWhj2Q/fzUpCRbr3w==
X-Received: by 2002:adf:f687:0:b0:2bf:d893:750d with SMTP id
 v7-20020adff687000000b002bfd893750dmr74763wrp.66.1674827623379; 
 Fri, 27 Jan 2023 05:53:43 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a5d5607000000b0029a06f11022sm4035017wrv.112.2023.01.27.05.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:53:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A497F1FFB7;
 Fri, 27 Jan 2023 13:53:42 +0000 (GMT)
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-11-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v5 10/36] tcg/tci: Fix big-endian return register ordering
Date: Fri, 27 Jan 2023 13:53:37 +0000
In-reply-to: <20230126043824.54819-11-richard.henderson@linaro.org>
Message-ID: <87mt64nkwp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

> We expect the backend to require register pairs in
> host-endian ordering, thus for big-endian the first
> register of a pair contains the high part.
> We were forcing R0 to contain the low part for calls.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

