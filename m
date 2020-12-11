Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B632D7DEB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:21:39 +0100 (CET)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knn2w-0005eW-W8
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1knmzi-0003fx-Ty
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:18:19 -0500
Received: from mail-mw2nam12on2070.outbound.protection.outlook.com
 ([40.107.244.70]:45729 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1knmze-0000x8-SS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:18:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlsrD6dDXEKJgS2rYjtun6nql/IeWgtw9DPDkD/OzGfRNH5QQomaoFkTexdzXT6lHdeA8ibTggOFXSTKluUQktIETBSd0j+tiQz4ciLBVf/yC5xrROr1Cn0ycYh07dVA8EmNpq3FsOUqvzw3zSi3bQY5PTxmzwrjV5gICT56BVCPgxjrUT7HgCkb26UmXfy8NJmeV4klXTYV9G1PpdEiZii1ICYmk03qlONDQ6GNIYzmUUbzaZ5c1lRzxrhcREajs6GmG8XqnbuD0zdDh15TuzkTnsYnz9FfKpPiQ6mdjvyBcQyveAfCKJm7mXHlYp4QCXokDbpDlW+0nDWi2QrLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LusyJMuRsTX4DaePSMq0YsaMNS3pJTqv4k3X6L6eyE=;
 b=k9+SZRE9NKaZ4DnfVhVQH6nkaDGwClttpnxJjixQTug4VdPigj6ULpihQ/xWwGeBgKqj7vXl2FonoN5T+bzw8H7dh3sb68TO/plNVfhz2FfPkkVFPMalIgfAHbOCE6vwkfVgYDU3pVbjpZ0oium05/iyVIP/qr9rRBr8M2dRMpd9M4neNNsJ9UXgHpiV9qw1ESCzl7AN3DNeodOjTBtuAMLyBr4vHSczN8ONPUlpeSvD/xRQBDY8s5Q663OD+8hJ8X/poKO1w2cTWQWtqaj3EHmrows+yTVnvaSD3iz+mEXFGZoU9b5o3LkNcW8Syu3qEJqA/KkPi64RrPOLAbj2KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LusyJMuRsTX4DaePSMq0YsaMNS3pJTqv4k3X6L6eyE=;
 b=UNZVE/eHquDRbXbWX3IHBBbjWXREzhMS+VLEhmp/SEp0R2SRX/deeR8AUQoNwNoD0VBPthba7vi9kBm1xxh8SH5/YzjFmGFwJu+fhyzGbIOHeYrQXJ68bsRe18MVbKQLu5ZRR3NVDg/tTOvdX2FSduwUHz/i9QMYwd1A9z83SkU=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BY5PR02MB6503.namprd02.prod.outlook.com (2603:10b6:a03:1dd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 18:18:09 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::8163:86a2:8279:471c]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::8163:86a2:8279:471c%8]) with mapi id 15.20.3632.021; Fri, 11 Dec 2020
 18:18:09 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Vikram Garhwal <fnuv@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>
