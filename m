Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454C39BBA1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:19:38 +0200 (CEST)
Received: from localhost ([::1]:52836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBbl-00024S-Ky
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa5-0007lu-1a
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:53 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa3-0008Do-8c
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:52 -0400
Received: by mail-ed1-x536.google.com with SMTP id t3so11567924edc.7
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ihe8crglx1nLpv95xn3UDEekdzpDK8HSnF14CMFLhd0=;
 b=Z2dpMQMUcNyNkLcmVQ64AdQgzUjADZb1+xMUvumukXpUjZi+E3cIi4THuEArrSrWS9
 /w5t89z+RL5EQ6QhTPE1JgO6YXH9aCeXJ/Vz61OCjae2HEukdWFp19omrRIHs+NlycNF
 ixeHb8h7qz/GPRKEHPpiMNtF+ox74CRS9PlDw+anRIupF0tkFtQ/sUGaUGpGBTOsLYAl
 g5eLRlPyAfUtpQ43peCBCYl22bgZX2USjDywcouv0eYpd4Kp6ycsb4iiy6NRlenB3JTM
 CDC/o9IyUr8351Vv5DdohCx0osF3ltFcrqkiQyszrT+h3dqa6pqV/OxavkvI3NsSIF2t
 hxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ihe8crglx1nLpv95xn3UDEekdzpDK8HSnF14CMFLhd0=;
 b=o2c2WliGpBPU7RKrQs+gUyaQNq1BSaO0T7CeG9y9ysgZ9AsSXuVuvGKZ0H9Zkv8cVK
 Rb8mawJ4QlYXdwm6aZRCXGrgHSaoylm6jZ+XL3T+40wfl+c8dPriK0mrKQag0IVnV0mj
 ETgJhZAR0dBS1NbiBDTs2eHHaOIrF8XppT8Nykqo7xVLo/UWsaUewUhDnBQwbJNi9pxa
 MBLgOXRTlSFrE/KDFCx5gOUyTdqi6ZS3/xUsfuLywLOGRmV+UjHNdy162HB5+yd83lyt
 JK2rlDdlATGw1G8vtCgk5D2bH1hfUXEnmxTJBjf9xIVS8oFtDzXPdmA9uzkjgRr39lcP
 oW1A==
X-Gm-Message-State: AOAM530mwYhwYQGssdGtv1fnl2j98+Dy6W59p1lt85RAum9EzkIJE3Zd
 n9e02mx0GUP/cfUwy7keOI+Ubkuf4ij/Cg==
X-Google-Smtp-Source: ABdhPJySkMW9EvWw9jRQ7e7PPdux22DGh+UrkoJjEz8GWLhv7hw9OCPZNn+kqDsWI6o40kuqYVe/ew==
X-Received: by 2002:a05:6402:845:: with SMTP id
 b5mr5178627edz.266.1622819869646; 
 Fri, 04 Jun 2021 08:17:49 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] oslib-posix: Remove OpenBSD workaround for
 fcntl("/dev/null", F_SETFL, O_NONBLOCK) failure
Date: Fri,  4 Jun 2021 17:17:35 +0200
Message-Id: <20210604151745.310318-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

OpenBSD prior to 6.3 required a workaround to utilize fcntl(F_SETFL) on memory
devices.

Since modern verions of OpenBSD that are only officialy supported and buildable
on do not have this issue I am garbage collecting this workaround.

Signed-off-by: Brad Smith <brad@comstyle.com>

Message-Id: <YGYECGXQhdamEJgC@humpty.home.comstyle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/oslib-posix.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 36820fec16..7b4bec1402 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -273,17 +273,6 @@ int qemu_try_set_nonblock(int fd)
         return -errno;
     }
     if (fcntl(fd, F_SETFL, f | O_NONBLOCK) == -1) {
-#ifdef __OpenBSD__
-        /*
-         * Previous to OpenBSD 6.3, fcntl(F_SETFL) is not permitted on
-         * memory devices and sets errno to ENODEV.
-         * It's OK if we fail to set O_NONBLOCK on devices like /dev/null,
-         * because they will never block anyway.
-         */
-        if (errno == ENODEV) {
-            return 0;
-        }
-#endif
         return -errno;
     }
     return 0;
-- 
2.31.1



