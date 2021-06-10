Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C956D3A344B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 21:50:06 +0200 (CEST)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrQgn-0000Dz-Sn
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 15:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lrQfe-0007hE-0P
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lrQfZ-0006Iq-1R
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623354527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JyeYLyhIzc+KopoEKT13Vuc8haXpM0rX/3LXUdnIRgc=;
 b=igV89iVWTyvvMD8ZfMr89d2VeZhePojck4d5qOjLjLnzivJrmLons7Mezl8tapwIJ4vWf+
 g00oatnHK+W6e/eKGOf7aLfWnvXpihAulqDg8LW3vz4SbDuKAOTcDxnU76NUnv4wTGweAE
 VfHNRnuFx2o8gl2QFjgqF5/Z/IgRBAc=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-I2Y8bHTwMqCKoMj1X_0bzA-1; Thu, 10 Jun 2021 15:48:44 -0400
X-MC-Unique: I2Y8bHTwMqCKoMj1X_0bzA-1
Received: by mail-vs1-f72.google.com with SMTP id
 m14-20020a67fe4e0000b0290255df7450beso1455883vsr.8
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 12:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JyeYLyhIzc+KopoEKT13Vuc8haXpM0rX/3LXUdnIRgc=;
 b=f7+MVHZAwywrkSfV1tUQf4RNslVZ4A0m8n63wu5P2Ywok1XOqIIi9fNVGqxJ7wjI6Y
 ewqNd/XIQLoSygxZBtW9SGueTr+7xK0d687IeII+hFJipH618BHvFPTnTJkeSbleonoP
 six8tmPkKYz85alMNjg5olF6awojAKS1Jsnf2nskRdFG8pETcnPprTZn012Vp8QlktLd
 rYmPf+IM17CHFgPveyuNOgRsnpb4z8t15gmqLwqYrlWvQvb6pGcMvMOBLDCll8D0DP2K
 VFTSuHqpJU+2edPdqtlghwkZqGXJ6ghApAXpeDRIs+EgsArQ36nYfo4A0TnP8cPj+xIv
 v02g==
X-Gm-Message-State: AOAM530ifcev5N67doqaMMiuW9c4EhaJq6gVemnciY7Quo4Baug4DPb2
 5OjvT7JNI1tEwKXg2xaegIN9jrvsaNiAqO4gm9o7c03FsW5HgbiPSycOIwR6ezIEJx+7a0s1zL2
 cPYkE0sF0YAfv2WBMAVFxfw0sypMJ8x0=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr82912uam.5.1623354524082;
 Thu, 10 Jun 2021 12:48:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5LvJ23G5bDiqaf+VAOjj3DwxH7XuGQCCaRzKZbur/ov5fbyp1CLRdB2fMoy9ghZyhC8JWlBQNXZlHDgZ8Gbo=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr82891uam.5.1623354523931; Thu,
 10 Jun 2021 12:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210608140938.863580-1-crosa@redhat.com>
 <20210608140938.863580-3-crosa@redhat.com>
In-Reply-To: <20210608140938.863580-3-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 10 Jun 2021 16:48:18 -0300
Message-ID: <CAKJDGDaApz97BL7Anf8gmyDzN3EKi0z31OYURTJB6M5KPzzz8g@mail.gmail.com>
Subject: Re: [PATCH 2/4] Python QEMU utils: introduce a generic feature list
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 11:09 AM Cleber Rosa <crosa@redhat.com> wrote:
>
> Which can be used to check for any "feature" that is available as a
> QEMU command line option, and that will return its list of available
> options.
>
> This is a generalization of the list_accel() utility function, which
> is itself re-implemented in terms of the more generic feature.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  python/qemu/utils/__init__.py |  2 ++
>  python/qemu/utils/accel.py    | 15 ++----------
>  python/qemu/utils/feature.py  | 44 +++++++++++++++++++++++++++++++++++
>  3 files changed, 48 insertions(+), 13 deletions(-)
>  create mode 100644 python/qemu/utils/feature.py
>

Based on my comments from the next patch of this series:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


