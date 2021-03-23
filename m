Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBC6346946
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:45:54 +0100 (CET)
Received: from localhost ([::1]:50652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmyP-0007wv-93
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOmDE-0005Gm-D5; Tue, 23 Mar 2021 14:57:08 -0400
Received: from mail-eopbgr70128.outbound.protection.outlook.com
 ([40.107.7.128]:63776 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOmDB-0001yB-Sm; Tue, 23 Mar 2021 14:57:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvNWM+tuXgITgeCpBNw5J3zGELL2Gz8iYSQ5y7410iNZp26XwMJE5OxRY56fL2WQCOzJ/5rHO3P6PCqSdiwVRVrFZcI5UbvgJtiIkMMUfuKMD2gLmGF1yDdWkyfF5xzStalUDrKF4/kf5jX9vMMwmq2m8lNPjK8Iv2ETiquN1k07uiiJQP0YO9kev2w/msPfIAZ+ZhIu0e58GePq8kYbbyvq5PZd1FndV9yPH5icVGClUNUwMvCNgK+Bd8jzeyUAJk39VpshXHNeJ7wOO57T9pHtiM/UNWHK6kWy+pKo8qsaT6WkmwB810L093Jgg8nBCbf8pOL4HUpliMD9SnAsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lPLsNQgf8GXchXHwSwG1xN/0LwmWK1kAOvF2O+wkwY=;
 b=A69asFDSxBuZpcE+AE6VVa/cGXKbR80uFi+GDdv34TpzE14viwNP5kyn2FSxFzt5rn3cBUhc5Nkm0+PfRvqBTfb1WgBMGB+beIL/7RFJjOUtHdqG2ULozJ+wxC38AT8h5EqRtdF7FuZ0MifgU31yVmqn2IlPPX4uEiCHYr24ein5xFoQXkSjNvvYfm3pnfv163MF9gxenPRv78ufmHkxj08GCNAol8XsCOdoPCpqB8RMwIzqq9RkQeIv/6ip53NLBUW50PtBZWUF9NZahFsN1oAIrAE02B0qVUlllZ6x3BYX7CPB2QZQviJ9gndn1FTc5S6o2rVox4hALtGAqH2c6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lPLsNQgf8GXchXHwSwG1xN/0LwmWK1kAOvF2O+wkwY=;
 b=mzcLjcLwh9xwvO9F3/xLp5+JnhnYgalx24d0bzJ+TF8W5d2l87UuAmvoFFoH4DEFPnU0A6o0swehuTOwoXzIUr5w2e4LLX7LGo/zpa/gLxtWX12PqHLW7Vd1LG5FA6b4045zlmzZjS98qxZeebngV99Av3nV0H1DrDoOu0+jT2o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Tue, 23 Mar
 2021 18:57:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 18:57:03 +0000
Subject: Re: [PATCH v2 1/5] qemu-iotests: do not buffer the test output
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323181928.311862-1-pbonzini@redhat.com>
 <20210323181928.311862-2-pbonzini@redhat.com>
 <192fb6f9-c913-2393-54e7-ffcc87be7467@virtuozzo.com>
Message-ID: <a483830f-d2fb-1de0-bfea-bb90542a53c3@virtuozzo.com>
Date: Tue, 23 Mar 2021 21:57:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <192fb6f9-c913-2393-54e7-ffcc87be7467@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0008.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 18:57:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c0f2065-426c-481d-c71a-08d8ee2d7225
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53360151CFBF773688DB7E11C1649@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 156/pCr5SRYD40uxvaocojUOz19ZNw3D+u7P48RGJxLoURvmkJVuXd42UkJn/3Rt7vL2ZMUJLDarHSduqnDLc3JKSOhT6YHyKO/Flb4+1e/8XctbFtY/Vm8dNe5GLwppCZAm2rnSmr/3KIX2Pw6wb/NuaykXkX++3ASFJYXWsQRaQLEmfmFoRDJEBEtTnGruEXYy4/oJ83PrImD0XnDqWt9I1Q+uqIrEB4mN+XOAKBzy2ScEl8C7fXM+hGoUqNgoYBzbQe6Y81o0gdxQ8MnwO6L5REYiNO2DRXCuV5aU2zQbXxDKkYypQ4aAK00ohMAwQhpWGE5sxSyBh/oFf7bilswJi+CoPat2Ht/7ZgU+y5tpa+tYzLL4eD5zKD7of2sfFDNkLDpC6/ER+QuUK/npB3Jnn7COfGXPDFE+95eYKmQl4mWnpdrwSHU64Bq9vxAPehhAkDTp3stA/dHcPgh0dmaS/GeiRkINxXV9B+rmzYIw+DGn727Z/rSkO/70ESAwTACpHc18Z65DE1ar/myZdkEqk/vTQVgReH4KNlUK04FybnHWi1bwuzKMaYZpxNZO7tlruW2uMGiRokxwjD6wPrdyR2CWP0hnwU1W+ZzzTXUsjCz2CTLvEjvlnzDQ1TefvUy4GTjEfKAIV95UdMlSKosyfWDfudbZvRIxVNf/RAHZ7MZCNx6UurFqSMR84fap/dT4Q6sXF8fuxd1pOvjvfkP9kfvypy+MEcoXKFpxdPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39830400003)(366004)(376002)(8936002)(31686004)(6486002)(478600001)(16576012)(316002)(2906002)(186003)(86362001)(31696002)(16526019)(26005)(38100700001)(8676002)(956004)(66556008)(66476007)(66946007)(2616005)(36756003)(5660300002)(4326008)(4744005)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THRDTTdBbGYxb3RvcXpIK3RCYmxuTHZpTFJ2TWo4T24rNGZKTkZUc0dCZjcw?=
 =?utf-8?B?SDhNU2pabHBINGZMTlR0cEdZWHBhbWNWSTBYUEM0eCtTOFlkTS9FdEVKMkov?=
 =?utf-8?B?eXRMWjNBcGYzcExwV0YxYVVNSU1xSStzQ3lISmZjZnYzRVgvbUNkamJtdjdl?=
 =?utf-8?B?QnhjQXFSRGwwaUhabWRUdGJqem9NRFN2c28zbW0rbDdYdFZhelR5VDRYTkpQ?=
 =?utf-8?B?NEdrVk5LdzF3TmgrYzJ2dldrOGpoOFZEaFpSR21Iam5WZXNPMXBnUUNlVlhr?=
 =?utf-8?B?RlpxRlQ2WEJhL3dIaC9BNEV0TmRsQ09NV08zc1dUdXYxOVZiaFBwdkFlbVZZ?=
 =?utf-8?B?bXlCS3JVblFPZ3VicW5yampaN3BaNEoxYnlqemNpek9SNGZPNkw0WVZ2MVhn?=
 =?utf-8?B?b0xlRGlDcC9sa2FEKzBzVmc4amJqV2tCM2ZuY2tyc1lEak1xMUVDN0JJekVE?=
 =?utf-8?B?YUlYc1BlZG9iVG5vQkZiQ0VFT1FjZ0E5UXNtWm9GVzRjSTlJb0pBTktqQnQ3?=
 =?utf-8?B?NWc2NmVUMUdLdVFSc3dZVjNKSmw4dm5vUjJOMmRiOUh1cHhPdWZpOE9ad2g1?=
 =?utf-8?B?WXRaNFpaSEFrQklXSUpMTkUxYWd5Z1RXNkEzdmNUMGpPNmZaZVhrQmNWY1Np?=
 =?utf-8?B?TDFLWVhQc00zcHRoQjBFWFNRMzBnOU53elZoWjZjekJpZVR4VmREbm5qZnl5?=
 =?utf-8?B?Zm9YeW1td01YTThtQ1BXK0MwaG1qR2x0dGtXR3ZWblJjdFZIeDJ0cHo5ejhT?=
 =?utf-8?B?OTVGMEVXSUpldWZpdEYvcTJ3RW5wSHNEbUhJZ1F6ViszWVZDZEVQM0l4RVpR?=
 =?utf-8?B?SExOM1A0RmhpWkdFb1J6OFI1MDFGampNUjNjdERyMjRkd25rUFZBeGZRNmtQ?=
 =?utf-8?B?SC9ER2FCUmV1VEtHdWJ2dnl1L2ZPdUNBMTI3VExkZ2NzVFpvOVJ2NER1S3ZG?=
 =?utf-8?B?OTIwdzk1dmpXK1licGR6UHJLbnJHVjRUUE84ODdMUlhTVWNFNXZZQ0VMSHFw?=
 =?utf-8?B?WHgvYlFuWjkwbStYQ1FsdHloUGQ4OHNIUVRpVVJ6T2U5SkR1Umx4ZHVJUUhN?=
 =?utf-8?B?dVU3OW1GV0pKWGdub1c0VnBCYy9INDRHM1BPak9LS0k1K25kUFh4S1o2L3ZV?=
 =?utf-8?B?QXVKNndMdFIzN291TFlqdUlkbTJncnEzdEdpUW84K2M1cUtHSE9aaTY2azZi?=
 =?utf-8?B?ZitxWTZtd1BSbUR2ZVh0UnpqUUhITGdTcEtXQVpTR2MwVGhhN2tkUWZZMUI5?=
 =?utf-8?B?cytRc29MNlc5Q1VSYi9md1VYKzZYRXZnN3gyWDhCbzhxZGlzdnNlQWhyQVlV?=
 =?utf-8?B?STUxUWhyTWllRTUyTm53ditOT2hQUjRFWnVxNGJ5QzZ6L0FWTHM4NDZWS2NH?=
 =?utf-8?B?VUlDTVVTRTJJcUU5N293Ky9nY1U0OXFDeExpQURPSVFxM0FmVzZPRER1OUpD?=
 =?utf-8?B?MTZOS092aWtTR09XZ0NyOXVDSEZldGpaTXJiSDNteEhJNHRoQXY5VUNhTFhE?=
 =?utf-8?B?dVVzZmVnSldndzNYWWFncjlXNnpQL1FaakFLT2NQWklYcjJUMWgrOERvK2pN?=
 =?utf-8?B?dFRvWm93WWlEbWc1T1A0VnZVNmwzN3RKNmNHTXdPOVFXek41N3hGVXd5OWgw?=
 =?utf-8?B?Wi9BSG93NUtqTFk2aUNoenNEbkpUSTJ1K2k0V01PUUJxdGNYOEtXWGk5N3R4?=
 =?utf-8?B?M1FVQ1RBd2xZZTVRcTlJTnFTcHVMLzYrcXZFUTVhdm5UOTk5dHgyMTArbHRN?=
 =?utf-8?Q?8ZBeKkAfgsjBlHHsIS9YBYmsD6L/5h3V2bbLOHu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0f2065-426c-481d-c71a-08d8ee2d7225
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 18:57:02.9759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlJggOOQZHv3FaL6aaQ/45I601wt9uAsWDsfeq7KG/cuanV+t+5tPnlsE5iP6bL8SF7yjO8fqq6WGRPVW4V5fdYkXSYbMGlksypdRcn0jfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.7.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

23.03.2021 21:54, Vladimir Sementsov-Ogievskiy wrote:
>> +class ReproducibleTestRunner(unittest.TextTestRunner):
>> +    def __init__(self, stream: Optional[io.TextIOBase] = None,
>> +                 resultclass: Type = ReproducibleTestResult, *args, **kwargs):
> 
> actually, neither stream nor resultclass arguments are used in the code, so it seems we don't need them?

Ah, we probably should support them to be prepared for the following patch.

-- 
Best regards,
Vladimir

