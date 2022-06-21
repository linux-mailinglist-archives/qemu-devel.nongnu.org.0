Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E1553790
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 18:12:34 +0200 (CEST)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3gUS-0000go-JK
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 12:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o3gSD-0008Bd-F5
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:10:13 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:13916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o3gS8-0005px-SR
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:10:12 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LFYcg1016405;
 Tue, 21 Jun 2022 09:10:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=n8iqfR5avhItzxGaT2qBys+D4Qm2NcQcCK2txEbAOZU=;
 b=0unpBkaEwnFN0pUorcgpXzJ3JY3UxC+mTXDS5662EQSitcvBgKxWLmbSCT0wwnTNCJYv
 zoRRxlcr7S++/QTpl5FqAMgoil2OUKzO/5m2o2qM5/y/7ZsamnwzgtOAcB5sIy2/Y2mU
 M/yUAKMUBhpyU+PymTbeETgrGf+vEqhOUxwgNuTjxN9cRA3rrIMEbInhQfYLAnamN29A
 S4xGttiyMbQ2uNxL0mRYYofsA+jdmc5zcyJOAl+GNVLfV71FJbxBG8UI0Vdyn+ZMuOSR
 obsdD+EOH1YuQBH3P21aP9Qoy+ArqzftDxnDsGeaHxXZFJYBBt3W/aWB53WXxo1gDdtg sg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3gscthpg8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 09:10:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VE2eYF7wztO+QRpFb0zTHE5PyTg1i68QoQsdrjXKJGHw2De7TDBH8vhFUyYy857wppGswNW7P7JBlJ308J7CxEMImWZaHPylhKGk0Xp1obWmEukdOaUZR2sFjKPm0wTlVyD8HrC3XOoIkuCwmWTjq/IHKfAGEnl++BdISvVQxK1RYr/07Taj4FkFH7vHdqNlJ7AAp3nn1zFd7glKSNvfhG7L8uuKdn8n6HAaScg8RJWViV2V5cU/82aJtq8eTpdKaVXRf4VW65VB2C/65fQH2YMQRfARIAHVkKgoPkEHjy8jlPvskIS32SErS883Ee9IeLYurMxApgQaLSA8V9x1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8iqfR5avhItzxGaT2qBys+D4Qm2NcQcCK2txEbAOZU=;
 b=XPD5ywqFuKNhzeKfB5b50JqmT17FzPathx2nVYVMWOULVtejP7VKJwUx6khlWmGXrL4KcgUViy+8hbX750LCCAYfzlw1a/ajYD8P4QkadO0RJ+rxgAavl4qk1IteqDKjgH1z26kfsqW/bgXqOlCFNhh6TzDDXeVnbI8L+uFoWS7hKat29U4qRFimyIKc43URWvXsGvaPBb71hJ0JCN8CH5aptKZNhZahLkuTqQNGjVDdiOljHhXKj54dDOlGEcmjCHz1gHwrppyUmTiKXN0RQe56w2gBtpm/XTeUhyJqZJAJRxqaQBWm14Y3Cbx65vmzebrOx6GCOv8hY6mM7NCipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM6PR02MB4252.namprd02.prod.outlook.com (2603:10b6:5:a6::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 21 Jun
 2022 16:10:01 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6%5]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 16:10:01 +0000
Content-Type: multipart/alternative;
 boundary="------------0sPY2Ck2OW2CpAS8aMNoYUp0"
