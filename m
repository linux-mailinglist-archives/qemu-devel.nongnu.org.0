Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3285449DE97
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:58:47 +0100 (CET)
Received: from localhost ([::1]:43854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1YE-0006V9-AD
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:58:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1Nb-0004N2-95
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:47:47 -0500
Received: from [2a01:111:f403:7010::720] (port=39242
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1NZ-0001uC-Ai
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:47:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHEpIIUXJEd9VQLW/MOiabWB7/f3EUmSW6Eff8lWA47RrUQq/LLLD2ux2zzIf54+DIWX1yD4SPf13Sxr2VYUxtkXtnhNPaUm+QBBYuogJN1LISJnFPqohVXjBp5JxixnDUZsOiRG1qi9j8kPtHkVWuAww1Ivr7wmi1oqZsmEjly5wZHp/MIDcVqV8UQ4uv3XMrkw5OmuAFEs6dmBe7wElZlOxxigdGzhqtjzzF9nTU/5mbEdYubYaBK+R8m/9e0sP6DSFlzcPB9gNzj54bzwopZ1lXhIMF4wpOPJg1fwpzbBLIILc6PH8qSXL4Czc9PVITw6yXOcoDC8Dhw3sp/1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CWuhtnoq+kzxR0TqUMzU0NECrMa0oPhyv/yzIOAbvI=;
 b=MUt6/KHCFqY7ZUgWui8YkDbYvj19zBTPYQtWhCRGncKuik2t+bcqlsUvNe7F2jpUWQx3H1bbmhZByyUJ0QkRO3hhrZxAC58ocCBhhViZL0fOhxKRYmYrwIkoN40MvZ5KMS9FWp7v8vUQmnfGMCFVSKt2nY/YSgCy/9CLG/4Mnn6Ze87tWgjUyJ7+OXwlP2RE4HN9tjfI4WjJcExCU+g5uf90RfHMOi+AcIp+Ay4pQKBctDjUbzIzxnkaBDaQC5v7eZiVzIniAs9I/pSz/8U1rSm+icDkJ49jqRX+g3w/NEHV2wOhssz/WGOQIVq9yxII0k5i1pGElMus6FVZkogaWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CWuhtnoq+kzxR0TqUMzU0NECrMa0oPhyv/yzIOAbvI=;
 b=Xmlf2NdItmY+pEV4H4AaPhMBNEWZsG6Cq74N8MGGVXpDwp+ZR+AG3UiQ/Ky1xJh1+eVRpNBidVQmP41WVA9BP+F7r8yGwuUXLQ88lTukBKOo/IUlcyBAOJssGE0mF2YBKLxMx8D6B1gifsaRzHkeEfxeoXAbONXaeqpoVL++gQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:de::5) by
 TYYP286MB1148.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:cf::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 09:47:40 +0000
Received: from TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM
 ([fe80::3108:c030:a6ec:7a1b]) by TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM
 ([fe80::3108:c030:a6ec:7a1b%8]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:47:40 +0000
Date: Thu, 27 Jan 2022 17:47:21 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/6] docs/system/devices/usb: Add CanoKey to USB devices
 examples
Message-ID: <YfJqKREYO1YeBnLA@Sun>
References: <YfJozy5qjVYh24Xp@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfJozy5qjVYh24Xp@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR04CA0085.apcprd04.prod.outlook.com
 (2603:1096:202:15::29) To TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:de::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4938f2a-fa16-4314-7415-08d9e17a059f
X-MS-TrafficTypeDiagnostic: TYYP286MB1148:EE_
X-Microsoft-Antispam-PRVS: <TYYP286MB11489170103D63B556B0597DBC219@TYYP286MB1148.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S5DTSK0Qles+C72qBfpOV8REq51IV0xp9W4Qj345794OYwXA3ZK0zGz+HJyQ1elG6cc6t+G1UTLuMWt9F0YSdKvkRaVrON33C1+eFeLMFSagr/2xL3yAONTbW7kplQpFG9AtRRlhVYN53sZRAUNxgtaByNZ0dtqcncX3fc7658GsH4+1hyDMc3kpSOI5Uiwh2WFxR8ywJRBSKgLFtGzSQA4jYIl5eONRJ/z1JHhecuxRpw9vU+rK55MVlPy1ncJeNsOuTZJLQKN2mnB+Wh5lZkXIZmzA+VKJwlMDWywLAlXRL1Z410iMPVFEAjj/QOz8aM4qx8q1v+xfkS4cbge0OLuJhQb20wIt9RHnBBO1XP18pms9bCkiw0mmozRnOVLoIccFtwGifGRhC5VmpmzsmK7mwf3pXrY9nwGkN36YSyknQx5VVECIswML0IibuxBKsZOTE1k5hhDyxmRwXJbNUHCEXHnKghbjgXox2N3ICL8vS+ix+PMlUbtagzRuI4kjIdiNiYt3BPzO8CwB2IyTqLNEDZ6/SDa1uPLKwUkwMFvq+6sC4RTqs8RpCj0OP511zfm8S9M+wofhDmlFH7BilExmtPpBrlfGa2cPu+H327heoFuDd+VL/RlRdaxbxExE8/OLjahJADP/ThWRitX8axGKJD5dmKlzBP+0gtyOxXoWZMAn65hm7vXvZEPCEdtkok4HwYKgGU+Dz7fvJmOHBAnsHlsKrZK6fMaVGMTimUY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(346002)(136003)(376002)(39830400003)(366004)(396003)(33716001)(54906003)(6916009)(8676002)(316002)(786003)(66556008)(66476007)(5660300002)(66946007)(8936002)(4326008)(4744005)(38100700002)(38350700002)(6486002)(26005)(186003)(86362001)(508600001)(2906002)(52116002)(6512007)(6506007)(6666004)(9686003)(49092004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8rNvvqgUK1iyyK7eNNuyzrcjggQtQ94ol6Iffpq5RRUgOG1X1vJzPDMjRhQK?=
 =?us-ascii?Q?QSElSGZH/NJjH24ZoKSKCU3H9/8Pq8M8n5AdnMjyfuoLL+AclbKfxjmhH/dy?=
 =?us-ascii?Q?XRl3lG9WF0BsnzIHeEcs3s5C20NdIqhHJtn3PKBL3G66M7py3GBPV11d/VTP?=
 =?us-ascii?Q?0wAXl0UGeSu3t4qYeDgSXVOxES/1peWweMvTPxkTV5jf4OV/0yzrapqT2Vzj?=
 =?us-ascii?Q?YUgUnEowLjZicv5FCK9qhpHkxVz5WWn5UlHQj7P/0vEQ3cgHCMu630mxbc8S?=
 =?us-ascii?Q?GV7yspyfsvlD9qjfNMC7SPrVczN5DGQVfSTYYdmX2AEiXRqEIRuGB8/XzRLR?=
 =?us-ascii?Q?1FG+9g49VKw3Wdw5Zdb62+ywmz/Dbe8UOhOL53/Lm5zv7F9glOHygPfAMrTt?=
 =?us-ascii?Q?/qgNCF7eMrRz+68pfxXX6TKwNdaaebFw9Cs+iLt5poe23cG3KKe8KEOImtUf?=
 =?us-ascii?Q?cyanr2ZlgFDdC5fz/EogbFuCGMoVR2xWKv/shSEQXgFFppW34uWEqFw40M7D?=
 =?us-ascii?Q?inppNagld+TucJkYX614liSLKHHei7ppiUXK7EYOkkV/Nr5cEsCkBjnVepX4?=
 =?us-ascii?Q?e6hWblsCaj0E06YYeDs92/+7TWYr+qXDasIhoCEfcxcNCnKpb7sh8l8Icljl?=
 =?us-ascii?Q?vxja+JLPkd1hGHzXaB3nm6M3i2UVk+TzjgoyhzNfq2E6Hf77U3ndPegmiyVG?=
 =?us-ascii?Q?wrWaN3/mIu+M9BsHeAiZS2hzxnuvmzKBwXIksseg+efeFf7W1nPK61FR6mI2?=
 =?us-ascii?Q?WoRjD8u3126W9FZr5RcMuP275QSPsVcN4uDLavibsprEmAUtg9bCkJnVvwrh?=
 =?us-ascii?Q?p+f7TlTHuZ+hyHDLCBXeh53I62Th3AvhbSF+8vF6Mff/IlPGNQiV0/CkOBc4?=
 =?us-ascii?Q?5xLAGPu3CMS2w7P4cOU4q+XsQ3WpqK13G79oDfvXuHJhBNgM9+28dWrekn3M?=
 =?us-ascii?Q?rIRb4XVV/RxLAe05wZtbsY7Wd65Btz8UUUgFqDEYeBeOUkM/g/uSf0a6hmsh?=
 =?us-ascii?Q?DcV/6VdBt2LRFKUqHgKIGn1pMNzsO7DM5WAmns6UNDZuBc3v44nbQzjvVPS6?=
 =?us-ascii?Q?IjRtRUG1m08PL/aj2rCUTC+NuyVX1OVa6GY6AvM7VuHOsRkFgZqoczNMb9JN?=
 =?us-ascii?Q?+c+0nOwHICMb6b5rQmHNtAS3S1y6GZXfMXPulz/eJtfbRct35pGnrVB8bL8i?=
 =?us-ascii?Q?p7Bo61/wcy6T8syotEgurkWBKmdmx6HwbPZnfYukNM5MBq8GyHYN7d7N1n7N?=
 =?us-ascii?Q?exQVjmdWv1Tg9IsWlgs9WCEte+W2ZP1ZiCt38wDThlrJ1eMSUPTEgvX6QauA?=
 =?us-ascii?Q?1c9P1MH5kCwC2ENu3eKW3dVBXeip1w82Rp4uXQorwNBdaul7wgccI/HbjaQA?=
 =?us-ascii?Q?QRHwgHvoMqEIgrG7OC+WTVputEiXeXjL/NxJQdeD5kKGPlV4N8QyPEFcwaBT?=
 =?us-ascii?Q?jrIwY/ZH8dsDI00z8mSSF2G71jUDR5Z/OWaXDe4/N0zU1wV7x/ZGjfHGgzPH?=
 =?us-ascii?Q?hdcKMJ6LMC/TKS5o3l/LVe/9mX4qfUIy0O9M7HSADzDW0/ofaNmJJQ2s7QQ4?=
 =?us-ascii?Q?Zlvu5JfL3uhIcSbpk/s=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: f4938f2a-fa16-4314-7415-08d9e17a059f
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:47:38.4120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNOyMXNvocaHkpBsRysEjWFb9wK0Q7/A2fZso4PFbf+/0Ivd4nSeUgh33b6618Wc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1148
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::720
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::720;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 contact@canokeys.org
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
2.34.1


