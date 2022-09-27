Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C05ED000
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 00:06:11 +0200 (CEST)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odIiQ-0006aG-Cw
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 18:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <awilliam@redhat.com>)
 id 1odIfc-0003dt-2D
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 18:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <awilliam@redhat.com>)
 id 1odIfR-0002mi-1M
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 18:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664316181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vo1yNSNrnS1UBEWwDsVsS/FzwoJPWdFYXgEFLXiepXI=;
 b=hgZKFnAokAUjtZG/9F4rZJE82396xFS2vNnpgdf6kR7pVTDSbmgr869GREj3Gsios41S7n
 HTKVDXnxZsjyR1AOIAKggq3cgOo57ttgITYyo0kuBtiqbZo/tz4rNxPL5ABynJtEoNyrW3
 CnUt8KuACN3n0aSNu+eD275P2vRmAcM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-ly_UtN96OBimgezRRyvkTw-1; Tue, 27 Sep 2022 18:01:49 -0400
X-MC-Unique: ly_UtN96OBimgezRRyvkTw-1
Received: by mail-pl1-f199.google.com with SMTP id
 y16-20020a17090322d000b0017848b6f556so7037635plg.19
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 15:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date;
 bh=vo1yNSNrnS1UBEWwDsVsS/FzwoJPWdFYXgEFLXiepXI=;
 b=GosabYvtybaVvC0+0Lc40mdtLG1T1d9seyORoZvs6XVNjyPS5MNOCXcjmNdPpbkLGA
 c27CseO0VkXcERJwI86oSdKoKbc7x5spjIc6QVqKWr29Og0BuS5UBMyHAZ0sOXr0BndH
 kf5ZansoNlCN7MCufZza9nMla6d/TIzYUVWvEwbY3hyKXmVbMSWgN94pbUOiwrB5wGUU
 drGKVnUq2jKBf+0n0KevQKaSvLhqEvedVn+SY/dE9RJHjI47KsXbZJwAZpUtRGOxt9ee
 QYUGk01URT2HrUGs0wecO4RMzXIIfU5zCjytPRUkGabLczxgWlf+KMMYSlM4v9myEG+d
 0A9w==
X-Gm-Message-State: ACrzQf3P5KRUm+6x/evcCssuFghRDxXMO7LT67S9S5dRYJe+3i68Gugi
 /QgkbGAXtF9gtlkxcUQGkdddQ8HsYx+kFqW8+VdmyETq8u7jLIOk5jR6x+GL63VNaGunB27z8mL
 kuVf+AAQHU6gf0w==
X-Received: by 2002:a17:90a:8b92:b0:202:c361:9dba with SMTP id
 z18-20020a17090a8b9200b00202c3619dbamr6594226pjn.62.1664316108795; 
 Tue, 27 Sep 2022 15:01:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7VWnj8ytxyOdGAiWtggE0Q+T2QgjyTnb8PnFEfe3ovS547Q6mVGnpW2pDALKo/15RbUQlkJA==
X-Received: by 2002:a17:90a:8b92:b0:202:c361:9dba with SMTP id
 z18-20020a17090a8b9200b00202c3619dbamr6594197pjn.62.1664316108424; 
 Tue, 27 Sep 2022 15:01:48 -0700 (PDT)
Received: from t16.happyassassin.net (d172-218-245-5.bchsia.telus.net.
 [172.218.245.5]) by smtp.gmail.com with ESMTPSA id
 e13-20020a170902784d00b0015e8d4eb26esm2046558pln.184.2022.09.27.15.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 15:01:47 -0700 (PDT)
Message-ID: <c54fcd41ece548c72e9058300d0fc19f022cd7f0.camel@redhat.com>
Subject: Re: qemu and -vga vs. -device
From: Adam Williamson <awilliam@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Gerd Hoffmann
 <kraxel@redhat.com>
