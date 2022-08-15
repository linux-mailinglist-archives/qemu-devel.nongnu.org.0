Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2A55935BF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 20:37:46 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNey8-0003mm-PG
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 14:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oNesV-0000mZ-Ol
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 14:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oNesP-0001KV-He
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 14:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660588308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P9ci/siF1L7f4MmlIvyg2KHT3ajSj+0NJ3DupExOg2k=;
 b=M7YmzOCMS+ii0m6IcnZZbHFTJPqfNI8nX7fmIgmJsETVOeaLGwGMuXXBWcRXGjt90cIIzV
 HdJ+Cf/iHty9yj3Kz5azWgKPXsB8iVTBD90k6gpZr/a/vqGF8bZMjqF4fwIOwjBhDfwTWh
 Jmxj0mVbzviDbqfxitdPn5Zf1wpgwL4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-BgbMNOzkN5eIkA2QprVJIg-1; Mon, 15 Aug 2022 14:31:46 -0400
X-MC-Unique: BgbMNOzkN5eIkA2QprVJIg-1
Received: by mail-wm1-f72.google.com with SMTP id
 133-20020a1c028b000000b003a5f307844bso1076360wmc.2
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 11:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=P9ci/siF1L7f4MmlIvyg2KHT3ajSj+0NJ3DupExOg2k=;
 b=X/fauJqfa79ZnYSUK4LFz1wRrqrySZcSjU4K2je0pY7ufo0wIh5KLmiBkfPEVrFGnV
 mq+9e7w7YSGPIv3lhPSTKH53+D9cSg80dv8vbwO02Oz0khab8Y9Kh/rrIj02SDjy/Ith
 EMxPrp3KSkFhVAqO5mcVsIGgi51DbgvBFUKyQTuS6uNexd2sx+lc1LPwJtW+bcTwWlwp
 iknXTYLfxXni8/Ix108Yi0luC3+YR74w8wI5em3s49Vka8GRWDIj/Ecknm2YPMBmwAfn
 q4oiGU5AlST6B90daPe8BcEFMVI3b3hvt5TmoEK+xn8UkXzOqtG8WZDsOqg0tglCJSKT
 TAnw==
X-Gm-Message-State: ACgBeo2HyZrN2VwyKvLc3Yx428RJZpZnLG5WWU+R/TiSF4M8WsBX4ab4
 WDrDFUCPZphPo7CahBm0nOAgiKKxLUg16oAZe1i/SOfmgnDVPASrylF3QQBNZ7Uq3uMaH8VqEpK
 wdbWUDoYfeUUKDu8=
X-Received: by 2002:a05:600c:198e:b0:3a5:d4a2:8896 with SMTP id
 t14-20020a05600c198e00b003a5d4a28896mr8850118wmq.140.1660588305545; 
 Mon, 15 Aug 2022 11:31:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7IYRGuSzDdsMmhTlizqUHe72Plot1PMLFQiTQgTupvrhmeUxTKJSoHB5cLkSHAjnVuOlm6TA==
X-Received: by 2002:a05:600c:198e:b0:3a5:d4a2:8896 with SMTP id
 t14-20020a05600c198e00b003a5d4a28896mr8850100wmq.140.1660588305215; 
 Mon, 15 Aug 2022 11:31:45 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q18-20020adff952000000b00222ed7ea203sm7821569wrr.100.2022.08.15.11.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:31:44 -0700 (PDT)
Date: Mon, 15 Aug 2022 19:31:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 alistair.francis@wdc.com
Subject: Re: [PATCH for-7.2 v2 14/20] qmp/hmp, device_tree.c: introduce dumpdtb
Message-ID: <YvqRDrU3hW6Erl6e@work-vm>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-15-danielhb413@gmail.com>
 <YvCDY6PCvMWG5rnr@yekko>
 <7a5a55f5-2e60-e34b-f84a-85ae4c122f7f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a5a55f5-2e60-e34b-f84a-85ae4c122f7f@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Daniel Henrique Barboza (danielhb413@gmail.com) wrote:
