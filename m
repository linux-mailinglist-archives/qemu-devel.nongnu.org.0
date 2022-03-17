Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF14DC92A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:47:07 +0100 (CET)
Received: from localhost ([::1]:42334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrP8-0007iQ-28
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:47:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUrKt-00040V-3c
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUrKq-0002kv-8B
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647528159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p8CPuJbtEk1Vlcw/a4TC4UboDV6eolujQNGHC6TFdew=;
 b=a56g42VgK8J+nVMdqfcl54tqdxfMhqbTIRFJXy1Bvg0Gxow5FhaLrWk0Nd2WKPSJ6XB9vm
 NgScaTod4qNMoOcHz8SX6CscDE5yXWejBGBFn/lDJD7ZqDbKjZUjpgAY9pZ5CT5WObWbYT
 6l7c77Bx9vYqSr3vPpuufeZIb6hka84=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-4hoth0REO-aCqwYx4eHt9A-1; Thu, 17 Mar 2022 10:42:36 -0400
X-MC-Unique: 4hoth0REO-aCqwYx4eHt9A-1
Received: by mail-ua1-f69.google.com with SMTP id
 s13-20020a056130020d00b0034dfb85694dso2539796uac.2
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 07:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8CPuJbtEk1Vlcw/a4TC4UboDV6eolujQNGHC6TFdew=;
 b=pj/83iZCSTqBud8d3nKNeSV2OfzGhtV0i15VVoiYoaXvN7YNOPdXuQcUoiYJdF9ZHN
 G8RdyBWZzs1KPrTthQEgJqblulzrNjGS/Wcr+EaGh+j1vDvChHTCEbtyFuXR3MqpwLVp
 xJSn4bhDpTdpjbDHdHk7zO2TYyF63XcCiEk+RID9cjV81voXJN9gnzTImUj4tMZk9DvL
 VKH++nq+5dFCktIxow5r6DwlSSgRx9JitIHcsL1y7JnpAYMvECbup+NN/znzqIoLtM+Q
 q1cZsEPE/5dV1NclVSSIfNZHvzVTfcTw6008ub4jpk2RJ2YU09tVC4IDUJKU+CF0G8/v
 WiZw==
X-Gm-Message-State: AOAM5333dqae2vdaI6UVuSdx6hVULC2jVjA4gmGAIQxEjBqMWESSnUZR
 /y7fyyUQ5Zh/m0Hn5sQZ+oH75ELvRu94qye+liw7QZPOYqA7OuyPp3tIVHJyPr3oeQtLOirBnri
 sht4uY9h7B/x4dRTQbgf1OvqP9QjfAiU=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr2018836vsa.38.1647528156310; 
 Thu, 17 Mar 2022 07:42:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLWNndKzg9x7ZRgC8JDvJqgNr6mODi6zhdMSE2trCu72Vxo7s8z+y9WTC0U+LBMzOQryHlAPdp4zx90dwp9TE=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr2018826vsa.38.1647528156089; Thu, 17 Mar
 2022 07:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-2-jsnow@redhat.com>
 <813e9265-1920-1caf-0d07-39b20c7bb944@redhat.com>
In-Reply-To: <813e9265-1920-1caf-0d07-39b20c7bb944@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 10:42:26 -0400
Message-ID: <CAFn=p-Z-jLo8XEZFuXHMYfEx+rRp7=3XDL08gBxXPuzAtp6yuA@mail.gmail.com>
Subject: Re: [PATCH 01/14] iotests: add qemu_img_json()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008062ea05da6b0a6b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008062ea05da6b0a6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022, 6:53 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 09.03.22 04:53, John Snow wrote:
> > qemu_img_json() is a new helper built on top of qemu_img() that tries t=
o
> > pull a valid JSON document out of the stdout stream.
> >
> > In the event that the return code is negative (the program crashed), or
> > the code is greater than zero and did not produce valid JSON output, th=
e
> > VerboseProcessError raised by qemu_img() is re-raised.
> >
> > In the event that the return code is zero but we can't parse valid JSON=
,
> > allow the JSON deserialization error to be raised.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/iotests.py | 38 ++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 38 insertions(+)
> >
> > diff --git a/tests/qemu-iotests/iotests.py
> b/tests/qemu-iotests/iotests.py
> > index 7057db0686..546b142a6c 100644
> > --- a/tests/qemu-iotests/iotests.py
> > +++ b/tests/qemu-iotests/iotests.py
> > @@ -276,6 +276,44 @@ def ordered_qmp(qmsg, conv_keys=3DTrue):
> >   def qemu_img_create(*args: str) -> subprocess.CompletedProcess[str]:
> >       return qemu_img('create', *args)
> >
> > +def qemu_img_json(*args: str) -> Any:
> > +    """
> > +    Run qemu-img and return its output as deserialized JSON.
> > +
> > +    :raise CalledProcessError:
> > +        When qemu-img crashes, or returns a non-zero exit code without
> > +        producing a valid JSON document to stdout.
> > +    :raise JSONDecoderError:
> > +        When qemu-img returns 0, but failed to produce a valid JSON
> document.
> > +
> > +    :return: A deserialized JSON object; probably a dict[str, Any].
> > +    """
> > +    json_data =3D ...  # json.loads can legitimately return 'None'.
>
> What kind of arcane sigil is this?
>

I may genuinely start referring to it as the Arcane Sigil.


> I=E2=80=99m trying to read into it, but it seems like...  Well, I won=E2=
=80=99t swear on
> a public list.  As far as I understand, it=E2=80=99s just a special singl=
eton
> object that you can use for whatever you think is an appropriate use for
> an ellipsis?  And so in this case you use it as a special singleton
> object that would never legitimately appear, to be separate from None?
>
> You=E2=80=99re really, really good at making me hate Python a bit more wi=
th
> every series.
>

I aim to please.

Yes, it's just Another Singleton That Isn't None, because technically a
JSON document can be just "null". Will qemu_img() ever, ever print that
single string all by itself?

Well, I hope not, but. I felt guilty not addressing that technicality
somehow.


> It also just doesn=E2=80=99t seem very useful to me in this case.  I=E2=
=80=99m not sure
> whether this notation is widely known in the Python world, but I have
> only myself to go off of, and I was just very confused, so I would
> prefer not to have this in the code.
>

You're right, it's a bit too clever. I judged the cleverness:usefulness
ratio poorly.

(I think it's a trick that a lot of long time python people know, because
sooner or later one wants to distinguish between an explicitly provided
"None" and a default value that signifies "No argument provided". It's
definitely a hack. It's not something most users would know.)


> > +
> > +    try:
> > +        res =3D qemu_img(*args, combine_stdio=3DFalse)
> > +    except subprocess.CalledProcessError as exc:
> > +        # Terminated due to signal. Don't bother.
> > +        if exc.returncode < 0:
> > +            raise
> > +
> > +        # Commands like 'check' can return failure (exit codes 2 and 3=
)
> > +        # to indicate command completion, but with errors found. For
> > +        # multi-command flexibility, ignore the exact error codes and
> > +        # *try* to load JSON.
> > +        try:
> > +            json_data =3D json.loads(exc.stdout)
>
> Why not `return json.loads(exc.stdout)`?
>

Uh.


> > +        except json.JSONDecodeError:
> > +            # Nope. This thing is toast. Raise the process error.
> > +            pass
> > +
> > +        if json_data is ...:
> > +            raise
>
> And just unconditionally `raise` here.


Uhhh.


> > +
> > +    if json_data is ...:
> > +        json_data =3D json.loads(res.stdout)
> > +    return json_data
>
> And just `return json.loads(res.stdout)` here, without any condition.
>

Uhhhhhhhh...!

Yeah, that's obviously way better. I'm sorry to have subjected you to an
arcane workaround for no reason :/


>
> Hanna
>
> > +
> >   def qemu_img_measure(*args):
> >       return json.loads(qemu_img_pipe("measure", "--output", "json",
> *args))
> >
>
>

--0000000000008062ea05da6b0a6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 17, 2022, 6:53 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 09.03.22 04:53, John Snow wrote:<br>
&gt; qemu_img_json() is a new helper built on top of qemu_img() that tries =
to<br>
&gt; pull a valid JSON document out of the stdout stream.<br>
&gt;<br>
&gt; In the event that the return code is negative (the program crashed), o=
r<br>
&gt; the code is greater than zero and did not produce valid JSON output, t=
he<br>
&gt; VerboseProcessError raised by qemu_img() is re-raised.<br>
&gt;<br>
&gt; In the event that the return code is zero but we can&#39;t parse valid=
 JSON,<br>
&gt; allow the JSON deserialization error to be raised.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/iotests.py | 38 +++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 38 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotest=
s.py<br>
&gt; index 7057db0686..546b142a6c 100644<br>
&gt; --- a/tests/qemu-iotests/iotests.py<br>
&gt; +++ b/tests/qemu-iotests/iotests.py<br>
&gt; @@ -276,6 +276,44 @@ def ordered_qmp(qmsg, conv_keys=3DTrue):<br>
&gt;=C2=A0 =C2=A0def qemu_img_create(*args: str) -&gt; subprocess.Completed=
Process[str]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return qemu_img(&#39;create&#39;, *args)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +def qemu_img_json(*args: str) -&gt; Any:<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 Run qemu-img and return its output as deserialized JSON=
.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 :raise CalledProcessError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 When qemu-img crashes, or returns a non-z=
ero exit code without<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 producing a valid JSON document to stdout=
.<br>
&gt; +=C2=A0 =C2=A0 :raise JSONDecoderError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 When qemu-img returns 0, but failed to pr=
oduce a valid JSON document.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 :return: A deserialized JSON object; probably a dict[st=
r, Any].<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 json_data =3D ...=C2=A0 # json.loads can legitimately r=
eturn &#39;None&#39;.<br>
<br>
What kind of arcane sigil is this?<br></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">I may genuinely start referring to it as =
the Arcane Sigil.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I=E2=80=99m trying to read into it, but it seems like...=C2=A0 Well, I won=
=E2=80=99t swear on <br>
a public list.=C2=A0 As far as I understand, it=E2=80=99s just a special si=
ngleton <br>
object that you can use for whatever you think is an appropriate use for <b=
r>
an ellipsis?=C2=A0 And so in this case you use it as a special singleton <b=
r>
object that would never legitimately appear, to be separate from None?<br>
<br>
You=E2=80=99re really, really good at making me hate Python a bit more with=
 <br>
every series.<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I aim to please.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Yes, it&#39;s just Another Singleton That Isn&#39;t None, because tec=
hnically a JSON document can be just &quot;null&quot;. Will qemu_img() ever=
, ever print that single string all by itself?=C2=A0</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Well, I hope not, but. I felt guilty not addre=
ssing that technicality somehow.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
It also just doesn=E2=80=99t seem very useful to me in this case.=C2=A0 I=
=E2=80=99m not sure <br>
whether this notation is widely known in the Python world, but I have <br>
only myself to go off of, and I was just very confused, so I would <br>
prefer not to have this in the code.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">You&#39;re right, it&#39;s a bit too =
clever. I judged the cleverness:usefulness ratio poorly.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">(I think it&#39;s a trick that a lot of lo=
ng time python people know, because sooner or later one wants to distinguis=
h between an explicitly provided &quot;None&quot; and a default value that =
signifies &quot;No argument provided&quot;. It&#39;s definitely a hack. It&=
#39;s not something most users would know.)</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D qemu_img(*args, combine_stdio=3DF=
alse)<br>
&gt; +=C2=A0 =C2=A0 except subprocess.CalledProcessError as exc:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Terminated due to signal. Don&#39;t bot=
her.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if exc.returncode &lt; 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Commands like &#39;check&#39; can retur=
n failure (exit codes 2 and 3)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to indicate command completion, but wit=
h errors found. For<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # multi-command flexibility, ignore the e=
xact error codes and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # *try* to load JSON.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json_data =3D json.loads(ex=
c.stdout)<br>
<br>
Why not `return json.loads(exc.stdout)`?<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Uh.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except json.JSONDecodeError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Nope. This thing is toast=
. Raise the process error.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if json_data is ...:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
<br>
And just unconditionally `raise` here.</blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Uhhh.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if json_data is ...:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 json_data =3D json.loads(res.stdout)<br>
&gt; +=C2=A0 =C2=A0 return json_data<br>
<br>
And just `return json.loads(res.stdout)` here, without any condition.<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Uhhhhh=
hhh...!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah, that&#39;s=
 obviously way better. I&#39;m sorry to have subjected you to an arcane wor=
karound for no reason :/</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br><br>
Hanna<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0def qemu_img_measure(*args):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return json.loads(qemu_img_pipe(&quot;measur=
e&quot;, &quot;--output&quot;, &quot;json&quot;, *args))<br>
&gt;=C2=A0 =C2=A0<br>
<br>
</blockquote></div></div></div>

--0000000000008062ea05da6b0a6b--


