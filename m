Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63902CDCC1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:53:56 +0100 (CET)
Received: from localhost ([::1]:48756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksnj-0002Mn-FJ
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kksmH-0001pG-8j
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:52:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kksmE-00056y-3L
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607017940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kr1tDwTjeY3+fe7oHraTzZSs5FYXDh5SKaP1RZZB5FQ=;
 b=eXuO+ignjJ7Oqd+56JUr7t3hlm2Qw6Op6Ae/YMB2lMLlCQ7F7xpuksZgJbbBqvxQBku90j
 3hHNvK7qlq/Qd8ZLayqybP4btjbQnNhZf1wZMXUzbAOxdbiAAseVQnEmz/kHzkF7nThA3z
 ZGDoa3QkbjNUX9HjekGo7CMptztntNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-RhUQnKgpNpCEDmMVky7ndQ-1; Thu, 03 Dec 2020 12:52:19 -0500
X-MC-Unique: RhUQnKgpNpCEDmMVky7ndQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 201D71005504;
 Thu,  3 Dec 2020 17:52:18 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC44A60854;
 Thu,  3 Dec 2020 17:52:06 +0000 (UTC)
Date: Thu, 3 Dec 2020 12:52:05 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201203175205.GL3836@habkost.net>
References: <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net>
 <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net>
 <20201202173506.GH16765@merkur.fritz.box>
 <54637ad5-0662-24ea-d738-1d53e054a103@redhat.com>
 <20201203151532.GA5409@merkur.fritz.box>
 <27f30494-225c-4407-ee1c-1a996b83c8b1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <27f30494-225c-4407-ee1c-1a996b83c8b1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 05:50:46PM +0100, Paolo Bonzini wrote:
> On 03/12/20 16:15, Kevin Wolf wrote:
> > I don't think this is an intermediate state like Eduardo wants to have.
> > Creating the object, then setting properties, then realize [1] will fail
> > after your change. But keeping it working was the whole point of the
> > exercise.
> 
> With the sample code, you must remove object_class_property_set calls at the

Do you mean object_property_set()?

> same time as you remove the setters.  Usually that'd be when you convert to
> QAPI and oc->configure, but it doesn't have to be that way if there are good
> reasons not to do so.

Having two (or more) similar but incompatible APIs to do exactly
the same thing is a mistake we did before, and I wouldn't like us
to repeat it.

If we can keep qdev_new() + object_property_set() + realize
working after the device is converted, we should.  I believe we
can.

If we can make object_new_configure() work with all (or most)
device types before we manually convert them to the new system,
we should.  I believe we can.

We may be able avoid these questions with -object because
converting all backends at the same time is doable.  With
devices, API usability and maintainability during the transition
period (which could be very long) needs to be taken into account.

-- 
Eduardo


