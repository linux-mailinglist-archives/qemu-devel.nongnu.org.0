Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719922D7F6C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:33:02 +0100 (CET)
Received: from localhost ([::1]:53334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knoA1-0006Bv-BF
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnSA-0004CC-7G; Fri, 11 Dec 2020 13:47:42 -0500
Received: from mail-db8eur05on2096.outbound.protection.outlook.com
 ([40.107.20.96]:23713 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnS7-0002D5-Tx; Fri, 11 Dec 2020 13:47:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzK7fpiPicU2DAYecjEdoqFTTy+b0paM7OD0Jvlfbtc3NNSVXSWWMYdLZSgluwJRQzZLU7YKa36VRRqSTOid4c4PowTWB2qu/0t/AxZjR7FUfzBK//L/FXKcWXtFpYElIZdq3rIrgEy3hc7yUdVxbdr9QDBBh+TJduH0XjiSO4vuXTHaINBS/1sRI7vrAfUUpLRqKJgDBRXHsnGjw+jjNN8zv1USaaZ2jbfGFZsHi2EtzrrEcu0+rLSRT0EYplEeiQi/5PFCIYVPfXkTHGBov5jEGL4lqT2LU47XOy+KG+96Reb0NhQrfvliMSvbOOF68eyFajc2bjViSjYnBlcs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBwASvsvbAgt6PidXcDCFajwuQoe9+Ke0cqAlqzfDhk=;
 b=cDvgPPYwUwUw6FciIr/HQ3cJs9dXvla8089MWNRBy68l42Q2GUOVVMmSu/wliE/ZnP2Kd9jOpGsR8hCXQ36XwtvMmK3mGipuhhi5yUuAfE9bBNkprzXVNenx09pDmFp0IDUo+MSkQuvoz0n/LNkn5yLnOhGy214z/inRUOD62EhzX4JiW516bVL0REJ+Md5oYkXCKwtYNnqVCbsUaS+uWGx4zv6678DD89sqUplkPgYsi4eFPKv5QFw6TwyhblHBtZMqRyIqzXAuvdygSWslGxJ0YZhM4LurY+l6tn9rwLIDlwpyB4jfsgFnCK1wgHe1TrSs37Qj2BM8RAILT3OLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBwASvsvbAgt6PidXcDCFajwuQoe9+Ke0cqAlqzfDhk=;
 b=icwjKQs8HLcz21E/qBUJdDvYTZ6jPwc3E1vj4sN6dguXwh45uDbcsMHv24On+YtTKVlQnKSgq5lnfk/vWi7yuk437cmfGoSfRHOmP6Zl9ODJKjKg/QlCrVyKAjdsFT3zqeN33X727Cgu3jZaWJAXhYgaTYEsrIVSY4zqi/me9Mc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5208.eurprd08.prod.outlook.com (2603:10a6:20b:eb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 18:47:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:47:34 +0000
Subject: Re: [PATCH 19/20] block: Use GString instead of QString to build
 filenames
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-20-armbru@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f9d0016b-c074-ef54-7c00-e50a8caf0ed7@virtuozzo.com>
Date: Fri, 11 Dec 2020 21:47:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201211171152.146877-20-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM3PR07CA0077.eurprd07.prod.outlook.com
 (2603:10a6:207:6::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM3PR07CA0077.eurprd07.prod.outlook.com (2603:10a6:207:6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.9 via Frontend Transport; Fri, 11 Dec 2020 18:47:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ef948ed-9992-4487-f816-08d89e05393f
X-MS-TrafficTypeDiagnostic: AM6PR08MB5208:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5208F79232E29D6395F34130C1CA0@AM6PR08MB5208.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1noSYjpG7Wtezey8/ykgb0RTseFPTFBzQ0g4Z4STAzr6eCe1k/pqkLRxttHuuQnTb9IBvtwEbswu4VbwRBqo4GWrSm4IyIBRXfXoNimzJasyc6kdLROLNuda/BPkmNoHmJSw/910MKJ+7qlGWAGvGlhsgWchWlt/Ytlh5KCfqqwPifSbghp/99nZa/pqqP8JkoGsOyrLkNGVbguhn3bdLX5ISRZbhdEet2scxttrLGg2H+WKlTf+aHfYaNUOeZxD/vNnTtsf3ypviqEvGxu8ZgEQhDaVPXIfAcfspVwsp6yep0K9G/ThLYVFv0H8/317RNN3bMRFIu7zKIdUQbwSuFTrIof33cD+LFlbPM8TVboXIdmIgVmfAc4DDXeuxOd9bU0/m3F4jYO3d4+TDng/KCtUHcy7Wzs54pEm7FzK5wo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(136003)(396003)(346002)(5660300002)(8676002)(956004)(66946007)(2906002)(83380400001)(4744005)(16526019)(316002)(6486002)(4326008)(186003)(31686004)(54906003)(36756003)(8936002)(478600001)(26005)(16576012)(66556008)(31696002)(66476007)(52116002)(86362001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dUoxa01JTGhXSlYrTHFXSlppbVFoRTJJNmZtRTRVbHpnY1RsNzIvNFV1MXV3?=
 =?utf-8?B?NWlVY21sblppY2RzWmNndjc3UVlOb085OE84dFVCZDkvcDBtL1BWU2s5VHJL?=
 =?utf-8?B?QnB4MVNrSnRxNUsrZktPRlV1Q1FERGNLcmd4OGM4Uk13SDYrWHMzTTRjb3RT?=
 =?utf-8?B?SnRkdExQSU9UaDVTYVp3Tk5tcGJ0NVpUUFQrQ0dvdjYxT1B5TlByT2lTNEYw?=
 =?utf-8?B?REpqWFNuam5uWkhJT2xocklmeUFaMG9MQ2YzZURDeW5rRDZCWGgxYkRzS0tR?=
 =?utf-8?B?ZzdjcVdHbGJMQkVzR0NNSks1NThpbWR5OFFDTWVIRGRqRGdpTHdWcWZxUUhy?=
 =?utf-8?B?cXBqbFI5ZlptWW51TUFmZXorNkU5czJSZUVXKzlZYVh6Vjhpa2hKZzU2bnFs?=
 =?utf-8?B?RFRjTEZLUlk0R3g4Z21FZGxhYWJoNVpvUS9YS21NbE5NQWVnTE5oTG1BZ1d5?=
 =?utf-8?B?Z2t4MFJvUEtKcFhEZmdqa1JEUHNhdUtrZytGdjhLbktyMHJSb2gwaVM0MXQx?=
 =?utf-8?B?UEJZOGg4VlZWdy9la1hNU3ZJVUpXSThxSHlpTHNvSERoYXo0Mmx3Mm9jL0VG?=
 =?utf-8?B?Z3BJMElmdzJWNmVUa1dzWWpPeEVqTzM2Ylc2SmpncEk1VmtaYkJLVnR4WjFT?=
 =?utf-8?B?M2tPR2tMVjdaZVFjMU80VUxtWGs4dXN0cnNqYzI2OUVUWSs5ZlkvWllFeFRt?=
 =?utf-8?B?d0dudnFrNnZEY2JNZHFtOURjLzA2N0I4amlHRDV3WGVJK0s4eDdYL0lsaW1u?=
 =?utf-8?B?QWVHM0FJNVNPWVkrd2NNNlNIRDdudzBIenNqRUp5M3VqNUZ2NXl4bEI0VkFX?=
 =?utf-8?B?cXkwM2pHRHBzY0JEVFBxUWJENjZsSUE4UlJ6YjUxTE1oZFFrR1U3c05HSUdT?=
 =?utf-8?B?cURLaFk5TnlhcStiWlRtT2tFaEN1ZElobUFlR2piekk4ZzdkYmdlSlh5dzZE?=
 =?utf-8?B?dUVBa085eG81MUp2Q2dRWmRLQkIvS29GRUNIYnRHVmxNRXRhS2wySTZucDVv?=
 =?utf-8?B?MjZ0VVg1MjFjYWtxY3VYYitaS05wOWUvNU1ORVNObnRtK3hveEVJV0JUTHN1?=
 =?utf-8?B?KzRWQkMrbUJuZ1dOZmVkQWk5eTJteHJVZjNMRHFYK0xOeWVoSFc0VmRUS3JR?=
 =?utf-8?B?MjBibEdIWUhTdzlsTEtjV3ZxTVNqeXpCVTVGVFFUS01KeG5ia2ZNVXV2Rm83?=
 =?utf-8?B?SllUa2RCM09kUmUwY2ErTUtqZkZSVmhvNWVETTVKZnJWUHhIRGNmWEF3aXhX?=
 =?utf-8?B?U2dJSVF3QkoydVFmMGVINk10L0NERUl1MTdsQng1T0RsVE10aTN3Q0ZNeWtP?=
 =?utf-8?Q?ewYml8cr23CE1GZ8WlAKoF9xOF2jkSJeNt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:47:34.5045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef948ed-9992-4487-f816-08d89e05393f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4S55rBi2I2rmBou4Kpt/BQRX1Ir0BRFiVIqdjA4TCQOO/RP4/lHoJ1uYVXmjM8buFjhRxTNqtYajx2T6HIONu9OJu4KiziX0v2Ci97EfHZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5208
Received-SPF: pass client-ip=40.107.20.96;
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
Cc: Kevin Wolf <kwolf@redhat.com>, mdroth@linux.vnet.ibm.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.12.2020 20:11, Markus Armbruster wrote:
> QString supports modifying its string, but it's quite limited: you can
> only append.  Just one caller remains:
> bdrv_parse_filename_strip_prefix() uses it just for building an
> initial string.
> 
> Change it to do build the initial string with GString.  This is
> another step towards making QString immutable.
> 
> Cc: Kevin Wolf<kwolf@redhat.com>
> Cc: Max Reitz<mreitz@redhat.com>
> Cc:qemu-block@nongnu.org
> Signed-off-by: Markus Armbruster<armbru@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

