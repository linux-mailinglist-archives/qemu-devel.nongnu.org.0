Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06B84E3D8E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:27:34 +0100 (CET)
Received: from localhost ([::1]:35696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWcfl-0002JW-SJ
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:27:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWcbT-0005py-9Z
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWcbP-000147-B5
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647948182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jLRtsE9lxIMor9GyU3rWjW7z3rUh06pfIn4v+NFb/mw=;
 b=aBEuHEyNLfpZYXhhwSXpT984CK8G2v3bp2EowJ+jLWxAN0Hdog2CsbZWlggMyxIMoCwzzD
 0ppOUMyLCZwRrTciir2tYpJnMGmwAgT3GTBsoxTj+Bbo2ytOnhcwmemOZ/npChxKMVtEpq
 H5jWIGZDCPfCb2TSQVWCMc1NHzEa41Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-bruVjBKZN0WJ2Bt__c2oiA-1; Tue, 22 Mar 2022 07:22:59 -0400
X-MC-Unique: bruVjBKZN0WJ2Bt__c2oiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3A08185A7A4;
 Tue, 22 Mar 2022 11:22:58 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53B7F40D2822;
 Tue, 22 Mar 2022 11:22:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] s390x/cpu_models: make "max" match the unmodified
 "qemu" CPU model under TCG
Date: Tue, 22 Mar 2022 12:22:54 +0100
Message-Id: <20220322112256.118417-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's simplify the "max" CPU model and just make it correspond to the
"qemu" CPU model of the latest QEMU machine from now on. This gets rid of
a warning we print when starting QEMU with "-cpu max".

Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Daniel P. Berrangé <berrange@redhat.com>

David Hildenbrand (2):
  s390x/cpu_models: drop "msa5" from the TCG "max" model
  s390x/cpu_models: make "max" match the unmodified "qemu" CPU model
    under TCG

 target/s390x/cpu_models.c   | 26 +++++++-------------------
 target/s390x/gen-features.c | 13 ++++++-------
 2 files changed, 13 insertions(+), 26 deletions(-)

-- 
2.35.1


