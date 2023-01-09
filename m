Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911C9661FD0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 09:19:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEnM6-0001VA-BA; Mon, 09 Jan 2023 03:18:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pEnM0-0001Ug-SL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:18:00 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pEnLz-0007ct-6r
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:18:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso8364286wms.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 00:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zixhl4RSE0u3gVtaKDIIz2mnQga8K7TFeW5ZZdrtuc4=;
 b=xXm7ay235hX4IGDy8JAt5uIa+cBDEi2Wxb46d7iu1GWA+K3wgd5d0PVjs238KRM8kL
 N+kra9ILfsGesY6BlAjNuo+8jp7Tcl2fhIj1t5uDvLi6UiH0ZQGnFtWLxYTKjhzl1Ple
 D6YgHYFFpg+c3/pQGviuXYvbEJzwn4l7UrhblDlfO/IXjv+vr3dIdviP7L2vib+IUEcZ
 UrUcOfImdoD9QRcCAMZoE4rRvJurEMSChRSdWdpM7tBYNJjxoY1PxPYtVh+7tDc9i52a
 mOqzKBywJ1m+s7+DJduFYyfi20YKLi4JgZM/f9TBaLmT+27HzsbFRzi6YnxutQ4npCzk
 S5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zixhl4RSE0u3gVtaKDIIz2mnQga8K7TFeW5ZZdrtuc4=;
 b=kXizauj90r7Tdatkmye8Q9/VoYJ6OPnO+OW8phMdHJ/xpIxYft3Iyie130ofVJACPi
 XIMprPNKmhihbh7AKXv0jKLtDRUCmOI+bMRaDwDu8LI70jQ2/ojniDmUkuhyEI35nOO0
 PPVbPL7F28PCzqzO8nci1wSSPenIafXYIPNrA7350Jt/cnfckrPHV934ElVK/OeRYfxh
 dUSoHVhcz9Pm43zxCY4xlsX8euJYzBKyfv/9Hv+c/TA+59B6nzCRRDlk1GsB16N2/taC
 x/6rmvY4z8a8Wv50egU7pDi9Hm/4vemL0FkLrN9vHrBiA7dEsrrULFx3+Oi0pjF7vAJ3
 /c2A==
X-Gm-Message-State: AFqh2ko19Jm2ED+S8KsBtjQ2P/nhWBD949GsYO2RKNReA6jma1qar2AW
 79pSpmI3a5omonyvzOwUOqKh0g==
X-Google-Smtp-Source: AMrXdXu/GleAeAqAXx96HRT6Ga1nuw4M673xREzeVVzw2p5UFEmNxvK+NdjxfeFMsG5Ruom+sgTVeQ==
X-Received: by 2002:a05:600c:218f:b0:3d1:fbf9:3bd4 with SMTP id
 e15-20020a05600c218f00b003d1fbf93bd4mr46143507wme.10.1673252276992; 
 Mon, 09 Jan 2023 00:17:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 he12-20020a05600c540c00b003d9ddc82450sm10240745wmb.45.2023.01.09.00.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 00:17:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E05A61FFB7;
 Mon,  9 Jan 2023 08:17:55 +0000 (GMT)
References: <20230109063130.81296-1-akihiko.odaki@daynix.com>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] vhost-user: Correct a reference of TARGET_AARCH64
Date: Mon, 09 Jan 2023 08:17:51 +0000
In-reply-to: <20230109063130.81296-1-akihiko.odaki@daynix.com>
Message-ID: <87wn5wnmto.fsf@linaro.org>
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> Presumably TARGET_ARM_64 should be a mistake of TARGET_AARCH64.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

