Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4EB3C8753
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:25:47 +0200 (CEST)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3glf-0003fY-0C
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m3gZr-0003cI-NX
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:13:35 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m3gZq-0007Hs-0o
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:13:35 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l8-20020a05600c1d08b02902333d79327aso1047841wms.3
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pI23kkjNXcPL0Sf3xbVhans44tc3ns1q2/pgJ6UNYNI=;
 b=F7Zy9kK5SppduC2eEP4AUoO6KZ7Pi2BYIl7WhJI11ULceJZ7ldzW+C7VvrJutnau/A
 lELEG3EiVLHvX16sXTRKnPNMtkC16B8ovxN1o6g6O+deFxTwawbTa7IprCkrRDaT+Pnr
 sojLy1w3SoPjqkhlsREu+9ZcWCezUa3Get3heJpYTDpi6gJJdShJlJogn7cj6eDMoJOg
 m/5//ztlw8d9A94GhexLhZhG31hAQ42pgVfk4h2VjZVm+50MtTGhLxNwwyAIX8seN5s4
 Veh7W9+CJfafL3C9ONJBVcvC9eAwbwzYp9JB1k0gZhyYsZmyPZx6GJ/TuSiyMwUMnEJA
 3oVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pI23kkjNXcPL0Sf3xbVhans44tc3ns1q2/pgJ6UNYNI=;
 b=IPv8+0S246F4GWlSQzKlHkX439bbAqemma19wxLgDZspg8Tvexp+CgauO/4Rbs6ixG
 QjSIlQ4YZ6KPrC7/Dn4hNyDWTY5A7CePa82C0X6ggUypmhU8xDOnUrJfQ+pNtXprHa1g
 /DpRSOZroPAorGa4qng6Kq2w6K5MvPcc5SMXAkhQroFz6pc+CPus91VN4soAJrbuudqI
 e5sX/i2HV8bLx24EwoMEALsxjojP2ru/JFO+KmZonCeDu/Ad1t5vb8kz7ubcSwAbt6kQ
 F3/SuwuKVCFMla1HAH9p+7w9yOjAx7Z+k8u6tEMWLIwIceLVl00bV5ObC0T2Im3r6FMx
 bVkw==
X-Gm-Message-State: AOAM5325Jr6yoOTKCImHM5Su10buVuppuHed9hiJlIjCQtO7PUd8Dfbi
 lVnYy702AnA76KWmZ+EKBRRWn46W7mo=
X-Google-Smtp-Source: ABdhPJz3r1orGZwKkAVWRE2VangZEHx0MsLAnbxauc6Uj102Rz9qKj2zsb3Rm5dGWhx6LAFfoYNwvQ==
X-Received: by 2002:a05:600c:a07:: with SMTP id
 z7mr4609753wmp.160.1626275611357; 
 Wed, 14 Jul 2021 08:13:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 p12sm1623689wma.19.2021.07.14.08.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:13:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] qemu-config: never call the callback after an error,
 fix leak
Date: Wed, 14 Jul 2021 17:13:17 +0200
Message-Id: <20210714151319.617860-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The second patch fixes a memory leak in qemu_config_foreach, reported by
Coverity.  The first is an issue in the same place that was found by
inspection of code in the surroundings of the leak.

Paolo

v1->v2: split in two, keep loc_pop the same

Paolo Bonzini (2):
  qemu-config: never call the callback after an error, fix leak
  qemu-config: fix memory leak on ferror()

 util/qemu-config.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.31.1


