Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487671F8D9F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 08:18:34 +0200 (CEST)
Received: from localhost ([::1]:48930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkiS1-0001fU-CI
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 02:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkiQm-0000mw-Cg
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 02:17:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39529
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkiQk-0001Rl-Pe
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 02:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592201834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QwzuuAUR2h2ruDFn80cmgIjNtA1VAqkei+4J12gtvPM=;
 b=OwQUwE/FFQusYRD4ETYg37VscFxMnxZHWjAxH32btv/mRqO9+CQCeDsWRKukJRfkdVf1is
 8+jsTKiYSNzf02lmOnMMX+WLQutTibUldJ9uz+QIEz2IGXYGsH8xr+5x0IDweN7sAiab5D
 J47uzkVAwb0xUDksS+d8VM4g1pm6+YI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-bqOL8FlMPTiK4RBuBw3CIA-1; Mon, 15 Jun 2020 02:17:10 -0400
X-MC-Unique: bqOL8FlMPTiK4RBuBw3CIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 945357BAC
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 06:17:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57E7110013D6;
 Mon, 15 Jun 2020 06:17:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CFB3A1138648; Mon, 15 Jun 2020 08:17:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] hmp: Make json format optional for qom-set
References: <20200610075153.33892-1-david@redhat.com>
Date: Mon, 15 Jun 2020 08:17:04 +0200
In-Reply-To: <20200610075153.33892-1-david@redhat.com> (David Hildenbrand's
 message of "Wed, 10 Jun 2020 09:51:53 +0200")
Message-ID: <87pna0c0pr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:17:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> Commit 7d2ef6dcc1cf ("hmp: Simplify qom-set") switched to the json
> parser, making it possible to specify complex types. However, with this
> change it is no longer possible to specify proper sizes (e.g., 2G, 128M),
> turning the interface harder to use for properties that consume sizes.
>
> Let's switch back to the previous handling and allow to specify passing
> json via the "-j" parameter.

Two issues:

1. Makes qom-get and qom-set inconsistent

   qom-get formats as JSON, always.

   qom-set parses the string visitor's undocumented ad hoc language by
   default.  You can make it parse JSON by passing -j.

   Not a show stopper, but sure ugly.  I feel documentation should point
   it out.

2. Rearms the string visitor death trap

   If you try to qom-set a property whose ->set() uses something the
   string input visitor doesn't support, QEMU crashes.  I'm not aware of
   such a ->set(), but this is a death trap all the same.  Mind, I
   didn't actually *look* for such a ->set().  Details:

    Subject: Re: [RFC PATCH] qom: Implement qom-get HMP command
    Date: Sat, 02 May 2020 08:02:43 +0200 (6 weeks, 2 days, 4 minutes ago)
    Message-ID: <87a72q6fi4.fsf@dusky.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2020-05/msg00178.html

   Since we've had this death trap in the code for a number of years, I
   can't call its restoration a show stopper.  It does feel like an
   unadvisable risk, though.


