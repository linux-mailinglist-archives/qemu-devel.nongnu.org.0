Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14652F4824
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:03:16 +0100 (CET)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzczj-0003uY-8F
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzcwE-0003Gj-Kv; Wed, 13 Jan 2021 04:59:39 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:62912 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzcw9-00084D-L4; Wed, 13 Jan 2021 04:59:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6//Ougsjb3P3Dm6fwciZDY+pmKejis4Xhsyv5rDYWlEvkanCgnAyoZfgf3IPJCOKdZ7SdrG8DgOFziYXA03vFtIcRIf2Dvgm9P+gHpm+ZATl2fHhKrH1ML78C/oOTfYPUJvWgtc65Z8sJlalR8AG/lNtRJXWnP8oleb5sML1j/e0LmE/HCKqaBZf+Dxmal7IH98ORZ81ScBe7F/MyO0ZxrdMLl4WdNUGNb0OnGm2RRqDb3wqYcgESZeiVEIEljQx4J07yAYUdc4Nth8oh/C8/uE7dBHdA8UUxpFpWGfD9Or2iK3VusWTqAwYWgxoPswRuR5nMLiDeD84W8fbJK5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLOa+UG1+2s1ZJNIm3LqHHH6xvUBMaMBBQ0GrLqiNNo=;
 b=eQ+sz27g6sZ8jUJODSyJVpqQNSMZ2mqLu/zEk9TD2A5uS6cOTUfwA//0JsRw27slEAA5FLqoS+X2KZQkTPPqU56LJOCZTS2Oc1lkd0Za5AWA/+uO1xNMC2NaDsQ2+ks0/YYQq/6eJzFdCxz9/h7bEQoxdBf2BTEbp993DdOJLSEFPmEeYh++tKh6kTtT0bxTsVJS+RFw7Ltrsrac2eI+C5UZ+CXgjl6kJAk2StEapM+xOu9p04AUvlCJ6yHlfxS4gqAOO/F9vaneizS9M0RLm1sxp6hXGF6Nt7QdedPl0kwLJhuhG0ZBHpeY+qKV7tW9hFiPzOA9jV5gFBi37Fw8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLOa+UG1+2s1ZJNIm3LqHHH6xvUBMaMBBQ0GrLqiNNo=;
 b=YEQzSInLAU2u4W3xr3Q9svje/PjgGD0ogoe1SC4QKUsJqAjhJBr68lGHG8g1bE4wyj1fDlGlUzaVi0bNvnCl4GRNpFcjSEvKpwFgsOdcf2c8XVmBms1Fxzx94qZL81pJlQC3013WROVIjA/onph6MtzsK/IqK5dDASN8AbSg2VA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5383.eurprd08.prod.outlook.com (2603:10a6:20b:102::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 09:59:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 09:59:30 +0000
Subject: Re: [PATCH v5 01/14] block: return status from bdrv_append and friends
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
 <20210109125811.209870-2-vsementsov@virtuozzo.com>
 <w51y2gyukum.fsf@maestria.local.igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <167d8f5a-3948-8d64-4cc4-c42f90b0b114@virtuozzo.com>
Date: Wed, 13 Jan 2021 12:59:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <w51y2gyukum.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Wed, 13 Jan 2021 09:59:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46f04823-f899-4326-44f5-08d8b7a9ebb6
X-MS-TrafficTypeDiagnostic: AM7PR08MB5383:
X-Microsoft-Antispam-PRVS: <AM7PR08MB538339D23FB51BDA9C4D909FC1A90@AM7PR08MB5383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y2XmsjtV0g57e1xHzIKvZFCFDDEM/yLy8ZLsfumRvFhDlTKYU4LFX4tn/h5vfj+6mllYpH0nAkrbrukJV8bKu8FnLDuGchvUBPIGTY1HRzHKAuyZE51vApgdCTxWdqA1jDt1cyO0sOnrkjIMAxlOetcNXgYtPI686YBg6CnDxssu9rfJuAAcy+a7p3B7Fpul0zQhVwPdGIRh4Ug9v95b4lHDIjvRBMl+mkGbiicU+E3wwSB+ARcL70IyvDubfOUPm3M/o7hwBU9Beo5WzEN8b+RM6nLzj+lQpyPgeI6Zf+jR1Kn0fu606+UUPdsDec+fg50rcuMKXulticNgxAc3y/3HmKeX5rjmmZ5rbCNtNdjoC8y9zDu34V6A4+bwuLt+PCPLuxaROmQFLcPxBpJPhSYze+NRnmfIUNQvRh3nBsp+5cIVkHW1/MZG5l1QBJf6qRFWPinglOPtQm1Evj9XfiOv8Ia8zoKUQMMHyjuHnsM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39840400004)(2906002)(83380400001)(66476007)(5660300002)(6486002)(31696002)(316002)(7416002)(16526019)(66556008)(26005)(86362001)(2616005)(36756003)(186003)(31686004)(52116002)(956004)(8676002)(4326008)(8936002)(66946007)(478600001)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVBMZTZMaFRSa1V5V1BWMGdFeHRkcElsZVo0VDBxVFJmaDFwanBPWUxOUllh?=
 =?utf-8?B?TW90Njl1VFJWTzlZVG5LNXByUlJWWWdjV3hEbE9vVnpmUGJvRUNwbGVqM0VO?=
 =?utf-8?B?eTBiYWZ3YkJFNW5Jek5ZT3NXckpaOTdhM3NvbTg4ZkJ2UFB4RGNJWVhzZ3M0?=
 =?utf-8?B?cGVwTmdxRHNYYXJhQVM1Q0I2UU56UGNEU3c4RnhxbXBNcFE2RnQ0d1NXNFQ1?=
 =?utf-8?B?TmFyMnFGME43T2hWZlBGRVdFdWZiTXdidysvR3hVN2d0bWJUdW82MTFNQldC?=
 =?utf-8?B?dmtIaHhzL3c3TWQvZzMwdGVkRDNnZXlZak5LbFZvc05kQVBmYWJ3N3VMWGNB?=
 =?utf-8?B?NGtFQ1JsNGw5UGJXRGtZQzBaNDhNZ2VaU0FXSUFYOUl3SkJSbzAxZStxRWlJ?=
 =?utf-8?B?RU9IR0hTckFldFJhUitmUTdMR1V5WVozMWhNZDRYcFJ2SFRxeHVQV2pQUFB5?=
 =?utf-8?B?dmdVVmJ0VTlUTW45Skh2UEN5clQ1K1hhYmNHQkU3Wi8vNHpmaFNPVTdHU0lu?=
 =?utf-8?B?cUhIUHNZZ2ZZdWZxdnI4TW9jQWRSb1VWVFA2Y2VtQWVIQWR1MVBrUlJhZmpJ?=
 =?utf-8?B?OHUyM1ZMcGw5NHBKT3QxMHgzU0lZYm5IcGozS3lVemwra3dCWUhJRjFXRXlI?=
 =?utf-8?B?NStCbW1qRkVXRDZQVzdnTmxmbmk2SXhqM1M3WlcxODUwVUxaS0MyV1VkaTJJ?=
 =?utf-8?B?bDlWUDB6eFRGRjB0K3NNOFJhemViZ05tQ1JBbWsvSWFFS21rQTZVV1Y3cEJP?=
 =?utf-8?B?WnhHaThWbm1QeEtTVHpZVmJGZHlPOVJ3NlRZRjZEbkFuSjBNRzhEYVlTaVJB?=
 =?utf-8?B?UFNpU1g2dVgrZTM0ck1TeXNIRXJkZXBCSEV1U0owS0szNXNKdkhQTlhmLzRV?=
 =?utf-8?B?aEhBY1NMbVo5STNPR0s4dUt3QWFiNi81ZlhMbjVoRkh4ZWJjaktOek1pcmJn?=
 =?utf-8?B?cGdFSFAxWnpYNmUyZ3ZnL094WWl6U3BRbE4rMXpOVjdRM1FDRStiWVptbXBz?=
 =?utf-8?B?SlM2STViek4rSThMeHRvU0tjazRMM2FPZk5TR0ZrRHVBN0hrTlYyK21iN3ZL?=
 =?utf-8?B?L0pibW1RL2tQRWFLekw3T2lpNktTNUd5Y0M0eHRmTTcxZCtpdThuMG50V3FE?=
 =?utf-8?B?ZDR5NjZ1U3kyekUyUDFaQlF4WVBLTHBOZlZ1MDQyUGI4dmRVYXpVZTM2QzZM?=
 =?utf-8?B?aUxvZTdNSStWMnN4Q0tVS004UkFBa2t5UXMraE5qNUdhUm1xU0czY043YXBK?=
 =?utf-8?B?UzdibXdMWGNoNzRqWFNHV0RxSWxTMUx2cDByL0xxM3l2cEVLV0V6VHBwa0o5?=
 =?utf-8?Q?rAZFP84YJAO4p6EdwPntrCvob6blzwrqYT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 09:59:30.4075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f04823-f899-4326-44f5-08d8b7a9ebb6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFEPhwaye5qFinSDM2uW5f96p3inGJ2ypwitEyM9VwHfonEWoX6cewC7gfH+PZSGjAriuZQh78wNn/6V1a1qUuDm1Ht8qYatTS4Q/o4BWhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5383
