Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA356A420F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:53:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcMO-0007fh-76; Mon, 27 Feb 2023 07:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWcML-0007ek-0U
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:12:02 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWcMI-0004bt-IQ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:12:00 -0500
Received: by mail-wr1-x432.google.com with SMTP id v16so3163277wrn.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJCsFYRe6nL7XT5G5gFRwCb9shkQpd0AIQ7ThKksO4c=;
 b=edv8pz1ZxE8214FAiePhsiPTzFlbmQFL8WsL2q9hBGFtdtLssFfQVUKZ5Y4tQ4gQGX
 Vxt/wlEqRXy6Gc7+j2kQyZy5jQdhcmJJY+Me8NFmr1SEmK1CwuQ5Ewh671FXctNBb4LB
 iMggNJQIzPR80hHp/VRF+mfydEWkRKDyAOzGY6J8h0hJWf/VQLxGzt1bqexHcC70jnoQ
 yg7+GX6dLmvP3rmbXTBXh/t7osY2zGZ/19ytYeUHl3oYtBVp1x3aqqcs3X5+D/J4vfhW
 wzEBMroS5plfoK1tcNjL0F5/+2UB7EyXSfT6C5qDetEFTJJqvp970EbNKrpk28n2iUz5
 2+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qJCsFYRe6nL7XT5G5gFRwCb9shkQpd0AIQ7ThKksO4c=;
 b=CzC77wXe0+YrSJDub2wuNjts9MLlk3ay6W07zTZvGwB8H8slHHGkTOOXoppW3YNhfe
 NkYYuXq9DHml4kp7kLlMw4PHNeqxSLYXrS7Ehc9kl5tBHwQB/VvyYARs6QnWXzJT4oMA
 KAv3G3/RjlFHOBwrpfzVvYko9Yc4SDKF2Y6+AGIX8YyDTHevSQQT1PYELK8gotkbCg4z
 aBCM5sATnxAgu6xMXczF6B9IiPgyK3Wk5JrDxk7qF3OnE2KzO2NiUGit3Ybf5IMO5RyI
 CNFcIArw1D5RjJEP6FCAbfcQ6IOyZiIKtMycqDSaePcwr941yYhtbWLLluhyJjee2yrq
 0HOQ==
X-Gm-Message-State: AO0yUKVnAMjFKkwAFsGpWq37LNMisunGZyVNnx5QEFeVnJAQ0Fu2HdUC
 Qxk9fE2S5aNuFfMb4PZNSreLLA==
X-Google-Smtp-Source: AK7set+HeH/UHij4gwRj0zpX5HUWgozhRj5RK7J1UQVi6s4J6G8cTQodU8n2Z6z2cwVcMfcrP6jeJQ==
X-Received: by 2002:a5d:5652:0:b0:2cc:4e58:f6d0 with SMTP id
 j18-20020a5d5652000000b002cc4e58f6d0mr488235wrw.54.1677499916833; 
 Mon, 27 Feb 2023 04:11:56 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a1c7315000000b003b47b80cec3sm12527400wmb.42.2023.02.27.04.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:11:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 083CA1FFB7;
 Mon, 27 Feb 2023 12:11:56 +0000 (GMT)
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-4-marcandre.lureau@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>, Eric Blake
 <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Markus Armbruster <armbru@redhat.com>, =?utf-8?Q?Dan?=
 =?utf-8?Q?iel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 03/10] tests/docker: fix a win32 error due to
 portability
Date: Mon, 27 Feb 2023 12:11:49 +0000
In-reply-to: <20230207142535.1153722-4-marcandre.lureau@redhat.com>
Message-ID: <875ybni9ys.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> docker.py is run during configure, and produces an error: No module
> named 'pwd'.
>
> Use a more portable and recommended alternative to lookup the user
> "login name".
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

