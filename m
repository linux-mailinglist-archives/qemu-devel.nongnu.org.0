Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89A258C350
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 08:29:47 +0200 (CEST)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKwGo-0001O2-7A
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 02:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKwDy-0008NX-Qy
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 02:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKwDo-00053D-Jk
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 02:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659939998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWdWueB7+XfiKNF3K7VzJJT8dPSeIIMxzdwOinCQpJo=;
 b=RdgNr+d7iD6o6AXKtg1DWoLSLAm1D7JEkakDbzB5FsYm/mdnkEG8ICaFxxX44xYtjBF0Vy
 L95Bh+j+Pot56RxwHNn5wcpAEWOoHLhoD1V7lW23yJChs2o45FCCw3wwd+eX2N0+aN6dc/
 nKg+bJwqzUzKSxOjQ29S+ICYXnAvuv4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-HRGlvtrfO6ipXd_D5O1oRw-1; Mon, 08 Aug 2022 02:26:36 -0400
X-MC-Unique: HRGlvtrfO6ipXd_D5O1oRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D986E1C05131;
 Mon,  8 Aug 2022 06:26:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F2FA9457F;
 Mon,  8 Aug 2022 06:26:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1A45821E6930; Mon,  8 Aug 2022 08:26:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Kevin Wolf
 <kwolf@redhat.com>,  Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org,  qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,  venture@google.com,  Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com,  hskinnemoen@google.com,  f4bug@amsat.org,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  thuth@redhat.com,  Hanna
 Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuvY8/WL0Jojv1Uj@redhat.com> <877d3odpm8.fsf@pond.sub.org>
 <YuvjJ7+B61UCLDrK@redhat.com> <87bkt0c9gf.fsf@pond.sub.org>
 <YuvpYExeQfW2zUd7@redhat.com>
Date: Mon, 08 Aug 2022 08:26:34 +0200
In-Reply-To: <YuvpYExeQfW2zUd7@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 4 Aug 2022 16:44:32 +0100")
Message-ID: <87lerzxnc5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Aug 04, 2022 at 05:30:40PM +0200, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Thu, Aug 04, 2022 at 04:56:15PM +0200, Markus Armbruster wrote:
>> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >>=20
>> >> > On Thu, Jul 28, 2022 at 10:46:35AM +0100, Peter Maydell wrote:
>> >> >> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
>> >> >> >
>> >> >> > Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
>> >> >> > > An OTP device isn't really a parallel flash, and neither are e=
Fuses.
>> >> >> > > More fast-and-lose use of IF_PFLASH may exist in the tree, and=
 maybe of
>> >> >> > > other interface types, too.
>> >> >> > >
>> >> >> > > This patch introduces IF_OTHER.  The patch after next uses it =
for an
>> >> >> > > EEPROM device.
>> >> >> > >
>> >> >> > > Do we want IF_OTHER?
>> >> >> >
>> >> >> > What would the semantics even be? Any block device that doesn't =
pick up
>> >> >> > a different category may pick up IF_OTHER backends?
>> >> >> >
>> >> >> > It certainly feels like a strange interface to ask for "other" d=
isk and
>> >> >> > then getting as surprise what this other thing might be. It's
>> >> >> > essentially the same as having an explicit '-device other', and I
>> >> >> > suppose most people would find that strange.
>> >> >> >
>> >> >> > > If no, I guess we get to abuse IF_PFLASH some more.
>> >> >> > >
>> >> >> > > If yes, I guess we should use IF_PFLASH only for actual parall=
el flash
>> >> >> > > memory going forward.  Cleaning up existing abuse of IF_PFLASH=
 may not
>> >> >> > > be worth the trouble, though.
>> >> >> > >
>> >> >> > > Thoughts?
>> >> >> >
>> >> >> > If the existing types aren't good enough (I don't have an opinio=
n on
>> >> >> > whether IF_PFLASH is a good match), let's add a new one. But a s=
pecific
>> >> >> > new one, not just "other".
>> >> >>=20
>> >> >> I think the common thread is "this isn't what anybody actually thi=
nks
>> >> >> of as being a 'disk', but we would like to back it with a block de=
vice
>> >> >> anyway". That can cover a fair range of possibilities...
>> >> >
>> >> > Given that, do we even want/have to use -drive for this ?    We can=
 use
>> >> > -blockdev for the backend and reference that from any -device we wa=
nt
>> >> > to create, and leave -drive out of the picture entirely
>> >>=20
>> >> -drive is our only means to configure onboard devices.
>> >>=20
>> >> We've talked about better means a few times, but no conclusions.  I c=
an
>> >> dig up pointers, if you're interested.
>> >
>> > For onboard pflash with x86, we've just got properties against the
>> > machine that we can point to a blockdev.
>>=20
>> True, but the vast majority of onboard block devices doesn't come with
>> such properties.  Please see
>>=20
>> Subject: On configuring onboard block devices with -blockdev (was: [PATC=
H v4 6/7] hw/nvram: Update at24c EEPROM init function in NPCM7xx boards)
>> Date: Mon, 15 Nov 2021 16:28:33 +0100
>> Message-ID: <875ystigke.fsf_-_@dusky.pond.sub.org>
>> https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg03173.html
>
> My take away from your mail there is that in the absence of better ideas
> we should at least use machine properties for anything new we do so we
> don't make the problem worse than it already is. It feels more useful
> than inventing new IF_xxx possibilities for something we think is the
> wrong approach already.

The difficulty of providing machine properties for existing devices and
the lack of adoption even for new devices make me doubt they are a
viable path forward.  In the message I referenced above, I wrote:

    If "replace them all by machine properties" is the way forward, we
    need to get going.  At the current rate of one file a year (measured
    charitably), we'll be done around 2090, provided we don't add more
    (we've added quite a few since I did the first replacement).

I figure this has slipped to the 22nd century by now.

Yes, more uses of -drive are steps backward.  But they are trivially
easy, and also drops in the bucket.  Machine properties are more
difficult, and whether they actually take us forward seems doubtful.


