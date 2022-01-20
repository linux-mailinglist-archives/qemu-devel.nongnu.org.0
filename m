Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF434945DB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 03:48:56 +0100 (CET)
Received: from localhost ([::1]:58594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nANVP-0004Gy-2G
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 21:48:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nANSQ-0003MK-8o
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 21:45:50 -0500
Received: from mail-tycjpn01on2131.outbound.protection.outlook.com
 ([40.107.114.131]:4163 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nANSM-0004eC-Oh
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 21:45:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcICnnao9vVKFm4FD+lpzZJsW0e6Jk5S4gQ1PDasots2JO8CXMwV+SCvbwRAzOF/JbPn0RVOp06hQb7YV9kDYiRn6GgJyj85b/bm6dzYRD33N86xmymowFdqLg8wPNNHle8VivmGNTTS0grCkyCxD993MsUWcXU2pXilI3Z3hXZf5jWVT5ATALq9JxW0YS5hEDg7lYB+8AX3kuMzq1KeU+8aK7FIHMHqClb0oL9UPkrSHg4iL8obR3m1XpcY8jlDZP7yV6fiNshJKLlOXnPpNlHx2MD7/qKKRKDXYRrAa1qudR2jQFfDBVBNKXQUqaapKm3R0a/UnlMMSsYSm61/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeNtQFMR3NlLmjQm7t1GLAbLPn9HF8isq5wa7WxvTv0=;
 b=bZJXxTkBsA9crr/ZRA8IfLGelOA1FO9QCnQYHexZqgf//DehkaV3F7+NupwQKs56iyRqNO4J8OmyE6LKgXeFq/dDg1Al6G1TGJsN5nDjwpgAzBkkyjfe8s+ZKCHlwudCx9S5cOwazrjnw7owRhcsW1lvckbQ6einlyX9no8CPWnro5EQ3eJVeIB0elBmGjYI+p1PN/Xj7zkuZZZelhQySsdNbeLyaOBp5qD+NaLYkfDXTg/tqtEQFoVgZh4P20mTxKe4/QgGqObcSJBpEEt83UvjEDpGqh5BsvtGY4soOcNfABywQer6kHfPkZSKOa4jcsy2Ve7RUDYAnqXSKRWg/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeNtQFMR3NlLmjQm7t1GLAbLPn9HF8isq5wa7WxvTv0=;
 b=CWyTwrgfQTCBsbA+rCGryz4mb5OQle+6oHAo99WTSs+kfZcX7uf0PgVg5mk2Tg4JYDo9MU7TUfVzl4J1Xi7ZEVhyHXMb/iXULf44h9DPYoouDvsX583uyua2vemlZNzNVM8raZo/s7g/w+W0+DFG0iiyjr9UP2Syolub0Ey7CQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYYP286MB1882.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:110::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Thu, 20 Jan 2022 02:40:21 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 02:40:21 +0000
Date: Thu, 20 Jan 2022 10:40:18 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 5/6] docs/system/devices/usb: Add CanoKey to USB
 devices examples
Message-ID: <YejLkkImI0LunIxM@Sun>
References: <YeBqg2AmIVYkrJcD@Sun> <YeBrbOLSDL1xJAj6@Sun>
 <9d866ab9-ccfc-5bbd-004e-9ffbf8f14836@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d866ab9-ccfc-5bbd-004e-9ffbf8f14836@redhat.com>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK0PR03CA0098.apcprd03.prod.outlook.com
 (2603:1096:203:b0::14) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45f7fa5e-a80f-47ab-1737-08d9dbbe33f1
X-MS-TrafficTypeDiagnostic: TYYP286MB1882:EE_
X-Microsoft-Antispam-PRVS: <TYYP286MB1882DFC3890AEA5419C80237BC5A9@TYYP286MB1882.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSNLbNUeMfKV07Os/2URKIF/uTFq028PK5cUFFzs4aaCtX475pm9g7UQtHxeSXUWpigdK4oGZrloqcTSY1ujEFzMAGYXuFVrHan8874AgTgm10T89sbamhqWX3zsILiGgVQtakDBZaqHz2URheei4AIzV8AjobmRprTyq6hkyYZqs/iSSPuwF+bzBFNNkwvJWwn5bez1dkqEwHMWOrsUHEavRLPbZxhPUBQXXwiU+WcI2UlWBUZACpcBRExdswbSlhkQGCTejLoa8grTclhzmhQe+thEPyWhxsGDhjPl20uwpgbcDcGy5hCvtL+JnrYydWMu5+WRegyvwoZeRD6+Gy7l2GPA/DowTxsBi7uba66CHRiW5J4PLHm/rSwHh/GPJBN4U4xfrfuekVTS/Gv4838QI2trzof9rxV+Fety/YSOM9ZMDqoxA4ofIM+WaDo0lV8C1H1ZNS/ivECbnKUReUgtwWoiOEFXi3T0O0ycDSFVQIad3oGVepY/s2MbXIrzlvribjq4pQ4WI7fKvpLOJax95p3GzN71W91qvZzGc4DBhqcDrVq58fdzhxA6I7g+hfW+TK0n9PJELNgmYDqhKJSgGjnE7GEj63PzaCIbidXRQ7NOevlpDpy3GZAJp2ndEmUIcq0bIImw+R2pgtebO//xhWeA0TPV/bzHFinAxU0fmDAzZ2LosuUEo87H2xU7au+18TOjmXEiXnhbgmsH5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(376002)(136003)(366004)(39830400003)(346002)(396003)(33716001)(9686003)(6512007)(6666004)(186003)(6506007)(8676002)(4326008)(38100700002)(2906002)(52116002)(8936002)(5660300002)(66476007)(4744005)(508600001)(66556008)(66946007)(786003)(86362001)(316002)(6916009)(6486002)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2m2eYjYCIU9oLlkspK5deSHYO4w8Ef4pLAtNgWIzK6crwscBs99d9U4qZ31?=
 =?us-ascii?Q?DwS+FLQ4Vo2agJZ7+2r5/1JzkFQbljAj0dbn/JKvy8nzOjRRfIwWg51a9MPd?=
 =?us-ascii?Q?1lyJeU+1dR5I3V/notVEupVWAPPinf1GwKfpl3oxOl5LMVwph7AuaxXC/k/G?=
 =?us-ascii?Q?ONQpaXtT00GYKYZmQIuqZEtCl175c2HbLvmI39FnBbVjaVbGd0sHTIG4oLDs?=
 =?us-ascii?Q?kP3P+olRN61Na2dVFUjZdH/C4sWPUl6a+RL/TRS+hf9xyDkMZy/F4Y0YbfA+?=
 =?us-ascii?Q?Rgea5nHugPfNfOWxhuLRmhVu9pYxLc7hCCKaRY4lvm+t+R7diyE5rLKatbwM?=
 =?us-ascii?Q?z8W/t1V7jSbwIrdbEXb/gfpILEYkV/lX8Zp5x7r9oxjvsF3M3d2CzSLlwgkb?=
 =?us-ascii?Q?VZ9XjmTF/1Pm1XAZOL3Af/8Y8fN4eMCGOk7tbeZUZPIUJDI8AMxqx0vZVjJI?=
 =?us-ascii?Q?rO0/jdPoCXaeIFe5ASzop+kz6ORtZ0YqtkmuJno5JYauhg1Hw6w5H0f9jrKh?=
 =?us-ascii?Q?qIdV7StldBdmXzrsnLUXDgm7CnMtpyhFDE0PB2+tHL1LhKOLP+MLn7o3F4p4?=
 =?us-ascii?Q?wH4gT4bxj7U5LLW27+lSm9tbrh/+n1Xc8zsL8+J+0rNLRil3fZF6Ofsi+Soo?=
 =?us-ascii?Q?SLPgn3rEVTcH3MD3UC2fDbDEKQg0Oeg8y86a9EbKydDFdd0nTYEc1a4Srsht?=
 =?us-ascii?Q?UdKa8pFy8jcnl6Y3okuj+qUxmFkxJg/WPRrvfBUTdjFwnG/9UQxEhhosEaz2?=
 =?us-ascii?Q?CjQBaOXhLgX8gTgm2xHCOIXtXjM4e/tShQHG8z26B42HCd6dZAtqjTZ28O4P?=
 =?us-ascii?Q?VpjtvCgeIZ+eXuMvXUKH/7EggVdXU22j4WHZhM1XCJ/xdUe2YVR0I43Y9hGi?=
 =?us-ascii?Q?yYMjGtiW9wFGniJajrM2iK7OWFPmlVH+Zkv7iiKnMksLbxJsI3Hrxg4hlZBF?=
 =?us-ascii?Q?ycNTToZBDbeea8vxfVwoADU5MAmTqZ/VDT0oQ6VVq8R1tpEhWy/9A7k08saI?=
 =?us-ascii?Q?fJUC3736RfFh6L5ke412M+Gio7ypCVyhaLlTK9xsq1MDBMWY0nblxLVpEsY0?=
 =?us-ascii?Q?SEtY4Q6r/RUPzePcNtIck4DqB8ZomIPnwyNvwbL1VYGppPRpMxF5ctxfzkBh?=
 =?us-ascii?Q?bt+nSgr99zEfxXcddlx/2btJf5HedmbG7HXMV4OeN/qIykXKNZvgxi2RKcs2?=
 =?us-ascii?Q?CD550ez2+fmbb6XQu0/8xVFdgwQO6UdVGYQC5Z6HEf69C//7w8IPjih+h4b0?=
 =?us-ascii?Q?Wtr2V6p454aFqPr6AEUKdt8qSUSfTw/MqcsrdrBgiEsccDttDhMpboikIUFe?=
 =?us-ascii?Q?V3FVAWyGWYKreqUTFuXYBo0Zm/zqFTpsZSl2ABNmgIJG90GyK3y38pDDfGHy?=
 =?us-ascii?Q?Fh31GPCem8jftjNCtTa92Q9lb+ljXYXxtGwfF1cA/Nvi49NdFR1gL2Y5AEfQ?=
 =?us-ascii?Q?pNSYVrzzRYdHhMx8nyAUREWGPa2bWkK9YBZt3vMqfXKhs5cKQIHmUpxaih06?=
 =?us-ascii?Q?m0hvREvWZFuUTjz78HrXUboCtjJhr1MTacyJ1ZT9foHp1TcDJLp6nuYqSixw?=
 =?us-ascii?Q?xxa72r1c/j8pRFYRmq7EgSTnLO1AyQs0wg4AjQtF?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f7fa5e-a80f-47ab-1737-08d9dbbe33f1
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 02:40:21.5717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9zICzkFhps1zpC+H6EX0p7NmQcg+ULB2tCCr0z5F6QNYJCXyoOF2xfFlXdFXrSs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1882
Received-SPF: pass client-ip=40.107.114.131; envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: contact@canokeys.org, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 10:28:49AM +0100, Thomas Huth wrote:
> On 13/01/2022 19.11, Hongren (Zenithal) Zheng wrote:
> > Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> > ---
> >   docs/system/devices/usb.rst | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
> > index afb7d6c226..341694403a 100644
> > --- a/docs/system/devices/usb.rst
> > +++ b/docs/system/devices/usb.rst
> > @@ -199,6 +199,9 @@ option or the ``device_add`` monitor command. Available devices are:
> >   ``u2f-{emulated,passthru}``
> >      Universal Second Factor device
> > +``canokey``
> > +   An Open-source Secure Key implementing FIDO2, OpenPGP, PIV and more.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> Just an additional idea: It might be helpful for the users if you put a link
> to the separate documentation from the previous patch here?

Will be added in the next version.

> 
>  Thomas
> 

