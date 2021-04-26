Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBAF36B755
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:58:44 +0200 (CEST)
Received: from localhost ([::1]:42190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb4ZH-0000wS-IO
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lb4Xl-0008T2-Ee; Mon, 26 Apr 2021 12:57:09 -0400
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:44984 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lb4Xf-0002EG-JQ; Mon, 26 Apr 2021 12:57:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4Puj8hx1G2ubcrybflG217LAfhcqzKt+tIaKv+JFO2cZN/5NsrU+WTHLAoApPCioXt6B+TFFdIkmrVYeiSX3d2VwmNJBpwQ6HDz6vfQBWvXK+f3f9rnQbOE+FRI5TgDVgDrON+oYqiq7XZdQ5IeXc2cP1Xci/9EvWqifhXRH84JNXunFypq8ykMOJV6TkkVW0BCnZqGJg6vcL1Cmi/td74aKV2Hfs/FlZXHZtIKijsIRQBsBXLMyhw+4IuQAAYgWnailnVEqhO45i5IJ6kUr6P23NRL+J05P5sp/Me3IE0nSyI8iHkmLQH0Sg/HkoKsuPNeYo+UhSafp6e3r12wSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9T7zXtbj2AP2rmtPMGtn9IGY9ye8mR3vBjlX/rppivI=;
 b=gDjbWMSmTDo0oxvFtTj0PoS/3ltsKW2f8KXgBeJimAV7KtsT9w1LQ44el9EZfbzB4K9L7EYwVf07PiGNaidEmt6kekGiUd5pco59k+qSh1N1BF827LyyBVptEM0NapMa7Uy79+xHaO2P8lMVugxHo4VVtEdAJV6lvjcv7kw7XE3TWU6U5L+jQh1zIPXC4NF0Ncehvmg57HWOgdT7vwQz8qYdhWqK+aY/MrkDQNppESE0wWlXR9uGE6JY/U2yrE9+QEXQJ8YAUktru3vh0zc+PefrzEnRTmkSb57F6W4nfNNQBSZmz/xXCp5w99ygbVFgD0eWQuHEcAdK9eRczqnJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9T7zXtbj2AP2rmtPMGtn9IGY9ye8mR3vBjlX/rppivI=;
 b=Bgm24LjM1fsiZzHVRpTWFn68FfVU0uIpVpImp/le387C9n8WNnzY71dvOmFtetw1h7rdhvVL0t15QShVA5f+Li9K7z0T4MfD6vbHUggRfbcyZ4rCI/FQRb5b/tIUIz1YI2DAXzxM5hpPVUouyvMgqVgJXGuyEvA2uGGQQb0DBx8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3029.eurprd08.prod.outlook.com (2603:10a6:209:48::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Mon, 26 Apr
 2021 16:56:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 16:56:59 +0000
Subject: Re: [PATCH v3 18/36] block: add bdrv_attach_child_common()
 transaction action
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, jsnow@redhat.com, mreitz@redhat.com
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-19-vsementsov@virtuozzo.com>
 <YIbmyOnhszPltzfA@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9d1a1b19-49d6-c49e-861d-a53a418c6ebe@virtuozzo.com>
Date: Mon, 26 Apr 2021 19:56:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIbmyOnhszPltzfA@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.17 via Frontend Transport; Mon, 26 Apr 2021 16:56:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 273f6082-68b1-4e70-f4b8-08d908d44e75
X-MS-TrafficTypeDiagnostic: AM6PR08MB3029:
X-Microsoft-Antispam-PRVS: <AM6PR08MB302941875F4BBC3C78802D73C1429@AM6PR08MB3029.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VGNZ62V9+XaoN7fMUOUH1CsSsayv9APrmd8iG2G/Od5N9p6QzsTUuKIgNPR/y2GiE0lSv2BJOxzPMWVP0RAGll4GZMW5e/Oi11ghudKp/iczFGBX5jgmnEdj1wPvUsT2okGEJzhHP9P21MIy+kMeguOo3SCSyjoS3VytrUy2wz8n9VWWpRCgio+7wv+7XAg84//wKSMVebL2U+PLkVUNlzmeT4VFzwcBEp4b9IJGrn2uYKXK3bhxYe67/G5p6l7jr3NEG4JxTU8+bbWgEdU+0VCLsbEr5hwE8752UbSeOlKvGpPhQJ6ZlFFVkTUzdkijwSbFgQ/YGQtWMeL/o1v23OjJ6MDZQGLeg8vlXdZKJAzGOn5koPhK9qs+958hnagu/XZfRona9rk6brb+uFAJ+B2OGi5N/DJO6h0tKRJqUVBglHwyYZv2RlOk2TYJF4NzLFsDWwxdflyOn0rBvDa1vN17CQlCaKEYpaIbALfnl02jQy6mgfRmWt2tJewgATADHv3KhxYsB1Hm2VKcn9QKPzed8Yo6e57Hkm/r0hWDgAoaijW6vI18f40/Lu59OtcoBlw/f7jpbHHKQxi63MKVNK0r6jQLsR+aOSDeGhea91P8OSmOoJBdiQhZzLgiZbmE5LEvTbkrRXzA5OkDb1V+Kgi02uiv9oiWul44EQjrF0tpZEsgP58Mdcfn2VQyuZ+nNIP8C4zlk/UF5BdpAG9e31MW7Bv/r1h3ZEhZajMl/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39840400004)(26005)(16526019)(8936002)(2906002)(186003)(956004)(478600001)(6916009)(4326008)(16576012)(316002)(83380400001)(31686004)(2616005)(86362001)(36756003)(6486002)(38350700002)(31696002)(38100700002)(8676002)(5660300002)(66946007)(66476007)(66556008)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RC9ZNm96ZENweTIvZnNFcUVRZmFrK1BWeS9PZWxhdlJaWkxRRHZrYTg4azJU?=
 =?utf-8?B?WFAydkRGaXdKUUFVNkFXRmdkaFpueUNubE81N28xYnFnYW9RWGFFNnhGZWZ2?=
 =?utf-8?B?VkR6RkVEd255eGwzMWJYOXJtc3NPWm4zWUdONTNCRXhYcDRLQjZuSXJnWnpY?=
 =?utf-8?B?TFVyU0VuM1NrWThqa2FnTkhjRFZyZGhRWEI4M2VHaVdhR2hURmloYUJXMHFq?=
 =?utf-8?B?VVJYM282eCtLVGZLUHhxeHlBVzh1Qi8vOGZ3UlV2VjFTQVhVTDNYVzhObEFh?=
 =?utf-8?B?Q3ZoakdFUzZJUTlKc3dhcTBldDlWdVVIWnJOQkNnZFg2Y1NZL3Yra1B2ZUNK?=
 =?utf-8?B?bTc4NDdNY205ZWRVTGdIWDUrL09wMFhkUklUR3g4Q0xYOCttS2pNZENaODVq?=
 =?utf-8?B?N3l1eFJVK004ejNpS09mdzc2OVp1dmtTVnZsVFVKMHZLenVYQVdJTlo0cmpT?=
 =?utf-8?B?RHovZ21XbjlpMmlFUWcyZzVxWFFoWkVuOXJjaDkvTy9pYTlHR2VFa0tQbkNS?=
 =?utf-8?B?Z3k5NHhsbVF6V0svNjZGTjVmVTIvS0FXUXFBOTFSUWNnd29YM1lpbGtTWExC?=
 =?utf-8?B?OHYwaFJyWWdFdnN3Qi8rWCsrMnVJd1VrU3JXRkFyL3FFMmtDUFZyQjlpTGEw?=
 =?utf-8?B?SUdVc0hpc216RCtNY2pDeWlKWmtBYWJtQXlJVGlKS0xzeHR5dVlQN3NHcnht?=
 =?utf-8?B?NUVNRGJ0QUZqSnMrZ3p0aGZtSWovL3Q0YnB5V1kvbjBod0JkOFF3WDBHdUVI?=
 =?utf-8?B?a1FRVjVjNFc2WFRnWUNHZ1BmZUhCWGswQ1lFNkNycVprMlhDUE4xQjZjeXBL?=
 =?utf-8?B?cGU5Z3Mzc0tHVGEvSWpRbElDWUhZaHBOYUFLenFmcTdia1QvWjRrUXV3U1Vr?=
 =?utf-8?B?bnBBVEdkeThRNGc5RmJ2dU9leWRqaStjRE5xc2FsRFdIZHFlWkNkejBhSHpY?=
 =?utf-8?B?dFFOSTNHdVlRc2JHeFVZdWpnUFBKUnUrMG1ycnNNeEt3U3BsTXlEVXdzeWJ3?=
 =?utf-8?B?a1pCVy9Zem9zZjNYc3RWZy94VURMTXpJMFhmMzhpWGg2anJsUWZPTzIvWnpH?=
 =?utf-8?B?dy9RdmNmWVVHMFR2ZkVjUEtIUlF4aFFNZEhYQzBkME82VVZ6MkRxU1RrTmRF?=
 =?utf-8?B?Tm8wZUtMQkZJdlB6MUJ0VXRZUUZkNEczb0tBMnZ2dHY0dnFDK1J4Ny9iSVNn?=
 =?utf-8?B?OGt1clRTdmZ2dlNYZElSeVVvL0hSSW5pTktaeU5HY0ptNlNheC9vYThxWmI2?=
 =?utf-8?B?N1JmWUlpWmRnTVB5cVJFWklMWlk5Y1pXWlpBSGZoU29tVHBYNk5UeXFlVlUw?=
 =?utf-8?B?aERrVHJpQzE1cGVodlhibVdoL3FZMXFMdTU0ODRKeG1Ya25XSXBiZXJvOS8x?=
 =?utf-8?B?eHV6UDJQa0k3ZFRTenVwaFp1d1NVcHNUSVVnN1ZseUJuOHRyT3ZwZmxjNlZQ?=
 =?utf-8?B?a0xZdFBKdW8zWndDalFKaVQ2aENkeG4rTUZaMVFMdE93dkZmeGhad0ZGRnkx?=
 =?utf-8?B?WTJWak9DbTBmNEp3ODArYm9qNHVQdHlyMElWOVVKTTNWR0ZZbEZvZzdrU0Rm?=
 =?utf-8?B?ZDg3anBnVlVpWkpqOEVhRUFOZDJBVEZoVjRpQUxwbjBCYWxCSWN3M01LczZR?=
 =?utf-8?B?YWJWT3gwQVdqa09QRTRRTGtocmJNQnF6em9VZVpjL1dGenlmdHNvbWNLNUwy?=
 =?utf-8?B?cmR5NXRDYXN1Uy9VWSsrTGE0TUtxSFBxL254STB6SVNmOXNPbk80cmNvZUV3?=
 =?utf-8?Q?pogUmc0IU/4o3j4epVu4AuY2tPtgZUIDCiEXXBS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273f6082-68b1-4e70-f4b8-08d908d44e75
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 16:56:59.4293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t149HB/oBlLW1wl+k+IxcgI7zV4stikcqfOJSvWAukOWcpXCS0pc2gxEihE+eMFv4skx+87XuymNq3VRzqCaGwtAABtGkVSzWSg5YBTae5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3029
Received-SPF: pass client-ip=40.107.20.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

26.04.2021 19:14, Kevin Wolf wrote:
> Am 17.03.2021 um 15:35 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Split out no-perm part of bdrv_root_attach_child() into separate
>> transaction action. bdrv_root_attach_child() now moves to new
>> permission update paradigm: first update graph relations then update
>> permissions.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block.c | 189 ++++++++++++++++++++++++++++++++++++++++----------------
>>   1 file changed, 135 insertions(+), 54 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 98ff44dbf7..b6bdc534d2 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -2921,37 +2921,73 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
>>       }
>>   }
>>   
>> -/*
>> - * This function steals the reference to child_bs from the caller.
>> - * That reference is later dropped by bdrv_root_unref_child().
>> - *
>> - * On failure NULL is returned, errp is set and the reference to
>> - * child_bs is also dropped.
>> - *
>> - * The caller must hold the AioContext lock @child_bs, but not that of @ctx
>> - * (unless @child_bs is already in @ctx).
>> - */
>> -BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>> -                                  const char *child_name,
>> -                                  const BdrvChildClass *child_class,
>> -                                  BdrvChildRole child_role,
>> -                                  uint64_t perm, uint64_t shared_perm,
>> -                                  void *opaque, Error **errp)
>> +static void bdrv_remove_empty_child(BdrvChild *child)
>>   {
>> -    BdrvChild *child;
>> -    Error *local_err = NULL;
>> -    int ret;
>> -    AioContext *ctx;
>> +    assert(!child->bs);
>> +    QLIST_SAFE_REMOVE(child, next);
>> +    g_free(child->name);
>> +    g_free(child);
>> +}
>>   
>> -    ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
>> -    if (ret < 0) {
>> -        bdrv_abort_perm_update(child_bs);
>> -        bdrv_unref(child_bs);
>> -        return NULL;
>> +typedef struct BdrvAttachChildCommonState {
>> +    BdrvChild **child;
>> +    AioContext *old_parent_ctx;
>> +    AioContext *old_child_ctx;
>> +} BdrvAttachChildCommonState;
>> +
>> +static void bdrv_attach_child_common_abort(void *opaque)
>> +{
>> +    BdrvAttachChildCommonState *s = opaque;
>> +    BdrvChild *child = *s->child;
>> +    BlockDriverState *bs = child->bs;
>> +
>> +    bdrv_replace_child_noperm(child, NULL);
>> +
>> +    if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
>> +        bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
>>       }
>>   
>> -    child = g_new(BdrvChild, 1);
>> -    *child = (BdrvChild) {
>> +    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
>> +        GSList *ignore = g_slist_prepend(NULL, child);
>> +
>> +        child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
>> +                                      &error_abort);
>> +        g_slist_free(ignore);
>> +        ignore = g_slist_prepend(NULL, child);
>> +        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
>> +
>> +        g_slist_free(ignore);
>> +    }
>> +
>> +    bdrv_unref(bs);
>> +    bdrv_remove_empty_child(child);
>> +    *s->child = NULL;
>> +}
>> +
>> +static TransactionActionDrv bdrv_attach_child_common_drv = {
>> +    .abort = bdrv_attach_child_common_abort,
>> +};
>> +
>> +/*
>> + * Common part of attoching bdrv child to bs or to blk or to job
>> + */
>> +static int bdrv_attach_child_common(BlockDriverState *child_bs,
>> +                                    const char *child_name,
>> +                                    const BdrvChildClass *child_class,
>> +                                    BdrvChildRole child_role,
>> +                                    uint64_t perm, uint64_t shared_perm,
>> +                                    void *opaque, BdrvChild **child,
>> +                                    Transaction *tran, Error **errp)
>> +{
>> +    BdrvChild *new_child;
>> +    AioContext *parent_ctx;
>> +    AioContext *child_ctx = bdrv_get_aio_context(child_bs);
>> +
>> +    assert(child);
>> +    assert(*child == NULL);
>> +
>> +    new_child = g_new(BdrvChild, 1);
>> +    *new_child = (BdrvChild) {
>>           .bs             = NULL,
>>           .name           = g_strdup(child_name),
>>           .klass          = child_class,
>> @@ -2961,37 +2997,92 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>>           .opaque         = opaque,
>>       };
>>   
>> -    ctx = bdrv_child_get_parent_aio_context(child);
>> -
>> -    /* If the AioContexts don't match, first try to move the subtree of
>> +    /*
>> +     * If the AioContexts don't match, first try to move the subtree of
>>        * child_bs into the AioContext of the new parent. If this doesn't work,
>> -     * try moving the parent into the AioContext of child_bs instead. */
>> -    if (bdrv_get_aio_context(child_bs) != ctx) {
>> -        ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
>> +     * try moving the parent into the AioContext of child_bs instead.
>> +     */
>> +    parent_ctx = bdrv_child_get_parent_aio_context(new_child);
>> +    if (child_ctx != parent_ctx) {
>> +        Error *local_err = NULL;
>> +        int ret = bdrv_try_set_aio_context(child_bs, parent_ctx, &local_err);
>> +
>>           if (ret < 0 && child_class->can_set_aio_ctx) {
>> -            GSList *ignore = g_slist_prepend(NULL, child);
>> -            ctx = bdrv_get_aio_context(child_bs);
>> -            if (child_class->can_set_aio_ctx(child, ctx, &ignore, NULL)) {
>> +            GSList *ignore = g_slist_prepend(NULL, new_child);
>> +            if (child_class->can_set_aio_ctx(new_child, child_ctx, &ignore,
>> +                                             NULL))
>> +            {
>>                   error_free(local_err);
>>                   ret = 0;
>>                   g_slist_free(ignore);
>> -                ignore = g_slist_prepend(NULL, child);
>> -                child_class->set_aio_ctx(child, ctx, &ignore);
>> +                ignore = g_slist_prepend(NULL, new_child);
>> +                child_class->set_aio_ctx(new_child, child_ctx, &ignore);
>>               }
>>               g_slist_free(ignore);
>>           }
>> +
>>           if (ret < 0) {
>>               error_propagate(errp, local_err);
>> -            g_free(child);
>> -            bdrv_abort_perm_update(child_bs);
>> -            bdrv_unref(child_bs);
>> -            return NULL;
>> +            bdrv_remove_empty_child(new_child);
>> +            return ret;
>>           }
>>       }
>>   
>> -    /* This performs the matching bdrv_set_perm() for the above check. */
>> -    bdrv_replace_child(child, child_bs);
>> +    bdrv_ref(child_bs);
>> +    bdrv_replace_child_noperm(new_child, child_bs);
>> +
>> +    *child = new_child;
>>   
>> +    BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
>> +    *s = (BdrvAttachChildCommonState) {
>> +        .child = child,
>> +        .old_parent_ctx = parent_ctx,
>> +        .old_child_ctx = child_ctx,
>> +    };
>> +    tran_add(tran, &bdrv_attach_child_common_drv, s);
> 
> Who frees s? Should bdrv_attach_child_common_drv have a .clean?
> 

Hmm, yes, looks like ".clean = g_free" missed.

-- 
Best regards,
Vladimir

