Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEAE4879CF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 16:40:45 +0100 (CET)
Received: from localhost ([::1]:39860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rMC-0003c8-Uv
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 10:40:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rK2-00027I-9M
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:38:30 -0500
Received: from [2a01:111:f403:700c::70f] (port=58254
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rK0-0004No-Hv
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:38:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sb92pbp9lWD6ShSilpS6qZiarLzkhrGtCjPm9ptGkqhf8HhlRSiZ+y8avNigelg11g5fB+d6GQdNG2kofiJC33b3fEhIVZ9UvGwGtzo6wPURAACysGPuEzR02vud/JBpj5E/JKgIZs7N6Eoft04AQJYwiU4STJiiEbclIBJfwtpegYi4tS/ySsH/WrHSd72Ozu8phbVdeB7eTfByYc8rkebHhzlXAK4KS9zdBmX+39SpHTYCvd6lrk+Qda5nJjdpMO3BhYKEIpmbOf819F1cSZdD5oYJsrl9Ou82X7W3ft6j35ri08P4U8nsdsrAKR7eQc9e3Ygbj1DJRM6cK280zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvbNrQbtFhWjowKjEDRWD70rqlP5OdYtkExHJT+FJso=;
 b=QsWjPZxyKfnJftJIj3PAO47WG8qTxB5EKd2UrwY9MbEiLsSprlMCpl/G8EHBeQKouLG8sp3HNE245ZoI4tYJHNcgX2NXWLg4Q3c4GGz4HJhdiyx7Ozak5IPA9C8mXSM1b97YAvxAJZgc730SIb2K2iPw0TTOUMpfjCxJY9SMKOxYRKbBMYgWs9+KwzgC0t8Y2vFHc4u9acWMhLS8mRDpUJB+kqbrbDh3R13sEpgWPvv4rpPXy/kwgqp6kGKPWa84lAZBME8FfqINQ+IBxvOxgOCGtZhDFED1Gf5qIghQwk180Hc+5ds8vYBpx1/Fjc9xRrnZLo8rhDF0/mhg5vk86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvbNrQbtFhWjowKjEDRWD70rqlP5OdYtkExHJT+FJso=;
 b=G1AXSGOailz0A2EPMcXg5c3poKOMljNJr6dmmanxHnLNXX6E9afAINxEXmetA5JCDNIGZqhOjnTfq0kRLkwPrA/ZSmEx+5tySMW5yKhNqcesp4MkXLwC3RzmYqdkUx9TsSmiS2lV10lf6Xstqg31eIRiNhDh+EVi8EanPdHJBmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.10; Fri, 7 Jan 2022 15:38:09 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 15:38:09 +0000
Date: Fri, 7 Jan 2022 23:38:07 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] docs/system/devices/usb: Add CanoKey to USB devices
 examples
Message-ID: <YdheX2m+SwgY+baV@Sun>
References: <Ydhc8cTsH0QNINT/@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydhc8cTsH0QNINT/@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2P15301CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::23) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c758e8bf-72bd-4d4b-5c7a-08d9d1f3b52a
X-MS-TrafficTypeDiagnostic: TYBP286MB0432:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB04324C4B2461A066BC523028BC4D9@TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c0WyBQoYBLiJc1EIr6iYXy9Y4i4uF3Wb0MelgJzKM1QzG3ITuULBaJCF1XCtqIKtj289xGNM1gBo3oWLW2ew1SNy8iKoWvk09WzgJjjojICLCjQlogXL2AWU+XVOELd8AK9lYLM7FgpdYDpQqpmU3pfa4lUxHfUuK1XOTOpxfFPpO+5Brv9+CS8T59rKDKo+D9W/4TTpYRCWlz6NOyGpqd8V7Xv/tMtFT0vBxE1lpWk4H1JooD34+dllTDi+qZx9rkn2Z78Y9NllxvAypq1U4bmaldoywxOpkSpXGnMCWzQRRfGCnt4zBFaK3rg4mdoufT4JUaTCEKIZympbK6xu8300bkWhugIEgRl0pbFnbp2z9izQmBUND3uIKZ4mteU9Oqa8LNWulVnHl5961xg3/7j/hLkrCJaaVsbk9R0GJiXEeLnqrLA+Yit+gCIfj0MXefKa5/gADE69wOSrKxXfQOeABB4g7fLfVbidmAZ8cyS3m7QOnTI6yWxQtCsZ7/oRpqRck9HX43mm7FwQxaPA7hs4IwagkbQ6SWk03vivuw+LZQ8v4A8zgh2P8oDhf9uWbjzRbOH/7uRFwErI82mqu8bTFU1rx8TPwBNa7OV0vJAt9rbOWyVTFAJulYiBG2un5S8EgnuWAOr8sFi7AavCA9G72B9ZP5bUpadDhU4aYvzMQ96b27ddfDfmZkBD+zbq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(346002)(366004)(4326008)(6916009)(66946007)(9686003)(33716001)(86362001)(2906002)(6486002)(54906003)(786003)(6512007)(316002)(5660300002)(38100700002)(4744005)(66476007)(66556008)(186003)(8936002)(52116002)(508600001)(8676002)(6506007)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GZZd7k43PH2zueNMwekaHJ9nwVqCUpWZY/Qi8WnZuY+/bR5gLWYxmvpD8km2?=
 =?us-ascii?Q?/RORSASICdV2NtU5mxYb6DxYVZVVYOh4eXez/wF4jnaN+37HFZKa/MEBzMOF?=
 =?us-ascii?Q?Yn8RtiAKOeQl24rvlxfTj+NpDFl68KrFANyqkFFwvyQ+VIcNO71oMvHznD02?=
 =?us-ascii?Q?HhmOEUALSMYQNvOCIYzyLQbudQ6PfkPfwzaLfzOQ0t1jl2JtCJxWK6qZXgvm?=
 =?us-ascii?Q?APXcpan85Zgfz2w5hInwUAZRfgAO66IWdb/b7KIxZdi9VcP0WkTizL5wZstI?=
 =?us-ascii?Q?2ps/Yy/+nADwR5ibeaceDLY7rSl+tlhLKm/O0dx56rtZ8Heq6R4vl4Y+D6hz?=
 =?us-ascii?Q?SAJG7bRGlTbOFYWHRHlxKKVeKhmD2PTOSXiqSO9izyelWWJj3ZP0XwZe10bz?=
 =?us-ascii?Q?8mU47hyynVZxzWMGoarop81nu/HbniK4sInTFc7dJEuFx2+oyRMYm/JixYAy?=
 =?us-ascii?Q?lNcio0pom93HNmAu0zBGWtgMLRVyZVKgMv3L2H1Z6JUsXuBDIxageHV1Y8i2?=
 =?us-ascii?Q?gkAR+PvuaIR1hHDd7NHNVJTY621De3sH259gvhAvPhG6JhFizA0O184QvA9w?=
 =?us-ascii?Q?/5vsC1X9vboiTOm7kWOvtde0BAgmlDnpZB4Im/z15+c1ip+trIi0pvsEemMF?=
 =?us-ascii?Q?Cv49LmYQNhcCj+ko25SoTtJ3SLE/y3vG+AhEMAtCaWN2UJJwpgFFFMhftS/d?=
 =?us-ascii?Q?qrwknmxm6z7PcdM1jjMjCp24k1Qokag++APvgZOQ6crpPgrd8BOwXH3SVcPU?=
 =?us-ascii?Q?xLlpeq/KqhBvP0FCYA3X2GNrMQK/4J3ybqTFD0sXO5+y+kPgoNyTo33lx8Yd?=
 =?us-ascii?Q?7j6zosm1AubFZTN/L8hAigZTuJhJ5PL8PZ4hlHXuwPuu+SqxDNDAHdNH6qTa?=
 =?us-ascii?Q?5nYS04eQ84YkWQG1jYEEavAXXNUZdnJMy4/uO6+F3ZDGoAP6P+LBfASY+93b?=
 =?us-ascii?Q?ayprq04EiBgbNw+GjU/z67uO5wUqesslrnWHb1l2lpxzOYJFEROso9P4qAkA?=
 =?us-ascii?Q?y8+LFoxkpu4JhBA+O50ZDnyP/tGaBs6STfhVmabxeeM/BOfO7d05q+DSEvo2?=
 =?us-ascii?Q?i9zxx4OtDnbOxOnm8uuoBlSQ51iDWujkVTkwz0TYz4d7KI4CjINBHNLFzATY?=
 =?us-ascii?Q?TlU+sHrgpUj7LLeM+F6W4v6oeXDt+EXYrN+Wdz3FvHhLOJSYFS+zBiCw/l5c?=
 =?us-ascii?Q?XDu1i+Ny6k6mImXtLbJ5EXhlGZ81K2WkwY7/2hHBIXngKYIqc7tHuQN8Xspi?=
 =?us-ascii?Q?gm1iUfBciMGb3s5lJKMzA/uU08F1SqHiiEWnXN1yyAExsU02njgYIkG3ZDhI?=
 =?us-ascii?Q?6gZ3V5TfIulSV/CKvK9ndoXnbmEKo0DUaOlxffPYJW2H5z9etqW2nJ1fQWsn?=
 =?us-ascii?Q?04Z5ALVqT8IwZhXmrmDjo9bkpJ3yLpGS9dg/WeJEIazk5/mB/WRvBRgutENl?=
 =?us-ascii?Q?ZNdWrqXWaVU/2Wc8ki5En2XcHu40NP4TpQfb07uxSVdUWEKDJcnrD5ZISvGS?=
 =?us-ascii?Q?W1GHPwaNIUeg7vSgy+FOo8Ze5PDYpbibDKLQJwDWrBKq7HJoYXuFFUZiocA8?=
 =?us-ascii?Q?E+eiOpx7Bwe4MdUDfxmoVGyT5H5Tk5reaqYesVoX?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: c758e8bf-72bd-4d4b-5c7a-08d9d1f3b52a
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 15:38:09.7126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vc7dyUkvbRi+PTFubWZcpULmpmkpPcUa14L7JQAO1lwxpWYpzIv6uAm8+RfKiaE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0432
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:700c::70f
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:700c::70f;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


