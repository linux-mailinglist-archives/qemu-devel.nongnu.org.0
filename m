Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8FB4DB7CE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 19:13:28 +0100 (CET)
Received: from localhost ([::1]:45730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUY9H-0002jf-EC
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 14:13:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nUY7m-00021f-EB
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 14:11:54 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:1858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nUY7j-0002tP-PE
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 14:11:53 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22GF48xv010831;
 Wed, 16 Mar 2022 11:11:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=v7doM8XWAfdaT5Sf8L68HSNV+uBIcczDbO5ga9IpMto=;
 b=TPRFmI0RuIoL6/6ObJ0RGohP/9r7E6yZpF84fdE8RHtSsAlUJEw/QB4/NtwEKCbpqIC+
 up9AmG+mzIdsxIri/F7B/u/jKXXSf3qgNt1HfidBj4y5+9Arce0rGaZsrvJmGt2rvms6
 /IRioh73AXDHtXaAQcVLHhYsqFM+GgolbE1fKhOFObzqCg66ra37m0jOTRsgNNtM3rqm
 AJtKVlEGOfbZMagmII6B3z3xeluUvXRlbK4U6DueKOIKoiflnBs92WASxWa9tv+Zi2rh
 TMh4mdAf3u6BhLRLuphdI0TmuceSxGdJkxKLeXxenymCHEbbbGXumfy4TflNZL06aiT2 Hg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3et5vw5vq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 11:11:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2Tn8azehsgTnZDuDmeXVo7jynPDie6QSrBYuKAabUYbberiTdiQCOKMbp603WVpxNwU8k+NsBHcg96NLhB8jHsbswq1/WW/n9rI2lVH9VLAytFCeBVhdXgtSmhydL0/Rc9yXO+Rlyg5NtU8vWJFiVDGxUoAJIiNQZsEM+LGVmwhP9p3f4Z0DpdTLDdEZw+n/YwjwgEIRAUBB572BPO7zNc+SXmLdsnq2oeZN7sNTsabiWXfspJ59DZ5m6rr+tv46AptsT62045XU4JKAPxTd3+vEhpnfoPtlA6sXncdZhXL5U0KsFGB6QV3tOhROBEUf6XauTpivgB59i+jKsbnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7doM8XWAfdaT5Sf8L68HSNV+uBIcczDbO5ga9IpMto=;
 b=h1rAFxi6lgby0LuNyti4iuCxKe3yyGRNciInj4PvxelzR6RVs8lRuo19mPkd9eca2VfwG4g79fRw/yMftZGDBUAIXh+Iiac8VPhKdt223Czo9TYBvJNo6eVE0knMovsSLKELJH6T3RQ4s6iTZoolKWrx9KYUZl8oyzt/H3zWFzwROUtnxMd0UhGySPez/OIb0NWiMD7XEThwT4FgZMj/zOssddmqZSYUPmD6OBYXoCAV2YSZ1bJOyleup8BaQorcAH9/FWRef8ub40u5eIM+KeC7GmKWOsC6XJa2CUHjQo/hINUYPRTZeXtNY4gmOUzB9moGIPbItJwfJSovaHAUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BY5PR02MB6066.namprd02.prod.outlook.com (2603:10b6:a03:1f9::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Wed, 16 Mar
 2022 18:11:43 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5081.016; Wed, 16 Mar 2022
 18:11:43 +0000
Message-ID: <b68430a7-ff87-55be-92b1-e887a58dd958@nutanix.com>
Date: Wed, 16 Mar 2022 23:41:33 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with screendump
 as PNG.
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20220301064424.136234-1-kshitij.suri@nutanix.com>
 <20220301064424.136234-2-kshitij.suri@nutanix.com>
 <871qz88yu7.fsf@pond.sub.org>
 <30e38de3-3b07-b440-ad32-a189720db301@nutanix.com>
 <87r173o7h4.fsf@pond.sub.org> <YjBoS6qvjE6EHokR@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <YjBoS6qvjE6EHokR@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0095.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::36) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ae8bd5a-00da-463f-8d67-08da07786cce
X-MS-TrafficTypeDiagnostic: BY5PR02MB6066:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6066B399D679BFF95E5DFD9399119@BY5PR02MB6066.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fTVceFsELELDzniCrB9wvm8VRvrosjEIJqLDL1nZxnXlwx1f+zgESVp3tel31qDi3eOtm+wT4hM7j1VI3YxCeVmFAuxsb50d+TWoKaW+5neBj8GWIz9WnrrT2Y0q7fC59WMe7vifS+fqW+aQ/Uh0pY57yGVo8cB0DtZpM9WJ+sy4BCHOv8T2AAEPBbIc2AjVFVTd0Nx6zypcCaf5Gq3K3ohJKzrWkekLcN32ksZhkBtkj7slqUBZ/+A9KZDpZggdL3OP9dJgvh0r53IQpW2jte1X72BrV5V20zS58lgfdge2iBxeb/d7iPzof7uCBvyX05Kp6dnpHauNCz/SN/gyjvv8TyEcfk6tHnBaEL2GLZoehUByeHCvBr3SN2LFkct5GLms+jEmm0o2va4LUwTl8AxOHEpMK4+bmHTXqbG/FJqKB8yXJppzwDqIF7G7MWo8SF/+m2/cU64Au0ydlOxl9wZyr3CvJmSeEnri9/OBQNif1epZEMMiS4/9Tav5I0FO8udSXRlX2oqH1UOWT+vRDZo0PqYaS6PND+0idjeWe3T0aoLyKdhnCACVdkK7gzyV0mwQq2XPuOfdeDFHcxgrWf9glUNa6IGBwQz9AF2BDMypaYATp9RHV2pu1wX3dYk9Jl3krH3zrsOOQYTrZA+lI/X5j+S+AgTTUnh64dIdy0WIj68WzVufThKeakrpdcoMjrZsN9prgil8M3QFJJOeCkuW715TcSfcABpR2Unn6I9oGyEMNhWN/G8hoKKVDAZHCdymc2DuDJKpXOx700FMnGBkvbr0Wo7kcgC0QUAih45YLCRjxJzYBb7nJLAVCjfV6D/4OKX+kRTnJAgYQy4/F4Aa9pw603QOiCXsNDMSpYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(4326008)(66556008)(66476007)(66946007)(316002)(508600001)(966005)(6486002)(110136005)(38350700002)(38100700002)(31696002)(86362001)(36756003)(31686004)(52116002)(2906002)(53546011)(66574015)(186003)(26005)(2616005)(6506007)(6512007)(6666004)(5660300002)(44832011)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmNOdUlIRWZpVHVVZ3czbGlsZFZWbDF3TnFxblc1bUU2ekRmK0tQVkpLK0pz?=
 =?utf-8?B?S2VMSE4wY2FhVzhMZWdRVzdWeUo3ZnhDcjNEaDlySEtZVXBsUjhWSzd6M3o4?=
 =?utf-8?B?LzgrK0pqNHpZaWtpa29QZDBLeWs3b3RPSGNnK29XMnRseE50UWl2Ym9neWxT?=
 =?utf-8?B?V0t3a01JWkZGNHpUVHVNRmpZbXVJUzBjR3lGQVBJdENaRmdQY0hzQmltL0NO?=
 =?utf-8?B?OVNjdy9zQy9WK0VHV0R0NjM1a2k5SkZUa0tXZ0NGdHU4Mkw3WG1kWVV1ZU1W?=
 =?utf-8?B?SzBlZEJxcVVaRkkyejc4WVl2dlhFeE40MExDdjVoSjd4NndERTZyNUJnUWlh?=
 =?utf-8?B?eldkeHRrdGVIOGxycDBFdTVmdFN4VlhFSlhGRXk2U1QzRlVrbC9KTW00RHp4?=
 =?utf-8?B?Q1ZCNHVrOVllNXBqRFltSGYwNGZUQ0ZYdFpiT0JNSnFCcUJEajE4WVN4SGxK?=
 =?utf-8?B?ZEdNL214cVA4NnUxcHlZVGp0TWNtNTRjTnVaYTZEOURuMmNGekduN0wwc0JF?=
 =?utf-8?B?Z3JOK1JTckhMVVFrWEFxT3dveFFjdDBROWh5OWNWYk1CUlBvWHdESU1PK3d4?=
 =?utf-8?B?U1hiM29Nc0VwN1k4NDU3bVNPemdLYWEvT2dRK25WK3haTUJvRGNBekVxRy9k?=
 =?utf-8?B?b2RkZmRwM0FCU2svdm9vemQ1UHAyaGxxWUt5YnFlbmovRHhGcE56U2Z4VDgr?=
 =?utf-8?B?SUdocVRyWk9yWmZsWTI2WitVTk84MFUxSE9tZVpyaGFqZXZVWExnSHRMRWZx?=
 =?utf-8?B?Y0dJMWIvZ05tSUtIcW8wSm44aDVPZCsydTZKYnJvZWo3SG1EU0xFWCtzQXJT?=
 =?utf-8?B?bUhMZUtSM0U0OWtrbE5xTkdXbHlKTHA0QlZDdGo4N1NCblhwV1cyUUlkTlNq?=
 =?utf-8?B?VkVDY2grUUZ6TFNTbEcwdU5tYllJNnIxLzZZdld3WlRmYnNWYzRuQXRtOTFI?=
 =?utf-8?B?ZjlrU0lPcmR5RHQ0NTRpKzExMXNqZm56elhXV0NybTY2SlplRlVYTkI1UTlh?=
 =?utf-8?B?eG14R3VEaitsdmFmdmVneFdYTnNONE4yMnNIYVVNNmtxMGJ4QU5aTllPN3pJ?=
 =?utf-8?B?eDFaUkVCdUI0akFCaEFmeG9UbEhuemt0SnhzNHVzdzlvYkN1YlBiODUrbjRL?=
 =?utf-8?B?L2lYSHJaZFVrK09ra2Q1OU81T2Zkb0hlbDlDODhqQ1Azek5TMWZVbEVrcFc4?=
 =?utf-8?B?SUFCSFU0V3RrT3ErRjFYTVZad3ZmOHFUb0VxbGJLZ2xRdTZuaDlDM0c0NGNE?=
 =?utf-8?B?SUVQblNFd3pSeW55NXZLamtaMGowQTJUenlraGZjamdRUnRETzlvendRNWpG?=
 =?utf-8?B?RlNRQUdDRHZlNEZ3Rm9GQlhIZW9jeUZaUXlheWY5YU9hakpPa0VVR1h3WUxu?=
 =?utf-8?B?S1VHcnM5VlFHWGpTTGVWMi9yWUVZTzVQcFkrdE9OMy9JS3d1dnA3RlJmSGd3?=
 =?utf-8?B?NThpL0lWZ0NaZ1lVMEhNQkdGandyN2F0a0VQVnpocEo2WEFJTlZnTlBSWXdi?=
 =?utf-8?B?dTlVWUdCaDloSVBNSW56cGVNQlZ0VW03aEhsNytsS00yb3djb1hMazkxWjln?=
 =?utf-8?B?MVdvL3l0QnJBS0tzWFZzTVc0MnpIb0diWjk0NDUxemMzZk1XOWtTN0NKV21Y?=
 =?utf-8?B?NC9UTFVJMW9uV1VaWmt0OXNQWlVPeXRjZlI0bXVtaVlMRlU2bThXS3RwWk1S?=
 =?utf-8?B?UzB2VmpOVld4VkZrQldKdml1MHh4Vkx1dTdvaWFsMGxuZUdlUzBwVzhpVjhB?=
 =?utf-8?B?QlhQZW03eUVSOGRDb2EzYlRSSDZUQk1TTE9JVW1hbmRCV1dGYWwzcHBGRjNv?=
 =?utf-8?B?NmtxN1psOWt0bWNsc2hZZXF3QlJKZE1RcUtpb0R1L1NOWVpRaVVzUzRsS29F?=
 =?utf-8?B?dFpUaWlRMkk5M0QwMGp3NEFPSTNhZ2pOcUVnL1FPaWF3L280M1NKbXpNK000?=
 =?utf-8?B?T0tINjNrQWo2NlNqZ3dCQWdQM2ZXRk80SUpuNDR5dk1YbkpLSnFzcnZGUXpV?=
 =?utf-8?B?SitnT1BVa1lRPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae8bd5a-00da-463f-8d67-08da07786cce
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 18:11:43.1167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Px8usyn0C82c+pm16j9bGb8+K6eRUazCiHUfidxk70pqn2s0tMrVC3I4EaV0u9eZEPohSV381L3QCvpSfBTnsmgPFNtfSRmjVeP6N2V1vGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6066
X-Proofpoint-GUID: yeXlDka0XVcbwq2cyovTHJBAO9OF-aSQ
X-Proofpoint-ORIG-GUID: yeXlDka0XVcbwq2cyovTHJBAO9OF-aSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, prerna.saxena@nutanix.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, kraxel@redhat.com, thuth@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 15/03/22 3:49 pm, Daniel P. Berrangé wrote:
> On Tue, Mar 15, 2022 at 11:06:31AM +0100, Markus Armbruster wrote:
>> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>>
>>> On 11/03/22 5:50 pm, Markus Armbruster wrote:
>>>> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>>>>
>>>>> Currently screendump only supports PPM format, which is un-compressed and not
>>>>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>>>>> to support PNG image capture using libpng. The param was added in QAPI schema
>>>>> of screendump present in ui.json along with png_save() function which converts
>>>>> pixman_image to PNG. HMP command equivalent was also modified to support the
>>>>> feature.
>>>>>
>>>>> Example usage:
>>>>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>>>>> "format":"png" } }
>>>>>
>>>>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=SxmcA4FlCCy9O9eUaDUiSY37bauF6iJbDRVL--VUyTG5Vze_GFjmJuxgwAVYRjad&s=OIKnm9xXYjeat7TyIJ_-z9EvG2XYXMULNbHe0Bjzyjo&e=
>>>>>
>>>>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> [...]
>>
>>>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>>>> index 9354f4c467..6aa0dd7c1b 100644
>>>>> --- a/qapi/ui.json
>>>>> +++ b/qapi/ui.json
>> [...]
>>
>>>>>    ##
>>>>>    # @screendump:
>>>>>    #
>>>>> -# Write a PPM of the VGA screen to a file.
>>>>> +# Write a screenshot of the VGA screen to a file.
>>>> Is "VGA screen" accurate?  Or does this work for other displays, too?
>>> The patch didn't modify any display changes and VGA screen was
>>> previously supported display type.
>> Let me rephrase my question: was "VGA screen" accurate before your
>> patch?
> No, it would be better phrased as
>
>    "Capture the specified screen contents and write it to a file"
>
> In a multi-head scenario, it can be any of the output heads, and
> whether the head is in a VGA mode or not is irrelevant to the
> command functionality.
>
> Regards,
> Daniel
Thank you! Will modify in the upcoming patch.

Regards,
Kshitij Suri

