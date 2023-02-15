Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F036981F8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:28:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLZi-0005Kc-EH; Wed, 15 Feb 2023 12:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLZe-0005Ia-Jg
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:28:06 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLZc-00079O-5h
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:28:06 -0500
Received: by mail-wm1-x331.google.com with SMTP id n33so7864591wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7BmgEx7ZJu9FpKweRjsHeNMA1knw//NAwwEJEhIMdY=;
 b=hW6Ou/QQim7F4dUXA2yGKTFw+6JUgiBOcC3UJIFSLErWSwP9mynHM86YWAMOEO+GK4
 ZQdwYrqBAzKKM1qPyc/I3Xxq79rBXSV7AcReJ5+MGGxQQcnWAFo8PdSl2Tan55VmCOOt
 ca9UhDAsGPMe9OpkoR6ok4w+SdsELiFlBqwz/qmhlbAHTDGcxaY8TZ4nxrcV7FaHk29B
 DflWaWqlyOgC47BYrmux59A1TQeTgxFjXVT+y2wIi6i49/oRGFAYu+28w68xi22q0w8+
 6WuPWEm/XWtGm9M8ZCGPkW7njvoCzDsGuuKkWKK+HhCW4twog6GaRaDXU8d7sCMxooZX
 xB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u7BmgEx7ZJu9FpKweRjsHeNMA1knw//NAwwEJEhIMdY=;
 b=uZ8ES5KOCfpmnk0MEsbh1VDUzXODUhW2i7vSaDBpYm62xbWlHvbTZdqix/Sh/eZqOF
 z76tamkLZpiogAETOa5fonbZ3vrIIfOd2hPh5p75g2k8wSkO7wyq5Xg00w6TnvL1c1K2
 92ovBgVrXVNw4iP7CeyuBIufEnpND0oBsakqCgYYqhposWEYbQIlLRerwL0Y2VuJlN5G
 f/hUb8Qe0zYG3rBVinkbiIjQQytlQz93N4IyxeYzqKACa8NYOJcIncaDvDsxxCuP7T0n
 DoAL/rNNpQZOm1ACZwf9RElXbYJe/y9cG16rh071MoDlp7x72Wmg6aFJ3uDZTvSYzi1H
 /itg==
X-Gm-Message-State: AO0yUKVBAo/RKyc8SwwfJ7EIJys5rX/mAJDJjShU/QS28PZ4aFXyDYmy
 T4EyiRZh+5s14zZKYulWIZcxdA==
X-Google-Smtp-Source: AK7set9UC4VzmQIgxgFE7pRdAuDIwFP2OTadFFD5iz177Xoj0CKrTB0abp7krD2/926/DK0anZ8gig==
X-Received: by 2002:a1c:f30b:0:b0:3d9:f85c:97ff with SMTP id
 q11-20020a1cf30b000000b003d9f85c97ffmr2768898wmq.16.1676482079549; 
 Wed, 15 Feb 2023 09:27:59 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003dd1bd0b915sm2892728wms.22.2023.02.15.09.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:27:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE1651FFB7;
 Wed, 15 Feb 2023 17:27:58 +0000 (GMT)
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-2-philmd@linaro.org>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, John Snow
 <jsnow@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/20] MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"
Date: Wed, 15 Feb 2023 17:27:52 +0000
In-reply-to: <20230215112712.23110-2-philmd@linaro.org>
Message-ID: <87a61ealep.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> From: John Snow <jsnow@redhat.com>
>
> I have not been able to give these devices the love they need for a
> while now. Update the maintainers file to reflect the truth of the
> matter.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Message-Id: <20230206182544.711117-1-jsnow@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

