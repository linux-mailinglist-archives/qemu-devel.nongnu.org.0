Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021A86A405F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:13:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbRR-0005Sn-3Q; Mon, 27 Feb 2023 06:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWbRE-0005R9-8M
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:13:00 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWbRB-000195-UQ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:12:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p16so3962994wmq.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/0wWoKSdV+vhplWmsuqfRD2TkeK2kz9slJBugAJD8g=;
 b=qTwaV3mt0TRhY4Npie/FkdIFG8+7sfcnoIMfynwMEssajwAwsNhK4WrMgKn3w5PxCf
 /XynVGNEx+7FO/yr/pNhAjYvq5fqk1mXT48eaIb+wwW4SGvtLAtpS86fsZwnfMleAg6j
 dqChsbB99qoncra7vBfueo8RaRlmaLZhGkCXQfF6zP8HZe2JJb8SIUNdafkxjCslF/FF
 JTxoMVibE62z73Vz45fZZnk7HHO1VDxUdp0EaezJiM7MVmgZSJGyQP6YDa0Wm09V4Vmp
 R3E1Nuc/tBLt94wdhjk5dAgEczmQmj3AAAJBmcl4j1TY72w5SDFnzuMEUQZXJxJG9Zup
 90JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=E/0wWoKSdV+vhplWmsuqfRD2TkeK2kz9slJBugAJD8g=;
 b=x2sI6whW7TOTmIrKhZT6vIMxj4aRA3TYVQyyCNVcrw8fvtfNfKUU5xcPjlI61JJSmX
 CwpU0Gac7A1WYE2ZLfhJycH0SgVPkeFRQBAUtY4+1DjNwREl3K2twt3PRkyaq8zqCzRR
 vFWS0T3+kZqaQg4X4UI0TOMi5aNyTb3C6VaV+M9BW76fyHuDRp79f6dZcO4l6/ydHCH7
 fNgS81Lk1ObAIoh4J0ZVNIV1ER0bY9LyG9oz2nQ14aadQTTnq51zAyHp7sIkg4WUd/3r
 6dG/NBcOWx+klUHs3UiPKO97LBs0JEDWqkp2E+CE0zMVCuweLuBIFT3CoiPS///4tDLG
 UG6A==
X-Gm-Message-State: AO0yUKUyqOp/AYjzWKxLcU2TfScA+/v/0n2Xf/B8qgbF11oRI/we1hua
 T/5/jFOlugDnP3+QGMxow01wtA==
X-Google-Smtp-Source: AK7set+MtiqoZW6Viebegz12ybDeYkZgMx2TRKuqCdyhG7lTQaJAZBxN5flrKXNul6kfQqCXmjZRcA==
X-Received: by 2002:a05:600c:329d:b0:3eb:3e24:59e2 with SMTP id
 t29-20020a05600c329d00b003eb3e2459e2mr3027351wmp.25.1677496375500; 
 Mon, 27 Feb 2023 03:12:55 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c441a00b003e21638c0edsm8956302wmn.45.2023.02.27.03.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:12:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A85581FFB7;
 Mon, 27 Feb 2023 11:12:54 +0000 (GMT)
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-8-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, John Snow
 <jsnow@redhat.com>, qemu-block@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 07/24] hw/ide/atapi: Restrict 'scsi/constants.h'
 inclusion
Date: Mon, 27 Feb 2023 11:12:49 +0000
In-reply-to: <20230220091358.17038-8-philmd@linaro.org>
Message-ID: <87v8jnicp5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Only atapi.c requires the SCSI constants. No need to include
> it in all files including "hw/ide/internal.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20230215112712.23110-7-philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

