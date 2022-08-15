Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD02592AE5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 10:10:22 +0200 (CEST)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNVAz-0000SP-4i
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 04:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUXv-0008P8-TY
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:30:04 -0400
Received: from mail-eopbgr80122.outbound.protection.outlook.com
 ([40.107.8.122]:52230 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUXo-0000jm-Pd
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:29:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1fVU+ActMb7dkDRWz9alHdAixdT5bFMdXMk4Ls+rRTUBvTXViTIS9iY8oc7GmuLYMumpZ44v9VmUfcEhyPirJLShJqtd01GfJbpt/tpcSby2OXuzS1DWVZSjDKreey7kZT/BqoKNL6Rf3dmVECTW4BZh4Nu3aQYuIyTb22VWzkXKODfuKOBfXLCrVt0s71G6T9jMdlOLY9LX5E1ozCNVRfC4C7P1FvUzrD/8VnrzFg5jDgzY1axgRsj0ysVCK3F76Jf1hS6chKda5ZYZ1zMuupw2wXc4BcBjHA7sd6UySmSVz8I1Iddbqm2RrXNt3HOuBGlFwAKxeKwPfT130l/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLpbHY4YXtoxwlWv7Kf55ISJCiNm8QezPzw4w7/yLyQ=;
 b=F2/FlWwgZQF08cYGiaTfX67EiVWDQVsILnMZ5qGaFv2NTOQlY0vsy6/Rc35UbvXVSQLuOh/DbW55CYjOwEcuj7xWGuSp2bUiogtu8UZr3OuwWr3/aVAVo6ZgsbPRLDA8QSDYWuFttZGRbHwPzfjRzS9xBs63qZBQmCzh1ucAw3gOEeFa9QAdBUbfWWvCkFpVg2XQhrIRfjLp66rdMPh/j4CHyjdFRU21F02t6Cu1dWwdkHNK9aHGQE/zbgAQah5bcfXiyt2Rzr7irpTR5h/fibI31UJ3suZFXLUbSt6bUXnrvlYSfJOOSCcRIvUeDyALqqcJihZfHCst8GGuBzAetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLpbHY4YXtoxwlWv7Kf55ISJCiNm8QezPzw4w7/yLyQ=;
 b=XL/37sr1XWNsCaMLZxzjXkOdqzNd53yPvWRGhxo1sPCTdCyMgX27muOoL5Gk/zKJp2nquCEzWL2VKTGHfBGrQWbJAVVHPcE3x7M5ktzvx6lPDCdfhE8Y+gevqVsZSyHcrLbGdea7pc1od+BLcVf7bO8KAyOK7jj9/4XlMp/kp5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PA4PR03MB8134.eurprd03.prod.outlook.com (2603:10a6:102:2a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 15 Aug
 2022 07:28:50 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:28:49 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 06/20] disas/nanomips: Remove disasm methods from class
Date: Mon, 15 Aug 2022 09:26:15 +0200
Message-Id: <20220815072629.12865-7-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c9cb135-143b-497f-3091-08da7e8fcc14
X-MS-TrafficTypeDiagnostic: PA4PR03MB8134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gugCrptfvv6gkR88e3AQqtFVlnDBoGsiNG73bhCAgBzHvkuzHJsOw+EOF9/hmHEGCuj11An46sm73Q44e022AFfCZDRS2vdQlQQvcylKpeJQWEWEc/ZLd4Ga2aYMDf58L4Zi37ltiqZLFSUKaIZXB2G70m8M8FCx+hrpOvjW4pnpPvA9OXknrPyopHEbWwbgp8/h+o/+NH6CeNEtlXPGdwgqH9VkSt9BAIHnhlEW4nMgXEziWnHI8HVtit0lRS9R+Wa7+z9XLNVxWb/B3HzUzxi2+KKUyd4aBB1Qvme3k6X4nzvklenn4GEBmu4pocVxoPUAjjpoYGq+UzrbTNGm0pore1GkBLYtlsOyNqNZj3S+ygwSOYz0b3NIrnCjOXqSpGqepys3Mic6VMkBYJoNpZyDmlw48P5p4HgCedvYe8Zs2AtlMevbCEFyM0nOLCXAM0Am3CGu9OhvopLNUsT0EkTD0mjEcpbIFvPnYsHbWK3TTh25TDkfQXd4tmuvz2KaDozo6a2/OikF1CSURyKTItLQuFIYTWdoMwsc3FPdPMLM0zlRa0FpawCE/9VzvNTAyOfxd+X+/dt3gc6efXDKwmCIg0mbZndAa+mAREKo5A/ZjoKrnWlC4E83si7CX7Vv30zZf2hHcSwCkTKY0QyrVCPeXb0Hz+F3FJ3YljSUOQdqDZvNWZEXaKAEIph/kQWciL+goX7b7DJuqQqRbkaJARK/iCEFKOWKZm6c01+eldN69z/eVjkvBesghf+Et529XTNuqBDO8S0UaLDFYWlwLtaDlC0seXoJ5MvPumJsj+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(39830400003)(136003)(396003)(38100700002)(2906002)(26005)(66556008)(5660300002)(66946007)(66476007)(6512007)(52116002)(6506007)(38350700002)(6916009)(478600001)(6486002)(107886003)(41300700001)(186003)(86362001)(2616005)(6666004)(316002)(83380400001)(4326008)(1076003)(8676002)(44832011)(8936002)(30864003)(36756003)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/6EkAZjzBsNp10+YhGSM6f21BgzaMMjG9L1Ff4OURpMph6EKbpNq3IYiwg0b?=
 =?us-ascii?Q?MStLYU5J/yMP0UdW84pecV0hQr+4YL4AU5Jc+EySOxGqxxdWjwSMlCBGs58y?=
 =?us-ascii?Q?mqT1PdXurIr8T7JJtcq3igd4Ui7qHDrCb6wV/2lra1gqBKviAXxPwWUh6Nem?=
 =?us-ascii?Q?WUbPxhDg6l8EQy7eboJ8mZVIrG4xz/zRfjYJWHIcAAIZT2A04Io+5KaqENX1?=
 =?us-ascii?Q?XqhnyUpVrXel2TrRSWk7sLu9Co/2JtpwiZ/cdobL1MP1R0srthAoNw2FdD8h?=
 =?us-ascii?Q?KR+FMmyH5MmKoA2rQpVeUpis1mfHxvc4vnE3FcdCyz26Yjf8U3DpPgutZGDw?=
 =?us-ascii?Q?7tE8Uc+6Xy48v3lGi1cHCi1yFkKFdeHw7LrqIR2OCoQMq1Qcbneq5oJNwTSD?=
 =?us-ascii?Q?FqtrX/QC/PS/I9sr/AEhdJ96UfCAYjGFj4YEKmMSIGcI8vpMFQP7hJLzArTn?=
 =?us-ascii?Q?G14AYFYSalDaMl8nVN2NxHsgWip+/yoHo2c09Pd8w5TNy8FOqtGdxizRLrwe?=
 =?us-ascii?Q?2Y5wjeFFWLeLRwZAxZCKOVo0ZQPdaUohM9ejc8L0EIzqGe3VpkqjPyAgElFj?=
 =?us-ascii?Q?50X1Z1omXAqntj1B/6ULLJ9lqeuZdmyzxNdNjfVXNhqya8XgAav+sIBmz4ch?=
 =?us-ascii?Q?zx1lJE88SlTVlFiBEfYpifVp7eTBTEzI/iINPPKmFkFCr+0W1HtFd1V6R2lY?=
 =?us-ascii?Q?gWSiu28EKuLP0G52EtHpxMccWcY/DbjpruF8TMF0OW89d76ZMoYZkb/HTmFH?=
 =?us-ascii?Q?sOqExkaO15gIrP8w6kIPmk2BDC1qD4DvKwJHlFWK7kxFbk8wBBsBw+G2NBaz?=
 =?us-ascii?Q?EmhScsRVYF72KBntI/+GuMF/XGPD9ledCpz2FK/ZALjeaEc/a2efDogM1Aac?=
 =?us-ascii?Q?eaowcGuyaGsk4+aFTgGA0gmGlTethgXMyz5dCBaNvoKS2Hv13/i+rkydGJLQ?=
 =?us-ascii?Q?SVB3RV+sg46z0L3Dd6TcxgJGWg8TN0/f6S32q5cKUcMqIIjdBDxPF/9kI9kJ?=
 =?us-ascii?Q?VP+0Q/5iiOidimDvpYTaD1nsHY9vGWdQ5+xE0kfrzH8r4nE1EotmQPTT7kFB?=
 =?us-ascii?Q?/fkq+cWl1+6TxVGjCVdRawpUiL+GoZoVUc+TbHYn5c0mpIg6Zmhm4GTBwTxA?=
 =?us-ascii?Q?lf3OddBWl9/sJ59mUrM7T6H/Id38hw2Ip6GviGIUm5inaUhc7Lhbigct1sn5?=
 =?us-ascii?Q?XA1gwHtb445O9d9BSSrYNMFiB6yJRr+MjAuOl0QeQjX0F28UVTwtmDxiLXrl?=
 =?us-ascii?Q?eqMQMLDFb4HQu1JIbwVChm7unFLmBN6elo3X2yIVCVXnKG7Dgb5C+fbMugrq?=
 =?us-ascii?Q?b8MT8i9Pxjdj+WXaJQ7oRBcppfTHp45RJagLZHoEPw5LupMzFZuQENoxoBTN?=
 =?us-ascii?Q?g0PIuEc9GRkA/S+Yo80GFDBIOW9vbe7gP4hnsmHfPDDOpc3fXyhMBas5rhmq?=
 =?us-ascii?Q?WkfsSAqjCHDO5Er6RYpuUlHm1EqTBZJ9FXCdLxVwlU0dUDYITu91X29nGHoI?=
 =?us-ascii?Q?Nvbp4vcogmTVaHboCXYPUHEv0ko1wYpP9Hh4gtrMhftDnofAEUUbZGHsJuVg?=
 =?us-ascii?Q?+qNQU4datf9HbniiTsxnRIU83ZTtrMRhT+vOjw7JZqnZM5NsI9uVyGnaHNYO?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9cb135-143b-497f-3091-08da7e8fcc14
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:28:49.9082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICwc0Pvvs1/huepJX2S4sdjOGBcDHyPC9ihuORONOyZ2CFCUaS323UmIqgqQQqDgujAq/Yy1FgtGiFVK/iL0ZQy+bfQS/JXSslRc/596Lgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8134
Received-SPF: pass client-ip=40.107.8.122;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

NMD class methods with the disassembly_function type like
NMD::ABS_D, NMD::ABS_S, etc. are removed from the class. They're now
declared global static functions. Therefore, typedef of the function
pointer, disassembly_function is defined outside of the class.

Now that disassembly_function type functions are not part of the NMD
class we can't access them using the this pointer. Thus, the use of
the this pointer has been deleted.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 2546 ++++++++++++++++++++++----------------------
 disas/nanomips.h   |  640 +----------
 2 files changed, 1274 insertions(+), 1912 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 9e720d0e8d..205c4f3143 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -815,7 +815,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
                                 return -6;
                             }
                             type = table[i].type;
