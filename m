Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB65252D2EF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:49:17 +0200 (CEST)
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfae-0001Gi-RY
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfSp-0007PJ-6J
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:41:11 -0400
Received: from mail-os0jpn01on20730.outbound.protection.outlook.com
 ([2a01:111:f403:700c::730]:5753
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfSm-00065S-4m
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:41:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVOvSTKex9U6dQ4i0UG3pvL9E1HSzhOXkoiZ7qE2ikY082AxWx7e5HyCMe2JGaegbN/pboVb0Tirg9J1p5uR2Tv4TpQN0QZAgfsgPK1Jwf8MKio6mmf7mydTHP+oqreE7krSW3mSOi5nB28galaImXuOD5MJdFIHFAgq7Ux/r8D+Ei5qKm32bN/AfJYfxf8BXRKAhbhKNvz5dMOylAFkCAuwCBnzuSG9Yi3TpA73dP2RBtlDIfhIBrNyXUMdv+7P0e4s6rC6SRdIXGtBL5tTkNzToY9qbYrlj9VF1cCPSDNO9Bym3DGjWrBnKbibAPlSnbjPkXFh8o1gPA1boMEiVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IQE1soOTIizTTC6+UVyyiO5n4GeQIZ7tCp0tozzoWQ=;
 b=n0SUnsoone2GoT8Os3o/ANceonzcJ7TUdbNflJgxoBbYO981ae65nxdqsnkt5jPiy2o60OI+HkLtkIzXT0p8Y9CINn2vXILakXQlSZshiTN7tiLK5bDPYf4wEk+xX+uGp6AzW+NUPAA+yeBHv7FkqYKZasclFb9KWODOX7eVCb+wsIoMJ8bGvYdGfvC2tJP8JIPbKWmSKUxwbLhwLIXC7uFvuYtChpb9/3bzPGzU8pQxZYhseQZJDqlqDcZKeX/T1g8oE0Rsn9Z35lqkerdeMurWsBCmILSRD1XUoNj1a0aFzuVk2rkeJf0K5DLdokoWJIDVRxwTK9gHdhUdBNZMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IQE1soOTIizTTC6+UVyyiO5n4GeQIZ7tCp0tozzoWQ=;
 b=TY4kT3Li2R0155Eg/af8FSGP6nSV0f8fR0sfGcnjc8J5s7ZaeelOxvMXYY7mjqFjjq0wflkPMb4N4intEd7wlYLdGmS9man+p5Pi4A3XKKJn1oBPDZ8A5gcLgad0QSDTNgCubEx/GXeenaP575hjOJ4L8+3JK7ah11KAC3TFzkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:9e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 12:41:03 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7%7]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 12:41:03 +0000