Received-SPF: pass client-ip=40.107.22.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com,
 jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 20:27, Alberto Garcia wrote:
> On Sat 09 Jan 2021 01:57:58 PM CET, Vladimir Sementsov-Ogievskiy wrote:
>> -void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>> +int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>>                            Error **errp)
> 
> The indentation of the second line should be adjusted, shouldn't it?
> 
>>   {
>> +    int ret;
>>       bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
>>           bdrv_inherits_from_recursive(backing_hd, bs);
>>   
>>       if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
>> -        return;
>> +        return -EPERM;
>>       }
>>   
>>       if (backing_hd) {
>> @@ -2853,15 +2854,24 @@ void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>>
>>       bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
>>                                       bdrv_backing_role(bs), errp);
>> +    if (!bs->backing) {
>> +        ret = -EPERM;
>> +        goto out;
>> +    }
> 
> This is not visible in the patch, but before the bdrv_attach_child()
> call there's this:
> 
>      if (!backing_hd) {
>          goto out;
>      }
> 
> But in this case 'ret' is still uninitialized.
> 
>>   out:
>>       bdrv_refresh_limits(bs, NULL);
>> +
>> +    return ret;
>>   }
> 
> 
> 
>> -static void bdrv_replace_node_common(BlockDriverState *from,
>> -                                     BlockDriverState *to,
>> -                                     bool auto_skip, Error **errp)
>> +static int bdrv_replace_node_common(BlockDriverState *from,
>> +                                    BlockDriverState *to,
>> +                                    bool auto_skip, Error **errp)
>>   {
>>       BdrvChild *c, *next;
>>       GSList *list = NULL, *p;
>> @@ -4562,6 +4572,7 @@ static void bdrv_replace_node_common(BlockDriverState *from,
>>               goto out;
>>           }
>>           if (c->frozen) {
>> +            ret = -EPERM;
>>               error_setg(errp, "Cannot change '%s' link to '%s'",
>>                          c->name, from->node_name);
>>               goto out;
> 
> Same here, you set 'ret' in the second 'goto out' but not in the first.
> 
Oops, you are right, thanks!

-- 
Best regards,
Vladimir

