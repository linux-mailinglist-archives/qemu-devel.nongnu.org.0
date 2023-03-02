Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998A6A82A4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8Q-0003XP-IT; Thu, 02 Mar 2023 07:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6g-0002Wn-Ex
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6e-0003Hi-3z
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZfBxoh7Wrng0fCAeGlFcvxIWoPFPSBw1bsSTHLjfmI=;
 b=NKUHbJ4G1odcdyqK9qM7yqlBW82UsoEMxXaxY+f3+yL5yfrFuqw6f4cBTDnoMrV/6VsL8f
 SwhpW2r+4r+GpubGtpta8T0y3RijKT5B0wNnCfLvGS/FJoYWXBN8XAutIjFQ9GXKsBw61W
 2O1ZArxcQdQn1Vw1aDNt9OmQkWrXnfI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-Hg_1hQ7QNEarvbN4Gt93PA-1; Thu, 02 Mar 2023 07:32:18 -0500
X-MC-Unique: Hg_1hQ7QNEarvbN4Gt93PA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l14-20020a5d526e000000b002cd851d79b2so1995749wrc.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZfBxoh7Wrng0fCAeGlFcvxIWoPFPSBw1bsSTHLjfmI=;
 b=sctWBXea1VopHfiMMVSVDLHYkj9h/4tFmwyIKK9hTyH7PqU/en7YKJymcEPJEIqmf9
 5L1to/eIW3Hz1dR6MJ6mBMQCBcMy6FkjfvyJt9BbAw7kYgAAFUe4WVfgvjk9TKk1HN0W
 Jfk5LVkih+KD8NTkLbKpnzj/w+6Ocf+wq1p4lYLMC6QFSL637uM17YuT5yC3eK09G+6n
 v4qFfkWId+Jq/pMsgqeMh745LTpym9NVpyM0yVLN1gURcObrnTQG4fi2/OTK7OoeNM16
 PwOrOYaQWCK0nXZVYLLRZw+gKYPP65WOOK9h+cKEiwxj8tzhHsUojvVUra0x2JgYaqXt
 TYxw==
X-Gm-Message-State: AO0yUKVdVQQc8Tgblw/8U9bfFpWLtZbZInBo7kTAEq+VX/i7Tl2JY7Qf
 cOdVve8Q9hXtY4dO1E+dHIn2pSEeU2eele/B43AssbVbemI1yXH/x7xY6aW4BvX5pHckWOlsZ0e
 g7CWuwX2KFixA3wb2/PG7SKnQ4NYybZvPL2vpcy0IuUtbeCKp+DBVmKS5Sfzj6jgeGIwNdGtyfA
 4=
X-Received: by 2002:a05:6000:10d1:b0:2cc:4dad:e484 with SMTP id
 b17-20020a05600010d100b002cc4dade484mr7679797wrx.42.1677760336695; 
 Thu, 02 Mar 2023 04:32:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+8dysViEL79HdqeKs3JskvS3PW+Isk3IRFIkKsZAFg5DMfQN+s2mQTODbMJCHLjtpo7taxbA==
X-Received: by 2002:a05:6000:10d1:b0:2cc:4dad:e484 with SMTP id
 b17-20020a05600010d100b002cc4dade484mr7679776wrx.42.1677760336288; 
 Thu, 02 Mar 2023 04:32:16 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a1c4b0c000000b003eb39e60ec9sm2801210wma.36.2023.03.02.04.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 35/62] hw/xen: Implement EVTCHNOP_alloc_unbound
Date: Thu,  2 Mar 2023 13:30:02 +0100
Message-Id: <20230302123029.153265-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 32 ++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 ++
 target/i386/kvm/xen-emu.c | 15 +++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index ce7a96923409..df25bf0806a6 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -837,6 +837,38 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
     return ret;
 }
 
+int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    uint16_t type_val;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (alloc->dom != DOMID_SELF && alloc->dom != xen_domid) {
+        return -ESRCH;
+    }
+
+    if (alloc->remote_dom == DOMID_QEMU) {
+        type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU;
+    } else if (alloc->remote_dom == DOMID_SELF ||
+               alloc->remote_dom == xen_domid) {
+        type_val = 0;
+    } else {
+        return -EPERM;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    ret = allocate_port(s, 0, EVTCHNSTAT_unbound, type_val, &alloc->port);
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
+
 int xen_evtchn_send_op(struct evtchn_send *send)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 500fdbe8b804..fc080138e3f2 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -21,11 +21,13 @@ struct evtchn_unmask;
 struct evtchn_bind_virq;
 struct evtchn_bind_ipi;
 struct evtchn_send;
+struct evtchn_alloc_unbound;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
 int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
 int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
 int xen_evtchn_send_op(struct evtchn_send *send);
+int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 19a7f16ebe6b..ac04387a6a12 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -921,6 +921,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = xen_evtchn_send_op(&send);
         break;
     }
+    case EVTCHNOP_alloc_unbound: {
+        struct evtchn_alloc_unbound alloc;
+
+        qemu_build_assert(sizeof(alloc) == 8);
+        if (kvm_copy_from_gva(cs, arg, &alloc, sizeof(alloc))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_alloc_unbound_op(&alloc);
+        if (!err && kvm_copy_to_gva(cs, arg, &alloc, sizeof(alloc))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.1


