Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FE262A0E7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 19:01:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov0Dj-0000Hj-Fl; Tue, 15 Nov 2022 12:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ov0Dd-0000HT-K7
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:59:33 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ov0Da-0006qT-Ct
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:59:33 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFF3WN8019191; Tue, 15 Nov 2022 09:59:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=6EsVfEMXs9YuKwRFoGUxTPoCsQQIByPYjgqLOkG8Rkc=;
 b=hvDMFUVPP6H4ZAw0338WO0ZnzvfwFxJIbikPs/qMfwzw2mvP2wBvwHaszF/0PC+gTsjw
 5Vx3bX5NLvvk2LxNKKCjGdTdjow2wOzhc/5iYNcZfcbexS3rIcY3N9UHQGsP3jX6j25d
 L1TNU5QqzNsXpVAd0bgapvyqg17SDS45igUlvHhxS3/yJ5k0aMIV/QSx5JB/TTtDSohE
 tuLUWdZPoBjnqZwqcwckDaUxf3/Ci6SxSsJqcIld5xz4d/DokDmVTbTK8Y5UA7RS7+Jp
 0X4RUHR/hyC/xbTxLn3GlwKQt0eZ2KmHMs86/yb5NqBggEtYIuvkJOaTHgzjFN3o/NV7 Hw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kuy8v23s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 09:59:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etJosmGpD9E8zdTtlXEjtvtUWwoab1ZJR+VUsiIWPIX9UkP2j0q/fBBkDI36y7hxJPnsMUH7VMEB6FDTInW/MBTR6v9hv8iUVEyxW3qb5XVL3qIkZQYc5epnDWlgAD+hKhJf49wYWgLKClHpJAPo5nz8yrujruPhCHa6kbVeXZ4qKkC6aPHmVrQjH1789Pp2ZEj3oXQ3BvZQlFe5CIzGS9U2FfDNp1R+FcndI0GUcwSzBRfW+f8tVL2PjS4ZHThXmRTc13bqAisGqC48V9xRfUb6oVww0UpY9KytX17Bsd1v4Z2rdXk+D+xuAufZfiWYLh0TiyvYaTYWS5OB2hRyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EsVfEMXs9YuKwRFoGUxTPoCsQQIByPYjgqLOkG8Rkc=;
 b=J5E287Jr4jw+TcnDvSd9DfZFpO8sg4rYeQAZte3BfmOr4yNcGiT4rj2ZUA2ZxsgFz1QOrwyW+ekzye9siOn284TizVdlxdHt01qvvu4P6VmFq8g3lgJHW1/auzWlqb98hb0n5PJ3wmDMtdLWd4kEBbTKw7SzWuEcs/+8td7md7LbvIzrX4LmnzdS0HGiji0j9iMSu/f1lEoKuwNHPHBk6sC6XsyJ8RXS89XBh++zrzsAj0j289oM8Qgfo3zNJeKSvIXw0KaiDqFSv5b1LdoEeLqr0rW/vQ2myW28rLgQ3Dzu89yuYXdcyZZsy8ld5cgJxmJ6gShO6svRYFYmXwrBeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EsVfEMXs9YuKwRFoGUxTPoCsQQIByPYjgqLOkG8Rkc=;
 b=iDjVzhQecwyxWqIkkBDQmQLbl49K94tZNn/p0fHWU5tOE5Ndex/XqcprQ5viDhEkYxovK5A/9pC/Z0Fy9pd2kjoyMkCYSeEgS7kcWbYlT2SAlFdP5PXNJB4ssSwfj8/qHUkY65RkvggS5tDTyysUB+9qUB+gEgJt9zyD6wbIJU1ADh8xXFD/pLl4hg5BgvegTo6dLRt+MHyHVlo510v28ga+XaWoDlZYTh8n7tfLiY6TlbjsbYKhWTxa4Kmu0wrTXCLCgj35Rj1uN3rLJQH6O5O1bsCTY/OGgJ1emFuxbunwhXdq5AKA9/BhlqoNZ9o4EjcAYItQ7xQz/aqwlbYYvA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM8PR02MB8137.namprd02.prod.outlook.com (2603:10b6:8:1a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Tue, 15 Nov 2022 17:59:25 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 17:59:24 +0000
Message-ID: <a027006d-48f7-4d8d-465a-a726bbdc6fbf@nutanix.com>
Date: Tue, 15 Nov 2022 23:29:13 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2] migration: check magic value for deciding the mapping
 of channels
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com
References: <20221107165159.49534-1-manish.mishra@nutanix.com>
 <Y3POFd+LFuxW8w21@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y3POFd+LFuxW8w21@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::11) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DM8PR02MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 360b1437-3a6f-4809-8845-08dac7332115
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nNmTb5rAKpSnYPKwwHUoMLzz3f1Cm86pmwZlwiI1lYa8Uq1yyjiHA5PKd6I/BqvM0CTZ211AVNJGwU4VwzaH4y1PN8rqPu+hie4tl0RQ0l6srNZQD/jfS11Y3SX1jf+GNoyLcVNqfO6TtLsbBWEhztU+58nBIJHvb5NT7Kag5JzErgB/EDSpsNx4KWtW8h/ekxKE61BiRNN3OJ8DTGBow1XOYTziygi3+SLYJ8rfIlNaZV/B734d0XiaWCbMSSS1aP0MwYatwXt+WR3Fkv8Woo3reydFlNMhZYEKBD/Ht1g69svJPnwT8V2TItsIarcuOYVd9YYm19F67n87bH0k88vDBDrZ013rq33SqnzQPLqscCVKcmhWeME6IYE2KR+P+RiThDwTuUDOF1v/oowlBaC0c6KH+3UpeZ61IlCnxv6IQhgreOA1ipj00t5x4zSn4nquXeoa+1inaQUiX69qi2a9GyybJRip+pkPQ0UvpKpl1zIG8gyvv2raBSXBUQPGRMZ4ftw3Hz0yrWbPY0CihFfIQHnbigGI255r17QLzb+G/vpTbNzkhVdy5o9VgH/Y4gxyHrO1v5eBsMJxWQBrO1yPNbBBWh1Fg6u62qzo03w63uuL5tVvbDL3H+jo62tHC8audSEQNTd1tIs4EvdpLteQtBATo+t3NESb9o1QdFfsQTUKSAJaAUqMfXYG42AFq1A86JcHqe7bDCdDbAimIlYfV00/wHQ/Dxmj9gUAhXAl9zqJTwp0LscnG39BMyBhhvz+3O3VTM1rKbObmTmRhPA+JNbLPaozYJcvuCv0q/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199015)(36756003)(6666004)(31696002)(86362001)(38100700002)(316002)(66556008)(6486002)(66946007)(66476007)(8676002)(6916009)(30864003)(2906002)(41300700001)(4326008)(5660300002)(83380400001)(8936002)(2616005)(186003)(478600001)(6506007)(6512007)(53546011)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1JaNkpDckZWS001UEhiNnFyRTBlc2dHK1RTTEY5WVI1SzBhTnN6U2dWMFBt?=
 =?utf-8?B?MzVRQjNDeExTMGxreFJ6SVhJV0xtRVIzOEsxZmIrMVRLNERWUkpxcmRrdzFC?=
 =?utf-8?B?K1lTb2hraUJ0T2hKVXFGb29hUEFPYmR6NG1VbUV5ellqVFNkOERmcnNLSFBh?=
 =?utf-8?B?Q2hScHlnYzdPdXNyQ2JJQmFNL0hHTFBuS2lOUjMyNEcvaUdDQ1FDKzl6MldJ?=
 =?utf-8?B?VWE0Wmo0RXlLcWlPdXNaUWFYYk5peGlVOTg1YmlQK1lTNXNEVGNjMTdRWXRC?=
 =?utf-8?B?amJHTUUwWUhibEVhQ1ZpcE1NVUg0OEJJdEUzenExNEtEQWJ6c1VqU2RLeE9h?=
 =?utf-8?B?K2dMb0hWd2NFdGhGU21ONVVjTjY4aTBSRFRNWmFvM0U4My9IV29HNDJ0dmhm?=
 =?utf-8?B?cGpRWUFTRGFpMEl4Z3gxL3BxdXlnWEd3cFBEUXNicDQ1UDZWc1pTdXFSdWNk?=
 =?utf-8?B?SnF1TUl6WHRtREtiRER6ZWRpK0FnMjN2c25ITTRJZGtRWGJhd2JLdkNONGVj?=
 =?utf-8?B?TUhaRnliNlFuMGQ3bzBpalFDbDBaRVRzQTQzRzRESnpOVXVaMUZKTVZBQVBh?=
 =?utf-8?B?N1JQRmVxVFpNbHNsdUZGcHdzVlNmZkRsSEw2UGZIdzVTeXAxSHJsbjIwSUps?=
 =?utf-8?B?TmVDYkZJS09LalJHN1YyWlA0cjlWZEJwY1NIL0IzSEJPVExTNXpRVjR6Sms1?=
 =?utf-8?B?cmVQcm5JMkEzNyt2OFNVd09USHZDQk4zQm04WDhVbGpQWXRYWklqOHdNbXQ1?=
 =?utf-8?B?Qm1WMjBDWXlHcCtXam45dURPWkVJTVJYTVhPRDhrSmRaSzcyK3ZTaGFLbFVW?=
 =?utf-8?B?cHZMOWM3VWsxTWRKNVB6TitjbVMrbVNRMVd4elhGMTBLMGVmdWdjeTB1Q3BH?=
 =?utf-8?B?dWRGejFhclVNN1VhckVjblltWndlclJCWHEvMDV6alJvcHdQRjhocnpGNG1S?=
 =?utf-8?B?N2JXTnR1b084WUZLbGt2QXVGNGxqODZibTIvVVEycUtXbFFpVHpRUHZWVm1F?=
 =?utf-8?B?K29zdnVFanRRbFVsaENoOTFyYjhYR1BKQkhJMFN6SEVyV284TWxQUWMyTEJV?=
 =?utf-8?B?Q3h3S0Q4OXd2cXBvNkxDMHROZTgwNkVpWWdlOGVwdEQrUmVYRWdTSDBFbkFz?=
 =?utf-8?B?aGtpaElSRkY2R1lJeEtDVnJTbFNjTUNKaXRIQkRsTlJHZ2ZDWVB3SHdxdHBZ?=
 =?utf-8?B?WTBUSXdJOW5JcWVqSk0wODcxVDVGVkhjazBRUHAwMUhsWlkwZnpmc1V5M01t?=
 =?utf-8?B?Z2FFMmZyZW9VbzM3VFlXNi9TM09TVDFvWjFLVElGZEUyVWFRZ0ZPTGs0RFhX?=
 =?utf-8?B?OWVCV0JPOWdxbTlPOTZmT0srZjNnb1VScmxyMW1ONGFCb0dBOHJXeGswMHo1?=
 =?utf-8?B?a2x6S3M2a0RZdHU0MHVQd1VrQ2w4SUZzbVB2aUowbHNzRnF4SG9DaHNpdUpN?=
 =?utf-8?B?MmlZdXZIT1JQQW84T3BHeTVXRkNRYUhHTlRWa1pneVRQNk4wMUw1YWQ3VTdH?=
 =?utf-8?B?ak1yaG56ZjZwcW5YMjBCQlZHc2NKVnVvdmR2L1p2Ui85MG8wVFhvZVlvNUtZ?=
 =?utf-8?B?ME5USVZHMmZwcDRuZVB3c3FXQ3lzbElaeWJaZDROY1ZibzM4UTRnaEtDNnd1?=
 =?utf-8?B?SFE1OVFCRjBhZ2QzL2pKRDBvdEw0S3JYSElHbWRpb2kzL25GckhrK21wQ2Ev?=
 =?utf-8?B?eExRUThZcnJBMGsxek8ycHpVOEFEdkFGY2dPaUpkamhmQldqemo3T0d3amx0?=
 =?utf-8?B?c1VSNHRoQUxGU2NBa0xaQzlkaFZ5T1I1SU9sOHV3UmNnazNYSkFxd0dwd0ND?=
 =?utf-8?B?am5sTXd1RWt0cTl1QzRtV2YrdzNIMkFPaHpWdFdsQTMwb0w4RGxsNGZLcXFt?=
 =?utf-8?B?YnFZRVA2NEh4aFJaTzBxWFVGZkl3Ymx2VU0wVE1Cd3JrWnNudmQ5cUVVQVor?=
 =?utf-8?B?WWZVTUpVYm9BeUJFbWhhL2xlbkxYdU5DU1Q3Nnp6M1RBS0xzUVBLZDMxSThT?=
 =?utf-8?B?TmwyUTJVVEcxV0g0d0x6dUJnU0gxcTAxMW8zMkdocEZxbi9DYURmdlpLckFU?=
 =?utf-8?B?SXkwNkVZNzFOQ0FRYzIyenc4NUFLUTNOMUorZGRlYWhKcUVMYkg2R2dtUXVp?=
 =?utf-8?B?bm95TnNSNDVzYXkrbWVNVGRlZVJGRmdGdjJNYmNFMlZHdVBzb3ZSTStzSHht?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360b1437-3a6f-4809-8845-08dac7332115
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 17:59:24.6788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABhfvtkdFtulvGA+E9tCfTHpmOth6L25fpGH6rIEPSyw3Fr7xOcC5BNIzYqNq7J3tnOFH/3qGQB1Dp2RcKIk8xIFPV/nh4PPSWGezNw0+1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8137
X-Proofpoint-GUID: kG1LdaMztSZQ4fIf4uwCA0aYXIOz0ESc
X-Proofpoint-ORIG-GUID: kG1LdaMztSZQ4fIf4uwCA0aYXIOz0ESc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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


