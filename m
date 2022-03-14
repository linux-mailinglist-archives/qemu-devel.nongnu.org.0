Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1EE4D7A6D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 06:35:53 +0100 (CET)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTdN2-0002dz-An
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 01:35:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTdLo-0001xS-TJ
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 01:34:37 -0400
Received: from [2607:f8b0:4864:20::e31] (port=41775
 helo=mail-vs1-xe31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTdLn-0003ON-8I
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 01:34:36 -0400
Received: by mail-vs1-xe31.google.com with SMTP id v128so15806664vsb.8
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cdr2FhmE3Yj+EDknYsUoBZWFXbeBfjnaXNw/DOasijc=;
 b=QSemNN9jWBIfHLoUzu0yq5KPkFOcKhCuggyEf7gZEK6zjTDISNV1WTkJ9+RVqInXF8
 A3ryDQy7HjReqHgSlbHyQ1zC04CpHKXYt7/n0BoWSGSbav5qovz5NaT3ueAAfCZ4ehK4
 eftLTPGq3xms6eDw29C6FAvnaFH1YQTPW11xJCti5sIbQuPw6TAh8fq+5pT7QAyhICqY
 ZTSq8LqFLV5KDV6ZY/zahriXE3ONs2pyvIs1X01QAogloyMgQC3y9o7dU+6eGIw0OQ6M
 PbCOPwU343BjWSHbNvWOOxqR2IREYVSs6PV8tueM4m6BPDy7rheQ0qpwZKzqJLabo0lV
 ob7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cdr2FhmE3Yj+EDknYsUoBZWFXbeBfjnaXNw/DOasijc=;
 b=Qv0w6CaogMbjAgkwOmSQn0dhHEv/JdPRRgs/raX5BtUy/aIqMuKbTxaChWDbcV2siP
 t33oSfVe5F5XMFgnlig4K16yOXKj5z/BfxkP24szUpTRQMrEgjId4rxzD+FNY16OAdbn
 deyGa4RT+uBm8aV1UQIWqXapY6yK7Pdu6jVZCqEgS7VSe+PgkdVc2HGM7vukaXOoDY0O
 tWnrlwy0tpb468T0LHAUjJfHaLIFtmFArI9nrES993WxL+p+pK+02mUiixL7EXDih1AU
 slzPGz3VU0wE7hqNZKig7DCAbZOgbrqZkUkSQhnxF5d443uJamSmvOeFKVu+UwWGpj1y
 i/cQ==
X-Gm-Message-State: AOAM532cAXZs961kF3OL5erGryffm0Oe5y1QUwounwO/DnC3kzZFY4ZR
 rZPupwLeWeStRd+IZLPZzZk/ZalceXuwwCrcb71LGg==
X-Google-Smtp-Source: ABdhPJwRdBDSG5S7D6P3RLejEcoYRugVcW8enCC4Et9TIFRhMMmDu8HhzwLPWTv1JmNJeKhZau4sXdbSAjir0kFzUY8=
X-Received: by 2002:a67:f7d9:0:b0:320:9c38:1ac2 with SMTP id
 a25-20020a67f7d9000000b003209c381ac2mr9599982vsp.6.1647236073415; Sun, 13 Mar
 2022 22:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
 <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
 <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
 <CANCZdfoC8ArxyvD3PpBWiYdqONR32oeqioqk42CeoMeKRgecZQ@mail.gmail.com>
 <45371f77-cae6-bf96-802d-6a3e70d5e334@linaro.org>
 <CANCZdfrMaDY=0u-HAB9GY69NUTHES30V_agvZhCw3Gnr6aOomw@mail.gmail.com>
 <d8e85004-de8d-fe7f-6bd3-a86ea5bb8e6a@linaro.org>
 <CANCZdfrTNdXx7xz9mcw5rXK0bbwh0mF2iLX1JGeAXWHv8zn4+Q@mail.gmail.com>
 <a4ad47df-3c1b-6487-eabe-1d63ae800e2f@linaro.org>
In-Reply-To: <a4ad47df-3c1b-6487-eabe-1d63ae800e2f@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 13 Mar 2022 23:34:25 -0600
Message-ID: <CANCZdfpuV82LacLO_NodTWsdMYKfrh_jCj-OH9B2PavkoEmv4Q@mail.gmail.com>
Subject: Re: Question about atomics
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000004753505da27092e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::e31;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000004753505da27092e
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 13, 2022 at 10:43 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 3/13/22 21:09, Warner Losh wrote:
> > Oh? Out of paranoia, how can I verify that this is the case when
> compiled on FreeBSD?
> > Perhaps the atomic sequence FreeBSD uses differs a little from Linux and
> we don't trigger
> > that code? Or there's some adjustment that I've not made yet... the code
> seems to work
> > on 3.1 but not on latest, and there's been a lot of changes to tcg, so
> I'd like to rule it
> > out since there's a lot of other change too and there's too many
> variables...
>
> Can you point me at this code on your branch?
>

I just pushed this to gitlab:

https://gitlab.com/bsdimp/qemu/-/tree/blitz

Thanks for any insight that you can provide...

Warner

--00000000000004753505da27092e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 13, 2022 at 10:43 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 3/13/22 21:09, Warner Losh wrote:<br>
&gt; Oh? Out of paranoia, how can I verify that this is the case when compi=
led on FreeBSD?<br>
&gt; Perhaps the atomic sequence FreeBSD uses differs a little from Linux a=
nd we don&#39;t trigger<br>
&gt; that code? Or there&#39;s some adjustment that I&#39;ve not made yet..=
. the code seems to work<br>
&gt; on 3.1 but not on latest, and there&#39;s been a lot of changes to tcg=
, so I&#39;d like to rule it<br>
&gt; out since there&#39;s a lot of other change too and there&#39;s too ma=
ny variables...<br>
<br>
Can you point me at this code on your branch?<br></blockquote><div><br></di=
v><div>I just pushed this to gitlab:</div><div><br></div><div><a href=3D"ht=
tps://gitlab.com/bsdimp/qemu/-/tree/blitz">https://gitlab.com/bsdimp/qemu/-=
/tree/blitz</a></div><div><br></div><div>Thanks for any insight that you ca=
n provide...<br></div><div><br></div><div>Warner<br></div></div></div>

--00000000000004753505da27092e--

