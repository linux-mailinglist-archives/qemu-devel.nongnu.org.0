Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2E6901A9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:00:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1q6-0007AI-FB; Thu, 09 Feb 2023 02:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ1q4-00079U-OK
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:59:28 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ1q2-0006uQ-5U
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:59:28 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3197f1tT010105; Wed, 8 Feb 2023 23:59:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=MoCj/G//8gRe6rA+grxCjybFgSbNSxQ9wtdqXseyCDI=;
 b=bGLMSCrTb67J4Lf4A3+hhlV6ggCLIPlTgg1cdCe087OZ6t3iBz+hyrpgNNO+tk3r/UQL
 JWn3f66h8snwHt6XokwqwOcbm95IXx8gLhKlLNREHdCldqeJrmo9Cz3rpTZZL/2BqEJt
 nyCixkjXlCBLRnnbURJ/n1Gd5puKpuwAI2RyQztijXkmgSByYXm2WKdRX5HuxSxXGcZy
 zcyFFRjJ8CL5YFqu4RFmfg5cjuWFdsmKNdtN/5cz2ZMqkxLG3GARTaOp/atJUZjR/n6M
 ILUcpbvskxD8J3byxS8vXqzMK9526qUNt35/FX05DISb2QckScVdCkB6Ct6m+Wi/Q8sG Dg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2044.outbound.protection.outlook.com [104.47.57.44])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhm5hxykk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 23:59:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ur/AbPATXhThyc9egIBr+IlTY3cpukDJ7vYHyMhaIMnViToY6JDZ1hKvBNnYAW2rTSN4WCXOZWOXwiULVRGm4wOc/53H8TjudREHhqt5569fKdyYtoAy2IR//89VhZBh79QofkQUByQ08SngOr6AnNZC+oSOVWYiV167YP2jWj7h+tsqWWdXOH/q17PSxMUl5Mimuun47QPk4KOXUwjWypTRpSB85CS+UiGbX3tafYpFaqFY4nvl3ku/pfeVx79HLQRG9fnDkCUSBln1EuEvF6ONqF0iju8OCmsFih3RT2xlrTdwVcKx8VyshJ9xEqhB46ENqgG8fzqNaFWsttJFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoCj/G//8gRe6rA+grxCjybFgSbNSxQ9wtdqXseyCDI=;
 b=SarF8Mskrg1v3UpMN1ly+EHCpe50GpPeJHiHyQDqJdzmnvldxkljSSIsadOcgIxUUSf94TkZJPgygxQq6gg/aFSLd90v+6pqqK+qNGlXfBT/t10NU15PXLGLJbBrA7wUHzRcNn7Do8YID1ISUXaKS1lRrQ8K9dCmiPqTxENx6YNNzHrir16RYHlA9cG/Qmy2LjyFQgFOxACEvIbhUnQWl9IAf63iaiOM2tppvA8VJ6WCpho9W6Kqb3wyt7KWsD8/ghQp2T6bXFsp78zmfIEDcTr0bJ6ee96XGg6koIKRSyzfyIHQrVii93kSOmywUp7WgN8KAIzBtbEyXlOAoQEzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoCj/G//8gRe6rA+grxCjybFgSbNSxQ9wtdqXseyCDI=;
 b=lJn8JKmbtFSA8FA6JJpAbllu/uUBIA2oApBaxBj2Pu2CKQsCwE6gAgPIUa5deixg6uY2z5seFZSTe6hrta+O+UNxHbmwx8yrsV5ksmdlJsUxOydXUFW2oN/HCve51boANRuls9kLizGJOajqYIr6y1K34kb/l471+s4SHqiiFHTuDf9r7e2tlefWFlQkmNj/dSsCBG/UKT28FWjjAUMoofyHgJBjyXwwUpv9MxoeGGs5pP32ic/7kDRTd0Wafit0b/W/Ff2jzYHSuG1PzoFYr9XO2lcudx2vPlQn90oxiEpMcLxTyCmWnWD263TmV0+hMwmOcTwT6+QffAfsczJZqw==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH0PR02MB7413.namprd02.prod.outlook.com (2603:10b6:510:16::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 07:59:21 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 07:59:21 +0000
Message-ID: <43f00a38-4eca-b0a0-2c41-728e42273e5f@nutanix.com>
Date: Thu, 9 Feb 2023 13:29:09 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/6] migration: Modified 'migrate-incoming' QAPI and
 HMP side changes on the destination interface.
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 armbru@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-6-het.gala@nutanix.com>
 <20230208201951.3lcbpppp7vt2nqap@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <20230208201951.3lcbpppp7vt2nqap@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|PH0PR02MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e3b974-adb4-4ed7-bf4b-08db0a738d01
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vC+yKeP6bcG7XzAzNkY7cei+/1cfs32YVyCBmNkuXnpNGQZf1Euj/Pwm8NpxneBlQ7z3yQ4FMRRbHOn9V9t9UFymhp/7dxtA+bSVruaBCagvjlZRAocwNUlP4JZZkU1tp0j6zaRto844XsJgZFLhjUdj7A1r9KkeVvT/5WebX4x6eEdxUgRfaxt5O9QArh2FbTHENn1EU3W8gd3NoaM6caJL4kfZFHADnkm0ZUCOD/e6VbS14TiuBea5R6AuK/4bj9ons9tfbF6Ukojpago5o4RhTJJqcPRF/Yb+3l1l4N6uHnI+HfcNOfmxBxie0rsQHdT5NGaJt4LVOe2z1FlH66hGFBcOFE6lMtemLaPyhjhMJ0V/7kLxVQ+NCh/iBZjO7bn8BqszyxGm5Q4k9Srq3S1Pdog4TFfrC1cizaOKS2VQXsrSWyZJ5VOmPfQPCcheWN13wmi+N6aBR0ukWa6MDfPn2iQzn8w90Pf2IvB0WPXHIkCc+mnXAYRF+OCAnMnZ5afBDPpOiGJW4quu3ith1ZjVAgK63hPLmO20trdFEyZX1VNMT2N5JtjB9+zMbjmXwMhuJCH4Vbe6qcjw1ZCEdSwPk72HJhvRtKW9phow0JUXGFSBIO51dgkoy/KkjB9HmHOZejQBaq3m+ckLSqe475tYQA0+GwqWATTp7ujdehsM0Aobf1T9W5TsxsE+elWiM+jLBbDLiTItxsfFo1uD5e+2zvTlEFaVRc7bJwHnGt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(36756003)(6666004)(6506007)(31696002)(107886003)(26005)(186003)(86362001)(53546011)(6512007)(6486002)(478600001)(83380400001)(2616005)(8936002)(5660300002)(6916009)(4326008)(41300700001)(2906002)(8676002)(44832011)(66946007)(66476007)(66556008)(316002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmJGUkhzOXdtN3p2N2xXNVJkNzBWTnZnRVZLQStMTmZjdURvOTBjNmo4Q0Rq?=
 =?utf-8?B?SGZoZnU5L3dJMUhYR3RHbzdHem1LQU10aS9EUTBaam1pRENTbnEyMTZZbitO?=
 =?utf-8?B?NWJ3UFhLT0NMbkhVWnczZmhCM1dabDlINzVLdHlwV1ZBbDJzd3U1YXQ2NW5w?=
 =?utf-8?B?SXQyOGZhcW91OTdHN2ZqUnV4V3crWGd3bmFXQi91aUhNbkFYOHZQRHdZOER0?=
 =?utf-8?B?c01IdzBzSGNZdnVObTdNbkk1Z3VaSnRjKzg4UVZINCtuZ3lhaG5CdXJ2dmhQ?=
 =?utf-8?B?Mk14NjBZaE1CRjR5czE5MGVpaU9lVW9sRVovKzFicXRJM1ZPcmxqQVVJZTFN?=
 =?utf-8?B?Q1ArYVJ4VityVUlHYVVXVmlTcEN2ZndocTV6emxNakh3ajI2dFZodys2ai9k?=
 =?utf-8?B?amFpdnY2cVh5SjlCRjJSTTZYbkZLeWFpbDRWbTYvYnlZSFJ3WlR6QnhvY244?=
 =?utf-8?B?cnlZZHFkQ05mNzF6TWNWSXE0Q2RDdFlWOENsWUdyRW5LUkRKejBVZGM4U2RB?=
 =?utf-8?B?NHNIVXUwNXNEbStlQWJBMFRJQ21LY1BQeHFjdHMwUkdRUklqVDVGUVhobm9y?=
 =?utf-8?B?NlkzL080SXBNekNUSHJya21PbTZlK0xHbDVuOUo1SVJCamhMZkdQNVlPYzg3?=
 =?utf-8?B?dkZEMG5rU1hsYkk0VWlrMStyaGt0c2xyWDJXeWJOd01CNHVyR2RTcTJkK2Zs?=
 =?utf-8?B?Y3gwWEI2RHBsZzJhUi9tWUpqV09Vd3hRdWR0QUd2VHkyeHRnWVp4a0FQUWM5?=
 =?utf-8?B?Sm5oZkdqcWxFUEc4M1BOUlhtd0xwVThIR3NzSUU4UTVlbjNpQlM0SkJFVm5P?=
 =?utf-8?B?cmhielVIbEVTRFlLcVhyWWdiUnBOelBsMkc3UDV2bjd2QXNZZmhkWXpSSEhY?=
 =?utf-8?B?dDNNd1NnU0hLV0dBL25JS01tUzgyTnNObUt3YUEyb0xYTmR0bzVWS3FHTVg5?=
 =?utf-8?B?ZGxKQmphVlJtajg1SnBpS2g5UEc4ZzdZQkp6VWxYeFN6VmM2blF0VHhvZUR1?=
 =?utf-8?B?OEZTcU4yZ0RHRDZWTkNKZW5DTVU4OFBzclhXdkFmOEkvQzlUYmVuazM0T3cy?=
 =?utf-8?B?RDBhN0I2aFpTV1VrZGVvck9aRnBPS1gzUlArdnlVUGhDRW1pRi9EdTFaSHkz?=
 =?utf-8?B?dWZYSTU2YS9NUVFsRGFTbGl4ZWtJaFlGRnNHd001Zi9nYVV5SENvTTRwdWcx?=
 =?utf-8?B?aXBxRnpON0ZKancrUGt1bGpoaHlZWkg3Z3VwNUZKTXRMOHR2ckZPYnlCdzNP?=
 =?utf-8?B?WGNnMVQzbU5jNmpmMi9wVjNzNGUxYS9BZElzT0N5cXdudmx6RHV2aTZKcWph?=
 =?utf-8?B?NzJKNlVVL2orOEx5eUtFbG5WRHdnaHc2YndNblErOGlMR2JRb1lTR0tJRnNF?=
 =?utf-8?B?a1lZV3doVWo3YnhnaG9RMTFFY1hmK1hFaFdIbjZYK053UlhyN2h2MUJWdEpP?=
 =?utf-8?B?SW9DcENkQ2ZMVEhTUTYzYTRSekhBY0tISE5LdkZoOG5GVGxOTzEyYldhanpI?=
 =?utf-8?B?cTIwWVVnbEFqNlpBek1DNnJsSHBwSGtOZ0dkSk9sbHBqSVorVEFRelFXcncy?=
 =?utf-8?B?L25lZmp6U1NVbXoyUHZnemVsa1VFMStzKzJLSzRDTnRNbnMwd1VjZjV5V2JU?=
 =?utf-8?B?UnlqTVZ2cS9QZ1lkTkV1UGQ4cUk4N1NCQ3RGVzJnYWdNVVlXR3k2YTBNalRn?=
 =?utf-8?B?SVlTNkhJYVBMMDc5eXlRY3owRzc2OWt2R1Jrdld4TWQwTGZuMWRWSDF4RXB2?=
 =?utf-8?B?UXRvVVVEbmlHbWFFTFk4UUdkTnBLUjVITHplYkhMZzFUQ3Zjbks1MFdVZXdo?=
 =?utf-8?B?Sm1hUUdFbHJHUTlUVXVVa1cvamt6eERHQzdkYnFFLzE0cDBhbXpPZ25IUXJn?=
 =?utf-8?B?eTJacmdycFJqcEVpMnp3WlNtVGtRZFhHK0svNWlaQThiUzB0bm0vdDNnYVVV?=
 =?utf-8?B?V1c3UmtmMTYza2JtRnVkZUdxOEJ0TGxSNkxjN090eU00TGRpUjQxb2VOSTRD?=
 =?utf-8?B?aEUxS051Yi9UcFhaS0g0d3N1TVFEM3l3aTQ3WkhXTHhlOU5NQVQ3TGwzR1F1?=
 =?utf-8?B?QWFFSSs4ek96SlFQNzJZRm5qajBRK1ZSdzZsVGl3UUgyUHFpUkhlQ0JteWdq?=
 =?utf-8?B?WnNYVTJEeDdrVjJmRlM1eGxOVXFWczk4RGxxRnRSL3RzNFhGT3JrUHpwdVp5?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e3b974-adb4-4ed7-bf4b-08db0a738d01
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 07:59:21.0025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPPTn79zuNkkuwYYfTEAg6WHMMA14mmY2I4NmN1N2vfWSh+Lvw9FZ7gjlpn8Y9tmcrkdQ9HlldOKLKLJEC61WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7413
X-Proofpoint-GUID: cpGABtZLbhYJCNW6onteHJZVL42w16Rg
X-Proofpoint-ORIG-GUID: cpGABtZLbhYJCNW6onteHJZVL42w16Rg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_05,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 09/02/23 1:49 am, Eric Blake wrote:
> On Wed, Feb 08, 2023 at 09:35:59AM +0000, Het Gala wrote:
>> 'migrate-incoming' QAPI design have been modified into well-defined
>> MigrateChannel struct to prevent multiple encoding of uri strings on
>> the destination side.'uri' parameter is kept for backward compatibility.
>>
>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   migration/migration-hmp-cmds.c |  8 +++++++-
>>   migration/migration.c          |  3 ++-
>>   qapi/migration.json            | 22 ++++++++++++++++++++--
>>   softmmu/vl.c                   |  2 +-
>>   4 files changed, 30 insertions(+), 5 deletions(-)
>> +++ b/qapi/migration.json
>> @@ -1623,7 +1623,11 @@
>>   # with -incoming defer
>>   #
>>   # @uri: The Uniform Resource Identifier identifying the source or
>> -#       address to listen on
>> +#       the address to listen on
>> +#
>> +# @channel: Struct containing migration channel type, along with
>> +#           all the details of the destination interface required
>> +#           for the address to listen on for migration stream.
> Missing a '(since 8.0)' tag.
Ack.
>>   #
>>   # Returns: nothing on success
>>   #
>> @@ -1640,14 +1644,28 @@
>>   #
>>   # 3. The uri format is the same as for -incoming
>>   #
>> +# 4. The 'uri' and 'channel' arguments are mutually exclusive but, atleast
>> +#    one of the two arguments should be present.
> Grammar:
>
> The 'uri' and 'channel' arguments are mutually exclusive; exactly one
> of the two should be present.

Ack.

Regards,
Het Gala.

