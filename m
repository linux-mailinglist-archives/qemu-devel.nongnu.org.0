Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09382624263
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:31:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6hV-0005m3-U3; Thu, 10 Nov 2022 07:30:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ot6h8-0005jb-V4
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:30:12 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ot6h4-0006zS-07
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:30:10 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AABTCQF004932; Thu, 10 Nov 2022 04:30:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=Br9GW0LesBfmyTvuDeFOEJk8/z2OFudGbl4w6Gy4VEY=;
 b=11YFOcRAhV6UsJj30eRTRLYf/maGxAOxQbcGpgKTN+c4V+8vxQ4RYWrSuiUduiKgPWAn
 XYBIlFxNtX7s0p4F5CmjxW9f2WF9wEnpJe2/Woh+R7Fpo6K/xWxpSCEoRMcwPUUpS8JT
 cV+Gf2jFvkJSC3WaUT8pLyr5NU+LS+WpgnR9u0IB1f9nB97G7c8KnV9Lqv2GCxTj7hrM
 ePWajCS7JEC2d6yXE/ypM58HUR1flWkKk3BnTX7REsVwhFGeCw+hkLs3LB53UV5WWbaG
 ynRGOxr+XI2o7pHhCXD1OxZvwhIBD6/TVNHGJ4ia1QbnwKckTSkKpIU3N7TfC5suilp4 WQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kqrmnna1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 04:30:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nojY+JZwHAFPlPiDLGZyAxa9T9o3Sb/1caVfx6mI1xK1P/CkmmWzHe1nYLlwLWMzlZP/NTCJza44cyMd9I2Itl+VmRNtFWi5KTbZC1lZwRMibF8pMnfo7IUbpMfROlrH31tIBaWgqT9Tw8PWF2y4f/tAY6a6vuxjpaGm/OP2AvcbIwuZp8yOKgq2kqHIoSeyBNki8wnD18RsFhHlEZJWN5fG6fHBXZreBC4Zyu7Elq+Ebq60lIYAkV87OGhUXF06d5Q88J7oo0TuntF5XO/7G5//DbmhMI41oj8oowUc9PmaHG5F64fIfHZltFR+HtkjHDOVzYTCCt7YmUDRytVhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Br9GW0LesBfmyTvuDeFOEJk8/z2OFudGbl4w6Gy4VEY=;
 b=FDoGFYc607XjVVhNUOH4OdpM1LO7AbvJd1IsWEaGtRLw4Joqjerig6DfIHJ/+graSBwRf5Ngd14tpP+g6r2Gr90dX23Rz+Tp59svAGTYZwfkyvv4TU288waY+eZCoPUGZEHmSyG0HYx4qeuezx5WCR+m9Ud1C0W5FhbVGaAM1KEah7+lHbaTVsjvbmBHC+hyI/2gqs9wTsM3CZSX89q0GPSYYj+j7YtdLq69rAc7lVqdt3SJMIzEvolNIJONMhAKvH/S1lXV8wIDA0Z7+KWUKOEvMs2ka69wRHFdY52/iVBvAJoWOYOiFJJYDumgbbHzz4L5ZrmMerae/YXHGgv0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br9GW0LesBfmyTvuDeFOEJk8/z2OFudGbl4w6Gy4VEY=;
 b=M/wmDWk4nY8zG6l0zKb3aLMEQ+GyuCfxBBWWqscgciq6v4sdywWL5ojFxMr1ejborwj6acxI8CvRRufP6yquADWiCps/VMUFhzZxfw+jlz7Bh8leHRN8R+EKH1XjCbhwzuBmrHjLFbtGjwS7vr0orFEB/ZvuPXzlDULk2YPO8jiyFZSFgXvkUgkTOfNpqm6BraFSowNQEuBqtO2/Ffs2JT/t+IJoXzuSRRlKp31epumGVgjqlE7eG4dZcqPcEbtDFI3LTbr3n0sjuMZo5MNQO9XdFTk0xAfISkCsWCKM8ike55WGxdTd3aYtWHw3RMoURcM21tTWI7en+mMsUl8Hcg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM6PR02MB6617.namprd02.prod.outlook.com (2603:10b6:5:221::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 12:29:57 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::6900:90d6:f4c2:8509]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::6900:90d6:f4c2:8509%6]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 12:29:57 +0000
