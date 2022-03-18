Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2524DDC89
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:12:47 +0100 (CET)
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEHW-0004am-AL
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:12:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVEEC-0000Xb-T5
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:09:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVEE7-0003EJ-1V
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647616153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lxAwFKalKQCuoKJJOFKTgx5tB/azNEVaFZL9HUqwj08=;
 b=DL7x2cp5Y7tIB30lv5FfSnLKcAS3rp+WnjcFrjJINIsMMe3IP2zgG7kFzIE7tAOZMuTQqg
 +YY5/yJcoRsAxT0p5ECb7W5WTwdzlFDxX8eFWXxjV96euon0ZCURq72IYeICmaXndcFZFf
 rdqnu54/uqFmAvhuz5BSOI3EjCjscyE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-vp7_38dcMSudYbIk74utgw-1; Fri, 18 Mar 2022 11:09:09 -0400
X-MC-Unique: vp7_38dcMSudYbIk74utgw-1
Received: by mail-vs1-f69.google.com with SMTP id
 x23-20020a67dc17000000b00324d7313583so346290vsj.18
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 08:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lxAwFKalKQCuoKJJOFKTgx5tB/azNEVaFZL9HUqwj08=;
 b=yacqbpuurMqEmfUQPQNdfjdCa4jw7Wi4Eplknspaj3OXEMRiA1pVEbdEBcKU8wJkm3
 G5CLwwmN5VWdxRMWMSbMqb987bzZl5urSSqn3qLtwnkRa7gyCQ7A0L1nyK3r6WnxvHov
 czeZLVS4jXkLccXjMvbbh4tVvwPFcEcRLmLwP441nRsHrOuSDBOefL/JwVwKJ0loL0dn
 ciR4OBq9KdO8HvUIUXurK2RCQmky+rL3XElvZiUOmpyyTyZKLRJlweOR8/r23Ddpyz5W
 G+PKXTgXly4wSJrBaW+Wki8s5bu6XKNoXozadMLiTsqY3MCaVlT7LDec0yfZ1WfudplP
 hGHw==
X-Gm-Message-State: AOAM530k7DUFAywQEVwCAAvGqOpfrOaXU6rw3wBuDFpyJSt+/9ZWpKNB
 TjFVmVnO//DrupuYufBkhmGmaiALnX5sXRngLyCmrGmZr8HRerX+MZ6+R6gm3nZKGQgzyY1phGg
 qp5VbL4Y9nbYhptlTdYVgpDblEz8C7fs=
X-Received: by 2002:a05:6122:a22:b0:33e:ab97:41f2 with SMTP id
 34-20020a0561220a2200b0033eab9741f2mr1464737vkn.1.1647616149034; 
 Fri, 18 Mar 2022 08:09:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysHaHABTAgUr+zXFw6Q30jnajpSdoVqrOChecfvNo25Emf1dnsbUAeiO0SHvDAVA+uDsv1yTNj2terLgo9F70=
X-Received: by 2002:a05:6122:a22:b0:33e:ab97:41f2 with SMTP id
 34-20020a0561220a2200b0033eab9741f2mr1464718vkn.1.1647616148720; Fri, 18 Mar
 2022 08:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220317234937.569525-1-jsnow@redhat.com>
 <73e7fc10-e843-68fd-ebe3-e7916c891c34@redhat.com>
In-Reply-To: <73e7fc10-e843-68fd-ebe3-e7916c891c34@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 18 Mar 2022 11:08:59 -0400
Message-ID: <CAFn=p-ZXi9WG8+oMkYotxH6XdHxj+0WAVJ_zAui0R4tYTree0w@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] iotests: add enhanced debugging info to qemu-img
 failures
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000045665e05da7f8715"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000045665e05da7f8715
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022, 9:36 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 18.03.22 00:49, John Snow wrote:
> > Hiya!
> >
> > This series effectively replaces qemu_img_pipe_and_status() with a
> > rewritten function named qemu_img() that raises an exception on non-zero
> > return code by default. By the end of the series, every last invocation
> > of the qemu-img binary ultimately goes through qemu_img().
> >
> > The exception that this function raises includes stdout/stderr output
> > when the traceback is printed in a a little decorated text box so that
> > it stands out from the jargony Python traceback readout.
> >
> > (You can test what this looks like for yourself, or at least you could,
> > by disabling ztsd support and then running qcow2 iotest 065.)
> >
> > Negative tests are still possible in two ways:
> >
> > - Passing check=False to qemu_img, qemu_img_log, or img_info_log
> > - Catching and handling the CalledProcessError exception at the callsite.
>
> Thanks!  Applied to my block branch:
>
> https://gitlab.com/hreitz/qemu/-/commits/block
>
> Hanna
>

