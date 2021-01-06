Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652092EC461
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:02:16 +0100 (CET)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxF0Z-0001lL-D0
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxEyR-0000au-LG
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:00:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxEyM-0004lE-D8
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609963197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Y9e7L249atWWZId8QvrYEwk0dPVqvL8GbGNdiITMlA=;
 b=M+YN0DREuhS1FQfehYi9FkGU8vmBzBTbn/TsGvfXrccOwtke22dKZNu7f8/SIm1/a/Kv/P
 +YGqSuH/RBtj/3ltHKM6CYmf4XQPr4Ee5y75q52FUeNjixK6pppfSCPcqEnwKQajAPIU4O
 9XWDXrz0TSaJTFkEOYAqTSWRlfRbCpY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-8QQX3_4_NyWx4Gd9XaNWkg-1; Wed, 06 Jan 2021 14:59:55 -0500
X-MC-Unique: 8QQX3_4_NyWx4Gd9XaNWkg-1
Received: by mail-pl1-f197.google.com with SMTP id h23so2293686plr.13
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 11:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Y9e7L249atWWZId8QvrYEwk0dPVqvL8GbGNdiITMlA=;
 b=cFL047mg7LC2ZGy1IcsmxYrzMcBNjxQJZNcyiNWRn4Lh4FFGgr5ag9CGxD29YXai++
 xIU0EIqtKEhOwMNQwUxBtuVzQvG4m311IR/jDi5RmDHZbSjCBIHD1RwQ2YsTJmi6HGhz
 trQ2qs22Ta4ahGHklkdMu8i45eMFqSit3G4KRtOZYSojVVcRYpozVeAz+CGcqqulN6hf
 m1YEvyzQxfhcHiPh471S2/phSXisCai5ZKFrZNK4kYD8O+oIS7ovhYb+i1FkyAG0YJLJ
 lye9z1QVN0kyg/AnOnNhE99X04FlaevVmMorvH3KKAhyydwVO8ZtR2TjD5LER62HsUIl
 2Vmg==
X-Gm-Message-State: AOAM531yl1fuv1+J4yrw4I+UhXRJaMfeJ13LvOU323oKSHPE7G7yY5T+
 3vuVRqnOQp0SBvWK1ci2bzggxCc572+xfhQR9tVZsmDNNQDguE/1K/svyh6yX7PugRVBPA/SCv7
 Nt1MyDzXRMng1CpJlzw9kjShaFCaS2Fo=
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id
 t8-20020aa793880000b029019e06486480mr5436820pfe.21.1609963194206; 
 Wed, 06 Jan 2021 11:59:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk3Oy3AqibESLjcAw4Ozpg8kGGmEf+kFWibjBMB2pwFkMnoRHOiH+mY9LYbwCNR6tkauHfJqPqeT1wVWp0ZvY=
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id
 t8-20020aa793880000b029019e06486480mr5436811pfe.21.1609963193997; Wed, 06 Jan
 2021 11:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20210105181437.538366-1-danielhb413@gmail.com>
 <20210105181437.538366-2-danielhb413@gmail.com>
 <20210106165914.GA133192@stefanha-x1.localdomain>
In-Reply-To: <20210106165914.GA133192@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 6 Jan 2021 20:59:41 +0100
Message-ID: <CABgObfa3wrhou3Pug4wZ5i2kQ9WD3KZy3+F3Y=zQbobXUnru5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] vl.c: do not execute trace_init_backends() before
 daemonizing
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000047aeee05b840c46b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000047aeee05b840c46b
Content-Type: text/plain; charset="UTF-8"

Il mer 6 gen 2021, 17:59 Stefan Hajnoczi <stefanha@gmail.com> ha scritto:

> Acked-by: Stefan Hajnoczi <stefanha@redhat.com


I don't have anything queued shortly so feel free to include it yourself.

Paolo


>

--00000000000047aeee05b840c46b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 6 gen 2021, 17:59 Stefan Hajnoczi &lt;<a href=
=3D"mailto:stefanha@gmail.com">stefanha@gmail.com</a>&gt; ha scritto:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Acked-by: Stefan Hajnoczi &lt;<a href=3D=
"mailto:stefanha@redhat.com" target=3D"_blank" rel=3D"noreferrer">stefanha@=
redhat.com</a></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I don&#39;t have anything queued shortly so feel free to include =
it yourself.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
</blockquote></div></div></div>

--00000000000047aeee05b840c46b--


