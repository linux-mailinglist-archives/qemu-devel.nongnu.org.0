Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8282A600830
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:57:45 +0200 (CEST)
Received: from localhost ([::1]:41918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okL0K-000411-Ke
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1okKfl-0001zF-Q6
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:36:31 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:62502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1okKfb-0002fH-DD
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:36:29 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H4fUkS003831;
 Mon, 17 Oct 2022 00:36:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=8oUeEdNyrenu9KkotG6dQgPPHM2NJrWqcqFOTh6ub3c=;
 b=KS9p6mUAb9eEbj7sPFo298c9lgGPTkDAaNBmISTxqk2oPmODyiiouS+zZTqnpqCtrEd9
 thvaV1B3u8bv63pGVYN8gJMK9F6JgjJkZCI2L9HjoJMvfd45l+A4zvowS06Dd7fkEGHv
 sUnIeSceSQKKET4neamuW2/Dx26Q7fhaRjtB81TDUr/dDT+FUf8GSITDGJWNU8uY8+Mc
 fO4MYS9zTQO7pdVlYD4dI50c0PDhaXNeAYHjXjYRaM/zMlVnCg+WobxXBfYfqJ6Yi2yM
 66ucuDWqVx1CYiToTbRMbEP8/huOLXK6sIeerjuDIkHWnpTwofCYLbr0S9NNdoit/gVX QA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3k7v6h3r73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 00:36:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AF2YZ6YGdqdBhZE3S12599CJesUY6Qo2pzyVku7BHiKR+4j6+xaMH6RN3NskT3Bpl0o2zm7y5GNlN3/ae/krV115+9FLxTu/uZu21rKRdShSQ3p8/UdEBjevbba0Y2ItpShNvAmsa8/xjlmvRYadyhmgZuCx2bg2DveZS4vbiUNYW+QDWi2jgE7rfLkwX4CmIdQI9rA8F2lxE+q9fjqQ4X2E/bs/+u73U3VsGM0aFh6MnNYInoXqR20hun8DDtFH/PmxRPz2OP7iBWVZWmEB7Qs1fhfklJW4hRtqtidgp/bF8u+O0FggR0Hn+4OxLjbBUQBJpksYeBSoTY27mX1f1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oUeEdNyrenu9KkotG6dQgPPHM2NJrWqcqFOTh6ub3c=;
 b=ec5CaC0epBSWbpgPfvpRAcFpG8ptw/7FyHfPJTYWT+2p80IMl9fNo5/8MTt5NCGOrcgqeixZVO5ZkPd5HDgxOc+Z5NPaswJ0aL+Yld9yZWninnLVkwwZ/Pp/sWlS5RYHsWe4td4vinnlrZ+RfOx7rOZzBmxEjZx/7OMzdCeO1xY9d3tV+/psqa0TCJrJtsHQEItWqLpB/gwbcGz7Uq0YhuPnW/P+LafjRV6etgGu8FJe0iZnQ4ZqYnhFnKTeAS4CjVIHzbUq3By/AFJiArX1oXfU7QxTg+rsQ37WFfLsFbEZj0BvTbzQn3IAdvlRWv+qHBgvM64Pou1GNevVy6XbfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SJ0PR02MB7487.namprd02.prod.outlook.com (2603:10b6:a03:29b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 07:36:12 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::a88:8114:7d28:5834]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::a88:8114:7d28:5834%8]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 07:36:11 +0000
Content-Type: multipart/alternative;
 boundary="------------D7i5la7fZ00jTOLsSXdcOPip"
