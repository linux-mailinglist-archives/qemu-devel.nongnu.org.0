Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682683D0AEF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:03:48 +0200 (CEST)
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m688p-0000Tb-FB
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m684i-0004ZU-N0; Wed, 21 Jul 2021 04:59:32 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m684g-0008Db-2c; Wed, 21 Jul 2021 04:59:32 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16L8uhtc020614; Wed, 21 Jul 2021 08:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Z5ZLB10ES88t8txcU7T6TZPneeoY+/WPY5bJpgVYSXk=;
 b=wpam5ZzqWi0aeMFPJA/cvgBx0FKBtk55JLnEEiAs2ndQwZI3obI1uVEH/vAPCc3aQWAF
 g3wyuwjVNVy2QtJmt0M4EUt8j+saFOHDjwAi2kQ2vgmwGtgmbILOWpTKUmS5Xft7Uivz
 2z2Y65skmRvPBKp7bZrB+JusO4DZk8ekfi5tpoE6SXGS0086zH8zwFvdisa7yQZC3OdO
 nT3wmqhAvPY1PyQgRpSz4fBgVh/mNRbDSOfTmewPLKiCVXZ1uofjkzT1l5EtSwW9nga9
 GpXtET39pDDyjEGGYDza4sM0v6E9yUQ+l1MoCTb+KZzEEvl6LqwoORH3A3m1B48TyT/1 pg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Z5ZLB10ES88t8txcU7T6TZPneeoY+/WPY5bJpgVYSXk=;
 b=XBY4v40kqGjDRkuW8Sw6nnyrddLl52Hh6s5pka5mUzLokDDJUvTk0orpA1+V2sDuLOIR
 99JAmnDNTv8fFo0/BS1tXohRUBNjcsafBqFaxEjLoAUk/BO6RU9SVUFo2dHCon5X9DNh
 GCOUIn1Uk49WHHm2IdlKO/mt7EAQiv5WSGBZaNWJBK5JScU5jwxLhxx4Gjh8hasTJP6j
 OTbj4D0gQI9XAOKjrCg78Vq6AKm6KQ8UT4CyqAUAD5qkmPOb0wH5XkwZX8/6Ul1LRHZ2
 4/elaEX0UYC/60WW+j+knX/+D0uCwJYopBIi3UUevq785EqPGs3mvcUiMLbsKsfEZqKJ ng== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wvr8abx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 08:59:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16L8uVLK084529;
 Wed, 21 Jul 2021 08:59:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by userp3030.oracle.com with ESMTP id 39umb29d6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 08:59:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1EFo3evGMmR07fKnwVAxzq78VGH1xKcMiWIRg1Sx1agxAKAUsQ61fUkggeHgR6nLFmodc/1aC8uVWNZTCjXN4MlnUV1QI6xpmIkO2+EvcCJdioKNr9GZUh/Oxm3Cy1t4YBxXT+Cc5Vheyx1HsNolWRS9V0xKtSZKZm3rGLf51Ssl+dDBaPdJ3YKs0P+5TQXutmfia9kg5UJm2G8xfCEaK+4WCiznjyMudphYyt0SDm6Le9rkFhuUE2Wfwqul8kQnK39mDAVB9/dqbbo0cfS48wRiUUa0WsI7nyRF9iUuSf7YNTAD7TR2Ks+HJTv/ArdDNOgVKfKiqG5ok0/FZu/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5ZLB10ES88t8txcU7T6TZPneeoY+/WPY5bJpgVYSXk=;
 b=JE4uhKCgCGTEyn9LRkNgN3xx6bod8yGBMYJqfN2lUcLG13PbWzz0CxgsCdPemUsqMSSPbM9smbuHU8asbpWIS79Sw7ai2NSseQq/+Uoh6LvqZnapeJGA+2wp40Zh9tYPLgKwp4kP9FHO+a5YhuiMh3aJHIrA9G339J24OihlDBvTylQ6U9x9xN8Y/bsIm4uNa+WgxCAlzQNCb/Cz+k5HobmIGMN2iRNB0hKIedNpVa28YqQxxD6/NmSvZvwUAha8dAbCVUkmBF0wZQtaYMkgWqs4bYquArBoPevJEb0dpQ+QPeQjuPFqks45K5lKC6/2g5/+aViZk2DoR2UfW80pvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5ZLB10ES88t8txcU7T6TZPneeoY+/WPY5bJpgVYSXk=;
 b=SYjdUuhRo6NxCsP/0e1GMqTMHnKPiOc9RNd0pJGV8fedFU0TKpbhY1hmj97lW4TyzwM7y582CMsu9k7iAdD36EE7FatyUqqLAZZOkIANXsIoeRnkN8chc9PIGMEfKtVflF5PbfbwIanf8TuB/m+fP8tni29ATFwQRfaL+g/yIRQ=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4600.namprd10.prod.outlook.com (2603:10b6:510:36::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 08:59:15 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 08:59:15 +0000
Subject: Re: [PATCH v6 4/6] qmp: add QMP command x-debug-virtio-queue-status
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
 <b0c11f6c-31dd-121d-ab27-e83e5afa8596@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <82c4ad5d-c866-9b25-42b0-d1c3a731ed3a@oracle.com>
Date: Wed, 21 Jul 2021 04:59:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b0c11f6c-31dd-121d-ab27-e83e5afa8596@redhat.com>
Content-Type: multipart/alternative;
 boundary="------------BA78602CF17EAC6D3C9773EB"
Content-Language: en-US
X-ClientProxiedBy: SN7PR04CA0087.namprd04.prod.outlook.com
 (2603:10b6:806:121::32) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SN7PR04CA0087.namprd04.prod.outlook.com (2603:10b6:806:121::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 21 Jul 2021 08:59:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8076299d-85e1-45a7-8da4-08d94c25d09b
X-MS-TrafficTypeDiagnostic: PH0PR10MB4600:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB460008A8DDBCFAC8FADBDE72E8E39@PH0PR10MB4600.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4s/RYAEfn8a71/oBhObs+8Ev4alOS8IGX7bWiV5t35gF2O+lk0styUxTrcnqwBAxcVzUxY+7+b0aHj9SjrGTrab5V8Mp3qCD6MQsfJJC2BLSi8a779+3t3C7REqfM+6PoYTjpbxAiLJSNawNa6nnCGY/FPp9giRD6k/+jh7O3cYgqwBPwZQn2HHx+d4yg9LbjEVRczJ8aQyls9q/nYr9XpNnju/mB+jXrb3o/8dIoDptY6+tNR1P2HK1sgpWG4uUoq64ihA2puXjVzvJEl0nNq8eV26AcHm3HQXJb2wr4QRzMZvnScUhesYxOtWrhdC6d4F0usbgM2/kuqFgG+vCCqX4RQrQVNjfIbzoGNy2rWdYmf9OkSUfF6URaJCT9SVL1tIpLxeNJZl5G497rg15DF4s2fmI0MfWFICIG8sQ5skTmTQNoVXa79zhCV61bWicKmnpE3BAdhfc5R4VH+aCQOnzLO7B99Grz1S1E69bfvRiTlpZ7mAQQ1tBEpyq7gJPpFQVWYKfWmKCQBd7M41Pi03Yy1/hJ6xaRUts5Q8wKph57vaqdYauGo7yvigX5pgkGApCGCb8FvHKcm+74TfNa4yR7penDr6PrFQNllKdP/ArBLR8t76urXal3BVFDU2rUy/ILhozksvp4P6OB9vvMo+er7gir7gA7bIujkWFtqt4T9Et0T9prTdsyjI8L+bxY1d01FhivHv7ktiOz8MJsOH1zDQuTFJMlZdafWfbLa8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(396003)(376002)(366004)(346002)(2906002)(66476007)(66556008)(66946007)(31686004)(2616005)(36756003)(956004)(7416002)(44832011)(8936002)(31696002)(6486002)(8676002)(38100700002)(86362001)(30864003)(7696005)(5660300002)(316002)(26005)(107886003)(33964004)(4326008)(186003)(478600001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2x2a3pPZ1QxaEVBTkFHTGx4dldSYmM4S2pMdTBEWTllTElmTGMyaWVKUEMy?=
 =?utf-8?B?a1Q5ZjN5TWhPYkFIaTJKZkZVZEMvcm9lK05LNWdOQWlVMXR0ZnI0SVR4VGNO?=
 =?utf-8?B?SHZnUEMrRkRCNm9EKzJwVXUrM2NNY3luYlJHRGxaV3k5MEkyelRXUGpGTWpo?=
 =?utf-8?B?WHdDYmVyd0hRT211SGtaRmVubzFXM2FtRklMVWNTTXpreGluNUZmRGswSzNN?=
 =?utf-8?B?bzd4bkNxMEhxYnFlVE1LTVRXWEp1NHE4V2RKSm9XU2ZPd3R1ZWZuUDFvbDRN?=
 =?utf-8?B?UFJvVVM3cjNJZU90aGhWYnFaVW1obEh4QWRySGh0cHYxWC9GZG9kbTVCMitk?=
 =?utf-8?B?VmtTcG9jUy9Iazlkc0gxZFV6dXZKRk1HcUhRUytWSFJHMEhoWTdrbHc1SXp0?=
 =?utf-8?B?VFF6ekY5T0hUNk52VFBWblVBcXJXemsyUUYwSTdZaE00ZlkyTmQxMHdFLzM4?=
 =?utf-8?B?Tk0vbjRlcjU2Z1k1OCtMaXhhWGtoaEttM1poMGhYZ1lBNlEydzhtVGZmTWUv?=
 =?utf-8?B?TUZjOTNQYnZHNXZHTU5LYm5sQmRRaE5TNW93ekVKTTJCQmZFY2R0MCsyai93?=
 =?utf-8?B?UXU3WXg4TVhVSTlTTWk2RThEQWVMV1ovOUVNdXVuRk5mblNRQkdZemNpb1Vk?=
 =?utf-8?B?MmxVeGhxUmVXNS9PVVRvUUgya2JVanExR09NZFlvc3AwcWEra3dzMXBBMXQ2?=
 =?utf-8?B?NVZuTFY5Zks3ZXBsS1BTSFJWZ2hoQThSVXl0TEtsSkY2cERSRUZ1djA1cDVX?=
 =?utf-8?B?R1V0TnRXWG5OZU83SEZQWmdoZnMwWGpxaDdoWW1nT05wM2lRRGVvbmVGYUxn?=
 =?utf-8?B?dUU0dUNuc1JtZ0wwcDVYaG8vQThMaHh5NlJyU2JBVktaRWtCd0l3bGlSWFJ6?=
 =?utf-8?B?OTl5NEVKS2VKWXpCM1BISlN5QkpCRmpKVXFBRlh4TXUvclZYcVBoUTcyZE1N?=
 =?utf-8?B?Q2ZSUHFRdFIrZTNsWSswYXR6dERkUkwxYWdXVnZvQXMvQkF6aHpKZmdJdEFa?=
 =?utf-8?B?NlhLUXVIdlo2cVhEc0M5YlV3MnFUelpVU3hlVk03V0hjMjJadXU0SEZSdmxN?=
 =?utf-8?B?Qi9VMDFMYnBWTUJVdXpwSC9ocnpXV2syNzlXZENLaVJiM01vVnVxRkZQc1I3?=
 =?utf-8?B?UXdNaEhNd2owZjBpL01nL095aG9LVGtUVE9RQUZsdkpPazdBaUNEM1g3cWZo?=
 =?utf-8?B?cmo2ZGhLVTdGNXE4cG95ZFhuTEtOZTBjT0dzc0ZVMGVjNSt6b085U2hRbWhU?=
 =?utf-8?B?N0hpTGhmMlE3QzJMOGEzblpyZUtPSUdGcWRodnBlTGVFaEJtcThPM3VRdDB3?=
 =?utf-8?B?aW1xMDhlaTlxb1JLNGNEa1ZxNko2T3pjOHhjNVRSbHF4K2lJNGhKV2Y2SGp3?=
 =?utf-8?B?R1dkeHlNdGIzYzh0VXNiWkVCb0tzN1JHK0ZPR3owdE8yNjA2QkNhbGJsRHdp?=
 =?utf-8?B?VXFsT2NIS3kyM3lqMVNTaTdyWnJ0VldrcFJOckFUR2tyK1poQ21rUVBmeG9a?=
 =?utf-8?B?MXk3ZDF3b3p1RlRqTzE3UVdieU9NSGt5SEdDVmVvNHBIZFNqdWcyeWdwMWdw?=
 =?utf-8?B?RjJtWStwV1YyaHYyRzg4SkdMZDkxMWJCd2tnT0x3R1RZY0JpV3M3Y0UvU2NE?=
 =?utf-8?B?MEtoNTE0WTZkVkw0anhiRDN2cmJFSmlvTE5vYk1yc3RORHJFR21PRC9yUHlt?=
 =?utf-8?B?VG04dUViWUFpWWhCZTRIZE16Q0JUUUg5UG95Q0FrcFRYaVJwNzZCckRVN2R1?=
 =?utf-8?Q?kPbsnr+h+od/eEzLG+JEqpLzRcOXtM4G5nM7zNS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8076299d-85e1-45a7-8da4-08d94c25d09b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 08:59:14.8883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSJBeMyPGsYKsCyOablmx5W39SNd6Qqq0lznVMyHX6mMr3hyIEXkP1BXCHlVh4larzg5EmjfO4Zeqr8G5kWaZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4600
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10051
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210049
X-Proofpoint-GUID: gRrjzTkSFKiHBESgrdaiwGjtOmejbpX8
X-Proofpoint-ORIG-GUID: gRrjzTkSFKiHBESgrdaiwGjtOmejbpX8
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------BA78602CF17EAC6D3C9773EB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/13/21 10:37 PM, Jason Wang wrote:
>
> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>> From: Laurent Vivier <lvivier@redhat.com>
>>
>> This new command shows internal status of a VirtQueue.
>> (vrings and indexes).
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>> ---
>>   hw/virtio/virtio-stub.c |   6 +++
>>   hw/virtio/virtio.c      |  37 ++++++++++++++++++
>>   qapi/virtio.json        | 102 
>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 145 insertions(+)
>>
>>   [Jonah: Added 'device-type' field to VirtQueueStatus and
>>   qmp command x-debug-virtio-queue-status.]
>>
>> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
>> index ddb592f..3c1bf17 100644
>> --- a/hw/virtio/virtio-stub.c
>> +++ b/hw/virtio/virtio-stub.c
>> @@ -17,3 +17,9 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* 
>> path, Error **errp)
>>   {
>>       return qmp_virtio_unsupported(errp);
>>   }
>> +
>> +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
>> +                                                 uint16_t queue, 
>> Error **errp)
>> +{
>> +    return qmp_virtio_unsupported(errp);
>> +}
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 81a0ee8..ccd4371 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -3935,6 +3935,43 @@ static VirtIODevice *virtio_device_find(const 
>> char *path)
>>       return NULL;
>>   }
>>   +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
>> +                                                 uint16_t queue, 
>> Error **errp)
>> +{
>> +    VirtIODevice *vdev;
>> +    VirtQueueStatus *status;
>> +
>> +    vdev = virtio_device_find(path);
>> +    if (vdev == NULL) {
>> +        error_setg(errp, "Path %s is not a VirtIO device", path);
>> +        return NULL;
>> +    }
>> +
>> +    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, 
>> queue)) {
>> +        error_setg(errp, "Invalid virtqueue number %d", queue);
>> +        return NULL;
>> +    }
>> +
>> +    status = g_new0(VirtQueueStatus, 1);
>> +    status->device_type = qapi_enum_parse(&VirtioType_lookup, 
>> vdev->name,
>> +                                          VIRTIO_TYPE_UNKNOWN, NULL);
>> +    status->queue_index = vdev->vq[queue].queue_index;
>> +    status->inuse = vdev->vq[queue].inuse;
>> +    status->vring_num = vdev->vq[queue].vring.num;
>> +    status->vring_num_default = vdev->vq[queue].vring.num_default;
>> +    status->vring_align = vdev->vq[queue].vring.align;
>> +    status->vring_desc = vdev->vq[queue].vring.desc;
>> +    status->vring_avail = vdev->vq[queue].vring.avail;
>> +    status->vring_used = vdev->vq[queue].vring.used;
>> +    status->last_avail_idx = vdev->vq[queue].last_avail_idx;
>
>
> As mentioned in previous versions. We need add vhost support otherwise 
> the value here is wrong.

