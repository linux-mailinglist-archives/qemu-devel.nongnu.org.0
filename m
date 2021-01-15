Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F32F751B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:22:24 +0100 (CET)
Received: from localhost ([::1]:42448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LJH-0005Kc-DO
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0LH5-00081E-7I; Fri, 15 Jan 2021 04:20:08 -0500
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:45728 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0LGz-0003A5-JQ; Fri, 15 Jan 2021 04:20:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5wVRYWIxh7fzVZqW2Ue8HPLlc2YbecartFp+/Wf572VkpbYtwZz7vjpCBdeWWiCqh3ZCUQblb33zly27iWP+IisCYvD/7kOIKNlV8AD0o6C3pVJjj5mL8qu3+RUTEoxqHEXrfISB8h/mmnLrXBLE8CNEy2OvyxePo79zbXzEz+Xbb1/DuS0ouZTvdVCEleHZkgsqKQBWnUIVfptQpg8rClhcL+FLkCwtLSYyzEaaBdAqiWaaEGp5UoP7kVayRWtO7iamzcZX8WR0Uu5aTuVDrElcuzehJjQOrJadU5x7H7Aa0PHdUZ9X6x0wSxXp6kIwJ7Fl3Qyj9kYFcQGAN4pRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xfl4ZlcB9QEldM41pC0Cz7wvUn0poZT26CU4BAy7QbI=;
 b=ZMy5SqAij0k/RRalzr76Pr6xib5JSyjIkrDPGkc0ZtH/nYuctxxW2/n8ZepAeJyj97oYqX/Qp6K55asyy/nOGrYtUv3GPnKE9jDYv14JCqg00zho9c+FHC6TQjrfG774fUsQvPk0uNQItoNWwGPHqfuVQKhNqgTjthHPCHMq1wJmX+2Ntw36J83yL+h1xNeddeUQaqRVO7g2bLpqSqxWBTkYFDKW6JdJ33flRDTeTWIuQ/fsYaqZzY/3Ajtjy6uLxeuNKS9XFZJ/AqiTV3LDpWGorZ9npSBcc7Zg775+hUIcuebl3fOsk4tkjuDgJQwHqh5JqGEbFqIj4saBTBUWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xfl4ZlcB9QEldM41pC0Cz7wvUn0poZT26CU4BAy7QbI=;
 b=Ju0N4wghRqLSWtsHHyO9MN6AS7aA/YveGYlQuZHecweK+qJOQ45M73KKWfrFCuZx6N8NceTg/CdeZxUROLEwMGlxTxFSfqPa50jS1c/9/ZECqU16Pf9ELw6OY9RRGD0BRWTfY/77WePf82BezUeow3kTSbYtmAfJ5aUdOPSG7Sc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6359.eurprd08.prod.outlook.com (2603:10a6:20b:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 09:19:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 09:19:57 +0000
Subject: Re: [PATCH v3 01/10] iotests.py: Assume a couple of variables as given
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <70bedc9d-9fcd-14e0-5301-1e743c438bd9@virtuozzo.com>
Date: Fri, 15 Jan 2021 12:19:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114170304.87507-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: AM0P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 AM0P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 09:19:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcc9bcda-10bb-41d0-3b23-08d8b936b9df
X-MS-TrafficTypeDiagnostic: AS8PR08MB6359:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6359FFCB3B5BD754859D3398C1A70@AS8PR08MB6359.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8aGKLAi26SgIQpJ07KFDEeAkexZc1yrvzOhoP/XvejSTfSLRYh3z7j+KoIhzFJLboEELUmlCD5WgBLE8nOT8rEQ1KMZw4aoGCkVn8/ViqfMo1+64Ywa0JihU/sk2yhQ6PYQ2cunOjMruiWwunUn964mbP05YIcns5x1q4mm29A/iWVDgKkwq0GkQb+sPyicqnrNB3pKGjkixpb9d74gX75VCiv2kUveSCx0p5sUft4fRF3mGbr84d0RP7wQXdKEkAVSM9JncHw+2V3gj0ZqWcITaDgE7zt1OXBiy8dhjz2VrG+G07/U9OAvr1HUqbCTT6n+tUHR5wQ/5JEebEtGhoOTmq2mC4rvr1FIx6elBNeNxgWOIYzSEfBWbaoEXbHnMGz3RERT1hzSOjaVC04CNV6Zr7Wh8VewZSYGb3AXvrxIPFoc7U1WT6XygCgqxQ2ApJfOXVMlWJvqVWWmrxp8tXZPra6OFrv8PxXW23ZnVDV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39830400003)(376002)(396003)(366004)(8936002)(66476007)(36756003)(66556008)(66946007)(4326008)(86362001)(2906002)(478600001)(4744005)(52116002)(5660300002)(8676002)(31696002)(16576012)(316002)(6486002)(186003)(26005)(16526019)(2616005)(956004)(31686004)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dkFoYUpBNW10ZFNKaERXcWF1MUdqSzkzMjBTTFNYMUJ0c1JzYTRSdHlOZ2ow?=
 =?utf-8?B?K1FvOXI4MW1zUW9kMis2NFZUaUExeUMrdkUvbk1hRU5CcU1ETHNRbFVHcDE5?=
 =?utf-8?B?M2hJbWZzMlJxd1VERkFXZDhleTc2Nm55NE10cE1jTlVTRSs0MEhybzQyTWwx?=
 =?utf-8?B?NjJDZm4yNVg4RVNFeXhodS9jSmxWN0dSN2dubFVLK1FzZUlZVzNGMmhuTGYy?=
 =?utf-8?B?L2RyUGFvbnZjRGVsYnRxWndVaWMrYUJaRWtWMWVIY3p6d01lN3NPWkRSM0Y3?=
 =?utf-8?B?V1ZmczMwYTZjMk1FcVJuZE96d3FCdVZnT2krcERmRFRBUjJYSjVxUXJLVS90?=
 =?utf-8?B?MmlNYU05UGpQRHRlV3FhN3RBWVhObmIwRHZoNHZwbHM2ZmxxeUh5V3p2Mm9K?=
 =?utf-8?B?dUFHSVkrYVdkMTh1UENYMktQcjlyOTl4V3lEWHVpMnZRUERTVGR0QUN1WUpM?=
 =?utf-8?B?amVTdUMxTzhvU2RoQmRuN0pkMWM2VTFmYXVlQmhzYklTUzBsd1N2QXpxOXlC?=
 =?utf-8?B?Q0sreHppWjIxRzBOaFRsTTNpK0pxdm5JRzZYK3VFMUQ2QWRkRFc5NXpNRmRL?=
 =?utf-8?B?T1dJRG9VODZKcklPczdVOHN5WkVKVFJoYzU4aHo3N2lJMlVyOFlqd2JyWkN1?=
 =?utf-8?B?YkRoQmxhMDhoUUZkcnZDYXRidUtCTmhNSzZvVTlvaXVMZjdIOFJUQXhiSHBZ?=
 =?utf-8?B?aE9zRHZXVUk2YWk0T3ExZVFGUFhneHF0MDV2aTFTVWU0T0RsZmZUNm8xaW5p?=
 =?utf-8?B?U0o0c0lyamIxYmNLRXgzSVlSYUU3OWhwSmJWcFpHdUhVSmNJLzZ1OXB1dS9y?=
 =?utf-8?B?MXpGN3RRcWo5dDgvVjI3MWlIbjN2WlFLbXZyS21nSFZUaFVBZnc3cTlMaGND?=
 =?utf-8?B?Q1F3T2FGZ1VTL1NYOU1YR0MwYzhSTzRwK1J2Vi8wMEc2djZFSXh0MlFka2Qw?=
 =?utf-8?B?RFhLaVA1dFZrbUM3WmdXUkhhQk1DbVBmMTlMRnJhTDJxZ3A5UWIyVGcrZU5V?=
 =?utf-8?B?RDBNdG1EdU1ZUDQyZGoybUs2WHBDc2IxUHgzNDg1WlV5bG5IQ0UvYXdkVmJR?=
 =?utf-8?B?b3VFcVY0QkFKMjdBVnJLckVzVjkvbFJreXNaSlVkTTVLQmc2VGJ5QlBzRmkx?=
 =?utf-8?B?RnF0bTY0KzNySG5LdVBMZm5OcFFTS3p6Wkx0ejIyVVl3MEtIVUV6cUtXUXdr?=
 =?utf-8?B?eHI3S0FNNHBrc3ZieGJselN0L3prQzJaRVU5a1lJWXZBNVNnd3Evd1dhVlZW?=
 =?utf-8?B?L2Ewbmp4c1J1T0pid3EzR3kvUC9mSGx6Q1doS083WThzMko1bkVMalRqRi9x?=
 =?utf-8?Q?/kDYJU50XPelunVTzBlvtC/WNWoYWKAoad?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc9bcda-10bb-41d0-3b23-08d8b936b9df
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 09:19:57.1852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZwO9hXaVqHV8lcmgT8rdEaxCXb7cvsSNgD8vue1JrW0pkqP05gChjpeTSmBMfD53EVvMVORUA199MrdGLmJ/kkk6SudPhVYE5zpKqU+6bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6359
Received-SPF: pass client-ip=40.107.20.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2021 20:02, Max Reitz wrote:
> There are a couple of environment variables that we fetch with
> os.environ.get() without supplying a default.  Clearly they are required
> and expected to be set by the ./check script (as evidenced by
> execute_setup_common(), which checks for test_dir and
> qemu_default_machine to be set, and aborts if they are not).
> 
> Using .get() this way has the disadvantage of returning an Optional[str]
> type, which mypy will complain about when tests just assume these values
> to be str.
> 
> Use [] instead, which raises a KeyError for environment variables that
> are not set.  When this exception is raised, catch it and move the abort
> code from execute_setup_common() there.
> 
> Drop the 'assert iotests.sock_dir is not None' from iotest 300, because
> that sort of thing is precisely what this patch wants to prevent.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

