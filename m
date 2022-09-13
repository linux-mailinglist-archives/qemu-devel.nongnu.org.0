Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94C15B7AAE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:19:44 +0200 (CEST)
Received: from localhost ([::1]:51776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBRg-0005g7-3q
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLj-0008CM-W0
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:36 -0400
Received: from mout.gmx.net ([212.227.17.21]:37083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007fI-TB
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096406;
 bh=xI95ZtW2YAxB1bA4cBpkjh3a9HRqZTZ0Mu1f3lPFvkc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FK8ecSQcdBkCmViA0Aymzh18jie/etD6mjWLzZ4rPODjbVYYBAwFUWdx6wIy+uZ2A
 K1+kOK/CsuF3WSw2AzVi1MPFUIt1vcvhnu9/b3DzCBd1xOkOgUJq6JiO54loAiMFxY
 OvfrWP24sKAcWT6BSyVIaLxTuWBxdKu7JO3iNLeA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybKf-1pWjeK3fkj-00z1jQ; Tue, 13
 Sep 2022 21:13:25 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 12/12] linux-user: Add parameters of getrandom() syscall for
 strace
Date: Tue, 13 Sep 2022 21:13:21 +0200
Message-Id: <20220913191321.96747-13-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:azYWimxoSM4DEdxyKlyUUieOZ3pKDlPAkDlOR/Yh6lA5pm43vW+
 79tmEPXnQA9kwsuMsUW7/7JSuddqwrYas+rHRZ+rEN1fQxyIpF4hnnGwvY87YkZeK++FHdJ
 5sZnIZrniQx0ISSUBbeLBTVbcfQslaKtOldUBCCNa9m2ADDfN5scS6DmZfUlXfyCQljKAsx
 bnRMe4Te4lCyNvVfol0DA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GdYa18qhs3k=:amjRrmPmX1hEsym0zHc1rt
 ADFyg8wcwytzaInpjfL46aaG7b0S29omlOKvyXrCYfJAnJEFFd12Qh95nfz4zsTfvVEQe0VrY
 h8MNyuuFVTCc4Ai5mDd9roVEstcY/Fx5Ms28VACgnNJCMr/KItFGU5msyImz35fxAl0crDGWG
 g/0mziKc8kq6WX9qp8ZC2m3pkfviFxVkFFz218tdziskl95+Y+D66QFiBr5ZLdITCscNXsnxV
 DROeTQv0vhscakeFkvoAmY8Z2Z37bh85tfcqmltvyaGo+TWoHMG5yoMT82cEiDt+waxRskgrG
 Oq8di97jYzGjx2D9MpBK1eyGupfqs/gc7+y6LleuNj5+DrlBcyWLvk/l2Ui0t0oAwHB51/3Nd
 9rds0IFIIi/IDHt0qTyJejo5Q1LLswJP1wAfY2xjuuwcZRaxLRNKI7zkEkHI+lbrDni4Ihuch
 +hXu7HsBqTXv+tnTF5UJhQeLuXAYi596VwCXr4l7QQydhOmZ1MihyXRZIeo/f58D3lwy2vNSn
 xa7kj7Aj/vdXgKsQcrxOxwGOzNBJIFV8Pz4mArIVXVnYoRfDcofNIp1WKg7F3nFRFh8MIS0mc
 WdQLYgQAvAzUsTfGYeNuiyc6NJn6SykBDueGh+4PTKF+eEbMhvULWROxGAGDqlEiw/dPXZFWq
 v5snFtBYlZ01MS5vsy1VuoPxROMSLfwjKTHGbTJc7PuRJ4PbVmvSm8lvxctMoZNpqYrouUPWF
 YmNGMcRFS0m7qpq0p3RTE7gV3FhD8UHCILJespbqNbVIpA/08opw/4juc0quruDbZw4NCptV8
 g1MOxh5tTerCxq/XmsnWy6z99Izj5Au2WZpRLROGS+oQoEvtZ2RU2HUyX3TuO3Ica98Qf5xho
 Oc8IrQcVhgnyzHiiWpGsvM7G7ZjmbUqptfY3NZe807uAtUAiLfMjFK4/Cvv6/ZCuMC1/bCtdE
 qAoyjXfz0zx2KKia6LKIjBjdqD+YSCV0+VG8kZ9i9uvPgJSgNihma1oCacn+yp8Q9L+3oJBVq
 l/Xc+1eRpJRxqBrEB1i6eEB564tyR2NArj6ZeJNl7njigOKZHX5rYFm15lsinQgET1MpPFAZy
 t12IBKK1NraYLz3UeqCclIQYccyvch+ZCTiekyS7UBfjy0OkE/OzkoJj0Cz4UPzeloeU9dwoG
 TguCoYqItX+m6tge5oZhQqmwRu
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index ad9ef94689..97d8ccadac 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -355,7 +355,7 @@
 { TARGET_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getrandom
-{ TARGET_NR_getrandom, "getrandom", NULL, NULL, NULL },
+{ TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid
 { TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
=2D-
2.37.2


