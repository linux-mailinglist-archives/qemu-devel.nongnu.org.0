Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C76944466D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:59:04 +0100 (CET)
Received: from localhost ([::1]:36950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJbL-0003Pb-0T
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1miJZM-0001pa-Hi
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:57:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1miJZH-0007uv-Dp
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635958613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sGibgLDdROyisKF2iBMiBecAcQxMeVsVCxpNjFCrkdI=;
 b=aYt47bz2BCi7uJaVMJGquN3wt9yCODXepXwsuvuo//vmM8Jrz47fx7Vx8LvPoWCF5BdiB/
 u6NIeXdkseP9eziBEwBcnHNPohJltoy76kCwjoF0S3qYRfLGEWa4Zdglh13jDZZD8Y3F9P
 wCkQKPF9x7GA1OyBOgMdutgsgLK72rE=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-dOBebNGwOy2muKykUW7ruw-1; Wed, 03 Nov 2021 12:56:52 -0400
X-MC-Unique: dOBebNGwOy2muKykUW7ruw-1
Received: by mail-pf1-f200.google.com with SMTP id
 134-20020a62198c000000b0047bf0981003so1678603pfz.4
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sGibgLDdROyisKF2iBMiBecAcQxMeVsVCxpNjFCrkdI=;
 b=rjIMEqWfqrG8DQSNeACw0bf+8PNUGoqt2PP9Yg2ZGbPhA6lOEmS7rADLfTIgU16tE4
 VEWW/NhPlYNdCFGkpZjTqg+VsWY5Z4K6gbwBMb/tqbj9WO2AG+9Z9gbFv03MZkm7fe15
 214uYU/7IDhiBnTg31ZB/pYJoNh7XlF6axyAPqvL0Ke3r+7lcTaK219Mj9ON3pooQeVG
 Ca453AFHBCSYTTxYMS5r5D2sgQG+N4YnrqiIyCMlqcLW8EY/XBgVFiwWhxr087DEGEOj
 m1V38a4D7HCaPo2lIE0nkpCcLaKZB/hjYPTSOY1s1iCpSK4jvCWydpaz3JPu5w+oIwR7
 ldwA==
X-Gm-Message-State: AOAM530iWII/1M/NDWqaSMuz0OGcNJ9DInMhnPAQNerV7yE6OU8VNxd6
 d7j16SSxVkq95D10LwaQQmp3oGTufQTnrMMMVE7IsHSG1h9zECvLCwTbNAmXPkzq9jwR1TnouWI
 xUw1nGMN0SGRyldXbmWZgHP2vBkOKtyk=
X-Received: by 2002:a62:8817:0:b0:481:7fe:c736 with SMTP id
 l23-20020a628817000000b0048107fec736mr24759951pfd.42.1635958611628; 
 Wed, 03 Nov 2021 09:56:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT7ziCTiW2kPduQsGKVMrkiN0KiXgZLqaCnjz6eXqmqfUJWRp5LzpyZv2vJPH5zINXp3ko0MPoOul/3rXbdAg=
X-Received: by 2002:a62:8817:0:b0:481:7fe:c736 with SMTP id
 l23-20020a628817000000b0048107fec736mr24759918pfd.42.1635958611418; Wed, 03
 Nov 2021 09:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-5-jsnow@redhat.com>
In-Reply-To: <20211103144844.1285634-5-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 3 Nov 2021 13:56:25 -0300
Message-ID: <CAKJDGDbK2ZEf0=fqoBdDmqtOFhxUedGAPmFb48AuuWKrrxQBgw@mail.gmail.com>
Subject: Re: [PATCH 4/6] docker: update Fedora-based cross-compiler containers
 to Fedora 34
To: John Snow <jsnow@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 11:50 AM John Snow <jsnow@redhat.com> wrote:
>
> Similarly to the last patch, Fedora 33 will be EOL by the time QEMU 6.2
> releases, so bump the version for all of the other Fedora containers,
> too.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
>  tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


