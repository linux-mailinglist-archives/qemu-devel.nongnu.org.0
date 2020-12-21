Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BC22E007A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 19:55:56 +0100 (CET)
Received: from localhost ([::1]:41414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krQLb-0007p9-3u
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 13:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1krQKE-0007Oh-Uv
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 13:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1krQKB-0002Po-UU
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 13:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608576865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jkXmnAXbneZ4e2AEbYdxZgiDD3kJZi77EBC/HVxh85M=;
 b=cpzErDm1YZ7zvtL/y+/fhgQMVC2URISdY/68WWcwIcERv80UCZBZyumDoSSbo+tw0fIU8+
 q9YmVHvh6Uc1JO6/9qdeUIBiOJ8tWZchY0ROxrnrBy1vYGeaQ4k9K8GyAP08NjkLkV8r8g
 KJtMBWhYXHPua8iff67UYuVFsOTmmxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-CxIHFwMpMfiqojvTQ2QhPg-1; Mon, 21 Dec 2020 13:54:24 -0500
X-MC-Unique: CxIHFwMpMfiqojvTQ2QhPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3C72801817;
 Mon, 21 Dec 2020 18:54:22 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD815D6D1;
 Mon, 21 Dec 2020 18:54:21 +0000 (UTC)
Date: Mon, 21 Dec 2020 13:54:20 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: QOM address space handling
Message-ID: <20201221185420.GA6040@habkost.net>
References: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
 <4d4b1f60-98b6-6a41-42e7-685b2059da4c@redhat.com>
 <e3932dd6-545b-f329-f88f-e8c9694fc35e@ilande.co.uk>
 <20201218223250.GW3140057@habkost.net>
 <750e98b8-4e7b-f912-f06b-d2b835cc6113@redhat.com>
MIME-Version: 1.0
In-Reply-To: <750e98b8-4e7b-f912-f06b-d2b835cc6113@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 20, 2020 at 10:25:25AM +0100, Paolo Bonzini wrote:
> On 18/12/20 23:32, Eduardo Habkost wrote:
> > Who owns the FlatView reference, exactly?
> 
> The AddressSpace.  The device creates the AddressSpace, which holds a
> reference to the MemoryRegion through FlatView and AddressSpaceDispatch,
> which holds a reference to the device.
> 
> By destroying the address space that it created, the device can break the
> reference loop.
> 
> > If the FlatView reference is owned by the MemoryRegion, we have a
> > reference loop: the device holds a reference to the MemoryRegion,
> > which owns the FlatView, which holds a reference to the device.
> > In this case, who owns the reference loop and is responsible for
> > breaking it?
> 
> The reference loop is owned by the device, which breaks it through unrealize
> (called by unparent).
> 
> instance_finalize by definition cannot break reference loops, so this means
> that my suggestion of using address_space_init in instance_init was wrong.

Once we fix that, I suggest we add an assertion to make it
illegal to call object_ref() on an object during instance_init.

Do we know how many address_space_init() calls in instance_init
we have today?

-- 
Eduardo


