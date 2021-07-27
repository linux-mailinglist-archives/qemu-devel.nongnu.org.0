Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29D3D7B55
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:47:34 +0200 (CEST)
Received: from localhost ([::1]:44754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QEv-0007Jg-84
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m8QDb-0006OX-90
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m8QDY-0002lW-AY
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627404366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h/LGiYUaSpgkdPixIX7sJa30XN3IyWsZxFs6rf26dsY=;
 b=QyWq1BkSrf+oYzO7Rgb/m8x846QP7ncpSTiC+ZLmEeN0ZeWQB7wccWejxdhZopOjbSctG4
 cypNo7xJrM9HXpJGw68rJj6nVhENs0JzudrmB/5UMOFzUSqoIUTXLtWp2jovVy/MJxKxHZ
 mrU65YgfNfqJVbYw5TkPwjRNMbQwshg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-KHecQFn5MN6kBQHlX9-5bQ-1; Tue, 27 Jul 2021 12:46:05 -0400
X-MC-Unique: KHecQFn5MN6kBQHlX9-5bQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 pg12-20020a17090b1e0cb0290177328fc06dso33926pjb.2
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 09:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/LGiYUaSpgkdPixIX7sJa30XN3IyWsZxFs6rf26dsY=;
 b=ZFBf2UZkTYPHItkycJ5pLMSdWSWouN+zf+XHozCuqBiwOAlv/eR06GOlKENpWeqKjk
 +8BH44vpiCKUvYi2RR6xg+cc6s24lD7XIijqwS6j7dUvylpBON5iwyLSAyTkWGHLPBbS
 ONk0pQd79GbeAdh0mAsuEtdkhzPySu7p1ACEeo0xf7EhrgmnZgmbvwRyL7kWFLwYlMj3
 stTBSWDtm+Eou3EV8/mqkQN5CIf2oydzGCERKonywYzGJYhUE/geoAlvqLz2BL8JSiHv
 coB5Uhgnu0FIUfzG8QxaPXqKWtwI6WFal1xKXiMVkCB7M/9hvEBpy5gDizYBzOooJX2Z
 UYvw==
X-Gm-Message-State: AOAM533pQf7bIM5S+dGAIVW7jOpYE0xIdYicqGO2fteluufk4M5jZEFF
 nD0S0Og9ZLXSdons5/+jsz7557mF6aCdy2bE3TTQq81ctTpeSZtfIh37ThYU+opREvFQsHv9E+H
 1rXkxrkRaQ1ApweOOVzDZ3i8eKl30KrI=
X-Received: by 2002:a17:902:d681:b029:12b:381c:c86 with SMTP id
 v1-20020a170902d681b029012b381c0c86mr19608458ply.46.1627404364261; 
 Tue, 27 Jul 2021 09:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywGN/gYRIBXhjhSruy34cFD2LLvGEk+jROoH6iBupkXmy9Xngvk/sg0sEw2sqU/T+yfXMvo5aTQQguF2PlxDQ=
X-Received: by 2002:a17:902:d681:b029:12b:381c:c86 with SMTP id
 v1-20020a170902d681b029012b381c0c86mr19608442ply.46.1627404364043; Tue, 27
 Jul 2021 09:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210727162542.318882-1-thuth@redhat.com>
In-Reply-To: <20210727162542.318882-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 27 Jul 2021 13:45:38 -0300
Message-ID: <CAKJDGDYn8iRkWYfD1G8CS5tZRhgavG6gDuOZJopiCVSBdQxNjQ@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci.d/buildtest: Disable iotests 197 and 215
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 1:26 PM Thomas Huth <thuth@redhat.com> wrote:
>
> The iotests 197 and 215 are occasionally failing in the gitlab-CI now.
> According to the log, the failure is "./common.rc: Killed" which might
> be an indication that the process has been killed due to out-of-memory
> reasons. Both tests are doing a big read with 2G that likely causes
> this issue. It used to work fine in the gitlab-CI in the past, but
> either the program is now requiring more free memory, or the the CI
> containers have changed, so that the OOM condition now sometimes occurs.
>
> Anyway, these two tests are not really suitable for CI containers if
> they are doing things like huge reads (which is likely also the reason
> why they haven't been added to the "auto" group in the past), so let's
> simply disable them in the gitlab-CI now, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


