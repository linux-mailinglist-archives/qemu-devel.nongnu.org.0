Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEBF550FC2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 07:46:03 +0200 (CEST)
Received: from localhost ([::1]:58830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3AEc-0000je-LV
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 01:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3A96-0006qy-1S
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3A90-0001zU-6H
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655703611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PgzR8piAJ4B8cwHAfpZ4kcYmY6n5Mx15n+DfMeIAD90=;
 b=Zmlv94x8NqQWHkRPlM72eZOHWkoFikhN6i/4GnCtJPoxuR4yitFKRUA6P1qtWaAvYrSvgT
 Vn1CzDWFjxlPimMAY9okfmouh8sg9igdk8Wh1oWuyh1h2D5GpDgd+Q55DTBrTjOcthsLDG
 rY/M3grtwoM5KYqxaFDDe1hEdOI6ZUM=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-rv0ygD9RMoGc32VHm3vUGQ-1; Mon, 20 Jun 2022 01:40:07 -0400
X-MC-Unique: rv0ygD9RMoGc32VHm3vUGQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 u10-20020acaab0a000000b0032ef839f0d3so5705163oie.12
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 22:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PgzR8piAJ4B8cwHAfpZ4kcYmY6n5Mx15n+DfMeIAD90=;
 b=IWs38ysPoQc/0+1a1+s6RM1AIov+UiLu5haHuYxNNSFG2J4fz/HytulFdFYMAs3eQw
 3RXUDFX57NzPphlXV+sNPGIfQ9RU+s4XG8qjlFcTnmNTdZubsipx8XXkvHt9rCAcrHVV
 MhEEZEAGzMAfz6l2lmFk0W6l3E2/WWCuKU8wg+1WTWXoLb3xn96+vYox9VUyp0tKr8/e
 wXGXbC6rT6+RGEenyPdjK6LVstvArYNWP0mfqpptpRnVZjNSbrHR8EaU4UgqqyDmL3ih
 pLqY42PvltGAI9esnBqRzIgYtcHCGXpUNphLW0/u3RDR+XoQHd4JjLVcqW+IMwR4Ce6h
 CPbw==
X-Gm-Message-State: AJIora8BaGqjwb9GoOiCQ4/0U0oL42L9vBF0xZyCaLaOpKsNy3YsM4+8
 nDTJMlpFUfKlCuEcl6Caxx4ymqp5fnSdBwnl2TxQcdCOUHI/iTfehtfRjpbjSXuRBeu0d+70Vgx
 QAI7oVObo6hSdVig=
X-Received: by 2002:a05:6870:470f:b0:101:c4a6:be47 with SMTP id
 b15-20020a056870470f00b00101c4a6be47mr5481458oaq.238.1655703606813; 
 Sun, 19 Jun 2022 22:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vWoWHLv4MfKy53rpB6jLCXGS9whIidiJ5i1A3kX3HEf/ckR4cjmpOvmDrdsEO1DV/NbBsxUQ==
X-Received: by 2002:a05:6870:470f:b0:101:c4a6:be47 with SMTP id
 b15-20020a056870470f00b00101c4a6be47mr5481448oaq.238.1655703606623; 
 Sun, 19 Jun 2022 22:40:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:d933:8f52:267a:639c:b4c0])
 by smtp.gmail.com with ESMTPSA id
 e94-20020a9d2ae7000000b0060c2845c175sm7021463otb.8.2022.06.19.22.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 22:40:06 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?=E5=BE=90=E9=97=AF?= <xuchuangxclwt@bytedance.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] MSG_ZEROCOPY fixes & improvements
Date: Mon, 20 Jun 2022 02:39:41 -0300
Message-Id: <20220620053944.257547-1-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Patches 1 & 2 are about a fix needed to make zero-copy flush work.
The code that incremented the sendmsg counter ended up missing in
the last versions of the patchset, causing the flush to never
happen.

Patch 3 is about an improvement on flushing that improves 
sending performance.

Patch 4 is about making zero-copy-send a migration capability,
instead of a migration parameter. Which actually makes more sense
and helps the implementation of the libvirt code.

Leonardo Bras (4):
  QIOChannelSocket: Introduce assert and reduce ifdefs to improve
    readability
  QIOChannelSocket: Fix zero-copy send so socket flush works
  migration: zero-copy flush only at the end of bitmap scanning
  migration: Change zero_copy_send from migration parameter to migration
    capability

 qapi/migration.json   | 33 +++++++-----------------
 migration/multifd.h   |  1 +
 io/channel-socket.c   | 19 ++++++++++----
 migration/migration.c | 52 ++++++++++++++------------------------
 migration/multifd.c   | 58 ++++++++++++++++++++++++-------------------
 migration/ram.c       |  7 ++++++
 monitor/hmp-cmds.c    |  6 -----
 7 files changed, 83 insertions(+), 93 deletions(-)

-- 
2.36.1