Date: Thu, 19 May 2022 20:40:55 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org
Subject: [PATCH v5 6/6] MAINTAINERS: add myself as CanoKey maintainer
Message-ID: <YoY61xI0IcFT1fOP@Sun>
References: <YoY5k0PQny8WtAHi@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoY5k0PQny8WtAHi@Sun>
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:a03:54::18) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1529b2f6-2cc1-40c0-5324-08da3994d5bc
X-MS-TrafficTypeDiagnostic: TYCP286MB0941:EE_
X-Microsoft-Antispam-PRVS: <TYCP286MB0941F320DF5D10DCC37A0927BCD09@TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rq/0sx01uGGWxjSI4lqFcNYhKgprl3RC1OYjdnKFWWc29N4IX9Vc243aWjO8k8RsxBg8pkTb6eJQNThRrGpfsQ5F0ISgYb1WrZc8oaDIMeEAxjmSIkWsCAPbiOUWsM0PzoxIVXgEWrI9MSRROd2+v3Pp24VTbFDIRi+RMrAznka3dWqEzhzKsPV6XdErsruMH91QgIa2uPg7lH2P+7kU9VKPR/WqrzaSMx7YrYNsTAVE8q3RxrhlxTOZcgaAHJAA4NlKHxj6kkzDSG/MpCjypJ9QF0IEysVlXviyTeb74JFCD6fDuJeX+szSqAliLgliGGwk3gqWtG2bYn3gcxUVM3SMa28HJPl49TPF3MOZPqdE9qVEn87iK3oQc/01oIsSZRytNvEdIOU2Xl0azce24hUEDnYG8pgohcEky73/yMOp4yDPYC52UFuY82ssBP/jtd38Mv4ECmU6kXq8dE5khGQpSsFYBVHaT2WA7koGXHDXY+SrzSDK+zdf6yNO1ecnJSTNomIgopD/Dlz99Bz5em+9cVT4M5HKZWTzl90ISLMQir25n/Nije2ywzWboHwK35mSzegTWbdgIaw8U8yfxVrMPD2ik7X4V8CsezRTO7OD5ulTnMxzeMh5cXFc8KYdRyucN/3NGelXLB8LYrqbiyp4F/JN/DyGC+UzzSrB4Yx1bMi12V5UQpDPHNyyFdFpksF2XkcdX1+Wke0JlDyvDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(136003)(396003)(39830400003)(346002)(376002)(33716001)(2906002)(41300700001)(8676002)(508600001)(38100700002)(110136005)(4326008)(41320700001)(6486002)(316002)(786003)(6666004)(52116002)(9686003)(6512007)(6506007)(5660300002)(66476007)(66946007)(66556008)(8936002)(4744005)(86362001)(186003)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/dFPBMy0VqGgiYaF/vNr3I3tW8bk+YNzwCKDlN+DpAXPRRkizhgTgKi3Hkzp?=
 =?us-ascii?Q?rnK5rWZWz1u4klvcW4bxKiGUvyAYemm0BWmBtr068AUlGbMfI+gDl7Fmoepg?=
 =?us-ascii?Q?/W9G9PKlf1uQWfdx8F6q+LqMWxP86iEuelKybbHtGpFd7CKBTrx9cNFhFOpg?=
 =?us-ascii?Q?JlpUCkwmUBTXnqRRGLdeqvfhT7w7HlWCjdQWMPvkpv4Y0kWm1KSbVMFR3elz?=
 =?us-ascii?Q?KMWLUPvuvpAcfsZLUqTtPQKUs1np38HucZDUaH0gMtxxamT8XBI41D0uu5yu?=
 =?us-ascii?Q?A/vGJG/gRSMs6b3Rxlsr3LZA7L+gyI1A3G0Bmd6U0swi6JuobIEUZ+Kpn++Z?=
 =?us-ascii?Q?af+/y8bflU7sVGmTbMspBwyR5bJMpTUZw/4EQbNDm65HFySaEWyx2lJWrP0p?=
 =?us-ascii?Q?jn9WLLUeiSHfHYnEEro9Y9vILbzyJXHMgkzEEcsKTo7nRVwxcB/60uVjup1R?=
 =?us-ascii?Q?j6yYEMDCidnCfxXN8CinaZ0NMgy8ihhQF1WyToDpr/82RdoaogpG6Y/O1SKu?=
 =?us-ascii?Q?H0wn45JzUvJgNa/+b4Emf5CQT1DyPJF3dWCZLREvav/1sFXvvKLnTsYSClV5?=
 =?us-ascii?Q?U6QcBBqwXs9rIBBrHvS7zgE6lLVuxKUlJ04Ww7GXbTpRaGqQ/GwOJx8748nA?=
 =?us-ascii?Q?m4p1XlOlUc7wVyt8c2+BelMAkHcBh+ZKXrUqgSe5bL0rkm/IwgkT2d0GEnaI?=
 =?us-ascii?Q?7oXMpWj5O6onfFYPWqfMY9fOMtZrrzFP8AZkUIf6UVNWtvrRIYy0c/jCvIev?=
 =?us-ascii?Q?ffwvjuusdvbJyLu3nANaOsEXXmgXTeSyGvgfFVaXZ/y8H3k7OpqQ6tiTWQP/?=
 =?us-ascii?Q?EGZO91qZTH/QlxVvls/A7wQNz7DjCa06kuEh98IA4Fd+YeOwrcXuRUSqNJOa?=
 =?us-ascii?Q?v/2VCk371n/GqC5iA/ZvyYOSAe28yz0P1Jnvyel/d5/gGDqrS/17GQRbj1P+?=
 =?us-ascii?Q?k4G1mrXeTe07h+MH5QsBniyxrRqruprqHVJ2Vx21EYiMxamxnGbyODnofBmW?=
 =?us-ascii?Q?ltpqw4Kpws/Cd/fV2q9qKUE18oRc7hkHlVPL8IMNw2ZmQ07yrVU96mhNA/VQ?=
 =?us-ascii?Q?agHb7zlFy96NqLGIN+VA/tDQMIDwLokFnmwxFUjhU9kBbayu45o0k9tcCJsN?=
 =?us-ascii?Q?G5FZwhzMTX2swvjf/BcEzzs583azjF57I9YU0I6JVeGIAsuYO60IETJ5dMlh?=
 =?us-ascii?Q?pZzctLNXKdFgUMHF0ZouOEWMEqMjmSzk2d1ewWEEVfOpu1FsXCzxpEqHh9gn?=
 =?us-ascii?Q?NfdZag9k4yvKIDzCJ2NPMQEmDMW4sZ3V5gyghNpLbG1Pk/1P/q/7E7FKZr+K?=
 =?us-ascii?Q?JXnLcpXj6IPw3KvEKruby6Ho3zo0QNbqQCSKXtxbqCUf8nTDezckLZqgfXsl?=
 =?us-ascii?Q?fdceYTWWX1I+2I2SSSjNUbuFQkxHZWoHlLgt1htkuusXvkfttPHgZTf1QXVf?=
 =?us-ascii?Q?Y6ydD7/ogJIllbVSUtmB/L7Q1u0vO0Fe8NW2hAq/AWsABW2pUOpLSQbtc2HV?=
 =?us-ascii?Q?tU2drVO1fbUjoLbe+ajtQsoy4AhNvazJy9O/3rAfVYT7zNP8fIBGKqwIl6s3?=
 =?us-ascii?Q?1mTgidFW0JteCSw5bq6GoyuKm0ZxGtn3b3uEVbepSPiJ5WHVZEPV8Pc9cKxj?=
 =?us-ascii?Q?IgxzS5Qfaw38ZIfBfM7/nIGWol7FTefETCXDnr1KlOUg4RkHRVN5ESbc7apy?=
 =?us-ascii?Q?Cbok0OCdRnBkI+vjNp7st/rbB6kU8DFDsLooBkh3hhSk0U3/eHI9CTPCXueJ?=
 =?us-ascii?Q?05qJTPZjpJXWdf7+Hzmgxq3XtuO4vQ8=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 1529b2f6-2cc1-40c0-5324-08da3994d5bc
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:41:03.1584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/55urVP6INuyHmvh50+eUVF4Irpa2zdFBElT+8uC5J7wUDgnoFvp4dpxwu5Fmt9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0941
Received-SPF: pass client-ip=2a01:111:f403:700c::730;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
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

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dff0200f70..03856c558f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2397,6 +2397,14 @@ F: hw/intc/s390_flic*.c
 F: include/hw/s390x/s390_flic.h
 L: qemu-s390x@nongnu.org
 
+CanoKey
+M: Hongren (Zenithal) Zheng <i@zenithal.me>
+S: Maintained
+R: Canokeys.org <contact@canokeys.org>
+F: hw/usb/canokey.c
+F: hw/usb/canokey.h
+F: docs/system/devices/canokey.rst
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.35.1


