Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F9A490472
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:54:26 +0100 (CET)
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NmT-0003iJ-SE
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:54:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9NiX-0001HN-0P; Mon, 17 Jan 2022 03:50:21 -0500
Received: from [2a01:111:f400:7d00::72d] (port=48640
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9NiV-00071o-0S; Mon, 17 Jan 2022 03:50:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbaK5GM4MBaZ89VjzNsAJ2njD1cfGAu0OH8FnKjwSFp1LgTUuwaBLd94er8zDJO9IaAX6wfwAUjx3TvyvCO9RLlkQuVkAphJqyJZBt/7laAuFMqN0EeTKfZqiw/CPRnFgUfjZsU8YluCeBdE9bJn43jE5PsI7J6go+qtCiIR5PgnKBnf9lxxDcAYwp6pJCs+RqsPVBkHn7KQ0hNiOz9sP4MlPizQs3fYo77ygAxXlOFOIWiimZ+IWxbr0RARufPVvDW41PoahqNKyI8o8KCSmLOpEuSId8pxdRtG57qFuldFujS+WF9omgqLt3RJjjBVzz/qZSKkdmPI3mHTMGhGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=strOOseD3221aH3PEcmAA4AED4UCNJg0OZTPuwOZ+Co=;
 b=bTjrMei4d2/aGWuN3f64//EZk7bbhS7YHTfOsYGn7AFOml+GvqYDh70nqt/gBGKEFaPDYgMO8QDhSFRBQdkzZ7We0twf0/mviBRFYwXhDb0r2GN+dqZPt5bb3rPhJVyMslD7Y2v1fvt5WOpKWJGKcpYbaaapScIORORf2OUBPKbSV0dW/NchOuoGz6zlJ6N5S52KGPjyVQVfy8ziEnPHifA+BLIzx0jC2c/anTZqTFKFZLTk+GSnqp8sMfRr/g2HkJQjqBefRjtrdbQc7hVixwErrmBxsDRH6o+DnST/XEJov+5mlKNkN2dvXKtXT8MBGKYBPxIadvzP3FoDj9A1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=strOOseD3221aH3PEcmAA4AED4UCNJg0OZTPuwOZ+Co=;
 b=MTlM86rctskkvckdWZar/u1xoTJEKXOddV1crcU/FxvvzBIhu2quROq5X89pJ3m4rN5lC0DWtW/+t1FA+2Dmo1MFrrvXg9TKT6YWiso6AyXaGkLznsE2CK6ohMCP6EivM2I9aBdw8VA279dDuQIzV2+3ytRpzBMfynu2WKxZO/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2627.eurprd08.prod.outlook.com (2603:10a6:205:b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 08:50:14 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 08:50:14 +0000
Message-ID: <2bc8ba4d-a225-fc1c-302e-b033df534b88@virtuozzo.com>
Date: Mon, 17 Jan 2022 11:50:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/4] scripts/qapi-gen.py: add --add-trace-points option
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-4-vsementsov@virtuozzo.com>
 <CAFn=p-Z-cVy1C+Q2v4dPN4gLFdciUZv5G5BZDELEpCT89tiwTA@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAFn=p-Z-cVy1C+Q2v4dPN4gLFdciUZv5G5BZDELEpCT89tiwTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caac5195-2d56-494f-3a43-08d9d996611b
X-MS-TrafficTypeDiagnostic: AM4PR08MB2627:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB26271E58F14FF4669612953BC1579@AM4PR08MB2627.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6XRpgPrq2P55AVfLAIa6BqfLuWj9OrS7tQVEW+op6Z428k0l7XctcIG9pH806SeZNqfKhyJ31ElnpvoN5XLd6NclaeTT8nDqoopzIPOfAR/eSOR5s9bn1sWkWB5S5PFgofOSviyPm047GO5g5y0EcTp9fEsIjgInYwqvP2EpJ6G1UI1Uwp/jZfJv8A4RbYDGj8TQTkAVBybBLjNdolZK/w8VB6qP/DPyQpQvALJwmvbnac3KDpua09JH9rbZIayLCbNbF3HAu5QWvNd51UW7uR0Rk7absM9jN2CxGUNZpK6tPjXi6Qr2rMugx2VnMI85wo1prRQfStZwi2UNPai+FPpYz+n2sIV5Ke3kl6PGe3vbkNa40in8JeS+vo0Uh1e2Ql+R2YX+BGxzlq7nUn20u2hOR/cBwIHJgrDC2rMYkpelhlWemHOIat+TGjVZSJAovQvVi+BSo6SBcAZArYH1scsDi+VqoHexxl1Lrg+9ZPSm2MhK5dDe2Z3FfXYx8eXp5ZzGCrskH43mHru7eF8AVn6mlLRBZQbkOKub/Pg0DpA6fjnd6uknnudjyEXJYu8zI36NpZLL4cwF0vt0D+9vQbZ9XSPpDzUPbzZHx2CNpbNKMcWsu99PZJ8lSeUDovw4n9WjvE9vO7kTuHaGLWmmOawF5bnybjiQYA82KUwckgz22qChpFNsQy4LY7uyd/WbfPIArNAghzJAQq2d05gqi/MfvBbzlRVzZYyXBU+FnlOdBvWkiiO1mVeaVOsXjxEb6cBm2OmfM91V2IE0FHvIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(52116002)(83380400001)(6512007)(36756003)(6506007)(53546011)(31686004)(8676002)(8936002)(38100700002)(54906003)(6486002)(66556008)(66476007)(5660300002)(186003)(26005)(2906002)(6916009)(316002)(4326008)(38350700002)(86362001)(2616005)(508600001)(66946007)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUM5V2psUkIrRHlQQSt2Yng1T0pXRElvUDFlc2g5ejN4Um1CM1NlY3VlTU03?=
 =?utf-8?B?RWJtZ2oxdC9OVTFQQ3RhS1ZOdFUyQjR1VzhUR1V1ekV6bFl3SitWQnY5ZWkr?=
 =?utf-8?B?dFFOQ1ErVVZ2TExlWmpFNmJlOVdoT3FyZmNmRTRsa0w3dFZoc1lIR0tpYi9D?=
 =?utf-8?B?WmJIbzRjZEtKOVhIQU5ROTMrRWM2bHBDZTJYL1BQdi9KNWdyZjdHZThBdlBj?=
 =?utf-8?B?cmluRVV2OEI1a2FQcThRbTIwa3NibmoyS1NodVUxRDU0V2FIbjZSekU3N0tB?=
 =?utf-8?B?RnBocjJXeVJ6N0t2MWhRMFdjWW1tK2x6TVUzdUJZaG81ZU9zMjk3TUVLcW9a?=
 =?utf-8?B?cHNnVEprWHg0dXVzSUwwNExSRVNTWjBYcUNDcVZ0RG40bnN6bXIwYVZQWndo?=
 =?utf-8?B?UnNKUWtiNHF2eHBDbEplU1BCdU5rQkVnSENtL3lLb0FFRlZHa2VpMjgrZ0dI?=
 =?utf-8?B?Tm1GeHJVQ3lBcVlBVHR3UzRKZmpVQW1NbzVISW9lM2dDNGo4L3RKOC9YMy9F?=
 =?utf-8?B?eUI5RzVsYURWMTJEVEk3aE5Tb2Q2Yzg0bmpPdktoSWZKQUNoMGZQejRJNGhF?=
 =?utf-8?B?SS9oaXA5RG1BNE1qVXlaazBMYkhoVzJXRFVYTVlha0JzMXk1SjNJU1ljMndG?=
 =?utf-8?B?ZGhoS3B4ZTRQenlxNGI2NjVCcVVBUjZjaXhuNllCenFiVXZyRWVLM0JWYkh1?=
 =?utf-8?B?VDM2YTJWUFRmNlhSdkhpQzZpcFNKY2V5NkFYM0FPRUJpSDhHanRBMGZzUTFp?=
 =?utf-8?B?UTEwNVpTblgvZGRXS1BUTlA3YjMzdDB5ZWpsWlV3eFF2MFp0Y3VYb1ZBTHFE?=
 =?utf-8?B?SU5tK3Mvd1RER1RNZzYzOEsxZjhxbkU1M3k3WHBwWHMydHRJYnhrQkFtdnpM?=
 =?utf-8?B?UkRNZHRZcm9XQ05wdG94eVRzbG5xNkhiU0dkWmM2bVRPL0FrV0c2WjBNdksw?=
 =?utf-8?B?OGM2VWdQbXZpbXFBaGgwOXJpcXF3T3IrbDJ3RDR0c3JaMXpNNXg4NzdNT1BY?=
 =?utf-8?B?OGdwcDBUaXFML29oYStkRUlXcUo0ZGU2cWdUanB6WFZOV3JTbHRmOXJtNGNW?=
 =?utf-8?B?NCtKbUgxYWxrUm1ZWWREL1huZWJQVFlPdnVVa1c0UFBNWGphRlNNVGJxQXVK?=
 =?utf-8?B?QU92R2pBaW12dmphYjJ6bHFiVEFpT05EeWFPQWxRK3JVVVdCL2FXcUtRTzlO?=
 =?utf-8?B?QzVZK0dWWk5raWV4WUdkcmdUT1VOanEvbVpuVFJUWHpucU5EZkl4Rjh3MmdR?=
 =?utf-8?B?SE5Ub2U3ZFpRcUVvdWhIbTZQdXNyczVqcXV6ZFhHVUZ3VEE2VmRwM0xQZDdT?=
 =?utf-8?B?NnJka3hCWHRhVXpXdS9ua2RYK3JDZjRpWW1sUnhvYjVIVjZQZmlVY3Z4QXkw?=
 =?utf-8?B?OS9DZTdjSmd6QTNxZkwrU1VHQ0Y5MWdmSDE5YXRqZmpsOGo4amFXYzNVZEMr?=
 =?utf-8?B?QkNwbm14WmMrY0FTSFhJWWNmZkZqSUw2TFhhNFNPVXJMMUNSWVc4R1ArbERF?=
 =?utf-8?B?ZTdhcVRDelJ0K0tNQVZTTkl6Nk1wOS9FajkrR1drb2h6STRLZWFiWGFTMXdL?=
 =?utf-8?B?dEZoVGxrOC9GU29uQTM5SDJ0T0hxaVoyQjZVQmpDdGxSVVMwdjhTZEpBTjdt?=
 =?utf-8?B?VW9oNlpmK2c4MXluK0IxS2U3MzB3WHNjRHo3L2RjNnBxb2tkU2l3cFExREdn?=
 =?utf-8?B?Ukt6Z2w1amkrMWh3Zkg4US9rd0NlNHBmeWlSRjRRNFdTcE9xaFF3eTg0VXlW?=
 =?utf-8?B?SEFFVzFUTDc2Z2pVNUdGcDk5bGw1ZlhBQktnemZJOEI3TTJtMnJRcU92eGpK?=
 =?utf-8?B?OURHOWtNUTZGSC91UWJ2LzhLL2xZWXcxd2c1eCtVRzdSOWxzK3Q4WURuaFpr?=
 =?utf-8?B?NHhnOE0xM0JRUkM4SkdtREo0RVVUVEhQWXRvYUpGL1d0ODI2YTlpWjhEcTFY?=
 =?utf-8?B?THh0ZFNZdUd2MmdoU1VGZFRsYS9jcDZ0SU0rN1d1V2liUVVLQWN5ZEFicEo1?=
 =?utf-8?B?SGpLNFh1R1BVZTBJTHF5QksrR0VYdUp3bU9XQW10bVZqcXdPSTVNbXV4Rkw3?=
 =?utf-8?B?cnppN29XQk0rRmNVcWJNL3hla0hlS3FSLzdnd21qNzMzT3JNcXR1cDR2NEQ0?=
 =?utf-8?B?STZBU1ZMWU5vcDVHT2UrOU9wZHBjR2JYZS85WjZ0aEJJODBockgvbWxlOTBQ?=
 =?utf-8?B?VGxaUm1QQVZ1V2J2ZHBGREg4Nit4dHhNWitPTCs4LzFOQTYvVkZXRGdIWmdP?=
 =?utf-8?Q?xYgcnlPVg7pbjlvnZyFDwVCeC+oih0TLFCqTa8OdFE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caac5195-2d56-494f-3a43-08d9d996611b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 08:50:14.8225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2rm7GJOyqAD+k33LHi6JvM8TYVOSLIaVnfjoeXL3QpboGoLb1s/OlVKbnVr5eGm3fYEirKNsyWJmFc4/dbF0X4LKs3JbjyDs/i3dcCyOb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2627
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

12.01.2022 03:38, John Snow wrote:
> On Thu, Dec 23, 2021 at 6:08 AM Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
>>
>> Add and option to generate trace points. We should generate both trace
>> points and trace-events files for further trace point code generation.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   scripts/qapi/gen.py  | 13 ++++++++++---
>>   scripts/qapi/main.py | 10 +++++++---
>>   2 files changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> index 995a97d2b8..605b3fe68a 100644
>> --- a/scripts/qapi/gen.py
>> +++ b/scripts/qapi/gen.py
>> @@ -251,7 +251,7 @@ def __init__(self,
>>           self._builtin_blurb = builtin_blurb
>>           self._pydoc = pydoc
>>           self._current_module: Optional[str] = None
>> -        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
>> +        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH, QAPIGen]] = {}
>>           self._main_module: Optional[str] = None
>>
>>       @property
>> @@ -264,6 +264,11 @@ def _genh(self) -> QAPIGenH:
>>           assert self._current_module is not None
>>           return self._module[self._current_module][1]
>>
>> +    @property
>> +    def _gent(self) -> QAPIGen:
>> +        assert self._current_module is not None
>> +        return self._module[self._current_module][2]
>> +
>>       @staticmethod
>>       def _module_dirname(name: str) -> str:
>>           if QAPISchemaModule.is_user_module(name):
>> @@ -293,7 +298,8 @@ def _add_module(self, name: str, blurb: str) -> None:
>>           basename = self._module_filename(self._what, name)
>>           genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
>>           genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
>> -        self._module[name] = (genc, genh)
>> +        gent = QAPIGen(basename + '.trace-events')
>> +        self._module[name] = (genc, genh, gent)
>>           self._current_module = name
>>
>>       @contextmanager
>> @@ -304,11 +310,12 @@ def _temp_module(self, name: str) -> Iterator[None]:
>>           self._current_module = old_module
>>
>>       def write(self, output_dir: str, opt_builtins: bool = False) -> None:
>> -        for name, (genc, genh) in self._module.items():
>> +        for name, (genc, genh, gent) in self._module.items():
>>               if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
>>                   continue
>>               genc.write(output_dir)
>>               genh.write(output_dir)
>> +            gent.write(output_dir)
>>
>>       def _begin_builtin_module(self) -> None:
>>           pass
>> diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
>> index f2ea6e0ce4..3adf0319cf 100644
>> --- a/scripts/qapi/main.py
>> +++ b/scripts/qapi/main.py
>> @@ -32,7 +32,8 @@ def generate(schema_file: str,
>>                output_dir: str,
>>                prefix: str,
>>                unmask: bool = False,
>> -             builtins: bool = False) -> None:
>> +             builtins: bool = False,
>> +             add_trace_points: bool = False) -> None:
>>       """
>>       Generate C code for the given schema into the target directory.
>>
>> @@ -49,7 +50,7 @@ def generate(schema_file: str,
>>       schema = QAPISchema(schema_file)
>>       gen_types(schema, output_dir, prefix, builtins)
>>       gen_visit(schema, output_dir, prefix, builtins)
>> -    gen_commands(schema, output_dir, prefix)
>> +    gen_commands(schema, output_dir, prefix, add_trace_points)
>>       gen_events(schema, output_dir, prefix)
>>       gen_introspect(schema, output_dir, prefix, unmask)
>>
>> @@ -74,6 +75,8 @@ def main() -> int:
>>       parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
>>                           dest='unmask',
>>                           help="expose non-ABI names in introspection")
>> +    parser.add_argument('--add-trace-points', action='store_true',
>> +                        help="add trace points to qmp marshals")
> 
> "Add trace events to generated marshaling functions." maybe?
> 
>>       parser.add_argument('schema', action='store')
>>       args = parser.parse_args()
>>
>> @@ -88,7 +91,8 @@ def main() -> int:
>>                    output_dir=args.output_dir,
>>                    prefix=args.prefix,
>>                    unmask=args.unmask,
>> -                 builtins=args.builtins)
>> +                 builtins=args.builtins,
>> +                 add_trace_points=args.add_trace_points)
>>       except QAPIError as err:
>>           print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
>>           return 1
>> --
>> 2.31.1
>>
> 
> I suppose the flag is so that non-QEMU invocations of the QAPI
> generator (for tests, etc) will compile correctly without tracepoint
> definitions, yeah?
> 

Yes, I had troubles with tests and some other code units, so I decided to do less to not fix things I'm not interested in) If needed it may be done in separate.

-- 
Best regards,
Vladimir

