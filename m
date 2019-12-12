Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17511C206
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 02:17:51 +0100 (CET)
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifD70-0001rV-90
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 20:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ifD5s-0001NQ-3e
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:16:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ifD5q-0002e6-2g
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:16:38 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51320
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ifD5p-0002cJ-RQ
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576113396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l17/VKeWANArI+gTiEKZZMmihfuIWu/OPAP7+eqaYCE=;
 b=XRnPeos2jR3N4aTvu9shjTVdTQXdlzJsoJMGY5bVsprjcNcTsY0RQpv1cNPqzQZRR59kjX
 BWY01TkS5bZnWoKiLPYzlqK/yHSI5Y9mh2nPBafqhgw1WJst/y8rkUcGnkav5i3qhi/o26
 Dev4+TfzHXAryiBps2+ig234DCMVbJM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-XgAJd21KOp64zwr-i7yKEA-1; Wed, 11 Dec 2019 20:16:35 -0500
Received: by mail-wr1-f69.google.com with SMTP id u12so350689wrt.15
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 17:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OAM83NKaf1+wsKEoS4AoXUumXgf7dKD6S/+ogXRoI94=;
 b=XVZ0iPCm8CReBryujzQpKhHNF/xYPG584iGUTmlvxSkMEG/RZkwi1YqAV5jOveXQOx
 eeT6bkjn9epJ4o6Pd7fdaMQCvmqywF4ekDuHFxFHNSZpnvmB+8n1lkLWRswtKLjz7SgK
 JcaMUHtla0ygj27u1UHXB8a6QlXLmFsGhCjwTbvvsiVei3WQosDdiwEG9MqYdij6R/pn
 dgJltknqltyGAcEnXkikBu4FulxnJWR4TH24V2EJ99OwTThqxKN71+ZmJsnVIcwKJf1i
 4vDZ63YlvLNL1kCqXxi/0hie9NLHdyvlRZSUi2hBMLAbkyxV9qN9cWqKAB4bMnnaUssW
 BjJQ==
X-Gm-Message-State: APjAAAV7BM90QnRhy9a6MtvI/lroR4TFimVq3OTIi/5MEYtdaJe2QyDz
 StqufeqTLCLkO5lAIHHfVlQjKaAJ3MF1taW1pvKAoOo7s19m8g46IAx/TOBw182qB6yydIZXG/6
 6WtuhpjVt0kbDJWo=
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr3015450wrm.394.1576113393916; 
 Wed, 11 Dec 2019 17:16:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcO29/40jSIRu9fiqnfYf3qyH4qGedJFmICFNJI0sEG2c90tjkSnexQWflpk4EpviBMnihcg==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr3015424wrm.394.1576113393664; 
 Wed, 11 Dec 2019 17:16:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id s15sm4181595wrp.4.2019.12.11.17.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 17:16:33 -0800 (PST)
Subject: Re: QEMU VM crashes when enabling KVM
To: Wayne Li <waynli329@gmail.com>, qemu-devel@nongnu.org
References: <CAM2K0nrhkOhiJDxnANGmAu2140-TP0a9pY58i_PN1k9xAWGz9A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <76b207cd-09ce-b3df-e288-a515df40677e@redhat.com>
Date: Thu, 12 Dec 2019 02:16:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAM2K0nrhkOhiJDxnANGmAu2140-TP0a9pY58i_PN1k9xAWGz9A@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: XgAJd21KOp64zwr-i7yKEA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/19 22:23, Wayne Li wrote:
>=20
> Now I am fairly sure KVM is actually enabled on the system.=C2=A0 Finding
> that out was another story that spanned a couple of months.=C2=A0 But lon=
g
> story short, lsmod doesn't show that the KVM kernel module is running.=C2=
=A0
> But that's because KVM is built-in and it can't actually be built as a
> loadable kernel module in this particular system.
>=20
> So I'm not really sure what could be the problem.=C2=A0 Though I was thin=
king
> if I understood the error better that might help?=C2=A0 Following the cod=
e I
> see that the "Missing PVR setting capability." is called when a variable
> called "cap_segstate" is 0:
>=20
> if (!cap_segstate) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "kvm error: mis=
sing PVR setting capability\n");
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOSYS;
> }
>=20
> And the cap_segstate variable is set by the following function:
>=20
> cap_segstate =3D kvm_check_extension(s, KVM_CAP_PPC_SEGSTATE);

You are not saying how you are running QEMU.  I think you are using a
CPU model that requires a Book3S KVM.

Paolo


