Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96D34BE34
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:20:07 +0200 (CEST)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQa18-00023m-3O
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frf@ghgsat.com>)
 id 1lQZkO-0007ZG-Uq; Sun, 28 Mar 2021 14:02:49 -0400
Received: from mail-eopbgr670089.outbound.protection.outlook.com
 ([40.107.67.89]:64000 helo=CAN01-TO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frf@ghgsat.com>)
 id 1lQZkJ-0007Wy-Eb; Sun, 28 Mar 2021 14:02:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NClVAFIVrMlUgL5Qxu4sObDqVcKh5T1gwa76Zx37SFDkapzQmSYY4GJiKXa0x4J0oPDH2Skngh3DVcPyk5aFzoypYqOkLiI+QCkmWJhPPfYtCSslTFyhZLqrXGI1vEYOGuf4IONf+tokm6/obOdOUjSwX1a1t4BlW+ekQnGjzdtUJp3KV7Vk/vM4tN4TtSZD1q68bHh2ttMOx2IW84J6lz4/Rp/ciFLXGuIasHxYuaecnaUXVjf0FSlmuybofULQO5LqbzB9i0u2Wa2fnVWwRhqnnlG/mU5pjtMsDxdzGNsqlwHVMp7a/x0VxaaDnqUuwpBb4gR0FNR6CEo0bF+qIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5DHiXvdxXKoQW8kqm0nH0TF+DHVT+jn/0L7Pd8nKyE=;
 b=h4sca5WR3tcgl6lo6LW18lhdwVyHZRgPh3zMD2OSn8f+1lPUpGdLdWo1vBn76lm224mTpRI9pVttABiGOakUY7QcPoWupfXrYiEsavX/ASDlKlfswW5Sv+pfC2uZzGRe8hUWSS0F3J/HXzgXrmz33qLZqbUsf94YkucdGBr4a0uFbBxvf/rjC0VwkUlufVqEugaHcGZgK/3BFkCSM6KY+3+rEipl4PkRDDlwxr5bPWf2KF+nJd2UpdehpvW8s+D4M/viVQlswr69mMEuRWBh35aa2huN0+cGU+ZHVsZi5TxiKDLdhGocc+Pd9vaUaI2yo7THRF+hQLHV5IglBTN3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ghgsat.com; dmarc=pass action=none header.from=ghgsat.com;
 dkim=pass header.d=ghgsat.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ghgsat.onmicrosoft.com; s=selector1-ghgsat-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5DHiXvdxXKoQW8kqm0nH0TF+DHVT+jn/0L7Pd8nKyE=;
 b=PR9iXJxIbyE+6BGq0Z5gy8LCOX95u9zgYc2+39Enx7uGJJ6GTQj0pWIxUg+0MrvR5+PmfV454aVucmwkULFFbtpepVCFmuJEwybfZatI9zHk9zVEAmI4EyF8eWU5xpUPVoR41eaZ3TpuOPgZ3azATlxl9SYSw1+rKCCOKmf+Fl4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=ghgsat.com;
Received: from YQXPR01MB2437.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:42::21)
 by QB1PR01MB2706.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:32::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32; Sun, 28 Mar
 2021 18:02:37 +0000
Received: from YQXPR01MB2437.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::c57c:c897:7829:56f1]) by YQXPR01MB2437.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::c57c:c897:7829:56f1%7]) with mapi id 15.20.3977.033; Sun, 28 Mar 2021
 18:02:37 +0000
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Fortier?= <frf@ghgsat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Subject: [PATCH] linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if its
 length is 0
Date: Sun, 28 Mar 2021 14:01:35 -0400
Message-Id: <20210328180135.88449-1-frf@ghgsat.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [70.80.230.242]
X-ClientProxiedBy: YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::26) To YQXPR01MB2437.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:42::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from FRED-ubuntu.ghgsat.com (70.80.230.242) by
 YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32 via Frontend
 Transport; Sun, 28 Mar 2021 18:02:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95fcd963-348e-4d15-1976-08d8f213aba0
