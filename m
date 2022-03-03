Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272874CC07C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:59:47 +0100 (CET)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmvh-0000GW-Mr
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:59:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nPmuZ-0006pf-18
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:58:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nPmuV-0000or-Gg
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646319510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BQzkxKEtz5znDFcSo5ZL1ufl9MoNRdOOe50S1T373YA=;
 b=M63rSbdD5CES8PEEsG/OYMXFjMIZZWPk/22y8h9Lm6n04rARBlMgdKCqQT5TtahDueSz2o
 BaWQiUKUTeEiFzLDBwoq7SE2rm0tjgLYZwLA1jazVVJbvf9Qh5gi/uCvZxyOuKmEtvAlBi
 zXj8iXypHlZPWUgyPe/7KOVZeKMpjzk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-JD2_PNlIMmKkIWZrrOw9XQ-1; Thu, 03 Mar 2022 09:58:27 -0500
X-MC-Unique: JD2_PNlIMmKkIWZrrOw9XQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a16-20020adff7d0000000b001f0473a6b25so1840719wrq.1
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 06:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BQzkxKEtz5znDFcSo5ZL1ufl9MoNRdOOe50S1T373YA=;
 b=3RZraPxKEeVZ1gxBgKLrC2W0yzBz6Sy0xG6gedZQRAQrC/63hShlrXiVX3iCyktssx
 CUWkbProfoTc+A9PJEu1As3hvKtv6FMcXXUP1RULmvUVZf6Sndg+E2MJOemGO33EFDA+
 +UkDoKfXpQ86J/tEGM4mzwDGNEZcmcqk9u7TkT2EwZauUsPEn9R9/e5/vA7MmBzbwPnn
 cIu1GS7gt9pk6r6+l82PZGJZXKwsdHrJG7LmKFsV8/pWxShMwlVcNBmU1Xce3gfqjj2e
 2xM2NF2e0gJaK+PW9K7Tot4uwRW/IYCDPRXArxTTUPuHkEvZNalx2YezqrocKbfwO97j
 jGZQ==
X-Gm-Message-State: AOAM533XLkklnCzTgHaRx2ld5WOxoGoqA/zCHVKeqdGqWNAL4Vh+Lovw
 s6xeFHolXzJTT/iMLQvyvpgXHiziTWp262oHenq2A962SCzVANiayy8u8XWcpPw5y50ZvFnNatm
 P+OHFFQU/M4yGW1w=
X-Received: by 2002:a5d:560e:0:b0:1ef:7498:bcc2 with SMTP id
 l14-20020a5d560e000000b001ef7498bcc2mr23203103wrv.36.1646319506061; 
 Thu, 03 Mar 2022 06:58:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaOCk7TbzfgACBsqhXa6j1FYg/jZTyggegQj7mEBr4eEzXzsdAOOSnFloq/ziLl2WQLl1gCA==
X-Received: by 2002:a5d:560e:0:b0:1ef:7498:bcc2 with SMTP id
 l14-20020a5d560e000000b001ef7498bcc2mr23203078wrv.36.1646319505774; 
 Thu, 03 Mar 2022 06:58:25 -0800 (PST)
Received: from vian.redhat.com ([2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8])
 by smtp.gmail.com with ESMTPSA id
 v124-20020a1cac82000000b0037c3d08e0e7sm9139512wme.29.2022.03.03.06.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 06:58:25 -0800 (PST)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 0/4] util/thread-pool: Expose minimun and maximum size
Date: Thu,  3 Mar 2022 15:58:18 +0100
Message-Id: <20220303145822.518887-1-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, eduardo@habkost.net, qemu-block@nongnu.org,
 michael.roth@amd.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As discussed on the previous RFC[1] the thread-pool's dynamic thread
management doesn't play well with real-time and latency sensitive
systems. This series introduces a set of controls that'll permit
achieving more deterministic behaviours, for example by fixing the
pool's size.

We first introduce a new common interface to event loop configuration by
moving iothread's already available properties into an abstract class
called 'EventLooopBackend' and have both 'IOThread' and the newly
created 'MainLoop' inherit the properties from that class.

With this new configuration interface in place it's relatively simple to
introduce new options to fix the even loop's thread pool sizes. The
resulting QAPI looks like this:

    -object main-loop,id=main-loop,thread-pool-min=1,thread-pool-max=1

Note that all patches are bisect friendly and pass all the tests.

[1] https://patchwork.ozlabs.org/project/qemu-devel/patch/20220202175234.656711-1-nsaenzju@redhat.com/

---
Changes since v1:
 - Address all Stefan's comments
 - Introduce new fix

Nicolas Saenz Julienne (4):
  util/thread-pool: Fix thread pool freeing locking
  Introduce event-loop-base abstract class
  util/main-loop: Introduce the main loop into QOM
  util/event-loop-base: Introduce options to set the thread pool size

 event-loop-base.c                | 140 +++++++++++++++++++++++++++++++
 include/block/aio.h              |  10 +++
 include/block/thread-pool.h      |   3 +
 include/qemu/main-loop.h         |  10 +++
 include/sysemu/event-loop-base.h |  41 +++++++++
 include/sysemu/iothread.h        |   6 +-
 iothread.c                       |  68 +++++----------
 meson.build                      |  26 +++---
 qapi/qom.json                    |  36 +++++++-
 util/aio-posix.c                 |   1 +
 util/async.c                     |  20 +++++
 util/main-loop.c                 |  65 ++++++++++++++
 util/thread-pool.c               |  61 +++++++++++++-
 13 files changed, 422 insertions(+), 65 deletions(-)
 create mode 100644 event-loop-base.c
 create mode 100644 include/sysemu/event-loop-base.h

-- 
2.35.1


