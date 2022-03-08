Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296844D168E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:45:47 +0100 (CET)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYHi-0005vE-5g
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:45:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7E-0007h6-3z
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:58 -0500
Received: from [2a00:1450:4864:20::52a] (port=35677
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7C-0005mY-82
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:55 -0500
Received: by mail-ed1-x52a.google.com with SMTP id y22so4990827eds.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XYUszgYVH0P129LF3fU+CiU6Ny+gN2H3uD9Hzlxf0D0=;
 b=AL/h+y2NX//GQnZIgg/HU4oOp0Fea/vYiIwOF29QrvxqQV0O8ygH8ct19a1esv7zM5
 iYYgp2MLbvlIMlKGpk76TvH0Bu3k4lYwKufJT2NCKVg5eN5zRwFAByYdoUrFUOaD6EJs
 /S5zAiHc4NOzwEoReGSFxmMdFObke4bzG7/ISg80DnbzW50bWRg+B1cd0a2vK0HN+ekN
 OGQ12F9qVcoNLTtIOIlEpJDr82V/oWkyZ1TI11SOWZlaTZzQei4h+XZcK3XIoFGIqBVj
 mJwCR53y5qbs85/AJluihQKm2vEEYi6ZJ25Bmdigvvpb+Xn3IDn12CeteS0qlZkSCqDw
 u73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XYUszgYVH0P129LF3fU+CiU6Ny+gN2H3uD9Hzlxf0D0=;
 b=AGpz9FntaeBuPhd6TW5jckrVZ2ZhXZFtsFlSHOMZ5xwbgHcr8AQmbEKNlpZjz74kSN
 9CYW0+PNss3peUwF/ikc2+V30zdRxNBKceLY9bkQ2eFLS9qQ77yzQal0yWIDLUDbegaJ
 twQdhZjMTO7hUPt7eVX5bJLQCLqEfWcXbKK06z8VhWim6GFgzdWPj1lJMXm55vg6etC3
 3h80u+xl7ZIjb7P4e015gg72jlfHjdWp3L3Z+9Rr5W2nuLM1B98IXR9jeISZLys2IiIV
 B5OCNTVw2/lH7IOqVQEYFoWkM6vcXlgwaMh9PlSO2T8cj9TgU3MsIbKh76uwkUrSY+Lw
 QOow==
X-Gm-Message-State: AOAM533qAUHF2nhpuO549iRos4LByeKIPbz08+9/2zYxyZ6bqHXBEjgH
 QShOJBjyC/mK/gE4H1j6U0S493yCyWk=
X-Google-Smtp-Source: ABdhPJxq0cJDEEDWvwVMUDBNqxtBe5FcmEFqMU+W1HWWpaLTqpip11PDGgT6haRtTq65rQoD4iZS8A==
X-Received: by 2002:a05:6402:42c9:b0:415:e324:c211 with SMTP id
 i9-20020a05640242c900b00415e324c211mr16075968edc.234.1646739292939; 
 Tue, 08 Mar 2022 03:34:52 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:34:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/22] vmxcap: Add 5-level EPT bit
Date: Tue,  8 Mar 2022 12:34:26 +0100
Message-Id: <20220308113445.859669-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

5-level EPT is present in Icelake Server CPUs and is supported by QEMU
('vmx-page-walk-5').

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20220221145316.576138-2-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kvm/vmxcap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
index 6fe66d5f57..f140040104 100755
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



