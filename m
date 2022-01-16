Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366C548FFA8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 00:56:01 +0100 (CET)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9FNQ-0005uP-1I
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 18:56:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9FLC-0003vo-6j
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 18:53:42 -0500
Received: from [2a00:1450:4864:20::32b] (port=41593
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9FLA-0007Zw-K2
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 18:53:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so18870698wme.0
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 15:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=naCeFovSJ651wMdQgl34MkCNA0kADyvFrkhnCjatNM8=;
 b=ncwzxDTA8oIJyB3Y8ecVMxx+r4z1Ght7VmWNAxsq0qfXxwCjBHFy7Y81JT0giGLRGb
 VJQ41+o/d2sOId1BnNCwsuLbnWp1Erx0vY74scJU4qsO5GELEhy/mq4xQ1y3jpbddfRt
 OnymjLtorVXxH01PZXfd4l4Njhw6c6zNA4/Rqy7cDiT9c3GgDMtAdOCYtjc7qxCqPorS
 8ivdjRw8wrERGYv81M26k6wXz3VYVeP+uZZce24i1ElnWEWcyvpBHSXvBTaMYJtI7eX8
 Q7GfktTqMLaysna+xmrMwGP9rEHhsIPtnehx5zqqGckJGz7Tpl/RpoUBd4G3ZN4Bo1M/
 /QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=naCeFovSJ651wMdQgl34MkCNA0kADyvFrkhnCjatNM8=;
 b=DoItrzOwwGSCmyUWowNC/yzFOYZNhYK+Y0Z7rSZdnaJe9pL/X4CLbtUHqKQW+Nzk+v
 V1XUPtbmRW+pQVBpus8OMQ760G0sOAoKHJDMCxypSnboen7f0al0ubeFVI7KvRJ8gA93
 XV7w9D/69iR1CQ9L2WV0mPGQG+U+a5la2TF0of97netqYyDW0lmGC17oc5b2Rc4E1u40
 3tJ/fIDsjoLTXirWXzjcav/5A7Viyu/StTvj9nCC9eJ9hTSffeihOmtirMJVn1kLVfRN
 nSaxf8/9AfcP5r/EWZkSd6idRz1MqdpinwXpk7tOV1+nLMJto91yA+F7Xjy9o+NeObzS
 Md5w==
X-Gm-Message-State: AOAM5321Fw4GK1bd1LFXaifrc3X+0TGAJYgd67fusopk8HOnIV8wt7H3
 BFL72FW86usnTOrVn2raLz+o44UGSti5HtFX
X-Google-Smtp-Source: ABdhPJyzCVCKhUO/kCrbnV0Ys0Ap9iU/XsgQqVqCErpiBp5O2bS0U1Duqn/y1zXAqs0ol8pEyNH8cw==
X-Received: by 2002:a5d:6e8b:: with SMTP id k11mr16774770wrz.102.1642377218990; 
 Sun, 16 Jan 2022 15:53:38 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 d5sm12353367wrs.61.2022.01.16.15.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 15:53:38 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/2] hw/i386/x86: Attach CPUs to machine
Date: Mon, 17 Jan 2022 00:53:30 +0100
Message-Id: <20220116235331.103977-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220116235331.103977-1-f4bug@amsat.org>
References: <20220116235331.103977-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Avoid having CPUs objects dangling as unattached QOM ones,
directly attach them to the machine.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/x86.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b84840a1bb9..50bf249c700 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -108,6 +108,7 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
 {
     Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
 
+    object_property_add_child(OBJECT(x86ms), "cpu[*]", OBJECT(cpu));
     if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
         goto out;
     }
-- 
2.34.1


