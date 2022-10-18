Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992EA602F2D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 17:10:00 +0200 (CEST)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okoE9-0006s4-2Y
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 11:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1oknzg-0004K8-B0
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 10:55:00 -0400
Received: from mail-dm6nam11on2062f.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::62f]:50369
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1oknzc-0002J5-OX
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 10:55:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMILxw5hDoWLbQDpXYZWwDpalkyJEzTwt4uwSAP0NyvJCKI8n8ZU9n3WuukeBRJ4pCRvFUYNLIUq1BV+XNfQdLJoLb7FPH/X5jfC02rXprcv34KOeh/yPcxEHAwv8mf+l7xwgfrw/r09D8g4IeqFaS6M/6TheBKz9Krf98WnhbdpKMekranxgElG69AVO369qiO4iYrKbQW3m9fgOfZbaBcNKDEZd98XOV2N1BpjZhBDz0eUkxnbDsLy8pVFXXjzhCgx8TRCVhWDG6ziGPbMsiBOx0wKkhpKH3iGsGEMYKrkby1NvQmvrgyI9IUF/nJwiwoWPLO8WUew5T7RHYdgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwMV/zYS+XVujK8JZ851nugkSAiFkBpXhyQD+YdUTO0=;
 b=SpJosrfPm6KTliJ/NgSbcr9JWkeofBo6IekMNhsbJAp4HBsbkGv+Uu8S04QuRISEdbiIuyPQRMXNTezct7zvEk2LikRkQ8zKtH+rkwkoMydMq07LWvGrI8rhlbdBk2pk1jMresC7jsr8ZbN5NsDkkmt7VuOWWHIMy9ThDNiTxx6/CoP+rIGgLReDXMoNJ1sxkJhwmpg1Ddy8dZCIJ7GCpk92Fj87J+6iVcIc7nDetP68hIivPli4Waywkh7MOKOa9pdQjKI75KW01R640OIjjYwOZ2pNofaBmHU4xDBZcHyyyvP4g9jrmbdOF0AGvXrdNeMkfio2vRfjtc0z50n4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwMV/zYS+XVujK8JZ851nugkSAiFkBpXhyQD+YdUTO0=;
 b=unozcbiq2dUqKIglVOFQtRI6Xe6GPbLwwt/Tu2bV9Pzd29PKHm6y0C6vzAcV4RtZWv+D1MWQSkBV7F0AhwL4Lx8OlkKCGfVd0Dnj/Kuf9O22rgJENuWrSZb/K5FjxwI+9AEnL0/Me2cdpGY/CYeJtjxK99aS1VzP9ExEHYxDJDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by BLAPR17MB4116.namprd17.prod.outlook.com (2603:10b6:208:279::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 14:49:48 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::655f:bfa9:e33a:5af4]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::655f:bfa9:e33a:5af4%5]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 14:49:48 +0000
Date: Tue, 18 Oct 2022 10:49:46 -0400
From: Gregory Price <gregory.price@memverge.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: Gregory Price <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 mst@redhat.com, marcel.apfelbaum@gmail.com, imammedo@redhat.com,
 ani@anisinha.ca, jonathan.cameron@huawei.com,
 linux-cxl@vger.kernel.org, alison.schofield@intel.com,
 dave@stgolabs.net, a.manzanares@samsung.com, bwidawsk@kernel.org,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [BUG] hw/i386/pc.c: CXL Fixed Memory Window should not reserve
 e820 in bios
Message-ID: <Y069Ch2YvU0iotZG@memverge.com>
References: <20221017234001.53297-1-gregory.price@memverge.com>
 <a8d79f08-9891-395f-54fd-d5f00b67a521@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8d79f08-9891-395f-54fd-d5f00b67a521@amd.com>
