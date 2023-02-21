Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5D69DCBC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:18:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOn3-0005iI-52; Tue, 21 Feb 2023 04:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pUOmh-0005hs-W9
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:18:04 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pUOme-0000Gz-3Y
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:18:03 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31L3sCTb015226; Tue, 21 Feb 2023 01:17:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=BukXf2E1U3NEWjmeN54AEpoWMBjsLazzdRHplxaTPw4=;
 b=mJmUkMeHFUI8vpqWjF09WWJUgUoykqDWPmMRJtzMj8Er75brlraOaRGQJW6SiKYIFMGu
 SBlq9U/m9kej/JGLVv4oq9+nD8iJHB+SDez0eOXngVQv0q3F4Ju4X7J+3QuqwDdDkp9X
 B7LCkY64/goR2Rs20NVmXxCVlyrpWYcfHjzzjz8iMcGBmWGw3yk946rbWFa4WBVJ2977
 NMkHC+Yt0PoHsA8kQbIOIMO3j2Qdao2fJm9zYppL0skJ2mFgrm1nSMuGJ7BaY8TA1dXX
 YmhuMrkKP4cRgj9Qsnj1q18z8szGa/aAcirsNCk/8o7CCDAGljP635rrZ6HFfGAXjucr 2g== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3ntw3dwahr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 01:17:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcHs/qZYDvO7EjesJn+tFwCdJcjygRrysNenEVsS/1+GYSD3GQkqt1a/ODV94LTFQ0zPyL0io7yXz+rlg8VHk/EoNc1d89SMwKY7NdhSxiBx7RZH4WhtweCpH/2DoG2Zo7EaPTmaEbp1eL54NBnIvV8jI2VanczC++pz/HNu3tOPolKgOPe8eH76qYRFBnpFeyxl748JBSvIaVDOh+VaMy3nW6LD7eqW7Oz0MX6xfJr/f3GxbRaecU9IBSLplMTN4YxnfvyadTCJi9IujHbr1rHbDKdWOgFuwHeD/in0fhNFIHvEcieCzT6kcr9Vmpgvzg2A7Vq9XFq45AXqiDcMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BukXf2E1U3NEWjmeN54AEpoWMBjsLazzdRHplxaTPw4=;
 b=iYbVvF1zNW3RzWkogE1KsolFE6dsVfMt7RTMYes3RWjuatAT711dvQjoZm+eVh27DlYsSxgLsqphvgHSYhRiThGOaq2wYlyMAhlm5MwbNKOyxidEj4Rl72tR0r2dk9Be4CrfekGaUEMTrljTQgNBrN7tH/n6lLRogDWTFgGVFCvxOExMM/A7aTGj3Cv/7bPSbhZ/Ik/vgoK4BDNFqyAfNnhKan0HVVu3SX/0xTwJYMVQdHvbLGoQK77rHxxBStc5Isz6rnxOKeGMGo0mS/LY3zRqUGbGojaWVlpMS2fBMG2q2vtHp+o6MteqxvF1gPOi/guRWOv+1b9sENzrev+1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BukXf2E1U3NEWjmeN54AEpoWMBjsLazzdRHplxaTPw4=;
 b=YSFLc0HOaBb4RAOTm53U5dgrZHklNPjHNoeODJBOgPvqLID/nGGdsc31qLv9wGLz2vcw+w05s6qXrWpZCmwz0HDjxdW1qC/LSCqegGyL/m/8bA/SngdChvtpdwhaq+DI3m9jQnFT04NVgZC/lRh+P1yK7B4kzpn2syx9+93aBFVFvuI4+ko8byxj21hwGqrZulxlP9uw0GQVyEfffgFDnJ+DXR3N2+KaUlpzdSmrc2kPjT+sQiODT34zAMHdPulKToSMVOugb0v+YMR7VE4uSGuMBMe30sXRkehprMFEYnfVIB3FBBI3UbesRdZmuVUWhPUBCpsR1K/JYfePM4/5PA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by IA0PR02MB9511.namprd02.prod.outlook.com (2603:10b6:208:401::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 09:17:53 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 09:17:53 +0000
Content-Type: multipart/alternative;
 boundary="------------63Zr507XlPCSsoQ8819hx3pR"
Message-ID: <714433c7-a467-5f7a-703f-0f1949552811@nutanix.com>
Date: Tue, 21 Feb 2023 14:47:40 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: QAPI unions as branches / unifying struct and union types
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com> <Y+TLJ9Ui790bIR3b@redhat.com>
 <87o7q2vv7v.fsf_-_@pond.sub.org>
 <2157ed5c-7e1e-bd8f-1644-b7231fffe7ef@nutanix.com>
 <87v8k4lfgj.fsf@pond.sub.org>
 <7eba90f1-b28e-650b-e3ae-9c8e64c29d77@nutanix.com>
 <Y+9rPrYeBq1Y9XyL@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+9rPrYeBq1Y9XyL@redhat.com>
X-ClientProxiedBy: MAXP287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::20) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|IA0PR02MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: b58bbe9b-89f4-4894-c101-08db13ec8243
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQwGDbuDXQIdp6C8EeM1mLb7mmCTaabL7sgjRvndOiQoya0EbZf0MUITjwk236e+YeP371x457CJY147emQOKRQ5fsZJpiGg+lnhEicDr5wKnudzalw9gK4KyUcY0gXdvdp4Z/jSs1Iy87FMXGZm1ByqzY99GgzKJ0+FxCBN71JxNzenssK/b+d6DILmScu3AIZ07TFAkic9Nt9iCM1eDpbiC3uVyOYqcIwz1NOcwviYzM7HwNTqXzcNoIrLC2tCVHxTH8x7chtP39kchkcf785OOiIMS3griJpvPMbmFtfALoDf5MsywwFaWJPEpLhX/JLbcvy6j2Myp9IyArv8EEw9/WZ/Xhj1mTWPRrPC4s+qVBRpgqkgUhOT5EtLX3PJLEnzDKE/JFgc11b9YWtTqlrglTo83CJEtJNJUB1dCFepbV1csGuHldgapICka6Y7moe6QAMlShtkzx8OU82buIzqvODEp4LCKTHOv+mKu7ytnTOI6HjFzX7J7nmQkmkxD3WJ9YncNIgqV2z/p2vMUqeFpKEf6uWVj60KYHOpdbsbO2eZq+pt9JktFNuucU5kXPIKrhlO/R3F5hDD5jNgPkT8NiYn8sNo4k3qNhHmYurjs2cQ89mgFq0DWDBQT0mL7gAjbBTUqSK/zx2ZZU3sKEiafFwu+6p+e/ZMRUGAXX+LsWtVbv/21R1duI95hlS1Yh349fG4jnGlgtQwsyh4FkumfSiEoTiJRFeaK2p+yLU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199018)(38100700002)(83380400001)(36756003)(86362001)(31696002)(2906002)(8936002)(41300700001)(5660300002)(44832011)(30864003)(33964004)(186003)(53546011)(26005)(316002)(6506007)(107886003)(6666004)(6512007)(2616005)(4326008)(6916009)(66476007)(66946007)(66556008)(6486002)(8676002)(478600001)(66899018)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlpLd1pEZU1VdjRoY1dBTkN5Wm9MM3FlK2QzeTFrVGF0RmRDTVpkcmI2NlR0?=
 =?utf-8?B?aElrbFZieDVzeU1PcDgvbEFHbnZoQ2Nnc3pyWFZmNDhTRlZJelY2TFJla090?=
 =?utf-8?B?ZWx2WEs0ZTdiNTN6c0VFMkZhZng4b0xFMDlDQVhuakkzQmJEN0tYeElzQVl2?=
 =?utf-8?B?UElIQU1LKzFjY0lrcHRNN3Zrd2FrY0VXY3Z1K1Y0WFRLV3RRT1J1c0N0dFBU?=
 =?utf-8?B?MFlSKzhrMFhMZ1ViLzBBUWJPZXRjM3JzL2NkSVVFdU1KRGhMandKOCtKemVS?=
 =?utf-8?B?eTBKUUNmRHkvWHZvcmlxVEtzd3lpNkN6RVk4dFZaaFIyTzZjdVo2R0pwcjdR?=
 =?utf-8?B?ekl4OXlHMWlnNndPcER2MDAxUVR1R1ZKd016U0lYbzRTYXBnVWkySlYyTmh1?=
 =?utf-8?B?eWVybVdDQ3orN1J0VzNHMzk2SHd6bEJDYW9hTUpkb0dqb3NPd0p1ZERsdmRu?=
 =?utf-8?B?NEZDU3I1ZkJ0RmFYUVRZYlMzcFlGRmNnbkpxSlVWZ09sV05RN0pQT3YwYUNo?=
 =?utf-8?B?aDQ0bnovaWZENUFmZ2R6bXBteXRGWnQrUDcyeTBsb2xpeGVsamdhd3ZVTE1o?=
 =?utf-8?B?RkxsNmRaN2VMK3dIRllaeUJWUkd1QUVaWWllNm80K2ZCa2lXWXBBaEZCSjFp?=
 =?utf-8?B?TzNxSHNoNnVpb3R2OE5zWEREczVkYWVEaUxZRDZUbityUUdxODYxRm1vcWZJ?=
 =?utf-8?B?UVdoOHJITTlZMmd6bmp6Rklzb2lIQW96bktTYmZ3Q2NYdThaM0FYV0lBdFIz?=
 =?utf-8?B?TGtmQTMwT1hxVENFVHkzTlhRYjUwaHJuamNpa0h2ZllqV0VNYkVrS1ZIanVx?=
 =?utf-8?B?dkg5aGhUVEk1TUdJZjByT3FEZ3JscmhBcVFKZWRlY3dKcjM4ZTJXbzJ0Q05N?=
 =?utf-8?B?c2RNYTJTd2xybVVEUTFqbE5FSE81Y2U5cGVFalpHYzhId001T1AwT3BZNDAy?=
 =?utf-8?B?azlFVFBQZHlIWXBaelNyZnV1Q3Y1UlloaVp3bS9xbUNacitrcWRvSzhsanF2?=
 =?utf-8?B?TklKaEZaZVJ5K1hsZzdwcjJMN2k0dWhRR2MyeEtvdmRXdHU4eHR0R2lZaTZB?=
 =?utf-8?B?d200MEkycjk0cXhtVS8xMzIxZUUrTlRsd2RqRzMra2MydjdOUEpsc2FsMmp0?=
 =?utf-8?B?NkF1THE4RkE2anVWRC83Zzc5a2YvS1RKM3hsS2paN0pzL0RBd3Y5K3M5N25O?=
 =?utf-8?B?VHNmWkZ5K25xd2NiS2UyZ213d1JkenJadjZDN1NFNjVRUUdJL0Z4VnUrcGQr?=
 =?utf-8?B?U2xsd1BLbmV3U3BRRXJnRE1ycHJpejRLd3BHRVRYdVlYTUdHcEZOT1ljUTE4?=
 =?utf-8?B?TlNjajN2UlBCdUtsa1F3L3JsejNjcnlINmpSR284cTRCaGFvWVZHelFPTXJa?=
 =?utf-8?B?RXA5UEloSnJRUEpwbzhncW1yZWpjSEtHYkpXR1g1UmMwVFQxRllNU0FtSFZI?=
 =?utf-8?B?NGlwb1FGQzVmNTZBS2lWYTNIUEY2RCszZUJCRktiSnBjRFYweU5GT1M4U0FC?=
 =?utf-8?B?eC9hKzRPTFNEWXVGY1Y2ODRNTzBZT2RGVjBLTGdjWTBneHVPZ21xbUlNVFUr?=
 =?utf-8?B?dHAwYmFGWGFKc1BkOVc0Um5PV0JNNlZKcE9KbnR6SEZZT1NqVEM3R2YrSkZP?=
 =?utf-8?B?RDBza1hGcjBjWmk1ajZ3S2tJSlhIdjdmbStseTJka21jYXdPRjFrVjRUdGF2?=
 =?utf-8?B?UWhsbWYzWldCV3NCVkFZWEZCOVJnSzNrU1lpT3ExYTR0RFBkdU02Tnk4b0tI?=
 =?utf-8?B?b1h1WVFyWFBZMmpNMk1mRWhOZXJvZzN1aEoxZC9VKzJGZ0FJdngwVHpIRjdZ?=
 =?utf-8?B?UUtWdmNHY1Fjak9tT3BqelJGUmQ0MWEwTHppVCt4OXBST1p1RVpMOTA1Z1hM?=
 =?utf-8?B?U2tBQXFaUU9zaGZTZnVxRkE2RVlzOHdZZjdJYVdHMnpLUWxtNjNPYU5ya2FG?=
 =?utf-8?B?dlorWm1HQTlGUE53bVc3STVWK3RVMGRzMkV0bXk2MmNWaHpqRi9vWitNbFR2?=
 =?utf-8?B?eDZ1NGlVczVCUy9EeHlQQU04ZjBUT2xwM2M5QUxFNjYyMkV4SG8vV3JxQVFp?=
 =?utf-8?B?N2p4eEJFNGl0TUlWTWwxd0xaQkVJOUFTODV0d2dVMW53THNvL2E2cW1NcTlU?=
 =?utf-8?B?R1lNZkV2RDk0NGJsSlVBK3V2b2JrNFB6QmJkam83eHIwWDRCaWYwVW9uSlJI?=
 =?utf-8?B?S2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58bbe9b-89f4-4894-c101-08db13ec8243
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 09:17:52.5807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7gW83WgfGyzMhPRMXqpgd/oBx+a1wANvrtY1u6Ql5riKNXq8Dic4rM34SUMEgs7NuqyFX5OXL2D9Ujxzf84dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR02MB9511
X-Proofpoint-GUID: m2pVC8OwW9PZ3sQNDI_gsbEDkHS5fi-y
X-Proofpoint-ORIG-GUID: m2pVC8OwW9PZ3sQNDI_gsbEDkHS5fi-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_05,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.09, SPF_HELO_NONE=0.001,
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

