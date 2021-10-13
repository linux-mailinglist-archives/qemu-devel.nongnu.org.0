Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F405342BB87
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:28:14 +0200 (CEST)
Received: from localhost ([::1]:40826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaYX-0000mI-Vn
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEo-0002Kc-6S
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:50 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEj-0005kk-CZ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:49 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g10so7369350edj.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vFqI0VCEVAZ6JnDvTYNxAsSrQc6wGMnCMT9x3PtInzA=;
 b=HdAMERaY77XXAFoTrMooVARy5nHo346wAxnEx4DhzfFBRUdwU5RA+uD7mekMqpRA9T
 7I6OKQ/oZLHCankcP96GezC9n+dv0OVTW7KBXrll7tgqajtkBQCukJb4BrZKsAEcbktF
 WvreGQNWlY/DuTHK0eEN71FFGO1cOJEve0X9Hi5g8ryBz4g+20s1PL8618QyV5mqaipf
 pW793xrzAogUf8dHi4p8AXZuKbpF8UBpNmdaW/AVm0Rlo6fMdklyPrd7oqjWa5QelBks
 8mn8hX+gvWfwM1e27djm2Gk6Xwfc622Ct5zOoEkrrctQLFenHcnSAsYkvttmahRLSyEZ
 f9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vFqI0VCEVAZ6JnDvTYNxAsSrQc6wGMnCMT9x3PtInzA=;
 b=lVxiSgnhFbIhGSj2ei6Z17Bi8Xzc6r9D5Wqq93rRvU+Ly2V6GcyW42pq7SexkegUVp
 o+5gzWrx5CNgX58cj2Dw76A8lXvIHez9ttRGLYA//vhqNty31CDkPTOi+tawBM3NkeK+
 Q4lOmePCwMj90JGO3wVs/mIET76GaLePg0siUGTX+4rTJJMVBhEydh65c1Be8Lp5rrMZ
 dDynq7I070UdNls7TR7nsAicger7hSom6k47BUt9tcxNGMfm2xfSia+F9+EtNMKfb1fk
 e+fTZLFKYRTHvEdTndzXkMhexejA81KMOrOGJ6NCtlXvJMCGud/ou4Jbpv1HvU4e6ekd
 86qA==
X-Gm-Message-State: AOAM531S1YMp0bUDVRzANSpxoaRzn9LCvqVruc8Pt8RWWUo14ZZuI56X
 j2T0vn9fvwJG8XuZ6igwY+GGdOhWdZg=
X-Google-Smtp-Source: ABdhPJw3B/Ca0mzMAa0oNuz75ShOd9teUF4VWy+BK2vtw9PF5QGwQqZg61t2eMJXzbivEgiuqS9QdQ==
X-Received: by 2002:a05:6402:3186:: with SMTP id
 di6mr7728194edb.225.1634116061093; 
 Wed, 13 Oct 2021 02:07:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/40] target/i386/sev: sev_get_attestation_report use
 g_autofree
Date: Wed, 13 Oct 2021 11:07:04 +0200
Message-Id: <20211013090728.309365-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Removes a whole bunch of g_free's and a goto.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Brijesh Singh <brijesh.singh@amd.com>
Message-Id: <20210603113017.34922-1-dgilbert@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-12-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 9e3f2ec8dd..3a30ba6d94 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -521,8 +521,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     struct kvm_sev_attestation_report input = {};
     SevAttestationReport *report = NULL;
     SevGuestState *sev = sev_guest;
-    guchar *data;
-    guchar *buf;
+    g_autofree guchar *data = NULL;
+    g_autofree guchar *buf = NULL;
     gsize len;
     int err = 0, ret;
 
@@ -542,7 +542,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     if (len != sizeof(input.mnonce)) {
         error_setg(errp, "SEV: mnonce must be %zu bytes (got %" G_GSIZE_FORMAT ")",
                 sizeof(input.mnonce), len);
-        g_free(buf);
         return NULL;
     }
 
@@ -554,7 +553,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
             error_setg(errp, "SEV: Failed to query the attestation report"
                              " length ret=%d fw_err=%d (%s)",
                        ret, err, fw_error_to_str(err));
-            g_free(buf);
             return NULL;
         }
     }
@@ -569,7 +567,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     if (ret) {
         error_setg_errno(errp, errno, "SEV: Failed to get attestation report"
                 " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
-        goto e_free_data;
+        return NULL;
     }
 
     report = g_new0(SevAttestationReport, 1);
@@ -577,9 +575,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
 
     trace_kvm_sev_attestation_report(mnonce, report->data);
 
-e_free_data:
-    g_free(data);
-    g_free(buf);
     return report;
 }
 
-- 
2.31.1



