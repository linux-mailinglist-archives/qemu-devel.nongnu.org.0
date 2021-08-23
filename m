Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D153F4EF5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:04:42 +0200 (CEST)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDNJ-0005cS-KI
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mIDC5-0005Uk-DN
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:53:06 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:7350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mIDC2-0005g5-RW
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:53:05 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17NEclTq024913;
 Mon, 23 Aug 2021 16:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=9wJGitdTPg4E2WFzWZx2MFrK09grxa1nncKEwUoTKCU=;
 b=Nnz9SxYeswRdTyY3yWP8RsA0eqAkixtwOmuBk5j9DuB6pvtIKy0vsZQ9WIOyB9uCcHI1
 7H4EBUaQxoFgy4xMIRB3EyaJLjPwsG4DkZr4/F4nzGMi2FVabyzwvqDWT8GUvT1G5Wh/
 UWSIJCStkdv96i6M6on31cumDTqORvpOVV+NRMzy9a7RHNTPVVbV75xSpj8F82ksR3LP
 RM4MZWeDQAa64rEYCVWqEEh+ppxlXrUb7pdx9wWrKnOtx7RACNdSp487fXY2MV1OKcBe
 p+HwFYlAk3zpEaXIC3xv/jGoxZ03YBJUwod8JBQ/hJRx0R68iF8DxrLlf/FMRZJHnPZM VA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=9wJGitdTPg4E2WFzWZx2MFrK09grxa1nncKEwUoTKCU=;
 b=Ti7bdicZDIdXFHDMP5mco8BZDd0GtzIRtD1LP6HYQkOHCUz+4P1+1RsHyEvSac7LkGO3
 fXsGKx2qZaaDDOstoBh+YXex3nmhoXL2fJxj2/35WUmPT/dH1IKbTrG2zSt+LXokV5SZ
 cKllXvyOPttyvPfTnJlcptF80NLLG2wxRC6+J0lvyy9l/d7gxlRc6/ryCW0OXur5mRqr
 7lDSb/sLIiQWobYp7HbCSfQV7YjbWgf87iBkvet7PR30uKm/fo45pXq/ahvbrS6W2hi2
 c54jBEEFVupQOx8GvLWillSgx/GwUpr5YuwR0zaCuQOg85mtzn2ukeSVG1+6OvV1pf/A PA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3akwfm2391-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 16:52:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17NGpUCJ180837;
 Mon, 23 Aug 2021 16:52:47 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
 by userp3030.oracle.com with ESMTP id 3ajpkvjf8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 16:52:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/Jk2+Szph1Im+f/EqWe/crLT1LcpS6Xu7s7Jqgo2ZNIDK/HLVwVSn3V8wtngyHRqyJ9DVt0U/Uhh+UAsUiWDlHJTNG10cYiV4gWH7aqj7WHCL/1HBhdZ87kBt4qoil9JKfwThDTsiE8P5lnboWom4tLoOtJyc8SXkbqzgM+TeiV5dv4NjgCQ7Zostqn/gIXnsNNkJnyemynsiziLtxEyjqtaDDebHLbv9HQsB7s6iMpvWuB7i07DbC4xESugaP4cguU3T1IB8znmWwkZYvfm4zD6/aFNozJljkWQR67mEJ1yBQR4NK+Voa+xDBAfRpqEgvQ4/QdvZF+gD5r8OYyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wJGitdTPg4E2WFzWZx2MFrK09grxa1nncKEwUoTKCU=;
 b=ODzhTZeg3gdHRc3mE0Z4UTj8IahkECL4lkduHb8cUh7zGJU8H73uFlZhDSk6cj5brjcubkEkSousJz9FQXRyMJLpSQ7PuG/SjWGmj//T7zoqgTQBUDS8q6K7WRGmoehcPdKrUXHmt+4RtAF/fSvCY+UmTOGZ16NlyK9JB8qd7QlHX62/sW9Qi7GF7/8K5EDh8UXHMy8tGRejxNAfbhRzGt1TPvhHKN75g54wCyOkmOgVmm3+wldYsWivykj5GyO3XoXaNYKJAnF5YMIw/A9lNUphOiW7O8IwgloB4z3yrTaUtoeyRF38BGKFxcUDz0B4NQmfvJkjE6vhR1H4dejNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wJGitdTPg4E2WFzWZx2MFrK09grxa1nncKEwUoTKCU=;
 b=Ex+Bt7Ahnn/WzWmGasE5WUIIbetzLXCM68rzYytokX2jpn9FJiRLmmf9CPM9mjFJOEU5hR1oTnz5WccQEVqD0eWLEmg2J4kr3yyHU67XV7vYeWIhijsgGpVIZ3FUybylrvNvGkrJrNItBIRsWH8wrv5mXSxck1TSte0TpjVb76I=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3939.namprd10.prod.outlook.com (2603:10b6:a03:1f7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Mon, 23 Aug
 2021 16:52:44 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::5cdb:a037:dbd1:dcac]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::5cdb:a037:dbd1:dcac%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 16:52:44 +0000
