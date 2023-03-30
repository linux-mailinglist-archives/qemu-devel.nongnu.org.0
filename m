Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C836D0AA0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 18:06:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phuld-0008MR-Cj; Thu, 30 Mar 2023 12:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1phula-0008M9-U2
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 12:04:46 -0400
Received: from mail-psaapc01olkn2082e.outbound.protection.outlook.com
 ([2a01:111:f400:feae::82e]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1phulY-0005fg-Qc
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 12:04:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ac1jpDtU1ikpwIEsY4pZi9Cb+RGBhd29wzi2jKRwhJxffgNOiFur5Uj2FTL/8PJhoONK/rICahL6lsN/xllknA4q2i/sY5fVcLcL4MTlZgUCrCw5fEqrcn6WG8XZEBpI4Lq0bz0/siJSX9BjwGi8GEhj3laRiibnozI64KKheCZoSYle7SOqiU5EeG1g6iQ5x3drPrlQG4aSjIUlYiBITjrSpg9ghpi/V5lI2qELxlHkBY4tM7U7CGv57DrBeVwYBRsQIVwVisz23/PyY6Tvcuw8HVQY+TxroNq8KdI4oRhSgYdkn98/7dzMX35ysdxFmgJX8OvmImof6KEmSXxq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEHQALyRRCDE+/H10FHmZYf/veAjZnNx/exygM6g534=;
 b=gO7zndf7w1qftNsqY2RNzELPOxpaEDN5rKQhZW2odQwQPT1xlt52+NH0VRkqiq3gVt1YCY//hht/ecxaJSuUHvQGwXdu2+r3LxB/hH+5Yx4ogl2A98AMsUvD9KSK/AdHrwDKX9CF5cFulV66LmBG6uc9ux4nezFI0iWcCe8k+vySwQ2rqRc3Ov9opKdMK7Q6ovv07fXFgquIGbHsMsujJBDHj/bKaukDRjS3hDc99i1SXdAM1MrfS9nJHZ3qUpzHjTx4Pkf0Uoyg486gerx0nmXDOs5V/W8k/opFxMF0XR6F6GoTGW+JSJAroeezR/mu24I6IoDvFBvUFNuBXD0Jmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by SEYPR06MB5490.apcprd06.prod.outlook.com (2603:1096:101:b6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Thu, 30 Mar
 2023 16:04:38 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26%2]) with mapi id 15.20.6222.034; Thu, 30 Mar 2023
 16:04:38 +0000
Message-ID: <TYZPR06MB54183AB38C07830B212D54C79D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Date: Fri, 31 Mar 2023 01:04:36 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 2/2] linux-user: replace strerror() function to the
 thread safe qemu_strerror()
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <cover.1678770219.git.y-koj@outlook.jp>
 <TYZPR06MB541876821E3AD1306D6DC88A9DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 <87a5zunxep.fsf@linaro.org>
