Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D423AE143
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:20:28 +0200 (CEST)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8bz-0000TV-63
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lv8as-0008E3-B1
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:19:18 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lv8aq-0003mW-Ie
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:19:17 -0400
Received: by mail-pl1-x636.google.com with SMTP id y13so1522044plc.8
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u77Jha0dVZq+rLuyu1dDw5QBGAUVlJtR1T4KmRO6KHo=;
 b=RYP2ZUqgVfgtJX4M3SQWvO7mXp2D73kp0+uVbpoesVy7aBGZfL7TVL9rf8/lROp2AC
 CnB1llBW08Sle+fXZ5s90Gkr2rR+KFYeseLCvClt5Z2x/4jWQ7+gRMdmdljqtacOTwY8
 HDffetUlVoawYWCISC3pWdvRCfDczO+uKuyOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u77Jha0dVZq+rLuyu1dDw5QBGAUVlJtR1T4KmRO6KHo=;
 b=TQe00XRIfEVj9fZoF7xzpV9DkqYCmho0xnRS6ysvVmdaCYcVa1VyUf5sCgWZX3vhw5
 ZI8Z5NTqEmLKZSE0IIuXjeETU5MD8YceMu+OUBh/kSF+PL5CHPRkTjQ+r10uZ7KfAhur
 WlA277LjU5uWdBQkiM3AHrbETnguN4TL7Fw5Z1HMHMEhxsk+RuH2gPdziSo848skuHTF
 CBPtN+ayBItMhZOctays0in8aT59hBFHDSvA6Jro4Wj4HnZwyopQWSmxhDMiK72akgrT
 cgr8KtMSh8n7kSz8BG/HTI4xoBr4HYguFtK/RhFCZdHNzU9ozljqh/GqtWJnb0TD0AuH
 Br6A==
X-Gm-Message-State: AOAM532QVDCPBCqVgmaRRB0MMmWNdk3o7yCm62vWNaL7XiBGe6sKo9uV
 3yqn7qO2G/9G8WScHjT2jr6Oy198u8UzmDhO1heetg==
X-Google-Smtp-Source: ABdhPJz6ytl99Hthj3a1ayb/nMKOdhMphtGc4SqRyWepm6y6DNUXmw16MfSkvXkUHZZYHt4cBDCt4m/QcRJ2WHYQq0Q=
X-Received: by 2002:a17:90b:38cd:: with SMTP id
 nn13mr35161276pjb.48.1624238354703; 
 Sun, 20 Jun 2021 18:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210531055019.10149-1-yamamoto@midokura.com>
 <20210531055019.10149-3-yamamoto@midokura.com>
 <465df811-e6d8-2bfd-5ebe-1ebf85fa5c99@vivier.eu>
In-Reply-To: <465df811-e6d8-2bfd-5ebe-1ebf85fa5c99@vivier.eu>
From: Takashi Yamamoto <yamamoto@midokura.com>
Date: Mon, 21 Jun 2021 10:19:03 +0900
Message-ID: <CAH=wFzQhjyK_M_WtFn9w34yvOVmvQV_Ftv_wEzdDCMQtqhgUvA@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] linux-user: Fix the execfd case of
 /proc/self/exe open
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=yamamoto@midokura.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 20, 2021 at 11:16 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 31/05/2021 =C3=A0 07:50, YAMAMOTO Takashi a =C3=A9crit :
> > It's problematic to return AT_EXECFD as it is because the user app
> > would close it.
> > This patch opens it via /proc/self/fd instead.
> >
> > Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> > ---
> >  linux-user/syscall.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index a2b03ecb8b..14a63518e2 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -8118,7 +8118,17 @@ static int do_openat(void *cpu_env, int dirfd, c=
onst char *pathname, int flags,
> >
> >      if (is_proc_myself(pathname, "exe")) {
> >          int execfd =3D qemu_getauxval(AT_EXECFD);
> > -        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, =
mode);
> > +        if (execfd) {
> > +            char filename[PATH_MAX];
> > +            int ret;
> > +
> > +            snprintf(filename, sizeof(filename), "/proc/self/fd/%d", e=
xecfd);
> > +            ret =3D safe_openat(dirfd, filename, flags, mode);
> > +            if (ret !=3D -1) {
> > +                return ret;
> > +            }
> > +        }
> > +        return safe_openat(dirfd, exec_path, flags, mode);
> >      }
> >
> >      for (fake_open =3D fakes; fake_open->filename; fake_open++) {
> >
>
> I think a dup() would be more appropriate, or explain why not.

i did this way because dup() doesn't deal with open flags.

>
> Thanks,
> Laurent

