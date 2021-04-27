Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDDB36CDDB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 23:29:20 +0200 (CEST)
Received: from localhost ([::1]:50656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbVGh-0002UC-0N
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 17:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbVEk-0001Fm-1E
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 17:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbVEg-0003RJ-C9
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 17:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619558832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghJyM737fH9JS5E/YlgV580X3NOUOQiC5VOqYGvcxrE=;
 b=K1g0PAemcwnAYUoQVWM6XIfgQBin7TUmSRSHH8COpzno0Ry6e4Ayb2w834ILHnV17HRfG7
 dhUEtgl7WWZDra1ysecZeFzsREXomLnopVk/jMWBCaLIB5xuGM/z3Npp2C4HHuMHTz1I3G
 UBwRipz7nYnZO28T32+fgpFGBnlPejk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-JGmLWNmAOISQOHgGELP-EQ-1; Tue, 27 Apr 2021 17:27:10 -0400
X-MC-Unique: JGmLWNmAOISQOHgGELP-EQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 230FA801B14;
 Tue, 27 Apr 2021 21:27:09 +0000 (UTC)
Received: from localhost (ovpn-116-230.rdu2.redhat.com [10.10.116.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14FEA22710;
 Tue, 27 Apr 2021 21:27:07 +0000 (UTC)
Date: Tue, 27 Apr 2021 17:27:07 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v8 08/11] hw/core: deprecate old reset functions and
 introduce new ones
Message-ID: <20210427212707.3tckau5r3kraciam@habkost.net>
References: <20200123132823.1117486-1-damien.hedde@greensocs.com>
 <20200123132823.1117486-9-damien.hedde@greensocs.com>
 <9fb8a6ed-137b-7269-91f1-69c11c6d876a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9fb8a6ed-137b-7269-91f1-69c11c6d876a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 Luc Michel <luc@lmichel.fr>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, berrange@redhat.com, pbonzini@redhat.com,
 edgari@xilinx.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 02:21:28PM +0200, Philippe Mathieu-Daudé wrote:
> On 1/23/20 2:28 PM, Damien Hedde wrote:
> > Deprecate device_legacy_reset(), qdev_reset_all() and
> > qbus_reset_all() to be replaced by new functions
> > device_cold_reset() and bus_cold_reset() which uses resettable API.
> > 
> > Also introduce resettable_cold_reset_fn() which may be used as a
> > replacement for qdev_reset_all_fn and qbus_reset_all_fn().
> > 
> > Following patches will be needed to look at legacy reset call sites
> > and switch to resettable api. The legacy functions will be removed
> > when unused.
> > 
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >  include/hw/qdev-core.h  | 27 +++++++++++++++++++++++++++
> >  include/hw/resettable.h |  9 +++++++++
> >  hw/core/bus.c           |  5 +++++
> >  hw/core/qdev.c          |  5 +++++
> >  hw/core/resettable.c    |  5 +++++
> >  5 files changed, 51 insertions(+)
> > 
> > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > index 1b4b420617..b84fcc32bf 100644
> > --- a/include/hw/qdev-core.h
> > +++ b/include/hw/qdev-core.h
> > @@ -406,6 +406,13 @@ int qdev_walk_children(DeviceState *dev,
> >                         qdev_walkerfn *post_devfn, qbus_walkerfn *post_busfn,
> >                         void *opaque);
> >  
> > +/**
> > + * @qdev_reset_all:
> > + * Reset @dev. See @qbus_reset_all() for more details.
> > + *
> > + * Note: This function is deprecated and will be removed when it becomes unused.
> > + * Please use device_cold_reset() now.
> > + */
> >  void qdev_reset_all(DeviceState *dev);
> >  void qdev_reset_all_fn(void *opaque);
> >  
> > @@ -418,10 +425,28 @@ void qdev_reset_all_fn(void *opaque);
> >   * hard reset means that qbus_reset_all will reset all state of the device.
> >   * For PCI devices, for example, this will include the base address registers
> >   * or configuration space.
> > + *
> > + * Note: This function is deprecated and will be removed when it becomes unused.
> > + * Please use bus_cold_reset() now.
> 
> Some time passed, so looking at this with some retrospective.
> 
> If there is an effort to introduce a new API replacing another one,
> we should try convert all the uses of the old API to the new one,
> instead of declaring it legacy.
> 
> Declare an API legacy/deprecated should be the last resort if there
> is no way to remove it. I'd recommend to move the deprecated/legacy
> declarations in a separate header, with the '_legacy' suffix.
> 
> Else:
> 
> 1/ we never finish API conversions,
> 2/ the new API might not be ready for all the legacy API use cases,
> 3/ we end up having to maintain 2 different APIs.
> 
> 
> So the recommendation is to use bus_cold_reset(), but it isn't
> used anywhere...:
> 
> $ git grep bus_cold_reset
> docs/devel/reset.rst:64:- ``bus_cold_reset()``
> hw/core/bus.c:73:void bus_cold_reset(BusState *bus)
> include/hw/qdev-core.h:715: * Please use bus_cold_reset() now.
> include/hw/qdev-core.h:728: * bus_cold_reset:
> include/hw/qdev-core.h:733:void bus_cold_reset(BusState *bus);
> 
> IMHO we shouldn't add new public prototypes without callers.

I agree.  We should make at least some effort to convert code to
the new API, if only to serve as reference for people doing the
conversion.  I'm surprised that a new function was added more
than a year ago and nobody is using it.

What happened here?  Was there some plan to convert existing code
but it was abandoned?

> 
> I see it is similar to device_cold_reset(), but TBH I'm scared
> to be the first one using it.
> 
> Regards,
> 
> Phil.
> 
> >   */
> >  void qbus_reset_all(BusState *bus);
> >  void qbus_reset_all_fn(void *opaque);
> >  
> > +/**
> > + * device_cold_reset:
> > + * Reset device @dev and perform a recursive processing using the resettable
> > + * interface. It triggers a RESET_TYPE_COLD.
> > + */
> > +void device_cold_reset(DeviceState *dev);
> > +
> > +/**
> > + * bus_cold_reset:
> > + *
> > + * Reset bus @bus and perform a recursive processing using the resettable
> > + * interface. It triggers a RESET_TYPE_COLD.
> > + */
> > +void bus_cold_reset(BusState *bus);
> 

-- 
Eduardo


