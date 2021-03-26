Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F0B34B12D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 22:19:38 +0100 (CET)
Received: from localhost ([::1]:54022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtrk-0004UO-Nn
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 17:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPtp0-00036A-EV; Fri, 26 Mar 2021 17:16:46 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:48082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPtou-0006c5-Bt; Fri, 26 Mar 2021 17:16:45 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12QLEqVF081318;
 Fri, 26 Mar 2021 21:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=FqOOg6IQiCJYczL1erKO6P6Kzdw/13ILAYeIIiVuX9o=;
 b=EELVCEaEOknBD1OAhwnolu6Fv/cDPXiB5mokvcYkXN1AKM/FTzksMiFrblTPuMuQVUjp
 EO0YEtRCBcRKHcsg4Oc0SUFRTA7FvynSq0vIPL5g56YTQoEsVgveeISgzBXiYdn+LVXH
 7rD2wOPeUh8aY/y2S2N9zfr3IbvY3JgnCLXQ0yz22QyYEZ35vwHu243H2S5d14Uv1SZ9
 PsZ2TBi1KY69KylWZzJgkmemulB3rbD3+EKYr7P9KwJrL6e6F5ldJKA7JnRu7k0Oxvlo
 hHtyDBQOnPr7TVdMAN1pqudfSrSNNXNYT/wB66gJQAwm200A3SPgrS6C3LI3kft6K4L6 ag== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 37h13rudh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 21:16:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12QLBLUe038218;
 Fri, 26 Mar 2021 21:16:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by aserp3030.oracle.com with ESMTP id 37hff4sj3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 21:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH8leeD7VkI3OAGH6oO3/L8tbVMzJy9px/656kvViqU9GYwuCv2MJs4mE+rI8Bap/S3hy3JK90Co/lJP9EU6GaTRvFVtXTpQNax5gRNnTbFqqIu+LPIniseV/C3SDTlvo6hRZqO1vTKQUtiHonwBlC0qeciTJpxQFvWZDLsg/W6OqW1R9M64BfKSXpmFdspyNa+TETglknJguDTESbAv//gRHF5obOwFG/qpJN9aJKujsEx0nZRkQqSgnbu6Ab37kqKPm2A5rZCz5kGXwvu17AY009++CDT0w+SvEq596E/ZkiHZF2QhlvHmD9+vuOl1YD4Sk+YDfKm5uSHhtN9hjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqOOg6IQiCJYczL1erKO6P6Kzdw/13ILAYeIIiVuX9o=;
 b=e6enzCxHW4gwx6ICjmgOM2u/3/xUTVieYUKDFWRlOEVwnzAVrriDuT+iYzL0M4gipNwae7Uun6Bcl0cZYs/PSkHeT1B/UrBNU/zeeuae7R+auohYmcYXd2EfBYIGXcE6LKLppgPLnEWLdVlo/neoleZJJIequxgMK4QKUy35aBl9nzxXeJ5AF1XGRnWnn1a1yi8tnFwCwIduX9y4Pv2rJ4h9n2O+6T+qrtaVafSiXrKiWyeW+SH8eJwD+9+bz3f04Xre9wqckzv+e62is0DHnPixXaC3urcsKlrP28dq2fY82MoEz23JmEuoTrj0IRdcL4xGwG6EhWnP5enlWehSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqOOg6IQiCJYczL1erKO6P6Kzdw/13ILAYeIIiVuX9o=;
 b=sN6Nov0NxiZXINW2HaOTXJKhJ45R2Hw/WmGVMdBp2rg0gTOP/nfIYNmJD5QNwBptbRmeKSWaULw4feX00TPbRHaf/IItdPr9sRGu2D4Awci4g9Tcjv2TFk6yJdfuFiO96/URWahOnwgQac/jk1O+14paJWCDl8x9BiEwpITg2b0=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3094.namprd10.prod.outlook.com (2603:10b6:a03:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 26 Mar
 2021 21:16:16 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.3977.030; Fri, 26 Mar 2021
 21:16:16 +0000
Subject: Re: [PATCH 0/6] Add debug interface to kick/call on purpose
To: Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
 <440216a8-821f-92dd-bc8b-fb2427bdc0e6@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <d5549b12-d269-a04d-01d2-2dbd1ee7fca0@oracle.com>
Date: Fri, 26 Mar 2021 14:16:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <440216a8-821f-92dd-bc8b-fb2427bdc0e6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::a4a4]
X-ClientProxiedBy: SN4PR0501CA0031.namprd05.prod.outlook.com
 (2603:10b6:803:40::44) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::a4a4] (2601:646:c303:6700::a4a4) by
 SN4PR0501CA0031.namprd05.prod.outlook.com (2603:10b6:803:40::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Fri, 26 Mar 2021 21:16:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63ad76c9-ceda-4d4e-a903-08d8f09c643f
X-MS-TrafficTypeDiagnostic: BYAPR10MB3094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB30940E1F43CFFD1025D71D45F0619@BYAPR10MB3094.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QYcdaoiNb6JuKUdIo6BIpiubRahx7kIawR/ky9wVrPg5MrAqipD6KzZNa/kZS50kL4W7R6Z6sd9voCwQKLHDePM2JNlFQpW/DjAk4mfUSjF02b+7g8M/2K13/QAgoOUWrixE4XdkYmMb/jh97Hekfe7y/hBpBgv0Uk2jT5pznQ+uKFUXjcGxQotqlSsc1EBFEPGGU80X2bgtRUPzFEVEUqaxr1Q7EM2z/vggVm18zJoaJUBJCQyWJUkr+K2EG+6PPPhCVreSZ44MOaa8+/dTjxFpgqOYiHAgFJjMRDEQ3oys7bQNfjWpS7uOInnXrtMXgw95TfEUxQp+jMmfBuxynFnBkUSspFlB1y09cBLWMTd8u1vws8tASUm5tJtfgy8NhlYi7jVQtqB/ymgMCljvrwYm28hIg4LpZw0KhaYqyYLGxIqClJAqhnoDkDB37oN4vw+TJXqzgWZCDZ/c4dDL0U+LteYFyCz6v9+KV72yR+NJABo4OSqI941wMxzqeReXHBxbqxAM9aE+4AAxxEzhW2Q0bCgSbU74I3cW9BEFBWnRvy4yoWtDAgw38Xg+8gr4jG4XNJaQB5DrPS/p5f90YeSY11JPLZb1kuEv1hrF742VwixjgCo4BHgQal2jaDw2AQsYtIDdo2iiWI3Ppach6qtd5NfueyWSqLvVfET/P98vYaaO1eyxwJUGVbj+Ys+SE/Jy2zFaeJN+EhB55yI86PgBloG0DSOZx/668lORuJV5YeUEb37oNuM5jLY/TOH1P6tz/w0F4uN+PV0CpYI7n1r5GGcEdSxEmWr1RyB1GIGuvY3oOVgDMK+HEWbhkFTM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(376002)(396003)(136003)(38100700001)(53546011)(44832011)(5660300002)(8676002)(7416002)(478600001)(66946007)(86362001)(66476007)(83380400001)(966005)(2906002)(8936002)(66556008)(2616005)(6486002)(36756003)(31686004)(4326008)(316002)(31696002)(16526019)(186003)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THdlbHhwc3NHbFRHWFVXTG9GMXhKbjZtQ2U3RTQ0QnlWaFlBL3ZqZ1J0SGJp?=
 =?utf-8?B?ZVBUVDlTL1J2T3ErQ1B2QkJRbE1CcmR4NHVVNVBJTDh2ci8vTStZQTFvczlS?=
 =?utf-8?B?aHA0Wk9KbE9PR0RjZ2l4aFIvc043aEtZbGlBbnBjTlpoQ2EzSjRIK1JmNlRY?=
 =?utf-8?B?RjdMbGZ1NFo4MFpZSTljOFZ4VU92aDEweW5kUzE3RVB2aWFIblpnMlcxSi9R?=
 =?utf-8?B?eFlaNTlGUUxmZzBsMGhUVGl0VC8xck54V3RnYU5rRGUrb3BOMTBqcHVCUHEw?=
 =?utf-8?B?ZUZQUlI2Q1duUitPb0ZWbnZsajRvM3o0d0NCeTIzbmFDQ0N1NldBTlpubFBn?=
 =?utf-8?B?NldoYXlPZTdFMzJ3M055a1UxSGZaZm9oeHJvejVuYmkrNzFqd2Rac0QzcFNN?=
 =?utf-8?B?bUR1Z3BDQ0VNWTJVQVRNcXFaUGcxZ2JSU1VUeWtucEIrQ3VUNzAvcVVZdEwv?=
 =?utf-8?B?TmFYTHE4U1VXUGZjOU1oNkJqd0NnZXZTVU1JQWlnZ1BUYStvQkxwc1FURjFV?=
 =?utf-8?B?djFpT0tzRVFkYWxDanBhVzF2OVF4dWlucWZDYU5zUEppU2g2NW0zOWp6OHFh?=
 =?utf-8?B?TGp3UXdVUnkyd0EyTUgyVTIraGFJYWhEQ0dEVW1ONkV2WXV5dTErMEc3SXoy?=
 =?utf-8?B?NXdLTzR5MThKTEhtUi9FVk9Kc0pTOGFrdUs5cElMS1d0am53QkN3U1VZcE1s?=
 =?utf-8?B?WXA3SGx6KzhaZFJmdWFTTUVOdm01d25kLzJNakVMeUhkUnNoZWVCMmR1dGEz?=
 =?utf-8?B?a0lvS1hrbGM0SlYyZWROTndhWG5ndGZGTEcrYVU0S0psbjNua2hPZ21jMmsr?=
 =?utf-8?B?MXZNclVJUE5PdCtlVTRIeTdYUXhnbHVhY25EMFUvdUM4dE43djdkNGxKcWZt?=
 =?utf-8?B?S3cyUkk4V2FNWkswbk1iNFJ5MDF2Nm1NWnVkNWttVG5rRGJuOU85WkZZUUZG?=
 =?utf-8?B?YmRMZHl6QXVyWTRxUURoQnY5ZHZ5RjlsdU91dElEUXpVMjh2R0RGNEY4SU05?=
 =?utf-8?B?cy9CcmhueFU2cldGeldYWVpSTGMzNnIvVWo4c2pybUJQLzYvZ08yNFR4ZnY5?=
 =?utf-8?B?dUxwYWVhSjJZOUtrbEFoV3VUVWpjc1U4YU1SZWplQzV5R3N4MWZvbmR1bDV4?=
 =?utf-8?B?dlBjR1FzNTM5MkZSK0xVd1A1TlZTeE1DZWxtSTVPZGdGZW5xTWVSNkhwaEoy?=
 =?utf-8?B?aDZKaUhMYzArVHBhUW0vMm1XY3pRN2NxQUZJcnhoYVp2TDRRYTIwakV3S2JT?=
 =?utf-8?B?a2ZnR1hxcmRQLzJhTmtRSFNWUHZFdFNMWjlSQjBLMWgxZi8yamtXd3crWEdM?=
 =?utf-8?B?R2hIeEp0NU8yNXJHYkhlVXJzS1VRSmoxdTVxUkoxYUpKVHMrTXpaQkNoR2R3?=
 =?utf-8?B?K2dyRUVvSjVrRmE5S0k0U3UwSkhtU0ZhSjl5VllML2t4Sll4WHloSTNGVW14?=
 =?utf-8?B?RWE4RENIZ2ZsR1lxQXdKSDNwSjBJVUpoQk0vZnFnMjNXTVZmcis5Z1YyYWJE?=
 =?utf-8?B?ZzFPT3E5M1BRL29SQXJ3Q3BZanJHOW0vTTRCQUtiTUtDR2dvQUVab25DcjZQ?=
 =?utf-8?B?ZG80R0xBaWV0bnF2MnhHYUJNMU4yTDdQMUZxOTJLa2NtY1g0WFZncjFxQWd6?=
 =?utf-8?B?ZnBNSUFjMk9nUUFQQ1l2N21IWVZVZUEwTENUYVhtZVN5QVVKZkJoQWtVYWJV?=
 =?utf-8?B?eDRESW9oODRuODRHdkVZRk4rSXh5dmVheERLNWI3N0R4U05nSk41amYyeHlJ?=
 =?utf-8?B?VDY0VFpLQWRPMkpsM0VNajFlWUtPZHRic2wwMFloSVN2dHgvcEw4OXkwWHN4?=
 =?utf-8?Q?xmpI0BIu+auioxUqNEDa0EEGuUa4DbmnnKhbY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ad76c9-ceda-4d4e-a903-08d8f09c643f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 21:16:16.1952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zC3yZ5BWAzH9QyivV+MGDZZAKlmsnRRLiZLng8/2m91EKFmEcyCC1oGg7lKYiE2neN3faezsG/QlsE5b4J+ZMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3094
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260158
X-Proofpoint-ORIG-GUID: jKwkNq1amH4GDEacKyiR0xG_fqfvJdHF
X-Proofpoint-GUID: jKwkNq1amH4GDEacKyiR0xG_fqfvJdHF
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260158
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=dongli.zhang@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On 3/26/21 12:24 AM, Jason Wang wrote:
> 
> 在 2021/3/26 下午1:44, Dongli Zhang 写道:
>> The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
>> the loss of doorbell kick, e.g.,
>>
>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html__;!!GqivPVa7Brio!KS3pAU2cKjz4wgI4QSlE-YsJPhPG71nkE5_tGhaOf7mi_xvNxbvKkfn03rk5BNDLSEU$
>>
>> ... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
>> fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").
>>
>> This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
>> to help narrow down if the issue is due to loss of irq/kick. So far the new
>> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
>> virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
>> or legacy IRQ).
>>
>> The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
>> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
>> on purpose by admin at QEMU/host side for a specific device.
>>
>>
>> This device can be used as a workaround if call/kick is lost due to
>> virtualization software (e.g., kernel or QEMU) issue.
>>
>> We may also implement the interface for VFIO PCI, e.g., to write to
>> VFIOPCIDevice->msi_vectors[i].interrupt will be able to inject IRQ to VM
>> on purpose. This is considered future work once the virtio part is done.
>>
>>
>> Below is from live crash analysis. Initially, the queue=2 has count=15 for
>> 'kick' eventfd_ctx. Suppose there is data in vring avail while there is no
>> used available. We suspect this is because vhost-scsi was not notified by
>> VM. In order to narrow down and analyze the issue, we use live crash to
>> dump the current counter of eventfd for queue=2.
>>
>> crash> eventfd_ctx ffff8f67f6bbe700
>> struct eventfd_ctx {
>>    kref = {
>>      refcount = {
>>        refs = {
>>          counter = 4
>>        }
>>      }
>>    },
>>    wqh = {
>>      lock = {
>>        {
>>          rlock = {
>>            raw_lock = {
>>              val = {
>>                counter = 0
>>              }
>>            }
>>          }
>>        }
>>      },
>>      head = {
>>        next = 0xffff8f841dc08e18,
>>        prev = 0xffff8f841dc08e18
>>      }
>>    },
>>    count = 15, ---> eventfd is 15 !!!
>>    flags = 526336
>> }
>>
>> Now we kick the doorbell for vhost-scsi queue=2 on purpose for diagnostic
>> with this interface.
>>
>> { "execute": "x-debug-device-event",
>>    "arguments": { "dev": "/machine/peripheral/vscsi0",
>>                   "event": "kick", "queue": 2 } }
>>
>> The counter is increased to 16. Suppose the hang issue is resolved, it
>> indicates something bad is in software that the 'kick' is lost.
> 
> 
> What do you mean by "software" here? And it looks to me you're testing whether
> event_notifier_set() is called by virtio_queue_notify() here. If so, I'm not
> sure how much value could we gain from a dedicated debug interface like this
> consider there're a lot of exisinting general purpose debugging method like
> tracing or gdb. I'd say the path from virtio_queue_notify() to
> event_notifier_set() is only a very small fraction of the process of virtqueue
> kick which is unlikey to be buggy. Consider usually the ioeventfd will be
> offloaded to KVM, it's more a chance that something is wrong in setuping
> ioeventfd instead of here. Irq is even more complicated.

