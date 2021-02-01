Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA130B38C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 00:30:02 +0100 (CET)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ids-0000pw-NB
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 18:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6icx-0000Ox-QG
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 18:29:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6ict-0001Iq-W0
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 18:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612222137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V4GBlCgrUGQ0D9APU7LfuOFX045w2E2B/vJtotfKZeI=;
 b=AS+8pCT2pv3lAwAtPEKnL5CFAFhxqIKRzVz5DUKtcpDS64Qj2otAKIZaAPWfJd3aEjohNr
 MdKnsEMAKRH8BqoDZObD4I39HOiOtHByCFh7jjUy+BDWz0spWJCqX5muWl5MwzADYGe5u8
 WGpOYpQZjYDLF0IEvq9NV0pUs5qkmxk=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-VEU7IZmoPFGI4vS11KUBWw-1; Mon, 01 Feb 2021 18:28:52 -0500
X-MC-Unique: VEU7IZmoPFGI4vS11KUBWw-1
Received: by mail-pg1-f199.google.com with SMTP id 8so12506400pgn.8
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 15:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V4GBlCgrUGQ0D9APU7LfuOFX045w2E2B/vJtotfKZeI=;
 b=hZn8Lgsd65pjYHHUk/af9bpp3g+BDp+JqMrhryrwzl4ZuU7J32XQBUvxLQmDh2kPgB
 DvFCeVXbT34VCzcLRtZCVErPKRm77wHBTAef8RMtDrVkOUuNDgLA1x+fr/65JTCabifA
 vgzx2efi0QXJG4JWOOKBWLNp1QKRzI5cMLzSaBRWnvibAsh+f1dGcm+sQOxYrNzrGOjE
 G0mGdpHVaoJzuBHZNWIKSdApDHsP/W9auVGsHQa9cECeCNbXMPmsT/x+5E72Xq9nVJ5E
 LsCPnd2ol6ZK75NEYZtJrLfx2D342L3+Dkiv24h9d8/4u8p29YxI3BmISJe4BEe2L9dA
 fqWw==
X-Gm-Message-State: AOAM5331zysESH4i/XJX6rgqthRbZceNCprGeNRy5bjI9seoZJ5AVyoK
 sX2zaGFB+pot5v/fpmVMdkpQOhXVZadCciHfG5aNYpRNF8HeFHAyI3+GWUwOjoANHrHVoBjH/TL
 KDPLWutT7algpblPphSDyxE9SrAME1HY=
X-Received: by 2002:a17:903:2285:b029:e1:58a2:b937 with SMTP id
 b5-20020a1709032285b02900e158a2b937mr7486985plh.68.1612222130762; 
 Mon, 01 Feb 2021 15:28:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCWFIYhhtPVwNqMG6243243wNmNdsBXLGsSBCFK0DQVppO4pzLHV4U69vzzL2MTZnIZuph1zek+xcsHQwpBTM=
X-Received: by 2002:a17:903:2285:b029:e1:58a2:b937 with SMTP id
 b5-20020a1709032285b02900e158a2b937mr7486964plh.68.1612222130499; Mon, 01 Feb
 2021 15:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20210201225404.3941395-1-ehabkost@redhat.com>
 <20210201225404.3941395-2-ehabkost@redhat.com>
 <CABgObfaWW+ON4AA6cqygOkCMrruMbUqCR32R=uVhxnm4yUa6eQ@mail.gmail.com>
 <20210201230544.GJ3872207@habkost.net>
In-Reply-To: <20210201230544.GJ3872207@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 2 Feb 2021 00:28:38 +0100
Message-ID: <CABgObfYrOG1QBHskP4=Rwcp2uwOZKDCE9_RF1mmJWngD90zSjA@mail.gmail.com>
Subject: Re: [PATCH 1/3] i386: Add missing "vmx-ept-wb" feature name
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000063510005ba4eb751"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Babu Moger <babu.moger@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063510005ba4eb751
Content-Type: text/plain; charset="UTF-8"

Il mar 2 feb 2021, 00:05 Eduardo Habkost <ehabkost@redhat.com> ha scritto:

> On Mon, Feb 01, 2021 at 11:59:48PM +0100, Paolo Bonzini wrote:
> > Il lun 1 feb 2021, 23:54 Eduardo Habkost <ehabkost@redhat.com> ha
> scritto:
> >
> > > Not having a feature name in feature_word_info breaks error
> > > reporting and query-cpu-model-expansion.  Add the missing feature
> > > name to feature_word_info[FEAT_VMX_EPT_VPID_CAPS].feat_names[14].
> > >
> > This is intentional, because there's no way that any hypervisor can run
> if
> > this feature is disabled.
>
> If leaving the feature without name enables some desirable
> behavior, that's by accident and not by design.  Which part of
> the existing behavior is intentional?
>

Not being able to disable it.

Paolo


> --
> Eduardo
>
>

--00000000000063510005ba4eb751
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 2 feb 2021, 00:05 Eduardo Habkost &lt;<a href=
=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</a>&gt; ha scritto:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Mon, Feb 01, 2021 at 11:59:48PM +01=
00, Paolo Bonzini wrote:<br>
&gt; Il lun 1 feb 2021, 23:54 Eduardo Habkost &lt;<a href=3D"mailto:ehabkos=
t@redhat.com" target=3D"_blank" rel=3D"noreferrer">ehabkost@redhat.com</a>&=
gt; ha scritto:<br>
&gt; <br>
&gt; &gt; Not having a feature name in feature_word_info breaks error<br>
&gt; &gt; reporting and query-cpu-model-expansion.=C2=A0 Add the missing fe=
ature<br>
&gt; &gt; name to feature_word_info[FEAT_VMX_EPT_VPID_CAPS].feat_names[14].=
<br>
&gt; &gt;<br>
&gt; This is intentional, because there&#39;s no way that any hypervisor ca=
n run if<br>
&gt; this feature is disabled.<br>
<br>
If leaving the feature without name enables some desirable<br>
behavior, that&#39;s by accident and not by design.=C2=A0 Which part of<br>
the existing behavior is intentional?<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Not being able to disable it.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
-- <br>
Eduardo<br>
<br>
</blockquote></div></div></div>

--00000000000063510005ba4eb751--


