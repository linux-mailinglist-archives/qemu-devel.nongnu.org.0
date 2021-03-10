Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594F63345C8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:56:56 +0100 (CET)
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK34p-0004uW-DT
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lK2fl-0006sY-KR
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:31:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lK2fi-0006cr-VI
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615397457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K21kxtCTmYkGpLL35VIR5pZQl/STBO1ZL3zQiI4c0hA=;
 b=WAxL8URFLzkhugmg/jIS4AGwnWtHXLhpYPTn2Jc3iFuKd1Ec8k5n1SzQtpojM/C6gPn0bU
 qJ1pBU3F3w+uAhx8cRur2usV+ML9nhelVoIeqX4kyu0gouRYEuBbUkZviaFKkYZ5hezPiM
 FW+XYkrGPDUOcKqGPtZPi7D8Z0zYqd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-hXIIaIkHMDKRSD07HYi_eg-1; Wed, 10 Mar 2021 12:30:56 -0500
X-MC-Unique: hXIIaIkHMDKRSD07HYi_eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0898D1005D45;
 Wed, 10 Mar 2021 17:30:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-29.ams2.redhat.com [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70DAA60CE9;
 Wed, 10 Mar 2021 17:30:46 +0000 (UTC)
Date: Wed, 10 Mar 2021 18:30:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
Message-ID: <20210310173044.GF6076@merkur.fritz.box>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: lvivier@redhat.com, thuth@redhat.com, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.03.2021 um 15:31 hat Paolo Bonzini geschrieben:
> On 10/03/21 15:22, Peter Krempa wrote:
> > I've stumbled upon a regression with this patchset applied:
> > 
> > error: internal error: process exited while connecting to monitor: qemu-system-x86_64: -object memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind: Invalid parameter type for 'host-nodes', expected: array
> 
> This is the magic conversion of "string containing a list of integers"
> to "list of integers".

Ah, crap. This one wouldn't have been a problem when converting only
object-add, and I trusted your audit that user creatable objects don't
depend on any QemuOpts magic. I should have noticed it, too, of course,
but during the convertion I didn't have QemuOpts in mind, only QOM and
QAPI.

I checked all object types, and it seems this is the only one that is
affected. We have a second list in AuthZListProperties, but it contains
structs, so it was never supported on the command line anyway.

> The relevant code is in qapi/string-input-visitor.c, but I'm not sure where
> to stick it in the keyval-based parsing flow (i.e.
> qobject_input_visitor_new_keyval).  Markus, any ideas?

The best I can think of at the moment would be adding a flag to the
keyval parser that would enable the feature only for -object (and only
in the system emulator, because memory-backend-ram doesn't exist in the
tools):

The keyval parser would create a list if multiple values are given for
the same key. Some care needs to be taken to avoid mixing the magic
list feature with the normal indexed list options.

The QAPI schema would then use an alternate between 'int' and ['int'],
with the the memory-backend-ram implementation changed accordingly.

We could consider immediately deprecating the syntax and printing a
warning in the keyval parser when it automatically creates a list from
two values for a key, so that users don't start using this syntax
instead of the normal list syntax in other places. We'd probably still
leave the implementation around for -device and other users of the same
magic.

Kevin


