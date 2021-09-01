Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B33FD908
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:52:21 +0200 (CEST)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOmx-0008Ed-0w
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLOgP-0000NA-9v; Wed, 01 Sep 2021 07:45:33 -0400
Received: from mail-db8eur05on2101.outbound.protection.outlook.com
 ([40.107.20.101]:21728 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLOgM-0008Hk-Eh; Wed, 01 Sep 2021 07:45:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5dcaNDfZSRyjqPgFmjzy7BNhOeH1fYj4dIMK2Qv2kmwSRlvBj2AQuM/FQ4dFi3VdJMDD2GcTPwRiv0TAbUTMNofTldClgHq/9gcs0OcXadjmQV/xatY8W3umtlhF6XsxOEWsnYo7abCxeaznUaNRdQ7DRi0t7E+f18hgSoL1cyH7YWDnFviAedDeu9yWxJ3hjewFF8SqcnTGZiFFTBC292cDnT7/kJFPasQ6H8mDtxGFVbF7S74lHljoLrLNrVPJh6RSKQNvmgInw55WGalM4RfGHpM1AHiuwdeMqS7I1hYDD5tk2jlAvGaQGHqj418Ow1fuhCnmJRaGpS8USbL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Xc898mWKLQ5DiTpvR5JjgRtcHsyCu76gL9luGR8mHGA=;
 b=EppFSTJRmIS76t/QnW2ATnKzb4z8WhxQz6+CCcV1tdzVuRTNfKZwJMQGaqDs8r2TtaW3rHwGX9Mh05vDPydBwZOKfOUApckox7PPLW2Bksnd4FiGX8/MmdxizQALQdcIlmQCQaxdqBpCdOkPEfSh5cNx+kVNzv5TzmyJlOfmgNb6XiaZVCs8kgZobeSX3OzdcpPGfM8DCGefw+e/UCqwcWQgWlG+gi9dAvwKWLrXd7XyxhOgNmVdPf+8Bh3EA5qf1f15x3/cXUBFrAac/ZaRldCgmb7PjMnF6plHs61fQil8MgGvAgbOwGwOZKqYuR/F6a0Jpnl91vIiPLkyjBMpyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xc898mWKLQ5DiTpvR5JjgRtcHsyCu76gL9luGR8mHGA=;
 b=BcHgbbSQgSVDLuz/CX8OSES6PX8XYh8yUH+vLgETsMu+qUHl9aSpVXIu6Yojn2NyDIASFY4Cm3yuV5hfWRskNv2N/6cGZmCrOCHVgZo9xzAfv7IU06JUVFtv9SBej4AKra2gixSrmNaA8KUYFnhtaGJDbEIzlUF5JD+go4FlwcY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB4927.eurprd08.prod.outlook.com (2603:10a6:802:b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 11:45:27 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 11:45:27 +0000
Subject: Re: [PATCH for-6.2 v3 08/12] mirror: Use job_is_cancelled()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-9-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a847bf0f-9dac-f739-a734-561df1e27a50@virtuozzo.com>
Date: Wed, 1 Sep 2021 14:45:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210806093859.706464-9-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0189.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::33) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR0P264CA0189.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 11:45:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83de1381-b8c8-482d-d02c-08d96d3dfe30
X-MS-TrafficTypeDiagnostic: VE1PR08MB4927:
X-Microsoft-Antispam-PRVS: <VE1PR08MB49270BAB59A883C012916951C1CD9@VE1PR08MB4927.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftl7oBmEMcrms830qCHM+T+6rUDHPY5DKH385Vwakot8jjiWWvu+HT2+3+T1GuttNq0SY6/KiCvT0oNsCrOaJQuInf6TmYcK/w4sgPtLJooRjxB2Pg8ubjMn9A8H4ZxYf+i8mkubt05R19kvUaUcxixBPyA16Pr78lI1CkaiDDrvbcoDuImVXA1+N1l3z/yHQJ+AfgjHVscdo4p+RnW+8ZrOdKaeZ+hv11WvQK+r999CGEQz0UX2PojoUghnRa9kz/5yu7ctcjsIGC57iX8jerawbUqaPsOb0vsDBOad36pcpozxPQjxzchZLIqb8YhuB67+aOP4MZrrQz089+xN/p6dEKQYUBr6IpSwYG8fZYbQpwwxHfT3z9SmtTxWHrxrcSkYwQ/pm1C8fUwJ4fP+b6fLJGHl1W6lY77bBwBOAxHdCnKOy3MyW7VOgJBzglJtEpmAOxZRE9+iBA3k6jbxfkAGdqotELeBjqw+jjQRz20aQjdErrz7G6x1EDY+FdEMgxAviqsd21QqkaA6kKC9GkmZWRHWk5jLdInuQ6ppBuZ/2rVhst6rDFkrCGgxf3q/l1z8jImGBSyLqQSEwdsEISUq+EMFumTdqSy8zESco1K1w42a9dCvPyknFsfAx7lDPe4ljN0lT9NZT1UGihz/4rbGoy+7ERd1GJ0t/kwCNzwdAiuTgcGVaR9JZp6T3EIkwF9jOA90/mA44NHSGJX7qGOwLEYPq9oSi73W1/vdCcFHcgm8uM1TGnIZEGcVRigMkZg4XQ2JbWiupy/ddSl0dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(366004)(376002)(136003)(4744005)(66946007)(186003)(2616005)(956004)(16576012)(316002)(478600001)(52116002)(38100700002)(38350700002)(36756003)(4326008)(6486002)(66556008)(66476007)(2906002)(31696002)(8936002)(8676002)(26005)(31686004)(5660300002)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEJqMzVHK3lUSjAvU1BwY09JRkszQ1UvUzZVMlJFYVlRYU5HZ3N3d1BaYis2?=
 =?utf-8?B?V213K2tWZWpsU0I0R2FtZHA3c2QzQWlEZWQ3dHYxb3NYWmR2R3VIbWkrNm5H?=
 =?utf-8?B?RnZ6bGJ4aW02WVB3cTZhU0p0V29aN00zNzNndWtiZ1Yyd2dIMmdSWjlrQU1P?=
 =?utf-8?B?dnBkVHM5N2VId0tsenJjN2Q1R3VJaXRuLzdTVW5ucXozTjIvZUMydE8vMnc3?=
 =?utf-8?B?TVg2R3U4V2dRaWI4SjVWSFZSWmd4TndCR29Lc3JEU2ZLNjBlVWUzbnlrWUY1?=
 =?utf-8?B?L3BkakpKdk5tWVVDVmVNMzA4aXZuUUgvTnZ5bVF4SW5DSEZibXhoRmF1V0NZ?=
 =?utf-8?B?ZUZ1bnF0UXlpc1pLTHpsbFlLZFlYNDE0NTlsMXpobE0rQWVLQ1ljSXZJei8w?=
 =?utf-8?B?UGJpdnlYallXUlFNcEFYS3ZtdkRxN3VkcXJKb3ZOU0pSWmdDTUVLOHNWeG1E?=
 =?utf-8?B?U2RCdllLNFdXR2tUYVNvNnhGTkdZbCtvOHBoUmFQUTQwdCtsRHpOYit3SUsz?=
 =?utf-8?B?U1lpVXUwYlhnbDBCdURsaTcwTnlOQWlYR2ZQS1dnWk9RdDMwdFNhYnFwcXVk?=
 =?utf-8?B?V1dVN1l5V0hMdVZzajNxUnM4R0FnVWhEWTk4bXk4K2diUEZlZ01vRFNWcHFZ?=
 =?utf-8?B?Z001MkFyN3Z1QkpiTHNHUjdPSzNLLzdPd1o0K3NCM0hOb2FldXVzL1JkSUht?=
 =?utf-8?B?NitQeGNGRXRuUDhJZTBkVGhlS2FObDNoQUFuZEFldHpUa0lMMjdvTlZEd2Na?=
 =?utf-8?B?Rnh4QzlEcTVsbUozaDB4V3I0NlJyYjlJKzl0L3dZeTZBSFZ4MXNMR010THlS?=
 =?utf-8?B?YXlIdjhSb0RrMk9Ld1VnMGFjTk1NNkwyUnJ1OWZpTkhaZkx1bkJ1S3VDU0hM?=
 =?utf-8?B?aS9zOVl5akExaWZId3Z4Rm44MEJxWDhIbHl2TEk2Wkw5Y3M4Sk0wOEx5Qldz?=
 =?utf-8?B?dkNFamVVMW94UkFSNDBhSDNaTTk4WVFOY29QdW5jaEZOWDRsK0gySjZ6Qllt?=
 =?utf-8?B?TVpRcTEzUktqVU5pQmZKaFdNV2xOWHBCRFhGVWZoUFlPWmsrTjJBQngwSXJx?=
 =?utf-8?B?ZTk3b3E2REFqMkNwOVFBWGRUZ05kckNTL0J1NzNUbFVlcGpBdVRCR0JIZGVh?=
 =?utf-8?B?bVEzREpKNTllc2RyWGFtc2NXVjIxbHlzWUxKbE4rSWVWM3JBRW55WndqNkFM?=
 =?utf-8?B?WTRaNXFIenlOVGkrZkdSeHRjQldqYUtVN2NWa2FlSjBqaitzVkdNMjhtbWxt?=
 =?utf-8?B?d2RtUlcvVmZDNm0rTk1iMU9iSng2VjFZeVpqaWhWaWNralhiTVg3VG5oMW1y?=
 =?utf-8?B?a0xMejIvRWV6dTJEUkU1Tk5rS21taW9obE1YYnBrejduQXZkUnVjODhxUS9w?=
 =?utf-8?B?MU5aVXArK0tpNkZnN2s4MVdNNDZrdkdUdjZQM2RDaVJOMGNnWWRic1ZjOGZN?=
 =?utf-8?B?aUdhU2d6RkovczRyeVFnV2FZT0pRdWFhTk1GVVlxdzhkeDZDbkNGQnFOTDln?=
 =?utf-8?B?cEZCVmpmOEhpZ1dGYzZ3V3cwd3pQQS9RdlM4RGxOWkIvK0I5cDl6dnhBZzdB?=
 =?utf-8?B?L29sV241aGFGM0JqTCtYMnFsUmhOUkxaL3V1b2FuY1R3ZUlVN29HSWQxbnVp?=
 =?utf-8?B?eDI5ZituOWJZN3Jna3hIM3RHTldsMnhLYkhXRk1MTmlyMlo0UGpaOWtqaWhx?=
 =?utf-8?B?c2xHUFE5Q0Y2a3VoYk1OSFgzWWt4bTVRa2lNUFVDNklTbkJUOVlzWHNZakdy?=
 =?utf-8?Q?s0/JSKK92AzEMSDKvBBwWqiFapCDQOGTZq6XP3K?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83de1381-b8c8-482d-d02c-08d96d3dfe30
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:45:27.5636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbaXnnuhRkz+fY96rvRNlMnFc1vN/RNKrWEcZBDNCdnhM6X48XK6zcraNnq2aXXF84CrAXgABmdSwIie5/SuxEqtB5Vl+SbS03+1tn/BM3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4927
Received-SPF: pass client-ip=40.107.20.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

06.08.2021 12:38, Max Reitz wrote:
> mirror_drained_poll() returns true whenever the job is cancelled,
> because "we [can] be sure that it won't issue more requests".  However,
> this is only true for force-cancelled jobs, so use job_is_cancelled().
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

