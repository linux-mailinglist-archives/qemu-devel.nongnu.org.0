Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC6134009F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 09:06:40 +0100 (CET)
Received: from localhost ([::1]:48600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMnfz-0003gv-OG
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 04:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMneG-0002tK-0x; Thu, 18 Mar 2021 04:04:52 -0400
Received: from mail-db8eur05on2098.outbound.protection.outlook.com
 ([40.107.20.98]:7456 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMneD-0004S9-4W; Thu, 18 Mar 2021 04:04:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GukMGYLdUIFsiyGDLk8V5bQ3iUqScoEy7IOM34bsLlc5SCaKwzuEIxn5jXeVBmEfrM9zojdTaA0EMJUEO+GQpxeGqcs7ukEptyN6NPa2kpycDkCBAH6l9WNRu5CknkSvv1iKsVfhip3C5MycAd5JdYg8wjrDGQaa2jG0Helkkc2bg0muHOgexoBD1NWNi/FywF/ahdDSpcR8PiyIjv0zElLSz5w0ImxmrWDo7p0GIstG9v9sr58RaWXmHFp6h7C9uiQPMZuuz3GE944BAU2KWH3K4XdBmH+CJ6ejUCaTXlWcGET4BQwCMUasKUq5lgSdIfV9Lk8V62HJATEOFfHeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6O1G0TVidRwWDlCS1Exu+5RT1M6Uc2XrdMXKqdIQ+A=;
 b=WOfhJDj/XUEOO1NnFjg01EIknlSfz2/0l/iIeJs00+pI9SD0wg8cvB/5wCvAYRrt95KEW22lGGm/7NfsTlkkd08HSJ/2QsGt7UXItr4omv+TRFB2Q7xBUYpq00vaiHV3lwwUOrZqqMGXZuAZCs3v8kIgeU15n1X+lhrk97MMkG+Qe4c3FXWut580JjQ8Ak2hpLl2M9fgMrNu7uY68bMNzgLGshOsImQ+Tp/ekvhA63Fg5R0Q6O13jcGBzvMWRwA8uL92CjvaTxJzOATNBMtIvrJKg9XSADOaItyW5q0HnqVFOM4Dd5HMhQZxgzHE2fGJBAqSsroW0usNlTDpsiWowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6O1G0TVidRwWDlCS1Exu+5RT1M6Uc2XrdMXKqdIQ+A=;
 b=Fqzz3bWSJ7D9z6OK7BhqB4CS0iWo+0KMRgCh+F7NovRjcnYhvSvfCk4H443VS2Nw9A4P5D/ZDEscnF9jNvI8k+aeYaV1msipOybgzJg/pfCefeC0EGk17q8sDSCfyyeOmwGv72iO1O6GZG+1I+x+TP++ZIiDDChsdU0kmYmggMI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 08:04:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 08:04:43 +0000
Subject: Re: [PATCH v3 00/36] block: update graph permissions update
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
References: <161599451628.29996.16299734673859684875@c9d4d6fbb2f1>
 <dba437c7-dea7-5675-9b88-b72ecca561ee@virtuozzo.com>
 <80051665-bcbc-1d6e-a0fc-02da172f6a21@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6c56b00c-3b5e-d5d2-e584-75073171c320@virtuozzo.com>
Date: Thu, 18 Mar 2021 11:04:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <80051665-bcbc-1d6e-a0fc-02da172f6a21@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0110.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0110.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 08:04:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3049e538-58ba-4094-24e4-08d8e9e47d16
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4689583A26A23A6C9C2F4473C1699@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QFK32GJuJ/+JOCxy8H0z/xwNx+UhNBluYda1VoRWytip+qd/SJ2bNL09aKqdc+PSVdIFe4HFRy7MWkwS7Pa7aA4U1a0/44pYawH/xcD44Jq09XVLNPIQHDfN7pde3ICKwV4QwNDKAU64pGRcWTJs12n3AT4q6K0c/wUj0uHgQtVzObYYmPaHYYrwoBJsYFSWM0/VeFmonvlnKjBPTn/tK+7fg+kVZUPQsbMNKjPsaiwigpUiRhRp5v3CFhwE9/xxFFC1MywkNhuBcotW7r+R5rkgGuYAsYVJKRo6y/G42nsJHy3AadalPD5QIzYJUUUI+zuwWryFaFag2OBZ3fkomoE3iaBsthF3yWG+mV5Zd8YhGIcxjxxrVfvKcUish3p8VN3f66exNYlmsREDsGqpywiVOG450wFVqimT7/U//GQ2tFott437Yxu+7TelqNSKP+p9nc4Bh2j5O4C75aB/wrC6irKAlomLbeQB3Qm2bJrjZLf1ssusvWtnld++bPchV1eIIxXk86wZBobvs3oLg3HakVxEzdUPw7GSmyTdvH0yD630iM+QNWuCuJ0tL5hivh6H4MYI9YIEZGmV3aYMo7flpMjyRjVijFgzXfZBzNxVNnLFiTMUC+N1tewgbazGyDhfoMz+Ox8Ax3ia7SyFs6pt9rOH5m/wuJRdLFL5DZK+IBVtjxse939DSxjHB+H9sk2fw9bF1C7dasriHZmhJSsJgCkT6q0mwkusVtXegxfU1pklDUs1wngdR8d/sM6s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(39830400003)(396003)(2906002)(66946007)(15650500001)(5660300002)(52116002)(26005)(16576012)(36756003)(66556008)(66476007)(478600001)(31686004)(8676002)(966005)(16526019)(316002)(31696002)(956004)(186003)(83380400001)(6486002)(86362001)(4326008)(8936002)(38100700001)(2616005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzA0aW5rNHEyNDJHSTM2Z0xnMlpQZjc4QzZhSWdtc0NtL25jdVluWThhMStX?=
 =?utf-8?B?WXZSOTlpUk04MXloTEpzSlo3VHQyODhZMERianMrc0tjeWlIWE9pS2U3ZmJM?=
 =?utf-8?B?ckdiNWMvSFJhTkpNd21BeEF2Vi9QcThEWjdzOHJ0U2Y1bHplcm5VWEg2RkdO?=
 =?utf-8?B?VEZ4S1d5d0kxeUVCMVJaMS9SMGFnMFU4UU1haVRiZ01wVzZPR1Y3TzJYaDRF?=
 =?utf-8?B?ZWhKVm9DODN5M0IrOE9FanpMZU9zU3czQlorcC9oZkMyK0lnWTNrRVNPSWNC?=
 =?utf-8?B?SU5TNytBN3FLVHVzaTAvQzBwSFQ0TGlLMGprQ0VuUUdobEFwVUV4dTM0cVF1?=
 =?utf-8?B?TzdwM2IzUURpR0tRZlpSTHFDeUdlemVReUZUYWFoclFwWmNZci9RVTk3RkJM?=
 =?utf-8?B?WUIyTWY0TldlemRHdnhtWEdac3hmTDRtaVhIK1RzRG9zdnpjYlUzbXBHQXpm?=
 =?utf-8?B?QlQwNlZyRVVlMWwzdGRlbnYyZ3FITk5jVVJFWFI1NWRpUk1oNjVrZGozM3B1?=
 =?utf-8?B?L0JMT21rWlR0QzhMZi9WQTFkV2RPTDVrVVZkSVZWajU5SGxPV0ZQYVhuZThM?=
 =?utf-8?B?ZUR2eHZSMisrU2lmTVpERUFzK2R5SEJObm16amhHSGJPd2dpb0E3QXByVmlw?=
 =?utf-8?B?UTlleFdWd3FDeWErL0Z5a2ZWK052RGhua085Mk9MU0RaaVJQOWR0Z0h6ZEZS?=
 =?utf-8?B?TkcrQnNIZ0pIN0RQMjBxdEhFaWpYK3pCcExhSTFxWVM0UldDZ1ptOGxQWlI3?=
 =?utf-8?B?YWcvOUFQTzJDZmdKYjNoaTRpSTU1cWNLcHlsT1VhN1dQT1JteXAwRC8wOXlS?=
 =?utf-8?B?eHFsalhJRHdzSzlZT0NaYTVZYTlxemxnaHhRakpLZVFITlJaVEd1QlZSMmJX?=
 =?utf-8?B?RE80cURhYXE0TmF2TkZ2M2FkUUFpcjN0U1o1eDdoOXBISHdtNi9UUG9EMFRs?=
 =?utf-8?B?aEVRNEt0citOQ3BHRDh1Nkx2c1U2MHJCRm56R3RiOUp3MFdiNEtDRW8xdDVG?=
 =?utf-8?B?TExyR0M1dWJTRllkVHJ2S0E2YStWd3IwZUJacjZOeGlzODBtdDBRZU4yWmNZ?=
 =?utf-8?B?YjhEdHV1YkJIZmc0ak5tVGRBc2R1dGwrMVNNeXRaU25HNmZaOXAwTzBIM20y?=
 =?utf-8?B?KzRzN0JvZmV4RTgxTTNxNWNiZUZHeUFGTkJUM3hDUUY0RTZySlBIZWFpK1dE?=
 =?utf-8?B?TmFCeks4Nm14MlQ0L2YrTWZhUXZZbGJYVDY5NU1VZnI4dHRISVFsWEhOWWpo?=
 =?utf-8?B?ZkZWUGhtdHFEV2tZQ3dlLzM0Zmw3SFhYWSsveEZJanBWbXc5WWZoVTFNNVZy?=
 =?utf-8?B?UlNkc0ljWE52V2JPaUduZkJaVGRubGNUM3BoWml4bm1nalVsZ1BuY3JRMUFU?=
 =?utf-8?B?VXE5dlRXOXQvQTJxdFk0aENtVG0ySElKV3VUK0g0YUZhYTd4SGVsWFRRbXQr?=
 =?utf-8?B?cHJ6bFJIQ3llNDdwTzFoQjFiT01FVnRHcWpCQVFLWVlyQmVaQjNwMnNYb3pr?=
 =?utf-8?B?RmR5ZHFGT0dYUkZ3L1p6dHNBNjVVamlLRk1VUUJVVEQ1VXlUVll1d3VVekZM?=
 =?utf-8?B?QUNhMXQ1TElmOXNRZWNVMUlWVTNRWUd5SDAvYkh5OFEzYjI4MmE0cUJYRmN3?=
 =?utf-8?B?emwrWFIyQUZYL0hPR3R0cnl2UmNIRVlqMGdGVzVQRzdteUF2cVl4NktJSU9T?=
 =?utf-8?B?Sko0WVNFWGQxNzgxcFZteE1wMTRXRStaanBySUVuV3BjZ3h2aVhmeG1IR1R4?=
 =?utf-8?Q?+W8SUYMXcPG6KvoUd5OxdH2Rm63Rr2sOmwPSj87?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3049e538-58ba-4094-24e4-08d8e9e47d16
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 08:04:43.4697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aB0eMoQJFesQQRT6s4CErNtOiksSFTic1sHqDxNvrWmIqmiHDOOYOCMHkDQq/gK42IuH46jjaqNwe28t7d/dck1zvTSPwrgwtZYJ8ZZ+AmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.20.98;
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

17.03.2021 20:33, Eric Blake wrote:
> On 3/17/21 10:38 AM, Vladimir Sementsov-Ogievskiy wrote:
> 
>>> 6/36 Checking commit 5780b805277e (block: drop ctx argument from
>>> bdrv_root_attach_child)
>>> 7/36 Checking commit 68189c099a3a (block: make bdrv_reopen_{prepare,
>>> commit, abort} private)
>>> ERROR: Author email address is mangled by the mailing list
>>> #2:
>>> Author: Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>
>>>
>>
>> Who know what is it? Commit message, subject and "From:" header are
>> clean in the email..
> 
> The list mangles mails for setups where DKIM/SCP setups are strict
> enough that the mail would be rejected by various recipients otherwise.
> But I have no idea why the mailing list rewrote the headers for that one
> mail, but not the rest of your series - usually, DKIM setups are
> persistent enough that it will be an all-or-none conversion to the
> entire series.
> 
> At any rate, a maintainer can manually fix it for one patch, or you can
> resend (if the mailing list keeps mangling headers, you can add a 'From:
> ' line in the body of your email that will override the mangled header;
> but since the list doesn't usually mangle your headers, you may not need
> to resort to that).
> 

I'm looking at 7/36 in my mailbox, and don't see where is it mangled?

Looking at message source I see clean "From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>", and "qemu-devel@nongnu.org" is only in Cc:.

And I've sent the series by git-email, so emails in thunderbird came from the mailing list in a clean way.

As well, message looks good in the archive: https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg06288.html

-- 
Best regards,
Vladimir

