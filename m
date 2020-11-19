Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCAB2B991A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:16:36 +0100 (CET)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnXv-000601-4y
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfnVH-0004mA-9Z
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:13:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfnVE-0001zf-Fq
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:13:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605806026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYGDlkbpf12eUtLJvIw3S8j8l5poLDD28MDYvF+1sDU=;
 b=ewSe1gzVyOUeZQ91AVxZognxHX3MP1tK/13Wqly/lVWnVPW4J1nAFm039qat78vHHu67HI
 cl+nI48MlQ2u7Tt9Ni0dIoRdQ5GPPArjIu6gMJ10H660XOZWSqVwIJx1JguD8hrmNIxyE6
 SfBMe+Ic4MZUNpr5UQph+sGAzf0wTh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-oHomOpvyP9evygLj_whrRQ-1; Thu, 19 Nov 2020 12:13:44 -0500
X-MC-Unique: oHomOpvyP9evygLj_whrRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9325ADBBE
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 17:13:43 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3256A60843;
 Thu, 19 Nov 2020 17:13:43 +0000 (UTC)
Date: Thu, 19 Nov 2020 12:13:42 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 0/8] qom: Use qlit to represent property defaults
Message-ID: <20201119171342.GT1509407@habkost.net>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <87eekpbjvt.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87eekpbjvt.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 01:39:50PM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > Based-on: 20201104160021.2342108-1-ehabkost@redhat.com
> > Git branch: https://gitlab.com/ehabkost/qemu/-/commits/work/qdev-qlit-defaults
> >
> > This extend qlit.h to support all QNum types (signed int,
> > unsigned int, and double), and use QLitObject to represent field
> > property defaults.
> >
> > It allows us to get rid of most type-specific .set_default_value
> > functions for QOM property types.
> 
> What's left?

Enums.  Enums properties are a mess to implement, and I plan to
tackle them later.

On all other cases, the external representation of the property
value is similar to the internal representation.  In the case of
enums, the external representation is a string, but the internal
representation is an integer.

> 
> I'm asking because if you create a new way to get rid of most of an old
> way, you're still left with two ways, which may or may not be an
> improvement.

I don't think this is an accurate description.  We had five
different ways of doing this[1].  I replaced four of them with
the new qlit-based mechanism, and now we have two.


[1] The five different ways were:
    qdev_propinfo_set_default_value_enum,
    qdev_propinfo_set_default_value_int,
    qdev_propinfo_set_default_value_uint,
    set_default_uuid_auto, and
    set_default_value_bool.

> 
> Moving defaults from code to data sounds attractive to me.  Data is
> easier to reason about than code.  For QAPI, we've been talking about
> defining defaults in the schema for a long time, but nobody has gotten
> around to finish an implementation.

-- 
Eduardo


