Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0956D0783
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:01:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phspr-0006UA-91; Thu, 30 Mar 2023 10:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1phspl-0006U0-GS
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1phspj-0007lR-5n
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680184846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6smZsD9fVdTv5X2D00gzGEEo5MdEuCcsdzpA7DpfReY=;
 b=IuE8SjGdiBkS9WRNCPTND841qQv5yM/b3TuGrqDhdplKjwE1iIQhfuYnY7d09xu5r5bbVd
 9+x1FW8+/Id0DNHgWiLOl9AGbXZcfChHBUNePvSejWfnsq7trKdc0naNtZO7OKHRZKvHpn
 73HjsIVWuSvlkJmR/FCjQjoGRxK//TQ=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-ptDX1UIPMdCMKBHriC4VsQ-1; Thu, 30 Mar 2023 10:00:44 -0400
X-MC-Unique: ptDX1UIPMdCMKBHriC4VsQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 t67-20020a628146000000b0062d6d838243so6533664pfd.21
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680184843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6smZsD9fVdTv5X2D00gzGEEo5MdEuCcsdzpA7DpfReY=;
 b=Tnbx1SXM+GOnSwqiUMYcLgDJS1cSi3bcvq+KjQzaZv39QDB7bVjVbJEVMhK8X5Zo7c
 S5P3BB+b+g0ILnT2sTQAS/ooMn8tVUt9QVmQbgBdUwbaREmi8l+5r7vWSFmD5lGZpMjh
 T0HKSfpUs7L3bpz2zOr1XJvodwpeH1NLBm7aVCzuc1/Qh/nUCPcahH+6nRBVTL5oooF0
 iBK5NseQ9Z8wDLHNQKhtGsZu4SJXjRn4kNyQMorzyJBfuq6Ov/T8jBO2YVgJ3rX/l2Z8
 naJ2E52czqyyAXQSu65sJ4k2fVvsZNePd7JWgDG8DhzSdEglvI0kR2hq5slzLWCYeaxS
 kxlA==
X-Gm-Message-State: AAQBX9cFDyxswS4QxlVGCjPaGwMLx2W7FWQHxbfdddYaVraSc718RZFi
 6B/H5EcwMc1vRo5YsfLQnsR+CN6W3RvzlvQJ8n6fsXp4j6TgQBpCuVoDGx6eLX9i5e1erKgAtD5
 bCDlfJ14kIAmZxHZEdJBdDxDN8Yy2iUg=
X-Received: by 2002:a17:902:b114:b0:1a2:8eb5:2ed with SMTP id
 q20-20020a170902b11400b001a28eb502edmr628137plr.12.1680184843348; 
 Thu, 30 Mar 2023 07:00:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZERXrkQArGgjaC11NrIvMljy1kIoOh9pksgDCilubxCp9RBOUlbWzQybRkjorE30J08qlWcqgYJArdOA/futQ=
X-Received: by 2002:a17:902:b114:b0:1a2:8eb5:2ed with SMTP id
 q20-20020a170902b11400b001a28eb502edmr628121plr.12.1680184842867; Thu, 30 Mar
 2023 07:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <20230328211119.2748442-2-jsnow@redhat.com>
 <d49d0152-ff58-a317-7eca-a243ed080ca0@redhat.com>
