Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A973B3E48
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:12:21 +0200 (CEST)
Received: from localhost ([::1]:56280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwgwm-0003ah-JI
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.sucaet@ekinops.com>)
 id 1lwgvk-0002T6-33; Fri, 25 Jun 2021 04:11:16 -0400
Received: from mail-eopbgr90117.outbound.protection.outlook.com
 ([40.107.9.117]:6368 helo=FRA01-MR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.sucaet@ekinops.com>)
 id 1lwgvh-0003Au-3q; Fri, 25 Jun 2021 04:11:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvHgBtTU4UrnhvbVmT3mqTVJFTXInvoQmk+DNitiOlpaM77ZVq/rKWWGbrsM/Mn9j2fSYNwxPnxUpTLrTLCs0twKFdBrcb0YWZo7JuC8y7RhZaDdt6Kt5nxd9C/LZXnr7Cn/maq+sHYtujBnxh6fz3D0rEtZyj06Vw9odz2+GgtImE8k1B5LKNAgtK3lC4bHibarP2DeoHnGDd5/Ma03vz9qoC1N0euE0NemSVUxPysgP25C50x7E/R1lzxv7ZdzJH1NrUa0EseeY4o0f6evCBBpdwPgc18SEmxkMFtUOkux/QnjwL0iP5BZt49TEtuUdMB6ftV2XzSMEuCAY8l01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhWThQs5KzLCZIgrb5XAXAEp4aU+Sj577FE7h+4sPTY=;
 b=fJZwuVhQmae5TniA1vI55HT06tMBaUuNNxWwEQVgcNWkkhIHTv+RP5coqjjNfyhtPHQP776wiDnj3DCHFxKJW/eq9gp8XZgsk6Awr0ioYiDFCNnEvxaoI7iClwlIf2ZAAcjW0nzf5GsGNCu2oThwyVTPDRdj0Y9v7yPjNtB1uWDB+gyXQg1Uf7gJWm/c3+nHauV+A0+JWpKCJf8ipWH4y1KYPTFrGxa6q3TszTnuLaetGHQcjo+zAT5kRBUK+PHYryR63OV+afcbAgR6L97DslE8ZRR2+Mg4FN+gOAhZ1Zk1MzaSXR2cwJeZdOE4McyoIVVNPSaKsxWIJuGs+J65wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhWThQs5KzLCZIgrb5XAXAEp4aU+Sj577FE7h+4sPTY=;
 b=sXcbxgqi04aK2Qap4GLCSmLMME4bemz7dY5lqLkJD42z12n8nhmpHwrj89y95+GbHlapM0J1NCe9wMYVZhVpKhPpmRVJVB2KEjSEbcV5muv+10Pn+K9fujDGEynFV2u78u8HB4BFn9rW3KsJVZ7QXhLTbODk9K3vEXvF/Uxagfw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=ekinops.com;
Received: from MR1P264MB2882.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:37::5) by
 MR1P264MB2049.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19; Fri, 25 Jun 2021 08:11:09 +0000
