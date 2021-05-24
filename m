Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B7D38F38C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 21:18:02 +0200 (CEST)
Received: from localhost ([::1]:57946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llG5Q-0001eM-TP
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 15:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llG3k-0000ic-7R
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llG3h-0002wC-IF
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621883772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TscgI868Dn2sdBEUD+oMyXoDWaIIqBNaiusrxhWWojQ=;
 b=BGHge/mLSdcYwsMQny3UAZlGvVJahHFVS9dCA4dUhVwDlsq7IQybxGmsC0ilSCcwm+Ki+9
 6oLVR9b6MEZK20pmrPbL2oqeDIJsYDevsUyf8AwpdJc0++BKERK7Pw36thqGpVHUCu6y2S
 4IbKKaSIJKc+Y6vuOkXtukpfTIel+As=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-NsWDxHhEOBa7W-BRc6rATQ-1; Mon, 24 May 2021 15:16:10 -0400
X-MC-Unique: NsWDxHhEOBa7W-BRc6rATQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 b8-20020ab026c80000b029020f97f38cfcso11214172uap.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 12:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TscgI868Dn2sdBEUD+oMyXoDWaIIqBNaiusrxhWWojQ=;
 b=MtS5K9kTz5vRuo17MdTVSVnh3uOIvCcI9tDku2sovy2ETJa8JbFMJ7FAO+P3x9gHpz
 g/Ks6ZPAVTEeUKgJo3/UIT5T+Qijf2PI6aHeZunJZsccPe/x9C1uOuH7gqoO7sTaQRlT
 aUF/GHn5gqQBmRg7ORoXFftPdnmmX3i2ur2JsSbOfbOrjYnYrRNc8UZaZJMq2KzIUC0E
 Mije25MU2N8BUqSUULwPzuhYHOMyYUgYZiklrA7nDMBt76U7M3uzEBBUrAGBugGFX3TP
 xzLkDepPsv3Sl31LP5Ng9+YCiEttdTS7NgJv8+i7sAnI8xLWji4EQd9rOVli0lz6R5Ii
 N6Lg==
X-Gm-Message-State: AOAM530yUdwdPQR9oLzpmyxMt5RFoCYxBh+flfB5vqmvVDyVtIFlguEm
 QPPFEW97oupR67YhPcU0f1CJP9HLnltuOB9DTQhqL3T0bSMnTmXsv2tesWuwiTtnv83sccXuohx
 hXcx0AXObsnZ6kzGJ8qP+5UWnii3IxHM=
X-Received: by 2002:a1f:308a:: with SMTP id w132mr22848265vkw.7.1621883769483; 
 Mon, 24 May 2021 12:16:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmppr1XvgCQ6OkHXTOcZ1fvIUyKhWWrpomhxbLPqslRoK5ii39XMbKcAxNsL2GBkwb/utS25sabUH+iWY1+5U=
X-Received: by 2002:a1f:308a:: with SMTP id w132mr22848253vkw.7.1621883769257; 
 Mon, 24 May 2021 12:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-3-alex.bennee@linaro.org>
In-Reply-To: <20210520174303.12310-3-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 24 May 2021 16:15:43 -0300
Message-ID: <CAKJDGDb+SknAs2FAAkiNryYEcMBc-47i6X3Eqz9-x0HnDpzq0g@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] gitlab: explicitly reference the upstream registry
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 20, 2021 at 2:43 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Since c8e6793903 ("containers.yml: build with docker.py tooling") we
> don't need to manually pull stuff from the upstream repository. Just
> set the -r field to explicitly use that rather than the current
> registry.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/containers.yml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


