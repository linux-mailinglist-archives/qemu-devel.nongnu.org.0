Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98B63729E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 08:03:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy6Ew-00076o-8a; Thu, 24 Nov 2022 02:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oy6Et-00076S-E7
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:01:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oy6Er-0005B3-M9
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669273296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=82baxMNG6yE19mOMD+JBS0p/n3IozmTdFEfVdA4B++I=;
 b=h305Rxs424CYFJ4Ojxfg8RkmOH6uivBS6ETcCseAayQpfWJ22ZCshzqoWNhHAByMKO2qRN
 H9jN+M0cWV/W5LvsmQML2Mx32kIpulnnZghzY3obNOnrVqN/QkV5GWPbIGoYgGDR4ZgKkd
 ieaqS+TLD/kmqLGLED128iZVg1vWF3s=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-aWJge18OMG2RIbHS3msvTw-1; Thu, 24 Nov 2022 02:01:34 -0500
X-MC-Unique: aWJge18OMG2RIbHS3msvTw-1
Received: by mail-vk1-f198.google.com with SMTP id
 j133-20020a1f6e8b000000b003bbda3694d8so291899vkc.7
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 23:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=82baxMNG6yE19mOMD+JBS0p/n3IozmTdFEfVdA4B++I=;
 b=nVjwqBxx66y4uV+Fz2Q5CtCIgyESPMXE6OrgHkFcyIn3g5L3fXKaWFaCp9HvO1dhnx
 Eas6aaddmolxqxUHU7u9e5WZzkFlfMQcYnTV7bbDsNp6XRLjw51E42U6Mqgk+6EZXlAS
 mzwWMBEqV29qCJ9RTyEudc5QlQWoelS2SkHu/kIREpEkAsr5BY7zNA4N2M343keLOzVX
 gk5QmjkxOAdZvSwkJeIl/WSF0LpOrIg1tXeLzpZ5YRmVBMYPupdtlfbGPKJ+Iy3BkG1U
 ph3Yir/MdA/oGpf8VQvuEnvETqN4Ba7eTVLgvxwy9QCTOIGGPqq3cZZn5USAGYaZfuD0
 4B4w==
X-Gm-Message-State: ANoB5pkZfwEmjUrjTZGKzNEahnc9853gHJD+LxVyx9qKcmQ+0zustpXC
 bkgElIFL5J/HTYaKhBnDtsbgdlnR/ZgJZ6o3A1HEsaZUB0uyfUcU0WXb2efRIyOhqnGsfGgwjkL
 f+oVUCfU4rtqhJp/w/VMO3GF54R52FhU=
X-Received: by 2002:ab0:5517:0:b0:409:5403:c18 with SMTP id
 t23-20020ab05517000000b0040954030c18mr8088684uaa.51.1669273294227; 
 Wed, 23 Nov 2022 23:01:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4r8ybIIt49By2+xoo42YsnaLkadtQNN6XUGf4W5YL9EB1EhFvPxghpQC25Yu6x/oWyyBlez0HNktuWrNr4ETk=
X-Received: by 2002:ab0:5517:0:b0:409:5403:c18 with SMTP id
 t23-20020ab05517000000b0040954030c18mr8088675uaa.51.1669273294022; Wed, 23
 Nov 2022 23:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20221123114227.85757-1-eesposit@redhat.com>
 <20221123114227.85757-8-eesposit@redhat.com>
 <Y35PIciCujuPvD04@redhat.com>
In-Reply-To: <Y35PIciCujuPvD04@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 24 Nov 2022 08:01:22 +0100
Message-ID: <CABgObfZGC0eM-4wM5C3Q+vNxnVCTiwPGUo1gzBt-4v+zyCJ_+w@mail.gmail.com>
Subject: Re: [PATCH v5 07/15] block: introduce QEMU_IN_COROUTINE macro
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
Content-Type: multipart/alternative; boundary="000000000000b9442905ee31f981"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

--000000000000b9442905ee31f981
Content-Type: text/plain; charset="UTF-8"

Il mer 23 nov 2022, 17:49 Kevin Wolf <kwolf@redhat.com> ha scritto:

> I already asked about other opinions on this in patch 1.
>
> These assertions are runtime checks and I don't feel they are the right
> tool to verify coroutine_fn consistency. Asserting in tricky places
> makes sense to me, especially as long as we can't rely on static
> analysis, but adding it everywhere feels over the top to me.
>

I agree that they don't seem necessary, since static analysis is possible
and superior.

Paolo


> Kevin
>
>

--000000000000b9442905ee31f981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 23 nov 2022, 17:49 Kevin Wolf &lt;<a href=3D"ma=
ilto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">I already asked about other opinions on this in pa=
tch 1.<br>
<br>
These assertions are runtime checks and I don&#39;t feel they are the right=
<br>
tool to verify coroutine_fn consistency. Asserting in tricky places<br>
makes sense to me, especially as long as we can&#39;t rely on static<br>
analysis, but adding it everywhere feels over the top to me.<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I agree that th=
ey don&#39;t seem necessary, since static analysis is possible and superior=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
Kevin<br>
<br>
</blockquote></div></div></div>

--000000000000b9442905ee31f981--


