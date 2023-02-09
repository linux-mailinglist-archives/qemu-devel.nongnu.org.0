Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF3A690A88
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:39:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ78E-0002EO-U7; Thu, 09 Feb 2023 08:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ78D-0002EE-P0
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:38:33 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ78B-00032E-Dl
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:38:33 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319Cp81x010105; Thu, 9 Feb 2023 05:38:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=J1a9fKv4eXiGPGZTP+Xyug38GD6gh7mR8uwZnS+haVo=;
 b=H465P3+4UexvwOLLTCM8LQxyV//LCaV9x7VZJ3cNiG8x44EYznQ0k50dYr+ka3F98h1o
 A+DxfNjpr9zhRkp34vXlaEK48JAOOOIAthXaEFmYpb6gvLSbVvCZ/rKMUWLQ0LzRdXA/
 CyEbPv7MY3glxgbmmEaIhhDBVaOYEB1cQu0uvT1Yk1vc4yghy5dikQDzJDtID0buhvml
 Fu0v5izNXqwoIQSZk0lpB06mKm9FlJAbidhkeexbD9w6hGZbF9Zdu6EtUrSv8MjfRUwl
 wF8ATs4J1itgy5XeSub4Y4+5O/mL6rvsLyINvLOQMVYtE0L0efksiWIIKs96EDUi2jvy Ig== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhm5hyw1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 05:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJnTo0Dn8/MJl4oyjxQLlKDkS6d0uaCRduSlcbfY2AczWEpes4lnWd7TIHw7lXkeKwhm9lXJrH+j7Z61A5D3mr1g1wnHdnGFQTpPpFeLtTq//dgyJ7IlgktfuQYMPpAYcK+HGekQGlpM4vOoXgOjv2enpsM7MYWcaYHwa7ynG988JXdev0GC/cmUj95zKmxnbajmnI+qLdht/3ns3+maySuc9akz1OEfuaZlE/MFsCAOMD9gIVJyGqcEYccjtMXlYb8PTFruJq/QwXvTrXIO1F2UU7/vRsNujmWOXtf0OIxMWC5JivO/69FVhIrPBVszP3opHU7omKKFqZHjWcT4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1a9fKv4eXiGPGZTP+Xyug38GD6gh7mR8uwZnS+haVo=;
 b=O4r0Q/LNcRYxQFLl1QbCEGVr9P8BUdF48Tr/ci5PKAs4GwCM5HnB2sjjmaafC6XGg95tDUhLmUV1EcS9E6zV0qaBnauOFRnDeQw44W3qEv7c32kl4qWysBL3D7+gJigF+zViFnyJYFwfpUpmm211WgsaZ6fkuFblotZODl8mWKdM8hNzoz3nr6JicY/BCXdBnrNsAQZtzKpBjWtW26VJeJ6d+tfHx5jD3qZwjxtS4KY0DDm4vA4rUC/Y/+pQM1PVDINflI4Yigdq6VfuaUlw8RxVN7kp4MWy4RvkJDYajO3V147FMc3zUROQmWXOdxqmcy26ynTxk4GCv6IIXatUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1a9fKv4eXiGPGZTP+Xyug38GD6gh7mR8uwZnS+haVo=;
 b=mCJaxgWiRIIGfSW0SBYJQYK4Tx6lkjboUfUH482C0BA+SjkatUyhjfKpp3Ejez6ItcUclVDJ3C98n8xtf/YD2QdafB/Phl5sA+HBgxLjptB/wjx9eUN8GIHQfAAtd37sYXNdwTnCka0+jzfxs+Z2dwJUq1LVWfHpBjpPfnZw1TcqshLkNB4HiXUtXoeE4WBlMhPfmOmCE6quJzT3j9g7bLXGdSWx6zhal5YQgJwIieuh0XxLrfysYYOg+QQjjDVWLnM/2z/z2Z31RVPTqlo5t1TV0mw1Jdeag5sh9D65Ju198itwrbRz/COwIDsFbfzbZhtEed2MO8VmdWbuLUFFeQ==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BY5PR02MB6641.namprd02.prod.outlook.com (2603:10b6:a03:200::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 13:38:26 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:38:26 +0000
Message-ID: <3bf69a6e-f2e1-6335-392b-5e383f0c665b@nutanix.com>
Date: Thu, 9 Feb 2023 19:08:13 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/6] migration: HMP side changes for modified 'migrate'
 QAPI design
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-4-het.gala@nutanix.com> <Y+ThkshD8G3ca7Lx@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+ThkshD8G3ca7Lx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|BY5PR02MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa5e83e-267c-4560-e88b-08db0aa2eba9
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IyyYDyDkM/LSnri7otx4X26BIJfZMq85zFbZUE1qD8QHMms59qOgoXagK7WrgrpLD/uF8EiNmAveDI00SEpnptgkbM+kPmMs8SiQculOrGsHaXJ6IkF3QC1ENVoFOkRB4IpQtk3akDW1Wdbjz0dc3CStv6Zf5FHdvRiMOv03WcheRjD8ONUj826eBdVXs7ZVtpJJaY+xRIzb3rM4I5jycav1Sd5vDNqtsOVHvGgYu1HjeveBB68A1WF44FwB+iicnkzzm50DZuF3N5+3B7z0X1xBezb/8yz1VYEg1o0elZBUdYv/WQCeVMJKUj1uXM38S1F3nwHKARI1D2tghgDxyS3Lc+WlPO3AJX164RVSWggL48XErRMXVfpoNPsNmfo1/ciLWxrfK1jjy7SYg7iex80/EfTQDTgcVUAr7+159ru7SphXI0Xe/OY/ykHHevW0GzdBO/cJ+hxsCW/DDYhe6IG+UKwP1i5HBkr64sabAlN/kUAjuF2HdVa0J52AB+WM/b56vperp9u5Y9qKo8EaL3M1UIl037GJ88pNwmAwNGQ5DNDyBTW16XCHzDFH6VDQNZYatGDj4v8W74ttUe4HUGStpTzXpwRjrEl8eTN2cMcZQNqYF4liDWACBNFHNYiMWlJg7Gd4/E2rTiF2C5ETieUBLowJ0bfAFkO9fbe1cJmZDIx/gXeZda9wwoVQhxPY62HMYNVsM+Q0fePqxrLfhF74ClT8Gy+lx9AmE+ux4H7qIrKtpprbaU904OOkMQqk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39850400004)(136003)(376002)(346002)(451199018)(36756003)(6666004)(31696002)(26005)(6506007)(107886003)(186003)(53546011)(86362001)(6512007)(6486002)(478600001)(83380400001)(2616005)(5660300002)(8936002)(6916009)(41300700001)(4326008)(2906002)(8676002)(44832011)(66946007)(66476007)(66556008)(316002)(38100700002)(31686004)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0t2MXdBdTkwWlBTUHl3aXpJczRkRG1vQlRmYWhKenlWVFlseDhpUi9Oc2Uy?=
 =?utf-8?B?RjhxRXV0VEFxdzVaaUJUb1c4T0duL1ZESC9SNWdZUnIrL1ZZczNyZW9scmpk?=
 =?utf-8?B?MHE3R29mT1I3b2V1SE55a1Rlb3VjTzUweVVHZ1RDRndESXVPUUVGV3dCQjE5?=
 =?utf-8?B?dE1xWUtMRWVUV1FVeU1VeVJ0MG56TVltb2pmaTQ2SE9IeTBobXFwcnRhWmhU?=
 =?utf-8?B?RHBVaU82MXNTb0p4R25FMm1Wb0NHelVXVkJzVDMyMHQ3STJnWkVueU1MZXU0?=
 =?utf-8?B?NnJYb0NxbDhiRlo5Nml1bTJjbVN4c25EcGJCVUNrSTJ1dUFFaXR0N1d4NzlY?=
 =?utf-8?B?SDJJZWRaMHRQZDI1VlhuSFhaZVFKRjhxdkVuSXdaSnBxT3dzejlPWHVJaEVW?=
 =?utf-8?B?WDMxa1hRK3BEUjdrL25BNXFDc2MzY1RXdTNxK3c1cy9vQmdQdVErM3VSam9T?=
 =?utf-8?B?dEFNNmY3bUdKNCt5L1VGeGVIWlVEdEs0aVZoUTZaVmpQVGkyclkxNVB3VHBB?=
 =?utf-8?B?WDRZejYwcnVVMVprS0hXY0JiUExpZkkwWjR4azdVR1VPbU1UZ29KSWg3ZEZs?=
 =?utf-8?B?bitCUlpuYzUrWVg1YlNpQlEzeHJzWmorUVU0V3RlOHNYdi9uWGYwMXIwSjE5?=
 =?utf-8?B?OUFMNXQzR1N6ZEV0eGdVTkJNdjB0c3BaYVduMElKQlU3cSszdEZvUGVyRUVE?=
 =?utf-8?B?bTFnaDdnTlNveHlhUHZoWDkwcElpUU84TWdZc2lOR3h1aUxXMzFMN0M1K1Ro?=
 =?utf-8?B?eDNqa3h1Zm9NSjhKY0h2bkFicm93UGRVR2w3TzlJTHhNTkV3dDc3M2Q1MVRE?=
 =?utf-8?B?T0NYUjM3b3VnRHREaGdpK2JNUHE0bE5id1RjTy9pd21hK2VOK1JlWm8zeHR1?=
 =?utf-8?B?d2dMSmxwOVV1SFRMRFdCdlZ1R3g4S3Z3SUpsakE1bUtwbkNJM2FteFI5K1pz?=
 =?utf-8?B?SDVyZW1seXIxOGpvZmc1ejBTWkZoZVZQVVZOSWZYN0Q1Q2I0U2F4dFVTd0Vp?=
 =?utf-8?B?UGgrWWwrUGNzZk5IbjAwWXVhWHpzSW1RMVdObzJ6OFVwS0tCd1kwSXUyaDhG?=
 =?utf-8?B?MVV1eTJhQ2VTNEt4eVhyNHZoRkJOdmUyMWtDeUpKamlUNCtiMUNEYU9sUGUw?=
 =?utf-8?B?QjVGTVNpUGRpOUplaDdQMHRpeURQTHNpOERnTUpocXlXL1l5RHROL296WEhR?=
 =?utf-8?B?a0Z5RW14cHRSUEdSVWgveGk1WHNMclhpcmEyd2FhcW52MVNQdmdvQUVjR0N4?=
 =?utf-8?B?QWRiaXdGdlZDaFlXK09Ud0VkZVprVkR3NFo4M3hEeGppTDFpbGJwNEdaOEl1?=
 =?utf-8?B?a2NkZ3JnQTNYc0JGZzE1YzZPeWh1ckxiSktqVjN0UldxcGxkQ0FmVXh0M2M3?=
 =?utf-8?B?bDhYNmVlOTFud05rMnNMUXZEc0pGZHo0UDREVzgwK3o5aW1LQ3V6czZJTXpa?=
 =?utf-8?B?SnRFenR6RXo3bXMvSUJYenhjOVQxYkRORDFRVk5pWkNQUFQ1YjRaRXZqd2FZ?=
 =?utf-8?B?WVFvUXpTaFM4czhvcWxmVkJQQ1p4bzIwbVpGcW1Hc3F2ZVo1aFd6bmVaQmM0?=
 =?utf-8?B?Z1VXVk92NTVhQmJXUDBNMTB3b1lOalRzbDkxYlBHRURnTXhIZDUvOTZ1SVha?=
 =?utf-8?B?cm1oUUx4amdDZjNwN1BiTi9IMkNCczRnRVZ3cTRiYnMyN1VzU2tTaVFvTmZD?=
 =?utf-8?B?TWx3cTJ3Yk04bnpyU0t1ajQyamVBMEp0YzFkUUdQUEpIWXpjc29aZ1ZJbFVI?=
 =?utf-8?B?VlNXRXhpU0hoSGRId3VXWFh2dHl6MTUyY25wVnl4cm51ZmlEK3RQWVRsdWtT?=
 =?utf-8?B?WGRObk4vbFhiTXVNRUo5M1lmM01yK0dvVlhIVmd4SzViSzVZVzdNelNnYmJC?=
 =?utf-8?B?Tm9YRSt0R2ZnbUpoUGdoTVBLZUZaZjZia3FNMVNLdGQvaFpWS3FieEg0WlNr?=
 =?utf-8?B?ZE4xWG5heml6N29PaVZrZ2dhZDBDMTJ1WnErRkk0RlJKaFl3ZCtDLytSdXpH?=
 =?utf-8?B?VGl0L2h5QkJhVjFMK0I3WnVNelF1Q1FQK2VsOENIa2ZiQ0kzOVZCM3VvL1Z2?=
 =?utf-8?B?YUZKeFg2ODlKTTdNK3B4aVZ3WlFTR2plbyszMTRCS29qdEI3NER2S2ZqVEVt?=
 =?utf-8?B?ajdZTjFXZmpxTVp2QkxlWlZIWGFZTTZxcmlUNlFLUlNMZ0h4b2REa1Y1NFJU?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa5e83e-267c-4560-e88b-08db0aa2eba9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:38:25.9692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2L1Ls+RJx4WP/ROsQwlgnSxOrWjGK1C3njYmNxmcWtK5+RveWn0UyRTwX18ft5WrZW6FLe2JWK73zsCeO8ndA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6641
