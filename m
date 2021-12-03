Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54BF46802E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:14:50 +0100 (CET)
Received: from localhost ([::1]:43502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHlR-0005kN-9G
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:14:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHkA-0004xp-V1
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHk8-0001gf-4x
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=oUWBWjJQ6f4K0WpqYUATM5jw6+bn9bfsKOi8oHqvMXs=;
 b=T9O4Kbyt0fuwmfIDTQdrIlxRFQQ1HfV7BrRHbAgaWWNI2oHY4Cz+ddlLjQO5+RiEgU7KoH
 Am3/NOhP9AAPCHEpNcmdlBOq1hamhg7PDYuxicgkEWCeLIcgmRh0u/s16QLQCmSDr14JBb
 ry3+i0vXTB43jZI1PcANACDS//muVx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-mB8c7q_CNFWc32G3GC4dig-1; Fri, 03 Dec 2021 18:13:23 -0500
X-MC-Unique: mB8c7q_CNFWc32G3GC4dig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3771A1808321;
 Fri,  3 Dec 2021 23:13:22 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A00AA60BE5;
 Fri,  3 Dec 2021 23:13:09 +0000 (UTC)
Date: Fri, 3 Dec 2021 17:13:07 -0600
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 vsementsov@virtuozzo.com, libguestfs@redhat.com, nsoffer@redhat.com
Subject: RFC for NBD protocol extension: extended headers
Message-ID: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20211029-46-a5fba3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In response to this mail, I will be cross-posting a series of patches
to multiple projects as a proof-of-concept implementation and request
for comments on a new NBD protocol extension, called
NBD_OPT_EXTENDED_HEADERS.  With this in place, it will be possible for
clients to request 64-bit zero, trim, cache, and block status
operations when supported by the server.

Not yet complete: an implementation of this in nbdkit.  I also plan to
tweak libnbd's 'nbdinfo --map' and 'nbdcopy' to take advantage of the
larger block status results.  Also, with 64-bit commands, we may want
to also make it easier to let servers advertise an actual maximum size
they are willing to accept for the commands in question (for example,
a server may be happy with a full 64-bit block status, but still want
to limit non-fast zero and cache to a smaller limit to avoid denial of
service).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


