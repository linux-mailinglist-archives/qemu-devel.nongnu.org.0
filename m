Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5667C6F291A
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 16:00:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pt7Zm-0008OX-8L; Sun, 30 Apr 2023 09:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1pt7Zi-0008OJ-K7
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 09:58:50 -0400
Received: from mail-tycjpn01on2072b.outbound.protection.outlook.com
 ([2a01:111:f403:7010::72b]
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1pt7ZW-000528-BL
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 09:58:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8TEraGWJdJutOAV9WrJhgLuDzUJERw+4XhgaabSzk9wm8PzVxV3ZT/jmetKBlGK9BFSD8ZiXJPFZwrEstzYs5IEII7mtCB6bOf4JwPaX0fi1v0NumXefXEyYrP0eEDNZ4lNZJD8VwS0TGKtPiesdC3tKAq+QyefoXNCWFv+mFIL72jaPCRkPop0tbHX75pfAFkD2okK6EUJfRAwaozkb5qgKERWcvl0Uekl2pPBn1eB+Z+8E8EjrGcjbv6OZe5Cq71zpaBkwFteIzyqGwSwV0/Zdse4rAAZXXckquY18GRSL0qP4AiAnE14E/NaihVroADd7S8aXcNXHAevLgqhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5bHu1l/3mJWbbuLoLiIUFX+87cWI5t10dVQcSOGncY=;
 b=LJ+uMB/V5bjOiOnRHrTjQdXcMp+zsEmUYmeANCwIdFk4Nx8NDZMxIucGM2ojvOgxo7LT7dxMs7woZ+WjLxiDKjudFIGVB1bF20+VCrdCbQw9ss20voCNSq5sKWKMB540jXc+0a2U0C6RQ8cD/WtoUDHyEgjVh2VIC6HvduPhXrltr9furKhcIB/wmJX+FuDQ2BnwYD4d7tCHF9xdivx8ih+b/q9jhVQEl65sVSErellsV3zhp8iT6aQ9UErbrkLZ4VIHV52/klsuEAgndYGpYvaCM7MnYW8jN6RhOpUDigClVYgK3/fJjYuRnF5USuMbkzmtCrbqutQMX3Ir0MnWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5bHu1l/3mJWbbuLoLiIUFX+87cWI5t10dVQcSOGncY=;
 b=E8hNe5RdiuBpti42SQJ7Kr1q/sfvjubGXwx1li6hSuuZByk7jj3SbPCK5XiqqEfqtZkVqn6WOOE9N4VQd4/zrxJrm2s32wBWyGBvwVnX5fmbbtT1xd5cYbU2FOVhsmKyU5AotlozJ2U2CwfRb13gBeceNDyDvPAYBZwnnTSfUfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB2553.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1ea::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.28; Sun, 30 Apr 2023 13:58:31 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::91e1:d460:5907:34d6]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::91e1:d460:5907:34d6%3]) with mapi id 15.20.6340.028; Sun, 30 Apr 2023
 13:58:31 +0000
Date: Sun, 30 Apr 2023 21:58:19 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Canokeys.org" <contact@canokeys.org>,
 MkfsSion <mkfssion@mkfssion.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/usb/canokey: change license to GPLv2+
