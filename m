Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26E356070B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 19:10:48 +0200 (CEST)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6bDD-0005Ky-C6
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 13:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6b9O-0002JA-OY
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 13:06:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6b9K-0004gO-VI
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 13:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656522405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=940aQSPhyz+bCo9e9tDJ4NqmCg+eACfbz/lFskNOtEc=;
 b=ef8SA09DRW1CJsvTl3tz7jlVQIoMgNWHvlsQ13WmPkniKvo20mWj3gYFgqS7NuYKnZR/Lt
 76Wyt8NB83ojyh/p+Z3ttJeyehxa/jvFy2Zv6cCQHdewqqAftkBeoJJBPUvqRIe8bOrG1b
 Xd/TtFcYy5HqRWWP/b2vX8FyObDBOK0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-1xxcxBP9NU6KqsxWmlLhDQ-1; Wed, 29 Jun 2022 13:06:42 -0400
X-MC-Unique: 1xxcxBP9NU6KqsxWmlLhDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7354101A592;
 Wed, 29 Jun 2022 17:06:41 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 072EC2166B29;
 Wed, 29 Jun 2022 17:06:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/3] gitlab: stopp edk2/opensbi jobs running in forks by
 default
Date: Wed, 29 Jun 2022 18:06:35 +0100
Message-Id: <20220629170638.520630-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

When we introducd the QEMU_CI variable to control running of pipelines
in gitlab forks, we didn't include the ekd2/opensbi jobs in the rules.
This caused pipelines to be unexpectedly created in some cases. This
addresses that oversight.

Daniel P. Berrangé (3):
  gitlab: normalize indentation in edk2/opensbi rules
  gitlab: tweak comments in edk2/opensbi jobs
  gitlab: honour QEMU_CI variable in edk2/opensbi jobs

 .gitlab-ci.d/edk2.yml    | 133 ++++++++++++++++++++++----------------
 .gitlab-ci.d/opensbi.yml | 134 +++++++++++++++++++++++----------------
 2 files changed, 158 insertions(+), 109 deletions(-)

-- 
2.36.1


