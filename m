Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E0B4E4AE3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 03:26:57 +0100 (CET)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWqi8-0007Jc-5z
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 22:26:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWqh3-0006Pk-NB
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 22:25:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWqh1-0007mx-8I
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 22:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648002346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/AGFPtnUU5j2DDAcw4+UympW6ICv7i7lt3T5r1hiOU=;
 b=FNSJseyWsZ9SiLe6S0aP63t1OkYPsV62IxjumNOsWf5OAYA+lfffKXLUcbgjcFeNFYi59q
 9F5KCEeXWaDrnB269OdxYRAZFzDYa5rH+kJjm2GJwX46NLgu+04/bKL94amoV4tz2f9H2b
 pr6AAEj0Jz3qvfL0SI52l7Qy+6Z8rPQ=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-zAKhiilBP_KuLxU4VIkySw-1; Tue, 22 Mar 2022 22:25:45 -0400
X-MC-Unique: zAKhiilBP_KuLxU4VIkySw-1
Received: by mail-vk1-f199.google.com with SMTP id
 d127-20020a1fe685000000b0033e7682a9c0so58148vkh.3
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 19:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D/AGFPtnUU5j2DDAcw4+UympW6ICv7i7lt3T5r1hiOU=;
 b=O20wciD7r9qEPXcZWIJXmoYnkIIRtoDsYmLoviWSqjlFzzzpqqAgc8+FtPGY9SYLMk
 oolB+EUk4vaVx3RUksdGXpTgMAaad8Msz/49of3JXQsl5HFboYdM58j7qLw1lr25Yyjp
 eIGfVyNSmLUDuRwmP+VniO46Ip+Ge53i90aCkGcbCCTIlB0ACtZrqJniBNGWggjDGLvE
 aVRcb6ctwxz1dmRPYl7Y4bGU3WokvV5j30CfHMb3fHK7Std5epep5Wkn8bXNpFLZeVIy
 Q7FVZqQclUMzzLAnNL8AdnHRuR2QMKY+Mf2zbYKXJb1MZJOfmuR7jGAaJqJaPDey78Yd
 wqLw==
X-Gm-Message-State: AOAM530uqfDlfFvZ5K+mgD70sd/kWZQXKMHOcMXb2f4NpTiLMLbdnefP
 Khz3IlO8p5PtTp7DXFUtf39lW+6AquzFBmqaU8yUtVp9CCmQ/Vg5RI6pcQ3olQUJMLGaVdwvclb
 3OxeCEiZqRHcyvJ8h+craOh8d7nNdLno=
X-Received: by 2002:a1f:3244:0:b0:332:2037:83b1 with SMTP id
 y65-20020a1f3244000000b00332203783b1mr11925194vky.24.1648002344623; 
 Tue, 22 Mar 2022 19:25:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOhrOGK2Ch3hCq3aK+VPKbbYQEdgvQdfJIzZuvHXOVn4BZnModGvH2t3Z57U9WutkvEXv6avQ6boM9D2CbJBs=
X-Received: by 2002:a1f:3244:0:b0:332:2037:83b1 with SMTP id
 y65-20020a1f3244000000b00332203783b1mr11925183vky.24.1648002344441; Tue, 22
 Mar 2022 19:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211118115733.4038610-1-philmd@redhat.com>
 <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
 <1c5dfae3-1c3c-bd2f-d2b5-06dbe75c04c8@redhat.com>
 <4df33af0-0a28-2e20-1909-25baf87d0565@redhat.com>
 <01a68a16-fa01-e7f3-4248-fdec6595cf74@redhat.com>
 <38386efc-1e83-63d4-703d-10c7650e7829@redhat.com>
 <0656151f-a76d-bdd2-cdc9-ea0d1543b0f9@redhat.com>
In-Reply-To: <0656151f-a76d-bdd2-cdc9-ea0d1543b0f9@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Mar 2022 22:25:33 -0400
Message-ID: <CAFn=p-bwpT7MRhC5xVcsDHnfGfFzKDeu_H5+DZ4irvLUQaOP_A@mail.gmail.com>
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Qemu-block <qemu-block@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Jon Maloy <jmaloy@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 2:50 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 10/03/2022 18.53, Jon Maloy wrote:
> >
> > On 3/10/22 12:14, Thomas Huth wrote:
> >> On 06/02/2022 20.19, Jon Maloy wrote:
> >>> Trying again with correct email address.
> >>> ///jon
> >>>
> >>> On 2/6/22 14:15, Jon Maloy wrote:
> >>>>
> >>>>
> >>>> On 1/27/22 15:14, Jon Maloy wrote:
> >>>>>
> >>>>> On 11/18/21 06:57, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>>>> Trivial fix for CVE-2021-3507.
> >>>>>>
> >>>>>> Philippe Mathieu-Daud=C3=A9 (2):
> >>>>>>    hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
> >>>>>>    tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
> >>>>>>
> >>>>>>   hw/block/fdc.c         |  8 ++++++++
> >>>>>>   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
> >>>>>>   2 files changed, 28 insertions(+)
> >>>>>>
> >>>>> Series
> >>>>> Acked-by: Jon Maloy <jmaloy@redhat.com>
> >>>>
> >>>> Philippe,
> >>>> I hear from other sources that you earlier have qualified this one a=
s
> >>>> "incomplete".
> >>>> I am of course aware that this one, just like my own patch, is just =
a
> >>>> mitigation and not a complete correction of the erroneous calculatio=
n.
> >>>> Or did you have anything else in mind?
> >>
> >> Any news on this one? It would be nice to get the CVE fixed for 7.0 ?
> >>
> >>  Thomas
> >>
> > The ball is currently with John Snow, as I understand it.
> > The concern is that this fix may not take the driver back to a consiste=
nt
> > state, so that we may have other problems later.
> > Maybe Philippe can chip in with a comment here?
>
> John, Philippe, any ideas how to move this forward?
>
>   Thomas
>

The ball is indeed in my court. I need to audit this properly and get
the patch re-applied, and get tests passing.

As a personal favor: Could you please ping me on IRC tomorrow about
this? (Well, later today, for you.)