-                            dis = (this->*dis_fn)(op_code);
+                            dis = (dis_fn)(op_code);
                             return table[i].instructions_size;
                         } else {
                             dis = "reserved instruction";
@@ -1770,7 +1770,7 @@ static bool SLTU_cond(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ABS_D(uint64 instruction)
+static std::string ABS_D(uint64 instruction)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1792,7 +1792,7 @@ std::string NMD::ABS_D(uint64 instruction)
  *               fd -----
  *                    fs -----
  */
-std::string NMD::ABS_S(uint64 instruction)
+static std::string ABS_S(uint64 instruction)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1814,7 +1814,7 @@ std::string NMD::ABS_S(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_PH(uint64 instruction)
+static std::string ABSQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1836,7 +1836,7 @@ std::string NMD::ABSQ_S_PH(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_QB(uint64 instruction)
+static std::string ABSQ_S_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1858,7 +1858,7 @@ std::string NMD::ABSQ_S_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_W(uint64 instruction)
+static std::string ABSQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1879,7 +1879,7 @@ std::string NMD::ABSQ_S_W(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ACLR(uint64 instruction)
+static std::string ACLR(uint64 instruction)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1902,7 +1902,7 @@ std::string NMD::ACLR(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADD(uint64 instruction)
+static std::string ADD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1927,7 +1927,7 @@ std::string NMD::ADD(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ADD_D(uint64 instruction)
+static std::string ADD_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1952,7 +1952,7 @@ std::string NMD::ADD_D(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ADD_S(uint64 instruction)
+static std::string ADD_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1975,7 +1975,7 @@ std::string NMD::ADD_S(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_32_(uint64 instruction)
+static std::string ADDIU_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1998,7 +1998,7 @@ std::string NMD::ADDIU_32_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_48_(uint64 instruction)
+static std::string ADDIU_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -2019,7 +2019,7 @@ std::string NMD::ADDIU_48_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP48_(uint64 instruction)
+static std::string ADDIU_GP48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -2040,7 +2040,7 @@ std::string NMD::ADDIU_GP48_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP_B_(uint64 instruction)
+static std::string ADDIU_GP_B_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -2061,7 +2061,7 @@ std::string NMD::ADDIU_GP_B_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP_W_(uint64 instruction)
+static std::string ADDIU_GP_W_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -2082,7 +2082,7 @@ std::string NMD::ADDIU_GP_W_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_NEG_(uint64 instruction)
+static std::string ADDIU_NEG_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2105,7 +2105,7 @@ std::string NMD::ADDIU_NEG_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_R1_SP_(uint64 instruction)
+static std::string ADDIU_R1_SP_(uint64 instruction)
 {
     uint64 u_value = extract_u_5_4_3_2_1_0__s2(instruction);
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
@@ -2126,7 +2126,7 @@ std::string NMD::ADDIU_R1_SP_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_R2_(uint64 instruction)
+static std::string ADDIU_R2_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2148,7 +2148,7 @@ std::string NMD::ADDIU_R2_(uint64 instruction)
  *     rt -----
  *           s - ---
  */
-std::string NMD::ADDIU_RS5_(uint64 instruction)
+static std::string ADDIU_RS5_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
@@ -2170,7 +2170,7 @@ std::string NMD::ADDIU_RS5_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDIUPC_32_(uint64 instruction)
+static std::string ADDIUPC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
@@ -2192,7 +2192,7 @@ std::string NMD::ADDIUPC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDIUPC_48_(uint64 instruction)
+static std::string ADDIUPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -2214,7 +2214,7 @@ std::string NMD::ADDIUPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_PH(uint64 instruction)
+static std::string ADDQ_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2239,7 +2239,7 @@ std::string NMD::ADDQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_S_PH(uint64 instruction)
+static std::string ADDQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2263,7 +2263,7 @@ std::string NMD::ADDQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_S_W(uint64 instruction)
+static std::string ADDQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2288,7 +2288,7 @@ std::string NMD::ADDQ_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_PH(uint64 instruction)
+static std::string ADDQH_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2313,7 +2313,7 @@ std::string NMD::ADDQH_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_R_PH(uint64 instruction)
+static std::string ADDQH_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2338,7 +2338,7 @@ std::string NMD::ADDQH_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_R_W(uint64 instruction)
+static std::string ADDQH_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2363,7 +2363,7 @@ std::string NMD::ADDQH_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_W(uint64 instruction)
+static std::string ADDQH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2387,7 +2387,7 @@ std::string NMD::ADDQH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDSC(uint64 instruction)
+static std::string ADDSC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2410,7 +2410,7 @@ std::string NMD::ADDSC(uint64 instruction)
  *       rs3 ---
  *          rd3 ---
  */
-std::string NMD::ADDU_16_(uint64 instruction)
+static std::string ADDU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2434,7 +2434,7 @@ std::string NMD::ADDU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_32_(uint64 instruction)
+static std::string ADDU_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2458,7 +2458,7 @@ std::string NMD::ADDU_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_4X4_(uint64 instruction)
+static std::string ADDU_4X4_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -2480,7 +2480,7 @@ std::string NMD::ADDU_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_PH(uint64 instruction)
+static std::string ADDU_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2504,7 +2504,7 @@ std::string NMD::ADDU_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_QB(uint64 instruction)
+static std::string ADDU_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2529,7 +2529,7 @@ std::string NMD::ADDU_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_S_PH(uint64 instruction)
+static std::string ADDU_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2553,7 +2553,7 @@ std::string NMD::ADDU_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_S_QB(uint64 instruction)
+static std::string ADDU_S_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2578,7 +2578,7 @@ std::string NMD::ADDU_S_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDUH_QB(uint64 instruction)
+static std::string ADDUH_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2603,7 +2603,7 @@ std::string NMD::ADDUH_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDUH_R_QB(uint64 instruction)
+static std::string ADDUH_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2626,7 +2626,7 @@ std::string NMD::ADDUH_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDWC(uint64 instruction)
+static std::string ADDWC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2650,7 +2650,7 @@ std::string NMD::ADDWC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ALUIPC(uint64 instruction)
+static std::string ALUIPC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
@@ -2671,7 +2671,7 @@ std::string NMD::ALUIPC(uint64 instruction)
  *       rs3 ---
  *           eu ----
  */
-std::string NMD::AND_16_(uint64 instruction)
+static std::string AND_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2693,7 +2693,7 @@ std::string NMD::AND_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::AND_32_(uint64 instruction)
+static std::string AND_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2716,7 +2716,7 @@ std::string NMD::AND_32_(uint64 instruction)
  *       rs3 ---
  *           eu ----
  */
-std::string NMD::ANDI_16_(uint64 instruction)
+static std::string ANDI_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2740,7 +2740,7 @@ std::string NMD::ANDI_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ANDI_32_(uint64 instruction)
+static std::string ANDI_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2764,7 +2764,7 @@ std::string NMD::ANDI_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::APPEND(uint64 instruction)
+static std::string APPEND(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2788,7 +2788,7 @@ std::string NMD::APPEND(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ASET(uint64 instruction)
+static std::string ASET(uint64 instruction)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2812,7 +2812,7 @@ std::string NMD::ASET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALC_16_(uint64 instruction)
+static std::string BALC_16_(uint64 instruction)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
@@ -2832,7 +2832,7 @@ std::string NMD::BALC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALC_32_(uint64 instruction)
+static std::string BALC_32_(uint64 instruction)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
@@ -2852,7 +2852,7 @@ std::string NMD::BALC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALRSC(uint64 instruction)
+static std::string BALRSC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2874,7 +2874,7 @@ std::string NMD::BALRSC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BBEQZC(uint64 instruction)
+static std::string BBEQZC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
@@ -2898,7 +2898,7 @@ std::string NMD::BBEQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BBNEZC(uint64 instruction)
+static std::string BBNEZC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
@@ -2922,7 +2922,7 @@ std::string NMD::BBNEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC_16_(uint64 instruction)
+static std::string BC_16_(uint64 instruction)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
@@ -2942,7 +2942,7 @@ std::string NMD::BC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC_32_(uint64 instruction)
+static std::string BC_32_(uint64 instruction)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
@@ -2962,7 +2962,7 @@ std::string NMD::BC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC1EQZC(uint64 instruction)
+static std::string BC1EQZC(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
@@ -2984,7 +2984,7 @@ std::string NMD::BC1EQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC1NEZC(uint64 instruction)
+static std::string BC1NEZC(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
@@ -3006,7 +3006,7 @@ std::string NMD::BC1NEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC2EQZC(uint64 instruction)
+static std::string BC2EQZC(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
@@ -3028,7 +3028,7 @@ std::string NMD::BC2EQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC2NEZC(uint64 instruction)
+static std::string BC2NEZC(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
@@ -3050,7 +3050,7 @@ std::string NMD::BC2NEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQC_16_(uint64 instruction)
+static std::string BEQC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -3074,7 +3074,7 @@ std::string NMD::BEQC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQC_32_(uint64 instruction)
+static std::string BEQC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3098,7 +3098,7 @@ std::string NMD::BEQC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQIC(uint64 instruction)
+static std::string BEQIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3122,7 +3122,7 @@ std::string NMD::BEQIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQZC_16_(uint64 instruction)
+static std::string BEQZC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
@@ -3144,7 +3144,7 @@ std::string NMD::BEQZC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEC(uint64 instruction)
+static std::string BGEC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3168,7 +3168,7 @@ std::string NMD::BGEC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEIC(uint64 instruction)
+static std::string BGEIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3192,7 +3192,7 @@ std::string NMD::BGEIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEIUC(uint64 instruction)
+static std::string BGEIUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3216,7 +3216,7 @@ std::string NMD::BGEIUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEUC(uint64 instruction)
+static std::string BGEUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3240,7 +3240,7 @@ std::string NMD::BGEUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTC(uint64 instruction)
+static std::string BLTC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3264,7 +3264,7 @@ std::string NMD::BLTC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTIC(uint64 instruction)
+static std::string BLTIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3288,7 +3288,7 @@ std::string NMD::BLTIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTIUC(uint64 instruction)
+static std::string BLTIUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3312,7 +3312,7 @@ std::string NMD::BLTIUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTUC(uint64 instruction)
+static std::string BLTUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3336,7 +3336,7 @@ std::string NMD::BLTUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEC_16_(uint64 instruction)
+static std::string BNEC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -3360,7 +3360,7 @@ std::string NMD::BNEC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEC_32_(uint64 instruction)
+static std::string BNEC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3384,7 +3384,7 @@ std::string NMD::BNEC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEIC(uint64 instruction)
+static std::string BNEIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3408,7 +3408,7 @@ std::string NMD::BNEIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEZC_16_(uint64 instruction)
+static std::string BNEZC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
@@ -3430,7 +3430,7 @@ std::string NMD::BNEZC_16_(uint64 instruction)
  *            s[13:1] -------------
  *                           s[14] -
  */
-std::string NMD::BPOSGE32C(uint64 instruction)
+static std::string BPOSGE32C(uint64 instruction)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
@@ -3450,7 +3450,7 @@ std::string NMD::BPOSGE32C(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BREAK_16_(uint64 instruction)
+static std::string BREAK_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
@@ -3470,7 +3470,7 @@ std::string NMD::BREAK_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BREAK_32_(uint64 instruction)
+static std::string BREAK_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -3490,7 +3490,7 @@ std::string NMD::BREAK_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BRSC(uint64 instruction)
+static std::string BRSC(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
@@ -3510,7 +3510,7 @@ std::string NMD::BRSC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CACHE(uint64 instruction)
+static std::string CACHE(uint64 instruction)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3534,7 +3534,7 @@ std::string NMD::CACHE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CACHEE(uint64 instruction)
+static std::string CACHEE(uint64 instruction)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3558,7 +3558,7 @@ std::string NMD::CACHEE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_L_D(uint64 instruction)
+static std::string CEIL_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3580,7 +3580,7 @@ std::string NMD::CEIL_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_L_S(uint64 instruction)
+static std::string CEIL_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3602,7 +3602,7 @@ std::string NMD::CEIL_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_W_D(uint64 instruction)
+static std::string CEIL_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3624,7 +3624,7 @@ std::string NMD::CEIL_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_W_S(uint64 instruction)
+static std::string CEIL_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3646,7 +3646,7 @@ std::string NMD::CEIL_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CFC1(uint64 instruction)
+static std::string CFC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -3668,7 +3668,7 @@ std::string NMD::CFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CFC2(uint64 instruction)
+static std::string CFC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -3690,7 +3690,7 @@ std::string NMD::CFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLASS_D(uint64 instruction)
+static std::string CLASS_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3712,7 +3712,7 @@ std::string NMD::CLASS_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLASS_S(uint64 instruction)
+static std::string CLASS_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3734,7 +3734,7 @@ std::string NMD::CLASS_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLO(uint64 instruction)
+static std::string CLO(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3756,7 +3756,7 @@ std::string NMD::CLO(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLZ(uint64 instruction)
+static std::string CLZ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3778,7 +3778,7 @@ std::string NMD::CLZ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_AF_D(uint64 instruction)
+static std::string CMP_AF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3802,7 +3802,7 @@ std::string NMD::CMP_AF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_AF_S(uint64 instruction)
+static std::string CMP_AF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3826,7 +3826,7 @@ std::string NMD::CMP_AF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_EQ_D(uint64 instruction)
+static std::string CMP_EQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3849,7 +3849,7 @@ std::string NMD::CMP_EQ_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_EQ_PH(uint64 instruction)
+static std::string CMP_EQ_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3871,7 +3871,7 @@ std::string NMD::CMP_EQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_EQ_S(uint64 instruction)
+static std::string CMP_EQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3895,7 +3895,7 @@ std::string NMD::CMP_EQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LE_D(uint64 instruction)
+static std::string CMP_LE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3918,7 +3918,7 @@ std::string NMD::CMP_LE_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_LE_PH(uint64 instruction)
+static std::string CMP_LE_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3940,7 +3940,7 @@ std::string NMD::CMP_LE_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LE_S(uint64 instruction)
+static std::string CMP_LE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3964,7 +3964,7 @@ std::string NMD::CMP_LE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LT_D(uint64 instruction)
+static std::string CMP_LT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3987,7 +3987,7 @@ std::string NMD::CMP_LT_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_LT_PH(uint64 instruction)
+static std::string CMP_LT_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4009,7 +4009,7 @@ std::string NMD::CMP_LT_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LT_S(uint64 instruction)
+static std::string CMP_LT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4033,7 +4033,7 @@ std::string NMD::CMP_LT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_NE_D(uint64 instruction)
+static std::string CMP_NE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4057,7 +4057,7 @@ std::string NMD::CMP_NE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_NE_S(uint64 instruction)
+static std::string CMP_NE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4081,7 +4081,7 @@ std::string NMD::CMP_NE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_OR_D(uint64 instruction)
+static std::string CMP_OR_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4105,7 +4105,7 @@ std::string NMD::CMP_OR_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_OR_S(uint64 instruction)
+static std::string CMP_OR_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4129,7 +4129,7 @@ std::string NMD::CMP_OR_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SAF_D(uint64 instruction)
+static std::string CMP_SAF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4153,7 +4153,7 @@ std::string NMD::CMP_SAF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SAF_S(uint64 instruction)
+static std::string CMP_SAF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4177,7 +4177,7 @@ std::string NMD::CMP_SAF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SEQ_D(uint64 instruction)
+static std::string CMP_SEQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4201,7 +4201,7 @@ std::string NMD::CMP_SEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SEQ_S(uint64 instruction)
+static std::string CMP_SEQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4225,7 +4225,7 @@ std::string NMD::CMP_SEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLE_D(uint64 instruction)
+static std::string CMP_SLE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4249,7 +4249,7 @@ std::string NMD::CMP_SLE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLE_S(uint64 instruction)
+static std::string CMP_SLE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4273,7 +4273,7 @@ std::string NMD::CMP_SLE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLT_D(uint64 instruction)
+static std::string CMP_SLT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4297,7 +4297,7 @@ std::string NMD::CMP_SLT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLT_S(uint64 instruction)
+static std::string CMP_SLT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4321,7 +4321,7 @@ std::string NMD::CMP_SLT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SNE_D(uint64 instruction)
+static std::string CMP_SNE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4345,7 +4345,7 @@ std::string NMD::CMP_SNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SNE_S(uint64 instruction)
+static std::string CMP_SNE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4369,7 +4369,7 @@ std::string NMD::CMP_SNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SOR_D(uint64 instruction)
+static std::string CMP_SOR_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4393,7 +4393,7 @@ std::string NMD::CMP_SOR_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SOR_S(uint64 instruction)
+static std::string CMP_SOR_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4417,7 +4417,7 @@ std::string NMD::CMP_SOR_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUEQ_D(uint64 instruction)
+static std::string CMP_SUEQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4441,7 +4441,7 @@ std::string NMD::CMP_SUEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUEQ_S(uint64 instruction)
+static std::string CMP_SUEQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4465,7 +4465,7 @@ std::string NMD::CMP_SUEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULE_D(uint64 instruction)
+static std::string CMP_SULE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4489,7 +4489,7 @@ std::string NMD::CMP_SULE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULE_S(uint64 instruction)
+static std::string CMP_SULE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4513,7 +4513,7 @@ std::string NMD::CMP_SULE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULT_D(uint64 instruction)
+static std::string CMP_SULT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4537,7 +4537,7 @@ std::string NMD::CMP_SULT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULT_S(uint64 instruction)
+static std::string CMP_SULT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4561,7 +4561,7 @@ std::string NMD::CMP_SULT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUN_D(uint64 instruction)
+static std::string CMP_SUN_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4585,7 +4585,7 @@ std::string NMD::CMP_SUN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUNE_D(uint64 instruction)
+static std::string CMP_SUNE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4609,7 +4609,7 @@ std::string NMD::CMP_SUNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUNE_S(uint64 instruction)
+static std::string CMP_SUNE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4633,7 +4633,7 @@ std::string NMD::CMP_SUNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUN_S(uint64 instruction)
+static std::string CMP_SUN_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4657,7 +4657,7 @@ std::string NMD::CMP_SUN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UEQ_D(uint64 instruction)
+static std::string CMP_UEQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4681,7 +4681,7 @@ std::string NMD::CMP_UEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UEQ_S(uint64 instruction)
+static std::string CMP_UEQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4705,7 +4705,7 @@ std::string NMD::CMP_UEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULE_D(uint64 instruction)
+static std::string CMP_ULE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4729,7 +4729,7 @@ std::string NMD::CMP_ULE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULE_S(uint64 instruction)
+static std::string CMP_ULE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4753,7 +4753,7 @@ std::string NMD::CMP_ULE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULT_D(uint64 instruction)
+static std::string CMP_ULT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4777,7 +4777,7 @@ std::string NMD::CMP_ULT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULT_S(uint64 instruction)
+static std::string CMP_ULT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4801,7 +4801,7 @@ std::string NMD::CMP_ULT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UN_D(uint64 instruction)
+static std::string CMP_UN_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4825,7 +4825,7 @@ std::string NMD::CMP_UN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UNE_D(uint64 instruction)
+static std::string CMP_UNE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4849,7 +4849,7 @@ std::string NMD::CMP_UNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UNE_S(uint64 instruction)
+static std::string CMP_UNE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4873,7 +4873,7 @@ std::string NMD::CMP_UNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UN_S(uint64 instruction)
+static std::string CMP_UN_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4898,7 +4898,7 @@ std::string NMD::CMP_UN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_EQ_QB(uint64 instruction)
+static std::string CMPGDU_EQ_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4923,7 +4923,7 @@ std::string NMD::CMPGDU_EQ_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_LE_QB(uint64 instruction)
+static std::string CMPGDU_LE_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4948,7 +4948,7 @@ std::string NMD::CMPGDU_LE_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_LT_QB(uint64 instruction)
+static std::string CMPGDU_LT_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4973,7 +4973,7 @@ std::string NMD::CMPGDU_LT_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_EQ_QB(uint64 instruction)
+static std::string CMPGU_EQ_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4998,7 +4998,7 @@ std::string NMD::CMPGU_EQ_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_LE_QB(uint64 instruction)
+static std::string CMPGU_LE_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5023,7 +5023,7 @@ std::string NMD::CMPGU_LE_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_LT_QB(uint64 instruction)
+static std::string CMPGU_LT_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5047,7 +5047,7 @@ std::string NMD::CMPGU_LT_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_EQ_QB(uint64 instruction)
+static std::string CMPU_EQ_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5069,7 +5069,7 @@ std::string NMD::CMPU_EQ_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_LE_QB(uint64 instruction)
+static std::string CMPU_LE_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5091,7 +5091,7 @@ std::string NMD::CMPU_LE_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_LT_QB(uint64 instruction)
+static std::string CMPU_LT_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5113,7 +5113,7 @@ std::string NMD::CMPU_LT_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::COP2_1(uint64 instruction)
+static std::string COP2_1(uint64 instruction)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
@@ -5133,7 +5133,7 @@ std::string NMD::COP2_1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CTC1(uint64 instruction)
+static std::string CTC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -5155,7 +5155,7 @@ std::string NMD::CTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CTC2(uint64 instruction)
+static std::string CTC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -5177,7 +5177,7 @@ std::string NMD::CTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_L(uint64 instruction)
+static std::string CVT_D_L(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5199,7 +5199,7 @@ std::string NMD::CVT_D_L(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_S(uint64 instruction)
+static std::string CVT_D_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5221,7 +5221,7 @@ std::string NMD::CVT_D_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_W(uint64 instruction)
+static std::string CVT_D_W(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5243,7 +5243,7 @@ std::string NMD::CVT_D_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_L_D(uint64 instruction)
+static std::string CVT_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5265,7 +5265,7 @@ std::string NMD::CVT_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_L_S(uint64 instruction)
+static std::string CVT_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5287,7 +5287,7 @@ std::string NMD::CVT_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_D(uint64 instruction)
+static std::string CVT_S_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5309,7 +5309,7 @@ std::string NMD::CVT_S_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_L(uint64 instruction)
+static std::string CVT_S_L(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5331,7 +5331,7 @@ std::string NMD::CVT_S_L(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_PL(uint64 instruction)
+static std::string CVT_S_PL(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5353,7 +5353,7 @@ std::string NMD::CVT_S_PL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_PU(uint64 instruction)
+static std::string CVT_S_PU(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5375,7 +5375,7 @@ std::string NMD::CVT_S_PU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_W(uint64 instruction)
+static std::string CVT_S_W(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5397,7 +5397,7 @@ std::string NMD::CVT_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_W_D(uint64 instruction)
+static std::string CVT_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5419,7 +5419,7 @@ std::string NMD::CVT_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_W_S(uint64 instruction)
+static std::string CVT_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5441,7 +5441,7 @@ std::string NMD::CVT_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_48_(uint64 instruction)
+static std::string DADDIU_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -5463,7 +5463,7 @@ std::string NMD::DADDIU_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_NEG_(uint64 instruction)
+static std::string DADDIU_NEG_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5487,7 +5487,7 @@ std::string NMD::DADDIU_NEG_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_U12_(uint64 instruction)
+static std::string DADDIU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5511,7 +5511,7 @@ std::string NMD::DADDIU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADD(uint64 instruction)
+static std::string DADD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5535,7 +5535,7 @@ std::string NMD::DADD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDU(uint64 instruction)
+static std::string DADDU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5559,7 +5559,7 @@ std::string NMD::DADDU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DCLO(uint64 instruction)
+static std::string DCLO(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5581,7 +5581,7 @@ std::string NMD::DCLO(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DCLZ(uint64 instruction)
+static std::string DCLZ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5603,7 +5603,7 @@ std::string NMD::DCLZ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DDIV(uint64 instruction)
+static std::string DDIV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5627,7 +5627,7 @@ std::string NMD::DDIV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DDIVU(uint64 instruction)
+static std::string DDIVU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5651,7 +5651,7 @@ std::string NMD::DDIVU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DERET(uint64 instruction)
+static std::string DERET(uint64 instruction)
 {
     (void)instruction;
 
@@ -5669,7 +5669,7 @@ std::string NMD::DERET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXTM(uint64 instruction)
+static std::string DEXTM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5695,7 +5695,7 @@ std::string NMD::DEXTM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXT(uint64 instruction)
+static std::string DEXT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5721,7 +5721,7 @@ std::string NMD::DEXT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXTU(uint64 instruction)
+static std::string DEXTU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5747,7 +5747,7 @@ std::string NMD::DEXTU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINSM(uint64 instruction)
+static std::string DINSM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5775,7 +5775,7 @@ std::string NMD::DINSM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINS(uint64 instruction)
+static std::string DINS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5803,7 +5803,7 @@ std::string NMD::DINS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINSU(uint64 instruction)
+static std::string DINSU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5831,7 +5831,7 @@ std::string NMD::DINSU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DI(uint64 instruction)
+static std::string DI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -5851,7 +5851,7 @@ std::string NMD::DI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV(uint64 instruction)
+static std::string DIV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5875,7 +5875,7 @@ std::string NMD::DIV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV_D(uint64 instruction)
+static std::string DIV_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5899,7 +5899,7 @@ std::string NMD::DIV_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV_S(uint64 instruction)
+static std::string DIV_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5923,7 +5923,7 @@ std::string NMD::DIV_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIVU(uint64 instruction)
+static std::string DIVU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5947,7 +5947,7 @@ std::string NMD::DIVU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DLSA(uint64 instruction)
+static std::string DLSA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5973,7 +5973,7 @@ std::string NMD::DLSA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DLUI_48_(uint64 instruction)
+static std::string DLUI_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
@@ -5995,7 +5995,7 @@ std::string NMD::DLUI_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC0(uint64 instruction)
+static std::string DMFC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6019,7 +6019,7 @@ std::string NMD::DMFC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC1(uint64 instruction)
+static std::string DMFC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -6041,7 +6041,7 @@ std::string NMD::DMFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC2(uint64 instruction)
+static std::string DMFC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -6063,7 +6063,7 @@ std::string NMD::DMFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFGC0(uint64 instruction)
+static std::string DMFGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6087,7 +6087,7 @@ std::string NMD::DMFGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMOD(uint64 instruction)
+static std::string DMOD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6111,7 +6111,7 @@ std::string NMD::DMOD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMODU(uint64 instruction)
+static std::string DMODU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6135,7 +6135,7 @@ std::string NMD::DMODU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC0(uint64 instruction)
+static std::string DMTC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6159,7 +6159,7 @@ std::string NMD::DMTC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC1(uint64 instruction)
+static std::string DMTC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -6181,7 +6181,7 @@ std::string NMD::DMTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC2(uint64 instruction)
+static std::string DMTC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -6203,7 +6203,7 @@ std::string NMD::DMTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTGC0(uint64 instruction)
+static std::string DMTGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6227,7 +6227,7 @@ std::string NMD::DMTGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMT(uint64 instruction)
+static std::string DMT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -6247,7 +6247,7 @@ std::string NMD::DMT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUH(uint64 instruction)
+static std::string DMUH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6271,7 +6271,7 @@ std::string NMD::DMUH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUHU(uint64 instruction)
+static std::string DMUHU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6295,7 +6295,7 @@ std::string NMD::DMUHU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUL(uint64 instruction)
+static std::string DMUL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6319,7 +6319,7 @@ std::string NMD::DMUL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMULU(uint64 instruction)
+static std::string DMULU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6344,7 +6344,7 @@ std::string NMD::DMULU(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::DPA_W_PH(uint64 instruction)
+static std::string DPA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6368,7 +6368,7 @@ std::string NMD::DPA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQ_SA_L_W(uint64 instruction)
+static std::string DPAQ_SA_L_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6392,7 +6392,7 @@ std::string NMD::DPAQ_SA_L_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQ_S_W_PH(uint64 instruction)
+static std::string DPAQ_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6416,7 +6416,7 @@ std::string NMD::DPAQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQX_SA_W_PH(uint64 instruction)
+static std::string DPAQX_SA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6440,7 +6440,7 @@ std::string NMD::DPAQX_SA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQX_S_W_PH(uint64 instruction)
+static std::string DPAQX_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6464,7 +6464,7 @@ std::string NMD::DPAQX_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAU_H_QBL(uint64 instruction)
+static std::string DPAU_H_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6488,7 +6488,7 @@ std::string NMD::DPAU_H_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAU_H_QBR(uint64 instruction)
+static std::string DPAU_H_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6512,7 +6512,7 @@ std::string NMD::DPAU_H_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAX_W_PH(uint64 instruction)
+static std::string DPAX_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6536,7 +6536,7 @@ std::string NMD::DPAX_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPS_W_PH(uint64 instruction)
+static std::string DPS_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6560,7 +6560,7 @@ std::string NMD::DPS_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQ_SA_L_W(uint64 instruction)
+static std::string DPSQ_SA_L_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6584,7 +6584,7 @@ std::string NMD::DPSQ_SA_L_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQ_S_W_PH(uint64 instruction)
+static std::string DPSQ_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6608,7 +6608,7 @@ std::string NMD::DPSQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQX_SA_W_PH(uint64 instruction)
+static std::string DPSQX_SA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6632,7 +6632,7 @@ std::string NMD::DPSQX_SA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQX_S_W_PH(uint64 instruction)
+static std::string DPSQX_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6656,7 +6656,7 @@ std::string NMD::DPSQX_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSU_H_QBL(uint64 instruction)
+static std::string DPSU_H_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6680,7 +6680,7 @@ std::string NMD::DPSU_H_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSU_H_QBR(uint64 instruction)
+static std::string DPSU_H_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6704,7 +6704,7 @@ std::string NMD::DPSU_H_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSX_W_PH(uint64 instruction)
+static std::string DPSX_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6728,7 +6728,7 @@ std::string NMD::DPSX_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTR(uint64 instruction)
+static std::string DROTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6752,7 +6752,7 @@ std::string NMD::DROTR(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DROTR32(uint64 instruction)
+static std::string DROTR32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6776,7 +6776,7 @@ std::string NMD::DROTR32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTRV(uint64 instruction)
+static std::string DROTRV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6800,7 +6800,7 @@ std::string NMD::DROTRV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTX(uint64 instruction)
+static std::string DROTX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6826,7 +6826,7 @@ std::string NMD::DROTX(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSLL(uint64 instruction)
+static std::string DSLL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6850,7 +6850,7 @@ std::string NMD::DSLL(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSLL32(uint64 instruction)
+static std::string DSLL32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6874,7 +6874,7 @@ std::string NMD::DSLL32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSLLV(uint64 instruction)
+static std::string DSLLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6898,7 +6898,7 @@ std::string NMD::DSLLV(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRA(uint64 instruction)
+static std::string DSRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6922,7 +6922,7 @@ std::string NMD::DSRA(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRA32(uint64 instruction)
+static std::string DSRA32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6946,7 +6946,7 @@ std::string NMD::DSRA32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSRAV(uint64 instruction)
+static std::string DSRAV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6970,7 +6970,7 @@ std::string NMD::DSRAV(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRL(uint64 instruction)
+static std::string DSRL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6994,7 +6994,7 @@ std::string NMD::DSRL(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRL32(uint64 instruction)
+static std::string DSRL32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7018,7 +7018,7 @@ std::string NMD::DSRL32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSRLV(uint64 instruction)
+static std::string DSRLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7042,7 +7042,7 @@ std::string NMD::DSRLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSUB(uint64 instruction)
+static std::string DSUB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7066,7 +7066,7 @@ std::string NMD::DSUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSUBU(uint64 instruction)
+static std::string DSUBU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7090,7 +7090,7 @@ std::string NMD::DSUBU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DVPE(uint64 instruction)
+static std::string DVPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7110,7 +7110,7 @@ std::string NMD::DVPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DVP(uint64 instruction)
+static std::string DVP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7130,7 +7130,7 @@ std::string NMD::DVP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EHB(uint64 instruction)
+static std::string EHB(uint64 instruction)
 {
     (void)instruction;
 
@@ -7148,7 +7148,7 @@ std::string NMD::EHB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EI(uint64 instruction)
+static std::string EI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7168,7 +7168,7 @@ std::string NMD::EI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EMT(uint64 instruction)
+static std::string EMT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7188,7 +7188,7 @@ std::string NMD::EMT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ERET(uint64 instruction)
+static std::string ERET(uint64 instruction)
 {
     (void)instruction;
 
@@ -7206,7 +7206,7 @@ std::string NMD::ERET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ERETNC(uint64 instruction)
+static std::string ERETNC(uint64 instruction)
 {
     (void)instruction;
 
@@ -7224,7 +7224,7 @@ std::string NMD::ERETNC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EVP(uint64 instruction)
+static std::string EVP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7244,7 +7244,7 @@ std::string NMD::EVP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EVPE(uint64 instruction)
+static std::string EVPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7264,7 +7264,7 @@ std::string NMD::EVPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXT(uint64 instruction)
+static std::string EXT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7290,7 +7290,7 @@ std::string NMD::EXT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTD(uint64 instruction)
+static std::string EXTD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7316,7 +7316,7 @@ std::string NMD::EXTD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTD32(uint64 instruction)
+static std::string EXTD32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7342,7 +7342,7 @@ std::string NMD::EXTD32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPDP(uint64 instruction)
+static std::string EXTPDP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
@@ -7366,7 +7366,7 @@ std::string NMD::EXTPDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPDPV(uint64 instruction)
+static std::string EXTPDPV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7390,7 +7390,7 @@ std::string NMD::EXTPDPV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTP(uint64 instruction)
+static std::string EXTP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
@@ -7414,7 +7414,7 @@ std::string NMD::EXTP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPV(uint64 instruction)
+static std::string EXTPV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7439,7 +7439,7 @@ std::string NMD::EXTPV(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_RS_W(uint64 instruction)
+static std::string EXTR_RS_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7464,7 +7464,7 @@ std::string NMD::EXTR_RS_W(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_R_W(uint64 instruction)
+static std::string EXTR_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7489,7 +7489,7 @@ std::string NMD::EXTR_R_W(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_S_H(uint64 instruction)
+static std::string EXTR_S_H(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7514,7 +7514,7 @@ std::string NMD::EXTR_S_H(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_W(uint64 instruction)
+static std::string EXTR_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7539,7 +7539,7 @@ std::string NMD::EXTR_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_RS_W(uint64 instruction)
+static std::string EXTRV_RS_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7564,7 +7564,7 @@ std::string NMD::EXTRV_RS_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_R_W(uint64 instruction)
+static std::string EXTRV_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7589,7 +7589,7 @@ std::string NMD::EXTRV_R_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_S_H(uint64 instruction)
+static std::string EXTRV_S_H(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7614,7 +7614,7 @@ std::string NMD::EXTRV_S_H(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_W(uint64 instruction)
+static std::string EXTRV_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7639,7 +7639,7 @@ std::string NMD::EXTRV_W(uint64 instruction)
  *               rd -----
  *                 shift -----
  */
-std::string NMD::EXTW(uint64 instruction)
+static std::string EXTW(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7665,7 +7665,7 @@ std::string NMD::EXTW(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_L_D(uint64 instruction)
+static std::string FLOOR_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7687,7 +7687,7 @@ std::string NMD::FLOOR_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_L_S(uint64 instruction)
+static std::string FLOOR_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7709,7 +7709,7 @@ std::string NMD::FLOOR_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_W_D(uint64 instruction)
+static std::string FLOOR_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7731,7 +7731,7 @@ std::string NMD::FLOOR_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_W_S(uint64 instruction)
+static std::string FLOOR_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7753,7 +7753,7 @@ std::string NMD::FLOOR_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FORK(uint64 instruction)
+static std::string FORK(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7777,7 +7777,7 @@ std::string NMD::FORK(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::HYPCALL(uint64 instruction)
+static std::string HYPCALL(uint64 instruction)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
@@ -7797,7 +7797,7 @@ std::string NMD::HYPCALL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::HYPCALL_16_(uint64 instruction)
+static std::string HYPCALL_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
@@ -7817,7 +7817,7 @@ std::string NMD::HYPCALL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::INS(uint64 instruction)
+static std::string INS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7844,7 +7844,7 @@ std::string NMD::INS(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::INSV(uint64 instruction)
+static std::string INSV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7866,7 +7866,7 @@ std::string NMD::INSV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::IRET(uint64 instruction)
+static std::string IRET(uint64 instruction)
 {
     (void)instruction;
 
@@ -7884,7 +7884,7 @@ std::string NMD::IRET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_16_(uint64 instruction)
+static std::string JALRC_16_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
@@ -7904,7 +7904,7 @@ std::string NMD::JALRC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_32_(uint64 instruction)
+static std::string JALRC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7926,7 +7926,7 @@ std::string NMD::JALRC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_HB(uint64 instruction)
+static std::string JALRC_HB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7948,7 +7948,7 @@ std::string NMD::JALRC_HB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JRC(uint64 instruction)
+static std::string JRC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
@@ -7968,7 +7968,7 @@ std::string NMD::JRC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_16_(uint64 instruction)
+static std::string LB_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -7992,7 +7992,7 @@ std::string NMD::LB_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_GP_(uint64 instruction)
+static std::string LB_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -8014,7 +8014,7 @@ std::string NMD::LB_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_S9_(uint64 instruction)
+static std::string LB_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8038,7 +8038,7 @@ std::string NMD::LB_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_U12_(uint64 instruction)
+static std::string LB_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8062,7 +8062,7 @@ std::string NMD::LB_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBE(uint64 instruction)
+static std::string LBE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8086,7 +8086,7 @@ std::string NMD::LBE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_16_(uint64 instruction)
+static std::string LBU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8110,7 +8110,7 @@ std::string NMD::LBU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_GP_(uint64 instruction)
+static std::string LBU_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -8132,7 +8132,7 @@ std::string NMD::LBU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_S9_(uint64 instruction)
+static std::string LBU_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8156,7 +8156,7 @@ std::string NMD::LBU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_U12_(uint64 instruction)
+static std::string LBU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8180,7 +8180,7 @@ std::string NMD::LBU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBUE(uint64 instruction)
+static std::string LBUE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8204,7 +8204,7 @@ std::string NMD::LBUE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBUX(uint64 instruction)
+static std::string LBUX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8228,7 +8228,7 @@ std::string NMD::LBUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBX(uint64 instruction)
+static std::string LBX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8252,7 +8252,7 @@ std::string NMD::LBX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_GP_(uint64 instruction)
+static std::string LD_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
@@ -8274,7 +8274,7 @@ std::string NMD::LD_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_S9_(uint64 instruction)
+static std::string LD_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8298,7 +8298,7 @@ std::string NMD::LD_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_U12_(uint64 instruction)
+static std::string LD_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8322,7 +8322,7 @@ std::string NMD::LD_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_GP_(uint64 instruction)
+static std::string LDC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -8344,7 +8344,7 @@ std::string NMD::LDC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_S9_(uint64 instruction)
+static std::string LDC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8368,7 +8368,7 @@ std::string NMD::LDC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_U12_(uint64 instruction)
+static std::string LDC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8392,7 +8392,7 @@ std::string NMD::LDC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1XS(uint64 instruction)
+static std::string LDC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8416,7 +8416,7 @@ std::string NMD::LDC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1X(uint64 instruction)
+static std::string LDC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8440,7 +8440,7 @@ std::string NMD::LDC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC2(uint64 instruction)
+static std::string LDC2(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8464,7 +8464,7 @@ std::string NMD::LDC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDM(uint64 instruction)
+static std::string LDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8490,7 +8490,7 @@ std::string NMD::LDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDPC_48_(uint64 instruction)
+static std::string LDPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -8512,7 +8512,7 @@ std::string NMD::LDPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDX(uint64 instruction)
+static std::string LDX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8536,7 +8536,7 @@ std::string NMD::LDX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDXS(uint64 instruction)
+static std::string LDXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8560,7 +8560,7 @@ std::string NMD::LDXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_16_(uint64 instruction)
+static std::string LH_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8584,7 +8584,7 @@ std::string NMD::LH_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_GP_(uint64 instruction)
+static std::string LH_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -8606,7 +8606,7 @@ std::string NMD::LH_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_S9_(uint64 instruction)
+static std::string LH_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8630,7 +8630,7 @@ std::string NMD::LH_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_U12_(uint64 instruction)
+static std::string LH_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8654,7 +8654,7 @@ std::string NMD::LH_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHE(uint64 instruction)
+static std::string LHE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8678,7 +8678,7 @@ std::string NMD::LHE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_16_(uint64 instruction)
+static std::string LHU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8702,7 +8702,7 @@ std::string NMD::LHU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_GP_(uint64 instruction)
+static std::string LHU_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -8724,7 +8724,7 @@ std::string NMD::LHU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_S9_(uint64 instruction)
+static std::string LHU_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8748,7 +8748,7 @@ std::string NMD::LHU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_U12_(uint64 instruction)
+static std::string LHU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8772,7 +8772,7 @@ std::string NMD::LHU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUE(uint64 instruction)
+static std::string LHUE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8796,7 +8796,7 @@ std::string NMD::LHUE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUX(uint64 instruction)
+static std::string LHUX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8820,7 +8820,7 @@ std::string NMD::LHUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUXS(uint64 instruction)
+static std::string LHUXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8844,7 +8844,7 @@ std::string NMD::LHUXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHXS(uint64 instruction)
+static std::string LHXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8868,7 +8868,7 @@ std::string NMD::LHXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHX(uint64 instruction)
+static std::string LHX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8892,7 +8892,7 @@ std::string NMD::LHX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LI_16_(uint64 instruction)
+static std::string LI_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
@@ -8914,7 +8914,7 @@ std::string NMD::LI_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LI_48_(uint64 instruction)
+static std::string LI_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -8936,7 +8936,7 @@ std::string NMD::LI_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LL(uint64 instruction)
+static std::string LL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8960,7 +8960,7 @@ std::string NMD::LL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLD(uint64 instruction)
+static std::string LLD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8984,7 +8984,7 @@ std::string NMD::LLD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLDP(uint64 instruction)
+static std::string LLDP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9008,7 +9008,7 @@ std::string NMD::LLDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLE(uint64 instruction)
+static std::string LLE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9032,7 +9032,7 @@ std::string NMD::LLE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLWP(uint64 instruction)
+static std::string LLWP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9056,7 +9056,7 @@ std::string NMD::LLWP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLWPE(uint64 instruction)
+static std::string LLWPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9080,7 +9080,7 @@ std::string NMD::LLWPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LSA(uint64 instruction)
+static std::string LSA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9106,7 +9106,7 @@ std::string NMD::LSA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LUI(uint64 instruction)
+static std::string LUI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
@@ -9128,7 +9128,7 @@ std::string NMD::LUI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_16_(uint64 instruction)
+static std::string LW_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -9152,7 +9152,7 @@ std::string NMD::LW_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_4X4_(uint64 instruction)
+static std::string LW_4X4_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -9176,7 +9176,7 @@ std::string NMD::LW_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_GP_(uint64 instruction)
+static std::string LW_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -9198,7 +9198,7 @@ std::string NMD::LW_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_GP16_(uint64 instruction)
+static std::string LW_GP16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
@@ -9220,7 +9220,7 @@ std::string NMD::LW_GP16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_S9_(uint64 instruction)
+static std::string LW_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9244,7 +9244,7 @@ std::string NMD::LW_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_SP_(uint64 instruction)
+static std::string LW_SP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
@@ -9266,7 +9266,7 @@ std::string NMD::LW_SP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_U12_(uint64 instruction)
+static std::string LW_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9290,7 +9290,7 @@ std::string NMD::LW_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_GP_(uint64 instruction)
+static std::string LWC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -9312,7 +9312,7 @@ std::string NMD::LWC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_S9_(uint64 instruction)
+static std::string LWC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9336,7 +9336,7 @@ std::string NMD::LWC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_U12_(uint64 instruction)
+static std::string LWC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9360,7 +9360,7 @@ std::string NMD::LWC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1X(uint64 instruction)
+static std::string LWC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9384,7 +9384,7 @@ std::string NMD::LWC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1XS(uint64 instruction)
+static std::string LWC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9408,7 +9408,7 @@ std::string NMD::LWC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC2(uint64 instruction)
+static std::string LWC2(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9432,7 +9432,7 @@ std::string NMD::LWC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWE(uint64 instruction)
+static std::string LWE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9456,7 +9456,7 @@ std::string NMD::LWE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWM(uint64 instruction)
+static std::string LWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9482,7 +9482,7 @@ std::string NMD::LWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWPC_48_(uint64 instruction)
+static std::string LWPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -9504,7 +9504,7 @@ std::string NMD::LWPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_GP_(uint64 instruction)
+static std::string LWU_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -9526,7 +9526,7 @@ std::string NMD::LWU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_S9_(uint64 instruction)
+static std::string LWU_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9550,7 +9550,7 @@ std::string NMD::LWU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_U12_(uint64 instruction)
+static std::string LWU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9574,7 +9574,7 @@ std::string NMD::LWU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWUX(uint64 instruction)
+static std::string LWUX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9598,7 +9598,7 @@ std::string NMD::LWUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWUXS(uint64 instruction)
+static std::string LWUXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9622,7 +9622,7 @@ std::string NMD::LWUXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWX(uint64 instruction)
+static std::string LWX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9646,7 +9646,7 @@ std::string NMD::LWX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWXS_16_(uint64 instruction)
+static std::string LWXS_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -9670,7 +9670,7 @@ std::string NMD::LWXS_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWXS_32_(uint64 instruction)
+static std::string LWXS_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9695,7 +9695,7 @@ std::string NMD::LWXS_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADD_DSP_(uint64 instruction)
+static std::string MADD_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9719,7 +9719,7 @@ std::string NMD::MADD_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDF_D(uint64 instruction)
+static std::string MADDF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9743,7 +9743,7 @@ std::string NMD::MADDF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDF_S(uint64 instruction)
+static std::string MADDF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9768,7 +9768,7 @@ std::string NMD::MADDF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDU_DSP_(uint64 instruction)
+static std::string MADDU_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9793,7 +9793,7 @@ std::string NMD::MADDU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_S_W_PHL(uint64 instruction)
+static std::string MAQ_S_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9818,7 +9818,7 @@ std::string NMD::MAQ_S_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_S_W_PHR(uint64 instruction)
+static std::string MAQ_S_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9843,7 +9843,7 @@ std::string NMD::MAQ_S_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_SA_W_PHL(uint64 instruction)
+static std::string MAQ_SA_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9868,7 +9868,7 @@ std::string NMD::MAQ_SA_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_SA_W_PHR(uint64 instruction)
+static std::string MAQ_SA_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9892,7 +9892,7 @@ std::string NMD::MAQ_SA_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAX_D(uint64 instruction)
+static std::string MAX_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9916,7 +9916,7 @@ std::string NMD::MAX_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAX_S(uint64 instruction)
+static std::string MAX_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9940,7 +9940,7 @@ std::string NMD::MAX_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAXA_D(uint64 instruction)
+static std::string MAXA_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9964,7 +9964,7 @@ std::string NMD::MAXA_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAXA_S(uint64 instruction)
+static std::string MAXA_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9988,7 +9988,7 @@ std::string NMD::MAXA_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC0(uint64 instruction)
+static std::string MFC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10012,7 +10012,7 @@ std::string NMD::MFC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC1(uint64 instruction)
+static std::string MFC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10034,7 +10034,7 @@ std::string NMD::MFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC2(uint64 instruction)
+static std::string MFC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10056,7 +10056,7 @@ std::string NMD::MFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFGC0(uint64 instruction)
+static std::string MFGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10080,7 +10080,7 @@ std::string NMD::MFGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC0(uint64 instruction)
+static std::string MFHC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10104,7 +10104,7 @@ std::string NMD::MFHC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC1(uint64 instruction)
+static std::string MFHC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10126,7 +10126,7 @@ std::string NMD::MFHC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC2(uint64 instruction)
+static std::string MFHC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10148,7 +10148,7 @@ std::string NMD::MFHC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHGC0(uint64 instruction)
+static std::string MFHGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10171,7 +10171,7 @@ std::string NMD::MFHGC0(uint64 instruction)
  *     rt -----
  *               ac --
  */
-std::string NMD::MFHI_DSP_(uint64 instruction)
+static std::string MFHI_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10193,7 +10193,7 @@ std::string NMD::MFHI_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHTR(uint64 instruction)
+static std::string MFHTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10218,7 +10218,7 @@ std::string NMD::MFHTR(uint64 instruction)
  *     rt -----
  *               ac --
  */
-std::string NMD::MFLO_DSP_(uint64 instruction)
+static std::string MFLO_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10240,7 +10240,7 @@ std::string NMD::MFLO_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFTR(uint64 instruction)
+static std::string MFTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10266,7 +10266,7 @@ std::string NMD::MFTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MIN_D(uint64 instruction)
+static std::string MIN_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10290,7 +10290,7 @@ std::string NMD::MIN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MIN_S(uint64 instruction)
+static std::string MIN_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10314,7 +10314,7 @@ std::string NMD::MIN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MINA_D(uint64 instruction)
+static std::string MINA_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10338,7 +10338,7 @@ std::string NMD::MINA_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MINA_S(uint64 instruction)
+static std::string MINA_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10362,7 +10362,7 @@ std::string NMD::MINA_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOD(uint64 instruction)
+static std::string MOD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10386,7 +10386,7 @@ std::string NMD::MOD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MODSUB(uint64 instruction)
+static std::string MODSUB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10410,7 +10410,7 @@ std::string NMD::MODSUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MODU(uint64 instruction)
+static std::string MODU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10434,7 +10434,7 @@ std::string NMD::MODU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOV_D(uint64 instruction)
+static std::string MOV_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10456,7 +10456,7 @@ std::string NMD::MOV_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOV_S(uint64 instruction)
+static std::string MOV_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10478,7 +10478,7 @@ std::string NMD::MOV_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVE_BALC(uint64 instruction)
+static std::string MOVE_BALC(uint64 instruction)
 {
     uint64 rtz4_value = extract_rtz4_27_26_25_23_22_21(instruction);
     uint64 rd1_value = extract_rdl_25_24(instruction);
@@ -10502,7 +10502,7 @@ std::string NMD::MOVE_BALC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVEP(uint64 instruction)
+static std::string MOVEP(uint64 instruction)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
@@ -10529,7 +10529,7 @@ std::string NMD::MOVEP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVEP_REV_(uint64 instruction)
+static std::string MOVEP_REV_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
@@ -10556,7 +10556,7 @@ std::string NMD::MOVEP_REV_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVE(uint64 instruction)
+static std::string MOVE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
@@ -10578,7 +10578,7 @@ std::string NMD::MOVE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVN(uint64 instruction)
+static std::string MOVN(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10602,7 +10602,7 @@ std::string NMD::MOVN(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVZ(uint64 instruction)
+static std::string MOVZ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10626,7 +10626,7 @@ std::string NMD::MOVZ(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MSUB_DSP_(uint64 instruction)
+static std::string MSUB_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10650,7 +10650,7 @@ std::string NMD::MSUB_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MSUBF_D(uint64 instruction)
+static std::string MSUBF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10674,7 +10674,7 @@ std::string NMD::MSUBF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MSUBF_S(uint64 instruction)
+static std::string MSUBF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10698,7 +10698,7 @@ std::string NMD::MSUBF_S(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MSUBU_DSP_(uint64 instruction)
+static std::string MSUBU_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10722,7 +10722,7 @@ std::string NMD::MSUBU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC0(uint64 instruction)
+static std::string MTC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10746,7 +10746,7 @@ std::string NMD::MTC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC1(uint64 instruction)
+static std::string MTC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10768,7 +10768,7 @@ std::string NMD::MTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC2(uint64 instruction)
+static std::string MTC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10790,7 +10790,7 @@ std::string NMD::MTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTGC0(uint64 instruction)
+static std::string MTGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10814,7 +10814,7 @@ std::string NMD::MTGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC0(uint64 instruction)
+static std::string MTHC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10838,7 +10838,7 @@ std::string NMD::MTHC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC1(uint64 instruction)
+static std::string MTHC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10860,7 +10860,7 @@ std::string NMD::MTHC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC2(uint64 instruction)
+static std::string MTHC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10882,7 +10882,7 @@ std::string NMD::MTHC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHGC0(uint64 instruction)
+static std::string MTHGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10905,7 +10905,7 @@ std::string NMD::MTHGC0(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTHI_DSP_(uint64 instruction)
+static std::string MTHI_DSP_(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10926,7 +10926,7 @@ std::string NMD::MTHI_DSP_(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTHLIP(uint64 instruction)
+static std::string MTHLIP(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10948,7 +10948,7 @@ std::string NMD::MTHLIP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHTR(uint64 instruction)
+static std::string MTHTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10973,7 +10973,7 @@ std::string NMD::MTHTR(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTLO_DSP_(uint64 instruction)
+static std::string MTLO_DSP_(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10995,7 +10995,7 @@ std::string NMD::MTLO_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTTR(uint64 instruction)
+static std::string MTTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -11021,7 +11021,7 @@ std::string NMD::MTTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUH(uint64 instruction)
+static std::string MUH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11045,7 +11045,7 @@ std::string NMD::MUH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUHU(uint64 instruction)
+static std::string MUHU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11069,7 +11069,7 @@ std::string NMD::MUHU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_32_(uint64 instruction)
+static std::string MUL_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11093,7 +11093,7 @@ std::string NMD::MUL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_4X4_(uint64 instruction)
+static std::string MUL_4X4_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -11115,7 +11115,7 @@ std::string NMD::MUL_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_D(uint64 instruction)
+static std::string MUL_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11140,7 +11140,7 @@ std::string NMD::MUL_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_PH(uint64 instruction)
+static std::string MUL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11165,7 +11165,7 @@ std::string NMD::MUL_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_S_PH(uint64 instruction)
+static std::string MUL_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11189,7 +11189,7 @@ std::string NMD::MUL_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_S(uint64 instruction)
+static std::string MUL_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11214,7 +11214,7 @@ std::string NMD::MUL_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEQ_S_W_PHL(uint64 instruction)
+static std::string MULEQ_S_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11239,7 +11239,7 @@ std::string NMD::MULEQ_S_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEQ_S_W_PHR(uint64 instruction)
+static std::string MULEQ_S_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11264,7 +11264,7 @@ std::string NMD::MULEQ_S_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEU_S_PH_QBL(uint64 instruction)
+static std::string MULEU_S_PH_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11289,7 +11289,7 @@ std::string NMD::MULEU_S_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEU_S_PH_QBR(uint64 instruction)
+static std::string MULEU_S_PH_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11314,7 +11314,7 @@ std::string NMD::MULEU_S_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_RS_PH(uint64 instruction)
+static std::string MULQ_RS_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11339,7 +11339,7 @@ std::string NMD::MULQ_RS_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_RS_W(uint64 instruction)
+static std::string MULQ_RS_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11364,7 +11364,7 @@ std::string NMD::MULQ_RS_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_S_PH(uint64 instruction)
+static std::string MULQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11389,7 +11389,7 @@ std::string NMD::MULQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_S_W(uint64 instruction)
+static std::string MULQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11414,7 +11414,7 @@ std::string NMD::MULQ_S_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULSA_W_PH(uint64 instruction)
+static std::string MULSA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11439,7 +11439,7 @@ std::string NMD::MULSA_W_PH(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULSAQ_S_W_PH(uint64 instruction)
+static std::string MULSAQ_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11463,7 +11463,7 @@ std::string NMD::MULSAQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULT_DSP_(uint64 instruction)
+static std::string MULT_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11487,7 +11487,7 @@ std::string NMD::MULT_DSP_(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULTU_DSP_(uint64 instruction)
+static std::string MULTU_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11511,7 +11511,7 @@ std::string NMD::MULTU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULU(uint64 instruction)
+static std::string MULU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11535,7 +11535,7 @@ std::string NMD::MULU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NEG_D(uint64 instruction)
+static std::string NEG_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11557,7 +11557,7 @@ std::string NMD::NEG_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NEG_S(uint64 instruction)
+static std::string NEG_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11579,7 +11579,7 @@ std::string NMD::NEG_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOP_16_(uint64 instruction)
+static std::string NOP_16_(uint64 instruction)
 {
     (void)instruction;
 
@@ -11597,7 +11597,7 @@ std::string NMD::NOP_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOP_32_(uint64 instruction)
+static std::string NOP_32_(uint64 instruction)
 {
     (void)instruction;
 
@@ -11615,7 +11615,7 @@ std::string NMD::NOP_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOR(uint64 instruction)
+static std::string NOR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11639,7 +11639,7 @@ std::string NMD::NOR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOT_16_(uint64 instruction)
+static std::string NOT_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -11661,7 +11661,7 @@ std::string NMD::NOT_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::OR_16_(uint64 instruction)
+static std::string OR_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -11683,7 +11683,7 @@ std::string NMD::OR_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::OR_32_(uint64 instruction)
+static std::string OR_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11707,7 +11707,7 @@ std::string NMD::OR_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ORI(uint64 instruction)
+static std::string ORI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11732,7 +11732,7 @@ std::string NMD::ORI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PACKRL_PH(uint64 instruction)
+static std::string PACKRL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11756,7 +11756,7 @@ std::string NMD::PACKRL_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PAUSE(uint64 instruction)
+static std::string PAUSE(uint64 instruction)
 {
     (void)instruction;
 
@@ -11775,7 +11775,7 @@ std::string NMD::PAUSE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PICK_PH(uint64 instruction)
+static std::string PICK_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11800,7 +11800,7 @@ std::string NMD::PICK_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PICK_QB(uint64 instruction)
+static std::string PICK_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11825,7 +11825,7 @@ std::string NMD::PICK_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQ_W_PHL(uint64 instruction)
+static std::string PRECEQ_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11848,7 +11848,7 @@ std::string NMD::PRECEQ_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQ_W_PHR(uint64 instruction)
+static std::string PRECEQ_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11871,7 +11871,7 @@ std::string NMD::PRECEQ_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBLA(uint64 instruction)
+static std::string PRECEQU_PH_QBLA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11894,7 +11894,7 @@ std::string NMD::PRECEQU_PH_QBLA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBL(uint64 instruction)
+static std::string PRECEQU_PH_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11917,7 +11917,7 @@ std::string NMD::PRECEQU_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBRA(uint64 instruction)
+static std::string PRECEQU_PH_QBRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11940,7 +11940,7 @@ std::string NMD::PRECEQU_PH_QBRA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBR(uint64 instruction)
+static std::string PRECEQU_PH_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11964,7 +11964,7 @@ std::string NMD::PRECEQU_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBLA(uint64 instruction)
+static std::string PRECEU_PH_QBLA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11987,7 +11987,7 @@ std::string NMD::PRECEU_PH_QBLA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBL(uint64 instruction)
+static std::string PRECEU_PH_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12011,7 +12011,7 @@ std::string NMD::PRECEU_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBRA(uint64 instruction)
+static std::string PRECEU_PH_QBRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12034,7 +12034,7 @@ std::string NMD::PRECEU_PH_QBRA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBR(uint64 instruction)
+static std::string PRECEU_PH_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12057,7 +12057,7 @@ std::string NMD::PRECEU_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_QB_PH(uint64 instruction)
+static std::string PRECR_QB_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12082,7 +12082,7 @@ std::string NMD::PRECR_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_SRA_PH_W(uint64 instruction)
+static std::string PRECR_SRA_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12107,7 +12107,7 @@ std::string NMD::PRECR_SRA_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction)
+static std::string PRECR_SRA_R_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12132,7 +12132,7 @@ std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_PH_W(uint64 instruction)
+static std::string PRECRQ_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12157,7 +12157,7 @@ std::string NMD::PRECRQ_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_QB_PH(uint64 instruction)
+static std::string PRECRQ_QB_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12182,7 +12182,7 @@ std::string NMD::PRECRQ_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_RS_PH_W(uint64 instruction)
+static std::string PRECRQ_RS_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12207,7 +12207,7 @@ std::string NMD::PRECRQ_RS_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQU_S_QB_PH(uint64 instruction)
+static std::string PRECRQU_S_QB_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12231,7 +12231,7 @@ std::string NMD::PRECRQU_S_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREF_S9_(uint64 instruction)
+static std::string PREF_S9_(uint64 instruction)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12255,7 +12255,7 @@ std::string NMD::PREF_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREF_U12_(uint64 instruction)
+static std::string PREF_U12_(uint64 instruction)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12279,7 +12279,7 @@ std::string NMD::PREF_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREFE(uint64 instruction)
+static std::string PREFE(uint64 instruction)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12303,7 +12303,7 @@ std::string NMD::PREFE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREPEND(uint64 instruction)
+static std::string PREPEND(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12326,7 +12326,7 @@ std::string NMD::PREPEND(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::RADDU_W_QB(uint64 instruction)
+static std::string RADDU_W_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12347,7 +12347,7 @@ std::string NMD::RADDU_W_QB(uint64 instruction)
  *     rt -----
  *        mask -------
  */
-std::string NMD::RDDSP(uint64 instruction)
+static std::string RDDSP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
@@ -12369,7 +12369,7 @@ std::string NMD::RDDSP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RDHWR(uint64 instruction)
+static std::string RDHWR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
@@ -12393,7 +12393,7 @@ std::string NMD::RDHWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RDPGPR(uint64 instruction)
+static std::string RDPGPR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12415,7 +12415,7 @@ std::string NMD::RDPGPR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RECIP_D(uint64 instruction)
+static std::string RECIP_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12437,7 +12437,7 @@ std::string NMD::RECIP_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RECIP_S(uint64 instruction)
+static std::string RECIP_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12459,7 +12459,7 @@ std::string NMD::RECIP_S(uint64 instruction)
  *     rt -----
  *           s ----------
  */
-std::string NMD::REPL_PH(uint64 instruction)
+static std::string REPL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
@@ -12481,7 +12481,7 @@ std::string NMD::REPL_PH(uint64 instruction)
  *     rt -----
  *           u --------
  */
-std::string NMD::REPL_QB(uint64 instruction)
+static std::string REPL_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
@@ -12503,7 +12503,7 @@ std::string NMD::REPL_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::REPLV_PH(uint64 instruction)
+static std::string REPLV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12524,7 +12524,7 @@ std::string NMD::REPLV_PH(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::REPLV_QB(uint64 instruction)
+static std::string REPLV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12546,7 +12546,7 @@ std::string NMD::REPLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_32_(uint64 instruction)
+static std::string RESTORE_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
@@ -12569,7 +12569,7 @@ std::string NMD::RESTORE_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_JRC_16_(uint64 instruction)
+static std::string RESTORE_JRC_16_(uint64 instruction)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
@@ -12591,7 +12591,7 @@ std::string NMD::RESTORE_JRC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_JRC_32_(uint64 instruction)
+static std::string RESTORE_JRC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
@@ -12614,7 +12614,7 @@ std::string NMD::RESTORE_JRC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTOREF(uint64 instruction)
+static std::string RESTOREF(uint64 instruction)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
@@ -12636,7 +12636,7 @@ std::string NMD::RESTOREF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RINT_D(uint64 instruction)
+static std::string RINT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12658,7 +12658,7 @@ std::string NMD::RINT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RINT_S(uint64 instruction)
+static std::string RINT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12680,7 +12680,7 @@ std::string NMD::RINT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTR(uint64 instruction)
+static std::string ROTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12704,7 +12704,7 @@ std::string NMD::ROTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTRV(uint64 instruction)
+static std::string ROTRV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12728,7 +12728,7 @@ std::string NMD::ROTRV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTX(uint64 instruction)
+static std::string ROTX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12757,7 +12757,7 @@ std::string NMD::ROTX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_L_D(uint64 instruction)
+static std::string ROUND_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12779,7 +12779,7 @@ std::string NMD::ROUND_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_L_S(uint64 instruction)
+static std::string ROUND_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12801,7 +12801,7 @@ std::string NMD::ROUND_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_W_D(uint64 instruction)
+static std::string ROUND_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12823,7 +12823,7 @@ std::string NMD::ROUND_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_W_S(uint64 instruction)
+static std::string ROUND_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12845,7 +12845,7 @@ std::string NMD::ROUND_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RSQRT_D(uint64 instruction)
+static std::string RSQRT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12867,7 +12867,7 @@ std::string NMD::RSQRT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RSQRT_S(uint64 instruction)
+static std::string RSQRT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12889,7 +12889,7 @@ std::string NMD::RSQRT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVE_16_(uint64 instruction)
+static std::string SAVE_16_(uint64 instruction)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
@@ -12911,7 +12911,7 @@ std::string NMD::SAVE_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVE_32_(uint64 instruction)
+static std::string SAVE_32_(uint64 instruction)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
@@ -12934,7 +12934,7 @@ std::string NMD::SAVE_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVEF(uint64 instruction)
+static std::string SAVEF(uint64 instruction)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
@@ -12956,7 +12956,7 @@ std::string NMD::SAVEF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_16_(uint64 instruction)
+static std::string SB_16_(uint64 instruction)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -12980,7 +12980,7 @@ std::string NMD::SB_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_GP_(uint64 instruction)
+static std::string SB_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -13002,7 +13002,7 @@ std::string NMD::SB_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_S9_(uint64 instruction)
+static std::string SB_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13026,7 +13026,7 @@ std::string NMD::SB_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_U12_(uint64 instruction)
+static std::string SB_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13050,7 +13050,7 @@ std::string NMD::SB_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SBE(uint64 instruction)
+static std::string SBE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13074,7 +13074,7 @@ std::string NMD::SBE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SBX(uint64 instruction)
+static std::string SBX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13098,7 +13098,7 @@ std::string NMD::SBX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SC(uint64 instruction)
+static std::string SC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13122,7 +13122,7 @@ std::string NMD::SC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCD(uint64 instruction)
+static std::string SCD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13146,7 +13146,7 @@ std::string NMD::SCD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCDP(uint64 instruction)
+static std::string SCDP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13170,7 +13170,7 @@ std::string NMD::SCDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCE(uint64 instruction)
+static std::string SCE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13194,7 +13194,7 @@ std::string NMD::SCE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCWP(uint64 instruction)
+static std::string SCWP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13218,7 +13218,7 @@ std::string NMD::SCWP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCWPE(uint64 instruction)
+static std::string SCWPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13242,7 +13242,7 @@ std::string NMD::SCWPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_GP_(uint64 instruction)
+static std::string SD_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
@@ -13264,7 +13264,7 @@ std::string NMD::SD_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_S9_(uint64 instruction)
+static std::string SD_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13288,7 +13288,7 @@ std::string NMD::SD_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_U12_(uint64 instruction)
+static std::string SD_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13312,7 +13312,7 @@ std::string NMD::SD_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDBBP_16_(uint64 instruction)
+static std::string SDBBP_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
@@ -13332,7 +13332,7 @@ std::string NMD::SDBBP_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDBBP_32_(uint64 instruction)
+static std::string SDBBP_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -13352,7 +13352,7 @@ std::string NMD::SDBBP_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_GP_(uint64 instruction)
+static std::string SDC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -13374,7 +13374,7 @@ std::string NMD::SDC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_S9_(uint64 instruction)
+static std::string SDC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13398,7 +13398,7 @@ std::string NMD::SDC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_U12_(uint64 instruction)
+static std::string SDC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13422,7 +13422,7 @@ std::string NMD::SDC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1X(uint64 instruction)
+static std::string SDC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13446,7 +13446,7 @@ std::string NMD::SDC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1XS(uint64 instruction)
+static std::string SDC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13470,7 +13470,7 @@ std::string NMD::SDC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC2(uint64 instruction)
+static std::string SDC2(uint64 instruction)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13494,7 +13494,7 @@ std::string NMD::SDC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDM(uint64 instruction)
+static std::string SDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13520,7 +13520,7 @@ std::string NMD::SDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDPC_48_(uint64 instruction)
+static std::string SDPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -13542,7 +13542,7 @@ std::string NMD::SDPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDXS(uint64 instruction)
+static std::string SDXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13566,7 +13566,7 @@ std::string NMD::SDXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDX(uint64 instruction)
+static std::string SDX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13590,7 +13590,7 @@ std::string NMD::SDX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEB(uint64 instruction)
+static std::string SEB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13612,7 +13612,7 @@ std::string NMD::SEB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEH(uint64 instruction)
+static std::string SEH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13634,7 +13634,7 @@ std::string NMD::SEH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEL_D(uint64 instruction)
+static std::string SEL_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13658,7 +13658,7 @@ std::string NMD::SEL_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEL_S(uint64 instruction)
+static std::string SEL_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13682,7 +13682,7 @@ std::string NMD::SEL_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELEQZ_D(uint64 instruction)
+static std::string SELEQZ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13706,7 +13706,7 @@ std::string NMD::SELEQZ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELEQZ_S(uint64 instruction)
+static std::string SELEQZ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13730,7 +13730,7 @@ std::string NMD::SELEQZ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELNEZ_D(uint64 instruction)
+static std::string SELNEZ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13754,7 +13754,7 @@ std::string NMD::SELNEZ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELNEZ_S(uint64 instruction)
+static std::string SELNEZ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13778,7 +13778,7 @@ std::string NMD::SELNEZ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEQI(uint64 instruction)
+static std::string SEQI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13802,7 +13802,7 @@ std::string NMD::SEQI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_16_(uint64 instruction)
+static std::string SH_16_(uint64 instruction)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -13826,7 +13826,7 @@ std::string NMD::SH_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_GP_(uint64 instruction)
+static std::string SH_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -13848,7 +13848,7 @@ std::string NMD::SH_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_S9_(uint64 instruction)
+static std::string SH_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13872,7 +13872,7 @@ std::string NMD::SH_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_U12_(uint64 instruction)
+static std::string SH_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13896,7 +13896,7 @@ std::string NMD::SH_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHE(uint64 instruction)
+static std::string SHE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13920,7 +13920,7 @@ std::string NMD::SHE(uint64 instruction)
  *      shift ------
  *               ac --
  */
-std::string NMD::SHILO(uint64 instruction)
+static std::string SHILO(uint64 instruction)
 {
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -13942,7 +13942,7 @@ std::string NMD::SHILO(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::SHILOV(uint64 instruction)
+static std::string SHILOV(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -13964,7 +13964,7 @@ std::string NMD::SHILOV(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHLL_PH(uint64 instruction)
+static std::string SHLL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13988,7 +13988,7 @@ std::string NMD::SHLL_PH(uint64 instruction)
  *          rs -----
  *               sa ---
  */
-std::string NMD::SHLL_QB(uint64 instruction)
+static std::string SHLL_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14013,7 +14013,7 @@ std::string NMD::SHLL_QB(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHLL_S_PH(uint64 instruction)
+static std::string SHLL_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14037,7 +14037,7 @@ std::string NMD::SHLL_S_PH(uint64 instruction)
  *          rs -----
  *               sa -----
  */
-std::string NMD::SHLL_S_W(uint64 instruction)
+static std::string SHLL_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14062,7 +14062,7 @@ std::string NMD::SHLL_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_PH(uint64 instruction)
+static std::string SHLLV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14086,7 +14086,7 @@ std::string NMD::SHLLV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_QB(uint64 instruction)
+static std::string SHLLV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14111,7 +14111,7 @@ std::string NMD::SHLLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_S_PH(uint64 instruction)
+static std::string SHLLV_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14135,7 +14135,7 @@ std::string NMD::SHLLV_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_S_W(uint64 instruction)
+static std::string SHLLV_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14159,7 +14159,7 @@ std::string NMD::SHLLV_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_PH(uint64 instruction)
+static std::string SHRA_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14183,7 +14183,7 @@ std::string NMD::SHRA_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_QB(uint64 instruction)
+static std::string SHRA_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14207,7 +14207,7 @@ std::string NMD::SHRA_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_PH(uint64 instruction)
+static std::string SHRA_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14231,7 +14231,7 @@ std::string NMD::SHRA_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_QB(uint64 instruction)
+static std::string SHRA_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14255,7 +14255,7 @@ std::string NMD::SHRA_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_W(uint64 instruction)
+static std::string SHRA_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14279,7 +14279,7 @@ std::string NMD::SHRA_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_PH(uint64 instruction)
+static std::string SHRAV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14303,7 +14303,7 @@ std::string NMD::SHRAV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_QB(uint64 instruction)
+static std::string SHRAV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14327,7 +14327,7 @@ std::string NMD::SHRAV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_PH(uint64 instruction)
+static std::string SHRAV_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14351,7 +14351,7 @@ std::string NMD::SHRAV_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_QB(uint64 instruction)
+static std::string SHRAV_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14375,7 +14375,7 @@ std::string NMD::SHRAV_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_W(uint64 instruction)
+static std::string SHRAV_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14399,7 +14399,7 @@ std::string NMD::SHRAV_R_W(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHRL_PH(uint64 instruction)
+static std::string SHRL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14423,7 +14423,7 @@ std::string NMD::SHRL_PH(uint64 instruction)
  *          rs -----
  *               sa ---
  */
-std::string NMD::SHRL_QB(uint64 instruction)
+static std::string SHRL_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14448,7 +14448,7 @@ std::string NMD::SHRL_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRLV_PH(uint64 instruction)
+static std::string SHRLV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14472,7 +14472,7 @@ std::string NMD::SHRLV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRLV_QB(uint64 instruction)
+static std::string SHRLV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14496,7 +14496,7 @@ std::string NMD::SHRLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHX(uint64 instruction)
+static std::string SHX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14520,7 +14520,7 @@ std::string NMD::SHX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHXS(uint64 instruction)
+static std::string SHXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14544,7 +14544,7 @@ std::string NMD::SHXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SIGRIE(uint64 instruction)
+static std::string SIGRIE(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -14564,7 +14564,7 @@ std::string NMD::SIGRIE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLL_16_(uint64 instruction)
+static std::string SLL_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -14588,7 +14588,7 @@ std::string NMD::SLL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLL_32_(uint64 instruction)
+static std::string SLL_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14612,7 +14612,7 @@ std::string NMD::SLL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLLV(uint64 instruction)
+static std::string SLLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14636,7 +14636,7 @@ std::string NMD::SLLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLT(uint64 instruction)
+static std::string SLT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14660,7 +14660,7 @@ std::string NMD::SLT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTI(uint64 instruction)
+static std::string SLTI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14684,7 +14684,7 @@ std::string NMD::SLTI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTIU(uint64 instruction)
+static std::string SLTIU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14708,7 +14708,7 @@ std::string NMD::SLTIU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTU(uint64 instruction)
+static std::string SLTU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14732,7 +14732,7 @@ std::string NMD::SLTU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SOV(uint64 instruction)
+static std::string SOV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14756,7 +14756,7 @@ std::string NMD::SOV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SPECIAL2(uint64 instruction)
+static std::string SPECIAL2(uint64 instruction)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
@@ -14776,7 +14776,7 @@ std::string NMD::SPECIAL2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SQRT_D(uint64 instruction)
+static std::string SQRT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14798,7 +14798,7 @@ std::string NMD::SQRT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SQRT_S(uint64 instruction)
+static std::string SQRT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14820,7 +14820,7 @@ std::string NMD::SQRT_S(uint64 instruction)
  *               rd -----
  *                    sa -----
  */
-std::string NMD::SRA(uint64 instruction)
+static std::string SRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14844,7 +14844,7 @@ std::string NMD::SRA(uint64 instruction)
  *          rt -----
  *               rd -----
  */
-std::string NMD::SRAV(uint64 instruction)
+static std::string SRAV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14868,7 +14868,7 @@ std::string NMD::SRAV(uint64 instruction)
  *          rt -----
  *               rd -----
  */
-std::string NMD::SRL_16_(uint64 instruction)
+static std::string SRL_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -14892,7 +14892,7 @@ std::string NMD::SRL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SRL_32_(uint64 instruction)
+static std::string SRL_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14916,7 +14916,7 @@ std::string NMD::SRL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SRLV(uint64 instruction)
+static std::string SRLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14940,7 +14940,7 @@ std::string NMD::SRLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB(uint64 instruction)
+static std::string SUB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14964,7 +14964,7 @@ std::string NMD::SUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB_D(uint64 instruction)
+static std::string SUB_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14988,7 +14988,7 @@ std::string NMD::SUB_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB_S(uint64 instruction)
+static std::string SUB_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -15012,7 +15012,7 @@ std::string NMD::SUB_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_PH(uint64 instruction)
+static std::string SUBQ_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15037,7 +15037,7 @@ std::string NMD::SUBQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_S_PH(uint64 instruction)
+static std::string SUBQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15062,7 +15062,7 @@ std::string NMD::SUBQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_S_W(uint64 instruction)
+static std::string SUBQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15087,7 +15087,7 @@ std::string NMD::SUBQ_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_PH(uint64 instruction)
+static std::string SUBQH_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15112,7 +15112,7 @@ std::string NMD::SUBQH_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_R_PH(uint64 instruction)
+static std::string SUBQH_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15137,7 +15137,7 @@ std::string NMD::SUBQH_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_R_W(uint64 instruction)
+static std::string SUBQH_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15162,7 +15162,7 @@ std::string NMD::SUBQH_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_W(uint64 instruction)
+static std::string SUBQH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15186,7 +15186,7 @@ std::string NMD::SUBQH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_16_(uint64 instruction)
+static std::string SUBU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -15210,7 +15210,7 @@ std::string NMD::SUBU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_32_(uint64 instruction)
+static std::string SUBU_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15234,7 +15234,7 @@ std::string NMD::SUBU_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_PH(uint64 instruction)
+static std::string SUBU_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15258,7 +15258,7 @@ std::string NMD::SUBU_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_QB(uint64 instruction)
+static std::string SUBU_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15283,7 +15283,7 @@ std::string NMD::SUBU_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_S_PH(uint64 instruction)
+static std::string SUBU_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15308,7 +15308,7 @@ std::string NMD::SUBU_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_S_QB(uint64 instruction)
+static std::string SUBU_S_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15333,7 +15333,7 @@ std::string NMD::SUBU_S_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBUH_QB(uint64 instruction)
+static std::string SUBUH_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15358,7 +15358,7 @@ std::string NMD::SUBUH_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBUH_R_QB(uint64 instruction)
+static std::string SUBUH_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15382,7 +15382,7 @@ std::string NMD::SUBUH_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_16_(uint64 instruction)
+static std::string SW_16_(uint64 instruction)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -15406,7 +15406,7 @@ std::string NMD::SW_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_4X4_(uint64 instruction)
+static std::string SW_4X4_(uint64 instruction)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -15430,7 +15430,7 @@ std::string NMD::SW_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_GP16_(uint64 instruction)
+static std::string SW_GP16_(uint64 instruction)
 {
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
@@ -15452,7 +15452,7 @@ std::string NMD::SW_GP16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_GP_(uint64 instruction)
+static std::string SW_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -15474,7 +15474,7 @@ std::string NMD::SW_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_S9_(uint64 instruction)
+static std::string SW_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15498,7 +15498,7 @@ std::string NMD::SW_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_SP_(uint64 instruction)
+static std::string SW_SP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
@@ -15520,7 +15520,7 @@ std::string NMD::SW_SP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_U12_(uint64 instruction)
+static std::string SW_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15544,7 +15544,7 @@ std::string NMD::SW_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_GP_(uint64 instruction)
+static std::string SWC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -15566,7 +15566,7 @@ std::string NMD::SWC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_S9_(uint64 instruction)
+static std::string SWC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15590,7 +15590,7 @@ std::string NMD::SWC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_U12_(uint64 instruction)
+static std::string SWC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15614,7 +15614,7 @@ std::string NMD::SWC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1X(uint64 instruction)
+static std::string SWC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15638,7 +15638,7 @@ std::string NMD::SWC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1XS(uint64 instruction)
+static std::string SWC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15662,7 +15662,7 @@ std::string NMD::SWC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC2(uint64 instruction)
+static std::string SWC2(uint64 instruction)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15686,7 +15686,7 @@ std::string NMD::SWC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWE(uint64 instruction)
+static std::string SWE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15710,7 +15710,7 @@ std::string NMD::SWE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWM(uint64 instruction)
+static std::string SWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15736,7 +15736,7 @@ std::string NMD::SWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWPC_48_(uint64 instruction)
+static std::string SWPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -15758,7 +15758,7 @@ std::string NMD::SWPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWX(uint64 instruction)
+static std::string SWX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15782,7 +15782,7 @@ std::string NMD::SWX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWXS(uint64 instruction)
+static std::string SWXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15806,7 +15806,7 @@ std::string NMD::SWXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNC(uint64 instruction)
+static std::string SYNC(uint64 instruction)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
@@ -15826,7 +15826,7 @@ std::string NMD::SYNC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNCI(uint64 instruction)
+static std::string SYNCI(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15848,7 +15848,7 @@ std::string NMD::SYNCI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNCIE(uint64 instruction)
+static std::string SYNCIE(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15870,7 +15870,7 @@ std::string NMD::SYNCIE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYSCALL_16_(uint64 instruction)
+static std::string SYSCALL_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
@@ -15888,7 +15888,7 @@ std::string NMD::SYSCALL_16_(uint64 instruction)
  *  00000000000010
  *           code ------------------
  */
-std::string NMD::SYSCALL_32_(uint64 instruction)
+static std::string SYSCALL_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
@@ -15908,7 +15908,7 @@ std::string NMD::SYSCALL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TEQ(uint64 instruction)
+static std::string TEQ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15930,7 +15930,7 @@ std::string NMD::TEQ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGINV(uint64 instruction)
+static std::string TLBGINV(uint64 instruction)
 {
     (void)instruction;
 
@@ -15948,7 +15948,7 @@ std::string NMD::TLBGINV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGINVF(uint64 instruction)
+static std::string TLBGINVF(uint64 instruction)
 {
     (void)instruction;
 
@@ -15966,7 +15966,7 @@ std::string NMD::TLBGINVF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGP(uint64 instruction)
+static std::string TLBGP(uint64 instruction)
 {
     (void)instruction;
 
@@ -15984,7 +15984,7 @@ std::string NMD::TLBGP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGR(uint64 instruction)
+static std::string TLBGR(uint64 instruction)
 {
     (void)instruction;
 
@@ -16002,7 +16002,7 @@ std::string NMD::TLBGR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGWI(uint64 instruction)
+static std::string TLBGWI(uint64 instruction)
 {
     (void)instruction;
 
@@ -16020,7 +16020,7 @@ std::string NMD::TLBGWI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGWR(uint64 instruction)
+static std::string TLBGWR(uint64 instruction)
 {
     (void)instruction;
 
@@ -16038,7 +16038,7 @@ std::string NMD::TLBGWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBINV(uint64 instruction)
+static std::string TLBINV(uint64 instruction)
 {
     (void)instruction;
 
@@ -16056,7 +16056,7 @@ std::string NMD::TLBINV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBINVF(uint64 instruction)
+static std::string TLBINVF(uint64 instruction)
 {
     (void)instruction;
 
@@ -16074,7 +16074,7 @@ std::string NMD::TLBINVF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBP(uint64 instruction)
+static std::string TLBP(uint64 instruction)
 {
     (void)instruction;
 
@@ -16092,7 +16092,7 @@ std::string NMD::TLBP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBR(uint64 instruction)
+static std::string TLBR(uint64 instruction)
 {
     (void)instruction;
 
@@ -16110,7 +16110,7 @@ std::string NMD::TLBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBWI(uint64 instruction)
+static std::string TLBWI(uint64 instruction)
 {
     (void)instruction;
 
@@ -16128,7 +16128,7 @@ std::string NMD::TLBWI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBWR(uint64 instruction)
+static std::string TLBWR(uint64 instruction)
 {
     (void)instruction;
 
@@ -16146,7 +16146,7 @@ std::string NMD::TLBWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TNE(uint64 instruction)
+static std::string TNE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16168,7 +16168,7 @@ std::string NMD::TNE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_L_D(uint64 instruction)
+static std::string TRUNC_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16190,7 +16190,7 @@ std::string NMD::TRUNC_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_L_S(uint64 instruction)
+static std::string TRUNC_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16212,7 +16212,7 @@ std::string NMD::TRUNC_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_W_D(uint64 instruction)
+static std::string TRUNC_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16234,7 +16234,7 @@ std::string NMD::TRUNC_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_W_S(uint64 instruction)
+static std::string TRUNC_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16256,7 +16256,7 @@ std::string NMD::TRUNC_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALDM(uint64 instruction)
+static std::string UALDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16282,7 +16282,7 @@ std::string NMD::UALDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALH(uint64 instruction)
+static std::string UALH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16306,7 +16306,7 @@ std::string NMD::UALH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALWM(uint64 instruction)
+static std::string UALWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16332,7 +16332,7 @@ std::string NMD::UALWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASDM(uint64 instruction)
+static std::string UASDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16358,7 +16358,7 @@ std::string NMD::UASDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASH(uint64 instruction)
+static std::string UASH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16382,7 +16382,7 @@ std::string NMD::UASH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASWM(uint64 instruction)
+static std::string UASWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16408,7 +16408,7 @@ std::string NMD::UASWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UDI(uint64 instruction)
+static std::string UDI(uint64 instruction)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
@@ -16426,7 +16426,7 @@ std::string NMD::UDI(uint64 instruction)
  *  001000          1100001101111111
  *   code ----------
  */
-std::string NMD::WAIT(uint64 instruction)
+static std::string WAIT(uint64 instruction)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
@@ -16446,7 +16446,7 @@ std::string NMD::WAIT(uint64 instruction)
  *     rt -----
  *        mask -------
  */
-std::string NMD::WRDSP(uint64 instruction)
+static std::string WRDSP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
@@ -16468,7 +16468,7 @@ std::string NMD::WRDSP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::WRPGPR(uint64 instruction)
+static std::string WRPGPR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16490,7 +16490,7 @@ std::string NMD::WRPGPR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XOR_16_(uint64 instruction)
+static std::string XOR_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -16512,7 +16512,7 @@ std::string NMD::XOR_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XOR_32_(uint64 instruction)
+static std::string XOR_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16536,7 +16536,7 @@ std::string NMD::XOR_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XORI(uint64 instruction)
+static std::string XORI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16559,7 +16559,7 @@ std::string NMD::XORI(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::YIELD(uint64 instruction)
+static std::string YIELD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16676,26 +16676,26 @@ std::string NMD::YIELD(uint64 instruction)
 
 NMD::Pool NMD::P_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfffc0000, 0x00080000, &NMD::SYSCALL_32_      , 0,
+       0xfffc0000, 0x00080000, &SYSCALL_32_      , 0,
        0x0                 },        /* SYSCALL[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfffc0000, 0x000c0000, &NMD::HYPCALL          , 0,
+       0xfffc0000, 0x000c0000, &HYPCALL          , 0,
        CP0_ | VZ_          },        /* HYPCALL */
 };
 
 
 NMD::Pool NMD::P_RI[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfff80000, 0x00000000, &NMD::SIGRIE           , 0,
+       0xfff80000, 0x00000000, &SIGRIE           , 0,
        0x0                 },        /* SIGRIE */
     { pool                , P_SYSCALL           , 2   , 32,
        0xfff80000, 0x00080000, 0                      , 0,
        0x0                 },        /* P.SYSCALL */
     { instruction         , 0                   , 0   , 32,
-       0xfff80000, 0x00100000, &NMD::BREAK_32_        , 0,
+       0xfff80000, 0x00100000, &BREAK_32_        , 0,
        0x0                 },        /* BREAK[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfff80000, 0x00180000, &NMD::SDBBP_32_        , 0,
+       0xfff80000, 0x00180000, &SDBBP_32_        , 0,
        EJTAG_              },        /* SDBBP[32] */
 };
 
@@ -16705,47 +16705,47 @@ NMD::Pool NMD::P_ADDIU[2] = {
        0xffe00000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.RI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &ADDIU_32__cond   ,
+       0xfc000000, 0x00000000, &ADDIU_32_        , &ADDIU_32__cond   ,
        0x0                 },        /* ADDIU[32] */
 };
 
 
 NMD::Pool NMD::P_TRAP[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000000, &NMD::TEQ              , 0,
+       0xfc0007ff, 0x20000000, &TEQ              , 0,
        XMMS_               },        /* TEQ */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000400, &NMD::TNE              , 0,
+       0xfc0007ff, 0x20000400, &TNE              , 0,
        XMMS_               },        /* TNE */
 };
 
 
 NMD::Pool NMD::P_CMOVE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000210, &NMD::MOVZ             , 0,
+       0xfc0007ff, 0x20000210, &MOVZ             , 0,
        0x0                 },        /* MOVZ */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000610, &NMD::MOVN             , 0,
+       0xfc0007ff, 0x20000610, &MOVN             , 0,
        0x0                 },        /* MOVN */
 };
 
 
 NMD::Pool NMD::P_D_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20010ab0, &NMD::DMT              , 0,
+       0xfc1f3fff, 0x20010ab0, &DMT              , 0,
        MT_                 },        /* DMT */
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20000ab0, &NMD::DVPE             , 0,
+       0xfc1f3fff, 0x20000ab0, &DVPE             , 0,
        MT_                 },        /* DVPE */
 };
 
 
 NMD::Pool NMD::P_E_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20010eb0, &NMD::EMT              , 0,
+       0xfc1f3fff, 0x20010eb0, &EMT              , 0,
        MT_                 },        /* EMT */
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20000eb0, &NMD::EVPE             , 0,
+       0xfc1f3fff, 0x20000eb0, &EVPE             , 0,
        MT_                 },        /* EVPE */
 };
 
@@ -16790,10 +16790,10 @@ NMD::Pool NMD::P_MT_VPE[8] = {
 
 NMD::Pool NMD::P_DVP[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20000390, &NMD::DVP              , 0,
+       0xfc00ffff, 0x20000390, &DVP              , 0,
        0x0                 },        /* DVP */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20000790, &NMD::EVP              , 0,
+       0xfc00ffff, 0x20000790, &EVP              , 0,
        0x0                 },        /* EVP */
 };
 
@@ -16803,7 +16803,7 @@ NMD::Pool NMD::P_SLTU[2] = {
        0xfc00fbff, 0x20000390, 0                      , 0,
        0x0                 },        /* P.DVP */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000390, &NMD::SLTU             , &SLTU_cond        ,
+       0xfc0003ff, 0x20000390, &SLTU             , &SLTU_cond        ,
        0x0                 },        /* SLTU */
 };
 
@@ -16813,13 +16813,13 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000000, 0                      , 0,
        0x0                 },        /* P.TRAP */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000008, &NMD::SEB              , 0,
+       0xfc0003ff, 0x20000008, &SEB              , 0,
        XMMS_               },        /* SEB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000010, &NMD::SLLV             , 0,
+       0xfc0003ff, 0x20000010, &SLLV             , 0,
        0x0                 },        /* SLLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000018, &NMD::MUL_32_          , 0,
+       0xfc0003ff, 0x20000018, &MUL_32_          , 0,
        0x0                 },        /* MUL[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000020, 0                      , 0,
@@ -16828,22 +16828,22 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000028, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(5) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000030, &NMD::MFC0             , 0,
+       0xfc0003ff, 0x20000030, &MFC0             , 0,
        0x0                 },        /* MFC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000038, &NMD::MFHC0            , 0,
+       0xfc0003ff, 0x20000038, &MFHC0            , 0,
        CP0_ | MVH_         },        /* MFHC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000040, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(8) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000048, &NMD::SEH              , 0,
+       0xfc0003ff, 0x20000048, &SEH              , 0,
        0x0                 },        /* SEH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000050, &NMD::SRLV             , 0,
+       0xfc0003ff, 0x20000050, &SRLV             , 0,
        0x0                 },        /* SRLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000058, &NMD::MUH              , 0,
+       0xfc0003ff, 0x20000058, &MUH              , 0,
        0x0                 },        /* MUH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000060, 0                      , 0,
@@ -16852,10 +16852,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000068, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(13) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000070, &NMD::MTC0             , 0,
+       0xfc0003ff, 0x20000070, &MTC0             , 0,
        CP0_                },        /* MTC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000078, &NMD::MTHC0            , 0,
+       0xfc0003ff, 0x20000078, &MTHC0            , 0,
        CP0_ | MVH_         },        /* MTHC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000080, 0                      , 0,
@@ -16864,10 +16864,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000088, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(17) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000090, &NMD::SRAV             , 0,
+       0xfc0003ff, 0x20000090, &SRAV             , 0,
        0x0                 },        /* SRAV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000098, &NMD::MULU             , 0,
+       0xfc0003ff, 0x20000098, &MULU             , 0,
        0x0                 },        /* MULU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000a0, 0                      , 0,
@@ -16876,10 +16876,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200000a8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(21) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000b0, &NMD::MFGC0            , 0,
+       0xfc0003ff, 0x200000b0, &MFGC0            , 0,
        CP0_ | VZ_          },        /* MFGC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000b8, &NMD::MFHGC0           , 0,
+       0xfc0003ff, 0x200000b8, &MFHGC0           , 0,
        CP0_ | VZ_ | MVH_   },        /* MFHGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000c0, 0                      , 0,
@@ -16888,10 +16888,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200000c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(25) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000d0, &NMD::ROTRV            , 0,
+       0xfc0003ff, 0x200000d0, &ROTRV            , 0,
        0x0                 },        /* ROTRV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000d8, &NMD::MUHU             , 0,
+       0xfc0003ff, 0x200000d8, &MUHU             , 0,
        0x0                 },        /* MUHU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000e0, 0                      , 0,
@@ -16900,10 +16900,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200000e8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(29) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000f0, &NMD::MTGC0            , 0,
+       0xfc0003ff, 0x200000f0, &MTGC0            , 0,
        CP0_ | VZ_          },        /* MTGC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000f8, &NMD::MTHGC0           , 0,
+       0xfc0003ff, 0x200000f8, &MTHGC0           , 0,
        CP0_ | VZ_ | MVH_   },        /* MTHGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000100, 0                      , 0,
@@ -16912,10 +16912,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000108, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(33) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000110, &NMD::ADD              , 0,
+       0xfc0003ff, 0x20000110, &ADD              , 0,
        XMMS_               },        /* ADD */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000118, &NMD::DIV              , 0,
+       0xfc0003ff, 0x20000118, &DIV              , 0,
        0x0                 },        /* DIV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000120, 0                      , 0,
@@ -16924,7 +16924,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000128, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(37) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000130, &NMD::DMFC0            , 0,
+       0xfc0003ff, 0x20000130, &DMFC0            , 0,
        CP0_ | MIPS64_      },        /* DMFC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000138, 0                      , 0,
@@ -16936,10 +16936,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000148, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(41) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000150, &NMD::ADDU_32_         , 0,
+       0xfc0003ff, 0x20000150, &ADDU_32_         , 0,
        0x0                 },        /* ADDU[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000158, &NMD::MOD              , 0,
+       0xfc0003ff, 0x20000158, &MOD              , 0,
        0x0                 },        /* MOD */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000160, 0                      , 0,
@@ -16948,7 +16948,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000168, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(45) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000170, &NMD::DMTC0            , 0,
+       0xfc0003ff, 0x20000170, &DMTC0            , 0,
        CP0_ | MIPS64_      },        /* DMTC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000178, 0                      , 0,
@@ -16960,10 +16960,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000188, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(49) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000190, &NMD::SUB              , 0,
+       0xfc0003ff, 0x20000190, &SUB              , 0,
        XMMS_               },        /* SUB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000198, &NMD::DIVU             , 0,
+       0xfc0003ff, 0x20000198, &DIVU             , 0,
        0x0                 },        /* DIVU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001a0, 0                      , 0,
@@ -16972,22 +16972,22 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200001a8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(53) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001b0, &NMD::DMFGC0           , 0,
+       0xfc0003ff, 0x200001b0, &DMFGC0           , 0,
        CP0_ | MIPS64_ | VZ_},        /* DMFGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001b8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001c0, &NMD::RDHWR            , 0,
+       0xfc0003ff, 0x200001c0, &RDHWR            , 0,
        XMMS_               },        /* RDHWR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(57) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001d0, &NMD::SUBU_32_         , 0,
+       0xfc0003ff, 0x200001d0, &SUBU_32_         , 0,
        0x0                 },        /* SUBU[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001d8, &NMD::MODU             , 0,
+       0xfc0003ff, 0x200001d8, &MODU             , 0,
        0x0                 },        /* MODU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001e0, 0                      , 0,
@@ -16996,7 +16996,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200001e8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(61) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001f0, &NMD::DMTGC0           , 0,
+       0xfc0003ff, 0x200001f0, &DMTGC0           , 0,
        CP0_ | MIPS64_ | VZ_},        /* DMTGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001f8, 0                      , 0,
@@ -17017,13 +17017,13 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000220, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(68) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000228, &NMD::FORK             , 0,
+       0xfc0003ff, 0x20000228, &FORK             , 0,
        MT_                 },        /* FORK */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000230, &NMD::MFTR             , 0,
+       0xfc0003ff, 0x20000230, &MFTR             , 0,
        MT_                 },        /* MFTR */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000238, &NMD::MFHTR            , 0,
+       0xfc0003ff, 0x20000238, &MFHTR            , 0,
        MT_                 },        /* MFHTR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000240, 0                      , 0,
@@ -17032,7 +17032,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000248, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(73) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000250, &NMD::AND_32_          , 0,
+       0xfc0003ff, 0x20000250, &AND_32_          , 0,
        0x0                 },        /* AND[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000258, 0                      , 0,
@@ -17041,13 +17041,13 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000260, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(76) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000268, &NMD::YIELD            , 0,
+       0xfc0003ff, 0x20000268, &YIELD            , 0,
        MT_                 },        /* YIELD */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000270, &NMD::MTTR             , 0,
+       0xfc0003ff, 0x20000270, &MTTR             , 0,
        MT_                 },        /* MTTR */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000278, &NMD::MTHTR            , 0,
+       0xfc0003ff, 0x20000278, &MTHTR            , 0,
        MT_                 },        /* MTHTR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000280, 0                      , 0,
@@ -17056,7 +17056,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000288, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(81) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000290, &NMD::OR_32_           , 0,
+       0xfc0003ff, 0x20000290, &OR_32_           , 0,
        0x0                 },        /* OR[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000298, 0                      , 0,
@@ -17080,7 +17080,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200002c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(89) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002d0, &NMD::NOR              , 0,
+       0xfc0003ff, 0x200002d0, &NOR              , 0,
        0x0                 },        /* NOR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200002d8, 0                      , 0,
@@ -17104,7 +17104,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000308, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(97) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000310, &NMD::XOR_32_          , 0,
+       0xfc0003ff, 0x20000310, &XOR_32_          , 0,
        0x0                 },        /* XOR[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000318, 0                      , 0,
@@ -17128,7 +17128,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000348, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(105) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000350, &NMD::SLT              , 0,
+       0xfc0003ff, 0x20000350, &SLT              , 0,
        0x0                 },        /* SLT */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000358, 0                      , 0,
@@ -17176,7 +17176,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200003c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(121) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003d0, &NMD::SOV              , 0,
+       0xfc0003ff, 0x200003d0, &SOV              , 0,
        0x0                 },        /* SOV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200003d8, 0                      , 0,
@@ -17198,183 +17198,183 @@ NMD::Pool NMD::_POOL32A0[128] = {
 
 NMD::Pool NMD::ADDQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000000d, &NMD::ADDQ_PH          , 0,
+       0xfc0007ff, 0x2000000d, &ADDQ_PH          , 0,
        DSP_                },        /* ADDQ.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000040d, &NMD::ADDQ_S_PH        , 0,
+       0xfc0007ff, 0x2000040d, &ADDQ_S_PH        , 0,
        DSP_                },        /* ADDQ_S.PH */
 };
 
 
 NMD::Pool NMD::MUL__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000002d, &NMD::MUL_PH           , 0,
+       0xfc0007ff, 0x2000002d, &MUL_PH           , 0,
        DSP_                },        /* MUL.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000042d, &NMD::MUL_S_PH         , 0,
+       0xfc0007ff, 0x2000042d, &MUL_S_PH         , 0,
        DSP_                },        /* MUL_S.PH */
 };
 
 
 NMD::Pool NMD::ADDQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000004d, &NMD::ADDQH_PH         , 0,
+       0xfc0007ff, 0x2000004d, &ADDQH_PH         , 0,
        DSP_                },        /* ADDQH.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000044d, &NMD::ADDQH_R_PH       , 0,
+       0xfc0007ff, 0x2000044d, &ADDQH_R_PH       , 0,
        DSP_                },        /* ADDQH_R.PH */
 };
 
 
 NMD::Pool NMD::ADDQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000008d, &NMD::ADDQH_W          , 0,
+       0xfc0007ff, 0x2000008d, &ADDQH_W          , 0,
        DSP_                },        /* ADDQH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000048d, &NMD::ADDQH_R_W        , 0,
+       0xfc0007ff, 0x2000048d, &ADDQH_R_W        , 0,
        DSP_                },        /* ADDQH_R.W */
 };
 
 
 NMD::Pool NMD::ADDU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200000cd, &NMD::ADDU_QB          , 0,
+       0xfc0007ff, 0x200000cd, &ADDU_QB          , 0,
        DSP_                },        /* ADDU.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200004cd, &NMD::ADDU_S_QB        , 0,
+       0xfc0007ff, 0x200004cd, &ADDU_S_QB        , 0,
        DSP_                },        /* ADDU_S.QB */
 };
 
 
 NMD::Pool NMD::ADDU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000010d, &NMD::ADDU_PH          , 0,
+       0xfc0007ff, 0x2000010d, &ADDU_PH          , 0,
        DSP_                },        /* ADDU.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000050d, &NMD::ADDU_S_PH        , 0,
+       0xfc0007ff, 0x2000050d, &ADDU_S_PH        , 0,
        DSP_                },        /* ADDU_S.PH */
 };
 
 
 NMD::Pool NMD::ADDUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000014d, &NMD::ADDUH_QB         , 0,
+       0xfc0007ff, 0x2000014d, &ADDUH_QB         , 0,
        DSP_                },        /* ADDUH.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000054d, &NMD::ADDUH_R_QB       , 0,
+       0xfc0007ff, 0x2000054d, &ADDUH_R_QB       , 0,
        DSP_                },        /* ADDUH_R.QB */
 };
 
 
 NMD::Pool NMD::SHRAV__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000018d, &NMD::SHRAV_PH         , 0,
+       0xfc0007ff, 0x2000018d, &SHRAV_PH         , 0,
        DSP_                },        /* SHRAV.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000058d, &NMD::SHRAV_R_PH       , 0,
+       0xfc0007ff, 0x2000058d, &SHRAV_R_PH       , 0,
        DSP_                },        /* SHRAV_R.PH */
 };
 
 
 NMD::Pool NMD::SHRAV__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200001cd, &NMD::SHRAV_QB         , 0,
+       0xfc0007ff, 0x200001cd, &SHRAV_QB         , 0,
        DSP_                },        /* SHRAV.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200005cd, &NMD::SHRAV_R_QB       , 0,
+       0xfc0007ff, 0x200005cd, &SHRAV_R_QB       , 0,
        DSP_                },        /* SHRAV_R.QB */
 };
 
 
 NMD::Pool NMD::SUBQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000020d, &NMD::SUBQ_PH          , 0,
+       0xfc0007ff, 0x2000020d, &SUBQ_PH          , 0,
        DSP_                },        /* SUBQ.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000060d, &NMD::SUBQ_S_PH        , 0,
+       0xfc0007ff, 0x2000060d, &SUBQ_S_PH        , 0,
        DSP_                },        /* SUBQ_S.PH */
 };
 
 
 NMD::Pool NMD::SUBQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000024d, &NMD::SUBQH_PH         , 0,
+       0xfc0007ff, 0x2000024d, &SUBQH_PH         , 0,
        DSP_                },        /* SUBQH.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000064d, &NMD::SUBQH_R_PH       , 0,
+       0xfc0007ff, 0x2000064d, &SUBQH_R_PH       , 0,
        DSP_                },        /* SUBQH_R.PH */
 };
 
 
 NMD::Pool NMD::SUBQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000028d, &NMD::SUBQH_W          , 0,
+       0xfc0007ff, 0x2000028d, &SUBQH_W          , 0,
        DSP_                },        /* SUBQH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000068d, &NMD::SUBQH_R_W        , 0,
+       0xfc0007ff, 0x2000068d, &SUBQH_R_W        , 0,
        DSP_                },        /* SUBQH_R.W */
 };
 
 
 NMD::Pool NMD::SUBU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200002cd, &NMD::SUBU_QB          , 0,
+       0xfc0007ff, 0x200002cd, &SUBU_QB          , 0,
        DSP_                },        /* SUBU.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200006cd, &NMD::SUBU_S_QB        , 0,
+       0xfc0007ff, 0x200006cd, &SUBU_S_QB        , 0,
        DSP_                },        /* SUBU_S.QB */
 };
 
 
 NMD::Pool NMD::SUBU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000030d, &NMD::SUBU_PH          , 0,
+       0xfc0007ff, 0x2000030d, &SUBU_PH          , 0,
        DSP_                },        /* SUBU.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000070d, &NMD::SUBU_S_PH        , 0,
+       0xfc0007ff, 0x2000070d, &SUBU_S_PH        , 0,
        DSP_                },        /* SUBU_S.PH */
 };
 
 
 NMD::Pool NMD::SHRA__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000335, &NMD::SHRA_PH          , 0,
+       0xfc0007ff, 0x20000335, &SHRA_PH          , 0,
        DSP_                },        /* SHRA.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000735, &NMD::SHRA_R_PH        , 0,
+       0xfc0007ff, 0x20000735, &SHRA_R_PH        , 0,
        DSP_                },        /* SHRA_R.PH */
 };
 
 
 NMD::Pool NMD::SUBUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000034d, &NMD::SUBUH_QB         , 0,
+       0xfc0007ff, 0x2000034d, &SUBUH_QB         , 0,
        DSP_                },        /* SUBUH.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000074d, &NMD::SUBUH_R_QB       , 0,
+       0xfc0007ff, 0x2000074d, &SUBUH_R_QB       , 0,
        DSP_                },        /* SUBUH_R.QB */
 };
 
 
 NMD::Pool NMD::SHLLV__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000038d, &NMD::SHLLV_PH         , 0,
+       0xfc0007ff, 0x2000038d, &SHLLV_PH         , 0,
        DSP_                },        /* SHLLV.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000078d, &NMD::SHLLV_S_PH       , 0,
+       0xfc0007ff, 0x2000078d, &SHLLV_S_PH       , 0,
        DSP_                },        /* SHLLV_S.PH */
 };
 
 
 NMD::Pool NMD::SHLL__S__PH[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x200003b5, &NMD::SHLL_PH          , 0,
+       0xfc000fff, 0x200003b5, &SHLL_PH          , 0,
        DSP_                },        /* SHLL.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000fff, 0x200007b5, 0                      , 0,
        0x0                 },        /* SHLL[_S].PH~*(1) */
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x20000bb5, &NMD::SHLL_S_PH        , 0,
+       0xfc000fff, 0x20000bb5, &SHLL_S_PH        , 0,
        DSP_                },        /* SHLL_S.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000fff, 0x20000fb5, 0                      , 0,
@@ -17384,17 +17384,17 @@ NMD::Pool NMD::SHLL__S__PH[4] = {
 
 NMD::Pool NMD::PRECR_SRA__R__PH_W[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200003cd, &NMD::PRECR_SRA_PH_W   , 0,
+       0xfc0007ff, 0x200003cd, &PRECR_SRA_PH_W   , 0,
        DSP_                },        /* PRECR_SRA.PH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200007cd, &NMD::PRECR_SRA_R_PH_W , 0,
+       0xfc0007ff, 0x200007cd, &PRECR_SRA_R_PH_W , 0,
        DSP_                },        /* PRECR_SRA_R.PH.W */
 };
 
 
 NMD::Pool NMD::_POOL32A5[128] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000005, &NMD::CMP_EQ_PH        , 0,
+       0xfc0003ff, 0x20000005, &CMP_EQ_PH        , 0,
        DSP_                },        /* CMP.EQ.PH */
     { pool                , ADDQ__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000000d, 0                      , 0,
@@ -17403,10 +17403,10 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000015, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(2) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000001d, &NMD::SHILO            , 0,
+       0xfc0003ff, 0x2000001d, &SHILO            , 0,
        DSP_                },        /* SHILO */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000025, &NMD::MULEQ_S_W_PHL    , 0,
+       0xfc0003ff, 0x20000025, &MULEQ_S_W_PHL    , 0,
        DSP_                },        /* MULEQ_S.W.PHL */
     { pool                , MUL__S__PH          , 2   , 32,
        0xfc0003ff, 0x2000002d, 0                      , 0,
@@ -17415,10 +17415,10 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000035, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(6) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000003d, &NMD::REPL_PH          , 0,
+       0xfc0003ff, 0x2000003d, &REPL_PH          , 0,
        DSP_                },        /* REPL.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000045, &NMD::CMP_LT_PH        , 0,
+       0xfc0003ff, 0x20000045, &CMP_LT_PH        , 0,
        DSP_                },        /* CMP.LT.PH */
     { pool                , ADDQH__R__PH        , 2   , 32,
        0xfc0003ff, 0x2000004d, 0                      , 0,
@@ -17430,10 +17430,10 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000005d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(11) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000065, &NMD::MULEQ_S_W_PHR    , 0,
+       0xfc0003ff, 0x20000065, &MULEQ_S_W_PHR    , 0,
        DSP_                },        /* MULEQ_S.W.PHR */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000006d, &NMD::PRECR_QB_PH      , 0,
+       0xfc0003ff, 0x2000006d, &PRECR_QB_PH      , 0,
        DSP_                },        /* PRECR.QB.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000075, 0                      , 0,
@@ -17442,13 +17442,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000007d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000085, &NMD::CMP_LE_PH        , 0,
+       0xfc0003ff, 0x20000085, &CMP_LE_PH        , 0,
        DSP_                },        /* CMP.LE.PH */
     { pool                , ADDQH__R__W         , 2   , 32,
        0xfc0003ff, 0x2000008d, 0                      , 0,
        0x0                 },        /* ADDQH[_R].W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000095, &NMD::MULEU_S_PH_QBL   , 0,
+       0xfc0003ff, 0x20000095, &MULEU_S_PH_QBL   , 0,
        DSP_                },        /* MULEU_S.PH.QBL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000009d, 0                      , 0,
@@ -17457,7 +17457,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000a5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(20) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000ad, &NMD::PRECRQ_QB_PH     , 0,
+       0xfc0003ff, 0x200000ad, &PRECRQ_QB_PH     , 0,
        DSP_                },        /* PRECRQ.QB.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000b5, 0                      , 0,
@@ -17466,13 +17466,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000c5, &NMD::CMPGU_EQ_QB      , 0,
+       0xfc0003ff, 0x200000c5, &CMPGU_EQ_QB      , 0,
        DSP_                },        /* CMPGU.EQ.QB */
     { pool                , ADDU__S__QB         , 2   , 32,
        0xfc0003ff, 0x200000cd, 0                      , 0,
        0x0                 },        /* ADDU[_S].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000d5, &NMD::MULEU_S_PH_QBR   , 0,
+       0xfc0003ff, 0x200000d5, &MULEU_S_PH_QBR   , 0,
        DSP_                },        /* MULEU_S.PH.QBR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000dd, 0                      , 0,
@@ -17481,7 +17481,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000e5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(28) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000ed, &NMD::PRECRQ_PH_W      , 0,
+       0xfc0003ff, 0x200000ed, &PRECRQ_PH_W      , 0,
        DSP_                },        /* PRECRQ.PH.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000f5, 0                      , 0,
@@ -17490,13 +17490,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000fd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(31) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000105, &NMD::CMPGU_LT_QB      , 0,
+       0xfc0003ff, 0x20000105, &CMPGU_LT_QB      , 0,
        DSP_                },        /* CMPGU.LT.QB */
     { pool                , ADDU__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000010d, 0                      , 0,
        0x0                 },        /* ADDU[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000115, &NMD::MULQ_RS_PH       , 0,
+       0xfc0003ff, 0x20000115, &MULQ_RS_PH       , 0,
        DSP_                },        /* MULQ_RS.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000011d, 0                      , 0,
@@ -17505,7 +17505,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000125, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(36) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000012d, &NMD::PRECRQ_RS_PH_W   , 0,
+       0xfc0003ff, 0x2000012d, &PRECRQ_RS_PH_W   , 0,
        DSP_                },        /* PRECRQ_RS.PH.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000135, 0                      , 0,
@@ -17514,13 +17514,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000013d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(39) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000145, &NMD::CMPGU_LE_QB      , 0,
+       0xfc0003ff, 0x20000145, &CMPGU_LE_QB      , 0,
        DSP_                },        /* CMPGU.LE.QB */
     { pool                , ADDUH__R__QB        , 2   , 32,
        0xfc0003ff, 0x2000014d, 0                      , 0,
        0x0                 },        /* ADDUH[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000155, &NMD::MULQ_S_PH        , 0,
+       0xfc0003ff, 0x20000155, &MULQ_S_PH        , 0,
        DSP_                },        /* MULQ_S.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000015d, 0                      , 0,
@@ -17529,7 +17529,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000165, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(44) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000016d, &NMD::PRECRQU_S_QB_PH  , 0,
+       0xfc0003ff, 0x2000016d, &PRECRQU_S_QB_PH  , 0,
        DSP_                },        /* PRECRQU_S.QB.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000175, 0                      , 0,
@@ -17538,13 +17538,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000017d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(47) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000185, &NMD::CMPGDU_EQ_QB     , 0,
+       0xfc0003ff, 0x20000185, &CMPGDU_EQ_QB     , 0,
        DSP_                },        /* CMPGDU.EQ.QB */
     { pool                , SHRAV__R__PH        , 2   , 32,
        0xfc0003ff, 0x2000018d, 0                      , 0,
        0x0                 },        /* SHRAV[_R].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000195, &NMD::MULQ_RS_W        , 0,
+       0xfc0003ff, 0x20000195, &MULQ_RS_W        , 0,
        DSP_                },        /* MULQ_RS.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000019d, 0                      , 0,
@@ -17553,7 +17553,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001a5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(52) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001ad, &NMD::PACKRL_PH        , 0,
+       0xfc0003ff, 0x200001ad, &PACKRL_PH        , 0,
        DSP_                },        /* PACKRL.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001b5, 0                      , 0,
@@ -17562,13 +17562,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001c5, &NMD::CMPGDU_LT_QB     , 0,
+       0xfc0003ff, 0x200001c5, &CMPGDU_LT_QB     , 0,
        DSP_                },        /* CMPGDU.LT.QB */
     { pool                , SHRAV__R__QB        , 2   , 32,
        0xfc0003ff, 0x200001cd, 0                      , 0,
        0x0                 },        /* SHRAV[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001d5, &NMD::MULQ_S_W         , 0,
+       0xfc0003ff, 0x200001d5, &MULQ_S_W         , 0,
        DSP_                },        /* MULQ_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001dd, 0                      , 0,
@@ -17577,7 +17577,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001e5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(60) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001ed, &NMD::PICK_QB          , 0,
+       0xfc0003ff, 0x200001ed, &PICK_QB          , 0,
        DSP_                },        /* PICK.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001f5, 0                      , 0,
@@ -17586,13 +17586,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001fd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(63) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000205, &NMD::CMPGDU_LE_QB     , 0,
+       0xfc0003ff, 0x20000205, &CMPGDU_LE_QB     , 0,
        DSP_                },        /* CMPGDU.LE.QB */
     { pool                , SUBQ__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000020d, 0                      , 0,
        0x0                 },        /* SUBQ[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000215, &NMD::APPEND           , 0,
+       0xfc0003ff, 0x20000215, &APPEND           , 0,
        DSP_                },        /* APPEND */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000021d, 0                      , 0,
@@ -17601,7 +17601,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000225, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(68) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000022d, &NMD::PICK_PH          , 0,
+       0xfc0003ff, 0x2000022d, &PICK_PH          , 0,
        DSP_                },        /* PICK.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000235, 0                      , 0,
@@ -17610,13 +17610,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000023d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(71) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000245, &NMD::CMPU_EQ_QB       , 0,
+       0xfc0003ff, 0x20000245, &CMPU_EQ_QB       , 0,
        DSP_                },        /* CMPU.EQ.QB */
     { pool                , SUBQH__R__PH        , 2   , 32,
        0xfc0003ff, 0x2000024d, 0                      , 0,
        0x0                 },        /* SUBQH[_R].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000255, &NMD::PREPEND          , 0,
+       0xfc0003ff, 0x20000255, &PREPEND          , 0,
        DSP_                },        /* PREPEND */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000025d, 0                      , 0,
@@ -17634,13 +17634,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000027d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(79) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000285, &NMD::CMPU_LT_QB       , 0,
+       0xfc0003ff, 0x20000285, &CMPU_LT_QB       , 0,
        DSP_                },        /* CMPU.LT.QB */
     { pool                , SUBQH__R__W         , 2   , 32,
        0xfc0003ff, 0x2000028d, 0                      , 0,
        0x0                 },        /* SUBQH[_R].W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000295, &NMD::MODSUB           , 0,
+       0xfc0003ff, 0x20000295, &MODSUB           , 0,
        DSP_                },        /* MODSUB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000029d, 0                      , 0,
@@ -17658,13 +17658,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200002bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(87) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002c5, &NMD::CMPU_LE_QB       , 0,
+       0xfc0003ff, 0x200002c5, &CMPU_LE_QB       , 0,
        DSP_                },        /* CMPU.LE.QB */
     { pool                , SUBU__S__QB         , 2   , 32,
        0xfc0003ff, 0x200002cd, 0                      , 0,
        0x0                 },        /* SUBU[_S].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002d5, &NMD::SHRAV_R_W        , 0,
+       0xfc0003ff, 0x200002d5, &SHRAV_R_W        , 0,
        DSP_                },        /* SHRAV_R.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200002dd, 0                      , 0,
@@ -17676,19 +17676,19 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200002ed, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(93) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002f5, &NMD::SHRA_R_W         , 0,
+       0xfc0003ff, 0x200002f5, &SHRA_R_W         , 0,
        DSP_                },        /* SHRA_R.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200002fd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(95) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000305, &NMD::ADDQ_S_W         , 0,
+       0xfc0003ff, 0x20000305, &ADDQ_S_W         , 0,
        DSP_                },        /* ADDQ_S.W */
     { pool                , SUBU__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000030d, 0                      , 0,
        0x0                 },        /* SUBU[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000315, &NMD::SHRLV_PH         , 0,
+       0xfc0003ff, 0x20000315, &SHRLV_PH         , 0,
        DSP_                },        /* SHRLV.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000031d, 0                      , 0,
@@ -17706,13 +17706,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000033d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(103) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000345, &NMD::SUBQ_S_W         , 0,
+       0xfc0003ff, 0x20000345, &SUBQ_S_W         , 0,
        DSP_                },        /* SUBQ_S.W */
     { pool                , SUBUH__R__QB        , 2   , 32,
        0xfc0003ff, 0x2000034d, 0                      , 0,
        0x0                 },        /* SUBUH[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000355, &NMD::SHRLV_QB         , 0,
+       0xfc0003ff, 0x20000355, &SHRLV_QB         , 0,
        DSP_                },        /* SHRLV.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000035d, 0                      , 0,
@@ -17730,13 +17730,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000037d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(111) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000385, &NMD::ADDSC            , 0,
+       0xfc0003ff, 0x20000385, &ADDSC            , 0,
        DSP_                },        /* ADDSC */
     { pool                , SHLLV__S__PH        , 2   , 32,
        0xfc0003ff, 0x2000038d, 0                      , 0,
        0x0                 },        /* SHLLV[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000395, &NMD::SHLLV_QB         , 0,
+       0xfc0003ff, 0x20000395, &SHLLV_QB         , 0,
        DSP_                },        /* SHLLV.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000039d, 0                      , 0,
@@ -17754,13 +17754,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200003bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(119) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003c5, &NMD::ADDWC            , 0,
+       0xfc0003ff, 0x200003c5, &ADDWC            , 0,
        DSP_                },        /* ADDWC */
     { pool                , PRECR_SRA__R__PH_W  , 2   , 32,
        0xfc0003ff, 0x200003cd, 0                      , 0,
        0x0                 },        /* PRECR_SRA[_R].PH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003d5, &NMD::SHLLV_S_W        , 0,
+       0xfc0003ff, 0x200003d5, &SHLLV_S_W        , 0,
        DSP_                },        /* SHLLV_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200003dd, 0                      , 0,
@@ -17772,7 +17772,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200003ed, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(125) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003f5, &NMD::SHLL_S_W         , 0,
+       0xfc0003ff, 0x200003f5, &SHLL_S_W         , 0,
        DSP_                },        /* SHLL_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200003fd, 0                      , 0,
@@ -17782,52 +17782,52 @@ NMD::Pool NMD::_POOL32A5[128] = {
 
 NMD::Pool NMD::PP_LSX[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000007, &NMD::LBX              , 0,
+       0xfc0007ff, 0x20000007, &LBX              , 0,
        0x0                 },        /* LBX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000087, &NMD::SBX              , 0,
+       0xfc0007ff, 0x20000087, &SBX              , 0,
        XMMS_               },        /* SBX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000107, &NMD::LBUX             , 0,
+       0xfc0007ff, 0x20000107, &LBUX             , 0,
        0x0                 },        /* LBUX */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0x20000187, 0                      , 0,
        0x0                 },        /* PP.LSX~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000207, &NMD::LHX              , 0,
+       0xfc0007ff, 0x20000207, &LHX              , 0,
        0x0                 },        /* LHX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000287, &NMD::SHX              , 0,
+       0xfc0007ff, 0x20000287, &SHX              , 0,
        XMMS_               },        /* SHX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000307, &NMD::LHUX             , 0,
+       0xfc0007ff, 0x20000307, &LHUX             , 0,
        0x0                 },        /* LHUX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000387, &NMD::LWUX             , 0,
+       0xfc0007ff, 0x20000387, &LWUX             , 0,
        MIPS64_             },        /* LWUX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000407, &NMD::LWX              , 0,
+       0xfc0007ff, 0x20000407, &LWX              , 0,
        0x0                 },        /* LWX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000487, &NMD::SWX              , 0,
+       0xfc0007ff, 0x20000487, &SWX              , 0,
        XMMS_               },        /* SWX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000507, &NMD::LWC1X            , 0,
+       0xfc0007ff, 0x20000507, &LWC1X            , 0,
        CP1_                },        /* LWC1X */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000587, &NMD::SWC1X            , 0,
+       0xfc0007ff, 0x20000587, &SWC1X            , 0,
        CP1_                },        /* SWC1X */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000607, &NMD::LDX              , 0,
+       0xfc0007ff, 0x20000607, &LDX              , 0,
        MIPS64_             },        /* LDX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000687, &NMD::SDX              , 0,
+       0xfc0007ff, 0x20000687, &SDX              , 0,
        MIPS64_             },        /* SDX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000707, &NMD::LDC1X            , 0,
+       0xfc0007ff, 0x20000707, &LDC1X            , 0,
        CP1_                },        /* LDC1X */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000787, &NMD::SDC1X            , 0,
+       0xfc0007ff, 0x20000787, &SDC1X            , 0,
        CP1_                },        /* SDC1X */
 };
 
@@ -17846,40 +17846,40 @@ NMD::Pool NMD::PP_LSXS[16] = {
        0xfc0007ff, 0x200001c7, 0                      , 0,
        0x0                 },        /* PP.LSXS~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000247, &NMD::LHXS             , 0,
+       0xfc0007ff, 0x20000247, &LHXS             , 0,
        0x0                 },        /* LHXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200002c7, &NMD::SHXS             , 0,
+       0xfc0007ff, 0x200002c7, &SHXS             , 0,
        XMMS_               },        /* SHXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000347, &NMD::LHUXS            , 0,
+       0xfc0007ff, 0x20000347, &LHUXS            , 0,
        0x0                 },        /* LHUXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200003c7, &NMD::LWUXS            , 0,
+       0xfc0007ff, 0x200003c7, &LWUXS            , 0,
        MIPS64_             },        /* LWUXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000447, &NMD::LWXS_32_         , 0,
+       0xfc0007ff, 0x20000447, &LWXS_32_         , 0,
        0x0                 },        /* LWXS[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200004c7, &NMD::SWXS             , 0,
+       0xfc0007ff, 0x200004c7, &SWXS             , 0,
        XMMS_               },        /* SWXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000547, &NMD::LWC1XS           , 0,
+       0xfc0007ff, 0x20000547, &LWC1XS           , 0,
        CP1_                },        /* LWC1XS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200005c7, &NMD::SWC1XS           , 0,
+       0xfc0007ff, 0x200005c7, &SWC1XS           , 0,
        CP1_                },        /* SWC1XS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000647, &NMD::LDXS             , 0,
+       0xfc0007ff, 0x20000647, &LDXS             , 0,
        MIPS64_             },        /* LDXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200006c7, &NMD::SDXS             , 0,
+       0xfc0007ff, 0x200006c7, &SDXS             , 0,
        MIPS64_             },        /* SDXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000747, &NMD::LDC1XS           , 0,
+       0xfc0007ff, 0x20000747, &LDC1XS           , 0,
        CP1_                },        /* LDC1XS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200007c7, &NMD::SDC1XS           , 0,
+       0xfc0007ff, 0x200007c7, &SDC1XS           , 0,
        CP1_                },        /* SDC1XS */
 };
 
@@ -17896,26 +17896,26 @@ NMD::Pool NMD::P_LSX[2] = {
 
 NMD::Pool NMD::POOL32Axf_1_0[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000007f, &NMD::MFHI_DSP_        , 0,
+       0xfc003fff, 0x2000007f, &MFHI_DSP_        , 0,
        DSP_                },        /* MFHI[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000107f, &NMD::MFLO_DSP_        , 0,
+       0xfc003fff, 0x2000107f, &MFLO_DSP_        , 0,
        DSP_                },        /* MFLO[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000207f, &NMD::MTHI_DSP_        , 0,
+       0xfc003fff, 0x2000207f, &MTHI_DSP_        , 0,
        DSP_                },        /* MTHI[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000307f, &NMD::MTLO_DSP_        , 0,
+       0xfc003fff, 0x2000307f, &MTLO_DSP_        , 0,
        DSP_                },        /* MTLO[DSP] */
 };
 
 
 NMD::Pool NMD::POOL32Axf_1_1[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000027f, &NMD::MTHLIP           , 0,
+       0xfc003fff, 0x2000027f, &MTHLIP           , 0,
        DSP_                },        /* MTHLIP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000127f, &NMD::SHILOV           , 0,
+       0xfc003fff, 0x2000127f, &SHILOV           , 0,
        DSP_                },        /* SHILOV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0x2000227f, 0                      , 0,
@@ -17928,46 +17928,46 @@ NMD::Pool NMD::POOL32Axf_1_1[4] = {
 
 NMD::Pool NMD::POOL32Axf_1_3[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000067f, &NMD::RDDSP            , 0,
+       0xfc003fff, 0x2000067f, &RDDSP            , 0,
        DSP_                },        /* RDDSP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000167f, &NMD::WRDSP            , 0,
+       0xfc003fff, 0x2000167f, &WRDSP            , 0,
        DSP_                },        /* WRDSP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000267f, &NMD::EXTP             , 0,
+       0xfc003fff, 0x2000267f, &EXTP             , 0,
        DSP_                },        /* EXTP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000367f, &NMD::EXTPDP           , 0,
+       0xfc003fff, 0x2000367f, &EXTPDP           , 0,
        DSP_                },        /* EXTPDP */
 };
 
 
 NMD::Pool NMD::POOL32Axf_1_4[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x2000087f, &NMD::SHLL_QB          , 0,
+       0xfc001fff, 0x2000087f, &SHLL_QB          , 0,
        DSP_                },        /* SHLL.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x2000187f, &NMD::SHRL_QB          , 0,
+       0xfc001fff, 0x2000187f, &SHRL_QB          , 0,
        DSP_                },        /* SHRL.QB */
 };
 
 
 NMD::Pool NMD::MAQ_S_A__W_PHR[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000a7f, &NMD::MAQ_S_W_PHR      , 0,
+       0xfc003fff, 0x20000a7f, &MAQ_S_W_PHR      , 0,
        DSP_                },        /* MAQ_S.W.PHR */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002a7f, &NMD::MAQ_SA_W_PHR     , 0,
+       0xfc003fff, 0x20002a7f, &MAQ_SA_W_PHR     , 0,
        DSP_                },        /* MAQ_SA.W.PHR */
 };
 
 
 NMD::Pool NMD::MAQ_S_A__W_PHL[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001a7f, &NMD::MAQ_S_W_PHL      , 0,
+       0xfc003fff, 0x20001a7f, &MAQ_S_W_PHL      , 0,
        DSP_                },        /* MAQ_S.W.PHL */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003a7f, &NMD::MAQ_SA_W_PHL     , 0,
+       0xfc003fff, 0x20003a7f, &MAQ_SA_W_PHL     , 0,
        DSP_                },        /* MAQ_SA.W.PHL */
 };
 
@@ -17984,16 +17984,16 @@ NMD::Pool NMD::POOL32Axf_1_5[2] = {
 
 NMD::Pool NMD::POOL32Axf_1_7[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000e7f, &NMD::EXTR_W           , 0,
+       0xfc003fff, 0x20000e7f, &EXTR_W           , 0,
        DSP_                },        /* EXTR.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001e7f, &NMD::EXTR_R_W         , 0,
+       0xfc003fff, 0x20001e7f, &EXTR_R_W         , 0,
        DSP_                },        /* EXTR_R.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002e7f, &NMD::EXTR_RS_W        , 0,
+       0xfc003fff, 0x20002e7f, &EXTR_RS_W        , 0,
        DSP_                },        /* EXTR_RS.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003e7f, &NMD::EXTR_S_H         , 0,
+       0xfc003fff, 0x20003e7f, &EXTR_S_H         , 0,
        DSP_                },        /* EXTR_S.H */
 };
 
@@ -18028,112 +18028,112 @@ NMD::Pool NMD::POOL32Axf_1[8] = {
 
 NMD::Pool NMD::POOL32Axf_2_DSP__0_7[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200000bf, &NMD::DPA_W_PH         , 0,
+       0xfc003fff, 0x200000bf, &DPA_W_PH         , 0,
        DSP_                },        /* DPA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200002bf, &NMD::DPAQ_S_W_PH      , 0,
+       0xfc003fff, 0x200002bf, &DPAQ_S_W_PH      , 0,
        DSP_                },        /* DPAQ_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200004bf, &NMD::DPS_W_PH         , 0,
+       0xfc003fff, 0x200004bf, &DPS_W_PH         , 0,
        DSP_                },        /* DPS.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200006bf, &NMD::DPSQ_S_W_PH      , 0,
+       0xfc003fff, 0x200006bf, &DPSQ_S_W_PH      , 0,
        DSP_                },        /* DPSQ_S.W.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0x200008bf, 0                      , 0,
        0x0                 },        /* POOL32Axf_2(DSP)_0_7~*(4) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000abf, &NMD::MADD_DSP_        , 0,
+       0xfc003fff, 0x20000abf, &MADD_DSP_        , 0,
        DSP_                },        /* MADD[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000cbf, &NMD::MULT_DSP_        , 0,
+       0xfc003fff, 0x20000cbf, &MULT_DSP_        , 0,
        DSP_                },        /* MULT[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000ebf, &NMD::EXTRV_W          , 0,
+       0xfc003fff, 0x20000ebf, &EXTRV_W          , 0,
        DSP_                },        /* EXTRV.W */
 };
 
 
 NMD::Pool NMD::POOL32Axf_2_DSP__8_15[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200010bf, &NMD::DPAX_W_PH        , 0,
+       0xfc003fff, 0x200010bf, &DPAX_W_PH        , 0,
        DSP_                },        /* DPAX.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200012bf, &NMD::DPAQ_SA_L_W      , 0,
+       0xfc003fff, 0x200012bf, &DPAQ_SA_L_W      , 0,
        DSP_                },        /* DPAQ_SA.L.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200014bf, &NMD::DPSX_W_PH        , 0,
+       0xfc003fff, 0x200014bf, &DPSX_W_PH        , 0,
        DSP_                },        /* DPSX.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200016bf, &NMD::DPSQ_SA_L_W      , 0,
+       0xfc003fff, 0x200016bf, &DPSQ_SA_L_W      , 0,
        DSP_                },        /* DPSQ_SA.L.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0x200018bf, 0                      , 0,
        0x0                 },        /* POOL32Axf_2(DSP)_8_15~*(4) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001abf, &NMD::MADDU_DSP_       , 0,
+       0xfc003fff, 0x20001abf, &MADDU_DSP_       , 0,
        DSP_                },        /* MADDU[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001cbf, &NMD::MULTU_DSP_       , 0,
+       0xfc003fff, 0x20001cbf, &MULTU_DSP_       , 0,
        DSP_                },        /* MULTU[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001ebf, &NMD::EXTRV_R_W        , 0,
+       0xfc003fff, 0x20001ebf, &EXTRV_R_W        , 0,
        DSP_                },        /* EXTRV_R.W */
 };
 
 
 NMD::Pool NMD::POOL32Axf_2_DSP__16_23[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200020bf, &NMD::DPAU_H_QBL       , 0,
+       0xfc003fff, 0x200020bf, &DPAU_H_QBL       , 0,
        DSP_                },        /* DPAU.H.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200022bf, &NMD::DPAQX_S_W_PH     , 0,
+       0xfc003fff, 0x200022bf, &DPAQX_S_W_PH     , 0,
        DSP_                },        /* DPAQX_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200024bf, &NMD::DPSU_H_QBL       , 0,
+       0xfc003fff, 0x200024bf, &DPSU_H_QBL       , 0,
        DSP_                },        /* DPSU.H.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200026bf, &NMD::DPSQX_S_W_PH     , 0,
+       0xfc003fff, 0x200026bf, &DPSQX_S_W_PH     , 0,
        DSP_                },        /* DPSQX_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200028bf, &NMD::EXTPV            , 0,
+       0xfc003fff, 0x200028bf, &EXTPV            , 0,
        DSP_                },        /* EXTPV */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002abf, &NMD::MSUB_DSP_        , 0,
+       0xfc003fff, 0x20002abf, &MSUB_DSP_        , 0,
        DSP_                },        /* MSUB[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002cbf, &NMD::MULSA_W_PH       , 0,
+       0xfc003fff, 0x20002cbf, &MULSA_W_PH       , 0,
        DSP_                },        /* MULSA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002ebf, &NMD::EXTRV_RS_W       , 0,
+       0xfc003fff, 0x20002ebf, &EXTRV_RS_W       , 0,
        DSP_                },        /* EXTRV_RS.W */
 };
 
 
 NMD::Pool NMD::POOL32Axf_2_DSP__24_31[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200030bf, &NMD::DPAU_H_QBR       , 0,
+       0xfc003fff, 0x200030bf, &DPAU_H_QBR       , 0,
        DSP_                },        /* DPAU.H.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200032bf, &NMD::DPAQX_SA_W_PH    , 0,
+       0xfc003fff, 0x200032bf, &DPAQX_SA_W_PH    , 0,
        DSP_                },        /* DPAQX_SA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200034bf, &NMD::DPSU_H_QBR       , 0,
+       0xfc003fff, 0x200034bf, &DPSU_H_QBR       , 0,
        DSP_                },        /* DPSU.H.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200036bf, &NMD::DPSQX_SA_W_PH    , 0,
+       0xfc003fff, 0x200036bf, &DPSQX_SA_W_PH    , 0,
        DSP_                },        /* DPSQX_SA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200038bf, &NMD::EXTPDPV          , 0,
+       0xfc003fff, 0x200038bf, &EXTPDPV          , 0,
        DSP_                },        /* EXTPDPV */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003abf, &NMD::MSUBU_DSP_       , 0,
+       0xfc003fff, 0x20003abf, &MSUBU_DSP_       , 0,
        DSP_                },        /* MSUBU[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003cbf, &NMD::MULSAQ_S_W_PH    , 0,
+       0xfc003fff, 0x20003cbf, &MULSAQ_S_W_PH    , 0,
        DSP_                },        /* MULSAQ_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003ebf, &NMD::EXTRV_S_H        , 0,
+       0xfc003fff, 0x20003ebf, &EXTRV_S_H        , 0,
        DSP_                },        /* EXTRV_S.H */
 };
 
@@ -18156,10 +18156,10 @@ NMD::Pool NMD::POOL32Axf_2[4] = {
 
 NMD::Pool NMD::POOL32Axf_4[128] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000013f, &NMD::ABSQ_S_QB        , 0,
+       0xfc00ffff, 0x2000013f, &ABSQ_S_QB        , 0,
        DSP_                },        /* ABSQ_S.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000033f, &NMD::REPLV_PH         , 0,
+       0xfc00ffff, 0x2000033f, &REPLV_PH         , 0,
        DSP_                },        /* REPLV.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000053f, 0                      , 0,
@@ -18180,10 +18180,10 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20000f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000113f, &NMD::ABSQ_S_PH        , 0,
+       0xfc00ffff, 0x2000113f, &ABSQ_S_PH        , 0,
        DSP_                },        /* ABSQ_S.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000133f, &NMD::REPLV_QB         , 0,
+       0xfc00ffff, 0x2000133f, &REPLV_QB         , 0,
        DSP_                },        /* REPLV.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000153f, 0                      , 0,
@@ -18204,7 +18204,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20001f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000213f, &NMD::ABSQ_S_W         , 0,
+       0xfc00ffff, 0x2000213f, &ABSQ_S_W         , 0,
        DSP_                },        /* ABSQ_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000233f, 0                      , 0,
@@ -18252,7 +18252,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20003f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(31) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000413f, &NMD::INSV             , 0,
+       0xfc00ffff, 0x2000413f, &INSV             , 0,
        DSP_                },        /* INSV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000433f, 0                      , 0,
@@ -18267,16 +18267,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000493f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(36) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20004b3f, &NMD::CLO              , 0,
+       0xfc00ffff, 0x20004b3f, &CLO              , 0,
        XMMS_               },        /* CLO */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20004d3f, &NMD::MFC2             , 0,
+       0xfc00ffff, 0x20004d3f, &MFC2             , 0,
        CP2_                },        /* MFC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20004f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(39) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000513f, &NMD::PRECEQ_W_PHL     , 0,
+       0xfc00ffff, 0x2000513f, &PRECEQ_W_PHL     , 0,
        DSP_                },        /* PRECEQ.W.PHL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000533f, 0                      , 0,
@@ -18291,16 +18291,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000593f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(44) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20005b3f, &NMD::CLZ              , 0,
+       0xfc00ffff, 0x20005b3f, &CLZ              , 0,
        XMMS_               },        /* CLZ */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20005d3f, &NMD::MTC2             , 0,
+       0xfc00ffff, 0x20005d3f, &MTC2             , 0,
        CP2_                },        /* MTC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20005f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(47) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000613f, &NMD::PRECEQ_W_PHR     , 0,
+       0xfc00ffff, 0x2000613f, &PRECEQ_W_PHR     , 0,
        DSP_                },        /* PRECEQ.W.PHR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000633f, 0                      , 0,
@@ -18318,16 +18318,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20006b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(53) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20006d3f, &NMD::DMFC2            , 0,
+       0xfc00ffff, 0x20006d3f, &DMFC2            , 0,
        CP2_                },        /* DMFC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20006f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000713f, &NMD::PRECEQU_PH_QBL   , 0,
+       0xfc00ffff, 0x2000713f, &PRECEQU_PH_QBL   , 0,
        DSP_                },        /* PRECEQU.PH.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000733f, &NMD::PRECEQU_PH_QBLA  , 0,
+       0xfc00ffff, 0x2000733f, &PRECEQU_PH_QBLA  , 0,
        DSP_                },        /* PRECEQU.PH.QBLA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000753f, 0                      , 0,
@@ -18342,7 +18342,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20007b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(61) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20007d3f, &NMD::DMTC2            , 0,
+       0xfc00ffff, 0x20007d3f, &DMTC2            , 0,
        CP2_                },        /* DMTC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20007f3f, 0                      , 0,
@@ -18366,16 +18366,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20008b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(69) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20008d3f, &NMD::MFHC2            , 0,
+       0xfc00ffff, 0x20008d3f, &MFHC2            , 0,
        CP2_                },        /* MFHC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20008f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(71) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000913f, &NMD::PRECEQU_PH_QBR   , 0,
+       0xfc00ffff, 0x2000913f, &PRECEQU_PH_QBR   , 0,
        DSP_                },        /* PRECEQU.PH.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000933f, &NMD::PRECEQU_PH_QBRA  , 0,
+       0xfc00ffff, 0x2000933f, &PRECEQU_PH_QBRA  , 0,
        DSP_                },        /* PRECEQU.PH.QBRA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000953f, 0                      , 0,
@@ -18390,7 +18390,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20009b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(77) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20009d3f, &NMD::MTHC2            , 0,
+       0xfc00ffff, 0x20009d3f, &MTHC2            , 0,
        CP2_                },        /* MTHC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20009f3f, 0                      , 0,
@@ -18420,10 +18420,10 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000af3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(87) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000b13f, &NMD::PRECEU_PH_QBL    , 0,
+       0xfc00ffff, 0x2000b13f, &PRECEU_PH_QBL    , 0,
        DSP_                },        /* PRECEU.PH.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000b33f, &NMD::PRECEU_PH_QBLA   , 0,
+       0xfc00ffff, 0x2000b33f, &PRECEU_PH_QBLA   , 0,
        DSP_                },        /* PRECEU.PH.QBLA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000b53f, 0                      , 0,
@@ -18462,16 +18462,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000cb3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(101) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000cd3f, &NMD::CFC2             , 0,
+       0xfc00ffff, 0x2000cd3f, &CFC2             , 0,
        CP2_                },        /* CFC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000cf3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(103) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000d13f, &NMD::PRECEU_PH_QBR    , 0,
+       0xfc00ffff, 0x2000d13f, &PRECEU_PH_QBR    , 0,
        DSP_                },        /* PRECEU.PH.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000d33f, &NMD::PRECEU_PH_QBRA   , 0,
+       0xfc00ffff, 0x2000d33f, &PRECEU_PH_QBRA   , 0,
        DSP_                },        /* PRECEU.PH.QBRA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000d53f, 0                      , 0,
@@ -18486,7 +18486,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000db3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(109) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000dd3f, &NMD::CTC2             , 0,
+       0xfc00ffff, 0x2000dd3f, &CTC2             , 0,
        CP2_                },        /* CTC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000df3f, 0                      , 0,
@@ -18516,7 +18516,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000ef3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(119) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000f13f, &NMD::RADDU_W_QB       , 0,
+       0xfc00ffff, 0x2000f13f, &RADDU_W_QB       , 0,
        DSP_                },        /* RADDU.W.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000f33f, 0                      , 0,
@@ -18544,16 +18544,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
 
 NMD::Pool NMD::POOL32Axf_5_group0[32] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000017f, &NMD::TLBGP            , 0,
+       0xfc00ffff, 0x2000017f, &TLBGP            , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGP */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000037f, &NMD::TLBP             , 0,
+       0xfc00ffff, 0x2000037f, &TLBP             , 0,
        CP0_ | TLB_         },        /* TLBP */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000057f, &NMD::TLBGINV          , 0,
+       0xfc00ffff, 0x2000057f, &TLBGINV          , 0,
        CP0_ | VZ_ | TLB_ | TLBINV_},        /* TLBGINV */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000077f, &NMD::TLBINV           , 0,
+       0xfc00ffff, 0x2000077f, &TLBINV           , 0,
        CP0_ | TLB_ | TLBINV_},        /* TLBINV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000097f, 0                      , 0,
@@ -18568,16 +18568,16 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
        0xfc00ffff, 0x20000f7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000117f, &NMD::TLBGR            , 0,
+       0xfc00ffff, 0x2000117f, &TLBGR            , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000137f, &NMD::TLBR             , 0,
+       0xfc00ffff, 0x2000137f, &TLBR             , 0,
        CP0_ | TLB_         },        /* TLBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000157f, &NMD::TLBGINVF         , 0,
+       0xfc00ffff, 0x2000157f, &TLBGINVF         , 0,
        CP0_ | VZ_ | TLB_ | TLBINV_},        /* TLBGINVF */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000177f, &NMD::TLBINVF          , 0,
+       0xfc00ffff, 0x2000177f, &TLBINVF          , 0,
        CP0_ | TLB_ | TLBINV_},        /* TLBINVF */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000197f, 0                      , 0,
@@ -18592,10 +18592,10 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
        0xfc00ffff, 0x20001f7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000217f, &NMD::TLBGWI           , 0,
+       0xfc00ffff, 0x2000217f, &TLBGWI           , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGWI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000237f, &NMD::TLBWI            , 0,
+       0xfc00ffff, 0x2000237f, &TLBWI            , 0,
        CP0_ | TLB_         },        /* TLBWI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000257f, 0                      , 0,
@@ -18616,10 +18616,10 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
        0xfc00ffff, 0x20002f7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000317f, &NMD::TLBGWR           , 0,
+       0xfc00ffff, 0x2000317f, &TLBGWR           , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGWR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000337f, &NMD::TLBWR            , 0,
+       0xfc00ffff, 0x2000337f, &TLBWR            , 0,
        CP0_ | TLB_         },        /* TLBWR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000357f, 0                      , 0,
@@ -18653,7 +18653,7 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
        0xfc00ffff, 0x2000457f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group1~*(2) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000477f, &NMD::DI               , 0,
+       0xfc00ffff, 0x2000477f, &DI               , 0,
        0x0                 },        /* DI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000497f, 0                      , 0,
@@ -18677,7 +18677,7 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
        0xfc00ffff, 0x2000557f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group1~*(10) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000577f, &NMD::EI               , 0,
+       0xfc00ffff, 0x2000577f, &EI               , 0,
        0x0                 },        /* EI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000597f, 0                      , 0,
@@ -18744,10 +18744,10 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
 
 NMD::Pool NMD::ERETx[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc01ffff, 0x2000f37f, &NMD::ERET             , 0,
+       0xfc01ffff, 0x2000f37f, &ERET             , 0,
        0x0                 },        /* ERET */
     { instruction         , 0                   , 0   , 32,
-       0xfc01ffff, 0x2001f37f, &NMD::ERETNC           , 0,
+       0xfc01ffff, 0x2001f37f, &ERETNC           , 0,
        0x0                 },        /* ERETNC */
 };
 
@@ -18757,7 +18757,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000c17f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(0) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000c37f, &NMD::WAIT             , 0,
+       0xfc00ffff, 0x2000c37f, &WAIT             , 0,
        0x0                 },        /* WAIT */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000c57f, 0                      , 0,
@@ -18781,7 +18781,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000d17f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(8) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000d37f, &NMD::IRET             , 0,
+       0xfc00ffff, 0x2000d37f, &IRET             , 0,
        MCU_                },        /* IRET */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000d57f, 0                      , 0,
@@ -18802,10 +18802,10 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000df7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000e17f, &NMD::RDPGPR           , 0,
+       0xfc00ffff, 0x2000e17f, &RDPGPR           , 0,
        CP0_                },        /* RDPGPR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000e37f, &NMD::DERET            , 0,
+       0xfc00ffff, 0x2000e37f, &DERET            , 0,
        EJTAG_              },        /* DERET */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000e57f, 0                      , 0,
@@ -18826,7 +18826,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000ef7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000f17f, &NMD::WRPGPR           , 0,
+       0xfc00ffff, 0x2000f17f, &WRPGPR           , 0,
        CP0_                },        /* WRPGPR */
     { pool                , ERETx               , 2   , 32,
        0xfc00ffff, 0x2000f37f, 0                      , 0,
@@ -18870,10 +18870,10 @@ NMD::Pool NMD::POOL32Axf_5[4] = {
 
 NMD::Pool NMD::SHRA__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x200001ff, &NMD::SHRA_QB          , 0,
+       0xfc001fff, 0x200001ff, &SHRA_QB          , 0,
        DSP_                },        /* SHRA.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x200011ff, &NMD::SHRA_R_QB        , 0,
+       0xfc001fff, 0x200011ff, &SHRA_R_QB        , 0,
        DSP_                },        /* SHRA_R.QB */
 };
 
@@ -18883,10 +18883,10 @@ NMD::Pool NMD::POOL32Axf_7[8] = {
        0xfc000fff, 0x200001ff, 0                      , 0,
        0x0                 },        /* SHRA[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x200003ff, &NMD::SHRL_PH          , 0,
+       0xfc000fff, 0x200003ff, &SHRL_PH          , 0,
        DSP_                },        /* SHRL.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x200005ff, &NMD::REPL_QB          , 0,
+       0xfc000fff, 0x200005ff, &REPL_QB          , 0,
        DSP_                },        /* REPL.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000fff, 0x200007ff, 0                      , 0,
@@ -18939,13 +18939,13 @@ NMD::Pool NMD::_POOL32A7[8] = {
        0xfc00003f, 0x20000007, 0                      , 0,
        0x0                 },        /* P.LSX */
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0x2000000f, &NMD::LSA              , 0,
+       0xfc00003f, 0x2000000f, &LSA              , 0,
        0x0                 },        /* LSA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00003f, 0x20000017, 0                      , 0,
        0x0                 },        /* _POOL32A7~*(2) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0x2000001f, &NMD::EXTW             , 0,
+       0xfc00003f, 0x2000001f, &EXTW             , 0,
        0x0                 },        /* EXTW */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00003f, 0x20000027, 0                      , 0,
@@ -18967,13 +18967,13 @@ NMD::Pool NMD::P32A[8] = {
        0xfc000007, 0x20000000, 0                      , 0,
        0x0                 },        /* _POOL32A0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x20000001, &NMD::SPECIAL2         , 0,
+       0xfc000007, 0x20000001, &SPECIAL2         , 0,
        UDI_                },        /* SPECIAL2 */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x20000002, &NMD::COP2_1           , 0,
+       0xfc000007, 0x20000002, &COP2_1           , 0,
        CP2_                },        /* COP2_1 */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x20000003, &NMD::UDI              , 0,
