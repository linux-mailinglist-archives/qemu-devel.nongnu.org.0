Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367D5B8713
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 13:13:13 +0200 (CEST)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYQKO-0008K3-9c
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 07:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oYQ3v-0004Ol-PY
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 06:56:11 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:45704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oYQ3q-0005VI-OP
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 06:56:10 -0400
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id D5E552E0945;
 Wed, 14 Sep 2022 13:55:57 +0300 (MSK)
Received: from davydov-max-nux.yandex.net (unknown
 [2a02:6b8:0:107:fa75:a4ff:fe7d:8480])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 BUZ4sh4mWm-tvOqTToo; Wed, 14 Sep 2022 13:55:57 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663152957; bh=iCA3TvzOpzGSwYUA21kDCPvpG/UnlIYQVfMFoKVgdOw=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=qypMOMZ8+GU+lJtpmMEzgn70mojBGG5lURlKPV6HZrYX78Ry0/WxU7MJKE4rBNj7f
 5zz2Q9/YQ77Y32sAYQ3rj44yUmP2K+GYjsd6jIyZj2G3Q2nE/yJb2dOURdsBDr1bK6
 7ckVk8GCNdZJezwnvHB6WYv3/wytEB7HvDWVERpw=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: davydov-max@yandex-team.ru, yc-core@yandex-team.ru, pbonzini@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, armbru@redhat.com, alxndr@bu.edu,
 bsd@redhat.com, stefanha@redhat.com, thuth@redhat.com,
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, lvivier@redhat.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Subject: [PATCH v2 1/4] qom: add devault value
Date: Wed, 14 Sep 2022 13:55:36 +0300
Message-Id: <20220914105539.18461-2-davydov-max@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914105539.18461-1-davydov-max@yandex-team.ru>
References: <20220914105539.18461-1-davydov-max@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

qmp_qom_list_properties can print default values if they are available
as qmp_device_list_properties does, because both of them use the
ObjectPropertyInfo structure with default_value field. This can be useful
when working with "not device" types.

Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 qom/qom-qmp-cmds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 2e63a4c184..1d7867dc19 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -217,6 +217,8 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
         info->type = g_strdup(prop->type);
         info->has_description = !!prop->description;
         info->description = g_strdup(prop->description);
+        info->default_value = qobject_ref(prop->defval);
+        info->has_default_value = !!info->default_value;
 
         QAPI_LIST_PREPEND(prop_list, info);
     }
-- 
2.25.1


