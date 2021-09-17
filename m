Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9F40FF06
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 20:08:15 +0200 (CEST)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRIHW-0002Zw-9d
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 14:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mRIGB-0000nA-23; Fri, 17 Sep 2021 14:06:51 -0400
Received: from mail-am6eur05on2110.outbound.protection.outlook.com
 ([40.107.22.110]:21822 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mRIG8-0004Ha-0a; Fri, 17 Sep 2021 14:06:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWMcv0ETRXmu/vc6HGp33z22oleSMUtxp8+9oOTz0rBI1jT+eXkVBoSpJ8pft02iC+kelykS7ygaUTOtZyfj9MjdaWJs1KFakOfQYvGrSgpTDkweUTdjqfixY+5RtTUGsglnURSh/tAD0iUIRJhOLqty221kIqf7WWMdHL6kvz4dzQfzy6cuxgx3dZWWazwGD9Gzr5TLMa/BsVMhkxQXBw79oOvdQdCpP4T9GhWKaX4M3Ve7rbnMxCGx+MWzlEiAH0pdxLEaXl84vapETkY/moq7UjWvt4ws7uQxq1G90QJHebQg3OnN38PYQomFjJI9U/dKdI1jZZ+AAa09QDVVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=kL8Q7EWAki/c1beuqTs3WMcn7vdp928MsmhRxNFphAI=;
 b=BaNmBGcd2qEN2R1s1oDfscYmwY/uHymJ0PD2wToVXS57mrBHNaoKOlpBdl0Y8H6YeWyIaOjp4TtlfxD+lh8uuXr7oHN1ml1dmjWkyjs34Kq4n0h3yDe2Z9ucwH8n/qkut7g+idW+m80A+94W9A85LySjaje2ymklxDbzTU8KcvcEMPXWsrlD6wC/T726LBHTWYBMqu9l46YkXniawD0c0aFCS+GXh8HXiDWipcqzi+VnueIElgn8MOQCzB/O4YtPUOP68Cljr1PsuXnXnLzV4abVpHu4P5FBKnPabL+E+Az+29JQRmJufl5R8QFiuAVlU9558XYb5+A3cUbXwl/61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL8Q7EWAki/c1beuqTs3WMcn7vdp928MsmhRxNFphAI=;
 b=WYKgBCnlWdOy+LplifwoXH9YKyCAV/YpvRVDQEQSjQyXPIsZbGbl2Xt6UZmhHasoqqQAA6gmOAhgiF89XbQo4405mSrxwUCxUoI6Z9LMUS+ItBvt/KFX6B6+lhu3evDswTBpw1qj7GN107vjR516cERfYa4gdcM3yUA1XRuLC8Y=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB4334.eurprd08.prod.outlook.com (2603:10a6:803:f1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 18:06:42 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%4]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 18:06:39 +0000
Subject: Re: [PATCH v3 00/17] iotests: support zstd
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, jsnow@redhat.com
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
 <2e923c5b-0bfa-6870-be68-cd1ccb7b125d@redhat.com>
 <6de70a00-ff7a-9155-ff97-3e28df4c9059@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bfa6945a-a90f-9ec6-72f7-ad8402d606ff@virtuozzo.com>
Date: Fri, 17 Sep 2021 21:06:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6de70a00-ff7a-9155-ff97-3e28df4c9059@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.205) by
 FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Fri, 17 Sep 2021 18:06:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 622495d6-7d1d-453f-3b2f-08d97a05e1de
