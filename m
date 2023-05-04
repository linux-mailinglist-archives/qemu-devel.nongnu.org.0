Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6D76F69CA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:23:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puX2y-0007zn-Hb; Thu, 04 May 2023 07:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puX2w-0007zf-GX
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:22:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puX2u-00032l-TO
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683199367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zHXQo+p5GWKzE7+35FNQkbr9i18s91JcIq7BrNB9Tcg=;
 b=B/mpS6SRKqsaTcPMGaDa5ViVCnbMmK+fu8whlS1mroXtlEoYb0SzAmOoL7t0nKlTHso4Ns
 suZ0KOBiTB0aabLeoG1FuDv/ul9aFjvfzpT4gEdajoTU2w1/hGFR+Ab7HZUBPX36ysaOOS
 TyGo3Ab9HW7UP2O+1/MvuRFp/HCU/oI=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-tZIo6D6nNJOxIpMhxE0WJQ-1; Thu, 04 May 2023 07:22:46 -0400
X-MC-Unique: tZIo6D6nNJOxIpMhxE0WJQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-b8f32cc8c31so675439276.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 04:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683199365; x=1685791365;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zHXQo+p5GWKzE7+35FNQkbr9i18s91JcIq7BrNB9Tcg=;
 b=Gkf3ZDlQyG+xRB2MVQ5S7FNQqANWU6MIq7d2u9ICTaHu978mTgNsDz5j89vqvCbrpr
 OykWqM+8LcByT4tWjctnrdXUrLVUv+ORbWjZ4aelSR/emzB6rUFzZZiEOzAhmozEv/e9
 D/0vlrDhglMp7TNpVi+q25M+H3zmFUZ1s6IV6UpGdVc61wTwn84yLnmyZBqmC2dYU/gc
 ySMaMCrxxlmv2YYki79nqKiv96o+H5DvziQ/yP+RBRiGNCNBv5zAp3Wa3hBqGrsbC7No
 K9vllSqsK421k6wzDdt+1xnthXr+sAtENtTSyp5baoALOFulP0lTnkKWw/Wen23eFOXc
 6fow==
X-Gm-Message-State: AC+VfDwsdsDdw/289zdK+FtMOPYY7mye4MCDIZzoJN+poxflOB0xhzgo
 6zCXsiIfj4U5f44LfbhmYmNnarjOkJn+sui3l3iCFl7KdyMySIlpBOFA9zf4oD2vZ3y671dgkb7
 FqH100Lw1udXB9pNVbJHezI/FQoy6fxM=
X-Received: by 2002:a25:b38a:0:b0:b99:f435:3f09 with SMTP id
 m10-20020a25b38a000000b00b99f4353f09mr21782733ybj.29.1683199365580; 
 Thu, 04 May 2023 04:22:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6L4SFUf11SXN6fikQqg3FXl2THL2z/vK9R4E3zgUD0oj0AoyztxfrtPheA7tq91LBUyiOKp7oKTTxS/9oNMCg=
X-Received: by 2002:a25:b38a:0:b0:b99:f435:3f09 with SMTP id
 m10-20020a25b38a000000b00b99f4353f09mr21782707ybj.29.1683199365027; Thu, 04
 May 2023 04:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230504095657.239048-1-kkostiuk@redhat.com>
 <6db84566-e0d4-e519-55e7-16b9188d8670@linaro.org>
In-Reply-To: <6db84566-e0d4-e519-55e7-16b9188d8670@linaro.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 4 May 2023 14:22:34 +0300
Message-ID: <CAPMcbCpoWG5NoyEvKz7ZDrOBOWsMZCGh52834U2Oh3vXbcoGWw@mail.gmail.com>
Subject: Re: [PULL 0/6] Misc QGA patches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003d2c5c05fadc64e7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000003d2c5c05fadc64e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Richard. It was ok to use git@ URL last time but not a problem to
fix.


Best Regards,
Konstantin Kostiuk.


On Thu, May 4, 2023 at 2:10=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 5/4/23 10:56, Konstantin Kostiuk wrote:
> > From: Kostiantyn Kostiuk<kostyanf14@live.com>
> >
> >
> > The following changes since commit
> 044f8cf70a2fdf3b9e4c4d849c66e7855d2c446a:
> >
> >    Merge tag 'migration-20230428-pull-request' ofhttps://
> gitlab.com/juan.quintela/qemu  into staging (2023-05-03 10:29:30 +0100)
> >
> > are available in the Git repository at:
> >
> >    git@github.com:kostyanf14/qemu.git  tags/qga-pull-2023-05-04
>
> Please adjust your .git/config to use url=3Dhttps and pushurl=3Dgit@
> so that you automatically get an https:// url here.
>
> Fixed by hand while applying, so no need to re-send now.
>
>
> r~
>
>

--0000000000003d2c5c05fadc64e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, Richard. It was ok to use <span class=3D"gmai=
l-im">git@ URL last time but not a problem to fix. <br></span></div><div><b=
r></div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</di=
v><div>Konstantin Kostiuk.</div></div></div></div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 4, =
2023 at 2:10=E2=80=AFPM Richard Henderson &lt;<a href=3D"mailto:richard.hen=
derson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 5/4/23 10:56, Konstantin =
Kostiuk wrote:<br>
&gt; From: Kostiantyn Kostiuk&lt;<a href=3D"mailto:kostyanf14@live.com" tar=
get=3D"_blank">kostyanf14@live.com</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; The following changes since commit 044f8cf70a2fdf3b9e4c4d849c66e7855d2=
c446a:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Merge tag &#39;migration-20230428-pull-request&#39; ofhtt=
ps://<a href=3D"http://gitlab.com/juan.quintela/qemu" rel=3D"noreferrer" ta=
rget=3D"_blank">gitlab.com/juan.quintela/qemu</a>=C2=A0 into staging (2023-=
05-03 10:29:30 +0100)<br>
&gt; <br>
&gt; are available in the Git repository at:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 git@github.com:kostyanf14/qemu.git=C2=A0 tags/qga-pull-20=
23-05-04<br>
<br>
Please adjust your .git/config to use url=3Dhttps and pushurl=3Dgit@<br>
so that you automatically get an https:// url here.<br>
<br>
Fixed by hand while applying, so no need to re-send now.<br>
<br>
<br>
r~<br>
<br>
</blockquote></div>

--0000000000003d2c5c05fadc64e7--


