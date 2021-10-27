Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65E43C3E1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 09:29:22 +0200 (CEST)
Received: from localhost ([::1]:53710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfdNB-0002Z5-3t
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 03:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mfdML-0001st-Hx
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mfdMJ-0008MI-Dj
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635319705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vjxVdZe4j3Yz63EadQN8rgsDrZ+8rF/q9gEYK3cpcqI=;
 b=eqr6K8M2xgAdPhBe+k5nr7I4bw9mROvDfj+GNOR+25soQLskrV568jYqlZMEk8L1qTXcbk
 d9tSgBRENus76mizAkiT1mHMIIDv/7coRReXJBjO7no1jv0g16dm6AsXCKzYUNFS7ecmUX
 +hcI0wej5ior4/yThB+ue8/+yvwJNL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-nyY00O5cNUOXGLqvyWFW7Q-1; Wed, 27 Oct 2021 03:28:24 -0400
X-MC-Unique: nyY00O5cNUOXGLqvyWFW7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 861EB802B4F;
 Wed, 27 Oct 2021 07:28:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-241.phx2.redhat.com
 [10.3.112.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C221760843;
 Wed, 27 Oct 2021 07:27:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E913218007B7; Wed, 27 Oct 2021 09:27:54 +0200 (CEST)
Date: Wed, 27 Oct 2021 09:27:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
Message-ID: <20211027072754.uzrgqdavqltnfndq@sirius.home.kraxel.org>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87k0i6d5l5.fsf@dusky.pond.sub.org> <YXfV4vf5+YLFXYbA@work-vm>
 <87mtmwja2a.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87mtmwja2a.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Stefan Reiter <s.reiter@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 01:32:29PM +0200, Markus Armbruster wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> 
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> I'm done reviewing.  David, care to have another look at the HMP part?
> >
> > Yep, looking good to me - is that going via qmp, hmp, or vnc ?
> 
> Either is fine with me.
> 
> David, Gerd, do you have anything queued up already?

Nothing queued atm, no objections to someone else picking this up.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


