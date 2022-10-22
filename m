Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ACB609965
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 06:50:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omiZ2-0003fq-DP
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omHfI-0006s0-88
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:48:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omHfG-0002UQ-EI
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666457279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwImJoYTJI6IzhIxObrqsfYHCjX16MpXUBlg5Z8kLys=;
 b=NRsQHfoz1p+4Wr/mnEckad91bGLwoSwTKMPmlJMwUmfex1p47t0bU3MJuCu/poTnQ7N76b
 EkngFZoA6wmU0rmP+EIP4KWj1d2ioQe0j7eVSiUTrLw2LtnhUbM5YikhiWmWlF04/+yAlo
 wWmTke0u5DtaJs+I8XgfYhjkXtNjHDY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-YdMdu_8aOXmPS2PA76Ve2w-1; Sat, 22 Oct 2022 12:47:58 -0400
X-MC-Unique: YdMdu_8aOXmPS2PA76Ve2w-1
Received: by mail-wm1-f71.google.com with SMTP id
 k22-20020a05600c0b5600b003c6cf5c5592so1253768wmr.3
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 09:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwImJoYTJI6IzhIxObrqsfYHCjX16MpXUBlg5Z8kLys=;
 b=VxlsS/Z0GFqbYoYjLKwgD3aa0MFoffrHMDX5sNXsutidoRLG+BOMiTC9BL6/V6YnXL
 f5nbA/xVY4/5eurERfUIWyCNqff0pKcXIS5aa0EYhFcr+xuQUN4Nl4i5rn/hzdDP89Oc
 LyFNFGrsi6o4OnAw4YZb1VB2vJGQPvFSXO3pDj15G1mvQ9Mwpe+fGdZExPDtxFZuslyp
 DIhrYFv6AbmXgS7LR1gtBQ3z1fMghCQqwNLYAk4V1NMv//W39tpEAnGsiP4wQBaWFOQW
 IOBHRJWx89zQb/UEnyD+//EY2j2ejukdkZnSiq3GvKbCuiqm7eTH9lvlOZWFltFzPPJU
 wCEA==
X-Gm-Message-State: ACrzQf2hAncu59Ak4u30hexKrsDvAsjc1lzrvgQ+JwCIssrzuyS/Qeli
 WgxwfoetVc3UFr2B86r3CctgEEAmfZ0R4TAVfaPzjbhbfmkwR2QbUercjLlTuTqoTirZapL6MZU
 9kGpY3tuEp4F8mRI=
X-Received: by 2002:a05:6000:1565:b0:235:37f6:9e06 with SMTP id
 5-20020a056000156500b0023537f69e06mr10537604wrz.211.1666457277030; 
 Sat, 22 Oct 2022 09:47:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7yej3TAvTGM2wrdwsYPzTMfpRqh8jSenBgQSdr7tT8zrwr02OpdeBv6GLSvB8D5XhPsaxJpw==
X-Received: by 2002:a05:6000:1565:b0:235:37f6:9e06 with SMTP id
 5-20020a056000156500b0023537f69e06mr10537588wrz.211.1666457276735; 
 Sat, 22 Oct 2022 09:47:56 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7435:2100:975b:ee03:5e6d:6634])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d504a000000b0022a9246c853sm21718546wrt.41.2022.10.22.09.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 09:47:56 -0700 (PDT)
Date: Sat, 22 Oct 2022 12:47:53 -0400
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
Message-ID: <20221022124624-mutt-send-email-mst@kernel.org>
References: <87k04t7ca6.fsf@linaro.org>
 <20221021053828-mutt-send-email-mst@kernel.org>
 <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
 <87bkq575m8.fsf@linaro.org>
 <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
 <CAARzgwy8iEDxet6bHxe4AqU=9qQfC=pk=QWoLdF+rz61T1+bMQ@mail.gmail.com>
 <87pmel5fm7.fsf@linaro.org>
 <CAARzgwygyiK7FZppZEczHV3p8yz43N2v9-hL374mrNPWowDWXg@mail.gmail.com>
 <20221022123308-mutt-send-email-mst@kernel.org>
 <CAARzgwztz3TG+f8+NoYU6KyxNQBKfZ76abTDPXs696iNiw5BEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwztz3TG+f8+NoYU6KyxNQBKfZ76abTDPXs696iNiw5BEQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Sat, Oct 22, 2022 at 10:13:13PM +0530, Ani Sinha wrote:
