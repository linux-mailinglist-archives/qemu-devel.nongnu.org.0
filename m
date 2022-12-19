Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2FB65136B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 20:45:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7M4D-0000ik-4e; Mon, 19 Dec 2022 14:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7M4A-0000iI-HN
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 14:44:50 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7M49-0007Ej-2G
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 14:44:50 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m19so7189328wms.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 11:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+PFIv+gX9sd5BqMsY3e8XtQ9cZKoPzTNOXMhoUkUYZQ=;
 b=u9I59WYK2VrqkYypw82oDG2Fr+eL45rXNgk2EIxlHFulPcQuXQgoXU845JauIsCTaM
 hVqIwJFFR0a65Iqy+TZe8eTYKhTOsOeO4lfl4ffMBg9wWofKNTii9TNhoZeM/9V+MI+g
 n99SN+L/KdU/0vwwWnUvEbCq5TgCoYEKFE7pyPs3q17UwWwahsYUASOe0sGjvVNOFyTQ
 sU8h/XzpDDcq6mXexxUL8aBmVHhJpn2OZcgAxch/m5Du+o0cZ3AjCLCZi04ZEdXSLtCt
 pm3UbdzCKS4IbH/fWWW7ukh0i95ISpF+vUi1GXEx14vxVsGE4o8M0+JybHipAUC9/GhD
 AyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+PFIv+gX9sd5BqMsY3e8XtQ9cZKoPzTNOXMhoUkUYZQ=;
 b=8Q5hbi5IYFaIpp+zEG/qJcESaKXOvNMYyWjd4y8YUsTgDFK5cmALRWJQA4FSiDRfDe
 xkybXndNkVETwyQZ1y6JkHKb6RLyz1nk5UuyHn19tHA+YYMQ3pPU/d4H2/MolPsOzEvJ
 q/tMZFDbkScDYAxRe4OqKSfQ6JC8kE3JAwV9mNEWS2UXmCKJLXKHknilxIJsfjiecllM
 Ny+lK59TRJ6uEUHAz8y+ILlA0YdFif1kcVEGz99qV+lPC8SdjGT7DtITXetQaiuHEi3H
 9Olf84ej+hwSmnC16LN6dqdeAetOJEM+1I7lB+z546lA8TEORcUqubeG46oA1H/8OLs6
 OfWw==
X-Gm-Message-State: ANoB5pndHsV4HFXOBQAzzNWIWH0fQnYo4Nsd6BVrc89QTa4iC727DOzu
 dxs8RHTeyGf6ESePXswabk+sMA==
X-Google-Smtp-Source: AA0mqf4haGXXU3sXS+DH3Pv8SnUET4657XoRjrIRbscdQXaCA+lZ2Bz4p1D8IMmuyfDcxLXMTeRkAg==
X-Received: by 2002:a05:600c:4e52:b0:3d1:fcac:3c95 with SMTP id
 e18-20020a05600c4e5200b003d1fcac3c95mr32263778wmq.34.1671479087416; 
 Mon, 19 Dec 2022 11:44:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003c6bbe910fdsm22749513wmp.9.2022.12.19.11.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 11:44:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 974861FFB7;
 Mon, 19 Dec 2022 19:44:46 +0000 (GMT)
References: <20221208135945.99975-1-thuth@redhat.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Disable docs and GUIs for the build-tci and
 build-tcg-disabled jobs
Date: Mon, 19 Dec 2022 19:44:41 +0000
In-reply-to: <20221208135945.99975-1-thuth@redhat.com>
Message-ID: <87mt7ji3f5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> These jobs use their own "script:" section and thus do not profit from
> the global "--disable-docs" from the template. While we're at it, disable
> also some GUI front ends here since we do not gain any additional test
> coverage by compiling those here again.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

