Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF0C5AD0E4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:59:00 +0200 (CEST)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9oh-0001gd-Ox
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8xL-0006Qh-TF
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:03:51 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:59936 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8xJ-0002l2-33
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:03:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSSF6WF6AeaCHKzOGGWguLFU4bIcsm1N/jc6Hjafuizh64//64lwy2kIQHGAK2d6SS7wkBDqaFDKvVcydatp13r2iuR4qS9jz0z/Qmbnq+u/VcHXV2NRErOVqsyMBZsYuuqD/V/PAbO01ERFtTDsFOZ8mK88NFrvBbMnVNnFMAqvWiEYusNzarklOP8wHHKT3AFrQZ7MCe4uzKRlSmTJQPFqFRH4vf8vAzn+Qxkw0u3DofAvX4o/e1AGRDAgRGedMNGouh9pQeys7BHmNBmaVI8IeU6pektNR/UZcWMvtjXlydW2qzBR8lOtS6IIH0JU8WHjaSckRBOvR+s43JuWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzIfy93BoM8EVqwYK0ufWux9pl4AEZ0PDBuzow/gM2g=;
 b=WWwYUvda0SvigtGVxAH8h5nE9GKl5FcotXCY8y6Jjrg1JyJsh15AHTPmaT/bWzXWWKjqOIfEcIyckdxnWCrZIdobJf1zYF3jE0YHOFtauetSxNf+RgpU7DhIBe9kInYXdUQIHiuqPmtgOy2H0gN22zffTK5ODspz+FaVB9RuEZWklixPS9nInm3N5W0Js/TIK7Fa8N9VBBMt0VPNzPkuECOw0apifwehVfcKz5ejNAhiZqYUyVPHXno123OvBRQT8WtZYU3aL+0qL8FXPkyTyRxFi8PDFSJiYQnYSuIX7BnDCJtVD8SFkjKD3rT8rpi+qJ9x6PI+R/6zsoa3ZDkmDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzIfy93BoM8EVqwYK0ufWux9pl4AEZ0PDBuzow/gM2g=;
 b=HRreJ0+egTME7DtA1goDwAzOXQ9e/rs82z6kR99TkduxG54fVFY6Ggb1AqZs9tts7obsXNArDWRN4PnJn8vb0heGRN/OpURSSATzDKQxlcHXwFt7KNct4EmQbdl++ShiRoAZIh9YgyPYCWjit7+u/nHmhU7tPAhN94nCsIkNbAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by VI1PR03MB3871.eurprd03.prod.outlook.com (2603:10a6:803:6c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 10:03:46 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:03:45 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 18/20] disas/nanomips: Remove argument passing by ref
