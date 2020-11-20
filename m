Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C02BAAEB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:18:49 +0100 (CET)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg6JM-0007wt-LK
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg6GQ-0006jI-AJ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg6GJ-0003eo-OG
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605878138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T1PM9uKi1Iny3PGvlMBPUWrd1FFZr4O/Tq67sVTb0ig=;
 b=WfCubDkhwee5Tu9P1cAzFupZM8rPIjaRhxAV6CDyRae8LQt4uloeLj45b63Ky69aC6gdBO
 U1DkYHA2gssYUYr3pIe95sWxOlsnCBb3F2BdwaEfdUP/0Z7kwyivntAdkZIEOoAz1xP+KD
 7kCTSXjMEvBRQmcGu3jyn//U5ylAEak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-eaIrnZyqMOaUNdwxj1WnJQ-1; Fri, 20 Nov 2020 08:15:34 -0500
X-MC-Unique: eaIrnZyqMOaUNdwxj1WnJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC7F3100C602
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:15:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DEE560BD8;
 Fri, 20 Nov 2020 13:15:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8895817535; Fri, 20 Nov 2020 14:15:29 +0100 (CET)
Date: Fri, 20 Nov 2020 14:15:29 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
Message-ID: <20201120131529.5aoeikq6lxbdzksu@sirius.home.kraxel.org>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
 <20201119110316.GG701869@stefanha-x1.localdomain>
 <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
 <20201119115514.GA838600@stefanha-x1.localdomain>
 <20201120102355.mayek7z4ud5orqme@sirius.home.kraxel.org>
 <20201120112539.bsyjsfrqxz4ffo4r@sirius.home.kraxel.org>
 <8102f2fa-1902-050d-d6c4-cd2bc80c7cb5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8102f2fa-1902-050d-d6c4-cd2bc80c7cb5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > So "var2 = var1" creates a copy not a reference I guess?
> > 
> > Which implies that ...
> > 
> > 	foo_ss.add(something)
> > 
> > ... is different from ...
> > 
> > 	bar_ss = foo_ss
> > 	bar_ss.add(something)
> > 
> > ... which in turn explains why the patch doesn't work at all.
> > 
> > Now I'm wondering how I can make trace/meson.build add the trace
> > objects to the module source sets if I can't pass around references
> > to the module source sets?
> > 
> > Paolo?  Any hints how to tackle this the meson way?
> 
> Maybe managing it all in the main meson.build, like the
> e28ab096bf8..da33fc09873 cleanup?
> ("Move the creation of the library to the main meson.build")

I don't see how that'll help.

The fundamental idea is hw/*/meson.build stores the source set in the
new trace_events_config, then trace/meson.build can pick it up there
when it loops over the trace_events_config array, adding the generated
trace source files to the correct source set.

Whenever that loop is in trace/meson.build or the toplevel meson.build
doesn't make much of a difference I think.

I think the problem is meson stores a copy not a reference so the
trace_events_config loop doesn't update the original source set.  When
meson loops over the module source sets it doesn't see the updates
because those changes where done on a throw-away copy.

I don't see an easy way out :(

take care,
  Gerd


