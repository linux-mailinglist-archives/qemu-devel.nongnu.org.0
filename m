Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF68621479
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:01:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPAC-0006er-1x; Tue, 08 Nov 2022 09:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1osP9v-0006YK-3U
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:01:01 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1osP9s-0005Ja-9q
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:00:58 -0500
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-2y77KKN1MqailUdodescBg-1; Tue, 08 Nov 2022 09:00:41 -0500
X-MC-Unique: 2y77KKN1MqailUdodescBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53B78383D0C6;
 Tue,  8 Nov 2022 14:00:41 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D6A2C15E76;
 Tue,  8 Nov 2022 14:00:39 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 0/2] util/log: Always send errors to logfile when daemonized
Date: Tue,  8 Nov 2022 15:00:30 +0100
Message-Id: <20221108140032.1460307-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

When QEMU is started with `--daemonize -D ${logfile} -d ${some_log_item}`,=
=0D
error logs from error_report() and friends go to ${logfile}, but if QEMU=0D
is started with `-daemonize -D ${logfile}` and no `-d`, the file isn't=0D
even created and all logs go to /dev/null.=0D
=0D
This inconsistency is quite confusing for users and gives the impression=0D
that QEMU doesn't log errors at all. It seems much saner to always create=0D
the log file when `-D` was passed and to be able to report errors.=0D
=0D
It was spotted by the kata-containers project, which happens to do just=0D
that `--daemonize -D` without `-d` trick.=0D
=0D
v3:=0D
- drop log_append (Paolo's patch)=0D
- new approach : call qemu_log_trylock() from qemu_set_log_internal() in=0D
  the per-thread case, instead of trying to special case the main thread=0D
=0D
v2:=0D
- new log_thread_id() implementation for hosts without gettid() syscall=0D
- avoid conflict between global log file and per-thread logfile=0D
- style improvements=0D
=0D
Greg Kurz (1):=0D
  util/log: Always send errors to logfile when daemonized=0D
=0D
Paolo Bonzini (1):=0D
  util/log: do not close and reopen log files when flags are turned off=0D
=0D
 util/log.c | 84 +++++++++++++++++++++++++++++++++++++-----------------=0D
 1 file changed, 58 insertions(+), 26 deletions(-)=0D
=0D
-- =0D
2.38.1=0D
=0D