Got it. I'll add a case to determine if vhost is active for a given device.
So, in the case that vhost is active, should I just not print out the value or would I substitute it with
another value (whatever that might be)? Same question for shadow_avail_idx below as well.

Jonah

>
>
>> +    status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
>
>
> The shadow index is something that is implementation specific e.g in 
> the case of vhost it's kind of meaningless.
>
> Thanks
>
>
>> +    status->used_idx = vdev->vq[queue].used_idx;
>> +    status->signalled_used = vdev->vq[queue].signalled_used;
>> +    status->signalled_used_valid = 
>> vdev->vq[queue].signalled_used_valid;
>> +
>> +    return status;
>> +}
>> +
>>   #define CONVERT_FEATURES(type, map)                \
>>       ({                                           \
>>           type *list = NULL;                         \
>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>> index 78873cd..7007e0c 100644
>> --- a/qapi/virtio.json
>> +++ b/qapi/virtio.json
>> @@ -406,3 +406,105 @@
>>     'data': { 'path': 'str' },
>>     'returns': 'VirtioStatus'
>>   }
>> +
>> +##
>> +# @VirtQueueStatus:
>> +#
>> +# Status of a VirtQueue
>> +#
>> +# @device-type: VirtIO device type
>> +#
>> +# @queue-index: VirtQueue queue_index
>> +#
>> +# @inuse: VirtQueue inuse
>> +#
>> +# @vring-num: VirtQueue vring.num
>> +#
>> +# @vring-num-default: VirtQueue vring.num_default
>> +#
>> +# @vring-align: VirtQueue vring.align
>> +#
>> +# @vring-desc: VirtQueue vring.desc
>> +#
>> +# @vring-avail: VirtQueue vring.avail
>> +#
>> +# @vring-used: VirtQueue vring.used
>> +#
>> +# @last-avail-idx: VirtQueue last_avail_idx
>> +#
>> +# @shadow-avail-idx: VirtQueue shadow_avail_idx
>> +#
>> +# @used-idx: VirtQueue used_idx
>> +#
>> +# @signalled-used: VirtQueue signalled_used
>> +#
>> +# @signalled-used-valid: VirtQueue signalled_used_valid
>> +#
>> +# Since: 6.1
>> +#
>> +##
>> +
>> +{ 'struct': 'VirtQueueStatus',
>> +  'data': {
>> +    'device-type': 'VirtioType',
>> +    'queue-index': 'uint16',
>> +    'inuse': 'uint32',
>> +    'vring-num': 'int',
>> +    'vring-num-default': 'int',
>> +    'vring-align': 'int',
>> +    'vring-desc': 'uint64',
>> +    'vring-avail': 'uint64',
>> +    'vring-used': 'uint64',
>> +    'last-avail-idx': 'uint16',
>> +    'shadow-avail-idx': 'uint16',
>> +    'used-idx': 'uint16',
>> +    'signalled-used': 'uint16',
>> +    'signalled-used-valid': 'uint16'
>> +  }
>> +}
>> +
>> +##
>> +# @x-debug-virtio-queue-status:
>> +#
>> +# Return the status of a given VirtQueue
>> +#
>> +# @path: QOBject path of the VirtIODevice
>> +#
>> +# @queue: queue number to examine
>> +#
>> +# Returns: Status of the VirtQueue
>> +#
>> +# Since: 6.1
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "x-debug-virtio-queue-status",
>> +#      "arguments": {
>> +#          "path": "/machine/peripheral-anon/device[3]/virtio-backend",
>> +#          "queue": 0
>> +#      }
>> +#   }
>> +# <- { "return": {
>> +#      "signalled-used": 373,
>> +#      "inuse": 0,
>> +#      "vring-align": 4096,
>> +#      "vring-desc": 864411648,
>> +#      "signalled-used-valid": 0,
>> +#      "vring-num-default": 256,
>> +#      "vring-avail": 864415744,
>> +#      "queue-index": 0,
>> +#      "last-avail-idx": 373,
>> +#      "vring-used": 864416320,
>> +#      "used-idx": 373,
>> +#      "device-type": "virtio-net",
>> +#      "shadow-avail-idx": 619,
>> +#      "vring-num": 256
>> +#      }
>> +#    }
>> +#
>> +##
>> +
>> +{ 'command': 'x-debug-virtio-queue-status',
>> +  'data': { 'path': 'str', 'queue': 'uint16' },
>> +  'returns': 'VirtQueueStatus'
>> +}
>

--------------BA78602CF17EAC6D3C9773EB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/13/21 10:37 PM, Jason Wang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:b0c11f6c-31dd-121d-ab27-e83e5afa8596@redhat.com">
      <br>
      在 2021/7/12 下午6:35, Jonah Palmer 写道:
      <br>
      <blockquote type="cite">From: Laurent Vivier
        <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
        <br>
        <br>
        This new command shows internal status of a VirtQueue.
        <br>
        (vrings and indexes).
        <br>
        <br>
        Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
        <br>
        Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; hw/virtio/virtio-stub.c |&nbsp;&nbsp; 6 +++
        <br>
        &nbsp; hw/virtio/virtio.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 37 ++++++++++++++++++
        <br>
        &nbsp; qapi/virtio.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 102
        ++++++++++++++++++++++++++++++++++++++++++++++++
        <br>
        &nbsp; 3 files changed, 145 insertions(+)
        <br>
        <br>
        &nbsp; [Jonah: Added 'device-type' field to VirtQueueStatus and
        <br>
        &nbsp; qmp command x-debug-virtio-queue-status.]
        <br>
        <br>
        diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
        <br>
        index ddb592f..3c1bf17 100644
        <br>
        --- a/hw/virtio/virtio-stub.c
        <br>
        +++ b/hw/virtio/virtio-stub.c
        <br>
        @@ -17,3 +17,9 @@ VirtioStatus *qmp_x_debug_virtio_status(const
        char* path, Error **errp)
        <br>
        &nbsp; {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return qmp_virtio_unsupported(errp);
        <br>
        &nbsp; }
        <br>
        +
        <br>
        +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char
        *path,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t
        queue, Error **errp)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; return qmp_virtio_unsupported(errp);
        <br>
        +}
        <br>
        diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
        <br>
        index 81a0ee8..ccd4371 100644
        <br>
        --- a/hw/virtio/virtio.c
        <br>
        +++ b/hw/virtio/virtio.c
        <br>
        @@ -3935,6 +3935,43 @@ static VirtIODevice
        *virtio_device_find(const char *path)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;
        <br>
        &nbsp; }
        <br>
        &nbsp; +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char
        *path,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t
        queue, Error **errp)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; VirtIODevice *vdev;
        <br>
        +&nbsp;&nbsp;&nbsp; VirtQueueStatus *status;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; vdev = virtio_device_find(path);
        <br>
        +&nbsp;&nbsp;&nbsp; if (vdev == NULL) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;Path %s is not a VirtIO device&quot;,
        path);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (queue &gt;= VIRTIO_QUEUE_MAX ||
        !virtio_queue_get_num(vdev, queue)) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;Invalid virtqueue number %d&quot;, queue);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; status = g_new0(VirtQueueStatus, 1);
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;device_type =
        qapi_enum_parse(&amp;VirtioType_lookup, vdev-&gt;name,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VIRTIO_TYPE_UNKNOWN,
        NULL);
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;queue_index = vdev-&gt;vq[queue].queue_index;
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;inuse = vdev-&gt;vq[queue].inuse;
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;vring_num = vdev-&gt;vq[queue].vring.num;
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;vring_num_default =
        vdev-&gt;vq[queue].vring.num_default;
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;vring_align = vdev-&gt;vq[queue].vring.align;
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;vring_desc = vdev-&gt;vq[queue].vring.desc;
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;vring_avail = vdev-&gt;vq[queue].vring.avail;
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;vring_used = vdev-&gt;vq[queue].vring.used;
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;last_avail_idx =
        vdev-&gt;vq[queue].last_avail_idx;
        <br>
      </blockquote>
      <br>
      <br>
      As mentioned in previous versions. We need add vhost support
      otherwise the value here is wrong.
      <br>
    </blockquote>
    <pre>Got it. I'll add a case to determine if vhost is active for a given device. 
