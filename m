Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3232A5ACFBA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:15:21 +0200 (CEST)
Received: from localhost ([::1]:41624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV98R-0007NH-Qf
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8uR-0005Ar-TV
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:00:52 -0400
Received: from mail-db3eur04on070b.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::70b]:6978
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8uP-0002FZ-Vv
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:00:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfdbBdPzbt3vvau/FA5x7r85P4CfPPJbSYA680tO/KGh1PXOkBP99zsysqsTBCsGEGwox+7OrU9C/YCVdZMjQpK1ikIEHZ0Rq7ym9BIJWtL9JDQ66o60UpSWQkOnhc3Uu+mqNx9j1JtLrjxqZX2OYIO/cXx9+Ra0+pKjAPxzmk7pcfQ2NTSSHanEZnxbLbhHPlMiKntu9BdKirtsaf1OhfVJVPcGB2Pbyx8R4VDTAvSc6sH7zj4R33UkBijmPyWniOtSNTSRKhJZxL6L4OfTbgV7dImXoZaBF6ktJ4a2kpPwkgyRoxcE8H79YFSCWXZzjXMXDkBBZXeQ+jsXCEGYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luwSWsFxVuzyWasBHzXAtnejt6K9D/jrbtK7PNlwhM4=;
 b=m4vBL/OjOirtdtftBffJKEFP5n11T8xkzex0zCiV3+RLFac4zYyzE5lygSOUTbAF10zNPnIzqVyW9k2/kgQDtsUjYbz0cMkwJrzATfXVGR3OYl722ouwMuQf3EsbPdJ8dsy9uFrMrmEWtP0mYsl7zD4FGifm+7x7ldgIfQzE1U1rtxGXFYnwacD+q2NPnWh6gSlZa1Q/eqZbhMPchUj8ojyCFeMQaEaGclXbaGlcHGDs+gwmCtoWNpcQmu1QvpXQ9g3P47bYI5UMzHKx8KltKg/hNUHCyKh8FjjrYVnZ6aJPruD9ZoIPTbfY+WbHSm56JMdK04TCtzSBHp1NmRo6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luwSWsFxVuzyWasBHzXAtnejt6K9D/jrbtK7PNlwhM4=;
 b=X/trl9dq/qgSodoYIJDumy2vaE9UnsnXSiMrV8+irS1WDGrrL1qeMF2R/iLcRG+2b4xCn/Gye6wpb6HKF6xXduuw6HQ4vS/CqQ8b/9SpMh3meBKTOCsD3G7cFpRMXvEojLu5Fa7Jgt+E3/S+ccoS1aCpZUzZtpUFRrN5J90LLYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PR3PR03MB6444.eurprd03.prod.outlook.com (2603:10a6:102:7f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 09:55:41 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:55:41 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
Subject: [PATCH v2 0/20] Convert nanoMIPS disassembler from C++ to C
Date: Mon,  5 Sep 2022 11:55:02 +0200
Message-Id: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84daaf76-4b8d-4da8-5a2c-08da8f24cb09
X-MS-TrafficTypeDiagnostic: PR3PR03MB6444:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JeoqYN1pcHmSQjineEjKOlHkoTPbrn5h//hTDKuGkNFzUj+n7MuYaFa/zG2qAu1VREmWUAEf1i/rYyNZ2t4Bg4RmA3EjdyGIATaiZat993mS61pPVsqIgfvBGeXtQ68zwAT5c6ZR16iB3DTp095TVaudO/yNuM5RCCOjZD+76he0lFy+z5HEO8Yshohfdlarauo7Mz6vndUjnisb/wAIK3StohbjvlAQ4/eVEUItT93kHz8879IXnAEUd/gOxcdrOtz821SflYAPIltThnYFPMSgeOad4yaL7tcvuz1M81eLNpdWnv+P5XoNiCWWhwUp+xtc1N2Gh9JI9mAcHgm4WcB/hUslOG8KHhyM8eqKIseTj612Vwlc36Jj1tKqKdOK4Y5t2lafLiE1sBs1j4ThNO8bZFIVxtiMFjh/Ssd1aYs94cumnFH9f1jOVItOuvP3gdBZDgwMxaYMaiYgUPTCEhFpBs/tkk794Hudr3t8TYDpWqSm4i8HnEez2f/uoBm3EBg6bhZcX1yI6cllVF3StLvJr0+ZBypdvWrhuHGUS3gUCiqkr4JfSVs/BGUkwQoru+vGQUhRSXrrjfDLzD9NWcopvRzT+f+sNgjbGl2g0baJ6Ai6n4vZe0k4z7lVh2WGrQj2SoDQZ1XN4nkqM12n6tqEbfQWi5wgPFGit+RqQ6s1+9QvOsET42PBQJAt33U9k4dhjIbPuB95dZ4UsNbHe3+roFKYN9p+gdPTAcdbF46EKVoSEi4YkrlzUsmynJYk75CB9S0rVtcrk8ECTfRKNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39830400003)(376002)(136003)(366004)(346002)(396003)(6512007)(6506007)(26005)(52116002)(86362001)(6486002)(478600001)(107886003)(6666004)(41300700001)(2616005)(38100700002)(38350700002)(83380400001)(1076003)(186003)(316002)(2906002)(4326008)(8676002)(66946007)(66556008)(6916009)(66476007)(36756003)(44832011)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H5g1VLUP9nqzFyHEPruN5IvMPUbRhr2THSIDlowkXFleJ0I91R43ahorh2SX?=
 =?us-ascii?Q?BbxgkrQPPAvsaEac9U488NzlU60pY+bmb15fcEecnyvaag9B8V8dZOlBJmFh?=
 =?us-ascii?Q?7xf0h1W0wPSUGddAht5N/oxwOKkoUaI7MBJ6taHU9nsEHoQK3uUBPixRZcRs?=
 =?us-ascii?Q?3jNVLmOsa454X6/Wr2I2eBBmbe1JfyhTTh7U2TLLbYC6JzAoBOucrC62yN+K?=
 =?us-ascii?Q?Lp6AG0+7h/rgdlcoLFOeyrVZx/0tQ6DJGvY+Wps8mdOua97yKjqyJi+L6PIU?=
 =?us-ascii?Q?Z0Q5KBZykMAP17A0WGyKjBlbHROGmCVOK/KWyugO34XrpypUcB7bb/SihlEt?=
 =?us-ascii?Q?EvejL+2OOa19PYUovxmjzxL8X3aYQLCsY5ud4rREpYWBj2gkO9wAvPyp+mKF?=
 =?us-ascii?Q?KTDZtkv1d2fuvrpvX+Kszq/XzL0ult0iRqIjku7oCg63IO2vIm51HqYVNiN6?=
 =?us-ascii?Q?dXRLkbv1/t1cnehHrusDqvY6YCXHqcVUS7lLyyGZ6HTneGUuBQZ/GKsV1AJO?=
 =?us-ascii?Q?iLBYMoa0o7s6Nuh+cCiKMiSgr29wsH2vgXNmwtP8nvSNFOdboyJtlvLpUSgy?=
 =?us-ascii?Q?d0+AozXjVkpED7VCATl+rWjaG6wlEzRrxGSM2oYYL7uKFneT9qk/TgB2+aFp?=
 =?us-ascii?Q?IJEYM8X1n8c7UHYi2yFULL0y8BF/igMGxbRz4bfeL07uPu8JKpJ2sOepfJ0o?=
 =?us-ascii?Q?0tUs0Cg63G0YzjIrFE4alOaD4xpRswc/wunBpyxz/kFm/GjFn0/TIaTxW2VF?=
 =?us-ascii?Q?Eknnlq6bwxdSOGynCuOrqjK7pftC51CEbvNH9PvYsEwErNzF8Zbm7BcWibHH?=
 =?us-ascii?Q?zbkW0b1vVb6XYz/rVZ/GqXSaeT4AnJzZ/JR09wJrS76NfzuPwotL3M+PTyK4?=
 =?us-ascii?Q?72jM++Wq0nQRe4UwG/FtbJfNmFgNeYG5A/AQwrHwFyb6//eB/3oWKjyyMPwo?=
 =?us-ascii?Q?Pfx7jLrvtrONfAqH8DYLGgeFLE1EEEf6LlD6HViDc0nORo6z5l8CNSSbuZKL?=
 =?us-ascii?Q?nNlXd3iCEGXUXTgZVgrXcBf5mZPj3BBGzoJae0KwGfiy5VmYsy/ZajN0Y1Os?=
 =?us-ascii?Q?qT4kPQE1zRNzGPE77DF9mOMbmVB/55yLIKMV6j4D1KmARBavETnGmFmFTryY?=
 =?us-ascii?Q?P7deHc1sPeQ7Dx3TRt9f79b5zHq5rwjC0LM0l65NUp49hhYGIyPjXc0/q+g6?=
 =?us-ascii?Q?9r6fK4ZfJkhwnMEHi/JborN8dmxAMi61sFPzlqAmk+egzvh/xprVdwSKHmTo?=
 =?us-ascii?Q?AodxXq2beU5OnhqJ/M22ZyEdEvOITb3RdnvHJaw3I07ckJcvN2IxRV6OqqD4?=
 =?us-ascii?Q?DMCsCvaNdaLbySuXgEd2WzI6PW1cReOy89xKgE3/RJ/jXIyDZ8/CXPjAlAwX?=
 =?us-ascii?Q?rlOviFth7n2lqDJKQj/X5S8jdnj5YiY/xkguzsOTLXdfeAIvpWFNLlCDZyKc?=
 =?us-ascii?Q?6Mnx41AqqC5H+1C4ZJ17DMIWBP1eiGiOPHAb62+OynNsyiKOB6xej9bX8I+T?=
 =?us-ascii?Q?QyjAeRhPs1ijQlbGilX6fBQFegp4gS30Pa1I1vofFwah7cWRCYO7z6z10yX1?=
 =?us-ascii?Q?QUZxlfAOPJVFrn1406Wts7VcqvM38yanXIvS+/35KxSa6Ao9zkaUih8gJdPC?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84daaf76-4b8d-4da8-5a2c-08da8f24cb09
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:55:41.7297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRvYOySUF+LmLKf2RQPJsO2IdM+yuBUhlOL/X6sb4tpX8uahgJ4px/TbX+DFbpRUQT1plrAEDnLbRd2nDb0xbBxAIaLkZgBGni9Y2eVpKa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6444
Received-SPF: pass client-ip=2a01:111:f400:fe0c::70b;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

===============================
Changes since previous version:
    (1) disas/nanomips: Remove namespace img
      Removed comments that refer to the deleted function.
    (3) disas/nanomips: Delete NMD class fields
      Class fields were introduced as global variables in the previous version.
      Since it wasn't a thread-safe solution, in this version, one class field
      (m_requested_instruction_categories) has been replaced with the only value 
      it can have, while the other class field has been added as a parameter 
      where needed.
    (4) disas/nanomips: Remove helper methods from class
      Squashed patch #19 here.
    (5) disas/nanomips: Remove __cond methods from class
      Addressed the coding style issues.
    (6) disas/nanomips: Remove disasm methods from class
      Addressed the coding style issues.
    (12) disas/nanomips: Replace std::string type
      Changed the return types to char * when a function returns allocated memory.
      Switched to using some glib functions for memory allocation like g_malloc,
      g_strdup_vprintf, and g_strdup_printf instead of strdup.
    (13) disas/nanomips: Prevent memory leaking
      Used the g_autofree attribute for dynamically allocated strings, instead of
      calling free(). Now, this patch is much smaller than in the previous version.
    (14) disas/nanomips: Introduce Dis_info struct
      Same as in (3). Instead of using global variables, all the necessary information
      are packed into the struct and added as an argument wherever needed.

Regards, 
Milica

Milica Lazarevic (20):
      disas/nanomips: Remove namespace img
      disas/nanomips: Extract enums out of the NMD class
      disas/nanomips: Delete NMD class fields
      disas/nanomips: Remove helper methods from class
      disas/nanomips: Remove __cond methods from class
      disas/nanomips: Remove disasm methods from class
      disas/nanomips: Remove Pool tables from the class
      disas/nanomips: Remove NMD class
      disas/nanomips: Move typedefs etc to nanomips.cpp
      disas/nanomips: Delete nanomips.h
      disas/nanomips: Remove #inlcude <sstream>
      disas/nanomips: Replace std::string type
      disas/nanomips: Prevent memory leaking
      disas/nanomips: Remove function overloading
      disas/nanomips: Introduce Dis_info struct
      disas/nanomips: Replace exception handling
      disas/nanomips: Replace Cpp enums for C enums
      disas/nanomips: Remove argument passing by ref
      disas/nanomips: Add struct keyword
      disas/nanomips: Rename nanomips.cpp to nanomips.c

 disas/meson.build                  |    2 +-
 disas/{nanomips.cpp => nanomips.c} | 7155 ++++++++++++++++++------------------
 disas/nanomips.h                   | 1072 ------
 3 files changed, 3557 insertions(+), 4672 deletions(-)



