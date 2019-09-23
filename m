Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD472BB618
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 16:02:01 +0200 (CEST)
Received: from localhost ([::1]:56960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCOub-0006On-Re
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 10:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iCOrP-0005Q9-JU
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:58:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iCOrO-0006LG-9K
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:58:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26976
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iCOrO-0006GS-2q
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569247116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3kkbH6iUXtNoyhMC2VRcNsewmldMDekND0jT/ZVioSM=;
 b=QdLOPPrxA7RrRYcXFJPezGMUoJ62lOAHa/exa1AbaNtTnwganXMkpzcRGrvsEJmW0ye+YW
 tiXlaFmbPdz6GnOkhLo7TNfxT1h8ptdT4SZQ3tj8WIkbhxldIro7ZbA1ShJCACBQwj51vV
 iaHmGpYnu6RHQNCbqOgbqSTfUNoTlbI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-pFRV3Pm2PY6hrwu1nWCcZA-1; Mon, 23 Sep 2019 09:58:34 -0400
X-MC-Unique: pFRV3Pm2PY6hrwu1nWCcZA-1
Received: by mail-wm1-f69.google.com with SMTP id k9so6774859wmb.0
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 06:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=3kkbH6iUXtNoyhMC2VRcNsewmldMDekND0jT/ZVioSM=;
 b=sz2gDmgYBlz8A3skirJoyA4ycUCEvSWbxiISf+ayYGFiU8L4/VwA4zNqXsSr5dkTAP
 TrQp198I7Ly+U/QadnNbM+fY0Nw2MedyEmfgupxTDEZTwjp60uh7EPf7UhlTXW67xYrz
 NPaTiRGJrOxr6VauwOPucvXtrBt5Ow6YHt7DtuX/4VMWgLFff+OpTwcmlilXD027hOdw
 c29QwZ3JCP1X7bxhBl2o6Bh6ClR4Wb5kgTAWoiKVdHs2+96/s55VriKUf1w8sIu7X2hW
 EZnu/zICy9oAhL8FX7wUe5xpzXHaAFfGbO55sg03StmEEk0GMrumBplzV5tWrqxPzjBW
 AdpQ==
X-Gm-Message-State: APjAAAXdkwRFdLHdQbXaFhqkG/89gZCzqoYE0/okNQ8oIsbMWCgF7Pew
 ikGGKuUsAgp9TyjLKLgx2bCnyKRnUe/BsjSmXfdmD1Wih+ZYtQ9RsVB8ZZ9q9pDqA71QNRo9w2L
 3B6cvF59ROPMj/Gs=
X-Received: by 2002:adf:dc91:: with SMTP id r17mr21568996wrj.22.1569247113422; 
 Mon, 23 Sep 2019 06:58:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbvuoJwpJW2Vc77wmyqk08NbCebiGVBxLclrTryZBP+ddDN3rhA7sOqwIU7unbjiT9FrLtcA==
X-Received: by 2002:adf:dc91:: with SMTP id r17mr21568986wrj.22.1569247113218; 
 Mon, 23 Sep 2019 06:58:33 -0700 (PDT)
Received: from dritchie.redhat.com (139.red-95-120-215.dynamicip.rima-tde.net.
 [95.120.215.139])
 by smtp.gmail.com with ESMTPSA id b12sm10661681wrt.21.2019.09.23.06.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 06:58:32 -0700 (PDT)
References: <20190913120559.40835-1-slp@redhat.com>
 <a51cbe82-9213-d535-a43b-57f68f78475d@gmail.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Sergio Lopez <slp@redhat.com>
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3] virtio-mmio: implement modern (v2),
 personality (virtio-1)
In-reply-to: <a51cbe82-9213-d535-a43b-57f68f78475d@gmail.com>
Date: Mon, 23 Sep 2019 15:58:28 +0200
Message-ID: <87ef07cdx7.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-=-=
Content-Type: text/plain


Vasyl Vavrychuk <vvavrychuk@gmail.com> writes:

> Hi, Sergio,
>
>> For this reason, the v2 personality is disabled, keeping the legacy
>> behavior as default. Machine types willing to use v2, can enable it
>> using MachineClass's compat_props.
> ...
>> +    DEFINE_PROP_BOOL("force-legacy", VirtIOMMIOProxy, legacy, true),
>
> Currently, I am not enable to set "force-legacy" to false from command
> line for
> virt machine.

You can disable force-legacy from the command line by passing "-global
virtio-mmio.force-legacy=false".

> I think, the "force-legacy" and compat_props should work the other way
> around.
>
> The "force-legacy" should be set to false by default to select a new
> behaviour.
> Instead of this hw_compat_4_1 should be modified to keep the old behaviour:

The decision to keep the legacy behavior as the default is because
support for the non-legacy personality is not a widespread as it'd be
desirable. Basically, only the Linux guest driver supports it (it's
missing from every *BSD I checked, and also from TianoCore's EDK2).

Sergio.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl2Iz4QACgkQ9GknjS8M
AjWAsw/9ESEs1+rDRtckdBk+NSqVLpGugdZff8Ql+hBPeBZR0Gg8Cx2REf7TAjMc
eTzZNwooMpZenP2rLG1Lf70ZGrh5BDiNFjyYtD0+mxjuvUhqca+qVEJI5yMie5bF
+bqjPh8jaw7gKCudQWg+Yj2j8hV1yyl/KG7c4YcyQ3R1Ga//ZHzI3PXReRYhzrnT
FlUqKSC4ILY2lbGhRmRzdUdnLMSOL/mx9qVpU/mmoGCqRo1+Uo8I4lN0CD//dxXb
FT574tBzOEzAM09ytyz6zR0WY2xYpprk+ByGiEXt0ZNUSL14o5SaHCMvdYXPYVqv
BNWIYZU+BgYNzXzZh+pq+UDfMP7iFFEKuHbDk7vA0+6tJ2u+LVY+EZLmaAc2NLHf
qEHK6cfsup0Ry+91hzN65tX6Tz9ccaqY/C90fmjEyRdPIgvFt2LQOOBQTs7wu8zj
kaPN2R5KcXUoD8Sw6n/f0Qj3lzY1pMNFSJpmhFEQ8RWyuMtuT+Uj5QcuG5TxAVQm
vTRAhCVcBg4rCnADapyXpFE+rj6Zw+1/PNI7SbmX6byyhXXswsCN3yKfW4DIWABE
UCUMHmeD6bnYRJBqwhwI5+wV2Z2Fw1faydWQ7Bi0/AmKKrRjq7cKwBLRTRZuiNMW
LBlpL3dI1z1W1FXZBK+fE4Cn9f1Zu3OChqlHQ1leb4Z7rXknMgw=
=Ff25
-----END PGP SIGNATURE-----
--=-=-=--


