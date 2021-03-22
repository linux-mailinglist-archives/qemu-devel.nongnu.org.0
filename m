Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AA1343C3E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 10:04:24 +0100 (CET)
Received: from localhost ([::1]:34250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOGU3-0001Hz-9n
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 05:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOGS3-0000fF-GD
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 05:02:19 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:53729 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOGRy-0005UM-70
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 05:02:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZzq7frIN3j29Kx4fguVsYcOCSDCVJrELSRuMTeUQlCwr0UyvZQrYly0VF6xYaClYow926eVzJj4/QdOjICJm62JZx3hjXuBWyEs3c3HKnAEaqoIFGcAEp7maQLnolGCNdUpysmlNzP4Mgnhbq5nxb6lnISad6mOHKrRTxHoTNmkjubeoe1O3J8dFCXXbkBJkDWLD55jsBtoiWJNtTNk3Db2B85kRpcMAje7M8zQBmAqXWPn0VwF7N5SzBmNbOHIxgz8M0WgsEy1qjmwNl0RxuG5EgyUuZixiCLxlduSZrM2yveoyTqqwIlXNJ/0JSLWIX1L+hXXAyBNsr8odi9XlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqSt4RHxnk1EWYnWTjJHCiJM1MjqSpdwI9DJDRlxeUk=;
 b=bv/ARfFjaBSmtSZ6CcZ1YaxLN+BmHyePtBzxTIUIqWq1WddxfKOtdP8KGqc/9JS3gh2saYT4Q+C4XKNYHM6X26zuJOY5RE40zbomKzOyNDSFqPSuv3ftdEYhI20qQzOCZHd9ehbVHT9afY+4yEl/JFYzBUd8gU73WhE8dLfWgUmhK6qRN0r15qDgDeizm7dHpTC+voLsdGVZuIc239Ty3tYWlsTgKhSP63nbU9iEOot6t68LTwOHuoufFgBxa61qiEfnUgr/3/82/rZ4WvmAMZyxChKb76KNTKOjrF3oRFRlItunl6FUmW3zV8Y2N5vUv+nchyStsKRF9bW7Zi6ddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqSt4RHxnk1EWYnWTjJHCiJM1MjqSpdwI9DJDRlxeUk=;
 b=ZMvtIQEADfcWKpP8/yfu6RSal9st6lFyDZyz6VQ4s0ZnBzSCQ3gECLhXJOVMP2AlzP6Nyw5h75Uo4YrEU88qAp2l3g3bZ3Bf53vpwBu9hZeytTN6Wx6Ms1HthUXpC05Z7cWVYmgzbiiiYtOCqQbTOPsu7qL8bbc6jlYcyeKgedw=
Authentication-Results: kiv.zcu.cz; dkim=none (message not signed)
 header.d=none;kiv.zcu.cz; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB4944.eurprd08.prod.outlook.com (2603:10a6:803:116::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 09:02:10 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 09:02:09 +0000
Subject: Re: [PATCH 2/2] qapi: implementation of the block-dirty-bitmap-dump
 command
To: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>,
 qemu-devel@nongnu.org
Cc: lmatejka@kiv.zcu.cz
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <20210320093235.461485-3-pj@patrikjanousek.cz>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4796a949-1ffa-acfb-ac59-5f42b4f74b04@virtuozzo.com>
Date: Mon, 22 Mar 2021 12:02:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210320093235.461485-3-pj@patrikjanousek.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR01CA0151.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::20) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR01CA0151.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 09:02:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76924cb3-c634-4e3c-7087-08d8ed112cda
X-MS-TrafficTypeDiagnostic: VE1PR08MB4944:
X-Microsoft-Antispam-PRVS: <VE1PR08MB4944439880735073E35CBCDAC1659@VE1PR08MB4944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PnEBZrH4kQWtq7BHpjZksdXUySN3I2mFpvbhcuzN2pncYTLu7CZ7Bjw8VB1/HNE7Z0Nbn1M0cNIvU5vSKVDyYPzZrF31vZRdNIIKQ37fAzc6jsuA5WwjgYO0Lnaayr/scEl0j4c4DeANKs5uh9htKGq5Q+UA8nMA8m6lOjhoVeVw1FjDebuilfoOuGQ2ne67Rn0WxPzlRWZqGgLeL5L74XFPLQhZxr9XSho/Tb36EHeJ3tQlfACxVgXJ8LNOkZiyYBYuL6Umwh3RLM8beUd5kV8MKQ0p31GbPqmTCHCH5FUYFv8gNjWqplQYt9tU7TPUGvmQea0f/P9Zjx0LuyW5QgU6iXTWqwmaVUS9ytfTHmL15GXowooo1ZfRmrvmKLX6w49/wzwYpNFwD8McSEuBcdEgu6syY0X3ATDILVhjh+y0DIxcpycjWIFmk13JK/uhoZgmCTUy1T5EhJiohpY8iZ3KzweuwMVaPjuzpBzfCVLKKyOjIwSU5Zdyn8IfnN/3OeJSafQzgRv4Xt97zcxcM+Fmu3nrW/0jvpzFLGv0ipVbqibXTcNDnbPzZ3npBPylqww9ROveZP7qbjjZwVCO6EVyvopNu57oB3sO4aqwwqLAGZ6mn/gWznlagNQspxzq3jSOm1CU9lzLR58/dSH4CFKpCDqVQU+gDmz+dZZLWf3/Kce7yp0ngRn271HkllTsRZOVXs0ZoWqBk2Yo5gRylFwVSMd1CS5k/A2Ey0ta7NkB/qowt5SzFwz3Du6sZ7G/k4Mv3D9nq/ukeF3F6Xr5XZdFtOQ2LlUcCq3qE33tp20=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39840400004)(346002)(4326008)(38100700001)(2616005)(956004)(2906002)(966005)(16576012)(26005)(8936002)(316002)(36756003)(8676002)(66946007)(186003)(4744005)(66556008)(52116002)(6486002)(16526019)(5660300002)(31696002)(66476007)(83380400001)(86362001)(478600001)(31686004)(14143004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TXZaUFBUeFVCa2d4VjJmSUtETDBDbUZQZFR1QU02T1BWNHJKdk1mMmx4TUJ1?=
 =?utf-8?B?cWY2NW9TVE1RUmlRWGVyNnhaN09uRnBraWh6YW95bllXQUVTbjQwNTJBbTVH?=
 =?utf-8?B?a041UHg1YU9tNlU5VjBtclJ2NWljMm5yVFZ1VFFBd09TVlpnR2M5UkxBNVBC?=
 =?utf-8?B?OWZ4d1BSYWNUQUhCZllWcDB1cUdKNElZMVZyQWpFNU8ybnRjWEEvTk5WeFZB?=
 =?utf-8?B?NGI1ZG9BdWwzZ2EzMEQxOFBBeGg2cTZhdTRjUHMyeExRd3gwcTR1eTJ3cGZ0?=
 =?utf-8?B?a2dock1CekNsSVNFOW5GZityS1lXY1dIdGs3R1hxR08ra0F2OE5WejY4TWd5?=
 =?utf-8?B?OGczdGJwenV5dnZQYTd2cmZjaUlUYmVtaWludkdlK1RZaE51YmxVdjVZR3kw?=
 =?utf-8?B?V2trK2ZCWXNOczVISmdOcVFuWlBrV01ObExWdGx2NHZFN2VGcDRiTmdIMUFP?=
 =?utf-8?B?UXQ5eHhtZnpYMnZPTGcvRFFWdFFrN3F0VFVPOGtqREIyNDllQnU2K280b3Fu?=
 =?utf-8?B?ZDh1TGwwWW5FS0VWVzlJVFVOSk0xb25rL3ZEVXQvb0cyVDg3K1hOZkE2eW1M?=
 =?utf-8?B?Qlh6dTQyV2FkNkpVNCsrL21td2p0SzBXMHVsWW81MC9aWHFCcU1KZStRVkhF?=
 =?utf-8?B?V010M3JKeGxSYWV0dmdkbXpJaDZaKzQyQ0JuVVlYd1pqdGxGcWZSV3VrWmdM?=
 =?utf-8?B?NUNCa3RzbmRWQ0pIYWNNRm11NmREM1NENFBEY1BweW8ySCt5bkF6aW9aTDZj?=
 =?utf-8?B?YnF0TkYvVjM0bTQ0VjBMUkVLUXdGR3F3RTNIV0dXZ0d0dXZSZDlmWjlBWld6?=
 =?utf-8?B?ditNbUhUd2dpMXMxSGt2Y1FsY1RHRXlHbGxDUndSSmllYTAzZ0dNNHA5ZG40?=
 =?utf-8?B?dFpDMC9VMVY0dUp2WXh3ZGFXQ3phOFU0Sk5wcjNOZk5GL21mOGJvY2w2MDhh?=
 =?utf-8?B?VzFsaXNQa3pVWTRTNUZSdHM3b3ViY0V2N0pWazNqMnR1R2dvQkpVQXNrdE9Q?=
 =?utf-8?B?ajZ1cVNZblNQZWJIVFYyQmRLcXZPL0kxOWJBRjFBNG9YR2VTc0RvZ0tGVTQv?=
 =?utf-8?B?OWZRMS9YcldaMzRlMWc3SmtYYnZFQTFQRXJ3OE95bEcyZTlRU3I2QUY5MTVz?=
 =?utf-8?B?Z0hDd29RWmo5SmJwdkJFV0RsdmJ0U0U5ZlUySVByOVdoK3hqckNNd1JZOGpU?=
 =?utf-8?B?Wng0VE53VnFLOEh1UzE0aGVkZXZGQ05QSXlqdjVBdXZXOEs3aUNyWlNaZlV1?=
 =?utf-8?B?TVZLZ0RDOEgyTmZabXpKUlRiaThmd25lUFg1TTZ3MXdzR0dmWm0vaHowaHdj?=
 =?utf-8?B?NDNvcWFJN2xTSGVtb1JmamxkWjRObkFrWkZLdmk0cEdmZzFDSW5yaDVCYmVo?=
 =?utf-8?B?ZXY0c3ovSkszRzJ6ZU54NU1hYlpQZ29tOXVQUmdyWFBZeTgwdUdtb1E2VS8z?=
 =?utf-8?B?cEppYVZYejNtWXVScGRHeS9BQWExcFV1SlU4NTJTVUpackxQbG8wdHlENWdu?=
 =?utf-8?B?cG0xUnJXazVsK0srNkw4T1RwcjJvOGdWOWd6cTFPQlVSQi9WdmtuTzhUS3J2?=
 =?utf-8?B?bTR3a1NyaGsvM2pxZjRRdHdCQjV5ekxad2V4Vi82eGg1L0FZUzF1VlNxODNH?=
 =?utf-8?B?Y21tcFFYeGZMZXZrNlNGSzU1Sk9xRjdQZk1oeXJ4bkppOUw2ajlJaXJzUE52?=
 =?utf-8?B?YnNucXZKVVIrNW1JUWdOZzYzdFNrMGgxYXJMTENpTVhhMmN1ckJMUE5ONUl2?=
 =?utf-8?Q?ccquu3OEv2QwlhEvPPAFEAzbSMIoCt9QuFY0yr9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76924cb3-c634-4e3c-7087-08d8ed112cda
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 09:02:09.7985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oYEzvWQ61pRBcoOIgNe0V4Ccn915SNz7f+RQ4UAvOxVBfbAjZk3O0xw9IZOM12DD6Ml9c3Ua5q78peZ0Ho3ccB8gOHxncz49GpU0psvHcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4944
Received-SPF: pass client-ip=40.107.8.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

20.03.2021 12:32, Patrik Janoušek wrote:
> Currently, dirty bitmaps are for internal use only

As I said, that's not correct: for external use we have bitmap export through NBD protocol.

Protocol description is here https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md  (you need "Metadata querying" section)

And qemu bitmap export through NBD "metadata querying" feature is described here: docs/interop/nbd.txt


-- 
Best regards,
Vladimir

