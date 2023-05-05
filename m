Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92DE6F810C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 12:52:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1put2c-0005ZN-37; Fri, 05 May 2023 06:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1put2Z-0005Yw-Bc
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:51:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1put2X-0000jv-Vq
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683283908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=NvFAVu81xv+IWDCQ4Ov1ci7g+jz8o4vYQsuoVrOI+Gg=;
 b=NiiI1m1bCX31K+gqMvpnP+vJdcmSzZvNy+lYgoQ8DryH5WznzQVcgT41akXuMp0eKrryvO
 TyvXr4yqvSyx5yNL0nTeJIBl5L1P0apAxDjE3nMClw4ct8Iug7beU3y/iL12mo2AM4MyRX
 jlKxkyNqd1XntKOJL2u5n8KlM2paKL0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-vmDb73YiPyaxtFG541Bi1A-1; Fri, 05 May 2023 06:51:47 -0400
X-MC-Unique: vmDb73YiPyaxtFG541Bi1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 286A1293248D
 for <qemu-devel@nongnu.org>; Fri,  5 May 2023 10:51:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05E1F2166B31
 for <qemu-devel@nongnu.org>; Fri,  5 May 2023 10:51:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB70B21E6924; Fri,  5 May 2023 12:51:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: migration/rdma.c's macro ERROR()
Date: Fri, 05 May 2023 12:51:45 +0200
Message-ID: <87sfcbuk3i.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

migration/rdma.c has

    /*
     * Print and error on both the Monitor and the Log file.
     */
    #define ERROR(errp, fmt, ...) \
        do { \
            fprintf(stderr, "RDMA ERROR: " fmt "\n", ## __VA_ARGS__); \
            if (errp && (*(errp) == NULL)) { \
                error_setg(errp, "RDMA ERROR: " fmt, ## __VA_ARGS__); \
            } \
        } while (0)

This is problematic.  The point of error_setg() & friends is detectin
errors from handling them.  error.h:

 * - Separation of concerns: the function is responsible for detecting
 *   errors and failing cleanly; handling the error is its caller's
 *   job.  [...]

Reporting the error to stderr violates this principle.  Consequences
include

* When the caller reports the error to stderr, it gets reported there
  twice, possibly in slightly different form.

* When the caller recovers from the error cleanly without reporting it,
  it is reported to stderr anyway, even though it is not actually an
  error.

Mind if I kill the macro?


