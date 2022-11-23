Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2C636797
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 18:49:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxtqu-0000HQ-MI; Wed, 23 Nov 2022 12:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1oxtqg-0000Fk-2l
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:47:56 -0500
Received: from mail-mw2nam10on2077.outbound.protection.outlook.com
 ([40.107.94.77] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1oxtqc-000583-Kb
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:47:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnGIqFql/d/8Lq1mb2e3DA5pdTfi7KhdksTy2TXJfbCY+hkOzNtHnxO9vf5XUPTEKzkrit8yyHsNxpod3KnEoypfqTeSZJvtNp6XFFNvnaZ+4MecT+4MXxCzPxdfTvkaaHRKC3DMX0p8IxZ8cwiyyOAyTFTGt02mtLj68H6BbgZ7OEaNchqoTdu5tk6IfgvVlFFx7OzFd62e6vgsIWERa4kiB46B5lnWdCQRTrd8eq68Ru6zGnI/gOSzGCJgY2ajl1iKJBbHq8Syar2JpSQ17uxLcjRODFqS7mNm1srEn1RsTzl+WzEascyS3re/wvZsdfIPzGiiF++YqdeND6Boag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9uaKcbdarljYX6FJ2jDjEER45tQnc+VNEBNgbzkYeM=;
 b=ItChkWt1p3UeW0hJgTRyEUDVkHP0LIJFPZ9fU9znKeAmKLVx8/5KOsS9VvOiYhZj7SQ/EVMWP5gfffGdhAFMYFReDZ7xYxma/ZimDmi/bzSnBgPnzmo0okBTLIpn6WjmEqml7kC71wN93b9eSVuaS7Yvf+PoFdfiBrpbFNur3EP9ag3+rAo0rIdoTtFcQOpnoKQqwY/PwfUGyrYoeX2zTBSRgy3BV1jR65nCQltDIVAehPM474gtxF4L7v6a1ZIO55GFrYxLTjbJ8RXJsi5hJOBe0AWlA8wxHjzRJME6V10mEM5LBo+ZwAjekp/6+yx48btiu9AljbdrHAfbZZoM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9uaKcbdarljYX6FJ2jDjEER45tQnc+VNEBNgbzkYeM=;
 b=fFEqn/xQyO96eSPqhpBfYj/GImhPuxPo58PwpjRBgsmVfJB2oeSfeLvKrbBQx2n6IQZe7LEWBRJwkuEkbgMHUDvoMYACRa9ULr9THvadal8kMBnLm7cNzsfw71YrGum/4f4Db73OVaqN3aRpeiHQAg48PWY+TL6Bvl4MDkI0e2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by MW3PR17MB4220.namprd17.prod.outlook.com (2603:10b6:303:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 17:42:39 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::3299:1f35:894f:69df]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::3299:1f35:894f:69df%6]) with mapi id 15.20.5834.009; Wed, 23 Nov 2022
 17:42:39 +0000
Date: Wed, 23 Nov 2022 12:42:29 -0500
From: Gregory Price <gregory.price@memverge.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gregory Price <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 alison.schofield@intel.com, dave@stgolabs.net,
 a.manzanares@samsung.com, bwidawsk@kernel.org,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [PATCH 3/4] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <Y35bhWf9qAQklDRU@memverge.com>
References: <20221026004737.3646-1-gregory.price@memverge.com>
 <20221026004737.3646-4-gregory.price@memverge.com>
 <20221114175341.000036c4@Huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114175341.000036c4@Huawei.com>
