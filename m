Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F3334045
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:25:04 +0100 (CET)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzln-0003yy-NJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lJzk9-0002sx-Ne
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:23:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lJzk7-0004c7-HG
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:23:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615386198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gy8DIcVx+03VsbulE1EjRB5nvprUobmYN8USL0ADrJc=;
 b=GFVN8HVR06WAn60pL8CAlU3IRXyPMoFkMpQZX2cNBihndjf57+dNfLk1eh6DGIRe7TKdjb
 +cOVtl7WbAoA6aVgDHfCMBV5oaDJ/AzrL3HrB9yJuJRYym+w2D7XThSLaJks2EGO/69Nmu
 AOZk3IE3pvBcteEv9hopz/PllvYYxCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-iM3SylZNNBSOR-220q4sMQ-1; Wed, 10 Mar 2021 09:23:13 -0500
X-MC-Unique: iM3SylZNNBSOR-220q4sMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4005D83DD22;
 Wed, 10 Mar 2021 14:23:12 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0268063747;
 Wed, 10 Mar 2021 14:23:01 +0000 (UTC)
Date: Wed, 10 Mar 2021 15:22:58 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
Message-ID: <YEjWQnWKbr5teciB@angien.pipo.sk>
References: <20210308165440.386489-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 17:54:10 +0100, Kevin Wolf wrote:
> This series adds a QAPI type for the properties of all user creatable
> QOM types and finally makes the --object command line option (in all
> binaries) and the object-add monitor commands (in QMP and HMP) use the
> new ObjectOptions union.
> 
> This change improves things in more than just one way:
> 
> 1. Documentation for QOM object types has always been lacking. Adding
>    the schema, we get documentation for every property.
> 
> 2. It prevents bugs by performing parts of the input validation (e.g.
>    checking presence of mandatory properties) already in QAPI instead of
>    relying on separate manual implementations in each class.
> 
> 3. It provides QAPI introspection for user creatable objects.
> 
> 4. Non-scalar properties are now supported everywhere because the
>    command line parsers (including HMP) use the keyval parser now.
> 
> 
> If you are in the CC list and didn't expect this series, it's probably
> because you're the maintainer of one of the objects for which I'm adding
> a QAPI schema description. Please just have a look at the specific patch
> for your object and check whether the schema and its documentation make
> sense to you. You can ignore all other patches.
> 
> 
> In a next step after this series, we can add make use of the QAPI
> structs in the implementation of the object and separate their
> configuration from the runtime state. Specifically, the plan is to
> add a .configure() callback to ObjectClass that allows configuring the
> object in one place at creation time and keeping QOM property setters
> only for properties that can actually be changed at runtime. Paolo made
> an example of what the state could look like after this:
> 
>     https://wiki.qemu.org/Features/QOM-QAPI_integration
> 
> Finally, the intention is to extend the QAPI schema to have separate
> 'object' entities and generate some of the code that was written
> manually in the intermediate state before.
> 
> 
> This series is available as a git tag at:
> 
>     https://repo.or.cz/qemu/kevin.git qapi-object-v3
> 
> 
> v3:
> - Removed now useless QAuthZListRuleListHack
> - Made some more ObjectOptions branches conditional
> - Improved documentation for some properties
> - Fixed 'qemu-img compare' exit code for option parsing failure
> 
> v2:
> - Convert not only object-add, but all external interfaces so that the
>   schema will always be enforced and mismatch between implementation and
>   schema can't go unnoticed.
> - Rebased, covering properties and object types added since v1 (yes,
>   things do become outdated rather quickly when you touch all user
>   creatable objects)
> - Changed the "Since:" version number in the schema documentation to
>   refer to the version when the object was introduced rather than 6.0
>   where the schema will (hopefully) be added
> - Probably some other minor changes

I've stumbled upon a regression with this patchset applied:

error: internal error: process exited while connecting to monitor: qemu-system-x86_64: -object memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind: Invalid parameter type for 'host-nodes', expected: array

Full commandline is:

