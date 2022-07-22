Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E843D57E356
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 17:02:31 +0200 (CEST)
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEuAh-0005yo-3d
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 11:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oEu5Q-0000KL-S5
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 10:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oEu5N-0007ci-Cx
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 10:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658501820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dctATIptQZBM58l65Jb88WahbZ6TrQ9jd8W4rI/M1/0=;
 b=hUu4x6TFlXjkNmIZHILW7szQFmvRRPim6UrbNfdJVJFNwf86ptMu9BZc3MWiRk+D7uRyCe
 pqw9Dl0Dx3FPZocNJNX0KJgkPvY32MT7bf3M8rI/KwEJ0pqVaVPS5BEg+NSRNHgtHnewTz
 x4QIESQEh6GZrrKShKaBGuaNJnkk6hk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351--Ks24qhTPzSK0cMa98suMw-1; Fri, 22 Jul 2022 10:56:59 -0400
X-MC-Unique: -Ks24qhTPzSK0cMa98suMw-1
Received: by mail-qv1-f71.google.com with SMTP id
 ln2-20020a0562145a8200b0047301e9bc53so3150282qvb.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 07:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dctATIptQZBM58l65Jb88WahbZ6TrQ9jd8W4rI/M1/0=;
 b=I2RIlGU0Aj05msq37zzic5uyABEKnU2RvuH04S/E4P/7FFM9gajaMGQ9kO1Il7f7E2
 XqWpeCAkC+M38aCIjQj21by/CmWP+MNdgNSiPKd6ySLhYMq8N+YX5kpKUorvO/g9kK6b
 TovTaTZaGBDPrXt+JDeNkr42DdgQ7J5bOXT8NZrKIfI/v4ux9P9jGbWSe6A1ewnUY244
 WFSw5ElPZq7e6PGBsCQEhyT7RuZFR6tdpgfltUJ3IAt1WztGrZ30zCrYW7WqSwG6EK3f
 yedQ4neTRsDF3i5FrSy8xR2DYseihlUMKgM7HcDCfhZFhk/whgVl8OWC5bKXDyqDGCO2
 mPkA==
X-Gm-Message-State: AJIora/fbyHwZ6loXQ5HShEzcccvUntOZqTcqHexGTRnx77qF2k2X+qk
 A69SqngYAgOb9b3+BbCnIMe6ElGjQ6k6/FlB0UHovOxzv1+ufZ7/RBPsbZAlkTFp8xLjCFgGSK0
 heBC1N/4M2vsfGmRvc7FqDSB2M00khPv848to2jhQVi/eiALWodJ/DOq7MquBir+J
X-Received: by 2002:a05:620a:12ae:b0:6b5:d6d3:f814 with SMTP id
 x14-20020a05620a12ae00b006b5d6d3f814mr232248qki.458.1658501818098; 
 Fri, 22 Jul 2022 07:56:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1se6MolKlCrP/16uZ4a39/p3SOvtfFC/i6uYCB8F0H25iMRJjmPio0esg70FHEhfcM7UwYTQA==
X-Received: by 2002:a05:620a:12ae:b0:6b5:d6d3:f814 with SMTP id
 x14-20020a05620a12ae00b006b5d6d3f814mr232138qki.458.1658501816032; 
 Fri, 22 Jul 2022 07:56:56 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a37e307000000b006b5e6dac3b0sm3291429qki.128.2022.07.22.07.56.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 22 Jul 2022 07:56:55 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 0/2] migration-test: Allow test to run without uffd
Date: Fri, 22 Jul 2022 10:56:52 -0400
Message-Id: <20220722145654.81103-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Compare to v1, this added a new patch as reported by Thomas to (hopefully)
allow auto-converge test to pass on some MacOS testbeds.

Please review, thanks.

Peter Xu (2):
  migration-test: Use migrate_ensure_converge() for auto-converge
  migration-test: Allow test to run without uffd

 tests/qtest/migration-test.c | 65 +++++++++++++++---------------------
 1 file changed, 26 insertions(+), 39 deletions(-)

-- 
2.32.0


