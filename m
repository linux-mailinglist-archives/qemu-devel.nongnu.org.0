Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57F95544A3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 10:31:06 +0200 (CEST)
Received: from localhost ([::1]:57938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3vlR-00058l-Oa
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 04:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pankaj.Gupta@amd.com>)
 id 1o3vin-0004Rz-Vh
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:28:22 -0400
Received: from mail-mw2nam10on2076.outbound.protection.outlook.com
 ([40.107.94.76]:55969 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pankaj.Gupta@amd.com>)
 id 1o3vih-0007i9-DG
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:28:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrE6KqjCE4XftyYUc94jY09y2CKzzw3iufzxPNFKnG0f4m8o0CK91QAiRVGwFZundxnruBSicLJg8SGfGvuz0Q1NNX5se0930ZU6UIKmLXRu8qU60y3bvF3ch9kWHfK5y9gwtzivaxL3yqbaeO6JEo5Mt9JBX012N6/UTmvRGvW/sPewiKvQZEg6FH6mDqxFPk3tEmA+d+KqxNJtKYAbC6bREyXZ1qbE2gs3Wp+zdRlS6IA1n/yVcXpAOhbGLojn4qYZ/UPtulGntJZCoW2INNZsq51lpNUNSz+p2OjFENxlMBwZdbNod6qlU85d/OZXqPJy5cSoybcl6dwWi72jPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/jd3NpzX5egEkt1JBg+dnH6LoLh55ddwOaa6JgAtSM=;
 b=JvLzvBD6AozhrWch6k02WER1crnKtvbpjjVPAqEtKLgdQA+zwZwCbf4HJXucQkxLY3TwmUq2ZOioqGZyzslMk5pFPCOCbtVJT8upNTaewkFOc8YdiqvWUQE2lLfxcudI58Sa35mciN9ucQTphdpMmaxtHBLAo+wD25kvsdM6rVTKdQOkQKzR91ww4v0AndI3tDD20RRinrixIz+zPEwehJXLM/W1qDuUQu/FHf4the1KvfBcEGK0TtSzVwKLhiVDmIfha0JcgxanqIO3XEROjEjMeHcSa3jWsgxyV2Li7H6Z5uQh2qHqmR9PH2wXgg6kNQ5PPLPqsuTuMfrNi02Z/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/jd3NpzX5egEkt1JBg+dnH6LoLh55ddwOaa6JgAtSM=;
 b=YFgXBVJHtgpdhIZ3Ykme29Cld3BhabCy8OXcoz5tCcS/nqy8Etn1Pt6EMMopsYw6VE/VQNWPs0zsMPXnYpWfWkrDQ0m7RXA8fDRcAWzRl0GlBriolWbBMl0XMyZuk9YuLyafjGuwLXGMMG/CD5oN3WjS44MoP5iNZ3sXdX/tqLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11) by DM6PR12MB3641.namprd12.prod.outlook.com
 (2603:10b6:5:3e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 08:28:10 +0000
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::1001:3c79:9504:8d6a]) by CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::1001:3c79:9504:8d6a%10]) with mapi id 15.20.5353.022; Wed, 22 Jun
 2022 08:28:10 +0000