Thank you very much!

I am not testing whether event_notifier_set() is called by virtio_queue_notify().

The 'software' indicates the data processing and event notification mechanism
involved with virtio/vhost PV driver frontend. E.g., while VM is waiting for an
extra IRQ, vhost side did not trigger IRQ, suppose vring_need_event()
erroneously returns false due to corrupted ring buffer status.

This was initially proposed for vhost only and I was going to export
ioeventfd/irqfd from vhost to admin via sysfs. Finally, I realized I would
better implement this at QEMU.

The QEMU inits the eventfd (ioeventfd and irqfd), and offloads them to
KVM/vhost. The VM side sends requests to ring buffer and kicks the doorbell (via
ioeventfd), while the backend vhost side sends responses back and calls the IRQ
(via ioeventfd).

Unfortunately, sometimes there is issue with virtio/vhost so that kick/call was
missed/ignored, or even never triggered. The example mentioned in the patchset
cover letter is with virtio-net (I assume vhost=on), where a kick to ioventfd
was ignored, due to pci-bridge/hotplug issue.

The hotplug is with a very small window but the IO hangs permanently. I did test
that kicking the doorbell again will help recover the IO, so that I would be
able to conclude this was due to lost of kick.

The loss of irq/doorbell is painful especially in production environment where
we are not able to attach to QEMU via gdb. While the patchset is only for QEMU,
Xen PV driver used to experience loss of IRQ issue as well, e.g., linux kernel
commit 4704fe4f03a5 ("xen/events: mask events when changing their VCPU binding").

