Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3FE6EC5BE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:56:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp6W-0001oU-FY; Mon, 24 Apr 2023 01:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>) id 1pqp6R-0001Nl-PT
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:51:08 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>) id 1pqp6K-0007ID-Oa
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682315461; x=1713851461;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=mEVvWWfwTk2YAYoIxzyi4GigJieI6h5ks8gVOMOwCKw=;
 b=d9fXSw9T7AOp9lqnaZ0uVjQNBf7tv9Gpz8FztTJ1Jz2g3UERM/09Albv
 mjlfBItz5WBA4hJQ0aBmKTb8DAlsfF2sCAkT5Pm5B51E6aNojw43uZJTD
 39sqd3OK4Xa8+pg4F6zXzLnA6iE5CAaJtgpgCy6Tr68mVlAaSmluoxmil
 csUui3bHAvc4wOQxvvklcUTiPZEavdJ0VngJ2TuB2Zwm/9CTBxBl7qeEP
 ro2XXDgdrlwk7s82nucnnx/RvWqTnPhHIRC2UPT8WekNt4s8wb6NCknsG
 9E+Ar6e1R6X6lOSCaxGwtWUQixQQsWLgbXF1J9uKR4dIMeFAO3+TZt0IT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="346389365"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
 d="scan'208,217";a="346389365"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2023 22:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="670380965"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
 d="scan'208,217";a="670380965"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 23 Apr 2023 22:50:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 22:50:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 22:50:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 23 Apr 2023 22:50:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 23 Apr 2023 22:50:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFY4Imo0Uzkub5kFi01AVGbT24iwfZtGEPkgPL+Sb9Ubx7bw8DVMsJebx4xxZHk5bPucGRNbRtXjjqpnA9D09nHoeXDnK3RLBbtwobTOk+fzmHrHCR8jA9nN+ZgUOq6zl9Rjm0tpd/8AAiT38M1mOilxW5FB7wpOKNRH1s5MiNzYxI1wF896JrCtDm9AgwbUz2EPafq3AqGG8K+ixz0/zRYPZLCf5ow3KkTcjje1lieoGKSJNU8CSqEerxnGrBv1obQ9/MiUvZpk0b14QXwNqb9FqvVXV/fbSV15oMuqhiiz9OAQnG0cOe3CPrebK/h5wrZ9Z1bIqsxFzRbovpXkqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/M9cKNEwNfG300YEAhQpi3yj7iCtqIgQ30g7j4fV3o=;
 b=m7H+6EsEPfxz8yn9hcIiwBgSPsDaLX2uXWT7YbOo9icTqf/TlL4wNgIYt8Dn/roLnk8LdDBxHNDIJK9C57TnPnESJPWNdNAWImbRdwruCEbHxuwuaFMVNPPrY3hyx09o3kS00TjQCMVDLkivbGtRbdcoPV2yvImqTbyrkw7cQk+gYPq/kaZFInHXRLWlTF7yIXXdEMfItEuJxH6E9jwBMbomyQsLpMqWh2MCJNVyya2i+POF1IKrxhNwfIG5TJrJuN8vpXBKdfu9+sGhaI1ljId3xF9IhrV3q4qery1U3jmi3/U+N30mZxRKssSe31EnakAbUldeJ8pyUTDDAYlO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3861.namprd11.prod.outlook.com (2603:10b6:a03:18d::13)
 by BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 05:50:54 +0000
