Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E0141FBFC
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 14:59:52 +0200 (CEST)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWecI-0000nC-58
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 08:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWL-0000nh-1C
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWF-0000bj-U4
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4CQJdzlwnG2lhh6cD8LFOTW/FEZbmRSxqmO9AK0wf0=;
 b=I/8Xp4e2E+WL79W0XSEGvCPifPK2bhUerJaAixHYDFZv4YtEtGwgifBZfuqgqJArFiN9uv
 5gGYpeRpnDETEKJ+MTpICjYpUmp96vczUjcQTJjIldTeuBS8fsqQRyvn/I138ozLwAa/qg
 GZ0H3LpZNUz3uE+bPo0Ayf3AbKAJxNM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-I_kytIYQO82RzGiTfR4QbQ-1; Sat, 02 Oct 2021 08:53:34 -0400
X-MC-Unique: I_kytIYQO82RzGiTfR4QbQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so3497210wrg.10
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g4CQJdzlwnG2lhh6cD8LFOTW/FEZbmRSxqmO9AK0wf0=;
 b=QIgtw185XQIXS74KdB5Enbz3jgRPQ+LMLPa2/JUKnjL5t6AZoDCZD1cThCBTq/fxmY
 TdLElt5YVHaFoYcCVn5Q4JWBtHUA6MDrk48dyaNFBtdnR1uReCaZttmmzKfCAKi+UWr+
 8R/9xjEhEYVhMhzY//38KY3HJONcf734XCFbXz4niSQxWoACAZtHJzk2JyIKlD75PTor
 YqmBdZhsnjr7n1eZ1u5MhjOVcKFgzpbYyVMBapAeX+Uzm8EQ6jTzZ5ffkZdmPCDbv8Wc
 oTRM62z0hS8JE4UGLQtzfVHR72GVbT0wO9oN22rUo/bwBOj5yE/8cTtgvYNHr2vUtgsT
 YgRA==
X-Gm-Message-State: AOAM533VQ261Xx27AA/rfFb0ewTh0vt2lSlDsXZ/dvlYnTPGaP2eaTlT
 DfIOEY9WKBWZPdbZljqWahjFkZLfrkRwLQzt1TxE4bs9+QL5Zejc6lSz922TvJUVpRceahyhIW1
 E4Azc9l61AOMLkG1Qt5wi8VAHX/UFHWPgK6H9XFr43PXVg6hEeO1AJAQROKRjlkNc
X-Received: by 2002:a05:600c:240a:: with SMTP id
 10mr9368895wmp.170.1633179213210; 
 Sat, 02 Oct 2021 05:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVukirZxFLCnS0tPkLQb551+kxcHjcGyPtCd0pzUdBEUoIeuKLgKAGClPI+IvXqQdALVy20Q==
X-Received: by 2002:a05:600c:240a:: with SMTP id
 10mr9368862wmp.170.1633179212853; 
 Sat, 02 Oct 2021 05:53:32 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 n17sm8399735wrp.17.2021.10.02.05.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:53:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/22] target/i386/kvm: Introduce i386_softmmu_kvm Meson
 source set
Date: Sat,  2 Oct 2021 14:52:58 +0200
Message-Id: <20211002125317.3418648-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the i386_softmmu_kvm Meson source set to be able to
add features dependent on CONFIG_KVM.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/kvm/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index 0a533411cab..b1c76957c76 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -1,8 +1,12 @@
 i386_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 
-i386_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files(
+i386_softmmu_kvm_ss = ss.source_set()
+
+i386_softmmu_kvm_ss.add(files(
   'kvm.c',
   'kvm-cpu.c',
 ))
 
 i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
+
+i386_softmmu_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
-- 
2.31.1


