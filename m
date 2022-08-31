Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3EF5A7949
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 10:45:32 +0200 (CEST)
Received: from localhost ([::1]:35178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTJLn-0006Bx-6C
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 04:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aburgess@redhat.com>)
 id 1oTJJP-0003Zx-WF
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aburgess@redhat.com>)
 id 1oTJJN-0007tl-Qc
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661935381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UJUWpPhb5QAZbJ3P+LZR9Jbsr0T1SN614QD9dqi2kwo=;
 b=TlZs6OstJMY9vsUAMdPLw623noPNZdyprK/8SSTuPeN98NKygznaHWOtd9tcGco8xpdhYa
 P95aFhHxYcM3UwjBm6cQfu4MX/pDBOiefRZhWrueHpIAJrhDR/pI9IJr2xMAPUjv6cqb1s
 tJMwkZZfK2HidAONT4d9RWmlFcHXEKM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-KD_ArTnyMvSvazmLg2BQwg-1; Wed, 31 Aug 2022 04:41:29 -0400
X-MC-Unique: KD_ArTnyMvSvazmLg2BQwg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i132-20020a1c3b8a000000b003a537064611so7975284wma.4
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 01:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=UJUWpPhb5QAZbJ3P+LZR9Jbsr0T1SN614QD9dqi2kwo=;
 b=6+CQAQlx29MGmFs69VVIb5WklTjm/OwTIleX/R9WbPRmkSYREJXaD/5wAyfD5A+iFn
 kQh2Mfv4EsTszmhqC5shF7zQ8OHqs2yp+SY787Ks4PsIEWR2zB6i10cgEt6iEJAggCkd
 p1Tl7BSvwWLdHEcXkA1h+o0MPD+2snQsP515vwndANUxQEDeL0rbN5EoiDRGQY+nSZ5K
 G+MZTt9M8tL1feTJitxi+Ao+2ld+2dIncVSc8kTJldjy7ASDhNuToraJLSEFEvBW8/Pb
 qJ1pMw8tdbC+P/u24g8M8LTS7UNj7KAZb2Zu1CkEQvJPnKgtcfq5HIHTIiRVH99N7Run
 DqKQ==
X-Gm-Message-State: ACgBeo3bT2odyg2Bap/OGFy8inqKIl151aQ6PWIyLznojbcxWA/bqFAm
 99pA+UkF9Efid0ml1Ycez4H29vBxtm1ALelY46sUJi65p2nNJd8nfL0KZcVAQS8rIVbc992NRri
 Zcivk2B+Zcvt8KXOIiJBPd5oQ40SAe4bpOidlhGiymoLEh8p4MI7/iuKdNeYUAeMAGa0=
X-Received: by 2002:a05:6000:1867:b0:21f:f2cf:74a8 with SMTP id
 d7-20020a056000186700b0021ff2cf74a8mr11267246wri.344.1661935287745; 
 Wed, 31 Aug 2022 01:41:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Y+/LEZdYymahFcQxihYPF1uAbFGEs/HFLEGqOeVxIVeCgOxXIBxoLfROgQlv6e1nE5UeDXg==
X-Received: by 2002:a05:6000:1867:b0:21f:f2cf:74a8 with SMTP id
 d7-20020a056000186700b0021ff2cf74a8mr11267232wri.344.1661935287425; 
 Wed, 31 Aug 2022 01:41:27 -0700 (PDT)
Received: from localhost ([31.111.84.229]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003a54f49c1c8sm1791305wmq.12.2022.08.31.01.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 01:41:27 -0700 (PDT)
From: Andrew Burgess <aburgess@redhat.com>
To: qemu-devel@nongnu.org
Cc: Andrew Burgess <aburgess@redhat.com>
Subject: [PATCH 0/2] target/riscv: improvements to GDB target descriptions
Date: Wed, 31 Aug 2022 09:41:21 +0100
Message-Id: <cover.1661934573.git.aburgess@redhat.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=aburgess@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

I was running some GDB tests against QEMU, and noticed some oddities
with the target description QEMU sends, the following two patches
address these issues.

Thanks,
Andrew

---

Andrew Burgess (2):
  target/riscv: remove fflags, frm, and fcsr from riscv-*-fpu.xml
  target/riscv: remove fixed numbering from GDB xml feature files

 gdb-xml/riscv-32bit-cpu.xml |  6 +-----
 gdb-xml/riscv-32bit-fpu.xml | 10 +---------
 gdb-xml/riscv-64bit-cpu.xml |  6 +-----
 gdb-xml/riscv-64bit-fpu.xml | 10 +---------
 target/riscv/gdbstub.c      | 32 ++------------------------------
 5 files changed, 6 insertions(+), 58 deletions(-)

-- 
2.25.4


