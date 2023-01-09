Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE6D661EE8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 08:01:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEm8j-0002Rn-L1; Mon, 09 Jan 2023 02:00:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pEm8h-0002RM-HA
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 02:00:11 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pEm8e-00053M-GT
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 02:00:11 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3096WJQ4021021; Sun, 8 Jan 2023 23:00:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : from : to : cc : references : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=jtBSx7Prd9XCsGGzvhYKR+BgNiKZgJrhR1Ow4RrTRpI=;
 b=egZ2UoO00KrNCNB8hf+lsZgg3R2MU8m2UyngDcwjfwsRP+652yE9uGfxeg0EO+AoPORk
 cOVcjn4rMLcznlAyyWUMEqPO6L2mzct13MHjRaYErwk/qt8qBzriMhUEfceGK03jQ9k+
 +ZsSvJ/J3sjB41TK3e4prgw0b4h5JWHMY1qMM/i3g0mEBkn1huVk6tChvRKDGYWtSQfB
 GCorGDVgfuRtyOPKnDhfQRsFZCT2zjoza9IxQEJokxRz59qqSJmE+208+SHWEZJ1IhQQ
 TQao0A3V48h21L3o+O6iSi2tQWWzVPhkkdPmTkWBmRUsCVnKBH9/Xmd4drehVKES4ggq cA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3my8pp3stt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Jan 2023 23:00:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNOFZ4o4ZQzMfTn/qLb42rEE+e3uhcVuZ1jZQuXG/1d/O1+kns6fYHSAknDv+PjKlz3FjUzbNwW1ZsRZ/5uihe7npJEHON666cuKBt62WMClbw2pU089cJBZUxaXPgS4L+iEXZEhtAKFjjWXC8m0jr67DQkg3W4DFzFrxouCvIRdhVJq3mkoQA6Qgo7ovv1zPeRsEie8F7tleQuFacZpcVsUerA6lV6aq+AsWVp5fgZEbKoRx9PScsqrSZzjCOpQ9nxRUps3Xhwdf/EegdmMdH9NE5c01a26oGTvEU6ZNAKIhkSsSHhi686C7oNvpi1Pc4F67djViOibgwmLKcWFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtBSx7Prd9XCsGGzvhYKR+BgNiKZgJrhR1Ow4RrTRpI=;
 b=kYi778XwZ5/bpmGSMIYQC+jD+zzLgr/JULxrlftY3ipUM8BFaVGjc4rKTQjXjqWk+jzskgUP3Bi5xsB2eV6ahl98Ni7fvNYzRDUolgGPlO8/1hmMGdVD5uCK4SYPqDsNmblg7tf/J6QG3g7zwLOUd9woCgL5xnA0RmzTM4ba+4tdi3wVrVjv2ro8FefT6WGYqVT5qgvgCyvNSt4l4wnJFOnjFhX+wKoeK76XKFAftunnWvsdOfHNQzk5IZDLeJUCiiIYIKXrGC6nc5CiMgIc0ZYbhwNEitNiNHaIiAElHAP3EbFgT5VvmNT+mHwKa6lhrOZdDB2wOon4gR2O+aAWhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtBSx7Prd9XCsGGzvhYKR+BgNiKZgJrhR1Ow4RrTRpI=;
 b=STcjG6qXRd5eDo7XqX526Q7Ai2zsrUh+ohtyxitv6FEcvD8WwSoZKd0fK/ue7eL28ZQ8yUE4EOovpBxM5lIok9uR2z8KNjiN4cLir161ndCrJlXgx8FTzeBmcoU27ZueNpiBQ3Llvv90rql8eAYxAxM8mPNgV28WjMmbISCJnsqy3eMUrriM4RMsrVUwTjTM2tAiQwrFFCdvxtCTI0PbrzQpgx5NJh5ApVThL8M3itaLtD8RgLiSVhUQ6li4oV5JzDB4VE5N4o+UyRLapNmJjaDYL2xnJyw7wSsXVrMs6KuKEc6VZwN+FEr+wEzyKivzmjJ2h7lQyNgJSvGJq6j1nA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CO6PR02MB7603.namprd02.prod.outlook.com (2603:10b6:303:a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 07:00:01 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 07:00:01 +0000
Content-Type: multipart/alternative;
 boundary="------------zAJ85qM3xhVwvs7EGY3BeVZJ"
Message-ID: <f459935b-0a92-9dcd-3d5a-4cd876c9df49@nutanix.com>
Date: Mon, 9 Jan 2023 12:29:49 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/5] migration: Modified 'migrate' QAPI command for
 migration
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <2b4a7c3e-9124-8fea-380b-64a071feb135@nutanix.com>
In-Reply-To: <2b4a7c3e-9124-8fea-380b-64a071feb135@nutanix.com>
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|CO6PR02MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b1841b-1d1e-4dfe-6385-08daf20f2038
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WxS8YVlWCCC0t3ntAx+ThijiOhIUpslcZ6a5fmctYouH9y7WXKsPd3IbR37KwPKAuSdONyMy0EF3NsbP73ZwfSXvKwGluFQ/+eRZxnl8pg2ZIcqiucrahQBqE0YXFmBObcmpnB3eJcHiZkkKyNko1y+SN9j08GX6RZ/vGOsBJYp9a3Uv2y5osAC/bEUzIzljUPFvihOwh8Rol3ntIuc8ouLmuFp+FmVwKm3luHvsfu+pH7MVjr7lXUmqxJauyZMs3U2oug6bgf+j4X3MpNSXGt37m2O8HkUlz3d7xulJPZ/agVI8++KL+bv5ERUW1uYeM9n3/BHgPqOTfxwu2GirKEpIbvFvxPOzW0+ltJihB4c4ift6A7LqLl7t8HoPj7V9rqCffbov+JQy+6gZ2bAjwnJmrfVcoGbblJIezbfYeTuf5ofT6kr56dCbqYI7HAO/PreQ5iWEEJqS8JQAPlnEI97ZIU8Cw0WnBHBKeIkbh0rqe6p6KJrF+p/MxuNcCD/CHJAUM1qECFms0sl0QxNFfDXLEh+MRyZMbVREOZGYXf0cnoWHu4wy1m6b1hvTWNOEVIfScZ8tfs/K9u9dtH6hyJUbr/QuSqwDwOMBTMMc727WEV5FpJ/JchpI1C9NfLbBEWTg4Ex3bgfxYo/IJNKucuEIYJ5Se94+DbB0VICz9R2nvExhCqoS3RCebrLfk6LlXqKQpgf21mqhSsq1H/f2M37LMq1lFaVrlym5khXZFynOaqIuB2V4srToInhJU7BKCtsBSejUPmsMlR0SrAkVAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(366004)(396003)(39850400004)(136003)(451199015)(2906002)(83380400001)(44832011)(54906003)(2616005)(66476007)(66556008)(52116002)(5660300002)(66946007)(26005)(6666004)(107886003)(186003)(53546011)(36756003)(8936002)(33964004)(6506007)(6512007)(478600001)(38350700002)(38100700002)(8676002)(41300700001)(31686004)(86362001)(6916009)(4326008)(6486002)(316002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUpCRDNmSGlJYjZLWE1xZFJVQUNMbW5tVzhwNXRZUENkNURCUmUveTd6RVY3?=
 =?utf-8?B?bFo5VkJKNy9xZTErRWpLdStWQW9Tdy8yaG15TGRmeC8xZEJwbEZ0VkV5YTVy?=
 =?utf-8?B?WEdvNURlcXdrTURHc0I3ZmRNWnlaYmErb0YraXduRUR3RzJLUWtzNlMwS2dH?=
 =?utf-8?B?c0RDeklDa1NTT0s0NGdzS2ordzVXR0gvS1pJbElCM1kzTFMxS0szRC9uRTJL?=
 =?utf-8?B?eEM5QXI2MTNOOW5XZ0tVMk5oMVUvY1lpQnJ1VGoxRnBSdFlqdUNRTUtBeGkv?=
 =?utf-8?B?aURvM0w5OFhFenNMdmpnR0RCUU16bWZERERQWE5zVlM5RU9pNnJ4Q3BrRjFS?=
 =?utf-8?B?bmRVZTlrSkNTVDZlUUo4Q0FaMVFHMlpxcHVrbFg1bzZrNDJQY3RzWG9NaUE2?=
 =?utf-8?B?Z2xkeDh1VkFWRTh2M2dWVUF6UTEyNDM5aEtJcnQrNUQ0aVRlMkI3ZVprbThZ?=
 =?utf-8?B?NERzYlhrZnJFcWFHdWdwaHEzUFc3UVVpdndOMUpLeDQwdVF5MTZsQXdBb01N?=
 =?utf-8?B?azlYNUpkRzFEQ2sxcHZDeEdsbFhJUVBoa0p5Q3NEbjFtWThJVzc4R1p5YVlj?=
 =?utf-8?B?aTdTSDhxb29XL1Rrd1htRHNrZGF2aVRiOFlxdDVzdjZTdHlab0YzVzhCOTVX?=
 =?utf-8?B?aWc2a2F3eTdIRVFaUjVtcWMrdjg5bnFnRXlQMHVEOGlQMkh3aHZ2WjdMNWY2?=
 =?utf-8?B?c1Y2WWF5dmRrM0tCbXp2YVUveXhPdmdOT3lFV25sM3c1U1JnZFNRRmsyWENJ?=
 =?utf-8?B?blBibFp0cVVLYnB1c082MVZVd01LT28zaE1nWmtBRkVXaS9xYW5BcTBpcmRQ?=
 =?utf-8?B?SGpvUWg1UVByTGdPY1NnaTlGTUpQS2dKV2lqamI2UEkzRGp0VC9PUllsa0pn?=
 =?utf-8?B?ZUNYdlp1a3VVVUF0SnRrOTNHZUpISTMyNlBDUktXR1pIakJsbDgyM3dadk1x?=
 =?utf-8?B?Wk1XczRqR2crOTU0UmJPalFnMXp1dFR0QXgzZE1kQUYvSGZ2OXBwM3N3eGlw?=
 =?utf-8?B?ajFpa3F2UDNUNjhXaGR0a1RLd0NVRlFKOFFrdHI0WmkyMllnN0dNWW10dWhT?=
 =?utf-8?B?azVSQXlxNjFpZm01OG5xblpnMVJLTnlBVFNxbGRGeGJ4RkN6c1lDL1AvQmkr?=
 =?utf-8?B?aWU0WWNTMzRac3ZzZ3NIK3NkNnF3Z1dHcVdiaGw1TU1aL0VxL2xRZFF6SmZs?=
 =?utf-8?B?UlVITW9US1VscFNaK2dVQjU1c29YRHdCU3R4aWlIbWtGckNackYzOUprVzJy?=
 =?utf-8?B?SjBvMmdhRkZhcWJGMHV0WGx0UHVpRWFPVU1IdFo1ZzJZTGp1bUJCeFZ4L3BS?=
 =?utf-8?B?NjFSMkpGek9Ya3dLdkNwRDAvdzArZkxDWHgvL0tOQUJXNjRGVE01VDJoWE1H?=
 =?utf-8?B?L1RvcXVtVjVhUGxsUTRLY1BMcHl5cW5uTHd5RlROcDRFOFlvU2IyTWM0b3Br?=
 =?utf-8?B?VTBETFp2SDF1WWQ5bzV4Nm5XZWtVYnpsOUpsOGZLVGwyQjhNRXVjOXc4bXB6?=
 =?utf-8?B?NHJwcU8wdXczdlNkbUhxeDYrUkdua1ZVUXN1TklVL1c4T3l4TjRiUEFzdjY1?=
 =?utf-8?B?ZTJFcXd6dGpqMy9tOHdwM3dLcmhMWDMwRE8zWTlsdnNteEYwVHB2dGJBK0F5?=
 =?utf-8?B?d003eHpRbWJzTk1EM2RDSFdxc2c2SC9yK1dSbzdkcmZHbFBSVVdFTkhzdE9q?=
 =?utf-8?B?VkkrQWVNSmk3Q21WUTArZEVqYlp2bzhtMzFlYWxTZEdrVDNXdFlsWmR2WU13?=
 =?utf-8?B?bUJPZ25JOFFGRmZrUmxGTVpzYWNLdkVEajRvZGZPQjZVc2lwTStHYVl0WG1T?=
 =?utf-8?B?ZFpyMGM3WEViWmpPYnRUeFFSWkNnalZ3ZTMwRzQ1QVlpTmh0cTJzeXQ3dW9N?=
 =?utf-8?B?TTZNTmJMSitoYytTRDhFUWs0ZnZHS0FmL3k4SEw3akZQME9BVXd1cDZidHM0?=
 =?utf-8?B?ZjFrbEJWcmdvNkNIbHdyZjJ2Qlp5c3RiK2pGMnMrU1NzRllINzRqUGEvRXRl?=
 =?utf-8?B?c21BTGZkSjRldjg1UmdqUHVIeXNqZHNpUVNFR01HenFvR0xPQXFpQTZTd0p2?=
 =?utf-8?B?ZjJMU0ZJZWd0TzZWL2NVSVI4ZFFpNmZvWXZsVmdRZW1DaEsvVWNZUkxRWXNF?=
 =?utf-8?Q?b7u/JIvLPIxR1/00L9KXEVEgN?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b1841b-1d1e-4dfe-6385-08daf20f2038
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 07:00:00.9562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLjo/huKDO7QcIWBnqYxSBz+Mj23oYSVetuSFs7miLqueHlpQaHdNLXTUx754W4CvWA2dcR5ePL0ZrQqaR6vLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7603
X-Proofpoint-ORIG-GUID: qeSXrQmx_pWpm7iPzWgM9rwEwu-leXKT
X-Proofpoint-GUID: qeSXrQmx_pWpm7iPzWgM9rwEwu-leXKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_02,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
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

--------------zAJ85qM3xhVwvs7EGY3BeVZJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/01/23 12:48 pm, Het Gala wrote:
>
> On 26/12/22 11:03 am, Het Gala wrote:
>> Current QAPI 'migrate' command design (for initiating a migration
>> stream) contains information regarding different migrate transport 
>> mechanism
>> (tcp / unix / exec), dest-host IP address, and binding port number in 
>> form of
>> a string. Thus the design does seem to have some design issues. Some 
>> of the
>> issues, stated below are:
>>
>> 1. Use of string URIs is a data encoding scheme within a data 
>> encoding scheme.
>>     QEMU code should directly be able to work with the results from 
>> QAPI,
>>     without resorting to do a second level of parsing (eg. 
>> socket_parse()).
>> 2. For features / parameters related to migration, the migration 
>> tunables needs
>>     to be defined and updated upfront. For example, 
>> 'migrate-set-capability'
>>     and 'migrate-set-parameter' is required to enable multifd 
>> capability and
>>     multifd-number of channels respectively. Instead, 
>> 'Multifd-channels' can
>>     directly be represented as a single additional parameter to 
>> 'migrate'
>>     QAPI. 'migrate-set-capability' and 'migrate-set-parameter' 
>> commands could
>>     be used for runtime tunables that need setting after migration 
>> has already
>>     started.
>>
>> The current patchset focuses on solving the first problem of multi-level
>> encoding of URIs. The patch defines 'migrate' command as a QAPI 
>> discriminated
>> union for the various transport backends (like socket, exec and 
>> rdma), and on
>> basis of transport backends, different migration parameters are defined.
>>
>> (uri) string -->  (channel) Channel-type
>>                              Transport-type
>>                              Migration parameters based on transport 
>> type
>
> I hope all of you had nice a lovely christmas :) and wish you all a 
> beautiful new year!!
>
> Just a gentle reminder for patch review.
> This patchset series focuses on the idea of modifying qemu 'migration' 
> QAPI syntax into a well defined data structure.
> Hoping for suggestions and active discussions on the patchset series 
> from all the maintainers.
A gentle reminder once again :)
This patchset could prove to the base of changing wire protocol around 
migration QAPIs. It could help in taking other decisions regarding 
restructuring around live migration code base in future.
Would be glad to have some feedback on the patches from the maintainers. 
Waiting for a positive response from the upstream community.

