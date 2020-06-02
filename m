Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855ED1EBD2F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 15:37:33 +0200 (CEST)
Received: from localhost ([::1]:52044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg76i-0001yo-3d
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 09:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jg75q-0001DE-7A
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 09:36:38 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54010
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jg75o-0005Wz-Ji
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 09:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591104995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mPqXAGq666Gl2KWu6d3rwUCzV9p+ZmDLCWR5hvmECrg=;
 b=Z4FUqlajKp9X6GxSQdeVS8WRBgf3VrVF+KXyNDSiR3oajad/qZzH1HzX/VDovMbjt6rCji
 SMwC78U5IXZAzWo00hJZw++SbvNQwWRkUtzvtQePcRJ3e8IJLlZShNGTCwvfIkY0LWlhLe
 JcxRUd+aO0XH5+J6he60HQ8GS4N8UV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-r73SSKzgOwe-9Ef7YEY7zQ-1; Tue, 02 Jun 2020 09:36:33 -0400
X-MC-Unique: r73SSKzgOwe-9Ef7YEY7zQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 351BE100CCC4;
 Tue,  2 Jun 2020 13:36:32 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-75.ams2.redhat.com [10.36.113.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7F1B5D9CC;
 Tue,  2 Jun 2020 13:36:30 +0000 (UTC)
Date: Tue, 2 Jun 2020 15:36:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v6 02/12] monitor: Use getter/setter functions for cur_mon
Message-ID: <20200602133629.GI5940@linux.fritz.box>
References: <20200528153742.274164-1-kwolf@redhat.com>
 <20200528153742.274164-3-kwolf@redhat.com>
 <051c6abe-9e82-1999-f050-23c973408b1e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <051c6abe-9e82-1999-f050-23c973408b1e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 22:14:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@gmail.com, armbru@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.05.2020 um 20:31 hat Eric Blake geschrieben:
> On 5/28/20 10:37 AM, Kevin Wolf wrote:
> > cur_mon really needs to be coroutine-local as soon as we move monitor
> > command handlers to coroutines and let them yield. As a first step, just
> > remove all direct accesses to cur_mon so that we can implement this in
> > the getter function later.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> 
> 
> > +++ b/audio/wavcapture.c
> > @@ -1,5 +1,5 @@
> >   #include "qemu/osdep.h"
> > -#include "monitor/monitor.h"
> > +#include "qemu/qemu-print.h"
> >   #include "qapi/error.h"
> >   #include "qemu/error-report.h"
> >   #include "audio.h"
> > @@ -94,9 +94,9 @@ static void wav_capture_info (void *opaque)
> >       WAVState *wav = opaque;
> >       char *path = wav->path;
> > -    monitor_printf (cur_mon, "Capturing audio(%d,%d,%d) to %s: %d bytes\n",
> > -                    wav->freq, wav->bits, wav->nchannels,
> > -                    path ? path : "<not available>", wav->bytes);
> > +    qemu_printf("Capturing audio(%d,%d,%d) to %s: %d bytes\n",
> > +                wav->freq, wav->bits, wav->nchannels,
> > +                path ? path : "<not available>", wav->bytes);
> 
> Why the change to qemu_printf() here instead of a call to
> monitor_cur() as is done in the rest of the patch?

There was actually only one other monitor_printf() call for cur_mon, and
that was in the monitor core, so I think there's no reason to switch
that one.

If you prefer, I can call monitor_cur() directly here, but I thought not
calling it from everywhere when there is already a wrapper like
qemu_printf() would be a good thing.

Maybe wav_capture_info() should actually be passed a Monitor object so
we don't need either.

> > +++ b/stubs/monitor-core.c
> > @@ -3,7 +3,10 @@
> >   #include "qemu-common.h"
> >   #include "qapi/qapi-emit-events.h"
> > -__thread Monitor *cur_mon;
> > +Monitor *monitor_cur(void)
> > +{
> > +    return NULL;
> > +}
> 
> monitor_set_cur() didn't need a stub?  Odd, but I guess it's okay.

Not that odd, only the code to handle monitor commands ever sets the
current monitor. But if you use the stubs, you don't have a monitor.

Kevin


