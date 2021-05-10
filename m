Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF753792E3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:38:23 +0200 (CEST)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7zC-0000yh-Ej
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg7wg-0008JG-Kk; Mon, 10 May 2021 11:35:48 -0400
Received: from mail-eopbgr50091.outbound.protection.outlook.com
 ([40.107.5.91]:19670 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg7wb-0005s2-BJ; Mon, 10 May 2021 11:35:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8tOmKI4zFr7clmfjvwYn/JxoyAp6En5MKNhDfmI86RSCzFNIPpvYhGGHqo4dqJ5lAq3jH2g3e05af47NvWw2TAIHh8ONjQjyaejo7HjqJw/JNpAfgKqcDDmzLt3F8fyEvn0/Ic8RSebGl9pBYZs1SLVgD1EqAzQbnAGE5oJnc9Xxr+B6dIOucJL8mAGxSkp8WEzxvKFz1wiL6UhZdI8URbm3nl5R3UMNerRbb7GG6aWMNjNDAvqmt1aeKaeXWPRYCuosqQqrxA0SBf/W8M9RvlMAsdDsdCitljplL8gIPP8ixMGFRLZLEqLW2NMGGnmOORb8F+Fj9txbwBl/h/rKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVttYgHyDadtu26yECwu5mRcbbhKeAH2Cpn0spVjuFg=;
 b=Bn+kW2F+VCA+7dnPQllQwD4Bw+sieqi5nZr7aa0gPciJMIe7eZUQkP/2dlYaV1zFGF3vhwmnZYfd0Wi8NDC5hh+fGtKqHTnJHLJRaHEK09iSm98WQyetNgoRwNkO1GnKwmeVA3lDY9nRBaSczPrb42jGTDIsyFcz56k2iNuLMKl4MUCVW+kCSTh6S1Gib+/w2hNIqTMbE0J9l7K9shQWYy7nZwQF5oV22KNSnbr17x5GzpK9OxTm8JnxAE4Na9qUa8zFNk8HOL4pfLk9wjsXI7cY50P9MlBUk7VkrookB4x0O2ZBjWxoL5RY1IuvWb7GR9EIrdq7117qjXDkn7SK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVttYgHyDadtu26yECwu5mRcbbhKeAH2Cpn0spVjuFg=;
 b=aqBjZk/fzktRxcQMJKHKMJ9n3H1ZZk9fwxy1NlvUmCIQTEMlCWgvDytE/x61YtM2QGwmrXn2xZIFSKTfISd0xjiI5rAni5Mk0QtNtBIDLfaY9RttJZETR5nkzYwmICrE/r9G25yD+fsQGx2GJ2z4hM/7+erVcs6K/FaVcBGLcxk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5383.eurprd08.prod.outlook.com (2603:10a6:20b:102::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.28; Mon, 10 May
 2021 15:35:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 15:35:36 +0000
Subject: Re: [PATCH v2 4/5] block: simplify bdrv_child_user_desc()
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
 <20210504094510.25032-5-vsementsov@virtuozzo.com>
 <w51im3qwqlo.fsf@maestria.local.igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9b2dc45d-5aab-0aba-6fc2-f99bf8b34b84@virtuozzo.com>
Date: Mon, 10 May 2021 18:35:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <w51im3qwqlo.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: PR0P264CA0206.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 PR0P264CA0206.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 10 May 2021 15:35:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 193f00db-1092-4de8-bcfb-08d913c94209
X-MS-TrafficTypeDiagnostic: AM7PR08MB5383:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5383268B9043729CD81DB888C1549@AM7PR08MB5383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /FV0lzoCr5P7HFUspE7VVYwCTIQX0EMjedbfkLJQ3DAcaVl70ova64SRQkE+6gPNNOrTm0T3r727ad/xbEvOEOcwM3woh1+EMVGf31Kw8nAQcvGjX+Qz6J1juCAT9jXDUWpQnQ1LdTg5+yT1VlwDpOzTLMRX7Mtv1hGk+s4hV+xbvfXIV/V1rSZO/WT4AzExxXYkaQdaCdOfRe1qXH9zipDoqEAvJSVxHzwgIcOCYax5MQl46IGqrb5QZCtXE3iWayjgU4s+0VCo0Gxi1ODmIb0qvk3wcI6JpoPB8+vkXKh9uxCyF2efuUI2IffxFxRpTg17zswG9ErYDOQ9DRd4qHSZ5gQ5Q5h1feNH+5/tpQUBSxIOmL2q8rEedFHnlhP9pZ6kp12lI+oTltXq1RuO8O1gmy6jlunPpp+bmfcdHvWWw/MXtsAqkmUmelebjLUlz2FFxBaNBT4yF9toqPJ4xHv61DxbvSXi8m0L4O324/j3VA2KNxkslMthwJ7csEz5SQWvNLoyyvNgBW0CRR8ou3H0R8+Gwg+c9KmYi+VggnK7wm9q9OXNtoSqDod1cFvkdNIUnX+eLcDe7TIYDc2nfr7XGpIjmLahU/byduKuBMRgWtiBLrmXV1mF6kyDUyJcaB1OX+pB2nADtA7d8IW3lSGZmHY71U8xj6MINIzJ/ag0Cl1mj58MhviXJPXI/c75kUwXPkhse4RcYz5GwSrYyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39840400004)(86362001)(31696002)(316002)(4326008)(66946007)(36756003)(2906002)(4744005)(6486002)(52116002)(31686004)(186003)(83380400001)(26005)(8676002)(16526019)(66476007)(66556008)(38100700002)(956004)(478600001)(8936002)(5660300002)(16576012)(2616005)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SllqYmdEZHBUK0dadUhBUU1lVk51cnlnZHhIdFhjZHhKYjFIYStaV0tPNExl?=
 =?utf-8?B?M1F1TWliUEVMckN2SkFPWUpRYld3REtEWUZvQnl5dXpJSjFRbEI1Z1VHTzZ6?=
 =?utf-8?B?UGMvdHgyTnFGanN5SWVnWG1yc1U1WU5pVlZDWCt6VkYrcVRFcDFPd2JlUU9i?=
 =?utf-8?B?dDVTQ3JiVUI4YTdDSGE2a1ZOODJlS01ZYndPTXJ4ZU10RUN6bGVwSWVOSC9r?=
 =?utf-8?B?cXhKMmNpU1BxYXZWK3kyTXJTZmIzU3RWVWtuRUtMbW9YMFdKUVJvd1B2YnZL?=
 =?utf-8?B?UitHcnVwTWU5WmJYNDA2ckpqSnE1N0pJTkVtMnRjckhSSVQzbUhEQXpCeXhI?=
 =?utf-8?B?WDFuQWV0NEhwOXRzb0hoZkplRU5IeHM1LzBPdHZhWmdwL3dsZzJ4eGI0RjI5?=
 =?utf-8?B?NE11dDBHSFNIOHl6L2RGcDFoY3RVN0p5UDc4L2c0emR6UHBWOVNqVmZZd2Rx?=
 =?utf-8?B?RlMwNEFqT3NwSzRPTkRlTXl1VFNsNktKdlRxWWV3Njk2TkE0ZlpoRFVmVHY2?=
 =?utf-8?B?Rzk2V1hKWEcxNHh3cEtaczNFSnlxaXBkb3JnYjJQeXBPTVZObmpLUnpMWUJ3?=
 =?utf-8?B?d09kWkhXT0kxNDRDeSs2SEc4MXdqYWh4S3FrNmk5VnZsVWU3cUMySlN0T2hW?=
 =?utf-8?B?SWovRFJZbDV4UFYvQWVkTWtKUi80Qm91aEQxcDNlZjhmUDYrbFJoZUcrb1ky?=
 =?utf-8?B?T05CcnFacEtqeFp4WUdacHNmOHFtVitQaW5tNXhPYmUrekZwck81MGoxeDdD?=
 =?utf-8?B?eVFIcDVVZnNLMGpKZFRrU0hoNm5CYkhsZ2dGNFdYZGhjdHFheVQxNytJbEMx?=
 =?utf-8?B?WWhqY1Jyc3RjTzhMTCtYcTlSZjZWV2xoUTNOaUJIMHpFUVE4NGpyWlE2RHpy?=
 =?utf-8?B?LzI1WjhjSThmdWxmQnFTT1FTUGVlOTR2c2FGeDBLcGQ3bFN1ay9RUm8xWjlZ?=
 =?utf-8?B?RnR5RUIrVDJwVUhTeVVwU1NCdjQ5TXQrZ0xycXZqU3YzblR0ejF3aDNodnlz?=
 =?utf-8?B?MVlKdXVSUng4dS9YY2IwNmdLdjNsa3hoVVdHRXFwckJuSUZvUHJBT3p5MlV4?=
 =?utf-8?B?VGRVelRwSlZGZmZ1YngyUzRVWS9UWVBrOVovb3FJdE5RR28rL3JRUXVIZW4v?=
 =?utf-8?B?RHF3Y040UDBqeWliQWdjMFo5Z2ZvN1B2aENNMHBQVThXVEpvT1JZczM2d0d4?=
 =?utf-8?B?MkNXNmxIWnpxV2RTMWEwUTVkb01MM3BkU2k5bGZVd1N5MHQva2Z4c25la2ZG?=
 =?utf-8?B?NGdFQmRRaG1mak5paEt2cXZMakxTMEV6NDZiV2k1REpIS2NXN3FHSmkxdUJH?=
 =?utf-8?B?SVZoODN1dTd1YTk2bVM1dkNManZsT1BBMXhtdkFoZ3QycVRJQVJ4RzJrL0tH?=
 =?utf-8?B?ajZ4NUZrVlRMR1NEb1dsSUEvR2pyMHRqMVhVSTBuV1ArOWdEYUIrazZicmRQ?=
 =?utf-8?B?SGNRYVhKUWJuYi9EYi9rVzhkVUFOK2xFdWdDZEhtNkFHMUpxNENTblZWM0lB?=
 =?utf-8?B?YzZ2MTRXNkZ3R1QvSDRSTCtlck0vWkUwYmpraUVEcW1ZTmwxek5rdURSTzhK?=
 =?utf-8?B?N1NQaTRZKzVWd0xkMEozVTI4UWlCQVhEMmVNMG83R0JxUGZnOGpaNWgwT1pM?=
 =?utf-8?B?bFRNQmo0eG1HcFNrVGRJcFc2TlNCYUN4TW1nbUNFbW9jVHBGRStTVjJOZ3lH?=
 =?utf-8?B?OVJvWlgxYjJLZnd1UHRmOVNhSUdMNmN4cUt5SnEvVXlKZms0TWFYSHRLVU5P?=
 =?utf-8?Q?GSAvvSriAQCl3vOvSgx68TZUN6WMMV+0zamJ4sr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193f00db-1092-4de8-bcfb-08d913c94209
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 15:35:36.7950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSpOfipwE6vbOkjHolGXKty+uhx0oz+q6cR+t/qgDAB6KguuPAXN26lB9keIqRpEskZeYw9EjQxmYWelIQ9r7aEeUTmk1129vYKA0L0Ry7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5383
Received-SPF: pass client-ip=40.107.5.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

10.05.2021 18:33, Alberto Garcia wrote:
> On Tue 04 May 2021 11:45:09 AM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>> All existing parent types (block nodes, block devices, jobs) has the
>> realization. So, drop unreachable code.
> 
> s/has/have/ , and I'm not sure what "have the realization" means
> 
>>   static char *bdrv_child_user_desc(BdrvChild *c)
>>   {
>> -    if (c->klass->get_parent_desc) {
>> -        return c->klass->get_parent_desc(c);
>> -    }
>> -
>> -    return g_strdup("another user");
>> +    return c->klass->get_parent_desc(c);
>>   }
> 
> Should we also assert(c->klass->get_parent_desc) ?
> 

No, as crash on calling zero pointer is practically not worse than crash on failed assertion.


-- 
Best regards,
Vladimir

