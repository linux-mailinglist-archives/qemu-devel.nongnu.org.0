Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2412F4199CC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:58:34 +0200 (CEST)
Received: from localhost ([::1]:40400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtxZ-00045K-2X
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUtuy-0001u5-Fx
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:55:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUtuv-0005MN-5S
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632761747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=A3GSUpDGt4esMAj+1/O0qf/pF9hSd6H8TJWmnuip1vs=;
 b=PNgISd7FJGhr/hfAo2UIwi3H7wMp627/6EkOH1v1qhJgATOEd0JuJx0C3IchEy374we04D
 lIEeNUQ2I/PuUDo1E0pODfFLGaN8VqG7mM7zIM6/pkdaZQzZ/4+/lVZbWjg1T04metU48v
 Ipd5pi3YwcVCnbLkntPo0BERerDnx5E=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-m0eO8mPXMx-IWEpFwUIyyQ-1; Mon, 27 Sep 2021 12:55:45 -0400
X-MC-Unique: m0eO8mPXMx-IWEpFwUIyyQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 d145-20020a1fb497000000b002a13f63cf2bso525606vkf.5
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 09:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=A3GSUpDGt4esMAj+1/O0qf/pF9hSd6H8TJWmnuip1vs=;
 b=diOmIf0/L9iLQwwDOtbLVeKzYFjcJKIP34TFjRGYCS/+LhlnDLJgJmIDXCpYtvn1fM
 yXs1WS+SDAFrm4J57p+6vIYosSnju9d1h/6+s+RBvpdY8xH6S/HIaR5S/sdzSJp0k9QO
 AS5CPhlKWvL+r1BL+sq5hEZyZ4mUXefEQJH/24ibMuytk1WIer/oqXgVfWs747e0xO1m
 lO9l2o9XiCz78WcU3hjnV0NMIJOqPSHifxmRt+aXdcpXVICU9otDGkLKGxahBq2WtPqi
 gQt4cWlaBG+6D4VTXO1uUSIYHVmeMvTDh1Q96sGBqYvKuoeKG6fwR3Lpspf+V04IIJyY
 77+w==
X-Gm-Message-State: AOAM5310ao4YsOBM0OKXUVpmkipUlSMpOk028SGxKPH9BvpNAWj9lt5n
 AZ3GYrgFsp+FqW99jyRYLWmwdS7+i70u7sWZxP6ib2QreubjApxBliMrF3djNVIbbO/7LEEYP/I
 y2bssWTHg3MZp3xkGuje6rW4/pbXmxyU=
X-Received: by 2002:a1f:27cd:: with SMTP id n196mr1062612vkn.23.1632761745391; 
 Mon, 27 Sep 2021 09:55:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdvcrHGM6yelWO/X7+8Pl9PRtouRwV9D4HMMiokQVYfTUYXOigCsEjFFZ9NYOMOZ43Xb90F2d2P8ribJLiNhA=
X-Received: by 2002:a1f:27cd:: with SMTP id n196mr1062583vkn.23.1632761745164; 
 Mon, 27 Sep 2021 09:55:45 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Mon, 27 Sep 2021 12:55:34 -0400
Message-ID: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
Subject: QAPI sync meeting
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d2e72d05ccfcf7a1"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d2e72d05ccfcf7a1
Content-Type: text/plain; charset="UTF-8"

Hiya,

I'd like to propose that at least the three of us arrange a time to have a
meeting where we discuss our plans and ideas for QAPI going forward,
including rust, python, and golang extensions to the QAPI generator, what
we hope to accomplish with those projects, and so on.

What I am hoping to get out of this for myself is a high-level overview of
people's plans for QAPI and to produce some notes on those plans so that I
can have a reference that we've all acknowledged as roughly accurate to be
able to keep the community's design goals for QAPI in mind as I continue my
own development. Ultimately, I'd like some kind of rough draft of a "QAPI
roadmap".

I know there was a rust meetup during KVM Forum, but I was unable to attend
due to the timing. I'd like to expand the focus a little more broadly to
QAPI in general and discuss our "personal" roadmaps, goals, queued work,
etc so that we can collaboratively formulate a broader vision of our work.

I'm posting to qemu-devel in case anyone else has an interest in this area
and would like to eavesdrop or share opinions, but we should probably come
up with an agenda first. So:

Proposed agenda:

Current projects, wishlists, and goals for QAPI:
- Markus (~10 min)
- Marc-Andre (~10 min) (Rust, dbus, etc?)
- jsnow (~10 min) (Python, golang, etc)

Formulating short-term and long-term roadmaps:
- Open discussion, ~30 min
- Collaboratively produce a summary doc (etherpad?) outlining major work to
be done, separated into near and long terms
- Upload this summary to the QEMU wiki and mail it back out to qemu-devel
- We probably won't exactly finish this bit, but we can resume on the
mailing list afterwards perfectly well.

(Feel free to propose anything different for the meeting, this is just a
jumping off point for discussion.)

Proposed time:

- Any weekday after 13:00 UTC. Wednesdays, Thursdays and Fridays work
particularly well for me at the moment.
- bluejeans and google meeting both work well for me. Open to alternatives.


Thanks,
--js

--000000000000d2e72d05ccfcf7a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hiya,</div><div><br></div><div>I&#39;d like to propos=
e that at least the three of us arrange a time to have a meeting where we d=
iscuss our plans and ideas for QAPI going forward, including rust, python, =
and golang extensions to the QAPI generator, what we hope to accomplish wit=
h those projects, and so on.<br><br></div><div>What I am hoping to get out =
of this for myself is a high-level overview of people&#39;s plans for QAPI =
and to produce some notes on those plans so that I can have a reference tha=
t we&#39;ve all acknowledged as roughly accurate to be able to keep the com=
munity&#39;s design goals for QAPI in mind as I continue my own development=
. Ultimately, I&#39;d like some kind of rough draft of a &quot;QAPI roadmap=
&quot;.<br></div><div><br></div><div>I know there was a rust meetup during =
KVM Forum, but I was unable to attend due to the timing. I&#39;d like to ex=
pand the focus a little more broadly to QAPI in general and discuss our &qu=
ot;personal&quot; roadmaps, goals, queued work, etc so that we can collabor=
atively formulate a broader vision of our work.<br></div><div><br></div><di=
v>I&#39;m posting to qemu-devel in case anyone else has an interest in this=
 area and would like to eavesdrop or share opinions, but we should probably=
 come up with an agenda first. So:<br><br></div><div>Proposed agenda:<br></=
div><div><br></div><div>Current projects, wishlists, and goals for QAPI:</d=
iv><div>- Markus (~10 min)<br></div><div>- Marc-Andre (~10 min) (Rust, dbus=
, etc?)<br></div><div>- jsnow (~10 min) (Python, golang, etc)<br></div><div=
><br></div><div>Formulating short-term and long-term roadmaps:</div><div>- =
Open discussion, ~30 min<br>- Collaboratively produce a summary doc (etherp=
ad?) outlining major work to be done, separated into near and long terms<br=
></div><div>- Upload this summary to the QEMU wiki and mail it back out to =
qemu-devel<br></div><div>- We probably won&#39;t exactly finish this bit, b=
ut we can resume on the mailing list afterwards perfectly well.<br></div><b=
r><div>(Feel free to propose anything different for the meeting, this is ju=
st a jumping off point for discussion.)<br><br></div><div>Proposed time:</d=
iv><div><br></div><div>- Any weekday after 13:00 UTC. Wednesdays, Thursdays=
 and Fridays work particularly well for me at the moment.<br></div><div>- b=
luejeans and google meeting both work well for me. Open to alternatives.<br=
><br></div><div><br></div><div>Thanks,<br></div><div>--js<br></div></div>

--000000000000d2e72d05ccfcf7a1--


