Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0933FD9D0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:44:58 +0200 (CEST)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPbt-0000kt-KM
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mLPYU-0005L7-Gr
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:41:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mLPYS-00020Y-Ra
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:41:26 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso4683654wmb.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DJRyFw+NsoWizR8/Gz1EURT5nc40+Amh0x3vDZYJm1I=;
 b=GkBcrTzJOiBcjnJm9ypySfHikIl9uZSozszUAHsGiWVlPUgJswv1XO1fAugD+B2+iI
 qSL4gERJ3am3Vqn4iaNMK84mFvC0SbSvjrBMSsMmlkWUPL7829oSYKlu0/qHqpTBEU1W
 3x2qncCo2eijVwS9iNjf1Zx3h44IedMlx/XbK9lLz/VPOmz/mSb7zP5bJvPTzPwpN+Pr
 ycF1NnxZ5wCcVGsfE94XpuZjqawNTN37SxICEWFuKVTw2x7rtCEXs5uDlgiGbNyrSonY
 ccVHt6bmajVRMYxuNMg0x/vx+eVrMj/kaTGPOvrDuRCrlExrkzWYLXm7dJkLLri2VS5X
 QXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DJRyFw+NsoWizR8/Gz1EURT5nc40+Amh0x3vDZYJm1I=;
 b=mrZd3MDAiwj6wtsXdDsSJQhPjT82x7zz/Bi5KL0O2JIz4H9ummlNz5C4Meg9PA3qVl
 EI+sssKSqMAhB1oZcjSP7lx6+n5L4BFNWy12/jaGQOQNgaz9vh2OQjfN0/yLWp9sFpSz
 /760oh3u8+uyG6ElTDKYLxJZ9A7teiOABYQsVAd6z4DvJp6rsmltlkSiGL2RcBmde4pS
 GSwjpBTn80mCGYpnnwHJ3ubjDTejxqKYwhpB0xQTHFL5PcFzYypNQ0bnz85Cr7ghugIZ
 bLZxnBlJ1FAFDSXrKmB1Byhuk/+QbP7hOn7ySN090gl/BrH6UM6gRZCqVnm+JshqT2tI
 42Bw==
X-Gm-Message-State: AOAM532tfNRD9p3Fg9sselG7eXCP5FhQENtMRooWoajclqRjUslwC40U
 6m80pffqmkMdfPAA9lfgKaHR1Yv40mvtpw==
X-Google-Smtp-Source: ABdhPJyKlvRX3qOIU8zXGCo7TGzewANAcX+lgJuKBRVKdOjn378egW9FF3sdqPILT2hG4OLe4k4qeg==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr9485993wmc.138.1630500082344; 
 Wed, 01 Sep 2021 05:41:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u9sm21356949wrm.70.2021.09.01.05.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:41:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 998801FF96;
 Wed,  1 Sep 2021 13:41:20 +0100 (BST)
References: <20210830121534.656559-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH] docs/devel: be consistent about example plugin names
Date: Wed, 01 Sep 2021 13:41:14 +0100
In-reply-to: <20210830121534.656559-1-ma.mandourr@gmail.com>
Message-ID: <87a6kwh3in.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Some plugins were prefixed with `.c`, some were not. Since the name is
> essentially the full-name of the plugin file, it's logical to include
> the extension.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Queued to pr/010921-for-6.2-1, thanks.

--=20
Alex Benn=C3=A9e

