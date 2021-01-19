Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF522FB4ED
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 10:33:30 +0100 (CET)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1nOC-0002xF-U7
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 04:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1nMX-0002MN-G9
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 04:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1nMU-0004Lx-0f
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 04:31:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611048699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xulv5qrwxLW33dgl698lNJ3S8VNsLvKeCSoAliN+00Q=;
 b=WLVgi0kZYwNJxvKv1SExsK80UYNXHAoj9KKXfLccsVugWdCTxtzj5/AkHpuvCgFCx3azrc
 T7pcDuEW+XBBQATvQ/KeCsXm6gqwol+pUpfOHhhNBr4LYAddjXTkxQRBoS22LE1XamrCz5
 5nupxt8Rbb1Yzj4tB0+XvUpNTLoSZow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-CssNfIJaMfuScwP84PLyXA-1; Tue, 19 Jan 2021 04:31:35 -0500
X-MC-Unique: CssNfIJaMfuScwP84PLyXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3735859;
 Tue, 19 Jan 2021 09:31:33 +0000 (UTC)
Received: from work-vm (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FFAC27C2E;
 Tue, 19 Jan 2021 09:31:26 +0000 (UTC)
Date: Tue, 19 Jan 2021 09:31:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2 02/20] hw/core/qdev: Add
 vmstate_qdev_no_state_to_migrate
Message-ID: <20210119093123.GB3008@work-vm>
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-3-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210117192446.23753-3-f4bug@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> Add vmstate_qdev_no_state_to_migrate, which is simply a
> pointer to vmstate_no_state_to_migrate. This way all
> qdev devices (including "hw/qdev-core.h") don't have to
> include "migration/vmstate.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Unresolved issues:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg721695.html
> Peter:
> > Does this definitely not put any data into the migration stream?
> > We don't want to change what's on the wire for machines that
> > use devices that start using this. (If it does by default, it
> > would be easy to make the migration code special case the
> > magic symbol to act like "no vmsd specified").
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg727634.html
> Dave:
> > I'd need to test it to be sure, but I think if we added a .needed
> > to vmstate_no_state_to_migrate with a function that always returned
> > false, then I think the stream would stay unchanged.

Yes I still think you need that; if you only use this for base classes
rather than devices themselves you're probably OK; but if you use it on
a device I think you'll end up with an empty-state entry in the
migration stream.

Dave

> ---
>  include/hw/qdev-core.h      | 2 ++
>  include/migration/vmstate.h | 1 +
>  hw/core/qdev.c              | 3 +++
>  migration/vmstate.c         | 7 +++++++
>  stubs/vmstate.c             | 7 +++++++
>  5 files changed, 20 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bafc311bfa1..d2c7a46e6a2 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -140,6 +140,8 @@ struct DeviceClass {
>      const char *bus_type;
>  };
>  
> +extern const VMStateDescription *vmstate_qdev_no_state_to_migrate;
> +
>  typedef struct NamedGPIOList NamedGPIOList;
>  
>  struct NamedGPIOList {
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index dda65c9987d..50559598eac 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -197,6 +197,7 @@ struct VMStateDescription {
>  #if defined(CONFIG_USER_ONLY)
>  extern const VMStateDescription vmstate_user_mode_cpu_dummy;
>  #endif
> +extern const VMStateDescription vmstate_no_state_to_migrate;
>  
>  extern const VMStateInfo vmstate_info_bool;
>  
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a9..f0d0afd438d 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -44,6 +44,9 @@
>  static bool qdev_hot_added = false;
>  bool qdev_hot_removed = false;
>  
> +const VMStateDescription *vmstate_qdev_no_state_to_migrate =
> +        &vmstate_no_state_to_migrate;
> +
>  const VMStateDescription *qdev_get_vmsd(DeviceState *dev)
>  {
>      DeviceClass *dc = DEVICE_GET_CLASS(dev);
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index 05f87cdddc5..2c373774dfa 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -20,6 +20,13 @@
>  #include "qemu/error-report.h"
>  #include "trace.h"
>  
> +const VMStateDescription vmstate_no_state_to_migrate = {
> +    .name = "empty-state",
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
>                                     void *opaque, JSONWriter *vmdesc);
>  static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
> diff --git a/stubs/vmstate.c b/stubs/vmstate.c
> index 8da777a1fb4..f561f9f39bd 100644
> --- a/stubs/vmstate.c
> +++ b/stubs/vmstate.c
> @@ -5,6 +5,13 @@
>  const VMStateDescription vmstate_user_mode_cpu_dummy = {};
>  #endif
>  
> +const VMStateDescription vmstate_no_state_to_migrate = {
> +    .name = "empty-state",
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  int vmstate_register_with_alias_id(VMStateIf *obj,
>                                     uint32_t instance_id,
>                                     const VMStateDescription *vmsd,
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


