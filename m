Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5482B348A4F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 08:43:48 +0100 (CET)
Received: from localhost ([::1]:46992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPKeg-00078C-SC
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 03:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPKdU-0006cz-Or; Thu, 25 Mar 2021 03:42:33 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:17648 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPKdQ-0005mM-MO; Thu, 25 Mar 2021 03:42:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOpEyhd+0TpHIhfny2842t2v7yifUXyqToJAYNCOW7lcnvy19viK6X+k7GwWQKXT4PQvjnYUYas36i4X9nHweSDDMHt5AC/2X0GdEuT5YZ6O/hSTU62rCP/6U8Ffhl22W20gh61emLM52HPpIuZME2zrwAbtqFeTXvtPLw9MV6wElYpSRa5tcyvCjM/94K+DAoDCkfA+oKqnuVnyDVHtV3GqqF3hd61UEki1I89GGHdqeuM/BhrvT+Nk9UxCGBY7aLFW2ybnNsDhc429JqS+miArtRQuUnFRUWkDL+Y2gebh8+i6Y+EL8ZSKvgFnlvpeibjKNeNhfHQvXqWlwOP8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtHm2nWsIArQa7vXEONgCbUKa3gObSsNDDd12eFO4K8=;
 b=ekHk9SxeA03u7poAuGxnLtj6h2qMNJvFTZBsG3u+9Hl40+CeDPuX5LM6ml1nzFTgs5RlIL9uoVoXJfiDUO52vkzOUc5BDbFFe3QC2GElGT1p7LPVxh8/O7JMrIHyzHkUrp7Q+V8G/4VkzaMc7aalQl2LFr6Bh9ZAue0LBz0I4aVHwFBYMNspXooUXqmrSubp6TUlXDzivEMQ5iN2eNGlV/AxXJSr1SMooHanSr5UxsC3n90rpduYPEvN2U8KqRI3uVrGW/zyzVMGj9Ot2Kt2zcOsKpayjN6SfdUS3ap8g/iSJL9tYQ3zcZ4X3qpuiDbIt9dN4qJ6jTdUKXvK6IBuwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtHm2nWsIArQa7vXEONgCbUKa3gObSsNDDd12eFO4K8=;
 b=RSZbQ4eRNI6Aa6UeJanZVABa06j0lpUhmkSbfKtDm0NJ0mRmFcGQXV3Gx4SV3YRZoqJfh3o7n/XqPhmvgg/nspHaDq+ZvPptWDQsfs+XbGFHtgY/ywG81v0cn1vF4QXPkGixw+53WaovPiJRm8sSw7nX8Z+d0AuEkpUYBjgEhUE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3309.eurprd08.prod.outlook.com (2603:10a6:803:41::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 07:42:23 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 07:42:23 +0000
Subject: Re: [PATCH v4 00/11] 64bit block-layer: part II
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com
References: <161662043558.28197.16335181787861259759@72b6d80f974b>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0198241c-8a18-7e67-facb-47387b131fa8@virtuozzo.com>
Date: Thu, 25 Mar 2021 10:42:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <161662043558.28197.16335181787861259759@72b6d80f974b>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR08CA0026.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::39) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:208:d2::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 07:42:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6186309a-ac9d-449c-9c15-08d8ef6186e7
X-MS-TrafficTypeDiagnostic: VI1PR08MB3309:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3309B1351E61B2C9D02E877BC1629@VI1PR08MB3309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k4Cto9JQ0yhjknMJUDQvqjaE7BPAwkwx9p3KVK6/SS03swl97LKTgq/Fjs8sexx/aeQ//5lTehOZ+0XytYfESQq0TnKQbvsNFSBk7kKnTfcMdLACYOU3hvWrKON1GqYQxY4QHgq5sEu6y716fbYrFp64llLHqdO7mtflUPsqZUY8MBWFOk56azmv70gxK7Uf1g4aeyh8HDV5kE0WFhVyt+CgWaaL+y8x9yYJ3w9cIlaCNp4pN2FP5hwF5vvsEkeXfTuhatdVe5Ls3u2x4e03vArLysV1o9rMOoR4XeEcKOMsum3W0PtIK28N7qNb3gRqw1AePyb2bKCIQRvFInN3UfUqItlFJfHR5ra6p/tZrhlkCSnn4F0/GSK3xwf4yL2U1cPADRGAXWSDqeHetYh+0q4rQJ0LjAtoTsZvczSIZo3+vOsoTUTpj1yeoIywweeoYjAONQozaQDHhptlCaA3t/PgsdMrFFKam1ewxhFhCnwAgGnyeWog7TVqCDHZSO/sr593KJHR7NVF8kDvfmQ34Om9jAQr/btK3J92O0WP0UgOQYgKx82yjdULrM/rSIqzktAL0RB5OcEMblCBBsLLORe3ZggxEcu/mMo4IhR2ZXSlUu6E5QkyqRa2HKyUye8V6PtGx7etD8pUWNwDxCT0/NKvhXTelgtElTrLjFdmpiBkBE2TiRlNXYr1Wz8HS33X71665AMQFHOJuwrwa6dd5S9WGMTp5Q68eXHgDR3d5NWBK4FQJ5SIhXe17uLH6P+kdF7yQECYHje1h2NEiY4VV0HRe/EhzEoSH1fMifoX9l4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(498600001)(52116002)(6486002)(186003)(16576012)(7416002)(6916009)(26005)(966005)(2906002)(4326008)(16526019)(2616005)(38100700001)(66946007)(66556008)(86362001)(66476007)(5660300002)(31696002)(36756003)(31686004)(8676002)(83380400001)(8936002)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDVYYmFwUVhPM2tlcWhJdFc5QUltQ1pDbzlhM1VEV3d4S0k2cEtQd29yb1Fx?=
 =?utf-8?B?WHduVWk3M25zMElWcGttUEJkNTRmWFZma1VSSEZpc01Lb3ZiN0IraW1Xd2dT?=
 =?utf-8?B?N0hSSU4raWRhcHF6dDh0YUtPSXcvUFE3QXJYaU03QlNka3FHem9IV1g0dUdy?=
 =?utf-8?B?MGpZcHFkbEJlSnJVMElScEt3TG4waWQ3Vmx1aFU2QUVpZDgvRnU3Z1ozYVdv?=
 =?utf-8?B?a0c0N3RWU0lmNnZvUmRaSkJ3U3BhajlFZ29JeTJJVFlXcnhZUlJGQ1ordVpR?=
 =?utf-8?B?YkdVQzkwYXlqSy9xM3FBQzFUMjU5a2pjWGdLSVlWNHNYaDdneGRxWDRsSGJL?=
 =?utf-8?B?T3M2WVdKUytWWXJ2ZGhTVDVReHMxeXQ1NEFhLzFnTE16V1RFNUhTK0hhTTRo?=
 =?utf-8?B?cEx5NVRNaW5TWFJsdDFJc1U4RDJMMUZiUTBOTUlrSE5KTUQ4THp2a1dqM2Yv?=
 =?utf-8?B?Nk5vYzcvR1lKTlprTW5maE1KbGdnYzZLRWxySlg4ZDFBU3lqR1FBd0FndEs1?=
 =?utf-8?B?R3NrTytadHJxYjRIOGVoNHYyd0pQQ2VVaEtoOWxIeUxianFtM2g2WHkrK09R?=
 =?utf-8?B?RXZRUlQwTmgzM1hadEFVMkl6SkZDdTBVcGxoUzl6R2d0SW0vUFJ4M0RoN0hx?=
 =?utf-8?B?ZXZneldBdHlhR0NNM1QwUVVGOEY5Q1JFSDNMaHE1MlNHbzlvK05KV3pKU2pi?=
 =?utf-8?B?SjNSUVV3NVhIUmwzaFk4eW5pMXBmOWlJeWEwK09BQXVMaGRxTlIzZkhpUkFC?=
 =?utf-8?B?NEdwKzlSWXM1dTlHRGhxR2xzS3I1bTRVY09xYmtySnFuS3JlcW0xL2xDOVdO?=
 =?utf-8?B?VGN0bUJXeXF5c2xMQmNKMEtzNjBqaFZ4V29CamU5Yk8rQldxai9RTDVtY3RK?=
 =?utf-8?B?ajNOK0lwMURrV0NHWldYTWtSczJ1cWkyelBFL3lvQU4zUFRCOWFDNEhuZU1h?=
 =?utf-8?B?aFB4M0FqT3RGZlYyY2NjREo1Q2E3NEt4dFVZdzJEaURZTW5QSHZSVnFSYitW?=
 =?utf-8?B?WDVZVUV1MTVoMEpTUmJuMlppbVpJdTFwZ0oyeUZuK0xXajAwMlJGbmRES0J0?=
 =?utf-8?B?Q0VtU2xJN1lNamVBUlBoMGE5blZrZjVyNUFJMFl4cVFKRkdTVE44S3ZRc1ds?=
 =?utf-8?B?WmJidm9xVlJGaG9lMjdyd0o0NzNETGVpZkt3b08xR3B4a2tGUTBMMXlxdFcy?=
 =?utf-8?B?N25yQ2dhVkhKV1ppYUJOZ29TalZKZHhkQkRKQ3crOVhpcS93eE05WEN1Skt5?=
 =?utf-8?B?U1NGRGs2KyswYXpxdnRuZlJmS2R3ckFxMTZpdjNJODNYSWtnem9wZkpNdXdK?=
 =?utf-8?B?eW9ta1VXM3hUUndJdUpmemFOQVJVcUhPb01mcUp0OCtWSGRwcFluQVBldXR1?=
 =?utf-8?B?MThMM1QwVzRIOHk5OGRnMTdRcTMxTVNzdHljS1Z6KzcvQnpxTFFwS2FJb3ha?=
 =?utf-8?B?ZU9RTTNvTjhiaUdkVnppQ2FlQTdRc05GeWZ5Z294Y2k5K2tQTmgvbDA0cTFi?=
 =?utf-8?B?VGc2eG9Ybitya3dNcGRuckFUbGdzZi8zUThWN3hFQU1ia3VDN013S1liKzZn?=
 =?utf-8?B?bGw3ekkrNys4aElSTk9tWE1UeVh1UUxKOFA4K2NmYmF6bWtHN2RJRy9xSmw1?=
 =?utf-8?B?NEdtR1NJUmpMbTcxbGdZMmVZZllsNm9zd3JyODBDUDNpMU9HSUE1am9sZzVJ?=
 =?utf-8?B?RHpZcHBmMUVGMkdIQUlIOEhEWWhDeGc0ZFdCVkFNa1o3cEs3TjhueVVlZkd4?=
 =?utf-8?Q?WHyy35PXuxXU1kLUYZftGRXp2PHYFb0O6+K2Ecc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6186309a-ac9d-449c-9c15-08d8ef6186e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 07:42:22.9944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NnuERP3LkVheEG8t1G1EXamtzkyJDHvXzpNEjrzN2sKoJbiCnF/Viwsvhw3VsiBxoZQpjXgqWofouBGBUHVrQQBFv95TlHrzbmMtcrDbA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3309
Received-SPF: pass client-ip=40.107.7.123;
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

25.03.2021 00:13, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210324205132.464899-1-vsementsov@virtuozzo.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20210324205132.464899-1-vsementsov@virtuozzo.com
> Subject: [PATCH v4 00/11] 64bit block-layer: part II
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
>  From https://github.com/patchew-project/qemu
>   - [tag update]      patchew/20210323221539.3532660-1-crosa@redhat.com -> patchew/20210323221539.3532660-1-crosa@redhat.com
>   * [new tag]         patchew/20210324205132.464899-1-vsementsov@virtuozzo.com -> patchew/20210324205132.464899-1-vsementsov@virtuozzo.com
> Switched to a new branch 'test'
> bed608a block/io: allow 64bit discard requests
> 9b3b5c7 block: use int64_t instead of int in driver discard handlers
> 9d5776f block: make BlockLimits::max_pdiscard 64bit
> 1dc4bab block/io: allow 64bit write-zeroes requests
> 05ca540 block: use int64_t instead of int in driver write_zeroes handlers
> 5864b0d block: make BlockLimits::max_pwrite_zeroes 64bit
> 9698c13 block: use int64_t instead of uint64_t in copy_range driver handlers
> 4e60566 block: use int64_t instead of uint64_t in driver write handlers
> 8aa3af1 block: use int64_t instead of uint64_t in driver read handlers
> fc695f9 qcow2: check request on vmstate save/load path
> a13a9ef block/io: bring request check to bdrv_co_{read, write}v_vmstate
> 
> === OUTPUT BEGIN ===
> 1/11 Checking commit a13a9efd128c (block/io: bring request check to bdrv_co_{read, write}v_vmstate)
> ERROR: Author email address is mangled by the mailing list
> #2:
> Author: Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

That's a strange false-positive.

Look at 1/11: it's not mangled in any way. Looking at the source I see clean "From:" header:

   From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

And there is no any "Author" in the message source at all. "qemu-devel" is noted only in Cc: list.



-- 
Best regards,
Vladimir

