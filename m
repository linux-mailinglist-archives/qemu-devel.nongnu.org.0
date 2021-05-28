Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131D3946AB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:44:31 +0200 (CEST)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmgX8-0005UB-JM
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgSm-0000V7-BI; Fri, 28 May 2021 13:40:01 -0400
Received: from mail-db8eur05on2137.outbound.protection.outlook.com
 ([40.107.20.137]:10155 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgSi-0002aS-Ne; Fri, 28 May 2021 13:39:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzOoRafnH8KYuFpRWjl4zBAgF5GrmJm6qb7g3GZgt/xFUTpkMVg1kvO2PpqG/NkFy8b03awO2Xe4+g1aRMp4Aq82Z1HGTPSrLhLPN42uk/jeUhyFXDzxhbZA4zk79ay8U7iXSvBAaNb7A0fiwtwkd1YBCGfvEo5IazTxHqxxt/CEckoApk75Pygt9QacYMQrniWKScaVYf2O/Cw3KUR3OP5VDP7N5S05o3vbCERBc7ltMUj9rbz0jlsRwFx389oX9JlMZEV2TKhFo3QYWrFfz/6NayGErlKQT8E8oM3X8PQV4vc15zhbwP5rPIffxTov9qUQxbSzLvMb1sYIzpIlgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESKShgysE7hVm7y6kHJ1S9zSLwf4e/RZi0dvv7gtoNI=;
 b=lR2M4zEM5C2MszaHK6Z3ks5QXgHh2J4s1n1T0qtmEMcJtfZqdLaSoFSbL1LphOq++OBcF2kNHvJra4/ckeBdTxGxrfU+xhh5qGqmlGOouGJm/Sc8tUgY+N+kuntc7D7/oJDRziCL4msCykGYx60+e5gGnDwHiCwq1omdKcEDnorqjMJ2CJUM96gdg57JyF2EvVqRcouc++Sshrj7Ie7JCgAFmHO0BHyUln26dlPHDCqpHeYCgZ6U8HaZ5qRj3/OCkXIk2WwpURZDnK90TNc+w+i8tuflHcPMUCKHZawx50QIUV2zfWKTdT/9u1G2KYDjA+oEeP3d4RDvTS8g/Efu4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESKShgysE7hVm7y6kHJ1S9zSLwf4e/RZi0dvv7gtoNI=;
 b=dAezp3hTcx5NIf0N9SLTE7L4fOp2DJZrrByuTShYV4XY+Vl0nYIoslRWuwr6ni/prcI+TMI/YrJYw+oFfk1bOrWnGky2+TSNtMs+VI4fPrSeEjhkUXK+uOqLWxg2w/FvfWK/7xwGn84RJpcHvwK1+kf6db4XozB4FRbOw1V807c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 17:39:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:39:53 +0000
Subject: Re: [PATCH v4 11/15] qemu-iotests: allow valgrind to read/delete the
 generated log file
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-12-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <78e17be3-f3f9-0a0f-4da5-e60cfc53bcf9@virtuozzo.com>
Date: Fri, 28 May 2021 20:39:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-12-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: AM0PR02CA0174.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 AM0PR02CA0174.eurprd02.prod.outlook.com (2603:10a6:20b:28e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21 via Frontend
 Transport; Fri, 28 May 2021 17:39:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2de80274-8cc4-4e9d-bc4b-08d921ff99ae
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4724297FE71056919175D48CC1229@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yUgo72laSgQpUhkHYCSAjhvDBuYQxAJYHa6gOj7UqgvCIEk+NVqOx+XXGlKMlsrG6UaDxgC1eTCAtXHNSX6Hz3D9M6U4amczIftvf5wVUHY1NTTR3zxBEkg4v+82ivIZ5L0PsB5jhVn6URF2wpPoHI91m7rgLdrqqW6o5ZbSW2o0W0WuY2OJqFnSEHg2LU72USezwrGw/KuwTc36b606FBeNlzvmnStB5CWLQ5Ush5YSvoIFkfeU+H/DtZllsKsRes7hojuXVHdeUJbEvf0QAsGo4/Sg8W53Pq+JA64zqUvDnFpoVy0GZ/hyc4s8Zpk1itbY6dTdI+L0l+T3nv6QfR3VWyIbGkV5JCxGvR+OR7mXpTDbrJWVzMWd/mb0C4xYcOzu4nKED1kojw+RG4a85tIpKjlMv6yAfNWJPqSPjsjAFApn8TBu1HbvAALyf6y3OSiAQt3f/YN4fE0YaghP1AZGt5Q1pl7kUIKxsdU8NBtHBkqA3KnF9SJTLSgWQmFCJmbDp7iJHw+FvK/btDtDEJbZ4W5X9S2PZPQloW8ct+5nUWXJIemNiz+W+SpADlcfEzaRZnN/9vMZn9c0LsWEsEoliTJaKBDpyiQrK4e/puLL2GqB/Ya6UJSWxaWz0GrmyHwyANDleD3TLTMKYCTIhqKXZ+51vqShuWclwkM+kZBUa6KlCyJc4KGgiq1pCUkkhArgK5NevUQmEpySjeX6v6f7ClunFqy2fV+NGCki/Pg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39830400003)(26005)(52116002)(478600001)(86362001)(6486002)(186003)(83380400001)(16526019)(2906002)(31686004)(36756003)(54906003)(316002)(4326008)(16576012)(956004)(8676002)(2616005)(8936002)(31696002)(5660300002)(66946007)(38100700002)(66476007)(38350700002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEw4WERVeU5mb1FtaUZHb3JDWUlCa2s3SnNYekkvZVh4V1hYaStVM0x1bVBp?=
 =?utf-8?B?MHZzcDN5NHlVMUtRWGlCam0wTGNQRDBiZlVhNEVGQ2FDa1h6cFNpbUE0WHhE?=
 =?utf-8?B?MzIvblZpWExjTVJJdWJqRnVncHNIU05rejIvM2ZiMWdUcS9lSTR4S2s3ek95?=
 =?utf-8?B?blVmRHJkczRzekhQUk5ma1FaR3JQU2pJRlF3ajJZNlhQYkxiMks5RTdDeHhq?=
 =?utf-8?B?YlZkL01WQVBQQThsVmZiREcxR2tuV0puMy90czZ0cHpPV25rVWp2OHNSdXUv?=
 =?utf-8?B?ZFVQdUxXbVVJazdNRk5QSXIrbFVxY3NpRFBmS0R1dVhkNWI3VkNrKzZTeitk?=
 =?utf-8?B?aDM2dWZmWW9RdndpQmZ4Umc1d3FlSUpwVmxOdEZhU2tkTWEzMnBOOWpIRDUw?=
 =?utf-8?B?SERHa2hDRmE4Mm1pcSsvRkNxaTBWNHY3ejIrMGdlQ2VTaitpY3RzamJnUSs2?=
 =?utf-8?B?SmZBemoxcW94S0VRQnlhT0FKVUlpcFlmTHpQUXNuYUY4OTRxYkFTemplK1Jj?=
 =?utf-8?B?Z2J5SHBhM2laWVVHbEZkS3ZXMkZHUm1IaXU0NG10cFI2TCs2NXRHYWdWK3pR?=
 =?utf-8?B?ZE5yeUt6OU82azd5VCtKbEV3c1RteUZJRTAzTEVVYWFLTC9BWjlOWmkrWHVQ?=
 =?utf-8?B?VmlXVlUwWU5ReVdyYjVKR1FSaUNURGZzamQyRFMvRmx4RGszbVI0aDU4NnhO?=
 =?utf-8?B?TXNZNmRwMXNwd0EyQTBhd3JIbm85TnBRcWxSaktrZUVtdXVwNE81M2lIclB2?=
 =?utf-8?B?YUVtd0YxNFByNDNmYzZLZGJjOVpaSjN6VHN4NzExcUhFL1Mxb2VZYTJyT2tw?=
 =?utf-8?B?bFNVSlR5dlJqclpyeDRUd1RtaXpva1prU3VaOXlHblVhbHBDNmRZOWVSeTcy?=
 =?utf-8?B?S09tdEVydTVoUDJCdkpZWHZVRm5FbVRycnJzTGhGRHJOV3kxcXZsUWVOR3Yr?=
 =?utf-8?B?ZVY1OFY3bmkwZ3A2a0dsWWNyMFlvVTJVSm5kOHNVVG54Z0ZDaktLUUZUdzhU?=
 =?utf-8?B?NUJwaVg3MGh5WWllOXRlcHlwYmxZUVI1UnNreVRBejFvODk3UDI3TlcwOHcx?=
 =?utf-8?B?QzEyR21kVWFTMGtvRllVN0JUMkxCa1cxbGF4V2pDTDcrZkRUTGJGV0NONVVq?=
 =?utf-8?B?RjdCQTFRcmpITFNuc0N1WERlRzJUMXZVNnRWdDQ4b2drTURPZkdxMXQwSDN6?=
 =?utf-8?B?N1Bac2RVdm5Eb0N1TUZBRWgwRXBBeVhNK2lUSkRJeno5VHpQanUrRmlPYTdI?=
 =?utf-8?B?d0RXUnZiSnFGc0svSTI5YUlvZkxhcmtDWWl5aXBjdTUxSWpOYzVnSlhuaUZ4?=
 =?utf-8?B?Uk83aER2WXNYN25vQ0VwN0lRZTIzeDQvYWNRb3MvckdnbmpnM0hZTzMzMlpi?=
 =?utf-8?B?R2YxbHpIT2poNFdBaHJkZUR2RENNdVFpOFlaNDlzU3Y5Q2Y0OXl3Z3VtQ1pq?=
 =?utf-8?B?VjdGbm42Ykc5cUE3MGkvdThWcFkxUVlUeWpBM0RSejRTRTFMZnF4enBmR0Nz?=
 =?utf-8?B?aytyeDlnWmJ1TUdqcWVFY2hDNGszYTUwZzhSZXBZTEMrNUtMTWp1WHRJQ21U?=
 =?utf-8?B?YkoxWVhvL1lqc0prcXZZN1RVbVJzUjdSeGhwYVpBdVhtWkVyYTZjV1dueFhB?=
 =?utf-8?B?RmVLTzJPQk1abEgyeFBqelpsTnZyV25wTEFpNWFoZWptOWlFVWxXVGdrSlky?=
 =?utf-8?B?YnNmOEtUUXBoZ3hsUlVPd0xFUThKZWlnRE83TVFmZVA1TUt6K0tWUkl6KzZ1?=
 =?utf-8?Q?XUbeLgbrO6CewXL5eoTJsliGng7Rsdl6XLJPEJI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de80274-8cc4-4e9d-bc4b-08d921ff99ae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:39:52.9622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6A50QhrDChGiIvIAGBHMxU9n3NtXOfuiPY8bM6tlKayIgiIcql2ZttJkvt+mbS95fTdZ0C0Axk1TK8N3zPYzvZavQnNWEaUdrJ0t6dazg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=40.107.20.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
> When using -valgrind on the script tests, it generates a log file
> in $TEST_DIR that is either read (if valgrind finds problems) or
> otherwise deleted. Provide the same exact behavior when using
> -valgrind on the python tests.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 5d75094ba6..a06284acad 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -597,6 +597,22 @@ def __init__(self, path_suffix=''):
>                            sock_dir=sock_dir, qmp_timer=timer)
>           self._num_drives = 0
>   
> +    def subprocess_check_valgrind(self, valgrind: List[str]) -> None:

For me just "check_valgrind" would be more intuitive.

I think, you also can use qemu_valgrind global variable directly.. What is the reason for passing it as parameter?

> +        if not valgrind or not self._popen:
> +            return
> +
> +        valgrind_filename =  f"{test_dir}/{self._popen.pid}.valgrind"

should we use os.path.join instead? I don't know.. And don't care, as I don't use windows anyway. Still os.path.join is used everywhere in the file except for has_working_luks() function.. So, you are going add another exception.

> +
> +        if self.exitcode() == 99:
> +            with open(valgrind_filename) as f:
> +                print(f.read())
> +        else:
> +            os.remove(valgrind_filename)
> +
> +    def _post_shutdown(self) -> None:
> +        super()._post_shutdown()
> +        self.subprocess_check_valgrind(qemu_valgrind)
> +
>       def add_object(self, opts):
>           self._args.append('-object')
>           self._args.append(opts)
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

