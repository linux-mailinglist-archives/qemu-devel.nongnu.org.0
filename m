Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8743C7784
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:51:56 +0200 (CEST)
Received: from localhost ([::1]:48178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ORf-0004Rj-9X
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3OJx-0008Cs-DZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3OJt-0008Au-Rh
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626205432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TfwpAxWdq/iLjJYcF/GX4CTSHf/ZJ89HG1UM9GomtSU=;
 b=H/5aRDG3UGvsGjrtL/8eLwaPF3jmhE9tf3ixIIk2wfCLj7nbPsCEB1AhmjFPS9t4ex12x6
 fmEW+6YTjEsT/m6zDfQ+nW3n7kWDKezak2amDgFa/QerQUitYSCAuH6BDnOu6zVhcMY3EN
 VPxjPfXOwsDSjJe+qYZ7XOhJLRzOHE0=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-B7LxOc3TPJGX3GBczuiXtg-1; Tue, 13 Jul 2021 15:43:49 -0400
X-MC-Unique: B7LxOc3TPJGX3GBczuiXtg-1
Received: by mail-oo1-f70.google.com with SMTP id
 t24-20020a4ac8980000b029025fd0948c41so3288255ooq.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 12:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TfwpAxWdq/iLjJYcF/GX4CTSHf/ZJ89HG1UM9GomtSU=;
 b=H0mQJvjL7+qFKWmWML+q1cd2IYWmdpfUrq93g4cFrACzpVF5Z/PhWlCDr4M3qZRp7f
 TL7l9F62+y5SVEpcHimOPf2DMAW+q4+JSqldjetBpqIOJ3zE8MSOxzWXOHBM5HIQpvYn
 dqWo0xYtpWDn9fq7Gb4/aw8sf2l/y9284bFYXWchaxs3XGCQt7OUO7NI/SiK6vEN2JL1
 Dp8blLCGB8DYMcNYie5OkSqmFdbgck4KEa5TBArkEwNmplfHI7xtE98a456DVKxhoW+v
 hv3wdBDW3tTpwWHm7Luaaq1OmhiYIuEeiyDKsDUHzIDBf9CLLDdma+H1N4GESL9Dv7VS
 GP1A==
X-Gm-Message-State: AOAM5315zUDcmluudJ0AvtAFuv4+FfIFJuLrZ2x/0FXrnQf+IF8BJ5Gp
 d3Gx07Mun43oxyqEAr390p/+Xhhk1AJVaUt05IfFkH0SaUq6NPJ+zHPtrFe3u2eTPKjkGlWlKYC
 u9zgQsllL6qwSrlc=
X-Received: by 2002:aca:47ca:: with SMTP id u193mr808474oia.116.1626205429168; 
 Tue, 13 Jul 2021 12:43:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn0Ym8Bo6UEpxllKmM6CjZHOL3hGxUERLSNVIQVbRuSkM8t19i5ABzMulw/0UVWDEo1BbZTQ==
X-Received: by 2002:aca:47ca:: with SMTP id u193mr808460oia.116.1626205428933; 
 Tue, 13 Jul 2021 12:43:48 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id v203sm4156686oib.37.2021.07.13.12.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 12:43:48 -0700 (PDT)
Date: Tue, 13 Jul 2021 13:43:47 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 36/40] vl: switch -M parsing to keyval
Message-ID: <20210713134347.1dc8c4b7.alex.williamson@redhat.com>
In-Reply-To: <20210706100141.303960-37-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
 <20210706100141.303960-37-pbonzini@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  6 Jul 2021 12:01:37 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Switch from QemuOpts to keyval.  This enables the introduction