Subject: Recall: [PATCH v15 0/4] Add Versal usb model
Thread-Topic: [PATCH v15 0/4] Add Versal usb model
Thread-Index: AQHWz+n6KyHbmPXdKESPhMDmyDFWHA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Fri, 11 Dec 2020 18:18:09 +0000
Message-ID: <BY5PR02MB6772FA793DBDBF7FABEF820DCACA0@BY5PR02MB6772.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f89ff029-4d54-4ebf-49e4-08d89e011d49
x-ms-traffictypediagnostic: BY5PR02MB6503:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB650396F89F396E9BB3225C3DCACA0@BY5PR02MB6503.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JcgAwkghk51+ZYEaH3hdFvDf5H57WbU3cnjE97/qaPbH4rjsKJF3h9YomJDAp7zZ9VZRMzY+t8xzymlgXb67RWWRHE5ZXQdeJ+94ZDxFLQQj6Sjyi8gdpqb7rTnTunVwEY4JVZDMm2fmhvazHeaJ7QbbjX/k/h1UDhzafAN/GP+hzC2rG4U0pe0sTriQPrHaz+WMNQMouD+ikqtwVSYnR4Zhv3V3LxkrJqO6WtFfxDfbVDSbDWOGNLWwC11uYJx3a7LRHRbTlItLGKaLBzR40Fs56ZQGjtwW1jMmALSCxYh6oDFHvtEzlKWsNol9WykV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(6506007)(558084003)(66446008)(186003)(8936002)(8676002)(86362001)(110136005)(64756008)(6636002)(83380400001)(4326008)(55016002)(52536014)(5660300002)(7696005)(26005)(71200400001)(76116006)(9686003)(33656002)(66476007)(66556008)(66946007)(2906002)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?jdQr1VPnUngJH5TYQzxHm+0WyC/VywnFeZX7GbCkuJpO4pDIDicEETawlKaU?=
 =?us-ascii?Q?3wFAYTHceLJZb81nZkqyI76ruCSibi7C/14nYCF8FrTpLKRV73IZQdndqzhx?=
 =?us-ascii?Q?49oQgQMPxhDtB/yjrWtE6hf+TFDsHX1v+X0vuiPrgUFgi8VmPM4lD55BAora?=
 =?us-ascii?Q?ydXvr8XqT4YKnP7jlTOQxABTT66ozlzxzRpUXWF1itgcO4/D1hbJj9VyL11b?=
 =?us-ascii?Q?NSG+fPluTrnInwWitnT6GphqZRbh/MpKsOARSleLBEBRWR+iNyso0tTiJFVx?=
 =?us-ascii?Q?esnvJ4h1eWTa7bBc2PGi+4U8WJ4v2gn0wgZ4Af+0vq5iXK2GJywdYFxFkwZL?=
 =?us-ascii?Q?LOv5szGLt8raxcXS6VlZknz47CXR8mTHBPYnJkWvK+YxrL6mDCLYAR2Se0L+?=
 =?us-ascii?Q?WQHpV5E7Yeiwck01yNaNvtRC10GYFFROz7QUP2O9RA+wIgkBQvnWgtpuXXXE?=
 =?us-ascii?Q?88NDw18is+EnW9ct2gTCoutke2x8nFLxk77w1mcNXKS7xk3632L/P9aoB3Qa?=
 =?us-ascii?Q?PMSSbvRysPy+ghGlcgVOV3e2iqfI0TYi2I3RrQIdntLEQkWdq4QCazd2VfqC?=
 =?us-ascii?Q?J/onGvcQUt0278+bHRiiVCHMWCmnIoKL4Td8Q1HlDwoCWdjPSB/8VB5MAmin?=
 =?us-ascii?Q?ug2P2z6nW/OzUHVNoDT6D7qJfxWyFTquKt+7rA1EuiQJn330CFEAiqmRIZa9?=
 =?us-ascii?Q?h3pOxsDRqM9DzSl7DZPJ1RC1Qk/27T8lg+bfTpkHypGp3yQg0+yBlT7pSVux?=
 =?us-ascii?Q?oEknBeONW94scGCdXXo0xghh4xEwo8zBGNV384We/qAGh1voI90XWi1zw/xR?=
 =?us-ascii?Q?BSo5nR4YV2Py/iXOLrvw5QSDG5Cy1qS6z/IW1QujnO0HCoQ7ElxJp/55Ssix?=
 =?us-ascii?Q?0gNS0EqpxsOaFGnLt8ZR9tNAmGWhGiJgFi1+aJLoXCJXFXwzK+j8VGlpQOuK?=
 =?us-ascii?Q?5ZsWgV8vpcQyfYaskdupUbmESA/+K9rDLbHoz7FjU1E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f89ff029-4d54-4ebf-49e4-08d89e011d49
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 18:18:09.5368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ld1FN1lE03l6KNLXgANFQ32QhxI7GKixss42jOHyj/2MtiE+8Oq9omtqH3mp/jG7eGEBENqqFKAIwyjZmdaA1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6503
Received-SPF: pass client-ip=40.107.244.70; envelope-from=saipava@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sai Pavan Boddu would like to recall the message, "[PATCH v15 0/4] Add Vers=
al usb model".=

