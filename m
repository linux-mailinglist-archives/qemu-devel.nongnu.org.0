Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF3D4EF8AA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 19:08:58 +0200 (CEST)
Received: from localhost ([::1]:46322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naKlc-0001W4-RU
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 13:08:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1naKk4-0008DJ-NH
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:07:20 -0400
Received: from [2a01:111:f400:7e89::62a] (port=56609
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1naKk2-00007E-4a
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:07:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwJ3hKtOZB1gXc1v67bpkka7I2px0yN00LK1qbxS718deRlBTcVGJt2CuW7rqu+lHLSdf1cF52vRcM2V8y9ocqdFqhC4Z+/4gbMfjA0MuI40uZhkvNZlvTaz7oMOzlZtU+N08AacJZMwAXel2nbNreztNyQkYrOeN2LNTjezb8izXfb/gZ2UmBRyzxg+G+MhQp9ch1v6Bh25unXLewW388+GFG0NmcQnU/9kXoiWw3t5FKibJzPOnQNQwa6DpZl5aBDbH12JpJ/KnLt4DJzhkcgcM8heOnisGf1omQIKE1rev9A3/9kACdRcrXvMMIHbzD+wYVghsqNBjTQk0jLYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJUZvszKMlkax6oLEoh/GJUkhwz4ku5cqipvh45x8hc=;
 b=kPgYWG0ux6LvAXJK3t+FAVPORahHe75yAvUtGbbVH7gvWyC70WK2RFP218nsmW7YdV1fWUWeTU3BBaibSoZBpBvckakCLfZZbSvfIuFdjZXIgcngxlqXmKoBVgcMOxSpS7mxWd9FU/pyTqJsRe4RJgkGaTEiGwF3vxmd+SIYN5pNi/EKhS5lG0/Nfv8ptr8vmHTJNlxOD3fNsEdC8L9Mhm49xnyjiCz/+vvLtRFXbVlCAipWCX+6wr5MdxoTlZxeP5Ow18q4yiWopfDixuxEwo/WeqlmeJUkgruMDlqJtAgXQThwtoINzTc3bl7j0VlrI3z5hNUTBcvAl2XnOoUVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJUZvszKMlkax6oLEoh/GJUkhwz4ku5cqipvh45x8hc=;
 b=djYuKDjyuGKzRL/LNa+ol/+Ch24Y9URXmqpH7fbpDNxTxRbZeDEKbFwtZM/4CAQPTw+94SzaFA390PkO0LOUlG0TtpQryMFRzxlkMUTnrDa6ctVzAd676w3MOYkIPVaLdQOWsyhOR/o+vlkGD7rPQwNYuUchwSI6QsWjRuS1VRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0201.namprd12.prod.outlook.com (2603:10b6:4:5b::21)
 by SN1PR12MB2461.namprd12.prod.outlook.com (2603:10b6:802:27::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 16:35:40 +0000
Received: from DM5PR1201MB0201.namprd12.prod.outlook.com
 ([fe80::f1c0:2437:714c:f92e]) by DM5PR1201MB0201.namprd12.prod.outlook.com
 ([fe80::f1c0:2437:714c:f92e%11]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 16:35:40 +0000
Message-ID: <ab12bf44-3f63-dbaf-2eb1-f5b1e991949c@amd.com>
Date: Fri, 1 Apr 2022 11:35:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: who's maintaining amd_iommu.c these days?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
References: <CAFEAcA_17Mzz7AiQd+1z50Jp-wWhfChCVi=8kjWCU6daUVqV_Q@mail.gmail.com>
 <YkXzToltd73X4WgY@xz-m1.local>
 <CACGkMEs41rX5FqtKst4qZc1QXyY1VvMK_GMo_4NRD45zh9VSHg@mail.gmail.com>
 <633f66f9-2a86-6d52-15de-d0c557412bf7@amd.com>
 <CAFEAcA9KogtFm0g1+T40Kfz4GDRMtfhDeJ0jTb5dfax5E4voMQ@mail.gmail.com>
From: Wei Huang <wei.huang2@amd.com>
In-Reply-To: <CAFEAcA9KogtFm0g1+T40Kfz4GDRMtfhDeJ0jTb5dfax5E4voMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0048.prod.exchangelabs.com
 (2603:10b6:208:25::25) To DM5PR1201MB0201.namprd12.prod.outlook.com
 (2603:10b6:4:5b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c3dae9d-4b2d-41f8-1ff0-08da13fda8a3
X-MS-TrafficTypeDiagnostic: SN1PR12MB2461:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB24616409377F10AA7CBF0A90CFE09@SN1PR12MB2461.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F708vLd5ZRoxHZYviQcJz0czSsoNzIzqMJ4UWEY2bKsPdzE+V9+BE67UIo9OKUsxqhghy08pisS9ts7VOoOgUv9Xng1JhUHo4lc8cSskLpCQayxexXw0RlH4OIWKPghWDsld40hVa7TmxviNvaGZqPkJWngK0XFLv3s3Ywtu/MxJkx/t1KP6eCw8+cXR2ljOM17euy8FsEwKceWYNZeVQqzRk0VQZoBCabkaSMqxJe9qlJ2560O2HOfJU0wYCwMGuCENCZtEHwvHBycLkl8glQqbe7Mu2lziU4dnFqd7cVAn+3lfRMJTMLjc1tSZLvXlPmtWxRLdEzS8+AgNdSBpL1CqBLbwvva4cmcnj+0rE8ewk0uK1JwIj4ppMURoqfNzYjVHTbmnkaSAnJmqzo/CwUhYUOyUvFWe4xYC02D+2DKueBh+RmCh5Lz4SLV1s966UYG9E3VMJtCYeMC3rzv1KUw2w4mD1HHNmBc/RvJCy29T6wnSJ/mvQ1qKsTIVfISE7dPX/ObCA7vufBgC+XlatmTGRR1Y266zdIqvW0frvIAD3lkGqAo8kRSRQIJ1anIBq/m7d/i07IBSDL+H9BOUglXvalTG5xqLckHAb4nDnQC/rxfxO3GmRNoHz9ovX24elnQGfLnkC/704OCB/aI515NyzMOQkgbHskvBF5f2TvmsppgzGGBJqFxNfyCZI8Bs20yIYRtoDaQAIQ5UvJ49Tj0COMQZHWC7Lcv/Vvgqi9bR19TU/+BAIMGczmpwEnVWdXEOQh9I5k/N61J5Ts+66+8x+woj6yNXH3PDMhIeIIyR20XXahxsM93yjUEz8skAz6T0xyMxhiG/oZnEXm0D5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0201.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(36756003)(8936002)(66946007)(66476007)(316002)(66556008)(54906003)(4326008)(508600001)(31686004)(6666004)(966005)(53546011)(6506007)(6512007)(6486002)(6916009)(8676002)(2906002)(186003)(26005)(38100700002)(2616005)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGpnNWo2Y1R3N1RCcXdiZGVwWmFRb05yUmFyWnRhWkNMMnNSaFZQekFKa2JR?=
 =?utf-8?B?ODdRc3o4M25lcEVBSTFrZ1ByL3l2cWFEa21QT0FudGFtWERDcTFjMTVNMk1x?=
 =?utf-8?B?ZGF6bkk0V2t1cnExR2Rxc2lDN2JmMzhnVjF3d0o0dk1rcHlPNzFsVFpITlQr?=
 =?utf-8?B?ajBCcGtNMXlpdUswR09RYWlmS1NFZDFrMkZPODhKckNOS1hQekw3MGttdnRQ?=
 =?utf-8?B?TTBBUTkzaEVPZ0xRa2Ztdm5SSUEwc2ErbjFOb0hBbzZ5b1ZHSExCTjF0K3Fh?=
 =?utf-8?B?RUpPUHFRNjdkVWdaNnczajlSMjRYSTZkTVJHajRYN29tc0NWa2pGMm43TEhk?=
 =?utf-8?B?aWoxUy93SmR3Q0V6SnJYSzI2aFZxcFQ0RnZpM0xsNUQrS255Y1ByOU8zZjZZ?=
 =?utf-8?B?MENKVENpb1NXVHJ4d0lzKzdBazFDTmRZWE1YaW5BN0szbE5MbS9ZUk1ERWZp?=
 =?utf-8?B?Nkg4aFBYRENEWDMxWlk1TEVKUkp2RTMzRnRRWjYwZnpIN2ZiZTAyUG1sWTRz?=
 =?utf-8?B?Q0JYSlR2ZURZK1liUzFocWNiWUEwSTBXVjZ1cWlxWUx1MkZRMi91RFRnTHMx?=
 =?utf-8?B?UkNXK0drYjQwZ3Ewa2FOeUJIajl6aHRaOEorVkdSZ0QxRUxmdXFHUUdVZUZq?=
 =?utf-8?B?K3ZkcGZvY0x5U0NpTGlWWDRMS1VEMHRiM0EwSTdRQ0JIRE1LS3ltaGxuZHZs?=
 =?utf-8?B?Mnp1cjdXUFo3YSt4NkpzN1VLZmh0djhzNVJZaU5oVU5DaDFMNytKL21uL0JS?=
 =?utf-8?B?RUhwTkhicUZ1U1AzVGFUSUllQzdNaG1rYm0yUk5PQ014UWVmQ1JIYUt2OWF6?=
 =?utf-8?B?dVdPblhNd2VGaHlObFZGa0ZOL2FVK2FiMXFjNlRLUnFha2tXWkQzVWZkVDNa?=
 =?utf-8?B?UjZ5bitKQlNJcVloSngrVURuYXA4V203T2dMNVVCSHduVzdGK3BxSHA1V0l1?=
 =?utf-8?B?dS85SjJMTmRML0J6OEJIYS9FeWpNMkNGQXpPUElnYWoxbW1OMStDY0VpMUta?=
 =?utf-8?B?bXZ6N1dzUTJEaCtidHVnNzlNa3BBOU5oclVTbFpHeithMFJtMlU0OHNnNUxY?=
 =?utf-8?B?SlUxWHYyckhOUEt0M3kzVC92VlVDMHZyVElyOTV0YkFrMlh1eDFkakp2d1d5?=
 =?utf-8?B?MzJDdTFYU0lKVHlEOEVaVW0rVWFBZlBGTjdKMVkwVjFqbXRrQW13STNsZ1ha?=
 =?utf-8?B?eGFudlZtbktiR01VanQ2TnArNDlESHBZVENrdDlrWE5HVHJLWW1YL216TnQz?=
 =?utf-8?B?ZXBaNTQ3NEczOXdwMGJsd20rZU9YcEdUNElyVjR3b1M3VFl4b0hZNU1TK2du?=
 =?utf-8?B?MTB0d0hOdXRYN3N3Sm5aMWh5VDdQNG5PcVlwZ3E2MkY0dzNJZlNoVFg4SFQx?=
 =?utf-8?B?aFZvb3UxdHFDaWRqanhlYXVYcXZKL3VmbXRyOWY3S3E0bjV3WDFIc3BDRnV6?=
 =?utf-8?B?aml2ckxqbEFlSWxEbUV0dGhKMWYvL0lsMkZoNE96VGRHSmNBa2tBZC9yUjkw?=
 =?utf-8?B?ZUFEVUdtMk9wcC84Rk1tQUJud1E4a0xFQ09wUnNZWXlobDdJYnR5R3ZYRzJR?=
 =?utf-8?B?M1o0SFFoRCtBUTBnZGk4UkpnaElZNW1OclFnSVY4YTVJRDFXSXJrZHlJS0xl?=
 =?utf-8?B?RmY3OTUwR2RCMC9ZR3VHL1Z1eFpnL01GdGo4ZStxSjY0ZWVNOTUvM3NZTGIx?=
 =?utf-8?B?bkxoZTlKV2hzdFdKVGZVQ2pYQzJtM3dOT1ErbUlObmE1Q0dVL3pPVk9STjIx?=
 =?utf-8?B?M2kxT0RmNUc0SmdpNWtwdVZmTWlVVjkvcGp1cWdrZGc2TkRPQjhSdHJDQW1H?=
 =?utf-8?B?K21SZWdXZkhBSVd4UGdBM3NMSkx3WWxRTlVLK0FvNm5rMWNLbm5CUmNHUjFu?=
 =?utf-8?B?YStJWEhBMjhNUEFCSGlncktrZkY2YXhHM3dkb0tVZTlTSXBPMDdoZzU0K3VD?=
 =?utf-8?B?WG1SWUFxK3lPNENjYUlnY2pwM1JGRjE0Y0dmWk9UUWxTNU45aTBQeUxRVENP?=
 =?utf-8?B?YXc2YnJSQ09BeDFsamExaEJXT1dvUTFIMEp5VlFmeTZDTFV4NGhFMWViVWda?=
 =?utf-8?B?VjJySUJxczQzdE02OXMyV1R5aG9QK2pZRXF1R1pSR0xPbTkzNWVCdytFRk9l?=
 =?utf-8?B?dFIyWm1VdWFqTFYyVzJvV0YzMkVEeEJPelVNei9mazdHZEk5UCtIK0h6aDdQ?=
 =?utf-8?B?MndKc2cxTzhMb0VoeHZDV0lBL2FmdlIvYmVobC8zalI2bTlFMFlEdnVGdjJa?=
 =?utf-8?B?T2VrVEV1VEgxSGlVaEhnekV5aUxGQTN4anowYTZmQmVPck1kNzZyUW1NaHR3?=
 =?utf-8?B?bHlSL0tsMTQ3aHZIR1lPWU9CL2djcGZoMkVlb0g0SHdJTkdjWHA4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3dae9d-4b2d-41f8-1ff0-08da13fda8a3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0201.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 16:35:40.4512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZiF75fK0yuOWLvTQhP/4Tocb25kEKdPb925l1/51T0saIrazJj/3QxXufbTQSS2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2461
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e89::62a
 (failed)
Received-SPF: softfail client-ip=2a01:111:f400:7e89::62a;
 envelope-from=Wei.Huang2@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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



On 4/1/22 11:14, Peter Maydell wrote:
> On Fri, 1 Apr 2022 at 17:11, Wei Huang <wei.huang2@amd.com> wrote:
>>
>>
>>
>> On 3/31/22 21:09, Jason Wang wrote:
>>> On Fri, Apr 1, 2022 at 2:30 AM Peter Xu <peterx@redhat.com> wrote:
>>>>
>>>> On Thu, Mar 31, 2022 at 05:01:52PM +0100, Peter Maydell wrote:
>>>>> (4) The claimed bit layout of the event structure doesn't
>>>>> match up with the one in the spec document I found. This
>>>>> could be because I found a document for some other bit
>>>>> of hardware, of course.
>> Could you elaborate? Are you referring to amdvi_setevent_bits(evt, info,
>> 55, 8)?
> 
> https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
> was the spec I found through random googling, but the event
> structure layouts in chapter 2.5 of that document aren't
> at all like the one that amdvi_encode_event() is using.
> Maybe that's the wrong spec, as I say.

The spec is up-to-date. But it seems amdvi_setevent_bits(evt, info, 55, 
8) is problematic. Use amdvi_log_illegaldevtab_error() as an example:

     info |= AMDVI_EVENT_ILLEGAL_DEVTAB_ENTRY;
     amdvi_encode_event(evt, devid, addr, info);
     amdvi_log_event(s, evt);

info is encoded with AMDVI_EVENT_ILLEGAL_DEVTAB_ENTRY (1U << 12) and is 
used by amdvi_encode_event() via amdvi_setevent_bits(evt, info, 55, 8) 
into event log bits[63:55]. This should instead be written into 
bits[63:48] to match ILLEGAL_DEV_TABLE_ENTRY event format in Chapter 2.5.2.

> 
> thanks
> -- PMM

