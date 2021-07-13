Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD46C3C79FA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 01:11:35 +0200 (CEST)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3RYs-00081Q-CN
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 19:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3RXU-0007Fq-PY
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 19:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3RXR-0005uC-7T
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 19:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626217803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GIzrwKNNQUHu2b7nK8DkQEZ6DBCMoCSR+y2eDTi84U=;
 b=OHoAKqWIcdQP99XHEk8T+DQI/NwhDIqSapFcG9ECuH/XwB7ret+r2MSP7ITMg3uUWAMZsR
 5eFIPeSvWhUb8Xw62DIPD/DfnN6HFIVe3nx6RsaIWoqI8/m61QYn+Fz8NYft/+pREW+Phl
 Fjp5rcRmOvRFiBuN0RxOHTPr+V4gIro=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-moiwpFSBMVamTV2yDuDX7Q-1; Tue, 13 Jul 2021 19:10:02 -0400
X-MC-Unique: moiwpFSBMVamTV2yDuDX7Q-1
Received: by mail-ot1-f72.google.com with SMTP id
 61-20020a9d08430000b02904b9e704387aso325775oty.12
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GIzrwKNNQUHu2b7nK8DkQEZ6DBCMoCSR+y2eDTi84U=;
 b=oMU2axu3J/AmWkr4gAldoILoLzuBkS9C66yk8Oojqx1jsRBqlC/lfMNSCUpIWQgGxo
 CKtalBVxZB+CNQGl3ft7AAAFM/3gDdX9Yy0WAHJtB1NZCygEfg9cwmi36YKUW/rFzY4u
 lfIQGyNMdm2ig6qofLPogsqqBPuUsKFobneowxVkTpbIr4o0o4/veTHuE+x4bJ0OwGVw
 IJLdt5eekBSmC7fB/rLMmZZjXwOk5RaSuWyg4S8Z3zeZewjLWxJYCUmsI6N4orgKm7he
 DWJ4XKaPfXAqnnp9SbbuyeFEMl80MtB7FpaMkHTDNZoKvreerHLjP2JcdTTebMZvaI3t
 yA8w==
X-Gm-Message-State: AOAM530JByjtepVPa0TZM9jMxfHOoIyzK6vk4w+1QzqMulMCRyqt6cdp
 igyNwPKsO3lP1h3eZEKjO8aJA+YfiK+L5QZqLmiimhHcOhz3YdcDbzK5/jPAf7eXwrc27QX0Pgm
 JWsyyAOofE26FX5E=
X-Received: by 2002:a54:4815:: with SMTP id j21mr508364oij.152.1626217801708; 
 Tue, 13 Jul 2021 16:10:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSXs1cCzYOIRwTcvEGlCG2lTrEYll4qekTyjILvj1m0PlYYTTeJb9YrPn0vIyotXy5bvDOYQ==
X-Received: by 2002:a54:4815:: with SMTP id j21mr508351oij.152.1626217801483; 
 Tue, 13 Jul 2021 16:10:01 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id s2sm51518ooc.15.2021.07.13.16.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:10:01 -0700 (PDT)
Date: Tue, 13 Jul 2021 17:10:00 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 36/40] vl: switch -M parsing to keyval
Message-ID: <20210713171000.0e3447f9.alex.williamson@redhat.com>
In-Reply-To: <20210713134347.1dc8c4b7.alex.williamson@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
 <20210706100141.303960-37-pbonzini@redhat.com>
 <20210713134347.1dc8c4b7.alex.williamson@redhat.com>
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

On Tue, 13 Jul 2021 13:43:47 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Tue,  6 Jul 2021 12:01:37 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> > Switch from QemuOpts to keyval.  This enables the introduction
> > of non-scalar machine properties, and JSON syntax in the future.
> > 
> > For JSON syntax to be supported right now, we would have to
> > consider what would happen if string-based dictionaries (produced by
> > -M key=val) were to be merged with strongly-typed dictionaries
> > (produced by -M {'key': 123}).
> > 
> > The simplest way out is to never enter the situation, and only allow one
> > -M option when JSON syntax is in use.  However, we want options such as
> > -smp to become syntactic sugar for -M, and this is a problem; as soon
> > as -smp becomes a shortcut for -M, QEMU would forbid using -M '{....}'
> > together with -smp.  Therefore, allowing JSON syntax right now for -M
> > would be a forward-compatibility nightmare and it would be impossible
> > anyway to introduce -M incrementally in tools.
> > 
> > Instead, support for JSON syntax is delayed until after the main
> > options are converted to QOM compound properties.  These include -boot,
> > -acpitable, -smbios, -m, -semihosting-config, -rtc and -fw_cfg.  Once JSON
> > syntax is introduced, these options will _also_ be forbidden together
> > with -M '{...}'.
> > 
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  softmmu/vl.c | 315 ++++++++++++++++++++++++---------------------------
> >  1 file changed, 146 insertions(+), 169 deletions(-)  
> 
> This breaks the below long standing test VM.  libvirt log and xml
> provided below.  I'm using libvirt version 7.3.0.

A trivial reproducer:

