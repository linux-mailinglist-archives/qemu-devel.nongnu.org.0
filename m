Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105235DB6A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 11:39:19 +0200 (CEST)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWFVu-0001Us-LB
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 05:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lWFUw-0000na-RZ
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:38:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lWFUs-0001w0-Ae
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618306692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wiOHcD4n2JhOdaz6n9pl5Dj/eVk/nrynntOV4W9o8CY=;
 b=e9DGTKjzAhSHbjA6vc8xSriBEeFVIgcdBM+bDQe7re41vCXWyGIXHB/Q1Z0X1FOOTYX+vi
 Z3dlr6L4KgMEYbcioKTcTTEf0OCew//KfymjbWQSXEQ4WgTRGbiAEbP4G2BLZzMWrf8JQq
 dt584MD0I9EcwpD8rDlr1kO5yMkc4ic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-u7ZdZ-ZZO9mRCNgtyFyEwA-1; Tue, 13 Apr 2021 05:38:10 -0400
X-MC-Unique: u7ZdZ-ZZO9mRCNgtyFyEwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE206107ACC7
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:38:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-130.phx2.redhat.com [10.3.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A6F860CF0;
 Tue, 13 Apr 2021 09:38:04 +0000 (UTC)
Date: Tue, 13 Apr 2021 11:38:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 2/3] qom: move user_creatable_add_opts logic to vl.c
 and QAPIfy it
Message-ID: <YHVmexJiMSTmytyp@merkur.fritz.box>
References: <20210312173547.1283477-1-pbonzini@redhat.com>
 <20210312173547.1283477-3-pbonzini@redhat.com>
 <f0ea67d8-9641-104d-f8ec-5fc343256cc9@redhat.com>
 <87im4q23v2.fsf@dusky.pond.sub.org>
 <07c08cc3-f3ca-6f7a-e5f7-d2d3ee8de79e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <07c08cc3-f3ca-6f7a-e5f7-d2d3ee8de79e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.04.2021 um 10:13 hat David Hildenbrand geschrieben:
> On 13.04.21 06:41, Markus Armbruster wrote:
> > David Hildenbrand <david@redhat.com> writes:
> > 
> > > On 12.03.21 18:35, Paolo Bonzini wrote:
> > > > Emulators are currently using OptsVisitor (via user_creatable_add_opts)
> > > > to parse the -object command line option.  This has one extra feature,
> > > > compared to keyval, which is automatic conversion of integers to lists
> > > > as well as support for lists as repeated options:
> > > >     -object
> > > > memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind
> > > > So we cannot replace OptsVisitor with keyval right now.  Still, this
> > > > patch moves the user_creatable_add_opts logic to vl.c since it is
> > > > not needed anywhere else, and makes it go through user_creatable_add_qapi.
> > > > In order to minimize code changes, the predicate still takes a
> > > > string.
> > > > This can be changed later to use the ObjectType QAPI enum directly.
> > > > 
> > > 
> > > Rebasing my "noreserve"[1] series on this, I get weird errors from
> > > QEMU when specifying the new "reserve=off" option for a
> > > memory-backend-ram:
> > > 
> > > "Invalid parameter 'reserve'"
> > > 
> > > And it looks like this is the case for any new properties. Poking
> > > around, I fail to find what's causing this -- or how to unlock new
> > > properties. What is the magic toggle to make it work?
> > > 
> > > Thanks!
> > > 
> > > [1] https://lkml.kernel.org/r/20210319101230.21531-1-david@redhat.com
> > 
> > Wild guess: you didn't add your new properties in the QAPI schema.
> > 
> > For a not-so-wild-guess, send us a git-fetch argument for your rebased
> > series.
> > 
> 
> Oh, there is qapi/qom.json -- maybe that does the trick.
> 
> (I have mixed feelings about having to specify the same thing twice at
> different locations)

The idea is that we'll eventually generate some of the QOM boilerplate
from the QAPI schema and remove the duplication again.

But yes, for the time being, you need to touch both places.

Kevin