Regards, Het Gala

--------------zAJ85qM3xhVwvs7EGY3BeVZJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02/01/23 12:48 pm, Het Gala wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2b4a7c3e-9124-8fea-380b-64a071feb135@nutanix.com">
      <br>
      On 26/12/22 11:03 am, Het Gala wrote:
      <br>
      <blockquote type="cite">Current QAPI 'migrate' command design (for
        initiating a migration
        <br>
        stream) contains information regarding different migrate
        transport mechanism
        <br>
        (tcp / unix / exec), dest-host IP address, and binding port
        number in form of
        <br>
        a string. Thus the design does seem to have some design issues.
        Some of the
        <br>
        issues, stated below are:
        <br>
        <br>
        1. Use of string URIs is a data encoding scheme within a data
        encoding scheme.
        <br>
        &nbsp;&nbsp;&nbsp; QEMU code should directly be able to work with the results
        from QAPI,
        <br>
        &nbsp;&nbsp;&nbsp; without resorting to do a second level of parsing (eg.
        socket_parse()).
        <br>
        2. For features / parameters related to migration, the migration
        tunables needs
        <br>
        &nbsp;&nbsp;&nbsp; to be defined and updated upfront. For example,
        'migrate-set-capability'
        <br>
        &nbsp;&nbsp;&nbsp; and 'migrate-set-parameter' is required to enable multifd
        capability and
        <br>
        &nbsp;&nbsp;&nbsp; multifd-number of channels respectively. Instead,
        'Multifd-channels' can
        <br>
        &nbsp;&nbsp;&nbsp; directly be represented as a single additional parameter to
        'migrate'
        <br>
        &nbsp;&nbsp;&nbsp; QAPI. 'migrate-set-capability' and 'migrate-set-parameter'
        commands could
        <br>
        &nbsp;&nbsp;&nbsp; be used for runtime tunables that need setting after
        migration has already
        <br>
        &nbsp;&nbsp;&nbsp; started.
        <br>
        <br>
        The current patchset focuses on solving the first problem of
        multi-level
        <br>
        encoding of URIs. The patch defines 'migrate' command as a QAPI
        discriminated
        <br>
        union for the various transport backends (like socket, exec and
        rdma), and on
        <br>
        basis of transport backends, different migration parameters are
        defined.
        <br>
        <br>
        (uri) string --&gt;&nbsp; (channel) Channel-type
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Transport-type
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Migration parameters based on
        transport type
        <br>
      </blockquote>
      <br>
      I hope all of you had nice a lovely christmas :) and wish you all
      a beautiful new year!!
      <br>
      <br>
      Just a gentle reminder for patch review.
      <br>
      This patchset series focuses on the idea of modifying qemu
      'migration' QAPI syntax into a well defined data structure.
      <br>
      Hoping for suggestions and active discussions on the patchset
      series from all the maintainers.
      <br>
      <pre>
</pre>
    </blockquote>
    A gentle reminder once again :)<br>
    This patchset could prove to the base of changing wire protocol
    around migration QAPIs. It could help in taking other decisions
    regarding restructuring around live migration code base in future.<br>
    Would be glad to have some feedback on the patches from the
    maintainers. Waiting for a positive response from the upstream
    community.
    <p>Regards, Het Gala<br>
    </p>
  </body>
</html>

--------------zAJ85qM3xhVwvs7EGY3BeVZJ--

