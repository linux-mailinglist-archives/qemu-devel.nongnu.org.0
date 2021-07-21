Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6DC3D1194
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:45:04 +0200 (CEST)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6DT5-0007lX-Jn
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6DRk-0006QK-W0
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6DRh-00080h-IB
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626878614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QiCRyrmEGSSjKoUJCWyarkSPk3mcjgNFBh+DPsHCJDk=;
 b=QT/YcCK/VJSAeIxlnmf37Uk4HCSUaSLUi/CxYgylD99j1iOFVOKFDCUkhtGv78VI6YUlIg
 eRfub24w93W3p6y3/IsnnUHYrYIoJ9DLpnCP4leVpw/1GK0LWvl3+nPL5+v0V2sEADxWMo
 wjTv/qtNPPRdrl139b8zPgeI4UEEUsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-4mE1bBIDOtSUzKZyUmjYwA-1; Wed, 21 Jul 2021 10:43:33 -0400
X-MC-Unique: 4mE1bBIDOtSUzKZyUmjYwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3341C107ACF5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 14:43:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCE625D9DD;
 Wed, 21 Jul 2021 14:43:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4AD1F11326B9; Wed, 21 Jul 2021 16:43:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] qom: use correct field name when getting/setting
 alias properties
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <20210719104033.185109-3-pbonzini@redhat.com>
 <20210720010005.vegqnbb5qhfxh7ow@redhat.com>
 <ab9bb88a-ccb8-6242-5960-2eb1a43f0c56@redhat.com>
Date: Wed, 21 Jul 2021 16:43:21 +0200
In-Reply-To: <ab9bb88a-ccb8-6242-5960-2eb1a43f0c56@redhat.com> (Paolo
 Bonzini's message of "Wed, 21 Jul 2021 11:51:55 +0200")
Message-ID: <87tuknn2wm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, alex.williamson@redhat.com,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 20/07/21 03:00, Eric Blake wrote:
>> Deceptively simple; all the work was in the previous patch writing up
>> the forwarding visitor.  I still wonder if Kevin's QAPI aliases will
>> do this more gracefully, but if we're trying to justify this as a bug
>> fix worthy of 6.1, this is certainly a smaller approach than Kevin's.
>> Reviewed-by: Eric Blake<eblake@redhat.com>
>
> As discussed on IRC, this is unrelated to QAPI aliases; QOM alias
> properties typically target a property *on a different object*.

Yes, these are different beasts.

A QAPI alias provides an alternate name for a member.  The member may be
nested.  It's still within the same QAPI object.  Can be useful for
maintaining backwards compatibility, in particular for replacing (flat)
QemuOpts by QAPI-based dotted keys.

A QOM alias property is a proxy for a property of an *arbitrary* QOM
object.  Not limited to the alias's object and its sub-objects.
Strictly more powerful.

QOM alias properties are created at run time: creation requires the
target object.  QAPI aliases are completely defined at compile-time.

> This is a regression, so it certainly has to be fixed in 6.1 one way
> or the other.

Understood.


