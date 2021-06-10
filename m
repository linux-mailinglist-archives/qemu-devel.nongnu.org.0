Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0AF3A2F3E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:24:53 +0200 (CEST)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMY8-0005LN-PI
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrMWf-0004ab-I5
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:23:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrMWb-0001WQ-E1
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623338596;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KeBXKTUcy7v4gMlSNPyV8LKaDORkOPmWWnsLYLoH3VY=;
 b=dmn1Bv9jbPUqPl7AKwULljDuD10Mzbh9XiXrBxXcju+egVcgVQeMuRzFiHIgaAbihy3aHB
 NldqmLYR0tY67meibwwC4gWXb3GP2cbIKFKLlJqfZf1wHpvF4D4/iHWXJ5I3ilXpfwsu03
 6B0Kp75/ZamxUkepTLqMyYpYh8v9jPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-ChbTpyfWP0KhDYX40_fnqQ-1; Thu, 10 Jun 2021 11:23:11 -0400
X-MC-Unique: ChbTpyfWP0KhDYX40_fnqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AF488042A9;
 Thu, 10 Jun 2021 15:23:10 +0000 (UTC)
Received: from redhat.com (ovpn-112-249.ams2.redhat.com [10.36.112.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1A765C1C5;
 Thu, 10 Jun 2021 15:23:08 +0000 (UTC)
Date: Thu, 10 Jun 2021 16:23:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Konstantin Kostiuk <konstantin@daynix.com>
Subject: Re: [PATCH] qga-win: Free GMatchInfo properly
Message-ID: <YMIuWtE9VjZDUQYz@redhat.com>
References: <20210610143800.3293854-1-konstantin@daynix.com>
 <CAJ+F1C+WhQRd7W4ATJh=QeyRnYULipPFHr38MODwrLc6Gu73eQ@mail.gmail.com>
 <CAJ28CFROd2KPknSoT=P6NS2PzizsTi=K4tKx0dV5By=cqKUDJg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ28CFROd2KPknSoT=P6NS2PzizsTi=K4tKx0dV5By=cqKUDJg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 05:53:35PM +0300, Konstantin Kostiuk wrote:
> Hi All,
> 
> For freeing GMatchInfo struct, a special function is required. I'm not sure is
> it possible to use g_autoptr in this case or no.
> In GLib example
> https://developer.gnome.org/glib/stable/glib-Perl-compatible-regular-expressions.html#g-regex-match,
> g_match_info_free is used directly.

That is fine - g_autoptr calls the required deallocation function
that was previously registered. This is different from g_autofree
which merely calls g_free.

We can see GMatchInfo is configured to call g_match_info_free:

$ grep GMatchIn /usr/include/glib-2.0/glib/*.h
/usr/include/glib-2.0/glib/glib-autocleanups.h:G_DEFINE_AUTOPTR_CLEANUP_FUNC(GMatchInfo, g_match_info_unref)


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