X-ClientProxiedBy: BYAPR01CA0048.prod.exchangelabs.com (2603:10b6:a03:94::25)
 To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|MW3PR17MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb286a3-e685-44ef-66f6-08dacd7a1dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WJpNDXZLxl4IAMHLWSZIY3IRCFX2P+B2wKw1nnetPwu+zPsSpqiDgCiIHKm+k63Qw74F7KM1jmjIVXtkB/3597XvDv/xxUg7UWJ4IC0effkM9CFxtSlzHpXuNQLRhr9VFp8/TOhBeXNzN5RCLSVzqhfcA/Z2ls3OnhwUTYwu+/YVVgNLC1j3m38E1s/JeM7lLY68q7YGTRsGiLqjk/i/gF+ZBYBbN6BjPDxpiq9WtkdynNaLAhhoZp+iuaVOkC+84GXhtrfV1+kiPcXBN8mGnTdOW1Gz0hLn3uk1aTrF7+LguZ0GB2JfVrvi0dpGFM4sQfPoQF4sr15G4M/RbwV3OqghvPRCR/+kUHId+SB7JCdPNPGCr/2v6/pdno7Hf0fpDrf29ilxy32tq+P51+rOGMdoj3G6AQRbS3FMZx8hrDZEsyR71TxmS4Rsy9h+6c92m6ixDWcYk3v8KWRXu0iLVP1IBWZ+/MXMfR9WXuO98saV4uAwoD/KYZZun7+DuFLOAd5ZPpgynK7KGtwMsFtRW/EumUgP3/aM5J16LmMQYrExflXYEiJ/EgUP68l8e6yXhD+qFP5/iIpwhT7NG9AtmptYhZpDoO70ATp6KLGAyq7oksWByhNuNU2JEiZsw73SXVpD1K2glJLv471ZCCTj7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(366004)(376002)(136003)(39840400004)(451199015)(38100700002)(26005)(86362001)(2616005)(6666004)(478600001)(7416002)(66556008)(6506007)(66946007)(4326008)(66476007)(316002)(8676002)(41300700001)(6486002)(2906002)(186003)(6512007)(44832011)(8936002)(5660300002)(6916009)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MsBhWlhsLKZCiwPFR4K1VWx2RebohuHjDEg0ALZ/7Q0AKamHNm8nKZlLEV/d?=
 =?us-ascii?Q?q1YogGcj3hPoIkj+iM0Uikih3DiTZZUFdW710LcU6WZ3vtQcpwF/qRaOhmnt?=
 =?us-ascii?Q?CgDeVk7ypzuEiqMbGOIndO0j72F4qBwY95kXkdh+1qkVE11xMTOgZ38S23YS?=
 =?us-ascii?Q?S8K9XmyHOMERtEbsZdNJ9P2JCP+kzhmQppiQq/wVlaU9HpcH4veGW7rwFnxQ?=
 =?us-ascii?Q?iWQllpYR787B5oP1TS4ELNVupjrkWNntNgYpwzWxyXoiXnSv2ApNwibhsEib?=
 =?us-ascii?Q?BjmPDV/TT15yU4n0acY5i27nGsct4h07xkjtbjQLYsu2rFZ34mTj2Mr70fJS?=
 =?us-ascii?Q?ZPruwC2WXnRCeKuQS672hcBvUF2VPSPDmmqhbLo7V+lzZpc6gqg0/CF51lhW?=
 =?us-ascii?Q?7BbNpSRiqHFqF/1BMe2l3Vskfsm7meTAp/fN8RjaGX3bdNaI7ZvKw/nPbudy?=
 =?us-ascii?Q?YN1vNxDS7S9B6wevd9bsRoezXTG3NngcQ/KjBrTgxyYFL3xW7BE8p/Rot2Br?=
 =?us-ascii?Q?ori2hCJovROtTXH+KnEqIZgs7kx2nE6qaRxWO8b2bwZalRJaFJwi8aNX6HCN?=
 =?us-ascii?Q?rJoIlfgB3H4c2//86/wyPtOlo/Sr5XUuo5C6Ych+f677xagnq7cJdXmcx242?=
 =?us-ascii?Q?J3b6VZemTcCHi1xpvEwxqGtDnViINRn4dsXjsTBJlGY0pLivAaksHPjiUZ0S?=
 =?us-ascii?Q?jSB3Y/BsDGqc0wNe2CfMMyuM7iFqXP9wQl4nMgowgTE89uzWcs/M9897lgcq?=
 =?us-ascii?Q?9rDj8sxTZZ+XQTLYJbWjgmrDpl0JmYLJYZLVV8kbCwWIRigcqR460Ysnkqca?=
 =?us-ascii?Q?7yO7hh2DReFDdBfu6QAAmZqubcPy9KNyZhRCZxfKYzYBqFfQzgY8vYo+7tPD?=
 =?us-ascii?Q?iVc4CUv1EhrVORuOWrq/W40aadirVOTJFkZgehI4D6qgnoaNLPMaUyhAbjAb?=
 =?us-ascii?Q?gCiX0Ft7mn1lNhSE3hUgP+o/Fo72vPm/wsxOKsX2REGVzbJpQuPzfmRBL7b+?=
 =?us-ascii?Q?4H39Zd8V7UHd7SeLuWu0Cuwd491ITpTP6lglmx4txA1zIx+J3gj9sD0qTQSF?=
 =?us-ascii?Q?N6IVdvVtLq6LSAjF6D9KVKoGwi2UrUB7l/cYyZxu1roHeQjAMUdeGlcWanQg?=
 =?us-ascii?Q?u4nH3HcvMt6IenEiPBStnuywJ2EzPRGyOkTjGUzbowi7WhOD4eh9GXsEoMl0?=
 =?us-ascii?Q?fQApteTTfdemlS0CdSLDW3OuKqhyp2htmqjuQtRQ9mnvtrVPQSat1k+10qA8?=
 =?us-ascii?Q?pYCKma+TjkcgvXq66j00A8o+sGRXIPBJIpn17h5U2hgN0X7CpVBNeMWqb/4/?=
 =?us-ascii?Q?G1yOfidxGY3fpi5THv5lHhC6dc3ai1zLg4y/8iONx14Z9OUN6ub0NOp9tVPA?=
 =?us-ascii?Q?Lzun972ULbdTT8+bGWSsK2/feP2q9iK9giLHEPzUXfuZcWCh/4QkkNVKJjwg?=
 =?us-ascii?Q?UlFILsMECHpM8/hPJRb8/SCTExcXUivNAkLjpSbuW90gBnBLNX1mBJsP21MO?=
 =?us-ascii?Q?1izThLCGQ5AG96xvr1VFZyyGVfOVhud22CkghXoJL6DublMJUZMzfCiWQT8i?=
 =?us-ascii?Q?JbLykBguSUt6nUQOwuD6dIKMqtjw48kW3NwSOntJXmTRkl9JFrk2M3tQgAwY?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb286a3-e685-44ef-66f6-08dacd7a1dbc
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 17:42:39.7436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/ERUb0a/dXiu9kY+F3ruceK+JPnIDgs7ImF/vfdOo+vlVK+pgzcWGTHKMOCFviy9gmDpWOzDxyhb5GOUyDGECds2WtDz3Oy/JkV/Gc2le4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR17MB4220
Received-SPF: pass client-ip=40.107.94.77;
 envelope-from=gregory.price@memverge.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> > -  -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
