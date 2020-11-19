Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6403C2B9A29
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:56:52 +0100 (CET)
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfoAt-0003r8-6z
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfo9m-0003Fp-Qh
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfo9h-0001Dc-BN
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605808535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9GpoI0V5hJF4iM4F8qv1GS3lA20LsLZSj3pw8WGPwXE=;
 b=ZtAvxTN3YfjGkiLaQr0+cBQWU5qUFAwE9FoJ547sUJHQT1MEynyovKWtzDAnuOFH72kCSd
 tBdytmQBDp0GC76i++eXXlf+5EtnOZTYwFSAryvKPp5AC2jORDSPLzK+00AMTFW2Ju8WZ1
 yoRar5WXCj77EUnJJSj3QH/hnspd7l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-Xz0SJU2QPr-g6rLMkRK0sA-1; Thu, 19 Nov 2020 12:55:33 -0500
X-MC-Unique: Xz0SJU2QPr-g6rLMkRK0sA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B19541842161
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 17:55:32 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 747335C1D5;
 Thu, 19 Nov 2020 17:55:32 +0000 (UTC)
Date: Thu, 19 Nov 2020 12:55:31 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/8] qom: Use qlit to represent property defaults
Message-ID: <20201119175531.GU1509407@habkost.net>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <87eekpbjvt.fsf@dusky.pond.sub.org>
 <20201119171342.GT1509407@habkost.net>
 <981fb59f-ad67-886c-40e7-6f129997f4c7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <981fb59f-ad67-886c-40e7-6f129997f4c7@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 06:23:30PM +0100, Paolo Bonzini wrote:
> On 19/11/20 18:13, Eduardo Habkost wrote:
> > > What's left?
> > Enums.  Enums properties are a mess to implement, and I plan to
> > tackle them later.
> > 
> > On all other cases, the external representation of the property
> > value is similar to the internal representation.  In the case of
> > enums, the external representation is a string, but the internal
> > representation is an integer.
> > 
> 
> I would have expected a string QLit to work with enums, is there a reason
> why it doesn't?

It would work, but it would be more inconvenient for callers.
Right now they use the C enum constant instead of a string.

-- 
Eduardo


