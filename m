Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023806573EF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 09:28:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pARnL-0006RI-Bi; Wed, 28 Dec 2022 03:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pARnC-0006Qo-IW
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 03:28:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pARnA-0002tc-Tr
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 03:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672216084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TTX8JYn6xRD1xGQ2oAs1DrIFvwG5TVkYzfHNybgM2ww=;
 b=TmbgPdIwF78UGCN4b/8+gUErkXZcXJykQaAv23VcZFw+Ppy2L+7OyjAGv3xaVS9eWUMivG
 i8gd2BxXIZC+sCJirfMWfPhZBpg8QIG8XvzWrP9ot1knbFib1d1TMgugO2J9RiUaIoxa9E
 5GXDr4BI2PiholDAn2/WXX9S8/rgxpc=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-NebluObGMRqNiHKKqfkW3A-1; Wed, 28 Dec 2022 03:28:02 -0500
X-MC-Unique: NebluObGMRqNiHKKqfkW3A-1
Received: by mail-vs1-f69.google.com with SMTP id
 t30-20020a05610210de00b003c59346f348so2731439vsr.16
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 00:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TTX8JYn6xRD1xGQ2oAs1DrIFvwG5TVkYzfHNybgM2ww=;
 b=03SpIWoXMYJ8Ng4v/VgKs158SrSmBAfAlWPqonP4P7zMbHIF0YkTikHtuBgXWHziRS
 TFkprCZhYHPojVveX9A0wpEg3MlLYm4VwzPz+3zUOBzlgeCIn+yYp2KvqsCtGbxE3k93
 F5osNoc3fT4H7gWoOD5+II4v1V2J6y3iepvJ9ZHSfBpyeAhUeceJCtiSDJW+KneOnpYE
 x7qte6DvGjx6EA0pL1rwYVkLRFlMHBZAbQdGPVp67tDbGP1SmXPT2iDWrS25L7uPCDXM
 hnUfq4li/XHMG/i0C1bU13JDw7TB5CuxNRaHkVvBcdAlgFoQl5k7GmFCiXDfzTyXTglM
 MWHA==
X-Gm-Message-State: AFqh2kquT3M6Af6Jk1fJLdDd+FzIxHWZw+aHb1LW9jN6O06hqvwa7icM
 FUqB5hW/D6lf1KalF+1dUfrvCtheKHTiQpdVEpr9EYUmUNna69qyivvVrXSJFQTLijk7n9LjSiG
 BzsrthEDwuMPSGCsvk5RxHGkWzbcEobI=
X-Received: by 2002:a67:c782:0:b0:3b3:10b1:8e64 with SMTP id
 t2-20020a67c782000000b003b310b18e64mr2916624vsk.42.1672216082168; 
 Wed, 28 Dec 2022 00:28:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzCO6J42ycUxln0kQi6UsutzUZE1vE1cjZwo3vl4xdZ1ThihqSA8gC3elK6EFZ1DJHL3pT5UN0f1KwR6iIC+I=
X-Received: by 2002:a67:c782:0:b0:3b3:10b1:8e64 with SMTP id
 t2-20020a67c782000000b003b310b18e64mr2916619vsk.42.1672216081929; Wed, 28 Dec
 2022 00:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
 <05c4cb9e-0f41-c60f-6a68-cf5050ad7a02@redhat.com>
 <Y6XPRD4fSucgWZfT@x1n>
In-Reply-To: <Y6XPRD4fSucgWZfT@x1n>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 Dec 2022 09:27:50 +0100
Message-ID: <CABgObfa=i=9CZRFyX_EXBOSW===iDhcZoDO8Ju64F-tHUAXdRA@mail.gmail.com>
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
To: Peter Xu <peterx@redhat.com>
Cc: Chuang Xu <xuchuangxclwt@bytedance.com>, qemu-devel <qemu-devel@nongnu.org>,
 David Gilbert <dgilbert@redhat.com>, "Quintela, Juan" <quintela@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 zhouyibo@bytedance.com
Content-Type: multipart/alternative; boundary="0000000000008d2ac605f0df25ee"
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

--0000000000008d2ac605f0df25ee
Content-Type: text/plain; charset="UTF-8"

Il ven 23 dic 2022, 16:54 Peter Xu <peterx@redhat.com> ha scritto:

> > This is not valid because the transaction could happen in *another*
> thread.
> > In that case memory_region_transaction_depth() will be > 0, but RCU is
> > needed.
>
> Do you mean the code is wrong, or the comment?  Note that the code has
> checked rcu_read_locked() where introduced in patch 1, but maybe something
> else was missed?
>

The assertion is wrong. It will succeed even if RCU is unlocked in this
thread but a transaction is in progress in another thread.

Perhaps you can check (memory_region_transaction_depth() > 0 &&
!qemu_mutex_iothread_locked()) || rcu_read_locked() instead?

Paolo

Thanks,
>
> --
> Peter Xu
>
>

--0000000000008d2ac605f0df25ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 23 dic 2022, 16:54 Peter Xu &lt;<a href=3D"mail=
to:peterx@redhat.com">peterx@redhat.com</a>&gt; ha scritto:</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
&gt; This is not valid because the transaction could happen in *another* th=
read.<br>
&gt; In that case memory_region_transaction_depth() will be &gt; 0, but RCU=
 is<br>
&gt; needed.<br>
<br>
Do you mean the code is wrong, or the comment?=C2=A0 Note that the code has=
<br>
checked rcu_read_locked() where introduced in patch 1, but maybe something<=
br>
else was missed?<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">The assertion is wrong. It will succeed even if RCU is unlo=
cked in this thread but a transaction is in progress in another thread.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Perhaps you can check (memo=
ry_region_transaction_depth() &gt; 0 &amp;&amp; !qemu_mutex_iothread_locked=
()) || rcu_read_locked() instead?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks,<br>
<br>
-- <br>
Peter Xu<br>
<br>
</blockquote></div></div></div>

--0000000000008d2ac605f0df25ee--