X-Proofpoint-GUID: prUEDzJ0-6BDBK1I8kG7nvA7ECMbFW9s
X-Proofpoint-ORIG-GUID: prUEDzJ0-6BDBK1I8kG7nvA7ECMbFW9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_10,2023-02-09_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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


On 09/02/23 5:35 pm, Daniel P. Berrangé wrote:
> On Wed, Feb 08, 2023 at 09:35:57AM +0000, Het Gala wrote:
>> hmp_migrate() stores modified QAPI 'migrate' arguments from qdict
>> into well defined MigrateChannel struct with help of
>> migrate_channel_from_qdict().
>> hmp_migrate() also accepts uri string as modified QAPI a 'migrate'
>> argument (for backward compatibility).
>>
>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   migration/migration-hmp-cmds.c | 105 ++++++++++++++++++++++++++++++++-
>>   migration/migration.c          |  15 ++++-
>>   2 files changed, 116 insertions(+), 4 deletions(-)
>>
>> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
>> index ef25bc8929..a9f65ded7a 100644
>> --- a/migration/migration-hmp-cmds.c
>> +++ b/migration/migration-hmp-cmds.c
>> @@ -32,6 +32,101 @@
>>   #include "sysemu/runstate.h"
>>   #include "ui/qemu-spice.h"
>>   
>> +static bool
>> +migrate_channel_from_qdict(MigrateChannel **channel,
>> +                           const QDict *qdict, Error **errp)
>> +{
>> +    Error *err = NULL;
>> +    const char *channeltype  = qdict_get_try_str(qdict, "channeltype");
>> +    const char *transport_str = qdict_get_try_str(qdict, "transport");
>> +    const char *socketaddr_type = qdict_get_try_str(qdict, "type");
>> +    const char *inet_host = qdict_get_try_str(qdict, "host");
>> +    const char *inet_port = qdict_get_try_str(qdict, "port");
>> +    const char *unix_path = qdict_get_try_str(qdict, "path");
>> +    const char *vsock_cid = qdict_get_try_str(qdict, "cid");
>> +    const char *vsock_port = qdict_get_try_str(qdict, "port");
>> +    const char *fd = qdict_get_try_str(qdict, "str");
>> +    QList *exec = qdict_get_qlist(qdict, "exec");
>> +    MigrateChannel *val = g_new0(MigrateChannel, 1);
>> +    MigrateChannelType channel_type;
>> +    MigrateTransport transport;
>> +    MigrateAddress *addr = g_new0(MigrateAddress, 1);
>> +    SocketAddress *saddr = g_new(SocketAddress, 1);
>> +    SocketAddressType type;
>> +    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
>> +
>> +    channel_type = qapi_enum_parse(&MigrateChannelType_lookup,
>> +                                   channeltype, -1, &err);
>> +    if (channel_type < 0) {
>> +        goto end;
>> +    }
>> +
>> +    transport = qapi_enum_parse(&MigrateTransport_lookup,
>> +                                transport_str, -1, &err);
>> +    if (transport < 0) {
>> +        goto end;
>> +    }
>> +
>> +    type = qapi_enum_parse(&SocketAddressType_lookup,
>> +                           socketaddr_type, -1, &err);
>> +    if (type < 0) {
>> +        goto end;
>> +    }
>> +
>> +    addr->transport = transport;
>> +
>> +    switch (transport) {
>> +    case MIGRATE_TRANSPORT_SOCKET:
>> +        saddr->type = type;
>> +
>> +        switch (type) {
>> +        case SOCKET_ADDRESS_TYPE_INET:
>> +            saddr->u.inet.host = (char *)inet_host;
>> +            saddr->u.inet.port = (char *)inet_port;
>> +            break;
>> +        case SOCKET_ADDRESS_TYPE_UNIX:
>> +            saddr->u.q_unix.path = (char *)unix_path;
>> +            break;
>> +        case SOCKET_ADDRESS_TYPE_VSOCK:
>> +            saddr->u.vsock.cid = (char *)vsock_cid;
>> +            saddr->u.vsock.port = (char *)vsock_port;
>> +            break;
>> +        case SOCKET_ADDRESS_TYPE_FD:
>> +            saddr->u.fd.str = (char *)fd;
>> +            break;
>> +        default:
>> +            error_setg(errp, "%s: Unknown socket type %d",
>> +                       __func__, saddr->type);
>> +            break;
>> +        }
>> +
>> +        addr->u.socket.socket_type = saddr;
>> +        break;
>> +    case MIGRATE_TRANSPORT_EXEC:
>> +        addr->u.exec.data = (strList *)exec;
>> +         break;
>> +    case MIGRATE_TRANSPORT_RDMA:
>> +        isock->host = (char *)inet_host;
>> +        isock->port = (char *)inet_port;
>> +        addr->u.rdma.data = isock;
>> +        break;
>> +    default:
>> +        error_setg(errp, "%s: Unknown migrate transport type %d",
>> +                   __func__, addr->transport);
>> +        break;
>> +    }
>> +
>> +    val->channeltype = channel_type;
>> +    val->addr = addr;
>> +    *channel = val;
>> +    return true;
>> +
>> +end:
>> +    error_propagate(errp, err);
>> +    return false;
>> +}
>> +
>> +
>>   void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>>   {
>>       MigrationInfo *info;
>> @@ -701,8 +796,16 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>>       const char *uri = qdict_get_str(qdict, "uri");
>>       Error *err = NULL;
>>   
>> -    qmp_migrate(uri, !!blk, blk, !!inc, inc,
>> +    MigrateChannel *channel = g_new0(MigrateChannel, 1);
>> +
>> +    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
>> +        error_setg(&err, "error in retrieving channel from qdict");
>> +        return;
>> +    }
>> +
>> +    qmp_migrate(uri, channel, !!blk, blk, !!inc, inc,
>>                   false, false, true, resume, &err);
>> +    qapi_free_MigrateChannel(channel);
>>       if (hmp_handle_error(mon, err)) {
>>           return;
>>       }
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 7a14aa98d8..f6dd8dbb03 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -2463,9 +2463,9 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>>       return true;
>>   }
>>   
>> -void qmp_migrate(const char *uri, bool has_blk, bool blk,
>> -                 bool has_inc, bool inc, bool has_detach, bool detach,
>> -                 bool has_resume, bool resume, Error **errp)
>> +void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
>> +                 bool blk, bool has_inc, bool inc, bool has_detach,
>> +                 bool detach, bool has_resume, bool resume, Error **errp)
>>   {
>>       Error *local_err = NULL;
>>       MigrationState *s = migrate_get_current();
>> @@ -2483,6 +2483,15 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>           }
>>       }
>>   
>> +    /*
>> +     * Having preliminary checks for uri and channel
>> +     */
>> +    if (uri && channel) {
>> +        error_setg(errp, "uri and channels options should be"
> s/should be/are/, also best to quote parameter names, eg
>
>      error_setg(errp,
>                 "'uri' and 'channels' options are mutually exclusive");
Ack.
>> +                          "mutually exclusive");
>> +        return;
>> +    }
>> +
> This change for qmp_migrate will need to be in patch 2.
>
> QEMU needs to compile & pass tests successfully after each individual
> patch. Currently it'll fail on patch 2, because the code generator
> wil emit the new qmp_migrate API declaration signature, but the change
> to the implementation signature is here in patch 3.

Yes Daniel, it will fail on patch 2. My understanding was that, even if 
sometimes individual patches dont compile properly, the final series of 
all the patches should be compiled properly. But I understand your point.

I have a small concern here Daniel, if you could help me resolve it?
- There is a similar issue in patch 4. Where some function parameters 
are to be changed. But that function responds to both source and 
destination side changes. So though patch 4 contains all the source side 
changes, it does not take into account destination side changes and it 
does not compile entirely. And after destination side changes are inside 
patch 6, the dependencies are resolved. How is it possible to compile 
individual patches in this case, because then each patch should also 
have some significant meaning to all the changes. So, in that way, 
source side changes in one commit and destination side changes in 
another commit makes more sense right ?
> With regards,
> Daniel
Regards,
Het Gala

