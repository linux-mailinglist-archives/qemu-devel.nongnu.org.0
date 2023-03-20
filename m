Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A406C1181
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 13:08:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peEI6-00028J-3v; Mon, 20 Mar 2023 08:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1peEI3-00027S-CK; Mon, 20 Mar 2023 08:07:03 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1peEI1-00034o-Mv; Mon, 20 Mar 2023 08:07:03 -0400
Received: by mail-pl1-x62d.google.com with SMTP id z19so1757648plo.2;
 Mon, 20 Mar 2023 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679314018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yqHNg7LPgNowD+ZfS1Vhszz3tn7zB9XlCiWPDP279/I=;
 b=bieiCRpzGiTZNtS7g1ngpjqP/z3kRp7hsHJUS82CYQ/FQid5klh28VOAoTusyv93I6
 mg/mLceR/YG1tP2F9PKAgVX6DJ6ygu/Awdr9cyudckbHJyMF9Y+mnsk0OjIRIDnyKO7V
 Ecx32AywzxEp/iEGGFbf4mzh90zYV0AbCpO4Hpa0w2xiovQAWH/K8jSafUw0uGqvbtrq
 tw96HfuFIR9dJS2rJfF2X2W2R0rPte3dd7dm/YOZfU+7SK26i8elAwOmbYMF4rjJ4L5Y
 lfleJaWyq1pgCO6WWH/GxsyWMSGW1qnmRqN6gkiG5H6f0++a/puMSH24CX7qzYbCh3yp
 Jf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679314018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yqHNg7LPgNowD+ZfS1Vhszz3tn7zB9XlCiWPDP279/I=;
 b=1wPzDm/mcKQXZDrOeIjMdtWWJML5V7KOUgJvqq1AT15NTBdzV3jYJRYZ23ZZLfQAx2
 0d5tzWEGd6I/iJd06RDtLlgE90/5HTXvmjXUYjEsljaYhR2EvSO48iw5yCQkTw2ka6TI
 CBXhxVXV2eEicLAnbzFxTpLx3Bi3Av53Htbg6Ieg9Otu1sGtNF40KVUa1N/PCt4PMFGJ
 Lcp5VcJIdBW0HrP7x+7C9VlEunt7K7ktN+rXnCOMaSY0WBZ+Nrw4AOhsQBjECnYtx5Tp
 sfBTRk8SdN2W1KswnGdOzB828aniCbC4y6H3wO+s6oLFD0SK2QaC8QbsyFy513yEr9xH
 w8Vg==
X-Gm-Message-State: AO0yUKX2E6T1+J6TVp+RdQt/F3fYK8uFUuP7AwXg3CISHl4g8TBF8QfI
 4DxudYgKTGwMZDxYC3zwDina6d88PwZ0WFxqYQg=
X-Google-Smtp-Source: AK7set+IXe0jh+lNStscFphQnsonVDPazX9/0V+a5nqnxpcnlWlj3N89t2NWOBDbN0q+N75/0tRFE4lQpi6t3SFOKrg=
X-Received: by 2002:a17:90b:3c87:b0:23f:1caa:233a with SMTP id
 pv7-20020a17090b3c8700b0023f1caa233amr3538708pjb.1.1679314018175; Mon, 20 Mar
 2023 05:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <10513163.6254.1678726591818@app134031.ytz3.service-now.com>
In-Reply-To: <10513163.6254.1678726591818@app134031.ytz3.service-now.com>
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
Date: Mon, 20 Mar 2023 14:06:43 +0200
Message-ID: <CAMPkWoO9bX5SE8TdTeaNsRkrusVUFjNjSV_P9GP--=iE4ePJoA@mail.gmail.com>
Subject: Re: [PATCH v1] hw/pvrdma: Protect against buggy or malicious guest
 driver
To: Red Hat Product Security <secalert@redhat.com>
Cc: marcel.apfelbaum@gmail.com, mcascell@redhat.com, qemu-security@nongnu.org, 
 qemu-devel@nongnu.org, soulchen8650@gmail.com
Content-Type: multipart/alternative; boundary="000000000000850d9d05f753c3ab"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000850d9d05f753c3ab
Content-Type: text/plain; charset="UTF-8"

