Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76647E914
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:29:05 +0100 (CET)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Ve4-0008P9-CJ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:29:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0RwV-0005mV-OC
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:31:53 -0500
Received: from [2a01:111:f403:7010::703] (port=17069
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0RwT-0008C7-IX
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:31:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqwc1HXGnme6H0cggwl5uuNubudsq++6mEhcPFtnbRMvRD0SLueUNEmVSwox8svyDRE7gT/bfMOn4/MA82I3c78fv1jS+fsq0tZqiqvWsM9oavlL0soSptrQ5EWw2KpGuzjVheCyoSd6rLOETLNoL7LxKmyf3oEPJlSeArDz9ElGJmp/1Ny5W+2zqD0VpXvSK6S92HWTXcuN2xorCF5/GLi4guR3IzUIYZRDtie43Rp35a4zixUfAWTaP6Me3+DPy0L0Ie3S8Lf0zlw1nGSvk07iraGUIV/ejrCu2V832Jc3jR6PO66Zj2dvqfXdWNdctlMWGSHTT4yjnRWzVeaneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvbNrQbtFhWjowKjEDRWD70rqlP5OdYtkExHJT+FJso=;
 b=fO7Jcn6U8fErLmrJJDu9dezQaLrBdFedagjk+qUtJgDerJTVoVYGEt0tzZONOHxir8jL+f8ItLSBNG26Ucg5FZT3/swV5pSHutR/bWiEVPHcfqfoJ+b82+/jK9ny3pMBCkYbCQsy4ph/lO6gj3ETkk1S9ThXKZjyPmf/U4vSc6NTYhOLUkmNx8Xm9CUGzyFan6W4MXlpK6OZW1KFcRPzJENe3hde+PSCTlz4M6FG9DU6LA0W1aF4DcN9TlHdreAP3X/EHJ/HLZX7QqBB/SszXnaNgmk6mwhGm+5RbLe2GSf7z184fMuHPy8ViEJLKJXZFR2gjYcnTcuFclWY1t/zsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvbNrQbtFhWjowKjEDRWD70rqlP5OdYtkExHJT+FJso=;
 b=CiZKMM4Mhb/qmk0LyKdtfkntrpUMThNhVQeFsajMZrYrx3IHBsAkKKfiEgboaGiqiy9APlmUZ01BjJpCMkRBWMmYj3Uk/33OMm+5PzS2Hs+Qmba727jK79FxBR19gvY7kfMo2HgStWRu4EYZtnV1PK/QllORdUINjgNPjCqyj+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0032.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.18; Thu, 23 Dec 2021 17:17:13 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4823.021; Thu, 23 Dec 2021
 17:17:13 +0000
Date: Fri, 24 Dec 2021 01:17:11 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] docs/system/devices/usb: Add CanoKey to USB devices
 examples