X-MS-TrafficTypeDiagnostic: QB1PR01MB2706:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <QB1PR01MB2706DD8AA873E4ADB19F556FC97F9@QB1PR01MB2706.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vXaKqclJj02ALjwDCr0c8T0pIEeeWffzRxxNBsjD/pPeWC6ngyeEprHFJ63qbtk4SSeMB2wiIzFzWDZIfk2QyKgLViZpYTVjVt/00QuFSfylNPl4qmYY5Wh3dk+OQixMSyShu2uh16ReOFTFj62dyacBonjSJYzL7VZKmYNlB8s7JedAAP5g1cepBFd4XH6XN1ulUe2d2dThl79Nq5ZSbQLcOhzORQWKwPPe/4s7jiUJPIN1XozelGNrq7SF36Ny2p1pGJx8gms56ttEtrpJw+25Ud1CS+m2fpuVP8RcBaEH1uXpL2pyuDzs2OaB7kVM5vtPQeYmpqZCjt3lIAUWO1oYSH9Ka6W01sjR2BAn1dxIAeinDr6T36cuSGLL1D9lBSQamD+b4NA4LHM0x4DNvwC+MuUcuFyip9D4zuH+Od757JpJbl1ffxWXLGzFpOTYjn6z42V1V5mo+pFnjc11eQ741aba8+I2ZUZTbiMYzlu3CqrSE5Aui2tF/B1+unm4DFybvJCReKhWr9k4tteQrYEwPIrIJY9E8BlOOUwFQhIANl8YT7iurRrO//uWxnNThdKr4KqrpsQrfnUZChCM7i+n044oKV2Hh1kffyn7PWrobTUDTC7H2t/efTsYyAUj4gh6RRy0NvYGbflbf0KKD1eFA6mkHdyobwwMXnSl8xA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB2437.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(366004)(39830400003)(346002)(7696005)(52116002)(5660300002)(16526019)(956004)(4326008)(186003)(6916009)(8676002)(1076003)(38100700001)(54906003)(83380400001)(316002)(4744005)(2616005)(8936002)(6486002)(66476007)(478600001)(66946007)(26005)(36756003)(2906002)(66556008)(86362001)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QjNNOEovRUpXdXpWcW5yQUdUanJRZ2dBMVFsT216SzdFNFBKY3hqRDFUM3dE?=
 =?utf-8?B?TjlZQVRmUlc0aGtoN3RPaUhwNUtxem12eDFqd0VPL29VL3JucDJGVW5UT2p0?=
 =?utf-8?B?dFhKcnMyazhxUDBPWTV3RGptVFoxU2c3NW95My8vVFJLY0U5Ti9OSWlqMnJi?=
 =?utf-8?B?akVrZW9FVWxxT3lPeEhyeHBweVFHeWc2ZVB2cGNvTzZVZVl1NXhQeVJYdWFT?=
 =?utf-8?B?dkRwamE4V1FweTJ6OU4yTkRuVWRxM0lpU3VlVHdDbHJ6aFhtRDV3WS9JVE91?=
 =?utf-8?B?eUZxR0pMdjc5REFOeUNTVUY4Z0ZUZDFBUnBDN01mMC9lK3pDUXNObUZVRWc2?=
 =?utf-8?B?cXQ4NUJPcnFtK0FabDFwZnNMMUNqYlJ3U0VaR2YyT0VPZFRPVDI5U3BCOXFV?=
 =?utf-8?B?SDYwTXZJV2RzemtMQWsvYkYvR3NmRHFROHh2STFsSE9kbDhjUHR0K1EydEVE?=
 =?utf-8?B?Qmc5UUlCQlROZFA1TU9FeUNDNmJSOFpBci8vb2VRNnZBSXUvSFh6d040UkZz?=
 =?utf-8?B?ZFFaQXVlUHlNeC9PSllTUjZmN3dnQlFFT1RZTnc2RXU3bFZPYTFydHhpSytL?=
 =?utf-8?B?RmNYZVNvMFczQVpLcm5MVUFSb3JqQ0k5eW4wNzkrZFhKa3QwYjViTEpVcUVq?=
 =?utf-8?B?YnFEOEdHd2RmQWZDV0Z5bWJNVjhFMnJHaHdNWWtkN3B5Wk0xeTR4WXdsWDdY?=
 =?utf-8?B?b1VjZldyOTB5ZzdXMkpCazFGL3l2ZmZiMUErQ0Q3VmhTbFZHbkJiUXJzK09M?=
 =?utf-8?B?NFYxYWZZSnFaam5HZmRQQWI2NTdMY2F2S2I0N2V5dzZVSEhFcXFqYm1FdE5s?=
 =?utf-8?B?L2VqZ2ZJblF1SnZCbnpmVXUyWW1HZGtLVEFwRGNpa1RXZS9IUWwzbWlyaENa?=
 =?utf-8?B?S3FKbEI0RDJlbW4zSUFQRThpUldTS1pSeWxzOUpLaTlrZ0Nmb29EL3FLTUdS?=
 =?utf-8?B?ZzVnNllFajYwdnEzanQwYU11eFdhTzRvb0tiRjJERHQwY0M1VDhLeEd0TnhW?=
 =?utf-8?B?Q0Y4WEJGSkRlKzM1VkdxVlkvaWNyeEtnWXB6djMyTEN4VXY2bXNZU1JlM043?=
 =?utf-8?B?V3ZIbVo1TktOY2p0NUJ1YWpSVm44ZHdiWVZFL1U3ZDlTNmU4TTljV0VSOHc5?=
 =?utf-8?B?TkVqa2JGM2FUdnZLU051bnJ2Y2U5RHdIcElWclBUVDNkT0tTYTh2OWpwcmtI?=
 =?utf-8?B?cFhseWtRYWhsWTczVE1yblNEZVRDU2RXSWc2M1FkL2oydUF5RDRGRmtNZEd0?=
 =?utf-8?B?elc0cURQSkN0Y0w1Skh1aFVzRFR4a042TGt3bGJuMDZhN3FpY1lXaFVaY0xo?=
 =?utf-8?B?N0FEeVI5Sk1oeTFTRVhEczlNU0xJODVhZ081RXl1OUNXME5zYVE3eFUzVEhW?=
 =?utf-8?B?WW1QbjRmZ216MzVUL1lVR3IzUTRuejkxK0tydlo2WHdGYWY4OXZMWkdnWU9R?=
 =?utf-8?B?Zi9sQzh0UlhtM2VrbGhVS2lwcjJZbjNPWjVoTDJyandZQkxFTFhqTWg4TCtk?=
 =?utf-8?B?enFLSklycDBuakRWRy94TzdzY1hYVDBydUF3ZU9QRm82RWEwN0VHNmVVUGhU?=
 =?utf-8?Q?vAHXjysFsPV+FW8ZkX2gpLpoddu6nF/y9agA5yXnTY49Vb?=
