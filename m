Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581A3690973
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:02:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ6Xc-0008HJ-Ap; Thu, 09 Feb 2023 08:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ6XS-0008EP-8a
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:00:37 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ6XP-0004GV-Vg
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:00:33 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3199nVNs025450; Thu, 9 Feb 2023 05:00:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=r7PS2wsg9s0rO01RLv23So8Yi1ovdAUKcbU12IbpIh0=;
 b=E8wcSUOwiOyNkY5DJESNGKmDM+GnwZCTwuBsaoGRK3t5ChmJTULW+kGwl+mJGxMtoufR
 cCMUh50LeJguzH3hB+LqXAfRLFpQcOEdYcNL4ytvJfaob7wMS7fnC+nC9aZZ9HIDmsQL
 Kq3HPLuF6j8OW1FcCgE/lCskseRJUKk65fzw73+g+ALJc976xRj6zW3JYkfeXQC/Q6/S
 0XhS90YBWLBPKHrD8ARldc72b9SLEAo9XC77HQp5HRbu01rTDToQp7YIW/3d6J8J0uKy
 1J2Eny1jobyn8epn+wuQm1PpsZeM4vcJisyh/o3OcBnC/uXJlwmDrVicEHZWaoKcIzTj dA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqs6hj2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 05:00:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kF1g1jDttpIrzFN8Dgm+Wz8vKJOdS+U9fdvdBH6oe9b5XGkJbdIJpheIQE5fOxINgNipez/aALOjx1QEuM+FZCp4mB/Z/YtYDY/Nq/iH2Qs9aLAqwDV9n9zf++q2pClrryQdP2mNd+EzXPxJFU/EzF/lfdHYooC9u0a9hXn38kldWOu1C27IZwdsWCFsPj8+XvqOyeNKft6HxF5G4Nn4goSNQN6Fj+z/Qxgj7EwEMyLmFITqafHBVu4faw4Po89153NUCZuUM8SWkdZR7Rf9LmNuMx5LSoIWunwUXmJac8aGP6Dz+8b94BPB3CMxyEzeyE8rwUsK0a2qVCtBUKtHxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7PS2wsg9s0rO01RLv23So8Yi1ovdAUKcbU12IbpIh0=;
 b=kGKi+nYUYNKqH8eOxLkZP7nnza/T02Wwma7Bggrz1WUxyjNwDuIZFSAcSONGAARTO8LiOnOefsdedgZvI+pTzyiPr89rmc141wzI62zOjUA0TIBpeWPHsazKYjlAelCgT5hf3AHosAwxfM6VkC4r+taCwHAuvhVO6x9UI8SKNogAGHfXlHplPpCpR3Pgv6u/V8fIQZhf2tIeuUiDdMA26yBwKCP1TDYQFUUdPmxjkV116kYgu8IOsqaOsb6/KhcoRncQCqY5pMwCLfsEZ7EyLPG251B4hxdGCTDofNb0F/aTxPz5Ht6uC94F+HHCjKFDt6WCoxG7S13dPF4PKK95fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7PS2wsg9s0rO01RLv23So8Yi1ovdAUKcbU12IbpIh0=;
 b=bjYlDTbCwWN/FAc9VfGRKDu2slD+kP8jBGjqNg9mCsIBfawU3probPYb2Tn5jEjGSxn4VWDtBqFOGOkcmNXbC8jsOLiSGZXeQVklB/Jt3od/q2r9eWcW+2LbYLEUYNAEtD5HKFnPVumgceNNvP6skjQYLgTnGIXGz18rwSk1FPIoDu1Aw+LtjGC1MBBAI8YLI5S3LlZeCxPi6IdKbqX7YEj2GynYlZAQpvGLBGuQREyBN5uQH8ncdFDuDZY6LVUC3bawBXw1K3zcSEIi0HU+KeZ52EfgTSfvE/+0p67ElOuRIunw0914oagCUrTP4ZazHGgTzH4N1otMsvuBjn9vuQ==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH7PR02MB9318.namprd02.prod.outlook.com (2603:10b6:510:27d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 13:00:27 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:00:27 +0000
Message-ID: <4cf30601-0cd6-0093-d83b-37da951903f1@nutanix.com>
Date: Thu, 9 Feb 2023 18:30:15 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 manish.mishra@nutanix.com, aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
 <20230208201712.b3a5xtufscrvncqt@redhat.com> <Y+TJr7An261VcVJ/@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+TJr7An261VcVJ/@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::23) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|PH7PR02MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 117af473-6374-440a-10d3-08db0a9d9d20
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ch1yECfpxHUnNenDsTYbEw63PZeL/G5/IqYdGEHtshMkKAMXHnDWyYW/Kwy1mFxTr4r+x8FsdSyuh9MqfVAYAuo8G3lM6hbWn5NZBNar+OSPubiRRzjH/3VgRhS+a1HBtwBRmWSsWnC7gzMxTD74dBKmJ2T1zT3yNsNIgaU1nABkiyNGAP75oE3tx3M+CkAGKlTzjGOAHwwVWoi+h9rJy4JxgPVzVpjsozOB95jkgxKXj8Ft23hP9ttrUy0t30F/Cca5ZGrt2Ay6e8VxQNmEVJU5PqX/EwbX1uwHHsbXqnczIRLU5mheDSy7G2B4yqJ9oBnMV8JR/WHyIbk45ay3Lm5Dh5ly4Bv2HzGHwv3cJLZKPlAeallQburzw5jxTWARTXHIb1xCfqPweM67YJhZ27tsGV+LGN/56B2mR4jy3F4qXyCTF/3W/e8a+a7lUky3IkzYRmA7rHTI79GA+XyAsft8FLIKkVsNg84Vs6Tgc3SowzRvxDblDmTgTVeENaPpJbMdQTYO1omFwcpBbXEkBTvyovrH5B+sP7zU0Gbs0i2/TT2siBv1lEn+gtoRRezMQj3WShI/bcUcFkrvfZSxt32Lb7jmhCy1sPzaTpdPUc1C1Xwl1d19V0R8FbepW8n7vH9qN7MaDxhpXPZRNlGuxp8HtoHImBK57V4+OgY5hxIL9OX8cqW1pZ95x9IvmgvB7fFp8wU3x6b5wJc/QWgxUldY+343oOaBLVQUyAIXgUg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199018)(38100700002)(5660300002)(41300700001)(8936002)(44832011)(4326008)(8676002)(66476007)(66556008)(66946007)(2616005)(31696002)(86362001)(2906002)(478600001)(53546011)(107886003)(6666004)(26005)(6506007)(6512007)(186003)(110136005)(316002)(6486002)(36756003)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzFQbnM2Y1FEa3VqUnNqdE5TQWwvVGx6ZlhtdDB0M0hMZjZhRlBjZ0RvQmhy?=
 =?utf-8?B?MUFGTEVlSUlRN0JpajYzeU9VdHpSbTA4djZLOTVWRThnM2hhb0ZidFE3K2pn?=
 =?utf-8?B?SWZlTll2YXQySElxQ2VRRGMzTldjUmU3dDczcitGb1N2QUg4T3VNYnp4bHQx?=
 =?utf-8?B?RWRYL29nOXdBVHFFOENWVEh0dTRreWxnemlZdmVPQitTTFVkZDBFRnJNQUgr?=
 =?utf-8?B?aE5SZ2tqS2dHS1UxYmFQZTJPUmhEMmFLaVJESkF0TTd5L0YzQnFWODVQdVgr?=
 =?utf-8?B?ZXJjYmNrT2U5UkpmT1Z2TlNROFA4b2R5bmt5dy9LcGtsNFduN3J3OHJkOW9v?=
 =?utf-8?B?RnpEeGJ3aEdEWHRGSnFTeG9NT29WN3RDR0xZanZYdThlQSt0OHJsU2hxYStZ?=
 =?utf-8?B?eTRndno5ZDRZWGdLaGVXd0xTb0dtNEpOZGJZcjY3Q1cvRUJHNXRKcHo0dEEr?=
 =?utf-8?B?aCtFYUd6NW9EZ3kxajcySG4vY1RZZnJuaWo0dkdES21MS0dNcnVCYUVTT2Z4?=
 =?utf-8?B?WUFBRDJwZ05mWTlKcTNYYk00TDVzZlJTcHdVM0J4UktEa1UzUXFjUXVKM1J5?=
 =?utf-8?B?dUtqcWFkL0xuR3ovaFZLUWtRek1ya2Y1aEJqUGtZNFUyVEduS0tmaHYyZkg3?=
 =?utf-8?B?em9PMWNJMlAwQ1VpTzBQeUxCOHVlTDRQQkhsR0FQeVhTeHlHNWFSWGJadzhj?=
 =?utf-8?B?U2tZeWdsUW1IUncvellsVC9weEpJYVk3R0ZLYm9jWVQ1eGxKa1VpY1FkN1ZH?=
 =?utf-8?B?clBOR1grdGdJZVRwVXROL21KOFg1SG5wY0cwSTV4V1pHVUlGZ3FScEhWMkI1?=
 =?utf-8?B?eXlBWTZtdnBOYXJWQ0JQZ1RVWDl3OENzQ2tKZDhqN0Rxa3llRnlPM1FZRHpE?=
 =?utf-8?B?aXVSbThRamZiNUNtU1lLQWFhU3FHUFVvUTRsKzhKK2w2MXRydUxrMWE5cTRa?=
 =?utf-8?B?UUV6c2krVksybmplWVRCRTdrNmVRcUVPYm0zMmxYOHJBK21YaklXYzcwNXdT?=
 =?utf-8?B?S3JCMnBkRXBDM3NySXA0dUZWU2lIdnY4SXd3elAyZmRFVjAwVFdjMUdydm4w?=
 =?utf-8?B?UUJPUGN5czY4NmpzdWxhQStqa1pkU3lQdk1hL2Z1VDFGOGwyaU4zVk1vU0dF?=
 =?utf-8?B?cXQyNlRueFlybzZTTUhSUTlZMnFDVFdPL1lsUmxQdEYybDlHazNhdlk5U1dj?=
 =?utf-8?B?WC9JbzBEQ0crSC9hZkV5NjdFZ0RYbmtOM3BnWVhUVGhFQmFiNXV1WTQxa3U1?=
 =?utf-8?B?WTVHWno3OUU2RUh6emFQUXdUMFJkc3hVOHhER0hlMVhORnZoaHFsb0NqUTVF?=
 =?utf-8?B?bWhCSllrRU5aT003b04zWjlLU3VBVXQ0UmpFVW9vbytrQUlBWFVvTGJ3M0VC?=
 =?utf-8?B?MStrYTh3ZnBCclhNWExFaVJXNFF3LzM1M1dDVUFvSHZ3cnlBU0FjelJoYkxa?=
 =?utf-8?B?NnlrbVF4bXZMRTFkdmdtcmdDWDAraEtiZ2lsOStqWVdNVDFPd0hiRHU5UWFH?=
 =?utf-8?B?T09kSHo1aVUrMjBNbUxYVFFnaFpxNkNoNDZqVCtCRG43b2xYYmtLWG5KZjVr?=
 =?utf-8?B?V0c4NTNoZytIUWU0azE1RHoybkFiVVNhN3I2aFgrNVVnVDdGMEF3Mmo2TFBM?=
 =?utf-8?B?MHZESTcyY3RaZ2dwQjIvenpvS2VXVXlKbDBSQ21XL3FDQ0dtUit2VmtiZTVT?=
 =?utf-8?B?S1ZkUTVQZ2tEcUYxL0U4V0wxanJCZ1RSZTIzMTFrb1E1UUFYZTlaWDZQdTlT?=
 =?utf-8?B?dGRIbXZkNitkSEtPVHRxZjJrck1mcmFlTld2N1RLSVJueFRqWGtQVHNtNEc2?=
 =?utf-8?B?SDl1dWVxamZKdFk0OHVLZnFBMU52ckU0RXI5dlR4WjNpNkROc2dJRzBpSTEx?=
 =?utf-8?B?VTlCWFo5ODFVWkRGeGN0OVF0VThrOTlIUEpIRDFGbG9OLzV1QlNqR0xlR050?=
 =?utf-8?B?bXh5YnIycWYwT2g4YTdHZDVXNEYxTUhvM3pZR1EyQ0xSVkFGdnZ2ZnhMU29m?=
 =?utf-8?B?Z2tXV3FKU3JybUhNdXVEbUdTbGxwbHI3MmpqaVdyd2p5cmkwdHNpNmVXbzNs?=
 =?utf-8?B?dEF5UjF2aWxYUWZ6T241Q1NmT1dNZnVPQ2I1VlRrWWIxVHpuMHZ4dk9GK2ho?=
 =?utf-8?B?eGtKeWVBM1c4SGtmYzVhTWJHT0NEeFQxUjRjN0ptczNySjdIRW5QRHdFQnls?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117af473-6374-440a-10d3-08db0a9d9d20
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:00:26.9699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2iSJ7ELOQcvCOmfUqLMjfDgoAiuSinKmiH1gae0RvIAw/K/x2/lJc0BuC39a3GJ6dD1PA/vRgB8ijvlKhvR2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB9318
X-Proofpoint-ORIG-GUID: vmaP_l8ErDLWr08G8KZbNbzUrveG0ceo
X-Proofpoint-GUID: vmaP_l8ErDLWr08G8KZbNbzUrveG0ceo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_10,2023-02-09_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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