> of non-scalar machine properties, and JSON syntax in the future.
> 
> For JSON syntax to be supported right now, we would have to
> consider what would happen if string-based dictionaries (produced by
> -M key=val) were to be merged with strongly-typed dictionaries
> (produced by -M {'key': 123}).
> 
> The simplest way out is to never enter the situation, and only allow one
> -M option when JSON syntax is in use.  However, we want options such as
> -smp to become syntactic sugar for -M, and this is a problem; as soon
> as -smp becomes a shortcut for -M, QEMU would forbid using -M '{....}'
> together with -smp.  Therefore, allowing JSON syntax right now for -M
> would be a forward-compatibility nightmare and it would be impossible
> anyway to introduce -M incrementally in tools.
> 
> Instead, support for JSON syntax is delayed until after the main
> options are converted to QOM compound properties.  These include -boot,
> -acpitable, -smbios, -m, -semihosting-config, -rtc and -fw_cfg.  Once JSON
> syntax is introduced, these options will _also_ be forbidden together
> with -M '{...}'.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 315 ++++++++++++++++++++++++---------------------------
>  1 file changed, 146 insertions(+), 169 deletions(-)

This breaks the below long standing test VM.  libvirt log and xml
provided below.  I'm using libvirt version 7.3.0.


/usr/local/bin/qemu-system-x86_64 \
-name guest=Steam-GeForce,debug-threads=on \
-S \
-object '{"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-2-Steam-GeForce/master-key.aes"}' \
-blockdev '{"driver":"file","filename":"/usr/share/edk2/ovmf/OVMF_CODE.fd","node-name":"libvirt-pflash0-storage","auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-pflash0-format","read-only":true,"driver":"raw","file":"libvirt-pflash0-storage"}' \
-blockdev '{"driver":"file","filename":"/var/lib/libvirt/qemu/nvram/Steam_VARS.fd","node-name":"libvirt-pflash1-storage","auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-pflash1-format","read-only":false,"driver":"raw","file":"libvirt-pflash1-storage"}' \
-machine pc-i440fx-6.0,accel=kvm,usb=off,vmport=off,dump-guest-core=off,pflash0=libvirt-pflash0-format,pflash1=libvirt-pflash1-format,memory-backend=pc.ram \
-cpu host,migratable=on,hv-time,hv-relaxed,hv-vapic,hv-spinlocks=0x1fff,hv-vendor-id=KeenlyKVM,kvm=off \
-m 4096 \
-object '{"qom-type":"memory-backend-file","id":"pc.ram","mem-path":"/dev/hugepages/libvirt/qemu/2-Steam-GeForce","x-use-canonical-path-for-ramblock-id":false,"prealloc":true,"size":4294967296}' \
-overcommit mem-lock=off \
-smp 4,sockets=1,dies=1,cores=2,threads=2 \
-uuid 2b417d4b-f25b-4522-a5be-e105f032f99c \
-display none \
-no-user-config \
-nodefaults \
-chardev socket,id=charmonitor,fd=38,server=on,wait=off \
-mon chardev=charmonitor,id=monitor,mode=control \
-rtc base=localtime,driftfix=slew \
-global kvm-pit.lost_tick_policy=delay \
-no-hpet \
-no-shutdown \
-boot menu=on,strict=on \
-device nec-usb-xhci,id=usb,bus=pci.0,addr=0x8 \
-device virtio-scsi-pci,id=scsi0,num_queues=4,bus=pci.0,addr=0x5 \
-blockdev '{"driver":"file","filename":"/mnt/ssd/Steam-2019-08-02.img","node-name":"libvirt-2-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-2-format","read-only":true,"cache":{"direct":true,"no-flush":false},"driver":"raw","file":"libvirt-2-storage"}' \
-blockdev '{"driver":"file","filename":"/mnt/ssd/Steam.qcow2","node-name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"no-flush":false},"driver":"qcow2","file":"libvirt-1-storage","backing":"libvirt-2-format"}' \
-device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,device_id=drive-scsi0-0-0-0,drive=libvirt-1-format,id=scsi0-0-0-0,bootindex=2,write-cache=on \
-netdev tap,fd=41,id=hostnet0,vhost=on,vhostfd=42 \
-device virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:60:ef:ac,bus=pci.0,addr=0x3 \
-audiodev id=audio1,driver=none \
-device vfio-pci,host=0000:01:00.0,id=hostdev0,bus=pci.0,addr=0x4,rombar=1 \
-device vfio-pci,host=0000:01:00.1,id=hostdev1,bus=pci.0,addr=0x6,rombar=0 \
-device vfio-pci,host=0000:02:00.0,id=hostdev2,bus=pci.0,addr=0x2 \
-sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
-msg timestamp=on
2021-07-13T19:37:27.680710Z qemu-system-x86_64: Parameter 'drive' is missing
2021-07-13 19:37:27.703+0000: shutting down, reason=failed


