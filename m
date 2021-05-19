Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FAD388C7D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:16:10 +0200 (CEST)
Received: from localhost ([::1]:46934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljKBN-00022V-Db
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljK9R-0000hx-Kq; Wed, 19 May 2021 07:14:09 -0400
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:36262 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljK9O-0000c6-9j; Wed, 19 May 2021 07:14:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIK8YSzLbwBoOwWT4AAMoW5nl7rJmPceFOhdxVP0cI1gR28M8yIDUgzsbJFw3oAwYzplbgIJOHz4urrAwgkZKaJsLT1Eu2z236CVLn2yv1e9AjduwoXHXvnC6Pn8DYlSEgTDh3rwXHpgw4QNAyNlyfEAy/uOqn8+WABniVcly6wyP8z2Zbe1vRo8bdEzkK4mZ0OM2Spky8/y0Fify74sAdbeDRLirHf3HSm6feJ1ZqS3k8tfaePA2q7dB3nIjbWG/BHyICBytRcyImhcaohxz3pTv0SUQFdR32eHGFFosADdycC4uIEGhIeihJ5wYaCgLktE9V1FbpA7q1nTroqeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJbZTy1WYZ3YIUFu/xKhfc9qSi5xnTW01UfthUGRBFs=;
 b=j6FF+zE35m+yE3sMKlzwXk7WkordiXvJZVvSUQpWxQVMIdfqvBVRAIIX28AMREWPzYw0Ppb8F0ogLfxsZwBfFE/ZNklHQyGTAnDXsi0im3cOokhyxNCCPue/TCOm1Vg2X8Y/2tHXMcqgH2IlFn52riG7pmxwa89XiSmXoxBobujdgQSpYiCJAQ1YRMcX4RcLuVZRimNMzfCsn60TCOJl0NurhI4pJevcuEHNKaBDaLr1B/SA3af+5ZPq6/yHVN8AjkI4NnB0PfLWJywhJVlVg4OSUFpwBD1VPtOhHUWq/LyNMpadVDeL17my3tDq0vRqPrEHgcGSrmIpQX+DzsjR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJbZTy1WYZ3YIUFu/xKhfc9qSi5xnTW01UfthUGRBFs=;
 b=LKcb7e5SaS5E8onFIzrMtvQ6mZh/rgfr+MCNWWauaglkYvJ72Cto6nCQIupGm7GE7HQwbYZJy008yJfTAEM3OoaVtdh5Hk9eK1V/PIk4m5Rn2itXMtZFCZd7eVtpio2RQQ4AeRAZRS7wPdPDKhiq0Hz06RxRRr1OKRZLdbGT4f8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6470.eurprd08.prod.outlook.com (2603:10a6:20b:33a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 11:14:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 11:14:02 +0000
Subject: Re: [PATCH 01/21] block: introduce bdrv_replace_child_bs()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-3-vsementsov@virtuozzo.com>
 <ee302de8-bd22-b43c-f30f-eedce438d825@redhat.com>
 <7291edd6-f5e2-63d3-0633-9d55fd14cfc6@virtuozzo.com>
 <92564eed-8787-9720-210f-61cd8379698a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2915e984-b1e1-012c-4289-fddb9e496a32@virtuozzo.com>
Date: Wed, 19 May 2021 14:14:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <92564eed-8787-9720-210f-61cd8379698a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.218]
X-ClientProxiedBy: PR2PR09CA0021.eurprd09.prod.outlook.com
 (2603:10a6:101:16::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.218) by
 PR2PR09CA0021.eurprd09.prod.outlook.com (2603:10a6:101:16::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.33 via Frontend Transport; Wed, 19 May 2021 11:14:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0719471f-1a08-484e-0d1a-08d91ab7352f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB64700DBEC83FE812A0060330C12B9@AS8PR08MB6470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fywRhXCPUuAJTs/huOkCaebvqy33Fc4k6s+WzUud+3uRNC+M6OfuL/h7xiXA7Yf+2FFAaE6rUEfJ/HNFGofvI8iTFfFM+kimPw6dCrFxKO0th5rEgW7dMeH7XSdwNotMxpaZsWchigKCipXj8zT75boG0h1YVwsQO0ONAMYf3E6KrqOGgvxvoqYWJwgXr40o/7EQJWZqszTAuSrY2eLu+78vUDbVtT9UXoxtqIXF65Yq8yg0oEnKDljj99qqhMx1t+joaEMkvO2p/iEWXjd+l9dGaqM322zBs4h6TogU+ZGiirYXbKWaFKS/m1SJJ17/byGUALqGSkjA5N8isyji3lKE8dUyAkqY35NXq3yZYaa5mTserPsUZUPRK9eUAy/77hCrquxgrgfxSss4tJYL4rbS+/c40l7Gql9EcVMJNc7jN69EsfTnfSMTb87j3M2tHfyUZYS7eBoiRcOdEKqj/8+0EHD+0ZgWfKbqRlQ8F7LdiD9N+EM0DMhOe5W4XwtHzsbaZUTDzW025RZwxFOF9EU/peUr/KH8jzl/CdtAqSIglB55SpmEmpEGIXzUAmrV/v7o9CJe4E9Y0K/rfMs6cv8gUCPry45uEqnvNcPCGeKEbCCzvwC+ZjqYpUNezZCbRRAK8kH/RZ8/kRZS/UVETJSx+bLk+osWeG8Z+ubnP5kAeoxEicUoUYlNlu+IrcdBJ8NU00WNN4HslilcJSQtwjgqWkvRfp0YMwif9/yd01Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39840400004)(376002)(7416002)(31686004)(956004)(5660300002)(2616005)(107886003)(2906002)(53546011)(38350700002)(52116002)(83380400001)(6486002)(26005)(4326008)(38100700002)(8676002)(66556008)(66476007)(8936002)(36756003)(86362001)(186003)(31696002)(316002)(66946007)(16576012)(478600001)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZldSWGVVQS9xQS9vM2hzSUpNOHBhazhnelNXT3hKcktrQTBLVUdBTTRBQ0F6?=
 =?utf-8?B?bnNCWlJFczdqdTBuLzJST3krZGY1SldPdU5VcXhRR1lYVmJ3OWZNcFRVcWo5?=
 =?utf-8?B?RkRFOEovUEY0OEN3ekp5SmI5SGQxRW9SNStYQmgrSmIwNGpLeUhWVmpBVVBV?=
 =?utf-8?B?MnVXT0VlVzR0UVZncHRyWDEzbGdYSzIzNVFHaG4rSEdoZjU2RjFpM3hYMVJS?=
 =?utf-8?B?R1VYZWdmd2p5SUg3Vk82SU5VOHdPdURZbEZIczUyMG1Jc2I0Z1l3V1ZNaDZh?=
 =?utf-8?B?S2tPaXk4bW5NVVZpem9jc0FzOWkyU3RRSVEvZ0kyZG13cWFVRjFSNG1TSlAv?=
 =?utf-8?B?OE1RWmlMWVJrbXRKcHR2Ry9VblcweUFjR0RhZVBNenRMZ3JXb3U0NEpkczFI?=
 =?utf-8?B?TGlPR2FSeTBCT013OUZNQjgyL1htd3JJaTh4M3ViRmw4Sk5zY2I0bEJMbkw2?=
 =?utf-8?B?RDlKei8rNi9qSDdTZ013L0t5TW1NTmFoZ1ZvQlpxUjFvWnJpLzAxN0R5cFhH?=
 =?utf-8?B?dk1kY2xTdUxJK2o3NU4vV2wzWXdwOXk5WmZZbXlicllwb3VrUEQ4aWlTMWYx?=
 =?utf-8?B?M3lTYUFpZ2YzRjlpUVJQa0hwWWVtd0tJbUlvSFEyNlY5ajd3enJhQ2h2bGNC?=
 =?utf-8?B?L1NVTjBzY3lEMU4zakxJUnhMcEpYcURtM3AwbEJIMmJ5RXhOU1lRV1duaCtR?=
 =?utf-8?B?ZFV2cXh0S1ljRDhWLzRmRHc5ZUZxNStKSXBreFB0eTlMRXZ6dUp0cHB5SWI5?=
 =?utf-8?B?dlEwNUh6WVErN0JlZlhIelZTUEZJWnpzRCtNeE1jVjVZaUd5bnpaYzNML1F2?=
 =?utf-8?B?ckVPMFd4NW8rem1QM0VaRUlRZG1oaUlrY0UwL2VXUWtaUHZoMXFkVVFDZkFG?=
 =?utf-8?B?QzdsbXVTTi8xNXhLeUV2Z3hYU0JrMVJwT0hVNi9mRjRaZmFnNmhjTUlOVTV1?=
 =?utf-8?B?ZmpmVXJWbndVbjNSM2d0SEhod253b1pLTDVzdkxsTTMxcnR2VDE1OUs4bk9j?=
 =?utf-8?B?UittbGhFbVNMSitVOTFpWXZsZkZIMUdET0hNK1VmRFlLZUVrYTE2dW8va25w?=
 =?utf-8?B?dmV2RFE0SllZN01hSjg3QWd1dXUrbGl1V0V6dWNBZkVzczFRTDZ1M1RIbDhn?=
 =?utf-8?B?UkVnL2lnb0cxQitsajk0V2ErSEZUZ1psYWt5RGFXUHFjY09BUDIweVJKcXM0?=
 =?utf-8?B?SlVEVEU1bFBxZnhLaGdpd2dVL3dKOTNuYmRxekp3WFYzM1lHYnoyUzhWOXM5?=
 =?utf-8?B?R3dDdUJ4NysrbisvR3B3aVFMdFdKeHRpdmszdVYyalJITUExOGZRTnhMaVFo?=
 =?utf-8?B?RzkvcnNwS3pHNnprM3g3WE9iUnl0TmZKbElkVm1NZVhEWWtHQVhReVI2Mmxp?=
 =?utf-8?B?R3N3RnhTTmdHNzFiaGxrTm9zMlJBUGMwdEFkUHlpQk1qWDVQRC9CVDI0VVRC?=
 =?utf-8?B?d1dRNWc2QStxbTQ1Z3Z6TjVScjFKV1BvRk5tVUFrRlhFSzhEVnBUdERNakpZ?=
 =?utf-8?B?REFGa05Ja1J1U0FTNXVwS01JZUVhR3U2R0lMLy9GZnVFMXF4ejVwa2FJY0VZ?=
 =?utf-8?B?Nk5LcGVtdHFucmhsN2RhLzh3UnU4cGo3SjRrSllmS3VWYjF1QlFLcnVDT3d2?=
 =?utf-8?B?dnB0UCtxL05pUTgvUzNBSjZVa215ZkMwb0NFYXB0d2dpUFVaSGkrWlFzVzRk?=
 =?utf-8?B?U1JhWFp6Q1BNRU1KRzh2OTltdnZ3djNqdGkyM0tYdnFWWWVyNU9nbnhxWnU2?=
 =?utf-8?Q?RkxanveL7QEK0Q3L2YpkTMKO5zn/2xbGDc0mR1p?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0719471f-1a08-484e-0d1a-08d91ab7352f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 11:14:02.4005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBmPnT0z3V1jxQwm3gfHcensuMtfjlBT8vzjZt3KR6Bh3FpDbnGF0hj32DYSL4ODYIg8mwAGCOOpMV4NpMfKqANx0nYNr8NBTKzZ9MhZpqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6470
Received-SPF: pass client-ip=40.107.1.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

19.05.2021 14:11, Max Reitz wrote:
> On 19.05.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
>> 17.05.2021 15:09, Max Reitz wrote:
>>> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>>>> Add function to transactionally replace bs inside BdrvChild.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   include/block/block.h |  2 ++
>>>>   block.c               | 36 ++++++++++++++++++++++++++++++++++++
>>>>   2 files changed, 38 insertions(+)
>>>
>>> As you may guess, I know little about the rewritten replacing functions, so this is kind of difficult to review for me.  However, nothing looks out of place, and the function looks sufficiently similar to bdrv_replace_node_common() to make me happy.
>>>
>>>> diff --git a/include/block/block.h b/include/block/block.h
>>>> index 82185965ff..f9d5fcb108 100644
>>>> --- a/include/block/block.h
>>>> +++ b/include/block/block.h
>>>> @@ -361,6 +361,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>>>>                   Error **errp);
>>>>   int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>>>>                         Error **errp);
>>>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>>>> +                          Error **errp);
>>>>   BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
>>>>                                      int flags, Error **errp);
>>>>   int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
>>>> diff --git a/block.c b/block.c
>>>> index 9ad725d205..755fa53d85 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>> @@ -4961,6 +4961,42 @@ out:
>>>>       return ret;
>>>>   }
>>>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>>>> +                          Error **errp)
>>>> +{
>>>> +    int ret;
>>>> +    Transaction *tran = tran_new();
>>>> +    g_autoptr(GHashTable) found = NULL;
>>>> +    g_autoptr(GSList) refresh_list = NULL;
>>>> +    BlockDriverState *old_bs = child->bs;
>>>> +
>>>> +    if (old_bs) {
>>>
>>> Hm.  Can child->bs be ever NULL?
>>
>> Seems it can. For example we have hmp_drive_del command, that removes bs from blk :(
>>
>> qmp eject and blockdev-remove-medium seems do it too.
> 
> blk_remove_bs() doesn’t eject the BDS from the BdrvChild blk->root, though, it drops blk->root altogether.  Doesn’t it?
> 

A hm, yes. What I say is that we can have empty blk. But probably we should never have BdrvChild with NULL bs. I'll check it


-- 
Best regards,
Vladimir