--------------63Zr507XlPCSsoQ8819hx3pR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 17/02/23 5:25 pm, Daniel P. Berrangé wrote:
> On Fri, Feb 17, 2023 at 04:48:59PM +0530, Het Gala wrote:
>> On 14/02/23 3:46 pm, Markus Armbruster wrote:
>>> Het Gala<het.gala@nutanix.com>  writes:
>>>
>>>> On 10/02/23 12:54 pm, Markus Armbruster wrote:
>>>>> Daniel P. Berrangé<berrange@redhat.com>  writes:
>>>>>
>>>>> [...]
>>>>>
>>>>>>> +##
>>>>>>> +# @MigrateAddress:
>>>>>>> +#
>>>>>>> +# The options available for communication transport mechanisms for migration
>>>>>>> +#
>>>>>>> +# Since 8.0
>>>>>>> +##
>>>>>>> +{ 'union' : 'MigrateAddress',
>>>>>>> +  'base' : { 'transport' : 'MigrateTransport'},
>>>>>>> +  'discriminator' : 'transport',
>>>>>>> +  'data' : {
>>>>>>> +    'socket' : 'MigrateSocketAddr',
>>>>>>> +    'exec' : 'MigrateExecAddr',
>>>>>>> +    'rdma': 'MigrateRdmaAddr' } }
>>>>>> Ideally this would be
>>>>>>
>>>>>>       'data' : {
>>>>>>         'socket' : 'SocketAddress',
>>>>>>         'exec' : 'MigrateCommand',
>>>>>>         'rdma': 'InetSocketAddress' } }
>>>>>>
>>>>>> though the first SocketAddress isn't possible unless it is easy to
>>>>>> lift the QAPI limitation.
>>>>> Context: SocketAddress is a QAPI union, and "the QAPI limitation" is
>>>>>
>>>>>        scripts/qapi-gen.py: In file included from ../qapi/qapi-schema.json:79:
>>>>>        ../qapi/migration.json: In union 'MigrateAddress':
>>>>>        ../qapi/migration.json:1505: branch 'socket' cannot use union type 'SocketAddress'
>>>>>
>>>>> Emitted by schema.py like this:
>>>>>
>>>>>                    if (not isinstance(v.type, QAPISchemaObjectType)
>>>>>                            or v.type.variants):
>>>>>                        raise QAPISemError(
>>>>>                            self.info,
>>>>>                            "%s cannot use %s"
>>>>>                            % (v.describe(self.info), v.type.describe()))
>>>>>
>>>>> This enforces docs/devel/qapi-code-gen.rst's clause
>>>>>
>>>>>        The BRANCH's value defines the branch's properties, in particular its
>>>>>        type.  The type must a struct type.  [...]
>>>>>
>>>>> Next paragraph:
>>>>>
>>>>>        In the Client JSON Protocol, a union is represented by an object with
>>>>>        the common members (from the base type) and the selected branch's
>>>>>        members.  The two sets of member names must be disjoint.
>>>>>
>>>>> So, we're splicing in the members of the branch's JSON object.  For that
>>>>> to even make sense, the branch type needs to map to a JSON object.  This
>>>>> is fundamental.  It's the first part of the condition in the code
>>>>> snippet above.
>>>>>
>>>>> We have two kinds of QAPI types that map to a JSON object: struct and
>>>>> union.  The second part of the condition restricts to struct.  Unless
>>>>> I'm missing something (imperfect memory...), this is *not* fundamental,
>>>>> just a matter of implementing it.  But I'd have to try to be sure.
>>>>>
>>>>>
>>>>> Instead of simply allowing unions in addition to structs here, I'd like
>>>>> to go one step further, and fuse the two into "objects".  Let me
>>>>> explain.
>>>>>
>>>>> If we abstract from syntax, structs have become almost a special kind of
>>>>> union.  Unions have a set of common members and sets of variant members,
>>>>> and a special common member (the tag) selects the set of variant
>>>>> members.  Structs are unions with zero variants and no tag.
>>>>>
>>>>> The generator code actually represents both structs and unions as a
>>>>> common QAPISchemaObjectType already.  QAPI/QMP introspection does the
>>>>> same: it uses a single meta type 'object' for both.
>>>>>
>>>>>
>>>>> There is another spot where only structs are allowed: a struct or
>>>>> union's base type.  That restriction will be awkward to lift, as I made
>>>>> the mistake of baking the assumption "object type has at most one tag
>>>>> member" into QAPI/QMP introspection .
>>>> Hi Markus, thankyou for explaning in such detail. I tried to understand of what you explained.
>>>>
>>>> So IIUC, you mentioned the QAPI generator treats both structs and unions same, but basically in the schema.py checks is where it tries to distinguish between the two ? and because of the fact that docs/devel/qapi-code-gen.rst states that for a union, it's branches must be 'struct', and that's the reason it gives an error ?
>>> Permit me a brief digression into history.
>>>
>>> The initial QAPI design language provided product types (structs) and
>>> sum types (unions containing exactly one of several types, and a tag
>>> member that tells which one).  The two are orthogonal.
>>>
>>> These unions turned out rather awkward.
>>>
>>> The unions we have today are more general.  They have common members,
>>> and one of them is the tag member, of enumeration type.  For each tag
>>> value, they have variant members.  Both the common members and each tag
>>> value's variant members are given as struct types.
>>>
>>> What if the tag's enumeration type is empty, i.e. has no values?  We get
>>> a union with no variant members, only common ones.  Isn't that a struct?
>>>
>>> Not quite.  To get a struct, we also have to drop the tag member.  It
>>> has no possible values anyway.
>>>
>>> You see, struct types are almost a special case of today's union types.
>>> To overcome "almost", we can introduce the notion of "object type":
>>>
>>> * An object type has common members, one of them can be a tag member, of
>>>     enumeration type, not empty.  For each tag value, it additionally has
>>>     variant members.
>>>
>>> * A union type is an object type with a tag member and variant members.
>>>
>>> * A struct type is an object type without tag member and variant
>>>     members.
>>>
>>> The QAPI generator code already made the jump to this object type
>>> notion.  It transform the special cases into the general case at first
>>> opportunity, in QAPISchema._def_struct_type() and ._def_union_type().
>>>
>>> *Except* we haven't implemented support for variant members in a few
>>> places where they cannot occur now, e.g. as a tag value's variant.  This
>>> is the restriction you ran into.
>>>
>>> I'd like to make the jump to object type in the QAPI schema language,
>>> too.  But that's not a prerequisite to lifting the restriction.
>>>
>>>> If that's the case, can we improve on our checks and allow union as a part of branch of a union ? or something else ?
>>> I believe we can implement the missing parts and relax the checks.  But
>>> to be sure, we need to try.
>>>
>>>> or I may have completely misunderstood most of the part 😅. Please let me know
>>> More questions?
>> Completely understood everything. Thankyou for the wonderful explanation.
>> Looking forward to implement the missing parts in QAPI schema language.
> I cc'd you on a patch that implements this missing feature a couple
> of days ago, and its on Markus' review todo list. So we should be
> able to decide how to move forward sometime next week.
I did put Daniel's qapi patch and on top, added my patch where I 
introduce 'MigrateAddress' in 'migrate' QAPI, and assigned 
'SocketAddress' union to 'socket' backend transport inside 
'MigrateAddress' union. So iow, union inside union worked smoothly, and 
was able to re-architecture the patchset series accordingly.

