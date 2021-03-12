Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7293399CE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 23:49:06 +0100 (CET)
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKqae-0005Ag-Rr
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 17:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKqZW-0004RC-TN
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 17:47:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKqZT-0006Xe-HV
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 17:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615589269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hkhuGrItGlCjreZyCg9x9bSkoGjTqwcn7LGynwnJ2rk=;
 b=Oa+H1rDNv2o84nrEAjufq17ydx9CF0CSGhMVUdfPDsK1V48ifawlAOWQ94GBaBf6OwIqsU
 ijcsrSTWe+GGu1OTqjACiTvlfdzAtXpwUKy9KnIPRBtuMG/PrCQBVIoZQz4XYpxnVMIUhV
 DnZ70/ICq5K91/TCYbvFratR4MGwBME=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-zt6ZV-nAMrum78r4PoRVOw-1; Fri, 12 Mar 2021 17:47:46 -0500
X-MC-Unique: zt6ZV-nAMrum78r4PoRVOw-1
Received: by mail-pj1-f70.google.com with SMTP id co15so9280959pjb.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 14:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hkhuGrItGlCjreZyCg9x9bSkoGjTqwcn7LGynwnJ2rk=;
 b=ngLLnrVVhnp69JIu+CzvIG85RxtbcuKqDLnkBolQK0ShjJevbrO9cnRzhJ3TdRG+Ms
 2nbfu+LNyS3MdsPprqNH7fWou0/2BtDaXn9o+kjsFzqeI+KEMw6PrfinqxFyazUmQQ5o
 aYD6Eprp0oiERUW0q8VTMGPC1J4bU/0PvYxaZIJ982chy+6QmX8FelvtV4iVFU54MLkH
 wIZi2d5gsontXD4WqB+0SOhOeW3JjC6UWuGMiT56UI2ve1dArxTc5xXJ6fNyO2oG+FRY
 ZsG1wP2MOrHuPLBeZnlr11iFL49rShuLmAfUrScG9KHJpf2v6yHg2vk8NzvWVvt5LHR1
 nLGw==
X-Gm-Message-State: AOAM530FFJTUujgViQ3fwh6KvXeVkhjAeqKi+xQOBP6ssWYV9q3R/rYe
 jdGYino0oDsRuDMFAGQ3BDCrpF4d8KUnu4tTDrFlQK3UZSytzsGYLnFiqstO5bkbz0tMukF6n7U
 iPiaQVbhh9+H5p8AeDAl5ohmjDnWzvNs=
X-Received: by 2002:a17:902:b908:b029:e6:3e0a:b3cc with SMTP id
 bf8-20020a170902b908b02900e63e0ab3ccmr1258468plb.68.1615589265726; 
 Fri, 12 Mar 2021 14:47:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVGCuuvyLatFfPDowrJfkSxxzZTHzbNQ9b8BivyU715NLIMTvUf9Sgu4xCu1a55xdkAmPiPHw9rDW9JNNY8Iw=
X-Received: by 2002:a17:902:b908:b029:e6:3e0a:b3cc with SMTP id
 bf8-20020a170902b908b02900e63e0ab3ccmr1258452plb.68.1615589265481; Fri, 12
 Mar 2021 14:47:45 -0800 (PST)
MIME-Version: 1.0
References: <20210312233949.3681b75d@redhat.com>
In-Reply-To: <20210312233949.3681b75d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 12 Mar 2021 23:47:33 +0100
Message-ID: <CABgObfZXuKSprawHUF3rh2CK4qT-HO5ouLxGu+JRJ4V53PbDQw@mail.gmail.com>
Subject: Re: qemu crashes on changing display resolution within guest
To: Igor Mammedov <imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000045bfe605bd5eb0c0"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: drjones@redhat.com, Keqian Zhu <zhukeqian1@huawei.com>,
 qemu-devel <qemu-devel@nongnu.org>, peterx@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000045bfe605bd5eb0c0
Content-Type: text/plain; charset="UTF-8"

Pull request coming next Monday.

Paolo

Il ven 12 mar 2021, 23:40 Igor Mammedov <imammedo@redhat.com> ha scritto:

> happens on current master,
>
> to reproduce start
> ./x86_64-softmmu/qemu-system-x86_64 -enable-kvm -m 1g -M pc -vnc
> localhost:0 \
>      -snapshot -cdrom Fedora-Workstation-Live-x86_64-33-1.2.iso
>
> connect to guest using 'Remote Desktop', wait till it boots to graphical
> desktop
> then try to change resolution to 800x600
>
> QEMU will crash in a second or 2 with:
> qemu-system-x86_64: ../qemu/accel/kvm/kvm-all.c:690:
> kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)'
> failed.
>
>
> offending commit:
>
> commit 3920552846e881bafa9f9aad0bb1a6eef874d7fb (HEAD, refs/bisect/bad)
> Author: Keqian Zhu <zhukeqian1@huawei.com>
> Date:   Thu Dec 17 09:49:41 2020 +0800
>
>     accel: kvm: Add aligment assert for kvm_log_clear_one_slot
>
> PS:
> same happens when using spice client
>
>

--00000000000045bfe605bd5eb0c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Pull request coming next Monday.<div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Il ven 12 mar 2021, 23:40 Igor Mammedov &lt=
;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; ha scri=
tto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">happens on current master,<br>
<br>
to reproduce start<br>
./x86_64-softmmu/qemu-system-x86_64 -enable-kvm -m 1g -M pc -vnc localhost:=
0 \<br>
=C2=A0 =C2=A0 =C2=A0-snapshot -cdrom Fedora-Workstation-Live-x86_64-33-1.2.=
iso<br>
<br>
connect to guest using &#39;Remote Desktop&#39;, wait till it boots to grap=
hical desktop<br>
then try to change resolution to 800x600<br>
<br>
QEMU will crash in a second or 2 with:<br>
qemu-system-x86_64: ../qemu/accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot=
: Assertion `QEMU_IS_ALIGNED(start | size, psize)&#39; failed.<br>
<br>
<br>
offending commit:<br>
<br>
commit 3920552846e881bafa9f9aad0bb1a6eef874d7fb (HEAD, refs/bisect/bad)<br>
Author: Keqian Zhu &lt;<a href=3D"mailto:zhukeqian1@huawei.com" target=3D"_=
blank" rel=3D"noreferrer">zhukeqian1@huawei.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Thu Dec 17 09:49:41 2020 +0800<br>
<br>
=C2=A0 =C2=A0 accel: kvm: Add aligment assert for kvm_log_clear_one_slot<br=
>
<br>
PS:<br>
same happens when using spice client<br>
<br>
</blockquote></div>

--00000000000045bfe605bd5eb0c0--


