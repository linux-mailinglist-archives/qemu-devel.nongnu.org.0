Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE854879D1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 16:43:15 +0100 (CET)
Received: from localhost ([::1]:44104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rOc-0006YE-Kp
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 10:43:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rKt-00036y-EX
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:39:23 -0500
Received: from [2a01:111:f403:700c::703] (port=49474
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rKs-0004WW-0A
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:39:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdVOGdeZametZREb+aSOb/Mw3uNw/GACdGGyjYsIdR5I759v9jjKbN2rpLO0wX95Ii1tkFgvPfM9z5BAtAOcMTjSEEnnRpymPKEZ5iAjQ6V/kehszlf9OvD9NGBnOEwX29JQb4yOZ3q40RtLN33ijTFmdPe3RIM/ki0xksb3mNcnlyqSBJWC4bSGmJrMub4B5YTnqglQBcxutPe2sUfZgRMpoKDQs2G+gwaDZ+zbQT8mJ3pWHWG5l8frwRbvqvWVHQ5bZ5xdb8ihvuYZyH1dPalNybNTMnrYIyPpKolQte0oBI0FZJZlH4Ykn7bMw4VF5FMGI380lH2OW+zKUYHyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHYfqJKXowcu1T3MUgbKFt1kOPH2jJojTosT1OAfeLA=;
 b=LNOkmPcnCPmk32bg117zf3YycVGuRewdcW8oPhIhpM/MgvEW6efAW1BN3sI/oEJRL0vj082ReR//nhqZjPH0Xtjn6wstI3KAhpXwsyEsjs+zZw42ua/tv5ZggLAaz3z6KjCyHyJyrW5UGdCN5GZFYoUXzJ59XvcgcBrGt9wAw4ZZUzjZ5nMY0kSXFMis12ZfUJvyOOjhxEuxHkdgduJRgF244NV+awqql4cICfJOh/pusi0+C5fAtYCs8wDNQ/BzpvBP928+Yn7h6yD4b/SOWMpmmbGhvVpQ5Jfm96mA1zYYfdTxVGfAvmz65D25OGxeA81vl55RBYeRquFR6nMCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHYfqJKXowcu1T3MUgbKFt1kOPH2jJojTosT1OAfeLA=;
 b=hbjubjBLjkyLdl+YyQZjHa2hvYmVYuFWXQi/9SUvQKi8JcRlXpX/9+2Dvzjzw9YQGRBNI/gFTVemM7kWVkTvEK4dGRZPLk5CQdeZ7xICK5IDuVhDIGXo1GN8Etsd4ca+9GBG7tBLdaA2w88TB3CGe6EEUyP4gV84vSkvI0f/rHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.10; Fri, 7 Jan 2022 15:38:43 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 15:38:43 +0000
Date: Fri, 7 Jan 2022 23:38:41 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] MAINTAINERS: add myself as CanoKey maintainer
Message-ID: <Ydhegb2DJ647ORit@Sun>
References: <Ydhc8cTsH0QNINT/@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydhc8cTsH0QNINT/@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK0PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::22) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 118298b9-2ae7-4bdb-43b3-08d9d1f3c978
X-MS-TrafficTypeDiagnostic: TYBP286MB0432:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB0432EB97EA603486593D2760BC4D9@TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:214;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qtYlkjmDHZhDQHAT3Hr4KsZFjo4+1/WLITnY9ZMN6rI8Akyh7aVqWNDLoWpd5Z7mPEVz9EI/eeVHUmnmCsu6VUg8Q+gUKg8AUtCCzFf89cIfOQvkdV26C6Z86Giaymtr/Ez7mfGHW+yFLiQ9zjCfOvsMV/KxNN4QgQPpy0nhwBXX7+XmKDLq9WXF6yXJtmTpPIFRasCUSCiRK6LSLypcMrFI8kpiAdKDfXDiX5EPp445kgEe1PlKH0xIJbgNhEMAyBiZ0G/bIbHJo+rHg257ifZtYcXdjKqXs0crsWFPfWBqVub1IKMSnS7KTULGznwgzyqnjjjcg/IRgUOKuyPbIYS7Z6vSXK0uoYFV3CSLP2dN50tyGzCUQ1b7R63JfoGUAkYmi5P/yNXTEEJw0WmHVRo4uZFAEYl5AHEpNruuLXz4UCYnm3P8DKB+0df+xYNIRvl2fHX8nqTW/C5GcVtApErUinuS2Tr9of/88tD8o2U3ia0wfXlln2Twbxf6iB+/znG2032vqIkuKojD9x+hKOUVi2SfPzpjVCSOPhYWQBqCYeGOnwPGfdv8ZJ3u0JeW+urESyjqFLDolR67jIiXtAO9vVqIBbj9lSx4hKg9o+enmGNSAhOZHQZdFMyb+2cSNJnMCa8jANzVypebd8nsehF5AnhVJLCN+cP2R0KduD0bCnys+5EXtlXPA5arMsGZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(346002)(366004)(4326008)(6916009)(66946007)(9686003)(33716001)(86362001)(2906002)(6486002)(54906003)(786003)(6512007)(316002)(5660300002)(38100700002)(4744005)(66476007)(66556008)(186003)(8936002)(52116002)(508600001)(8676002)(6506007)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+oET61xjfE2tdgfj3UceCjEUnmVnuKzYz1kRz/j8nXQmhaNytSVCUOwp8O8V?=
 =?us-ascii?Q?OCbvd+gDtHGC0S1XvALiR9VdApU2CA1BgW4hqOupeisuha60YlN2HWpbVGOT?=
 =?us-ascii?Q?623loSoD7g0cnPO9gB7G/EORLNSK0Kh8Vrs+VN+LEJVEXpcjNw0c6oJ90zjS?=
 =?us-ascii?Q?vbzNKAQao+uHD/XRjM8axD5w+HBfE0dgYPlGayYn/HH6lEYWFEA4yM9cL8Wn?=
 =?us-ascii?Q?85bSZI3qzTizqcKflErF4MgcsTO7wKsa/URnAFuT4350CTkz2ocrAgWyuVIS?=
 =?us-ascii?Q?R32jhdbeGcfBck+lYZJRX54O++VoJKUHIKOPRUfoeZWQhq02Ur7X8WEWiKcs?=
 =?us-ascii?Q?UOCzcATMuD7ZVSU9NUOpEjSyTsWo+TtPb+rDL1j0GRBSjrVEBygvEbIliHbk?=
 =?us-ascii?Q?LZJq/oXQwXji5A7DZ8EQdKUHksu5xzZs8UOroonsM+ozjaBVJIyPU5nNmZIN?=
 =?us-ascii?Q?/zRuhp9j/gSa2LXwdcWFMGljHZtMVWPfVx5SyVVWwWIfgps7nNsJGrpJsDev?=
 =?us-ascii?Q?F026m/4L9pITV8eJRtGZKgEleCe8iWzf2XCOrlpBw43FduYz89vQmJlHnTrX?=
 =?us-ascii?Q?TGZ6c8c4RJWHozHXXr12SlLm9rH0zIAxn/kVjfNTy2R65Hng09WnP85DTJZs?=
 =?us-ascii?Q?bhE9l2DKH8payj3NIqCzS139+UaCEwo4HwcqWZ0y8OTg70o+Fs587VwlGBZM?=
 =?us-ascii?Q?C7cOTD4yKvfLAoUe8NzGScpDk5Kq2I+qhlLid4ScCVP9vLsK12pE7xIiK9Hd?=
 =?us-ascii?Q?ZHiRsOSwdzAHHoL/kiELD72VLiISglijG2A0ZgOJn4c2EmNDgUmRA5Mo6Y/g?=
 =?us-ascii?Q?sX01C17omHYQTEdlJNzNiRFBaINu7zicXRv1oD7TfVuk/SPsjhqVqv3oeANN?=
 =?us-ascii?Q?T4jLzEqqGrEgMHEkgiFwoqDBwArLHfyGx8XvBVJlLBVIjccJ4ho5jLLD0+ME?=
 =?us-ascii?Q?MmKu31AlB45ZDcANRktoe3kwED/1SGlrGMQeKhI65AxuBqvAoIoPTaAtmE+P?=
 =?us-ascii?Q?OtGwvL4nQ5nZrDEuxUAwyBVokvNAGMJcPxHZHTJpGofY9VEOdaMGKfTw9X/u?=
 =?us-ascii?Q?CeTN4qy7cYDM7pJHCUVx0Wyglav1cRDTDdO81kIGh+uuA3aUjsOkR/mtwN5l?=
 =?us-ascii?Q?zrIKHjvZ8d6SzCh2Jz4ONjNZkpIt+VkB5cRDXJblwNWIsrSeiAVnFmxHfP/y?=
 =?us-ascii?Q?ZJtcPD/QGDmT9ewu2h1vi5wYErX8LDGK4abadcf6OJvzmJ8LGn0P4YJZeFcr?=
 =?us-ascii?Q?mu2cBswt7OrvqQSrGe3NlcoB0BHhj/3NqPkEPETFzt6FeCm0JJoENBjiQ8+/?=
 =?us-ascii?Q?mcGARXmzurabcQgvLjQPP1178gZpmbbPCab9/7YjyGja9KNtgMRn/6CuFs1Y?=
 =?us-ascii?Q?aoGhelKzqzhzLVCdKghkf9YQJ5a2XG/z5h9KhNatpKTbYRJgW/WLSLk8Tn+C?=
 =?us-ascii?Q?l5Fo47qPHlgQfDYOknzKMOiMP5wTL/dmSJuPP/nN70KsSyvrCAOE4gXWNsso?=
 =?us-ascii?Q?N1rXTjQpnvxS7PoqmpsuhnWvp7DwzSC0nNgPS2cQ5OudsAyD/jxJacIXpDJr?=
 =?us-ascii?Q?HHaZ1IpqGr/inDoIHbn4kmdmMjPhS95PyxfGSDU5?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 118298b9-2ae7-4bdb-43b3-08d9d1f3c978
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 15:38:43.7764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUglJPxgF0WeXksJc4qnZ/RytFvk3cyQXUjRcmozcN78lyL3yZY6elctkH6r/6Qf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0432
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:700c::703
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:700c::703;
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
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f871d759fd..51dae611fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2296,6 +2296,14 @@ F: hw/timer/mips_gictimer.c
 F: include/hw/intc/mips_gic.h
 F: include/hw/timer/mips_gictimer.h
 
+CanoKey
+M: Hongren (Zenithal) Zheng <i@zenithal.me>
+S: Maintained
+R: Canokeys.org <contact@canokeys.org>
+F: hw/usb/canokey.c
+F: hw/usb/canokey.h
+F: docs/canokey.txt
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.34.0