> With regards,
> Daniel
Regards,
Het Gala
--------------63Zr507XlPCSsoQ8819hx3pR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17/02/23 5:25 pm, Daniel P. Berrangé
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y+9rPrYeBq1Y9XyL@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Feb 17, 2023 at 04:48:59PM +0530, Het Gala wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 14/02/23 3:46 pm, Markus Armbruster wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Het Gala <a class="moz-txt-link-rfc2396E" href="mailto:het.gala@nutanix.com">&lt;het.gala@nutanix.com&gt;</a> writes:

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 10/02/23 12:54 pm, Markus Armbruster wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Daniel P. Berrangé <a class="moz-txt-link-rfc2396E" href="mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a> writes:

[...]

</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">+##
+# @MigrateAddress:
+#
+# The options available for communication transport mechanisms for migration
+#
+# Since 8.0
+##
+{ 'union' : 'MigrateAddress',
+  'base' : { 'transport' : 'MigrateTransport'},
+  'discriminator' : 'transport',
+  'data' : {
+    'socket' : 'MigrateSocketAddr',
+    'exec' : 'MigrateExecAddr',
+    'rdma': 'MigrateRdmaAddr' } }
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Ideally this would be

     'data' : {
       'socket' : 'SocketAddress',
       'exec' : 'MigrateCommand',
       'rdma': 'InetSocketAddress' } }

