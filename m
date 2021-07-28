Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F4C3D91B2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 17:20:06 +0200 (CEST)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8lLp-0002XS-IN
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 11:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m8lKl-0001qu-4k
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:18:59 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m8lKj-0001RV-6E
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:18:58 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SFAxXx010178; Wed, 28 Jul 2021 15:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Kvnvp/1weIOtpGbJ6lIzi/ae+UTIo57NfjZdJE8PQso=;
 b=TITVYwPqXsmjSNxnqDEphWI77Q9p8+Q032I1JYj9oiCkb0bPbmw89IDmAYpTgyVNa2j9
 Q3Oxek3T6b1zsFefURGEMxLKNFgYJ7U73O0U/QZgJwONxprnhhwg4VoQ5560Oj2QoJRK
 IwTLCdjzvHB3h6o+3mIwr9KjEfKc2VXGwYLKFEK7xtYD33wY/w9YoxtDYzgn3Iz0Duxh
 q8PWri7Fc1eAx+M51osoAWJ7hFI/jGH95RZzraaFEZ08GqeD3SikCyjdIcd5nMX1eGOe
 Cqq2hXAWby7j0GRdzsomON6/pNBXypo3/yP/fUH6wkgxTt98uO0lV5f4wF0x0GJQIEIa NA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Kvnvp/1weIOtpGbJ6lIzi/ae+UTIo57NfjZdJE8PQso=;
 b=LUi00YRmLI+pE69vnrXgU6rkb74ukYEunftYFhnGQX/N+O6fIrrsU+zLswwXmeyQo7rl
 XsU+5ug4VrBaMEoT/59Gxj9nYw+A+D0Jr/w6sV1wUwU1uHNMjtPUzFZgGPTcI3wu3MDc
 gU5N782dlMeu1qt8ix7X4WpsAOdQrt7UTcQUhUm1vrUz/vkx+NdQwr6gFfNbHP9fAZui
 DxhTZD6/dp6G8W0Z9gFH3VdNoXNA3DvRpPurUgoQhqnc0W4VysNL78Y80yqFsP+qqR8y
 nGZjOUC7dB+8qmX+xQ9rzUSmYixlxKzr91zEynUh2ZJ8t1oJSPAp1DBKnOXoP+KTLWCB Rg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a234n4nw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 15:18:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16SFAq6Z032427;
 Wed, 28 Jul 2021 15:18:54 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by userp3020.oracle.com with ESMTP id 3a234xxbu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 15:18:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDVailmHRvcfHIWoVfFiGMkuT0hK8A6dGbBxGgAJtT8yWaxA/yS2vt2mmQlK9yo0bfXEisWusPFOKPljTTbIIPdD4v0XvCrrkg3f1T8XKyliXHqjLCG7zRecXzGYYJlLx6PD4NlzcbTPd+x48uo2a/sB1Qnz9FH2fB1eBhUINgu5hlWPYk7jyPGXsULAI+8qvcOZ0ncemI0Ph5m0zJmhKwZXSSlr3UOpfcKVxvWp70g69LB9rGixwd1641+SKAfS/T0v8k2R/vqxPsjb2hH9yHvMTGBnj8Y5UJxdqgmH1uqqEcxdwZvagdRA7/Futc8LwqnUjUq40PcDL8n2mJrFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kvnvp/1weIOtpGbJ6lIzi/ae+UTIo57NfjZdJE8PQso=;
 b=PvN7sPJdR7g58U6GIqhrImWvtmVEH78PyTo4ij9PEWW7ItUfQ6Jlx/LU1yLgW3u/igRM2StOXIM9glKBhwPp2jlpG4rKxOmWwgcS+gM0Z7b2L9fMZdsgVfrez53S9rPn2at1ynY59/u2DDYhD7nQ58XkI22eQfxonzUX5TTUrsWkGPfpd7ho6AIDeHUChQ0Rsm19bPWFjsP7la01LCmHDiD0lV9PmiEif8+huZ1ED9smhhRiUUTLIonw3Iri3G5lzD3zLw4okDNsMN4+ZjB4+yt7qQVPP5if2p9lHaQD8awcSOnbNq2pRte/bBpw965wHzFzEI7S9t6vkJI32W0QfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kvnvp/1weIOtpGbJ6lIzi/ae+UTIo57NfjZdJE8PQso=;
 b=czjqStIeKAvmiQSFzWFAnyKn4klQ1Vss2iPW1J7Q033rpDgSDyk1+f1WQjiu7TclwuBuOxo7WT38zPS3fCp/l3LJ2vkkD8nXYyNsssNlf3lWaqxnDQo6Jdvk/y0H0gAHcwhkoUV/obsO4FjUxXKoLCH81hAPtQHiqtYASJ566UQ=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4562.namprd10.prod.outlook.com (2603:10b6:303:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 15:18:52 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5%5]) with mapi id 15.20.4373.020; Wed, 28 Jul 2021
 15:18:51 +0000
