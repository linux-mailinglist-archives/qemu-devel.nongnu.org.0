Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F8230F109
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:41:31 +0100 (CET)
Received: from localhost ([::1]:60908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7c4o-0006n7-Dc
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7byL-0000oj-Dn
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:34:49 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7byJ-0007I6-I5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:34:48 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e15so2562415wme.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 02:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VlYZ9nYH3pp4MwioJSgMkMP1V2mDm3teHO79rZTT5pQ=;
 b=GeoxzaMnYulAWPGJQlVwKWK4Cr/KiXON5eSVRjyUewzz9UMTB3oNci5Gj11t5uJyv+
 eAMOfMQ/4cxIymXh1QbSeWWFsuHaFh3YsGayI1y4qoC5UMm7yW//O+Uv6mSYsLlMunHX
 tOomAmefUsx0aoVc9VPodR+uRfEo+qtakTidbZ5IlEgvB2qAfyip5vv7qXs6cJEW2JGh
 7u4iPH/l2KoLSFGdR2ZtRZLKQj+YzdPpMLWWpucSrKde1DFGMz8giguCQSpZU2b8KuJJ
 1yU0mskbTHYgplu6cKF1yXM9yBCBOx16MjSpXdZXaaWQk1f/rdctxuDdxqrj1D9qsST+
 JxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VlYZ9nYH3pp4MwioJSgMkMP1V2mDm3teHO79rZTT5pQ=;
 b=MstFRIseevi2CqdwBOUYnsBXnru+59d2Ly1OVqJnL3yExAFeSMIFpE+sErBpdUWaOy
 0fJsOLDVIvZy1shHdh/sUJhyCGdwrsTlh35Z3XQaF4cjwBg+3doZAZlRTxoSrBnCzPvG
 Cjkb52sfPk/U/9bbJSc7NWtSz/QskqfnWjIXnJGthUhyzVfJku4+OGqEUWoltYQwceOP
 UuDtbvRJnPdFEegGirNTSC1/0nMfPLLQZTnBum+0w9dux8AMrj1VqVCmT5jhkkIQs7gy
 b3rawyl8/IN8MBdeu+Rq3XWOV0fk5xd0gogi26oob0FX71eR4HVKFQyz4TJRVrI9tCQo
 CBQw==
X-Gm-Message-State: AOAM532/7w53M5yWATHZ6Wh62d5s1NGXmmcjvJ1SAGuVZv0V0qEObNXO
 payCAD7wJLZyP1UH9PotUietFA==
X-Google-Smtp-Source: ABdhPJwTqxn2jyavU8hJjzjao0lpRggN/iiwCpFQKZ0RK1EHD2Y5k19/xfIDkctXJ5jbNuUvYAp+ig==
X-Received: by 2002:a1c:4e13:: with SMTP id g19mr663405wmh.55.1612434885740;
 Thu, 04 Feb 2021 02:34:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r15sm7475761wrq.1.2021.02.04.02.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 02:34:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA38C1FF7E;
 Thu,  4 Feb 2021 10:34:43 +0000 (GMT)
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-2-crosa@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 01/22] tests/acceptance/boot_linux.py: fix typo on
 cloudinit error message
Date: Thu, 04 Feb 2021 10:34:37 +0000
In-reply-to: <20210203172357.1422425-2-crosa@redhat.com>
Message-ID: <87mtwkqfy4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

