Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A7639B208
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 07:33:26 +0200 (CEST)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp2ST-00019T-GW
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 01:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp2RZ-0000LT-Mf; Fri, 04 Jun 2021 01:32:29 -0400
Received: from mail-db8eur05on2106.outbound.protection.outlook.com
 ([40.107.20.106]:19873 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp2RY-0004AP-1r; Fri, 04 Jun 2021 01:32:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx4veViYZ4fdW7Z3UpRRkq7CkQeu6XSv7wBZHzOaBEevPTMoKAHuq7I2V4JfW1ITiIPdz32jxrSW+gT5Z1fqqBpvv6K4+cO3l+i+GDy9KyvT8Q2bvveifA5ahey4nZ417WR4zbp6lFxIOl+BO6oNUz9/kpZbZUd0TUa7NAzlDAHaI9Iyv29jWDCHLjxyimRYXH0rNuji0g8M9fyVP1kf0OVTiSc5eksvsvHAl6U48NIVlCkphu1bmzSvdniTkPUjRJ9zh4nh1O/MdT4trOUEWoqKCFnHF4yvWpev77qRCIG9mS8xZzQyh+I20NaUCHZIcsDdp7gJmauh6ByQxlFERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flKY1CaW3yX2nbbp7yfexfgWJGUYc2UX1UBmxc4DEqs=;
 b=BkrttqgTKA+y5e91RhW60ePrat7CC8Vf2Ni9ppj8pEi+Va5kyUQaMa4xkwzAogLzaBwwClM+x9vEqo+1sxzLhgK6M8zWO2MzAgpPLOPZlHtlGTilgQd4hUBblw6lCQkq6Y7aRMvwL+gk+tvrSD1kl6H761k/pEsCZ5NF+t9K2AIWLffVxakBk4sEKicFofgZYPUJ6gzcMlMzuV81RUS1TOtlPGRywJ6xHI0cR7prEt6arp0oulxx9ivRKa8qBMWy4MX13YGyzbbZ0mbNK54u0zq22K/9Nq0DqbtjiZB+C+mScoIzJg/fZZ6MUbL6FVQOxneKKW6M5Lsj5MhfQ/WtgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flKY1CaW3yX2nbbp7yfexfgWJGUYc2UX1UBmxc4DEqs=;
 b=UoLSnZ/cIKwQLwISk31S1ULT1KOM3Kkp8gDVgt9LkRy4i7OLBIZ9BdI6KiHTTxTHLNQ/ZIUpJmSg8gTF/vxiuUdGuOQ0zGyDllKTynlMdaL6XsHXCzGti0mBkdJEMF7w8RabH5X4twXrLeUWlSoPsX8WLA+GVAk3S2j2r12EIAQ=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 05:32:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 05:32:25 +0000
Subject: Re: [PATCH v3 28/33] nbd/client-connection: do
 qio_channel_set_delay(false)
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-29-vsementsov@virtuozzo.com>
 <20210603204834.ecskt6s22hgwwwo2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f53bfe55-2f51-98af-b8d5-c837dd767319@virtuozzo.com>
Date: Fri, 4 Jun 2021 08:32:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210603204834.ecskt6s22hgwwwo2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 AM0PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:208:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Fri, 4 Jun 2021 05:32:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54a9e93e-b1cc-47c2-22fa-08d9271a225e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494E47B711B6E46041C905FC13B9@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vhT78p0LtEWPq1KT02/qYWQexn4Qktp7vpxEJqz+L9DgF9t2ipRDkrM03iajgaf6LiMaZHAUSJEc2GW9TDh5PKEMZC24wBNRUy/FwJ4DZyjnYQK6G0wE8KNx/Tbxj5vtrXT7eIGz5cMA0ZmPk9BrrEyQ816dst6wJTFKxtBwj+h+tlY+yYrbODonVY/BZ6QeVH7PD7VQq/tfS8X5wJPJ3vSq0hHkWShk+88HRpRkD4J9o7zcYSCYjgBEqQ852RRvx0mLWDLIjEOZOk+MzHVINdJ712bG+HmlzGbAgcZDiH/7q3OKNU0wDZjlanriG1wMU9z03HSSFOedwNE1P/uDq16fbUHWLV1DaJXg6BvHbFvYZqiOelfh3R3bd/n704IvVCD9glrGHoyw6xDJlxy7dm8lqVNsrmzB1s8sDP0dMl5CrDZT07Ve5aX0/ZWjBJw/xlfzcx8ykCkEJHa4HkIAQ+ZUfmbLBklg1WyWk6HgCWc9VCFgVVEmtYdqFXxf5yPSd0s3JfJvHKayS008knbMTvczTLKKIO7UseUH+yJEPaTCPt+eXjCl2zkN74SK0xCaSXZc9Us7UorJkobQ5/ufkKuEgIbnutfj95hHrHPtZcPYHQOsHkElypqbsys+R2mg7ioE9OIRefD9wzKjlc3WsuS6Fsz9FBcztUWEaYLOjkZDqSTacMNLoPyiO7FA1v3Iz2X0NPhSd96xV5+4IR5O1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(346002)(366004)(396003)(376002)(66476007)(66556008)(86362001)(8936002)(66946007)(2616005)(6486002)(26005)(478600001)(956004)(38100700002)(31686004)(6916009)(83380400001)(36756003)(38350700002)(4326008)(2906002)(52116002)(8676002)(16526019)(107886003)(5660300002)(186003)(316002)(16576012)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0JJTGdwYitsVENNRFBsL0ZpRzRDZ2wrbjlkVVMvTTNEK3V5cVVWUCtWOWNo?=
 =?utf-8?B?ZGpmWCs0RDljMm0xbmJ0U3pVampJM1VKck1FUnllMktNYTg0NCtlM3ZQSDhm?=
 =?utf-8?B?TmVEdE9UU1Q5RjloenRkYTVVRXpYVUxtWjZqRlFXb1V0VGFNWmFwbzhldlpV?=
 =?utf-8?B?YXhUVzV5alpOK0pSb3ZOa3grYmNNS0xoYU9haWtGeE1RdFM2YmZrSEREaTZp?=
 =?utf-8?B?Vy9Ha3p1RFBwVE82ZUhOdDRXSytUejhKZEZlM1BUdXdPZDJROUlEay9UcFRW?=
 =?utf-8?B?WHk5aWMwZXgvN0JXUk9QNWdQclpRd094QTEvRHBxUGhoQzRBeCtNM1ZFMGRE?=
 =?utf-8?B?b1pER1pRWTZaTWhBTWo2NUJwaEM2dkFFeEwrNnV5N0crL21WUk5zWERvZ2Nm?=
 =?utf-8?B?TTdvZnl3QjRBNUlJVDZZU1lMa0cyK0hmSUkxL3ZHUUpGakhWeEIxUTdSQkgv?=
 =?utf-8?B?aXNBanc4a0trbE9LV2RJZFlWQ3RLQW10aFJseGdXZENXTVc4WE5zckhCTlh6?=
 =?utf-8?B?OGR2Ynp1MG50Ty85eGJiODAvblV4OG5GOTVucy9tSHVabzkwNWM1S3ozbnZL?=
 =?utf-8?B?Y0loWkJtQUlHejVOeEJMZXI4OEFjSGlrL0VvTEZyUzlUR3g2WGxIY3lqZ2xS?=
 =?utf-8?B?OFU1dkNzTUM5MWczRlBiSGVmeG16aW04Z1VJd3dleW9qeGJWSkdqNjRKRDhD?=
 =?utf-8?B?MVFKVDZYVHZWVVUxMnFESVkrTFlhTmdJd1FUMm9PazZ6dHV1YXZZRzRZWGFu?=
 =?utf-8?B?U1RWM1AvemxsKzczQU4rVkRDSTd0dWh1d2xTUUpLL21EelpUakk3cUY2eFFP?=
 =?utf-8?B?RFc5N2gvVDMzRFZpNVU5NGdVdlZYdTNtdFVza2ZNTUd6aWhmT3NLUmNERGdZ?=
 =?utf-8?B?cndiYzQvWXZOMnpoZGN2MU1KdWN5S0tWamE5d2xtRlpHMlpaZjNmaDN3cmdW?=
 =?utf-8?B?OVNiWDlHcjRXazJ5dlU5ZzBnUnFIeExzTnViQ0tvd3pMSFVyZmRIK012R2x2?=
 =?utf-8?B?SENUSW5UVGJuT1ZieWZGWXBxQ0x4SGdnem1mT1lzZXpMcGxNRHFmTlNlSmNu?=
 =?utf-8?B?QlR1WXUxNUV2VjBud3ptL2V0ajZEK1FNRHl1WTdOVVZpalZWWG42MHNSU1Bv?=
 =?utf-8?B?WFdTVlY1OFJBekNpM0lmcFBVa2o3NFB6czZFZnpiRkNFb0RIS2ZDMUVSZWpx?=
 =?utf-8?B?ZzVEa2tldWxGa3h3NitsclphdXhDOTgrR1VGWVcyRlBVNWR4WCthZVdzSkdO?=
 =?utf-8?B?VGJqRG9tVExpNFU2THI2dXVuL0pMOEwrYlhpZGpRT2RQYk5nQmZBVU9VRUdX?=
 =?utf-8?B?V1RvWDVZV3RwK21FVnpYQzVLbGFiOFZzWVFRd1NMR2pMUEt0UDRSU2FMdWkx?=
 =?utf-8?B?MzlXUlhtaVJHRUpUcUhOT3haVERIQThCci9FSFRWMVYwYnRycE8xRktPc2pS?=
 =?utf-8?B?TzlrZDdlZ0dybFFnbGUzV3FqQURBaVRNajJ4b051L2ZDTnIxTzRsQkJvcXdX?=
 =?utf-8?B?Rmw1UzBwQWRScFBOSHJxVDBIY1Y2SVlPa05rM09FNkFaK2lQQUNYODRhWFRz?=
 =?utf-8?B?WTVnckxPSG9TWXpuN200RnRzZjB0YVFKOGwrU1psOUQyVHMxVzFqNk1UZEpu?=
 =?utf-8?B?RVd1Y2ZaejVxcTlyN1oxMUx5U1MweVE5Y0ZnQ2oyNmQ1aUtEZWRlbVhES2Nw?=
 =?utf-8?B?TjJwS2FJWmxwWUNEL1Y1MHUzdlN4dHZxMkFJZlVneXpQa0l2VllqS01RVzU1?=
 =?utf-8?Q?WjSMp+dXrw6BNwaKFoHsNWyKSckeqzAhevfdas5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a9e93e-b1cc-47c2-22fa-08d9271a225e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 05:32:24.9650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q12VqtXl7wXFRZ4mxlPK0xqilmWimFDoKaO9rkz7w2Gwu/L5iozsXbS8bnqU2Fhm77//Ssa2Fy+yFvG2UuRAeUq/5MkdxwbLJgf215cmZoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.20.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7,
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

03.06.2021 23:48, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:09:06AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> nbd_open() does it (through nbd_establish_connection()).
>> Actually we lost that call on reconnect path in 1dc4718d849e1a1fe
>> "block/nbd: use non-blocking connect: fix vm hang on connect()"
>> when we have introduced reconnect thread.
> 
> s/have introduced/introduced the/
> 
>>
>> Fixes: 1dc4718d849e1a1fe665ce5241ed79048cfa2cfc
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   nbd/client-connection.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
>> index 36d2c7c693..00efff293f 100644
>> --- a/nbd/client-connection.c
>> +++ b/nbd/client-connection.c
>> @@ -126,6 +126,8 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
>>           return ret;
>>       }
>>   
>> +    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
>> +
>>       if (!info) {
>>           return 0;
>>       }
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> Is this bug fix something that can be cherry-picked in isolation, or
> does it depend too much on the rest of the series?
> 

Will try to move to start of the series

-- 
Best regards,
Vladimir