Message-ID: <ZE5z+2WbvVpTa82H@Sun>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux Sun 5.15.67
X-Mailer: Mutt 2.2.7 (2022-08-07)
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1393:EE_|OS3P286MB2553:EE_
X-MS-Office365-Filtering-Correlation-Id: 495a46a0-de52-4f18-d8e4-08db4982fb8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qrE8lojJ0h/Rg+cxYpgu4lHiizSUCbN4yoyBEHTovXSUp7HXdbr05oG2h5qE2jbTIqABGZ2u/Uy3hiyYz8NdeMb+r4+S2YIqvTF/CkXsoKFuKDmRZinZwH+h3OeWtiNgUhxTZ8dh6z8gqUFXHwuHz/uAwTcVmmOODBMDCqhSe5Xpvyhbyc6pH5Hc8Kf+Lp4wD89J69fjhQbFV+Vx8BA91YH/PtOtsvjKNNIsEQf1srtwi8KRjTZoKHH0XlRK3UIbL7qzGtTHixJ0lFzylgwRXMTj92Ndo6ARYLuQJp+/XPH4fk/G4WTkZTXuUeuepVH1QkzqmLJg0DqdqGefvDYAUdpw+x+WyS6Yc1iUon73W3zxigE9sq2fZFdTfIR4JfoQXVq7ezHugkrB86FuDtpsz4Lzkp5YUSbgiKt1mD0qtvDs8z8dPfPn3muCe942ztg8Rnd+4Fnjltm5tvs5XImOxoeRMLjbMrS9698aYPbG6C9fxBjLXCN3uSSuQlA6+JfSX3T4whmsDOfirWWnA9u/OERAwqtYS1BaptWxtOtS5mf0hLjmZ7go+qoEH+I05K/A8JxNKUAtZ/pMpkLf7NlKADdNPNUEKImLujv6B7kqJQt7kTJceAndlpag/bJZ0qWL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39830400003)(376002)(346002)(136003)(396003)(451199021)(8936002)(478600001)(38100700002)(8676002)(86362001)(41320700001)(66556008)(66476007)(4326008)(66946007)(41300700001)(786003)(316002)(110136005)(83380400001)(966005)(2906002)(186003)(6506007)(6512007)(9686003)(33716001)(6486002)(6666004)(5660300002)(49092004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x333gwSjZCf0m1LvB2XfYftNrxoUrp7GdW5z9pbk9hU2E9AZ/czc5Qkfbi?=
 =?iso-8859-1?Q?yd/q47fMnmlJSqNEiHa48pS4cX2ZEOke+vFJ/wxq0y8xJ8OxEWKmDUkoe1?=
 =?iso-8859-1?Q?JB922hQNamc0EEdsAGLQ6H6s886TKCuSco/pHL3sST+zpxoFUqlnkdIT9e?=
 =?iso-8859-1?Q?q46wL3SHaroMVq9DfNbNqIGsa+AuXX3fKibZjZKNqP73+HZj+VJFHR4j2j?=
 =?iso-8859-1?Q?SzuIMn0EqONqDgM+nEZe2ayulxK0VItcnijKShrn72150enF1i+A0sXtgk?=
 =?iso-8859-1?Q?mvdZXTn/RobM+k/ZOKsu0seAjG8EJFTeOIN0rcQafMKghOiWWqI70zM2ba?=
 =?iso-8859-1?Q?lZSY6Nd805mdqM5jQriW2UBI+gvXsPed0IG5dv0i4qBtXPjcVcAQAXkP96?=
 =?iso-8859-1?Q?8W1YfXeQ0oXmMAlQ98UkA3VP84gEv4j1MpL18/z+Cj5+cAnY/FBF3bYiS2?=
 =?iso-8859-1?Q?sJKbRj/5qucvFava7+bv1ZMYV/dJn6SqtxAh+SSc1mklYRl3nxG26rC7Z4?=
 =?iso-8859-1?Q?Yd0zvb9sOG1BME7ksAGJdJ1oUskX02y7zN6Xes5WwWsrq3SD037YKUi4r4?=
 =?iso-8859-1?Q?pVWhtNGfP4s/9nijQirZqeqC/oMy3xJrEsxomPSHSRlYw2eRiCRFlVhyoj?=
 =?iso-8859-1?Q?qcfAkfPr7WET04gOJH8Z0/XFAFtxxb92XkkwS8JOqIEuT3ZddjNr1oV5+P?=
 =?iso-8859-1?Q?Oz4A0aC2j1XcGYmo8NQGgdOU0ZVLG5B3pBpPSXOcHZvPOxHQPctHte7gck?=
 =?iso-8859-1?Q?tk+9ilgK7twM89IAJhkWNCDA0uoxIekFN2uCX6UqylvRsDRvdpiV4/6ZA1?=
 =?iso-8859-1?Q?XxXepxZWWdMkWtELnn/5ZrsBie2HrRlpwGDyGMCFk8ZVwSpMQu52VBcTO0?=
 =?iso-8859-1?Q?XsxhvA4txPhFfwe1w0VOdXzJ9l/hs73XARbz/ySwfO6oOzdn6qstVlfBSW?=
 =?iso-8859-1?Q?ANJWQ4NHgVqzcnG8lcvj9uxZgrRbnCc5A8ciIM3CTKE1WfQFT6ZQ9xl7Df?=
 =?iso-8859-1?Q?mmtURF10Fi3iO9FZmiAWJkUB9rnEJ65vovieBCdFH+EatPU5bpTqBJlnn9?=
 =?iso-8859-1?Q?LU/TsSlsCTBPskhdzL8uiOBBmyryWLNwsSLYxXsmr1wRFA7PEN+adqUipY?=
 =?iso-8859-1?Q?qQVAi+dj/BEz8AT+8B+rVNQ/V3yoybrDJvp6oZAl+DuGeIQGUCPtT2k1HH?=
 =?iso-8859-1?Q?05zQ8/67RL4APYaPND9Rxsr5gs6sIy6RDB62zl2JbAaXTDVRdtMWlQ0yNe?=
 =?iso-8859-1?Q?yBSWyIVW9rX/aFU2qOR7XZ4PX0goTAynN9gybe9ysW9OUNxJpK5n9qWuhg?=
 =?iso-8859-1?Q?k4wGWY9wmcbOc5HxQlH31kDCZ/frC6Tm/28DE6hRV16CW/7S0nyoT6io3o?=
 =?iso-8859-1?Q?URjeAVkrX/DZ4h4jWfD33AY0YgLF/oiRA4RIiarQG2IkAH6Y8pCfSAQZuV?=
 =?iso-8859-1?Q?uySuYvzsvd+ouIB7xrsxz3laIj1y0F8fMiIBcm2lqm0Zr3An7pr3OtldbF?=
 =?iso-8859-1?Q?uRkF3J0TlWj3lggHAZ+UlTxBd7tvfPnJbB2VAlTKTMxtcBYt+MpNyULhx2?=
 =?iso-8859-1?Q?s8ej/EXHo86HDlmooPNYzsQ3vf3MtphIBh/uH4/5Yyz6MCYZWQ7dqaAyvq?=
 =?iso-8859-1?Q?61rcZ8ayIiWdCLpi0W6G6SJscHDoxQ4MGY?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 495a46a0-de52-4f18-d8e4-08db4982fb8e
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2023 13:58:31.8955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEZ3WFGUjR06OGwmMIDPvWFWeqYDgQFnoc78AoWmlFkM/Xr79mBdhjCSY2zTd4PV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2553
Received-SPF: pass client-ip=2a01:111:f403:7010::72b;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Apache license is considered by some to be not compatible
with GPLv2+. Since QEMU as combined work is GPLv2-only,
these two files should be made compatible.

Reported-by: "Daniel P. Berrangé" <berrange@redhat.com>
Link: https://lore.kernel.org/qemu-devel/ZEpKXncC%2Fe6FKRe9@redhat.com/
Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c | 2 +-
 hw/usb/canokey.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index bbc5da07b5..b306eeb20e 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
  * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
  *
- * This code is licensed under the Apache-2.0.
+ * This code is licensed under the GPL v2 or later.
  */
 
 #include "qemu/osdep.h"
diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
index 24cf304203..e528889d33 100644
--- a/hw/usb/canokey.h
+++ b/hw/usb/canokey.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
  * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
  *
- * This code is licensed under the Apache-2.0.
+ * This code is licensed under the GPL v2 or later.
  */
 
 #ifndef CANOKEY_H
-- 
2.37.2


