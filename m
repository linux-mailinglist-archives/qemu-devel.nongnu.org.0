Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418C8492434
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:01:59 +0100 (CET)
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mFQ-0000LD-VA
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9m9X-00051z-4q
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:55:52 -0500
Received: from mail-vi1eur05on2134.outbound.protection.outlook.com
 ([40.107.21.134]:14496 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9m9S-0003X7-5W
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:55:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpQN9LgDHNDHwgN1E9MfTG/sqbqkJhfxdToGONoD2BTPeUMuGGFztKJcJ/9/3WVTYTRP36U+RIjgDTRHsXRChHeLIl3Bl1d93nHeGSaK/gM9n0xZO3Mn7xT/bP5o9vjScXC5DQbaEcbAViuLMnL+E0sfAzAAmGZ0eznKWNg06stHyDqZZ9xIkGBtd2SArrYlozcK1i7hCfG7cwRLDmAdu7g51NHOHc8K3Ywov2fGgmvxuikv5LPD/hPkA+NSai5hW5seAlaqbBDfP2O44C8uEwmXhM5YMvxXX0/rG/qjeRMgqWqFSxZ50ABSwc5C34HQOdwU1ZCDdyFcA08aOjbZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs3E+4KsEG22sYkTSI3VsPny5tf0aGUrLXnc+srCTj4=;
 b=mOh8HZ47LdM+oCiCmUAXXJwPOApZfmGTqcVE5js1jYFTXZiSAzIBm9nq6uwfRspnNqVeJJ67KHCds6czt3VEPrgEeTxf3A/u5f/xH2m6S2pR/sOw8LYEthzVrJZzT6N++WKIo8KceSclhdOjDyA8y5Ne62nV+K2zO0MNsL7+lVHFz4TiuA6Rr3nuJGyfPwfYs9Ydoav1tE3dUB8McFihl4bt76HQuck1S3UCB9Txb6rkTkrmOWj+ka7WUB2sTmJivHAHURhGl1wlO1mvvrf/237x3VbTCrThJyVHKBP4Fb3RRvZvZA6JG11NlqUc3U87/t5tUYf/FYELKiUsi8M41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs3E+4KsEG22sYkTSI3VsPny5tf0aGUrLXnc+srCTj4=;
 b=JBaEhvR1f7v2N0RoJ+TNG0qrHajjZWTMKpz4jsDXMVVy1UzlmJhn+FZeZg+Yfphp06Y939rbNsPZkldRcZpT3KRV0AzQJAbbQ3TydFLb/9jMfw0KTmsUvw96jA2LWIwQM3B1XfQJZezePOk/W6Y4pKz0u8YVoSCNuNoj25OtEpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3755.eurprd08.prod.outlook.com (2603:10a6:10:77::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 10:34:19 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 10:34:19 +0000
Message-ID: <6c941dfe-65dc-bef1-e79e-15891296cbdb@virtuozzo.com>
Date: Tue, 18 Jan 2022 13:34:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/3] scripts/qapi/gen.py: add .trace-events file for
 module
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
 <20220117201845.2438382-2-vsementsov@virtuozzo.com>
 <87y23dphg2.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <87y23dphg2.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e22458bc-8dcb-4d8f-76e7-08d9da6e15ba
X-MS-TrafficTypeDiagnostic: DB7PR08MB3755:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB375556E8815238652BE51E51C1589@DB7PR08MB3755.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ODhToi/MuIEyOw1sfq38e8TN+GLzUqtOi+gJxxlTT42xpUdORzq4pAqGyCG8Wl481TVZz9+GYNJ/VWU0XSSiy5wVZ8809WzKpG8IugJaZlSLRyGiqPH03VwsTY928oPP/HW2IwET8+q4ESwQGTFd2C+X6rDnup6C3L+F9JcHdZdsxwDmdUohZh28aGYumY6YB7PYtkla4RFMhPER22122lX0H0u9Bo3JQeHoJJzthLENE+7GWGbf2Qa188pj5q/Vir2/0566ZSjoUbYhMEhFQy4+JmA74b3asvTr8kRBkd8QZafxjpQLmckkc8H1UgUAKqPfCZq2m1+LOuoS6NrpglKnorLUKHWAHKJmq/XTgu+Tf5f+dWePdhTuOtlV6uUSaR+CMY7Z7klshcwSxxFs8YDTIUPPJUD7uek3Mdu+LlilinFPcW5YoHDi6UvMpyo7WBXPzTv2yoJi5XOoSJxngnmzqdllyz1TH1LmVSUG7rdBnInwinFcmhz22nUVePchDNOglxH1xWP3jpMjd8eIrkMq7ZvhmE0LHwT6CLEpv2sH513/mHUUUDknTnLud7X8TpRhSqYVocbTXUcS7zOR6+9b3OZfEsZ5Pdz0r2vwGCOuwALvN/ivBNi2NPLrOfiCZ2XGn2IEuWMWDidikfzM5GgHcW1VLEpMUKoHANvz+a3TFeJBDL4t9ZwZYfBpo2y7T4DgpMDHsR287OtSqv9ruL91GH3AKnSkOfJPi4kaTjUKuHAy2KR5NXAiniPUJ+bP0yBefmEjCtRqYB07cO64eNl0HGuyA2a3/KGRvqVk+E4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6512007)(6916009)(6486002)(26005)(508600001)(83380400001)(36756003)(8676002)(52116002)(66946007)(66476007)(31696002)(31686004)(66556008)(4326008)(86362001)(38350700002)(38100700002)(5660300002)(6506007)(316002)(8936002)(186003)(2906002)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEsvc2FpWkdNc0lGNC96UmhvK0U3UXJOWi8wb0tCVjdFelNrRlpXM3RLbXly?=
 =?utf-8?B?MlFVdldpSHRyOUQzRTJRUmwvUjRMSk92YmxBN0xJS3p6V01zc01XcFFFQWlB?=
 =?utf-8?B?YWh1TWNubk9TZFpwWUthajRydzlpMW85aWIxK3orMCt5bldsbUZ1b2lrUDhR?=
 =?utf-8?B?TWJSTjIrQmp4ZVV4eVMyMGx1ZTROZmR3UThmNXhTNE1uSFArejc1R21raDFu?=
 =?utf-8?B?ZGtrNUN1UTEyRFE0MVc1S3dBQ0lWa1BlNWlUUUFOZ2J4b2VhZk1rUlBzZ3dN?=
 =?utf-8?B?SVVyaURxTTFFcVNQc01uQnIyTy92bHJDSnMwOUZEVDRNalZheGR6dmpTRzF0?=
 =?utf-8?B?VXZsM2pXS0xOSXJrU3BTOHRPY0JQWDhiYmM1NnlvcHJhL0t3dDYvZ3UwaFk0?=
 =?utf-8?B?YkRwMm5wcVJuZE4xQWtmNmtobXN2NEZyRDJmWUJhODhSbXhiaGNmVkVJNFZv?=
 =?utf-8?B?aEY5SkgxbVVzYTNGQmpBZ0ViS0d4ZjlhbDJVaXNUWHpQZDk5bEI2QlBpR0dK?=
 =?utf-8?B?Q2IwSWtKbGFGWUNaWXJuNXhyVWFrYTllcDJlU1FXRVdTdlliS1lVVklXd01M?=
 =?utf-8?B?aGR1MlhXbnQwakkxcVpDUE5kT3NYS1ZUQ0NsRlRJb1pCbWtxcXdYbW9FdmJQ?=
 =?utf-8?B?V1pTZ3lTWVZJaWtGQnVXcGhBMzFxVUExanJqRmNVMXoxZlF0YzJDVWw1dnNy?=
 =?utf-8?B?UWZYenRJdTZZcmFhU1NhQlpoUHJpR3VFS01yRndwbWVyT1FYcGIrajFQMTYv?=
 =?utf-8?B?Qk1ubGo1OURCZVhaMHVyd09TdXBpcXhjbG5ORHVhbzUvQyt4c3l1K2FLN2dH?=
 =?utf-8?B?UnJzYmdLT2wxb25OZituWnVwSTg1cVFNcTNRWVZUQUhxWXNUWm81THlGbEdt?=
 =?utf-8?B?blEyNmY2TVc3cENqOHZEaFhvWjVBOThZTnJtQmtlbEQxV0FOaU95dit5bGdX?=
 =?utf-8?B?dzZsN3c3UUNEYlY2VjRhTFp3WFBabVBVYjd0akRuSFpDQldiQTRxZ0lNekNi?=
 =?utf-8?B?YzZLc1VxNlFQZ1E5M3VTbEZEbWpQcjc2cVpVdm4veStHVzV1TDluQ2Rxa0FK?=
 =?utf-8?B?U2ozcDA1MjJrdXVjbEpSQjhpQUlEelc2OExuTWdyRTBzOTVoZEV0VkhFd2hQ?=
 =?utf-8?B?WTdiNm5vMkJhOGg1VytWWUMyOEFBV1VLdlhsK0JhbENHUDJSUXdtTXZJVk56?=
 =?utf-8?B?QUFlL1FqcGpLVTlQSE10dTYvTWczTitucWpWZk1kbGlWZGxmcDBOQ2d5NEIz?=
 =?utf-8?B?Z2RBRkk0Qk15VmRuWUd1ZENHRHVuTUlqSWJ1dTZnUEdNUTdLSG9jZWU1K0g3?=
 =?utf-8?B?bUFVcndKZ1BoUGhFQjlVaHpuUVJNZ0l6Ti9nTUw1RVFGRmhlUGhvVGVEcEJH?=
 =?utf-8?B?L2xUYWVkS2NUL3pCY0lOWUFRbjBEUHlBRVFZbEppdmtkU2pHR1hPWHVISGI0?=
 =?utf-8?B?SW9McDNlUUxpMUVUamFTbm95YmM2R2tuaXYxUE1XL0ZaUGxKWWlsZVFzSW8y?=
 =?utf-8?B?emFIR2hTdlk3TU9FSWxoN0RxQ0lDZGlRQ2JOMlNPWUhWTW9CY3NZMXFFMUtG?=
 =?utf-8?B?WEpMMVA5MTFWMVd4QjZHT2dVN3BPRHhubjJhd2hZeUltbHVGSzhsQndlZ3la?=
 =?utf-8?B?TFV5SkFENzBKV2tHYlh4YlFyM2w3aUxsNkVnQk5MOXZnRTc3bmZUSElnMU9m?=
 =?utf-8?B?WUpUZ0hjcmFlQW80NHBzNFRvckk4Y25rUlZyNE4zcVdmVXl6OVVqbWV4V2NO?=
 =?utf-8?B?bUxDZGNZTGxXbVUxZ3hqdTlsS1laRElqUGUxb3h5Zm1Ubzl2RmVUODF4ZTBQ?=
 =?utf-8?B?Q3UwcDFFYUFxSG93TnJodzBzR09MQnNheEprTlRqUW5RNUZSOS9sYis1OEp1?=
 =?utf-8?B?cENxcDJFZVd4bUsweSthV2M2bm1rNGRlMXR6RVhhRnFtc1l5TTUyOXZURTlk?=
 =?utf-8?B?MWRNNC9DZkx5Q1pUTGFLM1l3M2hVc1podStWQm5WSWZ6NlhqSUNVMzlETCtE?=
 =?utf-8?B?TnNIWVV5YVJNd3A1aE9uSjdxakg0WVZTQUNZeG5ZdkhIYlNKQTEwaHMrR3pU?=
 =?utf-8?B?M2hvRVRFVWFTd2NTN1ZWY2QrdGpBR0N2YWhqV1lTSkhLM2xaLzNGY09ua28y?=
 =?utf-8?B?M0RtU2Q0ZmVLdytkcklMWjA3ZnJqZk5VY21QbTR2d1lpYVlyVElZRC9uTVdG?=
 =?utf-8?B?OHBjbDFDT1daM01xRVJOTTZwWklYcHVEYS95WTdUMGNCSzgyWldTQkFtQ1V6?=
 =?utf-8?Q?lj9zpjIwmzLg4HSl0lDjAnRKYogbIG+HKlZDqww84s=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22458bc-8dcb-4d8f-76e7-08d9da6e15ba
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:34:19.6997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XbicsW0hLwQ7DsOAca4YEwJETRyeGTypxkwMCttDMKv7neoLeTkd3YF+DOuEtXa1eEuW+8Yf7wmgjPSrSo9FwVtQlIeoSX7IAc9LQrzS18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3755
Received-SPF: pass client-ip=40.107.21.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

18.01.2022 11:38, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> We are going to generate trace events for qmp commands. We should
>> generate both trace events and trace-events.
> 
> What do you mean to say with the second sentence?  "trace events" == the
> calls of generated trace_FOO(), and "trace-events" == the input file for
> tracetool?

Right. Agree, sounds veird

> 
>> For now, add .trace-events file object, to be filled in further commit.
> 
> What is a file object?  See below.
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/qapi/gen.py | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
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
> 
> Aha.  You're adding an output module FOO.trace-events for schema module
> FOO.

OK thanks, I'll reword commit message with these terms)

> 
> We commonly use a single trace-events per directory, but I believe your
> choice of one per module is simpler for the QAPI generator, and just
> fine for tracing.
> 
> Please add
> 
>     class QAPIGenTrace(QAPIGen):
>     
>         def _top(self, fname):
>             return (QAPIGen._top(self, fname)
>                     + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n')
> 

OK

> 
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
> 


-- 
Best regards,
Vladimir