X-MS-TrafficTypeDiagnostic: VI1PR08MB4334:
X-Microsoft-Antispam-PRVS: <VI1PR08MB43347579BEB7AC78B779C9B0C1DD9@VI1PR08MB4334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWcTGc62E3M324jGoupmZ9GBgJ3d1zgRH8gEuweZxlBALMlxC9h2lO80zUlwIRxo8FYM2QzKKZ3p+Mm25L0fsm0siip2qHMQuuQNEPsebLc/qVOCmdlBcSzonPfAuFCMNddofJEi1l6BuwX4fVptst4pWG6D9kDDcfwS+CO6uh+2kM3P5YF4zyftHMX1D2c7HexCxpgdT/3QvoSIgpVRAp7Z9/NzPpllUwUTpAd/di/EAexmMJAqQacUDOadFptR7DXm+M9pAUk59XP8aO/UAlLMCSzcpHXKE+th089FalmF11XWx3WLJxncvb2oigra3WsB+ZYYbDIA/QNfmAFt1i3lub4fQNg0DOAIk1j9VVh08RPoFMaluPtyIIZ8lFVyt0GGxKW+U3lvEB8RVk6nUxaV8o2ijEVEryL5WsCAuANir8Nvm9OFHyIIYgg0wOBxgXb25C4xwV4tvDSYr2LkQU7cAGbiKPCBM7QXMR7NzkO0R7oHag/CN/BZgBI0WYh4m1DpSR8ugtx+UyDNLcKQ+3J5nnOJe4cbaemLdY8+4r0rom9okab8BJ5crvgmkFnlSKP5pA+1ClSD35jHuuNnDRpz20qlX1N2JlXvcr2AQ18hUIUnyqGaoHcnXT4uoMx+OFZA/rmnxbW0GBAeEQrhcv213Z0x7wWEIm2kUnlSYEq/2LeAYjhpKWgAbHoXJ8nw93OxlqovwdmUP09h44f4i5qvq6zXlvsSDcipIcvxarK6U4wp5hqTNnFC6O3Cuab8kJ5MN9K9s22AH+XwWds6/KrDNMaql/n74IGsdoB11NmHp72pKxgh9AsfdWjZlvLyQyKURCddNEgdUrWI9v+kps/f6L4VvDOR//JTGKzlvoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(366004)(136003)(8676002)(2616005)(86362001)(4326008)(83380400001)(8936002)(26005)(956004)(31696002)(66556008)(186003)(966005)(38100700002)(38350700002)(6486002)(52116002)(36756003)(478600001)(5660300002)(31686004)(16576012)(2906002)(53546011)(316002)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEsyUXh3a3g2NXgxOW9RZTlUTmN5L2F0TEtJL0paTEF6TUxSZWZtK1hZOXRk?=
 =?utf-8?B?YzdUYXhaRUpBbTBxVkhPazNtYlV3MG1GTm5tb3dIeVd2b1lrMndjdlFGVTgy?=
 =?utf-8?B?d1M5cTFjQTFPbHIvVnM1WkN2S2Y0dHhCNGZ1N01JQkQ5U0MwMEc4ZXlZdEpE?=
 =?utf-8?B?ZlRST2w1eDM1QkErKytCZ1hoTWxXN1FIb3pndWZZcGpzc3REYS9ndHR4aTJj?=
 =?utf-8?B?Unk1ZlcxYTVSZDBOTUdtcm5JdmJXRmxZckUrZFhaQXRkRVlMVVZNaU1tanZT?=
 =?utf-8?B?ckNXQ3FJN2dBMzJGVWNkQ2dCZUIvc3UrZVJ2bEowMDlOYWJoaFNsRmFRUGJT?=
 =?utf-8?B?ZEhRR3NDWVl5UENLM0VQTkdoV1h2Zm80a0Fneks4NE9YOWVSTWlEVHlzMmpZ?=
 =?utf-8?B?bEZyaTFDQklBTFJWWjA5Vit6bFFrWkhPalIyNjRzZlRQY3Zlbi9ZVXJDYW4x?=
 =?utf-8?B?bFBtQjBKNklJemw2UDNrRFFUeDdRNUt2SmxsTEhPSTdyUnlJbGRuVW5GVi84?=
 =?utf-8?B?UEpPZEVFZUJ1SjNqYytiRXU2MS9PRENwdUNyQUtXYlVPWlVtNXIxUTlMeEwx?=
 =?utf-8?B?Sk1BMW1YRnc2UEFmbFlVVUZkVXRmcXRkZk9ocG50L1ZkVy9yY0NjMXFocjNp?=
 =?utf-8?B?SVJ1S0c4L1pSSkpScnNjUEFtZE1NZ1loMlJpR0lpdUtvc2J6ZVp4bWlZS2tZ?=
 =?utf-8?B?QlA5QkFPZ00raDhBRitVZjhBZHEwK05XY1B3UFlhb09rcHlPY1d3dGF2clMv?=
 =?utf-8?B?bEx5S3VwUUFlZDA1bHM4eWhXcUh2bnYyWmdaOXRjekZsSkdOeGErenRZS1Zt?=
 =?utf-8?B?SzBKMk9VT2hMa3lGeHR0MjRURFV0b3BhL25Ja3RTYlJPYWFlTXRtZ1dRR2Rv?=
 =?utf-8?B?WnBkVkFXYzdjWUVNb0xic3czbXBTbVBDblkrTTg5RWQrVnpKQitmQzh1UVBw?=
 =?utf-8?B?NlN1Yy9FanJXSHRLa2FLdUFHcWtjbC9rcWQ5d2RMZFNQMFZVd1N6a2xEVFpQ?=
 =?utf-8?B?MWpIdmpLUEZzVFFHck5oc0lEMGlhOTgyUGNnSWhzMk1sSDBIbGtTY0gzbVJt?=
 =?utf-8?B?d3lUWFdGZFIwTjdZTForM2V5YlJiaHg4dVA3MURFR3gva0lhVGZQYlE4VVdV?=
 =?utf-8?B?Qm40SkdxL1VDWE9iRkRGQi9BdlZLK29aVWpYbkVmdHJYdTV5QlJFdzd1c0dR?=
 =?utf-8?B?QU1Uak02OC9LOVBOMUdoYUk0M3RlWFBiQTVyVDBnWHBET1ZSM2EzVTZRMlFr?=
 =?utf-8?B?M2JkMyt0NUtVc1VxT29PUFBKUzg4WTdxamxtVVZtWnZ1ZHArbmxRb2I5Y2M1?=
 =?utf-8?B?MjgybVpUVkIvK2piZHoxOWc1NDRKVks4dWVIMlh4UzFCdHlBWGErMDU5UHhx?=
 =?utf-8?B?bjZVSEhyTDlaaCtTWGZVSFN4bHhVZFFZQk9MdDFubWVsZWFyYk1IVTlGNk1V?=
 =?utf-8?B?MElVRVVLcFVQcFp4Y3c1dUpDTkZIVEE0OGVhQjlrY2didnowaEpROWg0UEFr?=
 =?utf-8?B?VFFYaUdTblE3cThubU9WSHdKcjZqcWZHNVJUN211U204SXQyNmtzRnlpZ1VU?=
 =?utf-8?B?UFJEeVJQTUxMNWhtRlhwMis1MHVsOU9hcDY2TDhvSjZBck0yTTdPWFdtWWVE?=
 =?utf-8?B?SzRGVGoxSUpiVGVFY3NGSlVONGRMZzkyTThTNkFWZ1cvSFdmWTY4Yk5LYnN0?=
 =?utf-8?B?WkJaakVhbndzTTIwZkpXdWxtekxoWE9PendYT0VNS0xDNnV4SkNVV01jQ0VV?=
 =?utf-8?Q?btJsNz5N62yZvod/BkaKWElzBjX8YnQBV/ykqha?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622495d6-7d1d-453f-3b2f-08d97a05e1de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 18:06:38.8884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isru8J0CBICbFSnSN5Mr6Y25IyeTldXjMmB/3jaqGhCI8C3MmJxBP0Ww6ZDDaaS6meS8w+LoPhk0n/NYIS/0wfPfXkeOhAoDwzyjYGfYIXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4334
