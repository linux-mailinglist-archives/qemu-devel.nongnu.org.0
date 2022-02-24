Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8AD4C2B9D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:25:42 +0100 (CET)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDBl-0003F8-KL
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:25:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nND5d-00059y-V7
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:19:22 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:57972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nND5a-00047O-5Q
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:19:20 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21O7K4xl015784;
 Thu, 24 Feb 2022 04:19:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=NknXlx6TUYznjUsSS2nOnwtwruAqrIGGZTQ6hUvPqnc=;
 b=PzqrPshmwxwC3o6ul1MYB6psyfe4QSyJm5AGBagV5Don4Tur7u9OdJe+LdnvFP5pV9Re
 mG9N5aCKLaH1lHwlg1UlVEYF6Uxcn7+im0IsBN0aj8aRttYMPz1Y4Jz4Wge76amUKbrv
 kfogDrf9KciQ9QQ18x/I9YJ6YbA3FvojvH6nFLM3I3/geJlwwOlfBvOoYglg8F51ln25
 lX4IZ3Uzi6bqruRtO7z43p1PS/4yjo6kIIEc6uCaXsL0YZSQP2I4vT/1WFkXjJqaU4Xs
 tznUf1tdkqxWeBTjfI5bk3QwhfTuHvc7PsmlvkkeVq+XyAHQbe8LICn++zXFnp7nBMvq ug== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3edf82bfbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 04:19:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNGuESJq3jTX/2OcVCyA/2En3qIZmgx/MOsbx3XUU57t1XKRNqim/IemjawHhEkOGT2PVnFV3MNTGKQ56XyV2UvmBwTJ7y4C4UyYYcA81tpEmXiJWgmMpOunIsFLM+4oEe05ypb1DVIE/sjOGs3zDYdk+4jG6LRqPiZyAH2yrDoD3LmFIqUXrYFPu1IvWbFbNX8o6x7w6DCXESQgrpreZFOslAMd6saXak+lcHP6lG5h8xq+yGqrHkoy+r5Wfs7LUlh82DPr72L/LW7OABb8TNVhKtry4bJWaHOUkZ37ErZyFaPkzxV+QJkXmJrIm4je1y+0St1DvBXj+TOCTdcrgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NknXlx6TUYznjUsSS2nOnwtwruAqrIGGZTQ6hUvPqnc=;
 b=c5B3Df+QzuwqThI/p1ol3PyujYGahz4cI0khdls2ZsvvafJ3KnVYoINgZUdRU25b3huToLL3iRhF+Ycf+gq26Qy0AzMZoWfk0uP/9cXaXWydhomvOj9snAtBIpkchqcE6Pgpq+fkU4XI59uecHCnKE/gECF91NhWji4N1s9lrEHzI2jQRrgSnn+Zll4eVjsI5tfn2Pbo17UizmiwjHHv+j1ns/ZHMkCu6BhchaA1dVjp+ijgDu1bc+j6LaKWY3/f9Q4M3ad7P1JrVDlFCKee/0lUhBlmvbsHjylEX/Z3GLrmM34KSwuWoOwrUxrzAxRLxbtuT0ysLrvRc7w2naLSpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM5PR02MB3193.namprd02.prod.outlook.com (2603:10b6:4:62::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Thu, 24 Feb
 2022 12:19:11 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 12:19:11 +0000
Content-Type: multipart/alternative;
 boundary="------------YVc1zsbYZnhwoHwBygvNGWDo"
Message-ID: <89c9d008-7581-e4d6-5ec8-2e87da16c76c@nutanix.com>
Date: Thu, 24 Feb 2022 17:48:56 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] Added parameter to take screenshot with screendump as PNG
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220222152758.207415-1-kshitij.suri@nutanix.com>
 <YhUQg9gReZWiVhbS@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <YhUQg9gReZWiVhbS@redhat.com>
