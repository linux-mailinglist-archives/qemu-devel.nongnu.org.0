Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DFD6A9DDB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:40:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9Nh-0006va-NF; Fri, 03 Mar 2023 12:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY9Nb-0006vO-Ew
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:39:39 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY9NZ-0002aX-HK
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:39:39 -0500
Received: by mail-pj1-x102d.google.com with SMTP id x34so3362943pjj.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677865175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axUhOWWpU6fClYOchc2ymedSWNpLQfqD8HdqZqmFzwY=;
 b=NSgJ6CashR1kPohWHAR8SU8hBfMSaixlVZS7j/fMXw1JehCnmW/JIm6HGBcm4J/XZ8
 X41TCQmxBATfB/qA68Jgsq2DRPOW1NAGKlmayg15nmUNctpi3gnBJgshWji6VYWkQb4A
 fl6WGkCB0Y80GKwSDMGFeXYGaQ30pcLq2Kf4MyeXSJkRj2w9IsZxn0GV7/U1IaFBwEJx
 UXNq1xhGrOgQkvodZv3o/a6OgfbrKhSssq1YzF9+9WBSnljlHDR3V9/jrVnEhMzCvRxx
 JSgNgPRn+nrHVoM9dgQtikroehoYcELfMEzf6RzBbt9ELwUkTKdZy1pcS1ktyy1gry6z
 11AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677865175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=axUhOWWpU6fClYOchc2ymedSWNpLQfqD8HdqZqmFzwY=;
 b=plfme6B8iQbX+oY598x1p35g5ytrcl7ZetxTP63XU2aC9EeuYhEJb48EBmb4Y92fPV
 Ralvcawex3xQzqi4J3BnqcI8aWXpyKf/+RjOH+wlzIAutRrUEusCWH5FFTqhtBfpb0mQ
 beOky2kn+iFjl9irFbUmwPDzfQgRBxXBOlFHmaZ5b3zZl3546Ce7N/5EhGRPdjAtvp5e
 uccRUZFhACsa3n4a7v46CAAqYu/iMq14STMdUa+HU+2w+o/MOzrdVuIjtcrAVAk6Vidi
 zEisE8y1DjbOPw/7j311VMFVyxXeLebMiAV5Pu1/4jsagsknAV5HhEas2XxrJ7Z5HNpI
 bE+Q==
X-Gm-Message-State: AO0yUKXn6yut10ci8134JbtcOyWll8YtOMPLbqp8Ezlw+qR7guWSdO+M
 Cp1C7FtT6Z4FNIaGhqOmvJgOTPP8PjyAoy2y2HgGuVLezlr9EkZL
X-Google-Smtp-Source: AK7set+v7RNFYZinnXke4DIZO6ts4cG/WKH9TLTaUty+hy3jN4pjQDQM9huI00pIneZ9OKy3UeEoWcMnWztMlMWRQ2Q=
X-Received: by 2002:a17:903:25c5:b0:19a:ebaa:68d7 with SMTP id
 jc5-20020a17090325c500b0019aebaa68d7mr1016240plb.2.1677865174581; Fri, 03 Mar
 2023 09:39:34 -0800 (PST)
MIME-Version: 1.0
References: <CAGD3tSzW1QoAsn+uGjoAkBegLt1iZ=9YWDFcvqbcHMr0S_5kVw@mail.gmail.com>
 <ZAHNEtV0N+9JyZTk@redhat.com>
 <CAGD3tSzZAa+zRv0xEetB-WW+zmnGNJUAzLj0CyGCek9YYDNq9g@mail.gmail.com>
 <ZAIqclU7BbH2vog7@redhat.com>
In-Reply-To: <ZAIqclU7BbH2vog7@redhat.com>
From: Haitao Shan <hshan@google.com>
Date: Fri, 3 Mar 2023 09:39:23 -0800
Message-ID: <CAGD3tSw_OdDV3gZo7mxeKP0da-NrdikRGySKtFC9rhn4Dn_G1g@mail.gmail.com>
Subject: Re: [PATCH 0/6] Adding the Android Emulator hypervisor driver
 accelerator
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=hshan@google.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 3, 2023 at 9:12=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Fri, Mar 03, 2023 at 08:50:18AM -0800, Haitao Shan wrote:
> > On Fri, Mar 3, 2023 at 2:34=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrang=
e@redhat.com> wrote:
> > >
> > > On Thu, Mar 02, 2023 at 06:25:59PM -0800, Haitao Shan wrote:
> > > > The Android Emulator hypervisor driver is a hypervisor for Windows =
(7
> > > > or later), made by porting the KVM from the linux kernel 4.9-rc7. I=
ts
> > > > initial purpose was to support the Android Emulator on the AMD
> > > > platforms as the old name "Android Emulator Hypervisor Driver for A=
MD
> > > > Processors" suggested. Despite the name, Intel processors have been
> > > > supported ever since its first release. Since Intel dropped HAXM su=
pport,
> > > > the android emulator is switching from HAXM to AEHD.
> > >
> > > When HAXM was proposed for deprecation & removal from QEMU, the sugge=
stion
> > > was that users should switch to Windows' native replacement WHPX, whi=
ch
> > > QEMU already has support for.
> >
> > Sorry I was not aware of Intel's suggestion when HAXM was deprecated.
> > Is this a decision already, which shuts the door for any other 3rd part=
y
> > hypervisors?
>
> No, we're always open to new proposals. It merely means that it
> might be harder to justify why the new hypervisor is a net benefit
> for QEMU, when there is a competing solution supported by the OS
> vendor.
Thanks for the clarification. It is great that the door is not shut complet=
ely.

