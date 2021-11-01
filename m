Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DDD441CA9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 15:33:05 +0100 (CET)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhYMy-0002Zb-6b
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 10:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1mhYKZ-0000JY-JL
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:30:35 -0400
Received: from mail-bn8nam11on20608.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::608]:44257
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1mhYKW-0007mK-VQ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:30:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHvM6Cw32B3kf+rYLi1wgZW9spd0BUBjHe/JSty6Xxg2VOY4CQoSphKZrA9+31+D+rwdBZgy8TO71r1t5ezY2uhFDeFsZVxIqmbvhzN3ga+D3OexjZTlPELx9lmFwqVQhr5ONTbEyZq3KW3PfrNnM7wJSOlqGlFrjCUrDc3A99xJPatJZyFzqswX606pPjmvi+7EDTHsC1/3MPPHyTvouGGpjziFasixq2CxnG58sLPJRmRg6V0GfSBRklBu7sOncDPJ1pP4k+huZYPcG0NW2wdUfxNlqBn1WXbGk8l+e3Eyrj7vAMY5LHh0ySHPbX+aduZEE17GS2SnsxoMR7j4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYD0OCl9ITCiKV12nnujvKMloSoJtKNOieaLABVznBs=;
 b=RRhIQqnrptaZfeckSgyRicrdt/0XVpmu2L4yKECTEeK2/F/d23njjxg6S4tePNlP2HYro1DvvZURYee8c3V1TKT+sDfqk3arckud96zOVuSnA9obstxxY4JU2dPHcSFx9dQzD0hnURYPc0dnN+KCj5jBRHzD7nn6Pt/1cA/i8B7q+qga08gIaDAvF2GRuP4sE5aQL4o63IUlJGPQ7KMI3UjFhgQV3ydDWkhw3SJivA4AkdxK6w1BM9jomarvsLLTVCLu3HRBGJ/eK3PTT/9mN0PN1m0AyCHffGkEe1Tk1MDWNnMsg69bc+nVbj0P9ZqFbYEF4QtL4VSdBBxiafWKVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYD0OCl9ITCiKV12nnujvKMloSoJtKNOieaLABVznBs=;
 b=tEaREglYD/+39qdZbCOU6EBWJfHEw/hat9DyEXD4n4VyPib4PbEudNaqSUyFYQI/vNJqAp1fQgXVZKoHT4d9Px3vOLP8I+Est1u/ng5vftQLhteGirXta97FL2myoiBEs/7SNkLmbMpISBwe2e67xzxrEVUpa4jUIaxrBJXDvy0=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DM6PR12MB5536.namprd12.prod.outlook.com (2603:10b6:5:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Mon, 1 Nov
 2021 14:25:28 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::a87d:568d:994f:c5f9]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::a87d:568d:994f:c5f9%8]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 14:25:28 +0000
