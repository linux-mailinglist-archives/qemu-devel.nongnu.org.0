Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7911769555E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjB4-0007QE-OY; Mon, 13 Feb 2023 19:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB2-0007No-SR
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:08 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB1-0005zK-9b
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:08 -0500
Received: by mail-il1-x12f.google.com with SMTP id t7so4158663ilq.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tpsd+qPEZMPPulUs11wAtZGcRw5OGIAw6bgvDX5oXa0=;
 b=OV0YxNb70V056H3ba24MdQ5SD47PKxSH+k4JUemLA2PCYFt3k/I87IVrIYEHQD3RDH
 skhZPbqK8Fb4Z6Z2GFtFnN1uvH2aFyW6SYhYmJTuEe7zi52xGwV8kuyuhMSjth923L3e
 LwwHLAAW9han377jk7Q4cqP0B1/PvgRt2re7aTXzJLSNZiFwsConWe61g1ctOwVFeRFF
 wRYmsmeTOs0UuW5Yq5CKqh4nSlQF3foXI/Aoqd3UcM9TphkBFZPUBaPT0jXjtrOzQr5R
 Z7sIwrMN3YB23OorsjNfIM1PuB8pg2z4Qxz8qVT49GCRtJNx3KmkiNKBuIZADiblFjq/
 Ao1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tpsd+qPEZMPPulUs11wAtZGcRw5OGIAw6bgvDX5oXa0=;
 b=DbEdh75JdYRrFja51ni/RWcR+j1tEixsy+HyrC0cRcaAheazSUSjsU2aCpc1znuaum
 1MbMuheJx7GOtWzqk2Wbanyj3wTVaza4kvSMpImPTGSMxIrHFRztIp4cK9yE4f5eEs8T
 ATJpR6F20P3JSGE6n6WKYMO5FsDToSCNMHQ4E1evg3z/SLKeSMDPbpLAH+SzoXPYvZzM
 VRYhNskR3ksWdXW/GpXbcCCx9mc6DrLQlynXNHld63kTTjtNPsgDl0KAJZ/LDdVZhIUt
 lHYyLigJsAJdYmqgZTrIyoFeX0aoJ5PDe7CrX31hJhmdoaPXKsEhgJ2T2RMN4UUI5Fx8
 Dlng==
X-Gm-Message-State: AO0yUKX2WHHZP06vit8CYMM04dcqt2kV0rDIoWJ8x/uNR6Qp/tLQPnPg
 1XK5gWqDwfAhi9DfSvYS1RzXhO0cJOCpqc17
X-Google-Smtp-Source: AK7set/tjzIu6OvArRxeYiFvDltnZOUw+OT6PT/gFwq4CVC1S4QKTNyosLTpNuhd1jpEOhDzCIerzw==
X-Received: by 2002:a92:ca4d:0:b0:315:3d25:231b with SMTP id
 q13-20020a92ca4d000000b003153d25231bmr786309ilo.9.1676334485947; 
 Mon, 13 Feb 2023 16:28:05 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:05 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Sean Bruno <sbruno@FreeBSD.org>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@FreeBSD.org>
Subject: [PATCH v2 05/12] bsd-user: Helper routines oidfmt
Date: Mon, 13 Feb 2023 17:27:50 -0700
Message-Id: <20230214002757.99240-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stacey Son <sson@FreeBSD.org>

oidfmt uses undocumented system call to get the type of the sysctl.

Co-Authored-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Co-Authored-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-Authored-by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
Signed-off-by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index cfbc4148a5c..1df53a3e53b 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -121,6 +121,38 @@ static abi_ulong G_GNUC_UNUSED h2t_ulong_sat(u_long ul)
  */
 #define bsd_get_ncpu() 1
 
+/*
+ * This uses the undocumented oidfmt interface to find the kind of a requested
+ * sysctl, see /sys/kern/kern_sysctl.c:sysctl_sysctl_oidfmt() (compare to
+ * src/sbin/sysctl/sysctl.c)
+ */
+static int G_GNUC_UNUSED oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
+{
+    int qoid[CTL_MAXNAME + 2];
+    uint8_t buf[BUFSIZ];
+    int i;
+    size_t j;
+
+    qoid[0] = CTL_SYSCTL;
+    qoid[1] = CTL_SYSCTL_OIDFMT;
+    memcpy(qoid + 2, oid, len * sizeof(int));
+
+    j = sizeof(buf);
+    i = sysctl(qoid, len + 2, buf, &j, 0, 0);
+    if (i) {
+        return i;
+    }
+
+    if (kind) {
+        *kind = *(uint32_t *)buf;
+    }
+
+    if (fmt) {
+        strcpy(fmt, (char *)(buf + sizeof(uint32_t)));
+    }
+    return 0;
+}
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
-- 
2.39.1