X-OriginatorOrg: ghgsat.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fcd963-348e-4d15-1976-08d8f213aba0
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB2437.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2021 18:02:37.2500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bfd043dd-f09f-4b66-9b18-72d4ded19a21
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFbyoaf7wlFhvDaJXXCfUOTGheBTom9adimdBcp8322X84BHPx+OF6BoJAY29kKo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: QB1PR01MB2706
Received-SPF: pass client-ip=40.107.67.89; envelope-from=frf@ghgsat.com;
 helo=CAN01-TO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 28 Mar 2021 14:16:43 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Fortier?= <frf@ghgsat.com>
From:  =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Fortier?= via <qemu-devel@nongnu.org>

getsockopt(fd, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, *optval, *optlen)
syscall allows optval to be NULL/invalid if optlen points to a size of
zero. This allows userspace to query the length of the array they should
use to get the full membership list before allocating memory for said
list, then re-calling getsockopt with proper optval/optlen arguments.

Notable users of this pattern include systemd-networkd, which in the
(albeit old) version 237 tested, cannot start without this fix.

Signed-off-by: Frédéric Fortier <frf@ghgsat.com>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1e508576c7..9b7556a9a2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3025,7 +3025,7 @@ get_timeout:
                 return -TARGET_EINVAL;
             }
             results = lock_user(VERIFY_WRITE, optval_addr, len, 1);
-            if (!results) {
+            if (!results && len > 0) {
                 return -TARGET_EFAULT;
             }
             lv = len;
-- 
2.25.1


