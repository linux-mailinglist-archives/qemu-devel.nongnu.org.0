Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E54E3C334E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 08:52:22 +0200 (CEST)
Received: from localhost ([::1]:38950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m26qa-00058R-QX
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 02:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m26pr-0004S8-19
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 02:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m26pn-0003A7-MX
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 02:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625899889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SdbUkSz0SIHUxOSzOfSFF+4DmvSEKm37FDOPAe5+rGQ=;
 b=bHhei8PqSHY1zOnLBdUhd/UmM3LYV2iNkzq6786PBW6Rd3qDnOqfQ37Jix3KB3mw4I/liV
 lA32s/j8nYLh1KOQKSWW9TJ+aLa1r/AJoDy6CSsqlX0wQPpyOJiNz/nMWLBZVBKeiHLr5W
 CZkMvZXjvIWGrywz0hz3N2RptRU6gKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-BDn-QyFTMgCcZpENLgJq2w-1; Sat, 10 Jul 2021 02:51:26 -0400
X-MC-Unique: BDn-QyFTMgCcZpENLgJq2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90CF2801B0F
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 06:51:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-151.ams2.redhat.com
 [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0BCB19D9F;
 Sat, 10 Jul 2021 06:51:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 71A6F1132B52; Sat, 10 Jul 2021 08:51:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Use of migrate_add_blocker() in qxl.c
Date: Sat, 10 Jul 2021 08:51:20 +0200
Message-ID: <8735sm4q6v.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

migrate_add_blocker() fails when running with --only-migratable, and
when migration is in progress.

qxl.c continues after migrate_add_blocker() fails:

        {
            /*
             * Windows 8 drivers place qxl commands in the vram
             * (instead of the ram) bar.  We can't live migrate such a
             * guest, so add a migration blocker in case we detect
             * this, to avoid triggering the assert in pre_save().
             *
             * https://cgit.freedesktop.org/spice/win32/qxl-wddm-dod/commit=
/?id=3Df6e099db39e7d0787f294d5fd0dce328b5210faa
             */
            void *msg =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
            if (msg !=3D NULL && (
                    msg < (void *)qxl->vga.vram_ptr ||
                    msg > ((void *)qxl->vga.vram_ptr + qxl->vga.vram_size))=
) {
                if (!qxl->migration_blocker) {
                    Error *local_err =3D NULL;
                    error_setg(&qxl->migration_blocker,
                               "qxl: guest bug: command not in ram bar");
                    migrate_add_blocker(qxl->migration_blocker, &local_err)=
;
                    if (local_err) {
                        error_report_err(local_err);
                    }
                }
            }
        }

Why is this safe?  If the blocker is needed to prevent a crash, as the
comment says, then what prevents the crash when adding the blocker
fails?

Code goes back to

    commit 86dbcdd9c7590d06db89ca256c5eaf0b4aba8858
    Author: Gerd Hoffmann <kraxel@redhat.com>
    Date:   Mon Apr 10 13:31:31 2017 +0200

        qxl: add migration blocker to avoid pre-save assert

        Cc: 1635339@bugs.launchpad.net
        Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
        Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
        Message-id: 20170410113131.2585-1-kraxel@redhat.com


