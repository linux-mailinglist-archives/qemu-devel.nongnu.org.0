Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66974561A8B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 14:42:10 +0200 (CEST)
Received: from localhost ([::1]:38182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6tUn-0005VB-Gj
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 08:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o6tNQ-0001Cq-Sw
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o6tNM-0002DZ-DS
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656592466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=99iE1SKk18R9NEVbFH9ougEyrlel/I560aXbefRHjOY=;
 b=TOw93tKzdQSYceuT2wqa6aGsMorRguW4qHBy2eBUq+UTLKV+9VgA9BMD4cMJiQ29rb3ITZ
 Gqvi9BoHMebJRhpPUtbeF/YKoWDtAPFVBKUQfzmX9lVX0TY7GUF1YEtZ3ieu4bSz1jUhRB
 mmc1Uk3Bti2gzHmmVLRILO+/IrGa+R8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-XzmIcThFPdeto6rKFiyFrA-1; Thu, 30 Jun 2022 08:34:25 -0400
X-MC-Unique: XzmIcThFPdeto6rKFiyFrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB197185A79C;
 Thu, 30 Jun 2022 12:34:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E81AE1410F3B;
 Thu, 30 Jun 2022 12:34:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 0/3] python/qemu/machine: fix potential hang in QMP accept
Date: Thu, 30 Jun 2022 16:34:16 +0400
Message-Id: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

As reported earlier by Richard Henderson ("virgl avocado hang" thread), avocado
tests may hang when QEMU exits before the QMP connection is established.

v2:
 - use a socketpair() for QMP (instead of async concurrent code from v1) as
   suggested by Daniel Berrange.
 - should not regress (hopefully)

Marc-André Lureau (3):
  python/qmp/protocol: add open_with_socket()
  python/qmp/legacy: make QEMUMonitorProtocol accept a socket
  python/qemu/machine: use socketpair() for QMP by default

 python/qemu/machine/machine.py | 24 ++++++++++++++++--------
 python/qemu/qmp/legacy.py      | 18 +++++++++++++++---
 python/qemu/qmp/protocol.py    | 25 ++++++++++++++++++++-----
 3 files changed, 51 insertions(+), 16 deletions(-)

-- 
2.37.0.rc0


