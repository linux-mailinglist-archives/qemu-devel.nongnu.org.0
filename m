Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486C56F838B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:10:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvBq-0001Xi-P0; Fri, 05 May 2023 09:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ayan.kumar.halder@amd.com>)
 id 1puuRp-0005I8-TF; Fri, 05 May 2023 08:22:05 -0400
Received: from mail-dm6nam12on20610.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::610]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ayan.kumar.halder@amd.com>)
 id 1puuRf-0000dQ-It; Fri, 05 May 2023 08:22:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4rFk2B+wZzzSGb/m2q/fSwkApOsAlD3XDIfA3Wm0xM3rGjcVjQY1Jvp/uiwSxPW5itDBjG5wxACv4mqzkWyQBR5tFVBvHrmj+rctUycL9A09kFCAI3BMTSG3xqEl/vkmA1j3uNDhlIe1Y8rElxiQnS1D38OlV9CAG6k6ZBHK00bUjxCgRCVedwAQrBodjKGYo7GtzF2K0ENUf9AtOH0Z1A0Lonw3wwXbbxo/AMyD4AaCmYWmxKT4heLbvnS7RiJavTS11DUkZqqgQ8O0zaILQ+sy1iVbr9njtjlOtf3yukWH/nnpscmuQEf1NmmNXYTUxbGDPMeE3xeNc1aUXqnpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XceMxcI/T4bXzmBIpl0IJKUg+2ne+0vttz1PiKWV4Co=;
 b=ogn+nataJUSfPAWxDoBA4XIlrpyKkgb6s4d6+QQ/VIo85wOXp3R5YIukJFlkClQSvwziWh1skYEhvPen72tygXRgN90ld36ZFC3f74z9H9Qwcdvc9CPMwL5369fezkc3EdrjVhM1MzNMzri/9cTnZ+tZOCUATiYmvGSaVwUpqyfbQ9MTdcTqNlj0mxsdtwx2+BnO6S8a3v8BEYeDxmMSH1WPZlTZ13WMOT4Zc3xdC5q1uqGXIpheX06+oi7Y+E6l7xBprESUBbSMi7HItE5WkmBD4RlXi9jzfncdYfimnGbU1B+DlboInh2bp0uNxyW5WR9vPkq/hpn3baFItbezzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XceMxcI/T4bXzmBIpl0IJKUg+2ne+0vttz1PiKWV4Co=;
 b=YGaNJorocvxvb9wfQKZynZbxO1LImOP0HWnZrYxUvVB+C+urJrZdvUuVtCLgPxi7sYP4OsJst+1kwT7R4MWNnFbs96/Ce3Y7sKqLvcNY/8jrpV73AYBqfTRwO9VjV69ZsEwS9/1H9tZ8H1KKJaivB35x4lFYNBtgb+uknRN46T4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 12:21:50 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c%6]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 12:21:50 +0000