In-Reply-To: <d49d0152-ff58-a317-7eca-a243ed080ca0@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 30 Mar 2023 10:00:32 -0400
Message-ID: <CAFn=p-bu1nhw5-PdtxZ2U=PA5uq7VTrgW-W8boh29JRHxSVTyg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] python: add mkvenv.py
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b76b0305f81e84d4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000b76b0305f81e84d4
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 29, 2023, 8:56 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 3/28/23 23:11, John Snow wrote:
> > +        # venv class is cute and toggles this off before post_setup,
> > +        # but we need it to decide if we want to generate shims or not.
>
> Ha, yeah that's a bug in the venv package.  post_setup() can already run
> with system_site_packages reverted to True.
>
> > +            for entry_point in entry_points:
> > +                # Python 3.8 doesn't have 'module' or 'attr' attributes
> > +                if not (hasattr(entry_point, 'module') and
> > +                        hasattr(entry_point, 'attr')):
> > +                    match = pattern.match(entry_point.value)
> > +                    assert match is not None
> > +                    module = match.group('module')
> > +                    attr = match.group('attr')
> > +                else:
> > +                    module = entry_point.module
> > +                    attr = entry_point.attr
> > +                yield {
> > +                    'name': entry_point.name,
> > +                    'module': module,
> > +                    'import_name': attr,
> > +                    'func': attr,
>
> What about using a dataclass or namedtuple instead of a dictionary?
>

Sure. Once 3.8 is our minimum there's no point, though.


> >
> > +
> > +    try:
> > +        entry_points = _get_entry_points()
> > +    except ImportError as exc:
> > +        logger.debug("%s", str(exc))
> > +        raise Ouch(
> > +            "Neither importlib.metadata nor pkg_resources found, "
> > +            "can't generate console script shims.\n"
> > +            "Use Python 3.8+, or install importlib-metadata, or
> setuptools."
> > +        ) from exc
>
> Why not put this extra try/except inside _get_entry_points()?
>

I don't remember. I'll look! I know it looks goofy. The ultimate answer is
"So I can log all import failures without nesting eight layers deep".


> > +
> > +    # Test for ensurepip:
> > +    try:
> > +        import ensurepip
>
> Use find_spec()?
>

That might be better. Originally I tried to use ensurepip directly, but
found it didn't work right if you had already imported pip. This survived
from the earlier draft.


> BTW, another way to repair Debian 10's pip is to create a symbolic link
> to sys.base_prefix + '/share/python-wheels' in sys.prefix +
> '/share/python-wheels'.  Since this is much faster, perhaps it can be
> done unconditionally and checkpip mode can go away together with
> self._context?
>

I guess I like it less because it's way more Debian-specific at that point.
I think I'd sooner say "Sorry, Debian 10 isn't supported!"

(Or encourage users to upgrade their pip/setuptools/ensurepip to something
that doesn't trigger the bug.)

Or, IOW, I feel like it's normal to expect ensurepip to work but mussing
around with symlinks to special directories created by a distribution just
feels way more fiddly.


> Paolo
>
>

--000000000000b76b0305f81e84d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 29, 2023, 8:56 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 3/28/23 23:11, John Snow wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # venv class is cute and toggles this off=
 before post_setup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # but we need it to decide if we want to =
generate shims or not.<br>
<br>
Ha, yeah that&#39;s a bug in the venv package.=C2=A0 post_setup() can alrea=
dy run <br>
with system_site_packages reverted to True.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for entry_point in entry_po=
ints:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Python 3.8 =
doesn&#39;t have &#39;module&#39; or &#39;attr&#39; attributes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (hasat=
tr(entry_point, &#39;module&#39;) and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 hasattr(entry_point, &#39;attr&#39;)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 match =3D pattern.match(entry_point.value)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 assert match is not None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 module =3D match.group(&#39;module&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 attr =3D match.group(&#39;attr&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 module =3D entry_point.module<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 attr =3D entry_point.attr<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;name&#39;: <a href=3D"http://entry_point.name" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">entry_point.name</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;module&#39;: module,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;import_name&#39;: attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;func&#39;: attr,<br>
<br>
What about using a dataclass or namedtuple instead of a dictionary?<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sure. On=
ce 3.8 is our minimum there&#39;s no point, though.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><br>
&gt; <br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry_points =3D _get_entry_points()<br>
&gt; +=C2=A0 =C2=A0 except ImportError as exc:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;%s&quot;, str(exc))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Ouch(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Neither importlib.met=
adata nor pkg_resources found, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;can&#39;t generate co=
nsole script shims.\n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Use Python 3.8+, or i=
nstall importlib-metadata, or setuptools.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ) from exc<br>
<br>
Why not put this extra try/except inside _get_entry_points()?<br></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t re=
member. I&#39;ll look! I know it looks goofy. The ultimate answer is &quot;=
So I can log all import failures without nesting eight layers deep&quot;.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Test for ensurepip:<br>
&gt; +=C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import ensurepip<br>
<br>
Use find_spec()?<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">That might be better. Originally I tried to use ensurepip d=
irectly, but found it didn&#39;t work right if you had already imported pip=
. This survived from the earlier draft.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
BTW, another way to repair Debian 10&#39;s pip is to create a symbolic link=
 <br>
to sys.base_prefix + &#39;/share/python-wheels&#39; in sys.prefix + <br>
&#39;/share/python-wheels&#39;.=C2=A0 Since this is much faster, perhaps it=
 can be <br>
done unconditionally and checkpip mode can go away together with <br>
self._context?<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I guess I like it less because it&#39;s way more Debian-speci=
fic at that point. I think I&#39;d sooner say &quot;Sorry, Debian 10 isn&#3=
9;t supported!&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">(Or=
 encourage users to upgrade their pip/setuptools/ensurepip to something tha=
t doesn&#39;t trigger the bug.)</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Or, IOW, I feel like it&#39;s normal to expect ensurepip to work =
but mussing around with symlinks to special directories created by a distri=
bution just feels way more fiddly.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Paolo<br>
<br>
</blockquote></div></div></div>

--000000000000b76b0305f81e84d4--


