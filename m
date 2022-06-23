Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C27557E24
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:49:17 +0200 (CEST)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4O8x-0003Yv-Pi
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o4O7L-0001r7-FJ
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:47:35 -0400
Received: from mail-os0jpn01on20713.outbound.protection.outlook.com
 ([2a01:111:f403:700c::713]:65413
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o4O7J-0002a4-7T
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:47:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mggMb00s8/zc8rM7oIyfF++cSM+ZOpNo5wbio6qgjqt4kPrFkBuQT1MXqC6GF85SWoV3rlVKDXuYcoN0LSyLbh5ciL4BqZ+4whh7HHQCGBNbEfgtxjVE0DW/euDP/yStcl8388h9MjtWqqNFAeREInt14kFKZ/uGP1Eh/gxpaSWLZBYbcM9tFyYoxwqJ4a4XoNEufiJAOvGGxMDATnNmmxnw8HIAVxwQmu/KAcI/WnofYEAe5/B+uOU06YtDf090qBUpCzTBiFShLRXCfbcHzBTXasedH45zXc6m+7U6YmiMXd5ED++0knr08jJISSx4Yg3dFFnrltiBQffjNLCgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGBTS8JqMMKnVBfGCk4mekjRqZdTpw8GV8tbw19TlSs=;
 b=ejq+7M1XRcVKU8GCH9lv05+BZP3mFVvwohcl5t/13djap05pX+c/Syd+X7NqUX9gfa7NvlUoH6LhDafs85aaV/cNd7aPdW85/KwYSKeNaRG3cKifOB8snmQccv6Wvt8HWCZtdscsiv5YxmITXct+NqIiQDQ4OSpUFC0tqTkZ1OBozEhZDFZe1Lww9mDvdEw3VTkTh0ftA9O7DjDIycTCuf79CYpitvvkMdSHvepicU0dcFXGTDCRlJKTEeC0UysiZABB524DCeHnxkQI6dx3rWwOaJJ1AhvtWYkTWxOgPuDmQkcFYQQVuc4MinXCnO+jPCB+tPok1M2WkRP+jX1YHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGBTS8JqMMKnVBfGCk4mekjRqZdTpw8GV8tbw19TlSs=;
 b=HY37sFfgaHS/x0HgJzF3Fyud8D14V8XO+uItB+Eu37eqcns/jrmO8qYXTmvYrbN3psT5kMHdHrYolS3dqqREJaqh8WhPtBihybC0CMSJ6xrWFbx6ceLqFSAX6D/Lqp0bmMGUPHENICcoQMZYMHBanN1r4Z4LmgwmH1xTQZQhUZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:17a::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14; Thu, 23 Jun 2022 14:42:25 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 14:42:25 +0000
Date: Thu, 23 Jun 2022 22:42:18 +0800
From: Hongren Zheng <i@zenithal.me>
To: MkfsSion <mkfssion@mkfssion.com>
Cc: qemu-devel@nongnu.org, "Canokeys.org" <contact@canokeys.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] hw: canokey: Don't run the device in high-speed
Message-ID: <YrR7ypzCzn+yN4CQ@Sun>
References: <20220623135843.236803-1-mkfssion@mkfssion.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623135843.236803-1-mkfssion@mkfssion.com>
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb4d43f7-7854-4fa8-c7c7-08da552696dc
X-MS-TrafficTypeDiagnostic: OS3P286MB1495:EE_
X-Microsoft-Antispam-PRVS: <OS3P286MB14953C8587F256911591B6F1BCB59@OS3P286MB1495.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6OlginW3eDcsfwN20rpZ+RHotOQR+OSeHaTYyOV2iPUuedhdPou/Jmeij7EajzPHsbbt9SP7PNhPSijmQCKDMfnOMyPsy+zaw02kXQNRS3fST/d/s++fvUyLngRw6hkGVQ/A1Hb6jj8NEhcz0sPwqnmU85Dk1ShGsM2JSS3DIqnJmwbd7cQZgXrzFs9xFiy7KgqI8ceQhtowRe3pMGQZSKKG/HKxS/4YycvQhQNSsDm0XBXZKXd8CSw2zgcdXx4La1o+3PM/b7XYAtEHkcCWIJviOoY0siePTR1BJ8rn4JkxJXxfQCHLMyagrGr5M0YA8XPp0MAyasXhDVNddVK9XkurzYMHu8Y2MSt+SkWy/xVAM1C4Dc6aGB0OgBuaX/0jnGB8BGFPpgA2bEYf+UgcolTmuulHDZC73NcAE1xv7nZTwSNKNICRo4+d2LNZhoCj9hCWpLGozplFmJdBzBmsRUzz8o+/rYzyC2ntEWbqPYSZdPqF8WbZEDQAtXNiOF8no3QG18RjqZe+g9oj+dF5lA8jou0iXAtNYm+oqi/bz/2ybsVm0G0wsO4PmkKmesEmnsRSMjX2ijoWTt/+iEGyUjI/DY3onTJEiyZsvlGNM1cDDCWaf05RcwfDVctlRMjcFbM2m1n3T/i9anOyuXFxYRMH36MZb5cB2nJGfoyVLlpwkqRwnitQVQp0aG2toe0AgDnzvn63V8mzI0UklbFFeHtCAsd3MImwFXJePexd24MLX2TP3RHOt/sKzzgFjTADvnRpChzxPqzhoExIWoTe1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(346002)(376002)(366004)(396003)(39830400003)(4326008)(66556008)(186003)(478600001)(786003)(6916009)(41300700001)(38100700002)(41320700001)(54906003)(8676002)(66946007)(6666004)(316002)(83380400001)(33716001)(66476007)(52116002)(8936002)(86362001)(6506007)(6512007)(9686003)(5660300002)(6486002)(2906002)(49092004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DyVal/xUGi5HLYc8BlOLgZqvZjdFWuE9qlcp3eGE0ld8znU8/juL/qLR3dv3?=
 =?us-ascii?Q?PwplI7PkdBieFcXlGVXAJNx2UaopC3aMRaBNdQdMiKol2TF6bK/VgUBXl0VN?=
 =?us-ascii?Q?Rg1944XMfknujXVOxGCkFriVdZv4vsvr075VEgBiBdiQw+wqZbu/swy3aDn/?=
 =?us-ascii?Q?0wvMYr7sE0Iis5eDHm/sOXwJ+//UA3XrERbAU763icAP6z3neEWKhQsB50rr?=
 =?us-ascii?Q?tv1n0MMlClZ9xypGI71lBihDrwkWWgFlhM3F6pBwz3taLiKEt1BqJi7gvb4J?=
 =?us-ascii?Q?8nkentTDnFNL3XcbySW7sv6NrPzhVldCuslecNO428pm70NaeZ0qq+AO+kRd?=
 =?us-ascii?Q?nCWK5D0zd5CALvPPAB8IpW14bzGpgwrHFyIt4GQGq6RjUj416Pw4AkTyst/b?=
 =?us-ascii?Q?dUfoLJ5JxFAroNSQqM3/bLosDhVDVW3K5f28s0Qb8Kl50dc8pcWgfpWC3WES?=
 =?us-ascii?Q?zUBaW7aVwErpGLqxYm9k3zCR52TVWWj1o4PiaeQ+kaoqBWjLnzBlkyfPeqGK?=
 =?us-ascii?Q?Xnr5BuNrE8KzMrfZ2SCMxRiCCioOlx2zc8IjOqqpOECin4XLHjEFBe+XSX8d?=
 =?us-ascii?Q?Dkrz6o2NsVs9KT0AFwi9j5CN7WID4twQJXhRpfBCiQdzkjfHj6hACBKeVely?=
 =?us-ascii?Q?XggMT3T5mnREC6YKBsg5huyS9e7/SyEen4TB09fC31gpUXzC0wqqbpyNwlZ1?=
 =?us-ascii?Q?VPfosrqxmqcdbZzxykzq4R1/4UJz7p8PoccvzLLATpuPAAbvK4ynJLsPlrrs?=
 =?us-ascii?Q?bU/1FZILIJbwSVv1FXBYlNeh2BPU3QwHvMl2kmZvrjrADvTtqveuq2pcepVJ?=
 =?us-ascii?Q?grRE1zWefo8pzcJ4KVikKOKy25f97XceMJaGCOdaMZGucFKSnsoI2SvG5Vhe?=
 =?us-ascii?Q?lTAgIpLQvUVJbYy6Sj3bSNfYwslXfZf6sRZHfeZzEe4gnu24VXxrbF8YyX3h?=
 =?us-ascii?Q?zKozEMPi2Ev+hCv/TF7oO8t91f3RYe5r7O3BXI+qL4Z5Y6v3EV4kN1K3Vb/0?=
 =?us-ascii?Q?sCnesP0yEdmqYD9X/BLmvrQ3RwgFcGv5xQP9diBMs1hZ/1NZNtjjda9Ijink?=
 =?us-ascii?Q?AaIZ6FookOi3kvI8tvA3fdm5EcCqemGHivriF+du9wSsS3HDxC8TdrxvpOcX?=
 =?us-ascii?Q?OaTH6I6k5pRfwLnjDW+5eMZBman239B4X2/d06UH56CiyGyBPo0ZI7b7Y6Nm?=
 =?us-ascii?Q?w09tVsGvJT/54gUG1oR1X2DgznYsQ5bX3ELwdF8SPkX8gRtCLyVvmBXxhVEj?=
 =?us-ascii?Q?VEPYfvRDlpyi8Foy7LnisiRBcYIWN+ImBR4fnZOZMxP8LiZZYKFOV8MAkqCh?=
 =?us-ascii?Q?BYcrO7PMaVUQqL/nKKD5iEvjgzSZbc1UU1vMz1smR0ibx+5X2dmP1rfle/T7?=
 =?us-ascii?Q?e7IUbGpLGWVYLVmCqoNBXlVY+WAcOX3QZaNvbpYvOhlrHExyennBtIqCRZVu?=
 =?us-ascii?Q?EC1nnFqpUsBLbjNYHojV3HE2/DRpGTg/bOxAz7ZqL7ThZDLWQOW5Gptvwpd6?=
 =?us-ascii?Q?/Iud6aVXtE7/9ewWbjj05H+w4qhrVCRRdQ7tpMpwONo/O3XrGq9DtlnuJmD7?=
 =?us-ascii?Q?DRiq3S5T5kNHU51tW/j1FDUPd90MGwQwjKPGRk+dFtFf9lMifACRsK45AG/1?=
 =?us-ascii?Q?+90m+Wct29RJVlTrE2Xo6CqS7dpBC57FlOvEIVvjNvMnJTCzjp90208zuHz4?=
 =?us-ascii?Q?C0sG5l3p7qX/saLQoIYSvD1czq5kVSDyIuXkQ1jN8+9be/IITYdMXFa2krIj?=
 =?us-ascii?Q?G70cw9Ez5g=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4d43f7-7854-4fa8-c7c7-08da552696dc
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:42:25.6547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7s2wMe9FTkff/hCtOzcFpQVTBDIkMMHRkU14T1DG73ISzlF1QjexbGyPuOIWYp5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1495
Received-SPF: pass client-ip=2a01:111:f403:700c::713;
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

On Thu, Jun 23, 2022 at 09:58:43PM +0800, MkfsSion wrote:
> * Canokey core currently using 16 bytes as maximum packet size for
> * EP, but to run the device in full-speed a 64 bytes maximum size is
> * required according to USB 2.0 specification. Since we don't acutally
> * need to run the device in high-speed, simply don't assign high member
> * in USBDesc.

Hi, the commit message body should not be prefixed with `* '.

And the commit message header could be more formal like
`Remove HS support as not compliant to the spec'

I actually discussed this bug with mkfssion in private conversation,
To provide more information about the bug for the mailing list,
let me give a reproducible scenario:

When canokey-qemu is used with xhci, xhci would drive canokey
in high speed mode, since the bcdUSB in canokey-core is 2.1,
yet canokey-core set bMaxPacketSize0 to be 16, this is out
of the spec as the spec said that ``The allowable maximum
control transfer data payload sizes...for high-speed devices,
it is 64 bytes''.

In this case, usb device validation in Windows 10 LTSC 2021
as the guest would fail. It would complain
USB\DEVICE_DESCRIPTOR_VALIDATION_FAILURE.

Note that bcdUSB only identifies the spec version the device
complies, but it has no indication of its speed. So it is
allowed for the device to run in FS but comply the 2.1 spec.

To solve the issue we decided to just drop the high
speed support. This only affects usb-ehci as usb-ehci would
complain speed mismatch when FS device is attached to a HS port.
That's why the .high member was initialized in the first place.
Meanwhile, xhci is not affected as it works well with FS device.
Since everyone is now using xhci, it does no harm to most users.

mkfssion could include the example above in his/her
commit message to provide more context on this patch.

Also I suggest adding the ehci limitation to the doc
in a separate patch to form a patch set.

> 
> Suggested-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> Signed-off-by: YuanYang Meng <mkfssion@mkfssion.com>
> ---
>  hw/usb/canokey.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
> index 4a08b1cbd7..6a7ab965a5 100644
> --- a/hw/usb/canokey.c
> +++ b/hw/usb/canokey.c
> @@ -56,7 +56,6 @@ static const USBDesc desc_canokey = {
>          .iSerialNumber     = STR_SERIALNUMBER,
>      },
>      .full = &desc_device_canokey,
> -    .high = &desc_device_canokey,
>      .str  = desc_strings,
>  };
>  
> -- 
> 2.36.1
> 

