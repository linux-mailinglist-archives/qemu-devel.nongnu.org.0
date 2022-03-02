Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F228C4C9FA8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 09:45:29 +0100 (CET)
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPKbw-0002G8-S7
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 03:45:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1nPKZE-0001Va-SQ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:42:40 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:9128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1nPKZC-0005np-JC
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:42:40 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2225V6iP032144;
 Wed, 2 Mar 2022 00:42:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=USoTCSDDg4LgXaUZguCLbEk8eyLJOAQYR74bSz/0wt8=;
 b=vKM01n43qzM4qjN9bI9hulnryAYm8QJ3XK6x+OerYRQQ6pzyNZb5yu2oBxLve7N8ZonJ
 E/IjXdbesCQbFINiDtCJLYTA2UEsPA5RpEsO0p4+UlRA6J9BB0jjmttEzPvhCX8XfiDN
 u+YMWPcsCKYR0Zk+9omXJL3cDoTsBfVYIc7FzyahQVRMUj50S8ajoDhZeAuZeXWDkqEG
 k6As85n7gz2+D/8a5HPyByCMKT+2GJYo0FZ9ApwZRTGUEYqRLfZke0FFoMZJ1Uj41sni
 59+6OK4RNsIfq9Fh8KWxXlS2AUofCkA25qbhVxvWP94Tsac3eoEwaArSDKIcHu/nEMIR eA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3ehsau1b7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 00:42:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nw7SnX0Hxg8S6WbL6tqgisIxFpPk5JMgc7w1P+BXro3+ssKVuwJxrJkNI1qhu68vTvuhRVbS4WkSWON3ckMXOmYze9ZFqqWUH3Txh92w0dI0g8tnM2aEaYoD259Luet4AC9sxU9aGziE68p1vLGA+uWBrav6/Blkxy9JZTnJSxT0C593ya1lFxeniDg+/mghXwt3iuFYNTtQCRgNzJPxoSP2JpX4gN5PcFBd7J0H3qaNksRSyesWJNV8LC+YjVigw7B0bsMjDRDSQ1CGEqSv6cfK7NHBpmJzeXUpz8uITLa5zT95VJR2IUxiIQBRoQunSaPEsJ5CedafHXMyjO0h2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USoTCSDDg4LgXaUZguCLbEk8eyLJOAQYR74bSz/0wt8=;
 b=nYuEIcjwd6xalNGjb+WDwjoELZjQdIWDtj4Jyjk8Dq3aeKTohmgEgMLh/n50a/fHZUkb5zYqeczaQmh43ijJj07CQPmqBdYHRF8uC/DXswQsrYbi5KUUA02IVxNJEjVM550vvmFtj4DpLoBFKXRPj0P0t/NnXP8mzWEenzoDcRuMknXK99mo5B5bBJHmu+W2Buc7yrwOMECKOUH65huIup8yGbkHcI/vUoe6DCQNCOJR89Ni4T3LguUmyxGP844/FPfma3L6l6SNH+hRRtW9dEqWXYxG2FOgWCBX2M6yNki7QENJ5PPrjXk6MuM/oDN6BSDrDdm8PYNLzUsXNenmRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com (2603:10b6:a03:3f6::16)
 by CY4PR02MB3208.namprd02.prod.outlook.com (2603:10b6:910:7d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 08:42:30 +0000
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::457b:b36f:8cd7:af59]) by SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::457b:b36f:8cd7:af59%7]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 08:42:30 +0000
Message-ID: <65ca72b3-a6c9-f5c8-3652-108c2bc6589d@nutanix.com>
Date: Wed, 2 Mar 2022 14:12:12 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3] Check and report for incomplete 'global' option format
To: Markus Armbruster <armbru@redhat.com>
References: <20220216071508.412974-1-rohit.kumar3@nutanix.com>
 <87r182zzj8.fsf@pond.sub.org>