Message-ID: <bdc579f3-3acb-cc22-65eb-b94e7590e376@amd.com>
Date: Wed, 22 Jun 2022 10:28:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/i386: Add unaccepted memory configuration
Content-Language: en-US
To: Gerd Hoffman <kraxel@redhat.com>
Cc: Dionna Glaze <dionnaglaze@google.com>, qemu-devel@nongnu.org,
 Xu@google.com, Min M <min.m.xu@intel.com>, Xiaoyao Li
 <xiaoyao.li@intel.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220620223300.1555849-1-dionnaglaze@google.com>
 <5d6b2bdb-dc17-2985-c723-9449b40c26f2@amd.com>
 <20220622080407.xnohl6t276cljoik@sirius.home.kraxel.org>
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <20220622080407.xnohl6t276cljoik@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0063.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::8) To CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 195d0594-7c5e-4f6e-a3f8-08da542923af
X-MS-TrafficTypeDiagnostic: DM6PR12MB3641:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB36414E9B950632B4219320629BB29@DM6PR12MB3641.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zM0phu4/Yl5vH6x/mrE7N3qVKWHlFVDgIqkNwImZv8iT6cA9/vAx9BU+ZmIRjOiSEiMsl8yRET9a2GPwoo0dhgLRMhjcEMfQGFEDNq4XeDYamBaJK86n4URf8+LxLdgPQJ1ZBjmvzCRYGriKpJyRZ6mLFDZ3JaPe9NqH8c9QgqUQKKf4desn0q41lk9ZbSg6WEL3zUvluH04Uy14MDQxnpKKU/eP5iHcEbjSiGUOlcxlnvw4HLsFvc5J1pvGqWec1nYP2MYz6JpVWSoXRshbZCv/d7gEzyurV5cp6yeoyDDb2E4W7AGV6TizLHq32OyUml+T0MUKvv7zZ4M5JDZ0ofQMl7QJEcZGPb0hL3MOSviWayESJDr2YQ0Nq5ePIrbqiDBdnwg90EEEVGZcR8smO+ja07y62cMHXZ2Ne4G5zCHPTRyQTwIVumwJRtMRwfP11VqoeJslHRSH0b9n1cHVNQ4KMj6zHeQqhh9O4oQuAYkg1978ez1uFmMlbmDFxN5bQb1K8ibJlsX8pvd4OdHtXtf1KeSQLdnevkv6DtGcjfwzPbyDjWKYPacCJ3FRXwKtvjxFm69GUir69Ma++hlYKuXbBQEn13D1fTxUmtoO65dn9WTStA+TO9KDpJhXjb4ZhU+x1YrubCGsoeSGqEgr2wV0LZTwIXWo5ydKEyE5c9ugQrPqf0dylB7Mj9dIQU2oMhSyU8Fno88t+wnCWSlxjqcAs9121YxQR/eYu9DErwaPZaLY23SpjSKnXF8eyVIsyhalHo5NbFFPyY6IwGPEKoYyt57nA7HIlQAIYLHAClc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(83380400001)(186003)(38100700002)(31696002)(86362001)(54906003)(6506007)(41300700001)(66476007)(2616005)(6666004)(5660300002)(4326008)(31686004)(7416002)(8936002)(2906002)(26005)(6512007)(6916009)(316002)(66946007)(8676002)(6486002)(66556008)(478600001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1RSM0tEUElxanRicGRjU0RCWGZqNU1RZkpocitTTjdJdDMwSkozQy95NlM5?=
 =?utf-8?B?OWdEVFJQUWtkVjFHNWhwT1dSQ24wTXVMUXJvMk02eWRLZDh4clFsT1ljUFpq?=
 =?utf-8?B?YzZQaVBpQmREUmdmeGxnK3h4bzJ0cVNsdnJFOS9TWFZUdC9HdGU0SFBkaE8x?=
 =?utf-8?B?VVEyT0FEcFkveUFTUXFGN25KM0JKZHRrTkU1SGpaR212OUNveXFKQ0hjaW5T?=
 =?utf-8?B?dG9Dczd0bXdxclJzc0RoaHV0bGRDM08yZEZiT1pkUVp5Q0VwOC9hc3NTUmkx?=
 =?utf-8?B?ajlQVy9kdE5yWWJLSHVldzhWY2N4WVh6VGIrTFpkUVN0VnlwUXkyNjE2b2ZE?=
 =?utf-8?B?b2U2b3ZPN25iTVZIVGNVb1gvNE9MOXBaUmV1d2k3Z1NQcWJRdGpTWDB1dUZq?=
 =?utf-8?B?aWdxYTgwSmc1YzlYam56OFJiaGMybjN0MXdWRzdrOEhWVHNwNXZFRitiOGFN?=
 =?utf-8?B?Zko0NERLbUxLanUwejFVeS9vSXhIZVZyWThVSzI2M3cyS3BPYm1FNzlpOER5?=
 =?utf-8?B?M2paMitqVXVadzcxaU1FZHBzMUVXejRFU1NNT2hzTUw4QXpwRVRzK1lKeWhn?=
 =?utf-8?B?eWl2YTR2TFhDRDI2SE9kY1VnOHFlUVpVRHlUd3JTb20rOFNmUFJpNVNoaGxB?=
 =?utf-8?B?eXY1cHNDVG1mYUVtaEcweXUrODJON1N1dEtESWVRUzFnNE9DUTdMa21NcnBM?=
 =?utf-8?B?MnF5QnVESWV2NW1zTVJNd00wcGl2ZDRFOHhObkxEYmRyNVU2RzN4OWZranpP?=
 =?utf-8?B?cUJ3SHZvdlhDbFpXc0phYTBrTGxOYzhrYnh0L3Nyei95THhZaVRBUEN3TXho?=
 =?utf-8?B?dk16ZEdtVnNiM0hHa0I2QmhMOW5aa0VtOTNXK3VVVVBCNTNnZ0JSRnd6dWV4?=
 =?utf-8?B?UW0zMS9renV2Wmt2U0hBRGZYeHZ3NFVXVFlXb0V5RXNiYjZiWEdFOVNLWEQ4?=
 =?utf-8?B?Tk5URHoxWE9Xd2x1VnhvWlFvMGQxdU12U1UxVDRzRVBFZTl5eEdNS1RCbzZJ?=
 =?utf-8?B?WEErRXBYdC9sY2JVakFrYzQxN2Q1RTdIdVcrS2ViVzRyTUNiUHVNbW5uRS9R?=
 =?utf-8?B?THRXR0V2R05SczhsSTZjTmgwMVUvV0Zpa1gzcmxwcW84U1FtMWpqVHdQaExw?=
 =?utf-8?B?a0toVFJQS1lDYy9zbG9oQndmYlpCeXlrNFRKMitWdEh3YStNQllFWGphY09m?=
 =?utf-8?B?b2lCV0psSk5sdTIwVVkyMUJic2ZvWGRLbm0vWEU0c3Erc3hqYmhUTVlFNjJP?=
 =?utf-8?B?a2xSOW9BVHZNVWNLV2ttcTRhZmQ5dERyS3NrV010NjFsNW5pWGdlTG45citi?=
 =?utf-8?B?WUFrekt5N09UemNySjVBTXJ6TE1NdXg3NHU4VFNoUGpvQUVuM0VxajFxZkxy?=
 =?utf-8?B?M0tRaDh3L0dxLzc4NVp2TjBKUFk1cmZIM24xSC90Y0pPalE4SzhwTDVCN1N0?=
 =?utf-8?B?dmxQaE1Kc2UwMTNSN0hxbGVsTGFVcFdrcHhreFlVdGlmblBkZjZwczJETVF1?=
 =?utf-8?B?L0pDK2JuVU9Ib2NNa3pyMklSMnQ3L1pxTGdaVU80ZFJUbGVvMW5vZlF0eHJE?=
 =?utf-8?B?YnV5NGlMcVFEdXRRM0NlNldlUk1McUlqWllaWTJHN3NNYzB3NFl0N2Vkampk?=
 =?utf-8?B?azAxMmFXczg4UUFQWnp1YmZ6eDc0UDF5eE5VcWxWbVlNd2oyd3BpL0h4UEtV?=
 =?utf-8?B?Qk5hTENiSnRlSnljL2lQZ0NGMjhnYjdHWHljWmpXeWJ6UDlqQ0hrWG1ISnBB?=
 =?utf-8?B?c3JRdVlwQ2NiV3RvOUc4cmJ6cEpSQkRzOUh3bjhrVTVzd0pCekV6WXZpRmQy?=
 =?utf-8?B?TnpPR0dZMUFNdnhqMzJOTWdxNnZLL3hEMlZodnRrWmVUSVExK09odTJCdWQy?=
 =?utf-8?B?WnBXMHRYSVduNDEzb2JQM25LVzRIekNWYjdCK21QNlp2VVJjMjFTTlhsbjVh?=
 =?utf-8?B?L1c5UjVuWjcyMHA0NVdhWGpwL2dIY0hXcG5BVHdMN2NkdDhWSkhWZVhFWEQ2?=
 =?utf-8?B?RTNUNGwyWE85RTltRC8rRi9VUnJoNjYvUmNPeDdQSXZ4SlFFM2d4dkdLZndp?=
 =?utf-8?B?L04yN1A4ZmsxZE1YdDN3R2dxREVqR3prMzN6UTU4aW9CODMxb1h2eFZ1cDEx?=
 =?utf-8?B?a1hJK253dzhGWWx2NkthM0hiMmlsRlV2RXRqZnhGRmRJdGlyWXh4cnZaZ3hq?=
 =?utf-8?B?QnVkbUJNT21uMkppTFJoTmFRb0t3cit1L015YjNiVGlyalZBdkxzYWVZZUJu?=
 =?utf-8?B?QTRScnk4RUYySTF6aU0zK2p0bWwyKzZnR3pDaklvTXdMR1hFQ1Azak5ucTdm?=
 =?utf-8?B?NWdDWnlRZkttN1phdU1lK2x3T2EzN1J5Ujh3RGtYVXZFQndFUFVYUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195d0594-7c5e-4f6e-a3f8-08da542923af
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB0181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 08:28:09.7951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mvX0br/noqgGI/59ffNJee/jZMmkSdM7f1eF0Cz9K8dL+JBrvMAkvLDXiaI6qdgbZlscCADgfVV01bEsVuhwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3641
Received-SPF: softfail client-ip=40.107.94.76;
 envelope-from=Pankaj.Gupta@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Hi Gerd,

>    Hi,
> 
>> AFAIU 'true' is the behavior you are proposing with your EFI changes?
>> Saying that what's the difference between 'false' & 'default' wrt EFI
>> firmware? Just wondering do we need default?
> 
> true/false will force the one or the other no matter what.
> 
> 'default' allows the firmware to choose depending on various factors,
> for example have cc-specific build variants have a different default
> behavior than the generic builds.
> 
> It also keeps the door open to change default behavior in the future.
> One reasonable approach would be to start with firmware accepting all
> memory by default, wait until support for unaccepted memory has found
> its way into linux distro kernels, then flip the default to pass
> unaccepted memory to the linux kernel.
> 
> In case the uefi boot service spec gets updated to allow negotiating
> unaccepted memory support automatically this can be used easily by
> making that the firmware's default behavior.

Fair. Also, it would be interesting to see the right future combination
of {un/a}cceptable boot vs runtime aceptable memory and also support in 
uefi specs.

o.k to keep placeholder for now but I still see, might have to keep the 
interface extensible, maybe something like bit level negotiations
than true/false/default etc. But for now I don't have any strong opinion 
or ideas and have to catch up from uefi side.

Thank you for explaining.

Best regards,
Pankaj




