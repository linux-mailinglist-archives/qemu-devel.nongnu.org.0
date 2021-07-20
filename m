Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2D3CFE55
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:56:48 +0200 (CEST)
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5s6x-000365-Pf
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5s4x-0000E0-6u
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5s4v-0004zf-Jm
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626796480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M/19t21x8oGJuFM8pnwMY22YefGYL4DL+kFnzsCuMVg=;
 b=J+8VybyeAvriizhvCQq/BQ7eYSWMZxyUcbuonlW3f1tiuQ9GjTyXZKxXRScXBdxQPUtQNA
 zPcUOSRLBQoKWMhyZaTqB207V5AQQ65IoziVrG20qHwM+3SF8eZqXRvfwEiFqQcw1mseGE
 +dorbXrCSie+qV9jNTXWmDLd4s2La7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-Pk1jR-btNGOAbqpxq1dIqQ-1; Tue, 20 Jul 2021 11:54:39 -0400
X-MC-Unique: Pk1jR-btNGOAbqpxq1dIqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85F2B362F8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 15:54:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C75AD19C59;
 Tue, 20 Jul 2021 15:54:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F40111326B9; Tue, 20 Jul 2021 17:54:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/2] qapi/qom: use correct field name when
 getting/setting alias properties
References: <20210719104033.185109-1-pbonzini@redhat.com>
Date: Tue, 20 Jul 2021 17:54:33 +0200
In-Reply-To: <20210719104033.185109-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 19 Jul 2021 12:40:31 +0200")
Message-ID: <87czrddlqe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Running out of time for today, so I'm sending what I have, with real
review to follow.


First, let me describe what's wrong in my own words, because that's how
I understand stuff.

Reproducer (hidden behind the link to the bug tracker):

    $ qemu-system-x86_64 \
     -blockdev '{"driver":"file","filename":"/usr/share/edk2/ovmf/OVMF_CODE.fd","node-name":"pflash0-storage","auto-read-only":true,"discard":"unmap"}' \
     -blockdev '{"node-name":"pflash0-format","read-only":true,"driver":"raw","file":"pflash0-storage"}' \
     -machine pc,pflash0=pflash0-format

The -machine gets (keyval-)parsed into a QDict, which is then processed
by object_set_properties_from_qdict() with the (keyval) QObject input
visitor.  Makes sense.

object_set_properties_from_qdict() performs a virtual struct visit
guided by the QDict's keys.  It calls object_property_set() for each
key.

For "pflash0", this calls object_property_set(obj, "pflash0", v, &err).
Since "pflash0" is a QOM alias property, this in turn calls
object_property_set(prop->target_obj, "drive0", v, &err), where prop is
the alias property, and prop->target_obj is the "cfi.pflash01" device.

Since "drive" is a drive property, this calls set_drive(), which calls
visit_type_str(v, "drive", &str, errp).  Fails, because the QDict
wrapped in visitor @v does not have a "drive" member, it has a "pflash0"
member.


Next, the solution.  I get the idea of a wrapper visitor which gives you
"pflash0" when you ask for "drive", but oh boy do I wish we could fix
the bug with a lot less code.


