Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52DB3C9F8E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:35:02 +0200 (CEST)
Received: from localhost ([::1]:57260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m41W1-0003mf-QJ
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m41TL-0000ad-4k
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:32:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m41TJ-0008F0-91
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626355932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=n3GlTYNmJoyDR8WFc2J6QaEdaIOZ5W4hodzWgv6HC1o=;
 b=SweXoDbp2E9rkeMAH/qYvZVpc8OiDK86AkKJschZ/R2/Kb0RPGcKKiBwIosB/7DhxGSy8+
 0NOsvvQ1IN2EDpsU6IgYmMz+6WzUGpA4tgOm5CoDnDHEs6Ql/rdw6CRIjx6HYMVXSvXCP/
 BpH1/tHQ5xwht2nIoOcAf3fSFGv8rQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-hHWoyilfNpWv3Gxj0YHuDA-1; Thu, 15 Jul 2021 09:32:09 -0400
X-MC-Unique: hHWoyilfNpWv3Gxj0YHuDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35C62800D62;
 Thu, 15 Jul 2021 13:32:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E00D869CB7;
 Thu, 15 Jul 2021 13:32:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 68296113865F; Thu, 15 Jul 2021 15:32:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Aravinda Prasad <arawinda.p@gmail.com>, Ganesh Goudar
 <ganeshgr@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-devel@nongnu.org
Subject: spapr_events: Sure we may ignore migrate_add_blocker() failure?
Date: Thu, 15 Jul 2021 15:32:06 +0200
Message-ID: <87tukvaejt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 2500fb423a "migration: Include migration support for machine
check handling" adds this:

    ret = migrate_add_blocker(spapr->fwnmi_migration_blocker, &local_err);
    if (ret == -EBUSY) {
        /*
         * We don't want to abort so we let the migration to continue.
         * In a rare case, the machine check handler will run on the target.
         * Though this is not preferable, it is better than aborting
         * the migration or killing the VM.
         */
        warn_report("Received a fwnmi while migration was in progress");
    }

migrate_add_blocker() can fail in two ways:

1. -EBUSY: migration is already in progress

   Ignoring this one is clearly intentional.  The comment explains why.
   I'm taking it at face value (I'm a spapr ignoramus).  Aside: I doubt
   the warning is going to help users.

2. -EACCES: we're running with -only-migratable

   Why may we ignore -only-migratable here?

By the way, we leak @local_err on failure.  I'll post a patch, but I'd
like my question answered first.


