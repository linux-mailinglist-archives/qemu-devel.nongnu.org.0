Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3006E5FCEAB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 00:59:39 +0200 (CEST)
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oikhN-0003iJ-QQ
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 18:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viacheslav.dubeyko@bytedance.com>)
 id 1oikS5-0006T2-3R
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 18:43:49 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:33599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viacheslav.dubeyko@bytedance.com>)
 id 1oikRv-0006nv-St
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 18:43:44 -0400
Received: by mail-qk1-x732.google.com with SMTP id a18so108221qko.0
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 15:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:to:cc:references:date:subject:mime-version:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XbFjtvx0JJA5A3yx8+YEVnJu3pzK5gea3rmcmnnMPnE=;
 b=56rr55TdAmZhYV8WsScljgE6kHoZ5p4s3ZpH36d0l/b/BKlaKYWSd87hdSkd1qjelr
 Md7u6fOCVZ26tcoRefvler8UZk+opIsXR8ZiRp3TTEXAeZd+2Rvff+37WqhOy4BYD/Fs
 THw3hSrMZVrjK2uhmybjc5jGZETAlkHTvhXksFp7whZWTbow9ExlCBzyX60Llyuqi2Mv
 Vy21EqQW8wH0r97P/nmzy6JQcvWqD1BahK7PAs9UgyqOX9n2s4244ndTzGo8ZIb5qNAI
 mDfH/UhFNTxt5Ubfg+XNrmorxxzlQkes+BrWkanVX7w4Fe3sgeOFc/s5kCmJsoSkqEsh
 iW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:to:cc:references:date:subject:mime-version:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XbFjtvx0JJA5A3yx8+YEVnJu3pzK5gea3rmcmnnMPnE=;
 b=snfk4z5TXvZsWK647vJtlSkgvTYA9JHR+AZL79xamQSFqvF29DVq45t41ogaoMBM8w
 RHmHqRYVKHutWf+s2ee0B7uRxOlH8jwOlw510nXb3aNolQAL0oAoWlEImZFbhOkZ5gC/
 OS5YnQ/jK6ngPcKMCn0Xne68cT1aniCKdKO28R9x+SS0UDKOeySZz8TX27ZlOq6vG3GC
 I3QavRwWmGoidkmsKqYHcAB7W582UW+AXLlp2zTYF3gWD8p3VqTAZd2cSzbmQH676Wk/
 HPrMrFubWLHuBecqPES5Qj5oldyRzuiyUVyoCuf4JtoIGDq9F2zpQ6XXV2BWkuVPOdB+
 bEZA==
X-Gm-Message-State: ACrzQf1hShVsnC8lHaq5ZU8NUXQkC3JD5HgKKz5yFZ9Kru+dc9LmNIVB
 pG/mnmA4+hOUlj1dO60qwFYTfA==
X-Google-Smtp-Source: AMsMyM6xmnkmZw817L5BfqkNiEx00f0zZpclonHHsEt2ITkfBQWKvTo3RdAOT+9uXzX/0oL0Lx7IiQ==
X-Received: by 2002:a05:620a:258f:b0:6cf:663b:9751 with SMTP id
 x15-20020a05620a258f00b006cf663b9751mr21146978qko.367.1665614617499; 
 Wed, 12 Oct 2022 15:43:37 -0700 (PDT)
Received: from smtpclient.apple
 (172-125-78-211.lightspeed.sntcca.sbcglobal.net. [172.125.78.211])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a37b805000000b006cfc9846594sm16054556qkf.93.2022.10.12.15.43.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Oct 2022 15:43:37 -0700 (PDT)
From: "Viacheslav A.Dubeyko" <viacheslav.dubeyko@bytedance.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_97B6170B-1925-424B-A3F1-6D1BB9B3A769"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: CXL emulation in QEMU contribution
Date: Wed, 12 Oct 2022 15:43:35 -0700
References: <20221011095228.00001546@huawei.com>
Cc: Adam Manzanares <a.manzanares@samsung.com>,
 Cong Wang <cong.wang@bytedance.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
To: Jonathan.Cameron@huawei.com
Message-Id: <31569DD4-6502-4188-8962-08E0A15B08FF@bytedance.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=viacheslav.dubeyko@bytedance.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Oct 2022 18:57:38 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_97B6170B-1925-424B-A3F1-6D1BB9B3A769
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Jonathan,

As we agreed, I am moving our discussion into public mailing list.

So, I would like to contribute to QEMU emulation of CXL memory support. =
And I would like to see a TODO list. I hope this list could be useful =
not only for me. As far as I can see, we can summarize:

1) Moving towards emulation of everything we need for Dynamic Capacity.
  a) Switch CCI - have a PoC but not yet doing tunneling to Type 3 EPs.
  b) Userspace tool to fake enough FM role that we can drive dynamics=20
  c) Also need to do CXL 2.0 style HP of LDs on MLD devices (some demand
  for this to driver virtualization migration usecases)
  d) DCD implementation etc on the type 3 device.