So, in the case that vhost is active, should I just not print out the value or would I substitute it with
another value (whatever that might be)? Same question for shadow_avail_idx below as well. 

Jonah
</pre>
    <blockquote type="cite" cite="mid:b0c11f6c-31dd-121d-ab27-e83e5afa8596@redhat.com">
      <br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; status-&gt;shadow_avail_idx =
        vdev-&gt;vq[queue].shadow_avail_idx;
        <br>
      </blockquote>
      <br>
      <br>
      The shadow index is something that is implementation specific e.g
      in the case of vhost it's kind of meaningless.
      <br>
      <br>
      Thanks
      <br>
      <br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; status-&gt;used_idx =
        vdev-&gt;vq[queue].used_idx;
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;signalled_used =
        vdev-&gt;vq[queue].signalled_used;
        <br>
        +&nbsp;&nbsp;&nbsp; status-&gt;signalled_used_valid =
        vdev-&gt;vq[queue].signalled_used_valid;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return status;
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; #define CONVERT_FEATURES(type, map)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ({&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type *list = NULL;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \
        <br>
        diff --git a/qapi/virtio.json b/qapi/virtio.json
        <br>
        index 78873cd..7007e0c 100644
        <br>
        --- a/qapi/virtio.json
        <br>
        +++ b/qapi/virtio.json
        <br>
        @@ -406,3 +406,105 @@
        <br>
        &nbsp;&nbsp;&nbsp; 'data': { 'path': 'str' },
        <br>
        &nbsp;&nbsp;&nbsp; 'returns': 'VirtioStatus'
        <br>
        &nbsp; }
        <br>
        +
        <br>
        +##
        <br>
        +# @VirtQueueStatus:
        <br>
        +#
        <br>
        +# Status of a VirtQueue
        <br>
        +#
        <br>
        +# @device-type: VirtIO device type
        <br>
        +#
        <br>
        +# @queue-index: VirtQueue queue_index
        <br>
        +#
        <br>
        +# @inuse: VirtQueue inuse
        <br>
        +#
        <br>
        +# @vring-num: VirtQueue vring.num
        <br>
        +#
        <br>
        +# @vring-num-default: VirtQueue vring.num_default
        <br>
        +#
        <br>
        +# @vring-align: VirtQueue vring.align
        <br>
        +#
        <br>
        +# @vring-desc: VirtQueue vring.desc
        <br>
        +#
        <br>
        +# @vring-avail: VirtQueue vring.avail
        <br>
        +#
        <br>
        +# @vring-used: VirtQueue vring.used
        <br>
        +#
        <br>
        +# @last-avail-idx: VirtQueue last_avail_idx
        <br>
        +#
        <br>
        +# @shadow-avail-idx: VirtQueue shadow_avail_idx
        <br>
        +#
        <br>
        +# @used-idx: VirtQueue used_idx
        <br>
        +#
        <br>
        +# @signalled-used: VirtQueue signalled_used
        <br>
        +#
        <br>
        +# @signalled-used-valid: VirtQueue signalled_used_valid
        <br>
        +#
        <br>
        +# Since: 6.1
        <br>
        +#
        <br>
        +##
        <br>
        +
        <br>
        +{ 'struct': 'VirtQueueStatus',
        <br>
        +&nbsp; 'data': {
        <br>
        +&nbsp;&nbsp;&nbsp; 'device-type': 'VirtioType',
        <br>
        +&nbsp;&nbsp;&nbsp; 'queue-index': 'uint16',
        <br>
        +&nbsp;&nbsp;&nbsp; 'inuse': 'uint32',
        <br>
        +&nbsp;&nbsp;&nbsp; 'vring-num': 'int',
        <br>
        +&nbsp;&nbsp;&nbsp; 'vring-num-default': 'int',
        <br>
        +&nbsp;&nbsp;&nbsp; 'vring-align': 'int',
        <br>
        +&nbsp;&nbsp;&nbsp; 'vring-desc': 'uint64',
        <br>
        +&nbsp;&nbsp;&nbsp; 'vring-avail': 'uint64',
        <br>
        +&nbsp;&nbsp;&nbsp; 'vring-used': 'uint64',
        <br>
        +&nbsp;&nbsp;&nbsp; 'last-avail-idx': 'uint16',
        <br>
        +&nbsp;&nbsp;&nbsp; 'shadow-avail-idx': 'uint16',
        <br>
        +&nbsp;&nbsp;&nbsp; 'used-idx': 'uint16',
        <br>
        +&nbsp;&nbsp;&nbsp; 'signalled-used': 'uint16',
        <br>
        +&nbsp;&nbsp;&nbsp; 'signalled-used-valid': 'uint16'
        <br>
        +&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        +##
        <br>
        +# @x-debug-virtio-queue-status:
        <br>
        +#
        <br>
        +# Return the status of a given VirtQueue
        <br>
        +#
        <br>
        +# @path: QOBject path of the VirtIODevice
        <br>
        +#
        <br>
        +# @queue: queue number to examine
        <br>
        +#
        <br>
        +# Returns: Status of the VirtQueue
        <br>
        +#
        <br>
        +# Since: 6.1
        <br>
        +#
        <br>
        +# Example:
        <br>
        +#
        <br>
        +# -&gt; { &quot;execute&quot;: &quot;x-debug-virtio-queue-status&quot;,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;arguments&quot;: {
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;:
        &quot;/machine/peripheral-anon/device[3]/virtio-backend&quot;,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;queue&quot;: 0
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +#&nbsp;&nbsp; }
        <br>
        +# &lt;- { &quot;return&quot;: {
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;signalled-used&quot;: 373,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;inuse&quot;: 0,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-align&quot;: 4096,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-desc&quot;: 864411648,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;signalled-used-valid&quot;: 0,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-num-default&quot;: 256,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-avail&quot;: 864415744,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;queue-index&quot;: 0,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;last-avail-idx&quot;: 373,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-used&quot;: 864416320,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;used-idx&quot;: 373,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device-type&quot;: &quot;virtio-net&quot;,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;shadow-avail-idx&quot;: 619,
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-num&quot;: 256
        <br>
        +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +#&nbsp;&nbsp;&nbsp; }
        <br>
        +#
        <br>
        +##
        <br>
        +
        <br>
        +{ 'command': 'x-debug-virtio-queue-status',
        <br>
        +&nbsp; 'data': { 'path': 'str', 'queue': 'uint16' },
        <br>
        +&nbsp; 'returns': 'VirtQueueStatus'
        <br>
        +}
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------BA78602CF17EAC6D3C9773EB--

