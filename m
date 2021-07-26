Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9F03D67DD
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 22:06:13 +0200 (CEST)
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86rc-00056G-R7
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 16:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86pe-00033y-Pl
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:04:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86pc-0003uV-Cb
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:04:10 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16QK1eIl003092; Mon, 26 Jul 2021 20:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ZR1JbN82hhWbZjn5bYtMGbz8T31JjLJTtGPhUJh38Aw=;
 b=Dyp5cr6bsCN0l5GZNAaXwI9MFUiNhEWftnu1In6nF6c2x1DVk9H/XPtR+4ea8JjwaXY2
 tEewUQl8hVo+tfVyugdkAqYaFcFy3OPtigLH/lhofQR61blrB1pUl2W5PzReq/BhTgk2
 O5fJA8UQNnphfAZfd1a0SlcQhA1iZAdcZAYv9DLnNqjwOGJ7J5Hkh3mATOExMl8Z4qe2
 iS+p6fAvRjXIEJYzYy12mTIbaePbkCvkUGXq29tMDlSsWmrn+gKE6WKO7sxxEJFjl5Nu
 L43BC0wingfAfjMLp8UaUKmXL3B5hKlARPnk91Pl5bXN9aq1SGMgPWI83MKSEfk3Pb4o kg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ZR1JbN82hhWbZjn5bYtMGbz8T31JjLJTtGPhUJh38Aw=;
 b=RSPbR9Vp9ym9AyrbawV5oiPRvVis/m1kTu4NKoZrGEnkFQLR+lqsaKSSI4Uw6YMKq3hB
 D8Z9i6wRcEkxdSqrJ1BCVl1ReqKmNgsDJAQ72KPMPUfeFLEbOYpUPKNj454yRi06RRpf
 HZ9Z9CUtCpKtw0N330JaySUtxxde4XyEcbOHYrSwwzRcKJkugbbuZrpSAegvPLpUWIbR
 7v0sy5S1ewPgIGIbautpKEbiblpuZNTviCweW8S1q4O+57+vqosTAfQTy4vRHOnFNbbw
 UjXVL7OvlLz9P2bZ+ujrVoZMkbcEu9zHOWxRgiPelFPRK1ChK7PaBASV4cz5U5tU/yLi qQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a2356g2us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 20:04:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16QK0n6B104047;
 Mon, 26 Jul 2021 20:04:04 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by userp3030.oracle.com with ESMTP id 3a2351hwqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 20:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEzMZqdG1RUnhvr2dbgx2Xvm4CVUbSje6E0dKxrs+d+dDm1XEUWJM0B7+JlhhF1q2cmqB/EQmGClSA3XCF4CEQrEXD0nZ5Kyx8E6VkGhc+ih7jb/oZY8X7aPLauxgcjBQF0ymN6VVsveJfjC0wrBSbR5WPbeHrtEySey0yzSqG8ZjTA7TuFLp+5ntTOQ8rZ/Ln8h6MVAm+70UH3SZOk8xLNVJ9YYrvyS+dZ0xuzaMAdkQehaHiYuXU/oq4OqehJq8cFmKpmiSS8cljf458a1L2DpZGxzd5NQYPF72haD76p4UFbuoGL5aA0RwdZYIMDiiW3pSgi3RJaKAcefZNuVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR1JbN82hhWbZjn5bYtMGbz8T31JjLJTtGPhUJh38Aw=;
 b=X+3DMlplgpOjU6cGJmVuy4lGk4V8Y/isWgUuHTPR6/n/4XuvrcYQZmxyOBPIdEYaAw+785FAiwP8AiPntlASGfYQpRYvqO/eJE3SnzxCUatvdO4wMYkDMyfNTuKE8+VA/bDhcT/1Br31LevPztiWhmOhbsJsfln8UIQEH8YbVWJOkDCGU2dpVn9+xK+oQcUNOgWxQ7NbnJBSojPJcBF+q/6AdsIbbOWM3fx2qf/XI+EFrT9efaJFUiuc7v/91KAYKvSXpMQ6FtpcCSjNLupa709KSCZ/81n5/KcXv49pMc7IYo+2QrwsTfcvYfxetjJar0J5eRW6O1KaNkK+ua6Zvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR1JbN82hhWbZjn5bYtMGbz8T31JjLJTtGPhUJh38Aw=;
 b=JU91LAU5LPUMZPIbH+dprEQZn/zqxcdyY+DPFRx7Fpf2NEBQ5ZrULcXTMogLuhwoKQ188xuejKx0o3Sutgqt+e3hsnFGO8GOZYYNzeJL+HK3ZehHMDzqQvdVNNvur1pPXson9JCqMfyXvNZaga2D2vED8E8vYy/XYMSnoJjoq+E=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1758.namprd10.prod.outlook.com (2603:10b6:301:9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 20:04:01 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5%4]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 20:04:01 +0000
