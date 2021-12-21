Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E33F47C156
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:19:47 +0100 (CET)
Received: from localhost ([::1]:38772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzfzW-0005xs-GU
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:19:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzfxd-0003n3-Oe; Tue, 21 Dec 2021 09:17:49 -0500
Received: from mail-vi1eur05on2117.outbound.protection.outlook.com
 ([40.107.21.117]:18592 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzfxb-0007se-3D; Tue, 21 Dec 2021 09:17:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqBrVgasVaX/JHRcoQOZX6ysBYg1vXIF3rCzfN7uE/qJE/GJGKKa1wrJIcr/GrTBj4MNLZcCvZHL0wdKulg/sofOz8FgrTY7OdcZu+r9cmJqCPtp4n2nJVkZ2FqKJRNtGeooXKzfInYNwy/7hQE8y6PpuRfThiktaj9tradjrJOeVn2MKUaWsbn9NpMkO4H+5mP+uTllMGQoRwJLomhQciAdPZYJ4RbHBIU1+q6TSh966s8Cv42ub1nzgxHicE8lWHi92Shqu8uWmr08a/7+7VM42dQ6xJdGMgE9g5iEfTjubp8gRwhr2dhQ9Xlm9adHyl8idJwul4+qHGOAvmr9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LYxR28RscFEXd0ScBBnbfQgoDZXLAI+7zkfPQqwAeQ=;
 b=ZjncyQUuf8xNrS3v0STgi8dXleHQX80fIufmMuJNxx4U45FqXvA7tM0uzKUEbdZpnPbuprJkLIZjGfKZeAnobq0zVC+ANe94Y4tSorcqPttCNb5oxVlG3Ip3+wKSA0RLJP4GXEHNMy3klaikjoGTfRDDFojPupHThkMm4mXDckkPIbJA2knSQJFaqwL5m34I8jEs14Qxo8gjdii01T6TUwlb0zWj8ipiOHnSbY9ytkq9mFsTgmdDL9z5AIswlJisoSFyExIc1EAO5wk9QN84HhR/AGQf2QVWBy6SUD/V5VWbMgHxW5D57nmDaSsK6vMmBWgMjizuNIksNb3rGG1k5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LYxR28RscFEXd0ScBBnbfQgoDZXLAI+7zkfPQqwAeQ=;
 b=uF/aeZq7aZC5eXIH5ZDosxjqWFvahFVFw2YIG9nnJ2pu/eTWCAqkbPHLgoC2weUX+sVNPtWrRav37EqlCj18lmY0l2Fi0iLLlCya8J6cvHGqRnqPI+5XN6B6etbZHz2JoO1MsaQhq0Gt9owAmWmM05mu4EojX1f7FgssjdlQv84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB7PR08MB3706.eurprd08.prod.outlook.com (2603:10a6:10:7f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Tue, 21 Dec
 2021 14:17:43 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 14:17:43 +0000
Message-ID: <d60a7c8c-c134-0b5d-bcae-1107ea3cc3fa@virtuozzo.com>
Date: Tue, 21 Dec 2021 17:17:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 0/7] nbd reconnect on open
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211213153240.480103-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0005.eurprd05.prod.outlook.com
 (2603:10a6:203:91::15) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04699f9d-5b03-43e4-226d-08d9c48ca708
X-MS-TrafficTypeDiagnostic: DB7PR08MB3706:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB37062B3C4DC9F3B165F1C586C17C9@DB7PR08MB3706.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x04DSBegTebo9dr0uZ6q+677OFK5r1310Mhyogh/fUfZYs2MMBqSIXhBirkzOPFzum5k77IouW9S6pwujK2JuaFfjXwcHhWvd/2Bmu7gdt4ZTZTdj2NTWuctXFa8uPya68oO6mN4ilhHn+ElrUbVmoRGVA8bcMPbtw2EB1etAD6JJvIyAtBz3u8hMIqvnD0mlhgOYBfnMpirTLy/B/4IIQgVVN65QwhFDyXGtIm7g44er1a0oTOG5dU4Rm70BJ5SGIqvgWYYdXsceszojLySXTKYyg5+Bv6Y13h+nq6gH+ijB5YaEy1BZcPAW2zWDVJsEBJEU2wN6OTuTsO1Z96pTzaL/gWPlCix2DY776A8eC0rPPf/Z4yX5j82zfLVqcspwqazXOYPfMQwWz8lFOf/o4xmhqARVVyc1lFl0+oV8hRMkaWACL6WasdsqOsinr72MGKVQVOlhABy3oDYaBAn4v9ATLhUI0jnvLUzUIS09tOllwbMrVll6ShR+QH2qGElA04bPlPZgRLwJ9yEM12os+bNA6eL0C/Yh/R2LruIbQshQuH/RQMMGNXA20jNB6MBMnNY+EaEgCTcKe/0xgFsXSEm+vW3zv7KNJoALb/Vj4N+/AgxfBy/Ndm826Kmk6xu8vgG7IAd7Xq6lmGKZ4cq+qjAlyePPlF6VJeejb7JDGnAyeEZM/d9ybwP7o8eHQ2jKEfLXUa1D1tlB35iVmsYkqXBLYPUy+N+4xBJbvg3+anIVAg4WgB9hUpRyG5lXOCTf1+Rf8uQfVAb2HGrnxsAsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(66946007)(2906002)(52116002)(508600001)(36756003)(66556008)(31696002)(316002)(66476007)(31686004)(4326008)(6916009)(6506007)(2616005)(6512007)(38100700002)(8676002)(26005)(83380400001)(6486002)(86362001)(5660300002)(8936002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nzdub2o1d1ZIR2tzVGR6NVBwaSszWjdGMjNqM0gwNDZRSzV2dW5XdWpGTU5n?=
 =?utf-8?B?bExEcDFFMzl4aE9ERmpXcksxMkxpa24wamZHNkZjcmVsMWM2c250WGdnUWI0?=
 =?utf-8?B?dXdXc3J6bHRpemtjM3BQNU5jQUUzL25pRHBKQmU1eWlyKytuOU9aQzFjZG8r?=
 =?utf-8?B?NEhnM0VUc2N0WnNYZWJJYk5mR0UvMVVDcFlkbVZoOXVqeU5aWGpaeGN6aVp5?=
 =?utf-8?B?d0NpaUZyd0RYZmZLQ25pZTZzbUxnM2YyK1EweGxCT1lsNnFxRzVLTnZDUU5X?=
 =?utf-8?B?eFBvTkZFTURDUHFkU3FZaFFOSEJpY29HMHN5ZTRvUHFnZGxtS05FcmVjTTJy?=
 =?utf-8?B?d0Fwb0gvM3VWTzlFS3dzeGFUOUhidmpGUlMrU1ZORVJuVUsrT2tJVGhNMVdX?=
 =?utf-8?B?V1dlQW56bEovUjNoM2ZURmlDR2VidjFNZHdFOGJidjlVMDJmUU1wajJreXdw?=
 =?utf-8?B?NktpLzU4WUgxTGJkQkg5a0VnbStNVDdsSndUcjM1UDRBWFJRTzVxbkxNUHpF?=
 =?utf-8?B?LzRtSmcwMVpUL3lCNEpYYUpHTEtaZHRWUkNyVWVJK093R3hQOWtkVXZhalB2?=
 =?utf-8?B?NjlrNHc1ZmxQc2s3NStTelNCZzlnb0JTYmd2RGFqUlZIN1lWbnhuSnFxTGVt?=
 =?utf-8?B?VDZ6ckJXTVVxd1I5bjJ2bkdGMEFldXZQNjlnOW13UmxLMzZPK0wrS0ZEeGho?=
 =?utf-8?B?TXh5eHBiMXV6Y2lmSXVHMk1ocXZsb1U3b1RyaUdLM2RDV2xQZm9pR1dBVDdJ?=
 =?utf-8?B?SkRINkJjQ3dpUDJzK3doY0FCYi9zSGVJU0RDWDB0K1U2YXl2RlBLbWdmL0Rs?=
 =?utf-8?B?c0NjVFpHeDJMdkhqc3p1bENOeDlVTDFRb0tJT2xLcy9SRnFtbk5SR3NrYkxu?=
 =?utf-8?B?Yy8xemovb1FnY0tGV2E3MFZJcm94WFRjZHBLd0NSTStKaWhjWmhnN1VpMWEw?=
 =?utf-8?B?eHJDbGFRV0RvZFdPcVBoOWNsc05JdFBFWHhBdDk4MDBDeUNUY3FyUUdsNmpp?=
 =?utf-8?B?djdrbVQ5RVdnOEgvaC9MWUFHb0p0dXNNRGoxblZnN211T3F5UmYxbkF0V1Zz?=
 =?utf-8?B?ZnFuaVF0K1NLRGFEMFhmK0JZczFSeUp4aGNxTlFnTWhGY2RNdHVGRi9JbCtk?=
 =?utf-8?B?WXcra3cveG5wdlhkbmsrcVJGNlQ3NGJoWWtrNytjTC9HOE9vNXJwSzVDM0lG?=
 =?utf-8?B?K1JsLzhDWmtkWlp0OTdvcnVPeXU2NUFpeCtMRTFTYVhzT2dHQklHYmlCNzQw?=
 =?utf-8?B?cUxDRXRxZENicm5zQmVyTWpLZ2pGaGtMRE5yODFDaXVlLzRQMnRtTEo4enVj?=
 =?utf-8?B?RjZkbXFxcERqemh4QVAzT0tNcm0vbTdFZklTRkdjYlBsR200MzZWWE9yTnMv?=
 =?utf-8?B?OTlrRDFlaUdVYXlHbU1MQk9STHEyZzVoY2VFQmt5dld6Tm9TR0R0VENzajJP?=
 =?utf-8?B?UFNOcGVOODRzNld6bDhwNFI0Q1lSZC81ZjQ4Zm5nYWM5Q1hpaTFxMjNMb1U2?=
 =?utf-8?B?MHVLMkpLd0dFYXhhMzFOZkhqN21oeEtxT3VhQWRTRGwrZEFkSkdhcWZubkNB?=
 =?utf-8?B?TGtKR2U3WUpOaDdMRmxyaG5MWGw4cUI5OHpXNW1abG5MY29nRXhXUlNVMEhi?=
 =?utf-8?B?T2NyQS9DUW5rS2pUN3Rad0pQMGJpc0t2d3hycXV3V1NUdDJZNDZnZjllZ2p5?=
 =?utf-8?B?cFJxYXJZMXVSakdNaThodjM2Z1oyQ2VUMHhkTjczWWhKUGVMSnlKQ3FxazRU?=
 =?utf-8?B?R1VndWI5c0JQQXZrZmJoT2tNdTNQUEsyV29JNVZTWGF3YXhETlpNNnJqK0N5?=
 =?utf-8?B?RURkb0J3ejY1bjRNTTNUVVQ1QXhzU1ZJRk4rQ1dZanNJcGgzZVZQbHl2VXZr?=
 =?utf-8?B?SUJISnhVaEswdHh4aTBDWjZZRldodFNMUVJCSnZ0M2hkN0J6MzZ6ZHVNR2Zn?=
 =?utf-8?B?VzBxdmdRUFFSWTNpSVJ4TXdKSjNCdVZOT01wcjJ4SU9xRDFDSEh1NXhNTVVR?=
 =?utf-8?B?T3Zxbm9Eb29SY01CSTJGaStkUWN5b1NVbndqRmpoTVN3cmdYQ2haRmZBWUxZ?=
 =?utf-8?B?SHFacnNlMi81VmhVeFlzb3hQS1dCbzBQcGdrbis4ZFlUeUJmUGFRN20wUFRv?=
 =?utf-8?B?eHk3ZnVEbURIMHhJQnZCbUplTkNqaEJWREczL0hBN3BJMFhXci9PcVdmbnlZ?=
 =?utf-8?B?Mm0vM09ISUxpbWZHeUVTVmFXRUZUdFJPNmVsdEowYmJiSzhBdU1Nd3FsbXN1?=
 =?utf-8?Q?tdwnXAvh5+quHYJAliiZNwnuqoRTQMDT9LjjSGxW3E=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04699f9d-5b03-43e4-226d-08d9c48ca708
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 14:17:43.0815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQ0LEy17mT6Q2oB16C0M0Ahty4lksESo92xyHJj+Skgc2HY0IfG3uNNuD9URV0WQVqLPBnH4XP5kibp4keVooxh3dD/Bu0jESpKjIKRpzmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3706
Received-SPF: pass client-ip=40.107.21.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

13.12.2021 18:32, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> The functionality is reviewed, python testing part is not.
> 
> I've dropped the patch "qapi: make blockdev-add a coroutine command":
> it's optional, I don't want to slow down the whole series because of it.
> 
> v4:
> 01-03: wording,  add Eric's r-b
> others: small changes, never had an r-b
> 
> Vladimir Sementsov-Ogievskiy (7):
>    nbd: allow reconnect on open, with corresponding new options
>    nbd/client-connection: nbd_co_establish_connection(): return real
>      error
>    nbd/client-connection: improve error message of cancelled attempt
>    iotests.py: add qemu_tool_popen()
>    For qemu_io* functions support --image-opts argument, which conflicts
>      with -f argument from qemu_io_args.
>    Add qemu-io Popen constructor wrapper. To be used in the following new
>      test commit.
>    iotests: add nbd-reconnect-on-open test
> 
>   qapi/block-core.json                          |  9 ++-
>   block/nbd.c                                   | 45 +++++++++++-
>   nbd/client-connection.c                       | 59 ++++++++++-----
>   tests/qemu-iotests/iotests.py                 | 36 ++++++----
>   .../qemu-iotests/tests/nbd-reconnect-on-open  | 71 +++++++++++++++++++
>   .../tests/nbd-reconnect-on-open.out           | 11 +++
>   6 files changed, 199 insertions(+), 32 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/nbd-reconnect-on-open
>   create mode 100644 tests/qemu-iotests/tests/nbd-reconnect-on-open.out
> 

Thanks for reviewing!

I do s/6.2/7.0/ fix to patch 1, restore subjects of patches 5,6 (which were somehow lost in transition v3->v4) and apply the series to my nbd branch.


-- 
Best regards,
Vladimir

