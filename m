Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E36FCE74
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 21:21:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwStF-0002wL-5z; Tue, 09 May 2023 15:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwStD-0002wC-Af
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:20:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwStB-0007Sc-U2
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683660045;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1V3yYk6mwL0dEf5Fo9ppiMkzLqr/ef+aguG8i0fTLw=;
 b=iTFuzukSCIx0PM1dr3CFL9ccLnxAESH83Tpj6zzlRjNyfFdWDsvvhv+3TQ3JsawRZatryV
 VJuCawk9kC8tUAMIvNOgTKKtIIPUuOvYpZVxqnga9eJTGp46ZTKNqyp+uszf99yxhMy3g0
 Yv81YE8VfSQn3KabqAYVL/f9HN1eb24=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-p91I3uvqMK6MlOqxPiNVzA-1; Tue, 09 May 2023 15:20:43 -0400
X-MC-Unique: p91I3uvqMK6MlOqxPiNVzA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-307814dd87eso1854136f8f.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 12:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683660042; x=1686252042;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e1V3yYk6mwL0dEf5Fo9ppiMkzLqr/ef+aguG8i0fTLw=;
 b=Qc/49RNhe+7XBdYkechEEOVIU0VIl7OOAjerIprPfLw06Q15+euflejoYYGzZmeco6
 3eHfP3/9QIX3nwvOQWVrPmyqEWUUwafxlB8v2oSOj8WiR26ub41nz2RX/ezK0IFbUXNr
 2SAUvgjKGPV0++e8F+DdkQlBKp18wPIM1RnaOQ0Qs3zJMmraRZutTu6bs8DltVwYEVQ9
 F4jX4w7MEmEG7C0gIGp5F3QZH9Bi0eTkRo4E5wYkfhz0s6wSL0+yRxpmY3hB8LqIQTsQ
 WIdovU/0N+7QcEn3KSUrjQ4IaUQ4Mv5zTPTj0k9C+6xI+d544CiDyq8M9EOz8pRMqofx
 +cNw==
X-Gm-Message-State: AC+VfDyRWXOcCths2ZmRGyU2ua2JZinABUALxbhAO/L/ezjZlx8Nx00f
 cIXwjljH/KlqKFMGXyOjO86Tqpz6/v8UTvL+LC+BCrvFyfALyN0iZ0GuNT0zSZE440U1W94wCxT
 UkyHyVridqWxAxic=
X-Received: by 2002:adf:eec8:0:b0:306:2656:66d4 with SMTP id
 a8-20020adfeec8000000b00306265666d4mr10140596wrp.58.1683660042701; 
 Tue, 09 May 2023 12:20:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ464E1MvamtfXcWT+RCSTVFNkP+bBKEJThxSMaLtk/z5LMtJigchMjWuKy9NuIlCSZCd5dqOQ==
X-Received: by 2002:adf:eec8:0:b0:306:2656:66d4 with SMTP id
 a8-20020adfeec8000000b00306265666d4mr10140578wrp.58.1683660042417; 
 Tue, 09 May 2023 12:20:42 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 a11-20020adfeecb000000b003048477729asm15099111wrp.81.2023.05.09.12.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 12:20:41 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Alex =?utf-8?Q?Ben?=
 =?utf-8?Q?n=C3=A9e?=
 <alex.bennee@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 0/2] gitlab: improve artifact handling
In-Reply-To: <20230503145535.91325-1-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Wed, 3 May 2023 15:55:33
 +0100")
References: <20230503145535.91325-1-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 21:20:40 +0200
Message-ID: <87ednpb9br.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> We are missing test log artifacts from various check jobs on failure,
> and also missing test logs from the coverage job
>
> Daniel P. Berrang=C3=A9 (2):
>   gitlab: explicit set artifacts publishing criteria
>   gitlab: ensure coverage job also publishes meson log
>
>  .gitlab-ci.d/buildtest-template.yml  | 4 +++-
>  .gitlab-ci.d/buildtest.yml           | 5 +++++
>  .gitlab-ci.d/crossbuild-template.yml | 1 +
>  .gitlab-ci.d/crossbuilds.yml         | 2 ++
>  .gitlab-ci.d/custom-runners.yml      | 1 +
>  .gitlab-ci.d/opensbi.yml             | 1 +
>  6 files changed, 13 insertions(+), 1 deletion(-)

Daniel

I love the idea of this series.

But I have no idea about gitlab, yml or gitlab, so my review is
useless.

But thanks for doing it.

Later, Juan.