2) Lots of smaller features from CXL 3.0 such as setting up BI.
3) Enough to test P2P UIO flows - probably need to invent an accelerator
  with appropriate support to test that - DMA engine or similar.
4) Bunch of small features:
  a) Multiple HDM decoders.
  b) Poisoning.  Right now we have prototype, but it's not wired up to =
actually report poison on reads.
  c) CXL non-function map DVSEC. Given QEMU lets you add any function to =
a given device by just setting  the bus to be the same as another, this =
is a bit fiddly because we need to updated it late in the QEMU bring up, =
or possibly easier to do it at read time (that may well be easier).
  d) Most useful of all, but most boring perhaps is review of what's =
already waiting for upstreaming.

Please, correct me if I miss something. I believe we need to have a TODO =
list to collaborate efficiently. Any ideas what else can be added into =
TODO list?

Thanks,
Slava.=20

> Begin forwarded message:
>=20
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Subject: Re: [External] CXL emulation in QEMU
> Date: October 11, 2022 at 1:52:28 AM PDT
> To: Viacheslav A.Dubeyko <viacheslav.dubeyko@bytedance.com>
> Cc: Adam Manzanares <a.manzanares@samsung.com>, Cong Wang =
<cong.wang@bytedance.com>
>=20
> On Tue, 11 Oct 2022 09:45:50 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>=20
>> On Mon, 10 Oct 2022 10:11:43 -0700
>> "Viacheslav A.Dubeyko" <viacheslav.dubeyko@bytedance.com> wrote:
>>=20
>>> Hi Jonathan,
>>>=20
>>> It looks like that my email was confusing or, maybe, you simply =
missed my email. =20
>> Hi Slava,
>>=20
>>=20
>> Apologies, I thought from the comment you made about being fine to =
take it a
>> public list that you'd send a starting email to linux-cxl or the =
qemu-devel
>> and we'd take the discussion on there.  No problem with carrying on =
here
>> as nothing technical so we are fine...
>>=20
>>=20
>>>=20
>>> My point is that I am ready to start from any feature at first. Then
>>> I will elaborate the vision what is more interesting for me. What a
>>> feature could I start to explore/implement?
>>>=20
>>=20
>> One thing I'm keen to get done, but haven't gotten to yet is doing a =
full
>> audit of spec vs what we have implemented and drawing up a todo list.
>> I can have a go at this perhaps later today.  Let's use the wiki
>> on my gitlab instance to build the list before sending it out for
>> wider review.=20
>>=20
>> https://gitlab.com/jic23/qemu/-/wikis/TODO-list
>> Send me an ID and I'll add you as a developer on the repo (which is
>> all you need to edit I think?)
>>=20
>> I think there are a bunch of small features that we should wire up
>> that we haven't gotten to yet.
>>=20
>> Examples of this include:=20
>> * Multiple HDM decoders.
>>=20
>> * Poisoning.  Right now we have prototype, but it's not wired up to
>> actually report poison on reads.
>>=20
>> * CXL non-function map DVSEC
>>  Given QEMU lets you add any function to a given device by just =
setting
>>  the bus to be the same as another, this is a bit fiddly because we =
need
>>  to updated it late in the QEMU bring up, or possibly easier to do it
>>  at read time (that may well be easier).
>>=20
>> * Compliance DOE + maybe DVSEC for test capability if anyone cares =
about that.
>>=20
>> Most useful of all, but most boring perhaps is review of what's =
already waiting
>> for upstreaming.  I cross post everything to =
linux-cxl@vger.kernel.org as
>> well as qemu-devel.  + there is a bunch of stuff on my gitlab tree =
above.
>> cxl-2022-10-08 branch though that has some cleanup needed.
>>=20
>> I'm focusing short term on upstreaming what we already have + some
>> enablement to get a discussion going about how to handle open source =
fabric
>> manager. Primarily switch CCI as introduced in CXL 3.0/
>>=20
>>=20
>>> Thanks,
>>> Slava.
>>>=20
>>>> On Oct 3, 2022, at 11:12 AM, Viacheslav A.Dubeyko =
<viacheslav.dubeyko@bytedance.com> wrote:
>>>>=20
>>>> Hi Jonathan,
>>>>=20
>>=20
>>>> I don=E2=80=99t see any troubles to move the discussion into public =
mailing
>>>> list. I simply didn=E2=80=99t consider all these complications  =
that you
>>>> shared.  =20
>>=20
>>>>> If we want to do it on the phone, then I'm
>>>>> sure we can borrow a bit of the regular CXL Linux sync call that =
Dan Williams
>>>>> at Intel organizes, or I we can organize something similar for =
QEMU side of
>>>>> things.   =20
>>>>=20
>>>> It could be the good idea.
>>>>=20
>>>>> Definitely interested to hear what sorts of features you are =
interested
>>>>> in + working together on getting more of CXL emulation in place.   =
=20
>>>>=20
>>=20
>>>> I spent some time to think about what could be interesting to
>>>> implement. I realized that I have not complete picture of what
>>>> features have been implemented already and what is under progress.
>>>> So, it=E2=80=99s hard to share what could be interesting for
>>>> implementation. Potentially, I could consider some features that
>>>> could be used to emulate graph database use-case or file system
>>>> related functionality. I assume I could start from any feature at
>>>> first and, as a result, I can elaborate my vision what is really
>>>> interesting for me.
>>>>=20
>>=20
>> For graph DB, is your main interest memory only or are we talking =
accelerators?
>>=20
>> Accelerators are tricky as they tend to be highly custom and hence =
each one needs
>> it's own emulation + stuff like p2p emulation will make it more =
complex.
>>=20
>> If type 3 / memory only devices then most of what you need should =
already work
>> subject to a couple of bugs on the kernel side of things that we know =
about and
>> the delights of error handling which is not yet in place.  There is =
work going
>> on for the event logs etc from one of the Intel team, but I don't =
think anything
>> has been posted yet.
>=20
> I should have read the rest of my email. Ira Weiny posted the event =
log stuff
> last night.
>=20
> https://lore.kernel.org/linux-cxl/Y0Sgiq+WMwOmqToe@iweiny-desk3/T/#t
>=20
>>=20
>> Also I've had a report that x86 support isn't currently working that
>> looks related to memory region reservations. Need to look into that =
as I mainly
>> test on arm64.
>>=20
>> Jonathan
>>=20
>>=20
>>>> Thanks,
>>>> Slava.
>>>>=20
>>>>> On Sep 30, 2022, at 5:31 AM, Jonathan Cameron =
<Jonathan.Cameron@huawei.com> wrote:
>>>>>=20
>>>>> Hi Slava,
>>>>>=20
>>>>> Thanks for the intro Adam.
>>>>>=20
>>>>> The one element that makes private technical discussion tricky is =
that
>>>>> my company is on the US entity list. I've not idea what =
Bytedance's policy
>>>>> on this is - and those policies tend not to be company wide so =
you'd
>>>>> probably need to pester relevant lawyers for your part of =
Bytedance.
>>>>>=20
>>>>> Now if we keep it purely non technical (and roadmaps etc aren't =
technical)
>>>>> then it's all fine, or if we rely on one of the exemptions.
>>>>> 1) Work actually under the standards body is exempt - this doesn't =
include
>>>>> implementations though so only works if we are discussing spec =
problems.
>>>>> 2) Work 'to be published' is exempt.  This path is a bit tricky to =
use and
>>>>> makes lawyers nervous as how to prove it if the company is =
audited.
>>>>> 3) Published work - this covers anything on public mailing lists =
or on
>>>>> calls that are open to anyone / conference sessions etc.
>>>>>=20
>>>>> Note, I can send anyone anything, others may just need to be =
careful replying if it
>>>>> gets near anything that might be called technology!
>>>>>=20
>>>>> So for discussions involving me it's easiest to either keep them =
non technical
>>>>> or put them on the public mailing list.
>>>>>=20
>>>>> So far I've not put out a public 'todo' list simply because the =
group
>>>>> working on QEMU CXL emulation was small enough we just emailed =
along the lines
>>>>> of 'shall I do this bit'.  Going forwards, seems we are growing =
enough we
>>>>> should have better tracking.   If we want to do it on the phone, =
then I'm
>>>>> sure we can borrow a bit of the regular CXL Linux sync call that =
Dan Williams
>>>>> at Intel organizes, or I we can organize something similar for =
QEMU side of
>>>>> things.
>>>>>=20
>>>>> Closest thing to a status report was the plumbers talk a few weeks =
ago.
>>>>> https://lpc.events/event/16/contributions/1248/
>>>>>=20
>>>>> My focus is on Type 3 + all the fabric side of things (switches / =
RPs etc)
>>>>> and I care about ARM support (given I work for HiSilicon bit of =
Huawei, not
>>>>> supporting the architecture we build would be a bad thing)
>>>>> Majority of anything else will be heavily custom anyway, so =
emulation would
>>>>> need to be driven by who ever makes the type1/2 devices.
>>>>>=20
>>>>> Short term, I want to clear some of the backlog of upstreaming.
>>>>> We got a lot into QEMU 7.1 but that had taken a few cycles, so =
various
>>>>> other prototype code exists.
>>>>>=20
>>>>> 1) DOE + CDAT - should get that up for review next week. This is a =
rework
>>>>> of what the Avery design folk posted last year.
>>>>> 2) ARM support (bit longer as need to write DT support and deal =
with kernel
>>>>> driver for that *sigh*)
>>>>> 3) CXL PMU emulation (bit of work to do on kernel driver for that)
>>>>>=20
>>>>> I also need to push a tree out with all the pending work on it.
>>>>> There are overlaps between different patch sets that need to =
resolving.
>>>>>=20
>>>>> Otherwise:
>>>>>=20
>>>>> 1) Ira Weiny at Intel is working on Event support (see =
linux-cxl@vger.kernel.org postings)
>>>>> 2) I believe we'll have some volatile support from Samsung =
shortly.
>>>>>=20
>>>>>=20
>>>>> Longer term list from me.
>>>>> 1) Moving towards emulation of everything we need for Dynamic =
Capacity.
>>>>> a) Switch CCI - have a PoC but not yet doing tunneling to Type 3 =
EPs.
>>>>> b) Userspace tool to fake enough FM role that we can drive =
dynamics=20
>>>>> c) Also need to do CXL 2.0 style HP of LDs on MLD devices (some =
demand
>>>>> for this to driver virtualization migration usecases)
>>>>> d) DCD implementation etc on the type 3 device.
>>>>> 2) Lots of smaller features from CXL 3.0 such as setting up BI.
>>>>> 3) Enough to test P2P UIO flows - probably need to invent an =
accelerator
>>>>> with appropriate support to test that - DMA engine or similar.
>>>>>=20
>>>>> Obviously DCD stuff needs a load of kernel work as well.
>>>>>=20
>>>>> I've probably forgotten a bunch of things....
>>>>>=20
>>>>> Definitely interested to hear what sorts of features you are =
interested
>>>>> in + working together on getting more of CXL emulation in place.
>>>>> A bigger active group on this will aid with review as well and =
hopefully
>>>>> lead to faster pick up by Michael Tsirkin who has been applying =
the patches
>>>>> so far.
>>>>>=20
>>>>> My end goal is to catch up with the Spec as I also used the QEMU =
emulation
>>>>> to prove out CXL 3.0 features when they were at draft stage =
(particularly
>>>>> the PMU) and it was very useful for closing various corners that =
would have
>>>>> been a lot harder to fix later.  That stuff is tricky because we =
can't
>>>>> share code until the spec is releases but we can ensure those =
involved in
>>>>> the standards side know what others have code for.
>>>>>=20
>>>>> Looking forward to hearing from you!
>>>>>=20
>>>>> Thanks
>>>>>=20
>>>>> Jonathan
>>>>>=20
>>>>>=20
>>>>> On Thu, 29 Sep 2022 14:25:17 -0700
>>>>> "Viacheslav A.Dubeyko" <viacheslav.dubeyko@bytedance.com> wrote:
>>>>>=20
>>>>>> Hi Adam,
>>>>>>=20
>>>>>> Yes, we are talking about open-source activity. I am simply =
trying to understand what direction(s), TODOs, task(s) we have right =
now. If we can summarize it somehow, then, potentially, this discussion =
could be useful for mailing list too. Otherwise, I am not sure that =
current discussion is useful for mailing list.
>>>>>>=20
>>>>>> Thanks,
>>>>>> Slava.
>>>>>>=20
>>>>>>> On Sep 29, 2022, at 2:08 PM, Adam Manzanares =
<a.manzanares@samsung.com> wrote:
>>>>>>>=20
>>>>>>> Hello Slava,
>>>>>>>=20
>>>>>>> Added Jonathan to cc so you can connect. One ask, if this CXL =
QEMU work is planned to=20
>>>>>>> be open source let's move discussion to the mailing list and cc =
me if you don't mind.=20
>>>>>>>=20
>>>>>>> Take care,
>>>>>>> Adam
>>>>>>>=20
>>>>>>> -----Original Message-----
>>>>>>> From: Viacheslav A.Dubeyko =
[mailto:viacheslav.dubeyko@bytedance.com]=20
>>>>>>> Sent: Thursday, September 29, 2022 12:06 PM
>>>>>>> To: Adam Manzanares <a.manzanares@samsung.com>
>>>>>>> Cc: Cong Wang <cong.wang@bytedance.com>
>>>>>>> Subject: CXL emulation in QEMU
>>>>>>>=20
>>>>>>> Hi Adam,
>>>>>>>=20
>>>>>>> We are interested to participate in CXL emulation in QEMU. What =
is the good way to contact with Jonathan Cameron? Is it the main guy to =
contact? I believe you should know email or any other way to =
communicate. Could you help us?
>>>>>>>=20
>>>>>>> Thanks,
>>>>>>> Slava.


