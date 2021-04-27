Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E836C579
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 13:44:01 +0200 (CEST)
Received: from localhost ([::1]:56772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbM8G-0003q1-Ii
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 07:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbM5h-0002qk-0E; Tue, 27 Apr 2021 07:41:22 -0400
Received: from mail-vi1eur05on2117.outbound.protection.outlook.com
 ([40.107.21.117]:54039 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbM5c-0007D5-96; Tue, 27 Apr 2021 07:41:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgW6KFPnPiThKmKjZSywXrRtEQygvYUpZt07sqm+rRz+tV+E+hjoO7bI3NzpK5fWs8mGxBJja1Czl2ziBIoLMEog8fuXtFL3fPYgJsyudm0F41xkRSQ1x8VblB6z7JCUfRNCxLrECKGcDpgF+ECnMQdj6bKvQ4c+b8gbR6cAS9hht2a9k+9BBseGik3ImRbjhmFkii0xjyEcn8anBM1gqulK1+Ab4kKbaQipVINLgwtpU5WRa2ke+LYB9HD8IKyC26TiPXyrE8mktr5xm2BDIZHmCYTzu/jHgjVgt/JZ+zcg1/Q9P03udOidTBL9w/pFu3rgJXGQ1P91Sfsw8QoJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USITtuotPwhFyDyWWnIDhu9myzzKPNwn46nzyGU0h+o=;
 b=NjoLXT1QU6lu+1EKC3OCIOHkkZ0fqNsfLb6GbbWr7sgbohKg6mLLP/CXZGVUGMJaN0d/jeRx1fmd4b8ORs9YhVc6KosAwKbuokUsRmClIMALvBq13HAjNampWwLU92R5gbS7W13Polveel6T7d56sxUQF2arpMirgj5cPisxOeg38enH8H7VD2pfgK/9ALEIYZ1ZO97U91umu747szImflBF18p83ix7FVQb1xGWECza9Iw3JJM/6r6mp/h7iyKmmvRFGDmDnleJKGWQ1dlLcMFtpXy4F/SA7dXO6CzJzfn3OZWkJpeqEyolSJmO4gvuZiQGwyvyxAdmRYR/nf37vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USITtuotPwhFyDyWWnIDhu9myzzKPNwn46nzyGU0h+o=;
 b=tRfghhJoqQ37Ft41xdvqXiAnFX3dZ4HXd2+CyhFCkmsP7JMVf7BV/A0dYkdRtOczUCXQKBbD+jscFhyOn0Uh5WBxet1D7cMS8G74sSudK7EdXXTf9/CyJGNouZ/kH+BNtPxiHAmlPtbQfYxKgDoYpHWEMltSMosbdhCuY/bpo4s=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6887.eurprd08.prod.outlook.com (2603:10a6:20b:38e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 27 Apr
 2021 11:41:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 11:41:09 +0000
Subject: Re: [PATCH v3 22/36] block: add bdrv_remove_filter_or_cow transaction
 action
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, jsnow@redhat.com, mreitz@redhat.com
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-23-vsementsov@virtuozzo.com>
 <YIbpoWMyxkgRUtki@merkur.fritz.box>
 <f6bb0393-220f-09bf-9b2c-73fd68ee9967@virtuozzo.com>
 <YIfw9PtwFpx1aNmx@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <57b30313-0087-8132-3779-028a691779c2@virtuozzo.com>
Date: Tue, 27 Apr 2021 14:41:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIfw9PtwFpx1aNmx@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: AM0PR06CA0099.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::40) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 AM0PR06CA0099.eurprd06.prod.outlook.com (2603:10a6:208:fa::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Tue, 27 Apr 2021 11:41:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3165ad10-b66a-4619-ae52-08d9097159c4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6887:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6887A51896409BFCA1A81EE0C1419@AS8PR08MB6887.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gz3qjc9fegk24QA8+ul767ldembKFd3ctUjHyGGHL+2zSxpAQxW4CI2WWAGuTDo9HJvoLwtNeMUJNmpnUPFphFkjAXsrWAYdRqopdwYaSYvXjJt0phsx1XR/mz7HSJIvBzHuE2wgxBiDrDafvldj0LMLRGYeMG6F8dIwogWURzi5wJFlqNDzugbHjaESdqBhWMnTLfbSdBPsi7r5keRIWL8luT8uwKQcx0leFM7SKLDUyVrgXI8GOI4tqP+WaUxc0c5wVNR3yI4Eg2rxVup4Gjo4cWjudkoX/1yCtM7CFOGmTjNgQr1HKyQT8jf14L0n3zGrB9gY4C72hPe8PcTb2+j1P15S49bwcvCFv38uCbQRr+dThhuUPQKLi8UstZeBXlpggJ6SLB/LK0TzoBvK4WEfa4FZHSUaSni58VOjJSuhqH6IHBKrnflIUTcyUbpMMjlJyJ7DenX4rZmZjq0CCNMwNcnGpKa+MStxofvl44/InZ+TT7r19CPdqdxbcKMjbPy8Ch7ixt1i9EcEmJWFaGRPw1bIJinQMGc8HmvJRugrAPzqaYFLWgw4GARmy2tpKPm5wzDBj/IkYTGTJ86ZNcPl/viYuPY5MB2EffzhU4HLmdwB7XPbYRodjmWsTODxhpyEtKr7tY0UzxeNvvVT1NQBLcCoy9ylHipb8wUukVQKVS8g9aX0wboEzhET/GObQ4JDqzU/z2cVfo0ZiWA56iOEdc7y5Bv5f5BGKWWN59k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(16576012)(66946007)(52116002)(186003)(16526019)(66476007)(66556008)(8936002)(26005)(316002)(36756003)(478600001)(4326008)(2616005)(956004)(31696002)(86362001)(38350700002)(6486002)(38100700002)(2906002)(8676002)(31686004)(5660300002)(83380400001)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RHhFczE1V2ROR0V2aFBCWVhmZGk4YmNrOHlUeHRlZ3FxQyt3MFdhVHBKRUlC?=
 =?utf-8?B?VlBJRlNnQ1MyMUpzWm41eHUzcjc0OWYyblNkN0NGSnRyKzZ1QzZkRGRLSG9Z?=
 =?utf-8?B?TXBPK24vQ1lvMnd1ejd6OVcwWDR5dURQMjQzckV2aElhbmVMRmNaMmZhQ083?=
 =?utf-8?B?cXUzQXh0QzVqTW56Q0diREhSZnFwdS9QOHBIazQ1SW1nQmpiUm8rN1ZzMWsr?=
 =?utf-8?B?cHk3ajFSb0VIdnZTZDFDTlZlUXBoZUxBWHM4Ly9YZVptTTVCckVkRnVzUllT?=
 =?utf-8?B?UG1BcERFRzBLUE5WN1NldVk1b0FSTjg0MEw4ZHNxOGFVNEtLTWxXMGRQa2Jt?=
 =?utf-8?B?Kzc0emM4LzhwdkRpa0NOV3Z6dEhHWlpkVUNYd3JidDV4cUppNWpXeVNUSU8y?=
 =?utf-8?B?cnhkRWpyaThhQTBrTTVDaGh5VjRjTHBRV1dxQ29OSGRZQzdTN083R040Wlh1?=
 =?utf-8?B?RGdTVWtOTlpTeWZ3aG9LZ0Z1TDU5eXRMMHBOVEhPTTNhenFvUDNTMjlUQ3Rl?=
 =?utf-8?B?UmFCejhTRjlCRW9rcjV1S0F2U2dzNEpyOEZCVm83c3MvSnplcFFzZFpjVm52?=
 =?utf-8?B?M0VXaUNOSU5uVWxLbUNqdDY1elFTdld5SDYrSE1PcDNHRG04dWRPaldpd1hx?=
 =?utf-8?B?VGdOZFZ0M2dxd3M4OHlJb2N3ZHU4QjVBcFBKZ0swTUtMUWFHRDExRjQrMng0?=
 =?utf-8?B?TWFoZ2RJeFNMa3IrYkltM3VqR2Y1eWozR2FPR3N0ZCtidFZBY3R2WDFoWTZT?=
 =?utf-8?B?aEVGQlg0SUZxOW9LOE1KZjRHTjYzTTJWemxEQ0FvV2E5a0Z0dXh2SGF5alk5?=
 =?utf-8?B?am1LZERITUZIU3ZOWHo2c085eVc4aVo4QWFPamo1N0FWK25iN01NN3lvYVd2?=
 =?utf-8?B?RkJ4UXpJS1RhNVg5eVhTRHF5ajFNaFNUZHB6Ui9hSHB6MFZaVDB2aVo3ZjNM?=
 =?utf-8?B?ZVZRN1V6dW9TWXA3S1JyamYxRExBMkM4M2xpVFNFZXYzZUdMOEVmYTlXa0Jv?=
 =?utf-8?B?bkhlWHNuN1pxWU1ZS0JBMXNXQ1lLbm96RitVeEpLbXpPTy9zTU02Qk5uOC95?=
 =?utf-8?B?NDE0WDZkNzEwakc1T2JBMnNld1NtVjBGS1VNWEExREY3QU12WDJlWS9iWnBV?=
 =?utf-8?B?NFlLbk1SM1UrM1F6Z24wekFubWVidFpQVVNQU3lHL3NDLytzU2FLeXh5aDFu?=
 =?utf-8?B?cFRwQVllT3pFNnpGcm1vaGlEbndQSVNyZ3BOWEpqTUl2cCtCc1BTV2UyVzBp?=
 =?utf-8?B?WHNRU2tZZ3dudDdQYXZ4L1pCZmFlQzlvbXd1ODRoalVGMHUvUGhxdmU1TlA5?=
 =?utf-8?B?eW1sUTJYbSszdW41WTdrV1k4Z0p5TlJ1eW4rQklwZFc3eDV1YS9kbU5RTjhj?=
 =?utf-8?B?VHRrRi91eDZTdzhDdnhwZGlCeTBVQWNjTE9ScjJlczY2Y25Qemd6VDVLV1hx?=
 =?utf-8?B?RkJIbmhHbUQ2N3cwd2x0YlM1cnRSTnlleEJVd2tHUE9QRTZRQXllc1dHSDJC?=
 =?utf-8?B?YkFWT1p0YlcvaXdGTUl5bkhhRENCcUREN0hRYXZjMWF0ak42MUdLUS9IeEp0?=
 =?utf-8?B?NHBlODVKcExNVlN2cU1ScUhMUVpSUjNrUUNhWHNDRlVBbEtsb0tWZjZpbjFM?=
 =?utf-8?B?WkkyQWJGVVY2OHY0ZXpIZUc1MnJDN016cEp3VUhXQXhrMUJqMmZuaFg1U25z?=
 =?utf-8?B?OTVpZy9xVHdWMkUrb041T1VNVHpkNnF2QnNiQzFpMU42alNCbkRPeHo1TzZS?=
 =?utf-8?Q?ESMTbkuSYy1nZIezlabrzKHb+XfnPml588dDbE7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3165ad10-b66a-4619-ae52-08d9097159c4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 11:41:09.3200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NodRRP4FOPBABzkQIKcjvFi8WEqXOZqSochzuvUKdkEfrnvT++3OBrKt7sitESTWdaN5mnWrDMC8LJ7r2Glt1BJRGNLFShnKuT9i6wFMZ0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6887
Received-SPF: pass client-ip=40.107.21.117;
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

27.04.2021 14:09, Kevin Wolf wrote:
> Am 26.04.2021 um 19:18 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 26.04.2021 19:26, Kevin Wolf wrote:
>>> Am 17.03.2021 um 15:35 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    block.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 76 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/block.c b/block.c
>>>> index 11f7ad0818..2fca1f2ad5 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>> @@ -2929,12 +2929,19 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
>>>>        }
>>>>    }
>>>> +static void bdrv_child_free(void *opaque)
>>>> +{
>>>> +    BdrvChild *c = opaque;
>>>> +
>>>> +    g_free(c->name);
>>>> +    g_free(c);
>>>> +}
>>>> +
>>>>    static void bdrv_remove_empty_child(BdrvChild *child)
>>>>    {
>>>>        assert(!child->bs);
>>>>        QLIST_SAFE_REMOVE(child, next);
>>>> -    g_free(child->name);
>>>> -    g_free(child);
>>>> +    bdrv_child_free(child);
>>>>    }
>>>>    typedef struct BdrvAttachChildCommonState {
>>>> @@ -4956,6 +4963,73 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
>>>>        return ret;
>>>>    }
>>>> +typedef struct BdrvRemoveFilterOrCowChild {
>>>> +    BdrvChild *child;
>>>> +    bool is_backing;
>>>> +} BdrvRemoveFilterOrCowChild;
>>>> +
>>>> +/* this doesn't restore original child bs, only the child itself */
>>>
>>> Hm, this comment tells me that it's intentional, but why is it correct?
>>
>> that's because bdrv_remove_filter_or_cow_child_abort() aborts only
>> part of  bdrv_remove_filter_or_cow_child().
> 
> I see that it aborts only part of it, but why?
> 
> Normally, a function getting a Transaction object suggests to me that on
> failure, all changes the function made will be reverted, not just parts
> of the changes.
> 
>> Look: bdrv_remove_filter_or_cow_child() firstly do
>> bdrv_replace_child_safe(child, NULL, tran);, so bs would be restored
>> by .abort() of bdrv_replace_child_safe() action.
> 
> Ah! So the reason is not that we don't want to restore child->bs, but
> that bdrv_replace_child_safe() is already transactionable and will
> automatically do this.
> 
>> So, improved comment may look like:
>>
>> This doesn't restore original child bs, only the child itself. The bs
>> would be restored by .abort() bdrv_replace_child_safe() subation of
>> bdrv_remove_filter_or_cow_child() action.
> 
> "subation" is a typo for "subaction"?
> 
> Maybe something like this:
> 
>      We don't have to restore child->bs here to undo bdrv_replace_child()
>      because that function is already transactionable and will do so in
>      its own .abort() callback.

Sounds good, thanks

> 
>> Probably it would be more correct to rename
>>
>> BdrvRemoveFilterOrCowChild -> BdrvRemoveFilterOrCowChildNoBs
>> bdrv_remove_filter_or_cow_child_abort -> bdrv_remove_filter_or_cow_child_no_bs_abort
>> bdrv_remove_filter_or_cow_child_commit -> bdrv_remove_filter_or_cow_child_no_bs_commit
>>
>> and assert on .abort() and .commit() that s->child->bs is NULL.
> 
> I wouldn't bother with that. It was just that the comment confused me
> because it seemed to suggest that we actually don't want to restore
> child->bs, when its real intention was to say that it's already restored
> somewhere else.
> 

OK


-- 
Best regards,
Vladimir

