Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9449507AA8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 22:07:40 +0200 (CEST)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngu8P-0001Ja-L5
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 16:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trodgers@redhat.com>)
 id 1ngslh-0000Ud-Mu
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trodgers@redhat.com>)
 id 1ngsle-0001pr-Jh
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650393601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iUSkMqkZenyJxfhmB8SgHEuq5bxVW2++GjQhdaOCHH4=;
 b=ZQPamxqLSMa4/k4zRckzzGW9LVEmhGOGdfsImJiulYTNl6tx8+i7uro02Lx36a8pHCGrNk
 GyWmCy6cwRZoaiitp9B7ZnzL+KrMcPCW59UwsM5r8AHEG9LJ0EAYmblp41GzfCxgCGPrL4
 4HmtUCv+E+wnHzdItPS62NWPgA9tWUQ=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-dJn_Co8oNMSZvr8gIeoTcg-1; Tue, 19 Apr 2022 14:38:49 -0400
X-MC-Unique: dJn_Co8oNMSZvr8gIeoTcg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-e5bae51cefso2096168fac.2
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iUSkMqkZenyJxfhmB8SgHEuq5bxVW2++GjQhdaOCHH4=;
 b=5ZCTxKSl3qs3/D0WlmiHz9uk2YfLDBUQB913tl33aT7xGHtFWPYg7jXzDjHgtmdbaP
 YUiuBYlmn4RUzVt+PzGbZAwqONvvOxtlVj+1hzuVQOnA4cMNEFfSMQG1kHY7v96nF7n2
 OBuetOz+j/ejBjxWB/v4wP39qYhUMD+b0TzAtmfPelv5ZjG8dPTVC5PvOt8Ag26uERHo
 W0LithHgWFd4c1R8dOM+F3AnqRGC9xA6iSBbQVOKvI9V90Wzj6JxkVfRxC8aQo2sM0Uu
 hlBCtbDgpOfpQO0Jes50Or3Ct+fLFDtriyPHHtKTCPO0Ru+bpAcnWaF1XzKw+hVxAtlb
 boNA==
X-Gm-Message-State: AOAM531LEWZEkVOyaHZbs3fG/fy7r0QzqZaqlE6s1p4UYlYwYuV9G+Rt
 aOdpIlGEtjKnGmo4FItq7Bt2pYQLemEDwy9WPUYUWFP9pcMFKmEPSER0KnjL5c1aXiqGZ7tWHY1
 rLh9gYgY0aqqCRq1jocNPJN7nY8Vn4a8=
X-Received: by 2002:a05:6870:2041:b0:db:1a12:6cb1 with SMTP id
 l1-20020a056870204100b000db1a126cb1mr8519924oad.153.1650393528658; 
 Tue, 19 Apr 2022 11:38:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsrS8udxIc3XnPS6kKFWcgynVQXkYfnxuVDZWn/nouP/cmYDgmQ0rtNlP5e2CKH8bf8p9QjXRKb21+VCxYzKU=
X-Received: by 2002:a05:6870:2041:b0:db:1a12:6cb1 with SMTP id
 l1-20020a056870204100b000db1a126cb1mr8519881oad.153.1650393527004; Tue, 19
 Apr 2022 11:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <877d9uzgsd.fsf@oldenburg.str.redhat.com>
 <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
 <8735k1q452.fsf@oldenburg.str.redhat.com>
 <Yh4iHeb6FsnxLUNn@stefanha-x1.localdomain>
 <87lew12tr9.fsf@oldenburg.str.redhat.com>
In-Reply-To: <87lew12tr9.fsf@oldenburg.str.redhat.com>
From: Thomas Rodgers <trodgers@redhat.com>
Date: Tue, 19 Apr 2022 11:38:36 -0700
Message-ID: <CAMmuTO8p72XqS8BR3tgP35KAMXc1gmEp3X=k7E_wAmJpVyQDGw@mail.gmail.com>
Subject: Re: Portable inline asm to get address of TLS variable
To: Florian Weimer <fweimer@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trodgers@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eac96605dd062fc9"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=trodgers@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Apr 2022 16:04:22 -0400
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
Cc: Jason Merrill <jason@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jonathan Wakely <jwakely@redhat.com>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eac96605dd062fc9
Content-Type: text/plain; charset="UTF-8"

So, this was my primary objection during the standardization of coroutines
for C++20. Red Hat's vote was consistently against adding the feature
without library support, but here we are.

Lewis Baker (formerly at Facebook) has led most of the work since on
defining what that library support might look like. The library where he
has done most of his exploration on the matter is -