X-ClientProxiedBy: MAXPR0101CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::26) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa1c61b6-097d-4c20-b730-08d9f78fdccf
X-MS-TrafficTypeDiagnostic: DM5PR02MB3193:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB319359905CBC28BAE48C98E2993D9@DM5PR02MB3193.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JmGZoypiPOJTVEbhJQ3yzm5RKkQYUeU6boXV5MFiR3/FX1XrHGEPaABsL2mUIevg15OKqWmmA+wCYmYLBo4h+dNYNrchZ+jEs7C2K1KWD11wiAO7r3hIWZrITpHyETa9nNWjx6Abb31TBNwu4yk4ecX8EgDgYOBljEIrCEyAZZKNsJ5LFaufgntxrKNt5UcT75DtD123PHIb3hh1ODq+yBEnv4pQf5NNvH38bvn5cB+Akxwk9HFRMcXS9lVit24AHiMbdsUtiNLikPLcmPXPLw24bz5d5dwY/C0PC9QvhTTdmONzcX5VMetiJy07cppwAT0uh8biR2WttDFJcsKSZA19eso0zdL5e7pAEphFWCHSEoviOVstX1XlGX1ZLr8wQ/YjvMurAGvHof4xJDlmLjrd3SYIY1t/+fkPGGoUvzngBa7LNkJFZfZbumA2eaPJyus0wcSZkrR24iIJAnHbfTgTTbyj40z0VsM4AvSlQlU54ExzF3VAUQGZZTJ4dH/fm7SQwswI/KxyP04L8N8LVPsttqiLhJHOtZjDn3g6JIed8owD+ioIgJpCSSyBbim0/GNNyz5IjHnexHKi0Ko77kdeoz4s02y83fdMSh1yLGcvUSqEYnBLGiXAgJDMCxxoEJOeEpmNkYlsPNy4TNOfbRSj5n/0vfZNv4wJayxgkmLRNNpr7JSYqSOluEIjcLSepH9/ObqJcwXut5ob5W7R/d+pYcGX8A0+E7AP1tmFfRAF9GHcBt4RdjcTMRqHjWOcUxl8Z2gvhxdMvF9wDfnYSYNuHK40ZhT0/LXkrtvSa10o+LWQ8bQhgJz0qZdCBaBbCvGTC4F7BoRk242n4xWTmhRO549ay21oayCdxtdVfBetj1SAZMrckx5WA4s1qhAA35S9XgYuJXyzrAOnU705IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(38100700002)(38350700002)(508600001)(66946007)(8676002)(316002)(6666004)(4326008)(6916009)(66556008)(86362001)(6506007)(66476007)(6486002)(966005)(66574015)(5660300002)(36756003)(44832011)(53546011)(26005)(166002)(52116002)(8936002)(2616005)(31686004)(33964004)(83380400001)(6512007)(186003)(2906002)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0t1clBGK293RmFqQStzRStNZXRra05IZXlaQmVtTVRmOHRHNXBJMFd4YTNr?=
 =?utf-8?B?UlRkM3J5ZGp0T0VTcGxWeCt3Q1FZNkh1L0xBdFB4S2IxL3ZxOEk1d09WTm5l?=
 =?utf-8?B?MEpyYlVCamQ4RlFDbEhOc0d0ZThsM1dheGU2djRJQ2E1clpWQkNBMzlYWkc1?=
 =?utf-8?B?V2szVlZVZ1lHNW5vL3U4MEtscWI1dHU2T2hrVE5Bdm5Xa0hBdXpZZ2t2eUJX?=
 =?utf-8?B?MDl0VDJKa2xhL2xncG9DcVh0U05zS2FUaUd4MnhDbzY0d2pUQXdTMWxnSE9q?=
 =?utf-8?B?SWp5T0FLeElueUY4QzU4S2tmdmVsaEJaSCtMTG4wdHlRU3UrWlNUQ2RSNHNY?=
 =?utf-8?B?aHFrWnpJYktiYTlBMUdtNFEvU2tvZGkwZ2V2Q0xrcVkzMDBhUTFTMTVzNzJY?=
 =?utf-8?B?SncvZTJvOHA0YmRvaGhkbnRvdlNLZld0cVZWWnYzN3JraXZtWW9hTDZncEFy?=
 =?utf-8?B?NGZsbm9JK2MyWUQ1R3F6UzRZbkR5VUFqdHlUZFdENE1iRjNMU3V0YUdDK2pQ?=
 =?utf-8?B?aHJyUjZxV2JqWitLRGNSYnNtTk1YMGE1aXJLcVpEZDlRTFVlaEI3MTNvcGZ4?=
 =?utf-8?B?bTFnUzY5eTJNTG9uSEVLMVlyN0dvNUNlbkdTRmMrbUt4eDF6R0Q4Wm04TTV2?=
 =?utf-8?B?eXF0aU1aaWtWdTFaWHV5QWxrOW5uWnlsVkFpaE1OdnJRdWZ5ekw0RVNZR1Zs?=
 =?utf-8?B?L0dlUVVMVjZzRnBxakhLUnBnQjBVOGxYWnlGdlFMVWxSOVovaGk5RktSUHdL?=
 =?utf-8?B?b2p1YkU0cWZJK2Z5NHdxMGdEbHE0end6MnNWL2VXSlUxc1Q0elpibnErd05h?=
 =?utf-8?B?Y05qNjF1ZXozcitLejljOVVhak1rSUJsOVdXK2hrNFB1NTBjdnVIWUxoRFBn?=
 =?utf-8?B?eE9xVy9iWnZpZnY2VEZpS1ZJQmZEejhKSU52cGUvV25iTkNmK3UyVkRuS3VH?=
 =?utf-8?B?cFJMOElxNWdoUnlEUmhLdjRKZkJvZGIvdHlMN3RQd2FSdGMxU055akZXNWZs?=
 =?utf-8?B?UEpZa09FV1d4aWdDVW1jbko0TTZySlFsdnE4TEJCakRJRlpTZUYxUFlEM1ps?=
 =?utf-8?B?ODIvUHZFTU9tVTBOaW9ockN6WkswOVlsd01zYVk0QmErT0FmR3E5VHVzcVV3?=
 =?utf-8?B?RVVab1ZmaXVsTTlVeVdxaklVbXR4QVRFU3piT1lzK3FLdGVIZnIyUCt0Wngz?=
 =?utf-8?B?cVFWMWQwMHZUaHV5N0UwYUp1MCt1YU1PdDBBQTg1bVl0RTlxQmRLNDNwTVFh?=
 =?utf-8?B?SUFvNFg4bUwrSUdadmpRWjF1cVNxbzY1QjZhRjZJSEJ6bHFYN2swU01FUnJ6?=
 =?utf-8?B?QVFCdUZCcUlHcENKd0J5Ukc0bDliSGNsK0l4bktQWDNDSlZESGZ6KytUSW9j?=
 =?utf-8?B?MXJhUXk4TDBWN0E5Y0pZM1ZqWFlmRUFhTWxaNStEcm1OUXc5eDhMa3NmOTB6?=
 =?utf-8?B?cUdPa0N5MTJuczV1ckFCM1AvNHEwbmF2TlR1L0RFUi85NGtlQWdPVGNCcDZm?=
 =?utf-8?B?UytRcnFxUm9vTWZwc2xsUWJWT1p1bWZPVktqRFlvWk1FRGZxYVlrYWppQkdN?=
 =?utf-8?B?YzJqdUhGUXhsRWxwQkkwQUNOSCthR0tUTFNYVTVGZXFiTjF1dDRsWjkvRVlR?=
 =?utf-8?B?bExiWjNvQ1A1QnFCUU1USW95aHJCYUd4S0VUbHEzWjlhUldPQ1M1S3pzemg0?=
 =?utf-8?B?bGN5UFNraXVSV09LRUVMaHA1TVphUEF5cjBvOVRJVjRMQzYxREVxUkl3UXdV?=
 =?utf-8?B?MU9jSkpuTWVCM1VXeHk4YVFXemRaK09iSk5IVU53QjVPcjZFcDFjbkkvanp4?=
 =?utf-8?B?bTFPV0tJb2tQUDN5ai8vZ29WYXV0bXhhZXZkdlFBdG9aekhKcGM0TTZXc2h3?=
 =?utf-8?B?R2F4U3FiTDZDalVreHpjUERuOFBaeWhqaDVMWXRmc0FDTGxGSUljWXhVRisz?=
 =?utf-8?B?aFQwUmJQa0FvOERlaGZ0VjJDbmlia0RQMEJKeFM4eWc1OVlkbTZ6YWo1WlNJ?=
 =?utf-8?B?QUVrdFR5bzlheUdXZzZTczUwU1NRZjJKbzRyTkFObHdJclNjOENOaUNpTjJK?=
 =?utf-8?B?V2h4Vk5UaHhnb0gvb0ROMjd1NG9aV2JyNlBwa0VQQ205K2wxckNHNlpBMWxU?=
 =?utf-8?B?REI0SG1HUkVtK1IxSHMvajRtR3NrZ2dUTkJmZ0pnc3JERE0rTkNYT2JPeVpw?=
 =?utf-8?B?dmpFa0Nsakwyc0lCUURtQTUyOVdCZUZHeVpDdCs3ZjF1bk0zd1dRTG5ETXhv?=
 =?utf-8?B?aG94c0JvOXVXSUo4Mm1yV2lUNmVBPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1c61b6-097d-4c20-b730-08d9f78fdccf
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 12:19:11.0213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxLh3cxhbk/jW/L+nnpbEL3dMzDa3WaMJHBWaHNl/z9+rxnZrjkNVV2D9Bzy+uVF/yZtCFQXfsaSpm72IcVaGSsu9LUEJAV1zqTE8FdGzkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3193
X-Proofpoint-GUID: Ri_FL1IDv2ph7_zW0FsW_fzBUkaqfVyc
X-Proofpoint-ORIG-GUID: Ri_FL1IDv2ph7_zW0FsW_fzBUkaqfVyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_02,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------YVc1zsbYZnhwoHwBygvNGWDo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 22/02/22 10:04 pm, Daniel P. Berrangé wrote:
> On Tue, Feb 22, 2022 at 03:27:58PM +0000, Kshitij Suri wrote:
>> Currently screendump only supports PPM format, which is un-compressed and not
>> standard. Added an "format" parameter to qemu monitor screendump capabilites
>> to support PNG image capture using libpng. The param was added in QAPI schema
>> of screendump present in ui.json along with png_save() function which converts
>> pixman_image to PNG. HMP command equivalent was also modified to support the
>> feature.
>>
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image", "format":"png" } }
>>
>> Resolves:https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=eOSxOmlj_wVOfj7HF2fJ1VXlNNJp4k8UAlT5STcoAguScPKeHYwb6hwEuY54ok5c&s=ou3KExLg2-Cx31UtMV6vXErHpesdEHJjHXnbKcE9Wdk&e=  
>>
>> Signed-off-by: Kshitij Suri<kshitij.suri@nutanix.com>
>> ---
>>   hmp-commands.hx    |  11 ++--
>>   monitor/hmp-cmds.c |   4 +-
>>   qapi/ui.json       |   7 ++-
>>   ui/console.c       | 153 ++++++++++++++++++++++++++++++++++++++++++++-
>>   4 files changed, 165 insertions(+), 10 deletions(-)
> You're going to need to update configure here.
>
> Currently libpng is only detected if VNC is enabled.
>
> This proposed change means we need to detect libpng
> any time the build of system emulators is enabled.
>
> The CONFIG_VNC_PNG option will also need renaming
> to CONFIG_PNG