though the first SocketAddress isn't possible unless it is easy to
lift the QAPI limitation.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Context: SocketAddress is a QAPI union, and &quot;the QAPI limitation&quot; is

      scripts/qapi-gen.py: In file included from ../qapi/qapi-schema.json:79:
      ../qapi/migration.json: In union 'MigrateAddress':
      ../qapi/migration.json:1505: branch 'socket' cannot use union type 'SocketAddress'

Emitted by schema.py like this:

                  if (not isinstance(v.type, QAPISchemaObjectType)
                          or v.type.variants):
                      raise QAPISemError(
                          self.info,
                          &quot;%s cannot use %s&quot;
                          % (v.describe(self.info), v.type.describe()))

This enforces docs/devel/qapi-code-gen.rst's clause

      The BRANCH's value defines the branch's properties, in particular its
      type.  The type must a struct type.  [...]

Next paragraph:

      In the Client JSON Protocol, a union is represented by an object with
      the common members (from the base type) and the selected branch's
      members.  The two sets of member names must be disjoint.

So, we're splicing in the members of the branch's JSON object.  For that
to even make sense, the branch type needs to map to a JSON object.  This
is fundamental.  It's the first part of the condition in the code
snippet above.

We have two kinds of QAPI types that map to a JSON object: struct and
union.  The second part of the condition restricts to struct.  Unless
I'm missing something (imperfect memory...), this is *not* fundamental,
just a matter of implementing it.  But I'd have to try to be sure.


