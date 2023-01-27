Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B7C67E71C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 14:53:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLP8q-0004c9-Ml; Fri, 27 Jan 2023 08:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLP8p-0004by-4w
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:51:43 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLP8n-0004Ut-EQ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:51:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h12so5017235wrv.10
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 05:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJLI3EKVzySsj1W2B7b0Hx5IVsnSD8qm2kGpGqIXMI4=;
 b=FoaBhhP4foC1PmFS9tL3stEbtkz8H/fytA/Jmh8V43M9xM8zHyK80fAumOpaBLNUIm
 CrhfLdbkb1LibsfOXTYLLq8dfxvDL/rSwk7bXq3zcheWXhPfzBj5NK8EO9JoNcvS+u1Z
 CLt1W46ze9vqn79yZgl3VDbZgd0LiHqh1PhIBnRzHrg8CYTKvAMOdULT82QtmGPbsFia
 vbNkPZsWFeOtmJva3tbR8g+yd4ks31j6en+pBfpkJW46+j8r7KUckloN6XsOIhYhO1bu
 p9lV3zX4VxNfu9ww2qke+QGQPPHpm323CwbUO7kWUg6SCIE21DxPi6Mymy4YuAuOaxJ9
 cA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bJLI3EKVzySsj1W2B7b0Hx5IVsnSD8qm2kGpGqIXMI4=;
 b=rABwRZQvzZF0Ak2cZ4drHosyhPxta14keAoAJZj8Qz1AW2ubsiSsAYqhmbtQkJ1JWd
 1FWHxXLdxVRET3c6ud5iEOmxEGXgKbYqEIqE/AXX5xF+Kl2zROUiPrTfDg0Q/618CcUa
 YxMfOfKUbV1U+nMsmwANlk2MzsYyl54+SgHpL4LXSW5UsicwAs/fSF3Ichcu1Ak/fxuU
 fk0kRnKd0KFYleEaOhgqAszjVuhyejMpt+3oqFILWzgy6TkiQeKfY9he9HftPgOyjLcp
 ujyolNJHniNgJf3GVFNaVm4CiFGBvGRS3/RDJlQ6+u7kIT5EVnO3yxdj1KaWTQwqayqp
 DP0Q==
X-Gm-Message-State: AFqh2krMTQrnn6zQtXCd6cgFAYxX7S0pEbePAfcWwWgfJhXUlKAWCFxG
 5IGoEvBFmQ7hy2PzboSOOcEq6Q==
X-Google-Smtp-Source: AMrXdXsqdooRwYWnRmeWwVoe0WZZA/ZFCuQmaIeQgsdYXVWdS6HbY/4Rgj32jINdLNci+ZYLQVRmVQ==
X-Received: by 2002:a5d:6b4d:0:b0:2bb:f88b:43b6 with SMTP id
 x13-20020a5d6b4d000000b002bbf88b43b6mr35293202wrw.3.1674827499890; 
 Fri, 27 Jan 2023 05:51:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d64c7000000b002bdfe3aca17sm4488106wri.51.2023.01.27.05.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:51:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF3A81FFB7;
 Fri, 27 Jan 2023 13:51:38 +0000 (GMT)
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-9-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v5 08/36] include/qemu/int128: Use Int128 structure for TCI
Date: Fri, 27 Jan 2023 13:51:34 +0000
In-reply-to: <20230126043824.54819-9-richard.henderson@linaro.org>
Message-ID: <87v8ksnl05.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

> We are about to allow passing Int128 to/from tcg helper functions,
> but libffi doesn't support __int128_t, so use the structure.
>
> In order for atomic128.h to continue working, we must provide
> a mechanism to frob between real __int128_t and the structure.
> Provide a new union, Int128Alias, for this.  We cannot modify
> Int128 itself, as any changed alignment would also break libffi.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