Hi,
Patch is currently under review.
From my end, it was tested and proved to solve the problem.

To follow up you may need to check qemu-devel@nongnu.org from time to time.

Marcel, any feedback?

Yuval

On Mon, 13 Mar 2023 at 18:56, Red Hat Product Security <secalert@redhat.com>
wrote:

> Hello!
>
> INC2534320 ([PATCH v1] hw/pvrdma: Protect against buggy or malicious guest
> driver) has been updated.
>
> Opened for: yuval.shaia.ml@gmail.com
> Followers: qemu-devel@nongnu.org, soulchen8650@gmail.com, Mauro Matteo
> Cascella, qemu-security@nongnu.org, yuval.shaia.ml@gmail.com,
> marcel.apfelbaum@gmail.com
>
> A Guest updated your request with the following comments:
> Reply from: pjp@fedoraproject.org
>
> Hello Yuval,
>
> *How can I track and update my request?*
>
> To respond, reply to this email. You may also create a new email and
> include the request number (INC2534320) in the subject.
>
> Thank you,
> Product Security
>
> Ref:MSG71528958
>

--000000000000850d9d05f753c3ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>Patch is currently under review.</div><div>From my=
 end, it was tested and proved to solve=C2=A0the problem.</div><div><br></d=
iv><div>To follow up you may need to check=C2=A0<a href=3D"mailto:qemu-deve=
l@nongnu.org" target=3D"_blank">qemu-devel@nongnu.org</a>=C2=A0from time to=
 time.</div><div><br></div><div>Marcel, any feedback?</div><div><br></div><=
div>Yuval</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 13 Mar 2023 at 18:56, Red Hat Product Security &lt;=
<a href=3D"mailto:secalert@redhat.com">secalert@redhat.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div><p styl=
e=3D"margin-top:0px;margin-bottom:10px">Hello!</p><p style=3D"margin-top:0p=
x;margin-bottom:10px">INC2534320 ([PATCH v1] hw/pvrdma: Protect against bug=
gy or malicious guest driver) has been updated.</p><p style=3D"margin-top:0=
px;margin-bottom:10px">Opened for:=C2=A0<a href=3D"mailto:yuval.shaia.ml@gm=
ail.com" target=3D"_blank">yuval.shaia.ml@gmail.com</a><br>Followers:=C2=A0=
<a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qemu-devel@nongn=
u.org</a>, <a href=3D"mailto:soulchen8650@gmail.com" target=3D"_blank">soul=
chen8650@gmail.com</a>, Mauro Matteo Cascella, <a href=3D"mailto:qemu-secur=
ity@nongnu.org" target=3D"_blank">qemu-security@nongnu.org</a>, <a href=3D"=
mailto:yuval.shaia.ml@gmail.com" target=3D"_blank">yuval.shaia.ml@gmail.com=
</a>, <a href=3D"mailto:marcel.apfelbaum@gmail.com" target=3D"_blank">marce=
l.apfelbaum@gmail.com</a></p></div>
<p style=3D"margin-top:10px;margin-bottom:10px">A Guest updated your reques=
t with the following comments:</p>
<div style=3D"padding:10px 0px 10px 10px;background-color:ivory"><div>Reply=
 from: <a href=3D"mailto:pjp@fedoraproject.org" rel=3D"noopener noreferrer =
nofollow" target=3D"_blank">pjp@fedoraproject.org</a></div><div>=C2=A0</div=
><div>Hello Yuval,</div></div>
<div><p style=3D"margin-top:20px;margin-bottom:10px"><strong>How can I trac=
k and update my request?</strong></p><p style=3D"margin-top:0px;margin-bott=
om:10px">To respond, reply to this email. You may also create a new email a=
nd include the request number (INC2534320) in the subject.</p></div>
<p style=3D"margin-top:14px;margin-bottom:0px">Thank you,<br>Product Securi=
ty</p><div>=C2=A0</div><div style=3D"display:inline">Ref:MSG71528958</div><=
/div></blockquote></div>

--000000000000850d9d05f753c3ab--

