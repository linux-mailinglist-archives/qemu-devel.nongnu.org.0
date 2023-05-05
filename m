Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BC6F8509
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:46:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwg7-000775-PM; Fri, 05 May 2023 10:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1puwg5-00076p-DN
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:44:57 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1puwg3-0000QU-0D
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:44:57 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34587Gh7031346; Fri, 5 May 2023 07:44:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=Qnnzih9C3o1+aED7unefZu68AQi64/C8SgImLyZ2eOU=;
 b=eYoPlh6tXYHdz+nZdCcgzfl5vrOZm9Oyg6vzZtt6lNW1xWRxHY6X/uV24r/KXHwUDN5S
 qalFV2RTGkAa6r/0u/jx0cGdfpx50JBbAHID4bgTAlBB+FNNc8jPC1h+V6Vpv8ltAJYv
 YAC2MYhfVf2fylzpDkvHKCimkjbbWFHxbpBeQcYeR+yDxJLnfCQYYGnYe28tr8vL4o1w
 f5pU6ZC9mZP5fUTtd7uMK/2+Dldmu3kMEnyCtqMwqLX4JN8ghwbq7Syyp6INUalJp4d1
 V1UgBQW0RlH6hkpBusWJ7VsUlHQsVzMoEIHdKI0fdtig+sSXHr3cJH2FuJ0sjc/ZKG/f 2A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qc03gmbv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 07:44:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJQOLjFUFzupmEc8oBCQmkz7OAE/Ft28nLqj0aRC1/fOK1RiZTK7DEWwFqmFk6rnVsmpYwoee2xlsjMT62uQWS3a4A/tvP62NSSOTezd/zZKfGs861yzFqdMtFi/Eh/jL2wuxlzY4JWvFHZC9XHUglmf2ZpgNRWEO0lSVG0M+LUEwkgt3bJYmoBkDNN8tn3ktceAN4kZOKyMsYyynHjOgmLom5nBdB9eIk4v7i1rvf4IlaR4+1etlsY92enkYRBJpXvu9AX5hFvBuAREYLWcxSm5z41rDdZl2rvjNtV2a/U+KDSWnynC4/PDoPqCw+SewfNy3UDY5kK2f/jV4sJ+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qnnzih9C3o1+aED7unefZu68AQi64/C8SgImLyZ2eOU=;
 b=aM2DjbDenpGh4gwruApOfTOhHdXyv2ChyGyVXqbKjBs5I3mrJItBYPkS5uZxfld/7igd5TBFWAHNIlLBxLMBWqzwNXIQzmMowKa8qwYe6C60lDbvi39QhChixd6MHHxlr8P5LB7EaiaNWF2gv0dbXSlUVr00Cctn2URLdtKC4HsHUokIMB/HCFWbDXKEzDRHzpvNl26NCHmczhRwLKLjDoHjShe7E4DY6bTV6ZSlemjyqxCgoGtqab6h6dcRxLqVCq+tQjSqcF11RlEgj5U4y24ZI29iCpOLjH6+9fxt91TPdr6kXy7oOktlI+h95N+8M+N6o9QpXok+seWzSOleIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qnnzih9C3o1+aED7unefZu68AQi64/C8SgImLyZ2eOU=;
 b=nNPmfy5Um2H8vxDnNjJ/DYCQ+EIh8Vlkeu06noUHudl4q9Y54gJ6Z+1KVSQVSXGhRn9xt6ywtJ+AyIT6E8c+9jcEtJ1/nmJflVwbrqO0/gB2SWKyO4ylWcji9x47tEhv9fqHtuMk9Uq7tunUNKiCPFzgCHr4+YRl2+etf6wdlrBnzxhc5u3E3RF+8VCh9wxKe3T94W3N5clHFKRzA93NQVARtIhFyOD51CzuaOhXIcaqO8pThT4GoW1MjP6LYefP60sjWxIktSJDlac/kmrMHWSf8w5iFO0skRFpvKxjFGHQ6iHKmNSALOvr08iRjEj7iCplbSic240U6j15TIUPww==
Received: from BYAPR02MB4806.namprd02.prod.outlook.com (2603:10b6:a03:42::30)
 by SN4PR0201MB8791.namprd02.prod.outlook.com (2603:10b6:806:202::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 14:44:49 +0000
Received: from BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0]) by BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0%7]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 14:44:49 +0000
Message-ID: <5dda3254-67e5-53ed-ea9f-00a7ed44951a@nutanix.com>
Date: Fri, 5 May 2023 20:14:38 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [RFC 1/1] migration: Update error description whenever migration
 fails
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, shivam.kumar1@nutanix.com
References: <20230503203116.42429-1-tejus.gk@nutanix.com>
 <20230503203116.42429-2-tejus.gk@nutanix.com> <ZFNp6t1DAhhRKc9q@redhat.com>