Yes I have added a new CONFIG_PNG option in the updated patch. As for 
CONFIG_VNC_PNG, can we have a seperate patch set

where I can replace CONFIG_VNC_PNG usage with combination of CONFIG_VNC 
and CONFIG_PNG? The replacement strategy would be as follows

#ifdef CONFIG_VNC_PNG -> #if defined(CONFIG_VNC) && defined(CONFIG_PNG)

Along with this, can we also use the new png meson-option to denote PNG 
format for VNC as well while maintaining backward compatibility? The 
change would look like

vnc_png = dependency('libpng', required: get_option('vnc_png'), method: 
'pkg-config', kwargs: static_kwargs)

gets changed to

vnc_png = dependency('libpng', required: get_option('vnc_png') || get_option('png'),
                     method: 'pkg-config', kwargs: static_kwargs)

>
>> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
>> +        .params     = "filename [device [head]] [format]",
>> +        .help       = "save screen from head 'head' of display device 'device'"
>> +                      "in specified format 'format' as image 'filename'."
>> +                      "Default format for screendump is PPM.",
> Mention what other formats are permitted, making it clear that
> the format is in fact 'png' and 'ppm', not 'PPM'
Updated in the v2 patch.
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 9354f4c467..9fdb56b60b 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -76,7 +76,7 @@
>>   ##
>>   # @screendump:
>>   #
>> -# Write a PPM of the VGA screen to a file.
>> +# Write a screenshot of the VGA screen to a file.
>>   #
>>   # @filename: the path of a new PPM file to store the image
>>   #
>> @@ -87,6 +87,9 @@
>>   #        parameter is missing, head #0 will be used. Also note that the head
>>   #        can only be specified in conjunction with the device ID. (Since 2.12)
>>   #
>> +# @format: image format for screendump is specified. Currently only PNG and
>> +#             PPM are supported.
>> +#
>>   # Returns: Nothing on success
>>   #
>>   # Since: 0.14
>> @@ -99,7 +102,7 @@
>>   #
>>   ##
>>   { 'command': 'screendump',
>> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
>> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int', '*format': 'str'},
> This 'format' should not be a string, it needs to be an enum type.
Modified to an enum with png and ppm types.
>
>>     'coroutine': true }
>>   
>>   ##
>> diff --git a/ui/console.c b/ui/console.c
>> index 40eebb6d2c..7813b195ac 100644
>> --- a/ui/console.c
>> +++ b/ui/console.c
>> @@ -37,6 +37,9 @@
>>   #include "exec/memory.h"
>>   #include "io/channel-file.h"
>>   #include "qom/object.h"
>> +#ifdef CONFIG_VNC_PNG
>> +#include "png.h"
>> +#endif
>>   
>>   #define DEFAULT_BACKSCROLL 512
>>   #define CONSOLE_CURSOR_PERIOD 500
>> @@ -289,6 +292,137 @@ void graphic_hw_invalidate(QemuConsole *con)
>>       }
>>   }
>>   
>> +#ifdef CONFIG_VNC_PNG
>> +/**
>> + * a8r8g8b8_to_rgba: Convert a8r8g8b8 to rgba format
>> + *
>> + * @dst: Destination pointer.
>> + * @src: Source pointer.
>> + * @n_pixels: Size of image.
>> + */
>> +static void a8r8g8b8_to_rgba(uint32_t *dst, uint32_t *src, int n_pixels)
>> +{
>> +    uint8_t *dst8 = (uint8_t *)dst;
>> +    int i;
>> +
>> +    for (i = 0; i < n_pixels; ++i) {
>> +        uint32_t p = src[i];
>> +        uint8_t a, r, g, b;
>> +
>> +        a = (p & 0xff000000) >> 24;
>> +        r = (p & 0x00ff0000) >> 16;
>> +        g = (p & 0x0000ff00) >> 8;
>> +        b = (p & 0x000000ff) >> 0;
>> +
>> +        if (a != 0) {
>> +            #define DIVIDE(c, a) \
>> +            do { \
>> +                int t = ((c) * 255) / a; \
>> +                (c) = t < 0 ? 0 : t > 255 ? 255 : t; \
>> +            } while (0)
>> +
>> +            DIVIDE(r, a);
>> +            DIVIDE(g, a);
>> +            DIVIDE(b, a);
>> +            #undef DIVIDE
>> +        }
>> +
>> +        *dst8++ = r;
>> +        *dst8++ = g;
>> +        *dst8++ = b;
>> +        *dst8++ = a;
>> +    }
>> +}
>> +
>> +/**
>> + * png_save: Take a screenshot as PNG
>> + *
>> + * Saves screendump as a PNG file
>> + *
>> + * Returns true for success or false for error.
>> + * Inspired from png test utils fromhttps://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_aseprite_pixman&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=eOSxOmlj_wVOfj7HF2fJ1VXlNNJp4k8UAlT5STcoAguScPKeHYwb6hwEuY54ok5c&s=vFM5I_UU7xzQZqH8h-S2oWQgXCcpQbomvm8x9zGso98&e=  
>> + *
>> + * @fd: File descriptor for PNG file.
>> + * @image: Image data in pixman format.
>> + * @errp: Pointer to an error.
>> + */
>> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
>> +{
>> +    int width = pixman_image_get_width(image);
>> +    int height = pixman_image_get_height(image);
>> +    int stride = width * 4;
>> +    g_autofree uint32_t *src_data = g_malloc(height * stride);
>> +    g_autofree uint32_t *dest_data = g_malloc(height * stride);
>> +    g_autoptr(pixman_image_t) src_copy;
>> +    g_autoptr(pixman_image_t) dest_copy;
>> +    g_autofree png_struct *write_struct;
>> +    g_autofree png_info *info_struct;
> Anything declared with 'g_auto*' must always be explicitly initialized
> to NULL at time of declaration to avoid risk of gree'ing uninitialized
> memory
Updated the pointers in the updated patch.
>> +    g_autofree png_bytep *row_pointers = g_malloc(height * sizeof(png_bytep));
> g_new(png_bytep, height)
>
>> +    FILE *f = fdopen(fd, "wb");
>> +    int y;
>> +    if (!f) {
>> +        error_setg(errp, "Failed to create file from file descriptor");
>> +        return false;
>> +    }
>> +
>> +    src_copy = pixman_image_create_bits(PIXMAN_a8r8g8b8, width, height,
>> +                                        src_data, stride);
>> +
>> +    pixman_image_composite32(PIXMAN_OP_SRC, image, NULL, src_copy, 0, 0, 0, 0,
>> +                             0, 0, width, height);
>> +
>> +    memcpy(dest_data, src_data, sizeof(*src_data));
>> +
>> +    a8r8g8b8_to_rgba(dest_data, src_data, height * width);
>> +
>> +    for (y = 0; y < height; ++y) {
>> +        row_pointers[y] = (png_bytep)(src_data + y * width);
>> +    }
>> +
>> +    write_struct = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
>> +                                                 NULL, NULL);
>> +    if (!write_struct) {
>> +        error_setg(errp, "PNG creation failed. Unable to write struct");
>> +        return false;
>> +    }
>> +
>> +    info_struct = png_create_info_struct(write_struct);
>> +
>> +    if (!info_struct) {
>> +        error_setg(errp, "PNG creation failed. Unable to write info");
>> +        return false;
>> +    }
>> +
>> +    png_init_io(write_struct, f);
>> +
>> +    png_set_IHDR(write_struct, info_struct, width, height, 8,
>> +                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
>> +                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
>> +
>> +    png_write_info(write_struct, info_struct);
>> +
>> +    png_write_image(write_struct, row_pointers);
>> +
>> +    png_write_end(write_struct, NULL);
>> +
>> +    if (fclose(f) != 0) {
>> +        error_setg(errp, "PNG creation failed. Unable to close file");
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +#else /* no png support */
>> +
>> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
>> +{
>> +    error_setg(errp, "Enable VNC PNG support for png screendump");
>> +    return false;
>> +}
>> +
>> +#endif /* CONFIG_VNC_PNG */
>> +
>>   static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
>>   {
>>       int width = pixman_image_get_width(image);
>> @@ -327,7 +461,8 @@ static void graphic_hw_update_bh(void *con)
>>   /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
>>   void coroutine_fn
>>   qmp_screendump(const char *filename, bool has_device, const char *device,
>> -               bool has_head, int64_t head, Error **errp)
>> +               bool has_head, int64_t head, bool has_format,
>> +               const char *format, Error **errp)
>>   {
>>       g_autoptr(pixman_image_t) image = NULL;
>>       QemuConsole *con;
>> @@ -383,8 +518,22 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
>>        * yields and releases the BQL. It could produce corrupted dump, but
>>        * it should be otherwise safe.
>>        */
>> -    if (!ppm_save(fd, image, errp)) {
>> +
>> +    if (has_format && strcmp(format, "png") == 0) {
>> +        /* PNG format specified for screendump */
>> +        if (!png_save(fd, image, errp)) {
>> +            qemu_unlink(filename);
>> +        }
>> +    } else if (!has_format || (has_format && strcmp(format, "ppm") == 0)) {
>> +        /* PPM format specified/default for screendump */
>> +        if (!ppm_save(fd, image, errp)) {
>> +            qemu_unlink(filename);
>> +        }
>> +    } else {
>> +        /* Invalid specified for screendump */
>> +        error_setg(errp, "Invalid format provided for screendump.");
>>           qemu_unlink(filename);
>> +        return;
>>       }
>>   }
>>   
>> -- 
>> 2.22.3
>>
>>
> Regards,
> Daniel
Thank you for your prompt review!

Regards,

Kshitij

--------------YVc1zsbYZnhwoHwBygvNGWDo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 22/02/22 10:04 pm, Daniel P.
      Berrang=C3=A9 wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:YhUQg9gReZWiVhbS@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Feb 22, 2022 at 03:27:=
58PM +0000, Kshitij Suri wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Currently screendump only su=
pports PPM format, which is un-compressed and not
standard. Added an &quot;format&quot; parameter to qemu monitor screendump =
capabilites
to support PNG image capture using libpng. The param was added in QAPI sche=
ma
of screendump present in ui.json along with png_save() function which conve=
rts
pixman_image to PNG. HMP command equivalent was also modified to support th=
e
feature.

Example usage:
{ &quot;execute&quot;: &quot;screendump&quot;, &quot;arguments&quot;: { &qu=
ot;filename&quot;: &quot;/tmp/image&quot;, &quot;format&quot;:&quot;png&quo=
t; } }

Resolves: <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttps-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_=
718&amp;d=3DDwIBaQ&amp;c=3Ds883GpUCOChKOHiocYtGcg&amp;r=3Dutjv19Ej9Fb0TB7_D=
X0o3faQ-OAm2ypPniPyqVSoj_w&amp;m=3DeOSxOmlj_wVOfj7HF2fJ1VXlNNJp4k8UAlT5STco=
AguScPKeHYwb6hwEuY54ok5c&amp;s=3Dou3KExLg2-Cx31UtMV6vXErHpesdEHJjHXnbKcE9Wd=
k&amp;e=3D">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gitlab.c=
om_qemu-2Dproject_qemu_-2D_issues_718&amp;d=3DDwIBaQ&amp;c=3Ds883GpUCOChKOH=
iocYtGcg&amp;r=3Dutjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&amp;m=3DeOSxOm=
lj_wVOfj7HF2fJ1VXlNNJp4k8UAlT5STcoAguScPKeHYwb6hwEuY54ok5c&amp;s=3Dou3KExLg=
2-Cx31UtMV6vXErHpesdEHJjHXnbKcE9Wdk&amp;e=3D</a>=20

Signed-off-by: Kshitij Suri <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:kshitij.suri@nutanix.com">&lt;kshitij.suri@nutanix.com&gt;</a>
---
 hmp-commands.hx    |  11 ++--
 monitor/hmp-cmds.c |   4 +-
 qapi/ui.json       |   7 ++-
 ui/console.c       | 153 ++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 165 insertions(+), 10 deletions(-)
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
You're going to need to update configure here.

Currently libpng is only detected if VNC is enabled.

This proposed change means we need to detect libpng
any time the build of system emulators is enabled.

The CONFIG_VNC_PNG option will also need renaming
to CONFIG_PNG</pre>
    </blockquote>
    <p>Yes I have added a new CONFIG_PNG option in the updated patch. As
      for CONFIG_VNC_PNG, can we have a seperate patch set <br>
    </p>
    <p>where I can replace CONFIG_VNC_PNG usage with combination of
      CONFIG_VNC and CONFIG_PNG? The replacement strategy would be as
      follows<br>
    </p>
    <pre class=3D"c-mrkdwn__pre" data-stringify-type=3D"pre" style=3D"box-s=
izing: inherit; margin: 4px 0px; padding: 8px; --saf-0:rgba(var(--sk_foregr=
ound_low,29,28,29),0.13); font-size: 12px; line-height: 1.50001; font-varia=
nt-ligatures: none; white-space: pre-wrap; overflow-wrap: break-word; word-=
break: normal; tab-size: 4; font-family: Monaco, Menlo, Consolas, &quot;Cou=
rier New&quot;, monospace !important; border: 1px solid var(--saf-0); borde=
r-radius: 4px; background: rgba(var(--sk_foreground_min,29,28,29),0.04); co=
unter-reset: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0=
 list-7 0 list-8 0 list-9 0; color: rgb(209, 210, 211); font-style: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orpha=
ns: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickne=
ss: initial; text-decoration-style: initial; text-decoration-color: initial=
;">#ifdef CONFIG_VNC_PNG -&gt; #if defined(CONFIG_VNC) &amp;&amp; defined(C=
ONFIG_PNG)
</pre>
    <p>Along with this, can we also use the new png meson-option to
      denote PNG format for VNC as well while maintaining backward
      compatibility? The change would look like<br>
    </p>
    <p class=3D"c-mrkdwn__pre" data-stringify-type=3D"pre" style=3D"box-siz=
ing: inherit; margin: 4px 0px; padding: 8px; --saf-0:rgba(var(--sk_foregrou=
nd_low,29,28,29),0.13); font-size: 12px; line-height: 1.50001; font-variant=
-ligatures: none; white-space: pre-wrap; overflow-wrap: break-word; word-br=
eak: normal; tab-size: 4; font-family: Monaco, Menlo, Consolas, &quot;Couri=
er New&quot;, monospace !important; border: 1px solid var(--saf-0); border-=
radius: 4px; background: rgba(var(--sk_foreground_min,29,28,29),0.04); coun=
ter-reset: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 l=
ist-7 0 list-8 0 list-9 0; color: rgb(209, 210, 211); font-style: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness=
: initial; text-decoration-style: initial; text-decoration-color: initial;"=
>vnc_png =3D dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', kwargs: static_kwargs)
</p>
    <p>
      gets changed to<br>
    </p>
    <pre class=3D"c-mrkdwn__pre" data-stringify-type=3D"pre" style=3D"box-s=
izing: inherit; margin: 4px 0px; padding: 8px; --saf-0:rgba(var(--sk_foregr=
ound_low,29,28,29),0.13); font-size: 12px; line-height: 1.50001; font-varia=
nt-ligatures: none; white-space: pre-wrap; overflow-wrap: break-word; word-=
break: normal; tab-size: 4; font-family: Monaco, Menlo, Consolas, &quot;Cou=
rier New&quot;, monospace !important; border: 1px solid var(--saf-0); borde=
r-radius: 4px; background: rgba(var(--sk_foreground_min,29,28,29),0.04); co=
unter-reset: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0=
 list-7 0 list-8 0 list-9 0; color: rgb(209, 210, 211); font-style: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orpha=
ns: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickne=
ss: initial; text-decoration-style: initial; text-decoration-color: initial=
;">vnc_png =3D dependency('libpng', required: get_option('vnc_png') || get_=
option('png'),
                    method: 'pkg-config', kwargs: static_kwargs)</pre>
    <blockquote type=3D"cite" cite=3D"mid:YhUQg9gReZWiVhbS@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+        .args_type  =3D &qu=
ot;filename:F,device:s?,head:i?,format:f?&quot;,
+        .params     =3D &quot;filename [device [head]] [format]&quot;,
+        .help       =3D &quot;save screen from head 'head' of display devi=
ce 'device'&quot;
+                      &quot;in specified format 'format' as image 'filenam=
e'.&quot;
+                      &quot;Default format for screendump is PPM.&quot;,
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Mention what other formats are permitted, making it clear that
the format is in fact 'png' and 'ppm', not 'PPM'
</pre>
    </blockquote>
    Updated in the v2 patch.<br>
    <blockquote type=3D"cite" cite=3D"mid:YhUQg9gReZWiVhbS@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">diff --git a/qapi/ui.json b/=
qapi/ui.json
index 9354f4c467..9fdb56b60b 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -76,7 +76,7 @@
 ##
 # @screendump:
 #
-# Write a PPM of the VGA screen to a file.
+# Write a screenshot of the VGA screen to a file.
 #
 # @filename: the path of a new PPM file to store the image
 #
@@ -87,6 +87,9 @@
 #        parameter is missing, head #0 will be used. Also note that the he=
ad
 #        can only be specified in conjunction with the device ID. (Since 2=
.12)
 #