Cc: qemu-ppc@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Date: Tue, 27 Sep 2022 15:01:45 -0700
In-Reply-To: <c6897368-1d0c-dca9-218c-91709a4b27fc@gmail.com>
References: <b773b085e1a3bda7aae1b6498216c416b30843bc.camel@redhat.com>
 <20220919044209.u7iy4c6zaibgtlpc@sirius.home.kraxel.org>
 <3aae1641f95503b40341c1130194a19e5e156b51.camel@redhat.com>
 <20220926092649.yjly7pkejttcqdlc@sirius.home.kraxel.org>
 <c6897368-1d0c-dca9-218c-91709a4b27fc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 (by Flathub.org)) 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=awilliam@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-09-27 at 13:34 -0300, Daniel Henrique Barboza wrote:
> Hi Adam,
>=20
> On 9/26/22 06:26, Gerd Hoffmann wrote:
> > On Sat, Sep 24, 2022 at 12:12:45AM -0700, Adam Williamson wrote:
> > > On Mon, 2022-09-19 at 06:42 +0200, Gerd Hoffmann wrote:
> > > > On Fri, Sep 16, 2022 at 10:02:17AM -0700, Adam Williamson wrote:
> > > > > Hi Gerd!
> > > > >=20
> > > > > I'm working on a patch to revise how openQA sets video devices in=
 qemu.
> > > > > In that context, a question: if we always want to specify a singl=
e
> > > > > video device with `-device` (e.g. `-device VGA` or `-device virti=
o-
> > > > > vga`), should we also specify `-vga none` to ensure qemu doesn't =
also
> > > > > include another adapter as a default for the -vga arg?
> > > >=20
> > > > Doesn't hurt to include it.  In theory it should not be needed, qem=
u has
> > > > a list of vga devices and in case '-device $vga' is found on the co=
mmand
> > > > line will turn off the default vga device automatically.  In practi=
ce
> > > > there are qemu versions where this list is not complete, so it
> > > > sometimes doesn't work as intended.
> > > >=20
> > > > Alternatively use '-nodefaults' which will disable all automaticall=
y
> > > > added devices (vga, nic, cdrom, ...).
> > >=20
> > > Thanks Gerd!
> > >=20
> > > So, I got around to testing this today, and found something
> > > interesting. On ppc64le, adding `-vga none` seems to break things.
> > > Booting a Fedora installer ISO, which should show the boot menu with =
a
> > > 60 second timeout then boot to the installer, if we run the VM with `=
-
> > > vga std`, we see the bootloader. If we run it with `-device VGA` and =
no
> > > `-vga` arg, we see the bootloader. But if we run qemu with `-vga none=
 -
> > > device VGA`, we don't see the bootloader. The system just sits at the
> > > OFW init screen apparently forever (I thought it might actually be
> > > running in the background and recover to anaconda after the 60 second
> > > boot timeout, but it doesn't seem to).
> > >=20
> > > Not sure what's going on there, but thought you might be interested.
>=20
> Can you please send the full command line you're using?

Hi Daniel! Here it is:

/usr/bin/qemu-system-ppc64 -vga none -device VGA,edid=3Don,xres=3D1024,yres=
=3D768 -g 1024x768 -only-migratable -chardev ringbuf,id=3Dserial0,logfile=
=3Dserial0,logappend=3Don -serial chardev:serial0 -audiodev none,id=3Dsnd0 =
-device intel-hda -device hda-output,audiodev=3Dsnd0 -global isa-fdc.fdtype=
A=3Dnone -m 4096 -machine usb=3Doff,cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap=
-ibs=3Dbroken,cap-ccf-assist=3Doff -cpu host -netdev user,id=3Dqanet0,net=
=3D172.16.2.0/24 -device virtio-net,netdev=3Dqanet0,mac=3D52:54:00:12:34:56=
 -object rng-random,filename=3D/dev/urandom,id=3Drng0 -device virtio-rng-pc=
i,rng=3Drng0 -boot once=3Dd -device nec-usb-xhci -device usb-tablet -device=
 usb-kbd -smp 1 -enable-kvm -no-shutdown -vnc :99,share=3Dforce-shared -dev=
ice virtio-serial -chardev pipe,id=3Dvirtio_console,path=3Dvirtio_console,l=
ogfile=3Dvirtio_console.log,logappend=3Don -device virtconsole,chardev=3Dvi=
rtio_console,name=3Dorg.openqa.console.virtio_console -chardev pipe,id=3Dvi=
rtio_console1,path=3Dvirtio_console1,logfile=3Dvirtio_console1.log,logappen=
d=3Don -device virtconsole,chardev=3Dvirtio_console1,name=3Dorg.openqa.cons=
ole.virtio_console1 -chardev socket,path=3Dqmp_socket,server=3Don,wait=3Dof=
f,id=3Dqmp_socket,logfile=3Dqmp_socket.log,logappend=3Don -qmp chardev:qmp_=
socket -S -device virtio-scsi-pci,id=3Dscsi0 -blockdev driver=3Dfile,node-n=
ame=3Dhd0-file,filename=3D/var/lib/openqa/pool/9/raid/hd0,cache.no-flush=3D=
on -blockdev driver=3Dqcow2,node-name=3Dhd0,file=3Dhd0-file,cache.no-flush=
=3Don,discard=3Dunmap -device virtio-blk,id=3Dhd0-device,drive=3Dhd0,serial=
=3Dhd0 -blockdev driver=3Dfile,node-name=3Dcd0-overlay0-file,filename=3D/va=
r/lib/openqa/pool/9/raid/cd0-overlay0,cache.no-flush=3Don -blockdev driver=
=3Dqcow2,node-name=3Dcd0-overlay0,file=3Dcd0-overlay0-file,cache.no-flush=
=3Don,discard=3Dunmap -device scsi-cd,id=3Dcd0-device,drive=3Dcd0-overlay0,=
serial=3Dcd0

the version without `-vga none` would be literally exactly the same but
without that one option.

Note, it looks like I was just a bit impatient in my manual trials;
looking at some jobs that ran today, they did eventually clear to the
Fedora installer GUI after about 90-120 seconds. But they definitely
don't show the bootloader (which our test system expects to see, so the
test fails). When run without the `-vga none` part, the bootloader is
shown at the same resolution and using the same fonts as the OFW
interface.
>=20
> I'm actually surprised that you can combo '-vga none -display VGA' togeth=
er
> in the command line is executed without a parse error.