Subject: Re: [PATCH v5 08/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines.
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-9-git-send-email-eric.devolder@oracle.com>
 <20210720151924.2eb89d31@redhat.com>
 <3916035d-a628-f7e2-44f3-1a724e3d523f@oracle.com>
 <20210726133017.6b0d0031@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <ef4958c3-f3fc-75eb-2da9-701fdd270f60@oracle.com>
Date: Mon, 26 Jul 2021 15:03:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726133017.6b0d0031@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:806:d0::31) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SA0PR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:806:d0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Mon, 26 Jul 2021 20:04:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68ccf9c0-f465-4440-05c7-08d9507082ce
X-MS-TrafficTypeDiagnostic: MWHPR10MB1758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1758641CC135F67DBD908E1E97E89@MWHPR10MB1758.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2fDdIPqjDVkuYLmHzYfwg6OJToz/5KjnebWaSHmpqr8gMVMd+dz69jrVQfnBBG5rW1I2rmtr/Qb7s5Z8MwVZU6rFG/nUWsJvqfuo1nmPoX5XrUtoV+jEJCXmsUo5LgPIpjCVO0xqi7IKrGYxnXCoVIIMGo010oU4ZKufUH/lhrPEC2tUKihL1QENWSdVI89tU7coTZQ45r5rELKC4iw47LVNmYeBNIzTtAGK5kBf+W4c6nuYC/vf4lFPi/89CnwZUCZVnd430SSRunYn9CANTh3FJlwWa0kDkaBgqVy0iQN1mBJfol5F/XmrkWVsUclHfrniVItOCT6CDz16R33f6TsxhswXsKBaY2eVewm+XwyLYW975TW5EZkLKCeEQknQDQIlK4Rn7xg+2esjY2C5HTgy1PT3JpTu7JDBDbPLzUuZoPZj9M20W2CLOxt8hhiqiuFjS9l2qprxePu6Nh6IyTrGSjD7AbANyyjth0ALmt46CvN4wUC/aRg6Z7meeeIi3uuaFojWOrTEMCE1nF1oIF87kIFxJMqYOXm7KNbXTvT0eCn9HBUzMNaVr3TS/xeGXLKr18mmsKtF1OhTTkySBtvt/Ei+/LpJdeu9MXqiPavws7mSV1YdHMDAR30GqPryWETy+WkrZ13uGoHdfJuLQDHiLZFXlC9DXqKm2nQEkXhMBv+zZVj9dJLg0326+3NSU9QCSkbmwXfpdKyuXNXByE9neuXrKONYpTtCnQg8JsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(107886003)(186003)(31696002)(86362001)(4326008)(53546011)(6916009)(31686004)(6486002)(8676002)(2616005)(316002)(66476007)(66946007)(508600001)(5660300002)(8936002)(66556008)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXFOSW43RWF3dCtvbkU5Z2RDNnduWjFZNFlPOXNMcEQ3K1ZISzJUbHlSWGp4?=
 =?utf-8?B?WFVIY2t6d0ROM3RhSHVFOHpPQW4ybExMTEwxbExUYnZXUHdVdmUwSFhvME1t?=
 =?utf-8?B?K2h0djB6c2hVcWhGVkxLRlRMNVcveU1vc2tvMWd4eEQvRUNHaTJiK014TG1L?=
 =?utf-8?B?S3JrVjVrZWdYQmx3OFdBWlUrcThYY0JQUW8xM0N6bll5NWhRSERYb2JUMExV?=
 =?utf-8?B?Y1dRWi9WQUkrZ0gveCt0VG5RM1ZBWGg3ZURHOGdTL1NJYm9hWkRMTFU1MjRY?=
 =?utf-8?B?Sk1RRzR3ZVJNYkxielJJc1lkeGdJYnVHYjlRVTBLVVZxRHIxMTFFS2x3VWVB?=
 =?utf-8?B?cHVHUHlicTU0bDJEaW91NUJkOVVUNWVyYUduYittVC9aaDBnTFh5Sit1dnUy?=
 =?utf-8?B?VVBydXhOd3BwdEE4WlR0SnI1MVdIY3RTWVN6S2YzRUs5ZTE4Q3Vydk5GejJB?=
 =?utf-8?B?UGJvK3N1dUpnelpidjMyMWp1VUkzRDdBMEo0cVhhWVg1aDg2blhiblpIdFB3?=
 =?utf-8?B?VDVqVHhGWUhtVXpudXhIc0RiNm1LWGdKNjh2ZXJxdE9JTWRGVjVyTlppNGNt?=
 =?utf-8?B?OEVJZ3IxNGVrZDNISkhrK2hyYWkrTUVLeFIwYWtZZkNmWnR0VkQ1OE54Ymt6?=
 =?utf-8?B?RWN1WWlpRUhzekE4Z2JHU2Q4L0p3WXQ1WC9BSmt1eXhGMTZDV1JFL1Q2QUJG?=
 =?utf-8?B?Nm41eGxzRys3Q1R3Y1lmT3lxbTlCcXp2WHVTRVpMYWNEZDl2RG9uUStxUEFU?=
 =?utf-8?B?WHJkS3Q5OHBldm1sajIybzVmRlp0UGR2cFJyTU5ZdGVHYzduaXhsQUVNQzF2?=
 =?utf-8?B?YUtPVXlidjE0LzcwcjU1dU82ZDZUNm5ibmxJV1R3eDBUZTM0MHV2VjlOTjZh?=
 =?utf-8?B?QlJRdkoxT3lJa3QzRGNpbTh2dDlDVkNTTWpESUgwSllEZjZGNm1pd2hoOUNo?=
 =?utf-8?B?NlFtVFBwZzA3ZlJFLzB1Vm9UWFhIWTVCUzFzQzhGY0xoQ3VmWlI4YUJxbWxq?=
 =?utf-8?B?ZkFWc2lzczdFTlUyK3JzSkJhdVlSbVBCZVpRdlpESDJkN3dJM29wbGNMeHEz?=
 =?utf-8?B?SEtya2tvQnRoRVFZNVcybUFGVldVaCs0V0VldHJaVmtiU09VK1dmcFpyK2pX?=
 =?utf-8?B?Vm9RZkdlbVFEYkVQQTJ2bUlBaThkNFgrSTBLaTNDVjUxQTlFOS9TZFpVSEE1?=
 =?utf-8?B?WXNML2JoNlJxZHBYZkRGYU5NOCtpZk5lOHE3YlFML1grRXhXQzJBN1BzYmRH?=
 =?utf-8?B?Zkt2cVdZQlkxOHdGZ2h2RitBYURyQ29yR0t4RTF1YmF1R0JxQmRkcDhNNG43?=
 =?utf-8?B?Vk9HdjJHNXJFSTVwR3FXQi9DNlNoQ3VCci8rclhhVWl0TTAyU0xzb1pxQWpz?=
 =?utf-8?B?YXAwVVVLaThqS0Era3ZNcnlDVWlTU1lvK3RwVHJVUGNaNmsvdlUzdDVmZDEz?=
 =?utf-8?B?VmVwMExlMG9lekxXV1YySWxPOHkvOTdNOVVXVFFnVFI0SVBEbE8wbGtGWGRR?=
 =?utf-8?B?RmI3NlR5QVp4Qm9MUDl2WCt3ckUzc0xiZE4xNXdzNUlOZ2V6Rk5scEFJN29Q?=
 =?utf-8?B?MDVwZ1A2K0xHZGw2WkdsdFEzQXN2VlFTME1kNVhYSU5VL3FkVkdqR1YzdCtD?=
 =?utf-8?B?RC8zQTl1cHBkYTRIMEYwZzJmell0cUtuQjF6WElDZXlXL1dVVEhsMmlsY29q?=
 =?utf-8?B?My8rL2xxVTB2cXAvVDMwNTdhSWE2b3hYZWhGUGQvbkNhNi9QTEJScGd1QUhm?=
 =?utf-8?B?S2JoRHhoMDdSL2dsOW03NkM5YW9NRXdIcWFnRHgwODE3VDZPSUR5bWw5eWw5?=
 =?utf-8?B?cjZ1aWFZVVU2VTB2a1JRUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ccf9c0-f465-4440-05c7-08d9507082ce
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 20:04:01.4299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcDXJLOQCnHAe6gaY0UggmBL57nKTD+8fMOalsQMhWMGyCkOuneuiXKb0ruEMBnJAdLEdgZHj9a2GSKauLXB3bZyxwR1eV6980e1CgM+OMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1758
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107260118
X-Proofpoint-ORIG-GUID: cBt-Tvsp9QUD2FYUfMzy4fE1MqB9uuIx
X-Proofpoint-GUID: cBt-Tvsp9QUD2FYUfMzy4fE1MqB9uuIx
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/26/21 6:30 AM, Igor Mammedov wrote:
> On Wed, 21 Jul 2021 11:16:42 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> On 7/20/21 8:19 AM, Igor Mammedov wrote:
>>> On Wed, 30 Jun 2021 15:07:19 -0400
>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>    
>>>> This change exposes ACPI ERST support for x86 guests.
>>>>
>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>> looks good to me, maybe move find_erst_dev() impl. here as well
>>> if it's the patch it's first used.
>>
>> I've followed your previous suggestion of mimicking find_vmgenid_dev(), which
>> declares it in its header file. I've done the same, find_erst_dev() is
>> declared in its header file and used in these files.
> 
> it's fine doing like this but
> it would be easier to follow if this were part of [6/10],
> so that function is introduced and used in the same patch.
Done