> > -  -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M \
> > +  -object memory-backend-file,pmem=true,id=pmem0,share=on,mem-path=/tmp/cxltest.raw,size=256M \
> > +  -object memory-backend-file,pmem=true,id=cxl-lsa0,share=on,mem-path=/tmp/lsa.raw,size=256M \
> 
> Why make the pmem=true change in here? If we want to do that I think it should be in a
> separate patch with explanation.
> 

this is mostly an observation that memory-backend's have a pmem option.
It was unclear to me that using this backend for a pmem region without
setting pmem=true was "correct", but i also am not sure it has a real
effect.  I'll drop this from the changeset.

> > +error_cleanup:
> > +    int i;
> > +    for (i = 0; i < cur_ent; i++) {
> > +        g_free(*cdat_table[i]);
> 
> Until the steal pointer above, *cdata_table not set to anything.
> Possibly gfree(table[i])?
> 
> 

good catch

> Hmm. I wonder if this is simpler done as below. Both look fine
> to me though so up to you for next version.  Trade off between
> slightly ugly nested logic, and the readability always lost when
> a ternary operator puts in an appearance.
> 
>     if (ct3d->hostvmem) {

this seems reasonable, pulled in

> 
> If we have both volatile and persistent and yet still only have our one HDM
> decoder, then I think a write into the persistent range will have the wrong offset.
> 
> dpa_offset == address space offset when we only had one region. Not so much any more.
> For persistent i think we'll need to subtract the size of the volatile region
> (possibly taking care with alignment - I need to check that).
>

I had originally done this, but it wasn't clear to me what was correct
here, I'll make the adjustment

> > diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> > index 6baed747fa..a05ddc0c7b 100644
> > --- a/tests/qtest/cxl-test.c
> > +++ b/tests/qtest/cxl-test.c
> > @@ -34,29 +34,46 @@
> > -                  "-object memory-backend-file,id=cxl-mem3,mem-path=%s,size=256M "    \
> > -                  "-object memory-backend-file,id=lsa3,mem-path=%s,size=256M "    \
> > -                  "-device cxl-type3,bus=rp3,memdev=cxl-mem3,lsa=lsa3,id=cxl-pmem3 "
> 
> If re-indenting makes sense (I'm really convinced it is worth the noise) then do it
> in a precusor no-op patch so we can more easily see what is new here.)
> 

can do

