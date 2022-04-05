Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3EC4F22C7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 07:57:51 +0200 (CEST)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbcCM-0003KP-37
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 01:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nbc3z-0000j0-Nl
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 01:49:16 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:61950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nbc3w-000581-Mn
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 01:49:10 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 234JXu2d024567;
 Mon, 4 Apr 2022 22:49:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=/HcRKj91hsJo3Y4qENCf+NxMK+5qmt5DmVIL08WLpB4=;
 b=0rt/ZsoybR72lJi/iTlD74I2I9jzvt9d5c2lJ4vAsI38+wsf9rtxmvRsu1Yh3y+j/Dhh
 lq/SXSO4II91gUNCqCBtaWiKP0ak/0+uFYuuua7YT2n8vYYq78fR1LvLyr+joLTD3WIN
 R/Z09rxxNJjjW8s59/9375mKTQCr5kq/8Ux7zx6jPgXL+cqpzHmoRr87NuHcWkTks+0Y
 xaT873viY4Mno5GsbKaFzxEH+jUkcTZx5PGMiuKP6y2c46iMkol1B5ZgIVjilz/1VMlY
 lOBK8pjYy4FXpXNnM+3GWErky09j5iNOk1B3z5CR22JA8JQpZlAIjydYSpGutjSy92QF sA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f6p1yd43t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 22:49:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMJ5sb2xdM2eZGo8rTv/jhDrXb3SztiY9IXcFt7yDzoHbnfI/wB6RRkCXtr4SU3+0lHlunPEqUrcxxJIi6DxhPFhmq10iOuU9RNV3K7WmACnSXSODnmaqXE5HKmS9QD1NeetjSimYf+l7/UiOZY2w6CM1GeaeOPiHZbHKm6pp9zFn1TxAe7Q4uJxFD64aoRHK3spy5J1F5rojFIFQxni/rN2bwjNehMIENPdjVLZ2IcI5+SIXYeaBwJpS+icsZygoxvjbKBD0oljAU80UglxuUINUABmk1669954RoNm8GGdyJkVd0i63E0BAD7LP0Z3FEHPIBdcDClRHiwLmj8MfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HcRKj91hsJo3Y4qENCf+NxMK+5qmt5DmVIL08WLpB4=;
 b=cDFWAUZuUCZWcVyNh+BzHCKmjJpd49KYpCW00HZ088GYF5zTacCjQKaI9+/y/6cZd0c9XqscjCL+NKFHQe4q7Dm/rjGXYceNGmJhXmnveQGE7NWsA/kxzjKpK3epmSBq1g3FOMrhK0LbkcSMxVdJnSMTqPVmqrmvuTfmLq+4UZqAW02lWMbGHIDhTtk5WE3KPOaWUdYNzNOE0ULNJ+IkjSt4cBxCabPRHrOwdzxuU36gXJN+BtpBaM1JGfopvxbVuTMYrBfI3v1Enhf6HiHSLsk7PRkDce7W2geMMCjSJzfo1Jq5MC3Xg82iFF/U8b9rlCZaoHdcMCw4yx9lmT666g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by CY4PR02MB3288.namprd02.prod.outlook.com (2603:10b6:910:7d::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 05:48:59 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::df1:1d4d:e30c:55e6]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::df1:1d4d:e30c:55e6%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 05:48:59 +0000
Message-ID: <b2691f71-0693-4971-cd06-435d6be7ae9b@nutanix.com>
Date: Tue, 5 Apr 2022 11:18:44 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/2] Added parameter to take screenshot with screendump
 as PNG
To: Markus Armbruster <armbru@redhat.com>
References: <20220330061134.59254-1-kshitij.suri@nutanix.com>
 <20220330061134.59254-3-kshitij.suri@nutanix.com>
 <87wng96oep.fsf@pond.sub.org>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <87wng96oep.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3e4ada0-10ca-4302-50df-08da16c7fa87
