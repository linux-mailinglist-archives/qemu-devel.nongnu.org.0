Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD357CAB6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:36:16 +0200 (CEST)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVPb-0001Cx-2k
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEVJJ-00049Y-PC
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEVJG-0004oh-Oj
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658406582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4mM1LbWpRl5vKHqBkCA3VS5LSV66iTKSEhYLBo34Ty4=;
 b=P92LJzuIP5qvTDyLOHlzzllg9vpIPfT9aona6PSCQ6TNTj23Vuzp6DtfZc9D5rNdTWmNV7
 rKY6J9fGn4RPRKmTR0QWxkaZfsYJK5khKzx+cz/Fn986Zpvvq1ZVWY5Jly6BYLepdQxjEp
 MIPgLtzw7rFYrk56FdpopZJKbDKx1Gg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-7XChRWRrNm-LbN4OdLFbkA-1; Thu, 21 Jul 2022 08:29:41 -0400
X-MC-Unique: 7XChRWRrNm-LbN4OdLFbkA-1
Received: by mail-ed1-f71.google.com with SMTP id
 v10-20020a056402348a00b0043bc4b46d06so1022281edc.18
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4mM1LbWpRl5vKHqBkCA3VS5LSV66iTKSEhYLBo34Ty4=;
 b=rk1cgQvdNW/9AMPR51pQ0IQs7HIIjzuwoHSRteOscSEo0hm7E8eX0v3sDkOeFRUMDD
 JXsaSI1AQww6Tmd+4aDwW1OAhrg2QDx2/UYX10gpwd4ShReSlw/tTg8qQnJPD2Rl9cj1
 uIoRINADFI8cKNFnzOQoxf5OW+3Q/z8/inN9fhaDmLANWwCEzXcGwXXCeBHpwouqpZUX
 Cm/khTwCaE0nlfUi7Og7pNVEJ9e47BS/lv74uVvvLsv4eNdxfspm/ci4hsVmM+tP5Xhk
 PHY+O3KWNO6iNlaxU275c+NX7Bu+CFg5UbAWldO+8ga9cMSblbHwlEMuq42INjsjH1Vl
 xmqw==
X-Gm-Message-State: AJIora9IcrFVbFAxx+KaOhsid94wR1eDyyJfRfwdeIbXs9SMGQw/vwOC
 Vu14aItUD4NF9HInUZ5JwJ4/+jg58IItTtwKKfXjwt0t8gbuYeA5nCI7curgOoBzjaMOo/1QcED
 NPfw/9RAD5KU0Ot2hBIpDHFInPLJ4nCz66g4CGxQXztiMiVJ6Td810Sk3vT1+nwkKzkQ=
X-Received: by 2002:a05:6402:909:b0:435:a8b:5232 with SMTP id
 g9-20020a056402090900b004350a8b5232mr57198198edz.240.1658406579600; 
 Thu, 21 Jul 2022 05:29:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgMa+okWxI4afnwO4pTg8YJo7UUzKd3PC1huMi95TnT3hK/046mhy5FcCuOSdGqoE6zYhW+Q==
X-Received: by 2002:a05:6402:909:b0:435:a8b:5232 with SMTP id
 g9-20020a056402090900b004350a8b5232mr57198159edz.240.1658406579356; 
 Thu, 21 Jul 2022 05:29:39 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 vw23-20020a170907059700b0072af890f52dsm814102ejb.88.2022.07.21.05.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 05:29:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 0/4] Refactor x86_load_linux and pass RNG seed via setup_data
 entry
Date: Thu, 21 Jul 2022 14:29:33 +0200
Message-Id: <20220721122937.729959-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As mentioned in the reviews of Jason's patches, the fw_cfg data, or at
least its structure including the size, is part of the guest ABI and
must match across two sides of migration.

It would be possible to handle this with some duplicated code between
the rng seed and DTB handling, but the conditionals to handle the linked
list would be ugly.  Unfortunately the code of x86_load_linux has no
data structures available, it's all of a jumble of local variables.
Hence the first two and largest patches in this series, which remove all
non-Linux code from the function and move the local variables to a struct
as necessary.  The function was long overdue for some cleanup anyway.

With this in place, adding the seed setup_data entry is just a
couple lines of code, plus the scaffolding for a new machine property
"linuxboot-seed".  The property supports on/off/auto values, where "auto"
disables/enables depending on the kernel support for setup data (which was
added in 2.6.26); "on" currently fails when starting with an old kernel,
and probably it should also fail when starting a PVH or multiboot kernel.

Paolo

Jason A. Donenfeld (1):
  hw/i386: pass RNG seed via setup_data entry

Paolo Bonzini (3):
  hw/i386: extract PVH load to a separate function
  hw/i386: define a struct for Linux boot protocol data
  hw/i386: extract handling of setup data linked list

 hw/i386/pc.c                                 |   1 +
 hw/i386/x86.c                                | 303 +++++++++++--------
 include/hw/i386/x86.h                        |   2 +
 include/standard-headers/asm-x86/bootparam.h |   1 +
 4 files changed, 185 insertions(+), 122 deletions(-)

-- 
2.36.1