https://github.com/lewissbaker/cppcoro

I spoke a bit this morning with one of the C++ committee members most
directly involved in where this is going standardization-wise and the
takeaway about the current expectations is -

C++23 is likely to get at least some minimal library support in the form of
-

http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2022/p2502r1.pdf

Which defines a generator<T> that models std::ranges::input_range.

But, for anything that involves a library for scheduling asynchronous
execution of coroutines (e.g. tasks<T>'s) on different execution contexts
(threads) that is likely not going to happen until C++26.

I wish I had a better story to tell.

Tom.

On Tue, Apr 19, 2022 at 4:32 AM Florian Weimer <fweimer@redhat.com> wrote:

> * Stefan Hajnoczi:
>
> > On Tue, Mar 01, 2022 at 12:54:49PM +0100, Florian Weimer wrote:
> >> > I took a quick look at C++20 coroutines since they are available in
> >> > compilers but the primitives look hard to use even from C++, let alone
> >> > from C.
> >>
> >> Could you go into details what makes them hard to use?  Is it because
> >> coroutines are infectious across the call stack?
> >
> > Here is the simplest tutorial on C++20 coroutines I found:
> > https://itnext.io/c-20-coroutines-complete-guide-7c3fc08db89d
> >
> > The amount of boilerplate for trivial coroutine functions is ridiculous.
>
> Would an execution agent library reduce that usage overhead?
>
> Cc:ing Thomas, who might know the answer.
>
> Thanks,
> Florian
>
>

--000000000000eac96605dd062fc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So, this was my primary objection during the standardizati=
on of coroutines for C++20. Red Hat&#39;s vote was consistently against add=
ing the feature without library support, but here we are.<div><br></div><di=
v>Lewis Baker (formerly at Facebook) has led most of the work since on defi=
ning what that library support might look like. The library where he has do=
ne most of his exploration on the matter is -</div><div><br></div><div><a h=
ref=3D"https://github.com/lewissbaker/cppcoro" target=3D"_blank">https://gi=
thub.com/lewissbaker/cppcoro</a><br></div><div><br></div><div>I spoke a bit=
 this morning with one of the C++ committee members most directly involved =
in where this is going standardization-wise and the takeaway about the curr=
ent expectations=C2=A0is -</div><div><br></div><div>C++23 is likely to get =
at least some minimal library support in the form of -</div><div><br></div>=
<div><a href=3D"http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2022/p25=
02r1.pdf">http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2022/p2502r1.p=
df</a><br></div><div><br></div><div>Which defines a generator&lt;T&gt; that=
 models std::ranges::input_range.</div><div><br></div><div>But, for anythin=
g that involves a library for scheduling asynchronous execution of coroutin=
es (e.g. tasks&lt;T&gt;&#39;s) on different execution contexts (threads) th=
at is likely not going to happen until=C2=A0C++26.</div><div><br></div><div=
>I wish I had a better story to tell.</div><div><br></div><div>Tom.</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Apr 19, 2022 at 4:32 AM Florian Weimer &lt;<a href=3D"mailto:fweimer@=
redhat.com" target=3D"_blank">fweimer@redhat.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">* Stefan Hajnoczi:<br>
<br>
&gt; On Tue, Mar 01, 2022 at 12:54:49PM +0100, Florian Weimer wrote:<br>
&gt;&gt; &gt; I took a quick look at C++20 coroutines since they are availa=
ble in<br>
&gt;&gt; &gt; compilers but the primitives look hard to use even from C++, =
let alone<br>
&gt;&gt; &gt; from C.<br>
&gt;&gt; <br>
&gt;&gt; Could you go into details what makes them hard to use?=C2=A0 Is it=
 because<br>
&gt;&gt; coroutines are infectious across the call stack?<br>
&gt;<br>
&gt; Here is the simplest tutorial on C++20 coroutines I found:<br>
&gt; <a href=3D"https://itnext.io/c-20-coroutines-complete-guide-7c3fc08db8=
9d" rel=3D"noreferrer" target=3D"_blank">https://itnext.io/c-20-coroutines-=
complete-guide-7c3fc08db89d</a><br>
&gt;<br>
&gt; The amount of boilerplate for trivial coroutine functions is ridiculou=
s.<br>
<br>
Would an execution agent library reduce that usage overhead?<br>
<br>
Cc:ing Thomas, who might know the answer.<br>
<br>
Thanks,<br>
Florian<br>
<br>
</blockquote></div>

--000000000000eac96605dd062fc9--


