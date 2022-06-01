Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD553AADA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 18:17:21 +0200 (CEST)
Received: from localhost ([::1]:36388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwR28-0005uh-BI
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 12:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nwR11-0005Cn-VB
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 12:16:11 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:32430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nwR0x-00058N-Li
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 12:16:10 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 251B1YXU025886;
 Wed, 1 Jun 2022 09:15:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=//FwWZKcK6EWoeTrUQ+sMsnkI5YlQFTrRBJFv658vek=;
 b=Bu4LkbtKTnISFg2jW4EgE+qAYr0FGBmuiHGKYB1q4Dz1um1OZ7fIcDtU0o6455ilZgaH
 YZbR1z9naCoteZpso7i1pg/rtfidxI/zE2bkWTsJhuglNJ+kcfiCdz0SPbZELKlgWXX5
 T6GWyqFal0We8XlAGizTFT1ee46sfG7x8GOB5CplMPxSMYme1iM5cMxfZ+3iepdxMOMT
 18g9zbUXPdNCwsKV6GyWw61HSU7BPaghFKatKChMuARRKc8FhvjT4J2H6HpdAv5Z3zGI
 M5hcPhYOOzjbNDwlu8kw/ceFHlVgg2f389Qv8DtRT54xnUzdTpkFGOJSQhB9rkjBr3MQ Hw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gbjteyxwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jun 2022 09:15:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKhGkAC7NxAwhQlwyRPhq/tsizrX6w5KozFtsIX23B/zgPJyxos4CX2Q0Nl0BR4g6RHi/uwqQel/2Dw3JAuZmDIYwyiJEE543PAne/yiBTyxJqsGMn+vCiGMz6Foyej67oiAqGouhLJU8uk7bnpeK5fCvhibI9/D94LZKqgDgDvathpOgXUY9vdKoOXZH1D1ORXjpOrzitnpOtpopW93+W7nfjMbMK8JPltKDkjZbY1P+88uMGPtHwcNhDDzNsIZw2Q/ak79wxVDVu225VHfeQmE5dSlrO3IMbZvm8sQW6UaOA73QDMbyjifCzMnEmeZeHr/ulVL2R7k3AKAifNB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//FwWZKcK6EWoeTrUQ+sMsnkI5YlQFTrRBJFv658vek=;
 b=OHlPmcetWCM5QCFSfQheBmObKG2L4S7Uh9ybmleQP7IFEYo5j2u+//8djM1hdeRBdem0XYWTS/I7pSdxwRil9vhliHe8oKsJ43hR/9NTg2cU8zp7pswUz09o0Dbwc3AtmDgvyHBUPX0DUt+hIp+sMGbz/g0kwQp7g9ZGA/vfQhDi42vgZFIyOXDw20TDxgQ0mkVWujl9Tz2rYrQWf+wDsoP1/ohOWzFMPfYT2jd636EqR+c9hqKFaFQtC1E8weNRSJ1zOr3NWHpEJUBrIKFyHDJRJBrTobTTiv5gZLdZiZ1i4GblHCYl+QS05FWp7wa87aklnUJymKPJpu4MfSRA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CY4PR0201MB3553.namprd02.prod.outlook.com (2603:10b6:910:8e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 16:15:56 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%6]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 16:15:56 +0000
Message-ID: <53afdfcb-76d2-e23f-f70c-2cbedb0ce310@nutanix.com>
Date: Wed, 1 Jun 2022 21:45:40 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v17 6/8] softmmu/dirtylimit: Implement virtual CPU throttle
To: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: Hyman Huang <huangy81@chinatelecom.cn>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
 <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn>
 <1e117589-1719-0d11-099f-9f3392e0ba6f@nutanix.com>
 <f98ae9a1-8d47-7995-ae0d-101c626c3be4@chinatelecom.cn>
 <f0e09ec4-7d16-b022-0949-4599a5378356@nutanix.com>
 <fb42912b-e3f4-f0cb-fb16-671ba75bd7ef@chinatelecom.cn>
 <Yo5RiqKWuwZPY6Iv@xz-m1.local>
 <CACGkMEsiLUxEKD=o23aaHzo5AVy-vTRPKhxtT6-cTT+ETtdpaA@mail.gmail.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <CACGkMEsiLUxEKD=o23aaHzo5AVy-vTRPKhxtT6-cTT+ETtdpaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 649b9c69-1e0e-4c1a-f463-08da43ea01a8
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3553:EE_
X-Microsoft-Antispam-PRVS: <CY4PR0201MB3553FC476EBA2EFE931F995AF6DF9@CY4PR0201MB3553.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v/L/L+2oCTzcE886O9UVwAerUhQjeKgo5dtJC3TLhjEDnRDEANJN3hruZkcKzqrmjOWlQWAm86lHmPi/gdEbnaz3qiOQRv+V/nkLaodYJdRwEU070aGK72SSFQhVJ5D8K2scjXU8PJAHQw1ziiWWCmejS5795cNVAEq/aa2e9MAeWmHZT6Q8zvP20AU/cZ61NkIrmf73IjR2LcBMaQPoT1yGCLlCxh5zgZC+S2cwo23Hmna0E9eQUIUgJgxjRSfpb9sj0bnOI7Lfb6vErCMuRutePXXiAtRQKOLDj6z0WugMT2ps3Ze7V7yKVBvjOoUHrKvXxBFPlpGJRe+apFlgCWobGhM62qtVoxBTmfuVPbHpNt8fbzE284ajobghpxMu5vYB7yG+9Gq6s+tt0mnM2s6z6ddrVM7wB2NbyKY7r9HKbYRNlAXeoeM+pVKawdb5QUnEYDAoc4dTXiCj6WrquULtFvw7rm0IFOTpS7u53Y7E2eelZy5IH02FNo1cKNi33JqnJRmohmcI8wXZpzcnpYrTO5kYFlg7YSFJVztGPAtQCvs8Pwz5atsHAAEKQ2VHjxniO1AFZR0TpZhn1/fmIf0R/8bmPJ7pGPLfz4K1tpy8vvHuM0O5cHPf0XcL1nm07sl/XWk1jY8zBZr9Ubwfwmpj0837EnrtkWVRHK4qg/UYl8O/ZOLWQoxc1r79KShqjt2EQ3UrSYh9xmr852sMf1U84GJ9p0QSrxCh7HUIsQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(8676002)(2616005)(6512007)(36756003)(31686004)(6486002)(186003)(86362001)(26005)(7416002)(53546011)(316002)(31696002)(4326008)(2906002)(66476007)(6666004)(66556008)(110136005)(54906003)(83380400001)(508600001)(8936002)(5660300002)(6506007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTE3eEErMHdBWnczSGJPWFBtWkh1MitkeXF3OXB6aUJtQ04wTFpXZ0JqNnBH?=
 =?utf-8?B?aVpIY3BLdUcrVkt4UFRzR0JuZmFBTG1NWFMyVmpMZHVSUFpWUVJsQ3ZweHBw?=
 =?utf-8?B?eUVwaG5qMnVYTExKd3JDWDV6N2plRkU5clpTUFFkcWpka0IxNFNhdkFYYVBq?=
 =?utf-8?B?T0F2V2pScGhWTytySm4xSklmQjBNdzFvMkRGZEFycUFhaXg4aG1mY0N0ZTlS?=
 =?utf-8?B?SWs5MXE0TmZkYjNHemVENWhJUytkdGo0MkNYN2RNRGw5bGpKZ0VmY0FPWEt3?=
 =?utf-8?B?eXV2Q0pBQzBTS2VqTCtqRWFORmEwbVlzanhnb2E1TUg0ZUJPTm9VcWc4MEJZ?=
 =?utf-8?B?bjkyb01aOUZuL0VOYkZHMXhHeHdrbHB5RDlIUFlwY0crQmpVMTZ5eE9OL3NP?=
 =?utf-8?B?MEZ3S2tJTGVwSHlBcFZUREk4bDBpei9zdUwrMm82NFYyZ2FSQkMvVUFIYmdU?=
 =?utf-8?B?emo4UmM0Sk8zeFdESXBLTUkrckxsODhCbktJTzRadkkvdUlLRVdiN0kyRml3?=
 =?utf-8?B?QjhWelB1Z09UdkxTTGNDRGlGQlV1amloeVBsT05KQ1VDcE45RS9ZRUJ2OTly?=
 =?utf-8?B?Y1pBcXVTL0UzVnRQclQ2YTRCd2pZdUZHRHl4T1pqbXNyNjQvT3RmeHRqaWFu?=
 =?utf-8?B?Yy9yK1FERmxmdEJqRnBpTGM1Q2xHVFpMNks2bkpYYkN1QkRtVFhiRVlzV1Na?=
 =?utf-8?B?YUliYzNoNTdvWTNjeGhoVXBteEY2OHBlWlVQcXJqaHVVZDlFU3Y4aDE0ZDJp?=
 =?utf-8?B?aWhORmZVUkdWQ1Fpc284MU9ZVnpZVnlMckpBQXBOZjNua3Vub09ydG5uOEhl?=
 =?utf-8?B?bGFXaUtxaU1nbGVEN0hqakVmRG1UMUd5MnJqNFJEdmE3eWE2eUt2aTVMNUEr?=
 =?utf-8?B?dzhCamhZRFV1MjdaMVkyRkw3bUwvNk4vMnV2STQzVFJLSFg5ZXVMYklIcmlv?=
 =?utf-8?B?REMwZWZ2WFRtaWtVTkVWZnA2cjZ6bmhSaGNZWXVmenN5Q0N4MDFra2c5WWJQ?=
 =?utf-8?B?RkNrNVZ0dHVpUW1OajBhN1E5bkV1Z0hMWWptVkFEYUFBSXdzaUNJSXljYkJ2?=
 =?utf-8?B?K3VIdVRHcVZuM2UrS0ZpRlcvK0V3NGlzam13MkR1UW9mOE9LOE45d0RzdHd6?=
 =?utf-8?B?M3lpdXJnaWk5cXdXWFdwZHd6OXNpSm9vbE9kSERiakNrdUNvZXNlYTNzRjA4?=
 =?utf-8?B?QWdNZUJ1ZkpTODI5dkhlamhlRkx1T3FxcjVkcGw0Zi9sZTZ0a291MzZmL0RM?=
 =?utf-8?B?NEs4OURyNVl5bEI2UTJIekN2VVpqN2RROEp1eEExSnNZQUx2aXgxQUNnWDZq?=
 =?utf-8?B?enJJNlljOFJnejR4Wnl6QXEweFQ0TlhCNkZUS2lyUUUxcjY5Wk9BWTkrSGtN?=
 =?utf-8?B?eTBvUU5aSUw2dEpNMGJHMkJjeWF3VGxkVVlZeUlqMVlIWW5kNmg3WHJseDVj?=
 =?utf-8?B?dkVwRUNuNk5EaTVVKzZRVXpFT0ZLNWlVZmhhWHBiLzljRnJOZk0rdkNocHkw?=
 =?utf-8?B?bkJad1ZyOURhbmEwZnd2MWhhMS9oczRRT2xhcjBSb3o0ZkExdWl1eVJTTVNk?=
 =?utf-8?B?eHQ5UVg1Q3B0K05nRWR0aEJtQ2FySks5YlN0dUhkUjlOeDFyak0yWTBsbWps?=
 =?utf-8?B?b3htUnFTY2VBWCt2eU1nVFVXQjN3MDh1L2QvbVgvWkE5cHM4U1VPYUhhek9o?=
 =?utf-8?B?aGhVT3hzWUpvS1M2akNITmF1VHFIdGEyQWpHb0JHdlpIUTJ4MDFQbi9HQnRU?=
 =?utf-8?B?UnhFNnJaTHQ4MXk2eWNjMGVKNlRqSFRDa05QZHY5WTF6QXFMTCtldVJTYURE?=
 =?utf-8?B?TDkycm5iT3R0UnN4VUwwUWxuaUo3Qk1LSWQ4S3N5MlFKSlVBVFp6UWxmcTZN?=
 =?utf-8?B?US9tKzJuWTBvSTFGM2Vid2cxdGh4NkwrK3hUYmtnMDc4VFZNUHBzWlZmQzRM?=
 =?utf-8?B?eWg2MEduVWpibjM0N0liejVJTWs3blMyRWFMUkZ5cEtvaVJtcHhXamZmYjB1?=
 =?utf-8?B?SDZNb05ESkE4ZE8xei9HaWViTGsxTmYzNDZOM1laZEZ1SmQxQXdFMmh1U00w?=
 =?utf-8?B?TUdqWXpwZ2lOb2lrTG1xcktDUXFneDRvejRJWmp3RnA4bDZxdUFuMGxzZ1Jo?=
 =?utf-8?B?cTlqNEpyYUhwdlNieWl0U3huVW5LOFNRUmFWb3h0aEp6aUhWczd5QjA1a2wv?=
 =?utf-8?B?aS83ViszS2RhbytKc05XNEd5bVdlcDlaMnV2VEl5d2FHNjlXMFdrNmRMdzN5?=
 =?utf-8?B?M21TSUQvZnkzV0tmN0JFL3grZUlncGMzTkdBOTZscW93YmQvTkNwZFhKekdK?=
 =?utf-8?B?ODVOL25TNmNGMWo2ZlIydEh2SHRXSFE3R056eEN4VnMrMDNsTjltSmN4Z0VT?=
 =?utf-8?Q?g7YHdBSnpuaN7Tbs=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649b9c69-1e0e-4c1a-f463-08da43ea01a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 16:15:55.9767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISDOiOqYIPmfXhlf9NjE6wChOCejgJjkiskAV92qTAtaqirQJcSN6J5FqPrnmNkFh28ZiKanPoaKgJV9hzSF06UdJiG4laA2xmnW19x/2UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3553
X-Proofpoint-ORIG-GUID: pxEaqve1HtAKDdhHlFK9xXRFSwtuffNV
X-Proofpoint-GUID: pxEaqve1HtAKDdhHlFK9xXRFSwtuffNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_05,2022-06-01_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 26/05/22 8:21 am, Jason Wang wrote:
> On Wed, May 25, 2022 at 11:56 PM Peter Xu <peterx@redhat.com> wrote:
>> On Wed, May 25, 2022 at 11:38:26PM +0800, Hyman Huang wrote:
>>>> 2. Also this algorithm only control or limits dirty rate by guest
>>>> writes. There can be some memory dirtying done by virtio based devices
>>>> which is accounted only at qemu level so may not be accounted through
>>>> dirty rings so do we have plan for that in future? Those are not issue
>>>> for auto-converge as it slows full VM but dirty rate limit only slows
>>>> guest writes.
>>>>
>>>  From the migration point of view, time spent on migrating memory is far
>>> greater than migrating devices emulated by qemu. I think we can do that when
>>> migrating device costs the same magnitude time as migrating memory.
>>>
>>> As to auto-converge, it throttle vcpu by kicking it and force it to sleep
>>> periodically. The two seems has no much difference from the perspective of
>>> internal method but the auto-converge is kind of "offensive" when doing
>>> restraint. I'll read the auto-converge implementation code and figure out
>>> the problem you point out.
>> This seems to be not virtio-specific, but can be applied to any device DMA
>> writting to guest mem (if not including vfio).  But indeed virtio can be
>> normally faster.
>>
>> I'm also curious how fast a device DMA could dirty memories.  This could be
>> a question to answer to all vcpu-based throttling approaches (including the
>> quota based approach that was proposed on KVM list).  Maybe for kernel
>> virtio drivers we can have some easier estimation?
> As you said below, it really depends on the speed of the backend.
>
>>   My guess is it'll be
>> much harder for DPDK-in-guest (aka userspace drivers) because IIUC that
>> could use a large chunk of guest mem.
> Probably, for vhost-user backend, it could be ~20Mpps or even higher.
>
> Thanks
>
>> [copy Jason too]

I will try to get some numbers of this by next week. Jason Just wanted to get more

context why it should be ~20Mbps like it can be as much as throughput limit of

storage/network in worst case?

Also we were internally discussing to keep this kind of throttling not as an alternate

to auto-converge but somehow to run orthogonal to auto-converge with some modifications.

In cases where most dirty is by guest writes auto-converge anyway will not be active as it

decides throttle based on ratio of dirty/2*transferred which if is forced correctly by e.g.

dirty rate limit will be ~1. This is easiest approach we could think for start but can

definately be improved in future. May be something similar can be done for this dirty limit

approach too?

Surely not for this patch series but in future.

thanks

Manish Mishra


>> --
>> Peter Xu
>>

