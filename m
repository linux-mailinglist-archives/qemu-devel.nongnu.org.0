Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6335C559E68
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:19:11 +0200 (CEST)
Received: from localhost ([::1]:35178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4m1V-0006gR-Rq
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o4lym-00055R-TQ
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:16:20 -0400
Received: from mail-os0jpn01on20711.outbound.protection.outlook.com
 ([2a01:111:f403:700c::711]:1215
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o4lyk-0006FS-Pw
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:16:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eldKReIRIW4KJyWh1TFSYEOhN2/Dn1vgcidz8bRbw7jtVDpy8V8bAVafc5DE+EfSPG1kFOrGhOzyXmxjo7W4B8uKTC2+WWfkdBdW4WsrYUiybwv0bo3IKYVnIeZVkhEv40QWj34244nrNdPW6pTpnZCz9wwrDHg8gw7iPIeKgZQ/ThJm/HX0UpJXOVkg1kE5U5zjbuNvmpQF6UAVxgPYWDWQyANB9sSGnHO9r56P/bdMCHKWHrnqMT8S8Cu3oouUZWICsAKA7sZrWV7tl/M/xAjxM5Ov2eyh1UgH2OWyFXe459poHvjFw7xTYauPfYZFuC/SZLiN+9/sdCDwnBUn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7K+jkRbQfxZIuSj9Ivm5AGrQQRSDrytx/VapNBKfAI=;
 b=Crz2l9Zv2NC+EobGhIeo3JQFwRZ6orQE9PHe4XwYnl7+fiztVZHUn/M7c1LQPPd0NAC1S+NFyj0dZfRwsrwa0tQOoSElChZlGJ+NZgVsG9bUh/w4uEsgv7yiBb0NznrsnZVemW230oX56M2KMiGt0CTr1jqpAB0fNqO4yOPXypVP7lTFXwAvWkiYYONQeroXYkRjoEe3VnUDQbo/22PrgfKqPYavfxB+oMjC1+Eaf2831Cw0fESbSysSvuBUEPkyFHiaTRQJgYPftEz337b+JxcQ8g5IXppp4AC9qOwKJ8wK63gcxA4R36DgWDzWivpzM0ltwxqb9P4O/aFukUNXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7K+jkRbQfxZIuSj9Ivm5AGrQQRSDrytx/VapNBKfAI=;
 b=Tg/ESLNb8I5x+vpZK0MxUoWnDCGtroocc8jvPfEm2S+N4mKfWTQca+2tRh+4hkS6hOV4k7pElT6SuRBmmfRJBwll43UZn0HU8muBeonRej/hfYW47l5datla9lk7bATO2HQTyjKlaZ/r9Oaa4XJd9xDc34mKUvr/qb73WJkdUbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYCP286MB2733.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:244::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Fri, 24 Jun 2022 16:11:12 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5373.017; Fri, 24 Jun 2022
 16:11:12 +0000
Date: Sat, 25 Jun 2022 00:11:05 +0800
From: Hongren Zheng <i@zenithal.me>
To: MkfsSion <mkfssion@mkfssion.com>
Cc: qemu-devel@nongnu.org, "Canokeys.org" <contact@canokeys.org>
Subject: Re: [PATCH v3 2/2] docs/system/devices/canokey: Document limitations
 on usb-ehci
Message-ID: <YrXiGXY8lo3zpVZ6@Sun>
References: <20220624152940.11756-1-mkfssion@mkfssion.com>
 <20220624152940.11756-2-mkfssion@mkfssion.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624152940.11756-2-mkfssion@mkfssion.com>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c54ff690-5aa7-4872-6f38-08da55fc2812
X-MS-TrafficTypeDiagnostic: TYCP286MB2733:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y44G/GHwxQrXpT7AUNHUugbppQCfg7ArWB6utqyXyewHg3C00DVeE8AwZc/GszlUzFjKsdHD8nj4KoaQdI0VyZkt//q0GHOSPz7b//4ckF5qz/W8ZyvkGHvEcF4L5XQvItBbGxvEZn6ukISIEJ1U0N9KQW0iFBx40sayMHVBYQpDAZEeqijIbbVK/6rYpka1ZI830q7GAvZc5rjjunxWd2CZxsBgHsrMsG5eiO32ZCa9TQ6mMkQqYMi6DoaCkM2v4atR7Qm+yR5nZyZjnIbtFqekIWvAg+Sd1Gsv5776+ReHpmED4mU/CxmsM7JvBxG6a5MKOQeuEhHmNErM+P8B7Ku0BT+c4A5ItJNVsyGf88j2f/YMLvHTBbXg1YNg6oldD8zuPRmb+mCNqAMadU/9qpqaFCD+NgPUEMqRRv0ij1b9YDruPSNGsFnqTc4HU1qYQTX/3ppKHr9JGt7vVkoaqJwH3lx3W2PjwYMXIOzdJY/sxEPLEYuiQDdyP28Anzqo2c7nlEwJNePMP8MCyLvxIW9W0/4FlbYlb7PeTHCwrS3/oj4+nu07/E/TqTi1gf1ivMeo83Q18Mqg632FEvwcdQi41EG2FjWILGxV9D+mzwBEX8Qjpai5tbRFTYIJFQ4beoeEzI0fN00sJ3xrf5f0oO3q0VYvpWZ7xW7H2+wRV13ki0V5pgxVn6IxyXWObLuIvhNOagGLWgDzaCFfl2xqbFgDWB1aQJHZwepg5uZyN5pvqUyEfhLgnGlbxUNobxDreHUr1fp4a/ddiU+UZhqK/hmTSf5CSSEUC52wwl3fy9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(376002)(396003)(366004)(39830400003)(136003)(186003)(2906002)(6916009)(316002)(41300700001)(786003)(478600001)(41320700001)(6666004)(38100700002)(6486002)(8936002)(5660300002)(9686003)(6506007)(66946007)(6512007)(52116002)(86362001)(33716001)(66476007)(4326008)(83380400001)(8676002)(66556008)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VY1SwY8SCHB56MSH1PWP/UPrmcJIzW+pvH6T2FEqD27NgJDEv8toXimquHPt?=
 =?us-ascii?Q?eUblVXMXERNP5Fkx6dnqM1cfl4wfoJC0PjtQDyu726IW3fapiP5Qm5w8aVpB?=
 =?us-ascii?Q?fBG91K9kYAFGrxZf87zTfAmOLR3CDOVo1B4/CeJGVOj7Ea/R9iEzhOwerGqL?=
 =?us-ascii?Q?riACaQpdwyhsWRLHAtRORJ51LwOL6q70adkukPBqU9rvClHdHdcEImsvpyaU?=
 =?us-ascii?Q?K42Pq4GxpGyyM1Al4ct1z7I/HHMR1UfhEX65tRhO6GZtXNTOzWS/pnuNmEXc?=
 =?us-ascii?Q?m79UkwXaHrEOcIEHQO+1UromplsJdY4OZeYvLZoLx8QqZQyZVYo+7npH0PAu?=
 =?us-ascii?Q?7qFkkp13J6jxmSP3AD8XGdcnr8bwSSgON7zPt4G48kl06m+RZxMcy7sLMS+E?=
 =?us-ascii?Q?SUxhlhlPRkaQ7sK08EUpSyG96lAKXGOTMYDFJ+RxI0xK21g6au09ImUb8m0S?=
 =?us-ascii?Q?BH7YmQcHmH48sU9YDcoZJUpaR3o/CbHMNdGNooziJgUqVZvgS5UMC/MqDqZa?=
 =?us-ascii?Q?XVf7004IC3Do+YCPJz+PRhJWsEuk5D1haGr1z0ttSTWxPHusmj3/oamQ/pvx?=
 =?us-ascii?Q?6oL+Y/0KVlNJCdRJIsjc1H/McG8h0qTUioLDnZJkVCEhtP1R00Jcl/hDJiOR?=
 =?us-ascii?Q?8E3TzmXRHXly9WnVe5852XNP5BOM1Uno6rO5xkY0zcEaVzcN9s1iiotgFJPH?=
 =?us-ascii?Q?LGhmnTQUvzWS2hI9JVbpcbiYFY7+kXdDMDPtunlbD0xujQZrfL6dCaLTm+Jl?=
 =?us-ascii?Q?lmDU1HK1xUiQ5VWkTYEy4tjHPn/BGUZSM5cpluM29X1yqTlTgvq3xkbgu0pC?=
 =?us-ascii?Q?PmilXH1RL1zkRFykdvONMso1kYdMliuOIzTO33PbkGPYmIvfk+PHW1Br46MB?=
 =?us-ascii?Q?wtAFN8uccFU0Zrxb1H0iGTrae3Cx7ySX5f3CbVZC+0lowLrS5zYBU0JUygUI?=
 =?us-ascii?Q?gwbgULmWsXu3jP5MB16oz9Anv3SrDokdQ5/9X4KA0TUyFz4/5OB+HKgg7PtN?=
 =?us-ascii?Q?fHvo9mbijHBG7deTkgLWJTaRCnplLWhZxyRoER7Rbf5+ia/hX2USdudsmn+e?=
 =?us-ascii?Q?aYpbiIUgtnf10a3rs59xQpUD/D3+y+LgKYILRKxgdU6bdqABX0XQnIpPBoOp?=
 =?us-ascii?Q?+XE8QcaBHqmmHW/8xoRG7tYtp8UGLDDYPFO27kQ4+clGlI3CWNuJ4lMkreAl?=
 =?us-ascii?Q?uV1NHQY9WaKz9WUFEcFX7icNzAnnXo7G82MYNhC/c7ztqGW47KFBnKf4e1CT?=
 =?us-ascii?Q?uTyHeWH8u1PhHDu6CjNSkg2Lu4iE+ZE49mrT42eGb52qbrpMGKYn+yaKkwxJ?=
 =?us-ascii?Q?ftPVEVdc7iQxfVwRsChIxsQ9bRcDmtV696/fjZGHYI0iD8pz5Q8nMSVGEjj0?=
 =?us-ascii?Q?0w0dJjladn6zx0EVstPt2nHparsdtWaBYG62424aQ9oUjQ7BMl1D/QCmc8EY?=
 =?us-ascii?Q?/in7eK8JE2xxgL6sHFWKGPsRh+BCz5F97lEFr0Dqm3pmY2TBlJxZbRJMUSgH?=
 =?us-ascii?Q?CHhU6Zza0+cDsAoYdecnaJKPdOZuyJ5g5VGoX5GS41M4TA2m7wJ3m3dZE2dj?=
 =?us-ascii?Q?dGRqdOTl0L+AtUm5KlO4j10A6/q+hIv29/2chVvJ?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: c54ff690-5aa7-4872-6f38-08da55fc2812
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 16:11:12.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BE5RArGxtYXPvD1ff5zP/+xqQOs9xVpToq40KVRdxRqJ5TGJ50B9TFBm6zAgcBcF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2733
Received-SPF: pass client-ip=2a01:111:f403:700c::711;
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

On Fri, Jun 24, 2022 at 11:29:40PM +0800, MkfsSion wrote:
>  
> -Another limitation is that this device is not compatible with ``qemu-xhci``,
> -in that this device would hang when there are FIDO2 packets (traffic on
> -interrupt endpoints). If you do not use FIDO2 then it works as intended,
> -but for full functionality you should use old uhci/ehci bus and attach canokey
> -to it, for example
> -
> -.. parsed-literal::
> -
> -   |qemu_system| -device piix3-usb-uhci,id=uhci -device canokey,bus=uhci.0

Hi, the fix for the limitation on qemu-xhci has not been landed and should not
be removed by this patch.

> +Another limitation is that this device is not compatible with ``usb-ehci``
> +since we removed high-speed mode support. When a full-speed device attach
> +to a high-speed port, ``usb-ehci`` would complain about speed mismatch.

I think we could rephrase the limitation here. Instead of saying "we
removed the high-speed mode", how about saying "this device only
provides the full-speed mode".

Also you should list the changes between two PATCH versions
below the --- line just after your commit message
so the mailing list can track what happened.

Regards,

Hongren

