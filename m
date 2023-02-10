Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEAC691FC1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:30:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTSi-0000pZ-Me; Fri, 10 Feb 2023 08:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQTSZ-0000nw-RN
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:29:04 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQTSU-0005p7-FI
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:29:02 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31AC0L0f002196; Fri, 10 Feb 2023 05:28:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=zA5HCImqt2iH1xYYsBJHbkLXPrlaGRFBlnc0UTBJyKI=;
 b=jUccppTUI9W4g7VPc/AWrFWYjaLEGngnr1VTFAADHzPJlhCb1TekKb7G455KBe2gIXz3
 Z/dElOwWxWWaHgE9suyxsgY4U7HKtHsIS4vglwnnRw8qPeCaJ0ZjGtJWyBFkGoL1QLKx
 oTfxrHMmQRfP44mwxwJgs38EHrkIJLdBgq3CxMmnRnAiG9/ytWWJJuxgQNpbyE1bcd7x
 9LCtxfrnvCBhOELkxHnkVZKKVZ3p45qnu8a8QcQW+jNMvVyiA3HbyZ/qdqigiRWwgWyV
 2ek+QSanQlfdEAhlErxwdTvDHz3RSZ4t3alNs2k2VHTWwgp2I3PPZ1SXv4T3bvHqXWau sg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqt4u0yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 05:28:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuC0xQj0rc7xtKhtRCBP72vCpqiTCnhgqfCMq+uURDm51NinSAP/a3Aj19Sep7EB2zFcScxyuXxdX9TcTi7zduskXuKEhrkTLJ5MoIBANCfDNQd2mwgWbqu82SdwqcqKT4QhRZwijrL3JLP3TzaYerV/z2JQ+yT6oG9S0+H5R8Cv4zSpl9v73lMM8iTX0O6fBed2nQgvRhEkycFsv/n21AjZw+KTj2sv++3TBLWyU3X0kOOyBUEZ/NZKrnVuZCCyyyFw7Aqke4wBgv8ZBykInDR6YL7YhzBRU2bSRC7gFf8jKG37EFD0iidqRch9PpDgdfasLO22RsiiLjEPoU1eWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zA5HCImqt2iH1xYYsBJHbkLXPrlaGRFBlnc0UTBJyKI=;
 b=HF4C6TYLzBFFJ71zWtMdPNI4m+i5JmvcxC23PHHmt6jjSbKJUvxaKD+eRbYr5fP3H7MWtOB4AQw/Fpg9k/Agu72bEnNqV2e08ySQKhO0m19mf6zn5y5et+Bj13EYP7qmbEHlaWbLXbg1ThNWqggv6nklygcgT+FY+g1hOcEkjLHImQb/yV+CWes33q5Ta0SAM98agKZXqLq/IJD5ZJ9E+nrYSrcXmUGZHNPsmZR5KIkM/4B8HmJVggUKWJXOHz4TvLUCU9lNytqwQe8eVaxnE4NpyWHrloiagBFlLmA6j/ZAiMLiKNmhqMwwG/01LM1PBcac2o2/0AQ6OXJznfI7dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zA5HCImqt2iH1xYYsBJHbkLXPrlaGRFBlnc0UTBJyKI=;
 b=QxeqAb7FlmDYIDmiz6mrn4rV2XuXAILllvOFPO+qrWQpfZeVJB0H4Re15LBvyXJbMtlOfs+eaXv+ocJ8r9nAUN76m+Ea6x5b8+b9kGDEHGtJ/Z3Gitq4t2dsEtSmhHB2qRrXzmojkRop6THMpLfHzfW7ErKsZNWT9drUfwlcwdtxgdUBInVsxqnCtNRxq9Qnyf9XbUNhdbwjKFV8+tjhVjUdnQXiJmYZqRpfGa6O+TT9rwKaGcYmtT1kdmeL3QeSXvo+xvabb4BbQQAj4SqejeT68LpJkbGYEFsTIDPALqZYFPeLX+owt6Ooet3cLNmosGC+IfR5+tEmy5AM2KoPfA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SJ0PR02MB8675.namprd02.prod.outlook.com (2603:10b6:a03:3ff::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 13:28:46 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 13:28:46 +0000
Message-ID: <2157ed5c-7e1e-bd8f-1644-b7231fffe7ef@nutanix.com>
Date: Fri, 10 Feb 2023 18:58:32 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: QAPI unions as branches / unifying struct and union types (was:
 [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu monitor
 command)
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 manish.mishra@nutanix.com, aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com> <Y+TLJ9Ui790bIR3b@redhat.com>
 <87o7q2vv7v.fsf_-_@pond.sub.org>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <87o7q2vv7v.fsf_-_@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::22) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SJ0PR02MB8675:EE_
X-MS-Office365-Filtering-Correlation-Id: 8afc7498-51cb-425b-d72e-08db0b6abc5d
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4Spp259Bs6eyp3/4rBkA5WHE6+vWtYlA72HO5Y9WmDlrbvItuWqrK3P1uQjCIcQqOoc7mt/OIYsyBvTIOKvkYyhQAmFmvxFHHR5aKzYhXh8bGrlgrfAqPk7C/r5lvESH47W1RQNrh1CEwia1J9nfEfkD4DgerO2htmqVS1DwSbbNJtONTJZtNW6B3y7gRKnzFENCcHskMMkY0upOtqlQHt/txQMA0+uCKgMmZmcjcs7SK6yQuACUDfF2lAbnB+YRe7oNdkURXODEF2kZMGBpw2lVflorpagTT0VTFBQEjyKXqZ6HVN6EBkdyXmZbzkzNQIptMV6bjyjo16gzQ90W7d9BtZp3F4NvwGi7zYTchiC+utZSyvRx28q3ReIG0nhHe2uZ4jnLP4M7B22NGZ98dPsSRWFFfVUPx1O+MxlMiCQXsE98kQuxbzXINA42NtShRXwUguT7Aw/it/cr6SUny2jAQtPGmrbjwToVygc/1ZK1Ht3mAGQJSQiTr/hwGkmxF/Mnf6Q/DsNhSk0HgPVy0CrPu8dOHMhdU2moWj0xXAAh0H1AcMV8DtitcLyHXQfutzu5U5xfa65cw2C+X62BS0Avnjhe+q2qsBJRzklsPVUz23CuGRJLIsutN84qdqk030qQD5jpcgR8Y+s0iZQ89l77YEAervTjTGCtF6Jt32yI06FyynU3rXGnBvBKY7S+pkoNreUttZIKgmobIvWNzJqytpQWs9QJWn0QHAthwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199018)(86362001)(31696002)(36756003)(38100700002)(66476007)(66556008)(66946007)(41300700001)(110136005)(316002)(8676002)(4326008)(8936002)(5660300002)(44832011)(2906002)(83380400001)(478600001)(107886003)(6666004)(186003)(2616005)(26005)(6512007)(53546011)(6506007)(6486002)(31686004)(66899018)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU81T2E4SVIrYk42enNabzZsdXdCSWdxOE1LOUwyclRwT0ZpQ01JRGVNc3ZM?=
 =?utf-8?B?WUlxVG5aMjdLSkZBTVIxYjF6eWxSd1cvWXRSYnRDa3piZG5TdjVkV3Z2SnFz?=
 =?utf-8?B?SjRGbnU4YUdyc3Y3ZDk3dDIzQ0IxNURTd2NkY1N1RE4ra2tKNDJDajBzS1lH?=
 =?utf-8?B?VmZXUFRFL2orRytNK1QvbHN2Mzc5eUxPNGtyOVl4bjJod0lsU09kUGlMSGJG?=
 =?utf-8?B?UHRhWm1oNFJJU0RidVRZS3Q1VFE1ZDZDdzZtVURTRWF5SldTeVdTMnRjcDJN?=
 =?utf-8?B?OS9CSnZOcXkrK21jV0EzZlYvdVpJMWFNTDJiZmNTbkxxS2NyajlEcm01a25k?=
 =?utf-8?B?SzFTUHdpYVA4YkVNNXBLbG5iV3IrNklDenhMYVpmeXJEUDd3SlY1cDZ4TGtL?=
 =?utf-8?B?cWdRMC90R2NiUEV1VUlJUWtJdHVEb2ZkUEF2YUNoR0lXMHFVRzlDQkxYV2pR?=
 =?utf-8?B?NC9mM0Jic2dER0NsV0ZHalVtK21abkdFVDUveURXdzdwMisvMHlhZVFOWTlt?=
 =?utf-8?B?VndocW9wYnVMN3l4dWJ5dXV1MkRPWXQ3aktJUVFmOWdENy9kOTVVTWg1ZTZx?=
 =?utf-8?B?NXJpTERzL3BBU2czbEFNZmpJbmtMemRSY3QzZUZmdnduVnVDYVNYWCtmNFdp?=
 =?utf-8?B?QU9LWXREcXZUQS9HdnJzZzlqYTdoYTFKODJpaG1pcHJPKzFJb3dsTmlJcDhI?=
 =?utf-8?B?c3RLTlNZbTlBOC92ckFqSWdvQjFpdzUrVjV2SStxendLZVA2QVNDb3hDL0xt?=
 =?utf-8?B?N0JRZ1V3RFJWWDVmWjBadnR2ZnRrZ0hMSU0wdklId2lwMGpQanJrQ1piYk1V?=
 =?utf-8?B?bHZHTW9ScGZGdjhmem5RWGIrVnVFaVZheVFuOVdrWlhLMHhFMmxmQU5oNXc4?=
 =?utf-8?B?T0kvQ2xxRTVmaDFPSjFvRmg3aTV5d3p5T1d4N2d5T0VqRDA0U1N1YnpYWHlE?=
 =?utf-8?B?azJwOEZOSUIwNUloVEs2SXlranEzVEZzS0RiaDdRbjRTTCtQVXlSQzFwcS9D?=
 =?utf-8?B?c0FhQTRJMnYrMmM5Sm1VaC84YzVKcG9TMEJ5ZlJONVJRRHlEbmtVWHNBdDlE?=
 =?utf-8?B?UXplOGZKVzVRaW1lUktKeURmU0NqREdVSys0bE1YM2lKWXdUUGVxK1ZCMVZX?=
 =?utf-8?B?OE9ZOGlzQmZmRExYandxU2JFd0FSamNhTlFCNUZWR21xaW94WjJWZ2pIYzVy?=
 =?utf-8?B?dmdDZ0NVNUwybWZzaFEzcU1kdm10NjE4TVJtdEZPRGRFT0JqamVPa2hGNk5x?=
 =?utf-8?B?T05TaTRQeWpraGR5YW82bFpQTzJZd01xb1NqdnhXeTQyMjFqdXppcUNoa1M5?=
 =?utf-8?B?S0ZGYzZsZmFlZHJhZWZiTzNsZFFQQlRDazhZazA4QlF3eE5POGt3RTVvb044?=
 =?utf-8?B?a1pkYUwvemhZaHlBVGdTcUYwQWtnY1VZdzgyb1JQYkJiTTBzOVpYQWtWdFlD?=
 =?utf-8?B?ZFdOeWtIOHduL3IzSnRuWVpKdVF2UGszdUZSSUE0dVFhRGtqanQzd01GSUJP?=
 =?utf-8?B?NjVvSS9yeFRUeFZBQ2QvYlBLK0p3OEx6YkMrV0JJZVgrcXEzcWZuSno1RW9t?=
 =?utf-8?B?aStFYkRkTDlCT0R4NU1KajZTcndvT0pOMFhJQzVIdVNRZ2FKeXE1bkJ0QkhX?=
 =?utf-8?B?bFhiZDlkaDRYNmFrUEtRUWR0WXdOS0pRSDVSWk1tb3pIUkJHWVpKYmV4cEYx?=
 =?utf-8?B?S0NkT2NmOVQ1R3V4SFdZU3IyVmwwWTZ1UmxtUDRJMlNvQzVKOTdQRjJMb3lq?=
 =?utf-8?B?TnUyQ2VROEF0NnB4dXl4U3NXZlJ5WCtNdmFaNlk2V2lQcmthVHFTNFZQV1hM?=
 =?utf-8?B?ZVAyaHNSL2c2c284STdRWVNmTkxLbHFsZzk5R1VFeXFBTWpUOXZJcTltKzVO?=
 =?utf-8?B?N2s5UUh1NlloM2p5c09GR1JSUnVkZ1loYzltL0JXUWdFUlR2MC9YNGJJRWVT?=
 =?utf-8?B?eUExVEFqbVByWkg3dW1QbWNaczVMd0YyOFNxZk9uak8xdXVsWHFaNS9tVGov?=
 =?utf-8?B?M01kZG1oR2F4Q2huK0F0a0NJSWFoQm53VE91RUkwNEdjNFB1OGV5ZzNWMGQ0?=
 =?utf-8?B?Z2E1SUNIN0Z1b0MyQWtRbHF6OXJtNzArb0pPem92dTVSVXNJTXY2c0lpSjlw?=
 =?utf-8?B?S3RyRWEvZXY0b2RoRVJ5TmtnSDJHT2UyTWY0WUdzbHdvNE5TK2Qvb0tYTFcw?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afc7498-51cb-425b-d72e-08db0b6abc5d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 13:28:46.1512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnV/wkFY/C1rD24n8PqNRYOTlY7NLGWUod/1Ti93Ih7s+zlBSLKcdLpvL6SWs88CZFNdWwiRx3Z7u6BBh3+qAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8675
