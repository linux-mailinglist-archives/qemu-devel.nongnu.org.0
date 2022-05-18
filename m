Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF7F52B09A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 05:04:04 +0200 (CEST)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr9yl-0001wy-7Z
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 23:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nr9xe-0001Bb-M7
 for qemu-devel@nongnu.org; Tue, 17 May 2022 23:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nr9xb-0003VF-HJ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 23:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652842970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=McLcEkC7pziazZkHhK8jGa0WY1GqkSWAOaEvIatj7uY=;
 b=A8ciLToEBrkKaB3NR5jbzbbrfhPV1/rF9WHSLP1OBOUzHvZ91dPSvIGmnHPgPM3piYXhBI
 /bipvnIfma80JXFUdXD1Y00aNIIBmO2clq394oQBUsBJwNyApC0M0+RfFq41VqQp1yte20
 nod1bvOy4AIPUl5GVhlX1GZTprk6oSM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-y3Af7H88MomTaqxiFyMnvA-1; Tue, 17 May 2022 23:02:48 -0400
X-MC-Unique: y3Af7H88MomTaqxiFyMnvA-1
Received: by mail-lf1-f69.google.com with SMTP id
 i8-20020a0565123e0800b004725f87c5f2so437632lfv.1
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 20:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McLcEkC7pziazZkHhK8jGa0WY1GqkSWAOaEvIatj7uY=;
 b=FwcbH/khNGjT+K7KBpxt/rJPy2MWBrTGEW24/Iys4rFbCThlLYIhAjzY6JVMUSrKxs
 xeMIVMm5CUya2CHobg7K2eiLpPoFBG4Ac7ktbS+1Lhoha/fKVZgAvV8uAkZWz9KBnOMu
 X1/u6ooam3THI/MYSMWfOjg6FPPvbmyh/NTTCIxhHRPndyGns2xWGxJkbUJQmCCyFOKs
 JdAJi2dQJUn3heOCHguCIysA5hjXJFyQU1FJVh2YWbvYrRqpZbxGVNBOq92tH/Y0c45B
 EqfSZ+bunmhGZvnP6rypAP1oZao+Tp3yjxQ+cGTzedGCbWaAaVMTmO9vHg1XF470zxqH
 0QTw==
X-Gm-Message-State: AOAM5314hTnCFv6nI1kFTY5DNWY1m+LcwotNvgrLw8b9/FZXh0J3KXAW
 Z7i/Awv2qjzw/GqFeOQz/3rkbLXG2DKmvYEixYaaRVvNaQgyO31UbC0bu9Ge7cqrWMB+Jth2/aI
 l7j+8XGaBHjD0dVFZ4NkbakReQVaos34=
X-Received: by 2002:a05:6512:3e0a:b0:477:b256:56b with SMTP id
 i10-20020a0565123e0a00b00477b256056bmr2285814lfv.587.1652842967286; 
 Tue, 17 May 2022 20:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjdT9zDYaj7e6tXjDUbhnJLVID8BdJVaGDeIyUOTkQpfjKtoeuuwL5LeLFnlQCM6qCO9MeA5cHMt/mpr32VuA=
X-Received: by 2002:a05:6512:3e0a:b0:477:b256:56b with SMTP id
 i10-20020a0565123e0a00b00477b256056bmr2285787lfv.587.1652842967024; Tue, 17
 May 2022 20:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220317172839.28984-4-Vladislav.Yaroshchuk@jetbrains.com>
 <CA+E+eSBJUWGqA_KQDX4RRhXpVj6GM1suNDtUxv+-qavOiwJ0vA@mail.gmail.com>
In-Reply-To: <CA+E+eSBJUWGqA_KQDX4RRhXpVj6GM1suNDtUxv+-qavOiwJ0vA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 18 May 2022 11:02:35 +0800
Message-ID: <CACGkMEt2jpn9XMbZK6sGxq7BdtFA6uQ5J3p4zCqP-+1TQ+q8ZQ@mail.gmail.com>
Subject: Re: [PATCH v22 3/7] net/vmnet: implement shared mode (vmnet-shared)
To: osy <osy@turing.llc>
Cc: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, 
 Eric Blake <eblake@redhat.com>, phillip.ennen@gmail.com, 
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>, 
 Markus Armbruster <armbru@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>, 
 Roman Bolshakov <roman@roolebo.dev>, Peter Maydell <peter.maydell@linaro.org>, 
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, May 18, 2022 at 11:01 AM osy <osy@turing.llc> wrote:
>
> On Thu, Mar 17, 2022 at 10:28 AM Vladislav Yaroshchuk
> <vladislav.yaroshchuk@jetbrains.com> wrote:
> >
> > Interaction with vmnet.framework in different modes
> > differs only on configuration stage, so we can create
> > common `send`, `receive`, etc. procedures and reuse them.
> >
> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> > Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
> > Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>
> Hi Vladislav,
>
> Thanks for the patches. We ran into an issue integrating it into UTM
> when we discovered that by targeting a lower macOS version (we like to
> have one binary for all macOS versions), newer features were compiled
> out. This commit resolves that and we think it would be beneficial to
> others as well. Since it does not appear the submission has made it to
> mainline yet, it could be integrated into your patchset.
>
> https://github.com/utmapp/qemu/commit/6626058f225c9c6a402f9ac6f90aa0b7e94d175c
>
> Thank you!

I plan to send the pull request soon.

Could you please post a patch for this then we can have it in the next
pull request?

Thanks

>


