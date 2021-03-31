Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A634FE5A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:57:09 +0200 (CEST)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRYX5-0005dv-Vy
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lRYVm-0004zp-Dk
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:55:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lRYVi-0004QA-4O
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617188140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3MZ3EZPSoi0R7N60TyY6IPqjbOAkZodewUKbjM+Ogc=;
 b=JyUvE7gqfGU2mKk+s04hS+FTbJv3hA1kDgr1q8bkOFVOWFBGFarO2Sn/9CFrrZPtY3MnTX
 o5XlzfJvcJs4b0o+B0yvQ+hIYBmWmxc3+hAxFVYuksLFKCgThexV+hpRDNp3VoNU0zQrwM
 iF0Qgdzm8dCbWabQ07oYCpiXJs5NrWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-npqCDTyLMROZyBk00SwXBQ-1; Wed, 31 Mar 2021 06:55:39 -0400
X-MC-Unique: npqCDTyLMROZyBk00SwXBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BE8183DD23
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 10:55:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-142.ams2.redhat.com
 [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C04626F135;
 Wed, 31 Mar 2021 10:55:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ABEA11800844; Wed, 31 Mar 2021 12:55:32 +0200 (CEST)
Date: Wed, 31 Mar 2021 12:55:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <20210331105532.h5dtris4a6is6wam@sirius.home.kraxel.org>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
 <YFiHnr/uguP8/Vtz@redhat.com>
 <20210326124700.taujcpo2xqbn2pzj@sirius.home.kraxel.org>
 <YGGcnmLvFHEkX4ot@redhat.com>
 <20210329094818.q4xtejd6labmb5gr@sirius.home.kraxel.org>
 <YGGlo0C/JqlyQLMV@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YGGlo0C/JqlyQLMV@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Well, "make install" with --prefix=$HOME/qemu-install fixed that for the time
> > being.
> > 
> > Now I have this:
> > 
> > kraxel@sirius ~/qemu-install/bin# sudo ./qemu-trace-stap -v run ./qemu-system-x86_64 "qxl_soft_reset"
> > Using tapset dir '/home/kraxel/qemu-install/share/systemtap/tapset' for binary './qemu-system-x86_64'
> > Compiling script 'probe qemu.system.x86_64.log.qxl_soft_reset {}'
> > semantic error: unresolved function pid: identifier 'pid' at /home/kraxel/qemu-install/share/systemtap/tapset/qemu-system-x86_64-log.stp:5451:41
> >         source:     printf("%d@%d qxl_soft_reset %d\n", pid(), gettimeofday_ns(), qid)
> >                                                         ^
> > 
> > Pass 2: analysis failed.  [man error::pass2]
> > 
> > Any clue why pid() isn't known?
> 
> Hmm, strange, makes me think we have a bug causing it to not pull in
> global functions.

Hmm.  5.1.0 fails the same way.  5.2.0 fails in a different way.  Seems
we had temporary breakage in 5.2.0 (was that the module thing which
needed some workaround?).  Given 5.1.0 fails too I suspect this is a
systemtap change (/me runs fedora 33).  Googling didn't found much,
other than indicating pid() is used frequently in examples and
tutorials.

stap-prep asked for kernel-debuginfo, but installing that (huge package
with 3.5G(!) installed size) hasn't changed the situation.  Guess I only
actually need that if I want trace the kernel not userspace?

take care,
  Gerd


