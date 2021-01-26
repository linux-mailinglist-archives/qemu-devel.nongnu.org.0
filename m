Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1D304404
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:52:43 +0100 (CET)
Received: from localhost ([::1]:33144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ra5-000126-P0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1l4RXB-0008BV-E1
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:49:41 -0500
Received: from mail-bn7nam10on2055.outbound.protection.outlook.com
 ([40.107.92.55]:17049 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1l4RX6-0007nd-Td
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:49:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lhu3ObSs3XS/KTf/lCBls0pz5JOPYJu9DMzrOd97q9w+qjoiLS3d5F8FNawGbDcQW/6ASC2+jk09dNJPLYF7+C8PeRFwhC4zzP7w/hf41QmxumF8qJiwBY9rvFre1cWu4IwlvndwD8zbLFv83Qeud9a5zWO6ZK2YOy3kBK9Fg4Daq8pkxSUC/fZhAn4SLVFeoJ6LC8jfZebvKslNSASV4lIMroDDNoGE8MkMshPXUmdo5NsZ3TkFrpMJbW3XA6/GQamUGRJymc0kg85+jUG+xmNSmdYlRHIgLzeiAvRDvImks2lv1PDGwXhGv2HUcXtzheUiQEnQ4WB2Lg1GYLxQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doPTqSkooEfVhWHUa+Tp/9B9fpnMCI4ts/Lqy4JD2vc=;
 b=eDzAPlsJt2UApH5Hi3SL7I78lnJJvGtv1r/ctsXXBoccvK395T36Rp3MmK3Ehzuzh7FnlRUfqm8MlbWXTNt87p8Z15awGcTrgWiRnxgYu0H84BjMA9u4j1EBbnWfAazQXhR4rT4pLBhkZLUdjlZ9DYxMwwbv92P0jIg5GQyl+9GeL/K0TW6fjKmf1JCZEMt4Rwwk3beuUjdr1JRthXngEyekkMwX3EugwVIaNNVnNO42t8U3YfvPUnMYB6V1VNfra9JRWp4qj7LsAsrYrMmK/2MooYENBA0jkQBncuBNm0e0zIfiK9FCfcKd17YcVYLPv6BZDw9y1rfpCcqLAqg1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doPTqSkooEfVhWHUa+Tp/9B9fpnMCI4ts/Lqy4JD2vc=;
 b=lTby7AYAbV8+mVLwayZ5NUmv9tA4iGy0N0SSWs1m3Wkyf9E1OuOw2CurBxDyowSNhcrS2intigf6ChbhNObYZn+BQeOkze4N1XzH1wydKzvqxadIYSKggnBTeyO1t/0fqFvWKqovlKeGfmYzM0EKkjPDuL2JR3rboXg9f1yJRlY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB2889.namprd12.prod.outlook.com (2603:10b6:5:18a::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.17; Tue, 26 Jan 2021 16:49:32 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::cc15:4b1f:9f84:6914]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::cc15:4b1f:9f84:6914%4]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 16:49:32 +0000
Subject: Re: [PATCH v4 0/6] Qemu SEV-ES guest support
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <cover.1601060620.git.thomas.lendacky@amd.com>
 <30164d98-3d8c-64bf-500b-f98a7f12d3c3@redhat.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <b0c14997-22c2-2bfc-c570-a1c39280696b@amd.com>
Date: Tue, 26 Jan 2021 10:49:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <30164d98-3d8c-64bf-500b-f98a7f12d3c3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: CH2PR12CA0003.namprd12.prod.outlook.com
 (2603:10b6:610:57::13) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.30.118] (165.204.77.1) by
 CH2PR12CA0003.namprd12.prod.outlook.com (2603:10b6:610:57::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Tue, 26 Jan 2021 16:49:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c3bf3b9-3996-47c8-feac-08d8c21a5ac7
X-MS-TrafficTypeDiagnostic: DM6PR12MB2889:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2889C3E92B11312D8701ABF9ECBC9@DM6PR12MB2889.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5QpRTCZHDpDp3RsEyL5RdDqvox0rmL2E71MaVeT7LRC4aAlC5t3I1gkbO2aS5hjZL9hkRFCcegd6zITfQw5qR/khot5y2DKP8ZEqbYNUAbyK7ukXx4uFxfxGQl5ETNGVAqi0bLcwf0VAYp6c1TEwsy8GEJUkbYBwoquqbL7alfTU2vsCG7G9uQMbMCxUjg4Z7HiLtvKgLlnl0agD5G+a3FTeqC5lK43vz3Nokeqo6hAKXOG2D1iiuMhnKUU+vyTO/b5I50a6Jo0c6Z5Fi7ZLhMYqmuZ/UCQXTRNxIkvhJs7RowRglCpRt0oVgM7khYBuNqIAoSKbU57yKxm7bLPD+AKp2BdeDInelmS12ComNA6eO6FX630t7jtSPojy6OQ8SqOdikZaEYzAmWMrZ1eIQoENcS1LlxJrKbYRqvvw4+vwbfOGnOJdtbZ0eMGaGtA0zmZQIVadoxi2hBppKe+yrDusVr66N5qvrAGGXYXvXULZqVaFjC5nXp8UNDd/ZRFFE5SGaPRBEshkjNSmfEYJBIn2/UC8sMH22qjByEzMF4KnB4HCwoMokhN6lGpPknKNI7WoqMZr5BBO3obC+wsnVhZRy8fsArJga2G9VY82DCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(8936002)(8676002)(6486002)(31686004)(52116002)(5660300002)(2906002)(31696002)(7416002)(956004)(26005)(86362001)(2616005)(4326008)(316002)(16576012)(36756003)(478600001)(53546011)(4744005)(66556008)(54906003)(16526019)(186003)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bmhlb2JxSWNUbTZrdkJZZG1OMU4rOWU2S3N6MUdjZDZzTno0YXRreXUvc2dW?=
 =?utf-8?B?ZC9XTm92ZW5obGZUNmtXcFRZNC92a2dpalNvUHdtajg0T2dyandWc3FFcGEy?=
 =?utf-8?B?NUJyUitONmIwWDRhSFp4RkFTVFB6b2JVMXFka1ZzODRCam9FbEFFMFJCcUlT?=
 =?utf-8?B?RUhnUTBGU0J4V3NPUzdSeU04UkFVa21XaVZ2SlJiWEFIcmZFUCswRUFqM2xC?=
 =?utf-8?B?V1Eya3pPT05OaEhCUzBDd0xGYzFJVmlncm40NEVvcERkWEYyMHJCMWNrdWk3?=
 =?utf-8?B?RDdyT2hteE5zd3BxK2NaZjlTa1psVU1veG10a2ZCUVI5RXU4TlFXK3RHNjg4?=
 =?utf-8?B?clUxQzd6dHp1L01lbDNUYXdZTVFtcEdKUDVXTHhQMDdpaHROd0ZTRldiZ1JZ?=
 =?utf-8?B?Z2JFMFhncGlYRDBoekJHS1dnTnd5cVgzZEZJZU9MRWwwZEZmVnhqZCtZSXd1?=
 =?utf-8?B?dXAwWURwaG9xM2EwQTFaQ0dLLzhPQ3AzRElJSmNpYzVZTExIenZENGpyQzlH?=
 =?utf-8?B?ZXAzcjNBV1FoeEhRSXl0Uk1TWUNHS1FxMHhwOEVIcTllM2tKNkFGWHJaSm9Q?=
 =?utf-8?B?VHhJajZYTVZuYjU3SUE5SHVwaWd2c0JXOTJjYVc2NkVLZFF6UjEzOC81NXNM?=
 =?utf-8?B?L01YNVRKbTMvc0xNZThsZjNzSzlrZTdrc3BYRFp4OWkxY2dDS2kyaUVyK3pJ?=
 =?utf-8?B?S3ExMDdGdUZVcXBqYU5iVnE0T1pGclRoeW0yMkE4NVhXcHNVelNwd3FNVm84?=
 =?utf-8?B?a2diMlFZbGIxdDZnZ3pJcWM5TUs4c1JoWG1aOGN4TVp3cUZqbWlwSUFsN1A1?=
 =?utf-8?B?UDVBSGJVdzJ0dGlFZ3lWNXFHbDVScm9kM2VlOU5Pb2NlS3lwREw2aUxBNEdE?=
 =?utf-8?B?aVppRzJXY2RlMXhxQnhXSUxMSWpmUUU0dXh3TkxaS3o5U3h6QjFuWTNqWkpR?=
 =?utf-8?B?d2J5WEpwbldIa0FZUUZIVU9WNCtoK1NMRS9IaDFCczEwN0tsK3Q1U29iZ2NM?=
 =?utf-8?B?QWc1RlljcVE3TkxZV2liTi95alNER0xJZmhSbjBVazhKTHFLSEdaN1JKanZT?=
 =?utf-8?B?SXJwdUJ5a2hrbWU5djNOMkdmS3ZaMWRoZUk1Z2dZV0l2a3hlMlVid05sbEsw?=
 =?utf-8?B?WnY1czVncit1SThtWjhsTCt3OWo2dUZ4dzJFSEFKVVU0N1J5TTUzeXM3Uzll?=
 =?utf-8?B?b3dhNTlNS2dwVHpJdEpudVJIanRJWjBDdjQrMGJhVUZPWW1PNXJRRGMvOGJ5?=
 =?utf-8?B?R3MraElFYjlRUE5pRmtKQTlTc0ZOdDZSL29mMEJsTE0yR2U1SWhPVGRwSzFP?=
 =?utf-8?B?UFFZTlM3UWVnTUNSVE5obDhRcnF6MEhXdndNeWpLWS9nTkVXc2FkMUVCR2Vq?=
 =?utf-8?B?bmpwdEplS3l2MDlDd0NtaXBmU3JCSUdxVUVFcXV6SVo1bytWcFlGNERrV2xz?=
 =?utf-8?Q?HYOWEleF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3bf3b9-3996-47c8-feac-08d8c21a5ac7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 16:49:32.2808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuMvj0VpBiirX9R87V4qqiArYvQwK0YKk9DD0xa02Q3D593Onx0gx2740wDPWvaHbHeOXYVh9FoSbBtth+wczw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2889
Received-SPF: softfail client-ip=40.107.92.55;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 10:21 AM, Paolo Bonzini wrote:
> On 25/09/20 21:03, Tom Lendacky wrote:
>> From: Tom Lendacky <thomas.lendacky@amd.com>
>>
>> This patch series provides support for launching an SEV-ES guest.
>>

...

>>
> 
> Looks good!  Please fix the nit in patch 4 and rebase, I'll then apply it.

There's a v5 on the list that was rebased on the latest tree, but still
has the patch 4 issue. I'm updating that now, so look for the v6 version
for merging.

Thanks,
Tom

> 
> Thanks,
> 
> Paolo
> 

