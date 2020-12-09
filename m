Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE472D3979
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 05:12:11 +0100 (CET)
Received: from localhost ([::1]:42716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmqpm-0002bK-HS
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 23:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmqnf-0001Xm-Ev
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 23:09:59 -0500
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:45896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmqnd-0006cE-1r
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 23:09:59 -0500
Received: by mail-vs1-xe42.google.com with SMTP id w18so172511vsk.12
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 20:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1nkjL23/EYfP2G11u4KPpdBsMRD+JMNT4czTg/daHdE=;
 b=R1J9IQ0/5k5Xvmzz6QAS+LwL9FoBMkUBC7JRe3JMl3Lr9d3xhrzqEX4/FkdU+BCbZw
 0xjVNTjPOm4uabQcAs56EWpIKR1UpJ273EVzoYBhmpLWi5ept9TDlIVMmVBnCleJIEn+
 tfO/cPa0xQaoUqZx7DjY3R9lcoyElzUlolWZRNo40Hrrm/xy+BYPez44WmzgmsdHKs03
 QUn95Bof+UXUlQBH1yVukUYTO1Oy39VwuAwfhaiJ2SuHd/yz5QhesRHosT35tn9aEu7Q
 p8jwstjhKBs5lrMJy6XRSefE5L+w8mwEusu4eII08HjM7BvzXoRWPIKXbIifbBC11R1m
 tt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1nkjL23/EYfP2G11u4KPpdBsMRD+JMNT4czTg/daHdE=;
 b=gcqm7TIzvuayu+dn24o6ZE+NRnJX6BQE6qnZt9ERxwlpxE+rzGB9IJDyaRusjRsGqa
 wtRjnDVvbGQC0SSGthltMgv0nw90l7XyHwrY08V26imI89MnyiaZ8vlgyChkGPJjXdLu
 7kZB6xith/VPlh+mI7uee+wDdqHSydwcCGqtIVgjsLd5C96LzACKM0sSoBCrY43RKVHv
 Cs23VxbAdzHPbx2XLYnY1NveX0Tm0E9ahsUiYBYAqE3JSJ585+6y9tGOMZfovJa0BC2h
 FnUKF5wa/76lrafFb9f47kOet464Z+jHVj8GaPE9S+IUH6EMvkEVWhXlu7497LERdvf7
 +HYw==
X-Gm-Message-State: AOAM531pMIHSxmvxd2Yperyu4lt8lfI9pnT1Da0J0YICYi5gFOIbJu44
 WIMEFPaW9CZjp+jrbL4f+rArzwx8PHbu1FWlcMXDyA==
X-Google-Smtp-Source: ABdhPJzS6vvKo/1iC0lVsiIQ9dUV9W5mKrAN/hkzDLlPGX3LxOqteZejRkXMyTHz0ZSlE/v/BF5Pji/lFEvOvA0U2cE=
X-Received: by 2002:a67:b043:: with SMTP id q3mr325183vsh.29.1607486995739;
 Tue, 08 Dec 2020 20:09:55 -0800 (PST)
MIME-Version: 1.0
References: <1607432377-87084-1-git-send-email-fengli@smartx.com>
 <20201208143822.GA6392@merkur.fritz.box>
In-Reply-To: <20201208143822.GA6392@merkur.fritz.box>
From: Li Feng <fengli@smartx.com>
Date: Wed, 9 Dec 2020 12:09:44 +0800
Message-ID: <CAHckoCyGKDNoy31EaBumJxxeHWZSH=uSthHto1uiGynVR+g34A@mail.gmail.com>
Subject: Re: [PATCH] file-posix: detect the lock using the real file
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::e42;
 envelope-from=fengli@smartx.com; helo=mail-vs1-xe42.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Feng Li <lifeng1519@gmail.com>, Kyle Zhang <kyle@smartx.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=888=E6=97=A5=
=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:38=E5=86=99=E9=81=93=EF=BC=9A
>
> Am 08.12.2020 um 13:59 hat Li Feng geschrieben:
> > This patch addresses this issue:
> > When accessing a volume on an NFS filesystem without supporting the fil=
e lock,
> > tools, like qemu-img, will complain "Failed to lock byte 100".
> >
> > In the original code, the qemu_has_ofd_lock will test the lock on the
> > "/dev/null" pseudo-file. Actually, the file.locking is per-drive proper=
ty,
> > which depends on the underlay filesystem.
> >
> > In this patch, make the 'qemu_has_ofd_lock' with a filename be more gen=
eric
> > and reasonable.
> >
> > Signed-off-by: Li Feng <fengli@smartx.com>
>
> Do you know any way how I could configure either the NFS server or the
> NFS client such that locking would fail? For any patch related to this,
> it would be good if I could even test the scenario.
>
Hi Kevin, currently our SmartX ZBS storage NFS server doesn't support
the file lock and the lock operation will return failure.
I have tried the kernel NFS server, and it works well. I don't have more ki=
nds
of NFS servers.

> For this specific patch, I think Daniel has already provided a good
> explanation of the fundamental problems it has.
>
> Kevin
>