LC_ALL=C \
PATH=/root/.local/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin \
HOME=/var/lib/libvirt/qemu/domain-15-cd \
USER=root \
LOGNAME=root \
XDG_DATA_HOME=/var/lib/libvirt/qemu/domain-15-cd/.local/share \
XDG_CACHE_HOME=/var/lib/libvirt/qemu/domain-15-cd/.cache \
XDG_CONFIG_HOME=/var/lib/libvirt/qemu/domain-15-cd/.config \
/home/pipo/git/qemu.git/build/x86_64-softmmu/qemu-system-x86_64 \
-name guest=cd,debug-threads=on \
-S \
-object secret,id=masterKey0,format=raw,file=/var/lib/libvirt/qemu/domain-15-cd/master-key.aes \
-machine pc-i440fx-2.9,accel=kvm,usb=off,vmport=off,dump-guest-core=off,memory-backend=pc.ram \
-cpu EPYC-Rome,x2apic=on,tsc-deadline=on,hypervisor=on,tsc-adjust=on,stibp=on,arch-capabilities=on,ssbd=on,xsaves=on,cmp-legacy=on,amd-ssbd=on,virt-ssbd=on,rdctl-no=on,skip-l1dfl-vmentry=on,mds-no=on,pschange-mc-no=on \
-m 1000 \
-object memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind \
-overcommit mem-lock=off \
-smp 2,maxcpus=8,sockets=8,cores=1,threads=1 \
-uuid 8e70100a-64b4-4186-aff9-e055c3075cb0 \
-no-user-config \
-nodefaults \
-device sga \
-chardev socket,id=charmonitor,fd=42,server=on,wait=off \
-mon chardev=charmonitor,id=monitor,mode=control \
-rtc base=utc,driftfix=slew \
-global kvm-pit.lost_tick_policy=delay \
-no-hpet \
-no-shutdown \
-global PIIX4_PM.disable_s3=1 \
-global PIIX4_PM.disable_s4=1 \
-boot menu=on,strict=on \
-device ich9-usb-ehci1,id=usb,bus=pci.0,addr=0x6.0x7 \
-device ich9-usb-uhci1,masterbus=usb.0,firstport=0,bus=pci.0,multifunction=on,addr=0x6 \
-device ich9-usb-uhci2,masterbus=usb.0,firstport=2,bus=pci.0,addr=0x6.0x1 \
-device ich9-usb-uhci3,masterbus=usb.0,firstport=4,bus=pci.0,addr=0x6.0x2 \
-device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=0x9 \
-device ahci,id=sata0,bus=pci.0,addr=0xb \
-device ahci,id=sata1,bus=pci.0,addr=0x3 \
-device virtio-serial-pci,id=virtio-serial0,bus=pci.0,addr=0x5 \
-blockdev '{"driver":"file","filename":"/var/lib/libvirt/images/systemrescuecd-amd64-6.1.2.iso","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-1-format","read-only":true,"driver":"raw","file":"libvirt-1-storage"}' \
-device ide-cd,bus=ide.0,unit=0,drive=libvirt-1-format,id=ide0-0-0,bootindex=1 \
-chardev pty,id=charserial0 \
-device isa-serial,chardev=charserial0,id=serial0 \
-chardev socket,id=charchannel0,fd=44,server=on,wait=off \
-device virtserialport,bus=virtio-serial0.0,nr=1,chardev=charchannel0,id=channel0,name=org.qemu.guest_agent.0 \
-chardev spicevmc,id=charchannel1,name=vdagent \
-device virtserialport,bus=virtio-serial0.0,nr=2,chardev=charchannel1,id=channel1,name=com.redhat.spice.0 \
-device usb-tablet,id=input0,bus=usb.0,port=1 \
-audiodev id=audio1,driver=spice \
-spice port=5901,addr=127.0.0.1,disable-ticketing=on,image-compression=off,seamless-migration=on \
-device qxl-vga,id=video0,ram_size=67108864,vram_size=67108864,vram64_size_mb=0,vgamem_mb=16,max_outputs=1,bus=pci.0,addr=0x2 \
-device intel-hda,id=sound0,bus=pci.0,addr=0x4 \
-device hda-duplex,id=sound0-codec0,bus=sound0.0,cad=0,audiodev=audio1 \
-chardev spicevmc,id=charredir0,name=usbredir \
-device usb-redir,chardev=charredir0,id=redir0,bus=usb.0,port=2 \
-chardev spicevmc,id=charredir1,name=usbredir \
-device usb-redir,chardev=charredir1,id=redir1,bus=usb.0,port=3 \
-device virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0xa \
-object rng-random,id=objrng0,filename=/dev/random \
-device virtio-rng-pci,rng=objrng0,id=rng0,bus=pci.0,addr=0x7 \
-sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
-msg timestamp=on