Content-Type: multipart/alternative;
 boundary="------------MZu0YVomkhjQ4K99wXU7un8E"
Message-ID: <52579466-e91f-2bea-b39e-b48cc3cb8a24@nutanix.com>
Date: Thu, 10 Nov 2022 17:59:45 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2] migration: check magic value for deciding the mapping
 of channels
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com
References: <20221107165159.49534-1-manish.mishra@nutanix.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20221107165159.49534-1-manish.mishra@nutanix.com>
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DM6PR02MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: ff724b72-64f0-41f3-0126-08dac31745f6
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OUCJDL6PEgsgGSKFVw9hTN/pQe+4FHI57UdUzf6LnuZQKkCx4xgobc/zekqp03hBleSXP/YI3rk1TWkGs3BtufUBqumEQc70nrSidisFrsLbAb3GCo3JGtuzC4CitoESD3K7u5eUL9Fb009pLgbdZuxAVs/Yg7QkJ4fKOBxM07oazPLK4/+1gCAHVpk8h1qgkIJ+4FsmSRMx2H8Va6FDaGWHNIs3QtstCvU5LuxHKC2kb75sgPAjCz+02EnuoIQxs+ZSL2gHeQzAcJjiVNnO4YZLIjgqG1VU30TQSK5vvVU8uD7Gl5E6+nj/ZAoG55zyBhJtxOPbrlFj4pY83tPYoCl1qDvom5TbH6BheNpFXdLNpuSQvhJmver1Rivc4eb1ty4Xf+PkM0cZGfkpPvhEQfNgdnE1DXc/8GKi0gZP+eAlsm6w70pS7hETEfJauHewaaTs9XAyNqf8sMHQsA/DOdPUBZSvCl5QUW4wnWRWooloQDvgi92b/OLN9Li5QNq8iHsirRSLIo8ozMtlrxSXDb6KZqDHaG9AjwqqxlRZUpmOY6kR0nejIebVhOJnAv9/8H8meqPw6zEVcaEIVp6HuYPwlioDSQEOCdFl/M5CIClehM5PN5X0hFN8kJv3DKFhDZjo77ID9z2ar0zid7ahyyodzyu0z3+y61AcCoNBvwxxy9zKamTEGkmf5us6gTzkyKdPVf+W3WKrNnwp3uXsDEBai9Of00WKyL2trCI1ZDHJrMmw+12DiuJaMZ7Gn5HTt7JFWZYfD516gPhnG30xDO0yhQpMn1lugjJX1DfZFRc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(6512007)(36756003)(6506007)(33964004)(31686004)(30864003)(86362001)(31696002)(38100700002)(186003)(2906002)(2616005)(26005)(83380400001)(53546011)(6916009)(5660300002)(6666004)(6486002)(478600001)(8936002)(66556008)(66476007)(8676002)(41300700001)(4326008)(316002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGd1T09XRytobU04akF5dVJ1UmdEMDlJZHRIckNSQ2FiaG5QWGdyRGRmMXF0?=
 =?utf-8?B?R3ZjZXNObmdsSUV2aVFtYk55N0dBbytuTFhpR2tBZ2VPT0lqUjBIa1RjQnMx?=
 =?utf-8?B?bUw3ZmhPQStoci9QK3lDSzJYZzJWaUt4VTlVTStFeXo4STEwNEdPenBGL3lo?=
 =?utf-8?B?QnBTeWh3SUlXZElYa1AzNVVkZXJRaXErSGU0a0crN0RQdWJHcFZWbEVmUjAz?=
 =?utf-8?B?SHZVb3FDUitvNXdMQ2JaZTNOT2d6d1lGanAzTWRtNW51UDNUYzBXZ2h3cGtP?=
 =?utf-8?B?eDRPeGNydUFjRU1LMnhhc1EvL0ZrQ2gzdG1YT25MQTNyK1JObkJ5eWJ4VzlD?=
 =?utf-8?B?VHBDYloyY1RVa0toSWR1UHY0Wkt2VHlpZDQ0WkpuUElwMEdDdFIzMjEvc1Vp?=
 =?utf-8?B?dDJOVUJKTm0reDdRbXRrZDBIdWhkTGNWMDdEMlpUbG42NEdaeW42S3hPYXhn?=
 =?utf-8?B?MStkVjh0eDN1RmsvRy9DUGpYZlpneE9UbUtRNVYyb0p1bjlRc0NPbTVpeVg5?=
 =?utf-8?B?VkFGT0I4UUhna0tIbDBSTUhHcUFEWnh0R1dRWVVUOXhKdUgwYlVuckJFZlVk?=
 =?utf-8?B?UC9sMlZCTFQyVndTcHlTeWRoNm5zME1xdUFmMWtTMW14ZG9GU21QNHBlS2ht?=
 =?utf-8?B?MFVlYVU3cWNqS20rUWRza0FiV3RXWjY5VWkwbE5LQ3BDek5waU1kc1lZMlhO?=
 =?utf-8?B?dWF6eEQyalVXUkkrMDVPbzh1Y1VsWDhvcnJiMitRN2tpOWNRNER4bVM1aHMx?=
 =?utf-8?B?Z3oxM0phSi9WVk1PSUVaUGMwRWlmQ1JkdUpsNk95VGdPTlE5Ujk5dmZuLzZM?=
 =?utf-8?B?QWZaT09kL1ZvbVJIUURUNGIvVEVzSkNCeWZIWE1ueUlYZVFTaS9xZzdodHc2?=
 =?utf-8?B?ZHhQZXUrZDVNanhIOWVjTkY3WjVkakU5cmdlSzVKS0ZOMEZsRTYwVGdHWFB0?=
 =?utf-8?B?Lzh1bUVGd2wrd254OTBIUHZjRDBvTHNuREtiZ2prSC9LWjRvZ2paV2tJM2Ns?=
 =?utf-8?B?dUVNSVg1NmpQU2Z6OGNQV2NodzhJaWg5R2FPclRkYjJSc0F4ZmI5cTZ1N2Ju?=
 =?utf-8?B?T3hjYmZXb1VGTmg5Q1ZQZ0p6dE9EZmhmY2ExVUZuMTQva0hNNFpyOVBwNC9x?=
 =?utf-8?B?M1MyYmlZUFFDZC9SZDgwY3A5elhyb29jRTl3cVY3NlJIQlZuR2VMSEkrRmtn?=
 =?utf-8?B?RlI4Qzh5WFBwMDlmMjlUb1VlK2YzYkFuakN4VnhSaGlORk5ORjRyTFR5bW9L?=
 =?utf-8?B?Lzlienc0T2doQk1DQ01HQ2NuN2tzZlpDNm5GdTlZYjVsYm9BbXREanFxS0xZ?=
 =?utf-8?B?VVdBTlIzbm9EUG04MGwwRDJvQ0p2RG9GQmlIMVVrZEtDMWhSMzlsRURPcVI3?=
 =?utf-8?B?QTlvMUdKYW1JNVM3MjJPaTVEc1h3cFY1SzNVK2NxY3Qzei9XMjByRFdRcDEx?=
 =?utf-8?B?dkkyY1V3VGF3aUZWcU0xWWN2WUlXRDh3TEVpRjFmbXl3aStQUFk3WGxCUU5N?=
 =?utf-8?B?Y2RLdWpiRXB6QXUxZ1FJeWFHeU43VFFlRGduYTcyODZHOW5PM0tqSFdlV2Uy?=
 =?utf-8?B?b2tZdnRjRFJpUHEzcjhaYXI5OTdJVHFBK09yT2MvWEl1NU9YM0ZqOWdXa0hX?=
 =?utf-8?B?Vi9SMlNvdTJsSUN0ZUhsSHZEY2wwQXh4ZW1CZVhhaVRrUVZsTjJUbUZxQUV5?=
 =?utf-8?B?VDdrWC8ya3p5TStmUUlQM1l1ZFZrYm9YMnJOSTBSVzRleHJvSWVGMDkzYnY1?=
 =?utf-8?B?eGxteHhIak1zK3c2dVVCQ1VuUjZnMjI4Sk4yQTFXVVV4YmtuMC9MaFJNN25s?=
 =?utf-8?B?ZEJ5TWxiUGFHQzdUUTdhL0V4M04vaDhiaTlhWFltbHdDT0wvS0hSRGorZ1ZE?=
 =?utf-8?B?Vmk5K2dsNWhPK0g3MzZhTE5na1JKY0dwT3FKRTBUM3lIRkQrUUZaWWZTdEtO?=
 =?utf-8?B?UUo5NlhIWnc5aGNqOFM2a2dZTHVGdElPMkxRRWxmeHN1WmR4S200clhqSnph?=
 =?utf-8?B?dnR6dTFTeVdGcEZEYkV0OXlSN0xIU1Z2ZUZUbmhQOXNuNThJQWNQYytOUDd6?=
 =?utf-8?B?Nm1CRWw0RzFTUTBOV2xXR05qVkZkUlorK1hDdUFyRWhwT3c1MlVyMnJqamth?=
 =?utf-8?B?NU9teXFpbEhwcm5vWU51T1pHWlZKWmZweU9STE05b3lHVDNvV1BlMmpadlZm?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff724b72-64f0-41f3-0126-08dac31745f6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 12:29:56.9738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uE4xvA4jCC1R8ciYmBUD8hmDNlIo2V6L/jrSLtL9hKTW4N/JO6GLDVuHtFmzjghMUUjYD22ItFjx9p8wfpC48ryi1s+JsPX2inBEhkzpho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6617
X-Proofpoint-GUID: 6DRlcCTHf0now7THNh0n3NMlYRZk6C3q
X-Proofpoint-ORIG-GUID: 6DRlcCTHf0now7THNh0n3NMlYRZk6C3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_08,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------MZu0YVomkhjQ4K99wXU7un8E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Everyone, Just a gentle reminder for review. :)