--Apple-Mail=_97B6170B-1925-424B-A3F1-6D1BB9B3A769
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D"">Hi&nbsp;Jonathan,<div =
class=3D""><br class=3D""></div><div class=3D"">As we agreed, I am =
moving our discussion into public mailing list.</div><div class=3D""><br =
class=3D""></div><div class=3D"">So, I would like to contribute to QEMU =
emulation of CXL memory support. And I would like to see a TODO list. I =
hope this list could be useful not only for me. As far as I can see, we =
can summarize:</div><div class=3D""><br class=3D""></div><div =
class=3D"">1) Moving towards emulation of everything we need for Dynamic =
Capacity.<br class=3D"">&nbsp;&nbsp;a) Switch CCI - have a PoC but not =
yet doing tunneling to Type 3 EPs.<br class=3D"">&nbsp;&nbsp;b) =
Userspace tool to fake enough FM role that we can drive =
dynamics&nbsp;<br class=3D"">&nbsp;&nbsp;c) Also need to do CXL 2.0 =
style HP of LDs on MLD devices (some demand<br class=3D"">&nbsp;&nbsp;for =
this to driver virtualization migration usecases)<br =
class=3D"">&nbsp;&nbsp;d) DCD implementation etc on the type 3 =
device.<br class=3D"">2) Lots of smaller features from CXL 3.0 such as =
setting up BI.<br class=3D"">3) Enough to test P2P UIO flows - probably =
need to invent an accelerator<br class=3D"">&nbsp;&nbsp;with appropriate =
support to test that - DMA engine or similar.</div><div class=3D"">4) =
Bunch of small features:</div><div class=3D"">&nbsp; a) Multiple HDM =
decoders.</div><div class=3D"">&nbsp; b) Poisoning. &nbsp;Right now we =
have prototype, but it's not wired up to actually report poison on =
reads.</div><div class=3D"">&nbsp; c) CXL non-function map DVSEC. Given =
QEMU lets you add any function to a given device by just setting =
&nbsp;the bus to be the same as another, this is a bit fiddly because we =
need to updated it late in the QEMU bring up, or possibly easier to do =
it at read time (that may well be easier).</div><div class=3D"">&nbsp; =
d) Most useful of all, but most boring perhaps is review of what's =
already waiting for upstreaming.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Please, correct me if I miss something. =
I believe we need to have a TODO list to collaborate efficiently. Any =
ideas what else can be added into TODO list?</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks,</div><div =
class=3D"">Slava.&nbsp;</div><div class=3D""><br =
class=3D""></div><blockquote type=3D"cite" class=3D"">Begin forwarded =
message:<br class=3D""><br class=3D"">From:&nbsp;Jonathan Cameron &lt;<a =
href=3D"mailto:Jonathan.Cameron@huawei.com" =
class=3D"">Jonathan.Cameron@huawei.com</a>&gt;<br =
class=3D"">Subject:&nbsp;Re: [External] CXL emulation in QEMU<br =
class=3D"">Date:&nbsp;October 11, 2022 at 1:52:28 AM PDT<br =
class=3D"">To:&nbsp;Viacheslav A.Dubeyko &lt;<a =
href=3D"mailto:viacheslav.dubeyko@bytedance.com" =
class=3D"">viacheslav.dubeyko@bytedance.com</a>&gt;<br =
class=3D"">Cc:&nbsp;Adam Manzanares &lt;<a =
href=3D"mailto:a.manzanares@samsung.com" =
class=3D"">a.manzanares@samsung.com</a>&gt;, Cong Wang &lt;<a =
href=3D"mailto:cong.wang@bytedance.com" =
class=3D"">cong.wang@bytedance.com</a>&gt;<br class=3D""><br class=3D"">On=
 Tue, 11 Oct 2022 09:45:50 +0100<br class=3D"">Jonathan Cameron &lt;<a =
