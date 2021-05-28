Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84443946B4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:55:05 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmghM-0007LD-Tf
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgfp-0006Jm-BV; Fri, 28 May 2021 13:53:29 -0400
Received: from mail-eopbgr60108.outbound.protection.outlook.com
 ([40.107.6.108]:15854 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgfn-0002z2-L0; Fri, 28 May 2021 13:53:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=im/6fwREMNy9kO3JcqBVSl0mSDfGilyAhuzyQkUXfEgUqR5LxEyUUZSwQdx9RbiDbL44hBHcSwu+WDTKtCpVwzE3kyzCaV2f8PICJ0rIpF86Atl5LqMTZGWfU3XtRIWlp6ZPCJXD/zoiRNWpE6wT4dlB0x6vZw7/RUtly4EUPZDT1lxemz1B0WPjVWW4E8BnVekusiJq54R9soMOl+0IQZcyDGJnWk6TVeikaDRfo7se8M/hUpnrUUH3ua9JpCglJuUUaHnZBZZ+iyLbot8xarS+YMF9XG9rVhQdm0EZYuCAWBTcc6MDw2aFHjmUYY3uPGU05TMlAN0+htAAPoPW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc88d+M/cwIT3ihzFPVi2x5uNhJxUl6kw1j8jAATgAU=;
 b=lHpyo6oJ4uAkTP/eZnGZm6Tnou471LBvwjzhHw6K8T5lNWzQVz3wYwS9CyyA4LvUy55vJRTmZM6AZ19KxnEPQ9TygPobTJKOeo51puDZjPuTm+hypOQsnoAAUthLmVynmLjohkRRI9vvPo/YARO/tNcLFSpo+oOnxuQ8W9QSdpeqOPcy2m5AyyVmwJZn7yoU/gIWtFdZNj5VggoUNpBfS+olsmUR87w5UQ6VY7fClkX7v2j1218kQT1Uudl96+lH6FxTNqbBE1IYjnnZCX9eO2/SMaTaxxsrjyF4F3HKQB21+CDuETP+rjaqvXw3ZA6bffPbofN6ViS9iqASauWbeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc88d+M/cwIT3ihzFPVi2x5uNhJxUl6kw1j8jAATgAU=;
 b=JcX51YR16YTZMUS9NzEu3w02W3gdIN13whAe9kS+PbOXMhyZl1ilun0GlHf0z00EARYQ/YrM/i7TKlTuzmZA/mThi5kKhJVuq9oYuUnSi/2bdU/LZf45gBy2ea7i+VE5Yjg4fXfmtS7Xz0lTZraGSNuBdSC+UIw2ukOfkQEMClo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Fri, 28 May
 2021 17:53:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:53:23 +0000
Subject: Re: [PATCH v4 15/15] docs/devel/testing: add -p option to the debug
 section of QEMU iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-16-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <60916460-fb66-43a8-23ab-5741438e60e6@virtuozzo.com>
Date: Fri, 28 May 2021 20:53:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-16-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: PR0P264CA0281.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 PR0P264CA0281.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 17:53:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f2e179b-6e25-4057-99c7-08d922017cb1
X-MS-TrafficTypeDiagnostic: AM6PR08MB3864:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3864187DC09C163396F758F8C1229@AM6PR08MB3864.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8LbqrCX955C/oDZFf6RCO1wz+c1XMo/OtXih/76lklyQWD8kyLy+BICLFRlH9zEWkGJoK1zmYYMeUWjrSOqDvYFHw3a7k9QhLV6kLrQRKOF8dwSS64mErOkdqfQTaveG6dwpGDua5lIjebc3jYMum8TEpjB2/t9ciNigG2dSyUkAqjTaKSVAFNJnEd3FtN5KXt69LIpS8jx5cLH5/QGp0SvjywZz8s7uKer+KGvY32BKM02aMe1OybvD+Vrcj0rCozXiFqi/2SR6CKriHwPKvvh48PbvgXvonqB+TYp912QEACRLmjeQB/Hy9bGWcfoFhr046DzpAeY1KJLU9+cev6HaJWNyGtlXyxW4DMVIMXd0QNcGPZUVryVM2CyZt2g3iURJc5Wy/sagIqjkdpN4P0S3fXccqlj0KigBk6flbLI5BX7blSsrz5ASGPlhb8zanF3IYXtW43RIUEJHm0MXn7IPVKzwN5tpTzHAb9o1Q+PWRWL3LUovkm99BRh6voQnol/c7qdBtSkilEYLzeUovIgtKjJXMqwRWURyzPIPDdP4Fc2/Rz1usWWj3fe9XQPN1j3X6zEp3xPtI7365gweBsWTY3X8HHMHhx0QByAdmXJnyHCe09gDD1J9vxPpQq2xv5VVK6DGAWHAStwBzmQLgIMZpjfujIj3/kYYFYj8ZXvjG350Quh69SMwwNSf9gucniahgt/jOd6l66bIwGKPMTRbG7NnrHob+439GN+oLBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(366004)(136003)(5660300002)(6486002)(2906002)(86362001)(2616005)(66946007)(956004)(54906003)(66476007)(26005)(4744005)(16576012)(4326008)(31696002)(66556008)(8676002)(316002)(478600001)(38350700002)(16526019)(38100700002)(36756003)(52116002)(31686004)(186003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rjd4QzY1M3NEam0vZjlZS3VHSEp1VnpCK2NON0Y4a25wOUpiWVFXdHVDUnFS?=
 =?utf-8?B?M3FVNWhxc2UwTEwrdGNwcEZtZWUxNTlEckI5T2N4MTN2bVlGWHdwWlhnb1NM?=
 =?utf-8?B?d0pkS1ZkKyswdlpMS3hSTnRVendvNFcvNWFlUUlXL0Vxb1I4UmlZNVJHTjhP?=
 =?utf-8?B?N1dxSExCNDdyeUwybW0wS3RSOU9kd21xZEF4bmdxeVBwM2p3SWN6TDBaVlM1?=
 =?utf-8?B?QVlCUHFURGtzTWdGcHFKUGRGazBoR3BpWjBLTXhhaVlVc3hwTWpNQ3F3Mkhq?=
 =?utf-8?B?dHk5V3lRcldYbWtRT2ZnVnY5bEJ1dGpzcEpnK1VzOHR1c0hEQm15Q1RSd01V?=
 =?utf-8?B?TDdJeEJnTDlQR3JkdnNxUm0za1MwbGx4eG1ZVXVLaVVNdE5uK0xweDk2bllM?=
 =?utf-8?B?Q2paUURkT3hlcVZON1hNMEliOWlLWHhYUFR2STUvR1RCY1FuQmY0SEhXQk8z?=
 =?utf-8?B?MHVLZVBDcGhZQXdjVGFLdk5mQThZTEUyd0lhUHRwUTltMzZZVldGMVY5b1JW?=
 =?utf-8?B?Vk1xd3JMTWRJNytmWEF2Wk1raUx1c2JabEk2ZHpneXJHSmxxUTBsdnBQV2I5?=
 =?utf-8?B?RDRvcUJ4T1dYQkNUVm9OTm9pR2kzeUZDVllYNTVQL2YzTElaaU9rSS9LRmVy?=
 =?utf-8?B?alV5SUVjaGpDcGxvSmtQejJSNDJCSEEzeEVHQUVTY2lVMjErTm52K2FFd2hp?=
 =?utf-8?B?THpqVVdTVFlMWWpia1Q5OUZsMW16UFpsZG1PRWY3Nll5cXUrZEhwOU85UGZ0?=
 =?utf-8?B?ZUJxNjRGemJHUTlPUFF2ZWwreVhuR0Zob3hNWmZIaFRUR0ZibEpuSm5WdVNQ?=
 =?utf-8?B?SXFFMVlnYStTUTNXYVRtNFh4anJ2MVRxSm5TZnhIZmRmc21pTGYvbUhCQ1Iy?=
 =?utf-8?B?b240SzY3SnNqSDlwWHZJVGphRTlGMGZCeTE3VUp4cjFKR085ZDEyQXd0aS9y?=
 =?utf-8?B?QVhpdnZWV0JwYkhlN3N3UDNOc00rSTF1YllwUHU1Vm9vaE9uN3ozbU9KYWJx?=
 =?utf-8?B?K25WWUNINDh0T0RDeVdOQ0hjWFIzSzdOc05XYTZOR2RnQmxtNVFnU3FERVZt?=
 =?utf-8?B?ell1azdibnQwYjhRUXpIUDkxc001dTFPVTdxcUtnaTFxeW1HSC8xY2hWbVJI?=
 =?utf-8?B?ZGZSVFhxVTcyY0NyK3ZxT0lQbmJ5VHBNc1V3REJzYlZuamxVQTlkOWYvdll3?=
 =?utf-8?B?T1FVL1MyZXVxVWZRb3lDZEEyWUhHVHlVZEZHSjNHVklNazlvZTFhL01hQzVR?=
 =?utf-8?B?TWllSlBKWm5QV0Y4MGEzZDhIS3I1UmJUVjFhT0NvUURKNUxoMEpDczZncUFB?=
 =?utf-8?B?OC91cldkZnFHRktoUXZ0TVJ6dm5wYWlXSk82eDMvazZpTGNPVDljWGZyTjZM?=
 =?utf-8?B?c3o4L2hhcng2aUNXYWJmRGM2eUZzSHEzTUc1SE1lL0pyOVRkNiswd3JnV1Ux?=
 =?utf-8?B?bnFkaDZZT0NZTkFJU2lLdnNtemlOQWdsME5xMEZ6QW1zUFFoZFJIbGo2NVcz?=
 =?utf-8?B?WmRaN3lFVEtBRkIyUjA0VGZ3ODRWMTFUalEzS1UrRU5HWUhjM1lhRzhoeWx1?=
 =?utf-8?B?VHc4dWtONjVtcktKMVl1WDJiRlVNczNJVHlMaDJzUk9MZnZPYWlKcEFpdUhh?=
 =?utf-8?B?SFhhbVgrbHg4bnBSZ1VDUlc1QS9PV0NoNFg3MzdLSWE1Z1MzcDlaWWwrZGhN?=
 =?utf-8?B?Z1p1M2cxVFowU0wzZ3NzVG9wbTJxS05BWVYvdHVwZ3JjUHJoS3hleDVqdGNZ?=
 =?utf-8?Q?5H7Do83WC00FO9AQS/no22sClQCDEorPIaeDmgH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2e179b-6e25-4057-99c7-08d922017cb1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:53:23.3225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ras06/rchK67/vNLX4ZdlaBiGQTKEtqU2aCNakHE0RGx222PAroEhXKicp0YjVjof0stc+0ekVkgCSA6fEOAYBjgrDg3iBwI4Bj4E+AIP7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
Received-SPF: pass client-ip=40.107.6.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

I'd merge it to previous patch. anyway:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   docs/devel/testing.rst | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index d743e88746..1192d6489e 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -250,6 +250,10 @@ a failing test:
>   * ``-d`` (debug) just increases the logging verbosity, showing
>     for example the QMP commands and answers.
>   
> +* ``-p`` (print) redirect QEMU’s stdout and stderr to the test output,
> +  instead of saving it into a log file in
> +  ``$TEST_DIR/qemu-machine-<random_string>``.
> +
>   Test case groups
>   ----------------
>   
> 


-- 
Best regards,
Vladimir