X-Proofpoint-ORIG-GUID: Lt5p5hRvA1mjYi3WCRv0_HrHbYNLg7fx
X-Proofpoint-GUID: Lt5p5hRvA1mjYi3WCRv0_HrHbYNLg7fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_07,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, SPF_HELO_NONE=0.001,
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


On 10/02/23 12:54 pm, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
>
> [...]
>
>>> +##
>>> +# @MigrateAddress:
>>> +#
>>> +# The options available for communication transport mechanisms for migration
>>> +#
>>> +# Since 8.0
>>> +##
>>> +{ 'union' : 'MigrateAddress',
>>> +  'base' : { 'transport' : 'MigrateTransport'},
>>> +  'discriminator' : 'transport',
>>> +  'data' : {
>>> +    'socket' : 'MigrateSocketAddr',
>>> +    'exec' : 'MigrateExecAddr',
>>> +    'rdma': 'MigrateRdmaAddr' } }
>> Ideally this would be
>>
>>     'data' : {
>>       'socket' : 'SocketAddress',
>>       'exec' : 'MigrateCommand',
>>       'rdma': 'InetSocketAddress' } }
>>
>> though the first SocketAddress isn't possible unless it is easy to
>> lift the QAPI limitation.
> Context: SocketAddress is a QAPI union, and "the QAPI limitation" is
>
>      scripts/qapi-gen.py: In file included from ../qapi/qapi-schema.json:79:
>      ../qapi/migration.json: In union 'MigrateAddress':
>      ../qapi/migration.json:1505: branch 'socket' cannot use union type 'SocketAddress'
>
> Emitted by schema.py like this:
>
>                  if (not isinstance(v.type, QAPISchemaObjectType)
>                          or v.type.variants):
>                      raise QAPISemError(
>                          self.info,
>                          "%s cannot use %s"
>                          % (v.describe(self.info), v.type.describe()))
>
> This enforces docs/devel/qapi-code-gen.rst's clause
>
>      The BRANCH's value defines the branch's properties, in particular its
>      type.  The type must a struct type.  [...]
>
> Next paragraph:
>
>      In the Client JSON Protocol, a union is represented by an object with
>      the common members (from the base type) and the selected branch's
>      members.  The two sets of member names must be disjoint.
>
> So, we're splicing in the members of the branch's JSON object.  For that
> to even make sense, the branch type needs to map to a JSON object.  This
> is fundamental.  It's the first part of the condition in the code
> snippet above.
>
> We have two kinds of QAPI types that map to a JSON object: struct and
> union.  The second part of the condition restricts to struct.  Unless
> I'm missing something (imperfect memory...), this is *not* fundamental,
> just a matter of implementing it.  But I'd have to try to be sure.
>
>
> Instead of simply allowing unions in addition to structs here, I'd like
> to go one step further, and fuse the two into "objects".  Let me
> explain.
>
> If we abstract from syntax, structs have become almost a special kind of
> union.  Unions have a set of common members and sets of variant members,
> and a special common member (the tag) selects the set of variant
> members.  Structs are unions with zero variants and no tag.
>
> The generator code actually represents both structs and unions as a
> common QAPISchemaObjectType already.  QAPI/QMP introspection does the
> same: it uses a single meta type 'object' for both.
>
>
> There is another spot where only structs are allowed: a struct or
> union's base type.  That restriction will be awkward to lift, as I made
> the mistake of baking the assumption "object type has at most one tag
> member" into QAPI/QMP introspection .

Hi Markus, thankyou for explaning in such detail. I tried to understand 
of what you explained.

So IIUC, you mentioned the QAPI generator treats both structs and unions 
same, but basically in the schema.py checks is where it tries to 
distinguish between the two ? and because of the fact that 
docs/devel/qapi-code-gen.rst states that for a union, it's branches must 
be 'struct', and that's the reason it gives an error ?

If that's the case, can we improve on our checks and allow union as a 
part of branch of a union ? or something else ?

or I may have completely misunderstood most of the part 😅. Please let 
me know

>
> [...]
Regards,
Het Gala

