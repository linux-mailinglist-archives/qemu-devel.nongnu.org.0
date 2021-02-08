Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7322E313150
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 12:49:15 +0100 (CET)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l952Y-0001dF-Fy
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 06:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1l8zyW-0001cL-Gv
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:24:44 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1l8zyR-0005GW-LO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:24:44 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210208062406euoutp012e7cbc0303a5b675c3019c4bdb62b7a5~hsaDr_gOR0612006120euoutp01R
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 06:24:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210208062406euoutp012e7cbc0303a5b675c3019c4bdb62b7a5~hsaDr_gOR0612006120euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1612765446;
 bh=SOLgGv+Lp/hD1NABIu/zwuyp6INfW6qMVFfRZfmbi/k=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=rMTg6CmfVEqtVP5Jzftm0+gyGXt5IFEgYDWcQn58mUy9P2PNWzwFKl87+ASkXXbYi
 /oI6LDdxdjezi9LrAliVeVlYVuq1ZuIb1VB09yuBHG1eXFlBxrVVmm+rh7cZku2pBf
 loQezTm88HxKDFn6B7ye/POT+J20ESxasGGq42aI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210208062406eucas1p24186812451e3d40314931d9cdb677ede~hsaDjrKdR1085410854eucas1p2o;
 Mon,  8 Feb 2021 06:24:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 16.75.45488.609D0206; Mon,  8
 Feb 2021 06:24:06 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210208062405eucas1p133181f0542d42b721dc3987d1eaf98d0~hsaC5Rlf60841708417eucas1p1d;
 Mon,  8 Feb 2021 06:24:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210208062405eusmtrp2b74e111542c4c5011f74ed2be674d6f2~hsaC4pcHN2606826068eusmtrp22;
 Mon,  8 Feb 2021 06:24:05 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-80-6020d9067e0e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 70.54.21957.509D0206; Mon,  8
 Feb 2021 06:24:05 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210208062405eusmtip2ed784363b4507b7c4390d7aca42101ce~hsaCuULB72037220372eusmtip2W;
 Mon,  8 Feb 2021 06:24:05 +0000 (GMT)
Received: from apples.localdomain (106.210.248.22) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
 Mon, 8 Feb 2021 06:24:04 +0000
