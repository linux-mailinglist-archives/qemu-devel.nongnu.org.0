Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E33552D2CD
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:44:25 +0200 (CEST)
Received: from localhost ([::1]:43732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfVw-0001sm-BT
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfS4-0006yh-LB
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:40:26 -0400
Received: from mail-tycjpn01on20705.outbound.protection.outlook.com
 ([2a01:111:f403:7010::705]:8514
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfS0-0005g3-T6
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:40:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEq5nVr3WpNUxhB+X+rwjhFueHrdfSSY2WH1QkbnVlmQR3mjCMlVSqMszz7r2FEpr/49o1v/bXRF0Fot1Iw86F4Cnn//1HSxDH9TxJG4crp0ZND7FeBc5Kt1whldQh3p1q1usoFGpqF+OzCA/kSL235DdGczoc82TgiVOuaerWEnSiJlqcwiCxoOzKuYnCaBQ1tK9RiHLFKbkprOSClzIBgibhTkPFa/2y15Kqz4Bg0FMjrofDLYLNcJofWpouWLMXsjTNxhZEr9DjAnYaibJuiyNlrrm0SiRf5d2tWlwy2BHcmWJfMmfwfc6Mf3eJuAlI7Q8EsVhg56chVBTfUu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdCC+gP1XGz7HTI3Eu/AG4LoNCOCg5qyKDk7DRjqKQQ=;
 b=aTT1LGlRZ2RqVbtjFqebHVsHBK5wXl/ceHEBgUCLFcH//uVOaVqYKOJLOeXuKeRrj/J5oUdgNhipdRJzcGASEmOK/rxw+NJfWaHRAmGA4W0LyPT42QVtP3eneO1xNWCJjwbUjvwSdKk3JmFJ7jlgNVkkS+TgGgt4fTnCN+AkvSnsaJ2T/zuSmkP1ynR1UPBQK0Dbe8e7eAViB1KNp4py1cla0ioJ50BQ+ipkOAQQatUhwzkSxsFX58jU5Adq2n4UR3M/zzoEt4wHs1My7wEd6G1eTl582fE8eCewafpT3YC0wAoCRZwLs8GBHsJHSk/Ai29BTyphuPDl2sYdr4gHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdCC+gP1XGz7HTI3Eu/AG4LoNCOCg5qyKDk7DRjqKQQ=;
 b=g/Kumqg2BUCKQfBa5ZlXUMZ0Y+rdfHIj3zPMywqiKnJvc0GR8gCgXSaDSvg/aZ3F+FrDJmz6BpsslFC+Fv29Lb8ZA1zuub2uvUhDxivPBROHFOMBliRn6mvEc7dSKCiCl/FaQqCLuGNtkcIWCCEkYCoGmhUPS8O4XW+QLcwkijU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:9e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 12:40:10 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7%7]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 12:40:10 +0000
Date: Thu, 19 May 2022 20:40:03 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org
Subject: [PATCH v5 5/6] docs/system/devices/usb: Add CanoKey to USB devices
 examples
Message-ID: <YoY6o+QFhzA7VHcZ@Sun>
References: <YoY5k0PQny8WtAHi@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoY5k0PQny8WtAHi@Sun>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:a03:54::26) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27ffac06-9a3b-48a2-d9f6-08da3994b66d
X-MS-TrafficTypeDiagnostic: TYCP286MB0941:EE_
X-Microsoft-Antispam-PRVS: <TYCP286MB094189F05B7DF3EB9C773B15BCD09@TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SQVzoidqwyd0/AeyzC7USDnt+jkgkdSn5F5GoG3YlosxG0W8LJJn02H+lyUzfMYrn1ikfhVnYUSnN+p5az8Ho6cLay+wwW7U+ywGR7LBhbbu5gRHa02KTNbrnlt2YAaLmB5AyDopCBKTT7PETOyfocVl2aIieHKGJ6IQ9k8ytHSG2mCuMFzt1fZC+7evbJAeij22wTqCpznLZ0lXuBLaTv+Y+U8R9Eeo1ZLF7SyZ/fbnvyf5alLbGfCxViSy3MXaHOgBIrTbspgB3d+zuDyv01KVYyC899EydOMygYiF68uPojt8azhsdSCB4ImXx6hKFRd78U1aDu/DMiPlPrcTrfpc3N56GU9ND2SqzCVYQ+U58oXEMgfMtdtIM5QOXeqnH0XQ6Ka040t+gr5W3mLeCQx7uTb9AUXZtejeiADLmWrXkuiZmW4obZbVLktzFk6GHztr3J0P3UxK29QOzO5O5QOrN9hNKPAlKxlKW5u1tZY3h3j+nJlWLHyLCn4nN3G0dOJwOR93KwxzwDA4Oz9q3q4OjHH9mAB8raJrMk0v1qr+t5Zd1YRdjpk/AWFIHXn4vxYcRYbqD5FRh3UppWUo8RZGGVAd1ZcAq0Jv82kLYdM1Szwt89P+TRJyu5lW1kaSFPi4CTbCEguOmCDgX1XvNwTheXWhcMhWlrYZegCZkWozef/gXzPEllhjxdGPYT+Yh9fV240DvkECrAdiVCv9rfEXL5lPJXHl85L8uTLe+qI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(136003)(396003)(39830400003)(346002)(376002)(33716001)(2906002)(41300700001)(8676002)(508600001)(38100700002)(110136005)(4326008)(41320700001)(6486002)(316002)(786003)(6666004)(52116002)(9686003)(6512007)(6506007)(5660300002)(66476007)(66946007)(66556008)(8936002)(4744005)(86362001)(186003)(49092004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TtJR0k5OlN1gffZ6T6BTPixY94b9Oh131YkljZZGmSxdkNQJ/sX8anvxjG4X?=
 =?us-ascii?Q?tjVqevffQktsWDycQv43FwwhywivqvktvK2KjvtK1jKWNhpLituGaTBgNIOr?=
 =?us-ascii?Q?cDjdHeqZhVNK3kiJFtpxIN38gmMsDKSwhYgYlVVuUfLF5JXvjzTb2jsr2TR5?=
 =?us-ascii?Q?oUbPaqwp2NWfOaPsCIfdXrZU2SDPpmSn8rsR4czBM3tfTGwKg1/dYY0IEklq?=
 =?us-ascii?Q?wP5oxl9wIVGkMM4Jjk2fUtkPLkIIvaHfYTvHF2gd2KzFFtE5n1WUE1x2rvMI?=
 =?us-ascii?Q?NsmdYYUwM2PKa7G/0XhcsiAmNQTxeWjlfE1wRRGEF84ahEaZNNAJxM3yUAxt?=
 =?us-ascii?Q?Wo+ClqBff+Y0T5X9qYkHCmOJ/FzP7Z9MPLVquW5Wp6/TV4YueVT2aX6iPOWF?=
 =?us-ascii?Q?xvDxYu5q7e8L0LahJE2yn4RSQxqGGYJHmI/+xWCOTaABuWT3uDnKjdYKxk8m?=
 =?us-ascii?Q?4S4+qP0WKiECmDBhrxRko6wicRfLdBNS++VeU0E0eAQE95jdqUTIm5Jv8MhY?=
 =?us-ascii?Q?5IsMyxY00LxZeiZWjQS09XTKCkbTb+jY/Rp5nGp5//L9h75eWAeLTScH15dY?=
 =?us-ascii?Q?8BfhKM8AUlDLJsDrx1/aMO9WrV9V/ZoZ0TySKPtUgoIHrER9LtRuegjvHCIZ?=
 =?us-ascii?Q?WTruG8In/Zbij6+hawmbwHT6afx+5To8mbj6p0Eaee6Z4ukHWHK4v+sc2Tq/?=
 =?us-ascii?Q?tqWA5hr51pv40y4rnoyTPWupr6eqGqeaKHGDQ+I42/2ospUeU07/FnAdlbI2?=
 =?us-ascii?Q?K11L7iwvYuIzUUG7lMZRkQhqy6j+PC3xx4ZKAlK/5O6V3P8DRr3pLHyPsWNH?=
 =?us-ascii?Q?UbZRi/yJBPh8ObAooHtmNGqNKci/oedeyP+1zB6cGTPfmO2wC2jBLkFBp4v3?=
 =?us-ascii?Q?0S5Z5sdCN0r2wzlyilSPLrb12I6DuwltoCCdy7oUpGBoZEAY3QEeQVa2a319?=
 =?us-ascii?Q?QBKb2dJkCOhbdQzVhm9788CLfOuutm23b23dJFfqHbBPl6rFq1KxXOkX6h0Z?=
 =?us-ascii?Q?eUboKKho0YGEe0uJn9xVekN8lMFnwwaqJ4qio2Z2xnXMoi+BUaylEbXl9QIs?=
 =?us-ascii?Q?pYdFUy0qghbOrJvt+9hP7bU2E7uo9BiYYEpZ8tFfJcTWX9HiZkgSMGRPQoxu?=
 =?us-ascii?Q?6is5BXLptbTWcMW3d3gwW6c1WYE6pYa5y0azy7KCjUTlr5Y+k+nPG9mVQnyj?=
 =?us-ascii?Q?qWhSu8WK8WK8yb47cWDo7wofwI0wreyOZffwx6X95o39hgC3SeZGgCivxp4U?=
 =?us-ascii?Q?e5QpzluQ2grCLbpvAcqJSWCwVyMqJ8IqO0lyHgrV0+uYlqsTZ/bqGAFj0NIs?=
 =?us-ascii?Q?uZvAPSZUateL+jVppYvEexh4gcKjOvU76sjR6pSkj8z1CZuM6x6JS0zqsstU?=
 =?us-ascii?Q?ksNbIV24VgpQiwxPjYPbnnkty0gxjNBGHaLjGEdMjDRmry8RXZbKPtEmUM8S?=
 =?us-ascii?Q?tP3R6rix1Z/oHPVVCfqes1oigKlgbr7Prk8JcO7Zbvv/lS8kR/+tJJaOCzKC?=
 =?us-ascii?Q?FF3cv82Zw+Gyo+ZQD2s2baTaHv5KPfgdeeWGw11uIupVMDWn5MVUjCVv71IU?=
 =?us-ascii?Q?ds/3P/iGOTq5iFUvqQowmbpDIoQE/huwIWKGx+ztNsJdVihZJCqadiboe3uT?=
 =?us-ascii?Q?St/IvgBOVqkXLCeXWHNgbFpLnfvwwhUQAUhj3YWLhnJSkVnLD9afKtT2qMWH?=
 =?us-ascii?Q?NTlmu4UIAthVcFk35w+ZEHi3naVfNhqvlI703QporZgNF4ZAzPyBKbanPxFI?=
 =?us-ascii?Q?Qx3Jo2Nagc/LcMgQOlePGnIu2jqva+g=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ffac06-9a3b-48a2-d9f6-08da3994b66d
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:40:10.8078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/tyr2aBVGTS5G/kugEKoyA5TunvPEMGCeizb0Ik+CTXVJlZKkRi9nfOQMkye9er
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0941
Received-SPF: pass client-ip=2a01:111:f403:7010::705;
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

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 docs/system/devices/usb.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index afb7d6c226..872d916758 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -199,6 +199,10 @@ option or the ``device_add`` monitor command. Available devices are:
 ``u2f-{emulated,passthru}``
    Universal Second Factor device
 
+``canokey``
+   An Open-source Secure Key implementing FIDO2, OpenPGP, PIV and more.
+   For more information, see :ref:`canokey`.
+
 Physical port addressing
 ^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.35.1