From: Tejus GK <tejus.gk@nutanix.com>
In-Reply-To: <ZFNp6t1DAhhRKc9q@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To BYAPR02MB4806.namprd02.prod.outlook.com
 (2603:10b6:a03:42::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4806:EE_|SN4PR0201MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 44739df7-4702-4532-ffa8-08db4d774713
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RWjxwCZg+8Zv9DLBzR7BN67z9IXp36QPAH4bQ7HJ8RzIZPBI9GQftzbOkinMKto8Oe4i96ual9Th3EesFEIHc/xk7cQERKOtTvxvhvsO1rnccSF+PGU18vgnUGP9cJUKdt+EJ9iqPJyikBeaqroxje62Bqou93y3Bia8EkUqRMNwknzWJ2tUdPRE+Ug0ffBXFfFXUrka3dwDCTUW8w+nhjCxaZUdOkTzlUjDhriXkc0Mk+Myur4/QB0JVprxr1G6V2bUaSiE32QrGeBOYbpqtvWGqbva2Z1OrKebYLQ2/4wp1div9sZiV29fPVacGTLp9bAwYUW4HSORpKqTbM8T0UuHzSIovDAWotb0BuFdurUFuknV16fxTlheyWYoH4BL2x8nFypeygHYbF8a7+hyIteNs6uKWBtb1muO2/OktqeRlCS71DO6FB4EAtwoh58vztcZjmJIUgbf2L611siBxm/H+TT7jlLv/ApGWWSfNtOh8yscBk9gUCACmgJtQZM0xSyn3risIITaH9QjCsevW1S2mU3O5RB0rcScfDxKPqI0+4Ki25hp+PzGqv9wVG3HsJPWzpfL8CvjeNu2IkgBLGywKehoBAzy+B6XT0Ps2bC80S0Wl9uLA0KNoCsHRI301gLO53ilYfB4mcXTYWm85fOwHemwZonLCm+xtPe0TZG5qqWjd3F/poqYJzsdMN7e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4806.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(86362001)(31696002)(36756003)(316002)(6916009)(4326008)(66946007)(66476007)(52116002)(6486002)(66556008)(6666004)(478600001)(41300700001)(5660300002)(8676002)(8936002)(2906002)(15650500001)(186003)(38100700002)(38350700002)(107886003)(6506007)(53546011)(2616005)(6512007)(26005)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ROZTJUWGxvMXRLMmhCeXFjdnExMjZ1ajh0d0YvQm1FV0JXRmFkV0xLUHdQ?=
 =?utf-8?B?MmJPNnoyc1R2ZG0wcHRMTHRPTU5OSkp6R3lybUlJWU0yUXBmQUc1S0NQRkI2?=
 =?utf-8?B?alE4RDM1cElYNzVNZk5UWjR6RFhKQzZweFFIRlQ1UW84TWJRMHg4UUhnUlN5?=
 =?utf-8?B?bVdGMnhCSWZpYjJ1QXoyT0FvdFNkUWdkMFNRLzdjYTcvczBva3VweW5ZVU00?=
 =?utf-8?B?L1B6b3YxTjZyVWtQQlFSOEJjclZEN09TL1A0RkNWdXp4SER6dWdYYkF3NTRC?=
 =?utf-8?B?T3phM2dXSm1DNjlzbkt4WS8zSUlIWGUzd0htRG9iQmFBMG1BWXdhR0FEUVFN?=
 =?utf-8?B?ZEFmUnoxZUJRajhmRnpxVEZEc1J4NzN2TzNFUGRTYWVMZ2RUZm5ETkpFQmxO?=
 =?utf-8?B?ZXJYeWtIYjR2L2xuSC8wem9RQlVORTFVcFFlVSs0dE41MmVkYVV2SnRQMzEz?=
 =?utf-8?B?MjhycElyUTM0K01DSnFiMC82cUlSMmcvYmNQY09FUzNmVlFtNjRDUVkzT3Ev?=
 =?utf-8?B?Wit1UmlwRUVScFM3NE9iRC9zZ3BKQTZFMnRmTURHb2VwNWtzZDN1OW43b2Fl?=
 =?utf-8?B?c1U3U29aeUJkK1M0d2JNRmFyNVkvMHRYN21DYjZJTFVnZFozazZ1VUZYMThp?=
 =?utf-8?B?VTBGRnRkdXhjWDMyS2JudjZjbnk4UjAxa2haQVZFNHJycUhQVEcweStEb2ZX?=
 =?utf-8?B?a0ZuRm5VZThlUnZKS0Y4d1oyTU1GRUxkQ2Y0SlM1MGFUbGFxZkNia3oxclZa?=
 =?utf-8?B?YnZheU9VL2dMZmxDeldjUXpnSWduSTQ4ekhWa2FUKy9CSHVXd1BKUG1PdUtN?=
 =?utf-8?B?VG5udFpVd3FJbHJRU1IwZG9HSVkraDNvTTkyNU1pVWtrUVpUbkd4NEpRc3Bj?=
 =?utf-8?B?MXVKdEczbi8zbkxlTm1iZ0YzajZhcjBRT0dsa0xOZW9XRE5EVkhSeG00SUhl?=
 =?utf-8?B?aFR3N3ljUWlNeGxzN09yU2xkUzVRaUg2TGxUQ2lRTUpBdmN4Ryt5MW9YMVcw?=
 =?utf-8?B?NFlkaHdkS0VuVHluZENERG84UDBUMXlYSWh6Z0NhU2dTV01mVEJUNGgyWXJM?=
 =?utf-8?B?cURUR1NqSGViNWhFck5aSVhDRjdrOGdsRXd6RUt1YVB0N29OSmZiM25HOGNj?=
 =?utf-8?B?TElCMlZsTGNib2JodlN1YnlLeExqbFJQZ1JBTTc3ZHRqUERLNVV0RktCOEJJ?=
 =?utf-8?B?TVdMek54VVBVUHh0OUNteU5xRGN4V1BvUElIazdFQnF0dytHVlFQVis5VytN?=
 =?utf-8?B?NkZhSGF6YUl3Mnd1SG9jZnd6Z0lNQ3hUaDhvQWVwalV1V3FMdGxZYXB0UFNi?=
 =?utf-8?B?SFNpT1FxYnpid3BDdS9KZGdLak53Q1d5eHBmb1dtd3gyZ2k4YytwSklKRE1Y?=
 =?utf-8?B?bFp4YjhMN1UyQVpVejRuSUg3bkdHaVdGWm5qSlYvMCtBV3RuQnZNV0pRUHN0?=
 =?utf-8?B?VS9IZVdxRmhtV1Y1eEgrUUIvM0g0cVBZYnJPMWU0WG85S2pjdkJwT0xNdXFs?=
 =?utf-8?B?ck91QTdxL0VwYVgrT2h4ZTBESXJJWDFBRUlmMnRCS0VSemtabHBJSDU0ZXJI?=
 =?utf-8?B?QXZIZXE3ZTFjQlBGOVFXTTNhQVJjY1ZXQVFNaExGZGt4QXpjd1UvS2xQcVpj?=
 =?utf-8?B?WVdkSXQxWFVoemJWL0ErOWY3TFhxVkpQTTkwZjc5Q2hZMEcwYk4zbEJPMEJy?=
 =?utf-8?B?aXlRMnlqOENUOW9OK0Q3OU9zQUkrWkhKdWxKOHVGUGM3SnJBRHpQUkVPN2xh?=
 =?utf-8?B?SURYZm1iTHJzaGx5d1hxa3h3dXVock5ydElKL0R0eS84bWhLMjV1OWZDMWhl?=
 =?utf-8?B?bzUwMDlJemNyNHE4amZaR0tuN3R5K2hHYk9Mc01TNStNUmxPT3dmTkl1cG9C?=
 =?utf-8?B?UlF1ZkFzenI5TVQ4QkRMKzZiVUUvanR3bTh2TmVGTGRxSnpEOWs4Vml5clpH?=
 =?utf-8?B?V054TTB6eUowd1pCVkFVa05laFZDOXE4VHRBZ0FLd1NIczYyQnIvQURZZXVp?=
 =?utf-8?B?anIwcXFjenRna3UvNTZFcm9lUk9NeWhXYWZCb2NERHlkWFBkck4vellGSDRo?=
 =?utf-8?B?cjR6QWUrdEZPTytmLzdPVXVobmdONGFKenBwUEgvTUlsMUNJMVo0aUNta1N1?=
 =?utf-8?Q?mpCExfcjfiDY7mmEdb5E2BfDc?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44739df7-4702-4532-ffa8-08db4d774713
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4806.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 14:44:49.5091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fS/LHf/q+x4p8LSP7v8Hn7hrBwu3iBfa1lYjIVHDGXcfLN76b75WA3M/9gjCJc/7B827fLfTNwxxDR4BTUF5fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8791
X-Proofpoint-ORIG-GUID: nMjo-inxMm2ZROrmiCmlzPB8WGpmLGnx
X-Proofpoint-GUID: nMjo-inxMm2ZROrmiCmlzPB8WGpmLGnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_21,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=tejus.gk@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/05/23 1:46 pm, Daniel P. Berrangé wrote:
> On Wed, May 03, 2023 at 08:31:16PM +0000, tejus.gk wrote:
>> There are places in the code where the migration is marked failed with
>> MIGRATION_STATUS_FAILED, but the failiure reason is never updated. Hence
>> libvirt doesn't know why the migration failed when it queries for it.
>>
>> Signed-off-by: tejus.gk <tejus.gk@nutanix.com>
>> ---
>>  migration/migration.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index feb5ab7493..0d7d34bf4d 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1665,8 +1665,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>          }
>>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "uri",
>>                     "a valid migration protocol");
>> +        error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, "uri",
>> +                   "a valid migration protocol");
>>          migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>>                            MIGRATION_STATUS_FAILED);
>> +        migrate_set_error(s, local_err);
>>          block_cleanup_parameters();
>>          return;
> 
> Most of this  "} else {"  block is duplicating what is done in
> the following "if (local_error)" block. As such I think this
> should be deleted and replaced with merely
> 
>    } else {
>         error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, "uri",
>                    "a valid migration protocol");
>         block_cleanup_parameters();
>    }
> 
> ...so we just fallthruogh to the local_error cleanup block.
Ack. Will modify this is in the next patch. 
> 
>>      }
>> @@ -2059,6 +2062,7 @@ static int postcopy_start(MigrationState *ms)
>>      int64_t bandwidth = migrate_max_postcopy_bandwidth();
>>      bool restart_block = false;
>>      int cur_state = MIGRATION_STATUS_ACTIVE;
>> +    Error *local_err = NULL;
>>  
>>      if (migrate_postcopy_preempt()) {
>>          migration_wait_main_channel(ms);
>> @@ -2203,8 +2207,10 @@ static int postcopy_start(MigrationState *ms)
>>      ret = qemu_file_get_error(ms->to_dst_file);
>>      if (ret) {
>>          error_report("postcopy_start: Migration stream errored");
>> +        error_setg(&local_err, "postcopy_start: Migration stream errored");
> 
> There is an earlier place in this method which also calls
> error_report which you've not changed to call migrate_set_error.
> 
Ack, will fix this in the next patch. 
> Even more crazy is that the caller of postcopy_start() also
> calls error_report() but with a useless error message.
> 
> ALso nothing is free'ing the local_err object once set.
> 
> IMHO, the postcopy_start() method should be changed to accept
> an "Error **errp" parameter, and then the caller should be
> responsible for calling error_report_err and migrate_set_error
Ack, will modify this in the next patch. 
> 
> 
>>          migrate_set_state(&ms->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
>>                                MIGRATION_STATUS_FAILED);
>> +        migrate_set_error(ms, local_err);
>>      }
>>  
>>      trace_postcopy_preempt_enabled(migrate_postcopy_preempt());
>> @@ -3233,7 +3239,9 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>>      if (migrate_postcopy_ram() || migrate_return_path()) {
>>          if (open_return_path_on_source(s, !resume)) {
>>              error_report("Unable to open return-path for postcopy");
>> +            error_setg(&local_err, "Unable to open return-path");
> 
> Having two different error messages is bad and again nothing free's
> the local_err object. Remove the error_report call and have it call
> error_report_err(&local_err) which does free the object
My bad, missed this. Will fix this in the next patch. 
> 
>>              migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
>> +            migrate_set_error(s, local_err);
>>              migrate_fd_cleanup(s);
>>              return;
>>          }
>> -- 
>> 2.22.3
>>
>>
> 
> With regards,
> Daniel

Hi, 
Thanks for the reviews. I'll be sending a revision with the fixes shortly. Meanwhile I wanted to get something clarified. Apart from the places this patch set is covering, there are also places in the code, where the migration is marked as failed, yet an error_report() call is either not happening or is happening in a different file. An example of the latter can be seen in the function migration_completion() in migration.c, where

        ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
                                                         s->block_inactive);
            }
        }
        qemu_mutex_unlock_iothread();

        if (ret < 0) {
            goto fail;
        }

and if we take a look at fail:

        fail:
              migrate_set_state(&s->state, current_active_state,
                      MIGRATION_STATUS_FAILED);

In this instance, the error_report() call for a possible failure while saving the vmstate is being done in the file vmstate.c. I wanted to ask if doing a migrate_set_error() in a different file (vmstate.c in this case) is permissible?

regards,
tejus