>
> > > What is the rationale for wanting to introduce a 3rd party hypervisor
> > > solution like AEHD, for the Android emulator, rather than just sticki=
ng
> > > with the standard WHPX hypervisor available for Windows ? IIUC, the
> > > Android emulator can already support WHPX according to these pages:
> > >
> > >   https://developer.android.com/studio/run/emulator-acceleration
> > >   https://learn.microsoft.com/en-us/dotnet/maui/android/emulator/hard=
ware-acceleration?view=3Dnet-maui-7.0
> > You are right. WHPX is supported by the android emulator. The reason fo=
r
> > supporting AEHD:
> >
> > 1. HyperV is a type-1 hypervisor, which does not coexist with other hyp=
ervisors.
> > According to our data, there are both users who have to live with Hyper=
V on or
> > with HyperV off. Those users depend on certain Windows features (or 3rd=
 party
> > programs) that have to turn on or turn off HyperV. Offering AEHD allows=
 us to
> > serve both types of users. This is the major benefit. I think this
> > argument is true
> > for upstream QEMU users as well.
>
> Yes, it is an akward situation if users cannot enable use of WHPX.
> I don't have any better suggestion in that scenario.
>
> > 2. Actually, AEHD started development before WHPX was added to the andr=
oid
> > emulator. But porting/writing a new hypervisor just took lots of time.
> > In the middle,
> > Microsoft offered us WHPX. It could be the case that AEHD was never sta=
rted if
> > WHPX had been offered one or two years earlier. However, we decided to =
continue.
> > First, see reason 1. Second, at least at that time, WHPX was noticeably=
 slower
> > than both HAXM and AEHD. Third, Microsoft clearly stated there would no=
t be
> > any backporting of WHPX to older versions of Windows. And those using o=
ld
> > versions of Windows need a solution in addition to HAXM.
>
> FYI, from the QEMU POV, we only aim to support the two most recent major
> releases of Windows.
Just want to point out that only Windows 10 1809+ (or
perhaps 1803+) supports WHPX. And how to enable WHPX varies
among versions of Windows 11/10. For example, on Windows 11,
there is no need to explicitly enable it using the Windows Features
dialog, which is good according to my taste.

But I do agree that earlier Windows 10 versions should not be considered
as recent major releases any more nowadays.

>
> At a technical level we've set the compilation baseline to Windows 8, but
> per the support policy we only really support Windows 10 and 11 right now=
.
>
> > 3. Compared with HAXM, which looks like the default solution when Hyper=
V
> > must be off, AEHD supports both Intel and AMD. And according to user fe=
edback
> > and our own tests, AEHD can support Windows 10. This was the reason
> > why I maintained a patched QEMU ever since 4.2.0 specifically for them.
>
> Yep, no disagreement that AEHD looks more useful for HAXM given the
> cross vendor CPU support.
Oops. By saying supporting Windows 10, I really mean Windows 10 guests.

>
> > 4. Although it is called Android Emulator hypervisor driver, it has not=
hing that
> > is android specific. And I've seen the upstream QEMU successfully refac=
tored the
> > accelerator logic. This made adding a new hypervisor support less intru=
sive to
> > the main code base. I have a good will and intention to maintain what I
> > submitted if it could be approved by the community. I hope this does
> > not place (or
> > at least place very minimum) burden on the maintainers, should it be ac=
cepted.
>
> Ok, thank you.
>
> I don't have any specific requests / suggestion myself, but I see others
> replied wondering whether there's any sense is sharing code with the
> KVM driver in QEMU. Hopefully the QEMU KVM maintainers will comment with
> their views on the matter.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


--=20
Haitao @Google

