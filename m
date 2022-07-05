Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BD956663F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:37:20 +0200 (CEST)
Received: from localhost ([::1]:54620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eze-0005RP-0t
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8eyN-0003ux-58
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:35:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8eyJ-0005L8-LR
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657013754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vxJ+x7oyZlnU1ZalMpgSe1vHscSJwsUr5SOWI8Kh/I4=;
 b=ayuV3DQvdhjbSMwsrWW5QxB0qXSH4LH09NVzO1ghHw/+6GIwKmuKzi8EOQh6+WlKIpgrL5
 VD69OnmJoNAoPH2PbQgGtQPCuw5EVsqpM8w7Zf6rHi2CjrWxCXpUbR2qXeuWF18KvYO4PS
 hDTHRYEhsqvksSmHTzmqE2Pxfnj9SBY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-F_AQzxA1OnCnOJ6j3QFrjA-1; Tue, 05 Jul 2022 05:35:53 -0400
X-MC-Unique: F_AQzxA1OnCnOJ6j3QFrjA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n35-20020a05600c3ba300b003a02d7bd5caso6536787wms.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 02:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=vxJ+x7oyZlnU1ZalMpgSe1vHscSJwsUr5SOWI8Kh/I4=;
 b=5VPM6jtYw1F7ooYU8eQ2P5L0Tmfo7I72XKPs2vSLhURUzZjEfHuMtYhWmDYwXoK4r8
 jcm8KO2gmI2+oc+GK6W85yt/cDT0Pn1F0iFGyALW+dVtyZevcdyTnXEsF1c+H3SnsLHn
 fSNIWQJvI2RiGQ22VCaSnJxofovoCHO2pZ0F9t4V3HJ3se1/rRn+LPG1xlMvwCX80Zvn
 jXDMkW7aSmt3CO94lfN+VgbkUR3hiyi9yGZ+sEjSQQYJP+S23R/EDgN3oYE/Cdq053YC
 D3pcDso9Jvb72jqVgfW3yfQYhQOCysIxRiujf6gWe59h3NbPZGLsoUazT2t6Ax/MlZsf
 vEcA==
X-Gm-Message-State: AJIora9QW5wLA4cU2o0atEe5q6o+7uX4CFWaJGWOJ54XRIRz7C4b1oU4
 SGBtrQdc4C3FJPLwjcwEO+43SmHvbqycxzkZFg+Db8Zw6wpi5HZBm3eNyNgOxX+v5cE3y+J3wkg
 P2knOWmWTQxVNl8E=
X-Received: by 2002:adf:d1e1:0:b0:21b:b852:e801 with SMTP id
 g1-20020adfd1e1000000b0021bb852e801mr30345298wrd.479.1657013752113; 
 Tue, 05 Jul 2022 02:35:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tCdL2q3g4L/eAUh5NjZ+/GhXecuSD/vnRdOuAeBMKxvllgreEDsi+kSBxJkXcwTcObiHnHvQ==
X-Received: by 2002:adf:d1e1:0:b0:21b:b852:e801 with SMTP id
 g1-20020adfd1e1000000b0021bb852e801mr30345265wrd.479.1657013751753; 
 Tue, 05 Jul 2022 02:35:51 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b00397402ae674sm13595095wmq.11.2022.07.05.02.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 02:35:51 -0700 (PDT)
Message-ID: <f629134d-0ce2-46df-13b5-30b735f6bd3d@redhat.com>
Date: Tue, 5 Jul 2022 11:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Failure in iotest 183
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


  Hi!

I've just hit a failure in iotest 183:

--- /home/thuth/devel/qemu/tests/qemu-iotests/183.out
+++ /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch/183/183.out.bad
@@ -30,7 +30,7 @@
         'arguments': { 'uri': 'unix:SOCK_DIR/migrate', 'blk': true } }
  {"return": {}}
  { 'execute': 'query-status' }
-{"return": {"status": "postmigrate", "singlestep": false, "running": false}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}

  === Do some I/O on the destination ===

@@ -53,8 +53,31 @@
  === Shut down and check image ===

  {"execute":"quit"}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"execute":"quit"}
  {"return": {}}
-{"execute":"quit"}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 49}}}
+{"return": {"status": "postmigrate", "singlestep": false, "running": false}}
  {"return": {}}
  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}

Is that a known problem already? (I haven't seen anything
related on the list)

  Thomas


