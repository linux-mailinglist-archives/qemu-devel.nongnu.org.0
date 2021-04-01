Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B28352145
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 23:03:43 +0200 (CEST)
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS4Te-0008Bq-1Y
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 17:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS4Rx-0007DS-OH
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:01:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS4Rw-0003BR-68
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617310915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sgZU3tVTtf+Y5PYDl339f9IHAEXK8K6n4PzvkNbHKOs=;
 b=RxUj1s1nWgWT10a7RqSQ1PqsKtAfoJd2i+4iiYydK70CdXELTNcvkSPeKnAqUBMgx1sps0
 ysJBrXY/T1sGsKNcHrLXqQAmGldXphJs5MF/sTBrwp3k3B6wu5I8fXgKIdgfYJFoXxv7L8
 X/fEyDgg2Yq1DAlPQfwRU9Q3DMtcwdQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-ZsyXHV7yM-K1rT--KkSoqA-1; Thu, 01 Apr 2021 17:01:53 -0400
X-MC-Unique: ZsyXHV7yM-K1rT--KkSoqA-1
Received: by mail-oi1-f199.google.com with SMTP id o125so2654873oif.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 14:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sgZU3tVTtf+Y5PYDl339f9IHAEXK8K6n4PzvkNbHKOs=;
 b=pFyRRfacXU37j2/Awf85KcqblNvzRXR/uMY7mvDNaJ16sVUErLLiVpSGIBmcYDErfO
 yVraxg1xPcq4gRefaxFrMyFBBY75GLkcNmk75P5cveFQyEstOfDwRvbUQlG0+ANvQ6RI
 h2seM17UkZeqnX8CDOaMrSIEXzTeKvPMoFNEfE7BJwG6p+ERAsJpF7e3AKhPDF9K1KTg
 oKTzJwm9iXnkCeinDLb3GL45qMs/h4wAKpzrPFkkn62ykt15roLk83IonJq5Tshl05Ez
 9WT9KIHRQRwY3XO2Z8mhbVuEZmChRKr1D3b53D7z180e/UtwkoUa0tmmsGwEtgQQqsmk
 fJ9A==
X-Gm-Message-State: AOAM53093PoI5QujtgU0fP8ekE4+27tvq/Y2fJ8vyrU+vJHAl2KuqCNC
 UAonF5aK+hbGKksZw7mmTe5KhriHAYdHWeSZRKGAjrUzvrJ7wE/LuwJFrMWoCdlxkWNiM4hTsNO
 gwj53tFtLFhcB2lA=
X-Received: by 2002:a9d:6a14:: with SMTP id g20mr8401238otn.205.1617310912426; 
 Thu, 01 Apr 2021 14:01:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvLQf6w/BbbPDE+PyTABYbsycKqU/GuJHUfjlYNkQLf3ReqrIIsQQkwGJB2hSytI/eKsIQeA==
X-Received: by 2002:a9d:6a14:: with SMTP id g20mr8401226otn.205.1617310912237; 
 Thu, 01 Apr 2021 14:01:52 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id g2sm1377891otn.32.2021.04.01.14.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 14:01:51 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] Fix segfault in qemu_rbd_parse_filename
Date: Thu,  1 Apr 2021 16:01:48 -0500
Message-Id: <20210401210150.2127670-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced the change to qemu_rbd_next_tok with a standalone escape-aware
helper for patch 2.

Connor Kuehl (2):
  iotests/231: Update expected deprecation message
  block/rbd: Add an escape-aware strchr helper

 block/rbd.c                | 20 ++++++++++++++++++--
 tests/qemu-iotests/231     |  4 ++++
 tests/qemu-iotests/231.out |  7 ++++---
 3 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.30.2


