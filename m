Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A69B34CCFC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:26:39 +0200 (CEST)
Received: from localhost ([::1]:58250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQoAQ-00087N-LH
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lQo7v-0006zi-Bc
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lQo7t-0004lY-Oy
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617009839;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4d/q8CArbXwjDyOTymBG33h/R3c1p79JWHLpeX64kxM=;
 b=Lm5iOfNBqOVIK8WUeCoYadz8q1pyXzsKLWgxJTb5wnDFv7W0XmIcMCvujg2oI3gwlHfR5Y
 TjPVapiNIG/Ozd5PbZ6l0MKGcqN1GVsxUXPHifZOsuhxxLSeheUnnhnP3XnT1OBCaisewu
 VySsMa7XS/uDtXfwpAfsYezxKrpgIow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-SUB1YWOdOCOA6f1yw1AriQ-1; Mon, 29 Mar 2021 05:23:56 -0400
X-MC-Unique: SUB1YWOdOCOA6f1yw1AriQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25BA1190A7A5
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 09:23:55 +0000 (UTC)
Received: from redhat.com (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DE3963633;
 Mon, 29 Mar 2021 09:23:45 +0000 (UTC)
Date: Mon, 29 Mar 2021 10:23:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <YGGcnmLvFHEkX4ot@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
 <YFiHnr/uguP8/Vtz@redhat.com>
 <20210326124700.taujcpo2xqbn2pzj@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210326124700.taujcpo2xqbn2pzj@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 26, 2021 at 01:47:00PM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > eg a trace point "dma_map_wait" gets mapped to probes in many
> > .stp files, once per target, because we need to match based on
> > the executable path:
> > 
> >   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-x86_64").mark("dma_map_wait")
> >   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-ppc64").mark("dma_map_wait")
> 
> Probe qemu.system.ppc64.dma_map_wait = ...
> 
> Can I trace qemu started from build directory?
> Seems scripts/qemu-trace-stap doesn't support that.

We should really generate extra equiv .stp files just for running from
the build.

> >   qxl.destroy_primary(int qid) "%d"
> >   qxl.enter_vga_mode(int qid) "%d"
> >   qxl.exit_vga_mode(int qid) "%d"
> > 
> > this would be backwards compatible, as we can turn the "." back into
> > a "_" for all existing trace backends, except stp.
> 
> Hmm, not sure I like this inconsistency.  I think names should be the
> same no matter which trace backend is used.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