Thanks

Manish Mishra

On 07/11/22 10:21 pm, manish.mishra wrote:
> Current logic assumes that channel connections on the destination side are
> always established in the same order as the source and the first one will
> always be the main channel followed by the multifid or post-copy
> preemption channel. This may not be always true, as even if a channel has a
> connection established on the source side it can be in the pending state on
> the destination side and a newer connection can be established first.
> Basically causing out of order mapping of channels on the destination side.
> Currently, all channels except post-copy preempt send a magic number, this
> patch uses that magic number to decide the type of channel. This logic is
> applicable only for precopy(multifd) live migration, as mentioned, the
> post-copy preempt channel does not send any magic number. Also, tls live
> migrations already does tls handshake before creating other channels, so
> this issue is not possible with tls, hence this logic is avoided for tls
> live migrations. This patch uses MSG_PEEK to check the magic number of
> channels so that current data/control stream management remains
> un-effected.
>
> Suggested-by: Daniel P. Berrangé<berrange@redhat.com>
> Signed-off-by: manish.mishra<manish.mishra@nutanix.com>
>
> v2:
>    TLS does not support MSG_PEEK, so V1 was broken for tls live
>    migrations. For tls live migration, while initializing main channel
>    tls handshake is done before we can create other channels, so this
>    issue is not possible for tls live migrations. In V2 added a check
>    to avoid checking magic number for tls live migration and fallback
>    to older method to decide mapping of channels on destination side.
> ---
>   include/io/channel.h     | 25 +++++++++++++++++++++++
>   io/channel-socket.c      | 27 ++++++++++++++++++++++++
>   io/channel.c             | 39 +++++++++++++++++++++++++++++++++++
>   migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
>   migration/multifd.c      | 12 ++++-------
>   migration/multifd.h      |  2 +-
>   migration/postcopy-ram.c |  5 +----
>   migration/postcopy-ram.h |  2 +-
>   8 files changed, 130 insertions(+), 26 deletions(-)
>
> diff --git a/include/io/channel.h b/include/io/channel.h
> index c680ee7480..74177aeeea 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -115,6 +115,10 @@ struct QIOChannelClass {
>                           int **fds,
>                           size_t *nfds,
>                           Error **errp);
> +    ssize_t (*io_read_peek)(QIOChannel *ioc,
> +                            void *buf,
> +                            size_t nbytes,
> +                            Error **errp);
>       int (*io_close)(QIOChannel *ioc,
>                       Error **errp);
>       GSource * (*io_create_watch)(QIOChannel *ioc,
> @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
>                             size_t buflen,
>                             Error **errp);
>   
> +/**
> + * qio_channel_read_peek_all:
> + * @ioc: the channel object
> + * @buf: the memory region to read in data
> + * @nbytes: the number of bytes to read
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Read given @nbytes data from peek of channel into
> + * memory region @buf.
> + *
> + * The function will be blocked until read size is
> + * equal to requested size.
> + *
> + * Returns: 1 if all bytes were read, 0 if end-of-file
> + *          occurs without data, or -1 on error
> + */
> +int qio_channel_read_peek_all(QIOChannel *ioc,
> +                              void* buf,
> +                              size_t nbytes,
> +                              Error **errp);
> +
>   /**
>    * qio_channel_set_blocking:
>    * @ioc: the channel object
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index b76dca9cc1..b99f5dfda6 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>   }
>   #endif /* WIN32 */
>   
> +static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
> +                                            void *buf,
> +                                            size_t nbytes,
> +                                            Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    ssize_t bytes = 0;
> +
> +retry:
> +    bytes = recv(sioc->fd, buf, nbytes, MSG_PEEK);
> +
> +    if (bytes < 0) {
> +        if (errno == EINTR) {
> +            goto retry;
> +        }
> +        if (errno == EAGAIN) {
> +            return QIO_CHANNEL_ERR_BLOCK;
> +        }
> +
> +        error_setg_errno(errp, errno,
> +                         "Unable to read from peek of socket");
> +        return -1;
> +    }
> +
> +    return bytes;
> +}
>   
>   #ifdef QEMU_MSG_ZEROCOPY
>   static int qio_channel_socket_flush(QIOChannel *ioc,
> @@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>   
>       ioc_klass->io_writev = qio_channel_socket_writev;
>       ioc_klass->io_readv = qio_channel_socket_readv;
> +    ioc_klass->io_read_peek = qio_channel_socket_read_peek;
>       ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
>       ioc_klass->io_close = qio_channel_socket_close;
>       ioc_klass->io_shutdown = qio_channel_socket_shutdown;
> diff --git a/io/channel.c b/io/channel.c
> index 0640941ac5..a2d9b96f3f 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
>       return qio_channel_writev_all(ioc, &iov, 1, errp);
>   }
>   
> +int qio_channel_read_peek_all(QIOChannel *ioc,
> +                              void* buf,
> +                              size_t nbytes,
> +                              Error **errp)
> +{
> +   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +   ssize_t bytes = 0;
> +
> +   if (!klass->io_read_peek) {
> +       error_setg(errp, "Channel does not support read peek");
> +       return -1;
> +   }
> +
> +   while (bytes < nbytes) {
> +       bytes = klass->io_read_peek(ioc,
> +                                   buf,
> +                                   nbytes,
> +                                   errp);
> +
> +       if (bytes == QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(ioc, G_IO_OUT);
> +            } else {
> +                qio_channel_wait(ioc, G_IO_OUT);
> +            }
> +            continue;
> +       }
> +       if (bytes == 0) {
> +           error_setg(errp,
> +                      "Unexpected end-of-file on channel");
> +           return 0;
> +       }
> +       if (bytes < 0) {
> +           return -1;
> +       }
> +   }
> +
> +   return 1;
> +}
>   
>   int qio_channel_set_blocking(QIOChannel *ioc,
>                                 bool enabled,
> diff --git a/migration/migration.c b/migration/migration.c
> index 739bb683f3..406a9e2f72 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -733,31 +733,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>   {
>       MigrationIncomingState *mis = migration_incoming_get_current();
>       Error *local_err = NULL;
> -    bool start_migration;
>       QEMUFile *f;
> +    bool default_channel = true;
> +    uint32_t channel_magic = 0;
> +    int ret = 0;
>   
> -    if (!mis->from_src_file) {
> -        /* The first connection (multifd may have multiple) */
> +    if (migrate_use_multifd() && !migration_in_postcopy() &&
> +        !migrate_use_tls()) {
> +        /*
> +         * With multiple channels, it is possible that we receive channels
> +         * out of order on destination side, causing incorrect mapping of
> +         * source channels on destination side. Check channel MAGIC to
> +         * decide type of channel. Please note this is best effort, postcopy
> +         * preempt channel does not send any magic number so avoid it for
> +         * postcopy live migration. Also tls live migration already does
> +         * tls handshake while initializing main channel so with tls this
> +         * issue is not possible.
> +         */
> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
> +                                        sizeof(channel_magic), &local_err);
> +
> +        if (ret != 1) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
> +    } else {
> +        default_channel = !mis->from_src_file;
> +    }
> +
> +    if (default_channel) {
>           f = qemu_file_new_input(ioc);
>   
>           if (!migration_incoming_setup(f, errp)) {
>               return;
>           }
> -
> -        /*
> -         * Common migration only needs one channel, so we can start
> -         * right now.  Some features need more than one channel, we wait.
> -         */
> -        start_migration = !migration_needs_multiple_sockets();
>       } else {
>           /* Multiple connections */
>           assert(migration_needs_multiple_sockets());
>           if (migrate_use_multifd()) {
> -            start_migration = multifd_recv_new_channel(ioc, &local_err);
> +            multifd_recv_new_channel(ioc, &local_err);
>           } else {
>               assert(migrate_postcopy_preempt());
>               f = qemu_file_new_input(ioc);
> -            start_migration = postcopy_preempt_new_channel(mis, f);
> +            postcopy_preempt_new_channel(mis, f);
>           }
>           if (local_err) {
>               error_propagate(errp, local_err);
> @@ -765,7 +785,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>           }
>       }
>   
> -    if (start_migration) {
> +    if (migration_has_all_channels()) {
>           /* If it's a recovery, we're done */
>           if (postcopy_try_recover()) {
>               return;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 586ddc9d65..be86a4d07f 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
>   
>   /*
>    * Try to receive all multifd channels to get ready for the migration.
> - * - Return true and do not set @errp when correctly receiving all channels;
> - * - Return false and do not set @errp when correctly receiving the current one;
> - * - Return false and set @errp when failing to receive the current channel.
> + * Sets @errp when failing to receive the current channel.
>    */
> -bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
> +void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>   {
>       MultiFDRecvParams *p;
>       Error *local_err = NULL;
> @@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>                                   "failed to receive packet"
>                                   " via multifd channel %d: ",
>                                   qatomic_read(&multifd_recv_state->count));
> -        return false;
> +        return;
>       }
>       trace_multifd_recv_new_channel(id);
>   
> @@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>                      id);
>           multifd_recv_terminate_threads(local_err);
>           error_propagate(errp, local_err);
> -        return false;
> +        return;
>       }
>       p->c = ioc;
>       object_ref(OBJECT(ioc));
> @@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>       qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
>                          QEMU_THREAD_JOINABLE);
>       qatomic_inc(&multifd_recv_state->count);
> -    return qatomic_read(&multifd_recv_state->count) ==
> -           migrate_multifd_channels();
>   }
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 519f498643..913e4ba274 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
>   int multifd_load_setup(Error **errp);
>   int multifd_load_cleanup(Error **errp);
>   bool multifd_recv_all_channels_created(void);
> -bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
> +void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
>   void multifd_recv_sync_main(void);
>   int multifd_send_sync_main(QEMUFile *f);
>   int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index b9a37ef255..f84f783ab4 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
>       }
>   }
>   
> -bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
> +void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>   {
>       /*
>        * The new loading channel has its own threads, so it needs to be
> @@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>       qemu_file_set_blocking(file, true);
>       mis->postcopy_qemufile_dst = file;
>       trace_postcopy_preempt_new_channel();
> -
> -    /* Start the migration immediately */
> -    return true;
>   }
>   
>   /*
> diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
> index 6147bf7d1d..25881c4127 100644
> --- a/migration/postcopy-ram.h
> +++ b/migration/postcopy-ram.h
> @@ -190,7 +190,7 @@ enum PostcopyChannels {
>       RAM_CHANNEL_MAX,
>   };
>   
> -bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
> +void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
>   int postcopy_preempt_setup(MigrationState *s, Error **errp);
>   int postcopy_preempt_wait_channel(MigrationState *s);
>   
--------------MZu0YVomkhjQ4K99wXU7un8E
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="2">Hi Everyone, Just a gentle reminder for review. :)</font></p>
    <p><font size="2">Thanks</font></p>
    <p><font size="2">Manish Mishra</font><br>
    </p>
    <div class="moz-cite-prefix">On 07/11/22 10:21 pm, manish.mishra
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221107165159.49534-1-manish.mishra@nutanix.com">
      <pre class="moz-quote-pre" wrap="">Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses MSG_PEEK to check the magic number of
channels so that current data/control stream management remains
un-effected.

Suggested-by: Daniel P. Berrangé <a class="moz-txt-link-rfc2396E" href="mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a>
Signed-off-by: manish.mishra <a class="moz-txt-link-rfc2396E" href="mailto:manish.mishra@nutanix.com">&lt;manish.mishra@nutanix.com&gt;</a>

v2:
  TLS does not support MSG_PEEK, so V1 was broken for tls live
  migrations. For tls live migration, while initializing main channel
  tls handshake is done before we can create other channels, so this
  issue is not possible for tls live migrations. In V2 added a check
  to avoid checking magic number for tls live migration and fallback
  to older method to decide mapping of channels on destination side.
---
 include/io/channel.h     | 25 +++++++++++++++++++++++
 io/channel-socket.c      | 27 ++++++++++++++++++++++++
 io/channel.c             | 39 +++++++++++++++++++++++++++++++++++
 migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
 migration/multifd.c      | 12 ++++-------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +----
 migration/postcopy-ram.h |  2 +-
 8 files changed, 130 insertions(+), 26 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..74177aeeea 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -115,6 +115,10 @@ struct QIOChannelClass {
                         int **fds,
                         size_t *nfds,
                         Error **errp);
+    ssize_t (*io_read_peek)(QIOChannel *ioc,
+                            void *buf,
+                            size_t nbytes,
+                            Error **errp);
     int (*io_close)(QIOChannel *ioc,
                     Error **errp);
     GSource * (*io_create_watch)(QIOChannel *ioc,
@@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
                           size_t buflen,
                           Error **errp);
 
+/**
+ * qio_channel_read_peek_all:
+ * @ioc: the channel object
+ * @buf: the memory region to read in data
+ * @nbytes: the number of bytes to read
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Read given @nbytes data from peek of channel into
+ * memory region @buf.
+ *
+ * The function will be blocked until read size is
+ * equal to requested size.
+ *
+ * Returns: 1 if all bytes were read, 0 if end-of-file
+ *          occurs without data, or -1 on error
+ */
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              void* buf,
+                              size_t nbytes,
+                              Error **errp);
+
 /**
  * qio_channel_set_blocking:
  * @ioc: the channel object
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..b99f5dfda6 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 }
 #endif /* WIN32 */
 
