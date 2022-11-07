Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC37061F47B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 14:38:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os2J7-0003kg-GG; Mon, 07 Nov 2022 08:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1os2J5-0003kM-S1; Mon, 07 Nov 2022 08:36:55 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1os2J4-00032o-3V; Mon, 07 Nov 2022 08:36:55 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F6BF22557;
 Mon,  7 Nov 2022 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667828212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qz3P2gJiEHuK5z5sFNO3tuSD4nydZkvh6ZoPL+nKIA8=;
 b=CuWJMQoU1kT+r/mv62MOfTXLJvTEZntpWjyjRsd+dbKg/5W9C1MXTmmp/mGoeRtQuhk4bO
 Tdcp7xGagrzZIRXlcNUO9kcb3wSiQF3tMJVfw+9poRawCSUt8qBoEnw9+1eTSK8bF1xYxo
 Foz1/xIhC6k+7reFnplCUE8uzxw3vww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667828212;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qz3P2gJiEHuK5z5sFNO3tuSD4nydZkvh6ZoPL+nKIA8=;
 b=ZR8AHmTgW0xKnqb9cnt47ZybhExhyty3h3f7PO1dbURyzAtvgByrcgxLxyq+jr/nnky+3j
 ob+lQRuWYLDIKYCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A10913494;
 Mon,  7 Nov 2022 13:36:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UAnWAPQJaWO/XwAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 07 Nov 2022 13:36:52 +0000
Message-ID: <6e73cae7-7bef-76b9-4c5a-24f2364a4c11@suse.de>
Date: Mon, 7 Nov 2022 14:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
From: Claudio Fontana <cfontana@suse.de>
Subject: intermittent failures in iotest 108
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Kevin and all,

I seem to be getting intermittent failures with mainline iotest 108. Is this already known?

../configure --enable-tcg --enable-kvm --enable-modules --enable-debug
make -j
make -j check


▶ 614/634 qcow2 108                                                                        FAIL          
614/634 qemu:block / qemu-iotests qcow2                                                    ERROR          155.16s   exit status 1
>>> MALLOC_PERTURB_=33 PYTHON=/usr/bin/python3 /usr/bin/sh /home/claudio/git/qemu/build-all/../tests/qemu-iotests/../check-block.sh qcow2
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
--- /home/claudio/git/qemu/tests/qemu-iotests/108.out
+++ /home/claudio/git/qemu/build-all/tests/qemu-iotests/scratch/108.out.bad
@@ -152,40 +152,4 @@

 --- Rebuilding refcount structures on block devices ---

-{ "execute": "qmp_capabilities" }
-{"return": {}}
-{ "execute": "blockdev-create",
-       "arguments": {
-           "job-id": "create",
-           "options": {
-               "driver": "IMGFMT",
-               "file": "file",
-               "size": 67108864,
-               "cluster-size": 512
-           } } }
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "create"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "create"}}
-{"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "create"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "create"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "create"}}
-{ "execute": "job-dismiss", "arguments": { "id": "create" } }
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "create"}}
-{"return": {}}
-{ "execute": "quit" }
-{"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
-
-wrote 65536/65536 bytes at offset 0
-64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-
-ERROR cluster 0 refcount=0 reference=1
-Rebuilding refcount structure
-The following inconsistencies were found and repaired:
-
-    0 leaked clusters
-    1 corruptions
-
-Double checking the fixed image now...
-No errors were found on the image.
-*** done
+Timeout waiting for capabilities on handle 0

(test program exited with status code 1)
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

615/634 qemu:softfloat+softfloat-conv / fp-test-float-to-float                             OK              0.18s
616/634 qemu:softfloat+softfloat-conv / fp-test-int-to-float                               OK              0.18s
617/634 qemu:softfloat+softfloat-conv / fp-test-uint-to-float                              OK              0.17s
618/634 qemu:softfloat+softfloat-conv / fp-test-float-to-int                               OK              0.17s
619/634 qemu:softfloat+softfloat-conv / fp-test-float-to-uint                              OK              0.16s
620/634 qemu:softfloat+softfloat-conv / fp-test-round-to-integer                           OK              0.15s
621/634 qemu:softfloat+softfloat-compare / fp-test-lt_quiet                                OK              0.18s
622/634 qemu:softfloat+softfloat-compare / fp-test-le_quiet                                OK              0.19s
623/634 qemu:softfloat+softfloat-compare / fp-test-eq_signaling                            OK              0.24s
624/634 qemu:softfloat+softfloat-compare / fp-test-le                                      OK              0.24s
625/634 qemu:qapi-schema+qapi-doc / QAPI rST doc                                           OK              0.02s
626/634 qemu:softfloat+softfloat-ops / fp-test-sqrt                                        OK              0.15s
627/634 qemu:softfloat+softfloat-ops / fp-test-log2                                        OK              0.28s
628/634 qemu:qapi-schema+qapi-frontend / QAPI schema regression tests                      OK              0.33s
629/634 qemu:softfloat+softfloat-ops / fp-test-sub                                         OK              1.90s
630/634 qemu:softfloat+softfloat-ops / fp-test-add                                         OK              2.05s
631/634 qemu:decodetree / decodetree                                                       OK              2.57s
632/634 qemu:softfloat+softfloat-ops / fp-test-rem                                         OK              5.05s
633/634 qemu:softfloat+softfloat-ops / fp-test-div                                         OK              7.77s
634/634 qemu:softfloat+softfloat-ops / fp-test-mul                                         OK              9.03s

Summary of Failures:

614/634 qemu:block / qemu-iotests qcow2                                           ERROR          155.16s   exit status 1


Ok:                 567 
Expected Fail:      0 
Fail:               1   
Unexpected Pass:    0   
Skipped:            66  
Timeout:            0   



