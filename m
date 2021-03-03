Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6736932B9D7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:26:50 +0100 (CET)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWCv-0002ft-FS
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8o-0004Y0-4I
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:22:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8m-0000NR-70
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQjkhbMoK/p110+ezCXx6XyhC9yOCxnNoBGV8HeX/9Y=;
 b=f7Qvt0ELbIKR8nvOAxiMNxmjPdQQ7L/7Yp4LutznWVTOAJv4iK3upBFgZLBS+T78kYE5MM
 DbBg6UJT7bUBOxFmklN8l5TTFEiqUlqfORq5KTGlFslrWAlhcDqkLVeD2uhMTw089HVjDE
 MRD8VVqnR9AGglh1+SCZK8pXDv4Bao0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-AqXmcZt6Pt-I-WkvLaq9Hw-1; Wed, 03 Mar 2021 13:22:29 -0500
X-MC-Unique: AqXmcZt6Pt-I-WkvLaq9Hw-1
Received: by mail-wr1-f69.google.com with SMTP id i5so11572301wrp.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQjkhbMoK/p110+ezCXx6XyhC9yOCxnNoBGV8HeX/9Y=;
 b=oBs9ORWYP8Zj3zcuWokHgYy46Xs3T8V6XynEZ8xBXOcE9okZL9FKfcwuAkaVZQRraL
 qWTKzNZR1MmJBbgNRy4CUIOHQgOkuGlInBZL0+nlGfCcZpoYUA/Iok74EXCa1APz2k+q
 rZHvCqdrTDjAtSgQDaI1S7aYpx9qZj0wjxMuP2F4lIP/V3RtsvZTDte0R5kYASFTOxuH
 iPhEzDyeNiiK2szNj5pSwaQw7FfvEOLWUd9LyaVis/hS+LL9zgGmugI+IAptz7rROLgq
 mcH1PyfvRcYkpDu4IkaG9S5tqpHK/1/o/+edKTaBSOp+vE3zlxjqq+C7liHD1AfkSMAY
 f1Mg==
X-Gm-Message-State: AOAM530jqb3GBJnzsHe1Z0aVmuKctsr8F01eNClsWyz0JQIsaSwpzdVv
 qNtJpbX9H2sRJMrst/62QSVYby9muHFWBZzsYjIPud7CGvvOVwUMQMaJL0ONjbMMAH0XEWNCy4s
 Dxf/MKZPPrBHBQqUGJkJCkzm2w5QDkuHDcecrPMF2oMM8CWPvNZgv++4hj5cUGCZE
X-Received: by 2002:adf:a219:: with SMTP id p25mr28636312wra.400.1614795747957; 
 Wed, 03 Mar 2021 10:22:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfbZpBv9k7hXSgga18Q2U7X80Yx3nYLyWQWxwQRzBihlp/Au8nBqtr9CXYtuKzZpEM6c4XtA==
X-Received: by 2002:adf:a219:: with SMTP id p25mr28636276wra.400.1614795747724; 
 Wed, 03 Mar 2021 10:22:27 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q15sm33044035wrr.58.2021.03.03.10.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:22:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/19] target/i386/hvf: Use boolean value for vcpu_dirty
Date: Wed,  3 Mar 2021 19:22:01 +0100
Message-Id: <20210303182219.1631042-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CPUState::vcpu_dirty is of type 'bool', not 'integer'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/hvf/hvf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 15f14ac69e7..3c5c9c8197e 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -533,7 +533,7 @@ int hvf_init_vcpu(CPUState *cpu)
     }
 
     r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
-    cpu->vcpu_dirty = 1;
+    cpu->vcpu_dirty = true;
     assert_hvf_ok(r);
 
     if (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,
-- 
2.26.2