Message-ID: <58f73b64-c837-d28a-18c4-28bb320c51c9@nutanix.com>
Date: Tue, 21 Jun 2022 21:39:52 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 3/4] Establishing connection between any non-default
 source and destination pair
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-4-het.gala@nutanix.com> <Yqtq2yRTe4xVNkx+@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Yqtq2yRTe4xVNkx+@redhat.com>
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c9dc7eb-32d6-498f-8e82-08da53a07ea4
X-MS-TrafficTypeDiagnostic: DM6PR02MB4252:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB4252A09B0FCA8F81E2B65476F6B39@DM6PR02MB4252.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5wPIvH2WEOzBD3mrtRQQhWb1kMmta4tMFjjDoG+UXqApADrsu14YOns6rSzADNtiz5pdUy6xAq/m7S2PFcdwmzjawgF5Alf0k1oTysREZkl+FkIFPSt5fqRSo80RwDtZC3HMFo0a2/U8UP0GHUCyGiK4zmlQSZ2QjJ6FgTVA88gLSyD98HtFfCC+kFR3qL7NXFDlHq8IcufVEQ1XLofvodxKQ1tZsU0kseA/tNCyoJKZhPsUI9WWpNSk6rFHAF2o8atxgcaPr6tzRlhDUzzY9yTZ/TY334WSQ4/5LkrShyrr/aONEIQs+YpinHhaPNL/aFNXfAXQMfw2xoakiD3RGiEdK3Dfmxq0jGxOnIm8k9UZ151Ctn4EVfbp/DsiM3UUMuVCJZgEWzwntxb1PpUUbyf/1ULbIJR5JbdjQg95zHerRlPglrsuoirK7Oi2vEgK3Zh2BnpbYO52vPyjndkGxE8AFoDKxA5x2nZjJNqsIOBUiaIDFRCa0XKIkA/lSOH4Tp/zSHeewRuvyeV9eCMT0yW3ZeNPyLAhFWIwoLOplHADOVtopYDnqyqHprSCugiQDSGrklt07WwucQf6hN8GEN0r49OciwsvuEc7Tp5p/YirWTiUN+aJ6W5zmfHocVVgua9n55AzlZkAfUcBjpzofpk7aat/ptZVJdDHnxGJ7qQPj8G2DMt7MwY4mw7t44SC2sZM5iBDyE8wp6FohL7cGQneTwVIaugDtKvMxvU+E7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(396003)(366004)(136003)(39860400002)(8676002)(110136005)(26005)(83380400001)(6512007)(66556008)(36756003)(66946007)(6636002)(316002)(4326008)(66476007)(31686004)(30864003)(478600001)(6486002)(2906002)(33964004)(6666004)(55236004)(53546011)(2616005)(66574015)(41300700001)(6506007)(38100700002)(5660300002)(186003)(86362001)(31696002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NlS21YZUFjSmttUkpjaHppYldDR2QwWllVS1lqNExRM1owZnlOcTE4NnU5?=
 =?utf-8?B?Q1BVckRCRW9xVmVjOVF2OGkwNzkvZTZPaUVvYTMyb3h3RS9FUG9ETjJjRURE?=
 =?utf-8?B?QWFuYVU3RGdHelA4TVVVaGNtOWNUS0Y4YzJSU3Y3RjRrQ0ZaUFFoVnFWUzA1?=
 =?utf-8?B?dkFPMllkZkowMmpDU0VmdW42TVprK05iODdsRUsxQmVTN2E2WEN6cFp0ckVN?=
 =?utf-8?B?ckMzMDdFd1JOSlhMcXNoTmxQWXZ1QU1lQ1NmR1BjbHhTU3pXT1lHc3h0Rzc1?=
 =?utf-8?B?eFplV0QxeWh1NXRPT2o0aEdNRWNZdlIvNCttQ29mR3hyT281Zm1Udm0yRHNF?=
 =?utf-8?B?bVo2N1VDZWRNMm5GcVllK1VsMTVwOFJCQjFSRENKSzQ4SUIzNmFOT0lLeWNF?=
 =?utf-8?B?RWI4V2FhQ1F3Mk9uZG1qaHZBVlh6NUcxRW9zYmJEbEtCaEd5WnE4V0NjM29N?=
 =?utf-8?B?RGtaMEZaSWdSYmRvV29ubjhqRUI1VjZ1MEYwK0krQ2dTOWRRL1k4OXN1N21q?=
 =?utf-8?B?ZmREdUc1SkdKOU1CdVRmbGdPSnJoK1JmNG5CQUZJWDk5SytOT05EN09La2NK?=
 =?utf-8?B?bE1ZUHdaMGpRaGhsYnJxWDJsUVFIUVBjSFNvTkRMdEdvWW1RcW5RNTNOak5k?=
 =?utf-8?B?U0pSSGxXTnNwZGtTUC9oeFJkZXMyQ21zNTl4dFRkOEtvUTJpZER6OGhnK016?=
 =?utf-8?B?WkYzKzdESmlPYXlMVHQ3RjJWenF3NHVMblh1alRDckxnbFlqTEx6a3pHN29s?=
 =?utf-8?B?d2FWeUxCdFQ4N3RRN2xZYXlLTTdnS1ArOHkrQ2o1TVhSTmZFemNrTmJTZGYr?=
 =?utf-8?B?K0FIOHFTelVpejlRbFNmOVlsWC9yckdXSHQzODFMTXlVZU5Nd0VhY0xhK0VC?=
 =?utf-8?B?RmxIRDdsR1g4c0pueHU5MXhrMlkwdFQvbmF6QlpZU2VFWkswbGV3MW8rRXVS?=
 =?utf-8?B?WGZwZUdjcnd3MWpiRWJHTEVsa2hvUTZQS2lGRTJTcXcxWkFRY2Z0MWpVYkpY?=
 =?utf-8?B?YjhibHRNbThqNDFvd3ozS3p1K2pVcFpZZi9zSURxUWpBSUVWbVdRelAvOFha?=
 =?utf-8?B?dE5KT2d5TFV6ZGZoM0xYZC9vWUVibkRsZDR3QnM3RlV0WGw4YjRHcjlaSDFk?=
 =?utf-8?B?SDAyeC9zeEJ1bWZOb044bEFlRFUvK1N4elQvTktKWGR3Q0tUSDYzbU1FZkZZ?=
 =?utf-8?B?dE1HRkNiYlQ3WGhhWU8yV0NDdWNDanRVTWl0RUhla0xrSUtHYWUwaWU5QThE?=
 =?utf-8?B?MUFwTFhMa3B0OWZqQVNpL3orZ2pPUjhUZklGNHFxQ0RrMzBaYlRxdG9RZTNB?=
 =?utf-8?B?V2RKZ2pXL0szcDJSVTA5U2htWUU0RXlXSjZ6WkVEN1dyTzlLTzZYWis3TUo3?=
 =?utf-8?B?dERLbEYyR2x5WXRndFJPK0lZQ1A4dVlvdThDUVBNZjVZT2sveDVuWHF1M2tX?=
 =?utf-8?B?TTNwM3lmVHJxbng2OHRkS2J1b3hKeHhHREZVK0EvSFdZZTVMK25TdUVtT2Fr?=
 =?utf-8?B?b2V2NVJuVmhadzkxSWlxRERXaTd5QUlHejhXQ1ZxTFg5bDNjeVJibXFlSjM0?=
 =?utf-8?B?Z05hTkZ3cUcyZ0FjclZoQjV6ZkxZTFJybmp1MUIvaFFGQ0VOaGIxcWpwUHUv?=
 =?utf-8?B?NHo1bENVRFFtYjJ4ZXJ6ekNBcGlZV2UxY3cxMWp0VjFXWkRZWm5VekhTS2J2?=
 =?utf-8?B?WHV4Y200SGlJWGVNWkc3VDZ1dXdMQklsaytGbVI3K1FHbGVCZkJqdDlMT2ZX?=
 =?utf-8?B?cHU0a2tGSlgza2FzWlhnZFlBS1YwNjBlaTBncU8xMWVicndhWHVTdjRIdk9S?=
 =?utf-8?B?aG54ZlovcHRvUU5oZXZHYTNNRFQ0YzNwelIvczdKaTBHeVlFOEJhazFQSDRU?=
 =?utf-8?B?WDU5Ri9YTkxuTVVCQU1lbGc1enRZRy9zczNtK0ZNb005OEIrS3ZoSTYrT1pq?=
 =?utf-8?B?QXluWk1pYXZzSTNmT0NBRnZOaGFSVUVESlZlV3ovSzNJVU5NT0p2emxJTlhN?=
 =?utf-8?B?UklxWjdNa3FiSjNvVUpvOWR1SzVUN1pKeEl0b0x3Y2VCbkFhN2ZTVTVxc3ZD?=
 =?utf-8?B?aWJ4Z0lhQ1hXRGhyNVNpZUZHYmFhWXQzRktBeVdkNmhVNDNKb2g2ZCtLWlpZ?=
 =?utf-8?B?YTBrcC83aUVObXB1d2tkcFZEeDRXdHNnRERZUWhpOXpDVndabGJiUGNkZkV2?=
 =?utf-8?B?Q3pYc1NUWURTUWhMZG5GTUFKWWM2WjJyRmx3YU0vcW9xVDVkclc1ODBoWGMv?=
 =?utf-8?B?UG80S3pLZHA5ZURpSm5JaHE3QWlIOFQ1OWZpWnNGSFpVVURoVzZnZmkrRGc3?=
 =?utf-8?B?bWZHcXljU3NyL3JiaFlUUWN2L1BFdWplaU1VWkYxaXV4MFdoRFJGSEdUNHpH?=
 =?utf-8?Q?dW6+J7rp9BPG0hi8=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9dc7eb-32d6-498f-8e82-08da53a07ea4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 16:10:01.6881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mo99IJvD8D7eTwjSZizDisiSnD1w2sN0J2OKaulF57WXqK1f/39JTc8PgYYTpC1EEO/fQCVREP410d9aElqc5G1M6wBEPIFU/S3UfxOAs+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4252
X-Proofpoint-GUID: FWNX9AVkW-7Tfjm7qcN4Iwrzozs1Iio-
X-Proofpoint-ORIG-GUID: FWNX9AVkW-7Tfjm7qcN4Iwrzozs1Iio-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--------------0sPY2Ck2OW2CpAS8aMNoYUp0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel, David,

Thank you so much for review on patches. I am posting this message on

behalf of Het. We wanted to get a early feedback so sorry if code was not

in best of shape. Het is currently on break intership break so does not have

access to nutanix mail, he will join in first week of july and will definately post

v2 on this by 2nd week of july.

thanks

Manish MIshra

On 16/06/22 11:09 pm, Daniel P. Berrangé wrote:
> On Thu, Jun 09, 2022 at 07:33:04AM +0000, Het Gala wrote:
>> i) Binding of the socket to source ip address and port on the non-default
>>     interface has been implemented for multi-FD connection, which was not
>>     necessary earlier because the binding was on the default interface itself.
>>
>> ii) Created an end to end connection between all multi-FD source and
>>      destination pairs.
>>
>> Suggested-by: Manish Mishra<manish.mishra@nutanix.com>
>> Signed-off-by: Het Gala<het.gala@nutanix.com>
>> ---
>>   chardev/char-socket.c               |  4 +-
>>   include/io/channel-socket.h         | 26 ++++++-----
>>   include/qemu/sockets.h              |  6 ++-
>>   io/channel-socket.c                 | 50 ++++++++++++++------
>>   migration/socket.c                  | 15 +++---
>>   nbd/client-connection.c             |  2 +-
>>   qemu-nbd.c                          |  4 +-
>>   scsi/pr-manager-helper.c            |  1 +
>>   tests/unit/test-char.c              |  8 ++--
>>   tests/unit/test-io-channel-socket.c |  4 +-
>>   tests/unit/test-util-sockets.c      | 16 +++----
>>   ui/input-barrier.c                  |  2 +-
>>   ui/vnc.c                            |  3 +-
>>   util/qemu-sockets.c                 | 71 ++++++++++++++++++++---------
>>   14 files changed, 135 insertions(+), 77 deletions(-)
>>
>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>> index dc4e218eeb..f3725238c5 100644
>> --- a/chardev/char-socket.c
>> +++ b/chardev/char-socket.c
>> @@ -932,7 +932,7 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Error **errp)
>>       QIOChannelSocket *sioc = qio_channel_socket_new();
>>       tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
>>       tcp_chr_set_client_ioc_name(chr, sioc);
>> -    if (qio_channel_socket_connect_sync(sioc, s->addr, errp) < 0) {
>> +    if (qio_channel_socket_connect_sync(sioc, s->addr, NULL, errp) < 0) {
>>           tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
>>           object_unref(OBJECT(sioc));
>>           return -1;
>> @@ -1120,7 +1120,7 @@ static void tcp_chr_connect_client_task(QIOTask *task,
>>       SocketAddress *addr = opaque;
>>       Error *err = NULL;
>>   
>> -    qio_channel_socket_connect_sync(ioc, addr, &err);
>> +    qio_channel_socket_connect_sync(ioc, addr, NULL, &err);
>>   
>>       qio_task_set_error(task, err);
>>   }
>> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
>> index 513c428fe4..59d5b1b349 100644
>> --- a/include/io/channel-socket.h
>> +++ b/include/io/channel-socket.h
>> @@ -83,41 +83,45 @@ qio_channel_socket_new_fd(int fd,
>>   /**
>>    * qio_channel_socket_connect_sync:
>>    * @ioc: the socket channel object
>> - * @addr: the address to connect to
>> + * @dst_addr: the destination address to connect to
>> + * @src_addr: the source address to be connected
>>    * @errp: pointer to a NULL-initialized error object
>>    *
>> - * Attempt to connect to the address @addr. This method
>> - * will run in the foreground so the caller will not regain
>> - * execution control until the connection is established or
>> + * Attempt to connect to the address @dst_addr with @src_addr.
>> + * This method will run in the foreground so the caller will not
>> + * regain execution control until the connection is established or
>>    * an error occurs.
>>    */
>>   int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>> -                                    SocketAddress *addr,
>> +                                    SocketAddress *dst_addr,
>> +                                    SocketAddress *src_addr,
>>                                       Error **errp);
>>   
>>   /**
>>    * qio_channel_socket_connect_async:
>>    * @ioc: the socket channel object
>> - * @addr: the address to connect to
>> + * @dst_addr: the destination address to connect to
>>    * @callback: the function to invoke on completion
>>    * @opaque: user data to pass to @callback
>>    * @destroy: the function to free @opaque
>>    * @context: the context to run the async task. If %NULL, the default
>>    *           context will be used.
>> + * @src_addr: the source address to be connected
>>    *
>> - * Attempt to connect to the address @addr. This method
>> - * will run in the background so the caller will regain
>> + * Attempt to connect to the address @dst_addr with the @src_addr.
>> + * This method will run in the background so the caller will regain
>>    * execution control immediately. The function @callback
>> - * will be invoked on completion or failure. The @addr
>> + * will be invoked on completion or failure. The @dst_addr
>>    * parameter will be copied, so may be freed as soon
>>    * as this function returns without waiting for completion.
>>    */
>>   void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
>> -                                      SocketAddress *addr,
>> +                                      SocketAddress *dst_addr,
>>                                         QIOTaskFunc callback,
>>                                         gpointer opaque,
>>                                         GDestroyNotify destroy,
>> -                                      GMainContext *context);
>> +                                      GMainContext *context,
>> +                                      SocketAddress *src_addr);
> Lets avoid modifying these two methods, and thus avoid
> updating countless callers.
>
> In common with typical pattern in QIO code, lets add
> a second variant
>
>    qio_channel_socket_connect_full
>    qio_channel_socket_connect_full_async
>
> which has the extra parameters, then make the existing
> simpler methods call the new ones.
>
> ie qio_channel_socket_connect should call
> qio_channel_socket_connect_full, pasing NULL for the
> src_addr.
>
>
>
>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>> index dc9c165de1..f8746ad646 100644
>> --- a/io/channel-socket.c
>> +++ b/io/channel-socket.c
>> @@ -36,6 +36,12 @@
>>   
>>   #define SOCKET_MAX_FDS 16
>>   
>> +struct SrcDestAddress {
>> +    SocketAddress *dst_addr;
>> +    SocketAddress *src_addr;
>> +};
> Nitpick, just call this   'struct ConnectData'.
>
>>   SocketAddress *
>>   qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
>>                                        Error **errp)
>> @@ -145,13 +151,14 @@ qio_channel_socket_new_fd(int fd,
>>   
>>   
>>   int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>> -                                    SocketAddress *addr,
>> +                                    SocketAddress *dst_addr,
>> +                                    SocketAddress *src_addr,
>>                                       Error **errp)
>>   {
>>       int fd;
>>   
>> -    trace_qio_channel_socket_connect_sync(ioc, addr);
>> -    fd = socket_connect(addr, errp);
>> +    trace_qio_channel_socket_connect_sync(ioc, dst_addr);
>> +    fd = socket_connect(dst_addr, src_addr, errp);
>>       if (fd < 0) {
>>           trace_qio_channel_socket_connect_fail(ioc);
>>           return -1;
>> @@ -177,39 +184,56 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>>   }
>>   
>>   
>> +static void qio_channel_socket_worker_free(gpointer opaque)
>> +{
>> +    struct SrcDestAddress *data = opaque;
>> +    if (!data) {
>> +        return;
>> +    }
>> +    qapi_free_SocketAddress(data->dst_addr);
>> +    qapi_free_SocketAddress(data->src_addr);
>> +    g_free(data);
>> +}
>> +
>> +
>>   static void qio_channel_socket_connect_worker(QIOTask *task,
>>                                                 gpointer opaque)
>>   {
>>       QIOChannelSocket *ioc = QIO_CHANNEL_SOCKET(qio_task_get_source(task));
>> -    SocketAddress *addr = opaque;
>> +    struct SrcDestAddress *data = opaque;
>>       Error *err = NULL;
>>   
>> -    qio_channel_socket_connect_sync(ioc, addr, &err);
>> +    qio_channel_socket_connect_sync(ioc, data->dst_addr, data->src_addr, &err);
>>   
>>       qio_task_set_error(task, err);
>>   }
>>   
>>   
>>   void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
>> -                                      SocketAddress *addr,
>> +                                      SocketAddress *dst_addr,
>>                                         QIOTaskFunc callback,
>>                                         gpointer opaque,
>>                                         GDestroyNotify destroy,
>> -                                      GMainContext *context)
>> +                                      GMainContext *context,
>> +                                      SocketAddress *src_addr)
>>   {
>>       QIOTask *task = qio_task_new(
>>           OBJECT(ioc), callback, opaque, destroy);
>> -    SocketAddress *addrCopy;
>> -
>> -    addrCopy = QAPI_CLONE(SocketAddress, addr);
>> +    struct SrcDestAddress *data = g_new0(struct SrcDestAddress, 1);
>>   
>> +    data->dst_addr = QAPI_CLONE(SocketAddress, dst_addr);
>> +    if (src_addr) {
>> +        data->src_addr = QAPI_CLONE(SocketAddress, src_addr);
>> +    } else {
>> +        data->src_addr = NULL;
>> +    }
>>       /* socket_connect() does a non-blocking connect(), but it
>>        * still blocks in DNS lookups, so we must use a thread */
>> -    trace_qio_channel_socket_connect_async(ioc, addr);
>> +    trace_qio_channel_socket_connect_async(ioc, dst_addr);
>>       qio_task_run_in_thread(task,
>>                              qio_channel_socket_connect_worker,
>> -                           addrCopy,
>> -                           (GDestroyNotify)qapi_free_SocketAddress,
>> +                           data,
>> +                           qio_channel_socket_worker_free,
>>                              context);
>>   }
>>   
>> diff --git a/migration/socket.c b/migration/socket.c
>> index 21e0983df2..d0cb7cc6a6 100644
>> --- a/migration/socket.c
>> +++ b/migration/socket.c
>> @@ -47,7 +47,7 @@ void socket_send_channel_create(QIOTaskFunc f, void *data)
>>   {
>>       QIOChannelSocket *sioc = qio_channel_socket_new();
>>       qio_channel_socket_connect_async(sioc, outgoing_args.saddr,
>> -                                     f, data, NULL, NULL);
>> +                                     f, data, NULL, NULL, NULL);
>>   }
>>   
>>   int socket_send_channel_destroy(QIOChannel *send)
>> @@ -110,7 +110,7 @@ out:
>>   
>>   static void
>>   socket_start_outgoing_migration_internal(MigrationState *s,
>> -                                         SocketAddress *saddr,
>> +                                         SocketAddress *dst_addr,
>>                                            Error **errp)
>>   {
>>       QIOChannelSocket *sioc = qio_channel_socket_new();
>> @@ -118,20 +118,17 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>>   
>>       data->s = s;
>>   
>> -    /* in case previous migration leaked it */
>> -    qapi_free_SocketAddress(outgoing_args.saddr);
>> -    outgoing_args.saddr = saddr;
>> -
>> -    if (saddr->type == SOCKET_ADDRESS_TYPE_INET) {
>> -        data->hostname = g_strdup(saddr->u.inet.host);
>> +    if (dst_addr->type == SOCKET_ADDRESS_TYPE_INET) {
>> +        data->hostname = g_strdup(dst_addr->u.inet.host);
>>       }
>>   
>>       qio_channel_set_name(QIO_CHANNEL(sioc), "migration-socket-outgoing");
>>       qio_channel_socket_connect_async(sioc,
>> -                                     saddr,
>> +                                     dst_addr,
>>                                        socket_outgoing_migration,
>>                                        data,
>>                                        socket_connect_data_free,
>> +                                     NULL,
>>                                        NULL);
>>   }
>>   
>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> index 13b5b197f9..bbe0dc0ee0 100644
>> --- a/util/qemu-sockets.c
>> +++ b/util/qemu-sockets.c
>> @@ -226,7 +226,7 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
>>           return -1;
>>       }
>>   
>> -    memset(&ai,0, sizeof(ai));
>> +    memset(&ai,0,sizeof(ai));
> Add whitespace before the '0', rather than removing it after.
>
>>       ai.ai_flags = AI_PASSIVE;
>>       if (saddr->has_numeric && saddr->numeric) {
>>           ai.ai_flags |= AI_NUMERICHOST | AI_NUMERICSERV;
>> @@ -282,8 +282,8 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
>>               e->ai_protocol = IPPROTO_MPTCP;
>>           }
>>   #endif
>> -        getnameinfo((struct sockaddr*)e->ai_addr,e->ai_addrlen,
>> -                        uaddr,INET6_ADDRSTRLEN,uport,32,
>> +        getnameinfo((struct sockaddr *)e->ai_addr, e->ai_addrlen,
>> +                        uaddr, INET6_ADDRSTRLEN, uport, 32,
>>                           NI_NUMERICHOST | NI_NUMERICSERV);
> Both thsi & the above whitespace changes should be a separate
> patch from any functional changes
>
>
>> @@ -371,8 +372,28 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
>>       }
>>       socket_set_fast_reuse(sock);
>>   
>> +    /* to bind the socket if src_addr is available */
>> +
>> +    if (src_addr) {
>> +        struct sockaddr_in servaddr;
>> +
>> +        /* bind to a specific interface in the internet domain */
>> +        /* to make sure the sin_zero filed is cleared */
>> +        memset(&servaddr, 0, sizeof(servaddr));
>> +
>> +        servaddr.sin_family = AF_INET;
>> +        servaddr.sin_addr.s_addr = inet_addr(src_addr->host);
> We can't assume src_addr is a raw IPv4 address.
>
> THis needs to go through getaddrinfo in the caller like the
> dst address has done.
>
> For sanity, we should also validate that there isn't a mismatch
> of IPv4 vs IPv6 for thte src & dst addrs.
>
>> +        servaddr.sin_port = 0;
>
>
>> +
>> +        if (bind(sock, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
>> +            error_setg_errno(errp, errno, "Failed to bind socket");
>> +            return -1;
>> +        }
>> +    }
>> +
>>       /* connect to peer */
>>       do {
>> +
>>           rc = 0;
>>           if (connect(sock, addr->ai_addr, addr->ai_addrlen) < 0) {
>>               rc = -errno;
>> @@ -380,8 +401,14 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
>>       } while (rc == -EINTR);
>>   
>>       if (rc < 0) {
>> -        error_setg_errno(errp, errno, "Failed to connect to '%s:%s'",
>> -                         saddr->host, saddr->port);
>> +        if (src_addr) {
>> +            error_setg_errno(errp, errno, "Failed to connect '%s:%s' to "
>> +                             "'%s:%s'", dst_addr->host, dst_addr->port,
>> +                             src_addr->host, src_addr->port);
>> +        } else {
>> +            error_setg_errno(errp, errno, "Failed to connect '%s:%s'",
>> +                             dst_addr->host, dst_addr->port);
>> +        }
>>           closesocket(sock);
>>           return -1;
>>       }
>> @@ -506,7 +534,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
>>       Error *err = NULL;
>>   
>>       /* lookup peer addr */
>> -    memset(&ai,0, sizeof(ai));
>> +    memset(&ai, 0, sizeof(ai));
>>       ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
>>       ai.ai_family = inet_ai_family_from_address(sraddr, &err);
>>       ai.ai_socktype = SOCK_DGRAM;
>> @@ -533,7 +561,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
>>       }
>>   
>>       /* lookup local addr */
>> -    memset(&ai,0, sizeof(ai));
>> +    memset(&ai, 0, sizeof(ai));
>>       ai.ai_flags = AI_PASSIVE;
>>       ai.ai_family = peer->ai_family;
>>       ai.ai_socktype = SOCK_DGRAM;
>
>> @@ -574,7 +602,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
>>       }
>>   
>>       /* connect to peer */
>> -    if (connect(sock,peer->ai_addr,peer->ai_addrlen) < 0) {
>> +    if (connect(sock, peer->ai_addr, peer->ai_addrlen) < 0) {
>>           error_setg_errno(errp, errno, "Failed to connect to '%s:%s'",
>>                            addr, port);
>>           goto err;
> More whitespace changes for a separate patch
>
>
>
>
> With regards,
> Daniel
--------------0sPY2Ck2OW2CpAS8aMNoYUp0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="2">Hi Daniel, David,</font></p>
    <p><font size="2">Thank you so much for review on patches. I am
        posting this message on</font></p>
    <p><font size="2">behalf of Het. We wanted to get a early feedback
        so sorry if code was not</font></p>
    <p><font size="2">in best of shape. Het is currently on break
        intership break so does not have</font></p>
    <p><font size="2">access to nutanix mail, he will join in first week
        of july and will definately post</font></p>
    <p><font size="2">v2 on this by 2nd week of july.</font></p>
    <p><font size="2">thanks</font></p>
    <p><font size="2">Manish MIshra</font><br>
    </p>
    <div class="moz-cite-prefix">On 16/06/22 11:09 pm, Daniel P.
      Berrangé wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Yqtq2yRTe4xVNkx+@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Jun 09, 2022 at 07:33:04AM +0000, Het Gala wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">i) Binding of the socket to source ip address and port on the non-default
   interface has been implemented for multi-FD connection, which was not
   necessary earlier because the binding was on the default interface itself.

ii) Created an end to end connection between all multi-FD source and
    destination pairs.

Suggested-by: Manish Mishra <a class="moz-txt-link-rfc2396E" href="mailto:manish.mishra@nutanix.com">&lt;manish.mishra@nutanix.com&gt;</a>
Signed-off-by: Het Gala <a class="moz-txt-link-rfc2396E" href="mailto:het.gala@nutanix.com">&lt;het.gala@nutanix.com&gt;</a>
---
 chardev/char-socket.c               |  4 +-
 include/io/channel-socket.h         | 26 ++++++-----
 include/qemu/sockets.h              |  6 ++-
 io/channel-socket.c                 | 50 ++++++++++++++------
 migration/socket.c                  | 15 +++---
 nbd/client-connection.c             |  2 +-
 qemu-nbd.c                          |  4 +-
 scsi/pr-manager-helper.c            |  1 +
 tests/unit/test-char.c              |  8 ++--
 tests/unit/test-io-channel-socket.c |  4 +-
 tests/unit/test-util-sockets.c      | 16 +++----
 ui/input-barrier.c                  |  2 +-
 ui/vnc.c                            |  3 +-
 util/qemu-sockets.c                 | 71 ++++++++++++++++++++---------
 14 files changed, 135 insertions(+), 77 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index dc4e218eeb..f3725238c5 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -932,7 +932,7 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Error **errp)
     QIOChannelSocket *sioc = qio_channel_socket_new();
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     tcp_chr_set_client_ioc_name(chr, sioc);
-    if (qio_channel_socket_connect_sync(sioc, s-&gt;addr, errp) &lt; 0) {
+    if (qio_channel_socket_connect_sync(sioc, s-&gt;addr, NULL, errp) &lt; 0) {
         tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
         object_unref(OBJECT(sioc));
         return -1;
@@ -1120,7 +1120,7 @@ static void tcp_chr_connect_client_task(QIOTask *task,
     SocketAddress *addr = opaque;
     Error *err = NULL;
 
-    qio_channel_socket_connect_sync(ioc, addr, &amp;err);
+    qio_channel_socket_connect_sync(ioc, addr, NULL, &amp;err);
 
     qio_task_set_error(task, err);
 }
diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index 513c428fe4..59d5b1b349 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -83,41 +83,45 @@ qio_channel_socket_new_fd(int fd,
 /**
  * qio_channel_socket_connect_sync:
  * @ioc: the socket channel object
- * @addr: the address to connect to
+ * @dst_addr: the destination address to connect to
+ * @src_addr: the source address to be connected
  * @errp: pointer to a NULL-initialized error object
  *
- * Attempt to connect to the address @addr. This method
- * will run in the foreground so the caller will not regain
- * execution control until the connection is established or
+ * Attempt to connect to the address @dst_addr with @src_addr.
+ * This method will run in the foreground so the caller will not
+ * regain execution control until the connection is established or
  * an error occurs.
  */
 int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
-                                    SocketAddress *addr,
+                                    SocketAddress *dst_addr,
+                                    SocketAddress *src_addr,
                                     Error **errp);
 
 /**
  * qio_channel_socket_connect_async:
  * @ioc: the socket channel object
- * @addr: the address to connect to
+ * @dst_addr: the destination address to connect to
  * @callback: the function to invoke on completion
  * @opaque: user data to pass to @callback
  * @destroy: the function to free @opaque
  * @context: the context to run the async task. If %NULL, the default
  *           context will be used.
+ * @src_addr: the source address to be connected
  *
- * Attempt to connect to the address @addr. This method
- * will run in the background so the caller will regain
+ * Attempt to connect to the address @dst_addr with the @src_addr.
+ * This method will run in the background so the caller will regain
  * execution control immediately. The function @callback
- * will be invoked on completion or failure. The @addr
+ * will be invoked on completion or failure. The @dst_addr
  * parameter will be copied, so may be freed as soon
  * as this function returns without waiting for completion.
  */
 void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
-                                      SocketAddress *addr,
+                                      SocketAddress *dst_addr,
                                       QIOTaskFunc callback,
                                       gpointer opaque,
                                       GDestroyNotify destroy,
-                                      GMainContext *context);
+                                      GMainContext *context,
+                                      SocketAddress *src_addr);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Lets avoid modifying these two methods, and thus avoid
updating countless callers.

