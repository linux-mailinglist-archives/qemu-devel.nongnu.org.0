Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED180570C89
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 23:13:58 +0200 (CEST)
Received: from localhost ([::1]:39726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB0j7-0007Iu-KZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 17:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oB0gv-0003OT-8E
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:11:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oB0gs-0004ae-7e
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657573895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WjqHeTwij8g5vIpsoP6CU/9WJmN7JAWccumvg5MMmDw=;
 b=ILGZhVvNmfOtorka2CKJckctmjpVKb6YnP6r8IZBGplBAgHtPWcpJn9mGx1E2mVKA44i4u
 QuCZ/3lUhk0kZGynu5AuWbZ4hAhGuTeoO3xwdVMKFHxC19BcyxRPImJBIY07FepCu5bVXX
 AXNNRxqJigwsiqLm8yiuSRTdJul9CR8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-ORpF3Jv9PyqNygxc7a-wag-1; Mon, 11 Jul 2022 17:11:34 -0400
X-MC-Unique: ORpF3Jv9PyqNygxc7a-wag-1
Received: by mail-ot1-f69.google.com with SMTP id
 cd25-20020a056830621900b00618ff1dd900so2063953otb.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 14:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjqHeTwij8g5vIpsoP6CU/9WJmN7JAWccumvg5MMmDw=;
 b=hfzfG9mhtxBWMMtsmCH6Jtqk6pS62UimacF7957ctZxS0uEXvYr9xEujSsbRpu67GX
 9vZdEiPJzZjBgVE1qwctQaSM8ljP/u40gqv32cKn69IXp4wYpLXFvFGqm02qGDpRxm7D
 Mki/B4Oy+aRjWdCZp7uhnXtrWmmyRQ8FwtI4qEmQgWEoMRoUpqjyduGURvwUrqsvDarz
 jwkj8IZZuBItSnyEz7tOHFgKBD+9TWzYt62jrTlCl1Pps0mS0PCeNTGtF1pU7m2YeYBR
 Ychntq4IBi6bpSW0q0sSAXeyAXVCLnN+SyLDEGZH3F97InP3sgvLNRDr+PN4Zjm554DC
 o24A==
X-Gm-Message-State: AJIora9x3EJV6hO5MbA6cVZCsvGXA6aUf/uEs+bDnxMY+jO6OK7ofV7C
 rqWRLTmjx+ni52lIQ0B6z6vfBHRh+fcDTnGBkmA49eko45KWy94kW2e66dr/GgPTERlgV7wjDa5
 /EyLbBkpH9VfRwZA=
X-Received: by 2002:a05:6808:20a5:b0:339:f8be:2362 with SMTP id
 s37-20020a05680820a500b00339f8be2362mr185747oiw.157.1657573894101; 
 Mon, 11 Jul 2022 14:11:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tnPMN+/+vDN8hmf7M6bQygSESO1BfqXUGcf1PHV78dcorDagtVfFYbgP3ucTh9LIn0SfdkzA==
X-Received: by 2002:a05:6808:20a5:b0:339:f8be:2362 with SMTP id
 s37-20020a05680820a500b00339f8be2362mr185728oiw.157.1657573893790; 
 Mon, 11 Jul 2022 14:11:33 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:d647:bb68:29a5:e512:2c8b])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a0568080a8700b00339eb701c6csm3140343oij.41.2022.07.11.14.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 14:11:32 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] Zero copy improvements (QIOChannel + multifd)
Date: Mon, 11 Jul 2022 18:11:10 -0300
Message-Id: <20220711211112.18951-1-leobras@redhat.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

The first patch avoid spuriously returning 1 [*] when zero-copy flush is
attempted before any buffer was sent using MSG_ZEROCOPY.

[*] zero-copy not being used, even though it's enabled and supported
by kernel

The second patch introduces a new migration stat
(dirty-sync-missed-zero-copy) that will be used to keep track of [*]. 

The third patch keeps track of how many zero-copy flushes retured 1 [*]

Changes since v3:
- Patch#1: Also checks if no packet was queued after the last flush
- Patch#2: Improve dirty-sync-missed-zero-copy doc and hmp print message

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
  migration/multifd: Report to user when zerocopy not working

 qapi/migration.json   | 7 ++++++-
 migration/ram.h       | 2 ++
 io/channel-socket.c   | 8 +++++++-
 migration/migration.c | 2 ++
 migration/multifd.c   | 2 ++
 migration/ram.c       | 5 +++++
 monitor/hmp-cmds.c    | 5 +++++
 7 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.37.0


