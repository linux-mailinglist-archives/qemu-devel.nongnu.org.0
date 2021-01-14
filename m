Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B82F5B6E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 08:40:01 +0100 (CET)
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzxEe-0002y7-GH
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 02:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzxD9-0002S1-Kn; Thu, 14 Jan 2021 02:38:27 -0500
Received: from mail-eopbgr130095.outbound.protection.outlook.com
 ([40.107.13.95]:60835 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzxD4-0000Yb-RH; Thu, 14 Jan 2021 02:38:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ff6J7ONmo4bNGCl9InmR90Fm2VKwTLHK4yVAoondC31zDHJD99v+ieKhn8D+of1Si0Z2JfnfihZy7BE3FOcHHLE0b6pm9Bq9SUI0dTVAovI0YSbmJPMGbNKixsTwTpxI1pWxzE6X7TeAix7qJZnCcjdvkkOlHd2ySpcvLtcvRvjpZrIrqzsoXODqWnG+Rr0jYo68wQsDzqgdvbg904rPhf2zBk0VNXU9qPIYEAG74CptyyTR+gDLlH7l30S1fv+rPqeihbgpwbHAf3H9qsL6OS710+7CtCMiSdjcZ1VIFsbw34+ilEUguUR887JBUdPGhHe13nmgbOTJHRIxqEgYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp9r2USt0mJMhFusQa/f2HTfSyYPfvAdJofMvrGd0fc=;
 b=ISQ1ZjRLFNqMkGpaRCxO/Kch2+ZFqifj+xtI9Fare/E6/hQkinu0KVMrVSk3iSiBNFZzFNPTP1X8jUWaX7th39kYnJby++enybhP5NqtdCV91pUsn0WdEZHvRHjgcRCQcgWCy4k67EhrHJYjt2gKpp/VbaFYbj7tzptCqd/PujPCxnkvhVfg8QlDOwxQ0xuIZJUOF2aAVxanZjI0D2/7uyKr6BqjOeeoOtKYIBeFmVXpXkdRynRVu3n0nkjLo59s00YXnt8U3kGOsJVzBqvorlRO6yaSh9HZ/Ih8mI+vDyHg58bD7vkMeJjmorb4rJdk/EAobngNu/1MQhawbOd4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp9r2USt0mJMhFusQa/f2HTfSyYPfvAdJofMvrGd0fc=;
 b=npMjuW3p+c8oP0yPWGDmLXj9twvvj2IWDQbCTlMryN3Brt09U5fapBfJYRvct/Qc5Wm5t0d2RgEZMPJx445if/N1ZjIKphpnLkWwg5H+JrqIjFSjGP6q9xFZ9LitS1s9xmgi4szAdVBFtLrCLOquUI50Lvk1eZd9LvrMuCsNKSg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3094.eurprd08.prod.outlook.com (2603:10a6:209:48::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 07:38:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 07:38:19 +0000
Subject: Re: [PATCH v6 07/11] iotests: add findtests.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-8-vsementsov@virtuozzo.com>
 <20210112164211.GB6075@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4709b4e4-6fe6-86c1-ac7a-b3933b04dd30@virtuozzo.com>
Date: Thu, 14 Jan 2021 10:38:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210112164211.GB6075@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM9P192CA0017.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM9P192CA0017.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 07:38:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dc6c529-649e-423c-94f8-08d8b85f5d11
X-MS-TrafficTypeDiagnostic: AM6PR08MB3094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB30942DF1945397033A42D24DC1A80@AM6PR08MB3094.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eW1RMS8wbFLBiIICMmR9j/Cu//PCtXRPcqZFL6fNY8HaBbaq2vI+zyu4brsA51UkqyDVnLJcMIMyHnHxUOvQCbvXhyiuzWNvKsxSjBwNoDE0AdYmGZn3H7dJPv2NAofqW1xkQN08zHasTHW9e4OdAaWMjWIDu+9xM7pYl02ynojQ7w8SYgi/Z5u+64cq6w12DZ0/XyRqz8+rxip+rH1+NYZ4lGzhX938VG6hj7YxOff0dCoyHS9KfWDFz/1M6PzuusCS53qCZJPPrHLdf/gcn7i8vb+Wjh5ArL68dM2TpWL49ZQnepPO8vtIANYewZZy76V++vjntaLKt8LDFYA4IiCXoiQyfwTcDrrXTmAJTCPiejdXaMmj4IWzmJyn/aEY5eVbLR8/9KSQj4juXJIeFk1zhJbhp8lmHoUhjdR1p8nBSLG1k/8ydla+oLEGi/cxtQ5WBON1i8yt+tlzqVupXV4M7mZB5GtXWOVBLCBjgjM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39840400004)(346002)(8936002)(66476007)(2906002)(316002)(16576012)(2616005)(26005)(31696002)(8676002)(956004)(31686004)(66946007)(186003)(5660300002)(66556008)(86362001)(478600001)(83380400001)(6916009)(16526019)(36756003)(52116002)(4326008)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WG1WSGNEWUZ6dmxyQTZZbzd4MWNMWWFxLzAwWmc3S2ZHWjRRTlhWTlJrU09V?=
 =?utf-8?B?ZG1xbHJUYUkyOWREbVByampXRVM2Y0ZOUVQyNTRtdWExazlEcmxEdTdtc0Ex?=
 =?utf-8?B?WmVseGxqMWRlajdkRnJaeHdVSW93MzdYTHh3cXNNem0zaXVibnE4aU1qTUVJ?=
 =?utf-8?B?emdkMnRuU09BYm0wVVd3WGxyZmR6RVJ1L1grV01qQlpZOTg5ZGEwNFVEaEtu?=
 =?utf-8?B?VUFNemF2TTJwQ2MyUkpjZEk1MnJDWkJFK0ZEQ0NhdEp4RUJtSDBHcGFGcm1z?=
 =?utf-8?B?WlFWd0NHclM4ZnJQQnBVT0YxaXpGRWloSWxYbWhqS0NXajhYUVRIYVlKamZO?=
 =?utf-8?B?OHR3dzV6a1AzVE9MNHh1NnVwZ0hvTXQrYWRFa3diL3JuSVNaV1plTzBEYm1E?=
 =?utf-8?B?RGZKRFFiY1JkZHFQVlF3MjJVTm1DcWhrTWtLa1BlQ3FIRmY2cDhnZDIrbzR1?=
 =?utf-8?B?aUdGWEM2SGlYZXplejhvQ0EwcjlOQkhRQnpNbHcyRHlsUkEzc0RDQ1drNkdx?=
 =?utf-8?B?MUJ2clBaUHFwWWhZRjVIMlRLSGFRN2dkQTVjK1MzTmJKWGRycnZVVzR6ZWFR?=
 =?utf-8?B?cGh5ak9zaTJObWxWN3JuNUJXMXlPSUxhbEJMOHArT3crT2N6Y3BISEhWREFM?=
 =?utf-8?B?UDBNci9IQk5TaDlQRDM3N3dtZ1dnR0M5N240M29sQ1BjSWQ5blkvSUs1QlpL?=
 =?utf-8?B?ZjNFYWpwRmpTU01kckptNUN5ZVREZ2phZU5FOW9SWEpnVkFFRDBTUnBVYVgr?=
 =?utf-8?B?L3NmZkhMT1dtOWd2WHBjd0c1ZWZWSjA4aTRzTU9NaGpNRWw2T1lBQUhiaG1X?=
 =?utf-8?B?d01xV0lpZ0hocEN5aEgyZUJqOCtEYnZiN0IvQ0RXQjJXMzE5OEFxbUNQb0tq?=
 =?utf-8?B?QnRVcG1jdmVrNzZld0I5ZE1lNTk4NWJYNUY4eXZ4VlAwbzV2WnVMbDg3a2do?=
 =?utf-8?B?N2huelNSL0hTcjVCdGthNjYrOXB0Wk9LTFNndytQTVVLaDJzaExHSUhsTERL?=
 =?utf-8?B?N1E5bXJJS2pnUnRFbWt0VnVjSXVZYUw5U2VnQTFHcHJNdWJJeDZ1ejhZR1BX?=
 =?utf-8?B?TzBwazB1OFhQZTB3TThnekRacmp3VnNVM0FWZGVucURDTzFicDQrNzAySzdV?=
 =?utf-8?B?SHZNUE83TFo2alpiL0hxK2hoak55R2tRNUxSajZ0bzc0K1h4TjUwbUlUV2Zr?=
 =?utf-8?B?R0xiZ3NjY2gyOXJOM20xZDBrUTJJUS93NXV1bUxBOWd2bWR6aWQvQWgwYks1?=
 =?utf-8?B?TGVPMi9VU3UxcVVtM29kVm94R1ZpNjljTGREZHJXeE9hcDI4YTk4cEZmRW4x?=
 =?utf-8?Q?iKVuOoS2woqCuh7AcIIzwumHBQpzqhYz5+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 07:38:19.5369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc6c529-649e-423c-94f8-08d8b85f5d11
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXUXj1X1z96nTYTigyElgPxqHbent/yRQgus3FD9bwMoumHHSYtJA+VSlawPcV3D1hq4j/krm+kPxJdb1YegMdSvraoD9KlT//slXFP/+50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3094
Received-SPF: pass client-ip=40.107.13.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 19:42, Kevin Wolf wrote:
>> +    def find_tests(self, groups: Optional[List[str]] = None,
>> +                   exclude_groups: Optional[List[str]] = None,
>> +                   tests: Optional[List[str]] = None,
> group and tests seem to be read-only, so this can be simplified to
> 'groups: Sequence[str] = ()' etc. without the explicit handling of None
> below.

None comes when cmdline argument is not set, will sequence as you propose I get

Traceback (most recent call last):
   File "/work/src/qemu/up-refactor-iotests/build/tests/qemu-iotests/./check", line 37, in <module>
     tests, remaining_argv = find_tests(env.remaining_argv,
   File "/work/src/qemu/up-refactor-iotests/tests/qemu-iotests/findtests.py", line 208, in find_tests
     return tf.find_tests_argv(argv)
   File "/work/src/qemu/up-refactor-iotests/tests/qemu-iotests/findtests.py", line 193, in find_tests_argv
     return self.find_tests(**vars(args)), remaining
   File "/work/src/qemu/up-refactor-iotests/tests/qemu-iotests/findtests.py", line 165, in find_tests
     if 'disabled' not in groups and 'disabled' not in exclude_groups:
TypeError: argument of type 'NoneType' is not iterable

So, seems simpler to keep all as is than modifying find_tests_argv to not pass None arguments.

-- 
Best regards,
Vladimir

