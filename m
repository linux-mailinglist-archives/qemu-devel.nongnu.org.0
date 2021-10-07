Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5042582B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:40:55 +0200 (CEST)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWRy-0001se-Cz
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6v-0006NU-Bk
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6t-0006cu-3u
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raENXGoMd83njG9X2No5AFJQfUuVjvhwyUCC5K+pe4w=;
 b=LeVi/e0jpwBveUMQPTrg7o2Q6WeWc09cBScJovYpMBwKqYwaggy0Q1sgpZpP6ssYXIlyuc
 4bWWb3RIXtLUw04Cpidks+9epXP+k6vrRUkZStoO8wg1o0uAt2g+nRrOOi6HnwAsUDZeTr
 FAkpoKigDG32OZJsHIERu5YXQA88Uao=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-HUbW22_VNJCJtCFtckfLwQ-1; Thu, 07 Oct 2021 12:19:04 -0400
X-MC-Unique: HUbW22_VNJCJtCFtckfLwQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso5132293wrc.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=raENXGoMd83njG9X2No5AFJQfUuVjvhwyUCC5K+pe4w=;
 b=RJ2nydXJUhf1M79uHW1phaHs8iU4RFayTLCF64U9msypQ3LT7BO3xAj/sRhsJv1z9A
 g+wLbx2W2XfQVIEV1/63sFRyu3WJCx7tMj0lwJ4A4xTX4m3sg1mvhFruBmXWlmSap/Ef
 py5sbpMzeS3nLiyqorIzdEh43Um0AcjNu6UoiK9m4z5uaywBrw16W988i8+BZwtgTJn8
 e2rL/tD90HQYbQsn75OuBL9U03/rpbIqftseU9nbvGknXVbid9kghoTOXNdwK6FsCR4p
 Z1TnwK1SE+Iff0O2inDibNgCc8udt0KRZjeMmPAircj/KD4C8Mp/Sy3ch6vGQkjMnFqB
 IEIQ==
X-Gm-Message-State: AOAM533CxVrFMevWT8lsopx9G9rqSGhMvF72SuW4vrL3KRByq0BwPSZ6
 +WHN7MidjNYveGeygPnqriXSsLqvywszS8wZKC9h9nhZjsy5l1MsuJSKGj9C9Yh2yFZ7ND+mBuB
 9G5K5MY84K81mAVAYqQOGAXTkgmbnqJubgC0XFk09nsAuBNtJ7f8DFfBQgegKNNRi
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr17449934wmh.23.1633623543230; 
 Thu, 07 Oct 2021 09:19:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLVyjk8Yjb8T3LzpyyPDRcvNepzAgqY2opRKw88FbZnxb/11utVAJlVwGyacRlavjgmwnmOQ==
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr17449901wmh.23.1633623542998; 
 Thu, 07 Oct 2021 09:19:02 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d3sm78771wrb.36.2021.10.07.09.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:19:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/23] MAINTAINERS: Cover SEV-related files with X86/KVM
 section
Date: Thu,  7 Oct 2021 18:17:16 +0200
Message-Id: <20211007161716.453984-24-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Complete the x86/KVM section with SEV-related files.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f5..a49555d94d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -417,7 +417,9 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 M: Marcelo Tosatti <mtosatti@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
+F: docs/amd-memory-encryption.txt
 F: target/i386/kvm/
+F: target/i386/sev*
 F: scripts/kvm/vmxcap
 
 Guest CPU Cores (other accelerators)
-- 
2.31.1