Subject: Re: [PATCH V6 18/27] vfio-pci: refactor for cpr
To: Alex Williamson <alex.williamson@redhat.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <1628286241-217457-19-git-send-email-steven.sistare@oracle.com>
 <20210810105308.48315c37.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <efd3b212-403f-1743-b685-8b4fb5c15dc1@oracle.com>
Date: Mon, 23 Aug 2021 12:52:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210810105308.48315c37.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.39.217.55] (138.3.201.55) by
 SJ0PR03CA0170.namprd03.prod.outlook.com (2603:10b6:a03:338::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 16:52:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ddbce34-9aa2-4693-eb8b-08d966566d88
X-MS-TrafficTypeDiagnostic: BY5PR10MB3939:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3939C0B239178349D7CD799CF9C49@BY5PR10MB3939.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZzN7qqLxZTHqzDTmYEDPKDdNJo1m/4o9JQ/nr5FyNUIrSmETrHKxqTRcB4QS3pDRL5oRd7CQQ+WvWcoLj2X+xVadL55RE8ABqAhlng8NXD28ZyKHIMZc5z3vNN7iTBbt4JyGDTYvymp9XqLpqkOGcKnl1DG5HWFQ53mcnoFEcDI/cTUP+Skul+Cvnv9g/ZhaNdVXeLdIl1rjhBB3hOgSuJvjI+v+ffYepMjfZA4mQKxi/Y+txdJaw529TurbYVeKqK32uAHR5etZ+5Pu32bmJ5xbrexXmcWkSywFeh7EOo03YNIoLQMUhVjPQGA50xys2p1BLj2llXWCFtEGVQV4LRCm1X8nh11hKN//CDj6lkI6ilLrE7f5tQC2USSleYfWPFO+n5Y7zI0oeVT4ACBJhasX9RC9FGMyHKSSRgTNcFuwV5HAqU70zkwTGLonqzzDkwNpa+XiT2OkfmTgcpafSvv/Cl8NgzTMi0VURQ2u2jYoPL56fjYIRl+o1pM//akIIc80txU2arifgeIKUbmJ3iwzIKp0oMNZfwOs3DTp1kaa6yub+8DcyJGUM6PIMgqXu+5TGXECIWOnaHYEkDpj7rgABNrbLNrWloNE6AC1FLlFZoeBOw0ub9pXNh9c8y3F+7i6YZf7bFqnrM6oUF5XCIdR8kDb5QO2xyHlAlJe2/38B9pSWXHEh0nALhRDHq6NvHJC+Bl4VMrThRRg3Vc91H3ZtKq6ZOtrFU0zNu3wpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(39860400002)(366004)(136003)(4326008)(6666004)(316002)(54906003)(107886003)(16576012)(31686004)(2906002)(2616005)(44832011)(956004)(186003)(8936002)(6486002)(31696002)(8676002)(66946007)(66476007)(6916009)(7416002)(36756003)(5660300002)(478600001)(83380400001)(86362001)(38100700002)(26005)(66556008)(53546011)(36916002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGJXc2FOY1YzZWc2elRNMllwNDBsOG9VK3dvNHAvS2x2cUlnei9EZk8xOExH?=
 =?utf-8?B?cEhISnJNZzBTd29DV1JlWE1qdlV5MGdxMHMrV1ZFeVFLcEpRYkdEeVkvVjJs?=
 =?utf-8?B?NXZicjlqR2ZScFJ6S0NZVmd3THBGK25TRVMzVzU4RFVtYUpJaEZFbnEyWWRz?=
 =?utf-8?B?aFpOcTJNWlpXSzV2MWgydlBFellvOTR6SEFWOXFFR2VBbmQxTEoyZ0NkV20x?=
 =?utf-8?B?dTZQa1gweDJPTnRYL21taUFQT1J5VS9nczlMRE5QWmRPWTVtT3c5ZGFzUnVI?=
 =?utf-8?B?alZpYmZvM2lJNzZ2R0QyMzI1OXNSWk5aUVZ2ZXZJMFE1eE5UUEtvei96ZUZw?=
 =?utf-8?B?SUlYTjJBNEtZUU9iMmtVRnp5UlhZUTZqbWhIWDBldUVsNnVFNUFFanErQU9M?=
 =?utf-8?B?c2R1elZmWFZHWWd5MUM3T2lyMVhqRVRqSzZNOExzb0lvZDZnVXhqL1U4OHQz?=
 =?utf-8?B?UVo0d3JubWUvWnV2UTVZU1gxN3V2UjBkY3RHL0hlZmVqc3ZuZ2pycHY4dDNM?=
 =?utf-8?B?U2NJb1JQa0JTK01kZmNMSVNpRGpiK2RLZWNUWVJkQXlSb0hjT24rKzVCUzAv?=
 =?utf-8?B?dW5KaDVXQnpBTlA4TFhjanVtays0NHdEL2YvWE1OSWpObS9Yci9QR1BJRk1i?=
 =?utf-8?B?clpBZkQ1eEJkMkZDWlVyWWpMM2hReXlUNVFQVnVXWm84amxIcVZyVno2MDB6?=
 =?utf-8?B?WGl6dkJRdWVJZ0lZRHMzT0NJWmVqQ2lmUlowQ1ozbUk4STRqeVBCRzdoeTlC?=
 =?utf-8?B?WStxNG04Zmx1V1VZaVdETG1scEJJU2MrQzRCNUR3ZElFTkkxVE9qK2hoRm13?=
 =?utf-8?B?ajVyQlpuc0d1dkxvalhRSFczRGU3RUNtN1RwNW1xbStDZ3duc0NJd3UyN2VG?=
 =?utf-8?B?QmNWVW5vQjMyYnM5Z1BiaHk1aXF2N3ptNVJoVjJ2ZWorTWw1QnpJQzB2R2py?=
 =?utf-8?B?cG12c2hvZG4xdHkwWUJZdC9ZQ0JvekhNYnZnTTBGMXJNMFZpTU8vS1FCY0V6?=
 =?utf-8?B?SGoyUDkxRVdBNWhLc1ovdUNyNFB2LzErNlI3SlVTRTFscGhZVDd3cVJFNlV1?=
 =?utf-8?B?WnpidEU4cFRyRVJpUXBHU0FoZFczaHphQjZxNmxHb3h4dU5OVnJBeFBybVZa?=
 =?utf-8?B?NWZqYXRqTkRUTjhmSkgwanlaWFIxSnRyR0pqRFFTQXFmUzRueHpOMm5oSUZR?=
 =?utf-8?B?MGxJV1cyZ3NkQWNJL1lsOXZ0OGt0QnZ6WHJPdlJDK3YxQmYyNmw5RmtpUXZl?=
 =?utf-8?B?K045azV4R2lHNitsaTRSQXozMGVVVTFRWDhOUWh1RWp0ZGs3OXNpOFl4ME9z?=
 =?utf-8?B?L3NKblVQc3lOWUNQenk3SDl2NERmQVBidEhPcm5mc2lDazdZODZSZVpIZWJS?=
 =?utf-8?B?TUk1WloxU3VVY1JmeWhnTkhWOGNlVW9lcEE5UHFLSHlNWFh1dVNhWEFKYkk5?=
 =?utf-8?B?K2s0NSs0R3kvWFFpQlZyOEo3Y3B6aHZNeGZuSzVZTWN4N1M0TzUzTUpFK1JE?=
 =?utf-8?B?UXExeEtOUDg4a29sMG9EeWJHZ1VTQ0hIZW4yNzhoUGI2YnUrbEhhS0hnU1hN?=
 =?utf-8?B?YVlhM0V0c00wKzQySzR6T0ZYMGhCOTVvYmlVczJCVTczV0dnQjdrNDFnVFZ3?=
 =?utf-8?B?TkswbUpxYmZ4a2J6b2h5Sy9YY1dVdUd3ek1ZYTlOQTJGTXNqeG1NYjdLTHkw?=
 =?utf-8?B?UHM2SEgyMjhSU1I1UzdjeU9QVnJNUmxoeGREL3E4WU4xNDI0WWhYMUdoVnhv?=
 =?utf-8?Q?nlmvQVwgI/AbHYDoRe66YJof5dZsB8a7eDb3Qtd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddbce34-9aa2-4693-eb8b-08d966566d88
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 16:52:44.2834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHRTogGpYiMcrMxDCfvBekqUUavO3f+odY9srsKtx7mDllto26vQKooAo0VZYCPvXG6LugfjtX9FPYQ9FHaVHbTs5fTdbrwob1oxxjoiH6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3939
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108230115
X-Proofpoint-ORIG-GUID: 7TDQEsYnjbaGYhg_KO5n7f3RZaf86teM
X-Proofpoint-GUID: 7TDQEsYnjbaGYhg_KO5n7f3RZaf86teM
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for reviewing, and sorry for the delayed response, I just returned from vacation.

On 8/10/2021 12:53 PM, Alex Williamson wrote:
> On Fri,  6 Aug 2021 14:43:52 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> Export vfio_address_spaces and vfio_listener_skipped_section.
>> Add optional name arg to vfio_add_kvm_msi_virq.
>> Refactor vector use into a helper vfio_vector_init.
>> All for use by cpr in a subsequent patch.  No functional change.
> 
> Why is the name arg optional?  It seems really inconsistent to me that
> everything other than MSI/X uses this with a name, but MSI/X use NULL
> and in an entirely separate pre-save step we then iterate through all
> the {event,irq}fds to save them.  If we asked for a named notifier,
> shouldn't we go ahead and save it under that name at that time?  ie.
> 
> static int vfio_named_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
>                                     const char *name, int nr)
> {
>     int ret, fd = load_event_fd(vdev, name, nr);
> 
>     if (fd >= 0) {
>         event_notifier_init_fd(e, fd);
>     } else {
>         ret = event_notifier_init(e, 0);
>         if (ret) {
>             return ret;
>         }
>         save_event_fd(vdev, name, nr, e);
>     }
>     return 0;
> }
> 
> Are we not doing this to avoid runtime overhead?

OK, I will delete the pre-save function and align the life-cycle of the fd and the event
notifier. (Currently the vfio-pci code does not call cpr_delete_fd.)

> In the process, maybe we can use more descriptive names than
> "interrupt", ex. "msi" or "msix".

I chose "interrupt" and "kvm_interrupt" to match the names of the corresponding 
VFIOMSIVector fields.  Ditto for intx-interrupt, intx-unmask, err, and req, with
minor differences.

> It also feels a bit forced to me that the entire fd saving uses {name,
> id} but vfio is the only caller that makes use of a non-zero id.
> Should we instead just wrap all the calls from vfio to append the id to
> the name so the common code can just use strcmp()?  Thanks,

I liked the simplification in the vfio code, but I will remove the id if you prefer,
and add g_autoptr and g_strdup_printf to each call site.

- Steve


