Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6478E67257B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 18:49:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pICYJ-00074Y-IE; Wed, 18 Jan 2023 12:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pICYH-00073Y-9h
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 12:48:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pICYF-0004CN-G2
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 12:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674064122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4UFbKB57oFB8PvLvzZQAv6LQaUsQFzldevqq81j9SaI=;
 b=WvUxhaSlxFJAu+Ftlv0xksABMWQxscXKKVkdPofNQfXzEcZFSk9YzL04h7xcwZImA+4CfX
 HbJ1KbptgZu0jdSdCe680nSdt9TeOqi5QNH5W5tYjo3R/PYNdeyh/X7094KyrbvFDl+hNR
 pxA27s1fFGhEbnakAeh0Y5Xfqpem0OY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-228-tkQ4Q95dO8S0qtXHmCmb0A-1; Wed, 18 Jan 2023 12:48:41 -0500
X-MC-Unique: tkQ4Q95dO8S0qtXHmCmb0A-1
Received: by mail-qv1-f71.google.com with SMTP id
 o95-20020a0c9068000000b005320eb4e959so17696123qvo.16
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 09:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4UFbKB57oFB8PvLvzZQAv6LQaUsQFzldevqq81j9SaI=;
 b=BnxcSJqAWSWA62wBLVcxBEPszGGlJ1B1WvnwXERvJs3mOfImYebOcaPMquKK4hB5So
 ccVNX4eoY4K8FfWYFsbzQSWThzcUsnVRCH//J5MRoX7ANke967O15lZp3IDS04qoGLOX
 yWwuYrPlS+AuT2aHSlIA+zM3ObX1X4gVMrTBitHxZRik8uJQK8mPzekLKWfN0xrGAm//
 3Gj5jXeCMAv9+/HHebEwrWUDUJWE1AduagISM1ShXAhwcacaywcLJa6GBAcKkthnDT7P
 UoEs3XAzpDu3jHRMUETnMRLFTgvPh3+/rWIb/d+A7mvweW2QQ5Bjshn5CqnaB5Dt2198
 q6VQ==
X-Gm-Message-State: AFqh2krFxrPgnV+grEYWN2S5pHd2gdQY1iu/4NJt+9NQwiepPuDG0Niz
 CBNa5ALu9qdbCUC8XGgF2t7kmK5+gM7v3UhU3XkvXgmtUE5doNMKNeC4pAAbQ0XfpMHF8tiKywX
 d/0Y1wFvhKIAMfoA=
X-Received: by 2002:a05:622a:207:b0:3ac:e03e:f93f with SMTP id
 b7-20020a05622a020700b003ace03ef93fmr15135824qtx.2.1674064120999; 
 Wed, 18 Jan 2023 09:48:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsB/MLq5mIN1ajyzupVRZTSxsfbUBpJcKNJEViLJyayMJM8Ty1kZNGhvy5QJbSSjk9R7Zvi6A==
X-Received: by 2002:a05:622a:207:b0:3ac:e03e:f93f with SMTP id
 b7-20020a05622a020700b003ace03ef93fmr15135801qtx.2.1674064120758; 
 Wed, 18 Jan 2023 09:48:40 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 hj4-20020a05622a620400b003995f6513b9sm17509040qtb.95.2023.01.18.09.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 09:48:39 -0800 (PST)
Message-ID: <c4677b0e-87eb-beca-d9fb-050c9315d316@redhat.com>
Date: Wed, 18 Jan 2023 18:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Qemu-block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: QEMU iotest 267 failure / assertion in migration code
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


  Hi!

I just ran "make check" in a build directory where I did
not compile qemu-system-x86_64, and got a failure with
iotest 267.

Re-running the "check" script directly got me some more
information:

$ ./check -qcow2 267
QEMU          -- "/tmp/qemu/tests/qemu-iotests/../../qemu-system-alpha" -nodefaults -display none -accel qtest
QEMU_IMG      -- "/tmp/qemu/tests/qemu-iotests/../../qemu-img"
QEMU_IO       -- "/tmp/qemu/tests/qemu-iotests/../../qemu-io" --cache writeback --aio threads -f qcow2
QEMU_NBD      -- "/tmp/qemu/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- Linux/x86_64 thuth 4.18.0-425.3.1.el8.x86_64
TEST_DIR      -- /tmp/qemu/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmp_qbcjhsu
GDB_OPTIONS   --
VALGRIND_QEMU --
PRINT_QEMU_OUTPUT --

267   fail       [18:39:41] [18:39:44]   3.5s                 output mismatch (see /tmp/qemu/tests/qemu-iotests/scratch/267.out.bad)
--- .../qemu/tests/qemu-iotests/267.out
+++ /tmp/qemu/tests/qemu-iotests/scratch/267.out.bad
@@ -31,23 +31,23 @@
  Testing: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=none
  QEMU X.Y.Z monitor - type 'help' for more information
  (qemu) savevm snap0
-(qemu) info snapshots
-List of snapshots present on all disks:
-ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
---        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
-(qemu) loadvm snap0
-(qemu) quit
+QEMU_PROG: ../../qemu/migration/ram.c:874: pss_find_next_dirty: Assertion `pss->host_page_end' failed.
+./common.rc: line 181: 1903770 Aborted                 (core dumped) ( if [ -n "${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; GDB=""; if [ -n "${GDB_OPTIONS}" ]; then
+    GDB="gdbserver ${GDB_OPTIONS}";
+fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec "${VALGRIND_LOGFILE}" $GDB "$QEMU_PROG" $QEMU_OPTIONS "$@" )


Looks like this test does not work if the main machine
of the selected QEMU binary does not support migration?

Should we remove this test from the "auto" group?

Anyway, QEMU should also not trigger an assertion, so this
sounds like another bug?

  Thomas


