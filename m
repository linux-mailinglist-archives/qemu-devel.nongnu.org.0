Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C4419CB4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:29:56 +0200 (CEST)
Received: from localhost ([::1]:53234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuRv-0001Hv-PL
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu32-0004uS-FH
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu30-0003za-PG
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8K9ed+faCJSkU8JIvgLkS2K6sq/kvjt1grHOu9ILGo=;
 b=LRUmy4cqLPc/kNzpN8FWlvTH3O1XhGAVdin9hum8e8hTdeXAUBWg3tk2/n5oGurgUlitCe
 zc8w1fd4VOJkTuTnDZeHeEaeDCM4UNylkmB4m9qhqVKZUb2y+tNwjTZsbyJq/weIit23jL
 26XioW8oLIIMlTZd6vXDvsLcPBq0MR4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-Pc6hvbmbMtG0oFGsNOMoHQ-1; Mon, 27 Sep 2021 13:03:59 -0400
X-MC-Unique: Pc6hvbmbMtG0oFGsNOMoHQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a17-20020adfed11000000b00160525e875aso6792558wro.23
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G8K9ed+faCJSkU8JIvgLkS2K6sq/kvjt1grHOu9ILGo=;
 b=qRoh7brbUYBcl6OYvWh4qXX0YQqaZlji54GDMmCnJAD/IeNL5z3LLZLBKuNL/kdSzG
 78UMStLWOE5Aw9td1lx6/pHlp0I1TBLTAU+62HzUy9ZlTgciPEG9UsW8NbhvOVfqTYbP
 TvFMq2lh0iw18b7bvTcBeyMK0avZ9MpK1q5f/8uJWUKrXSVT1O100tG3devRP6TTdPun
 e1gu2W9HMFyCPHAIcet7X6TDD2vIFjNthXMzoQ752AxrQU2Et4J+JlwbPCNnxRT1saoT
 xHbsWUckEJ+tDdLxr3/iidtL0aiZDC0TpHVtmJygSCq3b5J2lnVYQyGKCp7WCi7WZgIt
 p3eQ==
X-Gm-Message-State: AOAM530nGBC33/jq1EK4o0Y01w6PKCoQ8IEtlmJM4/GOjDH7/mhhbJWC
 NXQZVCFYpKC/+5zIruwvJNwuT/oPYzdKaWGge5INvZunPStnJJMiod/xTJMhbe20JTceLCYpUuI
 Dx4+NbRhmhpVvpTjddOW8CA3hokIKQwU0ovCrekxUiDcAx7vnD22KqqhiXTYE7r6H
X-Received: by 2002:a5d:648f:: with SMTP id o15mr1100112wri.338.1632762238475; 
 Mon, 27 Sep 2021 10:03:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz75V6uYtT4cC4DSP6bYlb9To2lsg3o4tIIBBW4hgvGXOs0I+m+1aXqFyIbQowgUtSICzdnrw==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr1100076wri.338.1632762238198; 
 Mon, 27 Sep 2021 10:03:58 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id a25sm65327wmj.34.2021.09.27.10.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] tests/acceptance/ppc_prep_40p.py: NetBSD 7.1.2 location
 update
Date: Mon, 27 Sep 2021 19:02:26 +0200
Message-Id: <20210927170227.2014482-21-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

The NetBSD-7.1.2-prep.iso is no longer available on the CDN, but it's
still available in the archive.

Let's update its location so that users without the file on cache can
still fetch it and run the test.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210924185506.2542588-15-crosa@redhat.com>
---
 tests/acceptance/ppc_prep_40p.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
index 2993ee3b078..6b28a69ea59 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/acceptance/ppc_prep_40p.py
@@ -67,8 +67,8 @@ def test_openbios_and_netbsd(self):
         :avocado: tags=machine:40p
         :avocado: tags=os:netbsd
         """
-        drive_url = ('https://cdn.netbsd.org/pub/NetBSD/iso/7.1.2/'
-                     'NetBSD-7.1.2-prep.iso')
+        drive_url = ('https://archive.netbsd.org/pub/NetBSD-archive/'
+                     'NetBSD-7.1.2/iso/NetBSD-7.1.2-prep.iso')
         drive_hash = 'ac6fa2707d888b36d6fa64de6e7fe48e'
         drive_path = self.fetch_asset(drive_url, asset_hash=drive_hash,
                                       algorithm='md5')
-- 
2.31.1