This can help "narrow down" if the IO/networking hang is due to loss of
IRQ/doorbell issue (or VM MSI-x is erroneously masked), especially in production
env. This can also be used as a workaround so that VM owner will not need to
reboot VM.

In addition, the VFIO will benefit from it. We will be able to test if to inject
IRQ on purpose helps when the driver (e.g., PCI, NVMe, Ethernet) developers
blame the hang is caused by loss of IRQ with KVM/VFIO.(It seems there is more
chance to loose IRQ during CPU hotplug or changing IRQ affinity).

> 
> I think we could not gain much for introducing an dedicated mechanism for such a
> corner case.

As replied by Dave for prior RFC, the QEMU already supports hmp_ioport_write to
trigger an ioport write on purpose.

The linux block layer also supports the below to kick the IO queue on purpose.

echo "kick" > /sys/kernel/debug/block/sda/state

Dongli Zhang

> 
> Thanks
> 
> 
>>
>> crash> eventfd_ctx ffff8f67f6bbe700
>> struct eventfd_ctx {
>>    kref = {
>>      refcount = {
>>        refs = {
>>          counter = 4
>>        }
>>      }
>>    },
>>    wqh = {
>>      lock = {
>>        {
>>          rlock = {
>>            raw_lock = {
>>              val = {
>>                counter = 0
>>              }
>>            }
>>          }
>>        }
>>      },
>>      head = {
>>        next = 0xffff8f841dc08e18,
>>        prev = 0xffff8f841dc08e18
>>      }
>>    },
>>    count = 16, ---> eventfd incremented to 16 !!!
>>    flags = 526336
>> }
>>
>>
>> Original RFC link:
>>
>> https://urldefense.com/v3/__https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg03441.html__;!!GqivPVa7Brio!KS3pAU2cKjz4wgI4QSlE-YsJPhPG71nkE5_tGhaOf7mi_xvNxbvKkfn03rk5UvUJ86I$
>>
>> Changed since RFC:
>>    - add support for more virtio/vhost pci devices
>>    - add log (toggled by DEBUG_VIRTIO_EVENT) to virtio.c to say that this
>>      mischeivous command had been used
>>    - fix grammer error (s/lost/loss/)
>>    - change version to 6.1
>>    - fix incorrect example in qapi/qdev.json
>>    - manage event types with enum/array, instead of hard coding
>>
>>
>> Dongli Zhang (6):
>>     qdev: introduce qapi/hmp command for kick/call event
>>     virtio: introduce helper function for kick/call device event
>>     virtio-blk-pci: implement device event interface for kick/call
>>     virtio-scsi-pci: implement device event interface for kick/call
>>     vhost-scsi-pci: implement device event interface for kick/call
>>     virtio-net-pci: implement device event interface for kick/call
>>
>>   hmp-commands.hx                 | 14 ++++++++
>>   hw/block/virtio-blk.c           |  9 +++++
>>   hw/net/virtio-net.c             |  9 +++++
>>   hw/scsi/vhost-scsi.c            |  6 ++++
>>   hw/scsi/virtio-scsi.c           |  9 +++++
>>   hw/virtio/vhost-scsi-pci.c      | 10 ++++++
>>   hw/virtio/virtio-blk-pci.c      | 10 ++++++
>>   hw/virtio/virtio-net-pci.c      | 10 ++++++
>>   hw/virtio/virtio-scsi-pci.c     | 10 ++++++
>>   hw/virtio/virtio.c              | 64 ++++++++++++++++++++++++++++++++++++
>>   include/hw/qdev-core.h          |  9 +++++
>>   include/hw/virtio/vhost-scsi.h  |  3 ++
>>   include/hw/virtio/virtio-blk.h  |  2 ++
>>   include/hw/virtio/virtio-net.h  |  3 ++
>>   include/hw/virtio/virtio-scsi.h |  3 ++
>>   include/hw/virtio/virtio.h      |  3 ++
>>   include/monitor/hmp.h           |  1 +
>>   qapi/qdev.json                  | 30 +++++++++++++++++
>>   softmmu/qdev-monitor.c          | 56 +++++++++++++++++++++++++++++++
>>   19 files changed, 261 insertions(+)
>>
>>
>> I did tests with below cases.
>>
>> - virtio-blk-pci (ioeventfd on/off, iothread, live migration)
>> - virtio-scsi-pci (ioeventfd on/off)
>> - vhost-scsi-pci
>> - virtio-net-pci (ioeventfd on/off, vhost)
>>
>> Thank you very much!
>>
>> Dongli Zhang
>>
>>
> 

