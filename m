Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A983DF446
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:02:53 +0200 (CEST)
Received: from localhost ([::1]:58722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAyke-0005y2-Nk
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAyjH-0005Eb-87
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:01:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAyjF-0002NX-Ie
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628013684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zfHHJt5pyhCzXI3y3CpLgGKpgRUs7s9AtpKBBX0o+VE=;
 b=Xk1LvsH3/rt4mmmq/xeF+iR9K4AecbIZpWqaG1Kl60E3C+93DZGaoqT35q9493r6KdRTCl
 JoaKNEhfvRJZ2BuC8ecD6uXss/CHViba8Gs/o6PZPdacsQ0aZR0IOJK62iSSqI359KpP7Q
 PwD5eK0ABpTcfF5OpoPkSRUjVU1X8t4=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-YFXniUk6My2m8cjkSZn6dA-1; Tue, 03 Aug 2021 14:01:22 -0400
X-MC-Unique: YFXniUk6My2m8cjkSZn6dA-1
Received: by mail-oi1-f198.google.com with SMTP id
 w16-20020a0568081410b029025c350a89fdso8975415oiv.11
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 11:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zfHHJt5pyhCzXI3y3CpLgGKpgRUs7s9AtpKBBX0o+VE=;
 b=LE5CEYzgwitKYkvOfA6+uagJQAeSSbWK0qM7APMMGBN47xJxX1Y7OGPOKZS9XS7clM
 9e8rjW9Yi4qVkP88ZLPoH21ceCbdOdyRrrdu8yoIr2XYjaEP1r1di6fAiiBwyBg+2pIP
 MM0G0WjBW7xG+zZubdnHX25ZC1+vAgDpRbP9e6W/hKWRDSyNVgptwGdT3/bB0H3Glkml
 uGPDGqBHQwyJAAb9l5/om3OhbFJlDE2v+CJTOMz4UVfhOvAlNXHWetWHkeaMqeZYO2cw
 3jHWYcqJc8p6lMMGil/KHmpTy7xo9GuZ8FRpNO988wiaSSOgd65sNNaqJPkUu1NLxGbh
 PQrw==
X-Gm-Message-State: AOAM532CVJB0oX4dnclJOZH4I9C3OAn1ii1Asto96Toeh43Ri7w0WUZe
 8vnv40/YxanpjinPnWHbAtDUx7Q521q4RbizDu/g2XcQ33NCyUvu+alsVRsM95HNB8P1M283Bdf
 stqrN91tYiIZv8MidUbW+Q5OdfCrff8A=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr16477522otb.323.1628013681903; 
 Tue, 03 Aug 2021 11:01:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxks7CZyhKmzodzIRWONkVyuIZqANjKCgaPt96nc2/SkR8dotTUyLqyYN25Y1ewjQfBoeHL8Np223vjbAoMYoo=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr16477505otb.323.1628013681728; 
 Tue, 03 Aug 2021 11:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210717003253.457418-1-jsnow@redhat.com>
 <20210717003253.457418-3-jsnow@redhat.com>
 <20210803160129.e63u5lylorivgjov@redhat.com>
 <CAFn=p-aeLwTwhUzEMS9RM4jV8udFg4huKXN3v9QEn8gRG+t9vw@mail.gmail.com>
 <20210803174043.cncgw62hfsdckwua@redhat.com>
In-Reply-To: <20210803174043.cncgw62hfsdckwua@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 3 Aug 2021 14:01:10 -0400
Message-ID: <CAFn=p-Ycb8DJp+=W1ZHSKfpTRssLVtKgrMhDk7sLkK+FOfm9HQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] python/aqmp: add error classes
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003079c505c8ab7903"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003079c505c8ab7903
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 1:40 PM Eric Blake <eblake@redhat.com> wrote:

> On Tue, Aug 03, 2021 at 01:34:32PM -0400, John Snow wrote:
> > Got it. I was *just* about to send a refreshed version of this patchset
> > because I found a new bug while on my way to making a sync compatibility
> > shim for iotests -- Do you have more feedback cooking, or should I hit
> the
> > send button?
>
> I spotted another typo while browsing the web page (disconnect() "If
> there were was an exception"), but I'm fine if you re-send, and I'll
>

Thanks for spotting that. Your proofreading ability is admired and
appreciated :)


> resume looking at the series on the updated v3.  For 1-6, you can add:
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> although my python is weak enough that you may want another set of
> eyes as well.
>
>
Thanks! Review on overall design, documentation, layout, organization and
presentation is plenty helpful even if you aren't necessarily eagle-eyed on
minutiae of Python. (Maybe especially if?)
I've written quite a few tests and have used this library to run our entire
iotests suite, plus Niteesh has been banging the bits pretty hard while
working on aqmp-shell, so I am not too fearful of mechanical errors.

--0000000000003079c505c8ab7903
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 1:40 PM Eric Blake=
 &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Aug 03, =
2021 at 01:34:32PM -0400, John Snow wrote:<br>
&gt; Got it. I was *just* about to send a refreshed version of this patchse=
t<br>
&gt; because I found a new bug while on my way to making a sync compatibili=
ty<br>
&gt; shim for iotests -- Do you have more feedback cooking, or should I hit=
 the<br>
&gt; send button?<br>
<br>
I spotted another typo while browsing the web page (disconnect() &quot;If<b=
r>
there were was an exception&quot;), but I&#39;m fine if you re-send, and I&=
#39;ll<br></blockquote><div><br></div><div>Thanks for spotting that. Your p=
roofreading ability is admired and appreciated :)<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
resume looking at the series on the updated v3.=C2=A0 For 1-6, you can add:=
<br>
<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank">eblake@redhat.com</a>&gt;<br>
<br>
although my python is weak enough that you may want another set of<br>
eyes as well.<br>
<br></blockquote><div><br></div><div>Thanks! Review on overall design, docu=
mentation, layout, organization and presentation is plenty helpful even if =
you aren&#39;t necessarily eagle-eyed on minutiae of Python. (Maybe especia=
lly if?)</div><div>I&#39;ve written quite a few tests and have used this li=
brary to run our entire iotests suite, plus Niteesh has been banging the bi=
ts pretty hard while working on aqmp-shell, so I am not too fearful of mech=
anical errors.<br></div></div></div>

--0000000000003079c505c8ab7903--