+static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
+                                            void *buf,
+                                            size_t nbytes,
+                                            Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    ssize_t bytes = 0;
+
+retry:
+    bytes = recv(sioc-&gt;fd, buf, nbytes, MSG_PEEK);
+
+    if (bytes &lt; 0) {
+        if (errno == EINTR) {
+            goto retry;
+        }
+        if (errno == EAGAIN) {
+            return QIO_CHANNEL_ERR_BLOCK;
+        }
+
+        error_setg_errno(errp, errno,
+                         &quot;Unable to read from peek of socket&quot;);
+        return -1;
+    }
+
+    return bytes;
+}
 
 #ifdef QEMU_MSG_ZEROCOPY
 static int qio_channel_socket_flush(QIOChannel *ioc,
@@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
 
     ioc_klass-&gt;io_writev = qio_channel_socket_writev;
     ioc_klass-&gt;io_readv = qio_channel_socket_readv;
+    ioc_klass-&gt;io_read_peek = qio_channel_socket_read_peek;
     ioc_klass-&gt;io_set_blocking = qio_channel_socket_set_blocking;
     ioc_klass-&gt;io_close = qio_channel_socket_close;
     ioc_klass-&gt;io_shutdown = qio_channel_socket_shutdown;
diff --git a/io/channel.c b/io/channel.c
index 0640941ac5..a2d9b96f3f 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
     return qio_channel_writev_all(ioc, &amp;iov, 1, errp);
 }
 
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              void* buf,
+                              size_t nbytes,
+                              Error **errp)
+{
+   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+   ssize_t bytes = 0;
+
+   if (!klass-&gt;io_read_peek) {
+       error_setg(errp, &quot;Channel does not support read peek&quot;);
+       return -1;
+   }
+
+   while (bytes &lt; nbytes) {
+       bytes = klass-&gt;io_read_peek(ioc,
+                                   buf,
+                                   nbytes,
+                                   errp);
+
+       if (bytes == QIO_CHANNEL_ERR_BLOCK) {
+            if (qemu_in_coroutine()) {
+                qio_channel_yield(ioc, G_IO_OUT);
+            } else {
+                qio_channel_wait(ioc, G_IO_OUT);
+            }
+            continue;
+       }
+       if (bytes == 0) {
+           error_setg(errp,
+                      &quot;Unexpected end-of-file on channel&quot;);
+           return 0;
+       }
+       if (bytes &lt; 0) {
+           return -1;
+       }
+   }
+
+   return 1;
+}
 
 int qio_channel_set_blocking(QIOChannel *ioc,
                               bool enabled,
diff --git a/migration/migration.c b/migration/migration.c
index 739bb683f3..406a9e2f72 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -733,31 +733,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis-&gt;from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() &amp;&amp; !migration_in_postcopy() &amp;&amp;
+        !migrate_use_tls()) {
+        /*
+         * With multiple channels, it is possible that we receive channels
+         * out of order on destination side, causing incorrect mapping of
+         * source channels on destination side. Check channel MAGIC to
+         * decide type of channel. Please note this is best effort, postcopy
+         * preempt channel does not send any magic number so avoid it for
+         * postcopy live migration. Also tls live migration already does
+         * tls handshake while initializing main channel so with tls this
+         * issue is not possible.
+         */
+        ret = qio_channel_read_peek_all(ioc, (void *)&amp;channel_magic,
+                                        sizeof(channel_magic), &amp;local_err);
+
+        if (ret != 1) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis-&gt;from_src_file;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &amp;local_err);
+            multifd_recv_new_channel(ioc, &amp;local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -765,7 +785,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..be86a4d07f 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 &quot;failed to receive packet&quot;
                                 &quot; via multifd channel %d: &quot;,
                                 qatomic_read(&amp;multifd_recv_state-&gt;count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p-&gt;c = ioc;
     object_ref(OBJECT(ioc));
@@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&amp;p-&gt;thread, p-&gt;name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&amp;multifd_recv_state-&gt;count);
-    return qatomic_read(&amp;multifd_recv_state-&gt;count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..913e4ba274 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..f84f783ab4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis-&gt;postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
</pre>
    </blockquote>
  </body>
</html>

--------------MZu0YVomkhjQ4K99wXU7un8E--