+       0xfc000007, 0x20000003, &UDI              , 0,
        UDI_                },        /* UDI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000007, 0x20000004, 0                      , 0,
@@ -18992,42 +18992,42 @@ NMD::Pool NMD::P32A[8] = {
 
 NMD::Pool NMD::P_GP_D[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x40000001, &NMD::LD_GP_           , 0,
+       0xfc000007, 0x40000001, &LD_GP_           , 0,
        MIPS64_             },        /* LD[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x40000005, &NMD::SD_GP_           , 0,
+       0xfc000007, 0x40000005, &SD_GP_           , 0,
        MIPS64_             },        /* SD[GP] */
 };
 
 
 NMD::Pool NMD::P_GP_W[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000003, 0x40000000, &NMD::ADDIU_GP_W_      , 0,
+       0xfc000003, 0x40000000, &ADDIU_GP_W_      , 0,
        0x0                 },        /* ADDIU[GP.W] */
     { pool                , P_GP_D              , 2   , 32,
        0xfc000003, 0x40000001, 0                      , 0,
        0x0                 },        /* P.GP.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc000003, 0x40000002, &NMD::LW_GP_           , 0,
+       0xfc000003, 0x40000002, &LW_GP_           , 0,
        0x0                 },        /* LW[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc000003, 0x40000003, &NMD::SW_GP_           , 0,
+       0xfc000003, 0x40000003, &SW_GP_           , 0,
        0x0                 },        /* SW[GP] */
 };
 
 
 NMD::Pool NMD::POOL48I[32] = {
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600000000000ull, &NMD::LI_48_           , 0,
+       0xfc1f00000000ull, 0x600000000000ull, &LI_48_           , 0,
        XMMS_               },        /* LI[48] */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600100000000ull, &NMD::ADDIU_48_        , 0,