Subject: Re: [PATCH v5 06/10] ACPI ERST: build the ACPI ERST table
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-7-git-send-email-eric.devolder@oracle.com>
 <20210720151640.2d682f57@redhat.com>
 <b6e963a3-a5d0-5029-6059-b89d7e16482b@oracle.com>
 <20210726130040.2cb8f717@redhat.com>
 <078e48aa-e6eb-44a8-c60f-7bc5a64c5e1c@oracle.com>
 <20210727140127.3c97ef2f@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <9eea76b3-1c7f-e09a-f787-a2d3c0a1f2ec@oracle.com>
Date: Wed, 28 Jul 2021 10:18:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210727140127.3c97ef2f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0701CA0012.namprd07.prod.outlook.com
 (2603:10b6:803:28::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN4PR0701CA0012.namprd07.prod.outlook.com
 (2603:10b6:803:28::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 15:18:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06992da5-1b34-486c-b34d-08d951db0193
X-MS-TrafficTypeDiagnostic: CO1PR10MB4562:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB45620513495867AFD919A32897EA9@CO1PR10MB4562.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hYY0CikeQJtcIztgBmO14BaNg30E8bAJzY7aEyVNi/PDWQ/Juuc8qsKnXz0igfXwFSddbzRfCcxwX9JXfSB8Ft/IbpMwcTfC17NIid2Gfzvf3cumSCuCqEzKT/KJq+RHU7NEiHO9edCagUAzTcLxg4oKVdoT4AhLcslK7PVCK6eP6EQ/gaDOUCBVeJZ0H2MvCJlCPOJfuzRl2CYwInfPUzPEhwh1Xur3V1cJznj2rK5KPHQ9cP3yA2K+VJMoJsUqIy+wdW/HYAtAW6FOZD4WJvWE+9KWsNZzx6DulFAZMURubaR791dim3EHAAPfOYMNrLdx8D1O3o9nWrGIU3L3Or1vr381qaJGFbeq7xYJUHbDMfMCyuFVuuy5sMhiNAnsGWOx/boJHxxSOPGe4obVqovQAKTyWgLmz2+PLQ0b2e42FBHg3AQcFpxsOF6+vZQRwy35SR2i2JQsZiOczsSy6N3jIPjmjoe6D58Qlp72FgqChw1MVgw9pshYplrFHvd/E53he/NvO82fz+fjo9rZ05wWTnGJr1viQK20DgCs4ruprKBI4LbAK/VK8lK7eLwX44RAbeCwgpOY/bZWrQrFX5I4j1vMFZpEFtA7s8UIWsc537HGxynrRX9o/99hbBSLkogyMosU85MxhEOPa1qqzyBWJqwvA64DHbGdCSQ1Pab54QatRCOjBZTerdXfW83YdPCQM7cA2mUc26UM4vRg7rLDmgTriQxV9Q8F+FAgvws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(366004)(136003)(376002)(8936002)(66476007)(66946007)(38100700002)(6486002)(478600001)(107886003)(6916009)(86362001)(53546011)(4326008)(31696002)(66556008)(316002)(31686004)(186003)(36756003)(8676002)(5660300002)(83380400001)(2906002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkxYalVhWlhNU3JpTVY4WWF6c1JLTDNiZ053L2YzeDlGZ2c5RW40aFNwSkFt?=
 =?utf-8?B?K3lQZ1FRVjN2TEJYR2hFNGFmRHpKZGkwRWQxUVBydzhoRWpTNHVIWWtFNHls?=
 =?utf-8?B?azhyY0VMUnBpRVpLSEUwand3V2xvMmV3c2dZRDNYNUEwbXMvSmM5UFVEOTk2?=
 =?utf-8?B?T3MxZ1FzQ2NneWZVOGhGSHF6YnVNWE5nVTg2OXFrQkNGZEtYMHdUTDJPSFdz?=
 =?utf-8?B?RDRvTUxJazlpdGVPWkFjZ3pNWFpnT3hHMllJR2NHUFpnOE1ERlhYQ3paV09Y?=
 =?utf-8?B?NXRIaTRSRDl1Zzl6REE5TTNSQUlPSURnbnNEWXJBZlRPQUNoVjIzRytONGVG?=
 =?utf-8?B?YlpwUytsd0QxN2tyd2lFYjVsZUFKRVgyK2pKTVlZck13YlQ0cU1Pc2g1TlZw?=
 =?utf-8?B?NWRvSDJURXdWekc0bG5rVXdHQmI2ZVNrQ2drTkRYblVFaWdRTVZHMFVMSUlD?=
 =?utf-8?B?TEhYZ0JQVWYvR2MwRnhGV0g1eEs1NmptRDNIZTdnam90czcwTHBZQUE0K3Jm?=
 =?utf-8?B?dnI1OXI4dUlVc1czT0hhaUJtSnRNMnVML2ZPWjNTSGd4ZmJ6aENpWW1ZMkZF?=
 =?utf-8?B?Z3lxVjZjQ05ZaXZaMk1TcGU2WTEyV1p2L2FsSWNxcTRheGI4YXFIUGdFVjlK?=
 =?utf-8?B?a2F2d3BGTE1pM2JQVzNCOWIxUEE0Qkl2dTVBc2FUbXo1bWc5VlFpY1VMTzlO?=
 =?utf-8?B?QjZPV2VMbmVIa1R0amhrUCt6TzJnUUhTcEVmUVAxaWVUVUZJQUxNZE9VWkh0?=
 =?utf-8?B?eU42SHFQTk12TjJabm05YS9yd1NQYk1VcTlIVmE0QUhoRnkyTnZkTlFNN0ha?=
 =?utf-8?B?OVMzc1NKNFNUajIzdUFETHdmUkNWdk1uMzhEMzVLL0ZNOC9URjJBTlRJZDB6?=
 =?utf-8?B?NERleDlVVUs0R1B1T1F2ZHRRZ0N6WTJUM3A1dkt5eTdYaVZ2ZWU2RytZSUUx?=
 =?utf-8?B?Z1JKR3NoanVDTE9nN1RFVGdnNzdhL1RkeUtKZTk3VnBtYW5RLzhsemFObXJO?=
 =?utf-8?B?VzM0S2VvRHNMd2Fmeng2ZEtlYUx1cUlmOUN0T0pWbDZ4S0Y0dEM1QmUxK2Nx?=
 =?utf-8?B?YlBnK2U5NHA2V0dkNWVXTVhHVVlmR3Z6Rkh4aW1mSnNFeVNFRVZPVkt5enJP?=
 =?utf-8?B?Y1FNTExCTi9yZHB4ZndsSG5jakN6NC80bDd0WXpPODQ5MVNnZmtscjAwTlJw?=
 =?utf-8?B?czhXR3FVN0tvRjdpMEI2NDQyb0tNVjdLRDV5YVlpWjI2UVJla3preWszQ2Ux?=
 =?utf-8?B?cFpOcnNjSUZCbkIrNkw0VHJQaWp6TTBMb0FOM3BzTzJOVmdVU1VDOTNmSTV6?=
 =?utf-8?B?bUk5S2tsUFR3M2VmUG1tdVdWbmdqWHJMc3ROTnc0TElHK1VJbW5jNVd2ZzFt?=
 =?utf-8?B?d3V6eW1HMlN2TThpaGxRNnlDZkpTOUcwUGdYSk4rd0ZweDdSVjViMElNeXhU?=
 =?utf-8?B?QllwTkVweEdxYXljcnZSRkUzUnFIWmhYbjIvQjdhNlg0OWpzZVdIRlZnL29R?=
 =?utf-8?B?MUg3STA5bWxmTXJYOVAvUEVOSjhvaDFRZnlxaDkzcUswMGJ4Qjl2Uld3MHZ0?=
 =?utf-8?B?NmN4azhWTmdqM2EwUlRGN3g1WTArNTQyTVZCMGtvamZLeFE5eXhXZ3FyVkFw?=
 =?utf-8?B?dU85MHcvM0lmcGdqbmt0MVc4V2g4UG5jWEgwSTFOazFuL1U2Z3BCd1ZCODBy?=
 =?utf-8?B?RWJxSmNVZi9CZndNYU1abk5PbzZqWDFZaU5tSXJRSE83dkFzcHgyMlNDZkJm?=
 =?utf-8?B?WHJuQmhRMnhVaVM1L2g3WG8zaVo4UGV2d2k5Yll5SnRQbzdZUkhYZWVRYWZV?=
 =?utf-8?B?UkhZWGdFT2IzRnhWayswdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06992da5-1b34-486c-b34d-08d951db0193
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 15:18:51.7024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1Mr9luOgB9YSR/Y8dXZfydW928Y0XJdOgsxrjHjSi2XqjitCEB0PnyGsys+dB2K7l2BFdM5L3AOlXE7MQBbwXcgKlmx3eA7lcyqm9XkfgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4562
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10059
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280085
X-Proofpoint-ORIG-GUID: MVrIH3YK2bhA49BF2t2Ao8FdncAus_tn
X-Proofpoint-GUID: MVrIH3YK2bhA49BF2t2Ao8FdncAus_tn
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 7/27/21 7:01 AM, Igor Mammedov wrote:
> On Mon, 26 Jul 2021 15:02:55 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
> [...]
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_END_OPERATION:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER      , 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_VALUE , 0, MASK32);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_READ_REGISTER_VALUE , 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_VALUE, 0x01, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>>>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER      , 0, 64,
>>>>>> +                s->bar0 + ERST_CSR_VALUE , 0, MASK64);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_RESERVED:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>>>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>>>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
>>>>>> +            break;
>>>>>> +        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>>>>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>>>>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>>>>>> +        default:
>>>>>> +            build_serialization_instruction_entry(table_data, action,
>>>>>> +                ACPI_ERST_INST_NOOP, 0, 0, 0, action, 0);
>>>>>> +            break;
>>>>>> +        }
> 
> ../../builds/imammedo/qemu/hw/acpi/erst.c: In function ‘build_erst’:
> ../../builds/imammedo/qemu/hw/acpi/erst.c:754:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
>               build_serialization_instruction_entry(table_data, action,
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                   ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                   s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../../builds/imammedo/qemu/hw/acpi/erst.c:757:9: note: here
>           default:
>           ^~~~~~~
> cc1: all warnings being treated as errors

Michael pointed this one out last week, I've since corrected it.

> 
> 
>>>>>> +    }
>>>>>> +    build_header(linker, table_data,
>>>>>> +                 (void *)(table_data->data + erst_start),
>>>>>> +                 "ERST", table_data->len - erst_start,
>>>>>> +                 1, oem_id, oem_table_id);
>>>>>> +}
>>>>>> +
>>>>>> +/*******************************************************************/
>>>>>> +/*******************************************************************/
>>>>>> +
>>>>>>     static const VMStateDescription erst_vmstate  = {
>>>>>>         .name = "acpi-erst",
>>>>>>         .version_id = 1,
>>>>>       
>>>>   
>>>    
>>
> 

