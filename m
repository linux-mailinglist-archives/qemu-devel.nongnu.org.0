Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215164C2D97
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:51:30 +0100 (CET)
Received: from localhost ([::1]:43320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEWn-0003Ev-1m
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:51:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNEO8-0003nv-Jc; Thu, 24 Feb 2022 08:42:32 -0500
Received: from [2a01:111:f400:7e1a::706] (port=61921
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNENp-0002X1-VL; Thu, 24 Feb 2022 08:42:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIk+NTHW5xkajaFUIB1lGHZJUlZkUEOYbv/4rA0dA1kV8kOBnqhdIT5qv5rkgfCdX9u02N+x5zTv/wT9z5sh5bPVFTWjwuL1U2nL93i3PfTjiDq6R52dYXl1kKBBzQ0mq45+qu2tlTVieKtAvZLIcrN13tGQnWTvb40zh5jzD6b33fSCRQFLI5TZJWBbUNa395kf83o5NDsvEAnH4H3WUYnIThQprC7OIwblhtXDywBpUnCvhvkjTUWJMbusS+XRCzR2/zOOdvDJgW2B9OYvLPRt5cLRD6vPU+x5cx7zfnoL1pWRTPQfAwJ6vd4g0fMc6WsbX+Z+lrwXxXnv95Qsig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKp5+J9zKbmtSx2UpMVnJ5nuCHx7WEMqw6by84pWvq4=;
 b=n7HQs/x+lUWzl75Cctb8G/389NOMC1oGoPRqxUSf8TVCIcUQVKE9Bnyxk8JRJyJtydQgnbVonfNawY3y12WZVY2Q9y1DZT7N6l5IJeqb2l7QEa05XvCmidHONzoDwdcoi288+MFhlb3n4nHA2YX90y3gCFlrD9e6GNjKaVmi124H+ra8FoDFVjxhGbD4c5wl5uJXpsJKpkRQUL99NppFQ3nGYUyBTmM61eQgVruDk8I+TQQF2sX8hkqL33jaDsMb1vn1RCrWPMMWbeJe6elpQ3u5QXT98AuesT8jFkCqecMQnUwijpYcPEKCp7GLImyC2pFI+rV5HcAXnCVBcr93YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKp5+J9zKbmtSx2UpMVnJ5nuCHx7WEMqw6by84pWvq4=;
 b=VSXu3QvOHYekVSko9limWeCVFt+9ojfEWgIt9kVrJ7Lf8gMTrGS5G9MWfQT+4nr8BPcceLBB2wFmuGHHO+FJjfOuWAKQ7tUM6xB6fulXa58/bR8vcH2+5SNAGuajmEV6wqICvd+3c3uL3oRHc7RSQt1QZuddQiKQHx5GXEPZknQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB4144.eurprd08.prod.outlook.com (2603:10a6:803:e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 24 Feb
 2022 13:42:09 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 13:42:09 +0000
Message-ID: <0ce5d0d5-ac42-c448-3751-9262b890cb5f@virtuozzo.com>
Date: Thu, 24 Feb 2022 16:42:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 12/18] block: copy-before-write: realize
 snapshot-access API
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-13-vsementsov@virtuozzo.com>
 <cb3f088b-5d6a-84cb-58bf-14bd740085d3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <cb3f088b-5d6a-84cb-58bf-14bd740085d3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44efdbcc-2d11-437b-bfa0-08d9f79b743c
X-MS-TrafficTypeDiagnostic: VI1PR08MB4144:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB4144AB5B45FFB98EF56A9AD8C13D9@VI1PR08MB4144.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJ0P94aHxLgJTkRIZ3oyaCpuYRK/Ah5a4540RX9LDKnjyVdQwBeJyxe8ylXbub9G00W/ZkZRTZGBxlGeK4UHdoQojd8bvVjxN3s04r2M54rKmJly89k4ybURiXEokXHHuoGJZ31l1YlLm8E0OKPadfMY/074+XB9Sqw2ALj2ka6IwuEpzLNBx2Xp4VN151MOouQ3YUlMtO0UeNxeayZHfwFtEL0cthZRhDUJS2v6qcqVqYWHG7nvmsMOKggyfLT+7chPiw3+wImVR3euSRAiINiCzvP6jj/sl9ETQf4LCKrZHpH7qDBonyHhntZqqGm4BXRtPXWWBgf6oBSpdU2JLpAao2vGFveOh5zFy0aoXyZL1vWKze4Y2CydyEimuopCPBK82M3UiQNpYMWRVnseY4v9iWasWeZX9vo/+08LhCMMG8g7svzqACCWIlAMMQsGDtgxNXw7Sw2Ep74dAFZS+qNoPpT7KcvXZK2rNrJFXKELjBJDZkRHKjVVzGUahz9ow5c6Y+SjZPUt7fjpVbjMwD4nKvJwSaz5zVLF5PYJOOWPs6AZe5VBW38CzvGQucnpP/rkr8spIQ3jIIN6rQXXnlOPrUbgHa6HpbU3yoLGtMU41GgVjC9SIWvxciRF2MaWip20uStcyDMfatkw5T2Fsik5fc1bGaM1i0fRMWoy/D41AyAPsFBvICiGAdrNXWB00Q8ttqI0Sjbfrmh84s/Xz/Onm8dBID6QBFxLQAjPSULCVLHZPjhGeTJrYI6cL+SNqRt18fi6nFD4yNa5JbLyuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(86362001)(36756003)(5660300002)(6506007)(38350700002)(6666004)(4326008)(6512007)(186003)(107886003)(52116002)(2906002)(8676002)(31696002)(508600001)(31686004)(6486002)(38100700002)(2616005)(53546011)(66556008)(26005)(8936002)(66946007)(83380400001)(316002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0J1RWZsYkRNSW1QenJPYXA4enFDcU0xNitLekgrMG9OUGZxT05wWUpYcXRD?=
 =?utf-8?B?T21TSUdmQXJXY0h2NjFZSEpIK2hsVCs0N3F2UXFNemx1aFBqV3ZkSit3ZXdM?=
 =?utf-8?B?RSt0OXBIOVBrSXIvcmwzOWppeXpRQkF6MDMvY0pzd0p6d0kyZ080cnRYKzdE?=
 =?utf-8?B?WUkyazZ5K3ltSlN2U3BZNXFXTGVLbE1vRTVSMlVJTC9LVlJYSlpaV05iNENG?=
 =?utf-8?B?SUlXUWZkNjNLUFN2eHZGclV5UGgrMm5hSngrODloeEE4SnBhOWJ5RlRlV0dq?=
 =?utf-8?B?SndBeE95WkxPakdETm1Pa1hhMFR5bCs1bUEwMUQxQmJaWnRqKzVWYU4yRE9s?=
 =?utf-8?B?YmNPYmNPSnUxMkgySExNZkhCU0Rsa1hIZWhXOWg0ajUwaXJzcmRzS09RN3ZG?=
 =?utf-8?B?d1NrazNpRVo0WHVKTCtKN2V5eEZ4RjB3bjJSanY4YW9seGVXUlYzUUZYcndL?=
 =?utf-8?B?blBpSDZZS3o2TWliS3pyMTJPSFhrMCthd3BjV0pWUjlVL01MQk5wcElTSE0x?=
 =?utf-8?B?WXliVmlpTWFxaXdkbVdieWgxVlZMMk1MdFhWUFJkTjc0MzJBajZPNEJHRlFa?=
 =?utf-8?B?aUZyQXBta2Ria1VjT2ltQUsxdGlCZTVTb0pJWm9KNGYvYmMxWWxZZ1kvTUxk?=
 =?utf-8?B?Q3lhYW5ObTM0MnU5S0hRNHRnbnlKaHZ2MnRWTmpIZkl2VUlFeDk3VEFYMFdk?=
 =?utf-8?B?dzJ6NnRzci8vR2d0bzhFMk1mMnlGaHYyenlJMlFZNFgyR2xNK3JmQ2NZWGVU?=
 =?utf-8?B?MWRZSEZCaWdTMWVibFFzUDkzQncva3NyZFpQbXg3UDZCb21TZmNIUmNzWTFj?=
 =?utf-8?B?RlF2SHBCc3QzRUkwMlY4VHB6SWYwV2pMVEQ0dDVhNTJPUTFwVU1XZEFwVVZZ?=
 =?utf-8?B?SC9tRmNIR1JRRXA2UE5WUFRLdmY3dVF0UUkrZDJ1Yk90L2JHVTlaNzFpb0pO?=
 =?utf-8?B?aFBTWllTeGxsMzBDUmFCVDZJWlc2cDhubkd3RElxQnJuUFF3TzduYTRMQUc3?=
 =?utf-8?B?enFnTU9rZHZBWVZXdkl3ZTBjekcrclJwU2dqZFQyWnNOVGdIMzRIbzRjTlhy?=
 =?utf-8?B?cmNXSkt6U2pNNWdCVFdzUmNyWmRJbnl4ZFBESjlqSzVPd2x4RFVuTjErYzFT?=
 =?utf-8?B?b0ZDSkdDcDc2Zmd0WFUvdlkzSGd2OEkrQUpYWGwwN3dXblFtV2VNcTcrZ2JN?=
 =?utf-8?B?ZHBLS0hEa29xdG1mbGFWeU1XSk01c2hEMUoyelR4WEVTZENWS1VYMkd1UkpP?=
 =?utf-8?B?ZDkzYk5qWDhaakdtTXl0aG5hd3FhK1RMYTJMMnBpVGpqTjIrMThyeTN5RFNN?=
 =?utf-8?B?UFI5V3dxYW1WZlEzYUtsalEvMjNvekZEclFUSHR1ZHYyNUVQTXpDOGpYUHJt?=
 =?utf-8?B?dDlROHl2RGF0T3ZmT3M0VzRmK0FnMEs0bFVsaDFEaHVtUXBQdE1heTRhTlBV?=
 =?utf-8?B?SkkzUG1uNnpPelRxK0V2Y0w2TTkxTUdmU1NrbkExb3g4emhKK0lZTGEvYUp0?=
 =?utf-8?B?OXY1RVpIZmZ1VlhKbGdkY3I5UVlkdk80WmRQenNDNnM2cC9hNHNoVzIxN2hy?=
 =?utf-8?B?MWI3TG9XcDlrOVZoKzZTdTE5akFIbGl1QTEvcFlvc0lyc2xpTTd3aUh0VmV0?=
 =?utf-8?B?ZjRPekNtK2Ixb1hqL3Jvb3VGN3dqTmgwcjNodkpKT2c5SENMVEw0aHZNOTdI?=
 =?utf-8?B?MFNSaGFwU2t3VGtkVnVUQnVMak1mUlB1aElqcFNoT1JBTFRmbXRrZjhETUlo?=
 =?utf-8?B?T3hkODZZeHhOYmtoaW9ma2puZHplS1N4T1M0R0hQcHhmUW9JeHZTZHRYclh3?=
 =?utf-8?B?NkpoQVhiODBJOGdFRnhOYVZvb2JvMVl6LzZIbjZnRlBOVTNRM3l3ZEU0OHZu?=
 =?utf-8?B?eTBpRXBOVnlwSmFJV1VSdDNwMXY2NW1PZjFieXlYSTFrbFN1cTFzS21QSXJa?=
 =?utf-8?B?K0plS0FwWmZjbGdZK0JyMUx5MUl5dHVHZ2FKblJSZG5xQmVmbWtSQjE2bWZ2?=
 =?utf-8?B?cERCU1cvT2pqdkNsWC9BbFlydmkzYW9uZEZCNGFGUTNBU3RFYzF2b1ByZEx2?=
 =?utf-8?B?dGc3MnltYkZ4VDBUdjhXeDlqYmY4Y2ltL205NHRySFNZUFQ2NDl4Qk1RTm8z?=
 =?utf-8?B?NzhHWVByTlAwMVBvTG9aakFVZ0hVbjVsVTFrK0tnNjNaWEVFQTdYR0NtK1pI?=
 =?utf-8?B?L1RQSUp5UnRiWkZ5TnY3SXhzRTg5d3I3U3RheGU1WGxBRVlubVVJSExnc2NF?=
 =?utf-8?Q?Bg3cfM7htTDl/8Pvl7LbEXchSYuXgZ/RgKQT0CQ80E=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44efdbcc-2d11-437b-bfa0-08d9f79b743c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:42:09.2859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52bnW1ZLRe5yKhRBPNGiLY4X0fcKoF7W49YNVkhqMkm+SjMCYF0cmGZa5bvYlu2V+Pw1YPyIl2q8eX6naJTCM1RcxI0ioMJlh8yIps33m4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4144
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1a::706
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1a::706;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

24.02.2022 15:46, Hanna Reitz wrote:
> On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
>> Current scheme of image fleecing looks like this:
>>
>> [guest]                    [NBD export]
>>    |                              |
>>    |root                          | root
>>    v                              v
>> [copy-before-write] -----> [temp.qcow2]
>>    |                 target  |
>>    |file                     |backing
>>    v                         |
>> [active disk] <-------------+
>>
>>   - On guest writes copy-before-write filter copies old data from active
>>     disk to temp.qcow2. So fleecing client (NBD export) when reads
>>     changed regions from temp.qcow2 image and unchanged from active disk
>>     through backing link.
>>
>> This patch makes possible new image fleecing scheme:
>>
>> [guest]                   [NBD export]
>>     |                            |
>>     | root                       | root
>>     v                 file       v
>> [copy-before-write]<------[x-snapshot-access]
>>     |           |
>>     | file      | target
>>     v           v
>> [active-disk] [temp.img]
>>
>>   - copy-before-write does CBW operations and also provides
>>     snapshot-access API. The API may be accessed through
>>     x-snapshot-access driver.
> 
> The “x-” prefix seems like a relic from an earlier version.
> 
> (I agree with what I assume is your opinion now, that we don’t need an x- prefix.  I can’t imagine why we’d need to change the snapshot-access interface in an incompatible way.)
> 
>> Benefits of new scheme:
>>
>> 1. Access control: if remote client try to read data that not covered
>>     by original dirty bitmap used on copy-before-write open, client gets
>>     -EACCES.
>>
>> 2. Discard support: if remote client do DISCARD, this additionally to
>>     discarding data in temp.img informs block-copy process to not copy
>>     these clusters. Next read from discarded area will return -EACCES.
>>     This is significant thing: when fleecing user reads data that was
>>     not yet copied to temp.img, we can avoid copying it on further guest
>>     write.
>>
>> 3. Synchronisation between client reads and block-copy write is more
>>     efficient. In old scheme we just rely on BDRV_REQ_SERIALISING flag
>>     used for writes to temp.qcow2. New scheme is less blocking:
>>       - fleecing reads are never blocked: if data region is untouched or
>>         in-flight, we just read from active-disk, otherwise we read from
>>         temp.img
>>       - writes to temp.img are not blocked by fleecing reads
>>       - still, guest writes of-course are blocked by in-flight fleecing
>>         reads, that currently read from active-disk - it's the minimum
>>         necessary blocking
>>
>> 4. Temporary image may be of any format, as we don't rely on backing
>>     feature.
>>
>> 5. Permission relation are simplified. With old scheme we have to share
>>     write permission on target child of copy-before-write, otherwise
>>     backing link conflicts with copy-before-write file child write
>>     permissions. With new scheme we don't have backing link, and
>>     copy-before-write node may have unshared access to temporary node.
>>     (Not realized in this commit, will be in future).
>>
>> 6. Having control on fleecing reads we'll be able to implement
>>     alternative behavior on failed copy-before-write operations.
>>     Currently we just break guest request (that's a historical behavior
>>     of backup). But in some scenarios it's a bad behavior: better
>>     is to drop the backup as failed but don't break guest request.
>>     With new scheme we can simply unset some bits in a bitmap on CBW
>>     failure and further fleecing reads will -EACCES, or something like
>>     this. (Not implemented in this commit, will be in future)
>>     Additional application for this is implementing timeout for CBW
>>     operations.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/copy-before-write.c | 212 +++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 211 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
>> index 91a2288b66..a8c88f64eb 100644
>> --- a/block/copy-before-write.c
>> +++ b/block/copy-before-write.c
> 
> [...]
> 
>> +static int coroutine_fn
>> +cbw_co_snapshot_block_status(BlockDriverState *bs,
>> +                             bool want_zero, int64_t offset, int64_t bytes,
>> +                             int64_t *pnum, int64_t *map,
>> +                             BlockDriverState **file)
>> +{
>> +    BDRVCopyBeforeWriteState *s = bs->opaque;
>> +    BlockReq *req;
>> +    int ret;
>> +    int64_t cur_bytes;
>> +    BdrvChild *child;
>> +
>> +    req = cbw_snapshot_read_lock(bs, offset, bytes, &cur_bytes, &child);
>> +    if (!req) {
>> +        return -EACCES;
>> +    }
>> +
>> +    ret = bdrv_block_status(bs, offset, cur_bytes, pnum, map, file);
> 
> This looks like an infinite recursion.  Shouldn’t this be s/bs/child->bs/?

Oh, yes, right

> 
>> +    if (child == s->target) {
>> +        /*
>> +         * We refer to s->target only for areas that we've written to it.
>> +         * And we can not report unallocated blocks in s->target: this will
>> +         * break generic block-status-above logic, that will go to
>> +         * copy-before-write filtered child in this case.
>> +         */
>> +        assert(ret & BDRV_BLOCK_ALLOCATED);
>> +    }
>> +
>> +    cbw_snapshot_read_unlock(bs, req);
>> +
>> +    return ret;
>> +}
> 
> [...]
> 
>> @@ -225,6 +407,27 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>>           return -EINVAL;
>>       }
>> +    cluster_size = block_copy_cluster_size(s->bcs);
>> +
>> +    s->done_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
>> +    if (!s->done_bitmap) {
>> +        return -EINVAL;
> 
> Hmm, similarly to my question on patch 4, I assume cbw_close() will free s->bcs (and also s->done_bitmap in the error case below)?

Honestly, I don't remember did I think of it really. But I think it should work as you describe.

Interesting that in qcow2 we have code in the end of qcow2_do_open on "fail:" path, mostly duplicating what we have in qcow2_close(). Seems it may be simplified.

> 
>> +    }
>> +    bdrv_disable_dirty_bitmap(s->done_bitmap);
>> +
>> +    /* s->access_bitmap starts equal to bcs bitmap */
>> +    s->access_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
>> +    if (!s->access_bitmap) {
>> +        return -EINVAL;
>> +    }
>> +    bdrv_disable_dirty_bitmap(s->access_bitmap);
>> +    bdrv_dirty_bitmap_merge_internal(s->access_bitmap,
>> +                                     block_copy_dirty_bitmap(s->bcs), NULL,
>> +                                     true);
>> +
>> +    qemu_co_mutex_init(&s->lock);
>> +    QLIST_INIT(&s->frozen_read_reqs);
>> +
>>       return 0;
>>   }
> 


-- 
Best regards,
Vladimir

