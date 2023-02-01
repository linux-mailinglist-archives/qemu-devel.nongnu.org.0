Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91B686462
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:36:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAIw-0006LT-98; Wed, 01 Feb 2023 05:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAIt-0006Km-LN
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:25:23 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAIs-000277-2T
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:25:23 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k16so12287280wms.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUSIKDVdI3AtBicPaYvSXoCED6+fujyX3WoBd48K0cs=;
 b=I0GjTCHKllJZKZXssr7p+CA+stgzr3NzQ4848cNHbI9bcmSp2JbaxpxQC+x4bt6387
 76TqgNWZ7iakBP40jlY1cIaIP4yNAvcosBmThbkC6GqqtC2YEfyzMh4E3Kciq4yGGxGi
 7MUArEjc8aIytjvo3baP2RJLWqgWuFctspR9zH4bl9Zq97d35yJU0HlHJ3mT+o3yicD5
 kEKzKw7xXOXMZ+vPmpy5QuR+/9MI424d/tizGPqkNh5GfpLw2VynXwv/790g/JyhEpy9
 7nCC6Cgbf3Qg920J/VyERRuGZoxJE3vnScH5OZvQycO0r1qQ2wNr8zQIOMbO+8y8enbg
 zdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aUSIKDVdI3AtBicPaYvSXoCED6+fujyX3WoBd48K0cs=;
 b=w4s5G3u2NPo7R/KHPpLecgZEBEmGKJEyBzc9p0PcHnZ3AEzbHXyXtrwouoZvvKgket
 BAqPwQXhErkE2ticxrjWMTB3NJK6P0R7rxJKmc4HRgPJX65zL9O7UN7qfbEZbRgRj2Oh
 h9Il3isJs0y4tCYtROUj9ykweHJZJhxdXHK0eL6NemGZphOCTsq7jESn6qtzin0xJwSP
 5wl78WCVSm5peLJ+/v0UGUHL57RXkcIcImh1SD7hHpo3Y2cTwZjNaYDmKfgv9V4TqUjE
 LY+LLpNOkikpN4USpj2+sdZHB/kByIE21UlZ0Hooxp2/PJwa+VmRFJqyOACOG2ue3Tho
 bn4w==
X-Gm-Message-State: AO0yUKVAXJKNY+JemvwMKH7i4kTSYvXpVK2vNpXuK4YLryrE/GqaU4mD
 xfds3I7+9D5HO0dAJwwwTBrGgg==
X-Google-Smtp-Source: AK7set/jRgZXsDgNs+c0GBvOsl/GaJUAUWLIDTxN3he3pD7198A+JJY0NiRIUDQD79WGbCTYT1Hqfw==
X-Received: by 2002:a05:600c:46c9:b0:3db:1d8:9f25 with SMTP id
 q9-20020a05600c46c900b003db01d89f25mr1468124wmo.2.1675247120643; 
 Wed, 01 Feb 2023 02:25:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a05600c379500b003dc4a47605fsm1304722wmr.8.2023.02.01.02.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:25:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D976F1FFB7;
 Wed,  1 Feb 2023 10:25:19 +0000 (GMT)
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
 <16ac94d6761721ffe5e65dbc9f2b6319c880e369.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [PATCH 8/9] Updated the FSF address in tests/unit/test-rcu-list.c
Date: Wed, 01 Feb 2023 10:25:15 +0000
In-reply-to: <16ac94d6761721ffe5e65dbc9f2b6319c880e369.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
Message-ID: <87wn51r8c0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk> writes:

> Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

