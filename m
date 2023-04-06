Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB69F6DA00F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 20:41:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkUWw-0003SK-9H; Thu, 06 Apr 2023 14:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pkUWu-0003S9-Kb
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:40:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pkUWt-0006dm-10
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680806413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HV42roR/XBgVr33hFmbg2ocbXsYWARVX2iggalLQILY=;
 b=b5yuHazNGrXAJWKv7bRay/9QU5Vd+LNYnX3h3aU2/AiOetduIzX8jpMFwRKOnBclCDyGZb
 xMo3yJG7uh0B1j8ebuIyvt9i7cUtEI9ta7nxs98Ouh74a6IFKsjnEudRQ4YaTISdikAlr5
 yQy/BAVpxI61lSl/NNcNpVfIx2/Mj7w=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-af7fAA-qNqiqlwaNxQIJMg-1; Thu, 06 Apr 2023 14:40:12 -0400
X-MC-Unique: af7fAA-qNqiqlwaNxQIJMg-1
Received: by mail-io1-f72.google.com with SMTP id
 p128-20020a6b8d86000000b007583ebb18fdso24416195iod.19
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 11:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680806411; x=1683398411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HV42roR/XBgVr33hFmbg2ocbXsYWARVX2iggalLQILY=;
 b=QFFK2uviwLQqhDc02iPr3YejYv26Mm3ExwrFeV14fHtC+KxiCpSTBHKKL8/WNUIt3q
 ly+xmJmACQamB11BV3/F7nIjwgFALTW5W+Npy5IKwX6sMNdO85GF+/P7bk1KNQ63dAbf
 MLU0IsuObp+4gI57VwTOpJOeamorT9Ccsd4IQ5gI3Td3YhevkTS4HFDx0UOZvKeQMZwt
 frG5+TovxkiGyyPs8nLK/nq9p9G3HxvzcAJ0sqa0IVLqCIxTXfxY/LoFbX6sZ6k/YjGh
 oR4kMjhQsghu7L7KaXcICgBOYJ0scn9PdFNOzFAgpdDVa+oHBG3/yHr21Fcr9HEz/zYM
 67JQ==
X-Gm-Message-State: AAQBX9fawX3LoXMmQQC2Qf2T1c61bHSQijwsD0quG0RWELxnjLQoGNSr
 QCkqqMPJzvoZJu9CeX6vmU5tmLsQ7KyWrawKliDc+22NELwKrU4mKlvr1lPHsKY8UwpERmk+5RY
 WJlYDN9XkPHkYSQAzN5m567o=
X-Received: by 2002:a92:d951:0:b0:322:f272:30d2 with SMTP id
 l17-20020a92d951000000b00322f27230d2mr5581557ilq.4.1680806411456; 
 Thu, 06 Apr 2023 11:40:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350bW9yCU3tawGe8Q1bH5+4VVt6DLrv0epesb97y4hpkww7HXv4x01RVFzIWYhmvAPjHNAOUp6Q==
X-Received: by 2002:a92:d951:0:b0:322:f272:30d2 with SMTP id
 l17-20020a92d951000000b00322f27230d2mr5581552ilq.4.1680806411190; 
 Thu, 06 Apr 2023 11:40:11 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i18-20020a056e020ed200b003282154e8ffsm354089ilk.9.2023.04.06.11.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:40:10 -0700 (PDT)
Date: Thu, 6 Apr 2023 12:40:09 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Robin Voetter <robin@streamhpc.com>
Cc: qemu-devel@nongnu.org
Subject: Re: PCIe atomics in pcie-root-port
Message-ID: <20230406124009.4a5e7307.alex.williamson@redhat.com>
In-Reply-To: <b30370f5-0b52-d2de-6e47-8f288a219a43@streamhpc.com>
References: <b30370f5-0b52-d2de-6e47-8f288a219a43@streamhpc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 6 Apr 2023 11:29:34 +0200
Robin Voetter <robin@streamhpc.com> wrote:

> Hello,
>=20
> I am trying to use qemu to run ROCm in a virtual machine via GPU=20
> passthrough with vfio-pci. While this mostly works out of the box, ROCm=20
> requires PCIe atomics to function properly, and it seems like that this=20
> is a feature that is missing in qemu. The setup is using a simple PCie=20
> topology, where the GPU is connected to a pcie-root-port as follows:
>  =C2=A0=C2=A0 -device pcie-root-port,id=3Dpcie.1
>  =C2=A0=C2=A0 -device vfio-pci,host=3D<host_pci_address>,bus=3Dpcie.1
>=20
> When the amdgpu kernel module is loaded in the guest, enabling PCIe=20
> atomics fails because it requires that PCIe root ports support 32- and=20
> 64-bit atomic completion, see commits 430a2368 and 8e6d0b69 in Linux.
>=20
> I patched the required flags into the DevCap2 register in qemu and=20
> everything seems to work fine. I'm interested in getting this change=20
> into qemu proper, but I have some questions about how to do that:
>=20
> 1. In order for PCIe atomics to be supported, every bridge in the path=20
> between the root complex and the device in question needs to support the=
=20
> routing capability, as well as the device being required to support the=20
> atomic requester/completer capabilities of course. When a certain device=
=20
> from the host is connected to a root port in qemu, that path will be=20
> abstracted away into the virtual PCIe topology. Should this property=20
> from the host be reflected into the virtual path in qemu, or is it=20
> better to gate this behind a property of the pcie-root-port? For=20
> example, the user could then simply pass -device=20
> pcie-root-port,id=3Dpcie.1,atomics=3Don to make the pcie-root-port report=
=20
> that it supports these operations. If this should be reflected from the=20
> host automatically, how should this be tested for? I checked around the=20
> source for how for example the link speed is set, but it seems like that=
=20
> is not reflected from the host system automatically either.

I think the typical approach for QEMU would be expose options in the
downstream ports that would then need to be enabled by the user or
management tool, but that's where the complication begins.  At some
point we would want management tools to "do the right thing"
themselves.  Is support for PCIe atomics pervasive enough to default to
enabling support?  How do we handle hotplugged endpoints where the
interconnects do not expose atomics support, or perhaps when they
expose support that doesn't exist?  At some point in the future when we
have migration of devices with atomics, do we need to test all endpoint
to endpoint paths for equivalent atomic support on the migration target?
Are there capabilities on the endpoint that we can virtualize to
disable use of atomics if the host and guest topologies are out of sync?

> 2. Is anything else required to support PCIe atomics, or did I just get=20
> lucky that my programs work?

It's been on my todo list for some time to look into supporting atomic
ops, but it suffers from the -ENOTIME syndome.  Thanks,

Alex