href=3D"mailto:Jonathan.Cameron@huawei.com" =
class=3D"">Jonathan.Cameron@huawei.com</a>&gt; wrote:<br class=3D""><br =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 15px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">On =
Mon, 10 Oct 2022 10:11:43 -0700<br class=3D"">"Viacheslav A.Dubeyko" =
&lt;viacheslav.dubeyko@bytedance.com&gt; wrote:<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">Hi Jonathan,<br =
class=3D""><br class=3D"">It looks like that my email was confusing or, =
maybe, you simply missed my email. &nbsp;<br class=3D""></blockquote>Hi =
Slava,<br class=3D""><br class=3D""><br class=3D"">Apologies, I thought =
from the comment you made about being fine to take it a<br =
class=3D"">public list that you'd send a starting email to linux-cxl or =
the qemu-devel<br class=3D"">and we'd take the discussion on there. =
&nbsp;No problem with carrying on here<br class=3D"">as nothing =
technical so we are fine...<br class=3D""><br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D"">My point =
is that I am ready to start from any feature at first. Then<br =
class=3D"">I will elaborate the vision what is more interesting for me. =
What a<br class=3D"">feature could I start to explore/implement?<br =
class=3D""><br class=3D""></blockquote><br class=3D"">One thing I'm keen =
to get done, but haven't gotten to yet is doing a full<br class=3D"">audit=
 of spec vs what we have implemented and drawing up a todo list.<br =
