Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F60284CB9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 15:54:14 +0200 (CEST)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPnPx-0005zb-0A
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 09:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgolembi@redhat.com>)
 id 1kPnP6-0005SO-9c
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 09:53:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tgolembi@redhat.com>)
 id 1kPnP3-0000et-OJ
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 09:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601992396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t1pvemBItVvFFb3QmfEiix9T7p015TdoaofXYhZBfzY=;
 b=dLUiXnfRtKVgYjO+LmzX7W3bv9ujOZeXaIFSpQKdsXLIQYlUlLQiKswW/hDXuyg0mwqX41
 FCcI/K6RAjO93si0tdw+mpSKHPDszfLfWI5n9pifluTW6wjlwi7jpjSi8vo1Q1xGSec2j1
 BRMUXIuw8HpMx9byvvDwuJNQhvORCnc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-syJrHV4RNfmKKQLUrD34zw-1; Tue, 06 Oct 2020 09:53:12 -0400
X-MC-Unique: syJrHV4RNfmKKQLUrD34zw-1
Received: by mail-wr1-f70.google.com with SMTP id r16so5357392wrm.18
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 06:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=t1pvemBItVvFFb3QmfEiix9T7p015TdoaofXYhZBfzY=;
 b=icCRtwQESrevdUI1FmWNjAJCNz1dD16cWkfIuMhjvApN/s6CSIp6Q0rO4Yz0xyZ7kJ
 i/OspDIBev7lMq5wH22yP8dGug/XWITJyJ4mjBIEzXG70L26BiSdirqBojGeXvmFgxRc
 xPA+2RYRI17xa4WEt9gFba9/YfhrTOlu7ZZfHJDLvfWUFgrz16v5WlqV7KYhhrinNDf/
 4fiW+35o5J0KkNUfj2I6w+94LALEoUwYiVtXlWHZDhFW7GPjG33GBdD8vaLt9WMeepgL
 6LTKZoT/oARJ5TUat/29GrN4cAUlZm9BtmrEE1W0CR5Cufr0w8kjg6fGlIXLR6EUyCH5
 YpRA==
X-Gm-Message-State: AOAM530LsE31ILD0n5wRynBY9M5qfNj4uNmtgzBopCGo4dSxczVaq4s5
 mqFxExmhU55s4hjiA10hBHrgQs0Da2sNg2BuJTozlXDRjQQ5n+a2IFGvN9dQZjCNc5QC1dwUOCA
 Plcp8Ap1iWwgrv64=
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr4929924wrj.94.1601992391264; 
 Tue, 06 Oct 2020 06:53:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydKoAxpW7VW3M8G/f0PBaVrAK6HlZIscqpO0q+kjX5j+Eiq+jV/dmXBa5FKN+zKep2ohKjcQ==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr4929903wrj.94.1601992390959; 
 Tue, 06 Oct 2020 06:53:10 -0700 (PDT)
Received: from auriga.localdomain (ip-89-176-41-222.net.upcbroadband.cz.
 [89.176.41.222])
 by smtp.gmail.com with ESMTPSA id l5sm2090061wrq.14.2020.10.06.06.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 06:53:10 -0700 (PDT)
Date: Tue, 6 Oct 2020 15:53:08 +0200
From: =?utf-8?B?VG9tw6HFoSBHb2xlbWJpb3Zza8O9?= <tgolembi@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 1/3] qga: add command guest-get-disks
Message-ID: <20201006135308.s2ynlg2lkzifjmmd@auriga.localdomain>
References: <cover.1599470071.git.tgolembi@redhat.com>
 <d8573ee72572ba586c285472789243b37527e2b9.1599470071.git.tgolembi@redhat.com>
 <20201006083632.GD2482221@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201006083632.GD2482221@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tgolembi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=tgolembi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 06, 2020 at 09:36:32AM +0100, Daniel P. Berrangé wrote:
> On Mon, Sep 07, 2020 at 11:14:40AM +0200, Tomáš Golembiovský wrote:
> > Add API and stubs for new guest-get-disks command.
> > 
> > The command guest-get-fsinfo can be used to list information about disks
> > and partitions but it is limited only to mounted disks with filesystem.
> > This new command should allow listing information about disks of the VM
> > regardles whether they are mounted or not. This can be usefull for
> > management applications for mapping virtualized devices or pass-through
> > devices to device names in the guest OS.
> > 
> > Signed-off-by: Tomáš Golembiovský <tgolembi@redhat.com>
> > ---
> >  qga/commands-posix.c |  6 ++++++
> >  qga/commands-win32.c |  6 ++++++
> >  qga/qapi-schema.json | 29 +++++++++++++++++++++++++++++
> >  3 files changed, 41 insertions(+)
> > 
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index 744c2b5a5d..f99731af51 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -3042,3 +3042,9 @@ GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
> >  
> >      return info;
> >  }
> > +
> > +GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
> > +{
> > +    error_setg(errp, QERR_UNSUPPORTED);
> > +    return NULL;
> > +}
> > diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> > index aaa71f147b..e9976a0c46 100644
> > --- a/qga/commands-win32.c
> > +++ b/qga/commands-win32.c
> > @@ -2229,3 +2229,9 @@ GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
> >  
> >      return info;
> >  }
> > +
> > +GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
> > +{
> > +    error_setg(errp, QERR_UNSUPPORTED);
> > +    return NULL;
> > +}
> > diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> > index 408a662ea5..70b54e0d07 100644
> > --- a/qga/qapi-schema.json
> > +++ b/qga/qapi-schema.json
> > @@ -862,6 +862,35 @@
> >             'bus': 'int', 'target': 'int', 'unit': 'int',
> >             '*serial': 'str', '*dev': 'str'} }
> >  
> > +##
> > +# @GuestDiskInfo:
> > +#
> > +# @name: device node (Linux) or device UNC (Windows)
> > +# @partition: whether this is a partition or disk
> > +# @slaves: list of slave devices (Linux)
> 
> What are "slave devices" ?

That is how Linux calls dependent devices. E.g. PVs in your LVM setup
are considered "slaves" to your LVs. Or if you have LUKS volume called
"foo" on your "bar" drive then "bar" would be listed as a "slave" for
"foo".

The dependency is in the opposite direction then I have always pictured
it in my had, but I guess that there are reasons for that.

> For that matter, please don't use the term "slaves" at all in any
> new code.

Fair enough... so how shall we call those devices? Dependents,
dependencies, parents... ? Ideas welcome.

    Tomas

> 
> > +# @address: disk address information (only for non-virtual devices)
> > +# @alias: optional alias assigned to the disk, on Linux this is a name assigned
> > +#         by device mapper
> > +#
> > +# Since 5.2
> > +##
> > +{ 'struct': 'GuestDiskInfo',
> > +  'data': {'name': 'str', 'partition': 'bool', 'slaves': ['str'],
> > +           '*address': 'GuestDiskAddress', '*alias': 'str'} }
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
> 

-- 
Tomáš Golembiovský <tgolembi@redhat.com>


