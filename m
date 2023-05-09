Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB6C6FC677
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:34:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMXH-0005Ih-HT; Tue, 09 May 2023 08:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1pwMWq-00051E-Hf
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:33:20 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1pwMWa-00049k-BN
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:33:05 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349AmAk0008354; Tue, 9 May 2023 05:32:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=cF4BdTm3ykYVLsTBh4fwFFmS9qYOvqLHVETJG4wv0xA=;
 b=W6HKIF2Zt33ljQqGn261FL7c4mV/oM0f44lkcM9vSqNL2+cGWsgxOjlzauXRFeWc5L0v
 wDxj/a5bvOj42stQUdjT00hA+mA7jn5/KpV+W7cHcLawLmL/S3lV/hrvb6OTQwlho4JN
 04RpvyNuSnxTiGPKuVNElaLv4uiM+TPzvOqnuX70Eb4Bep1Wz0sHyzTF3fVnn3+i0I5R
 zNJaHvOLZ5r53JWpLJtrlJY9q61CUg+EaIPuIGHEKDVnLy5MJnHEfwyk+m9phMBkhuXP
 HcdDfzpw+XvS3KuwQRcihomCWAp+xZgmziTtXGMmBBbHWfajzuCSgv/sEEexxHXA3fCS fQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf835hpt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 05:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIX0s5jY4+y6x/TVcmEDWoe2Uf71s3DWe6B/w+cJXsS1aTPdnrednF7Gzg9q7+8E18/bItwPgpg65SbZacKv/P5QOIxUC4SVjG+RLtNEyQ072jWNr04KSmcGzcKZoqHBEQpyy5DsNn8H53DAKHRXPa29ip6+KK8z6QQl6ds1dobGaA2pj+24a2btdQNlkqylsohKG1r5aAOIuFj0ytH2uzc/MWw98co0nkUtUuhyrdww0eO1bbSzZa+unSotQ7FzcevOxALglooI4ulgXvAr24koJfziu72dwNW5qnowjgT7hHtd5DjFTaRksc5q5u958UNJ1kWpxP0+o7VZBRSICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cF4BdTm3ykYVLsTBh4fwFFmS9qYOvqLHVETJG4wv0xA=;
 b=kNaN8vZpt/6BR6CJpXCcihX8oXTpgatvMgwDklVNA3gh5ZRjyWs8DA9/BKIESpsTY/plzFDktKYN8aKUqwWjcpdMwGynmGmKCeRDhwk2Y2btd1I4J5Ejj/c9B2AOMqJDJxxRXn+PTsfmxELdLko6+z8boLoSF9sP19uK5O5B/QPkOfDfN6AErBYpqN2E8kfuoRBe9hfchK9T8k7Wzgqjy/G/8ySnr1ZLp5rIkksrHm46klodmpiCAaufBOF1WW3ueJLWatnqaC8iAHEUecfOk7w9QE92F2Uy/ZMMcMPk6DYvbfPII+zbHib3z04kMmhZ5O+tfSOiGvcAE9Gl3Nkb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cF4BdTm3ykYVLsTBh4fwFFmS9qYOvqLHVETJG4wv0xA=;
 b=vFQIiaIBcbW6Xlc7omYlFturXbyy55R28t8rSwsOLIMmQzUEU4uzjsMW7X6ybGo6MrhKQKULYBmoVD/UfgchspR4G9W+dhUMKZfF86ANBvYSazXIYscM9p7Zk1bxhtaoN927f+TWd+yPLdv3y5uyJ155S/PuZa74Zmn0k9L3wwOgA+3DZKek3T5blKKZe/JnvWyxjFOqIn+jxFc9302ADO4FwHokwfISliPdkF2SCQjzVsTokAh+/POZoGUBl0M6PEDyhw/FLJUFOfg9ScY6a/4PNf98Rsfc7ONI87nMgiqgPOA0rG27QhYIiecuSyhcoBKzaF66onuTZQbwKtboAQ==
Received: from BYAPR02MB4806.namprd02.prod.outlook.com (2603:10b6:a03:42::30)
 by SJ0PR02MB7727.namprd02.prod.outlook.com (2603:10b6:a03:31b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 12:32:50 +0000
Received: from BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0]) by BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 12:32:49 +0000
Message-ID: <3527d64a-6518-7343-5733-c109aff856a6@nutanix.com>
Date: Tue, 9 May 2023 18:02:34 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [RFC v2 1/1] migration: Update error description whenever
 migration fails
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, peterx@redhat.com, leobras@redhat.com,
 berrange@redhat.com, shivam.kumar1@nutanix.com
