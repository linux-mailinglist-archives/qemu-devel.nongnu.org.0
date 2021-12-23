Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13047E916
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:31:07 +0100 (CET)
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vg2-0004mf-IS
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:31:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0Ryf-0008La-Mt
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:34:05 -0500
Received: from [2a01:111:f403:7010::712] (port=3645
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0Rye-00007D-3o
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:34:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCrlboEX+Ujx2BMTvApxDsAifbQpxnQGD+qK4drYIXIb0fLTpslUS8eXmgo/e8tjlk0ixd63GVEJ3X6JBeY7evo+6ktLLIfD1p8Wxu7hw/epcfa4ia6BytWgrTw4Bb8m/RBq8xTYdZl36fD6ssBy7mczVAiwEKzKaAb7IkQvW8MXvQ+/6CqPdy6Mw1jtV6LbUOY+PeZ292+DF6jaPTqq5fYTgoa04PXnoXS60Pxh2S5cv9AMe1fRlPbnpG3mQj3dggQNzZVQnSzjJYn7KM6oBuwhye5Wrw8BH5Q27qZ8UpXnZ5byvSkqb2qeXKgtA0C/woVjbGxI8tUGazv0mVTVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DygfLQGbhJqR521wVBiYcebCE4eZlY6ki3r8O2Z2u1A=;
 b=Z1c4o9+XfaK+erJ+Vi5Iz3Q7nIGmOU6lTAY/PNPVAdj1ZOYdwqZ1AjaGu29uUl5RyVXglvIFuzDQfbw2zObMDfs4W34xK5KW+hA14NdVXM9kUg++6f+GeUyvnkEj7LecLaZrjh4wzpiidNprCtVOLSp00SWx2NRs8lyYSNoGXEtHFD+uAKvCc1YbKjKFMv9JZJQXeZXZTpi/1fTvMBCD1KnkSBh20My8Jw8djSphG0yXxxQFTwehAaNeKULhxin68yLlEkBnRkkE2/oto/jJuNEBGPEFE6RfqxeyYR8e05jdgmX5MG53fUGee0aOW5w8YQAnL/f7T/BA2FqmmJQDaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DygfLQGbhJqR521wVBiYcebCE4eZlY6ki3r8O2Z2u1A=;
 b=QBRS8A3ZUwPSlvEbIUMFbszKkp/jyJRBQnEUQhQRh+scveSH12733s+r78ykhszU2JZ/fackY4JP6AjjjSA25NeqkaHuuEDO2GxyZjpJqyYMWJSdpQEthpUvPJrEnwpW1fGDqYi2ftbq47PDdTTcju6MlPOf/T94TslxNIiqWnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0032.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.18; Thu, 23 Dec 2021 17:17:59 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4823.021; Thu, 23 Dec 2021
 17:17:59 +0000
Date: Fri, 24 Dec 2021 01:17:57 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] docs/qdev-device-use: Add CanoKey to QDEV devices examples
Message-ID: <YcSvRf+YjukL8Mlp@Sun>
References: <YcSt+qozrl+J8ool@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcSt+qozrl+J8ool@Sun>
X-Operating-System: Linux Sun 5.10.81
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2PR03CA0065.apcprd03.prod.outlook.com
 (2603:1096:202:17::35) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f1a2122-19d5-4d09-4c69-08d9c6382b49