<domain type='kvm'>
  <name>Steam-GeForce</name>
  <uuid>2b417d4b-f25b-4522-a5be-e105f032f99c</uuid>
  <memory unit='KiB'>4194304</memory>
  <currentMemory unit='KiB'>4194304</currentMemory>
  <memoryBacking>
    <hugepages/>
  </memoryBacking>
  <vcpu placement='static'>4</vcpu>
  <cputune>
    <vcpupin vcpu='0' cpuset='3'/>
    <vcpupin vcpu='1' cpuset='7'/>
    <vcpupin vcpu='2' cpuset='2'/>
    <vcpupin vcpu='3' cpuset='6'/>
    <emulatorpin cpuset='0,4'/>
  </cputune>
  <os>
    <type arch='x86_64' machine='pc-i440fx-6.0'>hvm</type>
    <loader readonly='yes' type='pflash'>/usr/share/edk2/ovmf/OVMF_CODE.fd</loader>
    <nvram template='/usr/share/edk2/ovmf/OVMF_VARS.fd'>/var/lib/libvirt/qemu/nvram/Steam_VARS.fd</nvram>
    <bootmenu enable='yes'/>
  </os>
  <features>
    <acpi/>
    <apic/>
    <pae/>
    <hyperv>
      <relaxed state='on'/>
      <vapic state='on'/>
      <spinlocks state='on' retries='8191'/>
      <vendor_id state='on' value='KeenlyKVM'/>
    </hyperv>
    <kvm>
      <hidden state='on'/>
    </kvm>
    <vmport state='off'/>
  </features>
  <cpu mode='host-passthrough' check='none' migratable='on'>
    <topology sockets='1' dies='1' cores='2' threads='2'/>
  </cpu>
  <clock offset='localtime'>
    <timer name='rtc' tickpolicy='catchup'/>
    <timer name='pit' tickpolicy='delay'/>
    <timer name='hpet' present='no'/>
    <timer name='hypervclock' present='yes'/>
  </clock>
  <on_poweroff>destroy</on_poweroff>
  <on_reboot>restart</on_reboot>
  <on_crash>restart</on_crash>
  <devices>
    <emulator>/usr/local/bin/qemu-system-x86_64</emulator>
    <disk type='file' device='disk'>
      <driver name='qemu' type='qcow2' cache='none'/>
      <source file='/mnt/ssd/Steam.qcow2'/>
      <target dev='sda' bus='scsi'/>
      <boot order='2'/>
      <address type='drive' controller='0' bus='0' target='0' unit='0'/>
    </disk>
    <controller type='scsi' index='0' model='virtio-scsi'>
      <driver queues='4'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x05' function='0x0'/>
    </controller>
    <controller type='pci' index='0' model='pci-root'/>
    <controller type='usb' index='0' model='nec-xhci'>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x08' function='0x0'/>
    </controller>
    <interface type='direct'>
      <mac address='52:54:00:60:ef:ac'/>
      <source dev='enp4s0' mode='bridge'/>
      <model type='virtio'/>
      <link state='up'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
    </interface>
    <input type='mouse' bus='ps2'/>
    <input type='keyboard' bus='ps2'/>
    <audio id='1' type='none'/>
    <hostdev mode='subsystem' type='pci' managed='yes'>
      <source>
        <address domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
      </source>
      <rom bar='on'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x0'/>
    </hostdev>
    <hostdev mode='subsystem' type='pci' managed='yes'>
      <source>
        <address domain='0x0000' bus='0x01' slot='0x00' function='0x1'/>
      </source>
      <rom bar='off'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x06' function='0x0'/>
    </hostdev>
    <hostdev mode='subsystem' type='pci' managed='yes'>
      <source>
        <address domain='0x0000' bus='0x02' slot='0x00' function='0x0'/>
      </source>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x0'/>
    </hostdev>
    <memballoon model='none'/>
  </devices>
</domain>