Instead of simply allowing unions in addition to structs here, I'd like
to go one step further, and fuse the two into &quot;objects&quot;.  Let me
explain.

If we abstract from syntax, structs have become almost a special kind of
union.  Unions have a set of common members and sets of variant members,
and a special common member (the tag) selects the set of variant
members.  Structs are unions with zero variants and no tag.

The generator code actually represents both structs and unions as a
common QAPISchemaObjectType already.  QAPI/QMP introspection does the
same: it uses a single meta type 'object' for both.


There is another spot where only structs are allowed: a struct or
union's base type.  That restriction will be awkward to lift, as I made
the mistake of baking the assumption &quot;object type has at most one tag
member&quot; into QAPI/QMP introspection .
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Hi Markus, thankyou for explaning in such detail. I tried to understand of what you explained.

So IIUC, you mentioned the QAPI generator treats both structs and unions same, but basically in the schema.py checks is where it tries to distinguish between the two ? and because of the fact that docs/devel/qapi-code-gen.rst states that for a union, it's branches must be 'struct', and that's the reason it gives an error ?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Permit me a brief digression into history.

The initial QAPI design language provided product types (structs) and
sum types (unions containing exactly one of several types, and a tag
member that tells which one).  The two are orthogonal.

These unions turned out rather awkward.

