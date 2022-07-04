Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6C565E68
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 22:25:51 +0200 (CEST)
Received: from localhost ([::1]:58800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Sdh-0006fR-RH
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 16:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o8Sbf-0005Jq-V2
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o8Sbd-0004VZ-5e
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656966220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ExpyAdz2PVjxdYyxyP+Svd+Dm6JzEwsWDnVDC+VCXdU=;
 b=gGj+i7PBwl6YXrQtXW8A4GK53yPOlJG1LEbDDwnmPzlcxKxL77QQhezevtqdDfYAqcbPSw
 zb0nPpoEbtzZwtgZRE+cbJKoC9b5TRZ6D25ukq1nJlNtqZarIikHO56zywokKSP53Q44Nv
 HNIgKfuq2XVXIdHljega4cTpq5nuHkY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-d2Yrdy8YOL-QKMksiZHryQ-1; Mon, 04 Jul 2022 16:23:37 -0400
X-MC-Unique: d2Yrdy8YOL-QKMksiZHryQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 a68-20020a376647000000b006af6c4be635so9461757qkc.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 13:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ExpyAdz2PVjxdYyxyP+Svd+Dm6JzEwsWDnVDC+VCXdU=;
 b=vPyTuDo7quhYjVtA9+eSzEDuuyIZOMMPLBiJs0B/btoz65X8eUT/VrI8/EhE1WWGq1
 YIHqbNtIiA0nmYvnFfv0C/SavmqqT3FcD+P/PuncUQIKpdlqgH7kzzne7L5IPHoxl35/
 uF25GEzEyMTIB6+Yed9LTQo72c6u1XAPtn4k8T7iaHl9+2nwGIchB+zXwb+yEP/lmuch
 EJfT6/o+gvqCq0FfHub4pXeOhm+xyUfCCC9711359BEDbAMWHBJt4DqJKlOaNi5jdhBz
 56VV6BPemacR90c2bn15LF0Tqp9H3TvgsT/7QbrXBV6FwFih/ippkUtZrmKgWX7t7TKp
 alJA==
X-Gm-Message-State: AJIora/WmUtvjlXNMtXIXADXA++DuKQGFuZsENb7SvRmGlRe3IzRto75
 8LJQ1vleoJnCrncenViA7n5kDu6jLpyqOP2ShFLkyLlHLAU0Asu2Fyey2E87b1rk3q0TOT94TUI
 xNerYSTHXUs+KHlM=
X-Received: by 2002:a05:620a:747:b0:6af:25b4:bb28 with SMTP id
 i7-20020a05620a074700b006af25b4bb28mr21349218qki.438.1656966216898; 
 Mon, 04 Jul 2022 13:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uOGcRjEqjgrm8lro9h0vLoegZKzyZYPbHa5Htrwtl0Or9o5cRzWgNBWD0KVoL6GfwPOmvr9Q==
X-Received: by 2002:a05:620a:747:b0:6af:25b4:bb28 with SMTP id
 i7-20020a05620a074700b006af25b4bb28mr21349203qki.438.1656966216513; 
 Mon, 04 Jul 2022 13:23:36 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7ed:cb75:d392:178:9101:5763])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05620a0b8b00b006b25570d1c2sm9180127qkh.12.2022.07.04.13.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 13:23:35 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] Zero copy improvements (QIOChannel + multifd)
Date: Mon,  4 Jul 2022 17:23:12 -0300
Message-Id: <20220704202315.507145-1-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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

The first patch avoid spuriously returning 1 [*] when zero-copy flush is
attempted before any buffer was sent using MSG_ZEROCOPY.

[*] zero-copy not being used, even though it's enabled and supported
by kernel

The second patch introduces a new migration stat
(dirty-sync-missed-zero-copy) that will be used to keep track of [*]. 

The third patch keeps track of how many zero-copy flushes retured 1 [*]

Changes since v2:
- Documentation release number changed from 7.2 to 7.1
- migration stat renamed from zero-copy-copied to 
  dirty-sync-missed-zero-copy
- Updated documentation to make it more user-friendly

Changes since v1:
- Idea of using a warning replaced by using a migration stat counter

Leonardo Bras (3):
  QIOChannelSocket: Fix zero-copy flush returning code 1 when nothing
    sent
  Add dirty-sync-missed-zero-copy migration stat
  migration/multifd: Warn user when zerocopy not working

 qapi/migration.json   | 7 ++++++-
 migration/ram.h       | 2 ++
 io/channel-socket.c   | 8 +++++++-
 migration/migration.c | 2 ++
 migration/multifd.c   | 2 ++
 migration/ram.c       | 5 +++++
 monitor/hmp-cmds.c    | 4 ++++
 7 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.36.1


