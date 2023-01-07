Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4B2660FDD
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 16:14:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEAsx-0006EX-47; Sat, 07 Jan 2023 10:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pEAsp-0006DE-Fa
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 10:13:21 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pEAsn-0002Si-WB
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 10:13:19 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bk16so3802668wrb.11
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 07:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bfFkfqLvXTvnq+GtmA4RQa6+HVqVB1ronPRYX6xVvpU=;
 b=lxlRRWYgOO3fknaGVVWnRUfMO6DVLTkHgbrncR7jKXv6Rjw1zNFCkddDG3Usxfugba
 zLX/6xG2Ub8ortxwThlkSvYVlkTlIFmc0BYcUvuq53vV/WpH+AxH3ifwWGydfjKGCo8/
 EcX8xsCRQ3eIKWjDNRQvVCP1IKoVcdCzJqgQ/8qTrYpT4mfLzn3lZyzyvsi3bglz99kv
 aiXPieNuBx9kIXdg+OluS4ZXWZwLZfLeOdTEMnYweibxgM2XFXrNq2BKwUkhOnecE2xo
 zuSO/jn07xGn3dwANQBL88t5izSc5L81C5uqMjkkCgoS0LtQRe4KL7IVOZ27RgrhFyST
 Rcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bfFkfqLvXTvnq+GtmA4RQa6+HVqVB1ronPRYX6xVvpU=;
 b=xygJZwr7RclwmwQ54Bq7CN3ZGINbAayPYDxVJZ+Lh3whuCwIlibcufYqqo5w7JFLM6
 Cd9pjXZZy0QC5x1CNu0tn5d0/s6Zqm7SlPK0KBFB/7Li4DQ6QmdyoLaApa3Y4yS4HoBe
 BxSKZl9zRDvkBPrflshhnhpvom6k4Nf79fN67L4Psl95jge+30jBY9pgDBXaxI1Z24vV
 PaNCpjEwT4t6G422HXlBO8GGZJ7TCYeSK0reGs3gUQ6SZ6WKDENNJHTbcb/TFbX2Tunf
 z/Vct3mjMbHGn09dnZ4ZY0gvVl2iHX1/CsJFxqXtQxx9Z2nsnR55jW28wWVV9GTURlF2
 02Ag==
X-Gm-Message-State: AFqh2kqONsuK/8y/1+pfuf/1ab2VHoRfZmVdEuMggFhtTCIjGJNQKSoa
 cZ9sZtuznlcxCl8w2XASV1vL0Q==
X-Google-Smtp-Source: AMrXdXutb3xTcMtRF35+xvgvQKa1S57FDpAp6UGjZjiwZId0UUykF5Bb/bOuOJMdk9L6Du4WUGLVQA==
X-Received: by 2002:adf:dfc3:0:b0:294:c208:c921 with SMTP id
 q3-20020adfdfc3000000b00294c208c921mr13829144wrn.42.1673104395410; 
 Sat, 07 Jan 2023 07:13:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a5d46c1000000b00241cfe6e286sm3988919wrs.98.2023.01.07.07.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 07:13:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 74F7E1FFB7;
 Sat,  7 Jan 2023 15:13:14 +0000 (GMT)
References: <20221209164743.70836-1-philmd@linaro.org>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: Re: [PATCH-for-8.0] tests/vm: Update get_default_jobs() to work on
 non-x86_64 non-KVM hosts
Date: Sat, 07 Jan 2023 15:13:08 +0000
In-reply-to: <20221209164743.70836-1-philmd@linaro.org>
Message-ID: <87r0w61iph.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

> On non-x86_64 host, if KVM is not available we get:
>
>   Traceback (most recent call last):
>     File "tests/vm/basevm.py", line 634, in main
>       vm =3D vmcls(args, config=3Dconfig)
>     File "tests/vm/basevm.py", line 104, in __init__
>       mem =3D max(4, args.jobs)
>   TypeError: '>' not supported between instances of 'NoneType' and 'int'
>
> Fix by always returning a -- not ideal but safe -- '1' value.
>
> Fixes: b09539444a ("tests/vm: allow us to take advantage of MTTCG")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

