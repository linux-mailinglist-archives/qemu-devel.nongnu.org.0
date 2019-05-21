Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC0A257DC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 20:56:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT9vu-00010S-FX
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 14:56:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hT9u7-0008JL-3b
	for qemu-devel@nongnu.org; Tue, 21 May 2019 14:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hT9rG-0005Qs-0W
	for qemu-devel@nongnu.org; Tue, 21 May 2019 14:51:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33616)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hT9r8-0005Jq-Sj
	for qemu-devel@nongnu.org; Tue, 21 May 2019 14:51:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A24C781DFE;
	Tue, 21 May 2019 18:51:10 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F257F5C269;
	Tue, 21 May 2019 18:51:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue, 21 May 2019 15:50:59 -0300
Message-Id: <20190521185059.28236-4-ehabkost@redhat.com>
In-Reply-To: <20190521185059.28236-1-ehabkost@redhat.com>
References: <20190521185059.28236-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 21 May 2019 18:51:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/3] target/i386: add MDS-NO feature
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Microarchitectural Data Sampling is a hardware vulnerability which allows
unprivileged speculative access to data which is available in various CPU
internal buffers.

Some Intel processors use the ARCH_CAP_MDS_NO bit in the
IA32_ARCH_CAPABILITIES
MSR to report that they are not vulnerable, make it available to guests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20190516185320.28340-1-pbonzini@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 953d78b062..2f151dad8c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1184,7 +1184,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = MSR_FEATURE_WORD,
         .feat_names = {
             "rdctl-no", "ibrs-all", "rsba", "skip-l1dfl-vmentry",
-            "ssb-no", NULL, NULL, NULL,
+            "ssb-no", "mds-no", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-- 
2.18.0.rc1.1.g3f1ff2140