Received: from MR1P264MB2882.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f048:eeb2:4799:cbaf]) by MR1P264MB2882.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f048:eeb2:4799:cbaf%9]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 08:11:09 +0000
Subject: Re: [PATCH 0/2] pc: acpi: revert back to 5.2 PCI slot enumeration
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210624204229.998824-1-imammedo@redhat.com>
From: John Sucaet <john.sucaet@ekinops.com>
Message-ID: <9dcde2ef-fa8c-24a6-921e-e5953d79ba74@ekinops.com>
Date: Fri, 25 Jun 2021 10:11:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20210624204229.998824-1-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [81.164.113.191]
X-ClientProxiedBy: AM4PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:200:89::12) To MR1P264MB2882.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:37::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.123.92] (81.164.113.191) by
 AM4PR0202CA0002.eurprd02.prod.outlook.com (2603:10a6:200:89::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Fri, 25 Jun 2021 08:11:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e41b4239-0678-4933-3706-08d937b0c9dd
X-MS-TrafficTypeDiagnostic: MR1P264MB2049:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MR1P264MB2049076F27734463AB0A43B8E8069@MR1P264MB2049.FRAP264.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVm64bRVteyEG/SAKgfd7mtjLTtRCbHid4xHocz2tnQiGbOy8oWZKofOwpnCi8FhMoyFN4t2wTaVzEuZ6pBCre9wfsep7w/yrojnNXmX35XErd6M89mSUA3UIteiY+zYHRuPDhkgUYItysWiPR2MXw/UhxFieJy+Kh0KKVxd5qeYNJmmpLPAux5KzrBv93yJoUjjqmXGBOy8cCCm/I39MIG1d493uEOpMYXX6116b+MSZ7EL1cTAhwajgLifBm97Kopu60uJxRknBEKAftgKf2ERjqpljBhEu2iUylInHL/4hu1H3rTG7RyHBHwkNgX6VD0B+JXQqzpFu7XLZsOdPgjQ3Ge+WXYF/OPOPKsTIvUMrmFtr4+/Tmwf9p0VFCTHuiQ8zpQFPqSZRef8J64zv4/GR6BpUQdFn/Bj2OCdyQ2zaFkE64PBE1ZcwDo6vfIQjkT7Td7xWCTFCycQKIlA4diUBziTU+wYQcSuXgcFfF6vc2FGwg/3P87EJhU0u5Rw3usZQIpKc/8mSZROb02GM/tsUD42qpwguUGeoAGzz/igWFteYHwvCjNuIvcKCb5XxyNL6sY1fBruWTMPTODgA/vBZIte41wOsS96w0ZzBnflyDl9WznwvzEU1803MBBIw5CLrMUrrmHwTjzge807Py3PcS57ynVA6pZLKoohiuFRpfm0ULSS8m4SIN/6vidWjT3XC5yKecuinqgTcM+hC8sr7qKDiy3KiP2v3fIUM1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2882.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(396003)(376002)(39840400004)(31696002)(8676002)(53546011)(83380400001)(6486002)(31686004)(478600001)(44832011)(52116002)(956004)(66476007)(66946007)(66556008)(4326008)(38350700002)(2616005)(38100700002)(2906002)(16526019)(26005)(316002)(36756003)(5660300002)(186003)(16576012)(8936002)(86362001)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW9MYmExMEN5T001OXA1cTYweVpoY1lRMGZXZHVtc0tUdlkxUTRMYVBJMFhs?=
 =?utf-8?B?QnRBR09xbVU5WXRpQytDNzRDMFd0cDJaU08wNXVEMDVhZEl4OXl2anpwUU80?=
 =?utf-8?B?TzNFSjFNM29LZVdFckJ4WlZvYUtTc0NYMWMzMlBjdEcwc0wwNDltSmV3eHdz?=
 =?utf-8?B?SlFKbkpRdjlpL2hqblhIL3VTaTRlRU4xYXNXOVVSRWJkRjRRZjlkc0U5Z0ps?=
 =?utf-8?B?UUt4Qm12eGhETTZTVGFsVFg3VDJBOTNHaE1sOEkyQWVMd0VWREVhb2d1Y1ZB?=
 =?utf-8?B?b3ZEWmw3bm1vRHg3RzlYWjdaMzMreitaWStEM2NJdjlQWDdZSWxPcWNJVkFW?=
 =?utf-8?B?dnBtUEdZNnU5MThhdldEaWQzMzN0UVRDVERVdit1cXJJNktvTHJpQ0xZV1pi?=
 =?utf-8?B?cWxyV214NjNyekIyNHkrWTZKT3U2VmswdTJJNDZJVWJxYUhYeFVCa3R0MEs2?=
 =?utf-8?B?UjNSS2Q3Wm5jQUxsMkdnNTYwSFBnNEVxRVpWRW1Zbm1XbTJqUndtQkpLY052?=
 =?utf-8?B?ZlYrMjVTTkRybGRiekdPVE0rUVpQcDEyUW5xQXc0ZjU5elRTUElpZHhTRUN1?=
 =?utf-8?B?OVI4Z1Z5cXl3WnpkSWhKV2x3Mkx3ZEdnOTgvZi9Vak9WWHRrd0prTkN6UjAv?=
 =?utf-8?B?aEQ5M25ERC9NMzZTNHpmazllTU9wMndFYmlGT0xBQ1Q1YnEyT0FET2c2eWwz?=
 =?utf-8?B?TWgrUVdsOGFyYWthbTVCdndROE4zTE9aT2hNUmVMandhT0NhNzNQN2lOTFNB?=
 =?utf-8?B?Um1VaTd6TWdhUEJzdVIwcDRRUGMrQjZSYzV1a2dIOW9qQ1U1THI0bzlGNXUr?=
 =?utf-8?B?M3Uxc0l1M1dOZXNRdFI1M2dWVFo0Uk9RdlUyQWZVSEttcCtESVJORkQrYkpJ?=
 =?utf-8?B?cDViSjhPODhvdFlSMkM0Vzd5ZUdGdXpXVEhNcFV0Z0VoSjNMMVp1VnArSFkr?=
 =?utf-8?B?cnY4cGVjN0VuNWxBS3N4eEhqWGErZ29aM3JLU0Zxa0h3MnJFOG9BbWpkdXZT?=
 =?utf-8?B?dHhZemJMakdZNjl2dWNJS201WDJiOXJjdFU5Z3pBREtWWnY2eHdzeTRpbnB1?=
 =?utf-8?B?N0NBZ3h4Z3NzRm1scjVzUkNvOWpIcEJJVHl0b01uV3FCb2E1cTN3WENma2dF?=
 =?utf-8?B?WmJ6TGlEV2ZHN2w0Z3JGaDhDWlk5ZE53bEZsdVl4MDJqcVpRbDcvK2x1QVhs?=
 =?utf-8?B?NUR6bWprWmFidEdsbTRsS2JLbmxtdnFRSkVtZXYrNmpROGNLa2QrMjlkak5j?=
 =?utf-8?B?SDk1bWg2TmdEcFhWMEx2dG54MlkxK0xBY1Bya0N1SFhWNFc2SmwxQ2tFdERG?=
 =?utf-8?B?WjBIU1hHdTFFQXduRVFvOVNYQlhOc1JuVzlRd0J1SXBTZzFUc3VXVXpzNmNx?=
 =?utf-8?B?Qzg0T2Y0WUpJSytuaHpiRW9ZRTA1SlZTajh6K2F3Q2NkcGd1SDdCeU9VNGgy?=
 =?utf-8?B?azIrTm96TEhNVE9oMExDb3JIKzVKS2JpajFLRVdHczZUSzdkNXpqWmMza0tv?=
 =?utf-8?B?L1pCdjJleXZndjlmeEc1dmF5b3E4Rk82b2tlbVpCN0p1b2NHNkYvK0NvakJG?=
 =?utf-8?B?ajFGRTI5UFB6OVJMRW9TNC8rVUVjUUh3Z2lyTWx6bXNZSWtqelNhdFR4c2F0?=
 =?utf-8?B?Y3NYQUxxUGFkaUJHUFAvVDhzVGxtVFlMV2FONXQ5Vzd2Q2NlS3JVQ3dCSzBz?=
 =?utf-8?B?bzRRQzUycFZtczlNRUdjZk9wQmQxbS9tSk42NWdCWFRock9BZTBZOG92VzB2?=
 =?utf-8?Q?Exd1057teDOb8318DiEN3MAZeqlVOOu6m7NQkMh?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41b4239-0678-4933-3706-08d937b0c9dd
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2882.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 08:11:09.1151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DW4aa00MptDiIckOa5SpClHWVke9ab50gKMP5xRR/wOOfffbL+/fR2ts4sfPVsXEut8+EdwJPk7NgzsHXcPsnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2049
Received-SPF: pass client-ip=40.107.9.117;
 envelope-from=john.sucaet@ekinops.com;
 helo=FRA01-MR2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, john.sucaet@ekinops.com, mst@redhat.com,
 stefanha@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: John Sucaet <john.sucaet@ekinops.com>

On 6/24/21 10:42 PM, Igor Mammedov wrote:
> Commit b7f23f62e40 (pci: acpi: add _DSM method to PCI devices),
> regressed network interface naming for Linux guests in some cases.
> This reverts PCI slot enumeration to its state before 6.0.
> For details see 2/3 patch.
>
> Thanks Stefan for troubleshooting!
>
> Reported-by: john.sucaet@ekinops.com
> CC: stefanha@redhat.com
> CC: qemu-stable@nongnu.org
> CC: mst@redhat.com
> CC: marcel.apfelbaum@gmail.com
> CC: berrange@redhat.com
>
> Igor Mammedov (2):
>    tests: acpi: prepare for changing DSDT tables
>    acpi: pc: revert back to v5.2 PCI slot enumeration
>
>   tests/qtest/bios-tables-test-allowed-diff.h | 10 ++++++++++
>   hw/i386/acpi-build.c                        |  9 +++++++--
>   2 files changed, 17 insertions(+), 2 deletions(-)
>


