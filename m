Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3E522BF32
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 09:34:07 +0200 (CEST)
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jysDW-0005pT-1H
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 03:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jysCg-000560-3t
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 03:33:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60716
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jysCd-0007Qv-JH
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 03:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595575990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AIjbf95uEs1NZBAnndNI7S27FugAslc5fm93mSVTI0c=;
 b=gQQrX7o/4bdW3QqilaLZonqbplaiWcfkhPuvW8dmq4t6ARKgQ/pQosXubTlOKOjeyDqQWq
 j1VI0wN+YWYKPlgKDlDKxyCLcuTzQltR5kUZSsgwFJvGIEpvW6RO6IWKO+dRGE0pt0sOi8
 qn2mdkhQeFOq6VVydDIhI/rsuSb3Nwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-IXGSR99yPZ-uvwGYxauwrQ-1; Fri, 24 Jul 2020 03:33:08 -0400
X-MC-Unique: IXGSR99yPZ-uvwGYxauwrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFC8B100CCC0;
 Fri, 24 Jul 2020 07:33:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7375A6FEFE;
 Fri, 24 Jul 2020 07:33:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0F230111CA26; Fri, 24 Jul 2020 09:33:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Status of scripts/qmp/ (was: [PATCH 0/3] scripts/qmp/qom-fuse: Scrape
 off the bitrot)
References: <20200723142738.1868568-1-armbru@redhat.com>
 <36a450fb-8072-1223-9253-0446ed23dcd1@redhat.com>
Date: Fri, 24 Jul 2020 09:33:04 +0200
In-Reply-To: <36a450fb-8072-1223-9253-0446ed23dcd1@redhat.com> (Thomas Huth's
 message of "Thu, 23 Jul 2020 17:21:07 +0200")
Message-ID: <874kpxe5an.fsf_-_@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 01:23:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 23/07/2020 16.27, Markus Armbruster wrote:
>> Markus Armbruster (3):
>>   scripts/qmp/qom-fuse: Unbreak import of QEMUMonitorProtocol
>>   scripts/qmp/qom-fuse: Port to current Python module fuse
>>   scripts/qmp/qom-fuse: Fix getattr(), read() for files in /
>
> Could it be added to a CI pipeline, so that it does not bitrot again?

Should it be?

Thread hijack!

What's the status of scripts/qmp/?

The directory is covered by MAINTAINERS section QMP, with status
"Supported".  Status is a *lie* for these scripts.  I inherited them
with the rest of QMP.  I have no use for them, except I occasionally use
qom-fuse for QOM spelunking, mostly because our monitor commands are so
unwieldy compared to a filesystem.  I barely looked at them in the 5+
years of my service as QMP maintainer.  Actual status is "Odd fixes".

Does this stuff have any business in /scripts/?

Nothing in scripts/qmp/ should be shipped.

scripts/qmp/qemu-ga-client doesn't even belong there.  Michael, is it of
any use today?

I know scripts/qmp/qmp-shell has a few friends among developers.  I
regard it as a failed attempt at making QMP easier for humans, and have
zero interest in it.

scripts/qmp/qmp looks like an attempt at making QMP easier for shell
scripts.  I'm not aware of actual use, and have zero interest in it.

scripts/qmp/qom-{get,list,set} look like an attempt at making QOM easier
for shell scripts.  I'm not aware of actual use, and have zero interest
in it.  Heck, I can't even figure out how to use qom-get (I just spend
at least 30s trying).

scripts/qmp/qom-tree feels redundant with scripts/qmp/qom-fuse.  I just
ran it for the first time just to come to this judgement.

I believe contrib/ would be a better home for all of them.

I feel like moving the directory there and leaving it *uncovered* in
MAINTAINERS.  If a volunteer steps forward, we can add a suitable
section.

Opinions?


