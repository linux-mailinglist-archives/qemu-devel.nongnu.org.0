Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434C83946AC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:45:30 +0200 (CEST)
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmgY5-0007qt-9M
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgUF-000333-1K; Fri, 28 May 2021 13:41:31 -0400
Received: from mail-db8eur05on2122.outbound.protection.outlook.com
 ([40.107.20.122]:39553 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgUB-0003hP-8V; Fri, 28 May 2021 13:41:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMOgp9XDOVXEhyIoHSlXBnjycxmnBy6/r8uyFDF4UboOCShsy+44oCbcCN4K0vsrJWfXohpHKvrLsq3yGSnEocn+TzTZZfxRRgfHhZ3H5E0FPSuUgoMr8hYvIMKyupLDtkth3soRcDbxUfRHxRQCJ/VTfoPTQhwMLsHb6GCKEtX2LmzCm5TArWYCRwHcyAysyp7yWC4p2cP+I5pV09EantIjAMuRbqLiBfzHXbypAL5rngocPSwviLWUL0XEBP7FuxpjjbhQ97pbLaKEvPfF0MxAJMDhIQfbP1yHoYr+wSAmu2VIsL5gUrbWuvTn7jmJ/NSnEcibulg8LQUmq2HmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEDk5Fznk3VNTEjX6g0OjJxS/AIQSJmDGu/QVN3jAcY=;
 b=W6tuaeo8Da+LdR+IYO05w2tTu0TjeURBuOLPFsw0wkJ3kYZVjlb1PIlQWSt2nGu/wJubdAbpHvPoIFQl4zKr5Q8nicjfVgx6/rN1T2BN/NmY0DVT0QsuavZ1EeownnTMLIiiFl0HES6cAIOpda0wRLK+SwW5Ueui74lDZyWEXeHEqVcWI+1BB66MUpwts0HLBDcxmJimwu8wUY4t75F18u39cCAbxj5WHKOGPBXxDJvQo+BoSp6VBjEnn/NmgHEdt7tveqgK7zv9wEhynZWsfWxaZRADSyaPJwCVxjyvivRcR2G63OLFPgARidrZp5JlOxy96G2VfwHs6VRfJAa2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEDk5Fznk3VNTEjX6g0OjJxS/AIQSJmDGu/QVN3jAcY=;
 b=b2L3c8s/ZjZZCPMuMct7NzvqLOMe+9q+aP7kj8RSz2U1ukk6C8aG8QvV6I9mLnAL54SAl1SaJyqz8Msb8Ubf8MFyy5Vg34+QttUkx4MdXYO6QVLwi8fieKRT8mL9ysQMNHChuO1TASNbx7rIsHQkNFgaFOI0xA3OdO3cftCzZZc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 17:41:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:41:23 +0000
Subject: Re: [PATCH v4 12/15] qemu-iotests: insert valgrind command line as
 wrapper for qemu binary
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-13-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <446728b5-e570-0a0f-6e37-d9a7606aa6ba@virtuozzo.com>
Date: Fri, 28 May 2021 20:41:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-13-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: AM0PR02CA0171.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 AM0PR02CA0171.eurprd02.prod.outlook.com (2603:10a6:20b:28e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 17:41:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d2881b0-716e-4c54-22d7-08d921ffcfbc
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-Microsoft-Antispam-PRVS: <AM6PR08MB472445182FAC1D2431B7C642C1229@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSG1LGId6MFTBtwOYMv2sNuOBHW6pkDm89s7iDkUanW9jJ33a6K6eS4r4i/z6i2h/iF0Z69dgEStmmU8oZVxgcoQHVOgNqy2TlJnlnxv31fHW/llcGlwFEBBhwnXbRMzn9DYsJ1WwbsT5t2WfdarB+Z5CJklTUMZcamFc/Xw8LF55TdkeSwLypvTlV8hM+T5gWgEHDmdh+OTtXWgfSX8anluoEzns1GCPIiEPoXsA+n2P0fV2P1u+OpLFAtcfiFtoM3KOSgg6HpCaA021BfiVXT2v+cs9ZvLbpaTaXHY2M0B60Zw8WzxtODR/XnPwdto+01Gubh3WmeMepqbK9YbQRALbfvdrDirXKA/GAR96xTkPKz2IAN5b1i4CZ4BdT22BID2nV2wyj0gWuKnKbtjpog6ZfINe4x5sDY0n9whNnKCP/K+/EcneWWVrB44GYikgktrK8mCJ+wO44g8eArKMEOvzvCKhg3icE8jYK56gMg0gRQx04KmlEHx3jgYefoeyQQGfqWdwIahGvY7dxgEALu7lIA0mrb1y4OXvy8vLsyHw6J3QixYYo2117mbeVAGzdUwMPTculCUsZF3zqIX7RT5RZg8tiAWIwcko/qHmsM834LK9MaA3MiZPEfAghwp5RbKKofJAXrCCcMniehUneueKRi0hX8ZYRTk+vwjtww16AHJpjSyXmEm54l2mDKJ+sVHpEQWSV5iX08NljR0RFkD25RB9q/6m+fA9KlMnoY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39830400003)(26005)(52116002)(478600001)(86362001)(6486002)(186003)(83380400001)(16526019)(2906002)(31686004)(36756003)(54906003)(316002)(4326008)(16576012)(956004)(8676002)(2616005)(8936002)(31696002)(5660300002)(66946007)(38100700002)(66476007)(38350700002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QW5hbXdoVzNUaER3MktNNFJIaktPVExIMEE1ZkZRQ2FZYmZqREdsOUQvanNQ?=
 =?utf-8?B?SzV2STF1amhSZXNqSXUwUndzTS9rUm50K2p1a2VFNlhOUk40NmhOako5bGk1?=
 =?utf-8?B?MHQxd3VKV05saDR0d3RCMzRVemFEb3pqRGJGNm90SGZlbFppYzJjY3FqMTBL?=
 =?utf-8?B?TkdFa3Fjc2xqM1ROV29oM3FHZExjbzBxK3E2N1FpZmd4M1FXQXJod0svbktO?=
 =?utf-8?B?S0tUdUpPclgzSTFSOHRtdlpmKzFhTXpRV0dzc0JyT2RINTlUN3REVWRTTnFt?=
 =?utf-8?B?Y0tUNFpOT3NONm55c2Z3M2E2TmlIeHpqVFFsV0lBTkpOQ2p2VDBoMFFaem1W?=
 =?utf-8?B?cUtPREFGejNBUWZOZ1I2bEczRnMvZzI5VGV3WnhjOXVjOWJlQWF3cTQ5OXk4?=
 =?utf-8?B?dlJEK0FUaWcwU0ZVSUNSYmM0aURDaDFCNWJlSngvc1JkemsxOE9NQkx6TmNL?=
 =?utf-8?B?SjVwc0xqWTkweWk3c0ZwOXAzUzJzcEZiajhlZ0RPblBhSDZENmlEVEwvTkR4?=
 =?utf-8?B?elRlSXVaVk9hN1B4NEx0dVRMKzFmZmxnai9GWEZFbmQ2REdMMERNc3J0azJ1?=
 =?utf-8?B?OGtZNUZITW5TRnBoSUNtY1RXODZJM1Y2KzZaNkdzdGlaM2NqWjVzZytxOC9w?=
 =?utf-8?B?UklRYmFmRUxBeUx3K2Y2QVZ2dlNXWEJMS2pnd1ZOODZUTFB4bFQ0ME1Pd2NV?=
 =?utf-8?B?Q0tQcmlaaWR5dEhrR0JXaGhLSUs5bW51OFRmMDllUTh0UFdqNEtyd21DZms5?=
 =?utf-8?B?UU9ndGJsRGxTTmZaTUFjUW05VjJjMGZrenF6U1BHdjErMWhWdStiY25qbU5R?=
 =?utf-8?B?SXZQV1J4eFVGOVd3T1pYVmhiS1dIQ1Joc3JzbCtlaVNSMitLQTk4S21INXZW?=
 =?utf-8?B?Q3JGTStBTjlpYi9PN0d5TUtqalNiOGNCTk1kZlQyR3MzVzhIL3Z5a29MOU5r?=
 =?utf-8?B?UXhrbWdOSHphbWJISFBEcnA2Z3BTaUtVMk9uOS8rYTdvTnlIamVSTkh5RUlp?=
 =?utf-8?B?UzlXd1g4aTFWeVN6NktxbDgvSDhrVzhUTCs0RUY2VTBrdFhjSks0RUVpUkRh?=
 =?utf-8?B?MWZTbWVKbUpvT2xKcmt5SFJHZ2p1RUdKaXFUN01JaGZjOHpSZVd3U2ExQzM3?=
 =?utf-8?B?cE01cWFtWlFIdWdUMnpLTWxuZ0tPWXE3ME14dFBzdkFRU0lWV0dNZlV4RjBo?=
 =?utf-8?B?blZKcVF1NEVWejN3YXNCNzRhdzd0cmFNbFd3UjMwZzIxTFVKV25jZ1VFSlBt?=
 =?utf-8?B?NTRTeUJFb3hRbzZVYjNmdTZtMlVwczZ1cElzbEpsZEEvYnRYUytUZVVNVW1Y?=
 =?utf-8?B?MlhLWmZISE9qNExZZHhIcWZlcUNCRThRaVpRM2h1RzNsS3BTaUtBK2FQRkpw?=
 =?utf-8?B?NlpubDNpL25vK1VVdXllMmxnbm5jVUNJVFRDQXdBNnNrbS9tbmIrT2xRcEk3?=
 =?utf-8?B?MUU5RzFmLzcvWUJmNmNIWkhtd2U1MUJuUE1VWXFqemE1VUhDLzl0c2JRRG5t?=
 =?utf-8?B?MnVZMFhTM2RneVpBbTJPN0pPT1dUTUlNZWhGZEE1SDBVZlAyWXFvaTVvWTE0?=
 =?utf-8?B?ajAxSldtWWhOYXR1Q01iQ3pQNytyZkNBZytZcnZHVlkvVE9UUHAraTNwMUor?=
 =?utf-8?B?dXVjZUxrbTRMa293TEZuSGllTkFKeWdLZTVlMFdiWUpvRkdCeFFIRTMxczJF?=
 =?utf-8?B?amVNTzU3U3lIM2F0Wk8rY1FWaTk5bER3R254RGtoZDR0U1NUWlFDaGd5Z2lC?=
 =?utf-8?Q?5HSYp8UFaY7Z1mpFnvE7QuU0pZAu1XatBIqdtfS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2881b0-716e-4c54-22d7-08d921ffcfbc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:41:23.6660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd6F9OPM3EyTxM4sdoJwaazDyMULz1S1Phr+jKhbrMGaGgVgMDfgxy/z2D4gOXOI5fha25wz7edGF2JnxyO1qbbrG2GHWBQD4lrtGbNyII0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=40.107.20.122;
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

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> The priority will be given to gdb command line, meaning if the -gdb
> parameter and -valgrind are given, gdb will be wrapped around
> the qemu binary.

I'd prefer just return an error immediately if user specify both -gdb and -valgrind

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index a06284acad..75f1e1711c 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -590,7 +590,8 @@ class VM(qtest.QEMUQtestMachine):
>       def __init__(self, path_suffix=''):
>           name = "qemu%s-%d" % (path_suffix, os.getpid())
>           timer = 15.0 if not (qemu_gdb or qemu_valgrind) else None
> -        super().__init__(qemu_prog, qemu_opts, wrapper=qemu_gdb,
> +        wrapper = qemu_gdb if qemu_gdb else qemu_valgrind
> +        super().__init__(qemu_prog, qemu_opts, wrapper=wrapper,
>                            name=name,
>                            test_dir=test_dir,
>                            socket_scm_helper=socket_scm_helper,
> 


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