In common with typical pattern in QIO code, lets add
a second variant

  qio_channel_socket_connect_full
  qio_channel_socket_connect_full_async

which has the extra parameters, then make the existing
simpler methods call the new ones.

ie qio_channel_socket_connect should call
qio_channel_socket_connect_full, pasing NULL for the
src_addr.



</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/io/channel-socket.c b/io/channel-socket.c
index dc9c165de1..f8746ad646 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -36,6 +36,12 @@
 
 #define SOCKET_MAX_FDS 16
 
+struct SrcDestAddress {
+    SocketAddress *dst_addr;
+    SocketAddress *src_addr;
+};
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Nitpick, just call this   'struct ConnectData'.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> SocketAddress *
 qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
                                      Error **errp)
@@ -145,13 +151,14 @@ qio_channel_socket_new_fd(int fd,
 
 
 int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
-                                    SocketAddress *addr,
+                                    SocketAddress *dst_addr,
+                                    SocketAddress *src_addr,
                                     Error **errp)
 {
     int fd;
 
-    trace_qio_channel_socket_connect_sync(ioc, addr);
-    fd = socket_connect(addr, errp);
+    trace_qio_channel_socket_connect_sync(ioc, dst_addr);
+    fd = socket_connect(dst_addr, src_addr, errp);
     if (fd &lt; 0) {
         trace_qio_channel_socket_connect_fail(ioc);
         return -1;
@@ -177,39 +184,56 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
 }
 
 
+static void qio_channel_socket_worker_free(gpointer opaque)
+{
+    struct SrcDestAddress *data = opaque;
+    if (!data) {
+        return;
+    }
+    qapi_free_SocketAddress(data-&gt;dst_addr);
+    qapi_free_SocketAddress(data-&gt;src_addr);
+    g_free(data);
+}
+
+
 static void qio_channel_socket_connect_worker(QIOTask *task,
                                               gpointer opaque)
 {
     QIOChannelSocket *ioc = QIO_CHANNEL_SOCKET(qio_task_get_source(task));
-    SocketAddress *addr = opaque;
+    struct SrcDestAddress *data = opaque;
     Error *err = NULL;
 
-    qio_channel_socket_connect_sync(ioc, addr, &amp;err);
+    qio_channel_socket_connect_sync(ioc, data-&gt;dst_addr, data-&gt;src_addr, &amp;err);
 
     qio_task_set_error(task, err);
 }
 
 
 void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
-                                      SocketAddress *addr,
+                                      SocketAddress *dst_addr,
                                       QIOTaskFunc callback,
                                       gpointer opaque,
                                       GDestroyNotify destroy,
-                                      GMainContext *context)
+                                      GMainContext *context,
+                                      SocketAddress *src_addr)
 {
     QIOTask *task = qio_task_new(
         OBJECT(ioc), callback, opaque, destroy);
-    SocketAddress *addrCopy;
-
-    addrCopy = QAPI_CLONE(SocketAddress, addr);
+    struct SrcDestAddress *data = g_new0(struct SrcDestAddress, 1);
 
+    data-&gt;dst_addr = QAPI_CLONE(SocketAddress, dst_addr);
+    if (src_addr) {
+        data-&gt;src_addr = QAPI_CLONE(SocketAddress, src_addr);
+    } else {
+        data-&gt;src_addr = NULL;
+    }
     /* socket_connect() does a non-blocking connect(), but it
      * still blocks in DNS lookups, so we must use a thread */
-    trace_qio_channel_socket_connect_async(ioc, addr);
+    trace_qio_channel_socket_connect_async(ioc, dst_addr);
     qio_task_run_in_thread(task,
                            qio_channel_socket_connect_worker,
-                           addrCopy,
-                           (GDestroyNotify)qapi_free_SocketAddress,
+                           data,
+                           qio_channel_socket_worker_free,
                            context);
 }
 
