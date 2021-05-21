Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D338C779
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:08:20 +0200 (CEST)
Received: from localhost ([::1]:49362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4t1-0007mu-V7
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk4pC-0001fO-S8; Fri, 21 May 2021 09:04:23 -0400
Received: from mail-vi1eur05on2100.outbound.protection.outlook.com
 ([40.107.21.100]:41825 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk4p9-00015w-LZ; Fri, 21 May 2021 09:04:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5pcP0HjeoQwQCkkpb16LIMl8r5rqlH0rwPYHjm57fEO7QLAIN8nKltXvKMvnEnNSpNfePmifPH8CDhqndhSYcW67zxNeb0A8NoDBF8eBZU9+vMx2WTdpwG18yFywbx+LFSwV48zvDlUgDNwDK3gEdYrfuSHQqNI5sVRNX/kAsRiMrD+OBPHIBLGj+HQhfz3vIJi7U0AwuteBnnGj2NIjjwXgp8R7KV5+KVCLkVWcXpwzj98vFGxIIHwLaqmTrU+xxrXYwiqvZmO0zQZ7gSnevUV0tj1NSAE03Vyc4bQbMBGhIn4aw7id3v+SK3/K2tXYh2n7vlXouG9SL1E1NMjtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAqImBHCN8IcuQ2TojvtVC1+qvN/P3YyHvSryXn5RzE=;
 b=G0zEg+4hcYXKJ+AWyXTo6+b58AamMAuYsY3TIQj3bSOQkpApwE4iovyJEVG1tdXgDFDe+AOCLb9O2/UX7Z+/kSJsmstaK9vcgiAXmzJASNoow4dG1d06cz7kj0UOpiHzTdCdlBtIs0kVAAgKAU9LLBNMc1H0yH4wu64z4jl80Uz1QlJkGKsR9q9agrHY/I5N/bHIFrSYb6+LMq7JS5XCPHhnDMtN7iFzCFZDJXclc1brixg8fi6OX1wQndMXDMVAur/LQX09VL4So/FmfpfXEgxcdpSXgYiSMjQfrKTOMZ4lkqU9Hwb422YDDfmiY/LgmXVEcteiJIa4YdgDtU1oaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAqImBHCN8IcuQ2TojvtVC1+qvN/P3YyHvSryXn5RzE=;
 b=cEmKXrDKFRJ5G7/rRnpbwVxOq37ap/Hk2iacKjHOTYFVzC9wNDViS1KOWfG7pW40tBNYrBux6XLZk4fJhQ2pcyWt/Qxf2tlXAGHMYB7lyMdTDih7leqWvRxXtPUw5U5t4xsb4wsGmT0jtA1Ugu+hgQO4tx+vwrmHUKiqWZZw+BY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 13:04:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 13:04:16 +0000
Subject: Re: [PULL 0/9] scripts/simplebench patches
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
 <CAFEAcA86heLwb5Z5fYDM=NO_LXqJg-WwF7+WLTaZAzA_jF+pjA@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e3700fdf-101e-c4e1-e118-1836fdd01b16@virtuozzo.com>
Date: Fri, 21 May 2021 16:04:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <CAFEAcA86heLwb5Z5fYDM=NO_LXqJg-WwF7+WLTaZAzA_jF+pjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: PR0P264CA0234.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 PR0P264CA0234.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 13:04:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c94ac304-364c-48b7-c1e7-08d91c58efdd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6839FF4A564F77F038215E8AC1299@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZVzvsuZeGR8zgDOMHWgSfFrlFcTZ0E5ZNvcvfA1SigRK20oclv+8p0DAdaJi906G1cildPELVvaazD/VQmMtByMmHya87ZyFhW96MRCx5E8uWuqbztZpfGHkQ+jtjrRHRB6VEHIV2C/PNG2/ZJzfn05XWJMfN+LO1A6JE5bbLL1IZKnHDSLr0fwyfrFBrW0kA4DagWLMU2OmKuvv9PTaYnLrsOaa2NqYnd57BhYTZe7lkdSBkDg8yzhJyTQXRXTblKMMjwBpYivh7n4CW2tySrLUBNFGua7MSVGPxRxiFxVQ/9yTXBWrr3QyipiXZR3xeqeN10PUc+ryy/zCCdfuOCToFwaV9IygOO9g2S/JAg57lD6xucVMhoJWJ10Mlss4sxupgobvoReYKWrcSge/f8rx/I9w9LXVhj6t1/OnuH+FACsE23WuPuhTunChnHNb5RBQGKPqtbp7GcOkhLdZYyOph67n1J9gecT2cO6c+AmTB2WiT6N+4DOlKAaVbqbSN68m3yasIB6hgPEEAmfNnqJlMe61KA2Kawr2xjhFT3/MTIvp8R+tdVpYCFTGHJC4WSJMMtsfLMh2Xwr72O5c7SBwBIade8SNGKTmxk41Ytfv8lqxiw/qqwz2HYZ7VznTPXKkxPfLhGlRcAUYzfo6IVD62LyKKdrmYkOQlztGg3RCVX9rNT89uY22xv07m2vxTLqfva4skNHncoSm7RmT3TUDF537cevb5/RBBUnVRqM66cQDDuiS6MkH2C5idmbdlrgs/cYk/0O8/vdcwi7tCsBXmo8KlH/e8MwFIdZHrqJHGq9LgQjUNcus8ZEZzYvHwKxj93zNajmH6JbMMAETw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(36756003)(66946007)(86362001)(966005)(66476007)(5660300002)(31696002)(52116002)(8936002)(478600001)(66556008)(26005)(8676002)(31686004)(4326008)(316002)(2906002)(16526019)(16576012)(956004)(6916009)(6486002)(186003)(38350700002)(2616005)(54906003)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dGU1bVJMVkFUT3lKYlV0ekFBM0FwTFVFcTkwQ0Q4bDdISlgwejYwQWFFZUt4?=
 =?utf-8?B?cEdhSFdhZTRwSUlJeUVkcHZPTDBtVVpwUUsyZ2oyQWsrYlNqSHlqYU55Vyti?=
 =?utf-8?B?M1JOQlpxSEkydERNVVJCSzNKWk5vdjVVTmZRMkR1SmV0S3B1dUxuVFlycVhZ?=
 =?utf-8?B?MVJFaWdyZGtxYVVJY2hjRzJ6cis1bmJYZVhORU1IUFUxR1BMcmdqRWVyejdN?=
 =?utf-8?B?c1ZQY2tONmhpcXMxR0EwbHNEUGRSWG1nMFcyMUxVUVFQM0R0UktSOW5XL2Rx?=
 =?utf-8?B?bEMvWUdxUlVXL3dxTjBzOTJuNlZlTyt4Qy9OTEV3b01yeGx3ak91STZKQXVT?=
 =?utf-8?B?b0NSajA3TWpleVNobHIxTXpsM0xabm1oajM4dmZYNkVpZ1dYd2poZnh3T015?=
 =?utf-8?B?RXVoWXlELzRCcXkyVlhzVUNHSlVUdWcxb3RVQ1hLS2VhNUEya0dyUkxZMms4?=
 =?utf-8?B?d1V1U2VVNzBub0FhdjdMUmM0RjBRN1ljWGY3YzU4eGx2NlBBTXBOWnpCWm5x?=
 =?utf-8?B?T2tpd3dIYzJLTXVsVldSVkllZ2UzQ2xUUHU4aTEyVWhSaEtlSnl6Qmc0MUhx?=
 =?utf-8?B?S29kWlMvdWRHRWNxWTNRQ3BudkY0OFZWeVdiZmJsZVExaGJLaVlVVlBWeU5Y?=
 =?utf-8?B?Q0pBREVJZTY5U1VqMEpRaXZ6eC9oajVJeGxZTlZEVTJaREhXbC9aYVhiUXY0?=
 =?utf-8?B?K3doNG9CNGYvMnRkYmhjVVZia3EvMXVWcU5hRXJMWlBlRGhhNzIwT2I3aThp?=
 =?utf-8?B?TXNmZGx4S09aRDdrN3lCYVpPWVFjVys1WDVvS3ZwMExWV1dtOW5LQVQ4eDEw?=
 =?utf-8?B?Z0hxRzNQN2Jxb1lvK0tBa2tsRGMyTXFSRXI5THhMcllOa0FVV1gyZ3hhQ09M?=
 =?utf-8?B?b01iZ2hDZ3JhSHA5azNkRmFITEpRVVNPMTMxUTAvbFdnYWJKbGEvRXFsd3ls?=
 =?utf-8?B?RWxkNE9VN0ExWWRrTTZBSFV5NnpoZ0ltNGxIOE1SRC9MZDFqSUt5Q2FWeTRl?=
 =?utf-8?B?MWp0OG1qck9Uc3MzZFIyNVQ3TFJNR29zaXZKNXM0TzZ2SmlGUTdtdVdyNTI0?=
 =?utf-8?B?TENVSy9CbVYrbkh2U0JyQ2pjeE1QSU5nQ2trUVl6SlNHRkZqR0pTekRpSE9o?=
 =?utf-8?B?Z0NlZHBRWnR1ckg3VW1JazFmL25ScDk5bFRVa1BEc1ZZQ0Vlbmc3clhLZ24y?=
 =?utf-8?B?LzNKWHFMNTBFenhVM2ZxaGFQb20rblJRWG9leWd3dnFGSWlHSElUSG8zQ0ww?=
 =?utf-8?B?WWRYRWdIc0pCZXJDQUsvUFk3Q2p6L3RCakp3ODlMWC9NN1JydTBBbDBPcHZR?=
 =?utf-8?B?TFRWb1lmVS95VE9vREY4aytZZnIrMVN2dUdZQXhTSVk3RHk0Z0RqdmdORFhP?=
 =?utf-8?B?bk4ybTFzUXhxYnA0WHlxcnB3M2t4bGN4RURCRlpiMXN5K1RLZVU1S1BBcits?=
 =?utf-8?B?L3pLYWdFWllqaE5oY1h0WUVWcmZEd1o4bXVKT3lPR04rOU5Sc2F5VnI5MHBv?=
 =?utf-8?B?VkxrU1RkN1ZrejZ2OVpXZk13Y091ZmlVcG1zbCt0TGJvY0x4V3JRMmJtNHJl?=
 =?utf-8?B?WTUvaWl2cW45RDVsWHJxdzhtMG4wRGZOK1lETkJhMnFDSGU3N3BLWHE0MENV?=
 =?utf-8?B?L2xCLy9TaG5FZzlNRGU3ZjNLZXBhRGN1OWlLWDAzcHVwbVRLQVJJcmx2ai9Z?=
 =?utf-8?B?cmc0OHc5clN0cHhvc3RVZFBoVDZGdkRTc3Y4Vng3OWg0eDhsT0NMV0o4bHhG?=
 =?utf-8?Q?Lyyn1VfOBAPJScpPCIfn/07azkiVBtPdOwq4s60?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c94ac304-364c-48b7-c1e7-08d91c58efdd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 13:04:15.9460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1ebZYVs5g8Ml7TNze/gEG2nLr0rHd4CQop//qror+UdB0HacaCNs+AiX4A/t1wVMgQ8JIc/LGtcqP4Etztxza1zsEriL+jpMa/P8kzGFfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.21.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

21.05.2021 15:45, Peter Maydell wrote:
> On Tue, 4 May 2021 at 10:01, Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
>>
>> The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
>>
>>    Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-simplebench-2021-05-04
>>
>> for you to fetch changes up to e34bd02694026722410b80cee02ab7f33f893e9b:
>>
>>    MAINTAINERS: update Benchmark util: add git tree (2021-05-04 11:37:26 +0300)
>>
>> ----------------------------------------------------------------
>> scripts/simplebench improvements for 2021-05-04
>>
>> ----------------------------------------------------------------
>> Vladimir Sementsov-Ogievskiy (9):
>>        simplebench: bench_one(): add slow_limit argument
>>        simplebench: bench_one(): support count=1
>>        simplebench/bench-backup: add --compressed option
>>        simplebench/bench-backup: add target-cache argument
>>        simplebench/bench_block_job: handle error in BLOCK_JOB_COMPLETED
>>        simplebench/bench-backup: support qcow2 source files
>>        simplebench/bench-backup: add --count and --no-initial-run
>>        simplebench/bench-backup: add --drop-caches argument
>>        MAINTAINERS: update Benchmark util: add git tree
> 
> 
> 
> Applied, thanks.
> 

Thanks a lot for your time!

-- 
Best regards,
Vladimir

