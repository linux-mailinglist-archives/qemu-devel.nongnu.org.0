Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06546A82A0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:50:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8k-00048C-SF; Thu, 02 Mar 2023 07:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7g-0002xg-5w
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7S-0003vW-T8
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5pv+L4AMt3OcxhqFwjjEU7nQ7tLTf4Y9EqFOws46ojA=;
 b=jWEZwp8NVgbczzaF24UXIKobgG9jZ4xT9OvH1yc4gLYkXqT434LkUq/mqrmXm7P2F1z7ua
 SIu77SDR14Zw2SWqDd/czygdOXOOVfzVRSnkaoMzyHpYV9pL+F5GYPw3kyNcX2U6EsSkB3
 O/jURFmg5bH0xiEGBWGSRoYnncr7qKY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-uXtVIZtSPoGyjQTWLbpadQ-1; Thu, 02 Mar 2023 07:33:09 -0500
X-MC-Unique: uXtVIZtSPoGyjQTWLbpadQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 t19-20020a0560001a5300b002ce013276b8so176533wry.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pv+L4AMt3OcxhqFwjjEU7nQ7tLTf4Y9EqFOws46ojA=;
 b=knHbnoHR1z6VlauElYFj68TaesecTbrkzgqDLscgRrDr1l/oxW3f8KrRu2+6twEVEH
 XgUZwY/Fnffa3tbMD9FxUyi3YsR/pnTIOjzDV2r+nVv1GHhVQdo35L8ALGjXL8ULuWif
 9/zB9wZholFgtoz0y0a/Gvr6PeNufCl2hbV2AjTNba76UXDl6JvtnxnaiyY1fMII3hrg
 p+WFSQArjWE+OMUn8+WWf+4gS4HUhVx8xImigLOIHCTpbBQ30fwLc7GRA1VyeCWvB0vD
 0LNeQaI9URwBWoa7ZVQPN0AWmIy170vsEAs7uzOsVdEMBL03vVUQZJkNTk1iUCw5EcYZ
 SyUA==
X-Gm-Message-State: AO0yUKWnHav0sp7Kpbjoz+VlHQhIN+/ba7EmINsqEtAI44+mxt5K1ibA
 mb8UG8ExMaqKZ4rF1IJZqSqwx+xVNkm48Ugxc4iV9PnDYS49UO0mtmkkTxWXi7gQqNocV0h9TBu
 MqvI0RP4PG01I91uWLxrcVe7vqRo1zmWlnuIv+3I+6HxKmw9dMaikbwMfbQ6Lmamk9zft6ypFkb
 U=
X-Received: by 2002:a5d:4a92:0:b0:2c7:1e32:f7ff with SMTP id
 o18-20020a5d4a92000000b002c71e32f7ffmr7285150wrq.16.1677760387794; 
 Thu, 02 Mar 2023 04:33:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+PNvHzp5T/f149IzS/tyoRpsXlHo1zh2bC0pvflmX+m9h7Aj5lMi5i7w0KQEa4YI2+0HORPw==
X-Received: by 2002:a5d:4a92:0:b0:2c7:1e32:f7ff with SMTP id
 o18-20020a5d4a92000000b002c71e32f7ffmr7285138wrq.16.1677760387557; 
 Thu, 02 Mar 2023 04:33:07 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 x14-20020adfec0e000000b002c54536c662sm15234549wrn.34.2023.03.02.04.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:33:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 53/62] hw/xen: Automatically add xen-platform PCI device for
 emulated Xen guests
Date: Thu,  2 Mar 2023 13:30:20 +0100
Message-Id: <20230302123029.153265-54-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

It isn't strictly mandatory but Linux guests at least will only map
their grant tables over the dummy BAR that it provides, and don't have
sufficient wit to map them in any other unused part of their guest
address space. So include it by default for minimal surprise factor.

As I come to document "how to run a Xen guest in QEMU", this means one
fewer thing to tell the user about, according to the mantra of "if it
needs documenting, fix it first, then document what remains".

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/pc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f4a08cc23f1f..fd17ce7a9476 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1315,6 +1315,9 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 #ifdef CONFIG_XEN_EMU
     if (xen_mode == XEN_EMULATE) {
         xen_evtchn_connect_gsis(gsi);
+        if (pcms->bus) {
+            pci_create_simple(pcms->bus, -1, "xen-platform");
+        }
     }
 #endif
 
-- 
2.39.1