Thanks so much!

I have more works-in-progress, but I want to be kind to your time. (And
tolerance level for Python.)

Important:

- 4 patches that switch to async qmp permanently. Almost no code, it's just
a policy thing, but it could affect iotests. Not for this freeze now, but
it'd help me a lot if you could take the time to ack it next week so I can
stage them and push forward with splitting the qmp library out of the tree.
I need to rebase and resend, which I'll do in just a bit.

Not urgent:

- Another 15ish patches for unifying qemu-io calls like i did for qemu-img
here. Stalled somewhat because I couldn't convincingly unify the qemu_io
calls that keep the pipe open, so I will probably just leave those calls
alone for now, unless I get a New Idea. Should I send them to the list and
you'll get to them whenever you get to them, or would you prefer I wait a
while?

- Another 15ish patches that split the "skip files" list for pylint/mypy
into separate skip-lists per tool and then drastically reduces their size
such that only a handful of files remain in each skiplist. Same question
here: Should I send these to the list and someone'll get to it whenever
they do, or would you prefer I wait?

Thanks again.
--js

>

--00000000000045665e05da7f8715
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 18, 2022, 9:36 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 18.03.22 00:49, John Snow wrote:<br>
&gt; Hiya!<br>
&gt;<br>
&gt; This series effectively replaces qemu_img_pipe_and_status() with a<br>
&gt; rewritten function named qemu_img() that raises an exception on non-ze=
ro<br>
&gt; return code by default. By the end of the series, every last invocatio=
n<br>
&gt; of the qemu-img binary ultimately goes through qemu_img().<br>
&gt;<br>
&gt; The exception that this function raises includes stdout/stderr output<=
br>
&gt; when the traceback is printed in a a little decorated text box so that=
<br>
&gt; it stands out from the jargony Python traceback readout.<br>
&gt;<br>
&gt; (You can test what this looks like for yourself, or at least you could=
,<br>
&gt; by disabling ztsd support and then running qcow2 iotest 065.)<br>
&gt;<br>
&gt; Negative tests are still possible in two ways:<br>
&gt;<br>
&gt; - Passing check=3DFalse to qemu_img, qemu_img_log, or img_info_log<br>
&gt; - Catching and handling the CalledProcessError exception at the callsi=
te.<br>
<br>
Thanks!=C2=A0 Applied to my block branch:<br>
<br>
<a href=3D"https://gitlab.com/hreitz/qemu/-/commits/block" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://gitlab.com/hreitz/qemu/-/commits/bl=
ock</a><br>
<br>
Hanna<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Thanks so much!=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I have more works-in-progress, but I want to be kind to your time. (And =
tolerance level for Python.)</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Important:</div><div dir=3D"auto"><br></div><div dir=3D"auto">- 4 patc=
hes that switch to async qmp permanently. Almost no code, it&#39;s just a p=
olicy thing, but it could affect iotests. Not for this freeze now, but it&#=
39;d help me a lot if you could take the time to ack it next week so I can =
stage them and push forward with splitting the qmp library out of the tree.=
 I need to rebase and resend, which I&#39;ll do in just a bit.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Not urgent:</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">- Another 15ish patches for unifying qemu-io cal=
ls like i did for qemu-img here. Stalled somewhat because I couldn&#39;t co=
nvincingly unify the qemu_io calls that keep the pipe open, so I will proba=
bly just leave those calls alone for now, unless I get a New Idea. Should I=
 send them to the list and you&#39;ll get to them whenever you get to them,=
 or would you prefer I wait a while?</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">- Another 15ish patches that split the &quot;skip files&quot; =
list for pylint/mypy into separate skip-lists per tool and then drastically=
 reduces their size such that only a handful of files remain in each skipli=
st. Same question here: Should I send these to the list and someone&#39;ll =
get to it whenever they do, or would you prefer I wait?</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Thanks again.</div><div dir=3D"auto">--js</=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"></blockquote></div></div></div>

--00000000000045665e05da7f8715--