qemu-system-x86_64 -blockdev '{"driver":"file","filename":"/usr/share/edk2/ovmf/OVMF_CODE.fd","node-name":"pflash0-storage","auto-read-only":true,"discard":"unmap"}' -blockdev '{"node-name":"pflash0-format","read-only":true,"driver":"raw","file":"pflash0-storage"}' -machine pc,pflash0=pflash0-format

backtrace:

#0  error_setg_internal
    (errp=0x7fffffffd6c8, src=0x55555618bc10 "../../home/alwillia/Work/qemu.git/qapi/qobject-input-visitor.c", line=172, func=0x55555618bf20 <__func__.27> "qobject_input_get_object", fmt=0x55555618bc98 "Parameter '%s' is missing") at ../../home/alwillia/Work/qemu.git/util/error.c:93
#1  0x0000555555f8d255 in qobject_input_get_object (qiv=0x5555569c59b0, name=0x555556920ef0 "drive", consume=true, errp=0x7fffffffd6c8) at ../../home/alwillia/Work/qemu.git/qapi/qobject-input-visitor.c:172
#2  0x0000555555f8d28b in qobject_input_get_keyval (qiv=0x5555569c59b0, name=0x555556920ef0 "drive", errp=0x7fffffffd6c8) at ../../home/alwillia/Work/qemu.git/qapi/qobject-input-visitor.c:184
#3  0x0000555555f8e3a9 in qobject_input_type_str_keyval (v=0x5555569c59b0, name=0x555556920ef0 "drive", obj=0x7fffffffd5a8, errp=0x7fffffffd6c8)
    at ../../home/alwillia/Work/qemu.git/qapi/qobject-input-visitor.c:551
#4  0x0000555555f59e51 in visit_type_str (v=0x5555569c59b0, name=0x555556920ef0 "drive", obj=0x7fffffffd5a8, errp=0x7fffffffd6c8) at ../../home/alwillia/Work/qemu.git/qapi/qapi-visit-core.c:337
#5  0x00005555558c3b70 in set_drive_helper (obj=0x5555569208a0, v=0x5555569c59b0, name=0x555556920ef0 "drive", opaque=0x5555564c8300 <pflash_cfi01_properties>, iothread=false, errp=0x7fffffffd6c8)
    at ../../home/alwillia/Work/qemu.git/hw/core/qdev-properties-system.c:97
#6  0x00005555558c3e0b in set_drive (obj=0x5555569208a0, v=0x5555569c59b0, name=0x555556920ef0 "drive", opaque=0x5555564c8300 <pflash_cfi01_properties>, errp=0x7fffffffd6c8)
    at ../../home/alwillia/Work/qemu.git/hw/core/qdev-properties-system.c:171
#7  0x0000555555edb821 in field_prop_set (obj=0x5555569208a0, v=0x5555569c59b0, name=0x555556920ef0 "drive", opaque=0x5555564c8300 <pflash_cfi01_properties>, errp=0x7fffffffd6c8)
    at ../../home/alwillia/Work/qemu.git/hw/core/qdev-properties.c:86
#8  0x0000555555eb7f15 in object_property_set (obj=0x5555569208a0, name=0x555556920ef0 "drive", v=0x5555569c59b0, errp=0x7fffffffd768) at ../../home/alwillia/Work/qemu.git/qom/object.c:1402
#9  0x0000555555ebad9e in property_set_alias (obj=0x55555683dde0, v=0x5555569c59b0, name=0x5555566fc8a0 "pflash0", opaque=0x555556920ed0, errp=0x7fffffffd768)
    at ../../home/alwillia/Work/qemu.git/qom/object.c:2695
#10 0x0000555555eb7f15 in object_property_set (obj=0x55555683dde0, name=0x5555566fc8a0 "pflash0", v=0x5555569c59b0, errp=0x7fffffffd7b8) at ../../home/alwillia/Work/qemu.git/qom/object.c:1402
#11 0x0000555555eb3aa3 in object_set_properties_from_qdict (obj=0x55555683dde0, qdict=0x5555566fa5b0, v=0x5555569c59b0, errp=0x5555565d9308 <error_fatal>)
    at ../../home/alwillia/Work/qemu.git/qom/object_interfaces.c:55
#12 0x0000555555eb3bc3 in object_set_properties_from_keyval (obj=0x55555683dde0, qdict=0x5555566fa5b0, from_json=false, errp=0x5555565d9308 <error_fatal>)
    at ../../home/alwillia/Work/qemu.git/qom/object_interfaces.c:79
#13 0x0000555555cb3f5f in qemu_apply_machine_options (qdict=0x5555566fa5b0) at ../../home/alwillia/Work/qemu.git/softmmu/vl.c:1833
#14 0x0000555555cb8606 in qemu_init (argc=7, argv=0x7fffffffdae8, envp=0x7fffffffdb28) at ../../home/alwillia/Work/qemu.git/softmmu/vl.c:3634
#15 0x00005555558326d1 in main (argc=7, argv=0x7fffffffdae8, envp=0x7fffffffdb28) at ../../home/alwillia/Work/qemu.git/softmmu/main.c:49


