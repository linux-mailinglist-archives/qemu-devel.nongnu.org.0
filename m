Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB64023BDE0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 18:14:38 +0200 (CEST)
Received: from localhost ([::1]:48742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2zaH-0000yK-Eo
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 12:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k2zTy-00033a-Lm
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 12:08:06 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k2zTw-0005ho-EW
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 12:08:06 -0400
Received: by mail-wm1-x343.google.com with SMTP id x5so3192535wmi.2
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=L2N/WqWUgl2HvNqOngwopEC6v4bzgjEi7G14T0l1LKY=;
 b=xfs/QwZGmD8pWMEBGUi7joyN5DWp05emQ7rYgZwk1uyROUAjdsTgNPLoeP3SOxm3f6
 3+sUXh/SqzTsZep+avZ5qLMyE7ec+pb/W0eRzHIjagIaICVB90RLDc1pnl5q6re+O9FN
 yuZ5P+EHAhfK7DlGTxcXtSWvJ31H9wtUjCMmBsTnUzcDXLjy/yxZUNXZgr+WBXftSZzA
 wJNJIrMUNbSvGrv9bfK2kYf/Gjn9U7iIL5dqJFhxkVSBHnaX9Ue+doZCkPf1xMEA6IPC
 wltOcQRD5bZxPXJ+bc5wLr4m15oitu+r3/aInNQsfPVltP3AwfAxv64GNAmoob73Y1Nb
 7G/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=L2N/WqWUgl2HvNqOngwopEC6v4bzgjEi7G14T0l1LKY=;
 b=W3SyTB+yNlE5LD250hd7xq+VrlXK4jfrHrcirGq9bNkwQMT1WMUougcGslLj7x1taD
 iTIXH9KsOhdTUmR3L3YQvyWHL/CbBBYuN+fhDCHo6L5HMhWKjAK/5LL1Kb/yz6JlvMTh
 U+kQyR8ulVXK5VsrMPkgw22feWSFD8cvNQUc4qQUmWFo1KK84ZZkDvX9wAqsqsPSAfMS
 Lq/7vuaUU/POnUChKoAQstDgXOFFJZiFDQ4+Ck/wZGh+JgpVDMLouS5cr9zaBje1k0aJ
 tKLbcI7cVQZr0vt8EPrs3paZ3ibYGwGXAORsHUJOU9LgW3JzCOHyIDMFrLp7DZIoNvhR
 ns/Q==
X-Gm-Message-State: AOAM5305l6cwNmkaYN9hVYoklNUwy6X8yR416G/5T66NB1e7rrWGqMew
 KWwF3PGmfQYhpX/k0lwjLEN99A==
X-Google-Smtp-Source: ABdhPJxksVwPpSAp+F4AgM0Y7J32EECMX6BlYmx7S/nu06KO0OkgNgEqNOq+LxG3HxtubNVUcXQCIA==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr4543053wme.46.1596557282094; 
 Tue, 04 Aug 2020 09:08:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i82sm5518928wmi.10.2020.08.04.09.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 09:08:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3D141FF7E;
 Tue,  4 Aug 2020 17:07:59 +0100 (BST)
References: <20200730141326.8260-1-thuth@redhat.com>
 <20200730141326.8260-2-thuth@redhat.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/4] tests/docker: Add python3-venv and netcat to the
 debian-amd64 container
In-reply-to: <20200730141326.8260-2-thuth@redhat.com>
Date: Tue, 04 Aug 2020 17:07:59 +0100
Message-ID: <87ft92mm1s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Without python3-venv, I get the following message when trying to
> run the acceptance tests within the debian container:
>
>  The virtual environment was not created successfully because ensurepip i=
s not
>  available.  On Debian/Ubuntu systems, you need to install the python3-ve=
nv
>  package using the following command.
>     apt-get install python3-venv
>  You may need to use sudo with that command.  After installing the python=
3-venv
>  package, recreate your virtual environment.
>
> Let's do it as the message suggests.
>
> And while we're at it, also add netcat here since it is required for
> some of the acceptance tests.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/docker/dockerfiles/debian-amd64.docker | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/=
dockerfiles/debian-amd64.docker
> index 8fdfd6a6b0..d2500dcff1 100644
> --- a/tests/docker/dockerfiles/debian-amd64.docker
> +++ b/tests/docker/dockerfiles/debian-amd64.docker
> @@ -20,7 +20,9 @@ RUN apt update && \
>          librdmacm-dev \
>          libsasl2-dev \
>          libsnappy-dev \
> -        libvte-dev
> +        libvte-dev \
> +        netcat-openbsd \
> +        python3-venv
>=20=20
>  # virgl
>  RUN apt update && \


--=20
Alex Benn=C3=A9e

