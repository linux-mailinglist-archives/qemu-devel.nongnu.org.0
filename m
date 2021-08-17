Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1951C3EE8F4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 10:59:50 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFuwn-0002nl-4P
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 04:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mFuv7-0000hO-70
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mFuv4-0005jI-Oh
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629190682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x2atGxmucT18X81zqhvyUrfompCg2irwNwZJTCW2KaI=;
 b=DMDt6u8oa2I7m/TmWimtv0i3UNL6R/xwWWMensMOqZP2Ka0ssQIzc6ilnW0I39OOMkQr3K
 +ZEJoXZvoz+fnfk8jNB9L3804iz70lZu3C3SR6hZcNAqXyxvVoR3v03VmYoaapjOdoliwi
 yLwBsFiyqbPjUm7fgArmRGfyiz0G2DE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-jptZLQVcPui8MxYKkzaTSg-1; Tue, 17 Aug 2021 04:56:41 -0400
X-MC-Unique: jptZLQVcPui8MxYKkzaTSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD62DC7441
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:56:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83D9360C81;
 Tue, 17 Aug 2021 08:56:36 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Two chardev with fdset fixes
Date: Tue, 17 Aug 2021 10:56:26 +0200
Message-Id: <cover.1629190206.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was working on libvirt, trying to make it pass a pre-opened FD for a
chardev's logfile. I've spent non-negligible amount of time trying to
figure out why I was getting EACCESS error when QEMU definitely was able
to access the FD. Well, found the problem and here is my attempt to save
future me from figuring it out again.

NB, I'm not fully convinced that EBADFD is the best value, but anything
is better than EACCESS.

Michal Privoznik (2):
  chardev: Propagate error from logfile opening
  monitor: Report EBADFD if fdset contains invalid FD

 chardev/char.c | 7 ++-----
 monitor/misc.c | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

-- 
2.31.1


