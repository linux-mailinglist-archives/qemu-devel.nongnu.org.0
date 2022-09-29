Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7295EF94B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:42:30 +0200 (CEST)
Received: from localhost ([::1]:59832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvgB-00026f-BQ
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1odtTQ-0007d3-VL
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:21:08 -0400
Received: from mail-ve1eur01on0726.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::726]:49825
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1odtSu-0002LL-LR
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:20:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYMxcHBjbJco5HTGnl4kgUvlfy8egHqxZdexs2Oufl5+ZgaKBcFy90SLj47inOqG/cfMYla+8NK4fsOekkeCnhWm7Rl8WdbI2oubSHX/Zjbpq69n/kGD+fxQKBzzNbm9Q2dkoMOx2U8gSoGi80nLH3W3z4oWsA9jpSUR40GIG++SP/WCMbUQuz2Rxy2he0R7jNIwEsiPqCMkjtoaQmnTaCx9zOc/nE3Gb5i4EMILkI9anou3dsINdWVEwFOAPRLilMv+qHj8pSGqju/sHS/czBAtcZT8I7tdcO/31b31J9Wb+F8+T6oqORQIHpbdbw3D1jgCftRdg7viWykO4zZ4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptUTEm070dZloE806tBEY0Ts2GPNGl+cPeRxnmzWPbA=;
 b=oUPBlTzegJM3BU/45Sfqnu3qJKrRtS3T6r3PNNCp25PRfm0D/8zqn0vIQrTVHSjhmMtci8OIHBGoOczLFtXCF9gdSXmCKAZj8rNAOTMIiXGBwkm4X9dvO0JD4KO9yqDhGOBY8y6MbEzj124zS7PIA0GqxrrTDm3+ImdsjdPBEnRJJZbwh7DRP92zMKt6ZbdUWlqhmjcwq0YXQ7CkTxl9N4QwC9BYZNCixcjDs5pq+igHOJgWKQ8Nx79reVNFeQJUWmp9XMaHdPFCiRn8yCxkZjCWSX6D7OafnFOWZgNM7qIc7zZrQY7ebssXd6tm+g/vRYhQpeVrTxyikP29sXilTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptUTEm070dZloE806tBEY0Ts2GPNGl+cPeRxnmzWPbA=;
 b=YAbNHhavE5a38zQvaOtIM33IcUaLAGDtw5Kd6/0WHSGdSO5K1BaXr0byOtNg4UG+iaBr+UiApKrD6YZbIOtRIKR8Poo4DJPeI0wEYTm87w4eierN1Pv6CiURA8zGTyGz1YZEOXM39YloRuadGNfAOUA59MmLyiMWTD2je6Tqhy0+4QQ2/CczxlRr+fcf3Bk588UfgvF7+GxwnLvZcwzbcBf7TWirrqKiPbrprAdUDDUAl7SuZj/zOe3Z30wzYIwg7ixliNe6WK3ljKMHsh3A1Y1RLLYQtjvz7YW5HkSy3maa98KHUEtDk9Tw6pAECLYzcOVJRSRDN20bmaescPgAAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 13:15:27 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::c82b:333d:9400:dbc9]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::c82b:333d:9400:dbc9%5]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 13:15:27 +0000