X-MS-TrafficTypeDiagnostic: CY4PR02MB3288:EE_
X-Microsoft-Antispam-PRVS: <CY4PR02MB3288E41B71F4D299C9B663C499E49@CY4PR02MB3288.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ejDnnBcfkH1Bx5a1ujfImZ382d3agMVSNmhjsR/I8HkXn47dQPmlzz3zgyCvmvKzT9j9ZnDta4uTF2sQmTwTKZZI8pnEz/BFfh8ngrTFa4p+wJC8DSdy0mO9cS0JS7qQ2vU/EDJ7Bbmzjm0XtYLgGZuhR5e+eO+ZEMCa+8SD/Z0mamUhxVPcoP/HsajBCV77BgMVw4MYH2cZb+dZI0aYQG746flecmxM+yTKDCVMfxWHqx4adZiqc3chTcU9vleIzu004BKNKJjdzvUTvBsmrERdOGSXTAMRJWnRdVl0GKrSk0KoPsyV2MI3z5dBTEKNz+st1POvupt3BLq5cgV9/11C9TLilV10zwqBR8OGKcKpLvvFoySSdQ2sOoFeqpOXyovBdSGvcsL8o75UlJfxci1fqj3BhvA2zgHioAo3dYdx5h+yGaj8hItf10KjaYdETOC5nHKPX/77In0CPtyQgN8JGcCobxMADW1Ltj/J7duJtP5jc6OCwkg81AcofXsGmnq8Yuu62094qFYpn5CHXHv00VCfgdaZYhdnSwc8Bewt2WyTx6XztJca7IoMKl0e5pqxqaA1H8A3ssIXcurjiHm/SBqJzl/TSHoj8IMAqR/kZrr+bgbuhZyNv2JUh70vtUpzlmIHzv92bp33J20L60whFLV8k1JqANhmJDDhEWDZ21Zc9NsU4iSFSI8g36PZfAMWjQVOA3hJMnCat8V1SGAMVWNFLFwYGjz6ieNFRalT0voapi7mRYqJLXy7lGzQ93hPql8Rnwr8sAsEkWwXVrDa/Y1jM6CIrJLqvePOO8FYRE9pXk5cNB3oEphGSSEnXXnnnWPGgkgSIWZKgHW6ErxCk+P8wbDx5jciws3jg6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(31686004)(38100700002)(5660300002)(38350700002)(8936002)(36756003)(2616005)(2906002)(7416002)(44832011)(31696002)(6512007)(6666004)(6506007)(66946007)(4326008)(966005)(508600001)(66476007)(6486002)(66556008)(86362001)(83380400001)(52116002)(53546011)(6916009)(316002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXlSYWRJalRJQVBZUW5mSll0ekhBMmhMaUM1cmZiQlFOdDI4RTYwY1pOWWR0?=
 =?utf-8?B?cVFhRmJxS0NGTEV2Z0ViOHRrUStpWHp1NFA3bTdFT3ExMHhXYTlSdUhBbnpL?=
 =?utf-8?B?RzVIVmVjdnNRZjhvWVVZTVhWY2YydGJhbEM0OVhJcWVEZC9ZY3FFUHFRNmo3?=
 =?utf-8?B?S0JtZjRNUUxoSUtXWDdjMG51MUZZam5OVTF2aEd5MnVpV1ZNSXhwbkoyRWFm?=
 =?utf-8?B?ZUNONElRMVBndU1OSlk0S3BuUzdya09LK0NZUmJtQytiREV5M01vNXorMmM1?=
 =?utf-8?B?OURwdzZIbTZuVFh0a3k1OGNHN2E5TmZsTW5RRmlnbTE4K3grM2pxL1VYbWFL?=
 =?utf-8?B?cXVSQTRRSUdaVUl6QXNybys1bkNwdXh4TEYzMC9NenlONVAyTkExOGhJNFQv?=
 =?utf-8?B?UEhha056SUZZRlVoR2Q4bDlvd3RNTDBZWFJybVVSZTRYbUxVNzRZdnNhajk5?=
 =?utf-8?B?SktPN1BnZk5XWjBFZElXK2t3SjZTMHVUYkNPMTZyQ1BxTkc1MytaN0hRZWFs?=
 =?utf-8?B?cGdHWXFiQ01qRHhhd2JwT05razJ0d2pXS2tvei8yQityZExwanRRWXZCWEpG?=
 =?utf-8?B?a3Q2ODJ0U1lPZUhPVU50VnJncGk1OUtXdS9rZG8xWHF2dDNpY0hHTHhXcERa?=
 =?utf-8?B?d09yQjh1Q2h6SWJRanZHbUtMRGpEV01jRThOWkhiSTBUUE1Jdjd6V1psTDhn?=
 =?utf-8?B?elZPejR0NUZnVkM0YlBjVHRFNmdHRnBDbEdPcmxKWlFaajNTTCtPTjJ2bE5P?=
 =?utf-8?B?M0VDelZIZ25ZaXJvdkMxWnJzSTl1UlFhR2d6T2RydHcwVXN5L0xPMDNpRUta?=
 =?utf-8?B?QWZCR2ZtbGdWUVBYeHd1TmFwak5wSUdKbGlTY2FOWUQwck5oeGN1TUhKcG5v?=
 =?utf-8?B?OTBkKzUwaXEvRTZhejVNSjRqRCtUMzlwdk5pZGdscnQxNDJYRnBDd0NnNTZX?=
 =?utf-8?B?clIyeTR1eVVlZFNDYXVzMVkwd0ZuekpRNW9wV2NxTFd0dXpRVDhJRzVoaGVI?=
 =?utf-8?B?SHVTUVJOYnV2UStCSkkvZUU5MjRlazVua0k5elg0TTV0Y3ErbWJ0Y2d2a3Iy?=
 =?utf-8?B?WTM2cjAxdlRYNDBYOFQwSjFZa0c0Mi9LNE03eEFqT0M5bnlJelBFdmRIcm9R?=
 =?utf-8?B?S3hDalIwQ2Z2am1qNkdSUVZUVUV6QkRSa2xucStjY1B4VExYYm1vTzJRV2xB?=
 =?utf-8?B?azJueUxselB6ZjBmZEJIV0NZMmpBanI4TThraVUwdmRpRUN4VUFsVi8wcTFq?=
 =?utf-8?B?YmN2Z2lMUFZpNm5GN3ZuMjJVbi8xcEN1L3FGSk9SS1g3akNoNUdaZGZBSXg2?=
 =?utf-8?B?Slk4N3pJNG5vcllsMW9yR1JZYWVUN1pFV1VvT01FUkVYamI0cFlYOTZOckZR?=
 =?utf-8?B?enZKcWVoTzNrbVpnNlBaTGtCRENNODVZVGFYQzVRR0hZdy9QQXZkU3ZiWEU5?=
 =?utf-8?B?NFh5WW04V0pWcVdVUi9DMk1ib3dBNEhZOCtUbHVZZTUzZDdFUUhNTU9ydjFP?=
 =?utf-8?B?MFN1SjFveDR0dnU4MTR6dUt4OGcyWVNxVVVYanplK1VVOUhTQVZ4d0k1WXFp?=
 =?utf-8?B?MjY2SklSY2hxWnBNYnpJMi9BdmF1TTMyRjlFYWRScHY5dkVsZmpXUDI2UmtK?=
 =?utf-8?B?MWc0NjVQYTdaM0dEMldvUmpOa2pJSnF1QXRsRlorMVdoY3ZFdVFZaUJ4Q2c4?=
 =?utf-8?B?WTE4TGVuVUFHeFZsakI3dDlTR1B6ZHJXS3ZPYUxKVUtmT0RMTzJLOXRmOEhk?=
 =?utf-8?B?VWhFOTdrcm52WVZnRUM2ZVJIL3VyV0JFenhwNU80bDhtTUVUUkQ1cDRmbjhP?=
 =?utf-8?B?c2J1S2V5TkwxWHpuS3NFb0luYXc5WjJvOFZlUWphVEczMG9YSFV3OHBBYlh1?=
 =?utf-8?B?cFZKalh1K1VRbWRIRVhMVHM0Z1dTZUNMODZIRGNDN1lKK1ZnZ2ZxRFNKc1Jv?=
 =?utf-8?B?OVJ3QWNjblE0ZEdPeVVBY1Job2pmMGVmdHp2eTF6R29Xa1MwQWU5Mmg4V0Nh?=
 =?utf-8?B?L01NWFZHNUtCcWwrRUY2MXhWTjY4NzZMZVBOMVkzbWZ0enpLM0U4V3B5bU9D?=
 =?utf-8?B?S2JFTFd6MHRqT0lBWDZnNXpBaVJUNE1WUzhKeGZ6WE9yR3p5b2Q0MW8vclpR?=
 =?utf-8?B?cmRsZ1pLWXkrTEM5aWwrVTVvSDdqRFJXWHYwZ2xpT2txZFZpYkE3ZG00VUc3?=
 =?utf-8?B?L1ZOTlR5RDFHOUgxc1o4YWRsTENXaml4UkUzZy96TzZnclNRQkMxK1RyYkdv?=
 =?utf-8?B?ZGNleWRKZVBVRGl3K040TGtzZnFLbWlLR3hydmdOZlZZL0swVm5ubkZRTXMy?=
 =?utf-8?B?L2owRmRDTTJONlpTRjUxVkEvY1d1ZWFoRWloTjRJZjhkRHlodWplcjNub2FE?=
 =?utf-8?Q?yioG07lwU9yG0ppI=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e4ada0-10ca-4302-50df-08da16c7fa87
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 05:48:58.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKJvcu6/3kvKSVCt7EQKBF/f7ecHNUlt8OCjD2SZCfMgme6KQFmqxJ8TLtwCEHKymlNARMafT7I2iNw2UFfOHFmhgoEU3VIp29U7VrFdaEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3288
X-Proofpoint-ORIG-GUID: CYX4RXqnd5UaRCod9vjmZSOzRqAG7IZT
X-Proofpoint-GUID: CYX4RXqnd5UaRCod9vjmZSOzRqAG7IZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_09,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 01/04/22 4:50 pm, Markus Armbruster wrote:
> Dave, please have a look at the HMP compatibility issue in
> hmp-command.hx below.
>
> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>
>> Currently screendump only supports PPM format, which is un-compressed and not
>> standard.
> If "standard" means "have to pay a standards organization $$$ to access
> the spec", PPM is not standard.  If it means "widely supported", it
> certainly is.  I'd drop "and not standard".  Suggestion, not demand.
Makes sense. Will modify it in the updated patch.
>
>>            Added a "format" parameter to qemu monitor screendump capabilites
>> to support PNG image capture using libpng. The param was added in QAPI schema
>> of screendump present in ui.json along with png_save() function which converts
>> pixman_image to PNG. HMP command equivalent was also modified to support the
>> feature.
> Suggest to use imperative mood to describe the commit, and omit details
> that aren't necessary here:
>
>              Add a "format" parameter to QMP and HMP screendump command
>    to support PNG image capture using libpng.
Yes, will reduce the verbosity of the commit message.
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>> "format":"png" } }
> Providing an example in the commit message is always nice, thanks!
Thank you!
>
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIFaQ&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=oODILSxODcEhktuPJ-SfVt-MW867cpF_TvDe-WJyNRXx84FinSifhtp6-Racosb0&s=89nTa5MLAr16WtPfrm4aYkwWlPuRs6yuaD22dZTE_pM&e=
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   hmp-commands.hx    |  11 ++---
>>   monitor/hmp-cmds.c |  12 +++++-
>>   qapi/ui.json       |  24 +++++++++--
>>   ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>>   4 files changed, 136 insertions(+), 12 deletions(-)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 8476277aa9..19b7cab595 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -244,11 +244,12 @@ ERST
>>   
>>       {
>>           .name       = "screendump",
>> -        .args_type  = "filename:F,device:s?,head:i?",
>> -        .params     = "filename [device [head]]",
>> -        .help       = "save screen from head 'head' of display device 'device' "
>> -                      "into PPM image 'filename'",
>> -        .cmd        = hmp_screendump,
>> +        .args_type  = "filename:F,format:s?,device:s?,head:i?",
> Incompatible change: meaning of "screendump ONE TWO" changes from
> filename=ONE, device=TWO to filename=ONE, format=TWO.
>
> As HMP is not a stable interface, incompatible change is permissible.
> But is this one wise?
>
> Could we add the new argument at the end instead?
>
>              .args_type  = "filename:F,device:s?,head:i?,format:s?",
>
> Could we do *without* an argument, and derive the format from the
> filename extension?  .png means format=png, anything else format=ppm.
> Would be a bad idea for QMP.  Okay for HMP?
Should I go ahead with extracting format from filename provided for HMP?
>
>> +        .params     = "filename [format] [device [head]]",
> This tells us that parameter format can be omitted like so
>
>      screendump foo.ppm device-id
>
> which isn't true.  Better: "filename [format [device [head]]".
Thank you will modify it!
>
>> +        .help       = "save screen from head 'head' of display device 'device'"
>> +                      "in specified format 'format' as image 'filename'."
>> +                      "Currently only 'png' and 'ppm' formats are supported.",
>> +         .cmd        = hmp_screendump,
>>           .coroutine  = true,
>>       },
>>   
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 634968498b..2442bfa989 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1720,9 +1720,19 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>>       const char *filename = qdict_get_str(qdict, "filename");
>>       const char *id = qdict_get_try_str(qdict, "device");
>>       int64_t head = qdict_get_try_int(qdict, "head", 0);
>> +    const char *input_format  = qdict_get_try_str(qdict, "format");
>>       Error *err = NULL;
>> +    ImageFormat format;
>>   
>> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
>> +    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
>> +                              IMAGE_FORMAT_PPM, &err);
>> +    if (err) {
>> +        goto end;
>> +    }
>> +
>> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
>> +                   input_format != NULL, format, &err);
>> +end:
>>       hmp_handle_error(mon, err);
>>   }
>>   
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 664da9e462..24371fce05 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -157,12 +157,27 @@
>>   ##
>>   { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
>>   
>> +##
>> +# @ImageFormat:
>> +#
>> +# Supported image format types.
>> +#
>> +# @png: PNG format
>> +#
>> +# @ppm: PPM format
>> +#
>> +# Since: 7.1
>> +#
>> +##
>> +{ 'enum': 'ImageFormat',
>> +  'data': ['ppm', 'png'] }
>> +
>>   ##
>>   # @screendump:
>>   #
>> -# Write a PPM of the VGA screen to a file.
>> +# Capture the contents of a screen and write it to a file.
>>   #
>> -# @filename: the path of a new PPM file to store the image
>> +# @filename: the path of a new file to store the image
>>   #
>>   # @device: ID of the display device that should be dumped. If this parameter
>>   #          is missing, the primary display will be used. (Since 2.12)
>> @@ -171,6 +186,8 @@
>>   #        parameter is missing, head #0 will be used. Also note that the head
>>   #        can only be specified in conjunction with the device ID. (Since 2.12)
>>   #
>> +# @format: image format for screendump is specified. (default: ppm) (Since 7.1)
> Recommend
>
>     # @format: image format for screendump (default: ppm) (Since 7.1)
Will change it in the updated patch
>
>> +#
>>   # Returns: Nothing on success
>>   #
>>   # Since: 0.14
>> @@ -183,7 +200,8 @@
>>   #
>>   ##
>>   { 'command': 'screendump',
>> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
>> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
>> +           '*format': 'ImageFormat'},
>>     'coroutine': true }
>>   
>>   ##
Thank you for your review!


Regards,
Kshitij Suri
> QAPI schema
> Acked-by: Markus Armbruster <armbru@redhat.com>
>
> [...]
>

