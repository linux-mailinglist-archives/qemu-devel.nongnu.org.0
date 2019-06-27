Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC51C58338
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 15:17:22 +0200 (CEST)
Received: from localhost ([::1]:50670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgUHB-0003aJ-7x
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 09:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60433)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hgUG6-00033D-9e
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 09:16:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hgUG5-0004wn-Ap
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 09:16:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43528)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hgUG1-0004sc-GP
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 09:16:11 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D47E28552E
 for <qemu-devel@nongnu.org>; Thu, 27 Jun 2019 13:16:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94B011001B12;
 Thu, 27 Jun 2019 13:16:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AFB2816E18; Thu, 27 Jun 2019 15:16:01 +0200 (CEST)
Date: Thu, 27 Jun 2019 15:16:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Message-ID: <20190627131601.3zln6ywzewm35qvn@sirius.home.kraxel.org>
References: <1560165301-39026-1-git-send-email-pbonzini@redhat.com>
 <1560165301-39026-4-git-send-email-pbonzini@redhat.com>
 <20190627090353.GA24929@redhat.com>
 <b8ae5bd6-2b52-99e0-993c-fe8f65d40da3@redhat.com>
 <20190627125505.GH12358@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627125505.GH12358@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 27 Jun 2019 13:16:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/7] configure: integrate Meson in the
 build system
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi,

> Ok, I can understand that. I've been thinking about how we can switch
> libvirt to use meson too, and trying to decide between meson being the
> owner, calling out to make  vs keeping make as the owner and calling
> out to meson. Ultimately to entirely banish make, autoconf, automake,
> libtool, m4 & shell from our build system :-)
> 
> Despite thinking about an incremental conversion though, I was still
> hoping libvirt would just have a single (largish) patch series to
> do a complete conversion at a specific point in time.

Another possible approach would be to have two build systems.
The traditional configure & make and the new meson & ninja.

Advantage is we don't have to worry about the transition and mixing &
make + meson at all.

Disadvantage is the duplication.  That wouldn't be forever though.
I'd expect we'll have one or maybe two releases with both build systems,
then delete the make & configure.

cheers,
  Gerd


