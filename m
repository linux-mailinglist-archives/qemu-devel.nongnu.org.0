Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A516D79C2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:34:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0RG-0000yg-Po; Wed, 05 Apr 2023 06:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk0RD-0000xZ-KW
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk0RC-0007Ow-2f
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680690741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Sn62tRxlY5kSlEVoDBJ2xBI3ipflYG+CvTvPc0iJBEA=;
 b=F4M6j1NZ+1F5vTq6c/Q263NdAUukkiac8uh4HndrozVarL1a5xeUxL2jdADkKM4SClRPGb
 B1DHbW3KwkVkOu7EsAaxJ2f2HFuX75CkY94Rfg4UEmGW9zi8qYge/8yddTEt3UuNEBLQP+
 uEoBJiqTY3J6yjgkIBgFurvl/iMIezU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-oKdyjOMFNlea0XciSmvYKg-1; Wed, 05 Apr 2023 06:32:19 -0400
X-MC-Unique: oKdyjOMFNlea0XciSmvYKg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-946832a17f7so31102366b.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680690738; x=1683282738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sn62tRxlY5kSlEVoDBJ2xBI3ipflYG+CvTvPc0iJBEA=;
 b=C0QeEfBoRJE0rvUNVr5rw3Qo6IgMzYUZVmQWUP3gF22AV+hkBqz6kh6m/G/BxZI6mC
 UqdCY8LSl330SjnPhD4BgwJzMR/WFA1sSuhKN+1z2p7fRMcya9g+JkJdHbrnTdOlHOI9
 5s4v9lsU143E5/5uHzbXvhqKJbaqh7PDqclNVGWORQiehh8YVXnXVvartBi7dtpuBTB0
 5qefcWK2Q5x4RJg8nVpQppGQaio1bpx1YbtvMy5Qnh13UJSnoVWXVWvbYrS5DwaAYeIF
 VWr0hvpm/q56ysJII0I1lIptw6yrfVBZYO9Yk3e3sy4BDdAoe8bq8SVJBFwIle0wb1ug
 GaFw==
X-Gm-Message-State: AAQBX9dD3EajUTEvlU48JSEDSvFWM6NKVEc9TnZ1dhhWVy5gYwUvxrIm
 ecI0oluX/YgxFG3NUPGazTKFhvbmj25L6Sun/Ka6M2yDjT/PpX3UgewctWNhVSd2C6DQyagKk8m
 QXt+isNWwBWk2y/NY+HM4gnGm6J3D76Mm3f9oWgl7sGlDfc9i7ShOIguZ133RrJ4+pR3cRl8q4c
 g=
X-Received: by 2002:aa7:c587:0:b0:4fa:b302:84d4 with SMTP id
 g7-20020aa7c587000000b004fab30284d4mr1261896edq.13.1680690738176; 
 Wed, 05 Apr 2023 03:32:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350YSMupNcSRvdhGateaiuNbJy1VvbhAIuTyB/lGYzJ+ccKMpRRG1EELVLdVExvOCrYE5Au8TBA==
X-Received: by 2002:aa7:c587:0:b0:4fa:b302:84d4 with SMTP id
 g7-20020aa7c587000000b004fab30284d4mr1261879edq.13.1680690737854; 
 Wed, 05 Apr 2023 03:32:17 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a1709064d0600b0093034e71b94sm7220304eju.65.2023.04.05.03.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:32:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 0/4] block: clean up coroutine versions of bdrv_{is_allocated,
 block_status}*
Date: Wed,  5 Apr 2023 12:32:12 +0200
Message-Id: <20230405103216.128103-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Provide coroutine versions of bdrv_is_allocated* and bdrv_block_status*,
since the underlying BlockDriver API is coroutine-based, and use
automatically-generated wrappers for the "mixed" versions.

Paolo

Paolo Bonzini (4):
  block: rename the bdrv_co_block_status static function
  block: complete public block status API
  block: switch to co_wrapper for bdrv_is_allocated_*
  block: convert more bdrv_is_allocated* and bdrv_block_status* calls to
    coroutine versions

 block/copy-before-write.c |  2 +-
 block/copy-on-read.c      |  8 ++--
 block/io.c                | 87 +++++++++------------------------------
 block/mirror.c            | 10 ++---
 block/qcow2.c             |  5 ++-
 block/replication.c       |  8 ++--
 block/stream.c            |  8 ++--
 block/vvfat.c             | 18 ++++----
 include/block/block-io.h  | 30 +++++++++-----
 9 files changed, 69 insertions(+), 107 deletions(-)

-- 
2.39.2