On 15/11/22 11:06 pm, Peter Xu wrote:
> Hi, Manish,
>
> On Mon, Nov 07, 2022 at 04:51:59PM +0000, manish.mishra wrote:
>> Current logic assumes that channel connections on the destination side are
>> always established in the same order as the source and the first one will
>> always be the main channel followed by the multifid or post-copy
>> preemption channel. This may not be always true, as even if a channel has a
>> connection established on the source side it can be in the pending state on
>> the destination side and a newer connection can be established first.
>> Basically causing out of order mapping of channels on the destination side.
>> Currently, all channels except post-copy preempt send a magic number, this
>> patch uses that magic number to decide the type of channel. This logic is
>> applicable only for precopy(multifd) live migration, as mentioned, the
>> post-copy preempt channel does not send any magic number. Also, tls live
>> migrations already does tls handshake before creating other channels, so
>> this issue is not possible with tls, hence this logic is avoided for tls
>> live migrations. This patch uses MSG_PEEK to check the magic number of
>> channels so that current data/control stream management remains
>> un-effected.
>>
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>>
>> v2:
>>    TLS does not support MSG_PEEK, so V1 was broken for tls live
>>    migrations. For tls live migration, while initializing main channel
>>    tls handshake is done before we can create other channels, so this
>>    issue is not possible for tls live migrations. In V2 added a check
>>    to avoid checking magic number for tls live migration and fallback
>>    to older method to decide mapping of channels on destination side.
>> ---
>>   include/io/channel.h     | 25 +++++++++++++++++++++++
>>   io/channel-socket.c      | 27 ++++++++++++++++++++++++
>>   io/channel.c             | 39 +++++++++++++++++++++++++++++++++++
>>   migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
>>   migration/multifd.c      | 12 ++++-------
>>   migration/multifd.h      |  2 +-
>>   migration/postcopy-ram.c |  5 +----
>>   migration/postcopy-ram.h |  2 +-
>>   8 files changed, 130 insertions(+), 26 deletions(-)
>>
>> diff --git a/include/io/channel.h b/include/io/channel.h
>> index c680ee7480..74177aeeea 100644
>> --- a/include/io/channel.h
>> +++ b/include/io/channel.h
>> @@ -115,6 +115,10 @@ struct QIOChannelClass {
>>                           int **fds,
>>                           size_t *nfds,
>>                           Error **errp);
>> +    ssize_t (*io_read_peek)(QIOChannel *ioc,
>> +                            void *buf,
>> +                            size_t nbytes,
>> +                            Error **errp);
>>       int (*io_close)(QIOChannel *ioc,
>>                       Error **errp);
>>       GSource * (*io_create_watch)(QIOChannel *ioc,
>> @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
>>                             size_t buflen,
>>                             Error **errp);
>>   
>> +/**
>> + * qio_channel_read_peek_all:
>> + * @ioc: the channel object
>> + * @buf: the memory region to read in data
>> + * @nbytes: the number of bytes to read
>> + * @errp: pointer to a NULL-initialized error object
>> + *
>> + * Read given @nbytes data from peek of channel into
>> + * memory region @buf.
>> + *
>> + * The function will be blocked until read size is
>> + * equal to requested size.
>> + *
>> + * Returns: 1 if all bytes were read, 0 if end-of-file
>> + *          occurs without data, or -1 on error
>> + */
>> +int qio_channel_read_peek_all(QIOChannel *ioc,
>> +                              void* buf,
>> +                              size_t nbytes,
>> +                              Error **errp);
>> +
>>   /**
>>    * qio_channel_set_blocking:
>>    * @ioc: the channel object
>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>> index b76dca9cc1..b99f5dfda6 100644
>> --- a/io/channel-socket.c
>> +++ b/io/channel-socket.c
>> @@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>>   }
>>   #endif /* WIN32 */
>>   
>> +static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
>> +                                            void *buf,
>> +                                            size_t nbytes,
>> +                                            Error **errp)
>> +{
>> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
>> +    ssize_t bytes = 0;
>> +
>> +retry:
>> +    bytes = recv(sioc->fd, buf, nbytes, MSG_PEEK);
>> +
>> +    if (bytes < 0) {
>> +        if (errno == EINTR) {
>> +            goto retry;
>> +        }
>> +        if (errno == EAGAIN) {
>> +            return QIO_CHANNEL_ERR_BLOCK;
>> +        }
>> +
>> +        error_setg_errno(errp, errno,
>> +                         "Unable to read from peek of socket");
>> +        return -1;
>> +    }
>> +
>> +    return bytes;
>> +}
>>   
>>   #ifdef QEMU_MSG_ZEROCOPY
>>   static int qio_channel_socket_flush(QIOChannel *ioc,
>> @@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>>   
>>       ioc_klass->io_writev = qio_channel_socket_writev;
>>       ioc_klass->io_readv = qio_channel_socket_readv;
>> +    ioc_klass->io_read_peek = qio_channel_socket_read_peek;
>>       ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
>>       ioc_klass->io_close = qio_channel_socket_close;
>>       ioc_klass->io_shutdown = qio_channel_socket_shutdown;
>> diff --git a/io/channel.c b/io/channel.c
>> index 0640941ac5..a2d9b96f3f 100644
>> --- a/io/channel.c
>> +++ b/io/channel.c
>> @@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
>>       return qio_channel_writev_all(ioc, &iov, 1, errp);
>>   }
>>   
>> +int qio_channel_read_peek_all(QIOChannel *ioc,
>> +                              void* buf,
>> +                              size_t nbytes,
>> +                              Error **errp)
>> +{
>> +   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
>> +   ssize_t bytes = 0;
>> +
>> +   if (!klass->io_read_peek) {
>> +       error_setg(errp, "Channel does not support read peek");
>> +       return -1;
>> +   }
>> +
>> +   while (bytes < nbytes) {
>> +       bytes = klass->io_read_peek(ioc,
>> +                                   buf,
>> +                                   nbytes,
>> +                                   errp);
> IIUC here you need to accumulate bytes rather than directly reusing it, so
> e.g. two reads on 2 bytes each will satisfy a 4 bytes read.

Actually peek always reads from top so even if there are multile reads it does not accumulate.


>> +
>> +       if (bytes == QIO_CHANNEL_ERR_BLOCK) {
>> +            if (qemu_in_coroutine()) {
>> +                qio_channel_yield(ioc, G_IO_OUT);
> G_IO_IN?  Same question for two lines after.


Yes sorry, I will update it.


>
>> +            } else {
>> +                qio_channel_wait(ioc, G_IO_OUT);
>> +            }
>> +            continue;
>> +       }
>> +       if (bytes == 0) {
>> +           error_setg(errp,
>> +                      "Unexpected end-of-file on channel");
> IIUC for a generic API we should still allow the peek to get a close event
> on the socket.  Then we can return 0 safely and let the caller decide,
> rather than always assuming it's a fault.


sure Peter, I will update it.


>
>> +           return 0;
>> +       }
>> +       if (bytes < 0) {
>> +           return -1;
>> +       }
>> +   }
>> +
>> +   return 1;
>> +}
>>   
>>   int qio_channel_set_blocking(QIOChannel *ioc,
>>                                 bool enabled,
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 739bb683f3..406a9e2f72 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -733,31 +733,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>>   {
>>       MigrationIncomingState *mis = migration_incoming_get_current();
>>       Error *local_err = NULL;
>> -    bool start_migration;
>>       QEMUFile *f;
>> +    bool default_channel = true;
>> +    uint32_t channel_magic = 0;
>> +    int ret = 0;
>>   
>> -    if (!mis->from_src_file) {
>> -        /* The first connection (multifd may have multiple) */
>> +    if (migrate_use_multifd() && !migration_in_postcopy() &&
> It's weird to check postcopy status here.  Do you perhaps want to use
> migrate_postcopy_ram() or migrate_postcopy_preempt()?
>
> Note that I am tempted to disable multifd with postcopy in general before a
> full support is implemented, I'm not the only one who thinks so..  But
> that'll need to be discussed elsewhere, and yeah it's always safe now to
> check with either above (not migration_in_postcopy, though).


Yes, sorry, I did not use migrate_postcopy_preempt because it does not work with postcopy recover too. But agree this should be migrate_postcopy_ram.


>> +        !migrate_use_tls()) {
> I'd rather don't check TLS explicitly.  Can we perhaps try to detect the
> peek capability and then fallback to old method if peek() is not supported
> on the channel?  Below comment would still be nice to have though, and I
> also agree TLS seems to be safe.
>
> Thanks,


Sure will update it.


>> +        /*
>> +         * With multiple channels, it is possible that we receive channels
>> +         * out of order on destination side, causing incorrect mapping of
>> +         * source channels on destination side. Check channel MAGIC to
>> +         * decide type of channel. Please note this is best effort, postcopy
>> +         * preempt channel does not send any magic number so avoid it for
>> +         * postcopy live migration. Also tls live migration already does
>> +         * tls handshake while initializing main channel so with tls this
>> +         * issue is not possible.
>> +         */
>> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
>> +                                        sizeof(channel_magic), &local_err);
>> +
>> +        if (ret != 1) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>> +
>> +        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
>> +    } else {
>> +        default_channel = !mis->from_src_file;
>> +    }
>> +
>> +    if (default_channel) {
>>           f = qemu_file_new_input(ioc);
>>   
>>           if (!migration_incoming_setup(f, errp)) {
>>               return;
>>           }
>> -
>> -        /*
>> -         * Common migration only needs one channel, so we can start
>> -         * right now.  Some features need more than one channel, we wait.
>> -         */
>> -        start_migration = !migration_needs_multiple_sockets();
>>       } else {
>>           /* Multiple connections */
>>           assert(migration_needs_multiple_sockets());
>>           if (migrate_use_multifd()) {
>> -            start_migration = multifd_recv_new_channel(ioc, &local_err);
>> +            multifd_recv_new_channel(ioc, &local_err);
>>           } else {
>>               assert(migrate_postcopy_preempt());
>>               f = qemu_file_new_input(ioc);
>> -            start_migration = postcopy_preempt_new_channel(mis, f);
>> +            postcopy_preempt_new_channel(mis, f);
>>           }
>>           if (local_err) {
>>               error_propagate(errp, local_err);
>> @@ -765,7 +785,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>>           }
>>       }
>>   
>> -    if (start_migration) {
>> +    if (migration_has_all_channels()) {
>>           /* If it's a recovery, we're done */
>>           if (postcopy_try_recover()) {
>>               return;
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 586ddc9d65..be86a4d07f 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
>>   
>>   /*
>>    * Try to receive all multifd channels to get ready for the migration.
>> - * - Return true and do not set @errp when correctly receiving all channels;
>> - * - Return false and do not set @errp when correctly receiving the current one;
>> - * - Return false and set @errp when failing to receive the current channel.
>> + * Sets @errp when failing to receive the current channel.
>>    */
>> -bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>> +void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>>   {
>>       MultiFDRecvParams *p;
>>       Error *local_err = NULL;
>> @@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>>                                   "failed to receive packet"
>>                                   " via multifd channel %d: ",
>>                                   qatomic_read(&multifd_recv_state->count));
>> -        return false;
>> +        return;
>>       }
>>       trace_multifd_recv_new_channel(id);
>>   
>> @@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>>                      id);
>>           multifd_recv_terminate_threads(local_err);
>>           error_propagate(errp, local_err);
>> -        return false;
>> +        return;
>>       }
>>       p->c = ioc;
>>       object_ref(OBJECT(ioc));
>> @@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>>       qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
>>                          QEMU_THREAD_JOINABLE);
>>       qatomic_inc(&multifd_recv_state->count);
>> -    return qatomic_read(&multifd_recv_state->count) ==
>> -           migrate_multifd_channels();
>>   }
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index 519f498643..913e4ba274 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
>>   int multifd_load_setup(Error **errp);
>>   int multifd_load_cleanup(Error **errp);
>>   bool multifd_recv_all_channels_created(void);
>> -bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
>> +void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
>>   void multifd_recv_sync_main(void);
>>   int multifd_send_sync_main(QEMUFile *f);
>>   int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
>> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
>> index b9a37ef255..f84f783ab4 100644
>> --- a/migration/postcopy-ram.c
>> +++ b/migration/postcopy-ram.c
>> @@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
>>       }
>>   }
>>   
>> -bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>> +void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>>   {
>>       /*
>>        * The new loading channel has its own threads, so it needs to be
>> @@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>>       qemu_file_set_blocking(file, true);
>>       mis->postcopy_qemufile_dst = file;
>>       trace_postcopy_preempt_new_channel();
>> -
>> -    /* Start the migration immediately */
>> -    return true;
>>   }
>>   
>>   /*
>> diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
>> index 6147bf7d1d..25881c4127 100644
>> --- a/migration/postcopy-ram.h
>> +++ b/migration/postcopy-ram.h
>> @@ -190,7 +190,7 @@ enum PostcopyChannels {
>>       RAM_CHANNEL_MAX,
>>   };
>>   
>> -bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
>> +void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
>>   int postcopy_preempt_setup(MigrationState *s, Error **errp);
>>   int postcopy_preempt_wait_channel(MigrationState *s);
>>   
>> -- 
>> 2.22.3
>>

Thank you Peter for review. I see this patch is included by Juan too in some other patch series of 30 patches, so how it will work. Do i need to send a independent V3 for this? Or it should be reviewed in that series.


Thanks

Manish Mishra


