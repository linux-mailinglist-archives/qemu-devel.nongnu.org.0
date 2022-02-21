Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D04BDA67
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:55:18 +0100 (CET)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMA5t-00043P-P6
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:55:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nMA4D-0002QQ-Rq
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:53:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nMA4A-0007VP-0p
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645455202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJ3yND9RpsgKlz3Hwj41m7+yR8ew5G6ORpc25YtFXSU=;
 b=jTpHnfCQZqrO7UD0DSvy+JFqe9N6+qsgu7mGX8souE00OT0ZiXixHrMM8yG1DOdvsGeGDJ
 i8oGgo9EIHN1Uscn6/OptFMkHI0wAc1bwSUk6oMnt8yICxjCym2k96sZ6Z1kZJm1m9zr9x
 7SmJwvZxIZ3APXeNZod9HJstfV99lc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-_zjyNn0cNI6eY0zAxAUgPw-1; Mon, 21 Feb 2022 09:53:21 -0500
X-MC-Unique: _zjyNn0cNI6eY0zAxAUgPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1F5B801AC5
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 14:53:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 804597DE5F;
 Mon, 21 Feb 2022 14:53:19 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] vmxcap: Add 5-level EPT bit
Date: Mon, 21 Feb 2022 15:53:16 +0100
Message-Id: <20220221145316.576138-2-vkuznets@redhat.com>
In-Reply-To: <20220221145316.576138-1-vkuznets@redhat.com>
References: <20220221145316.576138-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

5-level EPT is present in Icelake Server CPUs and is supported by QEMU
('vmx-page-walk-5').

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 scripts/kvm/vmxcap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
index 6fe66d5f5753..f140040104bf 100755
--- a/scripts/kvm/vmxcap
+++ b/scripts/kvm/vmxcap
@@ -249,6 +249,7 @@ controls = [
         bits = {
             0: 'Execute-only EPT translations',
             6: 'Page-walk length 4',
+            7: 'Page-walk length 5',
             8: 'Paging-structure memory type UC',
             14: 'Paging-structure memory type WB',
             16: '2MB EPT pages',
-- 
2.35.1


