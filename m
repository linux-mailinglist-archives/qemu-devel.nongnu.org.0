Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDC29D0C7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 16:42:37 +0100 (CET)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXnau-0001FY-Ay
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 11:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kXnYN-0006q9-Iv
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 11:40:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kXnYJ-0000wn-9n
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 11:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603899594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q37IFUe02laf4TNcvgRktOibRKkaFpwd06g46jbB9SM=;
 b=h5hYdWSCJYJnxTbp0K0EhcngsSc659Q2tJQQrXmWmNT8eDQIXV1fjxzGrqYJPhhMM0qyV8
 Dk9o6qElL27tasv+oi9SCQHT2Yd5+hpZTDp+YT9ieEePyIXx4RI2OqbRfYWYR8gdX/Ht47
 isWiC8hbu0szKZzk/FRjjoPVtrgcV2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-331pKDd7Noihder_LclXBQ-1; Wed, 28 Oct 2020 11:39:52 -0400
X-MC-Unique: 331pKDd7Noihder_LclXBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB7E556FDD;
 Wed, 28 Oct 2020 15:39:51 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-164.ams2.redhat.com [10.36.114.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 719DC6266E;
 Wed, 28 Oct 2020 15:39:47 +0000 (UTC)
Date: Wed, 28 Oct 2020 16:39:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/4] qemu-storage-daemon: QAPIfy --chardev the stupid way
Message-ID: <20201028153946.GC7355@merkur.fritz.box>
References: <20201026101005.2940615-1-armbru@redhat.com>
 <d00ef574-b2c4-887c-6a37-79f6cf6eeae0@redhat.com>
 <87a6w63kbw.fsf@dusky.pond.sub.org>
 <20201028114625.GA7355@merkur.fritz.box>
 <53ba80fe-8e4c-88c6-181d-f3b33bf3e9bc@redhat.com>
 <20201028145937.GB7355@merkur.fritz.box>
 <8103b738-aff7-fc50-67ac-59fd1262c06a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8103b738-aff7-fc50-67ac-59fd1262c06a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
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
Cc: marcandre.lureau@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.10.2020 um 16:09 hat Paolo Bonzini geschrieben:
> On 28/10/20 15:59, Kevin Wolf wrote:
> >> Making more use of QOM will make this a non-problem.  You'll just use
> >> object-add and -object and, when you figure out the QOM schema, it will
> >> just work.
> >
> > Yes, but figuring out the QOM schema (or rather, what the interface
> > represented by the schema should look like) is the hard part.
> 
> I don't disagree with that, but it's a problem you have to solve anyway,
> isn't it?  Once you figure out how to introspect QOM classes, that would
> apply just as well to character devices.

Yes, it's the problem I tried to address with my series, and Markus with
this alternative series. We need to do this either way.

> On the other hand, creating character devices with -object does solve
> another problem, namely the distinction between "early" and "late"
> objects in vl.c, in a way that QAPIfied -chardev doesn't solve.

Right. Both are solving different problems, and solving one won't
automatically make the other a non-problem as you suggested above.

I just suggested leaving QOM for later because two people making big
changes on the same subsystem is going to be painful for at least one of
them, and because for adding QOM properties, you need to know what these
properties should look like (unless you want to change them again
later).

If you don't wait for the QAPI work, you'll have solved the problem of
having two separate ways to describe chardev options by making it three
separate ways. Technically this might fulfill the condition of not
having two separate ways, but it's not really what we had in mind. :-)

Kevin