+# @format: image format for screendump is specified. Currently only PNG an=
d
+#             PPM are supported.
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -99,7 +102,7 @@
 #
 ##
 { 'command': 'screendump',
-  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
+  'data': {'filename': 'str', '*device': 'str', '*head': 'int', '*format':=
 'str'},
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
This 'format' should not be a string, it needs to be an enum type.</pre>
    </blockquote>
    Modified to an enum with png and ppm types.<br>
    <blockquote type=3D"cite" cite=3D"mid:YhUQg9gReZWiVhbS@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">   'coroutine': true }
=20
 ##
diff --git a/ui/console.c b/ui/console.c
index 40eebb6d2c..7813b195ac 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,6 +37,9 @@
 #include &quot;exec/memory.h&quot;
 #include &quot;io/channel-file.h&quot;
 #include &quot;qom/object.h&quot;
+#ifdef CONFIG_VNC_PNG
+#include &quot;png.h&quot;
+#endif
=20
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -289,6 +292,137 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
=20
+#ifdef CONFIG_VNC_PNG
+/**
+ * a8r8g8b8_to_rgba: Convert a8r8g8b8 to rgba format
+ *
+ * @dst: Destination pointer.
+ * @src: Source pointer.
+ * @n_pixels: Size of image.
+ */
+static void a8r8g8b8_to_rgba(uint32_t *dst, uint32_t *src, int n_pixels)
+{
+    uint8_t *dst8 =3D (uint8_t *)dst;
+    int i;
+
+    for (i =3D 0; i &lt; n_pixels; ++i) {
+        uint32_t p =3D src[i];
+        uint8_t a, r, g, b;
+
+        a =3D (p &amp; 0xff000000) &gt;&gt; 24;
+        r =3D (p &amp; 0x00ff0000) &gt;&gt; 16;
+        g =3D (p &amp; 0x0000ff00) &gt;&gt; 8;
+        b =3D (p &amp; 0x000000ff) &gt;&gt; 0;
+
+        if (a !=3D 0) {
+            #define DIVIDE(c, a) \
+            do { \
+                int t =3D ((c) * 255) / a; \
+                (c) =3D t &lt; 0 ? 0 : t &gt; 255 ? 255 : t; \
+            } while (0)
+
+            DIVIDE(r, a);
+            DIVIDE(g, a);
+            DIVIDE(b, a);
+            #undef DIVIDE
+        }
+
+        *dst8++ =3D r;
+        *dst8++ =3D g;
+        *dst8++ =3D b;
+        *dst8++ =3D a;
+    }
+}
+
+/**
+ * png_save: Take a screenshot as PNG
+ *
+ * Saves screendump as a PNG file
+ *
+ * Returns true for success or false for error.
+ * Inspired from png test utils from <a class=3D"moz-txt-link-freetext" hr=
ef=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_ase=
prite_pixman&amp;d=3DDwIBaQ&amp;c=3Ds883GpUCOChKOHiocYtGcg&amp;r=3Dutjv19Ej=
9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&amp;m=3DeOSxOmlj_wVOfj7HF2fJ1VXlNNJp4k8=
UAlT5STcoAguScPKeHYwb6hwEuY54ok5c&amp;s=3DvFM5I_UU7xzQZqH8h-S2oWQgXCcpQbomv=
m8x9zGso98&amp;e=3D">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A_=
_github.com_aseprite_pixman&amp;d=3DDwIBaQ&amp;c=3Ds883GpUCOChKOHiocYtGcg&a=
mp;r=3Dutjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&amp;m=3DeOSxOmlj_wVOfj7H=
F2fJ1VXlNNJp4k8UAlT5STcoAguScPKeHYwb6hwEuY54ok5c&amp;s=3DvFM5I_UU7xzQZqH8h-=
S2oWQgXCcpQbomvm8x9zGso98&amp;e=3D</a>=20
+ *
+ * @fd: File descriptor for PNG file.
+ * @image: Image data in pixman format.
+ * @errp: Pointer to an error.
+ */
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    int width =3D pixman_image_get_width(image);
+    int height =3D pixman_image_get_height(image);
+    int stride =3D width * 4;
+    g_autofree uint32_t *src_data =3D g_malloc(height * stride);
+    g_autofree uint32_t *dest_data =3D g_malloc(height * stride);
+    g_autoptr(pixman_image_t) src_copy;
+    g_autoptr(pixman_image_t) dest_copy;
+    g_autofree png_struct *write_struct;
+    g_autofree png_info *info_struct;
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Anything declared with 'g_auto*' must always be explicitly initialized
to NULL at time of declaration to avoid risk of gree'ing uninitialized
memory
</pre>
    </blockquote>
    Updated the pointers in the updated patch.<br>
    <blockquote type=3D"cite" cite=3D"mid:YhUQg9gReZWiVhbS@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+    g_autofree png_bytep *r=
