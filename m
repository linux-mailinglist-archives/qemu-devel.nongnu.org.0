Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2928F39A63F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:51:50 +0200 (CEST)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqZR-00070b-6F
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loqKs-00043i-EZ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:36:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loqKq-0005Fl-US
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:36:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso6281016wmh.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=11m6bW+B5PzmExKffNbbK+CPFtBaNRCbz8qQth45Rr0=;
 b=kH4zBLfUnwBHb/L+humX2qhPrW/aJcVqU/2Engy45RW8w6MowGfKGOTX64dyit/Cic
 wgHSaz2f4rL8qwhYh3jyMyEYMuOOR9nHaICtfejip1+29TPubFi0cBwo7FUg0Q+E1Uo2
 SD5XW3I/lnKC0BnEpHHx4zdzRihDfX+z4zmgYdRR4oQbAGuxWAfifH4DPcWykHBtkfOE
 M4H1ZV4x+rSAhUZQi4Gg4rJub6I5gNjR3tE0yWVu6gIVoTIni8HmnrELbcONaJrtNxjC
 qb36ag5YamvGx3pdL4xKYzWntzMzCbBZZgSRE53SeAh2TN44UVHZYoFGqB7f2SSlYBw9
 ZA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=11m6bW+B5PzmExKffNbbK+CPFtBaNRCbz8qQth45Rr0=;
 b=AMdpsI2XtqYnGL83iagDlwijEpPVs44dN3+RKvSwDn0Jc1EqgHYW4fYQUrxrCwuwyt
 JyRMaxYxoY4R2dggPJS4vXP1YxeNUrpqZ3VF6H7nfcCoYDAfUZ+8CS7pwm+LNjhGRiCk
 4YzFJP23Arukmm498hH0oN/OHX4DDu+hsGIAAn5MV3yr3bwPWj6dTHcrOmKExOw93R0l
 30YEn2FDjk5wHkcBXLoKDbbe8Xa5pvYw7mh2p2Vhxwh+tqr7dV+ehTR0hY7OINheui3b
 Dzi1o+4u5DGxUCfjtnrAprKTCgUe5PZNGf7fP6FF0SJJG8gRIRtcypSN1Pr+YamB4lwE
 Sl4w==
X-Gm-Message-State: AOAM5324EgiZ+vFRKMnXqug51XzZKXM7avA65C0DOCMW7g90XH24339v
 l36ODp/mEiX6jDIeuaXwWqXG0Q==
X-Google-Smtp-Source: ABdhPJzcTkjmg26DI5O7dhmKWqI7gDyuRjawYf+x+jwc610BIp52hZ8Trc1I2r7fJmrvOHezpfBmAA==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr11015933wmk.97.1622738203395; 
 Thu, 03 Jun 2021 09:36:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u2sm3722489wrn.38.2021.06.03.09.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:36:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DFACF1FF7E;
 Thu,  3 Jun 2021 17:36:41 +0100 (BST)
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-12-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v8 11/12] qtest/bios-tables-test: Make test
 build-independent from accelerator
Date: Thu, 03 Jun 2021 17:36:37 +0100
In-reply-to: <20210526170432.343588-12-philmd@redhat.com>
Message-ID: <87wnra7vmu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Now that we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

