Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D55BA4BA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 04:42:22 +0200 (CEST)
Received: from localhost ([::1]:57154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ1J7-0003Sl-9h
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 22:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ1HH-0000Bm-F0; Thu, 15 Sep 2022 22:40:27 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ1HE-0006AN-Ec; Thu, 15 Sep 2022 22:40:25 -0400
Received: by mail-qv1-xf36.google.com with SMTP id v15so15671716qvi.11;
 Thu, 15 Sep 2022 19:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=uptv9ouL9YsikW7JiYuwBgoJiiAnp4bfnPluNi1wGjo=;
 b=iF4W93AUBTWXheDZiM/uAOrOyKroim5jAeidPHAELVOPNOey38H6TWCczY++DRT7bz
 sw1chJrK5mMt/0ZEFIbH4QR+hMJwBEDEDcH0omyq/R/duagEt+lGXrvd1SeERWJx9QzZ
 vyI+hGxmzgFWldZ3Hh/7aDJQKAhi6QPGhREj9ZMYBUE+VLKQzUAIVJZ0KCm3QDuwt6Md
 lXst6hgRkjaOdqIHePG2BiJcz5FE7fMPMtUzhAfidueR3hUHq+L5vUgdCwnZad39bKKW
 GJxTTDwMNsZPuJ89/f3sqLBs72tNDkPHrucTkqZOGMMNMnee9LyqzLumqYDHQjQYDMD6
 N5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=uptv9ouL9YsikW7JiYuwBgoJiiAnp4bfnPluNi1wGjo=;
 b=vN6JOnBO+TKyrygWoicXOp/BcemT2VSOAmMeGNyRVG4YbFo2g6SFx+Z7xa6+jm17lR
 xU5hflJNvsJPugd8s0Tepm57N7e9G5fFxh0NEFiHQbtScjiuJh273gFyhXPoNBoSciSj
 S6TO3BZaRm6HO7zEfdqAtfRSv7RPs8Rgh9OuME3vDrQsePRO+IdbR//xZ3oj1V3D7RgH
 5UrIvKK/8sQ4rlDQ/RdF/hont3r3GjVDJqWrIU2JYEKYf4HKio9L42hb85RxiGhbPKZE
 r5ln1Gu7l/cz3pdjuZzLSwjmnD71XU0ed/qBf9UvO+HmJzZh1M+dvqyAT1Wdfupu5ste
 4Naw==
X-Gm-Message-State: ACrzQf2QZcLYLvQA7Fe3cUg84vTU7u1CaumIMvliDboPjyohnIK9Cpth
 eGu5MUbK+q6H5mPOXKOC3lVD8qHbZ4aX0IL3oeM=
X-Google-Smtp-Source: AMsMyM4frVLnTCJQltpzSiX2T6ShKI9fRSpYaG1PYCpBSZj8RyNlmCzQlTTZlmGQD1m7aIVH3Z1qo0c2EEhHbLkQfXw=
X-Received: by 2002:a05:6214:2602:b0:4ac:ada1:de5b with SMTP id
 gu2-20020a056214260200b004acada1de5bmr2722390qvb.122.1663296022827; Thu, 15
 Sep 2022 19:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-3-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-3-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 10:40:11 +0800
Message-ID: <CAEUhbmW0sn-3wC1SJW+TfDd6vN1rezZWaGT32kmyh3+HHDa3Sg@mail.gmail.com>
Subject: Re: [PATCH 02/11] hw/gpio/meson: Introduce dedicated config switch
 for hw/gpio/mpc8xxx
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 15, 2022 at 11:26 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Having a dedicated config switch makes dependency handling cleaner.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/gpio/Kconfig     | 3 +++
>  hw/gpio/meson.build | 2 +-
>  hw/ppc/Kconfig      | 1 +
>  3 files changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

