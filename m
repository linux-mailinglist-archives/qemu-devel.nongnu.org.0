Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7286EE754
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 20:06:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prN34-0002zg-4a; Tue, 25 Apr 2023 14:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prN31-0002zR-Uu
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:05:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prN30-0005Pl-Gc
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682445949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BrFEw8wzYcrVIei+J80oQsGou8EVIEiyH71O9GarwAM=;
 b=Qi8Ezo60+/oiemsGMIRtrh27PmnYn8/OmWbwkdmhZKvSJLImOoKew4Md+gi3QJrBr0kz/i
 L2HGY3RAHorPfcXkevkqn0BC/foqb05Fc4W59UIdYBKk/HWExCBJsGnGQi1/v8USeDBi6K
 Xca/jKuaCFhnF7LSyCQInWw79FyOfDw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-ig7L3qxTPLee_yobWBIIHQ-1; Tue, 25 Apr 2023 14:05:48 -0400
X-MC-Unique: ig7L3qxTPLee_yobWBIIHQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3ecc0c4b867so18024701cf.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 11:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682445947; x=1685037947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BrFEw8wzYcrVIei+J80oQsGou8EVIEiyH71O9GarwAM=;
 b=iE7Fr1/ZkHrlHbXHCTV1hAzl/E9T4e3fI+ulHgJROlD5PscrVli2VQug0bmr9IhTVS
 eQPJLQ7XXBVHpsJ4EJm2wcJTUknpi86Dtc0xI7ygP0h5Q93yio7eBMbVmHvZJwh4x+n2
 e1T8MrVxDVzCOISoaZqJStMNikCJUgPv7XVLPAAXgnnpNEbvK42HP0F1mTYur7Cz3hjy
 /WoDJUVh3l7gIYFHDyV3he4nasAmaiYTRtyirnOuqVQf7MhMF0wp11jPnbLaOlY9L2IV
 U1O8pJMFwb3EpB9pOvvKglKMPMbMxdSjJ7ky/DnTn+/xn9NIKkmkNamQ2oNE/OKJ5s/Y
 EucQ==
X-Gm-Message-State: AC+VfDxnQjydgNssYiHZQZAUlvQ4CLx49wC2TSM27sBTX99ooTAuotqJ
 BHDfrngJqTsuQIZrcgdtKvbH3Iqp05C636AqiE2Dy+G1B2N7t5UMT4Iih8Xd68cAkeyZtuCNnhJ
 bYuWS5c7sIb+HAa5+yJNHuGTcyFby0bGkqq9fOpVN7f5vKGAYAMhJ2ttiLG2S/xrVs4KlTEom
X-Received: by 2002:a05:6214:518c:b0:5e9:2bad:c920 with SMTP id
 kl12-20020a056214518c00b005e92badc920mr4428397qvb.5.1682445947138; 
 Tue, 25 Apr 2023 11:05:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7RK1kMump+7m8qnbHeNohYOj7QsQCravlCiIeRdRJQIxYOf7yUwFvDBfdkMroXoX04a2Ms/w==
X-Received: by 2002:a05:6214:518c:b0:5e9:2bad:c920 with SMTP id
 kl12-20020a056214518c00b005e92badc920mr4428366qvb.5.1682445946860; 
 Tue, 25 Apr 2023 11:05:46 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05620a271100b0074e034915d4sm4552297qkp.73.2023.04.25.11.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 11:05:46 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: [PATCH 0/2] vmstate-static-checker: Fix VMS_ARRAY comparisons
Date: Tue, 25 Apr 2023 14:05:42 -0400
Message-Id: <20230425180544.1815888-1-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I'm doing some machine type checks to make sure nothing breaks for
7.2<->8.0.  Along the way I found one false negative report on e1000e using
the static checker, turns out to be an issue in the checker itself.

The problem is the checker doesn't take VMS_ARRAY into account when
comparing with UNUSED, hence the total size is wrongly calculated.

Fix that first in qemu by start dumping size of array as "num", then teach
the checker for that.

NOTE: the patchset will change both behaviors for either -dump-vmstate on
QEMU or the checker, however both patches will be compatible even with old
QEMU dumps or even old vmstate-checker script.  That's not extremely
important, IMHO, but still worth mentioning.

Thanks,

Peter Xu (2):
  migration/vmstate-dump: Dump array size too as "num"
  vmstate-static-checker: Recognize "num" field

 migration/savevm.c                |  3 +++
 scripts/vmstate-static-checker.py | 13 ++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.39.1


