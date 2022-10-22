Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE360987A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:09:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omiRE-0001mt-8O
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omHTD-0005qK-7W
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omHTB-0000nw-45
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666456530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmAotS+VXmw8Fxx+iNsDyX0XnZ29O+5Ul7AKoG2r/xo=;
 b=Tf1zpgkFQtGfZXsVgRCe43Z1YkQ1u4/CdsToZTzlYwwf1Pdi9ZNJyhdzr5pmYrV+Zj2wBw
 IsLcDjdwtlrhAg/GddtM5Pn7aO4zXQsr2a1Tak+X88jaUekDIsqZ5stWiqFvtyynK9VcVL
 4TpoN+aF7f3ejHk0G4EuDfJSy6Ij++A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-bt3OcevtOuCqtv10eHkoiA-1; Sat, 22 Oct 2022 12:35:29 -0400
X-MC-Unique: bt3OcevtOuCqtv10eHkoiA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so3018260wmb.0
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 09:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dmAotS+VXmw8Fxx+iNsDyX0XnZ29O+5Ul7AKoG2r/xo=;
 b=FP4ILNpAT4Q82JryP3rR41wtTEIDe3YB0cfLbAhVWycL69YQZwTOXMQwElceohp75m
 KhcUq799INr9dJOVW/fk+wLIXRrEuaZmiOa+Pa/OFuVPWL1cnkWKEYYomC60O1lknkiT
 BiM709p0XYPBJu3BobbWnCHXbDQ12BGJxCbHjveQFomJV31cb7m/7rarhvJYHTWfSGZz
 yeOu1UmzE6bOmKBcDN8UXt/4SePXFii+VX1hSQL37dQa7Nc9OcDC3kv4+bP4HeXOVxx1
 BviQeORZS7RtplMfXTh0bB05W9mhpfjRe2J43lTh5LdNekRrYfk7wq6NQo8+hQ3iog8P
 PwZg==
X-Gm-Message-State: ACrzQf2thTpCZgSlSJuW7j0qG5h71rZiEVYXHqkH/QNVw/mADex+kgcy
 HMaToPTxzw/R49mNyex98oVBY6L+PMZpR2mOybdB5OO4/oJZdQkJf3biyX339zQpKXb/xWdBYlk
 +AR5yj7mvRq6nSPY=
X-Received: by 2002:a05:600c:4f46:b0:3c6:fb4f:3e1b with SMTP id
 m6-20020a05600c4f4600b003c6fb4f3e1bmr17096686wmq.159.1666456528218; 
 Sat, 22 Oct 2022 09:35:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KfbcXVRYRO8Q2sr/R8Egg1/2RlInAve+IVAIGAg9c8CQQt1s0wxgoYk8gvnvTPQnhWTUrxQ==
X-Received: by 2002:a05:600c:4f46:b0:3c6:fb4f:3e1b with SMTP id
 m6-20020a05600c4f4600b003c6fb4f3e1bmr17096670wmq.159.1666456527999; 
 Sat, 22 Oct 2022 09:35:27 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7435:2100:975b:ee03:5e6d:6634])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003b4cba4ef71sm3142511wmo.41.2022.10.22.09.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 09:35:27 -0700 (PDT)
Date: Sat, 22 Oct 2022 12:35:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Message-ID: <20221022123308-mutt-send-email-mst@kernel.org>
References: <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org>
 <20221021053828-mutt-send-email-mst@kernel.org>
 <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
 <87bkq575m8.fsf@linaro.org>
 <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
 <CAARzgwy8iEDxet6bHxe4AqU=9qQfC=pk=QWoLdF+rz61T1+bMQ@mail.gmail.com>
 <87pmel5fm7.fsf@linaro.org>
 <CAARzgwygyiK7FZppZEczHV3p8yz43N2v9-hL374mrNPWowDWXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwygyiK7FZppZEczHV3p8yz43N2v9-hL374mrNPWowDWXg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 22, 2022 at 06:28:32AM +0530, Ani Sinha wrote:
> 
> 
> On Fri, Oct 21, 2022 at 21:32 Alex Bennée <alex.bennee@linaro.org> wrote:
> 
> 
>     Ani Sinha <ani@anisinha.ca> writes:
> 
>     > On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, <ani@anisinha.ca> wrote:
>     >
>     >  On Fri, 21 Oct, 2022, 5:26 pm Alex Bennée, <alex.bennee@linaro.org>
>     wrote:
>     >
>     >  Ani Sinha <ani@anisinha.ca> writes:
>     >
>     >  > On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin <mst@redhat.com>
>     wrote:
>     >  >>
>     >  >> On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Bennée wrote:
>     >  >> >
>     >  >> > Ani Sinha <ani@anisinha.ca> writes:
>     >  >> >
>     >  >> > > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <
>     mst@redhat.com> wrote:
>     >  >> > >>
>     >  >> > >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
>     >  >> > >> > And have multiple platform specific branches in bits that have
>     fixes for those
>     >  >> > >> > platforms so that bits can run there. Plus the existing test
>     can be enhanced to
>     >  >> > >> > pull in binaries from those branches based on the platform on
>     which it is being
>     >  >> > >> > run.
>     >  >> > >> >
>     >  >> > >>
>     >  >> > >> What a mess.
>     >  >> > >> Who is going to be testing all these million platforms?
>     >  >> > >
>     >  >> > > I am not talking about branches in QEMU but branches in bits.
>     >  >> > > If you are going to test multiple platforms, you do need to build
>     bits
>     >  >> > > binaries for them. There is no way around it.
>     >  >> > > bits is not all platform independent python. It does have binary
>     executables.
>     >  >> > >
>     >  >> > > Currently bits is built only for the x86 platform. Other
>     platforms are
>     >  >> > > not tested. I doubt if anyone even tried building bits for arm or
>     >  >> > > mips.
>     >  >> >
>     >  >> > I'm not worried about test bits on other targets, but we do run x86
>     >  >> > targets on a number of hosts. The current reliance on a special
>     patched
>     >  >> > host build tool for only one architecture is the problem. If  we
>     just
>     >  >> > download the iso that problem goes away.
>     >  >>
>     >  >> 👍what he said.
>     >  >
>     >  > Yes, in that case the problem is that upstream bits does not pass all
>     >  > the test out of the box. Hence we are taking this approach of keeping
>     >  > some test scripts in QEMU repo and modifying them. Then generating the
>     >  > iso with the modified scripts. It also helps developers who want to
>     >  > write new tests or make enhancements to existing tests.
>     >  > If modifications need to be made to tests, they need to be versioned.
>     >  > We have gone through the route of not using submodules and I am not
>     >  > going to open that can of worms again.
>     >
>     >  We have added a mirror of biosbits to the QEMU project so there is no
>     >  reason why we can't track changes and modifications there (we do this
>     >  for TestFloat which is forked from the upstream SoftFloat code).
> 
> 
> One last option. Commit this patch set but also double commit patch 3 to the
> bits repo so that we can build an iso that would successfully run all tests for
> a separate platform independent test to be written later.
> 
> Then we will have two tests:
> 
> - this one for developers writing new test.
> - platform independent one for a basic sanity.
> 
> I’m just documenting the fact that I have proposed ideas that can work where
> all can be happy. It’s up to others to take it or keep objecting and killing
> motivations for freelance contributors. 

I think it's ok to apply this as is for starters.
Anyone has objections?

Down the road I think things should be refactored slightly to work as follows:
- test developers can check out biosbits repo to create the iso
- everyone else gets iso downloaded

Objections to this plan?


> 
> 
> 
>     >
>     > 
> 


