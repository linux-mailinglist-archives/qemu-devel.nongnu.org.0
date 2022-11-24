Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1172F6372A1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 08:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy6IQ-0008Gr-SA; Thu, 24 Nov 2022 02:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oy6IN-0008GY-9R
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:05:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oy6IL-0001JX-QX
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669273513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lSNY1alu1AAGBw40LPfzb3CkywwP8ZrJqDsPQRWvd5Y=;
 b=f/ST+pu9pNgO/lrTlpXo9kw1pwevK6T5ZuCvXpnlYbeUozbRuyk55pRouKJI/24Mm3vuk5
 2bk2UPzP0eP5qLp/yyHzr9//gPYnZLp93QHFL9Y4fkg+EBTzBn1ydubZL8v6nkjVotD5X3
 CLIQ6NheTppMtK5gsGQiV3rrT1PrWcY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-311-0vxbZjaaPga0JYFsHLjyeA-1; Thu, 24 Nov 2022 02:05:11 -0500
X-MC-Unique: 0vxbZjaaPga0JYFsHLjyeA-1
Received: by mail-ua1-f71.google.com with SMTP id
 n14-20020a9f314e000000b004114b0c125fso494268uab.8
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 23:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lSNY1alu1AAGBw40LPfzb3CkywwP8ZrJqDsPQRWvd5Y=;
 b=Z7OuqBe4RGfaEfHUWwoN8udu7lmbUt+wc9wqUS+RtSDGwBH/RDgttkKE1eBqrFbu0d
 0cQs5O/fn44aUtaYoWvm9xCi0kGtK26fmer2y4TjYz5V4Co5wn3X4blDGe/ErfePUujP
 7M8mDJHfQpM3hnYUGy47Fn/PXkeq2a2kpIskViWOk8sawmFR29luGYTfVqG4bdim7cHm
 pb/W+C21Jp5GUrnY2XU6He34YXZEatEaY6CwkuxNHyftwJLGX9iHuiEqZPFp61AMj+wi
 ZrZFF+CaN/sA/xanM6fnkJXE73keZDnoRynu+FcA09WjaKoJEM791BVOUR26s514kBPV
 3BVA==
X-Gm-Message-State: ANoB5pm5mm+IijQnJtvgGBJN3VfJGwTmyE5rOqdFqFtfB7p6ZPa75MLh
 qGZqIhAf6nUAiePZ2tmu9ot66X0kQS7oR4symLzGUmVRTffZiUoahquHYF6t/t6bfmyaOU1u0ys
 xDWCyv/URuTAiaA7bprRuZkhxDiSCHKE=
X-Received: by 2002:ab0:69cc:0:b0:410:2392:40f with SMTP id
 u12-20020ab069cc000000b004102392040fmr17970094uaq.109.1669273510892; 
 Wed, 23 Nov 2022 23:05:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf45VxtO0tICbd4yBoFf22JZyfAVNKOtwH9FSmG3pc2YiekErLrXn6kWMLaPzEUFt69T/jgwnulIi9GE1YTcbWw=
X-Received: by 2002:ab0:69cc:0:b0:410:2392:40f with SMTP id
 u12-20020ab069cc000000b004102392040fmr17970080uaq.109.1669273510687; Wed, 23
 Nov 2022 23:05:10 -0800 (PST)
MIME-Version: 1.0
References: <20221123114227.85757-1-eesposit@redhat.com>
 <20221123114227.85757-2-eesposit@redhat.com>
 <Y35KbUvGsfEmT9ka@redhat.com>
In-Reply-To: <Y35KbUvGsfEmT9ka@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 24 Nov 2022 08:04:59 +0100
Message-ID: <CABgObfZqDCrY-oEH7n12aWc5g_wnqn3WHcYx=rva70SsPues4A@mail.gmail.com>
Subject: Re: [PATCH v5 01/15] block-io: introduce coroutine_fn duplicates for
 bdrv_common_block_status_above callers
To: Kevin Wolf <kwolf@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, 
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a34ad505ee3206a6"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

--000000000000a34ad505ee3206a6
Content-Type: text/plain; charset="UTF-8"

Il mer 23 nov 2022, 17:29 Kevin Wolf <kwolf@redhat.com> ha scritto:

> As I said, personally, I don't feel like putting QEMU_IN_COROUTINE()
> assertions into every coroutine_fn is a useful thing to do. Static
> analysis (maybe even with something vrc based in 'make check'? Paolo,
> would this be realistic?)


Yes, using pyclang just to build the call graph should be much much faster
than doing all the static analysis. So it should be feasible to integrate
it with "make check". We can decide whether to bundle vrc, which is just a
dozen files, or install it from pypi (sooner or later configure will have
to be taught about that, too).

Paolo

>

--000000000000a34ad505ee3206a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 23 nov 2022, 17:29 Kevin Wolf &lt;<a href=3D"ma=
ilto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">As I said, personally, I don&#39;t feel like putti=
ng QEMU_IN_COROUTINE()<br>
assertions into every coroutine_fn is a useful thing to do. Static<br>
analysis (maybe even with something vrc based in &#39;make check&#39;? Paol=
o,<br>
would this be realistic?)</blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Yes, using pyclang just to build the call graph should=
 be much much faster than doing all the static analysis. So it should be fe=
asible to integrate it with &quot;make check&quot;. We can decide whether t=
o bundle vrc, which is just a dozen files, or install it from pypi (sooner =
or later configure will have to be taught about that, too).</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"></div><d=
iv dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000a34ad505ee3206a6--