Message-ID: <a4f67b8d-21ec-4261-6ffb-3162c854ce8f@nutanix.com>
Date: Mon, 17 Oct 2022 13:06:00 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: MultiFD and default channel out of order mapping on receive side.
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
 <Y0fJFcj9+wcnKYqd@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y0fJFcj9+wcnKYqd@redhat.com>
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|SJ0PR02MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bc2c5b-3123-4381-967d-08dab01242f3
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qH3cT15ZEWjQDhHL7ssiBZEnbm0+GkB003V1z92IgXdvwt7Iol+ROszWqfETezFh+j0KRVmbb/P6PjDaUUaVkgWcZIfSo14HipO7PGPB+MVrJydt0CHfNFyd4iB/FIWBW/WI5fkKHWZolWed9hpTs9vCciDnIQ79w6sYVsv/e7jeRMEOEAmow5+ETXOzRegNLychqMKHo0R/faZcJ1s6fDXgHGlPqo6f35vt5t4ztoYIA01o3IuVnZ9RHz+bLctbtbAfE70liyR1EtRrdKiQ8BEtLfPjA3zJ/ZyPDkAjeCuziT+1pm+3qavvfJV81dfYYvgj1QlCFe4quHOMBJPLFECYQUJIDEnQWcda78agpCu//wduozlil8Dh3GOmoaaTnbExMt+O5A+XhmwiuTwIG+qom04Xu4EmLxt768ORJhD7wM1A6HgJaFdy2HwrrvtZVN/zapo+gKv0aBXi+ACPPLCcBpK+tTeYhdcOxtKrYYTu5AI0fUzhsk6QYyIGkASBlq7L2ce3O/FKerlLaeFQfeBBT1kqyETcjapKqEp7ywqqUsFxSZYce9Ma2NaoaEI/A1spisK0PxwIeujqNCHqqFcmeuxOIKTImjS20IvHXqdMrrF4V71IgpOrAIMR0gVHEGdjzARVBnlKgIJ170aw46l5AApjk0JyhFhgg8P1uSAYqbmDXy0uWw/phpeVkMkFP9JQ+ZcOS7O8j6rIxofgwzQ72YL0RLi4+vlkguJImeCNe9wJ1qCeePYpB48wsuONYj/40OeHBPTT8RZ4Mk2VpptGjyPIyzqd346qKS278GXQpPOPxk1byqu4b9mbxZfK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199015)(31686004)(966005)(6486002)(478600001)(166002)(38100700002)(54906003)(8936002)(6512007)(83380400001)(31696002)(316002)(6916009)(6666004)(41300700001)(55236004)(53546011)(33964004)(6506007)(36756003)(4326008)(2906002)(186003)(2616005)(26005)(66476007)(66556008)(66946007)(86362001)(8676002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFc3UTR2Vi9QZ3hOVTZjdWRTZDdUWGJSeHpnYk9wNm94bzlOTXR3enhaWGZR?=
 =?utf-8?B?SStvMmhYRU01dm9PT2hnTFpLcGJ6Q0NGbnNxN1FFTGxZalFvYURjQWY3ZHU1?=
 =?utf-8?B?eisyYTlES0ZHK24yY3lDdVk0c3FnSG81QjhxdXptZ0Vpb0luMHVhV1FDTVF5?=
 =?utf-8?B?S0JYeTRlMHRtVGV4bnQ1US9TdDdIMEl0SWtVdjU0R0FnNGxzREVQV2pjQy9P?=
 =?utf-8?B?bnlCNXpxUHFZbXVoSUlKRE84bnF5VmsvTFpDaUd2NlVid3ErZGlURGJGZGN5?=
 =?utf-8?B?OUdhTTN0QWpWMitjQUVMaGRaOVRXZ0pyOXg5clo5T2M2cUpCQkVHQlpHZUVS?=
 =?utf-8?B?Qi9WWC9IdHV3d0RWM3NFSVpqYTlJUVR3bHNFbXUyL3NZbmpCOUtPSmNrQSs2?=
 =?utf-8?B?ZFBTU3dSUlhtQ3RzeGtEZk0xSE04UFJQcmQ2UGFtZWVrclprODVpdmUwMXhi?=
 =?utf-8?B?UHFnMDZ6V3R0aXM2cnhkbmZiSW9JNXZwUmZMdGxqajV6MHdjcWFoUlAwbDNK?=
 =?utf-8?B?dWZ4Q2drbUJkQzlBdHRYbUVCVVJWbExMaGY4WHRXelhjN3ZKWE1leEhPcnhD?=
 =?utf-8?B?a21IdFV2OWIyYXVqNkZTNk5WUkMrY0FsNFNaSTBUdTNrTDBKckptRXZHQ1I1?=
 =?utf-8?B?dDhBNm12VHVUVG9USmhHaitWd3lzdXVadS9xdXVNdmo0RGJ5dWgrb3NkRG5L?=
 =?utf-8?B?bDBaMmdXUE5sd2o1Lzk5K3Z2N3pDOVFIWmw2K09hK1kxQ2tETnJqSllBK2dX?=
 =?utf-8?B?MmRiOTVnQ2c4Tk5vbFRiWnF0b0tYQjRoTi8zNjdFQUx4cHBMeG9SOU9PZTQ2?=
 =?utf-8?B?U2twbW45Y3lseFhrbVlpY3BlUEloTkhLNnNOQXpGZWlYVXNlVHF5cG5jWEZi?=
 =?utf-8?B?blk3NDAwMEVEb0hWMXRCV2tkcUx0YzJiWlpyWjhUNXc4UzlEZTY4VElWcW1C?=
 =?utf-8?B?NGgzM2NEUUJxT0V6aXozRWw5SnBXNTJKSWdZaUF3ZmoxeHJXemliMjhTY2Va?=
 =?utf-8?B?bWErRGdTdW1YZlVaMDRYSGM2TjlNY1BoZkdaWXNFOUhad1prYitlK2V3M3ZS?=
 =?utf-8?B?V3VIL1FyOUNrdkx1cENEdEhSRnFWWXdZVEhPS0hVSHVjRXJGNklDSXRtUE9V?=
 =?utf-8?B?cWh1SzBaM3UvUmtJUWR0YnF6c3hrS3VIVWVSTlp5SmE3MmlvbnNqQUwyOEp1?=
 =?utf-8?B?ZmR3YlFrNTBvOWlIemIwM1RUdUVmd0ozcWZBdnhSTzZXTUFQM3pEYXM1L2tV?=
 =?utf-8?B?cmZsREdJVlE3SGZraUZMOUlRL0N2MzVucEdPOHd1eU1RQlZrY2IrcW5SWW1I?=
 =?utf-8?B?RHpyMkJGMDN6UXVadzdWblBCSnV6UkNiQmtDMiswcm56SmpVZ1dVRjFMY1Ix?=
 =?utf-8?B?NFltWG50TXQzbHBGRktjUjJYRjljNFUrQXNZSUhqVEZ3RUcxN0RybnZxL0F1?=
 =?utf-8?B?Ujk4ejBkcnh3VW92eFdUdXhZa29Dbit4UC9iYTJGazdkUkZuNVBlS0RscG45?=
 =?utf-8?B?ZUVjZG80QmtiWGlYMk9Xcmw1VUVEZUZvK2FaWWx3VmtBTk9VdHQyZnJPdER1?=
 =?utf-8?B?TkI5T2xndVQwQmRRY281UzBQYytMdGV5clVHTXBONE5MeXpZWkFSRFNScm1Y?=
 =?utf-8?B?ZmRDdEp2VnFMQVBBWURsV1hJYVB3cnc0eHZ1aEhHNVBaRWgzSGFkNlpXQWl2?=
 =?utf-8?B?cXdIeHNlOC9peWp3alBVSG5VRTRJZCtNREVTUFB3b3RuZzhpSWlUSmFJeHMx?=
 =?utf-8?B?OWpZUU5yTnFva0hKMXo3cWRrZlV6L0tnRG1jOWc4ZnFDL0NkeG40ZWJLekU2?=
 =?utf-8?B?bmR6d0lLK1R2QUtZYVFCMlVWaFQ1VGFvUE9ZWTRDYmlsa2x5T3BIbGVPaXRk?=
 =?utf-8?B?T2JPSWdsQUd4QkFFV3VoRGJwanNEUGI3OG1vV2lKNVFYaGd0eWs2R2dCVTdX?=
 =?utf-8?B?LzFnZHN3SU5MNU0ycE5jcUpYVjFVUTVkR3htM1hvUGdmTEdsa1JnaklabnZR?=
 =?utf-8?B?YU9Bdm93NXRJNFpFeEgzZHFTYkpWSlVHSlV0TjRIT1NINmNzNWFaeFNGVWxK?=
 =?utf-8?B?K2NEejBqSmMwZnlXL2VNbUlEaDhsakpmZ3N3TFI3VDlNeFRJYTVJMzcvZGl6?=
 =?utf-8?B?REF5WGRsWkFwS24wUlVlZUM0dHA1b252MllGRVRMTDNxMTVxTU05M3F5aTZG?=
 =?utf-8?B?bkE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bc2c5b-3123-4381-967d-08dab01242f3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:36:10.8954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQ8o2G+lZY4OxHwwrTeKhps70CVPoxslVjQ+sDKe/m+5AdZ4ZUjCDBCjrcBPeJ14u5Zyl2YU5vfFD91Z/uv4riPFbbpUE6f31YoYJDo1W4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7487
