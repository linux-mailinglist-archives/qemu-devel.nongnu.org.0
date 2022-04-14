Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C790501360
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:19:58 +0200 (CEST)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1GH-0003Jl-2m
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1Cd-0006uJ-7Z
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:16:12 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1Cb-0002n6-I5
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:16:10 -0400
Received: by mail-ed1-x531.google.com with SMTP id u18so6791202eda.3
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Qc7zT9psE1uu6NLXBN0ZMmRzZtOc4g3a2Na/D8oEE5c=;
 b=smcs4VLlGV2DcaHjHqpd/GtTdpL7IwHGOOLijOWtxX3WDItY9NhQNUZ87LUu/Y+b9J
 cTYDRgU1CfOUJVGBhYf2B93vAp7W0LXpnCpvE4aPPsLsq2K8+cz0vqTWocjGjEeIgd0g
 PyEtV0xi/OM1rHbkTFgzmR85AWuPQ5Z38d90R3mtUpDItKGbidrV1VOhq2z0i2I/ZVar
 7XLtv77053FkXh95UiMISS/Q4z3TKL9aKpy8+Dt/gb6bIhHwD+dAoaA3RN+PyvXstBYt
 LPCOE1g2VLRVfPqcHNoz8kCJxdTTJfXZvV+ihDPnYzhaTZpXPLg3rMtuVxVuefJckfJ3
 yyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Qc7zT9psE1uu6NLXBN0ZMmRzZtOc4g3a2Na/D8oEE5c=;
 b=Bryjh7teJfBd1PgRR+wp7sosYlxYT1I3kbkO2RTjqey+O/PVYc6kJbYopZ9v9mtpXU
 MHIw+pjWSsMTBBHWVVZKhLhXApsT7ZSATAg39t+67/Ijjq9Coem6ePisb6TWau/w0XkO
 /BYGENkx5K7aPYMHg4Sx4XY6w2/iZnM8tByyFoJ587bb4N0sMrG/pKH9fxauKDEiI/3d
 iXWgMbmG+lCCFqOj9c8fOgIsUQ1VJkQdzi+s25LZV8bSjpcsoNlolXgE8Au01r38Db4O
 DjH7QT3iuP+DPhm7kglgS5QomrFlQgM3iXSGYvK1e1yTR4PIbwpXVYJfY6AdIpTFc4g8
 sRaQ==
X-Gm-Message-State: AOAM531BBiFa0cQQ2wm4Ka7lhsHll/p/wc3+BQbvByLXu1oowe/Sf9a+
 aOFENgpK7JofLqYeRCXQnn1q47bbicrwXA==
X-Google-Smtp-Source: ABdhPJwEEyZ7BBX7YdO4ePbrY0vhRY9IlSzNniOrllELBtc6+IJY5uhWbHC/iM3guA3QJ69J5AFnBg==
X-Received: by 2002:a05:6402:270f:b0:419:5b71:3493 with SMTP id
 y15-20020a056402270f00b004195b713493mr3548901edd.72.1649949368227; 
 Thu, 14 Apr 2022 08:16:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a17090654cd00b006e0db351d01sm711018ejp.124.2022.04.14.08.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:16:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A69AC1FFB7;
 Thu, 14 Apr 2022 16:16:06 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-39-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 30/39] softmmu: Use qemu_set_log_filename_flags
Date: Thu, 14 Apr 2022 16:16:02 +0100
In-reply-to: <20220326132534.543738-39-richard.henderson@linaro.org>
Message-ID: <871qxzvgp5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

> Perform all logfile setup at startup in one step.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

