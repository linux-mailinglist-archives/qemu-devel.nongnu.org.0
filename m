Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9F44472F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:32:52 +0100 (CET)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miK83-0003RO-1P
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5f-0000o3-82
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5b-0001IK-FK
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oar6+kOpPWU9RIX9hJi1RMvTzh4z6P7JrYoGvsq6fw4=;
 b=PieBiDGJ/zRfW6zGc6ssczpAo0hDp44/9vPH9qZZcR6PwURBLg3sH69zjO4iipBa6faUuK
 NzVt76GYG01yL82u+AYx3jEKbDTbfsBwXH/l9OuyEgeIslPB3plWjrdF5kXVjgbzEH3wT1
 QPnme4rLlh1ONzXmq1l13Qma4IZLJFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-YAhHkyL8MaOmGeawoz22Ig-1; Wed, 03 Nov 2021 13:30:14 -0400
X-MC-Unique: YAhHkyL8MaOmGeawoz22Ig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE43879A11
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:13 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11B687AB5C;
 Wed,  3 Nov 2021 17:30:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/12] QOM/QAPI integration part 1
Date: Wed,  3 Nov 2021 18:29:50 +0100
Message-Id: <20211103173002.209906-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds QOM class definitions to the QAPI schema, introduces
a new TypeInfo.instance_config() callback that configures the object at
creation time (instead of setting properties individually) and is
separate from runtime property setters (which often used to be not
really tested for runtime use), and finally generates a marshalling
function for .instance_config() from the QAPI schema that makes this a
natural C interface rather than a visitor based one.

This is loosely based on Paolo's old proposal in the wiki:
https://wiki.qemu.org/Features/QOM-QAPI_integration

The series is in a rather early stage and I don't really have any
automated tests or documentation in this series yet. I'm also only
converting the class hierarchy for the random number generator backends
to show what the result looks like, the other objects still need to be
done.

So the question to you isn't whether this is mergeable (it isn't), but
whether you think this is the right approach for starting to integrate
QOM and QAPI better.

You'll also see that this doesn't really remove the duplication between
property definitions in the code and configuration struct definitions in
the QAPI schema yet (because we want to keep at least a read-only
runtime property for every configuration option), but at least they mean
somewhat different things now (creation vs. runtime) instead of being
completely redundant.

Possible future steps:

* Define at least those properties to the schema that correspond to a
  config option. For both setters and getters for each option, we'll
  probably want to select in the schema between 'not available',
  'automatically generated function' and 'manually implemented'.

  Other runtime properties could be either left in the code or added to
  the schema as well. Either way, we need to figure out how to best
  describe these things in the schema.

* Getting rid of the big 'object-add' union: While the union is not too
  bad for the rather small number of user-creatable objects, it
  wouldn't scale at all for devices.

  My idea there is that we could define something like this:

  { 'struct': 'ObjectOptions',
    'data': {
        'id': 'str',
        'config': { 'type': 'qom-config-any:user-creatable',
                    'embed': true } } }

  Obviously this would be an extension of the schema language to add an
  'embed' option (another hopefully more acceptable attempt to flatten
  things...), so I'd like to hear opinions on this first before I go to
  implement it.

  Also note that 'qom-config-any:user-creatable' is new, too. The
  'qom-config:...' types introduced by this series don't work for
  subclasses, but only for the exact class.

  On the external interface, the new 'qom-config-any:...' type including
  subclasses would basically behave (and be introspected) like the union
  we have today, just without being defined explicitly.

  As for the C representation for configurations that include
  subclasses, I'm imagining a struct that just contains the qom_type
  string (so we can call the right handler) and a pointer to the real
  config (that is treated as opaque by the generic code).

I could probably add more, but let's just start with this for discussion
now.

Kevin Wolf (12):
  qapi: Add visit_next_struct_member()
  qom: Create object_configure()
  qom: Make object_configure() public
  qom: Add instance_config() to TypeInfo
  rng-random: Implement .instance_config
  rng-backend: Implement .instance_config
  qapi: Allow defining QOM classes
  qapi: Create qom-config:... type for classes
  qapi/qom: Convert rng-backend/random to class
  qapi: Generate QOM config marshalling code
  qapi/qom: Add class definition for rng-builtin
  qapi/qom: Add class definition for rng-egd

 qapi/qom.json                |  46 ++++++++++-----
 include/qapi/visitor-impl.h  |   3 +
 include/qapi/visitor.h       |   2 +
 include/qom/object.h         |   7 +++
 backends/rng-egd.c           |  18 +++---
 backends/rng-random.c        |  18 +++---
 backends/rng.c               |  22 ++++++--
 qapi/qapi-visit-core.c       |   6 ++
 qapi/qobject-input-visitor.c |  16 ++++++
 qom/object.c                 |  32 +++++++++++
 qom/object_interfaces.c      |  22 +-------
 scripts/qapi/expr.py         |  28 ++++++++-
 scripts/qapi/main.py         |   2 +
 scripts/qapi/qom.py          |  91 ++++++++++++++++++++++++++++++
 scripts/qapi/schema.py       | 106 +++++++++++++++++++++++++++++++++++
 qapi/meson.build             |   3 +
 qapi/trace-events            |   1 +
 17 files changed, 362 insertions(+), 61 deletions(-)
 create mode 100644 scripts/qapi/qom.py

-- 
2.31.1


