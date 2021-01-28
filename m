Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C3307373
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 11:13:02 +0100 (CET)
Received: from localhost ([::1]:53214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l54IP-0004E0-M3
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 05:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l54ES-0003C6-81; Thu, 28 Jan 2021 05:08:56 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l54EP-0007H9-3e; Thu, 28 Jan 2021 05:08:55 -0500
Received: by mail-qt1-x82f.google.com with SMTP id w20so1449328qta.0;
 Thu, 28 Jan 2021 02:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1uCmfYhj8oKGesTWlvGXtAiRzV1eryxVEqMVL+0Sfjs=;
 b=SXcf1f6Xq1ymrcrJP5/pkr+Eim/EGRZMQ1wP2U1qx42aJWPaHsTzRkHesf6wGTeyfG
 VCG6I980X45RQ4v/D8fuwK63+XUWZqMNvA5RrkRkvrvc7MxgFr9zgtpkujABP5n9isag
 BwRaDINOZ04bfuo87h6sQjENh83tMXXLOSdmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1uCmfYhj8oKGesTWlvGXtAiRzV1eryxVEqMVL+0Sfjs=;
 b=RLnskA/5I3OehClYoVJ90/R13rPmaLf5BtOmzbfHHiOMn+8gGQhTTORXFbj8sAm+VR
 YTz6m6RkEDAb+vdVea+eDLDbbbRqZy8N4NDD9ax454h1Bfnc0FsL/WQMVB5ePFlV+Fft
 uhl6xfM9Z5fFSNMCSt/LxNr+m2v9StvEzSjEtjZCqOZzIja4EL0HzNYhEsi+oAeQvimN
 bJzSXy42qz9+dQjtKRnVZDxM4OvDgBb3j2LYtTQ9Bw487cP998a4mHNWRvK7wS6/QmB/
 DNpLW48xzq5oFvb09HUnrZHaxDov7nvI5J3SxgGj12prxDe9wDkNsWyz1JhpPP9Dyv91
 6VlQ==
X-Gm-Message-State: AOAM530UJT/dVeReBUyn5e9m/EZ5jcicAsqlZXNU05IJMJqpL/KkGslD
 sjRlFILSQz7jYBG5aO7sP2Y2xi5NQ3rpfzklIwmqYZAF
X-Google-Smtp-Source: ABdhPJxWpHKjQYfG97bM1qgW/f43xshqGV+ZCj6I7LzOJNeyG0FI9ny75QAnr4qzwH+qCx9ufailvRpbbKsl7nsdaXo=
X-Received: by 2002:a05:622a:143:: with SMTP id
 v3mr10281228qtw.363.1611828531697; 
 Thu, 28 Jan 2021 02:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-6-clg@kaod.org>
 <CACPK8Xd1oLKDB+zox3MwzqTbwsm0o8xULUKXFNCJeBG2tH_6+g@mail.gmail.com>
 <22504deb-5fac-6b90-2948-d0bd35e3c4ca@kaod.org>
In-Reply-To: <22504deb-5fac-6b90-2948-d0bd35e3c4ca@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jan 2021 10:08:39 +0000
Message-ID: <CACPK8Xcbjy2VnchgAFRRLC7Oiu7e4bs-NsUmAcT_MQSfLC++Tg@mail.gmail.com>
Subject: Re: [PATCH 5/7] ppc/pnv: Discard internal BMC initialization when BMC
 is external
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_OTHER_BAD_TLD=1.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 07:13, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 1/28/21 1:48 AM, Joel Stanley wrote:
> > On Tue, 26 Jan 2021 at 17:11, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> >>
> >> The PowerNV machine can be run with an external IPMI BMC device
> >> connected to a remote QEMU machine acting as BMC, using these options =
:
> >>
> >>   -chardev socket,id=3Dipmi0,host=3Dlocalhost,port=3D9002,reconnect=3D=
10 \
> >>   -device ipmi-bmc-extern,id=3Dbmc0,chardev=3Dipmi0 \
> >>   -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 \
> >>   -nodefaults
> >
> > Should this information also go in docs/system/ppc similar to the
> > descriptions we have in docs/system/arm?
>
> yes.
>
> Do you think we could reference :
>
>     https://openpower.xyz/job/openpower/job/openpower-op-build/

I'm not sure how long into the future it will stay up. Hosting some
images somewhere else would be ideal.

Perhaps include that URL for now, and we can update it once we have a
better location.

Cheers,

Joel

