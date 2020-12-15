Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5142DB201
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:59:38 +0100 (CET)
Received: from localhost ([::1]:48710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpDfl-00080o-HP
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpDeN-0006d1-FU
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:58:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpDeJ-0008Va-Lq
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608051486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J6jt9OOMo8mWDG8h6xLs0b1qnNR+y0T+fcTG20gea7M=;
 b=DhxI8/yulepHVhpQ825DJX6WsSHwR4Bx8Vcyyt6LtjOnVBifBzSymqK5WWe1wHmWFbPvVM
 ZbPhWdUO+E9Q0/e2NRoSqVMz6hs06nzKKhltie47yyEJcTshNDh0wmgcafLaJ1mCqQ1b7m
 cVVaVDk19jw5Np3f87MeZdzi86tJrwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-2jwpKCEDPW-IvQOkQMz5GA-1; Tue, 15 Dec 2020 11:58:04 -0500
X-MC-Unique: 2jwpKCEDPW-IvQOkQMz5GA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64ED815720;
 Tue, 15 Dec 2020 16:58:03 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE12C10023B2;
 Tue, 15 Dec 2020 16:57:59 +0000 (UTC)
Date: Tue, 15 Dec 2020 11:57:59 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 00/32] qdev property code cleanup
Message-ID: <20201215165759.GA3140057@habkost.net>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201214194238.GP1289986@habkost.net>
 <20201215154015.GW1289986@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20201215154015.GW1289986@habkost.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 10:40:20AM -0500, Eduardo Habkost wrote:
> On Mon, Dec 14, 2020 at 02:42:44PM -0500, Eduardo Habkost wrote:
> > On Fri, Dec 11, 2020 at 05:04:57PM -0500, Eduardo Habkost wrote:
> > > This code contains the first 32 patches from the series:
> > > 
> > >   Subject: [PATCH v3 00/53] Make qdev static property API usable by any QOM type
> > >   https://lore.kernel.org/qemu-devel/20201112214350.872250-1-ehabkost@redhat.com
> > > 
> > > I'm submitting this separately so we can merge the qdev-specific
> > > cleanup while we discuss our long term plans for QOM properties.
> > > 
> > > Eduardo Habkost (32):
> > >   cs4231: Get rid of empty property array
> > >   cpu: Move cpu_common_props to hw/core/cpu.c
> > >   qdev: Move property code to qdev-properties.[ch]
> > >   qdev: Check dev->realized at set_size()
> > >   sparc: Check dev->realized at sparc_set_nwindows()
> > >   qdev: Don't use dev->id on set_size32() error message
> > >   qdev: Make PropertyInfo.print method get Object* argument
> > >   qdev: Make bit_prop_set() get Object* argument
> > >   qdev: Make qdev_get_prop_ptr() get Object* arg
> > >   qdev: Make qdev_find_global_prop() get Object* argument
> > >   qdev: Make check_prop_still_unset() get Object* argument
> > >   qdev: Make error_set_from_qdev_prop_error() get Object* argument
> > >   qdev: Make qdev_propinfo_get_uint16() static
> > >   qdev: Move UUID property to qdev-properties-system.c
> > 
> > I'm queueing patches 1-14 (above) on machine-next.
> > 
> > >   qdev: Move softmmu properties to qdev-properties-system.h
> > >   qdev: Reuse DEFINE_PROP in all DEFINE_PROP_* macros
> > >   sparc: Use DEFINE_PROP for nwindows property
> > >   qdev: Get just property name at error_set_from_qdev_prop_error()
> > >   qdev: Avoid using prop->name unnecessarily
> > >   qdev: Add name parameter to qdev_class_add_property()
> > >   qdev: Add name argument to PropertyInfo.create method
> > >   qdev: Wrap getters and setters in separate helpers
> > >   qdev: Move dev->realized check to qdev_property_set()
> > >   qdev: Make PropertyInfo.create return ObjectProperty*
> > >   qdev: Make qdev_class_add_property() more flexible
> 
> I'm queueing patches 15-25 (above) on machine-next.
> 

I'm also queueing the following:

> > >   qdev: Move qdev_prop_tpm declaration to tpm_prop.h
> > >   qdev: Rename qdev_get_prop_ptr() to object_field_prop_ptr()
> > >   qdev: Avoid unnecessary DeviceState* variable at set_prop_arraylen()

-- 
Eduardo