On 09/02/23 3:53 pm, Daniel P. Berrangé wrote:
> On Wed, Feb 08, 2023 at 02:17:12PM -0600, Eric Blake wrote:
>> On Wed, Feb 08, 2023 at 09:35:56AM +0000, Het Gala wrote:
>>> Existing 'migrate' QAPI design enforces transport mechanism, ip address
>>> of destination interface and corresponding port number in the form
>>> of a unified string 'uri' parameter for initiating a migration stream.
>>> This scheme has a significant flaw in it - double encoding of existing
>>> URIs to extract migration info.
>>>
>>> The current patch maps QAPI uri design onto well defined MigrateChannel
>>> struct. This modified QAPI helps in preventing multi-level uri
>>> encodings ('uri' parameter is kept for backward compatibility).
>>>
>>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>> ---
>>>   qapi/migration.json | 131 +++++++++++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 129 insertions(+), 2 deletions(-)
>>>
>>> +
>>> +##
>>> +# @MigrateRdmaAddr:
>>> +#
>>> +# Since 8.0
>>> +##
>>> +{ 'struct': 'MigrateRdmaAddr',
>>> +   'data' : {'data': 'InetSocketAddress' } }
>> ...while these branches supply everything else under 'data'. Also,
>> while you documented @socket-type above, you did not document @data in
>> either of these two types.  [1]
>>
>>> +
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
>> Another example of inconsistent spacing around :.
>>
>> I'm guessing the reason you didn't go with 'socket': 'SocketAddress'
>> is that SocketAddress is itself a discriminated union, and Markus does
>> not yet have the QAPI generator wired up to support one union as a
>> branch of another larger union?  It leads to extra nesting on the wire
>> [2]
> I don't know the backstory on this limitation. Is it something that
> is very difficult to resolve ? I think it is highly desirable to have
> 'socket': 'SocketAddress' here. It would be a shame to introduce this
> better migration API design and then have it complicated by a possibly
> short term limitation of QAPI.
Agree Daniel. Making different struct just because we have a limitation 
for not able to have union as one of the branch of union, would have 
chances of increasing complexity.
> With regards,
> Daniel
Regards,
Het Gala

