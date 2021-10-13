Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B4042BB69
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:22:12 +0200 (CEST)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaSh-00062j-3I
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEk-0002EX-QD
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:46 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEh-0005lg-U4
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:46 -0400
Received: by mail-ed1-x52f.google.com with SMTP id z20so7130836edc.13
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ClGzHESyUs7PZrcCr5X0pVDGEGbBz0p9ZTrPPNvNO9g=;
 b=k6xNeBJNbgfbbo77SpM0sgz9Nly30u2QJnSmbowAsJZWojaN3lOjj82EofivdU7JK3
 dUW5+vILuR+FrlT04hrky2HLlBBaneQWydSxiufyd+YBMCc5DNtGpIcIUGnWpDQ93hMk
 BjJhZmdlogpyMLEJ90T7zyZ20/TaEG9McwkDTCmTrOkG2WLz3d8Juy1ofwGwT4IKLehr
 9OperkAeLhFZFzGQQun6Tgkfr9Ini8UI+0bUUMqB8rz3XsMd0+9DR1cAkmWHlX3oSFE0
 khooxbasB6Uev3wbDziCedMl9oOJ4zXQ9YtYYr7IeOAJFJ0pLDQw5jr6+1OfA15M7VVp
 5LdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ClGzHESyUs7PZrcCr5X0pVDGEGbBz0p9ZTrPPNvNO9g=;
 b=FHbomiRn4JEixaVPRJDcBJHRteaeTMviAdbysVc+VaaErkOwhqqmqbOjV0eG1EJMrb
 tLuCbqMLZBR+ZCN21rPyWgAeTJ/Ot81Fmsex/o0D8NRg1c9C9LtzhZlPBAwPqGEwCxxJ
 qPEzkjIQ8NyUUZYtzZ8Y3FENoLm0692DsS3LsE0aev/dbxu+PcLzHZJNbYBGdhHSk/Jd
 BzWn0jAtpYGM2xh9GVTGkEZD86gKghBn/+UXtuaV3j2HXVmh46Me8KT5D7kCxuDzCuJW
 yHFox9bafG3y6A7V9CQKsB0cBts8sHriJnQAesu4R766n56pqPcc1+LM626/Ko1ZN9cf
 0VMw==
X-Gm-Message-State: AOAM530AUIFCQW8Q2oKc3BIF5lfTh2/nG3oSTOgp9ldEehl5y9Kem9sq
 gL64VMHtbK/xxGRIhuAuxvlQeKpuKWk=
X-Google-Smtp-Source: ABdhPJwQgwitT9JoEZRzQ9HpMlaolMO83bpmKnjJvZGWaabBafX7xdKIPAM2YUgYehFhugDwUBgyQQ==
X-Received: by 2002:a17:906:35cc:: with SMTP id
 p12mr39077781ejb.351.1634116061764; 
 Wed, 13 Oct 2021 02:07:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/40] target/i386/sev: Use g_autofree in
 sev_launch_get_measure()
Date: Wed, 13 Oct 2021 11:07:05 +0200
Message-Id: <20211013090728.309365-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use g_autofree to remove a pair of g_free/goto.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-13-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 3a30ba6d94..5cbbcf0bb9 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -685,8 +685,8 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
 {
     SevGuestState *sev = sev_guest;
     int ret, error;
-    guchar *data;
-    struct kvm_sev_launch_measure *measurement;
+    g_autofree guchar *data = NULL;
+    g_autofree struct kvm_sev_launch_measure *measurement = NULL;
 
     if (!sev_check_state(sev, SEV_STATE_LAUNCH_UPDATE)) {
         return;
@@ -708,7 +708,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     if (!measurement->len) {
         error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
                      __func__, ret, error, fw_error_to_str(errno));
-        goto free_measurement;
+        return;
     }
 
     data = g_new0(guchar, measurement->len);
@@ -720,7 +720,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     if (ret) {
         error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
                      __func__, ret, error, fw_error_to_str(errno));
-        goto free_data;
+        return;
     }
 
     sev_set_guest_state(sev, SEV_STATE_LAUNCH_SECRET);
@@ -728,11 +728,6 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     /* encode the measurement value and emit the event */
     sev->measurement = g_base64_encode(data, measurement->len);
     trace_kvm_sev_launch_measurement(sev->measurement);
-
-free_data:
-    g_free(data);
-free_measurement:
-    g_free(measurement);
 }
 
 char *
-- 
2.31.1



