Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C038F5ED
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 00:56:26 +0200 (CEST)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llJUn-0005SQ-72
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 18:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1llJT3-0003Io-4Y
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:54:37 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1llJT1-0004rT-C9
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:54:36 -0400
Received: by mail-pf1-x434.google.com with SMTP id p39so5717388pfw.8
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 15:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OaaYbGKKmW5oMvMzFS51JQy6D2UAW2K7nEBUwvBhUuQ=;
 b=mZyOMD1QRqzVSY/65iXKNzpBLQcNt0dX/jGVNpc1QpnvxnmId6DHKBbWFIIaCMW5m2
 6Ge2IVZ/LdNMZrPVcAJUA18SIJ6v/SfJoywIPoU7YnXcfgx5h/jIWWi+rDkq8IMVvCQ3
 lP+CQJIakW+/oy8QL+JoF3PatAXXc8LyLdLMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OaaYbGKKmW5oMvMzFS51JQy6D2UAW2K7nEBUwvBhUuQ=;
 b=XRxi8ovAI5QJzdjb/sEmNY8nJL8/DpRu6/moHVNCTMfuAtdbDnd3qpskn2KznFFCjm
 CFJkxBCAZhUSbw1vkZ3gme3VpYcHu8HCfjLPTbVGTiod1A9yQl/PofgRq8cjVXG0z1CP
 sJ+Xucys/ja9xww7GtqK++BlLxuXgQtH9S628W08t/ZQ1WfYY4eQ1wxD3zER0KgDcD1H
 xTpu3XO1iNWyeD3CVcqKMAK9PIs0cAlUV3q3KtmWeMNd1AA/Fthnegl+FODjzlK5j3iJ
 VN1NCbi1dZycDUX3YDWV7x7cEHpLP239biPrMVOV96legP4qNWK1e6OYk5L94gyLQT0c
 PfiQ==
X-Gm-Message-State: AOAM533GmMboMasSysQaQJ0cdzwscyWhiNElW342WjShIXuZziaHxTJ6
 zKGo88X5kgUHg7qHNt1JudTEXSv3oPB9V8F6ogGJSg==
X-Google-Smtp-Source: ABdhPJw+tywWkCw1NyPWjZdXFg6iRTUiRbHkg2NLV4KPbDvUvpPhOTtPx4ND7iC1sJtWyvO36+o+/M56UOTLN4cYn/A=
X-Received: by 2002:a65:68d7:: with SMTP id k23mr16001733pgt.410.1621896873587; 
 Mon, 24 May 2021 15:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <20210524045412.15152-2-yamamoto@midokura.com>
 <87tums4d4a.fsf@linaro.org>
In-Reply-To: <87tums4d4a.fsf@linaro.org>
From: Takashi Yamamoto <yamamoto@midokura.com>
Date: Tue, 25 May 2021 07:54:22 +0900
Message-ID: <CAH=wFzS79_H8VwT_PvHxqhc9U1QfOijHfMEXw7yEHcUXYqbSYQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] linux-user: handle /proc/self/exe for execve
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=yamamoto@midokura.com; helo=mail-pf1-x434.google.com
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

On Mon, May 24, 2021 at 7:53 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> YAMAMOTO Takashi <yamamoto@midokura.com> writes:
>
> > It seems somehow common to execve /proc/self/exe in docker
> > or golang community these days.
> > At least, moby "reexec" and runc "libcontainer" do that.
> >
> > Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> > ---
> >  linux-user/syscall.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index c9f812091c..a2b03ecb8b 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -8470,6 +8470,7 @@ static abi_long do_syscall1(void *cpu_env, int nu=
m, abi_long arg1,
> >  #endif
> >      case TARGET_NR_execve:
> >          {
> > +            const char *path;
> >              char **argp, **envp;
> >              int argc, envc;
> >              abi_ulong gp;
> > @@ -8537,7 +8538,11 @@ static abi_long do_syscall1(void *cpu_env, int n=
um, abi_long arg1,
> >               * before the execve completes and makes it the other
> >               * program's problem.
> >               */
> > -            ret =3D get_errno(safe_execve(p, argp, envp));
> > +            path =3D p;
> > +            if (is_proc_myself(path, "exe")) {
> > +                path =3D exec_path;
> > +            }
>
> This still relies on binfmt_misc kicking in to ensure the binary is
> re-executed with qemu right?

right.

>
> > +            ret =3D get_errno(safe_execve(path, argp, envp));
> >              unlock_user(p, arg1, 0);
> >
> >              goto execve_end;
>
>
> --
> Alex Benn=C3=A9e

