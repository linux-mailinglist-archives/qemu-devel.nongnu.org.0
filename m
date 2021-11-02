Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DBD443174
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:22:04 +0100 (CET)
Received: from localhost ([::1]:60190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvbv-0003e0-3b
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mhvHj-0005Ra-NJ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:01:11 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:42803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mhvHf-0003tS-9o
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:01:11 -0400
Received: by mail-vk1-xa35.google.com with SMTP id b125so8920140vkb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3vnvf4M3zogMEZ8xOPLABthJOtaZNHWcEaoWk5RK52A=;
 b=L0KoU/XAbr9M0ZP6sW4wzAy8pSTiy/FoJjUzVLLD/EUCEcZlv/w3b3hyJe46LOGISr
 SiF4fLpWfamZt3R4VmqziH1yaS07ESQgfXZt+cmyaIHD8sFfhphp7KVwFFk7PavEcuMU
 gfJ1CPQ7TcL4hsBdG/wcznP8016NuPiRxFAZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3vnvf4M3zogMEZ8xOPLABthJOtaZNHWcEaoWk5RK52A=;
 b=bdYve6vKbDJzgQbo22661IkhqX4EzzyYrKF4SkdZ9zStHDj56x012E8hPVpdmZfwcX
 LPWHxCOprZnbbSpzMpejV/N9F+p3P3yGaVauQkTzupXW8B00UmPa6v7d25B0V4q/I+aW
 U92qX78ZXldZ8OBl+/5pzjAwQFDLWtPB6YSJSrCAdKPWgFYLrr4yEsECaZMiruar6Yy1
 LLisZhAWiQT/w4vAZVNQTBxoMohKDOJ1q4HIeKr3XZzpKDPjwV+ilAsNAFykx0DtwX2r
 kK7OBViMvlBNzw1KqOB/6/8ZsrYhg8L/raBTuzj2oWwDNVOLr1XF+Z9CgLDDtM5o0Xrs
 3Y7Q==
X-Gm-Message-State: AOAM533Up9wS1Zsg36lWowyayfiLvbTFzcB3IOvsSRnea5MEb4WKu3lL
 v56oHiEzobZg7QxDFdwOgaPJcLphylDWDhxbc39G9A==
X-Google-Smtp-Source: ABdhPJyIa9R7I1fhtnICvau6SsznIISpbDpXyUz41tQZT7IalKiOYw/6rYpnQJ3OOdbz6Eq6QqzlxLVKc1wFRzenhNU=
X-Received: by 2002:a1f:1841:: with SMTP id 62mr39370513vky.26.1635865264576; 
 Tue, 02 Nov 2021 08:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <20211101180707.GJ24579@bill-the-cat>
In-Reply-To: <20211101180707.GJ24579@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Nov 2021 09:00:53 -0600
Message-ID: <CAPnjgZ0XeFHrXwBuTZ=eoKHCo7cMSuM_gUiTfv-Sqt8o6tPOXw@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=sjg@google.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Tom,

On Mon, 1 Nov 2021 at 12:07, Tom Rini <trini@konsulko.com> wrote:
>
> On Mon, Nov 01, 2021 at 06:33:35PM +0100, Fran=C3=A7ois Ozog wrote:
> > Hi Simon
> >
> > Le lun. 1 nov. 2021 =C3=A0 17:58, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
> >
> > > Hi Peter,
> > >
> > > On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linaro.org>
> > > wrote:
> > > >
> > > > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wrote:
> > > > >
> > > > > Add this file, generated from qemu, so there is a reference devic=
etree
> > > > > in the U-Boot tree.
> > > > >
> > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > >
> > > > Note that the dtb you get from QEMU is only guaranteed to work if:
> > > >  1) you run it on the exact same QEMU version you generated it with
> > > >  2) you pass QEMU the exact same command line arguments you used
> > > >     when you generated it
> > >
> > > Yes, I certainly understand that. In general this is not safe, but in
> > > practice it works well enough for development and CI.
> >
> > You recognize that you hijack a product directory with development hack
> > facility. There is a test directory to keep things clear. There can be =
a
> > dev-dts or something similar for Dev time tools.
> > I have only seen push back on those fake dts files in the dts directory=
: I
> > guess that unless someone strongly favors a continuation of the discuss=
ion,
> > you may consider re-shaping the proposal to address concerns.
>
> Yes.  We need to document how to make development easier.  But I'm still
> not on board with the notion of including DTS files for platforms where
> the source of truth for the DTB is elsewhere.  That's going to bring us
> a lot more pain.

Are you talking about QEMU specifically, or Raspberry Pi?

How can we get this resolved? I very much want to get to just having
OF_SEPARATE and OF_EMBED as the only available build-time options,
with OF_BOARD (and perhaps OF_PASSAGE) as something we can enable for
runtime support. I feel that separating the build-time and run-time
behaviour is very important. Over time perhaps we will have some
success in upstreaming bindings, but for now we have what we have.
There is still a lot of pushback on U-Boot having things in the
devicetree, although I do see that softening somewhat.

>
> It is important to make sure our "develop our project" workflow is sane
> and relatively pain free.  But that needs to not come by making
> sacrifices to the "use our project" outcome.  I would hope for example
> that the new Pi zero platform is just dtb changes, as far as the linux
> kernel is concerned which means that for rpi_arm64 (which uses run time
> dtb) it also just works.  And that's what we want to see.

So long as OF_BOARD is enabled then the flow should work as you expect.

Regards,
Simon

