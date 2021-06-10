Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA33A2C00
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:52:28 +0200 (CEST)
Received: from localhost ([::1]:47766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKAb-00031t-SP
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrK9F-0002Ax-DH; Thu, 10 Jun 2021 08:51:01 -0400
Received: from mail-eopbgr50128.outbound.protection.outlook.com
 ([40.107.5.128]:28070 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrK9B-0000km-BB; Thu, 10 Jun 2021 08:51:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRhNj1qkibyuvU08Zn6v+3iWb+jNd6bJuRRNAMqDdG2vy4TfscFITEjvkaN98VOXUKrkH0p8jwRF23kqLSw90bojKfVG/y16oktOXheSgn+bgyp1MBMe8E/JsWOWR/VLCIGP36NW2gCyP8Kt8tygnWdVSGhUkx8nGnj/T3U4z+Y0GAxEN8igFvEWWsvSCqdxbty24S0KIipAThRUuI5GNsUuEsZYosUFe9gp3TA+LaZpFgyU1yvQ2lnLoI1dNDZ4a41fwvo/sG89AYLQZJDc+U1NpNY3tWkG/nuH5o6LxJ8I3WVZ60un1mBPgYdhWoD3LWqN5bc6De+2Pld2HQ7WBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ1mshRa8X44vOoJMT3RDFD0IEAtD2+VrtuSxfXZT38=;
 b=ckxRVy09Ozcx3Yt5hppNnWrKe+f98v1oWm4FcBOzeBlPiy7cDEbbpdbNyegspIZDDiITYaGjw5UX9RxGHu/MysQNjd3WgQZdfEzKXclkDo10xAvgJi0Yd/SBLsaGNhTpvYG6zAvnPQfMtrgbQ4++yhZGCVlXhrdBN1NYKqb7mt9tBBLi3TYGzJHpkPCwQVc/3R6GlGUcq8p+3zfvPbz68yq6j6Kd9z1JJEn4nZ9GE+cjzDjUbQvjoP+XuMjENdp1zx7vIGUdgQ6nAIO/Y+e/6ZAK6BCdVJklvM9cwvnkyQRv2ph5hi9ckt2VAQ24xJLTngFQ8JXoXb/YglqRIEvFhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ1mshRa8X44vOoJMT3RDFD0IEAtD2+VrtuSxfXZT38=;
 b=UYNipUtbphcF83tNk8zDBlqUmpj7x+76qe4NTiw0+Xzva5GjD2dH2AAay+oOVCNxSxEFLvVjJ+yIDyzkAQEHlpoWesYGVnWVlGTavSWL4bbFqv1cCoBJhdJ838UvMwqT6QsMO/Nc9/Oura497Pg9g/W0qxmcJOFHBPxdFFvoHNo=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4534.eurprd08.prod.outlook.com (2603:10a6:20b:ba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 12:50:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:50:49 +0000
Subject: Re: qemu io test: spurious failures of 030
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu block <qemu-block@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <e40bf8ee-8a20-1251-911e-ceba6f1cee05@de.ibm.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: Claudio Fontana <cfontana@suse.de>
Message-ID: <0c6b0137-df1c-687c-5b8e-9aca574dfc2c@virtuozzo.com>
Date: Thu, 10 Jun 2021 15:50:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e40bf8ee-8a20-1251-911e-ceba6f1cee05@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR02CA0168.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR02CA0168.eurprd02.prod.outlook.com (2603:10a6:20b:28d::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Thu, 10 Jun 2021 12:50:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d05fcd5-9fe6-4933-7fc7-08d92c0e5fab
X-MS-TrafficTypeDiagnostic: AM6PR08MB4534:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45349CEE6E31B68F2364E551C1359@AM6PR08MB4534.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4sJLyN3kk8E+1suvEGfGrhhwKa91ZdRUidnLhNhPswmeeVbNDiEq9s9wxdSY2KzKHDnVxCL37J1gSIEKBT6qkGd60rECeXtrsdZiKlHDtdO3SamuMIItvx+cyhifStmAOAiU2aoUQDTupJjp+WDOH7Ht9MAHlOZBKViQVttsAd5mT7ay3LSwLbaAPmavjtPDyiOVI0lr9+O1L0C0OHuOitBJf5vKCCuQ10ggivRclz9fMV2hMqJkmUIzPtpB9K9XwXnWqPZ+GVNY2won3ja9ymVBo7Xlu6vJXWNBpntEa8VJsHeB/5hB3okl2pKXD++V9EOFn9vfSKOF1cwHx+0cicou8zrcUaleu8DZTSew+nn2LqSKsEuk3cS/qo+OMFBEwRh+kQYrlDK9n8RH4ODLkwk/kw/IE9XJKuL8qgslks1j+GVb11tIdvXJM73q0HTHvbF+ahZCCSBdc6ESH4OVGPNa6UocGMX9dqtfTcfFJstFTf4bJMFr3m0q5aDTOPdp2HDCV/v0G2pjX7n4VN/4MK7nZvB2MzSpLp5NHgoD3YlBlx3NEdugfTdRh0W0Uw4tXuazelN4JYH8QqxrjSVgaI0lKUAsQv+pyrO06F0QtQXJoYPFhE1zo9L4seCiX1DD+IQOAh4ztvETXq+TBfH5Hl/7ymwqNuH0Mh3Ss465w/u037LOsJ9mM4UU//BP/KMX1xCRg+997ttRMuSIzsdvEXqeWxX/3qTMdSRTeJKTlUsB7Efhs8kUvgVparBs+ty8ufUSAktVT69/7mq25Ob1nVtW+wNE8B1En3JbuUfc8GZCmBXHWxwOzQYero5U5ZfGa3vY9pDy5IQMpe9XQV/kNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39840400004)(136003)(396003)(346002)(186003)(4326008)(16526019)(66556008)(8936002)(83380400001)(26005)(36756003)(2906002)(2616005)(31696002)(66476007)(8676002)(956004)(31686004)(966005)(6486002)(38350700002)(86362001)(110136005)(16576012)(5660300002)(316002)(478600001)(66946007)(38100700002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dXdIMG9FWUFodUF0Q1N5cDkvc2hmR29ZTnZudXBsN1I2QUpkcHZIMzJrdWFO?=
 =?utf-8?B?aEt6aVNSV1Vzbm1ZWVdPOU1MMWE4eUlmM1A1N1FhZHJEOC9QREtScndVSlJo?=
 =?utf-8?B?Ui9VRGNKcVV3ekFZTy91a09OeHU4ZCthWGJ1SXNVZDQ3bEJKU2d3TGZjTU9o?=
 =?utf-8?B?aTRkT01BYlJsYldGdFIrUVVueWV1c3lRSU1NMlZMWXc4NHE3OFJ1RFJQYXNF?=
 =?utf-8?B?blE3L3Rya2d5Z3pOd0RhY0N3OGFVeEprWERkRzNQd2ZqWG9ETTZOUkRSRXNw?=
 =?utf-8?B?dzZ3RU1pTHNPZjJxYWMxL1NESVhBL2IrTEw2b0xVUlpraUtpTmsyMWwzZ2do?=
 =?utf-8?B?bTBsTWU1ZWlJZEJWYkNLRzdCQ2w5dXdrVWpoSUgrUE1kcVV3NUNDMm1IaHg3?=
 =?utf-8?B?S2dhRDU5cHMvSS9MWmQ3Y2xmUzFQRXA2M01aZVpqbEJUL0JNbHcraDcxTDI1?=
 =?utf-8?B?SnFhYkNBOHBHNHIwYWtIeHdWTUpDZzA5bkFTWkIydVRVQVVxeE10MW5ieXd0?=
 =?utf-8?B?V1RQZGpIRitpdG9JQWg3TXNWQjJTdkJXdHluaE5OYU1RTVRaTVlSYWk5c2lK?=
 =?utf-8?B?SEFaWkxrSzJEcWoySWVTSjV5Vm0wZjB1WjJ1VGFOVFJTd2ltR2FUbUxyTlJK?=
 =?utf-8?B?akVKRG1oZUFoQXkzR0ZlVjE5UjAzc3ZJcFNvR1dBLzFhR0FtTldUZDdXS0Jy?=
 =?utf-8?B?dDhiV0p0MHVkMG9YSU1ya0lGcHZ0VzZ4UUcrRTlieG9xYzlPcEtiSlZIVXg1?=
 =?utf-8?B?TlJoNkhwVnUwaUx2Q3NFaHg2VU1XR1ZBSkIwOXAzcXBCdmtyVStVS3hmMkhI?=
 =?utf-8?B?b3ZUQ1VJZWxad3BSWUkvdkZPTzNJMnhqQTdXcHVqR09hTDU5c0oySEhuTFNT?=
 =?utf-8?B?aGpMckFpdmJwMStKTkhJNDY2NnFPWDAvUC94SzBBdERHRVRIb0dKMEVmSjNh?=
 =?utf-8?B?YTl3SWJWZExsS0ZMT3JtbGZMZi84cXZDb3ZzcHBVcytTbllzQjNvczQxU29u?=
 =?utf-8?B?V2dWK2FNZzQwU1M0SUVMSWFzN2RoQk1Yb2liVG02OVV1SmowdEMwRTduVVZm?=
 =?utf-8?B?ZzdCbWZ3V0NvQWFzNmoyQ1p5MEczL1FGNDdJc0oySnZrZ0dmTWU2VlNPVTdk?=
 =?utf-8?B?SnkxMXJxZ2FXM3dkR2h5UW1aclBnbGw4dUZJcEo0elBFbWJ3ZzAxV0QvN2h3?=
 =?utf-8?B?WUVCSGV6Um1TTWIzMHFTU3Bsd3h4WTg3VlN6SURScm1ielFXRTBYbEpoQlJq?=
 =?utf-8?B?ckp6N0dVN0pnMzJ6amZlWjlVNnBQTDNQS1MraG5BNHlXUDFnZWZoQlhTYTVC?=
 =?utf-8?B?YlI1NFVvTHVGKzZSZ1c5Y1lyRisxWCtMRTdtUDZyNnczM1lnZWc4K3ovd285?=
 =?utf-8?B?aUhNalhNR0lGRG1vVm5hNG0vU2hsWGdNSmI5NTVPVjMrbEpqbXBtNmZjQ3BT?=
 =?utf-8?B?Mm5iOXlJYm5YU3JFSnliYnJBY0hzWnBMWUdIOHJxcEV1ZGhjcmIyZU1vbEQ0?=
 =?utf-8?B?NWhOblEwVjZZT0ZFTjlwOTZoTzQyMXBCWk1iMU5Pb2plYVdPNU9uaGNYM2RS?=
 =?utf-8?B?MUxHTmtOaHczTFNHeFFub01COVdnOGE4aTRBVmxFRndpZkYwNmpkZzlaTDBC?=
 =?utf-8?B?TmluM1VaOTY0OEd6OC91NmdSekZqQ1RLbXkwdzJLVVBFRVhWck9xWGZXb0Na?=
 =?utf-8?B?Tm9MMjdCd0NIRVZVV1lRc2dlaEdSc0hWMFJIZStyT2Y5L0Q2Z3g3Zi8rdkZh?=
 =?utf-8?Q?DeuwT4ZTIgTW5IWQp50FBqHG5b9zScpzRl/+VXN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d05fcd5-9fe6-4933-7fc7-08d92c0e5fab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:50:49.7229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9qIuhc7MBIfWb4vIJ/NNuPkj1jT/68r0BJqfrqeDTvfAYPcMkhScmcxOrecWLw9YinGHd4VBhK39oDVOzBdSHhLXunm0nh1ZVTbVk/3Ido=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4534
Received-SPF: pass client-ip=40.107.5.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Hi!

030 is known to crash sometimes

The only thing we have (as far as I know) for now is my outdated "[PATCH RFC 0/5] Fix accidental crash in iotest 30" (6 moths ago, time flies fast :\

    https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/

I hope one day I'll return to this thing.. But everybody welcome to get ahead of me :)


Note: we dropped iotest 30 from auto group in

commit e2c5093c993ef646e4e28f7aa78429853bcc06ac
Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Date:   Fri Feb 5 14:10:21 2021 +0300

     iotests: 30: drop from auto group (and effectively from make check)


And original commit message (look at <20210205111021.715240-1-vsementsov@virtuozzo.com> in list) said

So it seems reasonable to drop test from auto group at least until we
merge "block: update graph permissions update"

(and it also showed that test still crash on these series, but much less often)

Now this series is merged. And it seems to me that really, I see crashes in iotest 30 rarely. But they still happen sometimes.

10.06.2021 10:54, Christian Borntraeger wrote:
> Folks,
> 
> I have CI on s390 on qemu/master for each commit. And from time to time I do get spurious failures of 030. (always 030 and nothing else).
> I have a hard time reproducing this manually so I cannot debug this at the moment. Has anyone seen this as well?
> 
> 
>      030                             ...        [09:34:06]              ...                  030                             fail       [09:34:06] [09:34:09]   3.2s                 failed, exit status 1
>      --- tests/qemu-iotests/030.out
>      +++ 030.out.bad
>      @@ -1,5 +1,45 @@
>      -...........................
>      +.............WARNING:qemu.machine.machine:qemu received signal 11; command: "build/tests/qemu-iotests/../../qemu-system-s390x -display none -vga none -chardev socket,id=mon,path=/tmp/tmpt3vg8hqd/qemu-2816608-monitor.sock -mon chardev=mon,mode=control -qtest unix:path=/tmp/tmpt3vg8hqd/qemu-2816608-qtest.sock -accel qtest -nodefaults -display none -accel qtest -drive if=virtio,id=drive0,file=/tmp/devel-iotests-9771/img-8.img,format=qcow2,cache=writeback,aio=threads,backing.backing.backing.backing.backing.backing.backing.backing.node-name=node0,backing.backing.backing.backing.backing.backing.backing.node-name=node1,backing.backing.backing.backing.backing.backing.node-name=node2,backing.backing.backing.backing.backing.node-name=node3,backing.backing.backing.backing.node-name=node4,backing.backing.backing.node-name=node5,backing.backing.node-name=node6,backing.node-name=node7,node-name=node8"
>      +EE.............
>      +======================================================================
>      +ERROR: test_stream_parallel (__main__.TestParallelOps)
>      +----------------------------------------------------------------------
>      +Traceback (most recent call last):
>      +  File "tests/qemu-iotests/030", line 260, in test_stream_parallel
>      +    for event in self.vm.get_qmp_events(wait=True):
>      +  File "tests/qemu-iotests/../../python/qemu/machine/machine.py", line 597, in get_qmp_events
>      +    events = self._qmp.get_events(wait=wait)
>      +  File "tests/qemu-iotests/../../python/qemu/qmp/__init__.py", line 338, in get_events
>      +    self.__get_events(wait)
>      +  File "tests/qemu-iotests/../../python/qemu/qmp/__init__.py", line 207, in __get_events
>      +    raise QMPConnectError("Error while reading from socket")
>      +qemu.qmp.QMPConnectError: Error while reading from socket
>      +
>      +======================================================================
>      +ERROR: test_stream_parallel (__main__.TestParallelOps)
>      +----------------------------------------------------------------------
>      +Traceback (most recent call last):
>      +  File "tests/qemu-iotests/../../python/qemu/machine/machine.py", line 489, in _do_shutdown
>      +    self._soft_shutdown(timeout, has_quit)
>      +  File "tests/qemu-iotests/../../python/qemu/machine/machine.py", line 469, in _soft_shutdown
>      +    self._qmp.cmd('quit')
>      +  File "tests/qemu-iotests/../../python/qemu/qmp/__init__.py", line 288, in cmd
>      +    return self.cmd_obj(qmp_cmd)
>      +  File "tests/qemu-iotests/../../python/qemu/qmp/__init__.py", line 266, in cmd_obj
>      +    self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
>      +BrokenPipeError: [Errno 32] Broken pipe
>      +
>      +The above exception was the direct cause of the following exception:
>      +
>      +Traceback (most recent call last):
>      +  File "tests/qemu-iotests/030", line 227, in tearDown
>      +    self.vm.shutdown()
>      +  File "tests/qemu-iotests/../../python/qemu/machine/machine.py", line 519, in shutdown
>      +    self._do_shutdown(timeout, has_quit)
>      +  File "tests/qemu-iotests/../../python/qemu/machine/machine.py", line 492, in _do_shutdown
>      +    raise AbnormalShutdown("Could not perform graceful shutdown") \
>      +qemu.machine.machine.AbnormalShutdown: Could not perform graceful shutdown
>      +
>       ----------------------------------------------------------------------
>       Ran 27 tests
>      -OK
>      +FAILED (errors=2)
> 


-- 
Best regards,
Vladimir

