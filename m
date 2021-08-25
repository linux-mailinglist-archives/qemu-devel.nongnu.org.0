Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9AF3F6CBD
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 02:50:49 +0200 (CEST)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIh7w-00042F-DL
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 20:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh69-0001UR-Kf; Tue, 24 Aug 2021 20:48:57 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:45759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh68-0006tW-1w; Tue, 24 Aug 2021 20:48:57 -0400
Received: by mail-qv1-xf31.google.com with SMTP id l4so222737qvl.12;
 Tue, 24 Aug 2021 17:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzTkCzjTdg0S0MwW5VU9khURyXbuLzk1h69LALCZle0=;
 b=IetKWTsaN8vubsevOw+xps3zaK7DJ9qJVg38W/camtZ8llW1p+J5879XplMxCqL6lH
 j9IthzoSc9MJOhaxD8jR2r7LS25dIGytatJt7CkeFwAF4+wkWNgdhqLn0DAu2bYvYYDG
 NfVjF3H2p6Z5JH2sKyVA8va+xognlg/ZAeW51dB9OJZ9bcXtO/KmT268+FMkBdoIN1es
 mhpaAp73C6RC6PBiYJd2kNkvAeg2DYaQnmJq++xeQeYyMTIxma9+63GCAcI2DZjGZcV2
 zDx2ECA2JcUe/hUyGs+XM1u7v1HRgCJAI84NgH5rFGTGrPXGG0Etwc79qPHrOWJ9VeI8
 WARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzTkCzjTdg0S0MwW5VU9khURyXbuLzk1h69LALCZle0=;
 b=oaBztQSaqKTmDYwI6n1BUvqIuGbtlfNqOYAnrGaQCtBebcoQ6ojm8qRKhSiC/qRIr7
 wpYzKaNDQERk85zx7NNQXW9lNvLA99mKa38jvBDtHtMrCeIv0Tsfw02rkJUmXRtlD6gt
 f2mcs1BrQHf8ktf96QlR2vXo+e7AmFt+hlUny8Pisxx8jZMnyaU1TxymnWKKWcxHOVrb
 9gaJ1DAXKwu7QZPuj+3kRgCum9a57qkhiLmBxlfQ9cqJFS5gwXzojUCHq4KGBT6uLQ2a
 hvENqz8nyybjyGFZtyR9hRpv9URoJbtZwG8qnuqM2ycexJD1G3cFnJaaEGIcxuA7JpmE
 Z+Zg==
X-Gm-Message-State: AOAM531tqCYsxdjbaHfNCyicvEAqtfGRgp6H7HbEeuFt85swQHTLTknm
 T8VIhoxGF7jinj6fp1TLo3HOS6OrJco=
X-Google-Smtp-Source: ABdhPJzVGuUWxoWx9qV3L3Ps9/KhosjGldvg7mJCNOFzkGRnZuWV0+rkfK996Sn+2fClSkmAVPIOTA==
X-Received: by 2002:a05:6214:500b:: with SMTP id
 jo11mr41542446qvb.52.1629852534506; 
 Tue, 24 Aug 2021 17:48:54 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id x10sm1515266qto.41.2021.08.24.17.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 17:48:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/7] DEVICE_UNPLUG_GUEST_ERROR QAPI event
Date: Tue, 24 Aug 2021 21:48:28 -0300
Message-Id: <20210825004835.472919-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

In this version the event was renamed and the optional 'msg'
attribute was removed. It also contains smaller changes based
on Markus' comments in v6.

changes from v6:
- patches 1 and 2:
  * handle dev->id = NULL explicitly with empty string
- patch 3:
  * added Markus' reviewed-by
- patch 4:
  * reworded 'path' attribute desc as 'the device's QOM path'
  * added Markus's reviewed-by
- patch 5:
  * event was renamed to 'DEVICE_UNPLUG_GUEST_ERROR'
  * reworded 'path' attribute desc as 'the device's QOM path'
  * removed the optional member 'msg' of the event
- patches 6 and 7:
  * changes due to event rename and lack of 'msg' attribute
- v6 link: https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg04923.html


Daniel Henrique Barboza (7):
  memory_hotplug.c: handle dev->id = NULL in acpi_memory_hotplug_write()
  spapr.c: handle dev->id in spapr_memory_unplug_rollback()
  spapr_drc.c: do not error_report() when drc->dev->id == NULL
  qapi/qdev.json: fix DEVICE_DELETED parameters doc
  qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR QAPI event
  spapr: use DEVICE_UNPLUG_GUEST_ERROR to report unplug errors
  memory_hotplug.c: send DEVICE_UNPLUG_GUEST_ERROR in
    acpi_memory_hotplug_write()

 docs/about/deprecated.rst | 10 ++++++++++
 hw/acpi/memory_hotplug.c  | 11 ++++++++++-
 hw/ppc/spapr.c            | 12 ++++++++++--
 hw/ppc/spapr_drc.c        | 16 ++++++++++------
 qapi/machine.json         |  7 ++++++-
 qapi/qdev.json            | 32 +++++++++++++++++++++++++++++---
 stubs/qdev.c              |  7 +++++++
 7 files changed, 82 insertions(+), 13 deletions(-)

-- 
2.31.1