Received: from BY5PR11MB3861.namprd11.prod.outlook.com
 ([fe80::e047:d647:7996:4c7a]) by BY5PR11MB3861.namprd11.prod.outlook.com
 ([fe80::e047:d647:7996:4c7a%4]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 05:50:53 +0000
Content-Type: multipart/alternative;
 boundary="------------y1BXCWh90zfdisZGLCmIhoth"
Message-ID: <32d27df9-ed1d-b4d2-cc22-e9fce07823b9@intel.com>
Date: Mon, 24 Apr 2023 13:50:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/riscv/virt: Add a second UART for secure world
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, <qemu-devel@nongnu.org>
References: <20230424010132.3334748-1-yong.li@intel.com>
 <2aad730d-b14e-80c6-4aa8-71eb652cb803@linux.alibaba.com>
Content-Language: en-US
From: "Li, Yong" <yong.li@intel.com>
In-Reply-To: <2aad730d-b14e-80c6-4aa8-71eb652cb803@linux.alibaba.com>
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To BY5PR11MB3861.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3861:EE_|BN9PR11MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df46894-9d13-41d3-2be2-08db4487ddb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sTWE3irv6/XfdOweOa8uZA1FNXf61qT9z6HHTZtFaw9C0LvYYGiTvOcYzh05xZjCD6z/CvqkfecRkJMwRmsyONa2+qZ2e44jRgz2LpU2n6H27BQElRn42+Xg6sT0LSEhgjN8htaXq4lyiLusqTOYjNK3clYewoKLMSJyguhCSI68vgQtLsWHpqDahViAvwagLF8RY1RM1YfWNbpHTq4ZkqwCpIz8aYLrpwDAjnTSFMGiivR4OTmzh/bCUX1iPEKKqHdvfpfqbT6us40HX5cFEXTYJK2H4owrOpS9bSnzeYTsvgK0IZBZeo065lz740WqhX1t7INIJ66UhFUMgcDCPh0nyXScnwnMnkDaWWe0H14d/PkOOX9YSxxXd883UwnFr4jGwwPL0v6SOgYSjYqmb2k/9Sw7CFpjctxnIkCISp0gf0+a+mRkuowsEQWW8E+WKxo2QPNfyooeYL59KeLSuLQkajAz2ccgPh1LGKoFwm8zBfx8dc036g9s6q3HW/aHIwAFZuFZ9k12n5hEXL5oXIYLzGuwfxm/tbXBdGF9C6QkfTg4Lhdj4kuf2g876ppOhjbUjHqScbyb8f0Zs/MxSAqtlFRejYmM4t+YjaAICcuR1GZnwP3wTfrV1UFAs4NQXwIdczoqgaYopDwCzav2ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(316002)(8676002)(8936002)(5660300002)(41300700001)(36756003)(31696002)(86362001)(6512007)(26005)(186003)(53546011)(38100700002)(478600001)(33964004)(6486002)(6666004)(31686004)(2616005)(6506007)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekdkaDFoL0dYMFlsK29NS0xrWk9DcHFzeUdia1pSOW9NZThpUlcvcXc0Vkw4?=
 =?utf-8?B?SGwxdWh1Rk4yaDM1dkFEbUc0akRHMWhMYkFBc1RZZzlzMXhSN0V6QzZhOUVv?=
 =?utf-8?B?S0ROL1ltSHVDM1A3NkRDYmNub0dlSVZmeVZxTk5KNS94d0JJbWh0RzdhU3FE?=
 =?utf-8?B?alFUZS9RdWY5SHVJbWhnMG5RdG5FbW1XbXMwWE1VQkZOVVdVQVRNU3NNTU5p?=
 =?utf-8?B?TXQwNVd5NUtIUXUyOHRhQjRHSDN0OVo5QzB5Mnc1b1N1d0RuMXd4MEpCT3E4?=
 =?utf-8?B?d29OQkVHOGRyZ2NFYktGd3h3eDNQZEpMMjU0cjZBMDhpcGJnNUhtR2orTVhy?=
 =?utf-8?B?K2luVTduNi9IWWNjT1JuK2NmL1pQeHNDc2dwbEtBajJOOEJqT2FLZTE1VFMz?=
 =?utf-8?B?dzBsTUtNVzlmSGJEb1Fub0J3b0hPWmQvTGE5VmE4YVJaNTVxTjhRckIxZ0pQ?=
 =?utf-8?B?eE1JMHBKL2c4cFF0UnZMOFZMQ3VlN1NDSkVUb2VhdzBvakFqT3lzRVhmN3ow?=
 =?utf-8?B?YmFMT2lYL3FueUdyV2tWSnYyaTMyd0I3aHZJQkQrSUFGT0JWMXEwa1Fmaytk?=
 =?utf-8?B?dTJxamFlSUsycEZ4bU1jV3M0L1RZczlMSEwzbXdTSDhxWGI5VWRsNjJNYzMv?=
 =?utf-8?B?ZmFRWUxXYWE4Umx5WFNFZFJxa004SUZGQ2g4cXRIUGsrWk1UMFhGQUptT1Fj?=
 =?utf-8?B?TDVzR1J0UFp3amFSWHRoNDcvSWZtS2J3ZU9LWVdPWUZDdGZJUzdkbkFtMHRw?=
 =?utf-8?B?S0paUG5EN2NNNk4wd1d0TjdXV2hkblc5SGUxY1U0SUlYaXRqNU15dFhpS2JJ?=
 =?utf-8?B?bmVaS01LdTJsc09lK2dmdlFtem5jMkx4U3hiL21KcGpINjNNeHlSY2tHQlBV?=
 =?utf-8?B?eUlGLzhFMEhyMHBNZWQyTm1ocGZpZlhBWUhueE5wLzJCU1g2SDYvUG9LUkc0?=
 =?utf-8?B?cEYrMTlmdDJFTUVQb0V3TjM1ZlBVczloZUdIdittc0NwY1poZnRBY0tsbWlu?=
 =?utf-8?B?amk4a2k1bFd0djNRN2h3MElndnV0NnQ1MmFZOThENlYwV21pcWFORVpjK08v?=
 =?utf-8?B?aDlFSFJWbUNYaTlZcmlHbXFObWlLTlNIUGdHWXJJcmdZV0dGWWI2SWwrQzhk?=
 =?utf-8?B?UmVJc0JkUjJJVWlHa3VLZUZ1TFZqaHNJTGIvZnZWUGVxSjM0UVhyYTd5cHVj?=
 =?utf-8?B?bWl6Z2lrQzJvTW9CQlFpckxCRkVIV3dFR2Z2dGxHQno5V0RNb2ZrZ1VxYnJ2?=
 =?utf-8?B?eVhlcmZ3WFBzdE4yWUxXQmRpMXc2S1QxTEdLZDNGeHBkYmw2WTliOHMxOFUy?=
 =?utf-8?B?SCtDcnEvSnRZbmE3Vkw1N0oxM203VVZSU0JHWUVqQmJRQXdhRDJCTklHZFVh?=
 =?utf-8?B?dTRsc0NPSGpBamtkcFFrVVQ5MjZ0bnNpRlFwWU9wWFVqUisxTXA4UG5pWm1B?=
 =?utf-8?B?eERTb1REV25lRXIwMWF4dzRZT1V5b1pXNFZ4TmRCOGM1L2UyM3JKcWVMUkpL?=
 =?utf-8?B?ZnB0a0I4R1pLWWY2LzNzemVzbkpuNkMrRHNmNFVtNDFPc0pEckVaN1l2UFBy?=
 =?utf-8?B?RjlUVzdleVd0dWc5M2c1VGxhSFRsNnNQTDBPUS9kTEFteVVhL0RoYkNVYk11?=
 =?utf-8?B?WGxQUSttckZ1cVdxdjhhWG1mWVNZNkprTGJSTDNDbjlrY1c2ZStnZVhURjI5?=
 =?utf-8?B?emhRWmh0ZXJIY1huVU5RSTJ4d1hMUWlyaVh4ZTRVOGRJVG1CRmlLL1Bta0g4?=
 =?utf-8?B?cnIrMCtkS3BJZkxmekt6L2s3QzMyVVJodGVmbWgxM28zdVZoa2NnTURwb1RU?=
 =?utf-8?B?WjlOMjlCb01CcFhwMFlpcXFncVJ5Nzlib0tIRG1Ua05UdzMySC9UVTBjSzU3?=
 =?utf-8?B?Y3NpUjlBbmswakUwQ2F2cXF1eTR0Y3ZUSG9Eb01aVkZwTXlkRFFiRDN6YlFm?=
 =?utf-8?B?Q3FIci9YUmQzOFhPUVhOUVV6RzI4Y0pUVElMenJwSUEwRXdQTHIyc1RoWmUz?=
 =?utf-8?B?VXRtQkYyS3c5R2ZxTjhEUTFnVllmWm1IS2E2SWtWdmlhbVBiUi9pMTJNbEVS?=
 =?utf-8?B?RG5mWjV2TkpvVVUzWGZhZDBkQmtsMFlTZE9lQnlFdms2UUIvNjFzbVRMZEFa?=
 =?utf-8?Q?qfSoQ6UjemGnpEB2k18fClsbR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df46894-9d13-41d3-2be2-08db4487ddb5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 05:50:53.7307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NIBVLk830/mPMJN0pa1m6fAv4ywyjHpzLC5Pt6s789aJY5YLI/ptIPVDW5xtPen6MkwQJJsduoLPpXFKDx8jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5258
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yong.li@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--------------y1BXCWh90zfdisZGLCmIhoth
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/4/24 10:42, LIU Zhiwei wrote:
>
>
> On 2023/4/24 9:01, Yong Li wrote:
>> The virt machine can have two UARTs and the second UART
>> can be used when host secure-mode support is enabled.
>>
>> Signed-off-by: Yong Li<yong.li@intel.com>
>> Cc: "Zhiwei Liu"<zhiwei_liu@linux.alibaba.com>
>
> Should  cc other Maintainers and Reviewers. Get the list by running 
> the script
>
> ./scripts/get_maintainer.pl yours.patch
>
Sure,

>> ---
>>   hw/riscv/virt.c         | 4 ++++
>>   include/hw/riscv/virt.h | 2 ++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index b38b41e685..02475e1678 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] = {
>>       [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
>>       [VIRT_UART0] =        { 0x10000000,         0x100 },
>>       [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
>> +    [VIRT_UART1] =        { 0x10002000,         0x100 },
>
> Can we move it a position adjacent to the VIRT_UART0, such as 0x10000100?
>
> Otherwise,
>
This probably cause back compatible issue to the firmware or other code 
who use VIRT_VIRTIO.

Actually, similar code in hw/arm/sbsa-ref.c,  the UART devices' address 
are also not continuously.

It should not be a problem. Thanks!


> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Zhiwei
>
>>       [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
>>       [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
>>       [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
>> @@ -1508,6 +1509,9 @@ static void virt_machine_init(MachineState *machine)
>>       serial_mm_init(system_memory, memmap[VIRT_UART0].base,
>>           0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
>>           serial_hd(0), DEVICE_LITTLE_ENDIAN);
>> +    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
>> +        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
>> +        serial_hd(1), DEVICE_LITTLE_ENDIAN);
>>   
>>       sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
>>           qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
>> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
>> index e5c474b26e..8d2f8f225d 100644
>> --- a/include/hw/riscv/virt.h
>> +++ b/include/hw/riscv/virt.h
>> @@ -74,6 +74,7 @@ enum {
>>       VIRT_APLIC_S,
>>       VIRT_UART0,
>>       VIRT_VIRTIO,
>> +    VIRT_UART1,
>>       VIRT_FW_CFG,
>>       VIRT_IMSIC_M,
>>       VIRT_IMSIC_S,
>> @@ -88,6 +89,7 @@ enum {
>>   enum {
>>       UART0_IRQ = 10,
>>       RTC_IRQ = 11,
>> +    UART1_IRQ = 12,
>>       VIRTIO_IRQ = 1, /* 1 to 8 */
>>       VIRTIO_COUNT = 8,
>>       PCIE_IRQ = 0x20, /* 32 to 35 */
--------------y1BXCWh90zfdisZGLCmIhoth
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/4/24 10:42, LIU Zhiwei wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2aad730d-b14e-80c6-4aa8-71eb652cb803@linux.alibaba.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2023/4/24 9:01, Yong Li wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20230424010132.3334748-1-yong.li@intel.com">
        <pre class="moz-quote-pre" wrap="">The virt machine can have two UARTs and the second UART
can be used when host secure-mode support is enabled.

Signed-off-by: Yong Li <a class="moz-txt-link-rfc2396E" href="mailto:yong.li@intel.com" moz-do-not-send="true">&lt;yong.li@intel.com&gt;</a>
Cc: &quot;Zhiwei Liu&quot; <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@linux.alibaba.com" moz-do-not-send="true">&lt;zhiwei_liu@linux.alibaba.com&gt;</a></pre>
      </blockquote>
      <p>Should&nbsp; cc other Maintainers and Reviewers. Get the list by
        running the script</p>
      <p>./scripts/get_maintainer.pl yours.patch<br>
      </p>
    </blockquote>
    <p>Sure,<br>
    </p>
    <blockquote type="cite" cite="mid:2aad730d-b14e-80c6-4aa8-71eb652cb803@linux.alibaba.com">
      <p> </p>
      <blockquote type="cite" cite="mid:20230424010132.3334748-1-yong.li@intel.com">
        <pre class="moz-quote-pre" wrap="">---
 hw/riscv/virt.c         | 4 ++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b38b41e685..02475e1678 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
     [VIRT_UART0] =        { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
+    [VIRT_UART1] =        { 0x10002000,         0x100 },</pre>
      </blockquote>
      <p>Can we move it a position adjacent to the VIRT_UART0, such as
        0x10000100<span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">?
</span></p>
      <p>Otherwise,</p>
    </blockquote>
    <p>This probably cause back compatible issue to the firmware or
      other code who use VIRT_VIRTIO.</p>
    <p>Actually, similar code in hw/arm/sbsa-ref.c,&nbsp; the UART devices'
      address are also not continuously.</p>
    <p>It should not be a problem. Thanks!<br>
    </p>
    <br>
    <blockquote type="cite" cite="mid:2aad730d-b14e-80c6-4aa8-71eb652cb803@linux.alibaba.com">
      <p>Reviewed-by: LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@linux.alibaba.com" moz-do-not-send="true">&lt;zhiwei_liu@linux.alibaba.com&gt;</a></p>
      <p>Zhiwei</p>
      <p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span></p>
      <p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span></p>
      <blockquote type="cite" cite="mid:20230424010132.3334748-1-yong.li@intel.com">
        <pre class="moz-quote-pre" wrap="">     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
@@ -1508,6 +1509,9 @@ static void virt_machine_init(MachineState *machine)
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
+        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
+        serial_hd(1), DEVICE_LITTLE_ENDIAN);
 
     sysbus_create_simple(&quot;goldfish_rtc&quot;, memmap[VIRT_RTC].base,
         qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e5c474b26e..8d2f8f225d 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -74,6 +74,7 @@ enum {
     VIRT_APLIC_S,
     VIRT_UART0,
     VIRT_VIRTIO,
+    VIRT_UART1,
     VIRT_FW_CFG,
     VIRT_IMSIC_M,
     VIRT_IMSIC_S,
@@ -88,6 +89,7 @@ enum {
 enum {
     UART0_IRQ = 10,
     RTC_IRQ = 11,
+    UART1_IRQ = 12,
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------y1BXCWh90zfdisZGLCmIhoth--

