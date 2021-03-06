Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CDE32F990
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:03:32 +0100 (CET)
Received: from localhost ([::1]:36290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUiZ-0001Nt-5M
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUa1-00061o-NQ
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:43 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZz-0008F0-RT
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:41 -0500
Received: by mail-wr1-x435.google.com with SMTP id e10so5170745wro.12
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kU3bZsFA+beRn8mnmHGaAIYUo4tijB2YCZ4G9Uc0rCA=;
 b=hYkCx+/uJ6C+P5bYM1jyAhCHOKEFwh21M2uRwl2o+aRw/SMSnKuOYSR+vBgvofDROH
 PKB/rAafGyRoTvtq60XBniIYzgrW+p2BHDGDR22o0JH7ti0Yob8h1wvH99lPP5ksOspZ
 ffNChCc1W1I6yzWfDXCN6L6HKB9SF1OHq3YLDtKosbmFEZDosdwz8sH2YPKwgcxjrcsO
 vxaEwhxjeMwiUwzy28PsmvTH+21Sj6aQr6AldYXsj/R0n1mohWeqCq5EQTKYitPxUuFK
 kuyuvuBangvTraHnUdxhJzDu+wCI3qXf8RAfABV2A+bfjpCTwo3C+N/fbdwf5MAm+Goo
 OmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kU3bZsFA+beRn8mnmHGaAIYUo4tijB2YCZ4G9Uc0rCA=;
 b=F859rbC0e9WscsY2pvwmfJN98Saouxk9shVzi3gnevlfp1c2TR9spD1tJUb/eBHnc0
 uXp/2BAYOC0afv4aR55xoHXIqc/2O1USRGiEZ4tt1jb53t01cCj70MvTCQCMtkuuq61K
 utP+A403xmhby8wn7dx30ac0+d/Nw/E+xsZtiCr6wbhGEl3nBB1Oe7ayrJW7A0MSVWxJ
 c1wySmsN/VmnTL+IWD0Uj2Q0nqF10LWBSDJic2PhYIpij9RLSB1thnzhZ4KQoEpYhW+C
 VYzwSrP4MMm3sfghBxKIARHFGSmqK0zS/3t5uVRdyRpbLW84Ah+cRTlTJ20fqYCxwbzF
 ZvBA==
X-Gm-Message-State: AOAM533nOUFOk1Uz5nWvFY6U8z9MvSkOLnWYImBCf8xfgzMlX5hcpiET
 ODtTs/s4gTh+Hlz7gYEGEFPzLDBK/Mg=
X-Google-Smtp-Source: ABdhPJw/FqheEyyWKnfuehOUd/7LHnVAib3UGjkO4US0sAkwDGZxK6Of8BEOaJ7Spkhb7fFXPHoP0Q==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr13520260wrz.11.1615028078596; 
 Sat, 06 Mar 2021 02:54:38 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] trace: fix "-trace file=..."
Date: Sat,  6 Mar 2021 11:54:17 +0100
Message-Id: <20210306105419.110503-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because trace_opt_parse always deletes the options it has parsed,
trace_init_file's call to qemu_find_opts_singleton always
creates an empty -trace option group.  Therefore, the subsequent
qemu_opt_get(opts, "file") always returns NULL.

To fix this, save the last "-trace file=..." option in a global
variable and use it later in trace_init_file.

This is similar to what was done before commit 92eecfff32 ("trace:
remove argument from trace_init_file", 2020-11-11), except contained
within trace/control.c and without memory leaks.

Fixes: 92eecfff32 ("trace: remove argument from trace_init_file", 2020-11-11)
Cc: stefanha@redhat.com
Reported-by: armbru@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210209145759.141231-2-pbonzini@redhat.com>
---
 trace/control.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/trace/control.c b/trace/control.c
index cd04dd4e0c..4be38e1af2 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -40,6 +40,7 @@ static size_t nevent_groups;
 static uint32_t next_id;
 static uint32_t next_vcpu_id;
 static bool init_trace_on_startup;
+static char *trace_opts_file;
 
 QemuOptsList qemu_trace_opts = {
     .name = "trace",
@@ -224,10 +225,8 @@ static void trace_init_events(const char *fname)
 
 void trace_init_file(void)
 {
-    QemuOpts *opts = qemu_find_opts_singleton("trace");
-    const char *file = qemu_opt_get(opts, "file");
 #ifdef CONFIG_TRACE_SIMPLE
-    st_set_trace_file(file);
+    st_set_trace_file(trace_opts_file);
     if (init_trace_on_startup) {
         st_set_trace_file_enabled(true);
     }
@@ -238,11 +237,11 @@ void trace_init_file(void)
      * backend. However we should only override -D if we actually have
      * something to override it with.
      */
-    if (file) {
-        qemu_set_log_filename(file, &error_fatal);
+    if (trace_opts_file) {
+        qemu_set_log_filename(trace_opts_file, &error_fatal);
     }
 #else
-    if (file) {
+    if (trace_opts_file) {
         fprintf(stderr, "error: --trace file=...: "
                 "option not supported by the selected tracing backends\n");
         exit(1);
@@ -303,6 +302,8 @@ void trace_opt_parse(const char *optarg)
     }
     trace_init_events(qemu_opt_get(opts, "events"));
     init_trace_on_startup = true;
+    g_free(trace_opts_file);
+    trace_opts_file = g_strdup(qemu_opt_get(opts, "file"));
     qemu_opts_del(opts);
 }
 
-- 
2.29.2



