Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232473F8E61
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:00:53 +0200 (CEST)
Received: from localhost ([::1]:58324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJKcO-0004qo-5a
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJKZy-0002oc-S0
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:58:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJKZw-00017f-5u
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630004298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gKU0uM+WAVCbUTMrdt1OzJSlafmnj04ilSowOvMAIgw=;
 b=fWWZQcI3rCjvmtNY7v9vmsRXlI6B+Bo5cG35+gQnBUoaw1QjbGXb5qidpgPHy9WGXX91LA
 RxZGpZx0bZNDKtaUv9mDL2OOFTtbrHEwoSzI4pTHgYyO4Lv77uUSxVi1E/YKd7tse7a3eN
 4VHVkafPm31OF8VmkL2Nuasg4Hzusy4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-MFsx0LMiNpOLfArde-joog-1; Thu, 26 Aug 2021 14:58:17 -0400
X-MC-Unique: MFsx0LMiNpOLfArde-joog-1
Received: by mail-qt1-f198.google.com with SMTP id
 e8-20020a05622a110800b0029ecbdc1b2aso969213qty.12
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 11:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKU0uM+WAVCbUTMrdt1OzJSlafmnj04ilSowOvMAIgw=;
 b=LUU76RplvpYcsPeoEpBddrgrICKTrwq2u74cSH52UB5XAHJ4lC98iDD2uaTqTKNAvk
 0XZgIqiIp2gjUmnnYdfs1MrrRNWWQ77tBmsuISMH0XHBWuAxp1uwqPo0GpZoCNWNn0ad
 b9oTprmPnKxnoATTZorKCBqnFtW0rvgGJrb7F7zlDqfP69JlGrhUjt8CDZUyfvdbdCby
 O5EGC8ifOKORbbnvkEMWgtVrV7PHX3/SfFqpYqg55UOgUoJZ/W81irNaL67iulCp817F
 0ZyKH0p8Cf2enJdoL5OR0ApqWGRHFJ2XeROBs/52ytAmTfNf1NOT8+dMzNdevMD1FQcZ
 PUog==
X-Gm-Message-State: AOAM530EqcmBDwlR/nlJx6W6bmSPXbkXgNUtuNDJR4NcbfEsLswOMG14
 WFXhgf8RKPYwfDUCCbTCdByVdI1Ac5UIpePU08rG1aVfg/2OjoyPcckFEva4+2oBvdY+Ydc2GpZ
 uL7WLF/hKyalLq+slzbvp147olSJnbctgo27L+JFNXP/7N6nEKbSqnI6FmNyjGI9E
X-Received: by 2002:a0c:d7ca:: with SMTP id g10mr5753602qvj.49.1630004296437; 
 Thu, 26 Aug 2021 11:58:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZLwSQnniEx0YMW75i3nyOObHDTANb9wowNFZCWz/EkvlcPIB38h0Gl+Y/p2qcmpALHi2A6w==
X-Received: by 2002:a0c:d7ca:: with SMTP id g10mr5753572qvj.49.1630004296129; 
 Thu, 26 Aug 2021 11:58:16 -0700 (PDT)
Received: from t490s.phub.net.cable.rogers.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id t8sm2328195qtn.37.2021.08.26.11.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 11:58:15 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] dump-guest-memory: Add blocker for migration
Date: Thu, 26 Aug 2021 14:58:10 -0400
Message-Id: <20210826185813.248441-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- One more patch: "migration: Make migration blocker work for snapshots too"
- Move register of migration blocker to be before dump_init [Marc-Andre]
- Collected r-bs

Both dump-guest-memory and live migration have vm state cached internally.
Allowing them to happen together means the vm state can be messed up.  Simply
block live migration for dump-guest-memory.

One trivial thing to mention is we should still allow dump-guest-memory even if
-only-migratable is specified, because that flag should majorly be used to
guarantee not adding devices that will block migration by accident.  Dump guest
memory is not like that - it'll only block for the seconds when it's dumping.

Thanks,

Peter Xu (3):
  migration: Make migration blocker work for snapshots too
  migration: Add migrate_add_blocker_internal()
  dump-guest-memory: Block live migration

 dump/dump.c                 | 24 +++++++++++++++++++-----
 include/migration/blocker.h | 16 ++++++++++++++++
 migration/migration.c       | 24 +++++++++++++++---------
 3 files changed, 50 insertions(+), 14 deletions(-)

-- 
2.31.1


