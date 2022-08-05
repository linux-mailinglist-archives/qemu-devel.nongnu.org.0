Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0326E58AA72
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 14:02:24 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJw24-0002gn-3Q
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 08:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJvvU-00022u-RH
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJvvR-0000dq-Uc
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659700533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zqgWOcMDEjUFe+ShxNmyhr8Ld0lwqiH8gFQ7hcV2nVw=;
 b=QA1Ma4WpxjasciV5lR7MukDLpmxtleVzwgAXHfUH0jq0MPYivSu2es7jdMUBueal1OgqQn
 dIW+lsfuZgUEiLOfH71B6/9KgkT/zxPR5nNr/0BtGQA3ZihFCELrhjWvPw+Lpskg8kkA8n
 WcyymYjhYsD+oFjRJqqQtsm9gu7TV4g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354--XGCZNEwO7qdA9PzK5l53g-1; Fri, 05 Aug 2022 07:55:32 -0400
X-MC-Unique: -XGCZNEwO7qdA9PzK5l53g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9805101A589
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 11:55:31 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5B252026D4C;
 Fri,  5 Aug 2022 11:55:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/1] tests/qtest: add testing coverage of -readconfig
Date: Fri,  5 Aug 2022 12:55:28 +0100
Message-Id: <20220805115529.124544-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I reviewing Paolo's latest fix for -readconfig I noticed that we have
absolutely zero coverage of -readconfig under tests/, which makes it
way too easy for regressions to slip in.

This following patch doesn't do much, but it tests the last three
regressions we've had and gives a starting point for more testing
of -readconfig.

Daniel P. Berrangé (1):
  tests/qtest: add scenario for -readconfig handling

 tests/qtest/meson.build       |   1 +
 tests/qtest/readconfig-test.c | 195 ++++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+)
 create mode 100644 tests/qtest/readconfig-test.c

-- 
2.37.1


