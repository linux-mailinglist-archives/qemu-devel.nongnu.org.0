Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F0F2F9E56
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:38:11 +0100 (CET)
Received: from localhost ([::1]:45164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1SrK-0005dV-RM
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Slz-0007zA-IK; Mon, 18 Jan 2021 06:32:40 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:39895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Sls-0000Up-1O; Mon, 18 Jan 2021 06:32:39 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M8QBa-1l5qTm2V2e-004PbN; Mon, 18 Jan 2021 12:32:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] misc/mos6522: Use timer_free() in the finalize function to
 avoid memleak
Date: Mon, 18 Jan 2021 12:32:04 +0100
Message-Id: <20210118113205.1915888-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118113205.1915888-1-laurent@vivier.eu>
References: <20210118113205.1915888-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kOWuMus3UQdj1CwohTTwUIPfE1m0cm3AIDrkUyZ5H6hTcmWKVST
 /kyRw1MHAi1GwnCs0lbahJk6T7ekOJk8ie+vLv1X6H43at/OrLAwv85ukLmIw74RPsSI3lH
 9Xxl32mYvm+riF9CNIfoSG2S6UNMZCb0FNW61nwBZH73GNkbFUeSlJD6JIvqlsYhzcLaAod
 2znZeiVJVI5KQAoBMHnmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lG7wYzcJ/iY=:4J/0kcaZR0jW7saUY72tu0
 TMcKGUwxB3ajJRILi8V9u2yFvmx+QJZil8h2AVcK9+NPT6DV6mmqpu3CJ/9Av3Rq6srY3wsEy
 /e53T3EJENkNHd9xffeXngFYnm9DGekogWsoeBIzukSN3QGRyhiZZLDVOWAgIGvMxivpeyHfS
 Mo7UaUPiLmvSTYUt/gPFtWLW3pcFDDzqlxJSc8wGmzjXwpMBFgsPDT70Fvy+FgXEz3pooa7Tz
 BiV+BzDG4PxE3w5AwxDJht/v+FI/x9DSGKyyu9oYifjuviL9oi+16pdPVQ6l+uwiZJWdrpZjd
 1tyEUfkAVSN+xDNs2OJqbN+fRxWgHfsclQWj/ZueVADq71w00wMB+fnWrAzh8FguKl779J6z2
 TkL/9xhKYY9eTttGqUAy4XWqxH0wIum43ICilUyWSKxu1QKa46Lek8SLutiBwXxH09lfe9NVm
 IZC1FPQxRQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Gan Qixin <ganqixin@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

When running device-introspect-test, a memory leak occurred in the mos6522_init
function, this patch use timer_free() in the finalize function to fix it.

ASAN shows memory leak stack:

Direct leak of 96 byte(s) in 2 object(s) allocated from:
    #0 0xfffd5fe9e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xfffd5f7b6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaae50303d0c in timer_new_full qemu/include/qemu/timer.h:523
    #3 0xaaae50303d0c in timer_new qemu/include/qemu/timer.h:544
    #4 0xaaae50303d0c in timer_new_ns qemu/include/qemu/timer.h:562
    #5 0xaaae50303d0c in mos6522_init qemu/hw/misc/mos6522.c:490
    #6 0xaaae50b77d70 in object_init_with_type qemu/qom/object.c:371
    #7 0xaaae50b7ae84 in object_initialize_with_type qemu/qom/object.c:515
    #8 0xaaae50b7b0f8 in object_new_with_type qemu/qom/object.c:729
    #9 0xaaae50bb6d58 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
    #10 0xaaae50d7e1dc in qmp_marshal_device_list_properties qemu/qapi/qapi-commands-qdev.c:59
    #11 0xaaae50dc87a0 in do_qmp_dispatch_bh qemu/qapi/qmp-dispatch.c:110
    #12 0xaaae50d931a0 in aio_bh_call qemu/util/async.c:136

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210112112705.380534-3-ganqixin@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mos6522.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index ac4cd1d58ebe..1c57332b4004 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -490,6 +490,14 @@ static void mos6522_init(Object *obj)
     s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
 }
 
+static void mos6522_finalize(Object *obj)
+{
+    MOS6522State *s = MOS6522(obj);
+
+    timer_free(s->timers[0].timer);
+    timer_free(s->timers[1].timer);
+}
+
 static Property mos6522_properties[] = {
     DEFINE_PROP_UINT64("frequency", MOS6522State, frequency, 0),
     DEFINE_PROP_END_OF_LIST()
@@ -519,6 +527,7 @@ static const TypeInfo mos6522_type_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MOS6522State),
     .instance_init = mos6522_init,
+    .instance_finalize = mos6522_finalize,
     .abstract = true,
     .class_size = sizeof(MOS6522DeviceClass),
     .class_init = mos6522_class_init,
-- 
2.29.2


