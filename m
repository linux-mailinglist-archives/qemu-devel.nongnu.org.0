Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66E34CD4C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:49:59 +0200 (CEST)
Received: from localhost ([::1]:51338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQoX0-0001Tb-87
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lQoVa-0000rW-8S
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lQoVX-0002VL-Sr
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617011307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBE+SgwNMI3IQlaPr85o1e69oy9vHUd7O6ldzQaI/xs=;
 b=G7phaL8BNUBxyKGIwbnNXyhoj82bMMvRWXo/DoOwc0LKeLspH0fiviRtF18G2ufZNXLWR7
 eCufGk1cIDa9EbxTfambczalDJ72nR/rxvacSMgEkzu+6cQT0iD6IKA1TSX0sE06I42+77
 25wVTjiFwb9iA75SPO96bV3YsCQZDI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-8IwPd-t6OImZjO1eloUcZQ-1; Mon, 29 Mar 2021 05:48:25 -0400
X-MC-Unique: 8IwPd-t6OImZjO1eloUcZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2642B871377
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 09:48:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07C9719C45;
 Mon, 29 Mar 2021 09:48:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5823118000A0; Mon, 29 Mar 2021 11:48:18 +0200 (CEST)
Date: Mon, 29 Mar 2021 11:48:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <20210329094818.q4xtejd6labmb5gr@sirius.home.kraxel.org>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
 <YFiHnr/uguP8/Vtz@redhat.com>
 <20210326124700.taujcpo2xqbn2pzj@sirius.home.kraxel.org>
 <YGGcnmLvFHEkX4ot@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YGGcnmLvFHEkX4ot@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 10:23:42AM +0100, Daniel P. Berrangé wrote:
> On Fri, Mar 26, 2021 at 01:47:00PM +0100, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > eg a trace point "dma_map_wait" gets mapped to probes in many
> > > .stp files, once per target, because we need to match based on
> > > the executable path:
> > > 
> > >   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-x86_64").mark("dma_map_wait")
> > >   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-ppc64").mark("dma_map_wait")
> > 
> > Probe qemu.system.ppc64.dma_map_wait = ...
> > 
> > Can I trace qemu started from build directory?
> > Seems scripts/qemu-trace-stap doesn't support that.
> 
> We should really generate extra equiv .stp files just for running from
> the build.

Well, "make install" with --prefix=$HOME/qemu-install fixed that for the time
being.

Now I have this:

kraxel@sirius ~/qemu-install/bin# sudo ./qemu-trace-stap -v run ./qemu-system-x86_64 "qxl_soft_reset"
Using tapset dir '/home/kraxel/qemu-install/share/systemtap/tapset' for binary './qemu-system-x86_64'
Compiling script 'probe qemu.system.x86_64.log.qxl_soft_reset {}'
semantic error: unresolved function pid: identifier 'pid' at /home/kraxel/qemu-install/share/systemtap/tapset/qemu-system-x86_64-log.stp:5451:41
        source:     printf("%d@%d qxl_soft_reset %d\n", pid(), gettimeofday_ns(), qid)
                                                        ^

Pass 2: analysis failed.  [man error::pass2]

Any clue why pid() isn't known?

thanks,
  Gerd