Subject: Re: [PATCH 1/3] sev/i386: Allow launching with -kernel if no OVMF
 hashes table found
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-2-dovmurik@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <24823e7a-b4e6-150c-df41-a373850301a7@amd.com>
Date: Mon, 1 Nov 2021 09:25:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211101102136.1706421-2-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:208:256::25) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
Received: from [10.236.30.241] (165.204.77.1) by
 BL1PR13CA0020.namprd13.prod.outlook.com (2603:10b6:208:256::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.6 via Frontend
 Transport; Mon, 1 Nov 2021 14:25:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8100bbd9-b2f0-48b7-0ac4-08d99d4373f5
X-MS-TrafficTypeDiagnostic: DM6PR12MB5536:
X-Microsoft-Antispam-PRVS: <DM6PR12MB5536D02B384F7B948113CB8EEC8A9@DM6PR12MB5536.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g5x/26uJ5RtWz2e/HrHzCviYKwcdN0+uQAeRNJlfGxitIqlswyxjibW1fdUdon1ZDnyZyKBsh/FNiHhZqu4hAGfV1rWNGeoSaEIvRZ4tEE5+1Pjrg/5hCHMwcLNZQFKCIvQdoAvUSmcpYE6Hj/+Yk/0QBXa3k/pmRU/CAvaqpxJzHXL0hGuQIoIJqMOuXjcbJkfqPOgD4Px7Z9bm5YSqmJnMjzZcSFKqUbAHer0hWvm0ulu62NXeyUr/ufq1Dv65/0Ke6oX63TzS+ejK3upAuAJvXWI+Keph9x6uAMQBRH3rasUY0rk1vVJO0wa8VcDaIOaW4Sta74gnhFqAnFJq5b6DJiz311lQ9DEQj5dbVSaT++VDd/fu9WgmmnHE9z1a9uFOdwQTU2jOPO0qctSnk0/LlaMDunaBJQCPw5X9ZeWjghl7U32qBilghDSXicK+CqBaTCqrbQTV+aoczJaPO5QR5NHFiVmmYlFS/rXtgzbrNTH0nUM1GHPTSimKmgGC/hn4tpYtJ+6OK+Lx66RAHlAFi9pWHGkcro7MdzhObVnHDTbVvSy3umtrwhOwqPeattq1L8mE/8b6ytXp+JZU+HB6+GfNUZu0SjjaxgG/bKSiU+Yj7EmYcXHy4H6ndLOH+gEMxOdKvZx21QCbjp2CuzxZKl7LvKoq6wlV7PECgIM3FVFGrrTglQ57+y7D4w5y4RtWTAvbUau0iHNJS9kpbqaZQB86CxAZ67sOiZ6gifxq8uWSiqjwoBAm5wPmqu+2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(54906003)(36756003)(316002)(16576012)(508600001)(31686004)(6486002)(2616005)(38100700002)(31696002)(86362001)(5660300002)(66476007)(8676002)(66556008)(66946007)(83380400001)(26005)(53546011)(956004)(186003)(8936002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3ZmaWpxMmdMQjVYVU5PR3JONjRhcTFiSVoxckZ2WXI5Q21KSWdtSm9sSXF2?=
 =?utf-8?B?eGY2ZjgvVU1FUXRxV3ovOHVXdTNuREZCaEJBc0JHUnFNbnA5UTV2VU1jdEJE?=
 =?utf-8?B?bXYvQUZ6QTdKRnFXMmhMQWRUMnI4TWVpU3JaMjdDc1oxR2JtaThlakM1Y1po?=
 =?utf-8?B?a2FOUW9FMXFYd01jTHRIYks2QjJzSWhYUHpra01NVnhWcjg5N3NlMU45UGFZ?=
 =?utf-8?B?MWJNZmpIQjRxSUxEMUY3NDlZS3loSzZwQjYxNFdBVEtmeEFhVUFrSHNRbjdq?=
 =?utf-8?B?ZHlpeWp0bVIyQVlEQzNzU1BYZldLQytQd3EzQmpBRUdYai9JZ1d4bXVPaXpI?=
 =?utf-8?B?bytJYWZQc0lKTk5Ya2FRZWd5R05CMi9zMmJ2a0c5VVJYbTdIVnI0RFZTbXFz?=
 =?utf-8?B?MlhZQXdIaXFVRllEaHNkN0xSY2FGVGZWVzMvZVlNRDVTakdEbGxtOEUzTUF1?=
 =?utf-8?B?c1o5Zkk0dGxjQ2hLdnpHTWVoQUczd0JGN2hRbUVGVUIzeEo2TDdDZldSbDF6?=
 =?utf-8?B?UDd1UGZ6NlBlY2pqZnVaZGVVWE9TdWRTU2wxWGt3S2h6b1NLL3B0ZG8wUkpk?=
 =?utf-8?B?ZE5qSlB2aGYxZ09mY0h5bVlmcUNKUDJMOEN4QnRlNTI3cHhTTGZGUlBqUmtt?=
 =?utf-8?B?Q2JyeGlyNGdNYXFQeUhTOTlJUTNxSzJjUkFUdzE4SE9xNEF3SWlYbmVQQUhn?=
 =?utf-8?B?WVlvaXViRlQ3T05pZkRMNERtM3JLQWl3WmZ4TlByZWI2MzBSckhHWXVWWmV3?=
 =?utf-8?B?a0ZlVEp4S2YyUXdzV1hNUGlIemJrcCtJWnVKMTFsRlFOdHpxV3pFVkNpS2pl?=
 =?utf-8?B?Y1R1Y0dBZ3Rpa1JBSWR1VUtmZU1ucDBZZ3JBQlNNcWdndHc3ZlVNak9sZzJO?=
 =?utf-8?B?V2ZmUzFtSnVzL0RNbjR6UVIzVmhTZW1YOW5MYVFBeXhwWjBhWlFzbmRsdVdE?=
 =?utf-8?B?S3kwd28rYlFGQjFoUUYzcFVGWVM0S3BXQTlhRjdiaHl4TFkzMmZna3VDcGFl?=
 =?utf-8?B?SUsxVCtodEx1djdrbExSTHdPRW95Z1lmTXhTKy9ESXVOcTdWakhxVGJPZ2pW?=
 =?utf-8?B?bzRDZlZVMStDbkp0U01LYThYbmpSN3RST0pOZHN2ajluU1FHN0h6a1BrZ0tH?=
 =?utf-8?B?a3pCT0t3UmZtVlVWOXZFL0NLUTRUampqY1l2QkxjY3pRME5XL2phSENibERK?=
 =?utf-8?B?cFVGSEJDV2tFK0M3OUU2VmFiNzhlRnd4SXdiVitYSTlzdkJaMEFueWN3aGUx?=
 =?utf-8?B?Y1poVGRjUFBsK05HSHdPSERkUWVwMmJNd0RyZEhHRGFBQThrV0hKdlVlWFhU?=
 =?utf-8?B?R3VNUGMwR25xUUpxdXo0VFBWdTdzYmJUZzRHTTFVa2JaWjlQdTlWenJoelZq?=
 =?utf-8?B?akFTc3BsL1JFUkgzME5qcXBWeGpabngrUVlXbHZ6V3gwYW9aRzRRYTczRk9a?=
 =?utf-8?B?dlZJMkFvYnIyZmZEazVqN1orU3lOUWRFNThvY0h2Rk8wQzVGWFhxVTVaRWJr?=
 =?utf-8?B?aVdObmd3VGlBK0krU2NzaGgwekNYOVJJN2tSVWVabGphNmQ0c2RTdzVRQnE2?=
 =?utf-8?B?L3YrY0h5WDAyQ3dRWXdJcmozMnVjdDBUVDBwbDJ6U2JuaC8xNFRvTVBLSlJV?=
 =?utf-8?B?TmNKWlg3UkRwb1A1eEVoanVOZmczakZQbXdtUVVvRUxCU3lGSnp4NFFicHdy?=
 =?utf-8?B?NENWalNYbjF6NXRrM29zWlJxQjJJT0d0UEJCQ1VrWTM1T0N3WWtCMU02Wm1I?=
 =?utf-8?B?Q21GaVNWMnQ2MVBXbXhibFpSQjgzckJpbjNJbmRDMXJwUU42eTRPWWd5RmRL?=
 =?utf-8?B?TVVzQ2dIdU5SZ0dZVXBqTWs0NzVJajhNRkZpSmp3VmZVN1lCVkxscjI4cE5J?=
 =?utf-8?B?RnVXczVUVHRueXBWNk92MFlzWDlHTlUzUEUzSUFwYWtQYjVMZXVSRTY4Tldr?=
 =?utf-8?B?NU45Qk9KQ0NCRnNvc0sxb3RROUlOaW9uMHBLQ2t3eDQyZWVWd09nd01zTVhY?=
 =?utf-8?B?UCtTbmlYK09HSTRiQVZTdHdhQW03VnNRMGNOS2cwbElGdTFPbGo3Tlk0a2Ja?=
 =?utf-8?B?Y1FiMGtESU5PZ1VsY3QwYlBnbHJaRzJ2NWZLRHVITUtUM000TndLVmFHdHBs?=
 =?utf-8?B?eWU5V05zTlhsejBJcEo0YmxGMnRPUnJIdEdlWllIcVZmSzRkVGJJQkc5QnRt?=
 =?utf-8?Q?v5CyA9VwE19lLGU3uFAc4fw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8100bbd9-b2f0-48b7-0ac4-08d99d4373f5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 14:25:28.7705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBXgvyyMh+oKwnCIcbPtTlZ5RY1M9h2CxTfUrU75XtOp4FN6TI5H/+w3bF8eTbkn1CeV9JUydclk1AMlpS+ETQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5536
Received-SPF: softfail client-ip=2a01:111:f400:7eae::608;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/1/21 5:21 AM, Dov Murik wrote:
> Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
> for measured linux boot", 2021-09-30) introduced measured direct boot
> with -kernel, using an OVMF-designated hashes table which QEMU fills.
> 
> However, if OVMF doesn't designate such an area, QEMU would completely
> abort the VM launch.  This breaks launching with -kernel using older
> OVMF images which don't publish the SEV_HASH_TABLE_RV_GUID.
> 
> Instead, just warn the user that -kernel was supplied by OVMF doesn't
> specify the GUID for the hashes table.  The following warning will be
> displayed during VM launch:
> 
>      qemu-system-x86_64: warning: SEV: kernel specified but OVMF has no hash table guid
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>

Just a few minor comments/questions below, otherwise:

Acked-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
>   target/i386/sev.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index eede07f11d..682b8ccf6c 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -1204,7 +1204,7 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>       int aligned_len;
>   
>       if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
> -        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
> +        warn_report("SEV: kernel specified but OVMF has no hash table guid");

Not sure if warn or info would be better, either way works for me, though, 
since this allows the guest to boot now.

Unrelated to this change, but do we explicitly want to say OVMF? Can't 
another BIOS/UEFI implementation have this support?

and should guid be GUID?

Thanks,
Tom

>           return false;
>       }
>       area = (SevHashTableDescriptor *)data;
> 