+       0xfc1f00000000ull, 0x600100000000ull, &ADDIU_48_        , 0,
        XMMS_               },        /* ADDIU[48] */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600200000000ull, &NMD::ADDIU_GP48_      , 0,
+       0xfc1f00000000ull, 0x600200000000ull, &ADDIU_GP48_      , 0,
        XMMS_               },        /* ADDIU[GP48] */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600300000000ull, &NMD::ADDIUPC_48_      , 0,
+       0xfc1f00000000ull, 0x600300000000ull, &ADDIUPC_48_      , 0,
        XMMS_               },        /* ADDIUPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x600400000000ull, 0                      , 0,
@@ -19051,7 +19051,7 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x600a00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(10) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600b00000000ull, &NMD::LWPC_48_         , 0,
+       0xfc1f00000000ull, 0x600b00000000ull, &LWPC_48_         , 0,
        XMMS_               },        /* LWPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x600c00000000ull, 0                      , 0,
@@ -19063,13 +19063,13 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x600e00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(14) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600f00000000ull, &NMD::SWPC_48_         , 0,
+       0xfc1f00000000ull, 0x600f00000000ull, &SWPC_48_         , 0,
        XMMS_               },        /* SWPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601000000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(16) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601100000000ull, &NMD::DADDIU_48_       , 0,
+       0xfc1f00000000ull, 0x601100000000ull, &DADDIU_48_       , 0,
        MIPS64_             },        /* DADDIU[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601200000000ull, 0                      , 0,
@@ -19078,7 +19078,7 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x601300000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(19) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601400000000ull, &NMD::DLUI_48_         , 0,
+       0xfc1f00000000ull, 0x601400000000ull, &DLUI_48_         , 0,
        MIPS64_             },        /* DLUI[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601500000000ull, 0                      , 0,
@@ -19099,7 +19099,7 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x601a00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(26) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601b00000000ull, &NMD::LDPC_48_         , 0,
+       0xfc1f00000000ull, 0x601b00000000ull, &LDPC_48_         , 0,
        MIPS64_             },        /* LDPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601c00000000ull, 0                      , 0,
@@ -19111,33 +19111,33 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x601e00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(30) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601f00000000ull, &NMD::SDPC_48_         , 0,
+       0xfc1f00000000ull, 0x601f00000000ull, &SDPC_48_         , 0,
        MIPS64_             },        /* SDPC[48] */
 };
 
 
 NMD::Pool NMD::PP_SR[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc10f003, 0x80003000, &NMD::SAVE_32_         , 0,
+       0xfc10f003, 0x80003000, &SAVE_32_         , 0,
        0x0                 },        /* SAVE[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc10f003, 0x80003001, 0                      , 0,
        0x0                 },        /* PP.SR~*(1) */
     { instruction         , 0                   , 0   , 32,
-       0xfc10f003, 0x80003002, &NMD::RESTORE_32_      , 0,
+       0xfc10f003, 0x80003002, &RESTORE_32_      , 0,
        0x0                 },        /* RESTORE[32] */
     { return_instruction  , 0                   , 0   , 32,
-       0xfc10f003, 0x80003003, &NMD::RESTORE_JRC_32_  , 0,
+       0xfc10f003, 0x80003003, &RESTORE_JRC_32_  , 0,
        0x0                 },        /* RESTORE.JRC[32] */
 };
 
 
 NMD::Pool NMD::P_SR_F[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc10f007, 0x80103000, &NMD::SAVEF            , 0,
+       0xfc10f007, 0x80103000, &SAVEF            , 0,
        CP1_                },        /* SAVEF */
     { instruction         , 0                   , 0   , 32,
-       0xfc10f007, 0x80103001, &NMD::RESTOREF         , 0,
+       0xfc10f007, 0x80103001, &RESTOREF         , 0,
        CP1_                },        /* RESTOREF */
     { reserved_block      , 0                   , 0   , 32,
        0xfc10f007, 0x80103002, 0                      , 0,
@@ -19172,19 +19172,19 @@ NMD::Pool NMD::P_SR[2] = {
 
 NMD::Pool NMD::P_SLL[5] = {
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c000, &NMD::NOP_32_          , 0,
+       0xffe0f1ff, 0x8000c000, &NOP_32_          , 0,
        0x0                 },        /* NOP[32] */
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c003, &NMD::EHB              , 0,
+       0xffe0f1ff, 0x8000c003, &EHB              , 0,
        0x0                 },        /* EHB */
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c005, &NMD::PAUSE            , 0,
+       0xffe0f1ff, 0x8000c005, &PAUSE            , 0,
        0x0                 },        /* PAUSE */
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c006, &NMD::SYNC             , 0,
+       0xffe0f1ff, 0x8000c006, &SYNC             , 0,
        0x0                 },        /* SYNC */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c000, &NMD::SLL_32_          , 0,
