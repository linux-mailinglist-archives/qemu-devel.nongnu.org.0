Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EE83EDF69
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:40:29 +0200 (CEST)
Received: from localhost ([::1]:48662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFkLM-0006ML-1v
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFkJO-0002uX-88
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFkJM-0001OA-Kw
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629149903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=peQlexrYDfGNjdU3j/xH6OUrYnj+igRepaRtpq/G/lg=;
 b=SIdMke3pDRfrO+FbeB9BZ+7Ymsv/hYtbtBkM/OaAFsLROc4ewx3+jxfEf+GOdIWdomVbpB
 J9jnfmhPO6sZNNuqVpDrp12AMjHxiXZsGtkzZBLYL1xSMi7ChQqD27YqgWkHcM0peHTtct
 qdmlvjPOCVYCroVwSuUezCtYmmg4Nmo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-_FsamtBrOnyjcTz4abYoXg-1; Mon, 16 Aug 2021 17:38:21 -0400
X-MC-Unique: _FsamtBrOnyjcTz4abYoXg-1
Received: by mail-pl1-f197.google.com with SMTP id
 p21-20020a1709028a95b029012c31764588so11592903plo.12
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 14:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=peQlexrYDfGNjdU3j/xH6OUrYnj+igRepaRtpq/G/lg=;
 b=Yn2RWVGj4KjsKZiGdip2yhAbnIEEk9rn6SA43JF9S5YoBHasEMTOyhq+vd1g++3/u+
 kNFFoNEKIoxfsAexO/P7PTpqdflM90lJM+17efFvgQZ0M6EkO/0r/wg1H0TyaZ0AJPCJ
 6UuxCuiXP1aI9cYbT3nHbNpEV6aTxhkfo8vKbV5J/hxK7kWpFRpwbu4h9+3FSUHY1QUZ
 zdJbFUFkFo9CNhOGTX2oOZNVaPBQcBkNsIfuK/fvC+Kx6bBcqpayuLeLpv/+V6XA8Oex
 VZ3ul8JUrb+w5oXc0KhlEhELOqnETOyIN5oCCnL5CgGkypuNJPiCSb5olRUMtREc5OaR
 /jRQ==
X-Gm-Message-State: AOAM531NAIc+uWNBZsS1pOE6Sd1bi0OVPibO4y1MZVKZ/rw0CSm3BFym
 /dJnjKJ4D4DVKQoyB2Yiwjr+uiZ51AhPFPAhfkkMEJzk1ZBNKMTIC8nPv0OrrBzzIqmrEvHgTsh
 YZ7hHBS9l/+yo0rQSZevwMjPaT42QgYg=
X-Received: by 2002:a62:ee16:0:b029:2fe:ffcf:775a with SMTP id
 e22-20020a62ee160000b02902feffcf775amr76872pfi.59.1629149900492; 
 Mon, 16 Aug 2021 14:38:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd94Z6myAhyWEgfpce9EbJvdlYAhnnylEf5mnvLfKgrUuTrsBEeLtuF1CVCu8jaKHoiCPGOWtMIZqf6gFxyIM=
X-Received: by 2002:a62:ee16:0:b029:2fe:ffcf:775a with SMTP id
 e22-20020a62ee160000b02902feffcf775amr76862pfi.59.1629149900293; Mon, 16 Aug
 2021 14:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210816210603.42337-1-ehabkost@redhat.com>
In-Reply-To: <20210816210603.42337-1-ehabkost@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Aug 2021 23:38:08 +0200
Message-ID: <CABgObfbsOo7OoRAaVZAWVqsyJS+4OS2HGZ5FabcV1XcedXGccA@mail.gmail.com>
Subject: Re: [PULL 0/1] Last minute fix for -rc4
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000017e13e05c9b40532"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000017e13e05c9b40532
Content-Type: text/plain; charset="UTF-8"

AIUI this behavior existed before in 6.0 and therefore should be deprecated
first.

Paolo

Il lun 16 ago 2021, 23:06 Eduardo Habkost <ehabkost@redhat.com> ha scritto:

> The following changes since commit
> bd44d64a3879bb6b0ca19bff3be16e0093502fac:
>
>   Merge remote-tracking branch
> 'remotes/thuth-gitlab/tags/pull-request-2021-08-11' into staging
> (2021-08-15 16:46:23 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to bbd0db9dc4751b6ab0884e92421fa4b2c3d3b532:
>
>   machine: Disallow specifying topology parameters as zero (2021-08-16
> 16:55:39 -0400)
>
> ----------------------------------------------------------------
> Last minute fix for -rc4
>
> Bug fix:
> * Disallow specifying topology parameters as zero
>   (Yanan Wang)
>
> ----------------------------------------------------------------
>
> Yanan Wang (1):
>   machine: Disallow specifying topology parameters as zero
>
>  hw/core/machine.c | 14 ++++++++++++++
>  qapi/machine.json |  6 +++---
>  qemu-options.hx   | 12 +++++++-----
>  3 files changed, 24 insertions(+), 8 deletions(-)
>
> --
> 2.31.1
>
>
>

--00000000000017e13e05c9b40532
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">AIUI this behavior existed before in 6.0 and therefore sh=
ould be deprecated first.<div dir=3D"auto"><br></div><div dir=3D"auto">Paol=
o</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Il lun 16 ago 2021, 23:06 Eduardo Habkost &lt;<a href=3D"mailto:ehab=
kost@redhat.com">ehabkost@redhat.com</a>&gt; ha scritto:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">The following changes since commit bd44d64a3879bb6b0c=
a19bff3be16e0093502fac:<br>
<br>
=C2=A0 Merge remote-tracking branch &#39;remotes/thuth-gitlab/tags/pull-req=
uest-2021-08-11&#39; into staging (2021-08-15 16:46:23 +0100)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/ehabkost/qemu.git" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://gitlab.com/ehabkost/qemu.git</a> tags/=
machine-next-pull-request<br>
<br>
for you to fetch changes up to bbd0db9dc4751b6ab0884e92421fa4b2c3d3b532:<br=
>
<br>
=C2=A0 machine: Disallow specifying topology parameters as zero (2021-08-16=
 16:55:39 -0400)<br>
<br>
----------------------------------------------------------------<br>
Last minute fix for -rc4<br>
<br>
Bug fix:<br>
* Disallow specifying topology parameters as zero<br>
=C2=A0 (Yanan Wang)<br>
<br>
----------------------------------------------------------------<br>
<br>
Yanan Wang (1):<br>
=C2=A0 machine: Disallow specifying topology parameters as zero<br>
<br>
=C2=A0hw/core/machine.c | 14 ++++++++++++++<br>
=C2=A0qapi/machine.json |=C2=A0 6 +++---<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0| 12 +++++++-----<br>
=C2=A03 files changed, 24 insertions(+), 8 deletions(-)<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div>

--00000000000017e13e05c9b40532--


