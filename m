Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC932F8AC
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 07:59:03 +0100 (CET)
Received: from localhost ([::1]:48842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIQty-0003ac-4f
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 01:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIQsv-00036G-7S
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 01:57:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIQsr-000410-Ul
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 01:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615013872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sdJeH8JvuOymy4mh46hVD0iGL1lqYz5cnkV8jnEDv9A=;
 b=LJ/pWDhYs92VeBibpn3Fry60X7n4R5ciC9+DmT7tfSNkG7COHDuibFm4ZuEiPa42Yx2Zjr
 GA0plxnP9+WSqI9tSPaqjDCnsOZ1T/UIV9LM4PCSQhRiEraxz1HuaGjaGhvjcL+SpfxPr1
 QQ2ACgDZecoHbx8DpiUTRLc+DJ0zEno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-FG3ILtmBN721oIBvjAWz0g-1; Sat, 06 Mar 2021 01:57:50 -0500
X-MC-Unique: FG3ILtmBN721oIBvjAWz0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5BA1107465F;
 Sat,  6 Mar 2021 06:57:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2262360244;
 Sat,  6 Mar 2021 06:57:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A058D1132C12; Sat,  6 Mar 2021 07:57:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
Date: Sat, 06 Mar 2021 07:57:42 +0100
In-Reply-To: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com> (Daniel Henrique
 Barboza's message of "Fri, 5 Mar 2021 15:16:10 -0300")
Message-ID: <877dmkrcpl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: ACPI maintainers for additional expertise.

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> Hi,
>
> Recent changes in pseries code (not yet pushed, available at David's
> ppc-for-6.0) are using the QAPI event MEM_UNPLUG_ERROR to report memory
> hotunplug errors in the pseries machine.
>
> The pseries machine is also using a timeout to cancel CPU hotunplugs that
> takes too long to finish (in which we're assuming a guest side error) and
> it would be desirable to also send a QAPI event for this case as well.
>
> At this moment, there is no "CPU_UNPLUG_ERROR" in QAPI (guess ACPI doesn't
> need it).

I see two interpretations of "ACPI doesn't need":

1. Unplug can't fail, or QEMU can't detect failure.  Michael, Igor?

2. Management applications haven't needed to know badly enough to
implement an event.

>           Before sending patches to implement this new event I had a talk
> with David Gibson and he suggested that, instead of adding a new CPU_UNPLUG_ERROR
> event, we could add a generic event (e.g. DEVICE_UNPLUG_ERROR) that can be
> used by the pseries machine in both error scenarios (MEM and CPU).

Good point.  One general event is better than two special ones that
could easily grow siblings.

> This could also be used by x86 as well, although I believe the use of
> MEM_UNPLUG_ERROR would need to be kept for awhile to avoid breaking ABI.

Yes.  Our rules for interface deprecation apply.

> Any suggestions/comments?

We should document the event's reliability.  Are there unplug operations
where we can't detect failure?  Are there unplug operations where we
could, but haven't implemented the event?

The fewer exceptions, the better, of course.


