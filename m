Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9747C4EA9FD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:02:58 +0200 (CEST)
Received: from localhost ([::1]:36400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ7ke-0007pj-VB
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:02:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ7g4-0005Ur-Ix
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 04:58:13 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:29722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ7g2-0002QJ-EK
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 04:58:12 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22T2UoBn030957;
 Tue, 29 Mar 2022 01:58:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=0UvlR6jFazzrw7ncIKZtxQbUsyTE9jhldzPaIWKC4gs=;
 b=nAdWrfO30RAMFM3E504AfP2ifNwQJenHZdXwbbbpyhBZziqApzD8bEKG5KA8lChs3pW9
 V+ZGEdLxn4469SrbA2w8VkyuGWJXYloYttJjz+pU9sGOEqO+DsIxsfwYCfOvFeF/Orxw
 n6M6IzDCzCL7z0Z3yLVoIZS28t70mRVy7YEPoB81My4hK/yHzmgdpCoRvJsNTAZEkl3K
 6VsvHCIpOJ+vUHnOE2K7NSKRk0mgCYEczv/P7ml8aE2DfxGkO3sbMtV8ReGvfen/vXgJ
 /cSDfiQZxJJQCXltih0nI9ADzGXrBeINjSPqck0DnqPg+1UfBhLHSc31ULiPvuM2oDBh Gw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3f20xhnj23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 01:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYk1ZNxIQIj18q/QKNLIPsduRClYgAuHunz3NDyGAfG8DNU/ZB+OaCwNPoVCqU4ypmiCWuHbcT8JwxInnQ0H1Hi6JrLsVP40a6U3oq8ZAq94sj7lVSaTh7/CPihZtm5Br49kNIEYhToV6QYT6Kq9iv4+kuNRSE1MjKmU8a/C3t/NIcvy3p+ZXox2z7LlUKLnPr2FyVOfbyQTmBndwpqiYcQSSrb9NZ6t0VwBIt1kDqsQDggIiKXVVp9Z7ZI3Us6XhFfpVpzBUKfPtP8QjlQFoPfZHrEYhQPQlkqwoB7YiVTwursZX//bDCOwYFVqzisOZuI19m5xrT7kiflCUh6uLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UvlR6jFazzrw7ncIKZtxQbUsyTE9jhldzPaIWKC4gs=;
 b=gJBDQfbd1xhqxCk70PrVi562qDu5bv1UFMVgB+dqEh6YeYJNnefDjcPEiTifMp3uBxoFMxmNuYkHbZhFHj/0irvBDuSDifSyuTQC0nORJ9j84JcdsVxSGkEHSK7oUWmLaML+TsHWmyUV93UJmgHrEwSgmA+FNE2dYUpf0v+vTHVMdYDW/W1CO2ojSD7LJCIzm9i3H0LKxN6J/40fqrqGzkGj4kl/I4VItdLLJ628uFylVRDw+zu81l3CrkC1avzQcXHf6JFOTGJj4J0XUAefV/4fV+4Mbve8SyKaaLZactRAMczCDuOtr8Hikok5OutZjLYPWqVtDEdvyiqtY5raaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB2786.namprd02.prod.outlook.com (2603:10b6:404:fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Tue, 29 Mar
 2022 08:58:06 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 08:58:06 +0000
Message-ID: <fff33287-c22a-611b-c3b4-013e13d492e4@nutanix.com>
Date: Tue, 29 Mar 2022 14:27:53 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: On patch series version tags, and also cover letters (was: [PATCH
 v2 2/2] Added parameter to take screenshot with screendump as PNG)
To: Markus Armbruster <armbru@redhat.com>
References: <20220328165415.2102-1-kshitij.suri@nutanix.com>
 <20220328165415.2102-2-kshitij.suri@nutanix.com>
 <87bkxp5kfo.fsf@pond.sub.org>
 <0705b49a-d4f6-f670-e26e-84d637c8071e@nutanix.com>
 <87a6d9429w.fsf_-_@pond.sub.org>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <87a6d9429w.fsf_-_@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::26)
 To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 547eb631-1ac1-48a4-fb8f-08da11623d1b
X-MS-TrafficTypeDiagnostic: BN6PR02MB2786:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB2786239175D1AC0B844FBD43991E9@BN6PR02MB2786.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QAPUOk9jjtSC8NDOkHVOX2bGwWuNdCXVrLodJ9WL8SCVe+XaVlwDBlsJ+9bO+YVVjHnrqLtP3vqs3HBCDodfq2VuGwTy36TyppJA5jWvl1KhO+1HEtqXHvRXEEm/P8hD1ciOEi/xzSMKRq+TKH3vw9jo6KsWZGcxBL7jFdEvBLpVVBhsVWC+hYRV3zrCFcgOJ5bQjaO9cYHvxdP6l+h8xtx99NomAFFfqkYxBVBZmq4CacWGV/BvflUPwBF6errkPfmT6AgN+GDrqkS58x6eG2JCfQtWkUWaZbPlx9GX35fIcP4kdCoAIeEg0ThPi2Z32Alt3LXQjZ7PYN/5nRrSdR1ui8AoU7ipgHeKgm5aUXfzg4P/K1Zo7JjcE1jmON/t0U9Wh3BFNqIDDOxrJA7mjbJnkAGQ7naaf3f4Hwk2fVxwdDTvWy65CIoN9itaDi+vVudGJrds4OoOYlqJsPsOMBGg7n2XqhkfWECqjXl3TZwj0AwzbTEQFV4IY10IBSNglfaZUW4V1O/4fZIrPEKB5UA7pSDhMjPihwnQ+odg6vZkcfQi9pzrQX7hrA2VzyB/VY3Pp/bBvUeRRFL45lZpLxS/9Un1E0oODSDJ5zVNqE9ZdNV2QPSF8n9M9+15O+CuK/SceMGQTrbF4Uo5vDvIDJpaEMzXPQKZPWH3XBklIE3JVEHn4KV0/GRI9p9TZkKpbd/FGJRsX1JcKEemK70RHeOukPHsngJiCfbceZPbQkQUZ5pbSOCFCZ7tmG1H5DVvIEHq0gsEDaIA4jP9y4DihvIMFZl5ZCIiKQRWOSfmw4sJAL5Rgr8Tx2TqkjtSR073bP7aCETsxWlv2iCljkO1pwA0ERvnNBKMGcq6JcqF/iY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(6916009)(66946007)(4326008)(5660300002)(44832011)(2906002)(66476007)(8936002)(66556008)(316002)(36756003)(38350700002)(53546011)(86362001)(6512007)(38100700002)(31696002)(6666004)(2616005)(6486002)(31686004)(6506007)(186003)(26005)(966005)(83380400001)(508600001)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUg2VlBTdndRYlpHSXBZU0JRa2pMUlN0RW5qSzZtRXB6SGNLb21nYWExNmJZ?=
 =?utf-8?B?aE1vRHlFaVA2cmFlYjdkZjUwM2c4TnBFQnNpY0dvQ3FCdTJQOSswaVJNNVVD?=
 =?utf-8?B?R21USU1kNjlqbFhISUtiU2dTUDdwcmxPS2RSTmRrdEVRVnJnZlM1WGtZOEU4?=
 =?utf-8?B?b0lqM2h0ZUhINUZiOVpvS2xQTmZDcWhkUjliVnk0a1R2MWYwMnVkNC8xaFFO?=
 =?utf-8?B?c2ZOaGtRck1MT1haYUZOWS8zRTJZM2tySmIxbTdKdXkvV1NwTFdJRmxUSnpt?=
 =?utf-8?B?VHBxdHJYdG90M2wrbHVrazdic09zRVVsOUVETjVVN2lOdzVScEJXTTdGeUUy?=
 =?utf-8?B?WE10b29XblJlZlgyWlVWVWpDbWY5eXpBSzZmU2k2UDJ5bTBWSXRUTjU4OEc2?=
 =?utf-8?B?RlNVZkRwUzM4bnpwWldsRlZDQ1ZMOS9LYmh6dlpITXpmeGVpQ05DcFl3V0o1?=
 =?utf-8?B?MHM5SkdFTHEvVStYaWhOaGpsQ2JlU2ZlMk1XV1J1VkpHSzNMOHVFbXE2QmFq?=
 =?utf-8?B?bEVONTFYdjhWM1U3VUNKQlNQR0lDNndqeUpCMFhLRUZXTzVHTi84bTBJVkQ1?=
 =?utf-8?B?bXJqdVh2K2lCS090M1lTTTFaRnhiVWo2WE9EaWErZXkvcXN6aEJPK2I1NWJ0?=
 =?utf-8?B?VVIzVDNObThUWk05Ump6b0dtSjVtczdZRGs2QlR6NFk5OG1EVStxYmhNYXpT?=
 =?utf-8?B?ZEwvbW5GTjVsUHZiSFFlMUo0MUU3WXcvS1VndjY2b08wMHNTVmJHRytDL3hD?=
 =?utf-8?B?M0RzdllzanhpNXJ1QjdUaXhlN1FPbW45czRqK3NnWEdqRHUxY1RwSlo2NWZE?=
 =?utf-8?B?N1VGcHJ3QjYyd0F2blUzQ0l0Yzlsb0U5MkhhQWVmQWVDWGF5aDJ6MmtYVGkz?=
 =?utf-8?B?WGp6bXpwOEVyYXY2WDdNRWE0SldvYWFJbDJpY3RtbjRsOWwwVzc0bHB5bTRx?=
 =?utf-8?B?YmVXTFF5QW5ycHIvRmhmU0dMakpySm5WbTVzeUMwd3d6Q0QyRmFmMW1WekZl?=
 =?utf-8?B?dlIwUE8yM2p1VFhqdkVaaGczUXRyVXV1UXkwY1VWTTM5RjdoSE93VEVhZ3Qw?=
 =?utf-8?B?ZHBOVVpjWHpjNHAvWmt1cDl5ZU5vWExIbHhOcEVpb2d3TUN0K3dMTUt6NEZq?=
 =?utf-8?B?anV0YVNnb293dUFuMDBUa3VzdmRrcWpBZEtxQ2UyaUZXVHg2SFZGbTV0eHMr?=
 =?utf-8?B?dnVTcWZsblZLT1UyVDdLaVhCUTlQNFFsQjhrRFhrWXpWTkRVN1hsRzJjQ2Zz?=
 =?utf-8?B?cndIdmpRTWFXaHNXd3Z6VG45bVo3TUdsaE4xUmYzL0kxVTdVdWNxR2dWWjJh?=
 =?utf-8?B?Lzh3NFl5Nll6K3VMbHdUc0RhN1dncjREaDBYc241a3UrR3hDUUV3QXkyWHJL?=
 =?utf-8?B?QTdhNTIvZWxKRUFMNk0wai9oV09UKzNpTi9lOVFjajBVMXpOS0ttL1dTcDhy?=
 =?utf-8?B?SFJjanhhSGVPcGZnUHR6bVBuNFVodm5ydUFiRVlqb0Evc3dZbTZNclczVE5L?=
 =?utf-8?B?dTlsVGRzdDFybUxiNy9sMnRKQUtNWWt5UlBmNEJMZktDWHdHQ0lvbFBiem5l?=
 =?utf-8?B?MmxVUkVzNzdNVUcyR2xUVWthbnIxNVdnWlR3Uld2UWpqb3QweEs5dVRZVEZq?=
 =?utf-8?B?MGl3aDdZWFFBdDVSQ2dXMTh1czhuZ3pRQWFiTk9mb1N2MVg1TmJFdEJLZmdH?=
 =?utf-8?B?YTFtSjF4OThYUVhQTmpjOEdNd0tiSWJmVmJMb2tEWEtPSndySEFiYjRkMWRs?=
 =?utf-8?B?bHc5b0dLSjhzaU1pY3JEZWdtZzc1SVI1cEQ3bktkeGVidlo1ZTFkRzVRRmNE?=
 =?utf-8?B?MUVhdTBqeFQ4RGdHMWR2cmtrNk4yRVRwNTMxRFE0Nk9QSUIvMVhLTDRQZ1Va?=
 =?utf-8?B?OE91dWJmeS84eG9yUUFJaCtyWmMwUk5zNi9nWEY1TTRDa0dkeGlTZzZyY1Fj?=
 =?utf-8?B?RWJKYzlBdjBoVXhYNkJ2MVhkN280YWVwWDBiNnN5Ny9xUnkwcnNpZ2JGb0N5?=
 =?utf-8?B?Sjd3TzFIaWdBMDZSQVpiVmVGZU9mQUtxeU9yMjI0S3gyVkJpT3NSTlFVdmhr?=
 =?utf-8?B?bEl3L1RBVHErU24xUUxOaTJnYVBMdHdaOW9JM0Q3dlMyTXQrNDhiYU8yTlBr?=
 =?utf-8?B?Ni9tSmIva2F2UWQyMENXNkRmNm44TDA3bTRFZit6cEsrK1oySHNJWTFoQTFK?=
 =?utf-8?B?bjMzN3hwaFN5REg3NnZRa2Y5cG9RMUpZbTNRaUhTdEhSaU04OHp1aHlNVjBl?=
 =?utf-8?B?NDhHU25aakdnNS94ZGpUQ3NNVVdYWHhKdHhzQmVvcXNwLzhYYjFmN3BCOTZk?=
 =?utf-8?B?R1ppallCaG5ueWlKSStLMjErUW1lZ0lvNmJqWE9pMkNDUHJzd0Z3c1JKZEMx?=
 =?utf-8?Q?f/LTMowKGXGGZlVs=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547eb631-1ac1-48a4-fb8f-08da11623d1b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 08:58:05.9651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzsgTVhiD4dWmHFV/fA5F/aWmnM6uo7PvAaDFN7aI1+xPjEsOMp67NDMs3JBuLn974FZyc6AeaPUZOH/Y/GFFXZKaTfUjcKBbEr0yFrbL6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2786
X-Proofpoint-ORIG-GUID: -GlzlwU7H5X_IOP8LkPjDhR-i8uzPTAn
X-Proofpoint-GUID: -GlzlwU7H5X_IOP8LkPjDhR-i8uzPTAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_02,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 29/03/22 1:29 pm, Markus Armbruster wrote:
> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>
>> On 29/03/22 12:12 pm, Markus Armbruster wrote:
>>> If I count correctly, this is the fifth posting tagged "v2".  Don't do
>>> that, please, as it's quite confusing.
>>>
>> Thank you for your review and I apologise for that since I am fairly
>> new to upstreaming. As per what I read version updates should be done
>> only when there are significant design changes to the patch which
>> didn't happen in the v2 version. Will update it to v3 and send the
>> patch.
> We all make mistakes :)
>
> The purpose of the version tag in the subject is to help humans with
> keeping track of patch submissions.  Increment it for every submission.
>
> If you need to resend a submission completely unchanged for some reason,
> you may want to keep the tag and add "RESEND".
>
> A cover letter (git format-patch --cover-letter) lets you write an
> introduction to the whole series.  Simple series may not need an
> introduction, but complex ones do.  I always use one except when the
> "series" is a single patch.
>
> Keeping a change log in the cover letter helps people who already
> reviewed previous iterations.
>
> Check out
>
>      https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.gnu.org_archive_html_qemu-2Ddevel_2022-2D03_msg03977.html&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=D-rls6IoKGB-dpNu3-R_2PSp8HMjagXZU2NC6nqi6DhlurlWsW1vY9ip-7dSaSuv&s=kBAJFSYBE5TTs27r0Ycx7U2orcQfBt6L8Uslbk_X8xY&e=
>
> for an example.  Not every cover letter needs to be that verbose, of
> course.  Likewise, the level of detail in change logs varies.
>
> A good way to get a feel for good cover letters and commit messages is
> to review patches.  What kind of information helps you as a reviewer?
> That's the kind of information you want to provide with your
> submissions.
>
> Hope this helps!

This helps out a lot! Really grateful for this value packed mail! Will 
keep these points in mind while further upstreaming and versioning.

Thank you!

Regards,

Kshitij Suri



>

