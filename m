Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A396338DA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:42:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPmP-0002Or-7d; Tue, 22 Nov 2022 04:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxPmK-0002Og-Mu
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:41:21 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxPm8-0000p5-MI
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:41:20 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AM6d2ql020474; Tue, 22 Nov 2022 01:41:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=Ul9DGs2JL7Hgpw/4NoXSakcWGfa/HgWy3fMjmSeLBdU=;
 b=akm7Yovy2kQssN8Z86bX5YH5Oue77nFuX1LT2+fagxnltWDHgeCVAcHEVVKs0wWyQH5z
 Quava4JuxD5lS/yYmWZ4psaYLKu8PMhEdf19EYlbLuOgh4mDige+e0tyG4HpfUrlC+Q+
 muXYGe0a0kZXzSPnf/HO/zRMh1wAPDfoR1wZ+LKIYontTThMlofzxAlK/Z/mpEwN45MB
 7dJG7PPIyxxSlzNkqJIThkzi4mNNhqiq6yQD5yFwdn1gO5INvaUN0H1ZimGSQlvuhHhl
 EcfFyxrNhJkMxHYK8I3UAFYqnXLfn7T7wnvUELT9gQpnLNR18F9VyE4Ol4dg7mi715F2 0w== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxvbxq9dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 01:41:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZ/ciD4guMnd6gihdF4B8FQKbGD5HUwMIdscvGecQOEWC9kYylVJej9ho4oWOJY8K4do+APDP7garSeVGw9Inar3LLSbgOJWjzURWYWC6edtQK+Hfhx0RCxMwihiVFqmajTuklOzm7ZueXCRi7uuC6QrZZ4HmoDyIthpvY5AE/KhJ3AXWxDCYB9qm6IhwAXMhWNUtjTYFNPph9CshUrzmtaPJPyEqtIP4GbyRxPqUgFEl0q0Oz5Nh3DYFYtrGWrDsy+XRO2DJ7KCuvHQNzhGYe50DBH1rwtcPV1RrijzZ7CpTx76+0ekE/qNMvNUfvE8KdnCwlcQWD8JXKZ8iP8Yag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul9DGs2JL7Hgpw/4NoXSakcWGfa/HgWy3fMjmSeLBdU=;
 b=aOPfofpHmSfl+95QAmp8sP0cMd8YjiOBCEeXvFboZgXc4CWBF+z7bexzGcIg6PakyiFxxr2c5GA0Ng69TOfgsBjtk0NcZuIWOSZoWzL3U+6xYaaEXDKhvHyjokDoMgS0pUpYTZSw2FsSvLul7VOdbvPXWeBh+U2ebxkaAO86hswiGVW8E+Eopt8HfXOkkPKpr1+e7XazrGdm9gI3O5g9C/IP44CpeYbwKzMyB0RFiNyy3fYhaNMt9R0mymvobXZqd/fnv41DMJ/hTUIvmFAhE0jKWy4DaW8L5l4dxVqOSn6rz2iNy1ua9Qn2QixR/32VVkqRY5ps6G1s1+gEIRg5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul9DGs2JL7Hgpw/4NoXSakcWGfa/HgWy3fMjmSeLBdU=;
 b=vl2W73dvvuAk8AfHQHHFtX/vEZ3Xo3DcSAy2WQU/mB6LUsSAiWTKpuwipTrSqtyFygUyuswZKhozMKThrBKG9yKpDZFSQdUmw4JNtf6zoSmYx/6W/e3eEWqf62vTE76ixOrfDsYkSCkenVttV/PNsK+YWYAYEdTvQ8vo3GQD0SFQcT2Cq3XnR8Y5NZOpHN6AoVCjubL5s9QAaZqaeC8OvSNUF+uA5aR30IWyZ+mlJLtYzo1oKUjkzk8o/g7tQZCniov9T+TCx8BtmUvYXqGxEfwE15vvj4hcY5cEKrF9jQmHqPlaQUa8KWjmJvMVcQJ+NnIq6+Qz20lJy2967x2lww==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BN0PR02MB8014.namprd02.prod.outlook.com (2603:10b6:408:16d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 09:41:03 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 09:41:03 +0000
Message-ID: <9dc0d121-b808-a6fa-c626-9bd634e61a18@nutanix.com>
Date: Tue, 22 Nov 2022 15:10:53 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/2] io: Add support for MSG_PEEK for socket channel
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
 <20221119093615.158072-4-manish.mishra@nutanix.com>
 <Y3yPoFAo5l/vmB/y@redhat.com>
 <d240734d-8301-ac4f-63de-89e9d2c2174c@nutanix.com>
 <Y3yWkWfyLZXw+dwd@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y3yWkWfyLZXw+dwd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|BN0PR02MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c967b7-8f83-47a2-4031-08dacc6daae0
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O+LWEtswDUk69qiVyOncrITTcojcqLuDcrbKhj+5Eb+TyJRnWTxm4xk4esjEPPCWXP0u0/UjY0+D/pwMO9K4/MLnteyT8Uk9EOYfEI631ksqCdT7ESU8w0zgSnciEA+9y9fL3F7QNaGMQ+/S56TxYzXRBDrvUvRMMr0Z4Hb3kEH+QPzJwszgZdUqVQtGNlx5bD1RogqmnNmLIS9ng+s+viW4Ae+XzqFd4oTOI48J614MiMfJ8MiyaTPVvGsCvH+ZPz9s2rPuexFbOD6zqX5mpBM5U5zMIrsJ6t3U1EGkqPNNhcl5c3vJ+Kos1aTukMhqE0G4jJq6axVxE/AglxcPXhPCFhPPmRDc3dSs8z4UalNo/PxY9T9aboOwRJ/ERYpid/gCUwezwbAvqTt6AC0wAPICDk/iOLQdIOSEKJSi+lSJQ8eLJmztSFggrFUBmZda+a5Xu77Cq7Qj+QxOf+8FP3FBGrN6md94QnNz3mwSo7s4QhQkZUl+sJTpOvqmSlRq/tnXhLWt/PjH0UTT34gLIzlakGnqC90JHIvjfRUEaCpjrWxLPb+N4bDDMbfUButTMxHNNmr4HmEHl7XZuD7h6b1djgIz7OnU9V/jT3DzUV5QGaPyXBfxPvkG6JU4fI59dwAFsrYOPSJN2YkageEnLJ9UdSacZcieoShPP0MdUxAAotMZeNQyZ6UGDKECSioRyPum66lYQ8+wuIPQ3KgIqujElFBoFBQ9JIQAk7rYzXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199015)(41300700001)(8936002)(4326008)(316002)(6916009)(5660300002)(66556008)(66946007)(66476007)(31686004)(8676002)(2906002)(2616005)(478600001)(36756003)(53546011)(6666004)(6512007)(6486002)(6506007)(186003)(26005)(55236004)(38100700002)(31696002)(86362001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9seTJTd2wxTEtuRWFmdXJxSE04Si91S01vVTM3MDJ2RUNuUmxoVTFoNGts?=
 =?utf-8?B?b2lLNlZrak5jd1c5U3JJdlJHWlhneExZU0lKOWlGTlp3N0ZDcjdFZ3JoNjFE?=
 =?utf-8?B?Q1AxZEpsQVdtc2hqVSt6R2g2NTJuUnR6OHA4U0s5NHdWNS9yaEc5bkFZS3dZ?=
 =?utf-8?B?RjlMeHFHYWFOQm5sN3FUaGdjSjF3eUpDb0pzZkRIMTUzSkVyeE52bWNXRElq?=
 =?utf-8?B?MFNHczFKUGVTd281M2JZYU04NXFPVHpzZTg1RWhPcHF0aTZQbFYxVjlkM09G?=
 =?utf-8?B?RU83RFBEdGVlTkgydW5Zd0RIZ25LVm0xdmhGWldjejBoamxtQWVqVytXa2xV?=
 =?utf-8?B?UlkrNVplQkkwVHlOT0tCbnZHZkNLVmNnVno3bVpKMnpkcUZodG9sOEJacTlv?=
 =?utf-8?B?ZkF2VEFZdmZCeUFKdVRiOXc1T1EvYnNORlpNL1hIeWVDNE1nVmhjaDZkNSsv?=
 =?utf-8?B?OGVwakxUUTlsMHNhSkNnMGJkOTVaRDVLV1lVSEZZbGhRNlZZZ3VoejVid1N6?=
 =?utf-8?B?Z0JURGI4Z0ZkcWtELzl5R09BOVhzazJRUEREc1FNTzZIZUlVVTAyOUVBSkdE?=
 =?utf-8?B?QzQ4Mk9aWVZNa0pWYllWNTQwRDJRcnBNZk9sRUE0NHNueEtZYVR1dVRZT1hX?=
 =?utf-8?B?dlFqM3hKZU9UZUtwOGhzV2NuekFQczJ0RnhWUXdueUNtTnBlbzcwOEZacVNH?=
 =?utf-8?B?R0prUlMzSXJJeGVab1NjU3RCcTBFL1hKcmFZUW1ZajV3VFl4dSt3L0F3OTlG?=
 =?utf-8?B?ZmQzZWZqalk2dU5kQTc5QVZsc1JhUmxaN25RZFdOQ1VSY0Q0bWR0emIyck5D?=
 =?utf-8?B?eU04Zjd0WThpQ3JjTlppUnhJcTVMbEVsakttejZ3NzUyaGg3LzdlcExaR2x3?=
 =?utf-8?B?eDR0ZFNpUE5lTmV2QjFQUVRHbUo2UlBJTVNPTFRjTUxRbzMyS2xlSVowejA5?=
 =?utf-8?B?ZFd1UHdxRUMycUdDUFRvY3hJNU9DR1ZmNlpaUjRucnJsR2dZZUpxOW95cFAw?=
 =?utf-8?B?SFJSYkttNWxaYVkyNnlxalRHSDBBemRyWDRoMmFZc2xncmM4NGMwMGVxZ1h6?=
 =?utf-8?B?bHR4Q3hWM2VXczFFY2RybFg3ZzFRWERFeTZLeS81RWlqTklGYytvTkFBa2J1?=
 =?utf-8?B?QjhDNU94T3k2dzVPdWpneXFDbTdsTDdNWS9yOGZGbDdzUzhwK3lWTnhwOS9v?=
 =?utf-8?B?SFRLdWVnZm5VblNxRGtzZ08wQVkzTjNMRjUyY3dCMzZmMGtrNzZzRERuUnAr?=
 =?utf-8?B?Q2doR0tiemZLSjJxNndKY1hoak1hSUxLcVR2U0lsYld6ZXJWSmM4QjI4Snd5?=
 =?utf-8?B?M0xBRDdVWm8yMzRqYVZLYWF4Z3cyVzh0RnJjZkNQYnkyREVnZVJwTUpYa2tr?=
 =?utf-8?B?QSszSDV1cDAyb0hTTnlMZWQ2MUdRN092ZHBiMU80eTFtd1pvcjFsM0pOUTlW?=
 =?utf-8?B?dW1iMVJzR0pVZTlwb1lQV0Q4aHdzd3Z0MmdPTVQySkVXNHE5UXQ0anFIL01x?=
 =?utf-8?B?dXBUNGZjd3pwSFptRWN4QzBYR3k2Yks5K1VSZjVkRUw5YVh3elF0UjZUWG9Q?=
 =?utf-8?B?REEyRUZSOVErbTV0QUd1MDBNOEFJekxldm5zaUEyRU5VVkdDNHpnYmdnRWtk?=
 =?utf-8?B?ampiVGx3SXg5SjlVbUZlZE1ORngza2dhVnY3Zk9sYTY3ajdCeUNua01wSmpy?=
 =?utf-8?B?REJUaStnUzNITFRYam1IWjN3RWpTaEVTcCtMM2FBSEdENEoyTUtQaTV6L3cy?=
 =?utf-8?B?Q25OeFQ0OGpOT2Y0SWNDL2pWUlFYdEptQm56Qno3UmxMMVBLZ0krNUxBRi9r?=
 =?utf-8?B?RjdxdzA5Q3lIazNrc1ZWOXkzWkRMckgxaEhRSk5mWWplTWxSWlcvRGM0VThv?=
 =?utf-8?B?Q0JadkM3ZXdoUkpTM2lGT0xydjJwN2xYKzVnU1B6UnNkbW1PZmx3Sy9mMW41?=
 =?utf-8?B?b1VCdWhNSnhyd3NMblAwWUlncEhBTUdmTXZiRXZZSVd3ancxdHNkN0c0dkpz?=
 =?utf-8?B?b2ViVzBqV0pnWHhzaFhSeTlwZ0dEenQ1eEVGZDVMUTVzRUpEWThHWjBNZXNn?=
 =?utf-8?B?VDB5YWs5Q1VuM2RIMTI4MVQwSFp0NU81YWdYdmZCaHh6bHZ6anZhYWt0bDh3?=
 =?utf-8?B?MFdoS3VjMGY3a3JLdUJ1WmtSV09vUXpUdlFzUHNBWHNOTjRldUNnRWlVaTB4?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c967b7-8f83-47a2-4031-08dacc6daae0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 09:41:03.2607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mPLbHY96AJQwnhO+LPoKTRFi2cMX6Rz0QV9ngIpoiqMVr/Vevt/ISN5ClaX8H6a4B/lwh299JdoPbyGJj9umfhjX7WlWd1OI+trccfJ6CY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8014
X-Proofpoint-GUID: jUk41W-RqmobuUIS7VVbz0pjH9U0snne
X-Proofpoint-ORIG-GUID: jUk41W-RqmobuUIS7VVbz0pjH9U0snne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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


On 22/11/22 2:59 pm, Daniel P. Berrangé wrote:
> On Tue, Nov 22, 2022 at 02:38:53PM +0530, manish.mishra wrote:
>> On 22/11/22 2:30 pm, Daniel P. Berrangé wrote:
>>> On Sat, Nov 19, 2022 at 09:36:14AM +0000, manish.mishra wrote:
>>>> MSG_PEEK reads from the peek of channel, The data is treated as
>>>> unread and the next read shall still return this data. This
>>>> support is currently added only for socket class. Extra parameter
>>>> 'flags' is added to io_readv calls to pass extra read flags like
>>>> MSG_PEEK.
>>>>
>>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
>>>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>>>> ---
>>>>    chardev/char-socket.c               |  4 +-
>>>>    include/io/channel.h                | 83 +++++++++++++++++++++++++++++
>>>>    io/channel-buffer.c                 |  1 +
>>>>    io/channel-command.c                |  1 +
>>>>    io/channel-file.c                   |  1 +
>>>>    io/channel-null.c                   |  1 +
>>>>    io/channel-socket.c                 | 16 +++++-
>>>>    io/channel-tls.c                    |  1 +
>>>>    io/channel-websock.c                |  1 +
>>>>    io/channel.c                        | 73 +++++++++++++++++++++++--
>>>>    migration/channel-block.c           |  1 +
>>>>    scsi/qemu-pr-helper.c               |  2 +-
>>>>    tests/qtest/tpm-emu.c               |  2 +-
>>>>    tests/unit/test-io-channel-socket.c |  1 +
>>>>    util/vhost-user-server.c            |  2 +-
>>>>    15 files changed, 179 insertions(+), 11 deletions(-)
>>>
>>>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>>>> index b76dca9cc1..a06b24766d 100644
>>>> --- a/io/channel-socket.c
>>>> +++ b/io/channel-socket.c
>>>> @@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
>>>>        }
>>>>    #endif /* WIN32 */
>>>> +    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
>>>> +
>>> This covers the incoming server side socket.
>>>
>>> This also needs to be set in outgoing client side socket in
>>> qio_channel_socket_connect_async
>>
>> Yes sorry, i considered only current use-case, but as it is generic one both should be there. Thanks will update it.
>>
>>>> @@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>>>>    }
>>>>    #endif /* WIN32 */
>>>> -
>>>>    #ifdef QEMU_MSG_ZEROCOPY
>>>>    static int qio_channel_socket_flush(QIOChannel *ioc,
>>>>                                        Error **errp)
>>> Please remove this unrelated whitespace change.
>>>
>>>
>>>> @@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>>>>        return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
>>>>    }
>>>> +int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
>>>> +                                   const struct iovec *iov,
>>>> +                                   size_t niov,
>>>> +                                   Error **errp)
>>>> +{
>>>> +   ssize_t len = 0;
>>>> +   ssize_t total = iov_size(iov, niov);
>>>> +
>>>> +   while (len < total) {
>>>> +       len = qio_channel_readv_full(ioc, iov, niov, NULL,
>>>> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
>>>> +
>>>> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
>>>> +            if (qemu_in_coroutine()) {
>>>> +                qio_channel_yield(ioc, G_IO_IN);
>>>> +            } else {
>>>> +                qio_channel_wait(ioc, G_IO_IN);
>>>> +            }
>>>> +            continue;
>>>> +       }
>>>> +       if (len == 0) {
>>>> +           return 0;
>>>> +       }
>>>> +       if (len < 0) {
>>>> +           return -1;
>>>> +       }
>>>> +   }
>>> This will busy wait burning CPU where there is a read > 0 and < total.
>>>
>> Daniel, i could use MSG_WAITALL too if that works but then we will
>> lose opportunity to yield. Or if you have some other idea.
> I fear this is an inherant problem with the idea of using PEEK to
> look at the magic data.
>
> If we actually read the magic bytes off the wire, then we could have
> the same code path for TLS and non-TLS. We would have to modify the
> existing later code paths though to take account of fact that the
> magic was already read by an earlier codepath.
>
> With regards,
> Daniel


sure Daniel, I am happy to drop use of MSG_PEEK, but that way also we have issue with tls for reason we discussed in V2. Is it okay to send a patch with actual read ahead but not for tls case? tls anyway does not have this bug as it does handshake.

Thanks

Manish Mishra


