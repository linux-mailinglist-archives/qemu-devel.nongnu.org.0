Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E67613924
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 15:41:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opVx2-0000xg-Pl; Mon, 31 Oct 2022 10:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1opVx0-0000pj-RN
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 10:39:42 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1opVwy-0007xy-MG
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 10:39:42 -0400
Received: by mail-ej1-x629.google.com with SMTP id bj12so29844423ejb.13
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mnkt1+iFFg3PJtfFrMaH22s0eT3hC13xuq99AEn8GT4=;
 b=lpg17CbzspwsBsKkO81t9Xp42sxb9rQwfWiwiVdbRnUFs8vOHEd8cjhI1WenjMwFtH
 l+4Bs2IMX/3sLt0XiU8HY5D0alYmOS0fVsUAT3TPdE7edU+SkBA5wsvxh81Ix52tZc/z
 HrkyCWqrMKor9PbRT6SiWrnEK/TV4Mbc1aB7D2XNcNP/oLrVz3TFii9vaoe5u6hBeBxl
 DAOtD7xIWflj1AG9TcE0QN3JBKfM6nLYkYq0TpHuIQTBnTWhC77JqXk/7XJIJno7J/Kk
 BB8UYZ1iJxncQyKKrb8NfKZSWECMRCL2AdTujE7K+XjeMds4Fz/vqg7h+963dF5WfBRR
 vfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mnkt1+iFFg3PJtfFrMaH22s0eT3hC13xuq99AEn8GT4=;
 b=p98xdffsIADlDfSXNpsdvftL5Xtnu+5gBhEmYr/hUe1cPk1+EW+nIQ23UdQkiuycrZ
 pVTtfJHOp/Tz9ar7XqeFiwp91CODzm7i8xlx3LGYndO6O/ynTFvQ2egwt4KAFLJAkh/Y
 rRVkfhoDP9XrTDCpvByoyNq28aBVihfcRU7ReAcxc+zO8Wcw7B9lswII1Ap+qWKdL8EN
 mgrKGcq0QNq8kAx8S5ouCmmcvKa/ZBacBdjp1xxbqGPlG7RsyQcqe1va0TKogJ/KwzYs
 /QQ8+3PxkGaKrP7RcxKo/vYD1Rnb38A6pq/kT7fFvCGYtJXAVvkUl47xqqsaQdzikS9v
 7a7Q==
X-Gm-Message-State: ACrzQf1Z6+KbiyeNOMCAkDiqA8JluPdkfpTU32PCTmdv/tM+taUEW1Rp
 /deVyGspW8umd5ZbrKq8JEEQ3/1KX+exLBB6y0igdg==
X-Google-Smtp-Source: AMsMyM4jy//mM/3XU2zJJrpMIClq0EcHtyYWJsEL5SVpNmLqad8uHhQIXN21qmlC30HykG8etgbYBNV+dbQYm2UfWZ4=
X-Received: by 2002:a17:907:d02:b0:7a3:de36:b67 with SMTP id
 gn2-20020a1709070d0200b007a3de360b67mr12951847ejc.451.1667227178427; Mon, 31
 Oct 2022 07:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221028174546.88683-1-imp@bsdimp.com>
 <CAJSP0QUbek3kWrWbWMoqKcQspL94vK9Xy7jFqmihGD86_pV-tw@mail.gmail.com>
 <CANCZdfr_gPtznH+5HfWoz-01K-2mOzKsUiGdVPBFDMry01xWFQ@mail.gmail.com>
 <CAJSP0QXT2NqVJFhpAS2g9Eq_vLd+h27wGZ-BnR3jddagAmdANQ@mail.gmail.com>
In-Reply-To: <CAJSP0QXT2NqVJFhpAS2g9Eq_vLd+h27wGZ-BnR3jddagAmdANQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 31 Oct 2022 08:39:27 -0600
Message-ID: <CANCZdfrGt=iJdqksz0HeDLYSc-8jAV7=RpJ1rLc_rvroPEDebg@mail.gmail.com>
Subject: Re: [PULL 0/1] Imp 202210 patches
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 John Baldwin <jhb@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000bafdbd05ec5593f9"
Received-SPF: none client-ip=2a00:1450:4864:20::629;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000bafdbd05ec5593f9
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 31, 2022 at 8:17 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Mon, 31 Oct 2022 at 09:19, Warner Losh <imp@bsdimp.com> wrote:
> >
> >
> >
> > On Mon, Oct 31, 2022, 4:34 AM Stefan Hajnoczi <stefanha@gmail.com>
> wrote:
> >>
> >> On Fri, 28 Oct 2022 at 13:46, Warner Losh <imp@bsdimp.com> wrote:
> >> >
> >> > The following changes since commit
> 344744e148e6e865f5a57e745b02a87e5ea534ad:
> >> >
> >> >   Merge tag 'dump-pull-request' of
> https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26
> 10:53:49 -0400)
> >> >
> >> > are available in the Git repository at:
> >> >
> >> >   ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git
> tags/imp-202210-pull-request
> >>
> >> Hi Warner,
> >> Please use https://github.com/qemu-bsd-user/qemu-bsd-user.git instead
> >> of an ssh URL. That way anonymous fetching works for people without
> >> GitHub accounts. Thanks!
> >
> >
> >
> > Will do in the future. It's trivial to convert. Do I need to resubmit
> this pull request for something so trivial?
>
> No, that's not necessary. I have already merged it into the staging
> branch. Thanks!
>

Great! Thanks!

Warner

--000000000000bafdbd05ec5593f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 31, 2022 at 8:17 AM Stefa=
n Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com">stefanha@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On M=
on, 31 Oct 2022 at 09:19, Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com"=
 target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Oct 31, 2022, 4:34 AM Stefan Hajnoczi &lt;<a href=3D"mailto:st=
efanha@gmail.com" target=3D"_blank">stefanha@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, 28 Oct 2022 at 13:46, Warner Losh &lt;<a href=3D"mailto:im=
p@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The following changes since commit 344744e148e6e865f5a57e745b=
02a87e5ea534ad:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0Merge tag &#39;dump-pull-request&#39; of <a href=
=3D"https://gitlab.com/marcandre.lureau/qemu" rel=3D"noreferrer" target=3D"=
_blank">https://gitlab.com/marcandre.lureau/qemu</a> into staging (2022-10-=
26 10:53:49 -0400)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; are available in the Git repository at:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ssh://<a href=3D"http://git@github.com/qemu-bsd-u=
ser/qemu-bsd-user.git" rel=3D"noreferrer" target=3D"_blank">git@github.com/=
qemu-bsd-user/qemu-bsd-user.git</a> tags/imp-202210-pull-request<br>
&gt;&gt;<br>
&gt;&gt; Hi Warner,<br>
&gt;&gt; Please use <a href=3D"https://github.com/qemu-bsd-user/qemu-bsd-us=
er.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu-bsd-us=
er/qemu-bsd-user.git</a> instead<br>
&gt;&gt; of an ssh URL. That way anonymous fetching works for people withou=
t<br>
&gt;&gt; GitHub accounts. Thanks!<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Will do in the future. It&#39;s trivial to convert. Do I need to resub=
mit this pull request for something so trivial?<br>
<br>
No, that&#39;s not necessary. I have already merged it into the staging<br>
branch. Thanks!<br></blockquote><div><br></div><div>Great! Thanks!</div><di=
v><br></div><div>Warner</div></div></div>

--000000000000bafdbd05ec5593f9--

