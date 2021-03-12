Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F38338727
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:16:54 +0100 (CET)
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKcyb-0005Z1-2y
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKcwX-00047F-GD
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKcwU-0004Mp-M6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615536881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ovQJB3GRo9K8IKS9ABKVpGu8FL1yUZSijo1IcZQwxKo=;
 b=NFkRgm7zkW9KUqgoiC/BJYf4W9s93ZrExgJTlrXPSUbhY42Q4S26D5IxaYvv9zw/woFv36
 M3dY2aSiNNA6HJh43/YgUm7gKz2yMHRs+9/bXP3nQBezX0Om6p0VYuxG7ifEJr6RvnbFEQ
 4zDEJEon2BGR/3i0Dp6S06SBMIZruno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-cqeop7eoNAma33zjjyIs5g-1; Fri, 12 Mar 2021 03:14:40 -0500
X-MC-Unique: cqeop7eoNAma33zjjyIs5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38FAE800D62;
 Fri, 12 Mar 2021 08:14:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ABD460C5F;
 Fri, 12 Mar 2021 08:14:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DCC8E1132C12; Fri, 12 Mar 2021 09:14:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
 <87ft12q8kf.fsf@dusky.pond.sub.org>
 <e98a5eb7-4716-a0f4-0ad2-adaa4cd9cefa@redhat.com>
 <87h7lhbx6b.fsf@dusky.pond.sub.org>
 <10fd7cbf-9ee5-3869-22fd-352e42a980ba@redhat.com>
Date: Fri, 12 Mar 2021 09:14:31 +0100
In-Reply-To: <10fd7cbf-9ee5-3869-22fd-352e42a980ba@redhat.com> (Paolo
 Bonzini's message of "Thu, 11 Mar 2021 18:50:33 +0100")
Message-ID: <871rck7pqw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Peter Krempa <pkrempa@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 11/03/21 15:08, Markus Armbruster wrote:
>>> I would rather keep the OptsVisitor here.  Do the same check for JSON
>>> syntax that you have in qobject_input_visitor_new_str, and whenever
>>> you need to walk all -object arguments, use something like this:
>>>
>>>      typedef struct ObjectArgument {
>>>          const char *id;
>>>          QDict *json;    /* or NULL for QemuOpts */
>>>          QSIMPLEQ_ENTRY(ObjectArgument) next;
>>>      }
>>>
>>> I already had patches in my queue to store -object in a GSList of
>>> dictionaries, changing it to use the above is easy enough.
>> 
>> I think I'd prefer following -display's precedence.  See my reply to
>> Kevin for details.
>
> Yeah, I got independently to the same conclusion and posted patches
> for that.  I was scared that visit_type_ObjectOptions was too much for 
> OptsVisitor but it seems to work...

We have reason to be scared.  I'll try to cover this in my review.


