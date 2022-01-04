Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C273C4841CA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 13:44:47 +0100 (CET)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4jBG-0001ak-DF
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 07:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1n4j7w-0000m6-BA
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 07:41:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1n4j7s-0006x6-Na
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 07:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641300075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQrno4NnP9NEgq9ITM7RfEUdBop4vAIKU+EWFI6CqSI=;
 b=UQqFweIBflg/2RAdTGcNcPeMwI2mOn1FifIqlY6xr+ONI/qV8kqWtI23AKmKmdhIGm333/
 CWOjWMceMN3O9A7Acx2MS/ThULy5fLUptAPnzjTq7Q2/FN8Fl+lXfLmmqEgD6D3xuQ/eno
 YZIWbaEv4Ix62CLMAz0IiBX72XORDCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-259yzm-SNs6TLApxztv_YA-1; Tue, 04 Jan 2022 07:41:12 -0500
X-MC-Unique: 259yzm-SNs6TLApxztv_YA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAFC6801AAB;
 Tue,  4 Jan 2022 12:41:10 +0000 (UTC)
Received: from localhost (unknown [10.2.17.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA83B2376A;
 Tue,  4 Jan 2022 12:41:00 +0000 (UTC)
Date: Tue, 4 Jan 2022 12:40:59 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <20220104124059.GA1341@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lf13cx3x.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 qemu-devel@nongnu.org, Mirela Grujic <mirela.grujic@greensocs.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for very delayed reply ...

On Thu, Dec 02, 2021 at 07:57:38AM +0100, Markus Armbruster wrote:
> 1. QMP only
> 
>    Management applications need to use QMP for monitoring anyway.  They
>    may want to use it for initial configuration, too.  Libvirt does.
> 
>    They still need to bootstrap a QMP monitor, and for that, CLI is fine
>    as long as it's simple and stable.

libguestfs actually does not use the QMP monitor but manages to
configure eveything from the command line just fine.  I've attached
below a typical example.  (Of course we can use libvirt too, but still
for many configurations libvirt causes problems unfortunately).

> Human users struggle with inconsistent syntax, insufficiently expressive
> configuration files, and huge command lines.

One advantage of "huge command lines" is that they document the
configuration of qemu quite well.  I know it's only an approximation,
but in many cases it's exactly what we want.  It is frequently the
case when troubleshooting that we ask the user "what is the qemu
command line", and they can get that from the libvirt log file or
through "ps".

So we need to consider this and make sure that everything is changed
so we don't regress.  libguestfs will need substantial changes and
libvirt must dump the full configuration (qinfo or whatever) to the
log file.

I don't really disagreee with anything else you wrote however.

Rich.


libguestfs example:

/usr/bin/qemu-kvm \
    -global virtio-blk-pci.scsi=off \
    -no-user-config \
    -nodefaults \
    -display none \
    -machine accel=kvm:tcg,graphics=off \
    -cpu max \
    -m 1280 \
    -no-reboot \
    -rtc driftfix=slew \
    -no-hpet \
    -global kvm-pit.lost_tick_policy=discard \
    -kernel /var/tmp/.guestfs-1000/appliance.d/kernel \
    -initrd /var/tmp/.guestfs-1000/appliance.d/initrd \
    -object rng-random,filename=/dev/urandom,id=rng0 \
    -device virtio-rng-pci,rng=rng0 \
    -device virtio-scsi-pci,id=scsi \
    -drive file=/tmp/libguestfs9bBO1w/scratch1.img,cache=unsafe,format=raw,id=hd0,if=none \
    -device scsi-hd,drive=hd0 \
    -drive file=/var/tmp/.guestfs-1000/appliance.d/root,snapshot=on,id=appliance,cache=unsafe,if=none \
    -device scsi-hd,drive=appliance \
    -device virtio-serial-pci \
    -serial stdio \
    -chardev socket,path=/run/user/1000/libguestfsGIlAlu/guestfsd.sock,id=channel0 \
    -device virtserialport,chardev=channel0,name=org.libguestfs.channel.0 \
    -append "panic=1 console=ttyS0 edd=off udevtimeout=6000 udev.event-timeout=6000 no_timer_check printk.time=1 cgroup_disable=memory usbcore.nousb cryptomgr.notests tsc=reliable 8250.nr_uarts=1 root=UUID=9e6e8889-f991-45a3-bb41-67acebe7b062 selinux=0 guestfs_verbose=1 TERM=xterm-256color"


-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