Date: Mon,  5 Sep 2022 11:55:20 +0200
Message-Id: <20220905095522.66941-19-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e50a7471-1dea-4b8b-1bf3-08da8f25ebb3
X-MS-TrafficTypeDiagnostic: VI1PR03MB3871:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nU+V1isrXQ//TYKpHRH35ftnvv1SpakBdUFMlwOF0EmJSQ9hzqIvUrzHAKJaZomxkpjrft9xdu2NHABm1jz7IcnqoqNUFDYXOX2fW3yS2dW/WqRsd58pNsVM1gy8mPiTW1TcV0/euBkiu/iZ91oZPXXbH71dKukmywesdv3mjRlgjMpOge52LAsRoOjp6mFnERs7SNr226T/u7uBgtb+r0xeBvBfKCVIvIAjsOWgaNHN5VQOaTNFqbgaUgmj7XmCJHTs7RIDR93pdr/ftSuLd7TiSsmtBFz9BZuf+SFS0WTHPFojHWFQ94IgypwmsqgKhS1YaXhbXf8ubA/ViDjqhAYHlPdZQaCNvpFNnPpTZPujuXY2qd3eJAUDmSU4i471gSBJJKOAz8r1NgQ9lSLI04TqaTw4uElxhiCQCMHyOPkgAoRkJmOb4mCHY+8oTdsmqklSSFqIUdyzMSWO00Nzee2oSHRtVZiec2MADyVoFbj93BFjkIV28gGJb4bPn0VWWL4VXpBs14iwUPMs8wg781sV36koU/YT3N7My4jz6hT9KMT/BrOerPAK9f5co+qMELZuhxRzYuOdPYMOZcpWH/VkcxrCpPy9ZVY5SozOFVLl6KbGmZ0fD2tw4B5qTpBhtjYX5pl41gk5Ecn4ufu23Nr43E06IoRi+YpD2cZi5ne6LwNbHy5uMJ+UxqSiqurpIThm92qguldrAttUVywJYrSxw+MpMj/Zx/fcOfb322vYvzERwxHakv8UIO/3lNcU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(346002)(39830400003)(376002)(1076003)(186003)(478600001)(41300700001)(6506007)(107886003)(6666004)(52116002)(86362001)(2616005)(6486002)(38350700002)(6512007)(83380400001)(38100700002)(316002)(26005)(6916009)(8936002)(2906002)(8676002)(4326008)(66946007)(66476007)(36756003)(66556008)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t31IaIIKlB0JSxPy32m0N4l8aoC8Wc0aPt6mVWgN24UuCTQr8aRXa1X8+JHC?=
 =?us-ascii?Q?+FqkF+x34Aa5ckd1i8ya/IJBsvCXzy3odDffqksu6OkHb2f0l733S4xY2tNB?=
 =?us-ascii?Q?/weecBCzuGxqwTBJ1GUDEup7MuqJIu8iubDXTUSLGty3WnrrhmnSBTWXtQmJ?=
 =?us-ascii?Q?nCxRjqEe9PovHdpTBdj1p8q76cjhVTXL0NqwBAT+4wNVsAyIX+f3Ms1imU6K?=
 =?us-ascii?Q?AqtaeMoCHRBIqZLMsORsJ8Av7jgZBsKtDNWJga5w8jfF9ApTxHkPbaEa1yTf?=
 =?us-ascii?Q?+XYt+gSh1Bg78fnaYFFJM49FDcRSgRsT11EgJZKMyB12mw9zWlKZBPjgncpw?=
 =?us-ascii?Q?yJpky6VJWpj1TrcPG03z4u4X+OEhjXDf48m5NqhgPVVmFa25e7rzjIQ0q5+z?=
 =?us-ascii?Q?olWhH4Wt9rUKpaH4PSYovXJ/dmW83rSFpsaWQk+G+WJxPvFrkvLn16XlHhHz?=
 =?us-ascii?Q?LLVjdDPOCy8aqwBpT0E+BpqIMx4ToljBNuOfF5jxxVhvmVNlT8ko7YAwtoCd?=
 =?us-ascii?Q?avzS0uJsMprIf8JJ2S9q4c7SB3aAQpFIo/HXWDs1CKXajzkwc5V2c+fiKfuV?=
 =?us-ascii?Q?kPvCajxPclugp3NwFDQ5n+meH3vdA2Vg+8fi09uWZnqDjGpBOZWtlu8dfeMk?=
 =?us-ascii?Q?gh/t9ECoKW5b9Ej5krbuBWB1UDVKXAQueBiFFrbtai5CdxtdXPwkY1ll+G7T?=
 =?us-ascii?Q?pY1tQZDw9WFpjMNYG5/1aygAYTJGPXtIqN1ju6Y8CinZ30aYC0n9ARg9R0iw?=
 =?us-ascii?Q?5JaGXfGTrg88sNYu6eAfWEgk+VbrOcW45Ckv1Ngkvyw9I5GkKNQIvNHRPGUL?=
 =?us-ascii?Q?z+QR7kZkczcs7kIhOrFUST+3CN2VwfsgJ3D6Ulaa6TY1qt6dsLJdVlWlU83J?=
 =?us-ascii?Q?0Una6+lbeFjYJiSgKZRlazkBf9rvHcTFsYmcPA2DkwyWv3btXxRiD9a08qGu?=
 =?us-ascii?Q?XM1obMUOdSFy3bB+IwIMUNNgvXEkFVyOCy3DGYwRJUzjagDV68YEToUGzDMN?=
 =?us-ascii?Q?H0skSBclF+HfD2Ba9E5KmTjMBLSP/z4tnbXEnITMvQyRo8gVDHKfdsOF0sep?=
 =?us-ascii?Q?5TCxsY/ddCd6ltTRadn//2GfYBeJeMuQ+8SwLuw+nskhjcPNHVtUiMnetEKc?=
 =?us-ascii?Q?9os70PWZ1iFUIXDwmyltr/YoBsSD3W3Sl5V2Rv/fBwycCOLD+Xl/VAS5bFWo?=
 =?us-ascii?Q?Nd6/mnTlSKf/z/qpyayt7b0WPty6nu39/3LfyqtmgfhEmEOBN+TJegyaSGgf?=
 =?us-ascii?Q?p4lSQx2eO60q7oki2nf5kxZBgtcRvM9aCTXwXdFLkOgi3cU0wvHYfUp2PIuQ?=
 =?us-ascii?Q?LHqQG+3YI706IqhalblZdUvnBv2MGjhnvrZ28f78EuzO3LM5KeGAS8TQ9zgV?=
 =?us-ascii?Q?H1kdIz3gJVC4p7OtclhHTbpJJAZRfPOpb8EFHH77Iou0GP2a/5rDOzFxVbtf?=
 =?us-ascii?Q?w5VVRdODtzvWlMxKRokxDdZCXADPvHPkustX+cW6JRS+nWpD0VR8fukm6pys?=
 =?us-ascii?Q?4tb8g/FoQPBkk9fKLCq+go1fVMe+FL/d6OZAQ/pY647JscNJI2n9AuLY0hEz?=
 =?us-ascii?Q?BZGFCBy0703QIG3Tc8DUqzmjBHI4wMXNnzS6gzZxjPSoyCZ5yoDiaczT+Vt0?=
 =?us-ascii?Q?Aw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50a7471-1dea-4b8b-1bf3-08da8f25ebb3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:03:45.8698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTotm3HLDPdAGaDKaTELSusPHaCKyvUW4HaV1DVtZ7MSp7eNbJjNNLalTglnV703vKTieadYlpSzBNTDGxHng1p0b69u8Qm8uYG+0CWK2tA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3871
Received-SPF: pass client-ip=40.107.20.124;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Replaced argument passing by reference with passing by address.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 disas/nanomips.cpp | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index f57d255de3..ab54456c2e 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -635,7 +635,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
  *      disassembly string  - on error will constain error string
  */
 static int Disassemble(const uint16 *data, char *dis,
-                       TABLE_ENTRY_TYPE & type, const Pool *table,
+                       TABLE_ENTRY_TYPE *type, const Pool *table,
                        int table_size, struct Dis_info *info)
 {
     for (int i = 0; i < table_size; i++) {
@@ -669,7 +669,7 @@ static int Disassemble(const uint16 *data, char *dis,
                             "disassembler failure - bad table entry");
                             return -6;
                         }
-                        type = table[i].type;
+                        *type = table[i].type;
                         g_autofree char *dis_str = dis_fn(op_code, info);
                         strcpy(dis, dis_str);
                         return table[i].instructions_size;
@@ -22248,7 +22248,7 @@ static int nanomips_dis(char *buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    int size = Disassemble(bits, disasm, type, MAJOR, 2, info);
+    int size = Disassemble(bits, disasm, &type, MAJOR, 2, info);
 
     strcpy(buf, disasm);
     return size;
-- 
2.25.1