From: Rohit Kumar <rohit.kumar3@nutanix.com>
In-Reply-To: <87r182zzj8.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::22) To SJ0PR02MB8564.namprd02.prod.outlook.com
 (2603:10b6:a03:3f6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c79afc1-d089-42f5-b515-08d9fc289631
X-MS-TrafficTypeDiagnostic: CY4PR02MB3208:EE_
X-Microsoft-Antispam-PRVS: <CY4PR02MB32080D447E6AF0FCFF797B53D1039@CY4PR02MB3208.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RVSpBH0LE9rdLlLj3PwdJRKXwvWkwsFxklmN9nAsK0ag7LgBZGJxXRJbZGSP6f5lpqa/gVpgrMxnwSFFywjSDXF5h6QHAHaTJFaevLYP6H5ojgjRnDf8a6idteXgnYY3n6PjErU+7jeDkpolNOfYXQJr8XdMozgBlaukBJx/jKr2fElRqE+xyetCP30MAFvMLruwPVb7xmZLr1B7DMbze4CHhWyhX0Os6bl79/kYfzUWrduhWi8rysJkq/M3MKEQGQwdc2W7gw8JaLP0LhWN2HzP4ktyZ2X+egxTbZqThQfkqPwqqNI+niBYq41ZHIspdr9L4SjTmsjDhBBhhhmU0nnyq/kJPoa/h4/P1SP9qc6hlVbCBx3uGJJft0O6sEbHViDoYCrytYjjBICcH2jS+VIWaaq42aNBqa1jFGGXbsDsYN5ChJm4PV0oM77xSSnNt6fee5j1r4EA+gEntW4c/f+AOjLuV1WhNP3IEhUOTUMyhdqaIWHDHjwCkdzsZPcHQ/oQ8tW/1XE7r2YU5Z1H/B7xiPjdbKGw5uafXMBFAD4GPuMeVWgPzw84qheGyyoA+hZIZtVCfsjCjyBKf7epr8ZMrh2rMxyW/TRluAD6UfGo2h3p5wz7GeBWa7QrXWIh83PVvuyG8NwsTI5YXwEykbb6ol9IkpvB/d1PrVND0KPeN9TcdIWAuMaWoWcz9nidKmNCzfdw1bi4ztr90TuZrqUX0h0XTJzSjKdDk57rUvDZy9WybcGJobRroLYlXu3QeAMfIlKildEOFlv2GzF+Q04JEN0CDE52X4wcPM2sQKsDLvixX+8Ll/0a7vFuWt1cJjdTXS8Pm4086n3Zq3gpqRJNgSD1DIbZgi0WhuEayd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8564.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(83380400001)(38100700002)(4326008)(508600001)(966005)(8936002)(8676002)(6486002)(316002)(66946007)(66476007)(66556008)(36756003)(6666004)(31686004)(5660300002)(31696002)(6512007)(2616005)(2906002)(53546011)(6506007)(52116002)(107886003)(186003)(26005)(38350700002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFI1V3B1SS9SMElGU0Z6K1BWOEJGWk8yd0tLMjQ3a3ZycVZocmE0Ly9ESE90?=
 =?utf-8?B?a1BscjJZMDh2KzNSYVpzeVlWY2lnY1JoWkVzbWpadDJlTTcxV1h5NWhVOG56?=
 =?utf-8?B?bndRMkJudG1kUGNMVVd2emkyVDkyNnJGdEFLUUZKNkJIUkp3UUpiY1R3dXE1?=
 =?utf-8?B?dzYrTjF3Sk1hSGpkdHZiTHNUV2ZWeXFTQmZ0NStSdTFjMU1WWlhVLzREcTd1?=
 =?utf-8?B?MEJpSlc3Wk11cXVPMXNWZDF1eUxyS1RhanNmVm5WODh6VSs1Nm4wcDNMOXNZ?=
 =?utf-8?B?aHJUWlZZZ1JIWGxvN1UwMjFuRmtzWmZNVm1QMXJ4QkhkQk8vN1Q5MHl5Y0N6?=
 =?utf-8?B?QWxtbFJtR2xldGJuR3V6Y1lHQy9Za3Nlclc1RWdHU2RaeUZkR3o0Rm5mODB2?=
 =?utf-8?B?NE85MlY3eVAxTFlqSG9HcXRMOTJxVHM2aTNBTDhva1l2MmlrK295Q3pMc21p?=
 =?utf-8?B?ZWRmRkRCcmk0QWpvbUN6Z21pd2pQT1puRys0RUYxVGlBQXlsOWwrZ251ZmMw?=
 =?utf-8?B?blVxWUQ2b3BGLzdUalRVVUdGbGNoYWF5dlRzbW1wMWxzTmtkQXgyWURHelVy?=
 =?utf-8?B?VUhEWTloRFc2MHpMK0pCMWJuK1ovbTFuK3Zib3Fmb0RuR2pvbDJadGFqWGw1?=
 =?utf-8?B?dlZyTmU3MHI2NlhvR3NoQWg5cUpVQ2tuc3NydEN1N0FHTVc3b0d0QmZzc1d6?=
 =?utf-8?B?djJkNkVDdVgrL0RFclBvWWJ1bVZmNmJ0ZjdabVhiM28vL3ozdE5OdWErWUFZ?=
 =?utf-8?B?eWwyQUwyZHdOK0o0RmhhK0ZOVVpsdVhEWmdxWldrUTlEYUtabEUyOXAvNzgw?=
 =?utf-8?B?L2EvRUh3a2hRMkthaGY1SUpNRGxCemhyL3h0MU9UMDNQQ1grSlpZWEViVXVh?=
 =?utf-8?B?Z205bE1tSXNreUl0UVlUeTdpZUErSXppQXBoUjRHWERCSjkzOWEybFpIbE10?=
 =?utf-8?B?SzFjaVBHVTZBWkxvTHZsOVpzTGJaRkJXOXJNOE1qSXlYWTF2ZmVycTlhSzBz?=
 =?utf-8?B?KzJhL0NXZGUwOS93VDNBazVxTnI3WHdEZS9xWE96TjJkWkdqWGNuSzU5bkUv?=
 =?utf-8?B?QkY2NXpYalF2eXJpTlZvNlh6V2tJR3hZUzhMTnUzemVmR0lBc0NmcXBHZjZF?=
 =?utf-8?B?d1dtRDJQYXVrSE1wNnZ2bWxQcmhIandJRGRORUZyM2d1YU10dVNtbXFPanBK?=
 =?utf-8?B?TVFxa0g5dzhOUXVUQklKeDlhLzlRanA5eEZvcDJTUExkamFUK3dnMzI3MXNo?=
 =?utf-8?B?M1U1M3pUVEtDTmoxZlFCSG5sby9ta3p1WmZGQmwzZjdsUjUzYlY4Nm9ydE93?=
 =?utf-8?B?K1hEcE9Bd1EyYUptVUZ3K2hoNEcwbG91Uk5TRC9yTWt1bm5LMzFDQ1BWNjhq?=
 =?utf-8?B?YS9mRnFROFUxdnYwTFJ4VzE4QU15Y0tRRk9lZ2VZRnNoYXB4TnBjQUlGWG1h?=
 =?utf-8?B?b280U2lIUTJmZ08wZHRxZmxHZmdMVnkzMVI0UXMyOGVaT2NNRzAra0xaeWNa?=
 =?utf-8?B?eWxFQ3cvVmE4ZmdiMXFySmU5L0NqemJXVG0zVTdCQjN2Tm9iUE1Vb1d2VVUv?=
 =?utf-8?B?cldYNktYc0pEWWZxQzNNNmc0cThGUUlQeVVYVWNsYVkwQ0UvQ1pMT1BDc2Ju?=
 =?utf-8?B?bVV2akVnbFIvdE51NU9WVTJuZjNHMEdwN1ZYUTJKMmprd21LNXNHNmpsQk9B?=
 =?utf-8?B?NlJEeDUwT3dDNmVwYWdMMHFvSHA3RFFaYU1vdUZXRDBHL2tlZnFzdHZNWE5N?=
 =?utf-8?B?c1lqQm5GdFBSMC9UWmwxb2ZXYTAveUg0WkJDZ29Kc3BGUmQyTFRKcFFFSGRR?=
 =?utf-8?B?S09kQkpIK2FXYUxrb241UW9yZzNBY1MzSW1Ta016eElXWHZRbXI5L1R0M2Fl?=
 =?utf-8?B?Qjh0TVpsZWpPRSt4NmZwL2xMUlJPVTF3M3VmV3ZiVkk5V3psL0pPcnl2WFRG?=
 =?utf-8?B?YTJCN1ZhbmM3SzFtK0pBZXdhMW9Ra3JvVjR6b2I3RnFSeThYVEs4cFA2YlFk?=
 =?utf-8?B?VFBDQ0lKZktCMHRUc2ZFOTZYUUdRQlRDTzBjS0pyY3MwdUZXMEtJeGlXdVNw?=
 =?utf-8?B?OGQ1RnhyeURpQ1ZIOUtBQW1jelJ6MkhXcEZsaVRLd3NzamoyellaR21HazBo?=
 =?utf-8?B?OFF4SWl2Y1kwMlhLZWxKSm0rNnMxdG5ncnlhc0llN1JaekcyTUxQaGpJbWlP?=
 =?utf-8?B?dTdtTkxmVXJSR0Y4TldHYktaeHhicGIzRWVUMHB5NjRyNjBNcThBSEhIY0Rm?=
 =?utf-8?B?UGJmeStMSXlmUE81VlliQ3V5M2d3PT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c79afc1-d089-42f5-b515-08d9fc289631
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8564.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 08:42:30.5075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRDso/0tAMoZqiVxaO1Bg9ckQZur3kphl4IvKxRarEboIrMIfNiEDFzD2ZWrtdUT9cGoWCVXvKSqF270Kchwqp/rEmQDO4DwPgEzmlKgPns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3208
X-Proofpoint-GUID: Ig2zfW7U0mRwNOjKCmgMi2GtOjvBN-cE
X-Proofpoint-ORIG-GUID: Ig2zfW7U0mRwNOjKCmgMi2GtOjvBN-cE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=rohit.kumar3@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, qemu-devel@nongnu.org, prachatos.mitra@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus, thanks for the review. Please let me know if this patch needs 
to be rebased on top of current master or does it looks good to merge.
Thanks !

On 16/02/22 7:25 pm, Markus Armbruster wrote:
> Rohit Kumar <rohit.kumar3@nutanix.com> writes:
>
>> Qemu might crash when provided incomplete '-global' option.
>> For example:
>>       qemu-system-x86_64 -global driver=isa-fdc
>>       qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>>       string_input_visitor_new: Assertion `str' failed.
>>       Aborted (core dumped)
>>
>> Fixes: 3751d7c43f795b ("vl: allow full-blown QemuOpts syntax for -global")
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_604&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=ABSkr7gy7ZTfApFfI-Xxt1gZNtsDDiXoXOXc0OrkyFs&m=_FT9FHpCayLV7VOqTV1sshekKFR0H-be14Rx8GwuhkF6FyEaMtUWc0vvbuoZOJP1&s=yH_2KUONf-QJFFyoSnAGOJIzyhREMalkQuli_BY-y4U&e=
>> Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
>> ---
>>   diff to v2:
>>    - Avoided double reporting of error.
>>    - Added the "Fixes" line in the commit message.
>>
>>   softmmu/qdev-monitor.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 01f3834db5..e918ab8bf3 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -1034,6 +1034,13 @@ int qemu_global_option(const char *str)
>>       if (!opts) {
>>           return -1;
>>       }
>> +    if (!qemu_opt_get(opts, "driver")
>> +        || !qemu_opt_get(opts, "property")
>> +        || !qemu_opt_get(opts, "value")) {
>> +        error_report("options 'driver', 'property', and 'value'"
>> +                     " are required");
>> +        return -1;
>> +    }
>>   
>>       return 0;
>>   }
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