> 
> 
> On Sat, Oct 22, 2022 at 22:05 Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Sat, Oct 22, 2022 at 06:28:32AM +0530, Ani Sinha wrote:
>     >
>     >
>     > On Fri, Oct 21, 2022 at 21:32 Alex Bennée <alex.bennee@linaro.org> wrote:
>     >
>     >
>     >     Ani Sinha <ani@anisinha.ca> writes:
>     >
>     >     > On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, <ani@anisinha.ca> wrote:
>     >     >
>     >     >  On Fri, 21 Oct, 2022, 5:26 pm Alex Bennée, <alex.bennee@linaro.org
>     >
>     >     wrote:
>     >     >
>     >     >  Ani Sinha <ani@anisinha.ca> writes:
>     >     >
>     >     >  > On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin <
>     mst@redhat.com>
>     >     wrote:
>     >     >  >>
>     >     >  >> On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Bennée wrote:
>     >     >  >> >
>     >     >  >> > Ani Sinha <ani@anisinha.ca> writes:
>     >     >  >> >
>     >     >  >> > > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <
>     >     mst@redhat.com> wrote:
>     >     >  >> > >>
>     >     >  >> > >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
>     >     >  >> > >> > And have multiple platform specific branches in bits
>     that have
>     >     fixes for those
>     >     >  >> > >> > platforms so that bits can run there. Plus the existing
>     test
>     >     can be enhanced to
>     >     >  >> > >> > pull in binaries from those branches based on the
>     platform on
>     >     which it is being
>     >     >  >> > >> > run.
>     >     >  >> > >> >
>     >     >  >> > >>
>     >     >  >> > >> What a mess.
>     >     >  >> > >> Who is going to be testing all these million platforms?
>     >     >  >> > >
>     >     >  >> > > I am not talking about branches in QEMU but branches in
>     bits.
>     >     >  >> > > If you are going to test multiple platforms, you do need to
>     build
>     >     bits
>     >     >  >> > > binaries for them. There is no way around it.
>     >     >  >> > > bits is not all platform independent python. It does have
>     binary
>     >     executables.
>     >     >  >> > >
>     >     >  >> > > Currently bits is built only for the x86 platform. Other
>     >     platforms are
>     >     >  >> > > not tested. I doubt if anyone even tried building bits for
>     arm or
>     >     >  >> > > mips.
>     >     >  >> >
>     >     >  >> > I'm not worried about test bits on other targets, but we do
>     run x86
>     >     >  >> > targets on a number of hosts. The current reliance on a
>     special
>     >     patched
>     >     >  >> > host build tool for only one architecture is the problem. If 
>     we
>     >     just
>     >     >  >> > download the iso that problem goes away.
>     >     >  >>
>     >     >  >> 👍what he said.
>     >     >  >
>     >     >  > Yes, in that case the problem is that upstream bits does not
>     pass all
>     >     >  > the test out of the box. Hence we are taking this approach of
>     keeping
>     >     >  > some test scripts in QEMU repo and modifying them. Then
>     generating the
>     >     >  > iso with the modified scripts. It also helps developers who want
>     to
>     >     >  > write new tests or make enhancements to existing tests.
>     >     >  > If modifications need to be made to tests, they need to be
>     versioned.
>     >     >  > We have gone through the route of not using submodules and I am
>     not
>     >     >  > going to open that can of worms again.
>     >     >
>     >     >  We have added a mirror of biosbits to the QEMU project so there is
>     no
>     >     >  reason why we can't track changes and modifications there (we do
>     this
>     >     >  for TestFloat which is forked from the upstream SoftFloat code).
>     >
>     >
>     > One last option. Commit this patch set but also double commit patch 3 to
>     the
>     > bits repo so that we can build an iso that would successfully run all
>     tests for
>     > a separate platform independent test to be written later.
>     >
>     > Then we will have two tests:
>     >
>     > - this one for developers writing new test.
>     > - platform independent one for a basic sanity.
>     >
>     > I’m just documenting the fact that I have proposed ideas that can work
>     where
>     > all can be happy. It’s up to others to take it or keep objecting and
>     killing
>     > motivations for freelance contributors. 
> 
>     I think it's ok to apply this as is for starters.
>     Anyone has objections?
> 
>     Down the road I think things should be refactored slightly to work as
>     follows:
>     - test developers can check out biosbits repo to create the iso
>     - everyone else gets iso downloaded
> 
> 
> It will be difficult to convince test developers to check out another repo and
> go back and forth between two repos. If the bits repo was a sub module that’s
> another story.
> 
> Test developers should use the test scripts from qemu repo. Someone then later
> can incrementally commit these new tests into bits repo and generate newer iso
> at some periodic intervals. Since I am the maintainer of the bits repo I can do
> the second part.

Sounds like a plan. Anyway, I think we can worry about that down the road
after something is merged.


> 
> 
> 
> 
>     Objections to this plan?
> 
> 
>     >
>     >
>     >
>     >     >
>     >     > 
>     >
> 
> 