Message-ID: <5eb39990-5d1b-f566-bf5d-db6b46b9aa20@virtuozzo.com>
Date: Thu, 29 Sep 2022 15:15:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/1] scripts: check commit message length to fit 75
 characters
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20220928163417.1839682-1-den@openvz.org>
 <874jwqtn9a.fsf@pond.sub.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <874jwqtn9a.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0237.eurprd07.prod.outlook.com
 (2603:10a6:802:58::40) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AS8PR08MB6502:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f20d7a2-c4be-401f-9346-08daa21cace4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nl5zfPCRmmwul+O+Z+qxi6Pz1lHqnRvfhudaTfwG+HWl+PjuVwQL3OBZ7ZY4hjRM2AoCLtkeg3Eh1napZwx7+1sYe8+vgxbrcBkDeNnBzbp/Lw3OnnNJEOzksP7sqsnm57XfWW+wrllQ5/QjIdKrIqCNQILjH5GnMGeS9Mp44CkHg3/3NgZOdzkxWng2neWPM3ELMDOfbxTxN7uK/cRE7nkfUbUjxckoGgE39VSQB/zL0iKrNxVbWd+NaWr6pqV0Qln0iuvRvxXlwTYgpy3gPfYMrslav4uoUPbHUvjtBwWoybH0yIMy7R7igpis+w6XMogBWbHcatgG0PFbjJTcSF4E3oyPLYhcf9KvmGozXzmBaSkysR/iNPJ5pWvqiQdoyQYT41wY2P93FNTUdJuBmVJ6l7fLsp19IQgiK9AfRAxD2hswSVQC7LJwgFJ2mXzA3m0a785zSyLxdrD2EASafcgiMDlAheo1H0S0M2aoPvv+I8uHxyHpV+zGiaoJYfglWvklBMfCxgUF1+sXJWxajOjL7b3wfd4EmHnlevSPLoDwnZPammdPWJr3JsDoLZtu+bpALCLlr82v/jYcyLDNccrOWJze+NkrOPo/ifg0fIWEM+OOr4S9VPUr+UnT0epVTpXk+j/L9cQ0n8wK9s+WxZUz8M2+m8zlwKNMBegJQ/MACETS9gz325aqR6KgBGGV5EJJff8X3RH5GRIL1lQKvKKzNJ6d0fOK/5uTiNz+hrnCXf6XMfU5dE3NZnPlsh4ULF9eXyISDFY8hr9seeWSCmvxt3whVjeMhZ8n8BT3nMnxvDB36tZSqSlkk+TiKPPEJUeJMMyoiV/ExrXotvWq9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(396003)(346002)(366004)(451199015)(83380400001)(5660300002)(2906002)(31686004)(6512007)(31696002)(86362001)(4326008)(66946007)(6506007)(66556008)(53546011)(26005)(8676002)(66476007)(36756003)(38100700002)(8936002)(38350700002)(2616005)(186003)(54906003)(478600001)(52116002)(41300700001)(6916009)(15650500001)(316002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmR2NVJxZ0pVZ2dBbXFtaXNFZmJmYmdBY2F4SDZXczhIM21rSFdFSGM5T1pE?=
 =?utf-8?B?dFY4dnYvS3pBZnZGcGtGWFdFaDZUdE8zMlRxZzVlSnI1QWlDR2NSWTAxMm96?=
 =?utf-8?B?OWlEVEJWYUZvWHIzU2haZmRsbDI3Ymhidk9OdlRXcVgvdk1Id0lJVHUwNDk0?=
 =?utf-8?B?dFBoMU81a1FMc1BCS0ZsZzNFTjRTM0dhRng3UUJycnEvN09YcHhnblVCUTB1?=
 =?utf-8?B?UnMvdEZWK2R1L251L1JSQjlaWGFpaGFjaCtvM2VBdzNBblhnTWs4UjJ4T2My?=
 =?utf-8?B?NFdaSmFtelNIcnVvK2hRNnRGMkZCcmgrMlJCRURWZ0ZtRFM1TmpVWlBEMHZN?=
 =?utf-8?B?eU1xaE9PWENuUnlaY1pNMmFqSC9DOS9xMTNoVXdHaDNYVXhpdHVZTzhsaW9l?=
 =?utf-8?B?MkloTW9NVVdUMmRKYk1NcFdlVXl0QUk0NVhqSzJiZWlNbTlmWkEvZUtIbDZu?=
 =?utf-8?B?RkRIMkc0SHRYVVZXeTdiVDhucmpuaVc3V2tyeitXWVVEUFozRTdVOURvb2Nk?=
 =?utf-8?B?K1NXTnJoOXVGTmxUbTl6OHBLWDJFZllxVVJFUitNbjUvNU8rN25mS2FUODhD?=
 =?utf-8?B?OXNkNWZjVDdrZmxhR09PRFFGdysxNlloMUx1bUx0S05zWFRUMFdzbEFvN1N6?=
 =?utf-8?B?T1JnU0txSEJZei9seUptRVE3bURreG4vWVk5UWtEZUJQR2pJZHpVNzFuNWF4?=
 =?utf-8?B?ck9IYUUrZUVZWWpUbnZsMDB2enJua2tWZ0psZzVQREJ6UytmbG1VUFlIVmZV?=
 =?utf-8?B?bHAydS9HQWViNVo1QjZXWEwrenM3TUJYc0pPTU1YYzFRbS9KdFNXbjFtYVAw?=
 =?utf-8?B?eXBEcWEySXM0Q1h3ZUZZTDJlRjhPVU9xSWM5L1NzMzZWU1ZPZENsa2t4dExk?=
 =?utf-8?B?UDRMWmFUZzh6aDlSNXp6eVE2b3I3NWFQdTNGT2lCa1ZCZ1F2WFo0ZnJQOUR0?=
 =?utf-8?B?aWQ0R3VqeThqdk91MFh0MWpiOEZ1RkZOYjhaZUFyaDAxcmtpb0ZsL2tNeTZV?=
 =?utf-8?B?amM2VTB6QThuOS9ZUnhyanJRSjVqcE1rY3Z4U3ZUMlE3N3NqS09CTTZiZmlK?=
 =?utf-8?B?eGRkQ3VueGo0MFBmSmh2NllGY1JyaXNSdVhnUXlMSFlzd1liNnoxUTZNckly?=
 =?utf-8?B?UXNPSGYzWkhnRVUxUDBaYUxkQnZkVXkwZjBJQUtTV01ORU04bktEbGVZZUFi?=
 =?utf-8?B?VkU2ZHJqaURrSk5WRnNubmlVRUwzeTlXU2daZ0JGK2JlM0tvZDdkNERMSFJz?=
 =?utf-8?B?ZENkTFUzTHJOR3hSUCtPY1RJL2l4Y3Z0VmZXZEZ0ajNPQTd0NXdlODNZWUxF?=
 =?utf-8?B?QnVOSEtvQVRvRWQ4UUtqSFZEZ1Q1WmU5WlhyeVhsRVA2enJpTlE2L3ZVUEw4?=
 =?utf-8?B?enFCdEpHcDQwSzUzb0tCN2ErRTlZVWhLTVp3cWVNQU5aYUJUZ0d5Y051RU54?=
 =?utf-8?B?MWpxTzR3NllzT3FBVXFUQU9MTDRlREJla1hKQmZ0YkNVNFFldDBMVnh3TmRL?=
 =?utf-8?B?a3VtNnpDL2hreWNmajdHOUEyWnFJVVBUdzl6b2hiSFRiZTgzNVFSOGUzRFpu?=
 =?utf-8?B?MlJmbEpZTG8va2E0U3kvVUozejZlMGhVanc2SjhFSEFONHR1eE90aTFhS2lI?=
 =?utf-8?B?L2VFVnVDakVjclVJcFFBVE4rMUpvdUJZQWlHT0d2eW1OQkNzMDBWYWtZVDVS?=
 =?utf-8?B?Z05QbWFWaVhiQTZZTFpEc1c3R0IvcjN6SVdCeWxja2REZW9mZnFOZzNoWnlq?=
 =?utf-8?B?NnB6bGFod2xVT2kxRWNCR1dyd2E5Z0ZNNExLWHVzRlAvYW1tTkZOaXdWN3dp?=
 =?utf-8?B?S0NTSXZBekxQck1QWStnRDlIWnk5QjZSZUtVZzN3eFRCRDBFL3FxTlliU0VJ?=
 =?utf-8?B?enNoQ2UvMm56aXNoN2VFYmhMLy9BMnB1V3RaUnhPeE9uc0J1WnNhMXNMWlor?=
 =?utf-8?B?NzlyVUN3WG92a3lJMVhTUVY1UTZnODNEd25CM1JaajVoUUhhTFFrU3EzQ2lx?=
 =?utf-8?B?RXBBR2pkQWdXYmM3c1R5T3Q1RmhRMHV4QndPaFN5TlI2Syt4aWNXT0VUd1FN?=
 =?utf-8?B?ellxUWc0MVZ0cThsZHJGRTh4V0VJOUpRZzlzM1ozV0MwT3cvaktNV0JYSmov?=
 =?utf-8?Q?UfmrDh2O9bKfYijaDmizqiZAu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f20d7a2-c4be-401f-9346-08daa21cace4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 13:15:27.0885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFIHTt5FRwsImi5SohNJT9nfLbf8J+eWZ0XEOJEBTuTib+mLFDFiZgvPs6CE8kNLF6XkQW+ma4TU8TPcsPKJXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=2a01:111:f400:fe1f::726;
 envelope-from=den@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.099,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/29/22 13:48, Markus Armbruster wrote:
> "Denis V. Lunev" <den@openvz.org> writes:
>
>> There are a lot of commits descriptions which are rendered in the
>> 'git log' with line wrap. Apparently, this is looking awkward. Let us
>> add check into checkpatch.pl for that.
>>
>> I am not very good Perl developer, but there is an implementation in
>> Linux kernel's checkpatch.pl. Linux kernel people have faced a lot of
>> obstacles here thus direct port from them looks beneficial.
>>
>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>> CC: Alexey Kardashevskiy <aik@ozlabs.ru>
>> CC: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
>> CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
>> CC: Paolo Bonzini <pbonzini@redhat.com>
>> CC: Eric Blake <eblake@redhat.com>
>> CC: Markus Armbruster <armbru@redhat.com>
>> ---
>> Changes from v1:
>> - fixed formatting to match one in the checkpatch.pl file. That was not
>>    obvious :(
>>
>>   scripts/checkpatch.pl | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index d900d18048..fe1ff6c97d 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -36,6 +36,18 @@ my $root;
>>   my %debug;
>>   my $help = 0;
>>   
>> +our $signature_tags = qr{(?xi:
>> +	Signed-off-by:|
>> +	Co-developed-by:|
>> +	Acked-by:|
>> +	Tested-by:|
>> +	Reviewed-by:|
>> +	Reported-by:|
>> +	Suggested-by:|
>> +	To:|
>> +	Cc:
>> +)};
>> +
>>   sub help {
>>   	my ($exitcode) = @_;
>>   
>> @@ -1303,6 +1315,7 @@ sub process {
>>   
>>   	my $in_header_lines = $file ? 0 : 1;
>>   	my $in_commit_log = 0;		#Scanning lines before patch
>> +	my $commit_log_long_line = 0;
>>   	my $reported_maintainer_file = 0;
>>   	my $non_utf8_charset = 0;
>>   
>> @@ -1585,6 +1598,19 @@ sub process {
>>   			WARN("8-bit UTF-8 used in possible commit log\n" . $herecurr);
>>   		}
>>   
>> +		if ($in_commit_log && !$commit_log_long_line && length($line) > 75 &&
>> +		    !($line =~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||
>> +                            # file delta changes
>> +		      $line =~ /^\s*(?:[\w\.\-\+]*\/)++[\w\.\-\+]+:/ ||
>> +                            # filename then :
>> +		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i
>> +                            # A Fixes: or Link: line or signature tag line
>> +		      )) {
>> +			WARN("Possible unwrapped commit description (prefer a maximum " .
>> +			     "75 chars per line)\n" . $herecurr);
>> +			$commit_log_long_line = 1;
>> +		}
>> +
>>   # ignore non-hunk lines and lines being removed
>>   		next if (!$hunk_line || $line =~ /^-/);
> For comparison, Linux's version:
>
>     # Check for line lengths > 75 in commit log, warn once
>                     if ($in_commit_log && !$commit_log_long_line &&
>                         length($line) > 75 &&
>                         !($line =~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||
>                                             # file delta changes
>                           $line =~ /^\s*(?:[\w\.\-\+]*\/)++[\w\.\-\+]+:/ ||
>                                             # filename then :
>                           $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
>                                             # A Fixes: or Link: line or signature tag line
>                           $commit_log_possible_stack_dump)) {
>                             WARN("COMMIT_LOG_LONG_LINE",
>                                  "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
>                             $commit_log_long_line = 1;
>                     }
>
> Differences:
>
> * Initial comment lost.  Let's add it back.
right. Good catch

> * One fewer line break, and spaces instead of tabs.  I think it's best
>    to stick to the original there.
right. Some places are correctly filled with tabs,
though there are some lines with spaces. This
is a bit boring as QEMU style demands spaces,
but ok. Will do.

> * We don't have $commit_log_possible_stack_dump.  Should we?
made specific check. The real question here is the following: should we
allow commits like
205ccfd7a5e hw/display/ati_2d: Fix buffer overflow in ati_2d_blt 
(CVE-2021-3638)
to be passed without this script? If yes, we should invent something
similar but a bit different as userspace callstacks are really different.

> Initial Linux version was
>
>      2a076f40d8c9 checkpatch, SubmittingPatches: suggest line wrapping
>      commit messages at 75 columns
>
> Updates since:
>
>      369c8dd390ba checkpatch: improve tests for fixes:, long lines and
>      stack dumps in commit log
>
>      27b379af6102 checkpatch: avoid COMMIT_LOG_LONG_LINE warning for
>      signature tags
>
>      36f8b348a94c checkpatch: relax regexp for COMMIT_LOG_LONG_LINE
>
> The first of these also messes with $commit_log_possible_stack_dump.
> Added before in
>
>      bf4daf12a9fb checkpatch: avoid some commit message long line warnings
>
> and updated later in
>
>      634cffcc9478 checkpatch: don't interpret stack dumps as commit IDs
>
wow! That is amazing thing :) I was a bit lazy doing this porting.
I will definitely update the commit message in the next submission
with this info :)

Den