X-ClientProxiedBy: BLAPR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:208:32e::24) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|BLAPR17MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: a039883e-b085-4de4-1723-08dab1180144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zo7PieV81RxDbninIUJmdi+I/t33J1Uc17FpxcYkvIATMekt97RVoQjyIm3uNfSMiUo/DjpChseoihOP5ysxnd1oZ69DsjEaDjoy4v5WB7Ejinqbpod/CtfmADJw1YdaF3JWiNa4Vx0ksc/TLZac13dvVlgqKtNiPEC5z1AY/BIzWq5KbDRGimOKlTqL/Zq+6mXwkQLjZ+fEh5nmbCK/evVSqNWTsc26dRiNIK4m5qHqeSHdlqJYz5Mg+OM088DPwByJXrx9WpIocpOZs7VWXLnPTt8/VZKAQQ6k13K5WdVxTB6zPMXXEjARKVzGr+X7pc+HWTxYx8okqwPFTA+jchN1BOcwNmLMI1aupGXCIG32Geq5IXsXfG1RYwOTDGVA861IMMck4KATPGJIsW03+SBKCJrjrzvPhL5ttNtXf2iSB7HtZOsrSC+d4QqcbRr3o6CSMq9gWEAXiKB2YZLDZenG27l/iKpoSLiB1KvadeiWNAsZDc0EyMKhNcFZD9TYwyrVaeCblE7ZohD7XUNLW8nTV0RulbN3DdmnI4Fd53CCsaMFDdN6HXvFwcEuLI01UDnJWSVhQFIZgmGLnMfoIKb910Hi9juW1miZ8hiweIonNZE6Yhfe2wleLIypSWVgkUltf6NcJkJ9sJjRXtG9IpDSCA5N9Y5FnM+h57gx1L00vdXMTww4/vkPesAFqb1O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39840400004)(346002)(376002)(366004)(136003)(451199015)(478600001)(36756003)(38100700002)(8936002)(5660300002)(4744005)(44832011)(86362001)(26005)(6916009)(2616005)(186003)(6512007)(6486002)(316002)(7416002)(66946007)(41300700001)(4326008)(8676002)(66556008)(6506007)(66476007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pf1fp12YgBmqo7YOUD+9S8Nt6mf/F3qKcS7uWKe+T6EyMseS5s3U2NilVclt?=
 =?us-ascii?Q?iprNkAWsCZcH8jbYLgTWZ8hhu8+5tx9bJ4novjCAqwIBMuVb85hYeniFtYQ3?=
 =?us-ascii?Q?TvAFZoT94ow/E2g5lgaG6JuPdnNMJV1io+G2q3GvqLBF+jgPL4UwDUUwE/dF?=
 =?us-ascii?Q?amHGNRLQ5h9OKyf1O+smTiwFYgLHrS7P00HnUL90Pl0h0dtE/OjWdK+lF75Y?=
 =?us-ascii?Q?DteOpsntpIW9t99mmWRVdYdL0vGXoiBeNTGxaRqIFxZH6HyO2GIaGIOYzZxi?=
 =?us-ascii?Q?cwQTMCnAJ9airPMTOBa26Hc38GUhJv5BV8zTkdw5yyKqbfzvXW3ZpVvut8EO?=
 =?us-ascii?Q?6dMPfP2V1EUlTrwK+IfzILOLkLDqeoiLCzbC1vsfoWlYhEK4Rn3ux2lvEYPX?=
 =?us-ascii?Q?DDqgDe4CdoaaXV6gQ41/czivbiL6byId6qCvTn7gw6V8hyOwQC4jPi3h8zID?=
 =?us-ascii?Q?65oD5PFo2EP+l2llDBxQ6IxPk2YWJ+dQGYPe6EIqy7VyR/gk96mcYkCnRH9p?=
 =?us-ascii?Q?UrG8C3WNAmkkP0ZBvY0uhe2O7QV0W3RCxXhyNeAhGvB0PhiaS3p/vf/0SZeT?=
 =?us-ascii?Q?uzLYK1B7XptTLEFNrWb7PDjLr5BPjPi+LZbkL43PuNZDr9qmstqq/SFSvfW/?=
 =?us-ascii?Q?7Mq5oTr/clBJMQgpAE7Q4H+l5mIUfdQRGrS2vVtGPCmGiFKjQKFDjsj2lArc?=
 =?us-ascii?Q?Tv5cp5xAI9zHR0x/6+7VYQ8X+QIfB25w/srMoYgQRTHVKz8KiwMwUPzgoaQx?=
 =?us-ascii?Q?gXrciKp7FDrRVXjHZ0trQNM1opp1L5vEnlqoImZ1Zyl2JyPVFx5ZqBX5eafx?=
 =?us-ascii?Q?qErWQHLketpfm67rWuy2ypZ03u67/LDa5DfCmp99Gr524vBQbJsAUeBrgKKE?=
 =?us-ascii?Q?rKesRJ4rJTLQ2rTFgkSSMIQlgXbJgfAz3Y+okv+hBQeVVD8XCMq9qN02LEil?=
 =?us-ascii?Q?6b44ZDMgEFprKkGs1eu8P0n9zQrK3sktrqbzDsIuy4gkReK3Vmt7tJR4kuZM?=
 =?us-ascii?Q?nDBGSkyR5uWxD3fBKapyJ0LZii4YD796vD0YpqXHUO8gp6Kto9+xn2fwzGjI?=
 =?us-ascii?Q?9wSWrp7thy+xcKG/j64ekwaDI1SVQHuaRfjIxu/Jz53FUwDxZbGtQNpOKEJr?=
 =?us-ascii?Q?bidfP+W+tn/Lyx2f7XLwDSdBRQ1K+wfpMySIeQdIlsUBiBH8hH60bO2jKF/Y?=
 =?us-ascii?Q?skz4WqH8kZnqWApzcGXWs1V0eCwuEncIUvmFDyIyg/YF0h1ra6MoYvEsr6WD?=
 =?us-ascii?Q?8n+2v377DddH/A7iQaG7kYaV6qcve1JR1bWZvwrlrEK7jjS2NlkOIvKrL55P?=
 =?us-ascii?Q?3idmRMupLLb7lp4PISHCHOTtLZlVN8GWjvRHAdWV7SekgbfzNzgoJV9dcu6f?=
 =?us-ascii?Q?jgqEfarS28IgrmtONSwj38W63zIJMA0OyqnZ5FNb4crxT9jTq3UKh6a9eyqb?=
 =?us-ascii?Q?kTh3FxqWgPg7kH7oC+GwzcuIvuvVdWXX9B2Q8QWo22UP8VjxfMglAEGNYfxF?=
 =?us-ascii?Q?MpT33phfCYArS7LO2gttmHXLA6e1Nu8B/gwq5m2XLP/ogQi4PnBUon+SsL3y?=
 =?us-ascii?Q?s0aTzjCPrmI2mLjgoMvOo4UmoZb1BVi0Os0AILaFFnvVYCvCsOJ58141QqEe?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a039883e-b085-4de4-1723-08dab1180144
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 14:49:48.6636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMbhoLKl04xVPiq/3bUEyABRK6SZEaNN6pmCvjLmX8OiWHI2tkie5dft0x7LHjQx73vahe4yfX59vNavpD+hZ8cs+NN6VWoT8A5DDYhO9dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR17MB4116
Received-SPF: pass client-ip=2a01:111:f400:7eaa::62f;
 envelope-from=gregory.price@memverge.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > -        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
> >           memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
> >           memory_region_add_subregion(system_memory, cxl_base, mr);
> >           cxl_resv_end = cxl_base + cxl_size;
> > @@ -1077,7 +1076,6 @@ void pc_memory_init(PCMachineState *pcms,
> >                   memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
> >                                         "cxl-fixed-memory-region", fw->size);
> >                   memory_region_add_subregion(system_memory, fw->base, &fw->mr);
> 
> Or will this be subregion of cxl_base?
> 
> Thanks,
> Pankaj

The memory region backing this memory area still has to be initialized
and added in the QEMU system, but it will now be initialized for use by
linux after PCI/ACPI setup occurs and the CXL driver discovers it via
CDAT.

It's also still possible to assign this area a static memory region at
bool by setting up the SRATs in the ACPI tables, but that patch is not
upstream yet.

