Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9084ADCBF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:34:40 +0100 (CET)
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSVr-0004XK-JM
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:34:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHPw5-00025Y-Ph
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:49:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHPw3-0005fh-1Y
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644324570;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1F4B8cB38f1Ytji6LlBIXBlcf4xEm5i+8vFKSbQoONQ=;
 b=iW1nEUh9SN7U1e3DMCDlwHCD2GhrP56RtowjZm/echl+b1TLMYw9I4/oRhuBp56qhd4QmP
 DBf0u09w3f9MD6fkGF7Hvi761xQMEActJsp/1c7LrG4fhjyYvzPnys1MRaU70iZzRjs6hE
 +VOS85VkeXc7grYTJeCu21jTyLtMmPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596--6dL966FNB-g3uJkh1KWow-1; Tue, 08 Feb 2022 07:49:26 -0500
X-MC-Unique: -6dL966FNB-g3uJkh1KWow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 791C7344B0;
 Tue,  8 Feb 2022 12:49:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 896777B022;
 Tue,  8 Feb 2022 12:49:24 +0000 (UTC)
Date: Tue, 8 Feb 2022 12:49:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
Message-ID: <YgJmz6neLsF2n2u3@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <YgJWPzFczlDBJV/I@redhat.com>
 <77884339-2f51-1ad0-7461-abd79bb36ef1@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <77884339-2f51-1ad0-7461-abd79bb36ef1@ilande.co.uk>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 12:39:04PM +0000, Mark Cave-Ayland wrote:
> On 08/02/2022 11:38, Daniel P. Berrangé wrote:
> 
> > On Thu, Jan 27, 2022 at 08:54:02PM +0000, Mark Cave-Ayland wrote:
> > > This displays detailed information about the device registers and timers o aid
> > > debugging problems with timers and interrupts.
> > > 
> > > Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > ---
> > >   hmp-commands-info.hx | 12 ++++++
> > >   hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
> > >   2 files changed, 104 insertions(+)
> > > 
> > > diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> > > index e90f20a107..4e714e79a2 100644
> > > --- a/hmp-commands-info.hx
> > > +++ b/hmp-commands-info.hx
> > > @@ -879,3 +879,15 @@ SRST
> > >     ``info sgx``
> > >       Show intel SGX information.
> > >   ERST
> > > +
> > > +    {
> > > +        .name       = "via",
> > > +        .args_type  = "",
> > > +        .params     = "",
> > > +        .help       = "show guest 6522 VIA devices",
> > > +    },
> > > +
> > > +SRST
> > > +  ``info via``
> > > +    Show guest 6522 VIA devices.
> > > +ERST
> > > diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> > > index aaae195d63..cfa6a9c44b 100644
> > > --- a/hw/misc/mos6522.c
> > > +++ b/hw/misc/mos6522.c
> > > @@ -30,6 +30,8 @@
> > >   #include "hw/misc/mos6522.h"
> > >   #include "hw/qdev-properties.h"
> > >   #include "migration/vmstate.h"
> > > +#include "monitor/monitor.h"
> > > +#include "qapi/type-helpers.h"
> > >   #include "qemu/timer.h"
> > >   #include "qemu/cutils.h"
> > >   #include "qemu/log.h"
> > > @@ -415,6 +417,95 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
> > >       }
> > >   }
> > > +static int qmp_x_query_via_foreach(Object *obj, void *opaque)
> > 
> > 
> > > +
> > > +static HumanReadableText *qmp_x_query_via(Error **errp)
> > > +{
> > > +    g_autoptr(GString) buf = g_string_new("");
> > > +
> > > +    object_child_foreach_recursive(object_get_root(),
> > > +                                   qmp_x_query_via_foreach, buf);
> > > +
> > > +    return human_readable_text_from_str(buf);
> > > +}
> > 
> > This provides a code handler for a QMP command which is good,
> > but doesn't ever define the QMP command in the qapi/ schema.
> 
> First of all, thank you for writing the docs at https://www.qemu.org/docs/master/devel/writing-monitor-commands.html#writing-a-debugging-aid-returning-unstructured-text
> which were really useful when writing this patch.
> 
> I was under the impression that monitor_register_hmp_info_hrt() does all the
> magic here i.e. it declares the underlying QMP command with an x- prefix and
> effectively encapsulates the text field in a way that says "this is an
> unreliable text opaque for humans"?

The monitor_register_hmp_info_hrt only does the HMP glue side, and
that's only needed if you must dynamically register the HMP command.
For statically registered commands set '.cmd_info_hrt' directly in
the hml-commands-info.hx for the HMP side.

> If a qapi/ schema is needed could you explain what it should look like for
> this example and where it should go? Looking at the existing .json files I
> can't immediately see one which is the right place for this to live.

Take a look in qapi/machine.json for anyof the 'x-query-XXXX' commands
there. The QAPI bit is fairly simple. 

if you want to see an illustration of what's different from a previous
pure HMP impl, look at:

  commit dd98234c059e6bdb05a52998270df6d3d990332e
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Wed Sep 8 10:35:43 2021 +0100

    qapi: introduce x-query-roms QMP command



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