ow_pointers =3D g_malloc(height * sizeof(png_bytep));
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
g_new(png_bytep, height)

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+    FILE *f =3D fdopen(fd, =
&quot;wb&quot;);
+    int y;
+    if (!f) {
+        error_setg(errp, &quot;Failed to create file from file descriptor&=
quot;);
+        return false;
+    }
+
+    src_copy =3D pixman_image_create_bits(PIXMAN_a8r8g8b8, width, height,
+                                        src_data, stride);
+
+    pixman_image_composite32(PIXMAN_OP_SRC, image, NULL, src_copy, 0, 0, 0=
, 0,
+                             0, 0, width, height);
+
+    memcpy(dest_data, src_data, sizeof(*src_data));
+
+    a8r8g8b8_to_rgba(dest_data, src_data, height * width);
+
+    for (y =3D 0; y &lt; height; ++y) {
+        row_pointers[y] =3D (png_bytep)(src_data + y * width);
+    }
+
+    write_struct =3D png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
+                                                 NULL, NULL);
+    if (!write_struct) {
+        error_setg(errp, &quot;PNG creation failed. Unable to write struct=
&quot;);
+        return false;
+    }
+
+    info_struct =3D png_create_info_struct(write_struct);
+
+    if (!info_struct) {
+        error_setg(errp, &quot;PNG creation failed. Unable to write info&q=
uot;);
+        return false;
+    }
+
+    png_init_io(write_struct, f);
+
+    png_set_IHDR(write_struct, info_struct, width, height, 8,
+                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
+                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
+
+    png_write_info(write_struct, info_struct);
+
+    png_write_image(write_struct, row_pointers);
+
+    png_write_end(write_struct, NULL);
+
+    if (fclose(f) !=3D 0) {
+        error_setg(errp, &quot;PNG creation failed. Unable to close file&q=
uot;);
+        return false;
+    }
+
+    return true;
+}
+
+#else /* no png support */
+
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    error_setg(errp, &quot;Enable VNC PNG support for png screendump&quot;=
);
+    return false;
+}
+
+#endif /* CONFIG_VNC_PNG */
+
 static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
 {
     int width =3D pixman_image_get_width(image);
@@ -327,7 +461,8 @@ static void graphic_hw_update_bh(void *con)
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
 qmp_screendump(const char *filename, bool has_device, const char *device,
-               bool has_head, int64_t head, Error **errp)
+               bool has_head, int64_t head, bool has_format,
+               const char *format, Error **errp)
 {
     g_autoptr(pixman_image_t) image =3D NULL;
     QemuConsole *con;
@@ -383,8 +518,22 @@ qmp_screendump(const char *filename, bool has_device, =
const char *device,
      * yields and releases the BQL. It could produce corrupted dump, but
      * it should be otherwise safe.
      */
-    if (!ppm_save(fd, image, errp)) {
+
+    if (has_format &amp;&amp; strcmp(format, &quot;png&quot;) =3D=3D 0) {
+        /* PNG format specified for screendump */
+        if (!png_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
+    } else if (!has_format || (has_format &amp;&amp; strcmp(format, &quot;=
ppm&quot;) =3D=3D 0)) {
+        /* PPM format specified/default for screendump */
+        if (!ppm_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
+    } else {
+        /* Invalid specified for screendump */
+        error_setg(errp, &quot;Invalid format provided for screendump.&quo=
t;);
         qemu_unlink(filename);
+        return;
     }
 }
=20
--=20
2.22.3


</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Regards,
Daniel
</pre>
    </blockquote>
    Thank you for your prompt review!<br>
    <br>
    <p>Regards,</p>
    <p>Kshitij<br>
    </p>
  </body>
</html>

--------------YVc1zsbYZnhwoHwBygvNGWDo--