X-Proofpoint-GUID: YX1zAmim4_RpCUrMdxapJOLA4IEmXAcW
X-Proofpoint-ORIG-GUID: YX1zAmim4_RpCUrMdxapJOLA4IEmXAcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_06,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------D7i5la7fZ00jTOLsSXdcOPip
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

I was thinking for some solutions for this so wanted to discuss that before going ahead. Also added Juan and Peter in loop.

 1. Earlier i was thinking, on destination side as of now for default and multi-FD channel first data to be sent is MAGIC_NUMBER and VERSION so may be we can decide mapping based on that. But then that does not work for newly added post copy preempt channel as it does not send any MAGIC number. Also even for multiFD just MAGIC number does not tell which multifd channel number is it, even though as per my thinking it does not matter. So MAGIC number should be good for indentifying default vs multiFD channel?
 2. For post-copy preempt may be we can initiate this channel only after we have received a request from remote e.g. remote page fault. This to me looks safest considering post-copy recorvery case too. I can not think of any depedency on post copy preempt channel which requires it to be initialised very early. May be Peter can confirm this.
 3. Another thing we can do is to have 2-way handshake on every channel creation with some additional metadata, this to me looks like cleanest approach and durable, i understand that can break migration to/from old qemu, but then that can come as migration capability?

