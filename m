Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE79534198
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:38:04 +0200 (CEST)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntu1L-0006c8-Tz
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nttwk-0008UZ-8o
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:33:18 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nttwi-0001Hk-H8
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:33:17 -0400
Received: by mail-wm1-x330.google.com with SMTP id z17so5940263wmf.1
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 09:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xIFCTTJascEs3seVgPrjiaF+LpFjz4yDKM4qK7ETOCA=;
 b=oKsvO8FysnPtWyz+v+Z6O+2udE7lnvT47c0i6zj4wEUyRHMLBTRh2Z2HhFbTmbUdky
 MgPJjJMZ7zcAAbQ7rA4T3Nc3KqfyehhtKQMAZisDagiuIcZUfTuNpz1r+vhuQWhu2Fzn
 OoXqrgS9zDTy6eT4nMUUYyMy/BiApo0/ZSjyF9nJmbmyuLWbTrndOcOyUOWoqV+kOG4E
 aQ9psCe24w+r9RzA9QF8Zk7GHkMpWpJ6Zd0buuLA8LdDixYgK75eloMcEdqB7/fjPa1T
 x4Cjc4p4A4aLtdfAWhNH4xZgeQiL//4un97CZlXeRuWaF79B4qUuwz6r2agtevqrMYle
 O4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xIFCTTJascEs3seVgPrjiaF+LpFjz4yDKM4qK7ETOCA=;
 b=YrXha+xTspDyjxp+V7jcSJYmUkiF1kk36GxsjeA13jSYcgNcQw5u9cpZCL0GmlA4pC
 4rZKqqWsX03Ysu2QEwyEBVgtpueQt0cD8SGKpARoFVPJc1in9sfOC/CMIBXste8uyz2w
 dcCpRiswhbIu/sRTZ7oAVONgaf6WeJerFvWMjXS5E/0qwipkpWESeENXO/RAwxx5VLY9
 ghK6e/0DShXRUIhVwKALkhwYSv6ENVigmWosP+5Ra7sf0QJGfme+DJ66wlTmrMbtFijI
 GDuBVatRJ68E/qpozoLDfBmAXxYE7ZoFl1WHw2dJVJg58B0lS8MtukG796GkHMkzNblM
 yUKA==
X-Gm-Message-State: AOAM5312YChYnw4D8YM6yZYC77AD+mHm8X15bJc+/q6F3LU2rBnN9lbz
 VNpCZi9XM8tTiQiyaGiaWvrLcw==
X-Google-Smtp-Source: ABdhPJy0TR+7WyDibFfu22r2ECQc2cFvYsxLpmj4kDpUx30nrlYZZnBlWxADK181RQ5HCKoa/W62/Q==
X-Received: by 2002:a7b:cb4b:0:b0:397:3dd8:917a with SMTP id
 v11-20020a7bcb4b000000b003973dd8917amr9347206wmj.20.1653496393562; 
 Wed, 25 May 2022 09:33:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056000144700b0020c5253d926sm2662048wrx.114.2022.05.25.09.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 09:33:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 851A81FFB7;
 Wed, 25 May 2022 17:33:11 +0100 (BST)
References: <20220525085953.940116-1-kkostiuk@redhat.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Thomas
 Huth <thuth@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel?=
 =?utf-8?Q?_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Stefan Weil
 <sw@weilnetz.de>, Richard
 Henderson <richard.henderson@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 0/1] tests: Bump Fedora image version for
 cross-compilation
Date: Wed, 25 May 2022 17:33:06 +0100
In-reply-to: <20220525085953.940116-1-kkostiuk@redhat.com>
Message-ID: <87h75d1sjc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Konstantin Kostiuk <kkostiuk@redhat.com> writes:

> v1 -> v2: Fix spelling in the commit message
> v1: https://patchew.org/QEMU/20220524181111.922031-1-kkostiuk@redhat.com/
>
> Konstantin Kostiuk (1):
>   tests: Bump Fedora image version for cross-compilation

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

