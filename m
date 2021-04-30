Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB7936FEE0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:47:38 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWIj-0001MM-HN
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVxl-0001kE-RC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVxZ-0004MG-QC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619799944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+OIPAe+ZugW3+KVtHomkd7n7xZ7F3mqZnG+KoZoeOk=;
 b=N1fAe7Sm+0vpF0u32q3y84nNJgjbuS0JO5tkNb0bqWE8L1t9OHKGPPE41x4G9ZvuujAnpb
 S2/k51vRoy4e/Fc+CKhP8EoFCorjIrwaBqk4Rsm8QzrVNgBHmzQ73/HoDYsYRxfu0SLQ6O
 CqaAD35Gc5eJApM0vfo4n0lMewaNQdc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-KlqnfYNRPLS_QxE6cYEtcw-1; Fri, 30 Apr 2021 12:25:42 -0400
X-MC-Unique: KlqnfYNRPLS_QxE6cYEtcw-1
Received: by mail-wr1-f70.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so21206995wrl.20
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+OIPAe+ZugW3+KVtHomkd7n7xZ7F3mqZnG+KoZoeOk=;
 b=Bx/RPgnm9aNw3i7STjs8DJkB2md0uGs4pQ1woKGWAbYSyNNwZNTxPz5uTWz3A+5hoN
 Ynql0EnDicx69JM1m/Bkb9v1lt7EZoZ/+Z0vScHJ39XmMy6Ox4exuHnYDi/aIa7aWKyv
 FFuM/cLJJ8jUKmRHkKB7ZwXb8eQ+WfhvhyPNnf0ujT9LQPQs6O50FTMxMjKFK138FHIX
 AuqhC1j3+cNoNr2yEvrsxxFyJ3aZMl8Gf0nTkwr1kLtsNHgtuJyBLzHS4ghunxCDFfF0
 ZGuWsoJNBwDS38Z+T3HunW43Ey+k7PoCwkWhKt0pPTMIWjA//PZV6Cr81ZRLyJj6AKad
 NKSw==
X-Gm-Message-State: AOAM531p9jqHrXBrEKGZOOHZHHZ6+waMSOYqmVQHA4cwL5w/b166uvPK
 iZMtzpzFVJIree5TVPseNnS1Xizs71nm7hvyA4Lg8nCKEpRMahoQPkFNF0Ej3Lak8UqVP5jf7Pl
 yO57JXD+04iqAYYgtA5Q2Qpz/gu1dA7L0HNoEFJ9tHj0YwCT5K0m4XeuRw/D+qz8j
X-Received: by 2002:adf:9d88:: with SMTP id p8mr8017182wre.138.1619799941512; 
 Fri, 30 Apr 2021 09:25:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymAOSGNRE0wyn7BwTZXJQntlyr39AwxDWGk6v7Qbj8do3Bzf53f9m4Awcfw77Gd/yJos5rdg==
X-Received: by 2002:adf:9d88:: with SMTP id p8mr8017163wre.138.1619799941367; 
 Fri, 30 Apr 2021 09:25:41 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id r2sm2640793wrt.79.2021.04.30.09.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:25:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] block/vvfat: Avoid out of bounds write in
 create_long_filename()
Date: Fri, 30 Apr 2021 18:25:19 +0200
Message-Id: <20210430162519.271607-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430162519.271607-1-philmd@redhat.com>
References: <20210430162519.271607-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Johannes Schindelin <johannes.schindelin@gmx.de>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The direntry_t::name holds 11 bytes:

  typedef struct direntry_t {
      uint8_t name[8 + 3];
      ...

However create_long_filename() writes up to 31 bytes into it:

 421     for(i=0;i<26*number_of_entries;i++) {
 422         int offset=(i%26);
 423         if(offset<10) offset=1+offset;
 424         else if(offset<22) offset=14+offset-10;
 425         else offset=28+offset-22;
 426         entry=array_get(&(s->directory),s->directory.next-1-(i/26));
 427         if (i >= 2 * length + 2) {
 428             entry->name[offset] = 0xff;
 429         } else if (i % 2 == 0) {
 430             entry->name[offset] = longname[i / 2] & 0xff;
 431         } else {
 432             entry->name[offset] = longname[i / 2] >> 8;
 433         }
 434     }

For example, if i=25, offset=28+25-22=31

Then in lines 428, 430 and 432 the entry->name[] array is written beside
its 11 bytes, as reported by Clang sanitizer:

  block/vvfat.c:430:13: runtime error: index 14 out of bounds for type 'uint8_t [11]'
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior block/vvfat.c:430:13 in
  block/vvfat.c:432:13: runtime error: index 15 out of bounds for type 'uint8_t [11]'
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior block/vvfat.c:432:13 in
  block/vvfat.c:428:13: runtime error: index 18 out of bounds for type 'uint8_t [11]'
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior block/vvfat.c:428:13 in

As I have no idea about what this code does, simply skip the writes if
out of range, since it is not worst than what we have currently (and
my tests using vvfat work identically).

Fixes: de167e416fa ("Virtual VFAT support (Johannes Schindelin)")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/vvfat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/vvfat.c b/block/vvfat.c
index c193a816646..c7162e77d68 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -423,6 +423,9 @@ static direntry_t *create_long_filename(BDRVVVFATState *s, const char *filename)
         if(offset<10) offset=1+offset;
         else if(offset<22) offset=14+offset-10;
         else offset=28+offset-22;
+        if (offset >= ARRAY_SIZE(entry->name)) {
+            continue;
+        }
         entry=array_get(&(s->directory),s->directory.next-1-(i/26));
         if (i >= 2 * length + 2) {
             entry->name[offset] = 0xff;
-- 
2.26.3