References: <20230508153223.133081-1-tejus.gk@nutanix.com>
 <20230508153223.133081-2-tejus.gk@nutanix.com> <874jolg68t.fsf@secure.mitica>
From: Tejus GK <tejus.gk@nutanix.com>
In-Reply-To: <874jolg68t.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::33) To BYAPR02MB4806.namprd02.prod.outlook.com
 (2603:10b6:a03:42::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4806:EE_|SJ0PR02MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d830c4-b81b-47fd-0c56-08db50898005
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fgJKHXoeYgt54hRSSzgxp531MyKs6sRGmipIWuVvpqPAoGsyvprbHcyAaZtG56+GpAvTmwZ92woWHUEQFt9JxRnheIzjUhVniEiBP9waktsq4q/MqnqxzIK+VJ6VSWUt0pgtXbUpMzUju1eMmie+IPt8ux+K3eeweP32Ua4IPluPGB/8HTE6E5s9sedaFkHOgWtbEZmJcpbncZFioZN9hm4WiAvoRVpxTlUhQ3KFEVJ/5ThTcXG/R0V4vOqVrvn6YJJ/+h7wes1wQ4tj/nRKFhSESgRihrLg8Y12Lcjm2uopSffXV+hDtOeqaoOwiCJ7TskoUSZZYtqNrHRvgvqiZ23j83S4kZbZZLbXLn/+d6CZMWsBiWyKv0sVjeE2XUN/exugMDaWYvaB8S383MkfQh5pNI4Q0jmgUXfWZ/FthypIciEYkoN6op+qIqAw6f6S/vFgS+sYq0SCP2I3BHKaSgsEEpktI7QeMuC3ef9k0skmW8nd7z0azqhsshB0VUNXt6v0a+o5Hvy5Sj1doMVUFYq0r9FDIJXD25rzYNSESEgc5jDcYUow3jpjep1wxFFJcybOjoqScPkOHcthFZo4ALMOzptpDG1ZEvMiYnavWKft2Tzqz8lokdAN5fSxV9T4yPfszxHhOZsrfYVsVeuhy7FFknewZCFM01cd7Y5Ml+wcIxIAlifMyXtjLNqa7QyZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4806.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(316002)(478600001)(8676002)(8936002)(41300700001)(15650500001)(6666004)(2906002)(4326008)(66476007)(5660300002)(6916009)(66946007)(66556008)(31686004)(52116002)(6486002)(53546011)(6512007)(6506007)(26005)(107886003)(186003)(83380400001)(36756003)(2616005)(38100700002)(31696002)(86362001)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0FzMXBsYmNrSVpuNkljZmhUVCttS3YrNVUwbnZSUndzM1AyalZoOEl0WURw?=
 =?utf-8?B?VkFWK2FtdGQ2YzNadEM4UjlKTU1OTWNzRnZxdWdtSklVYnc5VDA3TVMwWEg2?=
 =?utf-8?B?RlpFaHY3TlNnNU1IaCtvTTdhVGNjVGFDblZwbmJFRWhpSWc4dzF2elZtNVRa?=
 =?utf-8?B?UU9sOWMzbmJycEtwbWFEenBMUS9vbkJhdG1ML2h1NmlCSHZDU2E0NDYyb09X?=
 =?utf-8?B?SFp4cFZ4NWFUcm1pL050bmYxZGJpYkVQRkMrVkk5dVQyRVBtekNwckRMbmt3?=
 =?utf-8?B?UVA2elo0NnZzeVdBb0MyaXdKdHNIRjhuc0xpaVNhVlBiYjZBTGNzc29qOFdO?=
 =?utf-8?B?b2pXdFVaQk9sOWlQTmlFbjRsMVh1KzAxWTUvZ1BwN1plSElYYkJGNUhQS1cw?=
 =?utf-8?B?USsyRU1La0dpQ0h3dmtYdHdkc3cvRUZ5bWk4aUJLblJHamNySFd1S20yTTcx?=
 =?utf-8?B?NlBQK1g5elpBcUlsOElpSEp2WFcvMjVSVUNnOEozQnl3cWcvMm16NU9TZkxa?=
 =?utf-8?B?MCtvL3dHVitWdUdVOFFPVHplNDU0QThtam1NY1YzaUU0R1VZNEZUNlY1T0pE?=
 =?utf-8?B?VE5zRGdmSytjTzd3cVpDa090dXVGNlNiRTh3b2VCVWNHWWZocXdneFd0eUZD?=
 =?utf-8?B?Ulk3UWhvelZ5WSs2dmF6Wkd2Y3R6UnBDaHUvYzFqU2lZRGxabGUrNWoyTmtQ?=
 =?utf-8?B?NUxmTU51Znp0NmVIZys2RFhXTmFSdXBma216WENhaFg2UWVkS1dvZUZ4dUxV?=
 =?utf-8?B?WXZHZzFmSFV5ODMyb2dkVEdRM1VXS3NtK2JsQXRFbFQzd3NKb3h5c0hud3Z3?=
 =?utf-8?B?S0FzQ3A2alJ4VkpnOWlYYjAyOTYybVZtOEJWTTZKYy8yTnorM0o0amZnbE1R?=
 =?utf-8?B?SzR2d2xoVmwzWk1rNzNFM3lZd3hNUGR4TlBKM05YVVF6L1JGR25RRU9oRUFT?=
 =?utf-8?B?SUdzNmI4NTFCVE1SNmFaRHA5alNKRGJVc3VoQ1hLcDhkSEtoY3k4SFpCUTdR?=
 =?utf-8?B?WEVzd3Y4U0pVeHA5VG9zZXlrbkk5L1dyTmtoTkxTRXdsMnZCUjg0U1JYQVhl?=
 =?utf-8?B?K240YmQ5VURQMXc4UWdtbWdhVjhrKzFBSVBqYndnQTJyYXo2M1N3WTYzRVNP?=
 =?utf-8?B?SGpQWFZzOEdFMk1ZUkIwd1B2UUc2MWlUVlE1QUJRV21OdkNVSDBEVU1HbTRV?=
 =?utf-8?B?THdTeDgrR3hMYVlHc2h6dDd5S0FKVVlxTm1qRVpZZTAyOU5ZMEFPbklyd1FZ?=
 =?utf-8?B?L2RjR292dnBCQ2pWQVJacG9CZUVoQzVWZnlhTFB0TXg1V25icDNqbzA2Q3Ux?=
 =?utf-8?B?U3FnSWpwWFE2V3NjZHdQTHpvWlBIUVdqU296QzNVODE3bFVoN1EwcWpIWGxU?=
 =?utf-8?B?bXNFbUVNYWU1REhTbC82UzhxcUZ3d29MY1dNeFNIckRRYzJyWTV0ODRVUUpU?=
 =?utf-8?B?UGtjK05JRlcyYTNiYkMwaDltMktCSWNORFFCcVVMWlBaTjBOM2pTRVorbCt0?=
 =?utf-8?B?QTc3enkyYmkxR1pZTC9jWk00Nko0dC9ia1lYSmh6RXU5Q3dKNCt3NlRodm1j?=
 =?utf-8?B?STI1TDhITlJyU2VHYjdrTnhCcWJIZnMvWXhhQmRZejV1bjhxZW1udldUcWJD?=
 =?utf-8?B?b0dlL0ZnWlFreWorejAyaUZ3dE5wdDZod2ZGUDJTeTJyMkhQQmZWOWFKVEFW?=
 =?utf-8?B?TkRNaG9TMGNoL3kyNmtvNmUyM2RVOHBVVnVXR29MRmRFekNrdE11aVIxZ3VH?=
 =?utf-8?B?RnZ2dFpoUWhDQVBrRHdXeHk2eDdoZlhoSUNvM0M1WUEzcFlHdmcrSTZtMXNp?=
 =?utf-8?B?cUpIWllueDZ0YnI1Y1BXTkFGY2NoVUk0QTE0dWVJS0IvWHhRTXNuVFBUOWZ5?=
 =?utf-8?B?bVkrOHc5NDNDSGsxL2hFZmhpbk9taHJLYUVxRUJRNU1RM3lvWC9RUFVvTDZw?=
 =?utf-8?B?MVZJZ2JQZGxqMmh5ckQya3puakhHbVlRQUV2emZTMGpDelQ4QStlNFpWVjlw?=
 =?utf-8?B?YytUeFhlK3kyMmxTSlZZOU9BMjdUTXA4VW00NjJVNDkzNlNKQndYWGxPUFE0?=
 =?utf-8?B?NEJlOWdNYlYwSk5kYm9pdXNucXBlQTZKK0tBN01KUTgyR1ZETld1UU1uZE5o?=
 =?utf-8?Q?kzeb2NLy2FwA08oEbTa+rFSAC?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d830c4-b81b-47fd-0c56-08db50898005
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4806.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 12:32:49.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANeXJOARNmYHmNDuxMNt3XBaZ05jncfp8KCQQq9daa2FNmJzgqq9ty7uy+DGLJ7hY6N44BZ2m2XKSF5OXZ5Ujg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7727
X-Proofpoint-ORIG-GUID: OjDOw1noBZ6t5Fnj2TEOSn_S39SmkoS-
X-Proofpoint-GUID: OjDOw1noBZ6t5Fnj2TEOSn_S39SmkoS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=tejus.gk@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 09/05/23 3:46 pm, Juan Quintela wrote:
> "tejus.gk" <tejus.gk@nutanix.com> wrote:
>> There are places in the code where the migration is marked failed with
>> MIGRATION_STATUS_FAILED, but the failiure reason is never updated. Hence
>> libvirt doesn't know why the migration failed when it queries for it.
>>
>> Signed-off-by: tejus.gk <tejus.gk@nutanix.com>
>> ---
>>  migration/migration.c | 24 +++++++++++-------------
>>  1 file changed, 11 insertions(+), 13 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 232e387109..87101eed5c 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1660,15 +1660,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>      } else if (strstart(uri, "fd:", &p)) {
>>          fd_start_outgoing_migration(s, p, &local_err);
>>      } else {
>> -        if (!(has_resume && resume)) {
>> -            yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>> -        }
> 
> Why are you removing this yank_unregister()?
As recommended by Daniel in the previous patchset, most of the stuff in this else block is duplicating the contents of the "if (local_error)" block below

    if (local_err) {
        if (!(has_resume && resume)) {
            yank_unregister_instance(MIGRATION_YANK_INSTANCE);
        }

So now, after local_error gets set through error_setg(), it falls to this block where yank_unregister() will be called as before. 
> 
>> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "uri",
>> +        error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, "uri",
>>                     "a valid migration protocol");
>> -        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>> -                          MIGRATION_STATUS_FAILED);
>>          block_cleanup_parameters();
>> -        return;
>>      }
>>  
>>      if (local_err) {
>> @@ -2050,7 +2044,7 @@ migration_wait_main_channel(MigrationState *ms)
>>   * Switch from normal iteration to postcopy
>>   * Returns non-0 on error
>>   */
>> -static int postcopy_start(MigrationState *ms)
>> +static int postcopy_start(MigrationState *ms, Error **errp)
>>  {
>>      int ret;
>>      QIOChannelBuffer *bioc;
>> @@ -2165,7 +2159,7 @@ static int postcopy_start(MigrationState *ms)
>>       */
>>      ret = qemu_file_get_error(ms->to_dst_file);
>>      if (ret) {
>> -        error_report("postcopy_start: Migration stream errored (pre package)");
>> +        error_setg(errp, "postcopy_start: Migration stream errored (pre package)");
>>          goto fail_closefb;
>>      }
>>  
>> @@ -2202,7 +2196,7 @@ static int postcopy_start(MigrationState *ms)
>>  
>>      ret = qemu_file_get_error(ms->to_dst_file);
>>      if (ret) {
>> -        error_report("postcopy_start: Migration stream errored");
>> +        error_setg(errp, "postcopy_start: Migration stream errored");
>>          migrate_set_state(&ms->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
>>                                MIGRATION_STATUS_FAILED);
>>      }
>> @@ -2719,6 +2713,7 @@ typedef enum {
>>  static MigIterateState migration_iteration_run(MigrationState *s)
>>  {
>>      uint64_t must_precopy, can_postcopy;
>> +    Error *local_err = NULL;
>>      bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>>  
>>      qemu_savevm_state_pending_estimate(&must_precopy, &can_postcopy);
>> @@ -2741,8 +2736,9 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>>      /* Still a significant amount to transfer */
>>      if (!in_postcopy && must_precopy <= s->threshold_size &&
>>          qatomic_read(&s->start_postcopy)) {
>> -        if (postcopy_start(s)) {
>> -            error_report("%s: postcopy failed to start", __func__);
>> +        if (postcopy_start(s, &local_err)) {
>> +            migrate_set_error(s, local_err);
>> +            error_report_err(local_err);
>>          }
>>          return MIG_ITERATE_SKIP;
>>      }
>> @@ -3232,8 +3228,10 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>>       */
>>      if (migrate_postcopy_ram() || migrate_return_path()) {
>>          if (open_return_path_on_source(s, !resume)) {
>> -            error_report("Unable to open return-path for postcopy");
>> +            error_setg(&local_err, "Unable to open return-path for postcopy");
>>              migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
>> +            migrate_set_error(s, local_err);
>> +            error_report_err(local_err);
>>              migrate_fd_cleanup(s);
>>              return;
>>          }
> 
> The rest of the patch looks right to me.
> 
> Later, Juan.
> 