+       0xfc00f1e0, 0x8000c000, &SLL_32_          , 0,
        0x0                 },        /* SLL[32] */
 };
 
@@ -19197,53 +19197,53 @@ NMD::Pool NMD::P_SHIFT[16] = {
        0xfc00f1e0, 0x8000c020, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(1) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c040, &NMD::SRL_32_          , 0,
+       0xfc00f1e0, 0x8000c040, &SRL_32_          , 0,
        0x0                 },        /* SRL[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f1e0, 0x8000c060, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c080, &NMD::SRA              , 0,
+       0xfc00f1e0, 0x8000c080, &SRA              , 0,
        0x0                 },        /* SRA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f1e0, 0x8000c0a0, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(5) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c0c0, &NMD::ROTR             , 0,
+       0xfc00f1e0, 0x8000c0c0, &ROTR             , 0,
        0x0                 },        /* ROTR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f1e0, 0x8000c0e0, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c100, &NMD::DSLL             , 0,
+       0xfc00f1e0, 0x8000c100, &DSLL             , 0,
        MIPS64_             },        /* DSLL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c120, &NMD::DSLL32           , 0,
+       0xfc00f1e0, 0x8000c120, &DSLL32           , 0,
        MIPS64_             },        /* DSLL32 */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c140, &NMD::DSRL             , 0,
+       0xfc00f1e0, 0x8000c140, &DSRL             , 0,
        MIPS64_             },        /* DSRL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c160, &NMD::DSRL32           , 0,
+       0xfc00f1e0, 0x8000c160, &DSRL32           , 0,
        MIPS64_             },        /* DSRL32 */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c180, &NMD::DSRA             , 0,
+       0xfc00f1e0, 0x8000c180, &DSRA             , 0,
        MIPS64_             },        /* DSRA */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c1a0, &NMD::DSRA32           , 0,
+       0xfc00f1e0, 0x8000c1a0, &DSRA32           , 0,
        MIPS64_             },        /* DSRA32 */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c1c0, &NMD::DROTR            , 0,
+       0xfc00f1e0, 0x8000c1c0, &DROTR            , 0,
        MIPS64_             },        /* DROTR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c1e0, &NMD::DROTR32          , 0,
+       0xfc00f1e0, 0x8000c1e0, &DROTR32          , 0,
        MIPS64_             },        /* DROTR32 */
 };
 
 
 NMD::Pool NMD::P_ROTX[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000d000, &NMD::ROTX             , 0,
+       0xfc00f820, 0x8000d000, &ROTX             , 0,
        XMMS_               },        /* ROTX */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f820, 0x8000d020, 0                      , 0,
@@ -19259,72 +19259,72 @@ NMD::Pool NMD::P_ROTX[4] = {
 
 NMD::Pool NMD::P_INS[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e000, &NMD::INS              , 0,
+       0xfc00f820, 0x8000e000, &INS              , 0,
        XMMS_               },        /* INS */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e020, &NMD::DINSU            , 0,
+       0xfc00f820, 0x8000e020, &DINSU            , 0,
        MIPS64_             },        /* DINSU */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e800, &NMD::DINSM            , 0,
+       0xfc00f820, 0x8000e800, &DINSM            , 0,
        MIPS64_             },        /* DINSM */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e820, &NMD::DINS             , 0,
+       0xfc00f820, 0x8000e820, &DINS             , 0,
        MIPS64_             },        /* DINS */
 };
 
 
 NMD::Pool NMD::P_EXT[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f000, &NMD::EXT              , 0,
+       0xfc00f820, 0x8000f000, &EXT              , 0,
        XMMS_               },        /* EXT */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f020, &NMD::DEXTU            , 0,
+       0xfc00f820, 0x8000f020, &DEXTU            , 0,
        MIPS64_             },        /* DEXTU */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f800, &NMD::DEXTM            , 0,
+       0xfc00f820, 0x8000f800, &DEXTM            , 0,
        MIPS64_             },        /* DEXTM */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f820, &NMD::DEXT             , 0,
+       0xfc00f820, 0x8000f820, &DEXT             , 0,
        MIPS64_             },        /* DEXT */
 };
 
 
 NMD::Pool NMD::P_U12[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80000000, &NMD::ORI              , 0,
+       0xfc00f000, 0x80000000, &ORI              , 0,
        0x0                 },        /* ORI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80001000, &NMD::XORI             , 0,
+       0xfc00f000, 0x80001000, &XORI             , 0,
        0x0                 },        /* XORI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80002000, &NMD::ANDI_32_         , 0,
+       0xfc00f000, 0x80002000, &ANDI_32_         , 0,
        0x0                 },        /* ANDI[32] */
     { pool                , P_SR                , 2   , 32,
        0xfc00f000, 0x80003000, 0                      , 0,
        0x0                 },        /* P.SR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80004000, &NMD::SLTI             , 0,
+       0xfc00f000, 0x80004000, &SLTI             , 0,
        0x0                 },        /* SLTI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80005000, &NMD::SLTIU            , 0,
+       0xfc00f000, 0x80005000, &SLTIU            , 0,
        0x0                 },        /* SLTIU */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80006000, &NMD::SEQI             , 0,
+       0xfc00f000, 0x80006000, &SEQI             , 0,
        0x0                 },        /* SEQI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f000, 0x80007000, 0                      , 0,
        0x0                 },        /* P.U12~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80008000, &NMD::ADDIU_NEG_       , 0,
+       0xfc00f000, 0x80008000, &ADDIU_NEG_       , 0,
        0x0                 },        /* ADDIU[NEG] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80009000, &NMD::DADDIU_U12_      , 0,
+       0xfc00f000, 0x80009000, &DADDIU_U12_      , 0,
        MIPS64_             },        /* DADDIU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8000a000, &NMD::DADDIU_NEG_      , 0,
+       0xfc00f000, 0x8000a000, &DADDIU_NEG_      , 0,
        MIPS64_             },        /* DADDIU[NEG] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8000b000, &NMD::DROTX            , 0,
+       0xfc00f000, 0x8000b000, &DROTX            , 0,
        MIPS64_             },        /* DROTX */
     { pool                , P_SHIFT             , 16  , 32,
        0xfc00f000, 0x8000c000, 0                      , 0,
@@ -19343,17 +19343,17 @@ NMD::Pool NMD::P_U12[16] = {
 
 NMD::Pool NMD::RINT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000020, &NMD::RINT_S           , 0,
+       0xfc0003ff, 0xa0000020, &RINT_S           , 0,
        CP1_                },        /* RINT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000220, &NMD::RINT_D           , 0,
+       0xfc0003ff, 0xa0000220, &RINT_D           , 0,
        CP1_                },        /* RINT.D */
 };
 
 
 NMD::Pool NMD::ADD_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000030, &NMD::ADD_S            , 0,
