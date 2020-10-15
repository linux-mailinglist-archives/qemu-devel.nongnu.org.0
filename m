Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C6D28EE8A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 10:33:26 +0200 (CEST)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSyhR-0003l5-Pf
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 04:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kSygS-0003Jk-L0
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 04:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kSygQ-0007yT-S4
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 04:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602750742;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4GkVKHGED2VwDXTHfTs5c6YlYT2cx9Qkao9WIyDMp0=;
 b=IqbjMk2SRI462OCTSXfnXM0oPZZ96kE8frMJidhhSP99uzIRgTivgn2Bw6Qb18qpCAQ6dk
 2VZKEkburU9yTzQtyAZfd+xzIRvXmcL3mBov7XLJZzNRCS+yU+JR3M12QpBAsUMR4C66wS
 IrreWJ7WxclLkvgLfrk4hIWBp1cQbrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-yFTft0GqP-6SLnpLkldzYw-1; Thu, 15 Oct 2020 04:32:18 -0400
X-MC-Unique: yFTft0GqP-6SLnpLkldzYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C32DD57245;
 Thu, 15 Oct 2020 08:32:16 +0000 (UTC)
Received: from redhat.com (ovpn-114-115.ams2.redhat.com [10.36.114.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CA9D61177;
 Thu, 15 Oct 2020 08:32:09 +0000 (UTC)
Date: Thu, 15 Oct 2020 09:32:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v3 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
Message-ID: <20201015083205.GB163620@redhat.com>
References: <20201014052140.1146924-1-crosa@redhat.com>
 <20201014052140.1146924-5-crosa@redhat.com>
 <20201014174655.GW115189@redhat.com>
 <20201014211356.GA1199212@localhost.localdomain>
 <20201014232430.GB1203215@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201014232430.GB1203215@localhost.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 14, 2020 at 07:24:30PM -0400, Cleber Rosa wrote:
> On Wed, Oct 14, 2020 at 05:14:01PM -0400, Cleber Rosa wrote:
> > On Wed, Oct 14, 2020 at 06:46:55PM +0100, Daniel P. Berrangé wrote:
> > > 
> > > This bug links to
> > > 
> > >   https://bugs.launchpad.net/ubuntu/+source/libssh/+bug/1847514
> > > 
> > > which is marked as fixed. So I'm thinking we can drop the --disable-libssh
> > > arg from all these jobs
> > >
> > 
> > OK, I'll double check that and, if the fix is comfirmed beyond the bug
> > tracker, I'll update it.
> > 
> 
> I was still able to reproduce the build failure with the latest packages.
> 
> The last update on the bug, is very misleading, but there's a hint of
> its outcome:
> 
> ---
> Martin Wimpress (flexiondotorg) on 2019-12-17
> tags:	added: rls-bb-notfixing
> tags:	removed: bionic
> no longer affects:	libssh (Ubuntu Bionic)
> ---
> 
> So, *notfixing* means it no longer affects that package on that
> distro? Right...

Urgh, launchpad is such a confusing bug tracker :-(

> Anyway, keeping this AS IS.

Yep


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


