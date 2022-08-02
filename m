Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F658823F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 21:05:21 +0200 (CEST)
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIxCi-00009m-Sz
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 15:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oIx85-0002mD-UB; Tue, 02 Aug 2022 15:00:33 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:49116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oIx84-0000np-9j; Tue, 02 Aug 2022 15:00:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EBA361335;
 Tue,  2 Aug 2022 19:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E767C433C1;
 Tue,  2 Aug 2022 19:00:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UG/rhbNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659466822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjM1e9IXBF3GNzehoiJscGOnuG/6hgpK8o6jfd4cQPI=;
 b=UG/rhbNyfq2n74Oe4qQeyf7oULhTH3348lZQCC0iwiWvLgMv1/8Iokr8DtPUha6wQFmToO
 2K7bgnCIMZ5gDYitlcYzst2Jo2mPH8NLWnM5Ca6XQuyC1aNcK0xqMHJHAM/yDEMs9pnR2k
 ye3D3XI7G9vBgNf1sb4MGEmc6afpTqI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5ac501fd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 2 Aug 2022 19:00:21 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: [PATCH v4 0/2] MSA EXT 5 for s390x
Date: Tue,  2 Aug 2022 21:00:09 +0200
Message-Id: <20220802190011.458871-1-Jason@zx2c4.com>
In-Reply-To: <Yul0G2YCKLXiypvv@zx2c4.com>
References: <Yul0G2YCKLXiypvv@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In addition to the prior TRNG patch from v3, this v4 adds SHA-512
support.

I know, I know, I know -- I fussed around asking if somebody would help
me implement this because it was "oh so hard", and offered to do the
crypto part if someone would do the rest. But then once I had the crypto
part, I wanted some way to test it and then... and then the
implementation worked and passed the test vectors.

So now these two patches together implement MSA EXT 5, and appear to be
working with Linux's drivers for it.

Cc: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Harald Freudenberger <freude@linux.ibm.com>
Cc: Holger Dengler <dengler@linux.ibm.com>

Jason A. Donenfeld (2):
  target/s390x: support PRNO_TRNG instruction
  target/s390x: support SHA-512 extensions

 target/s390x/gen-features.c      |   4 +
 target/s390x/tcg/crypto_helper.c | 146 +++++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

-- 
2.35.1