class=3D"">I can have a go at this perhaps later today. &nbsp;Let's use =
the wiki<br class=3D"">on my gitlab instance to build the list before =
sending it out for<br class=3D"">wider review.&nbsp;<br class=3D""><br =
class=3D"">https://gitlab.com/jic23/qemu/-/wikis/TODO-list<br =
class=3D"">Send me an ID and I'll add you as a developer on the repo =
(which is<br class=3D"">all you need to edit I think?)<br class=3D""><br =
class=3D"">I think there are a bunch of small features that we should =
wire up<br class=3D"">that we haven't gotten to yet.<br class=3D""><br =
class=3D"">Examples of this include:&nbsp;<br class=3D"">* Multiple HDM =
decoders.<br class=3D""><br class=3D"">* Poisoning. &nbsp;Right now we =
have prototype, but it's not wired up to<br class=3D"">actually report =
poison on reads.<br class=3D""><br class=3D"">* CXL non-function map =
DVSEC<br class=3D"">&nbsp;Given QEMU lets you add any function to a =
given device by just setting<br class=3D"">&nbsp;the bus to be the same =
as another, this is a bit fiddly because we need<br class=3D"">&nbsp;to =
updated it late in the QEMU bring up, or possibly easier to do it<br =
class=3D"">&nbsp;at read time (that may well be easier).<br class=3D""><br=
 class=3D"">* Compliance DOE + maybe DVSEC for test capability if anyone =
