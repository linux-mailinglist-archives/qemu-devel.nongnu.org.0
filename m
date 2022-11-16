Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E3862C5EF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 18:08:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovLoT-0002ob-UP; Wed, 16 Nov 2022 12:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ovLoK-0002lH-Us; Wed, 16 Nov 2022 12:02:54 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ovLnu-0007Az-MQ; Wed, 16 Nov 2022 12:02:48 -0500
Received: by mail-ej1-x62b.google.com with SMTP id i10so36962796ejg.6;
 Wed, 16 Nov 2022 09:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ayxYq3qjX1o9OZR7ijO5EjOfbyohDPQS/RHENmLPlA=;
 b=m/us6Xnmblr9bACXw5c465uvjB8tbKQ+Dw9RTbdIHPkHBV/o25fWMRzRHdlKrYiluB
 jewXhTdHCbI8sHho4FHJynZ4CNC8gp1YsVrunZXEMe/p7rnn/MUB+wftn0G6/rm0UHAK
 h1ZseDxkF9wS7P/dd/KiqGIpFfWFjA6+1Cgd0sfrAZx28pAZRRYkx/Obt6u64ZqPTLRK
 5Q5WgkD7UzGVS4oQFgcV5SMbSmNxIsf9344/5ZA1zLSMgYItuwWfjJJPezkl7ccFIwAw
 L04qw1gRJ3GAOua0FDKr0WBnVJJo6jfIdis07B7KEEHYndR56vkidIk55tsDdCTy1hRZ
 afVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ayxYq3qjX1o9OZR7ijO5EjOfbyohDPQS/RHENmLPlA=;
 b=oQhaRjT12hmeb92cyR4A3j7vw4ucoSqDnxt/Xju4YaiuZXa4oSO/Npn6yFK3MYTtKF
 3nD7tWlEW0PqZYxl6dOTIp9ae29RRQvRD5iS0xApnkj6mE49IeOcwYTVVB474Ax1+UKQ
 Dl5Y2u7ou16qHeXgaFl7AacSOi8DNPwAvF9TjE05hQ83mMys1uoqospyEBNIJps9tosc
 EnWcTf0/+fRAl4cNO22m84SdWHFHpDlypfv3wNPkThwO0WcngSZgt5s2HN1kEwExoPcj
 bRPzqNRTQ/JAaq/rBCA0bIHwcSkzNSRNa3G0O5GxSj+YYR1PhWvrUxRFPMQSMUSsobvX
 4WFg==
X-Gm-Message-State: ANoB5pnv0F8TZOUfWBR5KMJpJo/1YVe1nb6yhSDb2GvEPUGaULK0orDZ
 TUUWE0VvGD24BCOnklFyNpOCtJaa4J6fGIfQuRQ=
X-Google-Smtp-Source: AA0mqf6vW3kA3CEkWOJygoQORM7+QD6Fb3Tcgx8v85TEaqWTW+8tA7cs6iU9Ucbj3/94t1imQpnZGFL8vqVeg2o+rO0=
X-Received: by 2002:a17:906:66da:b0:7a5:f8a5:6f84 with SMTP id
 k26-20020a17090666da00b007a5f8a56f84mr17784730ejp.569.1668618144127; Wed, 16
 Nov 2022 09:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20221115122527.2896476-1-oro@il.ibm.com>
 <Y3PQj/MBztn8SobQ@redhat.com>
 <MN2PR15MB34886DD5A9D0F5D64A248AA08A079@MN2PR15MB3488.namprd15.prod.outlook.com>
 <Y3S6OGqGFovAyRWw@redhat.com> <Y3TGO6AEAAOux8FH@redhat.com>
In-Reply-To: <Y3TGO6AEAAOux8FH@redhat.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 16 Nov 2022 18:02:12 +0100
Message-ID: <CAOi1vP9FPZruCBrSbgn_78j+9gz3z6HqKJ+VaCU5mucmSc4rvQ@mail.gmail.com>
Subject: Re: [PATCH v3] block/rbd: Add support for layered encryption
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Or Ozeri <ORO@il.ibm.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Danny Harnik <DANNYH@il.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 16, 2022 at 12:15 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Wed, Nov 16, 2022 at 10:23:52AM +0000, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Nov 16, 2022 at 09:03:31AM +0000, Or Ozeri wrote:
> > > > -----Original Message-----
> > > > From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > > Sent: 15 November 2022 19:47
> > > > To: Or Ozeri <ORO@il.ibm.com>
> > > > Cc: qemu-devel@nongnu.org; qemu-block@nongnu.org; Danny Harnik
> > > > <DANNYH@il.ibm.com>; idryomov@gmail.com
> > > > Subject: [EXTERNAL] Re: [PATCH v3] block/rbd: Add support for layer=
ed
> > > > encryption
> > > >
> > > > AFAICT, supporting layered encryption shouldn't require anything ot=
her than
> > > > the 'parent' addition.
> > > >
> > >
> > > Since the layered encryption API is new in librbd, we don't have to
> > > support "luks" and "luks2" at all.
> > > In librbd we are actually deprecating the use of "luks" and "luks2",
> > > and instead ask users to use "luks-any".
> >
> > Deprecating that is a bad idea. The security characteristics and
> > feature set of LUKSv1 and LUKSv2 can be quite different. If a mgmt
> > app is expecting the volume to be protected with LUKSv2, it should
> > be stating that explicitly and not permit a silent downgrade if
> > the volume was unexpectedly using LUKSv1.
> >
> > > If we don't add "luks-any" here, we will need to implement
> > > explicit cases for "luks" and "luks2" in the qemu_rbd_encryption_load=
2.
> > > This looks like a kind of wasteful coding that won't be actually used
> > > by users of the rbd driver in qemu.
> >
> > It isn't wasteful - supporting the formats explicitly is desirable
> > to prevent format downgrades.
> >
> > > Anyhow, we need the "luks-any" option for our use-case, so if you
> > > insist, I will first submit a patch to add "luks-any", before this
> > > patch.
> >
> > I'm pretty wary of any kind of automatic encryption format detection
> > in QEMU. The automatic block driver format probing has been a long
> > standing source of CVEs in QEMU and every single mgmt app above QEMU.
>
> Having said that, normal linux LUKS tools like cryptsetup or systemd
> LUKS integration will auto-detect  luks1 vs luks2. All cryptsetup
> commands also have an option to explicitly specify the format version.
>
> So with that precedent I guess it is ok to add 'luks-any'.

Yeah, I think we may need to reconsider the intent to deprecate
LUKS1 and LUKS2 options for loading encryption in librbd in favor
of a generic LUKS(-ANY) option.  But, just on its own, LUKS(-ANY)
is definitely a thing and having it exposed in QEMU seems natural.

Thanks,

                Ilya

