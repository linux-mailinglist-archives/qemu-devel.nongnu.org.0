Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A03B4AA8F6
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 14:03:52 +0100 (CET)
Received: from localhost ([::1]:32950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGKjH-0003v3-HK
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 08:03:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKSE-0000R9-Le
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:46:15 -0500
Received: from [2a00:1450:4864:20::42c] (port=36503
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKSB-0006HW-Mb
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:46:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u15so16286938wrt.3
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 04:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kqczEjmmxYGSgKtA86NCLgWxtCH+cJ1jSQOS+NjVnJA=;
 b=fDqFx0ltiNbs89fm411axkE5NG4oNV0wwiQG/wBhovmd64qMexggvcmfle0aB8Ph7n
 zY8A2LJ5SumGS4M2Uv95hGFGuYoxoN6YUeBYlY1m6kvLgb58EZBwM1JNbopWNKf+db25
 ozbIV+Y6/rP5f4idPtQ6OSZFet+4Vc3EI5QBeK5LPbgIkjmUdAw2yZ1ThEY/kGU+uWyO
 muz4fgg25D3ROE3C8zNx+cEuk/CZ3Gb5hEUMhySACBjA10svCd6Rss/ILNmbMZIutlCc
 fIdVaTTVzrIX5f6SWO0fTIQDEMetQWgWQI7kKBeaQvGaOe8OIuJugtY2tUhCHMqlk+4V
 e84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kqczEjmmxYGSgKtA86NCLgWxtCH+cJ1jSQOS+NjVnJA=;
 b=D5iF3n6zMEitoaFRHFGpmYZ+LzXFyX/Yx8GcNhlRcTZ5A2GYXIndOA8MlQlj/7zgmA
 r2yEn+OT12O7G1Id52pEkaClZkf7TfeOWVQb+lIhcgXWlVEB0NAE0NFYb+EQYr0yxd+u
 ixsn4uRwc+ngDv3VBpBixDi5+vUjs0VI8gfYtXGWBSUrOmZvjV1YmB9fPIPrNKTjis1O
 2Skyb3AsALZ9n4TKFz1v2Fy+sMrj7kOPihwF5Z1RerSJij7kjl+LSc0GLd2zt+Jw9LuU
 /KvM2jMbJap5Kr2FB68D6RK/RLKHBB8RRtqz0V6YfL/O7sCvgaVlrRTlqXN79aeBDZYm
 Ic5g==
X-Gm-Message-State: AOAM531GTCiS9nTgiZdwqilCUofsQpi6bj1sdP4PP4ZFJ0f/EUhKpvOR
 AWSb84llQSPmQuC5zC+EzG8zhQfhYi4=
X-Google-Smtp-Source: ABdhPJywP3MGiFxe1+SuCNMt1DripYChSsg20LEXJcKDgrabHsFkgZ5XGnyHCez4aM9M/GuLuevFFw==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr2914067wry.191.1644065138835; 
 Sat, 05 Feb 2022 04:45:38 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 q2sm4433669wrw.14.2022.02.05.04.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 04:45:38 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 libvir-list@redhat.com
Subject: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
Date: Sat,  5 Feb 2022 13:45:24 +0100
Message-Id: <20220205124526.500158-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205124526.500158-1-f4bug@amsat.org>
References: <20220205124526.500158-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Previously CPUs were exposed in the QOM tree at a path

  /machine/unattached/device[nn]

where the 'nn' of the first CPU is usually zero, but can
vary depending on what devices were already created.

With this change the CPUs are now at

  /machine/cpu[nn]

where the 'nn' of the first CPU is always zero.

Note: This (intentionally) breaks compatibility with current
libvirt code that looks for "/machine/unattached/device[0]"
in the assumption it is the first CPU.

Cc: libvir-list@redhat.com
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