+       0xfc0003ff, 0xa0000030, &ADD_S            , 0,
        CP1_                },        /* ADD.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000230, 0                      , 0,
@@ -19363,27 +19363,27 @@ NMD::Pool NMD::ADD_fmt0[2] = {
 
 NMD::Pool NMD::SELEQZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000038, &NMD::SELEQZ_S         , 0,
+       0xfc0003ff, 0xa0000038, &SELEQZ_S         , 0,
        CP1_                },        /* SELEQZ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000238, &NMD::SELEQZ_D         , 0,
+       0xfc0003ff, 0xa0000238, &SELEQZ_D         , 0,
        CP1_                },        /* SELEQZ.D */
 };
 
 
 NMD::Pool NMD::CLASS_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000060, &NMD::CLASS_S          , 0,
+       0xfc0003ff, 0xa0000060, &CLASS_S          , 0,
        CP1_                },        /* CLASS.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000260, &NMD::CLASS_D          , 0,
+       0xfc0003ff, 0xa0000260, &CLASS_D          , 0,
        CP1_                },        /* CLASS.D */
 };
 
 
 NMD::Pool NMD::SUB_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000070, &NMD::SUB_S            , 0,
+       0xfc0003ff, 0xa0000070, &SUB_S            , 0,
        CP1_                },        /* SUB.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000270, 0                      , 0,
@@ -19393,17 +19393,17 @@ NMD::Pool NMD::SUB_fmt0[2] = {
 
 NMD::Pool NMD::SELNEZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000078, &NMD::SELNEZ_S         , 0,
+       0xfc0003ff, 0xa0000078, &SELNEZ_S         , 0,
        CP1_                },        /* SELNEZ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000278, &NMD::SELNEZ_D         , 0,
+       0xfc0003ff, 0xa0000278, &SELNEZ_D         , 0,
        CP1_                },        /* SELNEZ.D */
 };
 
 
 NMD::Pool NMD::MUL_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00000b0, &NMD::MUL_S            , 0,
+       0xfc0003ff, 0xa00000b0, &MUL_S            , 0,
        CP1_                },        /* MUL.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00002b0, 0                      , 0,
@@ -19413,17 +19413,17 @@ NMD::Pool NMD::MUL_fmt0[2] = {
 
 NMD::Pool NMD::SEL_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00000b8, &NMD::SEL_S            , 0,
+       0xfc0003ff, 0xa00000b8, &SEL_S            , 0,
        CP1_                },        /* SEL.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00002b8, &NMD::SEL_D            , 0,
+       0xfc0003ff, 0xa00002b8, &SEL_D            , 0,
        CP1_                },        /* SEL.D */
 };
 
 
 NMD::Pool NMD::DIV_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00000f0, &NMD::DIV_S            , 0,
+       0xfc0003ff, 0xa00000f0, &DIV_S            , 0,
        CP1_                },        /* DIV.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00002f0, 0                      , 0,
@@ -19433,7 +19433,7 @@ NMD::Pool NMD::DIV_fmt0[2] = {
 
 NMD::Pool NMD::ADD_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000130, &NMD::ADD_D            , 0,
+       0xfc0003ff, 0xa0000130, &ADD_D            , 0,
        CP1_                },        /* ADD.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000330, 0                      , 0,
@@ -19443,7 +19443,7 @@ NMD::Pool NMD::ADD_fmt1[2] = {
 
 NMD::Pool NMD::SUB_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000170, &NMD::SUB_D            , 0,
+       0xfc0003ff, 0xa0000170, &SUB_D            , 0,
        CP1_                },        /* SUB.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000370, 0                      , 0,
@@ -19453,7 +19453,7 @@ NMD::Pool NMD::SUB_fmt1[2] = {
 
 NMD::Pool NMD::MUL_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001b0, &NMD::MUL_D            , 0,
+       0xfc0003ff, 0xa00001b0, &MUL_D            , 0,
        CP1_                },        /* MUL.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00003b0, 0                      , 0,
@@ -19463,17 +19463,17 @@ NMD::Pool NMD::MUL_fmt1[2] = {
 
 NMD::Pool NMD::MADDF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001b8, &NMD::MADDF_S          , 0,
+       0xfc0003ff, 0xa00001b8, &MADDF_S          , 0,
        CP1_                },        /* MADDF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00003b8, &NMD::MADDF_D          , 0,
+       0xfc0003ff, 0xa00003b8, &MADDF_D          , 0,
        CP1_                },        /* MADDF.D */
 };
 
 
 NMD::Pool NMD::DIV_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001f0, &NMD::DIV_D            , 0,
+       0xfc0003ff, 0xa00001f0, &DIV_D            , 0,
        CP1_                },        /* DIV.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00003f0, 0                      , 0,
@@ -19483,10 +19483,10 @@ NMD::Pool NMD::DIV_fmt1[2] = {
 
 NMD::Pool NMD::MSUBF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001f8, &NMD::MSUBF_S          , 0,
+       0xfc0003ff, 0xa00001f8, &MSUBF_S          , 0,
        CP1_                },        /* MSUBF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00003f8, &NMD::MSUBF_D          , 0,
+       0xfc0003ff, 0xa00003f8, &MSUBF_D          , 0,
        CP1_                },        /* MSUBF.D */
 };
 
@@ -19689,170 +19689,170 @@ NMD::Pool NMD::POOL32F_0[64] = {
 
 NMD::Pool NMD::MIN_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000003, &NMD::MIN_S            , 0,
+       0xfc00023f, 0xa0000003, &MIN_S            , 0,
        CP1_                },        /* MIN.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000203, &NMD::MIN_D            , 0,
+       0xfc00023f, 0xa0000203, &MIN_D            , 0,
        CP1_                },        /* MIN.D */
 };
 
 
 NMD::Pool NMD::MAX_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000000b, &NMD::MAX_S            , 0,
+       0xfc00023f, 0xa000000b, &MAX_S            , 0,
        CP1_                },        /* MAX.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000020b, &NMD::MAX_D            , 0,
+       0xfc00023f, 0xa000020b, &MAX_D            , 0,
        CP1_                },        /* MAX.D */
 };
 
 
 NMD::Pool NMD::MINA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000023, &NMD::MINA_S           , 0,
+       0xfc00023f, 0xa0000023, &MINA_S           , 0,
        CP1_                },        /* MINA.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000223, &NMD::MINA_D           , 0,
+       0xfc00023f, 0xa0000223, &MINA_D           , 0,
        CP1_                },        /* MINA.D */
 };
 
 
 NMD::Pool NMD::MAXA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000002b, &NMD::MAXA_S           , 0,
+       0xfc00023f, 0xa000002b, &MAXA_S           , 0,
        CP1_                },        /* MAXA.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000022b, &NMD::MAXA_D           , 0,
+       0xfc00023f, 0xa000022b, &MAXA_D           , 0,
        CP1_                },        /* MAXA.D */
 };
 
 
 NMD::Pool NMD::CVT_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000013b, &NMD::CVT_L_S          , 0,
+       0xfc007fff, 0xa000013b, &CVT_L_S          , 0,
        CP1_                },        /* CVT.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000413b, &NMD::CVT_L_D          , 0,
+       0xfc007fff, 0xa000413b, &CVT_L_D          , 0,
        CP1_                },        /* CVT.L.D */
 };
 
 
 NMD::Pool NMD::RSQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000023b, &NMD::RSQRT_S          , 0,
+       0xfc007fff, 0xa000023b, &RSQRT_S          , 0,
        CP1_                },        /* RSQRT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000423b, &NMD::RSQRT_D          , 0,
+       0xfc007fff, 0xa000423b, &RSQRT_D          , 0,
        CP1_                },        /* RSQRT.D */
 };
 
 
 NMD::Pool NMD::FLOOR_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000033b, &NMD::FLOOR_L_S        , 0,
+       0xfc007fff, 0xa000033b, &FLOOR_L_S        , 0,
        CP1_                },        /* FLOOR.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000433b, &NMD::FLOOR_L_D        , 0,
+       0xfc007fff, 0xa000433b, &FLOOR_L_D        , 0,
        CP1_                },        /* FLOOR.L.D */
 };
 
 
 NMD::Pool NMD::CVT_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000093b, &NMD::CVT_W_S          , 0,
+       0xfc007fff, 0xa000093b, &CVT_W_S          , 0,
        CP1_                },        /* CVT.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000493b, &NMD::CVT_W_D          , 0,
+       0xfc007fff, 0xa000493b, &CVT_W_D          , 0,
        CP1_                },        /* CVT.W.D */
 };
 
 
 NMD::Pool NMD::SQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0000a3b, &NMD::SQRT_S           , 0,
+       0xfc007fff, 0xa0000a3b, &SQRT_S           , 0,
        CP1_                },        /* SQRT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0004a3b, &NMD::SQRT_D           , 0,
+       0xfc007fff, 0xa0004a3b, &SQRT_D           , 0,
        CP1_                },        /* SQRT.D */
 };
 
 
 NMD::Pool NMD::FLOOR_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0000b3b, &NMD::FLOOR_W_S        , 0,
+       0xfc007fff, 0xa0000b3b, &FLOOR_W_S        , 0,
        CP1_                },        /* FLOOR.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0004b3b, &NMD::FLOOR_W_D        , 0,
+       0xfc007fff, 0xa0004b3b, &FLOOR_W_D        , 0,
        CP1_                },        /* FLOOR.W.D */
 };
 
 
 NMD::Pool NMD::RECIP_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000123b, &NMD::RECIP_S          , 0,
+       0xfc007fff, 0xa000123b, &RECIP_S          , 0,
        CP1_                },        /* RECIP.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000523b, &NMD::RECIP_D          , 0,
+       0xfc007fff, 0xa000523b, &RECIP_D          , 0,
        CP1_                },        /* RECIP.D */
 };
 
 
 NMD::Pool NMD::CEIL_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000133b, &NMD::CEIL_L_S         , 0,
+       0xfc007fff, 0xa000133b, &CEIL_L_S         , 0,
        CP1_                },        /* CEIL.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000533b, &NMD::CEIL_L_D         , 0,
+       0xfc007fff, 0xa000533b, &CEIL_L_D         , 0,
        CP1_                },        /* CEIL.L.D */
 };
 
 
 NMD::Pool NMD::CEIL_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0001b3b, &NMD::CEIL_W_S         , 0,
+       0xfc007fff, 0xa0001b3b, &CEIL_W_S         , 0,
        CP1_                },        /* CEIL.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0005b3b, &NMD::CEIL_W_D         , 0,
+       0xfc007fff, 0xa0005b3b, &CEIL_W_D         , 0,
        CP1_                },        /* CEIL.W.D */
 };
 
 
 NMD::Pool NMD::TRUNC_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000233b, &NMD::TRUNC_L_S        , 0,
+       0xfc007fff, 0xa000233b, &TRUNC_L_S        , 0,
        CP1_                },        /* TRUNC.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000633b, &NMD::TRUNC_L_D        , 0,
+       0xfc007fff, 0xa000633b, &TRUNC_L_D        , 0,
        CP1_                },        /* TRUNC.L.D */
 };
 
 
 NMD::Pool NMD::TRUNC_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0002b3b, &NMD::TRUNC_W_S        , 0,
+       0xfc007fff, 0xa0002b3b, &TRUNC_W_S        , 0,
        CP1_                },        /* TRUNC.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0006b3b, &NMD::TRUNC_W_D        , 0,
+       0xfc007fff, 0xa0006b3b, &TRUNC_W_D        , 0,
        CP1_                },        /* TRUNC.W.D */
 };
 
 
 NMD::Pool NMD::ROUND_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000333b, &NMD::ROUND_L_S        , 0,
+       0xfc007fff, 0xa000333b, &ROUND_L_S        , 0,
        CP1_                },        /* ROUND.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000733b, &NMD::ROUND_L_D        , 0,
+       0xfc007fff, 0xa000733b, &ROUND_L_D        , 0,
        CP1_                },        /* ROUND.L.D */
 };
 
 
 NMD::Pool NMD::ROUND_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0003b3b, &NMD::ROUND_W_S        , 0,
+       0xfc007fff, 0xa0003b3b, &ROUND_W_S        , 0,
        CP1_                },        /* ROUND.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0007b3b, &NMD::ROUND_W_D        , 0,
+       0xfc007fff, 0xa0007b3b, &ROUND_W_D        , 0,
        CP1_                },        /* ROUND.W.D */
 };
 
@@ -19907,7 +19907,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0000f3b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000103b, &NMD::CFC1             , 0,
+       0xfc003fff, 0xa000103b, &CFC1             , 0,
        CP1_                },        /* CFC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000113b, 0                      , 0,
@@ -19931,7 +19931,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000173b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000183b, &NMD::CTC1             , 0,
+       0xfc003fff, 0xa000183b, &CTC1             , 0,
        CP1_                },        /* CTC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000193b, 0                      , 0,
@@ -19955,10 +19955,10 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0001f3b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(31) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000203b, &NMD::MFC1             , 0,
+       0xfc003fff, 0xa000203b, &MFC1             , 0,
        CP1_                },        /* MFC1 */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000213b, &NMD::CVT_S_PL         , 0,
+       0xfc003fff, 0xa000213b, &CVT_S_PL         , 0,
        CP1_                },        /* CVT.S.PL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000223b, 0                      , 0,
@@ -19967,7 +19967,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000233b, 0                      , 0,
        CP1_                },        /* TRUNC.L.fmt */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000243b, &NMD::DMFC1            , 0,
+       0xfc003fff, 0xa000243b, &DMFC1            , 0,
        CP1_ | MIPS64_      },        /* DMFC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000253b, 0                      , 0,
@@ -19979,10 +19979,10 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000273b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(39) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000283b, &NMD::MTC1             , 0,
+       0xfc003fff, 0xa000283b, &MTC1             , 0,
        CP1_                },        /* MTC1 */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000293b, &NMD::CVT_S_PU         , 0,
+       0xfc003fff, 0xa000293b, &CVT_S_PU         , 0,
        CP1_                },        /* CVT.S.PU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa0002a3b, 0                      , 0,
@@ -19991,7 +19991,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0002b3b, 0                      , 0,
        CP1_                },        /* TRUNC.W.fmt */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa0002c3b, &NMD::DMTC1            , 0,
+       0xfc003fff, 0xa0002c3b, &DMTC1            , 0,
        CP1_ | MIPS64_      },        /* DMTC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa0002d3b, 0                      , 0,
@@ -20003,7 +20003,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0002f3b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(47) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000303b, &NMD::MFHC1            , 0,
+       0xfc003fff, 0xa000303b, &MFHC1            , 0,
        CP1_                },        /* MFHC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000313b, 0                      , 0,
@@ -20027,7 +20027,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000373b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000383b, &NMD::MTHC1            , 0,
+       0xfc003fff, 0xa000383b, &MTHC1            , 0,
        CP1_                },        /* MTHC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000393b, 0                      , 0,
@@ -20055,10 +20055,10 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
 
 NMD::Pool NMD::MOV_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000007b, &NMD::MOV_S            , 0,
+       0xfc007fff, 0xa000007b, &MOV_S            , 0,
        CP1_                },        /* MOV.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000207b, &NMD::MOV_D            , 0,
+       0xfc007fff, 0xa000207b, &MOV_D            , 0,
        CP1_                },        /* MOV.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa000407b, 0                      , 0,
@@ -20071,10 +20071,10 @@ NMD::Pool NMD::MOV_fmt[4] = {
 
 NMD::Pool NMD::ABS_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000037b, &NMD::ABS_S            , 0,
+       0xfc007fff, 0xa000037b, &ABS_S            , 0,
        CP1_                },        /* ABS.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000237b, &NMD::ABS_D            , 0,
+       0xfc007fff, 0xa000237b, &ABS_D            , 0,
        CP1_                },        /* ABS.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa000437b, 0                      , 0,
@@ -20087,10 +20087,10 @@ NMD::Pool NMD::ABS_fmt[4] = {
 
 NMD::Pool NMD::NEG_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0000b7b, &NMD::NEG_S            , 0,
+       0xfc007fff, 0xa0000b7b, &NEG_S            , 0,
        CP1_                },        /* NEG.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0002b7b, &NMD::NEG_D            , 0,
+       0xfc007fff, 0xa0002b7b, &NEG_D            , 0,
        CP1_                },        /* NEG.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa0004b7b, 0                      , 0,
@@ -20103,13 +20103,13 @@ NMD::Pool NMD::NEG_fmt[4] = {
 
 NMD::Pool NMD::CVT_D_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000137b, &NMD::CVT_D_S          , 0,
+       0xfc007fff, 0xa000137b, &CVT_D_S          , 0,
        CP1_                },        /* CVT.D.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000337b, &NMD::CVT_D_W          , 0,
+       0xfc007fff, 0xa000337b, &CVT_D_W          , 0,
        CP1_                },        /* CVT.D.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000537b, &NMD::CVT_D_L          , 0,
+       0xfc007fff, 0xa000537b, &CVT_D_L          , 0,
        CP1_                },        /* CVT.D.L */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa000737b, 0                      , 0,
@@ -20119,13 +20119,13 @@ NMD::Pool NMD::CVT_D_fmt[4] = {
 
 NMD::Pool NMD::CVT_S_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0001b7b, &NMD::CVT_S_D          , 0,
+       0xfc007fff, 0xa0001b7b, &CVT_S_D          , 0,
        CP1_                },        /* CVT.S.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0003b7b, &NMD::CVT_S_W          , 0,
+       0xfc007fff, 0xa0003b7b, &CVT_S_W          , 0,
        CP1_                },        /* CVT.S.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0005b7b, &NMD::CVT_S_L          , 0,
+       0xfc007fff, 0xa0005b7b, &CVT_S_L          , 0,
        CP1_                },        /* CVT.S.L */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa0007b7b, 0                      , 0,
@@ -20279,64 +20279,64 @@ NMD::Pool NMD::POOL32F_3[8] = {
 
 NMD::Pool NMD::CMP_condn_S[32] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000005, &NMD::CMP_AF_S         , 0,
+       0xfc0007ff, 0xa0000005, &CMP_AF_S         , 0,
        CP1_                },        /* CMP.AF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000045, &NMD::CMP_UN_S         , 0,
+       0xfc0007ff, 0xa0000045, &CMP_UN_S         , 0,
        CP1_                },        /* CMP.UN.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000085, &NMD::CMP_EQ_S         , 0,
+       0xfc0007ff, 0xa0000085, &CMP_EQ_S         , 0,
        CP1_                },        /* CMP.EQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00000c5, &NMD::CMP_UEQ_S        , 0,
+       0xfc0007ff, 0xa00000c5, &CMP_UEQ_S        , 0,
        CP1_                },        /* CMP.UEQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000105, &NMD::CMP_LT_S         , 0,
+       0xfc0007ff, 0xa0000105, &CMP_LT_S         , 0,
        CP1_                },        /* CMP.LT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000145, &NMD::CMP_ULT_S        , 0,
+       0xfc0007ff, 0xa0000145, &CMP_ULT_S        , 0,
        CP1_                },        /* CMP.ULT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000185, &NMD::CMP_LE_S         , 0,
+       0xfc0007ff, 0xa0000185, &CMP_LE_S         , 0,
        CP1_                },        /* CMP.LE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00001c5, &NMD::CMP_ULE_S        , 0,
+       0xfc0007ff, 0xa00001c5, &CMP_ULE_S        , 0,
        CP1_                },        /* CMP.ULE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000205, &NMD::CMP_SAF_S        , 0,
+       0xfc0007ff, 0xa0000205, &CMP_SAF_S        , 0,
        CP1_                },        /* CMP.SAF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000245, &NMD::CMP_SUN_S        , 0,
+       0xfc0007ff, 0xa0000245, &CMP_SUN_S        , 0,
        CP1_                },        /* CMP.SUN.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000285, &NMD::CMP_SEQ_S        , 0,
+       0xfc0007ff, 0xa0000285, &CMP_SEQ_S        , 0,
        CP1_                },        /* CMP.SEQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00002c5, &NMD::CMP_SUEQ_S       , 0,
+       0xfc0007ff, 0xa00002c5, &CMP_SUEQ_S       , 0,
        CP1_                },        /* CMP.SUEQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000305, &NMD::CMP_SLT_S        , 0,
+       0xfc0007ff, 0xa0000305, &CMP_SLT_S        , 0,
        CP1_                },        /* CMP.SLT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000345, &NMD::CMP_SULT_S       , 0,
+       0xfc0007ff, 0xa0000345, &CMP_SULT_S       , 0,
        CP1_                },        /* CMP.SULT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000385, &NMD::CMP_SLE_S        , 0,
+       0xfc0007ff, 0xa0000385, &CMP_SLE_S        , 0,
        CP1_                },        /* CMP.SLE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00003c5, &NMD::CMP_SULE_S       , 0,
+       0xfc0007ff, 0xa00003c5, &CMP_SULE_S       , 0,
        CP1_                },        /* CMP.SULE.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000405, 0                      , 0,
        CP1_                },        /* CMP.condn.S~*(16) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000445, &NMD::CMP_OR_S         , 0,
+       0xfc0007ff, 0xa0000445, &CMP_OR_S         , 0,
        CP1_                },        /* CMP.OR.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000485, &NMD::CMP_UNE_S        , 0,
+       0xfc0007ff, 0xa0000485, &CMP_UNE_S        , 0,
        CP1_                },        /* CMP.UNE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00004c5, &NMD::CMP_NE_S         , 0,
+       0xfc0007ff, 0xa00004c5, &CMP_NE_S         , 0,
        CP1_                },        /* CMP.NE.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000505, 0                      , 0,
@@ -20354,13 +20354,13 @@ NMD::Pool NMD::CMP_condn_S[32] = {
        0xfc0007ff, 0xa0000605, 0                      , 0,
        CP1_                },        /* CMP.condn.S~*(24) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000645, &NMD::CMP_SOR_S        , 0,
+       0xfc0007ff, 0xa0000645, &CMP_SOR_S        , 0,
        CP1_                },        /* CMP.SOR.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000685, &NMD::CMP_SUNE_S       , 0,
+       0xfc0007ff, 0xa0000685, &CMP_SUNE_S       , 0,
        CP1_                },        /* CMP.SUNE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00006c5, &NMD::CMP_SNE_S        , 0,
+       0xfc0007ff, 0xa00006c5, &CMP_SNE_S        , 0,
        CP1_                },        /* CMP.SNE.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000705, 0                      , 0,
@@ -20379,64 +20379,64 @@ NMD::Pool NMD::CMP_condn_S[32] = {
 
 NMD::Pool NMD::CMP_condn_D[32] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000015, &NMD::CMP_AF_D         , 0,
+       0xfc0007ff, 0xa0000015, &CMP_AF_D         , 0,
        CP1_                },        /* CMP.AF.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000055, &NMD::CMP_UN_D         , 0,
+       0xfc0007ff, 0xa0000055, &CMP_UN_D         , 0,
        CP1_                },        /* CMP.UN.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000095, &NMD::CMP_EQ_D         , 0,
+       0xfc0007ff, 0xa0000095, &CMP_EQ_D         , 0,
        CP1_                },        /* CMP.EQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00000d5, &NMD::CMP_UEQ_D        , 0,
+       0xfc0007ff, 0xa00000d5, &CMP_UEQ_D        , 0,
        CP1_                },        /* CMP.UEQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000115, &NMD::CMP_LT_D         , 0,
+       0xfc0007ff, 0xa0000115, &CMP_LT_D         , 0,
        CP1_                },        /* CMP.LT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000155, &NMD::CMP_ULT_D        , 0,
+       0xfc0007ff, 0xa0000155, &CMP_ULT_D        , 0,
        CP1_                },        /* CMP.ULT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000195, &NMD::CMP_LE_D         , 0,
+       0xfc0007ff, 0xa0000195, &CMP_LE_D         , 0,
        CP1_                },        /* CMP.LE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00001d5, &NMD::CMP_ULE_D        , 0,
+       0xfc0007ff, 0xa00001d5, &CMP_ULE_D        , 0,
        CP1_                },        /* CMP.ULE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000215, &NMD::CMP_SAF_D        , 0,
+       0xfc0007ff, 0xa0000215, &CMP_SAF_D        , 0,
        CP1_                },        /* CMP.SAF.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000255, &NMD::CMP_SUN_D        , 0,
+       0xfc0007ff, 0xa0000255, &CMP_SUN_D        , 0,
        CP1_                },        /* CMP.SUN.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000295, &NMD::CMP_SEQ_D        , 0,
+       0xfc0007ff, 0xa0000295, &CMP_SEQ_D        , 0,
        CP1_                },        /* CMP.SEQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00002d5, &NMD::CMP_SUEQ_D       , 0,
+       0xfc0007ff, 0xa00002d5, &CMP_SUEQ_D       , 0,
        CP1_                },        /* CMP.SUEQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000315, &NMD::CMP_SLT_D        , 0,
+       0xfc0007ff, 0xa0000315, &CMP_SLT_D        , 0,
        CP1_                },        /* CMP.SLT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000355, &NMD::CMP_SULT_D       , 0,
+       0xfc0007ff, 0xa0000355, &CMP_SULT_D       , 0,
        CP1_                },        /* CMP.SULT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000395, &NMD::CMP_SLE_D        , 0,
+       0xfc0007ff, 0xa0000395, &CMP_SLE_D        , 0,
        CP1_                },        /* CMP.SLE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00003d5, &NMD::CMP_SULE_D       , 0,
+       0xfc0007ff, 0xa00003d5, &CMP_SULE_D       , 0,
        CP1_                },        /* CMP.SULE.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000415, 0                      , 0,
        CP1_                },        /* CMP.condn.D~*(16) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000455, &NMD::CMP_OR_D         , 0,
+       0xfc0007ff, 0xa0000455, &CMP_OR_D         , 0,
        CP1_                },        /* CMP.OR.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000495, &NMD::CMP_UNE_D        , 0,
+       0xfc0007ff, 0xa0000495, &CMP_UNE_D        , 0,
        CP1_                },        /* CMP.UNE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00004d5, &NMD::CMP_NE_D         , 0,
+       0xfc0007ff, 0xa00004d5, &CMP_NE_D         , 0,
        CP1_                },        /* CMP.NE.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000515, 0                      , 0,
@@ -20454,13 +20454,13 @@ NMD::Pool NMD::CMP_condn_D[32] = {
        0xfc0007ff, 0xa0000615, 0                      , 0,
        CP1_                },        /* CMP.condn.D~*(24) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000655, &NMD::CMP_SOR_D        , 0,
+       0xfc0007ff, 0xa0000655, &CMP_SOR_D        , 0,
        CP1_                },        /* CMP.SOR.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000695, &NMD::CMP_SUNE_D       , 0,
+       0xfc0007ff, 0xa0000695, &CMP_SUNE_D       , 0,
        CP1_                },        /* CMP.SUNE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00006d5, &NMD::CMP_SNE_D        , 0,
+       0xfc0007ff, 0xa00006d5, &CMP_SNE_D        , 0,
        CP1_                },        /* CMP.SNE.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000715, 0                      , 0,
@@ -20538,13 +20538,13 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000000, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(0) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000008, &NMD::DLSA             , 0,
+       0xfc0001ff, 0xc0000008, &DLSA             , 0,
        MIPS64_             },        /* DLSA */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000010, &NMD::DSLLV            , 0,
+       0xfc0001ff, 0xc0000010, &DSLLV            , 0,
        MIPS64_             },        /* DSLLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000018, &NMD::DMUL             , 0,
+       0xfc0001ff, 0xc0000018, &DMUL             , 0,
        MIPS64_             },        /* DMUL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000020, 0                      , 0,
@@ -20565,10 +20565,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000048, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(9) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000050, &NMD::DSRLV            , 0,
+       0xfc0001ff, 0xc0000050, &DSRLV            , 0,
        MIPS64_             },        /* DSRLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000058, &NMD::DMUH             , 0,
+       0xfc0001ff, 0xc0000058, &DMUH             , 0,
        MIPS64_             },        /* DMUH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000060, 0                      , 0,
@@ -20589,10 +20589,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000088, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(17) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000090, &NMD::DSRAV            , 0,
+       0xfc0001ff, 0xc0000090, &DSRAV            , 0,
        MIPS64_             },        /* DSRAV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000098, &NMD::DMULU            , 0,
+       0xfc0001ff, 0xc0000098, &DMULU            , 0,
        MIPS64_             },        /* DMULU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00000a0, 0                      , 0,
@@ -20613,10 +20613,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc00000c8, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(25) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00000d0, &NMD::DROTRV           , 0,
+       0xfc0001ff, 0xc00000d0, &DROTRV           , 0,
        MIPS64_             },        /* DROTRV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00000d8, &NMD::DMUHU            , 0,
+       0xfc0001ff, 0xc00000d8, &DMUHU            , 0,
        MIPS64_             },        /* DMUHU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00000e0, 0                      , 0,
@@ -20637,10 +20637,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000108, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(33) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000110, &NMD::DADD             , 0,
+       0xfc0001ff, 0xc0000110, &DADD             , 0,
        MIPS64_             },        /* DADD */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000118, &NMD::DDIV             , 0,
+       0xfc0001ff, 0xc0000118, &DDIV             , 0,
        MIPS64_             },        /* DDIV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000120, 0                      , 0,
@@ -20661,10 +20661,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000148, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(41) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000150, &NMD::DADDU            , 0,
+       0xfc0001ff, 0xc0000150, &DADDU            , 0,
        MIPS64_             },        /* DADDU */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000158, &NMD::DMOD             , 0,
+       0xfc0001ff, 0xc0000158, &DMOD             , 0,
        MIPS64_             },        /* DMOD */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000160, 0                      , 0,
@@ -20685,10 +20685,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000188, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(49) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000190, &NMD::DSUB             , 0,
+       0xfc0001ff, 0xc0000190, &DSUB             , 0,
        MIPS64_             },        /* DSUB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000198, &NMD::DDIVU            , 0,
+       0xfc0001ff, 0xc0000198, &DDIVU            , 0,
        MIPS64_             },        /* DDIVU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00001a0, 0                      , 0,
@@ -20709,10 +20709,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc00001c8, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(57) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00001d0, &NMD::DSUBU            , 0,
+       0xfc0001ff, 0xc00001d0, &DSUBU            , 0,
        MIPS64_             },        /* DSUBU */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00001d8, &NMD::DMODU            , 0,
+       0xfc0001ff, 0xc00001d8, &DMODU            , 0,
        MIPS64_             },        /* DMODU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00001e0, 0                      , 0,
@@ -20842,7 +20842,7 @@ NMD::Pool NMD::POOL32Sxf_4[128] = {
        0xfc00ffff, 0xc000493c, 0                      , 0,
        0x0                 },        /* POOL32Sxf_4~*(36) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0xc0004b3c, &NMD::DCLO             , 0,
+       0xfc00ffff, 0xc0004b3c, &DCLO             , 0,
        MIPS64_             },        /* DCLO */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0xc0004d3c, 0                      , 0,
@@ -20866,7 +20866,7 @@ NMD::Pool NMD::POOL32Sxf_4[128] = {
        0xfc00ffff, 0xc000593c, 0                      , 0,
        0x0                 },        /* POOL32Sxf_4~*(44) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0xc0005b3c, &NMD::DCLZ             , 0,
+       0xfc00ffff, 0xc0005b3c, &DCLZ             , 0,
        MIPS64_             },        /* DCLZ */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0xc0005d3c, 0                      , 0,
@@ -21147,10 +21147,10 @@ NMD::Pool NMD::POOL32Sxf[8] = {
 
 NMD::Pool NMD::POOL32S_4[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0xc0000004, &NMD::EXTD             , 0,
+       0xfc00003f, 0xc0000004, &EXTD             , 0,
        MIPS64_             },        /* EXTD */
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0xc000000c, &NMD::EXTD32           , 0,
+       0xfc00003f, 0xc000000c, &EXTD32           , 0,
        MIPS64_             },        /* EXTD32 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00003f, 0xc0000014, 0                      , 0,
@@ -21203,27 +21203,27 @@ NMD::Pool NMD::POOL32S[8] = {
 
 NMD::Pool NMD::P_LUI[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000002, 0xe0000000, &NMD::LUI              , 0,
+       0xfc000002, 0xe0000000, &LUI              , 0,
        0x0                 },        /* LUI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000002, 0xe0000002, &NMD::ALUIPC           , 0,
+       0xfc000002, 0xe0000002, &ALUIPC           , 0,
        0x0                 },        /* ALUIPC */
 };
 
 
 NMD::Pool NMD::P_GP_LH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0001, 0x44100000, &NMD::LH_GP_           , 0,
+       0xfc1c0001, 0x44100000, &LH_GP_           , 0,
        0x0                 },        /* LH[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0001, 0x44100001, &NMD::LHU_GP_          , 0,
+       0xfc1c0001, 0x44100001, &LHU_GP_          , 0,
        0x0                 },        /* LHU[GP] */
 };
 
 
 NMD::Pool NMD::P_GP_SH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0001, 0x44140000, &NMD::SH_GP_           , 0,
