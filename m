Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C454B3FC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 16:57:29 +0200 (CEST)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o17yy-00088n-NA
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 10:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o17tC-0004TB-K4
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:51:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o17t9-0001cq-QU
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655218287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bieeJYcch7604MaeCv2YO2ZQ305299ceDwuPMTO/JXk=;
 b=YQxJtLT7XdGt5V0o3zF5hsTfdXpmOYVojg6QXn2IOr0mOnzUtOGmR5vRy0EFBNI28N2E+u
 OosimehJ+XrmECloMpAkOLpvV0A9lBGOHnmFrhbmNigEZzzoWBNOfqh2OAVSoLtOAMni3y
 JcfLekI36XBXrYCP4c+DwZ4McK3sEs0=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-VLWd8xh5On-wOJWwAWXTpw-1; Tue, 14 Jun 2022 10:51:26 -0400
X-MC-Unique: VLWd8xh5On-wOJWwAWXTpw-1
Received: by mail-vk1-f197.google.com with SMTP id
 k204-20020a1f3dd5000000b0035db6ead523so1486596vka.10
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 07:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bieeJYcch7604MaeCv2YO2ZQ305299ceDwuPMTO/JXk=;
 b=RCq60bEzweBSWqF92VXHgMyUTnah38XMbs8+xGSF1MrIBS+NJWmi1hLB9eUM3/v9TA
 fStd7mXd1XXosGPvtValZMS3dvSmgTtEg4/6EXEM9ts6stEAtisaLapqHLqVNXCqVWRS
 AezBNFQTUqVzn3NWMwNO3tRrxPzM0taRTOybJORUtVcllL8RCURtK5YeCK7o6P2CtXzM
 aykJ0Zs7ubFhnBtOcEs40NCLaPp+T2t6/Ya+bYO+W62iNWqt/qYozj65WqmTzmfUc4Qt
 RMX2wlqgQYccYN90li6xOQPbjA5VTOcibZhr3zj9p8Nme/OyEujCJQDWMU2WKfi1onDU
 69nw==
X-Gm-Message-State: AJIora+Eo+JBbsd3YABS/PxQAf1s7q3y6jMDgAbiVqokX0m14SRW7OR8
 tD+KwpNxFvv8U6oM7KKG+6RvBGL+3R5NwLZSvXlWDTwXNKdSJvJ6s7pRMQBjIAfW+uWrhf/y6rW
 KpVkgGpQAcOFXg+Fp+ijy5odG/f4JIu4=
X-Received: by 2002:a67:f592:0:b0:34b:ba28:f7b4 with SMTP id
 i18-20020a67f592000000b0034bba28f7b4mr2379730vso.61.1655218285361; 
 Tue, 14 Jun 2022 07:51:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uB6bPhKt0aQIpMT4AgapqCUyHO4RJFGYNHnW3/eZyyk3DsH/WK8v0Bfl2yvIIkmjRWcIMOCTZoSz/qEM9v+Jk=
X-Received: by 2002:a67:f592:0:b0:34b:ba28:f7b4 with SMTP id
 i18-20020a67f592000000b0034bba28f7b4mr2379719vso.61.1655218285139; Tue, 14
 Jun 2022 07:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-4-jsnow@redhat.com>
 <1cff5046-4248-437f-eba9-de1ef7fe6c66@redhat.com>
In-Reply-To: <1cff5046-4248-437f-eba9-de1ef7fe6c66@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Jun 2022 10:51:14 -0400
Message-ID: <CAFn=p-bA+_7VgtWPzsO7WcO8F8EBiA1knJRTXUA_Eyskqt3jEw@mail.gmail.com>
Subject: Re: [PATCH 3/5] tests/vm: use 'cp' instead of 'ln' for temporary vm
 images
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
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

On Tue, Jun 14, 2022 at 12:40 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 14/06/2022 03.50, John Snow wrote:
> > If the initial setup fails, you've permanently altered the state of the
> > downloaded image in an unknowable way. Use 'cp' like our other test
> > setup scripts do.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/vm/centos | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/vm/centos b/tests/vm/centos
> > index 5c7bc1c1a9a..be4f6ff2f14 100755
> > --- a/tests/vm/centos
> > +++ b/tests/vm/centos
> > @@ -34,7 +34,7 @@ class CentosVM(basevm.BaseVM):
> >       def build_image(self, img):
> >           cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
> >           img_tmp = img + ".tmp"
> > -        subprocess.check_call(["ln", "-f", cimg, img_tmp])
> > +        subprocess.check_call(['cp', '-f', cimg, img_tmp])
>
> I wonder whether it would make sense to use "qemu-img create -b" instead to
> save some disk space?
>
> Anyway, your patch is certainly already an improvement, so:
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

I wondered the same, but decided to keep a smaller series this time
around. VM tests already use a lot of space, so I doubt this is adding
new constraints that didn't exist before. A more rigorous overhaul may
be in order, but not right now. (It looks like the config file stuff
to override defaults is not necessarily rigorously respected by the
different installer recipes.)

I think the caching of the fully set-up image needs work, too. In
practice we leave the image sitting around, but we seem to always
rebuild it no matter what, so it's not that useful. There's a few
things that can be done here to drastically speed up some things,
but... later.

--js


