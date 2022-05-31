Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D40539655
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 20:34:36 +0200 (CEST)
Received: from localhost ([::1]:33388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw6hP-0005mL-AG
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 14:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nw6bL-00024w-Br
 for qemu-devel@nongnu.org; Tue, 31 May 2022 14:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nw6bH-0007IB-Qh
 for qemu-devel@nongnu.org; Tue, 31 May 2022 14:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654021693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ba3lV7ToBu+giVwETb98gOVMzisxKl1urHOcAERpKQg=;
 b=BqJDDjmmtUyz3C47FVKUnpyM1Deo6hNx+9MrrOzj0oBj/B3cm0VxnbNe1SfNdhfSVlQLCO
 QFMunZHDbotTOFPDtEZDt4s7/Kfnt8xotQGoeg+Fs6ZKGMe7gzuiesM1ucNQ5WU17fFCxw
 HtxKK3s7ONbAJAozGXJItdKm3oJWOAQ=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-3rlkeCyoMgGmz_1sH0BWcQ-1; Tue, 31 May 2022 14:28:11 -0400
X-MC-Unique: 3rlkeCyoMgGmz_1sH0BWcQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 by3-20020a056102504300b0033219f9bc12so1511005vsb.3
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 11:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ba3lV7ToBu+giVwETb98gOVMzisxKl1urHOcAERpKQg=;
 b=MT76cofdtX/cavqnsTBkPr7fyvfq3569gEEme4WQstfQekt9p2B32tp9DxoPBgW8oD
 EvJGAVvfY93rC+RXePjBjlrEus2iWBagwhNb2CKpClLBUoE3Ciwk8ybxeYqymRENjN+E
 RljOWyU1D0NilcNXPzgOA0b5n1GbPH5eQB+kQ5Kq9dpNucETseUGT8JTPiYoZnKwcdPM
 ddtzBUJEBtAiF9sfj9oAnZh34LuxPLBH31lMOSHPcW1A7IT+pQE5lSPmjy7GBpy2TRRJ
 a5sZytRTUvucWy5y94fetg+QjwcGK8iSb5imEvp+QBXRUsmdQDcPdJ4ajtPTE5z9dJqd
 kwJg==
X-Gm-Message-State: AOAM531ZrnU7rp2anPp5jgbRiIjTcRlW0626UMAAbAbZfNJRvf4Y1Msb
 oKdTC5Xihjj96GT05W4haRr8XiVXo5kc0Qxq4QnItaVlXMfvbofRsX2Tw6NSY8cAa0Q/D7YR56e
 VyEsEVVPeehxOhgb6rUYt0fPaLW3c6sg=
X-Received: by 2002:a1f:f288:0:b0:35d:20f:ffc with SMTP id
 q130-20020a1ff288000000b0035d020f0ffcmr822677vkh.1.1654021690939; 
 Tue, 31 May 2022 11:28:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWf8xHLM0Rd8wiMzQTIQ9Cmw8mxSxtdYxcIhZijC7BP0QBq1m1kOMkfm2seYF3wAsb5YxRYEpL1+Rwb0dAJ2Y=
X-Received: by 2002:a1f:f288:0:b0:35d:20f:ffc with SMTP id
 q130-20020a1ff288000000b0035d020f0ffcmr822664vkh.1.1654021690755; 
 Tue, 31 May 2022 11:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-9-jsnow@redhat.com>
 <3a0913d7-c148-2619-bdee-7f70b091a6a9@redhat.com>
In-Reply-To: <3a0913d7-c148-2619-bdee-7f70b091a6a9@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 31 May 2022 14:28:05 -0400
Message-ID: <CAFn=p-bnd54uvF38Xqexi9T+P0CHo1seLYoBpwCi2V0e-unkSg@mail.gmail.com>
Subject: Re: [PATCH 8/9] tests: add python3-venv to debian10.docker
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 30, 2022 at 3:33 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 26/05/2022 02.09, John Snow wrote:
> > This is needed to be able to add a venv-building step to 'make check';
> > the clang-user job in particular needs this to be able to run
> > check-unit.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/docker/dockerfiles/debian10.docker | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
> > index b414af1b9f7..03be9230664 100644
> > --- a/tests/docker/dockerfiles/debian10.docker
> > +++ b/tests/docker/dockerfiles/debian10.docker
> > @@ -34,4 +34,5 @@ RUN apt update && \
> >           python3 \
> >           python3-sphinx \
> >           python3-sphinx-rtd-theme \
> > +        python3-venv \
> >           $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
>
> Note that we'll (hopefully) drop the debian 10 container soon, since Debian
> 10 is EOL by the time we publish the next QEMU release.
>

Noted -- do you think it'd be OK to sneak this change in first and
have you move the requisite to the new container? :)


