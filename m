Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD723D0210
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 21:14:55 +0200 (CEST)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vCg-0006ls-TF
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 15:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5vBZ-00063A-P0
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5vBY-0005Vj-CM
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626808423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FieBgCyTySN8KW14vLgRPbXw+vlmu5DMC4UTnqlkcnQ=;
 b=WcCxPMsdStsNU89mFhsquLZ95OOyAbSHMaPtRYGDG5RzYFDK9s4nvQXHMBBeWnU1MiHcrP
 hz1riu/L9J6w0nCMM23keOZpjG5vM7VM9FDr3FIWLoupsJY857mJRZu2AP3tXv8p/yXCLC
 QSKmWaxQovNNMSRCJD7BGpNVvJZS/jE=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-TXqHGDubN7WrnZK7P9UA8A-1; Tue, 20 Jul 2021 15:13:41 -0400
X-MC-Unique: TXqHGDubN7WrnZK7P9UA8A-1
Received: by mail-ot1-f71.google.com with SMTP id
 g4-20020a9d6b040000b02904cdecce70a8so11421562otp.22
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FieBgCyTySN8KW14vLgRPbXw+vlmu5DMC4UTnqlkcnQ=;
 b=aNIKuN0Ls8UzuESVTnJLgA140gf3ltUsVRitWwMbkW0eXtTN3/szEsGI3KbifYp9Kw
 OdCWwE/yoydUZztOsr7vEJn3oZP2Y8p18ejz9Rr++fm7fnfrt231GD+av37QG17iYCyK
 EG1OkgVOEzHXldqj4ClwJbT7K0m8eX8OslUeQxbVO/JXlo5ORMHKXMYUQi2x0ZXlzI09
 sRzDcjFHqtBG6Po+2hTlJISB8L/D0F5ms0AIV4citxaLwtiHQpbiH8NEiW7cVlr/wL3R
 oCMKMK8Lc6snAO23e9rs1wZtFYKROTIDzUHAFpwaH9s+2UrP0dD/ipUkLeTSLsQM0nt6
 C6LQ==
X-Gm-Message-State: AOAM533sBAEabeLqwdb4yb2RXeLuj2PyZURymPwwMlXa+18Ow1cDnY7k
 Nz8i/nzduSxsFD3iSCEj4xXGGqh2uNuSBOpB2AiINVKcq+G9vamgUMcip2ykIxCszf1+NlT/LZ4
 ypFiyAiu63m0KMqA/U+HlnEVGqwnjmNQ=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr23686518otb.323.1626808421143; 
 Tue, 20 Jul 2021 12:13:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPBbPCOqtr+tz+QFhTMlPxbfIOGPaTT865RbOImDxT2jwkclXso/58QlMDDe7t1r7uBlyl8TSOXymZG2ebwkA=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr23686505otb.323.1626808420978; 
 Tue, 20 Jul 2021 12:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210717003253.457418-1-jsnow@redhat.com>
 <20210717003253.457418-12-jsnow@redhat.com>
 <CAN6ztm_mVwuTsF1-7=UrFJWXOKBzcAFBnpumN0Yj90geUByUDw@mail.gmail.com>
In-Reply-To: <CAN6ztm_mVwuTsF1-7=UrFJWXOKBzcAFBnpumN0Yj90geUByUDw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 20 Jul 2021 15:13:30 -0400
Message-ID: <CAFn=p-bvNUfDymQt4th5McrKgSV4wxDdoYnivLkqHwTqg8PL1Q@mail.gmail.com>
Subject: Re: [PATCH v2 11/24] python/aqmp: add _cb_inbound and _cb_inbound
 logging hooks
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000cecb505c792dabf"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000cecb505c792dabf
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 2:52 PM Niteesh G. S. <niteesh.gs@gmail.com> wrote:

> I think there's a typo in your commit message subject.
>
> Thanks,
> Niteesh.
>
>
Whoops, there sure is. Fixed locally, thanks!

--js

--0000000000000cecb505c792dabf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 20, 2021 at 2:52 PM Niteesh G=
. S. &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small">I think there&#3=
9;s a typo in your commit message subject.</div><div style=3D"font-size:sma=
ll"><br></div><div style=3D"font-size:small">Thanks,</div><div style=3D"fon=
t-size:small">Niteesh.</div></div><br></div></blockquote><div><br></div><di=
v>Whoops, there sure is. Fixed locally, thanks!</div><div><br></div><div>--=
js<br></div><div>=C2=A0</div></div></div>

--0000000000000cecb505c792dabf--