> 
> 
>>>    
>>>> ---
>>>>    hw/i386/acpi-build.c   | 9 +++++++++
>>>>    hw/i386/acpi-microvm.c | 9 +++++++++
>>>>    2 files changed, 18 insertions(+)
>>>>
>>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>>> index de98750..d2026cc 100644
>>>> --- a/hw/i386/acpi-build.c
>>>> +++ b/hw/i386/acpi-build.c
>>>> @@ -43,6 +43,7 @@
>>>>    #include "sysemu/tpm.h"
>>>>    #include "hw/acpi/tpm.h"
>>>>    #include "hw/acpi/vmgenid.h"
>>>> +#include "hw/acpi/erst.h"
>>>>    #include "hw/boards.h"
>>>>    #include "sysemu/tpm_backend.h"
>>>>    #include "hw/rtc/mc146818rtc_regs.h"
>>>> @@ -2327,6 +2328,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>>>        GArray *tables_blob = tables->table_data;
>>>>        AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
>>>>        Object *vmgenid_dev;
>>>> +    Object *erst_dev;
>>>>        char *oem_id;
>>>>        char *oem_table_id;
>>>>    
>>>> @@ -2388,6 +2390,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>>>                        ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>>>>                        x86ms->oem_table_id);
>>>>    
>>>> +    erst_dev = find_erst_dev();
>>>> +    if (erst_dev) {
>>>> +        acpi_add_table(table_offsets, tables_blob);
>>>> +        build_erst(tables_blob, tables->linker, erst_dev,
>>>> +                   x86ms->oem_id, x86ms->oem_table_id);
>>>> +    }
>>>> +
>>>>        vmgenid_dev = find_vmgenid_dev();
>>>>        if (vmgenid_dev) {
>>>>            acpi_add_table(table_offsets, tables_blob);
>>>> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
>>>> index ccd3303..0099b13 100644
>>>> --- a/hw/i386/acpi-microvm.c
>>>> +++ b/hw/i386/acpi-microvm.c
>>>> @@ -30,6 +30,7 @@
>>>>    #include "hw/acpi/bios-linker-loader.h"
>>>>    #include "hw/acpi/generic_event_device.h"
>>>>    #include "hw/acpi/utils.h"
>>>> +#include "hw/acpi/erst.h"
>>>>    #include "hw/boards.h"
>>>>    #include "hw/i386/fw_cfg.h"
>>>>    #include "hw/i386/microvm.h"
>>>> @@ -160,6 +161,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>>>>        X86MachineState *x86ms = X86_MACHINE(mms);
>>>>        GArray *table_offsets;
>>>>        GArray *tables_blob = tables->table_data;
>>>> +    Object *erst_dev;
>>>>        unsigned dsdt, xsdt;
>>>>        AcpiFadtData pmfadt = {
>>>>            /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
>>>> @@ -209,6 +211,13 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>>>>                        ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>>>>                        x86ms->oem_table_id);
>>>>    
>>>> +    erst_dev = find_erst_dev();
>>>> +    if (erst_dev) {
>>>> +        acpi_add_table(table_offsets, tables_blob);
>>>> +        build_erst(tables_blob, tables->linker, erst_dev,
>>>> +                   x86ms->oem_id, x86ms->oem_table_id);
>>>> +    }
>>>> +
>>>>        xsdt = tables_blob->len;
>>>>        build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
>>>>                   x86ms->oem_table_id);
>>>    
>>
> 