diff --git a/migration/socket.c b/migration/socket.c
index 21e0983df2..d0cb7cc6a6 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -47,7 +47,7 @@ void socket_send_channel_create(QIOTaskFunc f, void *data)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
     qio_channel_socket_connect_async(sioc, outgoing_args.saddr,
-                                     f, data, NULL, NULL);
+                                     f, data, NULL, NULL, NULL);
 }
 
 int socket_send_channel_destroy(QIOChannel *send)
@@ -110,7 +110,7 @@ out:
 
 static void
 socket_start_outgoing_migration_internal(MigrationState *s,
-                                         SocketAddress *saddr,
+                                         SocketAddress *dst_addr,
                                          Error **errp)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
@@ -118,20 +118,17 @@ socket_start_outgoing_migration_internal(MigrationState *s,
 
     data-&gt;s = s;
 
-    /* in case previous migration leaked it */
-    qapi_free_SocketAddress(outgoing_args.saddr);
-    outgoing_args.saddr = saddr;
-
-    if (saddr-&gt;type == SOCKET_ADDRESS_TYPE_INET) {
-        data-&gt;hostname = g_strdup(saddr-&gt;u.inet.host);
+    if (dst_addr-&gt;type == SOCKET_ADDRESS_TYPE_INET) {
+        data-&gt;hostname = g_strdup(dst_addr-&gt;u.inet.host);
     }
 
     qio_channel_set_name(QIO_CHANNEL(sioc), &quot;migration-socket-outgoing&quot;);
     qio_channel_socket_connect_async(sioc,
-                                     saddr,
+                                     dst_addr,
                                      socket_outgoing_migration,
                                      data,
                                      socket_connect_data_free,
+                                     NULL,
                                      NULL);
 }
 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9..bbe0dc0ee0 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -226,7 +226,7 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
         return -1;
     }
 
