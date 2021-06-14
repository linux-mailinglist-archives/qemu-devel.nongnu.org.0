Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833A53A6981
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:03:31 +0200 (CEST)
Received: from localhost ([::1]:53030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lso7e-0001mj-KW
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lso6P-0000Qg-9D
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:02:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lso6H-0004eS-6R
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623682924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y1B+ap+wsIHLAneyzwRosAfFo+RDBxwI0RmD13xVSBE=;
 b=LvZW4V9rCf3JGHtc6Hc0ELlfrnnH0LHkVrbQo8gubIh6TzkfiTVasxtTOCcSba0xKZeknc
 VcmstWPk4+zfSJKWDbWRxepAFT/VEbYG0VCJHqeO/uAvIirksK8t/m6FF/W/bGR6bcotI3
 I3P9FFMzKBA0sfK+R+B79+h5ZDQfyyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-jXCcIsmFPCqu20ZqIJOyjQ-1; Mon, 14 Jun 2021 11:02:02 -0400
X-MC-Unique: jXCcIsmFPCqu20ZqIJOyjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70060193F598
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:02:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D78F690EF;
 Mon, 14 Jun 2021 15:02:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8449618000B2; Mon, 14 Jun 2021 17:01:59 +0200 (CEST)
Date: Mon, 14 Jun 2021 17:01:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
Message-ID: <20210614150159.6ilpce4dqxi7rju4@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
 <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > softmmu_mods and block_mods are both lists already, so this sets a
> > nested list and I wonder if it confuses meson  ? eg do you need
> > 
> >   input: softmmu_mods + block_mods
> 
> No, that should be fine.  Perhaps it's because the inputs are not part of
> the command?  You can check what the build.ninja rule for modinfo.json looks
> like.
> 
> Also:
> 
> - it would be better to support both directories and file names, so that
> stale modules are not included in modinfo.json

When turning qemu-modinfo into a pure build-utility (see below) there is
no reason to not explicitly list all module files on the command line.

> - modinfo.json needs to be disabled on non-ELF platforms (x86, Windows).

On windows modules are not supported.
Do we have any other non-ELF platforms?

> One alternative is to use libbfd instead of including an ELF parser.
> 
> - If modinfo.json has to be installed, you need to build modinfo for the
> build machine in order to support cross compiling.  That however would
> require a cross libbfd, which is a pain.  Do you really need to install it?

Do you mean installing modinfo.json or installing qemu-modinfo?  For the
latter I can see that not installing it removes some cross-compiling
headaches.  And, yes, we can turn this into a pure build utility
generating a static database (be it json or -- as suggested by Daniel --
a C source file with the data structures).

> Can the functionality instead be included in the main QEMU binary with a
> query-modules command or something like that.

Well, the meta-data database is meant for qemu itself, not external
users.  I was just using json because the infrastructure to serialize +
parse json exists.  Not sure a "query-modinfo" command makes sense.
Would be trivial to implement though if libvirt finds this useful
(assuming we stick to json).

I was toying with a completely different idea:  Have a "qemu
-generate-modinfo".  That would basically try to load each module, while
doing so record the type_register() (+ other register) calls the module
is doing, when done write out the database with the registrations done
by each module.

Problem with that approach is that it doesn't work for module
dependencies ...

Comments on the idea?  Suggestions for the module dependency problem?
Could maybe libbfd be used to find module (symbol) dependencies
automatically without writing a full dynamic linker?

take care,
  Gerd


