Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423CB686535
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:18:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNB7U-0003jU-K9; Wed, 01 Feb 2023 06:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7R-0003iQ-VQ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:37 -0500
Received: from mail-vi1eur04on0727.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::727]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7Q-00059m-Ij
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OU0vX+vOk0l1xfxTo3iXzXyZIikH3V2BIbz9cNpTVCpESmd9HeO5bNkCFbZRVKlthO3umC8IyrgojEhXRDe3lqpMTuyvPrMTMoycnf2q1XlRKMBDmrEXPjdCjKN9YlnM/1xQQaKbH5K3quyp1L0FmhdqL5GPptAGuRlxlKvyiRG0tZ/sBvb4lGgERoIQ+o1a5W/2Ag1ByaNRz3wZ3tr8saRvwEiivnFyATxYsWdXosdadK6Ua/v1kXTvw+ie7ETfLNiNntT1SJo/JqxlphGO5wKX82hagcI8Xhld2yZ5RbFSVKTwdKD75vdW97edhPFAaw2DukGye3K6izdsXhy6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=ifo8Q/AGpXY91vS2WEXZT3ueaZnqK8+txz/9aQpRNw7lt4cQx6oVAViA1z5A9xJaETJawTMwlF2REMZmXYSFN+14db6pdS6TlZEvLLWBKqDtpQcnvaUBacvGWctklkRwba0VG6qCRyfYSIiDUe9u7GIGc9YwJsRYb4u0F97L4+TO92mwSUb6M4fmILAAJL8zsYu94yR9RSwGuYq7Vf6CVawJXcvoMied9P+MbEzPocSHgs+5T132p6RBYspiVIwyMVs9zmxgWBD/s05dViZWacZi/NhKbXBmtNCUfXYhH4KOhvbyuujGOoXmPaIfLZFhMYvTl23yEkomzy19o03XPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=J1btDN90QZW2chnMJxIqE9OqCompDvYIo27R1/CpGFXpKtMHmOZmMuonjsOgW7smElQQQkoN2e74FrECLUORnNiUg8KrT88qlzlKPOUCfAOxBi80e0HUvCvv0c5JWz6h6ZJ1lM6k0dIeQGyeEGQgf+Mgj6UI6RwJPTJqfpvNSmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB5P189MB2551.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:489::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 11:17:25 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 11:17:25 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v4 1/9] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Wed,  1 Feb 2023 12:17:14 +0100
Message-Id: <20230201111722.28748-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
References: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0014.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::8) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB5P189MB2551:EE_
X-MS-Office365-Filtering-Correlation-Id: e5138ddf-82e7-4e7c-4d5e-08db0445e548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jj4kjGtNaaIpw8/FLj55BlMVEl9gbtL8Q2V56BqtBPqk7RcoTXoDouvbyS/gcvy3F/n21JDLGxMFj/LKg42kG53BtLkEHiuPPHl2vC2xgPpImCA+rXhPwnBQ/zRYYJbyXbiQlYdiVyNgEXuh8rAAnj15oGlzy9iVN0w6xDVeWSwSvOt9Z/RY9iUCpD6xnQ+vo71HSHzw3E36mQmJa7tgstvY5wn3AGQ4+WR9Sy5hWcXJGO6lbhVKwpp18LsfPJ3SREcLWn2HOCTcGvwkBkUOMt3FRgJpqbWyYtvCzhN2El1y5vqerYZOrEqKA2XrP+grrhFFrtP3jBWfMc7WCVdRDbnrNrgTsIk6P/bsJHpXwQ0c1fcKFaQnqascHzkYPOw59slvcevPpi68yL2dw+jsvYz1yZ1a6CJAjJ4qohKI3w+9Ek+YPfuAgMfWp6QX537P+aKNu4nsrPcRd0NI3ozHyse+tI/m90eIx3/3pYOzzOAHlB9PrWRHFF3g81TIfaWH2tAMO14jql9rqJPomU221SyWgRIQH615aFTZ1QwzLfk7PCDE2yuHse9KGzfLdYKGgGphXCf4oAkUqrbT1lKKJlcaEZz3SY1YGaurpDnWzElt339k0KGheCIaP3HjUoWBzQbcaKMx6ZlpQpUnZ1A8louhRuxNg2zLI+zm9fZ7G1kDTD9BJ43zpD/Ubwd/Z5xKL5bI0E6QJOHAwwQRFYFbreihLuuDXudnodxKEU++ZPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(376002)(346002)(396003)(136003)(109986016)(451199018)(36756003)(2616005)(6666004)(6486002)(478600001)(2906002)(86362001)(38100700002)(8936002)(54906003)(1076003)(6506007)(66556008)(8676002)(5660300002)(316002)(4744005)(41300700001)(44832011)(66476007)(66946007)(70586007)(4326008)(26005)(6512007)(186003)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Krk9VKnOGT4r7hZGBVQezlibZezChXYUKBHwszho8riFq3CFaLXP5uXjQXdg?=
 =?us-ascii?Q?hLaqnOHoGy/BWFq2R6Zr+hIylx6yb9cWy02CgJFi6UvJ5n7R9XGzU7zkt5Eg?=
 =?us-ascii?Q?kyqMXi2OZdlPJLhZEINVrwTCtiGav4gxZ+KT11Ru3mbwNz9X3gUzQBHXn1wk?=
 =?us-ascii?Q?1RTGlDVw7j63/wty7CyXw3hrB1lZr8NylvmWYNtUeuKDVZUtErOdC92zM86r?=
 =?us-ascii?Q?mlfZ/deYBQ1fCYdEsEQaJcZsfTyFBmj1igggmJXEPgL74ASfrxTDFW5u/tWk?=
 =?us-ascii?Q?Pnyxixa/PQEnu0Wnlg8Z0DbldTfKvd3fr2lY4ldH1yONDPbPW2kaxpGy8Tx4?=
 =?us-ascii?Q?LnSues+d7dNshQ2G51p16KVWR5TILzWzLRQ7w+qf4cqtnSd6s9Qpvjf4NSFl?=
 =?us-ascii?Q?2eq5Y4ICYdfvomMILY9PH4ZRCSdThcJmvLCZ2fagCt1tzfQjPebxCOv/mI0R?=
 =?us-ascii?Q?SexdMkDIcLNKiRf3+K5aWZpjvRD3RbiUE+t5Sp4L+ppURPYEHHHNphOuLgNY?=
 =?us-ascii?Q?QdjDoNf3XZEfyB3dAQZ2jlxWzvF4FE3h9NV5EcmezBGr3fPXNKk0d+DMQjSl?=
 =?us-ascii?Q?1gpVvaRUm9JXsuOsXbfBrtSLsdcaim5deBBTobySECbfFnU/FGMbL8ZuQJxY?=
 =?us-ascii?Q?vb5YcWQn2jAyuloG+QPrrwiy53UHziiC712VpdRIBAXHikuTlnuK/rcTnC29?=
 =?us-ascii?Q?ANEAeRFkYMlRlOd5snXkfekRebZnBfCMv7frw95923pe37MCROcYKz7PM3lB?=
 =?us-ascii?Q?o5IQkpENG7A1l1UMtMc2SNa+6xPIrjqRqweBiY7hWY8NAyl9NJQ5ukXFHKmQ?=
 =?us-ascii?Q?66DkQLlZEekKEtLvb1hgQOVGdeAIrTAmawLKTLbCa+2w/i+HJl4PoytigoNQ?=
 =?us-ascii?Q?gSj1vJ4xm/SlxYVm0n3Bkti5UcADj/LJpk363aYsfDZ+cG8TZdLP6FbntyxK?=
 =?us-ascii?Q?1+luhANVpbVkrYvryKM74dsdudmjC3ZSObZWI5VIJl9V5O4kt8ozQL5YLAzh?=
 =?us-ascii?Q?R8lqUgr1HoiBqrt9QlRikZVWEfZ1s9lg9yUUrmEBGO3lSFcnu5cimgJ27xDp?=
 =?us-ascii?Q?ALE+63td1oGMIN6DNpBIUaKteJocgaVMuYhwUr6SC4H3bjuVlLyHHch6UkNU?=
 =?us-ascii?Q?rCkiFe9dcUOfi/CkDLHMfiN4SwIXeJtt+mYUS2TUB3DwHd4xyC1j1YzDvhQN?=
 =?us-ascii?Q?H0Q49ptwBIQZ3KRUHp9lbT1ttFFR878/b9oSh0okDLSNa/oujv3wS7G3/umt?=
 =?us-ascii?Q?TRwQc4OevDgWawtRdjPyoh+x8Y71YFgP/J/ZFUUDWqiYArRlVmUezjDqFrg5?=
 =?us-ascii?Q?7Cwc/bvlLNcLEFmq/xaMaW13zirbA2lZBUONs4XqDIpmLK9p25+hD6ZqmWP4?=
 =?us-ascii?Q?mjGiDqR7zF0PBy7GJTGJsjTWBkebHZp/5B3SGNY7PKnBX35bMHklU9XULmCY?=
 =?us-ascii?Q?TEYZiVxOZbM2n3INdPbXD9x9NPFfeF5zfOplYj6C2wOyWl7TsrVoSKLoI8Mb?=
 =?us-ascii?Q?3vWg2l78Qdkm7lohYqBH1Yvbf9UMy8j9oZfT/C+y8XktinlCFpFKzvyMstsn?=
 =?us-ascii?Q?01soSvl0xlI9qFr/bSrw5U6ve2qa3fowTs+2S5WCDv9ABDD1t+HGsGDF29qP?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e5138ddf-82e7-4e7c-4d5e-08db0445e548
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 11:17:25.0126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nd6MFaS+z2ZKvu12gFzPmSO2arndoeXV2dM7odcAwBtO+oQRg2s07w4ZWmbSIFcBnzMVr6lqlH/FdxmWXYBWRxvr6BXhJIUXlB1G+T96is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P189MB2551
Received-SPF: pass client-ip=2a01:111:f400:fe0e::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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

I would like to review and be informed on changes to igb device

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ece23b2b15..7d0e84ce37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2224,6 +2224,7 @@ F: tests/qtest/libqos/e1000e.*
 
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
+R: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
 S: Maintained
 F: docs/system/devices/igb.rst
 F: hw/net/igb*
-- 
2.34.1


