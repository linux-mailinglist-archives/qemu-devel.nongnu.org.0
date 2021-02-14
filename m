Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED99131B0B7
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 15:21:58 +0100 (CET)
Received: from localhost ([::1]:51794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBIHd-00045w-GC
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 09:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@gmail.com>)
 id 1lBIGF-0003FB-Mx; Sun, 14 Feb 2021 09:20:32 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:45368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vfazio@gmail.com>)
 id 1lBIGD-0002EU-FY; Sun, 14 Feb 2021 09:20:30 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id l8so4552294ybe.12;
 Sun, 14 Feb 2021 06:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q+cbBlqHGrTF4C6LhlNpYnxl68anIcniCRyLxhOGCwM=;
 b=CRET4di3Z1DbW8uk3OwZ3tmxwAxCGp4lxWanH0G34HtMUGRErlvkmiNz6Zy4dQaS1O
 4YTitzxsYozzEptM13nFh5Q5l9aGvk4Hpf+XatrFJ3Lm9lOaCyX040xTcg7AXzRf8BwP
 f02ux79aUH95yA9nOVVfFqJ+Vwe//YcgRZ9iYmmOOX5H21oVRPJGGh+T4QpzXhsX3lKu
 P3gL5RMu99C8F0oEyxEKEs+kMF53g3vwTcrGjchPvUlqPuVOH2Gfwlwdta7VTFhpuvg9
 O/7COyB33u+X0m1OTuB8FieCiq13vcNISO4edQog5pzeaE/TvGzbY61YEDoJyAKBIhvO
 KlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q+cbBlqHGrTF4C6LhlNpYnxl68anIcniCRyLxhOGCwM=;
 b=hR+aZNPxfek+WtKFozhTGwbXy2JjPdN8f8aiVLR8UMFbzCgIq7G3Aa7kOHFhGyz/lR
 FMkt4940kiQXWaaYbfD4SE4DYwL3XpFb8tHvwHHZ07ktjc2nvIuEgbs8MLR+OMgTxpZa
 pIle833ck6/KhTPV76DVr6x7engWdQbv5+I9LhZnCKLp4JCCPugSzTjYRK6l7bUukBbG
 muVlc3gPERxrnwS0/URnLnBi9OK8fBYIQmpkqWvmG5V++T2Ym6YHS1mNGoU0CZec89wY
 Cg22dcSEaaLfeXpkX7tKH/Ze2NbtqWckRDFzmbYFxBwLnw0Av7C6B93lFBZLQ2/eGRH/
 8YYA==
X-Gm-Message-State: AOAM533IlFrA/BN2qz3v0yw9GC4bbM9HWKSuE/cIOgkEICUY/RV/a+I1
 JRWrQnk1zVW50xB18RiVPecTUkABJGh7LrG40vU=
X-Google-Smtp-Source: ABdhPJzT26luzY2jU0B2UaaFw4TDME6metEglKhzyfgEyJQSg1b29Di0fmTR/Sv6vfYBhOClQhoxGiZzHtesIxlnCfY=
X-Received: by 2002:a25:6c5:: with SMTP id 188mr13933514ybg.521.1613312426277; 
 Sun, 14 Feb 2021 06:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20210131061930.14554-1-vfazio@xes-inc.com>
 <87o8gmc2k5.fsf@linaro.org>
 <78c75d31-f8be-a98a-8649-87ceca224b8b@vivier.eu>
In-Reply-To: <78c75d31-f8be-a98a-8649-87ceca224b8b@vivier.eu>
From: Vincent Fazio <vfazio@gmail.com>
Date: Sun, 14 Feb 2021 08:20:14 -0600
Message-ID: <CAOrEah7X3H7g7gSKFf-jD0nQ7YqnE+hUP7eq7Ozk8HfwYaxuqA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/elfload: do not assume MAP_FIXED_NOREPLACE
 kernel support
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=vfazio@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Vincent Fazio <vfazio@xes-inc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 14, 2021 at 6:50 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 14/02/2021 =C3=A0 12:24, Alex Benn=C3=A9e a =C3=A9crit :
> >
> > Vincent Fazio <vfazio@xes-inc.com> writes:
> >
> >> From: Vincent Fazio <vfazio@gmail.com>
> >>
> >> Previously, pgd_find_hole_fallback assumed that if the build host's li=
bc
> >> had MAP_FIXED_NOREPLACE defined that the address returned by mmap woul=
d
> >> match the requested address. This is not a safe assumption for Linux
> >> kernels prior to 4.17
> >
> > It doesn't as we have in osdep.h:
> >
> >   #ifndef MAP_FIXED_NOREPLACE
> >   #define MAP_FIXED_NOREPLACE 0
> >   #endif
> >
> > which is to say to assume if MAP_FIXED_NOREPLACE is defined the kernel
> > should have given us what we want otherwise we do the check.
>
>
> But what is the purpose of the "if (MAP_FIXED_NOREPLACE !=3D 0 ||"?
> Can't we rely only on "mmap_start =3D=3D (void *) align_start"?
>
> Thanks,
> Laurent
>

I think we have to rely on address matching. The problem is
specifically when MAP_FIXED_NOREPLACE is defined and is passed to mmap
but the running kernel doesn't know what to do with the flag so
returns a value that is not what was hinted at. Previously the code
assumed that if MAP_FIXED_NOREPLACE was defined that the returned
address would match, but that isn't always the case if the kernel
doesn't have support for the flag. The 4.4, 4.9 and 4.14 LTS kernels
are still in use and could run into this problem.

-Vincent