cares about that.<br class=3D""><br class=3D"">Most useful of all, but =
most boring perhaps is review of what's already waiting<br class=3D"">for =
upstreaming. &nbsp;I cross post everything to linux-cxl@vger.kernel.org =
as<br class=3D"">well as qemu-devel. &nbsp;+ there is a bunch of stuff =
on my gitlab tree above.<br class=3D"">cxl-2022-10-08 branch though that =
has some cleanup needed.<br class=3D""><br class=3D"">I'm focusing short =
term on upstreaming what we already have + some<br class=3D"">enablement =
to get a discussion going about how to handle open source fabric<br =
class=3D"">manager. Primarily switch CCI as introduced in CXL 3.0/<br =
class=3D""><br class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D"">Thanks,<br class=3D"">Slava.<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">On Oct 3, 2022, at 11:12 =
AM, Viacheslav A.Dubeyko &lt;viacheslav.dubeyko@bytedance.com&gt; =
wrote:<br class=3D""><br class=3D"">Hi Jonathan,<br class=3D""><br =
class=3D""></blockquote></blockquote><br class=3D""><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D"">I don=E2=80=99=
t see any troubles to move the discussion into public mailing<br =
class=3D"">list. I simply didn=E2=80=99t consider all these =
complications &nbsp;that you<br class=3D"">shared. &nbsp;&nbsp;<br =
class=3D""></blockquote></blockquote><br class=3D""><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote =
type=3D"cite" class=3D"">If we want to do it on the phone, then I'm<br =
class=3D"">sure we can borrow a bit of the regular CXL Linux sync call =
that Dan Williams<br class=3D"">at Intel organizes, or I we can organize =
something similar for QEMU side of<br class=3D"">things. &nbsp; =
&nbsp;<br class=3D""></blockquote><br class=3D"">It could be the good =
idea.<br class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D"">Definitely interested to hear what sorts of features you are =
interested<br class=3D"">in + working together on getting more of CXL =
emulation in place. &nbsp; &nbsp;<br class=3D""></blockquote><br =
class=3D""></blockquote></blockquote><br class=3D""><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D"">I spent =
some time to think about what could be interesting to<br =
class=3D"">implement. I realized that I have not complete picture of =
what<br class=3D"">features have been implemented already and what is =
under progress.<br class=3D"">So, it=E2=80=99s hard to share what could =
be interesting for<br class=3D"">implementation. Potentially, I could =
consider some features that<br class=3D"">could be used to emulate graph =
database use-case or file system<br class=3D"">related functionality. I =
assume I could start from any feature at<br class=3D"">first and, as a =
result, I can elaborate my vision what is really<br class=3D"">interesting=
 for me.<br class=3D""><br class=3D""></blockquote></blockquote><br =
