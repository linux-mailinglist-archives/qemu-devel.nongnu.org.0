Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4816A4FE996
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 22:43:10 +0200 (CEST)
Received: from localhost ([::1]:45386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neNLx-0000xX-DE
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 16:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neNGV-00076M-TV
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 16:37:31 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neNGU-0000r5-Ff
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 16:37:31 -0400
Received: by mail-ej1-x62e.google.com with SMTP id i27so39637843ejd.9
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 13:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hdZAS9pcFdUg8BncqyeqHKfGOiCKL2vey6jiKt3cTBg=;
 b=et0f/uJ7NxxhVnSS6AfOCHcqsmsH21wWfHSkxXfg9Ku3GUFt7tCmlKWFq8byuBNZ2V
 dmhV1IlldVeGTHzcuepAIbZwQQLODMcAU5s44lXpYtjR+hqmdsCb/B0x3Z3y3UImg+N9
 BQEQonk4t9JG9yjh8HIpMNLsW7qlc/4zEbAHLHZcZ70DmwSqUFAwnYaCqkvvUT903Voy
 gt6c7n4j8Hit1DSAwTzMiy4c+vJJzOkF8uHmoJOnSfZ5umipGNty54T+X+SlzFewV1q/
 kxdWVF8SMj+z9kmzQetr4eH+uYqSL5RitCue2jHMHhotplsqGpykpVs3dj/ovZkTl84o
 W5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hdZAS9pcFdUg8BncqyeqHKfGOiCKL2vey6jiKt3cTBg=;
 b=cFa2wbXhYKWk+3AMTKjb5nCwqQBnO71TP8iGINgO4W8L6URn7lWSl/5BwIK4A8js0I
 cm805tYgI/zS2L7FygEmOdWM30vh9RB0E7fAcX03Zj5PebaZe4zIwBYOZmCXuh334pSr
 Pu82m4667MV1DY9fQHxHiOgxzg+PO8fURgom2hJIe3Xaqcz10Hfz6PokPZgnL95YyuJt
 YZdeVV6Ftb+5TRc5ANRiwnBjkTw3mkWnAoDqScxWF6l5wNqmx4ywTFGBqAzeJ4OBBt8I
 3SyHwyzuMVL3mNK41s3BoexQbjGu0XcDuElTQC7FcamTuENcgszpYiSJFGYH9NXbOQdy
 6piA==
X-Gm-Message-State: AOAM531LbOMjfgxOuLB/ZZgo2ktC3zyvoJ6PDRRBeIKkNBHw8qc20Xn6
 BoKN74lMzjsKcZo0GHMY7YPMnQ==
X-Google-Smtp-Source: ABdhPJw491laMQevCmK91WpGXUy6LHidUfJRBaRujw49zXstZ44HmlRu1hjqyyEAj1fbbh1fjveKbQ==
X-Received: by 2002:a17:907:720e:b0:6e8:bf62:baea with SMTP id
 dr14-20020a170907720e00b006e8bf62baeamr1854737ejc.121.1649795849035; 
 Tue, 12 Apr 2022 13:37:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a50d94a000000b004131aa2525esm225695edj.49.2022.04.12.13.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 13:37:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A2D31FFB7;
 Tue, 12 Apr 2022 21:37:27 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-9-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/39] util/log: Pass Error pointer to qemu_set_log
Date: Tue, 12 Apr 2022 21:37:22 +0100
In-reply-to: <20220326132534.543738-9-richard.henderson@linaro.org>
Message-ID: <877d7uyr5k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Do not force exit within qemu_set_log; return bool and pass
> an Error value back up the stack as per usual.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

