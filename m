Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C356CFE2D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 10:24:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phnYL-0002ZV-K4; Thu, 30 Mar 2023 04:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1phnYK-0002ZH-3L
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1phnYI-0004HZ-2D
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680164552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UDFM5GSHn0GFL4GMoIsWBGJPAAisRA/Bc5CphVW0SU=;
 b=S86mUWOo146prQkZ30y3AVeMIQZIz0XsWjl8xof5l3Xy5UuopBapIL24z1rl8zwfcjDgLp
 JlE/AJOGHEKB4qYU/t8+ZFngxlZ32hjbwQj4lzLD+qKke0RmZ3ODQUPFjyMG2tl+I/Wj8w
 vD7Kt91Nz2UT0RV0TDxuOkPNxeV7wvc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-QDrV45RBPP2mbW4YozG1lg-1; Thu, 30 Mar 2023 04:22:30 -0400
X-MC-Unique: QDrV45RBPP2mbW4YozG1lg-1
Received: by mail-ed1-f69.google.com with SMTP id
 i42-20020a0564020f2a00b004fd23c238beso26029792eda.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 01:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680164549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9UDFM5GSHn0GFL4GMoIsWBGJPAAisRA/Bc5CphVW0SU=;
 b=3bS/dAKryuuNACv+QHBfrZ6FnIDXq62FshDwVYneOtfVFbAXsBMJH7l36wSqcw73DV
 U4qCF1ba8Sb2nzyV1Cw/9ZTGnCN5D3ZQ7yE26l1/2hMP/XZ2l39/ZcUFshyzl3Q6e3GA
 /ICJDSAKvs4xc1UlvEV1Wkn6lQ3kj17GHAj5sRXYYXxxwPBxhvnXLH+04G3GY22vI1jF
 iJtxFWxe50qCM+CaQ4+b/6BkKzD2caJdGPV6AhPTwI32PknL97rFTJPchyF/kAlvsWIs
 gAS7ZvW5W2JhcNn4LFBh4CSTALbL6jK65Cnrsrg4Tox5lyQ+i184ItaXIDTTAT/rCG8c
 yMKQ==
X-Gm-Message-State: AAQBX9cifIZAs28IBql1b8r/HNU0Ij1DiowRWsMUyGkrlAVHDTxcP1Ks
 kjHlaV0lOXH/lZQSCq3KarcgrGzolKUT3D2qGOIHO8xeqd/IKeAxxNPZj6UsDx9aTudhHSWpAFC
 ldiiIp8pIFr70baw=
X-Received: by 2002:a17:906:7243:b0:932:4cbf:5bbb with SMTP id
 n3-20020a170906724300b009324cbf5bbbmr23709733ejk.19.1680164549223; 
 Thu, 30 Mar 2023 01:22:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350aLOXD7dQF8e9ogt5gWcPhK4xPhdoviU140JgYKJK04N4BokJrlhshnWkRnIy1FRNh4SFC8Ew==
X-Received: by 2002:a17:906:7243:b0:932:4cbf:5bbb with SMTP id
 n3-20020a170906724300b009324cbf5bbbmr23709715ejk.19.1680164548968; 
 Thu, 30 Mar 2023 01:22:28 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 vq2-20020a170907a4c200b0093e9fb91837sm7442374ejc.76.2023.03.30.01.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 01:22:28 -0700 (PDT)
Date: Thu, 30 Mar 2023 10:22:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Gerd
 Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Thomas
 Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PULL 19/54] acpi: pc: isa bridge: use AcpiDevAmlIf interface
 to build ISA device descriptors
Message-ID: <20230330102227.39b44b71@imammedo.users.ipa.redhat.com>
In-Reply-To: <ba6a8777-723d-7e6c-bec7-71819cedb66d@proxmox.com>
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-20-mst@redhat.com>
 <ba6a8777-723d-7e6c-bec7-71819cedb66d@proxmox.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Tue, 28 Mar 2023 14:58:21 +0200
Fiona Ebner <f.ebner@proxmox.com> wrote:

