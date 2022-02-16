Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46604B9262
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:35:35 +0100 (CET)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKR1S-0002Bd-Pe
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:35:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKQX0-0000US-O8; Wed, 16 Feb 2022 15:04:06 -0500
Received: from [2607:f8b0:4864:20::129] (port=42616
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKQWz-0000PR-1Y; Wed, 16 Feb 2022 15:04:06 -0500
Received: by mail-il1-x129.google.com with SMTP id h11so641591ilq.9;
 Wed, 16 Feb 2022 12:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pt9ygfS8UKvoBDRZ+mv5QnsIVlq99n2MIZwbC3VyLXA=;
 b=Ypgjfe+sRuUcasgiDOMwnAMlIPQNUWg5nwqYiATRc6YVHtcx6QwJPR/ZJFaIEC8p19
 ti6dc2b3hyxSllUCo5IINtVf30ByMjHSUSEdTJFNZQEpmn6ujLBHi9bU7XrWx25vlLs9
 bD8WDD9pnyNHhK8TU5zHGY9k28B+nXrhJJKA9p+yBCJeSC2uhgIbsrBH3bnlFLzlhvAJ
 d77GlOo5GbVbwQXbAXVDb1AhTa51Zsga4qJAqJNJszeaKoKYQAFMe5UpWJ7GZXfL2onU
 Kf6WS7lF+vc9uZLYYMhXCYHeKbO3YWLRjRy9OeD/u0lIGjkAJsxVTCECgUwvzUDxhgGV
 F7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pt9ygfS8UKvoBDRZ+mv5QnsIVlq99n2MIZwbC3VyLXA=;
 b=3SH/PoOHPpsToULTx43V7F6H9U8yO0/+LIIBnb757xeJud3vl94Joytf5ua4QQKjjl
 4mGT0dPAIEZ1mzyE5W16aNPvEvwehk+Mya/j/xMcc+yuZRTxlnl6HiU8eO/uLBGzD/uq
 yAd2rnEmulI9kG9sh5J/KsdyvotvjRlc2Z10C4aS/+xCjqYuqy+q5NN4f60MpE1tWjme
 EQx/0zDx7J5Wr9mMoaZYgTD13/iveYtC93QMXN8bmV/r27b/jbTm6IyrRRDCc/SKLzHS
 apuCPhvOMc55+682Mm22TDVeOWWPzh2wZ4JF2Cx/7fXqK4lNSET4/vJMBkgKKRGg/Z7R
 6MPA==
X-Gm-Message-State: AOAM5318K5kxtMlzTViVTTbGSjh378VMwlutITZ4MjG9G3nJiuNZBl6G
 0L/qlx+AYBhvfK4TwjIrmSqwCXnETXoAPsF/s58=
X-Google-Smtp-Source: ABdhPJzhdKx3TfG2erybYlvFcd4AA5oPOE3wlUB8/pUcXS+z5d3hGl01xPsnRvWMWz4Z0yPBqd5TmA==
X-Received: by 2002:a92:d948:0:b0:2be:c9:6bc8 with SMTP id
 l8-20020a92d948000000b002be00c96bc8mr2870836ilq.53.1645041842595; 
 Wed, 16 Feb 2022 12:04:02 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 j14sm428902ilc.62.2022.02.16.12.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 12:04:02 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] s390x: Add partial z15 support and tests 
Date: Wed, 16 Feb 2022 15:03:52 -0500
Message-Id: <20220216200355.128731-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=dmiller423@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add partial support for s390x z15 ga1 and specific tests for mie3 

v3 -> v4:
* Change popcnt encoding RRE -> RRF_c
* Remove redundant code op_sel -> op_loc
* Cleanup for checkpatch.pl
* Readded mie3-* to Makefile.target

v2 -> v3:
* Moved tests to separate patch.
* Combined patches into series.


David Miller (3):
  s390x/tcg: Implement Miscellaneous-Instruction-Extensions Facility 3
    for the s390x
  s390x/cpumodel: Bump up QEMU model to a stripped-down IBM z15 GA1
  tests/tcg/s390x: Tests for Miscellaneous-Instruction-Extensions
    Facility 3

 hw/s390x/s390-virtio-ccw.c      |  3 ++
 target/s390x/cpu_models.c       |  6 ++--
 target/s390x/gen-features.c     |  6 +++-
 target/s390x/helper.h           |  1 +
 target/s390x/tcg/insn-data.def  | 30 +++++++++++++++++--
 target/s390x/tcg/mem_helper.c   | 20 +++++++++++++
 target/s390x/tcg/translate.c    | 53 +++++++++++++++++++++++++++++++--
 tests/tcg/s390x/Makefile.target |  5 +++-
 8 files changed, 114 insertions(+), 10 deletions(-)

-- 
2.32.0