> 
> 
> On 8/8/22 00:30, David Gibson wrote:
> > On Fri, Aug 05, 2022 at 06:39:42AM -0300, Daniel Henrique Barboza wrote:
> > > To save the FDT blob we have the '-machine dumpdtb=<file>' property.
> > > With this property set, the machine saves the FDT in <file> and exit.
> > > The created file can then be converted to plain text dts format using
> > > 'dtc'.
> > > 
> > > There's nothing particularly sophisticated into saving the FDT that
> > > can't be done with the machine at any state, as long as the machine has
> > > a valid FDT to be saved.
> > > 
> > > The 'dumpdtb' command receives a 'filename' paramenter and, if a valid
> > > FDT is available, it'll save it in a file 'filename'. In short, this is
> > > a '-machine dumpdtb' that can be fired on demand via QMP/HMP.
> > > 
> > > A valid FDT consists of a FDT that was created using libfdt being
> > > retrieved via 'current_machine->fdt' in device_tree.c. This condition is
> > > met by most FDT users in QEMU.
> > 
> > On spapr at least, the fdt can change at runtime (due to hotplugs).
> > So we need to think about concurrency between fdt updates and dumping
> > it with this command.  I'm assuming it's protected by the BQL, but I'm
> > wondering if we should outright state that somewhere for clarity.
> 
> Your assumption is right. It is protected by BQL since it's always executed
> in-band. To not hold BQL we would need to declare an extra flag "allow-oob"
> to execute the command out-of-band.
> 
> I'll mention in the commit msg that we're holding BQL. I'll do the same for
> the 'info fdt' commit msg.

Is the update of the FDT also protected that way?
(I guess hotplug commands are also protected by the bql - but is the
hotplug completion?)