Please let me know if any of these works or if you have some other suggestions?

Thanks

Manish Mishra


On 13/10/22 1:45 pm, Daniel P. Berrangé wrote:
> On Thu, Oct 13, 2022 at 01:23:40AM +0530, manish.mishra wrote:
>> Hi Everyone,
>> Hope everyone is doing great. I have seen some live migration issues with qemu-4.2 when using multiFD. Signature of issue is something like this.
>> 2022-10-01T09:57:53.972864Z qemu-kvm: failed to receive packet via multifd channel 0: multifd: received packet magic 5145564d expected 11223344
>>
>> Basically default live migration channel packet is received on multiFD channel. I see a older patch explaining potential reason for this behavior.
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.gnu.org_archive_html_qemu-2Ddevel_2019-2D10_msg05920.html&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=LZBcU_C3HMbpUCFZgqxkS-pV8C2mHOjqUTzt45LlLwa26DA0pCAjJVDoamnX8vnC&s=B-b_HMnn_ee6JeA87-PVNBrBqxzdWYgo5PpaP91dqT8&e=   
>>> [PATCH 3/3] migration/multifd: fix potential wrong acception order of IO.
>> But i see this patch was not merged. By looking at qemu master code, i
>> could not find any other patch too which can handle this issue. So as
>> per my understanding this is still a potential issue even in qemu
>> master. I mainly wanted to check why this patch was dropped?
> See my repllies in that message - it broke compatilibity of data on
> the wire, meaning old QEMU can't talk to new QEMU and vica-verca.
>
> We need a fix for this issue, but it needs to take into account
> wire compatibility.
>
> With regards,
> Daniel
--------------D7i5la7fZ00jTOLsSXdcOPip
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="2">Hi Daniel,</font></p>
    <p><font size="2">I was thinking for some solutions for this so
        wanted to discuss that before going ahead. Also added Juan and
        Peter in loop.</font></p>
    <ol>
      <li><font size="2">Earlier i was thinking, on destination side as
          of now for default and multi-FD channel first data to be sent
          is MAGIC_NUMBER and VERSION so may be we can decide mapping
          based on that. But then that does not work for newly added
          post copy preempt channel as it does not send any MAGIC
          number. Also even for multiFD just MAGIC number does not tell
          which multifd channel number is it, even though as per my
          thinking it does not matter. So MAGIC number should be good
          for indentifying default vs multiFD channel?</font></li>
      <li><font size="2">For post-copy preempt may be we can initiate
          this channel only after we have received a request from remote
          e.g. remote page fault. This to me looks safest considering
          post-copy recorvery case too. I can not think of any depedency
          on post copy preempt channel which requires it to be
          initialised very early. May be Peter can confirm this.</font></li>
      <li><font size="2">Another thing we can do is to have 2-way
          handshake on every channel creation with some additional
          metadata, this to me looks like cleanest approach and durable,
          i understand that can break migration to/from old qemu, but
          then that can come as migration capability?</font></li>
    </ol>
    <p><font size="2">Please let me know if any of these works or if you
        have some other suggestions?</font></p>
    <p><font size="2">Thanks</font></p>
    <p><font size="2">Manish Mishra</font><br>
    </p>
    <p><font size="2">&nbsp;</font><br>
    </p>
    <div class="moz-cite-prefix">On 13/10/22 1:45 pm, Daniel P. Berrangé
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y0fJFcj9+wcnKYqd@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Oct 13, 2022 at 01:23:40AM +0530, manish.mishra wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Everyone,
Hope everyone is doing great. I have seen some live migration issues with qemu-4.2 when using multiFD. Signature of issue is something like this.
2022-10-01T09:57:53.972864Z qemu-kvm: failed to receive packet via multifd channel 0: multifd: received packet magic 5145564d expected 11223344