Date: Mon, 8 Feb 2021 07:24:02 +0100
From: Klaus Jensen <k.jensen@samsung.com>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH] hw/block/nvme: fix Close Zone
Message-ID: <YCDZAuNP/myhVQTA@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210208003256.9280-1-dmitry.fomichev@wdc.com>
X-Originating-IP: [106.210.248.22]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42LZduzneV22mwoJBg/7mC3WtnezWUw6dI3R
 YsnFVIt5t5QtHvx5zG5xvHcHiwObx6ZVnWweT65tZvJ4v+8qm0f7gW6mAJYoLpuU1JzMstQi
 fbsEroz2qSuYCzp4Ki4cP8zUwLiPs4uRk0NCwETiw4UbTF2MXBxCAisYJXpvz2SDcL4wSkw7
 tRoq85lR4sSLHiaYlm0/90AlljNKdB+8hlB1d0MDO4Szh1GiccVzZpAWFgEViYuP/oDZbAKa
 Etv//GfpYuTgEBHQlbjzwwAkzCywlFFi31ZtEFtYwEhi2e1uFhCbV8BQ4tGa81C2oMTJmU/A
 WpmBxqzfpQ9hSkss/8cBUsEpYCMxv/MPO8SdShJH5nWzQdi1EmuPnQG7TELgDIfEplu3GCES
 LhJz3j2AahCWeHV8C5QtI/F/53wmiIZuRom+D1+ZIZwZjBLTl31nA9ksIWAt0XcmB6LBUaLz
 yD8miDCfxI23ghBv8UlM2jadGSLMK9HRJgRRrSaxo2kr4wRG5VlIHpuF8NgshMcWMDKvYhRP
 LS3OTU8tNs5LLdcrTswtLs1L10vOz93ECEwpp/8d/7qDccWrj3qHGJk4GA8xSnAwK4nwBnbK
 JQjxpiRWVqUW5ccXleakFh9ilOZgURLn3bV1TbyQQHpiSWp2ampBahFMlomDU6qBacEv3dp7
 7gWCsyb4td/g1HJ+fMuqP17ezbNwTfG8+K9GxV4SJSKXnkuZTau6YWe+OS+Y982+CubZe2qZ
 /NclT5/L/8nZID3k7OVfFz8sehzx9FH+Uclzk351iOtMammxWD3H5iPH3KSFx9LauG7t2lB8
 zX5KkXy3a0lEVd7SpJVOyjNP7/qz3LWC73z1tMXLOc6lGPbukppzVeCi+mQT6Zl1vxnEm/iZ
 Frv3veadG7QlvOhW6caAqkD1+zxKFcx/5qlc2sH4UsbZf/LEOZoxZzbkJRwVvfVW4R9/9h+X
 zz/fF3e5eJ7ccJHBRKYqsC/EtnCf9o386IIjQlP6LQQOMws/XRadkSyY0HXo7FVWJZbijERD
 Leai4kQALphZIpgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xe7qsNxUSDC6vFbFY297NZjHp0DVG
 iyUXUy3m3VK2ePDnMbvF8d4dLA5sHptWdbJ5PLm2mcnj/b6rbB7tB7qZAlii9GyK8ktLUhUy
 8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DLap65gLujgqbhw/DBT
 A+M+zi5GTg4JAROJbT/3MHUxcnEICSxllOibfZMdIiEj8enKRyhbWOLPtS42iKKPjBI37/xj
 gXD2MErsPNTBCFLFIqAicfHRH2YQm01AU2L7n/9ARRwcIgK6End+GIDUM4Ns2PVtA9hUYQEj
 iWW3u1lAbF4BQ4lHa85DDe1nlDh8chpUQlDi5MwnYIOYgYau36UPYUpLLP/HAVLBKWAjMb/z
 D9ShShJH5nWzQdi1Eq/u72acwCg8C8mgWQiDZiEMWsDIvIpRJLW0ODc9t9hQrzgxt7g0L10v
 OT93EyMwtrYd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4Q3slEsQ4k1JrKxKLcqPLyrNSS0+xGgK
 DIiJzFKiyfnA6M4riTc0MzA1NDGzNDC1NDNWEufdOndNvJBAemJJanZqakFqEUwfEwenVAMT
 X8GcL/vd8l5+MKkRUpCvZ9zxj1fw+dn7WuXV309cYWu+V697OGX9D5YTFwWvi6588HVu99LS
 FvaSC+Vbwvdvv9vVaNDGvDT6y07TZVlFKv+OvDKZ3T4xtmLfu/Mri76tvBvVuHoxX71yftYc
 Y9PnOm7mQuX9iW6s4p7PMmLTjuxkikj5nhZVKafR+WUmp/cxt5f/yr0andmiZlhu8076tv5U
 QJ5VZ1L6bqOi1vy/rPsrXqWbZHtnOJm9sPuWJXDzGJue8HMRu+e9KZ6v/fXWb+PY7NXn3Np8
 ZF7oApfLFhmHn8uK3w8+knXyT6yVU+rDmRXpfpc1Wb5GaYnqv90jvezI+jWRKZrc2jrHtimx
 FGckGmoxFxUnAgAj8RvFNgMAAA==
X-CMS-MailID: 20210208062405eucas1p133181f0542d42b721dc3987d1eaf98d0
X-Msg-Generator: CA
X-RootMTR: 20210208003303eucas1p1cb3eb9d86fa82db23f6290ce3e24ef96
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210208003303eucas1p1cb3eb9d86fa82db23f6290ce3e24ef96
References: <CGME20210208003303eucas1p1cb3eb9d86fa82db23f6290ce3e24ef96@eucas1p1.samsung.com>
 <20210208003256.9280-1-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=210.118.77.11; envelope-from=k.jensen@samsung.com;
 helo=mailout1.w1.samsung.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Feb  8 09:32, Dmitry Fomichev wrote:
> Implicitly and Explicitly Open zones can be closed by Close Zone
> management function. This got broken by a recent commit and now such
> commands fail with Invalid Zone State Transition status.
> 
> Modify nvm_zrm_close() function to make Close Zone work correctly.
> 
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Fixes: 053b5a302c3("hw/block/nvme: refactor zone resource management")
> ---
>  hw/block/nvme.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 6b84e34843..c2f0c88fbf 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1308,14 +1308,13 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
>  static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
>  {
>      switch (nvme_get_zone_state(zone)) {
> -    case NVME_ZONE_STATE_CLOSED:
> -        return NVME_SUCCESS;
> -
>      case NVME_ZONE_STATE_EXPLICITLY_OPEN:
>      case NVME_ZONE_STATE_IMPLICITLY_OPEN:
>          nvme_aor_dec_open(ns);
>          nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
>          /* fall through */
> +    case NVME_ZONE_STATE_CLOSED:
> +        return NVME_SUCCESS;
>  
>      default:
>          return NVME_ZONE_INVAL_TRANSITION;
> -- 
> 2.28.0
> 

Thanks, applied!

The commit ids change when this is merged with master, so I removed the
"Fixes" tag and made a reference to the commit title in the commit
message instead.