class=3D"">For graph DB, is your main interest memory only or are we =
talking accelerators?<br class=3D""><br class=3D"">Accelerators are =
tricky as they tend to be highly custom and hence each one needs<br =
class=3D"">it's own emulation + stuff like p2p emulation will make it =
more complex.<br class=3D""><br class=3D"">If type 3 / memory only =
devices then most of what you need should already work<br =
class=3D"">subject to a couple of bugs on the kernel side of things that =
we know about and<br class=3D"">the delights of error handling which is =
not yet in place. &nbsp;There is work going<br class=3D"">on for the =
event logs etc from one of the Intel team, but I don't think anything<br =
class=3D"">has been posted yet.<br class=3D""></blockquote><br =
class=3D"">I should have read the rest of my email. Ira Weiny posted the =
event log stuff<br class=3D"">last night.<br class=3D""><br =
class=3D"">https://lore.kernel.org/linux-cxl/Y0Sgiq+WMwOmqToe@iweiny-desk3=
/T/#t<br class=3D""><br class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">Also I've had a report =
that x86 support isn't currently working that<br class=3D"">looks =
related to memory region reservations. Need to look into that as I =
mainly<br class=3D"">test on arm64.<br class=3D""><br =
class=3D"">Jonathan<br class=3D""><br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D"">Thanks,<br class=3D"">Slava.<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">On Sep 30, 2022, at 5:31 =
AM, Jonathan Cameron &lt;Jonathan.Cameron@huawei.com&gt; wrote:<br =
class=3D""><br class=3D"">Hi Slava,<br class=3D""><br class=3D"">Thanks =
for the intro Adam.<br class=3D""><br class=3D"">The one element that =
makes private technical discussion tricky is that<br class=3D"">my =
company is on the US entity list. I've not idea what Bytedance's =
policy<br class=3D"">on this is - and those policies tend not to be =
company wide so you'd<br class=3D"">probably need to pester relevant =
lawyers for your part of Bytedance.<br class=3D""><br class=3D"">Now if =
we keep it purely non technical (and roadmaps etc aren't technical)<br =
class=3D"">then it's all fine, or if we rely on one of the =
exemptions.<br class=3D"">1) Work actually under the standards body is =
exempt - this doesn't include<br class=3D"">implementations though so =
only works if we are discussing spec problems.<br class=3D"">2) Work 'to =
be published' is exempt. &nbsp;This path is a bit tricky to use and<br =
class=3D"">makes lawyers nervous as how to prove it if the company is =
audited.<br class=3D"">3) Published work - this covers anything on =
public mailing lists or on<br class=3D"">calls that are open to anyone / =
conference sessions etc.<br class=3D""><br class=3D"">Note, I can send =
anyone anything, others may just need to be careful replying if it<br =
class=3D"">gets near anything that might be called technology!<br =
class=3D""><br class=3D"">So for discussions involving me it's easiest =
to either keep them non technical<br class=3D"">or put them on the =
public mailing list.<br class=3D""><br class=3D"">So far I've not put =
out a public 'todo' list simply because the group<br class=3D"">working =
on QEMU CXL emulation was small enough we just emailed along the =
lines<br class=3D"">of 'shall I do this bit'. &nbsp;Going forwards, =
seems we are growing enough we<br class=3D"">should have better =
tracking. &nbsp; If we want to do it on the phone, then I'm<br =
class=3D"">sure we can borrow a bit of the regular CXL Linux sync call =
that Dan Williams<br class=3D"">at Intel organizes, or I we can organize =
something similar for QEMU side of<br class=3D"">things.<br class=3D""><br=
 class=3D"">Closest thing to a status report was the plumbers talk a few =