The unions we have today are more general.  They have common members,
and one of them is the tag member, of enumeration type.  For each tag
value, they have variant members.  Both the common members and each tag
value's variant members are given as struct types.

What if the tag's enumeration type is empty, i.e. has no values?  We get
a union with no variant members, only common ones.  Isn't that a struct?

Not quite.  To get a struct, we also have to drop the tag member.  It
has no possible values anyway.

You see, struct types are almost a special case of today's union types.
To overcome &quot;almost&quot;, we can introduce the notion of &quot;object type&quot;:

* An object type has common members, one of them can be a tag member, of
   enumeration type, not empty.  For each tag value, it additionally has
   variant members.

* A union type is an object type with a tag member and variant members.

* A struct type is an object type without tag member and variant
   members.

The QAPI generator code already made the jump to this object type
notion.  It transform the special cases into the general case at first
opportunity, in QAPISchema._def_struct_type() and ._def_union_type().

*Except* we haven't implemented support for variant members in a few
places where they cannot occur now, e.g. as a tag value's variant.  This
is the restriction you ran into.

I'd like to make the jump to object type in the QAPI schema language,
too.  But that's not a prerequisite to lifting the restriction.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">If that's the case, can we improve on our checks and allow union as a part of branch of a union ? or something else ?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I believe we can implement the missing parts and relax the checks.  But
to be sure, we need to try.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">or I may have completely misunderstood most of the part 😅. Please let me know
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">More questions?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Completely understood everything. Thankyou for the wonderful explanation.
Looking forward to implement the missing parts in QAPI schema language.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I cc'd you on a patch that implements this missing feature a couple
of days ago, and its on Markus' review todo list. So we should be
able to decide how to move forward sometime next week.</pre>
    </blockquote>
    I did put Daniel's qapi patch and on top, added my patch where I
    introduce 'MigrateAddress' in 'migrate' QAPI, and assigned
    'SocketAddress' union to 'socket' backend transport inside
    'MigrateAddress' union. So iow, union inside union worked smoothly,
    and was able to re-architecture the patchset series accordingly.<br>
    <address>
    </address>
    <blockquote type="cite" cite="mid:Y+9rPrYeBq1Y9XyL@redhat.com">
      <pre class="moz-quote-pre" wrap="">With regards,
Daniel</pre>
    </blockquote>
    Regards,<br>
    Het Gala
  </body>
</html>

--------------63Zr507XlPCSsoQ8819hx3pR--

