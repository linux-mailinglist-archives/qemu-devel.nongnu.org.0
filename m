Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD7355E514
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:52:31 +0200 (CEST)
Received: from localhost ([::1]:51044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Bdm-00035Q-PX
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o6BbJ-0001DW-Fg
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o6BbH-00078a-Jf
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656424194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C3FzsQAFUGtjRScJqGrUh+s3l36gJjTZ2c9yoNDkDwM=;
 b=fTu8/m0MQpK3BhpcB3g5QSBxE4Pec8SqH/hvF46vbf6msCEv+BmDxlKQ2DjgdBxOjw6h7C
 wi6cSLZyD7F26CfPdlgB8ghYVonZ70dfQPuvNGkEprufq1UA9OeFZ1cxOq66w5O/YPyc2q
 +qrgS7ADbbC3Ekrh2olidWJ3BO1lbZI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-J0oCEEbfO-SpJm63N7MWaw-1; Tue, 28 Jun 2022 09:49:44 -0400
X-MC-Unique: J0oCEEbfO-SpJm63N7MWaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB109801E6B;
 Tue, 28 Jun 2022 13:49:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C33BE2026D64;
 Tue, 28 Jun 2022 13:49:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 0/2] python/qemu/machine: fix potential hang in QMP accept
Date: Tue, 28 Jun 2022 17:49:37 +0400
Message-Id: <20220628134939.680174-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

My proposal to fix the problem here is to do both accept() and wait()
concurrently by turning some code async. Obviously, there is much larger
work to be done to turn more code into async and avoid _sync() wrappers, but
I do not intend to tackle that.

Please comment/review

Marc-André Lureau (2):
  python/qemu/machine: replace subprocess.Popen with asyncio
  python/qemu/machine: accept QMP connection asynchronously

 python/qemu/machine/machine.py | 58 ++++++++++++++++++++++++----------
 python/qemu/qmp/legacy.py      | 10 ++++++
 2 files changed, 51 insertions(+), 17 deletions(-)

-- 
2.37.0.rc0