Message-ID: <YcSvF/wL6m/paCSu@Sun>
References: <YcSt+qozrl+J8ool@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcSt+qozrl+J8ool@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1c76ce2-de0d-4d6a-5128-08d9c6380f9b
X-MS-TrafficTypeDiagnostic: TYBP286MB0032:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB0032C72E3B1B483DE0805077BC7E9@TYBP286MB0032.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYGmzzMjBNKIEONl6oHZLFlwXLzUZuwtDOeAPC8i0Din6iaVjrFms7kY4GqAKMXq4lnWlVTZ6goBgWAJS09kuIi+TXMdHPjQPK2EmBukqE4hcXzw7rqYlo+OIvHx4xzgXL9UdHaiEQy5wfRsjUPWPyYp/kpeck9olIxVFYJ3yf4AounUhWj3YcHXECF1zh45MFR1JlTI6+boLpHUe5Q+WqjjtiAVM6zVoAo0Gqr6+ZhotnYCYwpkzKZrNeCgQDiRYJMcwQ6IcyHsN53L48ll7ZFOMkiy0/UT/NdRqKVkxY6cBPEficl+ioSJqinDntT2U/UIYyUm5eyomtful4CbAx/xOJ0WXmF0qbMOaKx5iUats7l/aAoiABfApg8ch36Pe/tkzUCP8sox0+dED1lIHwQU8Zofihra/gb1kcyFruBmsH8YFkXjt7c/Q3YWB/MPgMGgjOP8Cl1gkLW4S83boZzaXZHvcTGdaPwKDXTU0gksQHjR9TWgTRqW1XcLKOlwDNYM5hFT31cHTbUdMK2CQgLV57bbNh6PcwkbmQ+37iKIZa5hGRDjFma3ntOF03uk7AlHgaBWb4KJcJ01s9TBppV08Np0f+w0X2cI+PbUUDM/GrT8ON0coxlK1B5qUUeVYHjXXKwIR/QJgtswpW1Xt5htnaebs834ZFLRnqlBzBX1LSThidBZ+ddpWWzwU/eztk7a1EdPhNuogtJLV1VX/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(366004)(346002)(186003)(4744005)(4326008)(6512007)(9686003)(6486002)(52116002)(38100700002)(508600001)(5660300002)(6506007)(6916009)(66476007)(786003)(8676002)(2906002)(8936002)(66946007)(66556008)(316002)(86362001)(33716001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vg+HjzEWx+1xi8/4go0WqFB2fyMwYdZ+8Md7jaE30AdepQW0Phs7eW2oysoQ?=
 =?us-ascii?Q?MEFvkQUTbpGQygxD8CKZosETzKUpWc0hcbSWFYIdryj2kvE5LTRABD4jhGLC?=
 =?us-ascii?Q?9KvEidXCOvs4hT+y+9HUhnYImEo1fOZqApPqQwNCR6hP76BDt8qnBQ/gcPGh?=
 =?us-ascii?Q?tKyByOGUOnGCRCCf1D67mW/g3c/6nAbQHPc0/GVOcV2pY4Fl8b0ooxmUxKYa?=
 =?us-ascii?Q?RJdixxOnIBwO5+zwY74JvqYRaxH2TPmvsLBfmLPx28G3MIyIIHMldrL8gVhy?=
 =?us-ascii?Q?GCDD3kZV+j8wfl6CLDsj1e7Ry4QmN2sWJqClGk+SsZ+DpGodpMVkSvYb1Kpt?=
 =?us-ascii?Q?fAyjiGRywIhETot+j6U0Yg5eNfntotboypdixvB2Lf9zLfXcfG6ecY1fnYqV?=
 =?us-ascii?Q?iu9pRx8H0qyuR/haAJv8n0DxR+2Z9vp9p7H0hZI0rshoaw4ZHg02lRjDsNcW?=
 =?us-ascii?Q?NIOikwKeQSdPOtsdcMKueNnmZwFWfppTzjccRVyafaGD03pVFbxfQoxuE5cO?=
 =?us-ascii?Q?zKPJAoW3Uj9wSRkz+QxnDtpGLdoKowgT+Jk7g7cpmF/udtaGLhT0liM/KVRp?=
 =?us-ascii?Q?TFnM6nsl7yCtCGSliLrSqGVMQl1E/MS9zZQXkuWi71npSxUREZuQaypCocyY?=
 =?us-ascii?Q?GyedbMxVHTr3ku+1++CXZ96WnMW0HtvprTGrA9szHJkAE77+BSLVBIMiECmV?=
 =?us-ascii?Q?AUa46PP8tLXxgGTX+RPSSO4iVE6W/LuWj7B6OawxJu3uGpLJY/tlJL1TAaXU?=
 =?us-ascii?Q?IDJ0EIWvIUVAxVKRhv/5SQDZvfZFIUJQ37UwgVxGPzUJfxwtJ4/e/QVDIiYi?=
 =?us-ascii?Q?yHLU8GA8EWztWlY0oXCnHbBjj4TJBB8AYih/KrQQVox3C9xXQZluqjZBb2ad?=
 =?us-ascii?Q?dH+OsUf7MaLElShoYdgJfMrU6RRRP03ux563wmuc77zP87C99kB9lrP8bn3Q?=
 =?us-ascii?Q?TrVKlFB5Mrdeo6QhIG/Hmmi2cGSF+s+/lJK2F9X1Ev4O+Mn8JY4ZGMMgOPxC?=
 =?us-ascii?Q?vrMaOhioG/RWnEoluAv0G9E4NQDXPPVcNbtw29WlP/OE0o+04icSOpsTflJV?=
 =?us-ascii?Q?CRtC5EkSMsc70PWMl4vTgA+2GDIK95Pl2uOMJDSHjufCIUtAiKEWJYtukHA6?=
 =?us-ascii?Q?wWfly95h5T3pN97PN3EC+w0cH7McqPzd4Xj2+AJsj4z9FZnllzgPMVbWc3/T?=
 =?us-ascii?Q?wD2SzWxzo9RtC9MFaA2mYKgp9ey+5tM1xaI4arEfHzquLmEccUCBdAAnzpOc?=
 =?us-ascii?Q?ncYyPp6GMbugBmFxGiDtyWaJ1Zy+PYFhA0wm2i0Dkf55eMH3mtxOaiqQ8OqK?=
 =?us-ascii?Q?UrCQxPJG8uU5N+sOOiWIAUWsYY5x2nV3fnAz5r2W4f/0NuyTYOWnn58EYTnx?=
 =?us-ascii?Q?4GqxrqKTGKXrpvh3PcssHo/rXcMSyXNxcZrXFfaazGMsUWSuztegpnbMrhSW?=
 =?us-ascii?Q?Uk7yRUdo1mXBrJYAoPp1feEmAfx255RpmxNQtQZHU+/YdXN1JDP5q2mznHxz?=
 =?us-ascii?Q?Am0rb6DmjDi6rmxxrBxA+gyIg7kEIYN9lixrPZ5Y4ZaXCd7HuJCO3u/TinLn?=
 =?us-ascii?Q?EohLuX/qM/T1inq0kao/GJzUzTxy1/k6s8Y7b9Ax?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c76ce2-de0d-4d6a-5128-08d9c6380f9b
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:17:13.3347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T800GQ5xGHgoFwUQkYfcc1TLWNUzfWSugw266FsHdwTbJZ/uVnVQI5X6kRf4Sioo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0032
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::703
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::703;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Dec 2021 16:25:05 -0500
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 docs/system/devices/usb.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index afb7d6c226..341694403a 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -199,6 +199,9 @@ option or the ``device_add`` monitor command. Available devices are:
 ``u2f-{emulated,passthru}``
    Universal Second Factor device
 
+``canokey``
+   An Open-source Secure Key implementing FIDO2, OpenPGP, PIV and more.
+
 Physical port addressing
 ^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.34.0

