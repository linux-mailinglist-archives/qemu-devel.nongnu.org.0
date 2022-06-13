Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28777548544
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:43:53 +0200 (CEST)
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jQ6-000712-T7
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0iy4-0002A3-Hm
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:14:52 -0400
Received: from mail-tycjpn01on2072c.outbound.protection.outlook.com
 ([2a01:111:f403:7010::72c]:32678
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0iy0-0007yn-Tk
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:14:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpbPe7KSm3uIVqNLCLBUJFo/Nj+vH4wBtTaJq0tRpFZnyrPsrD6HnQKJz3W8qDioTW1CNSGYrk/EeJK1gSHirmgbvpIx1lRJv0XewKBKUlOvhpAt89RUMpBO4UsV9ph76V/ahBHebiLSbzDzyL0ioAb2tbc+XnVXQOg7KRVoCrp2XH1x/9dfaUs82G770Mv3aSnF9PK/8KEQMytxnK8uz67vjkNvu2KmbaHTRFq3zHZcHwWhUS/JTkjD+2FR2H7dNTZSl2umMNfYS5BxDMzihOchyWEo08bnRW7MGOC6B70mZrBVPfeu4Qz91k/4+/ekqnyE0qt3J1Osnrj9w8r0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuTkLH2FjT8VS8G1URTkwkC5b4thQ2qHe+HmQND9FC8=;
 b=Cui6rvC6y2bC1U7nLUSDLFDirECmOcoZsNp2X2QS2XV2pGToi3HAT2XUBHNG8dp7qRBeX2nyw7R79q7IjFVWqhVJyRLgICJIIvTgKTreiE59OApuI8xWrhFFjoFvcqi6IzQ0bh5NX3j+/28+UzcGGDxw8UoN2FD6wkDDvhxMaANe/ZLttXw2plMM+O4gPIZv1fxd6vgMjaa/5ApJxOOhgwc68wY4JcNrNXqmThWyBKEiFe3hagEmJ0lGy/S9To7xy/we0vMqJjzrYi214ZJRiChuz2pFlYGa5ckNX3wZnmmnn8rqbeMD7BpvCsor5t6nf1EPE/Mrh6L0QeyRHdZSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuTkLH2FjT8VS8G1URTkwkC5b4thQ2qHe+HmQND9FC8=;
 b=SMF2G4KjZ4XPBaUmt7P7OMcqpDWiD945idzk0IX7V9IQy4JPD22UfCv/NR9v3Cn+VrpTlWFHZwGr72+R1BJKRmeqA1ymO+DST9yHY1CAvfwAebYf7e2PHRKoDQl5ggKqwRkS7Ygp2wY6hpAv97GRkMm5CfHIQHUOoCyVAwPP9yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB1494.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:17b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.13; Mon, 13 Jun 2022 12:14:28 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 12:14:28 +0000
Date: Mon, 13 Jun 2022 20:14:19 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: [PATCH v2 1/3] hw/usb/canokey: Fix CCID ZLP
Message-ID: <YqcqGz0s3+LE42ms@Sun>
References: <YqcptnhfCtUn2+T6@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqcptnhfCtUn2+T6@Sun>
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::29) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45134506-ae23-45ec-0c40-08da4d364363
X-MS-TrafficTypeDiagnostic: OS3P286MB1494:EE_
X-Microsoft-Antispam-PRVS: <OS3P286MB1494C4906D85AA3F614A4610BCAB9@OS3P286MB1494.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9h4Nnz87IemkXr/n7xPUKeW44CQC87nuoqBlVhJABkWA11A4tAYr0iMXPwL0XpOXpvwsaLgBX6wjZbJAZmEvnCBpYYRMxUqD6L+q3DhG2eqMZh0No98E9yEf5qQZC/rdDmoNI+2aTGRnt7i5Jv6Dz4yjfTErcut7w+hkzt4NaZHUnI3ISqJOlT1J+qv9vBpBjSAXA3jiO8dBCb+TB4kvO18Jop1+75q1PI7QedSQ9Ney+AEY2lf+Te3JCshOFU6mQPbDDHNCO4uEaYomWDxT6ZKhgKohLPkf2hsGvTJiTteDKHf1Pwo07A8ngt0q+rl/EtEt/qvmp+HYYUukgVPFk2484JvlUK7yjInNoSLfWJPTSMdV/h4i8a21VXnV5u/B6LegmytwhtAKh2YCupqb4Q7X1Pm2gi5zQodSUnkTmHv7LzkeREmclz4fLbJDenjHteUgnds2vGxycnWtML9rbsZvuNL/Oxgat9cQDTTQkMAPft51WIagciyqFTjbjoT3KFMJzkkND+o446O9Geh/Hl1RMpAt5HEq1Nm6qjC0aKqVm+G1YbV7XbO3ONEmq9GSA9KYtZXe4MMq1JFXYLVj7IZwn3lRlFYM8L+zilXsW4V3/7nJHURATScJVZYYAwep84PzkQhT+bs1Rws51S7Lvc6Td11/IY0KYyNEL7Re5Dqqt5/uXCPxTOmtP1kkfJgFFWT4RrUzGIGj/s98zcg5IVgDdiJlNauDsYGrvncriH/IiY1RzslobY5tJk2d2sOd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(136003)(366004)(396003)(39840400004)(38100700002)(6916009)(316002)(786003)(33716001)(52116002)(41320700001)(6506007)(4326008)(41300700001)(86362001)(5660300002)(66556008)(66476007)(66946007)(2906002)(6512007)(8936002)(508600001)(9686003)(6486002)(6666004)(186003)(83380400001)(8676002)(3714002)(49092004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DUzjuL5EutP++zgdskVnW+snIjyHJEvdop3Tx/rzwHIF26rjxoLvBhw59WkC?=
 =?us-ascii?Q?pF+CgTlpUwTkXRwZnlDhvOjADGbl1HQi3jrWAD98gkh8fTbW+ChCwtmlosxt?=
 =?us-ascii?Q?MA6nbCph+b9+GmzG9so0YN30uIgxGDCs3NjxSioaXQ9tBIt7bnFNU6MhM37P?=
 =?us-ascii?Q?/DQQpojSnsHHjROBbWSJteCcVxMeLkW0MxKXAO7+11L2m7GV9vYvDbgsE5DK?=
 =?us-ascii?Q?6DUbrSsz0HzxBVh4YgkBKu4AHbkg63Ku/QXc+qqWUKmkDSS0Kf/TZzKEyLoy?=
 =?us-ascii?Q?layFhkP5tYjUP8cRP5ooKTsGyS3f52J73C0R28+PUHNI+6UwIFCdGjrhm7jX?=
 =?us-ascii?Q?PApCdnc31ZotIrkwwTqv6NRr9QUHE/9l03yRTpUy75+29OJixCORJ0LOSMFR?=
 =?us-ascii?Q?kK1r8OnTva4ofPUCvvQ3zhg4AXq7j7HkBeuZ2+Ew9zFsPKPa9YNZq1LlfUVv?=
 =?us-ascii?Q?WuRJpaQD2EwQzU9z9DhQldxaUeTqt+pJjssB1nkkP7WbSJZYjSeO5G28vzqN?=
 =?us-ascii?Q?gHMxz1ZXdh94LWlIdWhbg9B3bckjWpi0gg1MligniNtvqEfPGqCINQ8TVKR8?=
 =?us-ascii?Q?3ENe0u3nd6FjlzYLpWHWnm/Q4oWlnYjZ/bHLfdmXVNK82x6Tp9UlrVLLkdqO?=
 =?us-ascii?Q?QYlCVBzGjqtpj2YPaQkfzusuIWbP+DNol88oCgjfN/Df7kvxfO6tQ4fq7o02?=
 =?us-ascii?Q?nDzRD7l7fS4PLKJvZ/NR7h9/DV5v6wNlLqEAPY/gYaXNIUivlkk+sLLXHZry?=
 =?us-ascii?Q?+ZgwKLlH8XJq4uZ/ZUvTvPun/zjeJxfvELCsRmSw+cePTk2Gpq55Sm2LA4XP?=
 =?us-ascii?Q?xKd0eYCMYi0tn8pv5/Zz4EvNFf27zKnXbtetT5OQi6Q3lPmC4C5cIX7S63pV?=
 =?us-ascii?Q?T4XhS2JV31xbLZuUuuJAsJK4zAY2OyQZv1F/AlXt0J6zCKAkaE+kycOi0/IW?=
 =?us-ascii?Q?o2nthwL4RbL8/NZR4ucTgHvGSVMTPFU4a1Y13uh9Tckk0DrMUZV6wophxABE?=
 =?us-ascii?Q?bjffMzL6w30SP/y3+RTfqqrO6LN/hwXMioKsPsvLqR5REnPzRLdDbBcYE4JX?=
 =?us-ascii?Q?flFWwDAihpLI21rs6zFJC55m6m0ZUl+jnv+yGWyKgnw68ML8gZazvzLWnRVd?=
 =?us-ascii?Q?/fijseWJkaHwddMWrSgdmHeRnYdb0MnyqK9PgbDL4+ilQ12HU1tmUqjarTb5?=
 =?us-ascii?Q?9TsKZGBuQPQ1ekWKHkDfx5WSEiHn/MI2nFyXnWiYjZEsaLmeMgHt2BYnuOd4?=
 =?us-ascii?Q?MEIQPo6IdbSKdHhJJtOPpj6Rbkp/gmi3yrGWXbP1tRYzFBEoKffigU2UZBNd?=
 =?us-ascii?Q?Wfw9zRtZ5j38WIzbDIdZbc0c5N2Pugq0WZEnCz41nw0EpIVB2Y+4gPVielep?=
 =?us-ascii?Q?dmAkDEApPgFG6yTXRzgYkOyYeEfbqzYhTb/Z3AP7t/4UBE9IkOijKItF7QWC?=
 =?us-ascii?Q?Oj5pKggSYhpGJeHw0WzuSII1HwRhXMXsjDLtnHzxwQmnc2qHcaiPyB1v0Kba?=
 =?us-ascii?Q?PeFmg/D+KeJ/e/RtG+Iot8e8gsAGY8HpGzN9+xViqKdlHLakpTDxZ4gJZm3z?=
 =?us-ascii?Q?HwwgaY9YRvDCjK/Oqu6yI5nsvrUKuj8nChhmS+xG+HUVquLI/LCvWZ8uahxz?=
 =?us-ascii?Q?1ZEw0mLaz8I5AX8ZNV+Z+Pb2YQr5PIkkxaqYZK9+Bl+N83CzY+ji2XzKEZDo?=
 =?us-ascii?Q?EJBk2QDZfedxqmhjGmRsFDSUvHPy/zkTqIQUdBC6lpTlUelXvTgAnhcG/fFv?=
 =?us-ascii?Q?j8/Zugkt1w=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 45134506-ae23-45ec-0c40-08da4d364363
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 12:14:28.1107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83AQgN4PpYW9xR20a3Fr2bN0IR0/2+rNvb6m5Q+rmWCOQQLn2HUuWS6WdCOktHK1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1494
Received-SPF: pass client-ip=2a01:111:f403:7010::72c;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

CCID could send zero-length packet (ZLP)
if we invoke two data_in, two packets would be concated
and we could not distinguish them.

The CANOKEY_EMU_EP_CTAPHID is imported from canokey-qemu.h

Reported-by: MkfsSion <myychina28759@gmail.com>
Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 4a08b1cbd7..86548923eb 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -109,11 +109,10 @@ int canokey_emu_transmit(
      * Note: this is a quirk for CanoKey CTAPHID
      * because it calls multiple emu_transmit in one device_loop
      * but w/o data_in it would stuck in device_loop
-     * This has no side effect for CCID as it is strictly
-     * OUT then IN transfer
-     * However it has side effect for Control transfer
+     * This has side effect for CCID since CCID can send ZLP
+     * This also has side effect for Control transfer
      */
-    if (ep_in != 0) {
+    if (ep_in == CANOKEY_EMU_EP_CTAPHID) {
         canokey_emu_data_in(ep_in);
     }
     return 0;
-- 
2.35.1


