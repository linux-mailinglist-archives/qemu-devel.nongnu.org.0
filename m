Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1E1446487
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:58:19 +0100 (CET)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizjW-0007Kx-7C
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mizgG-0004E8-OY
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mizgD-0003dU-81
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636120491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fGNlQufdRhvOv5Gsr8t1/OKDoIqVPsWcZiBzUYa6HUw=;
 b=dGCbWDSk8OIBcIw32OApf3GHUCOpuj7MjhUhX++sxFtQuw/f5iABueDyli1QjRNkFG2nJl
 4yWIFGyQL0Vii5jLg8yEwiWwRjw1YRcC2ZSKa11yDpETkO5WCrhAxCPNmZoxSyNwvXuAuT
 rDp/EjJdfm2KwRLKT1Ze2wMiKuFJkd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-lMHfGwW4PW2WvI17bjuWcA-1; Fri, 05 Nov 2021 09:54:47 -0400
X-MC-Unique: lMHfGwW4PW2WvI17bjuWcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C8B487D541;
 Fri,  5 Nov 2021 13:54:46 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.194.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEDC799CF;
 Fri,  5 Nov 2021 13:54:17 +0000 (UTC)
Date: Fri, 5 Nov 2021 14:54:15 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Message-ID: <YYU3h16iVbY+lAzH@angien.pipo.sk>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
 <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
 <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain>
 <87wnloce5t.fsf@dusky.pond.sub.org> <YYPwogn87tMf0p7s@redhat.com>
 <87y2623of6.fsf@dusky.pond.sub.org> <YYUvZjg0lmaWE223@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YYUvZjg0lmaWE223@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 05, 2021 at 14:19:34 +0100, Kevin Wolf wrote:
> Am 05.11.2021 um 11:08 hat Markus Armbruster geschrieben:
> > Kevin Wolf <kwolf@redhat.com> writes:
> > 
> > > Am 04.11.2021 um 13:13 hat Markus Armbruster geschrieben:

[...]

> We can deprecate on two different levels. I think it's useful to do
> both:
> 
> 1. Broad deprecation: Stable non-JSON interfaces are degraded to
>    a HMP-like compatibility promise. Obviously, this can only be done
>    for options that support JSON. Peter Maydell also wants to do this
>    only after a big user (read: libvirt) has implemented and is
>    using JSON, basically as a proof that the alternative is working.
> 
>    So this can certainly be done for -object. I believe libvirt also
>    uses JSON for -device now, so this should be fine now, too. Possibly
>    -drive (in favour of -blockdev), though I'm not completely sure if we
>    have gotten rid of the final users of -drive. (CCing Peter Krempa for
>    details.)

Libvirt uses JSON exclusively with -object (starting from qemu-6.0) and
with -device (starting from qemu-6.2).

We could also easily do -netdev if JSON support will be added for the
option as internally we already create the JSON object (so that the code
is identical for QMP hotplug) and just convert it back to the
commandline syntax.

Libvirt also uses JSON with -blockdev since -blockdev support was
introduced (IIRC qemu-4.2 added all the necessary bits for us).
If -blockdev is used libvirt does not use -drive at all (except for SD
cards for ARM boards), but that is not tested very well.