+       0xfc1c0001, 0x44140000, &SH_GP_           , 0,
        0x0                 },        /* SH[GP] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc1c0001, 0x44140001, 0                      , 0,
@@ -21233,23 +21233,23 @@ NMD::Pool NMD::P_GP_SH[2] = {
 
 NMD::Pool NMD::P_GP_CP1[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180000, &NMD::LWC1_GP_         , 0,
+       0xfc1c0003, 0x44180000, &LWC1_GP_         , 0,
        CP1_                },        /* LWC1[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180001, &NMD::SWC1_GP_         , 0,
+       0xfc1c0003, 0x44180001, &SWC1_GP_         , 0,
        CP1_                },        /* SWC1[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180002, &NMD::LDC1_GP_         , 0,
+       0xfc1c0003, 0x44180002, &LDC1_GP_         , 0,
        CP1_                },        /* LDC1[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180003, &NMD::SDC1_GP_         , 0,
+       0xfc1c0003, 0x44180003, &SDC1_GP_         , 0,
        CP1_                },        /* SDC1[GP] */
 };
 
 
 NMD::Pool NMD::P_GP_M64[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x441c0000, &NMD::LWU_GP_          , 0,
+       0xfc1c0003, 0x441c0000, &LWU_GP_          , 0,
        MIPS64_             },        /* LWU[GP] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc1c0003, 0x441c0001, 0                      , 0,
@@ -21265,16 +21265,16 @@ NMD::Pool NMD::P_GP_M64[4] = {
 
 NMD::Pool NMD::P_GP_BH[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x44000000, &NMD::LB_GP_           , 0,
+       0xfc1c0000, 0x44000000, &LB_GP_           , 0,
        0x0                 },        /* LB[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x44040000, &NMD::SB_GP_           , 0,
+       0xfc1c0000, 0x44040000, &SB_GP_           , 0,
        0x0                 },        /* SB[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x44080000, &NMD::LBU_GP_          , 0,
+       0xfc1c0000, 0x44080000, &LBU_GP_          , 0,
        0x0                 },        /* LBU[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x440c0000, &NMD::ADDIU_GP_B_      , 0,
+       0xfc1c0000, 0x440c0000, &ADDIU_GP_B_      , 0,
        0x0                 },        /* ADDIU[GP.B] */
     { pool                , P_GP_LH             , 2   , 32,
        0xfc1c0000, 0x44100000, 0                      , 0,
@@ -21293,134 +21293,134 @@ NMD::Pool NMD::P_GP_BH[8] = {
 
 NMD::Pool NMD::P_LS_U12[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84000000, &NMD::LB_U12_          , 0,
+       0xfc00f000, 0x84000000, &LB_U12_          , 0,
        0x0                 },        /* LB[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84001000, &NMD::SB_U12_          , 0,
+       0xfc00f000, 0x84001000, &SB_U12_          , 0,
        0x0                 },        /* SB[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84002000, &NMD::LBU_U12_         , 0,
+       0xfc00f000, 0x84002000, &LBU_U12_         , 0,
        0x0                 },        /* LBU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84003000, &NMD::PREF_U12_        , 0,
+       0xfc00f000, 0x84003000, &PREF_U12_        , 0,
        0x0                 },        /* PREF[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84004000, &NMD::LH_U12_          , 0,
+       0xfc00f000, 0x84004000, &LH_U12_          , 0,
        0x0                 },        /* LH[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84005000, &NMD::SH_U12_          , 0,
+       0xfc00f000, 0x84005000, &SH_U12_          , 0,
        0x0                 },        /* SH[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84006000, &NMD::LHU_U12_         , 0,
+       0xfc00f000, 0x84006000, &LHU_U12_         , 0,
        0x0                 },        /* LHU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84007000, &NMD::LWU_U12_         , 0,
+       0xfc00f000, 0x84007000, &LWU_U12_         , 0,
        MIPS64_             },        /* LWU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84008000, &NMD::LW_U12_          , 0,
+       0xfc00f000, 0x84008000, &LW_U12_          , 0,
        0x0                 },        /* LW[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84009000, &NMD::SW_U12_          , 0,
+       0xfc00f000, 0x84009000, &SW_U12_          , 0,
        0x0                 },        /* SW[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400a000, &NMD::LWC1_U12_        , 0,
+       0xfc00f000, 0x8400a000, &LWC1_U12_        , 0,
        CP1_                },        /* LWC1[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400b000, &NMD::SWC1_U12_        , 0,
+       0xfc00f000, 0x8400b000, &SWC1_U12_        , 0,
        CP1_                },        /* SWC1[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400c000, &NMD::LD_U12_          , 0,
+       0xfc00f000, 0x8400c000, &LD_U12_          , 0,
        MIPS64_             },        /* LD[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400d000, &NMD::SD_U12_          , 0,
+       0xfc00f000, 0x8400d000, &SD_U12_          , 0,
        MIPS64_             },        /* SD[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400e000, &NMD::LDC1_U12_        , 0,
+       0xfc00f000, 0x8400e000, &LDC1_U12_        , 0,
        CP1_                },        /* LDC1[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400f000, &NMD::SDC1_U12_        , 0,
+       0xfc00f000, 0x8400f000, &SDC1_U12_        , 0,
        CP1_                },        /* SDC1[U12] */
 };
 
 
 NMD::Pool NMD::P_PREF_S9_[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xffe07f00, 0xa7e01800, &NMD::SYNCI            , 0,
+       0xffe07f00, 0xa7e01800, &SYNCI            , 0,
        0x0                 },        /* SYNCI */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &PREF_S9__cond    ,
+       0xfc007f00, 0xa4001800, &PREF_S9_         , &PREF_S9__cond    ,
        0x0                 },        /* PREF[S9] */
 };
 
 
 NMD::Pool NMD::P_LS_S0[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000000, &NMD::LB_S9_           , 0,
+       0xfc007f00, 0xa4000000, &LB_S9_           , 0,
        0x0                 },        /* LB[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000800, &NMD::SB_S9_           , 0,
+       0xfc007f00, 0xa4000800, &SB_S9_           , 0,
        0x0                 },        /* SB[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001000, &NMD::LBU_S9_          , 0,
+       0xfc007f00, 0xa4001000, &LBU_S9_          , 0,
        0x0                 },        /* LBU[S9] */
     { pool                , P_PREF_S9_          , 2   , 32,
        0xfc007f00, 0xa4001800, 0                      , 0,
        0x0                 },        /* P.PREF[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002000, &NMD::LH_S9_           , 0,
+       0xfc007f00, 0xa4002000, &LH_S9_           , 0,
        0x0                 },        /* LH[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002800, &NMD::SH_S9_           , 0,
+       0xfc007f00, 0xa4002800, &SH_S9_           , 0,
        0x0                 },        /* SH[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003000, &NMD::LHU_S9_          , 0,
+       0xfc007f00, 0xa4003000, &LHU_S9_          , 0,
        0x0                 },        /* LHU[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003800, &NMD::LWU_S9_          , 0,
+       0xfc007f00, 0xa4003800, &LWU_S9_          , 0,
        MIPS64_             },        /* LWU[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004000, &NMD::LW_S9_           , 0,
+       0xfc007f00, 0xa4004000, &LW_S9_           , 0,
        0x0                 },        /* LW[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004800, &NMD::SW_S9_           , 0,
+       0xfc007f00, 0xa4004800, &SW_S9_           , 0,
        0x0                 },        /* SW[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4005000, &NMD::LWC1_S9_         , 0,
+       0xfc007f00, 0xa4005000, &LWC1_S9_         , 0,
        CP1_                },        /* LWC1[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4005800, &NMD::SWC1_S9_         , 0,
+       0xfc007f00, 0xa4005800, &SWC1_S9_         , 0,
        CP1_                },        /* SWC1[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006000, &NMD::LD_S9_           , 0,
+       0xfc007f00, 0xa4006000, &LD_S9_           , 0,
        MIPS64_             },        /* LD[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006800, &NMD::SD_S9_           , 0,
+       0xfc007f00, 0xa4006800, &SD_S9_           , 0,
        MIPS64_             },        /* SD[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4007000, &NMD::LDC1_S9_         , 0,
+       0xfc007f00, 0xa4007000, &LDC1_S9_         , 0,
        CP1_                },        /* LDC1[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4007800, &NMD::SDC1_S9_         , 0,
+       0xfc007f00, 0xa4007800, &SDC1_S9_         , 0,
        CP1_                },        /* SDC1[S9] */
 };
 
 
 NMD::Pool NMD::ASET_ACLR[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfe007f00, 0xa4001100, &NMD::ASET             , 0,
+       0xfe007f00, 0xa4001100, &ASET             , 0,
        MCU_                },        /* ASET */
     { instruction         , 0                   , 0   , 32,
-       0xfe007f00, 0xa6001100, &NMD::ACLR             , 0,
+       0xfe007f00, 0xa6001100, &ACLR             , 0,
        MCU_                },        /* ACLR */
 };
 
 
 NMD::Pool NMD::P_LL[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005100, &NMD::LL               , 0,
+       0xfc007f03, 0xa4005100, &LL               , 0,
        0x0                 },        /* LL */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005101, &NMD::LLWP             , 0,
+       0xfc007f03, 0xa4005101, &LLWP             , 0,
        XNP_                },        /* LLWP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005102, 0                      , 0,
@@ -21433,10 +21433,10 @@ NMD::Pool NMD::P_LL[4] = {
 
 NMD::Pool NMD::P_SC[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005900, &NMD::SC               , 0,
+       0xfc007f03, 0xa4005900, &SC               , 0,
        0x0                 },        /* SC */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005901, &NMD::SCWP             , 0,
+       0xfc007f03, 0xa4005901, &SCWP             , 0,
        XNP_                },        /* SCWP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005902, 0                      , 0,
@@ -21449,10 +21449,10 @@ NMD::Pool NMD::P_SC[4] = {
 
 NMD::Pool NMD::P_LLD[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007100, &NMD::LLD              , 0,
+       0xfc007f07, 0xa4007100, &LLD              , 0,
        MIPS64_             },        /* LLD */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007101, &NMD::LLDP             , 0,
+       0xfc007f07, 0xa4007101, &LLDP             , 0,
        MIPS64_             },        /* LLDP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f07, 0xa4007102, 0                      , 0,
@@ -21477,10 +21477,10 @@ NMD::Pool NMD::P_LLD[8] = {
 
 NMD::Pool NMD::P_SCD[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007900, &NMD::SCD              , 0,
+       0xfc007f07, 0xa4007900, &SCD              , 0,
        MIPS64_             },        /* SCD */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007901, &NMD::SCDP             , 0,
+       0xfc007f07, 0xa4007901, &SCDP             , 0,
        MIPS64_             },        /* SCDP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f07, 0xa4007902, 0                      , 0,
@@ -21517,22 +21517,22 @@ NMD::Pool NMD::P_LS_S1[16] = {
        0xfc007f00, 0xa4001900, 0                      , 0,
        0x0                 },        /* P.LS.S1~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002100, &NMD::UALH             , 0,
+       0xfc007f00, 0xa4002100, &UALH             , 0,
        XMMS_               },        /* UALH */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002900, &NMD::UASH             , 0,
+       0xfc007f00, 0xa4002900, &UASH             , 0,
        XMMS_               },        /* UASH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f00, 0xa4003100, 0                      , 0,
        0x0                 },        /* P.LS.S1~*(6) */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003900, &NMD::CACHE            , 0,
+       0xfc007f00, 0xa4003900, &CACHE            , 0,
        CP0_                },        /* CACHE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004100, &NMD::LWC2             , 0,
+       0xfc007f00, 0xa4004100, &LWC2             , 0,
        CP2_                },        /* LWC2 */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004900, &NMD::SWC2             , 0,
+       0xfc007f00, 0xa4004900, &SWC2             , 0,
        CP2_                },        /* SWC2 */
     { pool                , P_LL                , 4   , 32,
        0xfc007f00, 0xa4005100, 0                      , 0,
@@ -21541,10 +21541,10 @@ NMD::Pool NMD::P_LS_S1[16] = {
        0xfc007f00, 0xa4005900, 0                      , 0,
        0x0                 },        /* P.SC */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006100, &NMD::LDC2             , 0,
+       0xfc007f00, 0xa4006100, &LDC2             , 0,
        CP2_                },        /* LDC2 */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006900, &NMD::SDC2             , 0,
+       0xfc007f00, 0xa4006900, &SDC2             , 0,
        CP2_                },        /* SDC2 */
     { pool                , P_LLD               , 8   , 32,
        0xfc007f00, 0xa4007100, 0                      , 0,
@@ -21557,20 +21557,20 @@ NMD::Pool NMD::P_LS_S1[16] = {
 
 NMD::Pool NMD::P_PREFE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xffe07f00, 0xa7e01a00, &NMD::SYNCIE           , 0,
+       0xffe07f00, 0xa7e01a00, &SYNCIE           , 0,
        CP0_ | EVA_         },        /* SYNCIE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &PREFE_cond       ,
+       0xfc007f00, 0xa4001a00, &PREFE            , &PREFE_cond       ,
        CP0_ | EVA_         },        /* PREFE */
 };
 
 
 NMD::Pool NMD::P_LLE[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005200, &NMD::LLE              , 0,
+       0xfc007f03, 0xa4005200, &LLE              , 0,
        CP0_ | EVA_         },        /* LLE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005201, &NMD::LLWPE            , 0,
+       0xfc007f03, 0xa4005201, &LLWPE            , 0,
        CP0_ | EVA_         },        /* LLWPE */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005202, 0                      , 0,
@@ -21583,10 +21583,10 @@ NMD::Pool NMD::P_LLE[4] = {
 
 NMD::Pool NMD::P_SCE[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005a00, &NMD::SCE              , 0,
+       0xfc007f03, 0xa4005a00, &SCE              , 0,
        CP0_ | EVA_         },        /* SCE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005a01, &NMD::SCWPE            , 0,
+       0xfc007f03, 0xa4005a01, &SCWPE            , 0,
        CP0_ | EVA_         },        /* SCWPE */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005a02, 0                      , 0,
@@ -21599,34 +21599,34 @@ NMD::Pool NMD::P_SCE[4] = {
 
 NMD::Pool NMD::P_LS_E0[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000200, &NMD::LBE              , 0,
+       0xfc007f00, 0xa4000200, &LBE              , 0,
        CP0_ | EVA_         },        /* LBE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000a00, &NMD::SBE              , 0,
+       0xfc007f00, 0xa4000a00, &SBE              , 0,
        CP0_ | EVA_         },        /* SBE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001200, &NMD::LBUE             , 0,
+       0xfc007f00, 0xa4001200, &LBUE             , 0,
        CP0_ | EVA_         },        /* LBUE */
     { pool                , P_PREFE             , 2   , 32,
        0xfc007f00, 0xa4001a00, 0                      , 0,
        0x0                 },        /* P.PREFE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002200, &NMD::LHE              , 0,
+       0xfc007f00, 0xa4002200, &LHE              , 0,
        CP0_ | EVA_         },        /* LHE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002a00, &NMD::SHE              , 0,
+       0xfc007f00, 0xa4002a00, &SHE              , 0,
        CP0_ | EVA_         },        /* SHE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003200, &NMD::LHUE             , 0,
+       0xfc007f00, 0xa4003200, &LHUE             , 0,
        CP0_ | EVA_         },        /* LHUE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003a00, &NMD::CACHEE           , 0,
+       0xfc007f00, 0xa4003a00, &CACHEE           , 0,
        CP0_ | EVA_         },        /* CACHEE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004200, &NMD::LWE              , 0,
+       0xfc007f00, 0xa4004200, &LWE              , 0,
        CP0_ | EVA_         },        /* LWE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004a00, &NMD::SWE              , 0,
+       0xfc007f00, 0xa4004a00, &SWE              , 0,
        CP0_ | EVA_         },        /* SWE */
     { pool                , P_LLE               , 4   , 32,
        0xfc007f00, 0xa4005200, 0                      , 0,
@@ -21651,40 +21651,40 @@ NMD::Pool NMD::P_LS_E0[16] = {
 
 NMD::Pool NMD::P_LS_WM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000400, &NMD::LWM              , 0,
+       0xfc000f00, 0xa4000400, &LWM              , 0,
        XMMS_               },        /* LWM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000c00, &NMD::SWM              , 0,
+       0xfc000f00, 0xa4000c00, &SWM              , 0,
        XMMS_               },        /* SWM */
 };
 
 
 NMD::Pool NMD::P_LS_UAWM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000500, &NMD::UALWM            , 0,
+       0xfc000f00, 0xa4000500, &UALWM            , 0,
        XMMS_               },        /* UALWM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000d00, &NMD::UASWM            , 0,
+       0xfc000f00, 0xa4000d00, &UASWM            , 0,
        XMMS_               },        /* UASWM */
 };
 
 
 NMD::Pool NMD::P_LS_DM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000600, &NMD::LDM              , 0,
+       0xfc000f00, 0xa4000600, &LDM              , 0,
        MIPS64_             },        /* LDM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000e00, &NMD::SDM              , 0,
+       0xfc000f00, 0xa4000e00, &SDM              , 0,
        MIPS64_             },        /* SDM */
 };
 
 
 NMD::Pool NMD::P_LS_UADM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000700, &NMD::UALDM            , 0,
+       0xfc000f00, 0xa4000700, &UALDM            , 0,
        MIPS64_             },        /* UALDM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000f00, &NMD::UASDM            , 0,
+       0xfc000f00, 0xa4000f00, &UASDM            , 0,
        MIPS64_             },        /* UASDM */
 };
 
@@ -21719,30 +21719,30 @@ NMD::Pool NMD::P_LS_S9[8] = {
 
 NMD::Pool NMD::P_BAL[2] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfe000000, 0x28000000, &NMD::BC_32_           , 0,
+       0xfe000000, 0x28000000, &BC_32_           , 0,
        0x0                 },        /* BC[32] */
     { call_instruction    , 0                   , 0   , 32,
-       0xfe000000, 0x2a000000, &NMD::BALC_32_         , 0,
+       0xfe000000, 0x2a000000, &BALC_32_         , 0,
        0x0                 },        /* BALC[32] */
 };
 
 
 NMD::Pool NMD::P_BALRSC[2] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xffe0f000, 0x48008000, &NMD::BRSC             , 0,
+       0xffe0f000, 0x48008000, &BRSC             , 0,
        0x0                 },        /* BRSC */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48008000, &NMD::BALRSC           , &BALRSC_cond      ,
+       0xfc00f000, 0x48008000, &BALRSC           , &BALRSC_cond      ,
        0x0                 },        /* BALRSC */
 };
 
 
 NMD::Pool NMD::P_J[16] = {
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48000000, &NMD::JALRC_32_        , 0,
+       0xfc00f000, 0x48000000, &JALRC_32_        , 0,
        0x0                 },        /* JALRC[32] */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48001000, &NMD::JALRC_HB         , 0,
+       0xfc00f000, 0x48001000, &JALRC_HB         , 0,
        0x0                 },        /* JALRC.HB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f000, 0x48002000, 0                      , 0,
@@ -21791,19 +21791,19 @@ NMD::Pool NMD::P_J[16] = {
 
 NMD::Pool NMD::P_BR3A[32] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88004000, &NMD::BC1EQZC          , 0,
+       0xfc1fc000, 0x88004000, &BC1EQZC          , 0,
        CP1_                },        /* BC1EQZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88014000, &NMD::BC1NEZC          , 0,
+       0xfc1fc000, 0x88014000, &BC1NEZC          , 0,
        CP1_                },        /* BC1NEZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88024000, &NMD::BC2EQZC          , 0,
+       0xfc1fc000, 0x88024000, &BC2EQZC          , 0,
        CP2_                },        /* BC2EQZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88034000, &NMD::BC2NEZC          , 0,
+       0xfc1fc000, 0x88034000, &BC2NEZC          , 0,
        CP2_                },        /* BC2NEZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88044000, &NMD::BPOSGE32C        , 0,
+       0xfc1fc000, 0x88044000, &BPOSGE32C        , 0,
        DSP_                },        /* BPOSGE32C */
     { reserved_block      , 0                   , 0   , 32,
        0xfc1fc000, 0x88054000, 0                      , 0,
@@ -21891,60 +21891,60 @@ NMD::Pool NMD::P_BR3A[32] = {
 
 NMD::Pool NMD::P_BR1[4] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0x88000000, &NMD::BEQC_32_         , 0,
+       0xfc00c000, 0x88000000, &BEQC_32_         , 0,
        0x0                 },        /* BEQC[32] */
     { pool                , P_BR3A              , 32  , 32,
        0xfc00c000, 0x88004000, 0                      , 0,
        0x0                 },        /* P.BR3A */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0x88008000, &NMD::BGEC             , 0,
+       0xfc00c000, 0x88008000, &BGEC             , 0,
        0x0                 },        /* BGEC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0x8800c000, &NMD::BGEUC            , 0,
+       0xfc00c000, 0x8800c000, &BGEUC            , 0,
        0x0                 },        /* BGEUC */
 };
 
 
 NMD::Pool NMD::P_BR2[4] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0xa8000000, &NMD::BNEC_32_         , 0,
+       0xfc00c000, 0xa8000000, &BNEC_32_         , 0,
        0x0                 },        /* BNEC[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00c000, 0xa8004000, 0                      , 0,
        0x0                 },        /* P.BR2~*(1) */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0xa8008000, &NMD::BLTC             , 0,
+       0xfc00c000, 0xa8008000, &BLTC             , 0,
        0x0                 },        /* BLTC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0xa800c000, &NMD::BLTUC            , 0,
+       0xfc00c000, 0xa800c000, &BLTUC            , 0,
        0x0                 },        /* BLTUC */
 };
 
 
 NMD::Pool NMD::P_BRI[8] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8000000, &NMD::BEQIC            , 0,
+       0xfc1c0000, 0xc8000000, &BEQIC            , 0,
        0x0                 },        /* BEQIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8040000, &NMD::BBEQZC           , 0,
+       0xfc1c0000, 0xc8040000, &BBEQZC           , 0,
        XMMS_               },        /* BBEQZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8080000, &NMD::BGEIC            , 0,
+       0xfc1c0000, 0xc8080000, &BGEIC            , 0,
        0x0                 },        /* BGEIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc80c0000, &NMD::BGEIUC           , 0,
+       0xfc1c0000, 0xc80c0000, &BGEIUC           , 0,
        0x0                 },        /* BGEIUC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8100000, &NMD::BNEIC            , 0,
+       0xfc1c0000, 0xc8100000, &BNEIC            , 0,
        0x0                 },        /* BNEIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8140000, &NMD::BBNEZC           , 0,
+       0xfc1c0000, 0xc8140000, &BBNEZC           , 0,
        XMMS_               },        /* BBNEZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8180000, &NMD::BLTIC            , 0,
+       0xfc1c0000, 0xc8180000, &BLTIC            , 0,
        0x0                 },        /* BLTIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc81c0000, &NMD::BLTIUC           , 0,
+       0xfc1c0000, 0xc81c0000, &BLTIUC           , 0,
        0x0                 },        /* BLTIUC */
 };
 
@@ -21975,7 +21975,7 @@ NMD::Pool NMD::P32[32] = {
        0xfc000000, 0xe0000000, 0                      , 0,
        0x0                 },        /* P.LUI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000000, 0x04000000, &NMD::ADDIUPC_32_      , 0,
+       0xfc000000, 0x04000000, &ADDIUPC_32_      , 0,
        0x0                 },        /* ADDIUPC[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000000, 0x24000000, 0                      , 0,
@@ -21999,7 +21999,7 @@ NMD::Pool NMD::P32[32] = {
        0xfc000000, 0xe4000000, 0                      , 0,
        0x0                 },        /* P32~*(29) */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc000000, 0x08000000, &NMD::MOVE_BALC        , 0,
+       0xfc000000, 0x08000000, &MOVE_BALC        , 0,
        XMMS_               },        /* MOVE.BALC */
     { pool                , P_BAL               , 2   , 32,
        0xfc000000, 0x28000000, 0                      , 0,
@@ -22051,10 +22051,10 @@ NMD::Pool NMD::P32[32] = {
 
 NMD::Pool NMD::P16_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfffc    , 0x1008    , &NMD::SYSCALL_16_      , 0,
+       0xfffc    , 0x1008    , &SYSCALL_16_      , 0,
        0x0                 },        /* SYSCALL[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfffc    , 0x100c    , &NMD::HYPCALL_16_      , 0,
+       0xfffc    , 0x100c    , &HYPCALL_16_      , 0,
        CP0_ | VZ_          },        /* HYPCALL[16] */
 };
 
@@ -22067,10 +22067,10 @@ NMD::Pool NMD::P16_RI[4] = {
        0xfff8    , 0x1008    , 0                      , 0,
        0x0                 },        /* P16.SYSCALL */
     { instruction         , 0                   , 0   , 16,
-       0xfff8    , 0x1010    , &NMD::BREAK_16_        , 0,
+       0xfff8    , 0x1010    , &BREAK_16_        , 0,
        0x0                 },        /* BREAK[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfff8    , 0x1018    , &NMD::SDBBP_16_        , 0,
+       0xfff8    , 0x1018    , &SDBBP_16_        , 0,
        EJTAG_              },        /* SDBBP[16] */
 };
 
@@ -22080,33 +22080,33 @@ NMD::Pool NMD::P16_MV[2] = {
        0xffe0    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x1000    , &NMD::MOVE             , &MOVE_cond        ,
+       0xfc00    , 0x1000    , &MOVE             , &MOVE_cond        ,
        0x0                 },        /* MOVE */
 };
 
 
 NMD::Pool NMD::P16_SHIFT[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x3000    , &NMD::SLL_16_          , 0,
+       0xfc08    , 0x3000    , &SLL_16_          , 0,
        0x0                 },        /* SLL[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x3008    , &NMD::SRL_16_          , 0,
+       0xfc08    , 0x3008    , &SRL_16_          , 0,
        0x0                 },        /* SRL[16] */
 };
 
 
 NMD::Pool NMD::POOL16C_00[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x5000    , &NMD::NOT_16_          , 0,
+       0xfc0f    , 0x5000    , &NOT_16_          , 0,
        0x0                 },        /* NOT[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x5004    , &NMD::XOR_16_          , 0,
+       0xfc0f    , 0x5004    , &XOR_16_          , 0,
        0x0                 },        /* XOR[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x5008    , &NMD::AND_16_          , 0,
+       0xfc0f    , 0x5008    , &AND_16_          , 0,
        0x0                 },        /* AND[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x500c    , &NMD::OR_16_           , 0,
+       0xfc0f    , 0x500c    , &OR_16_           , 0,
        0x0                 },        /* OR[16] */
 };
 
@@ -22126,7 +22126,7 @@ NMD::Pool NMD::P16C[2] = {
        0xfc01    , 0x5000    , 0                      , 0,
        0x0                 },        /* POOL16C_0 */
     { instruction         , 0                   , 0   , 16,
-       0xfc01    , 0x5001    , &NMD::LWXS_16_         , 0,
+       0xfc01    , 0x5001    , &LWXS_16_         , 0,
        0x0                 },        /* LWXS[16] */
 };
 
@@ -22136,24 +22136,24 @@ NMD::Pool NMD::P16_A1[2] = {
        0xfc40    , 0x7000    , 0                      , 0,
        0x0                 },        /* P16.A1~*(0) */
     { instruction         , 0                   , 0   , 16,
-       0xfc40    , 0x7040    , &NMD::ADDIU_R1_SP_     , 0,
+       0xfc40    , 0x7040    , &ADDIU_R1_SP_     , 0,
        0x0                 },        /* ADDIU[R1.SP] */
 };
 
 
 NMD::Pool NMD::P_ADDIU_RS5_[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xffe8    , 0x9008    , &NMD::NOP_16_          , 0,
+       0xffe8    , 0x9008    , &NOP_16_          , 0,
        0x0                 },        /* NOP[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &ADDIU_RS5__cond  ,
+       0xfc08    , 0x9008    , &ADDIU_RS5_       , &ADDIU_RS5__cond  ,
        0x0                 },        /* ADDIU[RS5] */
 };
 
 
 NMD::Pool NMD::P16_A2[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x9000    , &NMD::ADDIU_R2_        , 0,
+       0xfc08    , 0x9000    , &ADDIU_R2_        , 0,
        0x0                 },        /* ADDIU[R2] */
     { pool                , P_ADDIU_RS5_        , 2   , 16,
        0xfc08    , 0x9008    , 0                      , 0,
@@ -22163,30 +22163,30 @@ NMD::Pool NMD::P16_A2[2] = {
 
 NMD::Pool NMD::P16_ADDU[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc01    , 0xb000    , &NMD::ADDU_16_         , 0,
+       0xfc01    , 0xb000    , &ADDU_16_         , 0,
        0x0                 },        /* ADDU[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc01    , 0xb001    , &NMD::SUBU_16_         , 0,
+       0xfc01    , 0xb001    , &SUBU_16_         , 0,
        0x0                 },        /* SUBU[16] */
 };
 
 
 NMD::Pool NMD::P16_JRC[2] = {
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc1f    , 0xd800    , &NMD::JRC              , 0,
+       0xfc1f    , 0xd800    , &JRC              , 0,
        0x0                 },        /* JRC */
     { call_instruction    , 0                   , 0   , 16,
-       0xfc1f    , 0xd810    , &NMD::JALRC_16_        , 0,
+       0xfc1f    , 0xd810    , &JALRC_16_        , 0,
        0x0                 },        /* JALRC[16] */
 };
 
 
 NMD::Pool NMD::P16_BR1[2] = {
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xd800    , &NMD::BEQC_16_         , &BEQC_16__cond    ,
+       0xfc00    , 0xd800    , &BEQC_16_         , &BEQC_16__cond    ,
        XMMS_               },        /* BEQC[16] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xd800    , &NMD::BNEC_16_         , &BNEC_16__cond    ,
+       0xfc00    , 0xd800    , &BNEC_16_         , &BNEC_16__cond    ,
        XMMS_               },        /* BNEC[16] */
 };
 