I found various past mailing list discussions suggesting this is a good
idea just to ensure qemu doesn't add the 'default' device (so far as
the `-vga` arg is concerned) to the specified video device. Gerd didn't
see any problem with doing it when I asked him, either.
>=20
> This also works, which is also surprising to me:
>=20
>=20
> (launches the process with the 'curses' display)
> ./qemu-system-ppc64 -M pseries -display none -display curses
>=20
>=20
> (launches with the 'none' display)
> ./qemu-system-ppc64 -M pseries -display curses -display none
>=20
>=20
> It seems that we're considering just the last entry as valid.
>=20
> Should I send a patch to make QEMU error out when multiple '-display'
> options are present in the command line?

The behaviour you describe there is probably what I expect, or at least
prefer. That's how I'd design it if I had to choose. The advantage of
this "when multiple specifications given for an arg that can take only
one, use the last one given" behaviour is it allows for overriding. Say
you have a tool that usually runs "qemu -vga std" but wants to allow
the user to override it; it's much easier to implement that if qemu
takes the last-specified entry, because you can just dump the "user
overriden" args at the end, and be confident that they'll "win". If
qemu doesn't do that but errors out, your tool has to carefully remove
its "default" specifications for any arg that the user wanted to
override.

It's definitely behavior I've seen other CLI tools use and it makes
sense to me.
--=20
Adam Williamson
Fedora QA
IRC: adamw | Twitter: adamw_ha
https://www.happyassassin.net



