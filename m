Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975255BCE7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 03:11:43 +0200 (CEST)
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5zlV-0003L7-Rc
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 21:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o5zjc-0001zB-L9
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 21:09:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o5zjZ-0002To-No
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 21:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656378580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bV4SeA30yjzx1fAqgVTn6osda0ycRuUReVggJ5rkqig=;
 b=GbRE69yp6zU3cL9ZZKCG/39R46UCaiBvoMbcIJe7SBFfIewgPhHzPI32Bhubafn3CsuIQi
 evSZCmKMcze2GX/cxwX5WRLowftGWypquEXiUJdoWv9L+PYfBEHYDXbrtIM49hO9nquAJ+
 Gt95DfQ5RkRu9AvNDCmvArB3VMOlXwc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-weZuREiiO1yavr2jnKPrxg-1; Mon, 27 Jun 2022 21:09:38 -0400
X-MC-Unique: weZuREiiO1yavr2jnKPrxg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bs17-20020a05620a471100b006a734d3910dso11926100qkb.22
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 18:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bV4SeA30yjzx1fAqgVTn6osda0ycRuUReVggJ5rkqig=;
 b=Jx2hpDBYsP9XqgIDsRhtJuFAegzo/uoJOLUnrgfkz3poP2GfKKNcx1VXHE7TaKp0s8
 FtWLm6vmTLRKx3C1tOZ3bkxJQGJBS7e5h7J0VbEesVY4qKCipEhWm7J8jjy0co64GphP
 h+55vBYOkwibXBTUReRRP42vxmgy4nqtfbpKKUZ/M1u27EIGa8MUbciGmhyOEc3CxyI6
 sqKS/p8N04NnTqljkVk+NNRQkhHiG65zuyQ06BBaS9Rov8rxbnmSQ4CEohX52L+NLv3x
 0PCej/7ZCybYNOE6yYls5gwOTTSoy6IpRF2Cl/7FLx9bUDkJmNljMIc6ACf7f6ibmKvA
 0aEg==
X-Gm-Message-State: AJIora8pj6+EYM0JX+oZbNEkV8oVwBferucvjYyLkWtbF9hcgPvZ+r2+
 1bxHcAhih/lGK+91/MUbfGX7biynsl4+elcpcfYCWU2ZoH4jl9bqzR8nnaNoqqYxTR2oyqDywZB
 RQeX9lyB/hFy/y/8=
X-Received: by 2002:a05:622a:1053:b0:31b:8c84:b1a0 with SMTP id
 f19-20020a05622a105300b0031b8c84b1a0mr3447162qte.284.1656378578470; 
 Mon, 27 Jun 2022 18:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vV/VJGhxgyhACDlF6omgFOpcxFaW8AEq19oAX7hgE1IekbK8f8vGcyA+pyOOqtpV/Fl/zOUg==
X-Received: by 2002:a05:622a:1053:b0:31b:8c84:b1a0 with SMTP id
 f19-20020a05622a105300b0031b8c84b1a0mr3447144qte.284.1656378578217; 
 Mon, 27 Jun 2022 18:09:38 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:57bb:78f:fc5a:be9c:9417])
 by smtp.gmail.com with ESMTPSA id
 cc18-20020a05622a411200b0031b7441b02asm1742047qtb.89.2022.06.27.18.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 18:09:37 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] Zero copy improvements (QIOChannel + multifd)
Date: Mon, 27 Jun 2022 22:09:07 -0300
Message-Id: <20220628010908.390564-1-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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

The second patch should be applied on top of Juan Quintela's patchset that
reduces the frequency of multifd syncs, or else it could potentially send 
20 warnings per second.
									...
Leonardo Bras (2):
  QIOChannelSocket: Fix zero-copy flush returning code 1 when nothing
    sent
  migration/multifd: Warn user when zerocopy not working

 io/channel-socket.c | 8 +++++++-
 migration/multifd.c | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.36.1


