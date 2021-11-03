Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83C4443EA9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:52:11 +0100 (CET)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miC0A-0002d9-Pd
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBw2-0002ur-3m
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBvX-00048n-0T
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xjqwBivHnKKYRjeDOM8AfeK5sPEZs3YRYp0z4oV32b4=;
 b=cDq4qX5pJ/zlDsZtQBQ3qejfSbMSN4K+UeGfoEvJr3aZ1xID9w2N291XUj56NLFlFdPl6b
 tmeWoeZq4qClgzI2Os8uI8z8juumEF7qWHfDnSeOympS1QEppKTBgw+KvTw/zypJym+Z10
 Yd5+lcWhYPl5qsWjbhI8C9SE8Sj5OEQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-Mkp8CBs6PQ6Meuyi2TpdJw-1; Wed, 03 Nov 2021 04:46:18 -0400
X-MC-Unique: Mkp8CBs6PQ6Meuyi2TpdJw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n189-20020a1c27c6000000b00322f2e380f2so2417025wmn.6
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjqwBivHnKKYRjeDOM8AfeK5sPEZs3YRYp0z4oV32b4=;
 b=aiUVXsD/C080xBQGbyEBUnlH5G9TvBmD4/LyX8LHYYKVXofG02NSkcbyregrfONJtz
 +3+wuN6NnVZpJp6o90Qwu+ivVsfHq8WGeNjseXAbGaCimdmUNmjMF19uIXeBy2EbPM4B
 RVxEFBOnlZzbiwjH4hE03aWFhU6w5VV1l0FUKBDSWuh5fXCTeg4nm1hKiIrSYqFtQFDQ
 w9NBiIb9ZWZNDG0aGrnI/f3caUdcR4gyLOWd34vF7RzEcbZNNFMHU9yLxvquzxKoDy5D
 1rP9pJsi0GrtiX+fbHq7q+lnMgziM0PKoAbXGZPSlc4CerfJ+uoH1Rb/u9e2o9oP/jBB
 dtYA==
X-Gm-Message-State: AOAM530wdH8JQEhVAHirP+rY8TNPkQ4ycEqlQRw4OQqxGRqUgOjrqOBZ
 OJ87uP17jzTj+jH+BZLydH8aG0kCs6MmUMcoaWT1uvw5D/25xDfcBdjNh5gykVOJAcqlBmfpxD5
 AMH0wXLNtJ/Kk2WpeN8OaS7ntZPeeeaSKvZIdyWNUciLSvdgpjRx5VoBFXcAxWmuNsM8=
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr3516108wrd.323.1635929176312; 
 Wed, 03 Nov 2021 01:46:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeiFFnCBMRIbU9tTLAH/L9rA/pOuNNNsE5CFyFz7UidEnscw0G4VCNyX5J4A3N+VGFxb5DNA==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr3516084wrd.323.1635929176130; 
 Wed, 03 Nov 2021 01:46:16 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id c79sm1271281wme.43.2021.11.03.01.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:15 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] colo: fixed 'Segmentation fault' when the simplex mode
 PVM poweroff
Date: Wed,  3 Nov 2021 09:46:01 +0100
Message-Id: <20211103084605.20027-8-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103084605.20027-1-quintela@redhat.com>
References: <20211103084605.20027-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

The GDB statck is as follows:
Program terminated with signal SIGSEGV, Segmentation fault.
0  object_class_dynamic_cast (class=0x55c8f5d2bf50, typename=0x55c8f2f7379e "qio-channel") at qom/object.c:832
         if (type->class->interfaces &&
[Current thread is 1 (Thread 0x7f756e97eb00 (LWP 1811577))]
(gdb) bt
0  object_class_dynamic_cast (class=0x55c8f5d2bf50, typename=0x55c8f2f7379e "qio-channel") at qom/object.c:832
1  0x000055c8f2c3dd14 in object_dynamic_cast (obj=0x55c8f543ac00, typename=0x55c8f2f7379e "qio-channel") at qom/object.c:763
2  0x000055c8f2c3ddce in object_dynamic_cast_assert (obj=0x55c8f543ac00, typename=0x55c8f2f7379e "qio-channel",
    file=0x55c8f2f73780 "migration/qemu-file-channel.c", line=117, func=0x55c8f2f73800 <__func__.18724> "channel_shutdown") at qom/object.c:786
3  0x000055c8f2bbc6ac in channel_shutdown (opaque=0x55c8f543ac00, rd=true, wr=true, errp=0x0) at migration/qemu-file-channel.c:117
4  0x000055c8f2bba56e in qemu_file_shutdown (f=0x7f7558070f50) at migration/qemu-file.c:67
5  0x000055c8f2ba5373 in migrate_fd_cancel (s=0x55c8f4ccf3f0) at migration/migration.c:1699
6  0x000055c8f2ba1992 in migration_shutdown () at migration/migration.c:187
7  0x000055c8f29a5b77 in main (argc=69, argv=0x7fff3e9e8c08, envp=0x7fff3e9e8e38) at vl.c:4512

The root cause is that we still want to shutdown the from_dst_file in
migrate_fd_cancel() after qemu_close in colo_process_checkpoint().
So, we should set the s->rp_state.from_dst_file = NULL after
qemu_close().

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/colo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/colo.c b/migration/colo.c
index 616dc00af7..907241ab5c 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -640,6 +640,7 @@ out:
      */
     if (s->rp_state.from_dst_file) {
         qemu_fclose(s->rp_state.from_dst_file);
+        s->rp_state.from_dst_file = NULL;
     }
 }
 
-- 
2.33.1


