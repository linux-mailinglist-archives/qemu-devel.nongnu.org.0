Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8163334905
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:42:00 +0100 (CET)
Received: from localhost ([::1]:53678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5eZ-0005cR-Ng
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5WD-00060g-Dn
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5W6-0000eI-9J
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615408393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rc8/S0CxImyM7JcvYL6r6zrwC2hxrA9qeeZBCUuAeK0=;
 b=Zx+jALfn/YL0Qa0pZbd/qFg0cF5WHLeFKBOXTOPQoBpqrmecV/CVKhTIZqMrJw9TrPQF7t
 M85w9+WUWdY0/4PYWqtJObB5byA00UY7fEmYAP+da8tsohIXOMISNesU49uaaMcI8MBB2V
 ucHP/SXAcnDU7Ejyam5qWTDDPNixwV8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-Tk0WQsF2OeyBc0haIW7OeA-1; Wed, 10 Mar 2021 15:33:11 -0500
X-MC-Unique: Tk0WQsF2OeyBc0haIW7OeA-1
Received: by mail-qv1-f71.google.com with SMTP id j3so13625069qvo.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rc8/S0CxImyM7JcvYL6r6zrwC2hxrA9qeeZBCUuAeK0=;
 b=DyXR57PUmM5QvpVbpT8ZQOUH8YyZP7S3rOtiCc7PtGgwShdeouVhi2l3kCeBQPzbrB
 6frK1APxpyMRqz/QqbWwO6HqavAbjQ3eEbAUtm00WilaFxcB9227QJuSp6JlVuQNiviE
 kk2wLla46nq2zQlAiTYIkjX6NOM55HzFm5nkY+QTaUQxBwVWjCVk8ADSgl1Y5hCcs2wB
 pqqyszExY57hK3KZUEOG9NvkMPCNVrzMhrV+annHrsUbKpCbmIb6TLEmHVcE0Y+5cAvh
 Xb8kN9ZBDzF1/I5meevhm2FEI5V6rHV0DDvPMktQrU53Z07eC8f3OdlBOM3Kf0qlQMJ8
 zuHA==
X-Gm-Message-State: AOAM531PhqoHmH4UDMpHpyAyNhLO6AzlLLzEOhxhjUzf30wCUABkVTJi
 x/0zAsyaJsjYzuSYXXJ3PNK4Zn4ICkQ6VyfXTpBzwwbrs1x/wt39yOVpfg0haw/7dOQWF69juHi
 ntAJh6Tz11Xpcpr2/R9ueIj5JPKQ/23l47tIl0gLkCfqRUe2kzpOun1qELgDVv8NU
X-Received: by 2002:ac8:4783:: with SMTP id k3mr4531830qtq.231.1615408390378; 
 Wed, 10 Mar 2021 12:33:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzr/jt3kfH0jZgvaUpSMwGBYeTAg+qb+Rgwme0L2RMp5KkPViMfDBu8b571u34SvFsUiC/sUA==
X-Received: by 2002:ac8:4783:: with SMTP id k3mr4531802qtq.231.1615408390050; 
 Wed, 10 Mar 2021 12:33:10 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id z89sm306746qtd.5.2021.03.10.12.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 12:33:09 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/10] KVM: Simplify dirty log sync in kvm_set_phys_mem
Date: Wed, 10 Mar 2021 15:32:57 -0500
Message-Id: <20210310203301.194842-7-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310203301.194842-1-peterx@redhat.com>
References: <20210310203301.194842-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvm_physical_sync_dirty_bitmap() on the whole section is inaccurate, because
the section can be a superset of the memslot that we're working on.  The result
is that if the section covers multiple kvm memslots, we could be doing the
synchronization for multiple times for each kvmslot in the section.

With the two helpers that we just introduced, it's very easy to do it right now
by calling the helpers.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 65dc00b0a61..20f852a990b 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1170,7 +1170,8 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                 goto out;
             }
             if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
-                kvm_physical_sync_dirty_bitmap(kml, section);
+                kvm_slot_get_dirty_log(kvm_state, mem);
+                kvm_slot_sync_dirty_pages(mem);
             }
 
             /* unregister the slot */
-- 
2.26.2


