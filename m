Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180AF6FA259
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 10:34:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvwIb-0007mQ-J6; Mon, 08 May 2023 04:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pvwIY-0007lz-G3
 for qemu-devel@nongnu.org; Mon, 08 May 2023 04:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pvwIW-0003Cm-OE
 for qemu-devel@nongnu.org; Mon, 08 May 2023 04:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683534763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=K+3wURYqvKcZpahXwjGg1s/RZJQScidrAbaZoomwtts=;
 b=HrIcHefxWI53xEQhG2bvyXuiNttz1/+rqhBtEf2kmzlBvUy2ELuentX1XCySOsf24RKHzu
 hLHAOTeBx7SHzoP+Dy0rtQlep+1kPK8SaM9NAICd3WA5Q4KtYJarhV0tbVxJTF3FtVw2Z5
 3fXNXBDg3/QSXh34oXL10fDIJ/YbZrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-K_0S4deyOnm7xeuXtXr0RQ-1; Mon, 08 May 2023 04:32:41 -0400
X-MC-Unique: K_0S4deyOnm7xeuXtXr0RQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A77A85A5A3
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 08:32:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67DCE40C6F42
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 08:32:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 32A4C21E6924; Mon,  8 May 2023 10:32:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: How can I find problematic uses of error_report() with vrc?
Date: Mon, 08 May 2023 10:32:40 +0200
Message-ID: <87v8h3mdef.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Calling error_report() from within a function using Error to return
error information is almost always wrong.  Example:

    QMP command qmp_migrate()
    calls rdma_start_outgoing_migration()
    calls qemu_rdma_source_init()
    calls qemu_rdma_reg_control()

The first four have an Error **errp parameter, and use it to return
error information.  Good.

The last one does not.  Instead, qemu_rdma_reg_control() calls
error_report() on failure:

    error_report("qemu_rdma_reg_control failed");
    return -1;

Its caller qemu_rdma_source_init() detects the failure and sets an
error:

        ret = qemu_rdma_reg_control(rdma, idx);
        if (ret) {
            error_setg(temp, "RDMA ERROR: rdma migration: error registering %d control!",
                                                            idx);
            goto err_rdma_source_init;
        }

Because of this, QMP command migrate spams stderr on this particular
failure.  Inappropriate.

Easy enough to fix, but I'm after the error pattern, not a single
instance that happened to catch my eye.

Problem: find call chains from functions using Error to error_report().

Two sub-problems:

1. Find functions using Error

   Doesn't have to be perfect.  I have a simple Coccinelle script
   (appended) that spits out some 4400 functions.  I run it like

    $ spatch --sp-file find-error-fns.cocci --macro-file scripts/cocci-macro-file.h `git-grep -Fl 'Error **' \*.[ch]`

2. Find call chains from these functions to error_report()

   I'm hoping vrc can do that for me.  How?



Here's my find-error-fns.cocci:

@r@
identifier fn, errp;
position p;
@@
 fn@p(..., Error **errp, ...)
 {
     ...
 }
@script:python@
fn << r.fn;
p << r.p;
@@
print(f'{p[0].file}:{p[0].line}:{p[0].column}:{fn}')