Received-SPF: pass client-ip=40.107.22.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.09.2021 17:49, Hanna Reitz wrote:
> On 15.09.21 16:45, Hanna Reitz wrote:
>> On 14.09.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
>>> These series makes tests pass with
>>>
>>>     IMGOPTS='compression_type=zstd'
>>>
>>> Also, python iotests start to support IMGOPTS (they didn't before).
>>
>> Unfortunately, the problem I have now is that it makes the tests fail with other IMGOPTS.
>>
>> My regular test set includes 'refcount_bits=1', 'compat=0.10', and 'data_file=$TEST_IMG.ext_data_file'.  These fail now, because the Python tests don’t have a way to specify which test options they don’t support (like _unsupported_imgopts).  Handling data_file of course is extra tricky because now every disk image consists of two files, and the qemu-img create invocation needs to expand '$TEST_IMG', like _make_test_img does (in the line where imgopts_expanded is set).
>>
>> I think we need an unsupported_imgopts parameter for Python tests, and it needs to be filled (perhaps https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg00082.html can serve as a starting point).  And for the time being, I think Python tests should be skipped altogether when IMGOPTS contains data_file.
> 
> (Perhaps I should explicitly say that this means I didn’t include this series in my pull request this week, because, well, my pre-pull tests were failing :/)

That was clean :) I'll resend

> 
> (Also wanted to let you know I’ll be on PTO the next two weeks, so I won’t be able to review a v4 or talk about how exactly we want to handle IMGOPTS other than compression_type until Oct 4.)
> 

-- 
Best regards,
Vladimir