From: Yohei Kojima <y-koj@outlook.jp>
In-Reply-To: <87a5zunxep.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [r7wnL8QB7TMfYsJDL5H7Xl+vVSSO/RUfAW2DhOTlrQY0FmFYttxP/OUqSPjOLUZYyYd12MFOCdc=]
X-ClientProxiedBy: TYBP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::29) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <97fd637a-4a31-78d5-04c8-c1adbe2cad6b@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|SEYPR06MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: 94cb3329-cd1b-4b16-4d5d-08db313876a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RXYpAA+BTIDAg1Yinei6NkJReYPZe3AcMHbghtgS38KY8F3fcsuxvCducU+9Z03Vhx0CVBIzkmeaHmcUX37c9sfrHX2AQ8XFTQZRufWwHtbW8+X/6uffC3qEZSFxzHQowiLwCaewBssiKYPmJwdhLpYvTKH++i0Spafv0i/qllscqhtvPK21IYPFJ7oNiGNKSfrGEDhI+kUEE3GOiQgDYK+Er7y7CFuzriveDRl31KzWQA9b24QrLyWJB05J7rhIHMFnwJOvrdL5WcbFdBuIAukC+TndE8osjwucrvPqOfs64CDJHgoNzQW6WGCliXxEWwIbToS23tOmA09EWs4du3mMX2xRvLckn+4mEtHBowewW73vYu30Y7d66vP0CB8eUeoxPzzbvSQps4Wv4p1QM+7OHKy830+aqMRRmpCPVKseFCKzzdpfSQoJGu4yZAeXOwZYOJxzKvRjS7alId9AsBzvs79X5aDzZ8qGQyvzlG8caVpnQs9NnONuLu+gG00HVRGIPjVyCyqZwZA0xUW8nreg4+yy3ZK4oOYiwi//jXIWUfzLicEI51FAddO1L8Xnwwd1zV+PJAew95K2c+Mknwn0iX53GTaiENcxYefJUUw=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3NSamJlNXk4S00xcGtXM1NqcHRLMzliUVVEZS9xS1lvMXd3WFR5WGE5N1FZ?=
 =?utf-8?B?eWkreUlGeXVNMWFoVEM5WVdCS0p2VkpnSlBSUHN5d3Z1ZFJUc2w0MVJVcE03?=
 =?utf-8?B?cWZOamJtOXVoaTFTTHYrWTRwd0c3S3NSNzFYMXJESkFPOXVYZFljaE9XNVZF?=
 =?utf-8?B?U1BiZ1Z0VGRlNWIvRjJyTjJlQ252YlJBbW9wUVZHMDNJK2F1YWhHSktVS0RS?=
 =?utf-8?B?cmlGOXBMNGcwM1VPM1FaazRLZ001a0VTN3dwSVpLNzVWeVhkMWgwQllYd09q?=
 =?utf-8?B?YjhyQjdETVNuK3lpYTlpRm9vZitxLy8zN2MvQk0rNHlFUHJ2d3JVUUVHUDFv?=
 =?utf-8?B?dldSTnBYc2lTZnpWUXA1VTJkaW9NcnRqQW9RMXVkaC9RajdMUzh6eWVVQ2Rw?=
 =?utf-8?B?bDdFUGgvenQxVjhVRXg4T1ZPT3FhMlhDWnJyaENkL2pJcVdMMVRkMnlMbEFu?=
 =?utf-8?B?SUplV0lhb0VlZEdiNDQvb3ZMM1Y1aVlTNjlJR3orRlpacGZUUXQxQ0dTTnhw?=
 =?utf-8?B?bW9COERlUDBtcXBMZm8rTXcvSG41T1FFaW9GSnJCQm9VT29rZndkQm5NUno2?=
 =?utf-8?B?M2RHZjdRU0p1ekRLc3E3ZGNFWE5ETFlSSWhyZXNPRk10ZmVWTzVaZHVqWldD?=
 =?utf-8?B?bzFUTG83Sk5RZ01mWkdPOVhWa0Y1Z21mUHNuWFpPaUFMdEpTS2o5SE5QME5S?=
 =?utf-8?B?Y1dIVG9uSUIzSlFxQkZibHZKOW1WcTY2dmlhcFMwNXV0ZnE4dG1jY3VMcjZi?=
 =?utf-8?B?ZC9QcWFjTjZaMEl4c2pLd0t3NmVsc2ViYXpKbzB1MS8zQTJJVGU5TXBLS0R3?=
 =?utf-8?B?V0pUc0lxd2lGYVJpVXRIMjdnVVdtRHpXYTVXT3lIaS95bk9Xb2IwMDZwbUI0?=
 =?utf-8?B?VjQ1WjR3NitpZzhQeENKTng4VjYrRmNaeUdTQVZ4OTNvQ1FUOFJrS3JQdTk4?=
 =?utf-8?B?Vnd1MUI2WUU3cThyai9uWi9FVkRaNXVxUWZyVWIyekNDOFEwdkJqQmlFNjFv?=
 =?utf-8?B?VHU0dmE1Nk1jTjBuVTFJZGF3YkxxdjhuVXpadlliRmpSKzA0NXFHQW1IQ2hr?=
 =?utf-8?B?bURvZ0hRUHViQ1RRTGxmRmJwMlVzL2RmYzR1UkpzWlZiL09TVktqZUR3eUM3?=
 =?utf-8?B?RWc1R2lHbWhCc1I5cUVaL2NxR01DRmhsUnZuU0ZnMVlNM3BnTUhkUWdRMzBI?=
 =?utf-8?B?eHowd3NxbXR3SzlXWDEyS1l5WG9oeXJHQ0xObU5pWFVxUVptUWVlcS95eDd5?=
 =?utf-8?B?SUhScXpud0cwckhvNG0ya1RYYUhWNFgveG1ieDBmMjBMa3N1WEZITHIvVjRy?=
 =?utf-8?B?YnNwTklyTFFreWJLWWY1NDJUOVQ2L2pIZ1FVbjV2bWwrWkl6aDZtdmNUdW9J?=
 =?utf-8?B?NUI5Wmg3UmVYT2dDZDhZUmJMK3dmZ1ZjMEk4NWFnWVRNS0FsTEhrUkRQWWZs?=
 =?utf-8?B?Q1lXNko5dXBPTnAvT0haRlJHcURnZDh4cThNMWJFYU85bGxtKzZJdEJzYTBx?=
 =?utf-8?B?bzNFZ1dEbWVmU2Y4cytyQWFPT1E1SngzTEVjY3Fydm9RMXB6TWVxczRBMjlz?=
 =?utf-8?B?MG1PMGlaaHFDdnpmODlJajdSbWZpN0pFRkVRNW45M1o1OHRnTGFYQlBmWC9a?=
 =?utf-8?B?eWE0cUFKMnVpdEVHV2krRDBIemVIcmJqbnJzMGVsemJjR2dCWXk4YTNuK1lO?=
 =?utf-8?B?YTR3ZHlHaWJuaWVHcXBFZW5iY2pFM2ZSTEZDc0RQV1BML1JFNzE5S2xBPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cb3329-cd1b-4b16-4d5d-08db313876a8
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 16:04:38.4294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5490
Received-SPF: pass client-ip=2a01:111:f400:feae::82e;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2023/03/30 23:08, Alex Bennée wrote:
> 
> Yohei Kojima <y-koj@outlook.jp> writes:
> 
>> strerror() is not guaranteed to be thread-safe as described in
>> (https://gitlab.com/qemu-project/qemu/-/issues/416).
>>
>> This commit changes files under /linux-user that call strerror() to call
>> the safer qemu_strerror().
> 
> As mentioned on bug tracker I think you need some more patches for the
> other uses. But for this one:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

Thank you for the review. I will add several patches for other subsystems.