Basically default live migration channel packet is received on multiFD channel. I see a older patch explaining potential reason for this behavior.
<a class="moz-txt-link-freetext" href="https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.gnu.org_archive_html_qemu-2Ddevel_2019-2D10_msg05920.html&amp;d=DwIBaQ&amp;c=s883GpUCOChKOHiocYtGcg&amp;r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&amp;m=LZBcU_C3HMbpUCFZgqxkS-pV8C2mHOjqUTzt45LlLwa26DA0pCAjJVDoamnX8vnC&amp;s=B-b_HMnn_ee6JeA87-PVNBrBqxzdWYgo5PpaP91dqT8&amp;e=">https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.gnu.org_archive_html_qemu-2Ddevel_2019-2D10_msg05920.html&amp;d=DwIBaQ&amp;c=s883GpUCOChKOHiocYtGcg&amp;r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&amp;m=LZBcU_C3HMbpUCFZgqxkS-pV8C2mHOjqUTzt45LlLwa26DA0pCAjJVDoamnX8vnC&amp;s=B-b_HMnn_ee6JeA87-PVNBrBqxzdWYgo5PpaP91dqT8&amp;e=</a>  
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">[PATCH 3/3] migration/multifd: fix potential wrong acception order of IO.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
But i see this patch was not merged. By looking at qemu master code, i
could not find any other patch too which can handle this issue. So as
per my understanding this is still a potential issue even in qemu
master. I mainly wanted to check why this patch was dropped?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
See my repllies in that message - it broke compatilibity of data on
the wire, meaning old QEMU can't talk to new QEMU and vica-verca.

We need a fix for this issue, but it needs to take into account
wire compatibility.

With regards,
Daniel
</pre>
    </blockquote>
  </body>
</html>

--------------D7i5la7fZ00jTOLsSXdcOPip--