> Am 10.06.22 um 09:57 schrieb Michael S. Tsirkin:
> > From: Igor Mammedov <imammedo@redhat.com>
> > 
> > replaces ad-hoc build_isa_devices_aml() with generic AcpiDevAmlIf
> > way to build bridge AML including all devices that are attached to
> > its ISA bus.
> > 
> > Later when PCI is converted to AcpiDevAmlIf, build_piix4_isa_bridge()
> > will also be dropped since PCI parts itself will take care of
> > building device prologue/epilogue AML for each enumerated PCI
> > device.
> > 
> > Expected AML change is contextual, where ISA devices are moved
> > from separately declared _SB.PCI0.ISA scope , directly under
> > Device(ISA) node.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> > Message-Id: <20220608135340.3304695-20-imammedo@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>  
> 
> Hi,
> while trying to reproduce another issue, I ended up with a Windows 10
> guest that would boot with QEMU 7.0, but get stuck after the Windows
> logo/spinning circles with QEMU 7.1 (also with 8.0.0-rc1). Machine type
> is pc-i440fx-6.2[0]. Bisecting led to this commit.
> 
> It only happens the first time the VM is booted, killing the process and
> re-trying always worked afterwards. So it's not a big deal and might
> just be some ACPI-related Windows quirk. But I thought I should ask here
> to be sure.
> 
> For bisecting, I restored the disk state after each attempt. While
> getting stuck sometimes took 3-4 attempts, I tested about 10 times until
> I declared a commit good, and re-tested the commit before this one 15
> times, so I'm pretty sure this is the one where the issue started appearing.
> 
> So, anything that could potentially be wrong with the commit or is this
> most likely just some Windows quirk/bug we can't do much about?
> 
> If you need more information, please let me know!

Please describe in more detail your setup/steps where it reproduces
(incl. Windows version/build, used QEMU CLI) so I could try to reproduce it locally.

(in past there were issues with German version that some where
experience but not reproducible on my side, that resolved with
upgrading to newer QEMU (if I recall correctly issue was opened
on QEMU's gitlab tracker))

> 
> Best Regards,
> Fiona
> 
> [0] command line:
> > ./qemu-system-x86_64 \
> >   -accel 'kvm' \
> >   -name 'stuckafterrollbackonboot,debug-threads=on' \
> >   -no-shutdown \
> >   -chardev 'socket,id=qmp,path=/var/run/qemu-server/161.qmp,server=on,wait=off' \
> >   -mon 'chardev=qmp,mode=control' \
> >   -chardev 'socket,id=qmp-event,path=/var/run/qmeventd.sock,reconnect=5' \
> >   -mon 'chardev=qmp-event,mode=control' \
> >   -pidfile /var/run/qemu-server/161.pid \
> >   -smbios 'type=1,uuid=f2b77ed0-73c1-4372-9490-b2c1b59431af' \
> >   -smp '4,sockets=1,cores=4,maxcpus=4' \
> >   -nodefaults \
> >   -boot 'menu=on,strict=on,reboot-timeout=1000,splash=/usr/share/qemu-server/bootsplash.jpg' \
> >   -vnc 'unix:/var/run/qemu-server/161.vnc,password=on' \
> >   -no-hpet \
> >   -cpu 'kvm64,enforce,hv_ipi,hv_relaxed,hv_reset,hv_runtime,hv_spinlocks=0x1fff,hv_stimer,hv_synic,hv_time,hv_vapic,hv_vpindex,+kvm_pv_eoi,+kvm_pv_unhalt,+lahf_lm,+sep' \
> >   -m 6144 \
> >   -device 'pci-bridge,id=pci.1,chassis_nr=1,bus=pci.0,addr=0x1e' \
> >   -device 'pci-bridge,id=pci.2,chassis_nr=2,bus=pci.0,addr=0x1f' \
> >   -device 'pci-bridge,id=pci.3,chassis_nr=3,bus=pci.0,addr=0x5' \
> >   -device 'vmgenid,guid=faa21a64-5921-45fe-9ff3-1f132b9ed029' \
> >   -device 'piix3-usb-uhci,id=uhci,bus=pci.0,addr=0x1.0x2' \
> >   -device 'usb-tablet,id=tablet,bus=uhci.0,port=1' \
> >   -device 'VGA,id=vga,bus=pci.0,addr=0x2,edid=off' \
> >   -device 'virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x3,free-page-reporting=on' \
> >   -iscsi 'initiator-name=iqn.1993-08.org.debian:01:7d9a912f961' \
> >   -device 'ahci,id=ahci0,multifunction=on,bus=pci.0,addr=0x7' \
> >   -drive 'file=/dev/pve/vm-161-disk-0,if=none,id=drive-sata0,format=raw,cache=none,aio=io_uring,detect-zeroes=on' \
> >   -device 'ide-hd,bus=ahci0.0,drive=drive-sata0,id=sata0,bootindex=100' \
> >   -netdev 'type=tap,id=net0,ifname=tap161i0,script=/var/lib/qemu-server/pve-bridge,downscript=/var/lib/qemu-server/pve-bridgedown' \
> >   -device 'e1000,mac=42:BF:8B:AE:68:05,netdev=net0,bus=pci.0,addr=0x12,id=net0,bootindex=102' \
> >   -rtc 'driftfix=slew,base=localtime' \
> >   -machine 'type=pc-i440fx-6.2' \
> >   -global 'kvm-pit.lost_tick_policy=discard'  
> 
> 


