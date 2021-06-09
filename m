Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE033A11BC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:55:51 +0200 (CEST)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvsE-0005CM-Jw
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqvqy-0003lh-Rx; Wed, 09 Jun 2021 06:54:32 -0400
Received: from mail-eopbgr150137.outbound.protection.outlook.com
 ([40.107.15.137]:17073 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqvqv-00040X-M5; Wed, 09 Jun 2021 06:54:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmOTbsUwvNCE4t/16YpmsWWbK8zKGMqVlUnMlE6HAcYpfFbKfz1z6X4xn3xbiAw6BHtPL3S9VH7sFAO+368MCz1VDMK0HpFTMnMRkj9t3l1LhLfedEIM9Yec6SpmUND+143AIoafzeWr5ZR53BpD85WmlKNTsPQCGWy3czUwqWl1m88nZUBKle/u4+RkOIBL2FbXgMV67avJYj7+kz5t9FjaV0gMQZw891x5Z431Age56Nph/BjURmA77cxkwl0+yRLLFrzbFvS0tpuRmbUm0kU/D7uaOhb39XaQ68eoYOE9zC2Au5uzcHPfvMhACrDZZkStXZyA1zhszvfzblEXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzJfABqZ8do3KV8geEty6zY9p1vm2TojmwgNVYzIe+Q=;
 b=UnVHFEaiU1uF+zWHGuE4/7Fv1yDlUnvXlg9+5bUK7sNCcS55MgLzYM0y/Bzx4Zy9VOPXoiibHj02iePM9zUujYy3BOplJ5lslgzdWlvV8rsKVpazs3tgSPffyz5JVkFIyXZbK/8O/eBs11Zff4KvGWit4uIGbr9M/x0xuVXkyhOAEW8hV6vZ6uFDq9ySyf5i4e5nOZbDe7cfnGw/vAJq6wEH3o1Dix9LgaAa3X43OPS+dJweNMzPjqb4LRC8AXnsiOQmT3hfJf+VeVWB4QdPh3lHoNxCqaWoJuFxToJxF5xRxoPbz7uflVavpq/yiHYlop5vyFlrwahyNcXwZcExBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzJfABqZ8do3KV8geEty6zY9p1vm2TojmwgNVYzIe+Q=;
 b=eDFIUh9eKwiMHwaoJP4IQ/sLN8j6EKkzdgJu+d2RqqFf/ujpKIp2v5L6I8na0Isg9mqJCFHyCRv4URAgRpKxxREuef3tdvoTvYEpednRReVpxo4cw816NPpbMBWK6ifAOWmZRzGRzXupI0SbMa33HqKcr2KUB3O5LkwkOD8btWg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 10:54:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 10:54:26 +0000
Subject: Re: [PATCH v3 1/5] block-copy: streamline choice of copy_range vs.
 read/write
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-2-eesposit@redhat.com>
 <ddc23736-d6ce-cdde-21b8-f809ef65ea65@virtuozzo.com>
 <8f49c449-583b-8842-9920-dd0dc1196e1f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c0bae916-0e7b-8c9a-a59f-7a7f1d0949dd@virtuozzo.com>
Date: Wed, 9 Jun 2021 13:54:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <8f49c449-583b-8842-9920-dd0dc1196e1f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0074.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 10:54:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6348b9bd-ffde-48cc-9033-08d92b34f328
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6069946F98BE8639DD914939C1369@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CBGAPhDu+WjnPUKv3kjKnzaFdoMeDPwhzC8LzCUoJo8d4jEn8z5y+uAiFcHFd4ouJXL3lm8H0OOGg0dRqW8UXi7w6Dw9u/K6A/yZuXyTQRRhx9zHL5gpt2hZQUlcRF8cMh842HNGvlZtVhJLZA5MnWvxVyUQ10VR97dzxEeEwjsqOFjVZ+5KApx0UoFLcur42QNnIagGEieutyvERq9CotCuM+fLVrW/WZYULAtD48Ru0LrTdzMSliSGbA+DeQUJ77Kv1ujJMZGEACTYRIujTA9xvf8zCaMOQcRHq88MoB/0EmuVl29+y0z0whixY+ELcpMvAG3w5aT7ujyOlHw6OZvhsajQrIkmK5SohIqhwxaNqANptummIlNkKJoLx7uuAEuUYQ2pF1jrVQn6gt8JKKc+ktTaic29lAebtrdhtdXW1dILUJiLDECbo9NysmrHJyxMCGLfuSCVV4+1bE7QqH4WERcBywTh9CP6XdYNGymJQ/CA9KegYJKqutTVZyE+uDioybMnAV2krGdE68DWnSKQUYsxF8LGEARRDQVjz2D67Fc3RUpF3BYRxCJYBWO7gG4Rhib3l8sXjGbliQOsnzhpLWNqTu9zxA0uiKKhRLTqWLrLTESv9RnUKZPgV/ef9DoMPiezUZKPRMUdrAbeIyeVb8LQbUOm+J5qICJ0qmd5KodnNsLXOUZAdUCPbxL7fx2EL08S/fJ4/ls8H2aKFK5EiLFaxagJKQIn7jJ383c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39830400003)(396003)(376002)(366004)(478600001)(86362001)(8676002)(38100700002)(38350700002)(83380400001)(53546011)(186003)(16526019)(26005)(36756003)(4326008)(956004)(2616005)(52116002)(8936002)(66556008)(5660300002)(66476007)(6486002)(31696002)(2906002)(66946007)(4744005)(54906003)(31686004)(16576012)(110136005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZW5JS3JzZlF0QzJRd0wzYnFKSkdCS1dsUVhMcEdNcjJzN093MzhDdDdRUWQ5?=
 =?utf-8?B?RTc1UVBLU3JST0hyMHBoSEkxTVBDT1hzZ3A3Z3Bickx0R1k4eUxKbEpaSjhT?=
 =?utf-8?B?NHFQaXgxbWEwUXFCb1RyUFhOb2o4TWRqYS9QeUQzRTFJcFFXa2Z3di9SL05X?=
 =?utf-8?B?dkpvbTVCeHpiUEhIcHZLajc1OUtPaWg2WXBBYnErRlU2NHB1MzNpY1F4YXFa?=
 =?utf-8?B?elN1MnRoREtGa1pMbnhUVytoTjdmdFdHbFVOYXRtYkZSa054Y3A3bTRMRnZw?=
 =?utf-8?B?Y3FVREhkeVRiczlMWHVxZDJ2Qi9sYU1WSTNEN1ZYTHRtcW9qV3pzMEZIQm91?=
 =?utf-8?B?R0hSSVhwd0V5cVhDL0cyMVZ6azhrT2NTQXpjdytCemJmdXZ6Ti9XUi9jRnBs?=
 =?utf-8?B?ajhwc2w0cFlxeUVDRFo5N2ZldkxaOSt5YU5VTTdrVVhqNit3ZjBuWVRQOEpX?=
 =?utf-8?B?NDBRaUo4RTc0R0RnOHFtcHBveDIrdE80LzFtN25iOTRyT2tac1lINndrbUxh?=
 =?utf-8?B?NWkySklkRityK3RlUUNsUEdmUDBkbVUxdE9GUTZyMmdqZVNQZnAwZndKNWg5?=
 =?utf-8?B?ZTdDcUhMeHdyQWNoam01Zkh2MkZMcWpzUEswWDQ5d2hHN2JwVnIwTk53Rnpn?=
 =?utf-8?B?TzF2bHBmM29WTkRXekZwRDFFUjRjQkppcW5NNCtIU0s4dkZYOHp4d0hlaDdO?=
 =?utf-8?B?OU9UZ1VoS2dFcUE5WTBPRlpSSDdKNWtoWnE0d2dWTndOb2JqM1N1eVJWck9m?=
 =?utf-8?B?YmpNNTdIbFBkempIN0xRRjV5WkdMWHdxZmFQd2NRdWxPK29HZk4rSmVvaDdG?=
 =?utf-8?B?SWFXMFRSWG12SjBsem1aZXArVjdyWEYvckJFVGpDSDkvbFNDVEdXRlcrNEth?=
 =?utf-8?B?QnBLYnQ1STJ5blk2ZkNYVVBjSUswOFBJVldMT0NNUXIvN2c2MU9wdGo3U0R3?=
 =?utf-8?B?bkc5UXJZTTZvUHBuN0Y4YWg0N1gwRXkyNzFDRHVsYmp2K2xscXV2L0tzU1V2?=
 =?utf-8?B?R3dHa2xGVkpzNzNhNmlsMzcrV1lFUVlxb3BzS1hCdHRWZEpqNEI3K281VkhH?=
 =?utf-8?B?c2cvV01OR2RqcnltQ0pMOU1lQnlJT2ZsK0FGWHFuSEJML1ZjdUh6ME0ybjQ2?=
 =?utf-8?B?MkY0cXFzK2w1SE9McUpKNG93OFZXTXREYUYvOXUrc0ErL3p5TzVXaHpxVnp2?=
 =?utf-8?B?K0dISzBuNHgxenRjM1dLamg2VGg2UFM5TkxDRm54SFFIcy9CaEVlQzdLdmtp?=
 =?utf-8?B?NGFWakNIL3F3MUMvRDRNakg5Z3N2VGxKZ1VwMEI2ZFdvYUVLV2xYWG43YURV?=
 =?utf-8?B?V0I5emhsZytiOVhSeFA4MzZvaTF0bXhEcXl0bklpQlo1bStSTlJ5T0VtbEJK?=
 =?utf-8?B?SHNMMXRTR21UZkdmTkdCNUN5ajh0bjJZVlY1Ui9ab1lWYjBXVDFFZG5ITUZQ?=
 =?utf-8?B?TDdQSlNTejFVV2RZNlRNNVFOYUpxL1B2WUVtR2F0Z1ZXaDNhK2IwYXltQ2Vn?=
 =?utf-8?B?OUpxVytIREh1VGlhUnRZUWE0aGJtdThqdzBpYlcrSHpYc2xtK2ZlaUphUnNI?=
 =?utf-8?B?d3RzenYzRkN2UFp3Umc3aXJiOG9HVWlmZ3hEaUhSZ0F4NUtyRk1lVHpvd25I?=
 =?utf-8?B?NUprdGhlWHRHRDhrUkpDUFdBUnFzdGpST0VhVWY0WXB2NUp4NkVDV1BRTUxK?=
 =?utf-8?B?c2loTkM2TU1oQ1o1ZzNDRVZzd0haSEgyVVdKT3ZnRTJtMGk2WVhiUFhiZkhr?=
 =?utf-8?Q?lULgHuuw0MJHpRp3ADyJS3gO1/I7U0NZWvX092Q?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6348b9bd-ffde-48cc-9033-08d92b34f328
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 10:54:26.9024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jra6J3MIFQqCeA8PXS/uDKI8P6AxkvW7PXSjAe2jDQ+CVdz4ddUF9nPNZ46577IphgGLwBEVYJhWPhKBxZ+z4m/y5ONHi2RxEXDZp3GUlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=40.107.15.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

09.06.2021 12:33, Paolo Bonzini wrote:
> On 09/06/21 10:51, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>> +    default:
>>> [...]
>>> +        bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
>>> +        ret = bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
>>> +        if (ret < 0) {
>>> +            trace_block_copy_read_fail(s, offset, ret);
>>> +            *error_is_read = true;
>>> +            goto out;
>>> +        }
>>> +        ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
>>> +                            s->write_flags);
>>> +        if (ret < 0) {
>>> +            trace_block_copy_write_fail(s, offset, ret);
>>> +            *error_is_read = false;
>>> +            goto out;
>>> +        }
>>> +out:
>>> +        qemu_vfree(bounce_buffer);
>>
>> label inside switch operator? Rather unusual. Please, let's avoid it and just keep out: after switch operator.
> 
> Agreed with all comments except this one, the bounce_buffer doesn't exist in the other cases.

If keep it as is, worth making indentation for out: the same as for default: ?

-- 
Best regards,
Vladimir

