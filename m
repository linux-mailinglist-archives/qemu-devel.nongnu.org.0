Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBAC55C0CB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:50:13 +0200 (CEST)
Received: from localhost ([::1]:57846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69jQ-0006Rt-0p
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o69Og-0003bC-Ni
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o69Od-0004x6-Md
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656415722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=79atf44R/aZxr6z2cYMvM6aWG90rbelJ69CufYUHdh4=;
 b=fjEKMfBTc9mR17TwNDSUApEkN1u1LivdDhyIBcXHnaZCJZsvy3o0htAHJLzOfVjY+1Wpjt
 Yh5+orPf71DpkM+Vk/PfhXl/xK8wL5gBhMU39224QQu0PaQ5slGHsHsYmFqSccBGEG3sFr
 JoR8ysWLlBdDckPuSrfsoQV9+UCJN/g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-aY-LntH5M-Ou-vry-Q03YA-1; Tue, 28 Jun 2022 07:28:35 -0400
X-MC-Unique: aY-LntH5M-Ou-vry-Q03YA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u9-20020adfa189000000b0021b8b3c8f74so1736067wru.12
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=79atf44R/aZxr6z2cYMvM6aWG90rbelJ69CufYUHdh4=;
 b=CkDHpHJbHUOP844tRel77VWyy+c0wIlV38bxyixkG8K01luDOFXOkfBiMP3FxxH0a+
 STbwiEKqwVL7ytL8PXEXnSmJcspXCrBWuyS8vqQfQWh8eCba26Frn261Hq/08omsj6rt
 XphG9Oojh6I2XX/2xCoFoi/KWlsG9BOWZD6usMeJlYOP/VPW3rR6N9m2l6CYbKOfYyFv
 hvZ7rwg5fiPcMKfWL2BO8pP5W1E4iH+ywzjCh7bBkyJ+5fOdFou1F8LT+DYtSuNgD9mk
 /MjmDgn7/P0Xnayhn2/hf8NQn0siACJHdS519yQvuOaaf9sVGS3SAKosD+vwV5JvVNNT
 cCRA==
X-Gm-Message-State: AJIora8XJAWj2G1EYeBJNQmneWhbIWS4O3q3afqY6YhEbLkeV5ltgizl
 XzG+8BXeb1lMtpi0gkMz4jVKAkqnc2lkXB2LOS+SPGv8hVjH4rfIc9DABQSg3sZZ5gHstgWSsGH
 7mNsEV5tMKOua0g0=
X-Received: by 2002:adf:ea09:0:b0:21d:2245:ab84 with SMTP id
 q9-20020adfea09000000b0021d2245ab84mr359073wrm.542.1656415714479; 
 Tue, 28 Jun 2022 04:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vxt95Tt1ATv7YQ/xmfKR9oR6YDu3ZKYEnhKiH2+ruayVVTqQus/8RFPnsStIWz9332yigivA==
X-Received: by 2002:adf:ea09:0:b0:21d:2245:ab84 with SMTP id
 q9-20020adfea09000000b0021d2245ab84mr359050wrm.542.1656415714199; 
 Tue, 28 Jun 2022 04:28:34 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c441000b0039c4d022a44sm17420280wmn.1.2022.06.28.04.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:28:33 -0700 (PDT)
Date: Tue, 28 Jun 2022 07:28:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628072610-mutt-send-email-mst@kernel.org>
References: <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com>
 <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrrbHYJn5soL/V6n@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Jun 28, 2022 at 11:42:37AM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 28, 2022 at 03:58:21PM +0530, Ani Sinha wrote:
> > On Tue, Jun 28, 2022 at 3:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Jun 28, 2022 at 11:04:30AM +0100, Daniel P. Berrangé wrote:
> > > > If it is actually booting a real guest image (from biosbits) and interacting
> > > > with it, then it does feel like the scope of this testing is more appropriate
> > > > to QEMU's avocado framework than qtest, especially given the desire to use
> > > > python for it all.
> > > >
> > > > With regards,
> > > > Daniel
> > >
> > > I feel avocado is directed towards booting full fledged guest OS.
> > > It makes it much easier to figure out guest issues but it also
> > > prone to false positives and is harder to debug as a result.
> > > Booting a minimal image like this shouldn't require that.
> > 
> > Yes 100% agree with Michael on this. Biobits is *not* booting any OS
> > image. It runs off grub, that is, directly from bootloader stage. The
> > interraction with the VM is minimal.
> 
> Just because it doesn't run a whole Linux kernel, doesn't make it
> not a guest OS image. It is merely unsual in that it can do everything
> it needs from grub stage, because it is just poking low level BIOS
> stuff and doesn't need a full OS like Linux on top. This is still
> functional integration testing IMHO and relevant to avocado in QEMU.
> 
> With regards,
> Daniel

I think the main difference is not even in how it works, it's
in what it does. Which is check that ACPI tables are sane.
Who cares about that? Well developers do when they change the
tables. Users really don't because for users we have the expected
tables in tree and we check against these.


-- 
MST


