Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A0C308D5C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:31:57 +0100 (CET)
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ZUp-0000a1-Qg
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5ZRj-0007ht-SK
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:28:43 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5ZRh-00074k-So
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:28:43 -0500
Received: by mail-wr1-x431.google.com with SMTP id d16so9918729wro.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xMbeAYujVd3pe8NSwqakVr0SL8S3zLZQekOEHC6kTas=;
 b=si6Y3w4ZCDJvF1qM/7vbK/ex8yDF1X9UTQmzrtmKK+zvLchrmWCTfJW/KK2wisjSgb
 CDtZonUaiNdvN6GpmhMOFax2+6uNxmiuaY77RPgI85NThCgMfrBSd6+n6GvWJc2KQoBD
 1EU5PpcnIqwKrTRY3DNQfOtS/7QEggV1ymNYkdcGi15xC8l2B091++dqAaaOCL4cJPRp
 PYDRqbZIXLOjtigFbk2jlsccIb8WvoE2EBab+LU1uGl+1Q9UW/B9HmqjBKGDucrWX9zE
 Nqe73QzHU6MR+SBRIHjlsyRz2MTCx9Fuz6lYwzY1XeX8S5zxcARnM6JxWCCIYinWZHzw
 +ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xMbeAYujVd3pe8NSwqakVr0SL8S3zLZQekOEHC6kTas=;
 b=XGBcyh7LCHhGlSPqL9Odz/J/TR/x7qLqcXiMiEbXMdNtNcMvIXZ13N7HPPUZ2f0ECY
 RMz8oQhEnAfGmlCAOzTrdx4tHrCrR+4C4wM6RJxA6RP48yRQJdtudfxpCMSeQhqaPFjy
 /xwQGVUVVe9N/5W4bEASt/aouvClAxmn9zHIXGtM0mjqrz3xMAdvHbYSjBIDsMDj0whL
 UBZAu+2oNFWrncU6Y8TSW998qVD4kym9fMqxWj8jMlkx2o8G23eYVpJZ2eLXXunxrZ4Z
 A8HYBux9yDZMftMpMvW/HXNFBrwWgNOk3Pc90KVUIJoK7E54P2KTwNOOXNfw/YiiU3FQ
 1iOA==
X-Gm-Message-State: AOAM530PQoRuMwe5FpCUxVQE5rwT48zM6Y3hNHxIHeSFxfmzqSJUj3hR
 9cnhAWUrJQBziZdwfhBzrxNhvm9l/3f+sA==
X-Google-Smtp-Source: ABdhPJwK72ME9iFdy2aTrBxb+IAhsUa1gDyO1jvofHTSty43vUN8vwVkaWjlie0wWa9D+YAOdmqcFw==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr6346355wrq.132.1611948520587; 
 Fri, 29 Jan 2021 11:28:40 -0800 (PST)
Received: from avogadro.lan ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id l18sm10964528wme.37.2021.01.29.11.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:28:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] pci: add romsize property
Date: Fri, 29 Jan 2021 20:28:36 +0100
Message-Id: <20210129192838.582771-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: lersek@redhat.com, dgilbert@redhat.com, peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This property can be useful for distros to set up known-good ROM sizes for
migration purposes.  The VM will fail to start if the ROM is too large,
and migration compatibility will not be broken if the ROM is too small.

The main difference from v1 is the first patch, which fixes overflow
issues in nearby code.  The second patch is the same as v1 except for
replacing %d->%u in the error message.

Paolo

Paolo Bonzini (2):
  pci: reject too large ROMs
  pci: add romsize property

 hw/pci/pci.c             | 28 ++++++++++++++++++++++++----
 hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
 include/hw/pci/pci.h     |  1 +
 3 files changed, 37 insertions(+), 6 deletions(-)

-- 
2.29.2