weeks ago.<br =
class=3D"">https://lpc.events/event/16/contributions/1248/<br =
class=3D""><br class=3D"">My focus is on Type 3 + all the fabric side of =
things (switches / RPs etc)<br class=3D"">and I care about ARM support =
(given I work for HiSilicon bit of Huawei, not<br class=3D"">supporting =
the architecture we build would be a bad thing)<br class=3D"">Majority =
of anything else will be heavily custom anyway, so emulation would<br =
class=3D"">need to be driven by who ever makes the type1/2 devices.<br =
class=3D""><br class=3D"">Short term, I want to clear some of the =
backlog of upstreaming.<br class=3D"">We got a lot into QEMU 7.1 but =
that had taken a few cycles, so various<br class=3D"">other prototype =
code exists.<br class=3D""><br class=3D"">1) DOE + CDAT - should get =
that up for review next week. This is a rework<br class=3D"">of what the =
Avery design folk posted last year.<br class=3D"">2) ARM support (bit =
longer as need to write DT support and deal with kernel<br =
class=3D"">driver for that *sigh*)<br class=3D"">3) CXL PMU emulation =
(bit of work to do on kernel driver for that)<br class=3D""><br =
class=3D"">I also need to push a tree out with all the pending work on =
it.<br class=3D"">There are overlaps between different patch sets that =
need to resolving.<br class=3D""><br class=3D"">Otherwise:<br =
class=3D""><br class=3D"">1) Ira Weiny at Intel is working on Event =
support (see linux-cxl@vger.kernel.org postings)<br class=3D"">2) I =
believe we'll have some volatile support from Samsung shortly.<br =
class=3D""><br class=3D""><br class=3D"">Longer term list from me.<br =
class=3D"">1) Moving towards emulation of everything we need for Dynamic =
Capacity.<br class=3D"">a) Switch CCI - have a PoC but not yet doing =
tunneling to Type 3 EPs.<br class=3D"">b) Userspace tool to fake enough =
FM role that we can drive dynamics&nbsp;<br class=3D"">c) Also need to =
do CXL 2.0 style HP of LDs on MLD devices (some demand<br class=3D"">for =
this to driver virtualization migration usecases)<br class=3D"">d) DCD =
implementation etc on the type 3 device.<br class=3D"">2) Lots of =
smaller features from CXL 3.0 such as setting up BI.<br class=3D"">3) =
Enough to test P2P UIO flows - probably need to invent an accelerator<br =
class=3D"">with appropriate support to test that - DMA engine or =
similar.<br class=3D""><br class=3D"">Obviously DCD stuff needs a load =
of kernel work as well.<br class=3D""><br class=3D"">I've probably =
forgotten a bunch of things....<br class=3D""><br class=3D"">Definitely =
interested to hear what sorts of features you are interested<br =
class=3D"">in + working together on getting more of CXL emulation in =
place.<br class=3D"">A bigger active group on this will aid with review =
as well and hopefully<br class=3D"">lead to faster pick up by Michael =
Tsirkin who has been applying the patches<br class=3D"">so far.<br =
class=3D""><br class=3D"">My end goal is to catch up with the Spec as I =
also used the QEMU emulation<br class=3D"">to prove out CXL 3.0 features =
when they were at draft stage (particularly<br class=3D"">the PMU) and =
it was very useful for closing various corners that would have<br =
class=3D"">been a lot harder to fix later. &nbsp;That stuff is tricky =
because we can't<br class=3D"">share code until the spec is releases but =
we can ensure those involved in<br class=3D"">the standards side know =
what others have code for.<br class=3D""><br class=3D"">Looking forward =
to hearing from you!<br class=3D""><br class=3D"">Thanks<br class=3D""><br=
 class=3D"">Jonathan<br class=3D""><br class=3D""><br class=3D"">On Thu, =
29 Sep 2022 14:25:17 -0700<br class=3D"">"Viacheslav A.Dubeyko" =
&lt;viacheslav.dubeyko@bytedance.com&gt; wrote:<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">Hi Adam,<br class=3D""><br=
 class=3D"">Yes, we are talking about open-source activity. I am simply =
trying to understand what direction(s), TODOs, task(s) we have right =
now. If we can summarize it somehow,&nbsp;then, potentially, this =
discussion could be useful for mailing list too. Otherwise, I am not =
sure that current discussion is useful for mailing list.<br class=3D""><br=
 class=3D"">Thanks,<br class=3D"">Slava.<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">On Sep 29, 2022, at 2:08 =
PM, Adam Manzanares &lt;a.manzanares@samsung.com&gt; wrote:<br =
class=3D""><br class=3D"">Hello Slava,<br class=3D""><br class=3D"">Added =
Jonathan to cc so you can connect. One ask, if this CXL QEMU work is =
planned to&nbsp;<br class=3D"">be open source let's move discussion to =
the mailing list and cc me if you don't mind.&nbsp;<br class=3D""><br =
class=3D"">Take care,<br class=3D"">Adam<br class=3D""><br =
class=3D"">-----Original Message-----<br class=3D"">From: Viacheslav =
A.Dubeyko [mailto:viacheslav.dubeyko@bytedance.com]&nbsp;<br =
class=3D"">Sent: Thursday, September 29, 2022 12:06 PM<br class=3D"">To: =
Adam Manzanares &lt;a.manzanares@samsung.com&gt;<br class=3D"">Cc: Cong =
Wang &lt;cong.wang@bytedance.com&gt;<br class=3D"">Subject: CXL =
emulation in QEMU<br class=3D""><br class=3D"">Hi Adam,<br class=3D""><br =
class=3D"">We are interested to participate in CXL emulation in QEMU. =
What is the good way to contact with Jonathan Cameron? Is it the main =
guy to contact? I believe you&nbsp;should know email or any other way to =
communicate. Could you help us?<br class=3D""><br class=3D"">Thanks,<br =
class=3D"">Slava.<br =
class=3D""></blockquote></blockquote></blockquote></blockquote></blockquot=
e></blockquote></blockquote><br class=3D""></body></html>=

--Apple-Mail=_97B6170B-1925-424B-A3F1-6D1BB9B3A769--