Dave
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> > 
> > > 
> > > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   hmp-commands.hx              | 13 +++++++++++++
> > >   include/monitor/hmp.h        |  1 +
> > >   include/sysemu/device_tree.h |  1 +
> > >   monitor/hmp-cmds.c           | 12 ++++++++++++
> > >   monitor/qmp-cmds.c           | 13 +++++++++++++
> > >   qapi/machine.json            | 17 +++++++++++++++++
> > >   softmmu/device_tree.c        | 18 ++++++++++++++++++
> > >   7 files changed, 75 insertions(+)
> > > 
> > > diff --git a/hmp-commands.hx b/hmp-commands.hx
> > > index 182e639d14..d2554e9701 100644
> > > --- a/hmp-commands.hx
> > > +++ b/hmp-commands.hx
> > > @@ -1800,3 +1800,16 @@ ERST
> > >                         "\n\t\t\t\t\t limit on a specified virtual cpu",
> > >           .cmd        = hmp_cancel_vcpu_dirty_limit,
> > >       },
> > > +
> > > +SRST
> > > +``dumpdtb`` *filename*
> > > +  Save the FDT in the 'filename' file to be decoded using dtc.
> > > +  Requires 'libfdt' support.
> > > +ERST
> > > +    {
> > > +        .name       = "dumpdtb",
> > > +        .args_type  = "filename:s",
> > > +        .params     = "[filename] file to save the FDT",
> > > +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
> > > +        .cmd        = hmp_dumpdtb,
> > > +    },
> > > diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> > > index a618eb1e4e..d7f324da59 100644
> > > --- a/include/monitor/hmp.h
> > > +++ b/include/monitor/hmp.h
> > > @@ -134,6 +134,7 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
> > >   void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> > >   void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> > >   void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> > > +void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
> > >   void hmp_human_readable_text_helper(Monitor *mon,
> > >                                       HumanReadableText *(*qmp_handler)(Error **));
> > >   void hmp_info_stats(Monitor *mon, const QDict *qdict);
> > > diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> > > index ef060a9759..bf7684e4ed 100644
> > > --- a/include/sysemu/device_tree.h
> > > +++ b/include/sysemu/device_tree.h
> > > @@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
> > >       } while (0)
> > >   void qemu_fdt_dumpdtb(void *fdt, int size);
> > > +void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
> > >   /**
> > >    * qemu_fdt_setprop_sized_cells_from_array:
> > > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > > index c6cd6f91dd..d23ec85f9d 100644
> > > --- a/monitor/hmp-cmds.c
> > > +++ b/monitor/hmp-cmds.c
> > > @@ -2472,3 +2472,15 @@ exit:
> > >   exit_no_print:
> > >       error_free(err);
> > >   }
> > > +
> > > +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
> > > +{
> > > +    const char *filename = qdict_get_str(qdict, "filename");
> > > +    Error *local_err = NULL;
> > > +
> > > +    qmp_dumpdtb(filename, &local_err);
> > > +
> > > +    if (local_err) {
> > > +        error_report_err(local_err);
> > > +    }
> > > +}
> > > diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> > > index 7314cd813d..8415aca08c 100644
> > > --- a/monitor/qmp-cmds.c
> > > +++ b/monitor/qmp-cmds.c
> > > @@ -45,6 +45,7 @@
> > >   #include "hw/intc/intc.h"
> > >   #include "hw/rdma/rdma.h"
> > >   #include "monitor/stats.h"
> > > +#include "sysemu/device_tree.h"
> > >   NameInfo *qmp_query_name(Error **errp)
> > >   {
> > > @@ -596,3 +597,15 @@ bool apply_str_list_filter(const char *string, strList *list)
> > >       }
> > >       return false;
> > >   }
> > > +
> > > +#ifdef CONFIG_FDT
> > > +void qmp_dumpdtb(const char *filename, Error **errp)
> > > +{
> > > +    return qemu_fdt_qmp_dumpdtb(filename, errp);
> > > +}
> > > +#else
> > > +void qmp_dumpdtb(const char *filename, Error **errp)
> > > +{
> > > +    error_setg(errp, "dumpdtb requires libfdt");
> > > +}
> > > +#endif
> > > diff --git a/qapi/machine.json b/qapi/machine.json
> > > index 6afd1936b0..aeb013f3dd 100644
> > > --- a/qapi/machine.json
> > > +++ b/qapi/machine.json
> > > @@ -1664,3 +1664,20 @@
> > >        '*size': 'size',
> > >        '*max-size': 'size',
> > >        '*slots': 'uint64' } }
> > > +
> > > +##
> > > +# @dumpdtb:
> > > +#
> > > +# Save the FDT in dtb format. Requires 'libfdt' support.
> > > +#
> > > +# @filename: name of the FDT file to be created
> > > +#
> > > +# Since: 7.2
> > > +#
> > > +# Example:
> > > +#   {"execute": "dumpdtb"}
> > > +#    "arguments": { "filename": "/tmp/fdt.dtb" } }
> > > +#
> > > +##
> > > +{ 'command': 'dumpdtb',
> > > +  'data': { 'filename': 'str' } }
> > > diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> > > index 6ca3fad285..cd487ddd4d 100644
> > > --- a/softmmu/device_tree.c
> > > +++ b/softmmu/device_tree.c
> > > @@ -643,3 +643,21 @@ out:
> > >       g_free(propcells);
> > >       return ret;
> > >   }
> > > +
> > > +void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
> > > +{
> > > +    int size;
> > > +
> > > +    if (!current_machine->fdt) {
> > > +        error_setg(errp, "Unable to find the machine FDT");
> > > +        return;
> > > +    }
> > > +
> > > +    size = fdt_totalsize(current_machine->fdt);
> > > +
> > > +    if (g_file_set_contents(filename, current_machine->fdt, size, NULL)) {
> > > +        return;
> > > +    }
> > > +
> > > +    error_setg(errp, "Error when saving machine FDT to file %s", filename);
> > > +}
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


