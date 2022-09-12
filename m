Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1855B5ACA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:02:21 +0200 (CEST)
Received: from localhost ([::1]:59962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXj4u-0006GM-OT
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXibe-0007OO-Ei
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:32:10 -0400
Received: from mail-am5eur02on0709.outbound.protection.outlook.com
 ([2a01:111:f400:fe07::709]:48360
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXibc-0006Tp-3x
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:32:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c49c01OHjQ+MwgnlMuuGRjruItin71kASQDM18g4ViAnCWYg/YW4HomnX9HP4xEQUL6b+FWXtFXc62eiYr2GrFkCEe/6yxBaFZCweydiPwmECfNhQzfoyrN2I2rvnoqP99zoYZ5Fv7sY/8F/Y+JrudzKWJfMGDc2CAW931GxJNNWtBZeZC9gadruypklX+WAqmXx+4A86sXq67g6stjcHZbgvVJj4jqhr8ESHxGE1PhaoKYNuTiLqTpr63EK6bN3B5hc+n5Bf2m/KBQMfHx7Gwo2BNr0GtUYMUt5/o0zA5fx9vr9Vofij5LiCvlmhFXYpdg+G8/67VAmy9O/IZ61UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HWFKqb+0z9dumqzyeMQ7w5t3Yn3DslLKMnlfr1bCHg=;
 b=gYsRSbX8Dd2q7jU6UmF4p9GalSUmVCOH34DktkC2i91CHvBDWZSpAN+Yntt+s3K+I6VAIJRdppgmSXgLSssJDsnZ+8rsfIUSnLuo3sGJK+hdMCf2reAGPO8K/zF9J+Gc9qJUfFoHggXV8omCXXBOc0dhbMRA7JJ9O5Ml4T5xO1+1wfv8MhDXpRwDRPtIJi1M15M2IOf5VNghcYXFqb7SzUNARsyknPsu2L90jPxRV+1bWBOV0NjKmNVUEXLXU6OKjSEL2s4CDY7cUt6TACJB5WiBJjZVCesBKVe8LvyY0NH/GqLt//yvg2PGlwsw2u+6fCcOxtjQaHNGkPN0Rj76fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HWFKqb+0z9dumqzyeMQ7w5t3Yn3DslLKMnlfr1bCHg=;
 b=autRCL7qGVIeSa+OyZezoXzy4ASU0X+//WbdkSJ/H8wawtKIO/t5eA/7ojDorfd2FXQ35OgPzCaJ7CkwSlspinFQ8yTzPrf5sz5yMTjGFPZa1KPA8MBnupKqW3Ai7V+n3Ax7ZAxRdp6OvV02gQk/e42YXNsPOiAg9/korm1ViUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:26:59 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:26:58 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
Subject: [PATCH v3 0/24] Convert nanoMIPS disassembler from C++ to C
Date: Mon, 12 Sep 2022 14:26:11 +0200
Message-Id: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS8PR03MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1c845f-3c7c-4e08-4c55-08da94ba1606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N+EJgtoFgqURqnXBOqG35PX8bAhgIYV1/P9jddJUvtgjKFO/TxyBH4CDnLP/GAeZ8z7L0YfPvu/DVxhXJMhp9uB1vGrlLjWF9IyYLGhuomiJdA2dmb1HzFhqwGyEFiqKWvusKwaYyO5W11Dg3yjOz+x4qIAKzSIbl3NiouHCt1Jzl6yh7sxk47POv5ZAtKxTxsra/L/c7RIhiPHwiDnjkZDwZQISi6FMH4m9r021PnxpX3fDxMD55N31UymYBVQDE02o18li4hhxRfmud9wvqVva5BKG5C9Z83nwexGpTiO6sGyHNkzFoCCurPXtSK8hVbywtshPFszY/bxXsL4OlVwOEfGrnb7NFQoMlPbfUKkn/9Rfnl2gu3BpaMGOSMPWvPBt0Qsf35WzuLg0vlDFzcrrvUERgxD9ZpIi/Zj2EbSHmCu5z3wa9A168Q8FFAfIDyu7kpDon3LlQUM/Rv04oiSRRKTmDOg9zzPGT0eKoG0gB9Rn2eBSjXbdSp5DYBRHE6GpJt0kpmiFL2D6Ic07ZPSXXa+dcAracdkh8rf8OgzLHQqq+Z9OXn1/8Hox0TqGVt8q8/3YEIt63XAtTp4SVlUJB+zoUGWQMzatE1R+JvzQMUHVpgLbCghqkyxgbYX6qfVChXDLOC5kQ//jUR8KkJLOuaTnyBE6IQEX8Tr4QTaG6UZ4WVfjPlGOgu06XXpJWVjnCUrSF/cbMXPTdnr5BpuSnkk/v/DpdPr/Ug6jS5laAlb+hgYaudkcYl7GvSjD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(396003)(376002)(136003)(39840400004)(2616005)(6666004)(36756003)(6486002)(316002)(6506007)(6916009)(8936002)(107886003)(83380400001)(52116002)(478600001)(41300700001)(186003)(1076003)(2906002)(38350700002)(38100700002)(26005)(6512007)(44832011)(66556008)(8676002)(66946007)(4326008)(5660300002)(86362001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WA6JlKnNEBJsNRNTUlqliluRVl32fLs81HiO7QU1O+ZF9XwQ9zNRibIEXRaU?=
 =?us-ascii?Q?LKBS0nqjRm6lo8Jeg3wFRr4ng5P6YfqaSf2S/ekyczEC1ZwwA14qnt8MwD2y?=
 =?us-ascii?Q?861mKs2gmCgNErlch6BO3G+ze0/8zAw6JsHhErNKpgW1zyn5B4wDfHOm73VP?=
 =?us-ascii?Q?HvPHt9vfOIGC78lpmnzLnRFO7ZRcYW3YxlIiHg7Ufy/YFMLLMH2Z+Hknzvos?=
 =?us-ascii?Q?JJ5zxq1zxzMfN1ONsuyrTgXZgdA3TVyu3jUSIaX+EUvKzBELUYf+wX554zG2?=
 =?us-ascii?Q?AKKklrYucT58dAck2ypubG+5oYDIKIcS9/ywMYp+F0khJYklfUX+1CcGcOJp?=
 =?us-ascii?Q?FXrRTQtG7IfTFDgCHfXQcHVO/W1UY6OIRuHoF6sT7HCmhEc8skbGq4m36b+J?=
 =?us-ascii?Q?GQHJM8VbZAngVQnph9UDc3RZbMWdNQiZ8xp9lLnc36fYpN5IbD8wD65AWG9/?=
 =?us-ascii?Q?Chj14T3xg0QHiPZKAk+G+RvOU7ajvQhSM/YKkpOOcLp9MEhoMzF9sARF/mGl?=
 =?us-ascii?Q?2XnMg+vY0D0nG4G5m1BXIMn64U4UrHxfYwXmHWQGk6WO/Zu6zdovKAv/+szV?=
 =?us-ascii?Q?rkw/6I0ixd/3Q5Kd8Tm2FdSfhUKbfQ5iBPHVROtarIkZ5Gwx0QSzAzwp82gT?=
 =?us-ascii?Q?qhqBqteTXehXiJ/2UOC7d47CJ2r+sG9ZF2UcsS2BNBL8ilideXx2zuIxj9CL?=
 =?us-ascii?Q?gyOlyihPuft/sxXaU7T9sF6oJvXlXasCDApJtx4pK03EbpurPPFSy3usU/p6?=
 =?us-ascii?Q?F9f7bg4xMYKcO4p75ShkQmA2FQtEuIBThVQJmBC9Z/gi03YWl8M7JRbj5zey?=
 =?us-ascii?Q?ZgTa6RLFSVzs64Ut59mtNUXRH1h2EhLTcbf+LixNm0zHBnYIOs73cY5yplGC?=
 =?us-ascii?Q?hwHGmMm9RNQFSpNH7k85R4nguvNkCKTf5gHSQdzdiqdxs7Z2zpOc5yRgfj/Q?=
 =?us-ascii?Q?+FWJjT1BPu5KUoFLyA3ok+Z3NlY9OkuRPfSp+v+qoDBt/lAvEfBLTldw2yNI?=
 =?us-ascii?Q?0+6y6/dxG5SDn0oFhYJmtGzXhrhn02WbAcYTpgl0M1/N4TYvBNY5w6k2yFn5?=
 =?us-ascii?Q?m7taai46jT78dvnO4H8vDdBd5UUGJnbl+gVC1AQWF9y17svL8SbRjqR23Fhw?=
 =?us-ascii?Q?iK71LvEd3vsftplfy44gD1oSuB31c4/qYpU0Ch1dj4V9gr9xz1SedX3XI4yA?=
 =?us-ascii?Q?ZIzb8IHbT4QBkjsqhTQ7qYHAo1RCDNg/SRd3704nNBvH7+TGqFU+b2z1IUpE?=
 =?us-ascii?Q?usDbGCazOLPdmMRrGHz64aKFmVtZwXezV7SIhPNL5qYxA/G4M5vHLEXYoMoU?=
 =?us-ascii?Q?dthdHk8/L0O75/JmoCO/ag0Lg/EzAXQDaf2HwE28CaqyLmarS0hG4fRyDV0K?=
 =?us-ascii?Q?AeJPvU9fYUbTS6gnHFUMsRnhW+gGJ8B1JpjGq6Ww6ZGyohBKyUSmd+CUknoR?=
 =?us-ascii?Q?rWASi8pCH5r4V12CxvyqufUpizmUahQP8KZyOcCI4zzFs7fcwcQYfsKY1nZd?=
 =?us-ascii?Q?lD3JjX++1cBcUSX+x3rfkz6cHXInZjy8kzVkBUQju6HAfrJet+IxMWGV1iBk?=
 =?us-ascii?Q?MYVKK0KUYJKlVR9O5XIQ7wg38bARjWQm9nw+ZhIVHybXTBIrIO/SbYjS+F+Y?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1c845f-3c7c-4e08-4c55-08da94ba1606
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:26:58.5841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Eqfg0RmdgLiQmakxa+wsj5bfbTavxrBypLAfb87ZV6G4+8PEeP38kFqmjyXm3SpELsS7QkTk13d2UglsSdncdYVfmHt9U0NbzCnBtIleyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8805
Received-SPF: pass client-ip=2a01:111:f400:fe07::709;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Hi,

This patchset converts the nanomips disassembler to plain C. C++ features
like class, std::string type, exception handling, and function overloading
have been removed and replaced with the equivalent C code. 
===========
Changes since previous version:
    (3) disas/nanomips: Delete NMD class field
      The deletion of two NMD class fields is separated into two commits. 
      The only use of the m_requested_instruction_categories field is within
      the if statement. Also, the field always has the same value making the
      if condition false. Therefore field and its use are completely removed.
    (4) disas/nanomips: Delete NMD class second field
      The deletion of two NMD class fields is separated into two commits. The
      Dis_info struct is introduced here. The struct currently has just one 
      field, m_pc.
    (8) disas/nanomips: Remove Pool tables from the class
      Mark all Pool tables as const.
    (13) disas/nanomips: Delete copy functions
      This is a new patch compared to the previous version. There were some 
      functions of the following form:
       T f(T arg){
        return arg;
       }
      These have been deleted, and all calls to f(arg) have been replaced with
      arg.
    (14) disas/nanomips: Delete wrapper functions
      This is a new patch compared to the previous version. Functions that 
      simply wrap the other function have been deleted. Instead, we're directly
      calling the wrapped function.
    (15) disas/nanomips: Replace std::string type
      Changed the implementation of the save_restore_list function by using 
      g_strjoinv instead of strcat. 
      Changed the interface of the Disassemble function. The type of the dis 
      parameter now is a pointer to the char *(char** dis) instead of char * 
      which makes the rest of the disassembler interface easier.
    (16) disas/nanomips: Remove IMMEDIATE functions
      This is a new patch compared to the previous version. Both versions of the 
      IMMEDIATE function have been deleted. Before, we've been practically calling the
      img_format twice on the integer values, which is not necessary anymore. Therefore,
      calls to IMMEDIATE have been deleted, and the second(now the only) call to 
      img_format is slightly changed.
    (17) disas/nanomips: Remove CPR function
      This is a new patch compared to the previous version. Same as in (16); calls to 
      CPR have been deleted, and the second(now the only) call to img_format is slightly
      changed.

Regards, 
Milica

Milica Lazarevic (24):
      disas/nanomips: Remove namespace img
      disas/nanomips: Extract enums out of the NMD class
      disas/nanomips: Delete NMD class field
      disas/nanomips: Delete NMD class second field
      disas/nanomips: Remove helper methods from class
      disas/nanomips: Remove __cond methods from class
      disas/nanomips: Remove disasm methods from class
      disas/nanomips: Remove Pool tables from the class
      disas/nanomips: Remove NMD class
      disas/nanomips: Move typedefs etc to nanomips.cpp
      disas/nanomips: Delete nanomips.h
      disas/nanomips: Remove #inlcude <sstream>
      disas/nanomips: Delete copy functions
      disas/nanomips: Delete wrapper functions
      disas/nanomips: Replace std::string type
      disas/nanomips: Remove IMMEDIATE functions
      disas/nanomips: Remove CPR function
      disas/nanomips: Prevent memory leaking
      disas/nanomips: Remove function overloading
      disas/nanomips: Expand Dis_info struct
      disas/nanomips: Replace exception handling
      disas/nanomips: Replace Cpp enums for C enums
      disas/nanomips: Remove argument passing by ref
      disas/nanomips: Rename nanomips.cpp to nanomips.c

 disas/meson.build                  |    2 +-
 disas/{nanomips.cpp => nanomips.c} | 7392 +++++++++++++++++-------------------
 disas/nanomips.h                   | 1072 ------
 3 files changed, 3510 insertions(+), 4956 deletions(-)