-    memset(&amp;ai,0, sizeof(ai));
+    memset(&amp;ai,0,sizeof(ai));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Add whitespace before the '0', rather than removing it after.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">     ai.ai_flags = AI_PASSIVE;
     if (saddr-&gt;has_numeric &amp;&amp; saddr-&gt;numeric) {
         ai.ai_flags |= AI_NUMERICHOST | AI_NUMERICSERV;
@@ -282,8 +282,8 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
             e-&gt;ai_protocol = IPPROTO_MPTCP;
         }
 #endif
-        getnameinfo((struct sockaddr*)e-&gt;ai_addr,e-&gt;ai_addrlen,
-                        uaddr,INET6_ADDRSTRLEN,uport,32,
+        getnameinfo((struct sockaddr *)e-&gt;ai_addr, e-&gt;ai_addrlen,
+                        uaddr, INET6_ADDRSTRLEN, uport, 32,
                         NI_NUMERICHOST | NI_NUMERICSERV);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Both thsi &amp; the above whitespace changes should be a separate
patch from any functional changes


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -371,8 +372,28 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
     }
     socket_set_fast_reuse(sock);
 
+    /* to bind the socket if src_addr is available */
+
+    if (src_addr) {
+        struct sockaddr_in servaddr;
+
+        /* bind to a specific interface in the internet domain */
+        /* to make sure the sin_zero filed is cleared */
+        memset(&amp;servaddr, 0, sizeof(servaddr));
+
+        servaddr.sin_family = AF_INET;
+        servaddr.sin_addr.s_addr = inet_addr(src_addr-&gt;host);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We can't assume src_addr is a raw IPv4 address.

THis needs to go through getaddrinfo in the caller like the
dst address has done.

For sanity, we should also validate that there isn't a mismatch
of IPv4 vs IPv6 for thte src &amp; dst addrs.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        servaddr.sin_port = 0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+        if (bind(sock, (struct sockaddr *)&amp;servaddr, sizeof(servaddr)) &lt; 0) {
+            error_setg_errno(errp, errno, &quot;Failed to bind socket&quot;);
+            return -1;
+        }
+    }
+
     /* connect to peer */
     do {
+
         rc = 0;
         if (connect(sock, addr-&gt;ai_addr, addr-&gt;ai_addrlen) &lt; 0) {
             rc = -errno;
@@ -380,8 +401,14 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
     } while (rc == -EINTR);
 
     if (rc &lt; 0) {
-        error_setg_errno(errp, errno, &quot;Failed to connect to '%s:%s'&quot;,
-                         saddr-&gt;host, saddr-&gt;port);
+        if (src_addr) {
+            error_setg_errno(errp, errno, &quot;Failed to connect '%s:%s' to &quot;
+                             &quot;'%s:%s'&quot;, dst_addr-&gt;host, dst_addr-&gt;port,
+                             src_addr-&gt;host, src_addr-&gt;port);
+        } else {
+            error_setg_errno(errp, errno, &quot;Failed to connect '%s:%s'&quot;,
+                             dst_addr-&gt;host, dst_addr-&gt;port);
+        }
         closesocket(sock);
         return -1;
     }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -506,7 +534,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     Error *err = NULL;
 
     /* lookup peer addr */
-    memset(&amp;ai,0, sizeof(ai));
+    memset(&amp;ai, 0, sizeof(ai));
     ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
     ai.ai_family = inet_ai_family_from_address(sraddr, &amp;err);
     ai.ai_socktype = SOCK_DGRAM;
@@ -533,7 +561,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     }
 
     /* lookup local addr */
-    memset(&amp;ai,0, sizeof(ai));
+    memset(&amp;ai, 0, sizeof(ai));
     ai.ai_flags = AI_PASSIVE;
     ai.ai_family = peer-&gt;ai_family;
     ai.ai_socktype = SOCK_DGRAM;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -574,7 +602,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     }
 
     /* connect to peer */
-    if (connect(sock,peer-&gt;ai_addr,peer-&gt;ai_addrlen) &lt; 0) {
+    if (connect(sock, peer-&gt;ai_addr, peer-&gt;ai_addrlen) &lt; 0) {
         error_setg_errno(errp, errno, &quot;Failed to connect to '%s:%s'&quot;,
                          addr, port);
         goto err;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
More whitespace changes for a separate patch




With regards,
Daniel
</pre>
    </blockquote>
  </body>
</html>

--------------0sPY2Ck2OW2CpAS8aMNoYUp0--