@@ -22203,20 +22203,20 @@ NMD::Pool NMD::P16_BR[2] = {
 
 NMD::Pool NMD::P16_SR[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfd00    , 0x1c00    , &NMD::SAVE_16_         , 0,
+       0xfd00    , 0x1c00    , &SAVE_16_         , 0,
        0x0                 },        /* SAVE[16] */
     { return_instruction  , 0                   , 0   , 16,
-       0xfd00    , 0x1d00    , &NMD::RESTORE_JRC_16_  , 0,
+       0xfd00    , 0x1d00    , &RESTORE_JRC_16_  , 0,
        0x0                 },        /* RESTORE.JRC[16] */
 };
 
 
 NMD::Pool NMD::P16_4X4[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfd08    , 0x3c00    , &NMD::ADDU_4X4_        , 0,
+       0xfd08    , 0x3c00    , &ADDU_4X4_        , 0,
        XMMS_               },        /* ADDU[4X4] */
     { instruction         , 0                   , 0   , 16,
-       0xfd08    , 0x3c08    , &NMD::MUL_4X4_         , 0,
+       0xfd08    , 0x3c08    , &MUL_4X4_         , 0,
        XMMS_               },        /* MUL[4X4] */
     { reserved_block      , 0                   , 0   , 16,
        0xfd08    , 0x3d00    , 0                      , 0,
@@ -22229,13 +22229,13 @@ NMD::Pool NMD::P16_4X4[4] = {
 
 NMD::Pool NMD::P16_LB[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc0c    , 0x5c00    , &NMD::LB_16_           , 0,
+       0xfc0c    , 0x5c00    , &LB_16_           , 0,
        0x0                 },        /* LB[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0c    , 0x5c04    , &NMD::SB_16_           , 0,
+       0xfc0c    , 0x5c04    , &SB_16_           , 0,
        0x0                 },        /* SB[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0c    , 0x5c08    , &NMD::LBU_16_          , 0,
+       0xfc0c    , 0x5c08    , &LBU_16_          , 0,
        0x0                 },        /* LBU[16] */
     { reserved_block      , 0                   , 0   , 16,
        0xfc0c    , 0x5c0c    , 0                      , 0,
@@ -22245,13 +22245,13 @@ NMD::Pool NMD::P16_LB[4] = {
 
 NMD::Pool NMD::P16_LH[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc09    , 0x7c00    , &NMD::LH_16_           , 0,
+       0xfc09    , 0x7c00    , &LH_16_           , 0,
        0x0                 },        /* LH[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc09    , 0x7c01    , &NMD::SH_16_           , 0,
+       0xfc09    , 0x7c01    , &SH_16_           , 0,
        0x0                 },        /* SH[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc09    , 0x7c08    , &NMD::LHU_16_          , 0,
+       0xfc09    , 0x7c08    , &LHU_16_          , 0,
        0x0                 },        /* LHU[16] */
     { reserved_block      , 0                   , 0   , 16,
        0xfc09    , 0x7c09    , 0                      , 0,
@@ -22279,40 +22279,40 @@ NMD::Pool NMD::P16[32] = {
        0xfc00    , 0xb000    , 0                      , 0,
        0x0                 },        /* P16.ADDU */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xd000    , &NMD::LI_16_           , 0,
+       0xfc00    , 0xd000    , &LI_16_           , 0,
        0x0                 },        /* LI[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xf000    , &NMD::ANDI_16_         , 0,
+       0xfc00    , 0xf000    , &ANDI_16_         , 0,
        0x0                 },        /* ANDI[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x1400    , &NMD::LW_16_           , 0,
+       0xfc00    , 0x1400    , &LW_16_           , 0,
        0x0                 },        /* LW[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x3400    , &NMD::LW_SP_           , 0,
+       0xfc00    , 0x3400    , &LW_SP_           , 0,
        0x0                 },        /* LW[SP] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x5400    , &NMD::LW_GP16_         , 0,
+       0xfc00    , 0x5400    , &LW_GP16_         , 0,
        0x0                 },        /* LW[GP16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x7400    , &NMD::LW_4X4_          , 0,
+       0xfc00    , 0x7400    , &LW_4X4_          , 0,
        XMMS_               },        /* LW[4X4] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x9400    , &NMD::SW_16_           , 0,
+       0xfc00    , 0x9400    , &SW_16_           , 0,
        0x0                 },        /* SW[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xb400    , &NMD::SW_SP_           , 0,
+       0xfc00    , 0xb400    , &SW_SP_           , 0,
        0x0                 },        /* SW[SP] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xd400    , &NMD::SW_GP16_         , 0,
+       0xfc00    , 0xd400    , &SW_GP16_         , 0,
        0x0                 },        /* SW[GP16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xf400    , &NMD::SW_4X4_          , 0,
+       0xfc00    , 0xf400    , &SW_4X4_          , 0,
        XMMS_               },        /* SW[4X4] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0x1800    , &NMD::BC_16_           , 0,
+       0xfc00    , 0x1800    , &BC_16_           , 0,
        0x0                 },        /* BC[16] */
     { call_instruction    , 0                   , 0   , 16,
-       0xfc00    , 0x3800    , &NMD::BALC_16_         , 0,
+       0xfc00    , 0x3800    , &BALC_16_         , 0,
        0x0                 },        /* BALC[16] */
     { reserved_block      , 0                   , 0   , 16,
        0xfc00    , 0x5800    , 0                      , 0,
@@ -22321,10 +22321,10 @@ NMD::Pool NMD::P16[32] = {
        0xfc00    , 0x7800    , 0                      , 0,
        0x0                 },        /* P16~*(14) */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0x9800    , &NMD::BEQZC_16_        , 0,
+       0xfc00    , 0x9800    , &BEQZC_16_        , 0,
        0x0                 },        /* BEQZC[16] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xb800    , &NMD::BNEZC_16_        , 0,
+       0xfc00    , 0xb800    , &BNEZC_16_        , 0,
        0x0                 },        /* BNEZC[16] */
     { pool                , P16_BR              , 2   , 16,
        0xfc00    , 0xd800    , 0                      , 0,
@@ -22348,13 +22348,13 @@ NMD::Pool NMD::P16[32] = {
        0xfc00    , 0x9c00    , 0                      , 0,
        0x0                 },        /* P16~*(19) */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xbc00    , &NMD::MOVEP            , 0,
+       0xfc00    , 0xbc00    , &MOVEP            , 0,
        XMMS_               },        /* MOVEP */
     { reserved_block      , 0                   , 0   , 16,
        0xfc00    , 0xdc00    , 0                      , 0,
        0x0                 },        /* P16~*(27) */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xfc00    , &NMD::MOVEP_REV_       , 0,
+       0xfc00    , 0xfc00    , &MOVEP_REV_       , 0,
        XMMS_               },        /* MOVEP[REV] */
 };
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 0e6670adf5..d27711b4e2 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -32,6 +32,7 @@ typedef uint16_t uint16;
 typedef uint64_t img_address;
 
 typedef bool(*conditional_function)(uint64 instruction);
+typedef std::string(*disassembly_function)(uint64 instruction);
 
 enum TABLE_ENTRY_TYPE {
     instruction,
@@ -72,8 +73,6 @@ public:
 
 private:
 
-    typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
-
     struct Pool {
         TABLE_ENTRY_TYPE     type;
         struct Pool          *next_table;
@@ -90,643 +89,6 @@ private:
     int Disassemble(const uint16 *data, std::string & dis,
                     TABLE_ENTRY_TYPE & type, const Pool *table, int table_size);
 
-    std::string ABS_D(uint64 instruction);
-    std::string ABS_S(uint64 instruction);
-    std::string ABSQ_S_PH(uint64 instruction);
-    std::string ABSQ_S_QB(uint64 instruction);
-    std::string ABSQ_S_W(uint64 instruction);
-    std::string ACLR(uint64 instruction);
-    std::string ADD(uint64 instruction);
-    std::string ADD_D(uint64 instruction);
-    std::string ADD_S(uint64 instruction);
-    std::string ADDIU_32_(uint64 instruction);
-    std::string ADDIU_48_(uint64 instruction);
-    std::string ADDIU_GP48_(uint64 instruction);
-    std::string ADDIU_GP_B_(uint64 instruction);
-    std::string ADDIU_GP_W_(uint64 instruction);
-    std::string ADDIU_NEG_(uint64 instruction);
-    std::string ADDIU_R1_SP_(uint64 instruction);
-    std::string ADDIU_R2_(uint64 instruction);
-    std::string ADDIU_RS5_(uint64 instruction);
-    std::string ADDIUPC_32_(uint64 instruction);
-    std::string ADDIUPC_48_(uint64 instruction);
-    std::string ADDQ_PH(uint64 instruction);
-    std::string ADDQ_S_PH(uint64 instruction);
-    std::string ADDQ_S_W(uint64 instruction);
-    std::string ADDQH_PH(uint64 instruction);
-    std::string ADDQH_R_PH(uint64 instruction);
-    std::string ADDQH_R_W(uint64 instruction);
-    std::string ADDQH_W(uint64 instruction);
-    std::string ADDSC(uint64 instruction);
-    std::string ADDU_16_(uint64 instruction);
-    std::string ADDU_32_(uint64 instruction);
-    std::string ADDU_4X4_(uint64 instruction);
-    std::string ADDU_PH(uint64 instruction);
-    std::string ADDU_QB(uint64 instruction);
-    std::string ADDU_S_PH(uint64 instruction);
-    std::string ADDU_S_QB(uint64 instruction);
-    std::string ADDUH_QB(uint64 instruction);
-    std::string ADDUH_R_QB(uint64 instruction);
-    std::string ADDWC(uint64 instruction);
-    std::string ALUIPC(uint64 instruction);
-    std::string AND_16_(uint64 instruction);
-    std::string AND_32_(uint64 instruction);
-    std::string ANDI_16_(uint64 instruction);
-    std::string ANDI_32_(uint64 instruction);
-    std::string APPEND(uint64 instruction);
-    std::string ASET(uint64 instruction);
-    std::string BALC_16_(uint64 instruction);
-    std::string BALC_32_(uint64 instruction);
-    std::string BALRSC(uint64 instruction);
-    std::string BBEQZC(uint64 instruction);
-    std::string BBNEZC(uint64 instruction);
-    std::string BC_16_(uint64 instruction);
-    std::string BC_32_(uint64 instruction);
-    std::string BC1EQZC(uint64 instruction);
-    std::string BC1NEZC(uint64 instruction);
-    std::string BC2EQZC(uint64 instruction);
-    std::string BC2NEZC(uint64 instruction);
-    std::string BEQC_16_(uint64 instruction);
-    std::string BEQC_32_(uint64 instruction);
-    std::string BEQIC(uint64 instruction);
-    std::string BEQZC_16_(uint64 instruction);
-    std::string BGEC(uint64 instruction);
-    std::string BGEIC(uint64 instruction);
-    std::string BGEIUC(uint64 instruction);
-    std::string BGEUC(uint64 instruction);
-    std::string BLTC(uint64 instruction);
-    std::string BLTIC(uint64 instruction);
-    std::string BLTIUC(uint64 instruction);
-    std::string BLTUC(uint64 instruction);
-    std::string BNEC_16_(uint64 instruction);
-    std::string BNEC_32_(uint64 instruction);
-    std::string BNEIC(uint64 instruction);
-    std::string BNEZC_16_(uint64 instruction);
-    std::string BPOSGE32C(uint64 instruction);
-    std::string BREAK_16_(uint64 instruction);
-    std::string BREAK_32_(uint64 instruction);
-    std::string BRSC(uint64 instruction);
-    std::string CACHE(uint64 instruction);
-    std::string CACHEE(uint64 instruction);
-    std::string CEIL_L_D(uint64 instruction);
-    std::string CEIL_L_S(uint64 instruction);
-    std::string CEIL_W_D(uint64 instruction);
-    std::string CEIL_W_S(uint64 instruction);
-    std::string CFC1(uint64 instruction);
-    std::string CFC2(uint64 instruction);
-    std::string CLASS_D(uint64 instruction);
-    std::string CLASS_S(uint64 instruction);
-    std::string CLO(uint64 instruction);
-    std::string CLZ(uint64 instruction);
-    std::string CMP_AF_D(uint64 instruction);
-    std::string CMP_AF_S(uint64 instruction);
-    std::string CMP_EQ_D(uint64 instruction);
-    std::string CMP_EQ_PH(uint64 instruction);
-    std::string CMP_EQ_S(uint64 instruction);
-    std::string CMP_LE_D(uint64 instruction);
-    std::string CMP_LE_PH(uint64 instruction);
-    std::string CMP_LE_S(uint64 instruction);
-    std::string CMP_LT_D(uint64 instruction);
-    std::string CMP_LT_PH(uint64 instruction);
-    std::string CMP_LT_S(uint64 instruction);
-    std::string CMP_NE_D(uint64 instruction);
-    std::string CMP_NE_S(uint64 instruction);
-    std::string CMP_OR_D(uint64 instruction);
-    std::string CMP_OR_S(uint64 instruction);
-    std::string CMP_SAF_D(uint64 instruction);
-    std::string CMP_SAF_S(uint64 instruction);
-    std::string CMP_SEQ_D(uint64 instruction);
-    std::string CMP_SEQ_S(uint64 instruction);
-    std::string CMP_SLE_D(uint64 instruction);
-    std::string CMP_SLE_S(uint64 instruction);
-    std::string CMP_SLT_D(uint64 instruction);
-    std::string CMP_SLT_S(uint64 instruction);
-    std::string CMP_SNE_D(uint64 instruction);
-    std::string CMP_SNE_S(uint64 instruction);
-    std::string CMP_SOR_D(uint64 instruction);
-    std::string CMP_SOR_S(uint64 instruction);
-    std::string CMP_SUEQ_D(uint64 instruction);
-    std::string CMP_SUEQ_S(uint64 instruction);
-    std::string CMP_SULE_D(uint64 instruction);
-    std::string CMP_SULE_S(uint64 instruction);
-    std::string CMP_SULT_D(uint64 instruction);
-    std::string CMP_SULT_S(uint64 instruction);
-    std::string CMP_SUN_D(uint64 instruction);
-    std::string CMP_SUN_S(uint64 instruction);
-    std::string CMP_SUNE_D(uint64 instruction);
-    std::string CMP_SUNE_S(uint64 instruction);
-    std::string CMP_UEQ_D(uint64 instruction);
-    std::string CMP_UEQ_S(uint64 instruction);
-    std::string CMP_ULE_D(uint64 instruction);
-    std::string CMP_ULE_S(uint64 instruction);
-    std::string CMP_ULT_D(uint64 instruction);
-    std::string CMP_ULT_S(uint64 instruction);
-    std::string CMP_UN_D(uint64 instruction);
-    std::string CMP_UN_S(uint64 instruction);
-    std::string CMP_UNE_D(uint64 instruction);
-    std::string CMP_UNE_S(uint64 instruction);
-    std::string CMPGDU_EQ_QB(uint64 instruction);
-    std::string CMPGDU_LE_QB(uint64 instruction);
-    std::string CMPGDU_LT_QB(uint64 instruction);
-    std::string CMPGU_EQ_QB(uint64 instruction);
-    std::string CMPGU_LE_QB(uint64 instruction);
-    std::string CMPGU_LT_QB(uint64 instruction);
-    std::string CMPU_EQ_QB(uint64 instruction);
-    std::string CMPU_LE_QB(uint64 instruction);
-    std::string CMPU_LT_QB(uint64 instruction);
-    std::string COP2_1(uint64 instruction);
-    std::string CTC1(uint64 instruction);
-    std::string CTC2(uint64 instruction);
-    std::string CVT_D_L(uint64 instruction);
-    std::string CVT_D_S(uint64 instruction);
-    std::string CVT_D_W(uint64 instruction);
-    std::string CVT_L_D(uint64 instruction);
-    std::string CVT_L_S(uint64 instruction);
-    std::string CVT_S_D(uint64 instruction);
-    std::string CVT_S_L(uint64 instruction);
-    std::string CVT_S_PL(uint64 instruction);
-    std::string CVT_S_PU(uint64 instruction);
-    std::string CVT_S_W(uint64 instruction);
-    std::string CVT_W_D(uint64 instruction);
-    std::string CVT_W_S(uint64 instruction);
-    std::string DADDIU_48_(uint64 instruction);
-    std::string DADDIU_NEG_(uint64 instruction);
-    std::string DADDIU_U12_(uint64 instruction);
-    std::string DADD(uint64 instruction);
-    std::string DADDU(uint64 instruction);
-    std::string DCLO(uint64 instruction);
-    std::string DCLZ(uint64 instruction);
-    std::string DDIV(uint64 instruction);
-    std::string DDIVU(uint64 instruction);
-    std::string DERET(uint64 instruction);
-    std::string DEXTM(uint64 instruction);
-    std::string DEXT(uint64 instruction);
-    std::string DEXTU(uint64 instruction);
-    std::string DINSM(uint64 instruction);
-    std::string DINS(uint64 instruction);
-    std::string DINSU(uint64 instruction);
-    std::string DI(uint64 instruction);
-    std::string DIV(uint64 instruction);
-    std::string DIV_D(uint64 instruction);
-    std::string DIV_S(uint64 instruction);
-    std::string DIVU(uint64 instruction);
-    std::string DLSA(uint64 instruction);
-    std::string DLUI_48_(uint64 instruction);
-    std::string DMFC0(uint64 instruction);
-    std::string DMFC1(uint64 instruction);
-    std::string DMFC2(uint64 instruction);
-    std::string DMFGC0(uint64 instruction);
-    std::string DMOD(uint64 instruction);
-    std::string DMODU(uint64 instruction);
-    std::string DMTC0(uint64 instruction);
-    std::string DMTC1(uint64 instruction);
-    std::string DMTC2(uint64 instruction);
-    std::string DMTGC0(uint64 instruction);
-    std::string DMT(uint64 instruction);
-    std::string DMUH(uint64 instruction);
-    std::string DMUHU(uint64 instruction);
-    std::string DMUL(uint64 instruction);
-    std::string DMULU(uint64 instruction);
-    std::string DPAQ_S_W_PH(uint64 instruction);
-    std::string DPAQ_SA_L_W(uint64 instruction);
-    std::string DPAQX_S_W_PH(uint64 instruction);
-    std::string DPAQX_SA_W_PH(uint64 instruction);
-    std::string DPAU_H_QBL(uint64 instruction);
-    std::string DPAU_H_QBR(uint64 instruction);
-    std::string DPA_W_PH(uint64 instruction);
-    std::string DPAX_W_PH(uint64 instruction);
-    std::string DPS_W_PH(uint64 instruction);
-    std::string DPSQ_SA_L_W(uint64 instruction);
-    std::string DPSQ_S_W_PH(uint64 instruction);
-    std::string DPSQX_SA_W_PH(uint64 instruction);
-    std::string DPSQX_S_W_PH(uint64 instruction);
-    std::string DPSU_H_QBL(uint64 instruction);
-    std::string DPSU_H_QBR(uint64 instruction);
-    std::string DPSX_W_PH(uint64 instruction);
-    std::string DROTR(uint64 instruction);
-    std::string DROTR32(uint64 instruction);
-    std::string DROTRV(uint64 instruction);
-    std::string DROTX(uint64 instruction);
-    std::string DSLL(uint64 instruction);
-    std::string DSLL32(uint64 instruction);
-    std::string DSLLV(uint64 instruction);
-    std::string DSRA(uint64 instruction);
-    std::string DSRA32(uint64 instruction);
-    std::string DSRAV(uint64 instruction);
-    std::string DSRL32(uint64 instruction);
-    std::string DSRL(uint64 instruction);
-    std::string DSRLV(uint64 instruction);
-    std::string DSUB(uint64 instruction);
-    std::string DSUBU(uint64 instruction);
-    std::string DVP(uint64 instruction);
-    std::string DVPE(uint64 instruction);
-    std::string EHB(uint64 instruction);
-    std::string EI(uint64 instruction);
-    std::string EMT(uint64 instruction);
-    std::string ERET(uint64 instruction);
-    std::string ERETNC(uint64 instruction);
-    std::string EVP(uint64 instruction);
-    std::string EVPE(uint64 instruction);
-    std::string EXT(uint64 instruction);
-    std::string EXTD(uint64 instruction);
-    std::string EXTD32(uint64 instruction);
-    std::string EXTP(uint64 instruction);
-    std::string EXTPDP(uint64 instruction);
-    std::string EXTPDPV(uint64 instruction);
-    std::string EXTPV(uint64 instruction);
-    std::string EXTR_RS_W(uint64 instruction);
-    std::string EXTR_R_W(uint64 instruction);
-    std::string EXTR_S_H(uint64 instruction);
-    std::string EXTR_W(uint64 instruction);
-    std::string EXTRV_R_W(uint64 instruction);
-    std::string EXTRV_RS_W(uint64 instruction);
-    std::string EXTRV_S_H(uint64 instruction);
-    std::string EXTRV_W(uint64 instruction);
-    std::string EXTW(uint64 instruction);
-    std::string FLOOR_L_D(uint64 instruction);
-    std::string FLOOR_L_S(uint64 instruction);
-    std::string FLOOR_W_D(uint64 instruction);
-    std::string FLOOR_W_S(uint64 instruction);
-    std::string FORK(uint64 instruction);
-    std::string HYPCALL(uint64 instruction);
-    std::string HYPCALL_16_(uint64 instruction);
-    std::string INS(uint64 instruction);
-    std::string INSV(uint64 instruction);
-    std::string IRET(uint64 instruction);
-    std::string JALRC_16_(uint64 instruction);
-    std::string JALRC_32_(uint64 instruction);
-    std::string JALRC_HB(uint64 instruction);
-    std::string JRC(uint64 instruction);
-    std::string LB_16_(uint64 instruction);
-    std::string LB_GP_(uint64 instruction);
-    std::string LB_S9_(uint64 instruction);
-    std::string LB_U12_(uint64 instruction);
-    std::string LBE(uint64 instruction);
-    std::string LBU_16_(uint64 instruction);
-    std::string LBU_GP_(uint64 instruction);
-    std::string LBU_S9_(uint64 instruction);
-    std::string LBU_U12_(uint64 instruction);
-    std::string LBUE(uint64 instruction);
-    std::string LBUX(uint64 instruction);
-    std::string LBX(uint64 instruction);
-    std::string LD_GP_(uint64 instruction);
-    std::string LD_S9_(uint64 instruction);
-    std::string LD_U12_(uint64 instruction);
-    std::string LDC1_GP_(uint64 instruction);
-    std::string LDC1_S9_(uint64 instruction);
-    std::string LDC1_U12_(uint64 instruction);
-    std::string LDC1X(uint64 instruction);
-    std::string LDC1XS(uint64 instruction);
-    std::string LDC2(uint64 instruction);
-    std::string LDM(uint64 instruction);
-    std::string LDPC_48_(uint64 instruction);
-    std::string LDX(uint64 instruction);
-    std::string LDXS(uint64 instruction);
-    std::string LH_16_(uint64 instruction);
-    std::string LH_GP_(uint64 instruction);
-    std::string LH_S9_(uint64 instruction);
-    std::string LH_U12_(uint64 instruction);
-    std::string LHE(uint64 instruction);
-    std::string LHU_16_(uint64 instruction);
-    std::string LHU_GP_(uint64 instruction);
-    std::string LHU_S9_(uint64 instruction);
-    std::string LHU_U12_(uint64 instruction);
-    std::string LHUE(uint64 instruction);
-    std::string LHUX(uint64 instruction);
-    std::string LHUXS(uint64 instruction);
-    std::string LHX(uint64 instruction);
-    std::string LHXS(uint64 instruction);
-    std::string LI_16_(uint64 instruction);
-    std::string LI_48_(uint64 instruction);
-    std::string LL(uint64 instruction);
-    std::string LLD(uint64 instruction);
-    std::string LLDP(uint64 instruction);
-    std::string LLE(uint64 instruction);
-    std::string LLWP(uint64 instruction);
-    std::string LLWPE(uint64 instruction);
-    std::string LSA(uint64 instruction);
-    std::string LUI(uint64 instruction);
-    std::string LW_16_(uint64 instruction);
-    std::string LW_4X4_(uint64 instruction);
-    std::string LWC1_GP_(uint64 instruction);
-    std::string LWC1_S9_(uint64 instruction);
-    std::string LWC1_U12_(uint64 instruction);
-    std::string LWC1X(uint64 instruction);
-    std::string LWC1XS(uint64 instruction);
-    std::string LWC2(uint64 instruction);
-    std::string LWE(uint64 instruction);
-    std::string LW_GP_(uint64 instruction);
-    std::string LW_GP16_(uint64 instruction);
-    std::string LWM(uint64 instruction);
-    std::string LWPC_48_(uint64 instruction);
-    std::string LW_S9_(uint64 instruction);
-    std::string LW_SP_(uint64 instruction);
-    std::string LW_U12_(uint64 instruction);
-    std::string LWU_GP_(uint64 instruction);
-    std::string LWU_S9_(uint64 instruction);
-    std::string LWU_U12_(uint64 instruction);
-    std::string LWUX(uint64 instruction);
-    std::string LWUXS(uint64 instruction);
-    std::string LWX(uint64 instruction);
-    std::string LWXS_16_(uint64 instruction);
-    std::string LWXS_32_(uint64 instruction);
-    std::string MADD_DSP_(uint64 instruction);
-    std::string MADDF_D(uint64 instruction);
-    std::string MADDF_S(uint64 instruction);
-    std::string MADDU_DSP_(uint64 instruction);
-    std::string MAQ_S_W_PHL(uint64 instruction);
-    std::string MAQ_S_W_PHR(uint64 instruction);
-    std::string MAQ_SA_W_PHL(uint64 instruction);
-    std::string MAQ_SA_W_PHR(uint64 instruction);
-    std::string MAX_D(uint64 instruction);
-    std::string MAX_S(uint64 instruction);
-    std::string MAXA_D(uint64 instruction);
-    std::string MAXA_S(uint64 instruction);
-    std::string MFC0(uint64 instruction);
-    std::string MFC1(uint64 instruction);
-    std::string MFC2(uint64 instruction);
-    std::string MFGC0(uint64 instruction);
-    std::string MFHC0(uint64 instruction);
-    std::string MFHC1(uint64 instruction);
-    std::string MFHC2(uint64 instruction);
-    std::string MFHGC0(uint64 instruction);
-    std::string MFHI_DSP_(uint64 instruction);
-    std::string MFHTR(uint64 instruction);
-    std::string MFLO_DSP_(uint64 instruction);
-    std::string MFTR(uint64 instruction);
-    std::string MIN_D(uint64 instruction);
-    std::string MIN_S(uint64 instruction);
-    std::string MINA_D(uint64 instruction);
-    std::string MINA_S(uint64 instruction);
-    std::string MOD(uint64 instruction);
-    std::string MODSUB(uint64 instruction);
-    std::string MODU(uint64 instruction);
-    std::string MOV_D(uint64 instruction);
-    std::string MOV_S(uint64 instruction);
-    std::string MOVE_BALC(uint64 instruction);
-    std::string MOVEP(uint64 instruction);
-    std::string MOVEP_REV_(uint64 instruction);
-    std::string MOVE(uint64 instruction);
-    std::string MOVN(uint64 instruction);
-    std::string MOVZ(uint64 instruction);
-    std::string MSUB_DSP_(uint64 instruction);
-    std::string MSUBF_D(uint64 instruction);
-    std::string MSUBF_S(uint64 instruction);
-    std::string MSUBU_DSP_(uint64 instruction);
-    std::string MTC0(uint64 instruction);
-    std::string MTC1(uint64 instruction);
-    std::string MTC2(uint64 instruction);
-    std::string MTGC0(uint64 instruction);
-    std::string MTHC0(uint64 instruction);
-    std::string MTHC1(uint64 instruction);
-    std::string MTHC2(uint64 instruction);
-    std::string MTHGC0(uint64 instruction);
-    std::string MTHI_DSP_(uint64 instruction);
-    std::string MTHLIP(uint64 instruction);
-    std::string MTHTR(uint64 instruction);
-    std::string MTLO_DSP_(uint64 instruction);
-    std::string MTTR(uint64 instruction);
-    std::string MUH(uint64 instruction);
-    std::string MUHU(uint64 instruction);
-    std::string MUL_32_(uint64 instruction);
-    std::string MUL_4X4_(uint64 instruction);
-    std::string MUL_D(uint64 instruction);
-    std::string MUL_PH(uint64 instruction);
-    std::string MUL_S(uint64 instruction);
-    std::string MUL_S_PH(uint64 instruction);
-    std::string MULEQ_S_W_PHL(uint64 instruction);
-    std::string MULEQ_S_W_PHR(uint64 instruction);
-    std::string MULEU_S_PH_QBL(uint64 instruction);
-    std::string MULEU_S_PH_QBR(uint64 instruction);
-    std::string MULQ_RS_PH(uint64 instruction);
-    std::string MULQ_RS_W(uint64 instruction);
-    std::string MULQ_S_PH(uint64 instruction);
-    std::string MULQ_S_W(uint64 instruction);
-    std::string MULSA_W_PH(uint64 instruction);
-    std::string MULSAQ_S_W_PH(uint64 instruction);
-    std::string MULT_DSP_(uint64 instruction);
-    std::string MULTU_DSP_(uint64 instruction);
-    std::string MULU(uint64 instruction);
-    std::string NEG_D(uint64 instruction);
-    std::string NEG_S(uint64 instruction);
-    std::string NOP_16_(uint64 instruction);
-    std::string NOP_32_(uint64 instruction);
-    std::string NOR(uint64 instruction);
-    std::string NOT_16_(uint64 instruction);
-    std::string OR_16_(uint64 instruction);
-    std::string OR_32_(uint64 instruction);
-    std::string ORI(uint64 instruction);
-    std::string PACKRL_PH(uint64 instruction);
-    std::string PAUSE(uint64 instruction);
-    std::string PICK_PH(uint64 instruction);
-    std::string PICK_QB(uint64 instruction);
-    std::string PRECEQ_W_PHL(uint64 instruction);
-    std::string PRECEQ_W_PHR(uint64 instruction);
-    std::string PRECEQU_PH_QBL(uint64 instruction);
-    std::string PRECEQU_PH_QBLA(uint64 instruction);
-    std::string PRECEQU_PH_QBR(uint64 instruction);
-    std::string PRECEQU_PH_QBRA(uint64 instruction);
-    std::string PRECEU_PH_QBL(uint64 instruction);
-    std::string PRECEU_PH_QBLA(uint64 instruction);
-    std::string PRECEU_PH_QBR(uint64 instruction);
-    std::string PRECEU_PH_QBRA(uint64 instruction);
-    std::string PRECR_QB_PH(uint64 instruction);
-    std::string PRECR_SRA_PH_W(uint64 instruction);
-    std::string PRECR_SRA_R_PH_W(uint64 instruction);
-    std::string PRECRQ_PH_W(uint64 instruction);
-    std::string PRECRQ_QB_PH(uint64 instruction);
-    std::string PRECRQ_RS_PH_W(uint64 instruction);
-    std::string PRECRQU_S_QB_PH(uint64 instruction);
-    std::string PREF_S9_(uint64 instruction);
-    std::string PREF_U12_(uint64 instruction);
-    std::string PREFE(uint64 instruction);
-    std::string PREPEND(uint64 instruction);
-    std::string RADDU_W_QB(uint64 instruction);
-    std::string RDDSP(uint64 instruction);
-    std::string RDHWR(uint64 instruction);
-    std::string RDPGPR(uint64 instruction);
-    std::string RECIP_D(uint64 instruction);
-    std::string RECIP_S(uint64 instruction);
-    std::string REPL_PH(uint64 instruction);
-    std::string REPL_QB(uint64 instruction);
-    std::string REPLV_PH(uint64 instruction);
-    std::string REPLV_QB(uint64 instruction);
-    std::string RESTORE_32_(uint64 instruction);
-    std::string RESTORE_JRC_16_(uint64 instruction);
-    std::string RESTORE_JRC_32_(uint64 instruction);
-    std::string RESTOREF(uint64 instruction);
-    std::string RINT_D(uint64 instruction);
-    std::string RINT_S(uint64 instruction);
-    std::string ROTR(uint64 instruction);
-    std::string ROTRV(uint64 instruction);
-    std::string ROTX(uint64 instruction);
-    std::string ROUND_L_D(uint64 instruction);
-    std::string ROUND_L_S(uint64 instruction);
-    std::string ROUND_W_D(uint64 instruction);
-    std::string ROUND_W_S(uint64 instruction);
-    std::string RSQRT_D(uint64 instruction);
-    std::string RSQRT_S(uint64 instruction);
-    std::string SAVE_16_(uint64 instruction);
-    std::string SAVE_32_(uint64 instruction);
-    std::string SAVEF(uint64 instruction);
-    std::string SB_16_(uint64 instruction);
-    std::string SB_GP_(uint64 instruction);
-    std::string SB_S9_(uint64 instruction);
-    std::string SB_U12_(uint64 instruction);
-    std::string SBE(uint64 instruction);
-    std::string SBX(uint64 instruction);
-    std::string SC(uint64 instruction);
-    std::string SCD(uint64 instruction);
-    std::string SCDP(uint64 instruction);
-    std::string SCE(uint64 instruction);
-    std::string SCWP(uint64 instruction);
-    std::string SCWPE(uint64 instruction);
-    std::string SD_GP_(uint64 instruction);
-    std::string SD_S9_(uint64 instruction);
-    std::string SD_U12_(uint64 instruction);
-    std::string SDBBP_16_(uint64 instruction);
-    std::string SDBBP_32_(uint64 instruction);
-    std::string SDC1_GP_(uint64 instruction);
-    std::string SDC1_S9_(uint64 instruction);
-    std::string SDC1_U12_(uint64 instruction);
-    std::string SDC1X(uint64 instruction);
-    std::string SDC1XS(uint64 instruction);
-    std::string SDC2(uint64 instruction);
-    std::string SDM(uint64 instruction);
-    std::string SDPC_48_(uint64 instruction);
-    std::string SDX(uint64 instruction);
-    std::string SDXS(uint64 instruction);
-    std::string SEB(uint64 instruction);
-    std::string SEH(uint64 instruction);
-    std::string SEL_D(uint64 instruction);
-    std::string SEL_S(uint64 instruction);
-    std::string SELEQZ_D(uint64 instruction);
-    std::string SELEQZ_S(uint64 instruction);
-    std::string SELNEZ_D(uint64 instruction);
-    std::string SELNEZ_S(uint64 instruction);
-    std::string SEQI(uint64 instruction);
-    std::string SH_16_(uint64 instruction);
-    std::string SH_GP_(uint64 instruction);
-    std::string SH_S9_(uint64 instruction);
-    std::string SH_U12_(uint64 instruction);
-    std::string SHE(uint64 instruction);
-    std::string SHILO(uint64 instruction);
-    std::string SHILOV(uint64 instruction);
-    std::string SHLL_PH(uint64 instruction);
-    std::string SHLL_QB(uint64 instruction);
-    std::string SHLL_S_PH(uint64 instruction);
-    std::string SHLL_S_W(uint64 instruction);
-    std::string SHLLV_PH(uint64 instruction);
-    std::string SHLLV_QB(uint64 instruction);
-    std::string SHLLV_S_PH(uint64 instruction);
-    std::string SHLLV_S_W(uint64 instruction);
-    std::string SHRA_PH(uint64 instruction);
-    std::string SHRA_QB(uint64 instruction);
-    std::string SHRA_R_PH(uint64 instruction);
-    std::string SHRA_R_QB(uint64 instruction);
-    std::string SHRA_R_W(uint64 instruction);
-    std::string SHRAV_PH(uint64 instruction);
-    std::string SHRAV_QB(uint64 instruction);
-    std::string SHRAV_R_PH(uint64 instruction);
-    std::string SHRAV_R_QB(uint64 instruction);
-    std::string SHRAV_R_W(uint64 instruction);
-    std::string SHRL_PH(uint64 instruction);
-    std::string SHRL_QB(uint64 instruction);
-    std::string SHRLV_PH(uint64 instruction);
-    std::string SHRLV_QB(uint64 instruction);
-    std::string SHX(uint64 instruction);
-    std::string SHXS(uint64 instruction);
-    std::string SIGRIE(uint64 instruction);
-    std::string SLL_16_(uint64 instruction);
-    std::string SLL_32_(uint64 instruction);
-    std::string SLLV(uint64 instruction);
-    std::string SLT(uint64 instruction);
-    std::string SLTI(uint64 instruction);
-    std::string SLTIU(uint64 instruction);
-    std::string SLTU(uint64 instruction);
-    std::string SOV(uint64 instruction);
-    std::string SPECIAL2(uint64 instruction);
-    std::string SQRT_D(uint64 instruction);
-    std::string SQRT_S(uint64 instruction);
-    std::string SRA(uint64 instruction);
-    std::string SRAV(uint64 instruction);
-    std::string SRL_16_(uint64 instruction);
-    std::string SRL_32_(uint64 instruction);
-    std::string SRLV(uint64 instruction);
-    std::string SUB(uint64 instruction);
-    std::string SUB_D(uint64 instruction);
-    std::string SUB_S(uint64 instruction);
-    std::string SUBQ_PH(uint64 instruction);
-    std::string SUBQ_S_PH(uint64 instruction);
-    std::string SUBQ_S_W(uint64 instruction);
-    std::string SUBQH_PH(uint64 instruction);
-    std::string SUBQH_R_PH(uint64 instruction);
-    std::string SUBQH_R_W(uint64 instruction);
-    std::string SUBQH_W(uint64 instruction);
-    std::string SUBU_16_(uint64 instruction);
-    std::string SUBU_32_(uint64 instruction);
-    std::string SUBU_PH(uint64 instruction);
-    std::string SUBU_QB(uint64 instruction);
-    std::string SUBU_S_PH(uint64 instruction);
-    std::string SUBU_S_QB(uint64 instruction);
-    std::string SUBUH_QB(uint64 instruction);
-    std::string SUBUH_R_QB(uint64 instruction);
-    std::string SW_16_(uint64 instruction);
-    std::string SW_4X4_(uint64 instruction);
-    std::string SW_GP16_(uint64 instruction);
-    std::string SW_GP_(uint64 instruction);
-    std::string SW_S9_(uint64 instruction);
-    std::string SW_SP_(uint64 instruction);
-    std::string SW_U12_(uint64 instruction);
-    std::string SWC1_GP_(uint64 instruction);
-    std::string SWC1_S9_(uint64 instruction);
-    std::string SWC1_U12_(uint64 instruction);
-    std::string SWC1X(uint64 instruction);
-    std::string SWC1XS(uint64 instruction);
-    std::string SWC2(uint64 instruction);
-    std::string SWE(uint64 instruction);
-    std::string SWM(uint64 instruction);
-    std::string SWPC_48_(uint64 instruction);
-    std::string SWX(uint64 instruction);
-    std::string SWXS(uint64 instruction);
-    std::string SYNC(uint64 instruction);
-    std::string SYNCI(uint64 instruction);
-    std::string SYNCIE(uint64 instruction);
-    std::string SYSCALL_16_(uint64 instruction);
-    std::string SYSCALL_32_(uint64 instruction);
-    std::string TEQ(uint64 instruction);
-    std::string TLBGINV(uint64 instruction);
-    std::string TLBGINVF(uint64 instruction);
-    std::string TLBGP(uint64 instruction);
-    std::string TLBGR(uint64 instruction);
-    std::string TLBGWI(uint64 instruction);
-    std::string TLBGWR(uint64 instruction);
-    std::string TLBINV(uint64 instruction);
-    std::string TLBINVF(uint64 instruction);
-    std::string TLBP(uint64 instruction);
-    std::string TLBR(uint64 instruction);
-    std::string TLBWI(uint64 instruction);
-    std::string TLBWR(uint64 instruction);
-    std::string TNE(uint64 instruction);
-    std::string TRUNC_L_D(uint64 instruction);
-    std::string TRUNC_L_S(uint64 instruction);
-    std::string TRUNC_W_D(uint64 instruction);
-    std::string TRUNC_W_S(uint64 instruction);
-    std::string UALDM(uint64 instruction);
-    std::string UALH(uint64 instruction);
-    std::string UALWM(uint64 instruction);
-    std::string UASDM(uint64 instruction);
-    std::string UASH(uint64 instruction);
-    std::string UASWM(uint64 instruction);
-    std::string UDI(uint64 instruction);
-    std::string WAIT(uint64 instruction);
-    std::string WRDSP(uint64 instruction);
-    std::string WRPGPR(uint64 instruction);
-    std::string XOR_16_(uint64 instruction);
-    std::string XOR_32_(uint64 instruction);
-    std::string XORI(uint64 instruction);
-    std::string YIELD(uint64 instruction);
-
     static Pool P_SYSCALL[2];
     static Pool P_RI[4];
     static Pool P_ADDIU[2];
-- 
2.25.1


