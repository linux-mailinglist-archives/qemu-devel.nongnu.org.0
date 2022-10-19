Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE437604B2E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:23:27 +0200 (CEST)
Received: from localhost ([::1]:53854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAuk-0000DN-P3
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olAog-000455-Eh
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:17:11 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:33367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olAof-00022G-43
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:17:10 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-4jUr-gS8Nkqo3GCG-EpnJg-1; Wed, 19 Oct 2022 11:16:54 -0400
X-MC-Unique: 4jUr-gS8Nkqo3GCG-EpnJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8BFB101A56C;
 Wed, 19 Oct 2022 15:16:53 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB75553AA;
 Wed, 19 Oct 2022 15:16:52 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 0/2] util/log: Always send errors to logfile when daemonized
Date: Wed, 19 Oct 2022 17:16:49 +0200
Message-Id: <20221019151651.334334-1-groug@kaod.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
that `--daemonize -D` without `-d` trick. It is possible that they will=0D
stop doing so and catch errors through QEMU's stderr at some point, but=0D
I'm posting the patches anyway.=0D
=0D
v2:=0D
- new log_thread_id() implementation for hosts without gettid() syscall=0D
- avoid conflict between global log file and per-thread logfile=0D
- style improvements=0D
=0D
Greg Kurz (2):=0D
  util/log: Derive thread id from getpid() on hosts w/o gettid() syscall=0D
  util/log: Always send errors to logfile when daemonized=0D
=0D
 util/log.c | 56 ++++++++++++++++++++++++++++++++++++++++--------------=0D
 1 file changed, 42 insertions(+), 14 deletions(-)=0D
=0D
-- =0D
2.37.3=0D
=0D


