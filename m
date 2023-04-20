Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D175C6E9B0C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 19:44:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppYJZ-0002Kk-Mg; Thu, 20 Apr 2023 13:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppYJQ-0002Gg-Hz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:43:17 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppYJE-0004sL-R3
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:43:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f167d0c91bso8907985e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682012577; x=1684604577;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+TzhZc9yQWq7VgjvLVqi8u/gby7qiRWi9FVhaYKXflI=;
 b=UzBuoDVDKgWrj0+EOLj0c2k+l4OJ8SoLXzHJR6cz4Z+hOaWWcbinoAIq1rpA5t8kjr
 R5YkYToTMQfzcuUqO5kPh0c8plI1DKVy01gkanpDyjSGtrB6Ole/rxhy4lJWTYB7CtlB
 CaDPL+4V9/o1ko3UPUYDzko2+yobUUKjF0i4FkyJ/X1eMbt0SNRX26UbGj49mebqPNSx
 nF0CMMnCM0Qqkl7pf+olzE4pML4UNPnebrHWRvJC+6OZI9wGxiAIEyqu0CT5X9/+/SGO
 1OmreehzGm+i9Y9qqbGGEgy+sEl+Ndoq0dU05Kpxp1TspZhiTO9AJgbWikJjhdmRcL5s
 Gjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682012577; x=1684604577;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+TzhZc9yQWq7VgjvLVqi8u/gby7qiRWi9FVhaYKXflI=;
 b=DK6RTVla0EKXGmZnBO9Xksuokx17SdbQ/dDidD3ibXRRlib7bA4WLklqmE1F+GteLh
 ct8wsaQtTNlnWFjgbcvy7deV+kSPlHgfpHToflfxLEWlIi7fDcAqDBV58JypIsbzUbqw
 CJl46h3qM/c+DUt2mm0F3DUkjl2Ja34t3de8rDojj4jJPbuOwjh2Qn1RFi49KKkrYSgM
 YWWyb3uutn/YeXBCE5HSmJHSd7n6y1EW06g1p2RlJ8V3PbqX9/RjB73E+QgkZeFmJ9OT
 JVM+QItZnRUgD4Svbi6Svj+BkGdzE3MJ2pm9419hOBFrNcBtzJ8PY88WFkr8emrau9sO
 b4JA==
X-Gm-Message-State: AAQBX9dAztmKHjVGN44IPB5J5cm0LkkX1UrL/WWP6VOVpEwbMdE1J9/2
 utWs+vcB2+pG4gwjHW78BJpFGA==
X-Google-Smtp-Source: AKy350Z3tmUhXP/NgbRsKumUGPJlDXZnoXcJZXDvX0bQb0Q6FTVUgwHLKg5oKDAPqc19R0LTOGqLQQ==
X-Received: by 2002:adf:ffcf:0:b0:2f1:ebac:b527 with SMTP id
 x15-20020adfffcf000000b002f1ebacb527mr2017920wrs.4.1682012577226; 
 Thu, 20 Apr 2023 10:42:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t26-20020a05600c329a00b003f17f9965a7sm5985715wmp.1.2023.04.20.10.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 10:42:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 370801FFB7;
 Thu, 20 Apr 2023 18:42:56 +0100 (BST)
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-12-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>, Jason Wang
 <jasowang@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Cleber
 Rosa <crosa@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, Tomasz Dzieciol
 <t.dzieciol@partner.samsung.com>
Subject: Re: [PATCH v2 11/41] tests/avocado: Remove test_igb_nomsi_kvm
Date: Thu, 20 Apr 2023 18:42:51 +0100
In-reply-to: <20230420054657.50367-12-akihiko.odaki@daynix.com>
Message-ID: <877cu6cuvz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> It is unlikely to find more bugs with KVM so remove test_igb_nomsi_kvm
> to save time to run it.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