Message-ID: <a1c45644-90d9-0fd2-c87b-f43f16b7e407@amd.com>
Date: Fri, 5 May 2023 13:21:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
To: tobias.roehmel@rwth-aachen.de, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: Cortex-R52 support in Qemu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::6) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 281fffb3-ba4e-4de8-24bd-08db4d634d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6IFk9d4Ma4TlOgFY+wQyNXuoJdxfi6ymR4MG/cBKiOJkajStbe9sQNbYQ5NEmi/lqYIJKNwWxRp40GE/RhpJ+zSWaiyNAc3K4dJFLR6OtlTnhkmXcUNkhR90CTj8LFLti/jF4GTMmrhPdgSZmvc0HPhOhbdy20MJXtbeGyTOqj664UdGKOKFdq7/FXqUXHBC6tsfucY3QWsRSt1V3dKEorJi0kB3GLt58lKwSnqFlL4wM3b4rEI+heKDygornoXKT0I+zIU8mDAlj5etNB4Mm7N38CvNCQNIGzJzSXs6121Mj9i2vR6q/GwBI3Be6jwYg7LcxwqlTK7LqajLJJ4F69uMeNrVHlMOeJ7C4BK/83lkHRlNL5uFhXWkA46smYXMhvkzwC5TVHNa0w69ry/+p3b5WXlCHoDZN4RMrSg2dMT/mebl+aM7FI2MfryYlbmAuqMPSrc5MHX3xXFXy9yuJyzfZlUPxsGeq8/n7yY0sEZGt3iYZ+jPMGE2SnVt94Hee8S5cAqr0ubjaGAIa+ANcPxFAv8pEaGLNSjYbEiTOBcdayWxCWc1lg4iHEROJOwBj6uuIAcFbzl91m7oXjv5nYv/zjoXt6QOThWpEiGID73Z/dz7bdOASWEqbYiY1W6KoigS7xriD8xVyDobxX2BIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2621.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199021)(31686004)(966005)(66946007)(66476007)(4326008)(6666004)(66556008)(316002)(478600001)(31696002)(6486002)(36756003)(66574015)(83380400001)(6512007)(6506007)(26005)(2616005)(8676002)(8936002)(5660300002)(4744005)(2906002)(41300700001)(186003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3dMeVVua3FpbGFJNkhYREdzL2x6YUxzZFA3bW9JTVhzcUs5V2ZnOTR0OTBy?=
 =?utf-8?B?U0RodlpteU1xMTUrNkYrUkg5b0pXK2hldUEyc1R3WHFJZzF5bEVtdDlDclJV?=
 =?utf-8?B?V1JmUE0zdHdjMkxsd0JvUnZZSzRKYVo4OXp3bGhHVWJNcytEdFZGU010VWww?=
 =?utf-8?B?VTBmNVpzcjBXN0VMWlcrTmMzQ3FpY1V6Y2VLLzhlMTRvM2I5L2xsdnhNZWEx?=
 =?utf-8?B?TnJyb0l2b2Zyc1pQQ25LT0RET1lQSlA5ckJORWFOK3lLZVgvRjNDTTdLTytU?=
 =?utf-8?B?K0xDbHhpMjJ5L1dVQnprb2hnbjBJZWpsbVBKWmxhSzd6TTNrVEpkUWw4dXB4?=
 =?utf-8?B?WnJJOHpPbWYwNmJFMHRScE1zL0tlN0ZIUEZ6cEJ5dlAva0VNTDYrN3dIdXFs?=
 =?utf-8?B?QXpETUJhdzVaeFpqN1Y4R01JT1VmSjRMTVo5YVZrQjZ4Y014YVN0M0ZyS2t3?=
 =?utf-8?B?OHREMWp1UDdNdE9yTmsxNVpkYlNhc2g2R09wRXFMZ1ZQSDlkdUprWGtURERa?=
 =?utf-8?B?OGV4RlFIQUpzSmNiNUZGajc2MUxCdThEaFpsNGtoZzdveGdhZ3ROOTRHSk5F?=
 =?utf-8?B?cEt4T0hkeFBuZzNQaWdoQm5TMXpmSUM4RlFuZVFsTUQ4cmllVEpaK1FyeEYv?=
 =?utf-8?B?MmNiYUFNTTd6TWxPc0NEVEd5UFBtYWxHbHlaUzNPQVR5YTAzNHA1RmFlR0pP?=
 =?utf-8?B?N2Mzek5KNDM0a1QrSDROYWJyelpzVkR5U1YwT3kyUjlKZ2dqNXk4RnM0YU9W?=
 =?utf-8?B?WWViQUE0SzBGU3k1ait6VlBVMVZ3Y3JuNEdBRVIzWm9lS1cwN2RkeE1xU0hG?=
 =?utf-8?B?WUgxSzhrL2VHMDY5S25yWnRMem5JR2lkb1RZbmkybmt4TjVhSlk0UGM1UlQ0?=
 =?utf-8?B?YXRhR0ZNS2NhZmdNcUVMRmFPNlVZdFZqZjlLTjBZWFU0NmQ4YldtTFRScFdF?=
 =?utf-8?B?cVlrWG5qNTcxSW1GUndMeUZ1clprZ2RFa1FiMjQ2RGFYVXV3WG9VZm5GRHp6?=
 =?utf-8?B?NDJxbkJVV3dHZHN2UTJ0K0NzU1Zua0UrVW5vYjhBNmpTaUY2dXl0NUE1eDho?=
 =?utf-8?B?K3cxWmZJRmRiRy94M093cVpqZmV5K1BFRVRKQmt3TFFpbGJKSmxhb3Rva1h4?=
 =?utf-8?B?OWRHcElBWUM1ZGhaT25PWHRoZjFsN3FMdFg3VXNhb05mRDJnYWJXc2o3MFlX?=
 =?utf-8?B?QmFJMktzVWpzb0N3RkNqSW5oQXpCb2hVN1JwSXdUSU5oc1VPeXY2czV3RDc3?=
 =?utf-8?B?dTFJc3lidUprUTVMY0lkUmFRZlJyY2F0M1N1Q2UycHAzNCtNVkNqQWVORFUw?=
 =?utf-8?B?aFFWbE5YbFVCOEdDcGZueW1nRXFDUGx2cFkxaTVaZC95R2FkTU41ZURpVkhR?=
 =?utf-8?B?QVZGR0NCM0NVQWxSaXNIbGR4T0VBekpaYVkzM2JpRFluS2t4NG9UVUZQS1RI?=
 =?utf-8?B?N3lQODJ0T1ZDNHNIR1pqc3R2QXJpWTNuK2dIM2UyZllwNVg2RHlseDNrU2cx?=
 =?utf-8?B?NVh5V0E3TGNNcWxJamxrNEU0UnlSUjJWanNKVUNBOG5kZ0tJb1FQaDdWRzZq?=
 =?utf-8?B?Q0hpTEp3d1VmOWsrK1RBeW9zbUxXcVBCUEt4VFBCNTMwaHJ6ejVPY2RQcmx1?=
 =?utf-8?B?OVRidzF2NFNCdEVvZnU4Qk9Pb0hpTDNaRHNoVkFXQWEwWkdZbVhXKzZaSU4v?=
 =?utf-8?B?dGczQ2FvNVdEZUZ3ZHVjRUFBRVZjVElUOGZ0dzI2ekVHck5ZMmc2L3A3WEFq?=
 =?utf-8?B?WXJ4VlJVcjI3eEE1VnVnblhJdWp5cnR0ZU1wMGhndWRua2FuUFNlU3Zoa0tT?=
 =?utf-8?B?ZkRVUFV1RDNrMWVTS1UwQmtCSGFDT1RvTUF4ekxadk1uY3RGYktzNngzQ1A5?=
 =?utf-8?B?R2tQYUgrU2pkR2pXUUFkdkNCeklvVUFHbmpORkJtUzFCZHdLUXpBUk1YZ3Ix?=
 =?utf-8?B?WUtGWEIrYmIrYlExckFxREFNWENFT0hDczZqVCtzeTU1UlJvYVkydnE4eG1C?=
 =?utf-8?B?cDRlZ2Y1cE5vRFhncjUvMFZ4OWlzTFBUSzBZdjMxUFlPTlZGaUtrM3EwdjBU?=
 =?utf-8?B?OVhzb1NrS01pam5XeDRzY25IRFZkRFVvL1BWWWFwR0JvZkdmZTVUaTBLR3BH?=
 =?utf-8?Q?OM2qMy7TX9pfN/n3cxvDznyZF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281fffb3-ba4e-4de8-24bd-08db4d634d5c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 12:21:50.0630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QKjflqAPZrU6igs9hvAEJGEz3Vef/Comlz0IMw7NUFLSFeNx/4p+CqZe/M/5ajQM6f1JCPwSv1f7B6K0f+Olg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474
Received-SPF: softfail client-ip=2a01:111:f400:fe59::610;
 envelope-from=ayan.kumar.halder@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 May 2023 09:09:27 -0400
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

Hi Tobias/Peter,

Greetings.

In the following commit, I see you have added R52 support in Qemu.

commit 5f536d01d1141a56f5057b62c82fa94826d367f0
Author: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Date:   Tue Dec 6 11:25:04 2022 +0100

     target/arm: Add ARM Cortex-R52 CPU


1. Do you have quick instructions on how to build and test it ? I have 
ported Xen for Cortex-R52 (using Arm FVP) and would like to see if it 
works with Qemu as well.

2. Have you (or planning in near future) to add support for qemu-r52 in 
Zephyr ? I can see an old ticket
https://github.com/zephyrproject-rtos/zephyr/issues/47330 , but don't 
know if you have integrated qemu in Zephyr.


Kind regards,

Ayan