X-MS-TrafficTypeDiagnostic: TYBP286MB0032:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB003252A3985B2015EF52E587BC7E9@TYBP286MB0032.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CF1SBdDARZFL9ok1NsOE9s33J5AaLlyaxOqs7ldNdQastpJjPcHAqWDMS7Ym+WrBQ/YmBNwy3atdLxnMxAvHHz8DLcMlAuao0d2EBakqY8jfbj1Qt8Wuxx4AYy3sMK/75d1kRfWfQXZJyM3BrUVgeqmxxS40U/YnSU+vl10P7QT/ZD6u7RVSdQyxZ5w166R1K8gQH8zcU80PBpA8fZVuLqPYg1ireXQMzZUs742gu0Ssi2bV6Idy40xYNCHyfR+CoQijZG5iu2fDqAMoVLR+ka6+s7Vdz3AKSJV6ZvH7T+Cjm3uwkxr1mCnRGQVk/vmM5zM+xe01gCfzUQmsems9rrI3uKH7pVQzVae6NrSJvYmsSuCewBuoZW/6z4WkmWgrV7EtDA4l3Jn1Otequn0FtxsEEotLWeW8f7zfL3S/i/d9ngZlj2jTqMxNlCwTiFNqV224ik0sHhct9Jj9GImBFxEZnfuPZRddcUdxy7jk02m1ScD8R8re7Zt+9J8JL0pMTESJoqb23hPK7B55GEMsopfTSrQP3cXOP2FwkXXnDTtMLWgNwvkQWOkYIETJupSUY/s5W9DAfQTC6gIYw2nFL2KuM93RP1LOfzk+C0XD5UfZMvH3UEUQZV8XgcyDA8v8lhXfF9b9aYZG8xbZSUICYFvovox1XfZBNmmKpu1WychaXK9iomlDQawhVhQQOnHgy3muA7KDtpz+STEefh2Y6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(366004)(346002)(186003)(4744005)(4326008)(6512007)(9686003)(6486002)(52116002)(38100700002)(508600001)(5660300002)(6506007)(6916009)(66476007)(786003)(8676002)(2906002)(8936002)(66946007)(66556008)(316002)(86362001)(33716001)(49092004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kMuoD+HTxfYIlWh3i+etgFn3FVuC2Fcls1eaSStoHK1Rh7OplJsygrKYwq/N?=
 =?us-ascii?Q?1jHY6MNVrbntfHSyU5Kh3oTrvkexXg6dEvZKoELrvcoAGIXGEHX2Q7Q+lO5/?=
 =?us-ascii?Q?I4uhT0MOjZdSOZttqO5QoHKKizjNypU0HBo2Lk4DC3Gy0IRyJ5kihEMrzGID?=
 =?us-ascii?Q?L+oCtZ+sNDND0zXuxfbBLcCBe/DnB9njaoJ/bclQ57pPEWmD1NA3tg4rVqIx?=
 =?us-ascii?Q?g9UrYST887lFax+RXdbc2aNPzw62bjtz6Iu9QJ5Mb8E1dJAZtJ3Q7PCWL/rA?=
 =?us-ascii?Q?NJvn4UZs8Gvpk9gLXS6abHtYCgiAaL1c0srE1algQhhCBEuHb40ZkNXi3Vjf?=
 =?us-ascii?Q?MqNY9jXvl8R00WypeWUJtt1NFsYvFyXZbTzAE+QzcSlsV1U7YUKg3gPhX352?=
 =?us-ascii?Q?S6Cfz6/6bNHGvbsAHAt4eK2s2gOhywLS85DD5OZuCleO36z1/jV+MroZVdW+?=
 =?us-ascii?Q?hxLXgt+2qpRDKgWNWo1ELQ9qRhaKffQ8kX4VIyvaiJf5w/wIDqqW6ndy2jew?=
 =?us-ascii?Q?2ZuNkXy/DoEn5s/ja54R1uGWk3hYtgWY50T0aExtwp9bbkm39XrhYHLK3lgd?=
 =?us-ascii?Q?Rg3zCcPvYXx3qWWvay0AW2JCMuwo3EeH8VrcSLVWsjgT0SspzpfwjNyp7vE7?=
 =?us-ascii?Q?s5p1SIFETLS1S/xvKahQSqhG15tRHn6WrYzvekw7Q7Ipa43dUsLbwN0CVnI4?=
 =?us-ascii?Q?uT4cscr5V/eEuon/LPbG1G1QvZDcNmjquwg5ihkGatyAL1mj3+UnEVyz+L2E?=
 =?us-ascii?Q?ulOUsDlnjE3hLW/lRS7tUJAz6ctkcdTjsJF+gdtKx3NZF2HuLHjkFsXm+WpB?=
 =?us-ascii?Q?q4yksRdg3l1IPs+x1Cf6+XrL6TKJ2LqK49wWH4Jx5ye1da4ZggMdCfY0RQbk?=
 =?us-ascii?Q?NlNybPquBVeioc1rhP4RBEz8AVZdvZvx3USuQC9EnI/eYCb8PBn8TB1vQ6UL?=
 =?us-ascii?Q?XjdwtRUbZWeU0tk+IlB71EfQ+/cBEouttdY52HrnWs6Wzzf2L/IFA7eeNza+?=
 =?us-ascii?Q?LOi9E1kKgaHz6DgRtLrjv8esTh1VValE7gyDgUlDnRT1G/xbD1xqqP/AYKV3?=
 =?us-ascii?Q?B088IyqszQHqu3b/IeR/EUk1DRPRAu+Ej1gC61peAQCZ3d5kWLFxapyAvFOn?=
 =?us-ascii?Q?TmhFY5RxXmmd0mAPpW9yZ2Ytv2MOBZUw7CYoRiObyDlR+gVrbQz1sOzwT9fW?=
 =?us-ascii?Q?OAuup9B1c1XKEqZvD+kCMtku7GMV+Y7spz7Knf+7M9RBHBopSDGjkno7oi2r?=
 =?us-ascii?Q?Eci0lnHUbDJGbjBUsoV2AJBrKWFbs3X8BRpCD9RtCZ6wCfD5OWWVRFKLD2eA?=
 =?us-ascii?Q?K0OJYU9PyvlfS9j7L5qO3+HnNG3G0FH4hKiwoGGVOI2Hyp6ibiiCim4rOJYu?=
 =?us-ascii?Q?3Ts1mPRnbne+3krMAB50PS86a8lAg4+FdqnHim50e4yCmsARPypsh9eR+jvr?=
 =?us-ascii?Q?DigZ6Fj+cmlQ5xHCpWfZGHlKUXLUlNq08AAV/NCOHjDLQswGUz0fDBA0ShEg?=
 =?us-ascii?Q?IUcYjN9xoOfEYqFKOEYIosMBEQg2Rn31tK1IDB74rNeQf1ncGYxAqFZzdBsR?=
 =?us-ascii?Q?E3+XfAfwx48MxzM6oyv5wMqoIhJESDbR5zKB0x15?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1a2122-19d5-4d09-4c69-08d9c6382b49
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:17:59.8046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PR1ocZsI+1MzN2U/EE7BwPQ7E95bkwCgJhPBTEtcE8SRk6H5Cm8nqZQ+JWsXyEGp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0032
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::712
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::712;
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
 docs/qdev-device-use.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
index 2408889334..278fb66c0a 100644
--- a/docs/qdev-device-use.txt
+++ b/docs/qdev-device-use.txt
@@ -342,6 +342,7 @@ The new way is -device DEVNAME,DEV-OPTS...  Details depend on DRIVER:
 * tablet          -device usb-tablet
 * wacom-tablet    -device usb-wacom-tablet
 * u2f             -device u2f-{emulated,passthru}
+* canokey         -device canokey
 * braille         See "Character Devices"
 
 Until v2.12.0, we additionally had
-- 
2.34.0

