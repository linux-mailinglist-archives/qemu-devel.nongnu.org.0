Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D275E6C3F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:56:22 +0200 (CEST)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSJ3-0005Y3-40
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obSD2-0006Dk-Ms
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obSCv-0001Y4-56
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663876200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ZXRmhPwX9gChpCINfr2PtClLxFqm5t+8Ejuiulypl8=;
 b=RNGuDYqeN0ftIY4WqMsP5fyw//atg3JuuvRN0iiE4E+v/TF9s92vAoBefxTph+gxI3uHrI
 KvUk6BdxvyanAI9mLz2pd/v6MeFzabjOAnlHRQDyu3oZtjM3yjE9ai8lMeA79zqr+c8yyL
 7kxyj14jsuRNsPV+gTCTCYY+jcsyFok=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-UiWNJoApMkuF0R7KR5Id0w-1; Thu, 22 Sep 2022 15:49:58 -0400
X-MC-Unique: UiWNJoApMkuF0R7KR5Id0w-1
Received: by mail-qt1-f197.google.com with SMTP id
 e8-20020ac85988000000b0035c39dd5eb9so7150542qte.16
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 12:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7ZXRmhPwX9gChpCINfr2PtClLxFqm5t+8Ejuiulypl8=;
 b=S8d4BFqeaAaspYMQaaY2s2bjTQdvDUWvV/+Nxl6qv38BQIvVmLlMm3+8XVYSMwZNql
 txoltdkbWybbrWBEzkLa1G24vU1scxYcoxwUqWPPRiToaB2/aezNpxEg5Dvasax9P9Kn
 xZbs5hZ3gs6wkrbk8lh0S7B5L8jjpI2XUSlu8l2WT1INRDLbFBZnUSKlewKlps4WaTW3
 a168M+Ezr6hFk1z16/dYDT7tRqf26dODihvhmU/IudSS/QWkRujifroiZhH2mVf096Xe
 m/MVV9uUW9sJKHLlievF44BUoba91JhIAyNRJjWXywqALYUDqsyH+2ntU4ghPgYHvY6v
 J7MA==
X-Gm-Message-State: ACrzQf1j/JQl7ahWGLJQ8eDV0AEPSuq8B720AoQMxgPiekuiwImcdycG
 tPd9f1wnaWlSmXSd9DzIGv7vxpETKnjzave3FT7TX2IKAuqf/JOjBmHiT5hLUWALq5qkllx0p8s
 YHepq8z5folReftCqtbubIS0Eo1G/5EM=
X-Received: by 2002:a37:503:0:b0:6ce:8a8e:7625 with SMTP id
 3-20020a370503000000b006ce8a8e7625mr3444851qkf.288.1663876198193; 
 Thu, 22 Sep 2022 12:49:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6d65F7z9P/VgdBAGCLBW1PBf+X0H6uAmc4XjUsUvh1VO6n1cVpAlv7NIWL0eCtsPfiPMdwdIImX+4sAHU+gYQ=
X-Received: by 2002:a37:503:0:b0:6ce:8a8e:7625 with SMTP id
 3-20020a370503000000b006ce8a8e7625mr3444843qkf.288.1663876197974; Thu, 22 Sep
 2022 12:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220922101454.1069462-1-kraxel@redhat.com>
 <YyxF2TNwnXaefT6u@redhat.com>
 <20220922122058.vesh352623uaon6e@sirius.home.kraxel.org>
 <CABgObfavcPLUbMzaLQS2Rj2=r5eAhuBuKdiHQ4wJGfgPm_=XsQ@mail.gmail.com>
 <20220922141633.t2dk2jviw2f3i26x@sirius.home.kraxel.org>
 <CALMp9eSEDEit0PEAt_qUwGhBRBPZNsyjasiuJhcrFKT9Zm4K=A@mail.gmail.com>
In-Reply-To: <CALMp9eSEDEit0PEAt_qUwGhBRBPZNsyjasiuJhcrFKT9Zm4K=A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 22 Sep 2022 21:49:46 +0200
Message-ID: <CABgObfZApegzv_4AxMRf0p0LvGWoqnBL289vBXL3g-F-tpL8SA@mail.gmail.com>
Subject: Re: [PATCH v4] x86: add etc/phys-bits fw_cfg file
To: Jim Mattson <jmattson@google.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org, 
 Marcelo Tosatti <mtosatti@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Sep 22, 2022 at 7:13 PM Jim Mattson <jmattson@google.com> wrote:
> > Treating 40 as invalid and continue to use the current conservative
> > heuristic, otherwise treat phys-bits as valid might work.  Obvious
> > corner case is that it'll not catch broken manual configurations
> > (host-phys-bits=off,phys-bits=<larger-than-host>), only the broken
> > default.  Not sure how much of a problem that is in practice, maybe
> > it isn't.
> >
> > I think I still prefer to explicitly communicate a reliable phys-bits
> > value to the guest somehow.
>
> On x86 hardware, KVM is incapable of emulating a guest physical width
> that differs from the host physical width. There isn't support in the
> hardware for it.

Indeed, everything else is a userspace bug. Especially since here
we're talking of host_maxphyaddr < guest_maxphyaddr, which is
completely impossible.

Paolo


