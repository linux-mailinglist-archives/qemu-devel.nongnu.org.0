Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3B300E5B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:58:58 +0100 (CET)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33WD-00015D-IQ
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:58:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33JG-0005Mk-9q
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33JE-0002r2-Ka
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sSVJPiFM/HMkCEdAbnP7bBtVMLTKlt4k6iyXw4vLl4=;
 b=CVMrQQBkiKImwb0u9jsRCABt2VG+uXyU13pIbW4Jiwwp5lUWidvePViQxDWi9gJxtxaLjq
 6zJOvUIPf8u+ywTBGhl07aYCD3wSa/WdLdfkTMZcY4eziBHdUxh6zmJl2SY+WuybOsC2na
 0TwcdRI37B3uPxZ/OuoTrDXM8miRDbk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-ckBIqQGtP16r3NbNiKxgFA-1; Fri, 22 Jan 2021 15:45:29 -0500
X-MC-Unique: ckBIqQGtP16r3NbNiKxgFA-1
Received: by mail-ed1-f70.google.com with SMTP id e25so3498946edq.6
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1sSVJPiFM/HMkCEdAbnP7bBtVMLTKlt4k6iyXw4vLl4=;
 b=RBXS2xkyWzeTHCG6FFNx1S3rczZr/CvpzO34LcypYtB++LTwSVuDNtdci/S/iuTbTC
 sRFCbp2J6fe9uCXgsL4SkhiQI/WfK0LDNpJENzbMK0EzakKt6sMthqyuFlKy87DrfSXP
 zG6QQZmyHvtKynqRA84EvxPEb+k0+P5vNlodDlD4GvwbUFASeGWvQAjjnnIa2FrhNC3j
 XXj+gtorZL2eIYO6NJP6B5hfS7QmdsC+6fUcWpIWVC7efC0fkMt4m+S/iHOvuVUQ96yQ
 bKKoYqRctFCVh9rkNH9f4k/mbq3cMzwivKeLCG3aeWPkFH7nXvjuL0LQrfQ5UGg5DMO3
 ChbQ==
X-Gm-Message-State: AOAM532DAUh5kVr03DuILUh6PTNsig1tqPKqEKITu8nK9d8uWkUSkNSa
 rTcNfEQpmDhTVybBXEQO2ZcTQXENtH8pz2rEqPMao/QNpNGasNVfg5gFR1asW5x7ikNnICEPiB2
 0f67dYSJV275ob2DnObt623pk9L7A18ySA0gXWRHBQ0+q1qnv4ZKxccnlfIorq8zx
X-Received: by 2002:a17:906:b09a:: with SMTP id
 x26mr4311199ejy.199.1611348327909; 
 Fri, 22 Jan 2021 12:45:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSSSUc6ccllUsuxt4KcqxtQeWLqsB8IQLj0oz3GIvQz1nechOU3/BDjygXDKw/Xhp9Vh/aPg==
X-Received: by 2002:a17:906:b09a:: with SMTP id
 x26mr4311182ejy.199.1611348327712; 
 Fri, 22 Jan 2021 12:45:27 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id co6sm6272491edb.96.2021.01.22.12.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:45:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 08/12] meson: Restrict emulation code
Date: Fri, 22 Jan 2021 21:44:37 +0100
Message-Id: <20210122204441.2145197-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 396ea3aa19b..b5afa2923b3 100644
--- a/meson.build
+++ b/meson.build
@@ -1809,16 +1809,18 @@
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
-decodetree = generator(find_program('scripts/decodetree.py'),
-                       output: 'decode-@BASENAME@.c.inc',
-                       arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
+if have_system or have_user
+  decodetree = generator(find_program('scripts/decodetree.py'),
+                         output: 'decode-@BASENAME@.c.inc',
+                         arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
+  subdir('libdecnumber')
+  subdir('target')
+endif
 
 subdir('audio')
 subdir('io')
 subdir('chardev')
 subdir('fsdev')
-subdir('libdecnumber')
-subdir('target')
 subdir('dump')
 
 block_ss.add(files(
-- 
2.26.2


