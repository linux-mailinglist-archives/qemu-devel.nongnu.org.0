Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5503D67D2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 22:03:15 +0200 (CEST)
Received: from localhost ([::1]:54356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86ok-0000Ju-8o
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 16:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86my-0006yj-LU
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:01:24 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86ms-00023y-R3
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:01:24 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16QK1AwD031384; Mon, 26 Jul 2021 20:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=svTv2/79yURVLxDnfEn4Op7y2MlxZlQu+krudoktn0w=;
 b=qlvDzIVkyfs2J9vdzoiZdzGfXlxHKgxN12+BSpdT7h0wMNhPMH4vvmyDAKskGf7OYhD+
 LJFj/5La+4CJAxUzcmGRyksTxLu/szurlgYDL+jRAMSbRFdIYbTW0JI6dUc2FOxwXI4Y
 JH5tJ0hR+R2Okme+dk1kRuE3lPXEMGgIiYlZBJvI8JZ1DHzkZQl+gqKhFx9nPLSXuCFj
 TF2hJfWAihlgyesAvwoA12zx11XSxJo6gTw3XeMXeqEGFeDZ5Jb5j2tUi1f2z0qVA78D
 /wn2splxOghzI1HtfsVD3prYGwr9A/vAa6rhdBk1k79Vyj7dodjyai+QgNJcEr7L7B67 zg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=svTv2/79yURVLxDnfEn4Op7y2MlxZlQu+krudoktn0w=;
 b=SP+dKikq4FDncHRhlLkfAzaq0XH6JjOu5Z8gR+5/AN7I6pffExnf9cyKTosqiPrk4F1n
 mo7k3jA6uhkOm4F9DWbDpwyWBIOillcM2EOfrhVtyWAAv6H/1Sd/layqMaZOoIJZnaCk
 iwVmOfaWczT1E8CtfLylP/Y0L21SDipM0SbbmQVndd2TJeSz1jqirXPpC7ozlPotWhBC
 VD7+NduBBSr7EIfKiI79aGam/J0u2rK3+xRYydAm2c7q+QJeFekEmIVGv0izAkoJcQ5S
 nV2z3i7WUfeswUAcvWZqEzShMmBC54PW8WRFqtt6nu0U1W3EzrlSJ/Ldbq9iBSXq6IAa WQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a234w02sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 20:01:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16QK0gOE022573;
 Mon, 26 Jul 2021 20:01:12 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by userp3020.oracle.com with ESMTP id 3a234u1ndq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 20:01:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQ8PqIUHaHPpFkuAMX5TU0fE4iUn/3/6eYnqsgNMgJTxXHCFS6OWtwn06YRQn2XfHbaOkzVRslz9WVuWGnGW9PWwGzqOheOCzEX9yoKzARFhpm388GGYqS3UxC0DNPmpNLzUfJ3X4q+4xEHJXCKIRD24AKwkRIgTQbTFtJwW1DcdJQ/kmWTbeumqYoHVMfiu3Djqh9LWdRBmHrppP+tuVfrFDunXwu2GPQjdSfDOOP4DUTV2b98bpddmrH4qaGTV5QviWnP0dDqS4iZEPPCgSQc3ZmihPLeIExrfkyNeMnDPplgqfPVCn82kyf25d6kUzsBUVgxYL03joaP1QhdylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svTv2/79yURVLxDnfEn4Op7y2MlxZlQu+krudoktn0w=;
 b=fPBIOQXIjOQxQpZ57YbkPNorOxZisWGJC1Oe8WasDWCWpozY/YM0q9hEVQsK/nIlA+QwOWxS1ee0Y+IXfOmVFluTBYrvX3J+/0WHEo6F0DRiJZca5tjeaVHbfUJ2aQza0+Hi0bamGpZVNAwQhzGhM2ZcHQ/sr0bd1Tvybtt4Fm3t3+15qWCcXz1ZNPgLKeqQfNHTDhYTHq40XlCpERRg5/Yp53wsfgMb2Tok+FuvbsONSI1COn8Yj7c9viCXWpusJ9eb95Vsi/YMgsuCySoT7DrbAWH+HqlNBxBh+lslxd6K3rUv+Z8AId0PJRQpSn39hPsBvrTEnfCa3l58TiUGTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svTv2/79yURVLxDnfEn4Op7y2MlxZlQu+krudoktn0w=;
 b=a0IQD90hpQLe/m5M1kuvtcbzx81ieVMUZPGjU9byTPr76/SDVV3YZ7XSXFW4i/4kDh2td4/qlfUUiLcPcnZThgUX813RrZE/2iT9tqi0BRLmsrKnQH6Q3D6y0zKq/FJIW+bPk+SJIuXcAl2EZFvFqsSR8hM6L1sNaoJdnfG28VU=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4612.namprd10.prod.outlook.com (2603:10b6:303:9b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 20:01:09 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5%4]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 20:01:09 +0000
Subject: Re: [PATCH v5 05/10] ACPI ERST: support for ACPI ERST feature
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-6-git-send-email-eric.devolder@oracle.com>
 <20210720141704.381734cc@redhat.com>
 <0a09250e-4347-0ad6-d95c-0bfd2094b98b@oracle.com>
 <20210726124213.58b0e557@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <6d450e75-3355-1552-7b27-0966f3a18b9a@oracle.com>
Date: Mon, 26 Jul 2021 15:01:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726124213.58b0e557@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:806:d3::31) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SA0PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:806:d3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Mon, 26 Jul 2021 20:01:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0e022eb-2ccf-4d5a-23ce-08d950701c4a
X-MS-TrafficTypeDiagnostic: CO1PR10MB4612:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB46121E3F836E60F248BB9D7997E89@CO1PR10MB4612.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGDoK/LoJkCNOgKKRRUstF4W3inQqeyHl/5rvnJv4AGm3phJgIldWKyPZr6G2Clb+EPvdQNV5F/G2s1T3o/e5GngZs6p2OvPABkfwVH5RdWUS7pvFCOq0xvJqlwD3ojPlKSOIO3LN84/ER4BPtxTesNqlXjG7KhHL6QabJSjdv1xApV0LQkq93cXIux+iiHCC9ayh/7/mawGRRmH2UvSfjQ1klwV4vFftO7kQkqjeKFl3YGAexLmzWp2CbtRPT/h1EvkRshIVWoFBmaaH2EAsRAs/cpkubMxrCgO4rsJPyAMEqqkdZy2Ix2qHlT38C2Vi09bYG57MLufWgBPapjK/HR/VgpsAruKZ1LrrLhEblIqCbWvDd5Iy8M3Rom1u+fnDJ06Oew+kFCBhMOVDNOJ9/HejWbE+cWONy+XbPg1l0++M/gzfK//yGr6Zg2sAGxTYmRMMuwo8Feq24kFxKzlPMjonKK5o7wnrjOZVeIFFI//biQvuqRJ6jSAcycF7lnvbH2XhqDRoRzEJVjO8qPlPIThnj6Jhv4dt5RLQRrlVKm47JX0nSjtSMXJT/WGbxnxAb5jKq8IaYNZkUfAjsOI0w6iecIU8Rqv/Oam9z8tejcseZVKxt4WIM/DBltw4Euoko7iywU3QV2ygRhjg7apXjRfeLISJWX3zkqFAxabgqzdVavfccReqrBmVtttJY3+V8XUiQ+GMje/+eiRldfSug6WxHbC+6QNG73TrA9yqQ3NnBSjjxvCS4v4UoqGBG2rjwsNb8RnVC0dk1YTzQt7zQNEtSCfeRWRLHTqR6XIM+GMhRBJIpJdTqlT8w4LwSOFD13H7iVS1EcwoGmoDFfLQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(346002)(39860400002)(366004)(316002)(2616005)(53546011)(36756003)(30864003)(5660300002)(31696002)(478600001)(86362001)(8936002)(2906002)(8676002)(83380400001)(66946007)(6916009)(107886003)(66556008)(66476007)(4326008)(6486002)(186003)(38100700002)(31686004)(2004002)(43740500002)(45980500001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDFacVVhUExMak5QUUFzY1dvci9LeFRZMWl5WXFtVHFVUDM5YlFEalB0ampy?=
 =?utf-8?B?L214TG1Xazc4emxjVysyd1g2K0VZWUdnTkg1aGNFWkQyMUtrWFZJSG5acDhj?=
 =?utf-8?B?OU8xdW9vL0Q0bnZ4RmcyWjhyMkZHeGIwOTJWR2V0NzhhUTg4Z1lGUmlRNnRH?=
 =?utf-8?B?aVBUMUFBT1VNRUpTUFpUVWJwM0tuZjF0MThVaThQMUVkaFlhM1o3L1k0NG9l?=
 =?utf-8?B?K1BVOWxTaDFPeE9VU0UzMHQ0MjFsQStXRXpZMjNBb29BUEszZFhpVkZTYU9U?=
 =?utf-8?B?elVibkJnY3F0eWVVaEk2elhjb0QrQlFDejRoZmVWQ05wclVQbUFKRjR3SUYv?=
 =?utf-8?B?dmJSV3k3Und0Szk4b2NhNnA1YTZtd1dWNDRjQldVTXMyZWtFKzZPTlZpbWp6?=
 =?utf-8?B?MmlRSGZERGV1eUNRTjhMVHdka2JDbmt5cnZLMWpUbVlWL2R6VFY3K3Qzd0dz?=
 =?utf-8?B?YUpDNFpDUmZvMmJvU21SUW9IK0s2c2lhbjZuR2U3b3duZjNwaWRUTEczMWtW?=
 =?utf-8?B?QjlNN3Z2WVJHU0VhTkFvdm1nNHNnMEMveXhmdEpCUGRsMXhjaGplY1E1bzVz?=
 =?utf-8?B?S3NqZVdWbGowU0ErLzdjTCs4L1R6U0lrWHdMTGtsNkVLallBYmExRDIzeDhp?=
 =?utf-8?B?alZsZjhQcHhTbFNRU0dEZEhkcktKZkVnQjUyTTZsZ2MwbHVvdWc4dWJ3REc4?=
 =?utf-8?B?NGVuWHhhVUxYcGoxSDlxNG84amxMbXF4ZThuZmRIdU1tZVFYWWlWWGNUajJG?=
 =?utf-8?B?MitOR0l5VVhiQ0szMEJVOWtmSTJnVlQ2UWR4T1g5a1M2UHlKV25WTWdGR21G?=
 =?utf-8?B?Wk9FOWtaUkJMeDNHK3NxS00zelVQWXVXcmdYZnNveDRxMGl1bjdvUGNSQ0R2?=
 =?utf-8?B?azNsYkJsOUJNV0cxNkZZUWg2bmdxOG5KRmhUYXJYUVM5TUt0L2ZvUkcvbEh2?=
 =?utf-8?B?UURzZTZ1VXhTUUE1M1hwVzZXUTI1MmhlL1VrdnJ2QkxQeGdWWkF6YVl6QUNT?=
 =?utf-8?B?Wk8wS1NaTDFocmdwYnBtUHVEczgvUkZGNUg3TDFMWDIxWGVtZEtkaC9yQjFr?=
 =?utf-8?B?LzdzaGcxcTFDQ1lRWW1qdFFCU3NCdzdGTkhzTjFaZExTZm94NkZQR3gwMUQx?=
 =?utf-8?B?N0VNWUY4TE5DbGJrZnlUa3JUWVkrZUg4bWpXTE9QaTVnVlY2dnNmUkZ1QzFR?=
 =?utf-8?B?eVc4VzErZTVKN3h2U29vdWpDU05PdjZRMlpGbG9TRjEzeFpJY3JhbWl5OWVS?=
 =?utf-8?B?ZXJ6QW1LR1d4M2VBSnpad0ozQmMrTVpGS0NZOVFQMDl6M2JDTGtVZHp5RHpM?=
 =?utf-8?B?MGJlNVN1UXRSSEhoTzV5Y0JmSWRrYTFVa2dib0Z3dmN5T2tBN0VwVDlxQWFS?=
 =?utf-8?B?QWdiUTJkSWdheUJwQzZpbHJDWGlIdndMK3pSMTUyQ0xMUlJ2MzlpZWJ0Umt0?=
 =?utf-8?B?T1VjbDl3Nmc1RlBNVkpLUTBkSXhsNTFVU0c5ZE5FY1dDdERuR2RRd054eU52?=
 =?utf-8?B?alhqVDZFUUhpUXZFSnVsT3NCZ2tkTk5SS0h0QUthMlM3OE5tcmtsZ0d3NHYz?=
 =?utf-8?B?R2JxZGF2TXpuSzZZRnY5WUIwU0lNVERBNE14VnVtRFZnaHhjZlZjOEszR3Jl?=
 =?utf-8?B?eWhFYWkwT2ZJdUdOR0N3MHNtaVQrWExrR1hhVUF3VVdSWXN3dXNYM28zRUZr?=
 =?utf-8?B?UHVQajg2Uk41YXFnZ0tFWDNLcGhVMXRlNHpKYlhiczE0QTVqeU9WUmJrbnZz?=
 =?utf-8?B?ZGllY093bFFHeG9iYmdUSVh2eGU2b1pndXlRd0wrekZIWENYRnF3L0tyV1ZU?=
 =?utf-8?B?ZXRUVHcxSlZhZER5Y1FSZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e022eb-2ccf-4d5a-23ce-08d950701c4a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 20:01:09.3553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r25SaBIrCoPeGw3FFJ4TktL6Y9UdLTYMTSWs/bs3ofRWitFpFlsfxtxYeHA0lPK5EqigDM/+fwtU2BT56cnl5jIQizKnlebogcudVHtq9c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4612
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107260118
X-Proofpoint-ORIG-GUID: IoPL1yC6YBtpPG9NF4gbAjzvbJt-N_hs
X-Proofpoint-GUID: IoPL1yC6YBtpPG9NF4gbAjzvbJt-N_hs
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



On 7/26/21 5:42 AM, Igor Mammedov wrote:
> On Wed, 21 Jul 2021 11:07:40 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> On 7/20/21 7:17 AM, Igor Mammedov wrote:
>>> On Wed, 30 Jun 2021 15:07:16 -0400
>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>    
>>>> This change implements the support for the ACPI ERST feature.
>>> Drop this
>> Done
>>
>>>    
>>>>
>>>> This implements a PCI device for ACPI ERST. This implments the
>>> s/implments/implements/
>> Corrected
>>
>>>    
>>>> non-NVRAM "mode" of operation for ERST.
>>> add here why non-NVRAM "mode" is implemented.
>> How about:
>> This implements a PCI device for ACPI ERST. This implments the
>> non-NVRAM "mode" of operation for ERST as it is supported by
>> Linux and Windows and aligns with ERST support in most BIOS.
> 
> modulo typos looks good to me.
> pls consider using a spell checker to check commit messages/comments.
done

> 
>>
>>>
>>> Also even if this non-NVRAM implementation, there is still
>>> a lot of not necessary data copying (see below) so drop it
>>> or justify why it's there.
>>>      
>>>> This change also includes erst.c in the build of general ACPI support.
>>> Drop this as well
>> Done
>>
>>>
>>>    
>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>> ---
>>>>    hw/acpi/erst.c      | 704 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    hw/acpi/meson.build |   1 +
>>>>    2 files changed, 705 insertions(+)
>>>>    create mode 100644 hw/acpi/erst.c
>>>>
>>>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>>>> new file mode 100644
>>>> index 0000000..6e9bd2e
>>>> --- /dev/null
>>>> +++ b/hw/acpi/erst.c
>>>> @@ -0,0 +1,704 @@
>>>> +/*
>>>> + * ACPI Error Record Serialization Table, ERST, Implementation
>>>> + *
>>>> + * Copyright (c) 2021 Oracle and/or its affiliates.
>>>> + *
>>>> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
>>>> + * ACPI Platform Error Interfaces : Error Serialization
>>>> + *
>>>> + * This library is free software; you can redistribute it and/or
>>>> + * modify it under the terms of the GNU Lesser General Public
>>>> + * License as published by the Free Software Foundation;
>>>> + * version 2 of the License.
>>>> + *
>>>> + * This library is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>>> + * Lesser General Public License for more details.
>>>> + *
>>>> + * You should have received a copy of the GNU Lesser General Public
>>>> + * License along with this library; if not, see <http://www.gnu.org/licenses/>
> 
> consider adding SPDX-License-Identifier to all new files.
Done

>   
>>>> + */
>>>> +
>>>> +#include <sys/types.h>
>>>> +#include <sys/stat.h>
>>>> +#include <unistd.h>
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "qapi/error.h"
>>>> +#include "hw/qdev-core.h"
>>>> +#include "exec/memory.h"
>>>> +#include "qom/object.h"
>>>> +#include "hw/pci/pci.h"
>>>> +#include "qom/object_interfaces.h"
>>>> +#include "qemu/error-report.h"
>>>> +#include "migration/vmstate.h"
>>>> +#include "hw/qdev-properties.h"
>>>> +#include "hw/acpi/acpi.h"
>>>> +#include "hw/acpi/acpi-defs.h"
>>>> +#include "hw/acpi/aml-build.h"
>>>> +#include "hw/acpi/bios-linker-loader.h"
>>>> +#include "exec/address-spaces.h"
>>>> +#include "sysemu/hostmem.h"
>>>> +#include "hw/acpi/erst.h"
>>>> +#include "trace.h"
>>>> +
>>>> +/* UEFI 2.1: Append N Common Platform Error Record */
>>>> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
>>>> +#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>>>> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
>>>> +#define IS_UEFI_CPER_RECORD(ptr) \
>>>> +    (((ptr)[0] == 'C') && \
>>>> +     ((ptr)[1] == 'P') && \
>>>> +     ((ptr)[2] == 'E') && \
>>>> +     ((ptr)[3] == 'R'))
>>>> +#define THE_UEFI_CPER_RECORD_ID(ptr) \
>>>> +    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
>>>> +
>>>> +/*
>>>> + * This implementation is an ACTION (cmd) and VALUE (data)
>>>> + * interface consisting of just two 64-bit registers.
>>>> + */
>>>> +#define ERST_REG_SIZE (2UL * sizeof(uint64_t))
>>>    
>>>> +#define ERST_CSR_ACTION (0UL << 3) /* action (cmd) */
>>>> +#define ERST_CSR_VALUE  (1UL << 3) /* argument/value (data) */
>>> what's meaning of CRS?
>> CSR = control status register
>>> Looking at patch both should be called ERST_[ACTION|VALUE]_OFFSET
>> Done
>>> pls use explicit offset values instead of shifting bit.
>> Done
>>>
>>>    
>>>> +/*
>>>> + * ERST_RECORD_SIZE is the buffer size for exchanging ERST
>>>> + * record contents. Thus, it defines the maximum record size.
>>>> + * As this is mapped through a PCI BAR, it must be a power of
>>>> + * two, and should be at least PAGE_SIZE.
>>>> + * Records are stored in the backing file in a simple fashion.
>>>> + * The backing file is essentially divided into fixed size
>>>> + * "slots", ERST_RECORD_SIZE in length, with each "slot"
>>>> + * storing a single record. No attempt at optimizing storage
>>>> + * through compression, compaction, etc is attempted.
>>>> + * NOTE that any change to this value will make any pre-
>>>> + * existing backing files, not of the same ERST_RECORD_SIZE,
>>>> + * unusable to the guest.
>>>> + */
>>>> +/* 8KiB records, not too small, not too big */
>>>> +#define ERST_RECORD_SIZE (2UL * 4096)
>>>> +
>>>> +#define ERST_INVALID_RECORD_ID (~0UL)
>>>> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
>>>> +
>>>> +/*
>>>> + * Object cast macro
>>>> + */
>>>> +#define ACPIERST(obj) \
>>>> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
>>>> +
>>>> +/*
>>>> + * Main ERST device state structure
>>>> + */
>>>> +typedef struct {
>>>> +    PCIDevice parent_obj;
>>>> +
>>>> +    HostMemoryBackend *hostmem;
>>>> +    MemoryRegion *hostmem_mr;
>>>> +
>>>> +    MemoryRegion iomem; /* programming registes */
>>>> +    MemoryRegion nvmem; /* exchange buffer */
>>>> +    uint32_t prop_size;
>>> s/^^^/storage_size/
>> Corrected
>>
>>>    
>>>> +    hwaddr bar0; /* programming registers */
>>>> +    hwaddr bar1; /* exchange buffer */
>>> why do you need to keep this addresses around?
>>> Suggest to drop these fields and use local variables or pci_get_bar_addr() at call site.
>> Corrected
>>
>>>    
>>>> +
>>>> +    uint8_t operation;
>>>> +    uint8_t busy_status;
>>>> +    uint8_t command_status;
>>>> +    uint32_t record_offset;
>>>> +    uint32_t record_count;
>>>> +    uint64_t reg_action;
>>>> +    uint64_t reg_value;
>>>> +    uint64_t record_identifier;
>>>> +
>>>> +    unsigned next_record_index;
>>>
>>>    
>>>> +    uint8_t record[ERST_RECORD_SIZE]; /* read/written directly by guest */
>>>> +    uint8_t tmp_record[ERST_RECORD_SIZE]; /* intermediate manipulation buffer */
>>> drop these see [**] below
>> Corrected
>>
>>>    
>>>> +
>>>> +} ERSTDeviceState;
>>>> +
>>>> +/*******************************************************************/
>>>> +/*******************************************************************/
>>>> +
>>>> +static unsigned copy_from_nvram_by_index(ERSTDeviceState *s, unsigned index)
>>>> +{
>>>> +    /* Read an nvram entry into tmp_record */
>>>> +    unsigned rc = ACPI_ERST_STATUS_FAILED;
>>>> +    off_t offset = (index * ERST_RECORD_SIZE);
>>>> +
>>>> +    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
>>>> +        if (s->hostmem_mr) {
>>>> +            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(s->hostmem_mr);
>>>> +            memcpy(s->tmp_record, p + offset, ERST_RECORD_SIZE);
>>>> +            rc = ACPI_ERST_STATUS_SUCCESS;
>>>> +        }
>>>> +    }
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static unsigned copy_to_nvram_by_index(ERSTDeviceState *s, unsigned index)
>>>> +{
>>>> +    /* Write entry in tmp_record into nvram, and backing file */
>>>> +    unsigned rc = ACPI_ERST_STATUS_FAILED;
>>>> +    off_t offset = (index * ERST_RECORD_SIZE);
>>>> +
>>>> +    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
>>>> +        if (s->hostmem_mr) {
>>>> +            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(s->hostmem_mr);
>>>> +            memcpy(p + offset, s->tmp_record, ERST_RECORD_SIZE);
>>>> +            rc = ACPI_ERST_STATUS_SUCCESS;
>>>> +        }
>>>> +    }
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static int lookup_erst_record_by_identifier(ERSTDeviceState *s,
>>>> +    uint64_t record_identifier, bool *record_found, bool alloc_for_write)
>>>> +{
>>>> +    int rc = -1;
>>>> +    int empty_index = -1;
>>>> +    int index = 0;
>>>> +    unsigned rrc;
>>>> +
>>>> +    *record_found = 0;
>>>> +
>>>> +    do {
>>>> +        rrc = copy_from_nvram_by_index(s, (unsigned)index);
>>>
>>> you have direct access to backend memory so there is no need
>>> whatsoever to copy records from it to an intermediate buffer
>>> everywhere. Almost all operations with records can be done
>>> in place modulo EXECUTE_OPERATION action in BEGIN_[READ|WRITE]
>>> context, where record is moved between backend and guest buffer.
>>>
>>> So please eliminate all not necessary copying.
>>> (for fun, time operations and set backend size to some huge
>>> value to see how expensive this code is)
>>
>> I've corrected this. In our previous exchangs, I thought the reference
>> to copying was about trying to directly have guest write/read the appropriate
>> record in the backend storage. After reading this comment I realized that
>> yes I was doing alot of copying (an artifact of the transition away from
>> direct file i/o to MemoryBackend). So good find, and I've eliminated the
>> intermediate copying.
>>
>>>    
>>>> +        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
>>>> +            uint64_t this_identifier;
>>>> +            this_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
>>>> +            if (IS_UEFI_CPER_RECORD(s->tmp_record) &&
>>>> +                (this_identifier == record_identifier)) {
>>>> +                rc = index;
>>>> +                *record_found = 1;
>>>> +                break;
>>>> +            }
>>>> +            if ((this_identifier == ERST_INVALID_RECORD_ID) &&
>>>> +                (empty_index < 0)) {
>>>> +                empty_index = index; /* first available for write */
>>>> +            }
>>>> +        }
>>>> +        ++index;
>>>> +    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
>>>> +
>>>> +    /* Record not found, allocate for writing */
>>>> +    if ((rc < 0) && alloc_for_write) {
>>>> +        rc = empty_index;
>>>> +    }
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static unsigned clear_erst_record(ERSTDeviceState *s)
>>>> +{
>>>> +    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
>>>> +    bool record_found;
>>>> +    int index;
>>>> +
>>>> +    index = lookup_erst_record_by_identifier(s,
>>>> +        s->record_identifier, &record_found, 0);
>>>> +    if (record_found) {
>>>> +        memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
>>>> +        rc = copy_to_nvram_by_index(s, (unsigned)index);
>>>> +        if (rc == ACPI_ERST_STATUS_SUCCESS) {
>>>> +            s->record_count -= 1;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static unsigned write_erst_record(ERSTDeviceState *s)
>>>> +{
>>>> +    unsigned rc = ACPI_ERST_STATUS_FAILED;
>>>> +
>>>> +    if (s->record_offset < (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE)) {
>>>> +        uint64_t record_identifier;
>>>> +        uint8_t *record = &s->record[s->record_offset];
>>>> +        bool record_found;
>>>> +        int index;
>>>> +
>>>> +        record_identifier = (s->record_identifier == ERST_INVALID_RECORD_ID)
>>>> +            ? THE_UEFI_CPER_RECORD_ID(record) : s->record_identifier;
>>>> +
>>>> +        index = lookup_erst_record_by_identifier(s,
>>>> +            record_identifier, &record_found, 1);
>>>> +        if (index < 0) {
>>>> +            rc = ACPI_ERST_STATUS_NOT_ENOUGH_SPACE;
>>>> +        } else {
>>>> +            if (0 != s->record_offset) {
>>>> +                memset(&s->tmp_record[ERST_RECORD_SIZE - s->record_offset],
>>>> +                    0xFF, s->record_offset);
>>>> +            }
>>>> +            memcpy(s->tmp_record, record, ERST_RECORD_SIZE - s->record_offset);
>>>> +            rc = copy_to_nvram_by_index(s, (unsigned)index);
>>>> +            if (rc == ACPI_ERST_STATUS_SUCCESS) {
>>>> +                if (!record_found) { /* not overwriting existing record */
>>>> +                    s->record_count += 1; /* writing new record */
>>>> +                }
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static unsigned next_erst_record(ERSTDeviceState *s,
>>>> +    uint64_t *record_identifier)
>>>> +{
>>>> +    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
>>>> +    unsigned index;
>>>> +    unsigned rrc;
>>>> +
>>>> +    *record_identifier = ERST_INVALID_RECORD_ID;
>>>> +
>>>> +    index = s->next_record_index;
>>>> +    do {
>>>> +        rrc = copy_from_nvram_by_index(s, (unsigned)index);
>>>> +        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
>>>> +            if (IS_UEFI_CPER_RECORD(s->tmp_record)) {
>>>> +                s->next_record_index = index + 1; /* where to start next time */
>>>> +                *record_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
>>>> +                rc = ACPI_ERST_STATUS_SUCCESS;
>>>> +                break;
>>>> +            }
>>>> +            ++index;
>>>> +        } else {
>>>> +            if (s->next_record_index == 0) {
>>>> +                rc = ACPI_ERST_STATUS_RECORD_STORE_EMPTY;
>>>> +            }
>>>> +            s->next_record_index = 0; /* at end, reset */
>>>> +        }
>>>> +    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static unsigned read_erst_record(ERSTDeviceState *s)
>>>> +{
>>>> +    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
>>>> +    bool record_found;
>>>> +    int index;
>>>> +
>>>> +    index = lookup_erst_record_by_identifier(s,
>>>> +        s->record_identifier, &record_found, 0);
>>>> +    if (record_found) {
>>>> +        rc = copy_from_nvram_by_index(s, (unsigned)index);
>>>> +        if (rc == ACPI_ERST_STATUS_SUCCESS) {
>>>> +            if (s->record_offset < ERST_RECORD_SIZE) {
>>>> +                memcpy(&s->record[s->record_offset], s->tmp_record,
>>>> +                    ERST_RECORD_SIZE - s->record_offset);
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static unsigned get_erst_record_count(ERSTDeviceState *s)
>>>> +{
>>>> +    /* Compute record_count */
>>>> +    unsigned index = 0;
>>>> +
>>>> +    s->record_count = 0;
>>>> +    while (copy_from_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
>>>> +        uint8_t *ptr = &s->tmp_record[0];
>>>> +        uint64_t record_identifier = THE_UEFI_CPER_RECORD_ID(ptr);
>>>> +        if (IS_UEFI_CPER_RECORD(ptr) &&
>>>> +            (ERST_INVALID_RECORD_ID != record_identifier)) {
>>>> +            s->record_count += 1;
>>>> +        }
>>>> +        ++index;
>>>> +    }
>>>> +    return s->record_count;
>>>> +}
>>>> +
>>>> +/*******************************************************************/
>>>> +
>>>> +static uint64_t erst_rd_reg64(hwaddr addr,
>>>> +    uint64_t reg, unsigned size)
>>>> +{
>>>> +    uint64_t rdval;
>>>> +    uint64_t mask;
>>>> +    unsigned shift;
>>>> +
>>>> +    if (size == sizeof(uint64_t)) {
>>>> +        /* 64b access */
>>>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>>>> +        shift = 0;
>>>> +    } else {
>>>> +        /* 32b access */
>>>> +        mask = 0x00000000FFFFFFFFUL;
>>>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>>>> +    }
>>>> +
>>>> +    rdval = reg;
>>>> +    rdval >>= shift;
>>>> +    rdval &= mask;
>>>> +
>>>> +    return rdval;
>>>> +}
>>>> +
>>>> +static uint64_t erst_wr_reg64(hwaddr addr,
>>>> +    uint64_t reg, uint64_t val, unsigned size)
>>>> +{
>>>> +    uint64_t wrval;
>>>> +    uint64_t mask;
>>>> +    unsigned shift;
>>>> +
>>>> +    if (size == sizeof(uint64_t)) {
>>>> +        /* 64b access */
>>>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>>>> +        shift = 0;
>>>> +    } else {
>>>> +        /* 32b access */
>>>> +        mask = 0x00000000FFFFFFFFUL;
>>>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>>>> +    }
>>>> +
>>>> +    val &= mask;
>>>> +    val <<= shift;
>>>> +    mask <<= shift;
>>>> +    wrval = reg;
>>>> +    wrval &= ~mask;
>>>> +    wrval |= val;
>>>> +
>>>> +    return wrval;
>>>> +}
>>> (I see in next patch it's us defining access width in the ACPI tables)
>>> so question is: do we have to have mixed register width access?
>>> can't all register accesses be 64-bit?
>>
>> Initially I attempted to just use 64-bit exclusively. The problem is that,
>> for reasons I don't understand, the OSPM on Linux, even x86_64, breaks a 64b
>> register access into two. Here's an example of reading the exchange buffer
>> address, which is coded as a 64b access:
>>
>> acpi_erst_reg_write addr: 0x0000 <== 0x000000000000000d (size: 4)
>> acpi_erst_reg_read  addr: 0x0008 ==> 0x00000000c1010000 (size: 4)
>> acpi_erst_reg_read  addr: 0x000c ==> 0x0000000000000000 (size: 4)
>>
>> So I went ahead and made ACTION register accesses 32b, else there would
>> be two reads of 32-bts, of which the second is useless.
> 
> could you post here decompiled ERST table?
As it is long, I posted it to the end of this message.

> 
>>
>>>    
>>>> +static void erst_reg_write(void *opaque, hwaddr addr,
>>>> +    uint64_t val, unsigned size)
>>>> +{
>>>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>>>> +
>>>> +    /*
>>>> +     * NOTE: All actions/operations/side effects happen on the WRITE,
>>>> +     * by design. The READs simply return the reg_value contents.
>>>> +     */
>>>> +    trace_acpi_erst_reg_write(addr, val, size);
>>>> +
>>>> +    switch (addr) {
>>>> +    case ERST_CSR_VALUE + 0:
>>>> +    case ERST_CSR_VALUE + 4:
>>>> +        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
>>>> +        break;
>>>> +    case ERST_CSR_ACTION + 0:
>>>> +/*  case ERST_CSR_ACTION+4: as coded, not really a 64b register */
>>>> +        switch (val) {
>>>> +        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
>>>> +        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
>>>> +        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
>>>> +        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>>>> +        case ACPI_ERST_ACTION_END_OPERATION:
>>>> +            s->operation = val;
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
>>>> +            s->record_offset = s->reg_value;
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
>>>> +            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
>>>> +                s->busy_status = 1;
>>>> +                switch (s->operation) {
>>>> +                case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
>>>> +                    s->command_status = write_erst_record(s);
>>>> +                    break;
>>>> +                case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
>>>> +                    s->command_status = read_erst_record(s);
>>>> +                    break;
>>>> +                case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
>>>> +                    s->command_status = clear_erst_record(s);
>>>> +                    break;
>>>> +                case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>>>> +                    s->command_status = ACPI_ERST_STATUS_SUCCESS;
>>>> +                    break;
>>>> +                case ACPI_ERST_ACTION_END_OPERATION:
>>>> +                    s->command_status = ACPI_ERST_STATUS_SUCCESS;
>>>> +                    break;
>>>> +                default:
>>>> +                    s->command_status = ACPI_ERST_STATUS_FAILED;
>>>> +                    break;
>>>> +                }
>>>> +                s->record_identifier = ERST_INVALID_RECORD_ID;
>>>> +                s->busy_status = 0;
>>>> +            }
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
>>>> +            s->reg_value = s->busy_status;
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
>>>> +            s->reg_value = s->command_status;
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
>>>> +            s->command_status = next_erst_record(s, &s->reg_value);
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
>>>> +            s->record_identifier = s->reg_value;
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
>>>> +            s->reg_value = s->record_count;
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
>>>> +            s->reg_value = s->bar1;
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
>>>> +            s->reg_value = ERST_RECORD_SIZE;
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
>>>> +            s->reg_value = 0x0; /* intentional, not NVRAM mode */
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
>>>> +            /*
>>>> +             * 100UL is max, 10UL is nominal
>>> 100/10 of what, also add reference to spec/table it comes from
>>> and explain in comment why theses values were chosen
>> I've changed the comment and style to be similar to build_amd_iommu().
>> These are merely sane non-zero max/min times.
>>
>>>    
>>>> +             */
>>>> +            s->reg_value = ((100UL << 32) | (10UL << 0));
>>>> +            break;
>>>> +        case ACPI_ERST_ACTION_RESERVED:
>>> not necessary, it will be handled by 'default:'
>> Corrected
>>
>>>    
>>>> +        default:
>>>> +            /*
>>>> +             * Unknown action/command, NOP
>>>> +             */
>>>> +            break;
>>>> +        }
>>>> +        break;
>>>> +    default:
>>>> +        /*
>>>> +         * This should not happen, but if it does, NOP
>>>> +         */
>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>>> +static uint64_t erst_reg_read(void *opaque, hwaddr addr,
>>>> +                                unsigned size)
>>>> +{
>>>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>>>> +    uint64_t val = 0;
>>>> +
>>>> +    switch (addr) {
>>>> +    case ERST_CSR_ACTION + 0:
>>>> +    case ERST_CSR_ACTION + 4:
>>>> +        val = erst_rd_reg64(addr, s->reg_action, size);
>>>> +        break;
>>>> +    case ERST_CSR_VALUE + 0:
>>>> +    case ERST_CSR_VALUE + 4:
>>>> +        val = erst_rd_reg64(addr, s->reg_value, size);
>>>> +        break;
>>>> +    default:
>>>> +        break;
>>>> +    }
>>>> +    trace_acpi_erst_reg_read(addr, val, size);
>>>> +    return val;
>>>> +}
>>>> +
>>>> +static const MemoryRegionOps erst_reg_ops = {
>>>> +    .read = erst_reg_read,
>>>> +    .write = erst_reg_write,
>>>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>>> +};
>>>> +
>>>> +static void erst_mem_write(void *opaque, hwaddr addr,
>>>> +    uint64_t val, unsigned size)
>>>> +{
>>>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>>>    
>>>> +    uint8_t *ptr = &s->record[addr - 0];
>>>> +    trace_acpi_erst_mem_write(addr, val, size);
>>>> +    switch (size) {
>>>> +    default:
>>>> +    case sizeof(uint8_t):
>>>> +        *(uint8_t *)ptr = (uint8_t)val;
>>>> +        break;
>>>> +    case sizeof(uint16_t):
>>>> +        *(uint16_t *)ptr = (uint16_t)val;
>>>> +        break;
>>>> +    case sizeof(uint32_t):
>>>> +        *(uint32_t *)ptr = (uint32_t)val;
>>>> +        break;
>>>> +    case sizeof(uint64_t):
>>>> +        *(uint64_t *)ptr = (uint64_t)val;
>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>>> +static uint64_t erst_mem_read(void *opaque, hwaddr addr,
>>>> +                                unsigned size)
>>>> +{
>>>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>>>> +    uint8_t *ptr = &s->record[addr - 0];
>>>> +    uint64_t val = 0;
>>>> +    switch (size) {
>>>> +    default:
>>>> +    case sizeof(uint8_t):
>>>> +        val = *(uint8_t *)ptr;
>>>> +        break;
>>>> +    case sizeof(uint16_t):
>>>> +        val = *(uint16_t *)ptr;
>>>> +        break;
>>>> +    case sizeof(uint32_t):
>>>> +        val = *(uint32_t *)ptr;
>>>> +        break;
>>>> +    case sizeof(uint64_t):
>>>> +        val = *(uint64_t *)ptr;
>>>> +        break;
>>>> +    }
>>>> +    trace_acpi_erst_mem_read(addr, val, size);
>>>> +    return val;
>>>> +}
>>>> +
>>>> +static const MemoryRegionOps erst_mem_ops = {
>>>> +    .read = erst_mem_read,
>>>> +    .write = erst_mem_write,
>>>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>>> +};
>>>> +
>>>> +/*******************************************************************/
>>>> +/*******************************************************************/
>>>> +
>>>> +static const VMStateDescription erst_vmstate  = {
>>>> +    .name = "acpi-erst",
>>>> +    .version_id = 1,
>>>> +    .minimum_version_id = 1,
>>>> +    .fields = (VMStateField[]) {
>>>> +        VMSTATE_UINT8(operation, ERSTDeviceState),
>>>> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
>>>> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
>>>> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
>>>> +        VMSTATE_UINT32(record_count, ERSTDeviceState),
>>>> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
>>>> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
>>>> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
>>>> +        VMSTATE_UINT8_ARRAY(record, ERSTDeviceState, ERST_RECORD_SIZE),
>>>> +        VMSTATE_UINT8_ARRAY(tmp_record, ERSTDeviceState, ERST_RECORD_SIZE),
>>>> +        VMSTATE_END_OF_LIST()
>>>> +    }
>>>> +};
>>>> +
>>>> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
>>>> +{
>>>> +    ERSTDeviceState *s = ACPIERST(pci_dev);
>>>> +    unsigned index = 0;
>>>> +    bool share;
>>>> +
>>>> +    trace_acpi_erst_realizefn_in();
>>>> +
>>>> +    if (!s->hostmem) {
>>>> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
>>>> +        return;
>>>> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
>>>> +        error_setg(errp, "can't use already busy memdev: %s",
>>>> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    share = object_property_get_bool(OBJECT(s->hostmem), "share", &error_fatal);
>>> s/&error_fatal/errp/
>> Corrected
>>
>>>    
>>>> +    if (!share) {
>>>> +        error_setg(errp, "ACPI ERST requires hostmem property share=on: %s",
>>>> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
>>>> +    }
>>> This limits possible to use backends to file|memfd only, so
>>> I wonder if really need this limitation, what if user doesn't
>>> care about preserving it across QEMU restarts. (i.e. usecase
>>> where storage is used as a means to troubleshoot guest crash
>>> i.e. QEMU is not restarted in between)
>>>
>>> Maybe instead of enforcing we should just document that if user
>>> wishes to preserve content they should use file|memfd backend with
>>> share=on option.
>>
>> I've removed this check. It is documented the way it is intended to be used.
>>
>>>    
>>>> +
>>>> +    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
>>>> +
>>>> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
>>>> +    s->prop_size = object_property_get_int(OBJECT(s->hostmem), "size", &error_fatal);
>>> s/&error_fatal/errp/
>> Corrected
>>
>>>    
>>>> +
>>>> +    /* Convert prop_size to integer multiple of ERST_RECORD_SIZE */
>>>> +    s->prop_size -= (s->prop_size % ERST_RECORD_SIZE);
>>>
>>> pls, no fixups on behalf of user, if size is not what it should be
>>> error out with suggestion how to fix it.
>> Removed
>>
>>>    
>>>> +
>>>> +    /*
>>>> +     * MemoryBackend initializes contents to zero, but we actually
>>>> +     * want contents initialized to 0xFF, ERST_INVALID_RECORD_ID.
>>>> +     */
>>>> +    if (copy_from_nvram_by_index(s, 0) == ACPI_ERST_STATUS_SUCCESS) {
>>>> +        if (s->tmp_record[0] == 0x00) {
>>>> +            memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
>>> this doesn't scale,
>>> (set backend size to more than host physical RAM, put it on slow storage and have fun.)
>> of course, which is why i think we need to have an upper bound (my early
>> submissions did).
>>
>>>
>>> Is it possible to use 0 as invalid record id or change storage format
>>> so you would not have to rewrite whole file at startup (maybe some sort
>> no
>>
>>> of metadata header/records book-keeping table before actual records.
>>> And initialize file only if header is invalid.)
>> I have to scan the backend storage anyway in order to initialize the record
>> count, so I've combined that scan with a test to see if the backend storage
>> needs to be initialized.
> 
> 
> if you add a records table at the start of backend,
> then you won't need to read/write whole file.
> It would be enough to read/initialize header only and access
> actual records only when necessary. Header could look something like:
> 
> |erst magic string|
> |slot size|
> |slots nr|
> +++++++++++++++++ slots header ++++++++++++
> |is_empty, record offset from file start, maybe something else that would speed up access|
> ...
> |last record descriptor|
> ++++++++++ actual records +++++++++++++
> |slot 0|
> ...
> |slot n|
> 

see my concerns in the response to [02/10].


>>>> +            index = 0;
>>>> +            while (copy_to_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
>>>> +                ++index;
>>>> +            }
>>> also back&forth copying here is not really necessary.
>> corrected
>>
>>>    
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /* Initialize record_count */
>>>> +    get_erst_record_count(s);
>>> why not put it into reset?
>> It is initialized once, then subsequent write/clear operations update
>> the counter as needed.
> 
> ok
> 
>>>    
>>>> +
>>>> +    /* BAR 0: Programming registers */
>>>> +    memory_region_init_io(&s->iomem, OBJECT(pci_dev), &erst_reg_ops, s,
>>>> +                          TYPE_ACPI_ERST, ERST_REG_SIZE);
>>>> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
>>>> +
>>>    
>>>> +    /* BAR 1: Exchange buffer memory */
>>>> +    memory_region_init_io(&s->nvmem, OBJECT(pci_dev), &erst_mem_ops, s,
>>>> +                          TYPE_ACPI_ERST, ERST_RECORD_SIZE);
>>>> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->nvmem);
>>>
>>> **)
>>> instead of using mmio for buffer where each write causes
>>> guest exit to QEMU, map memory region directly to guest.
>>> see ivshmem_bar2, the only difference with ivshmem, you'd
>>> create memory region manually (for example you can use
>>> memory_region_init_resizeable_ram)
>>>
>>> this way you can speedup access and drop erst_mem_ops and
>>> [tmp_]record intermediate buffers.
>>>
>>> Instead of [tmp_]record you can copy record content
>>> directly between buffer and backend memory regions.
>>
>> I've changed the exchange buffer into a MemoryBackend object and
>> eliminated the erst_mem_ops.
>>
>>>    
>>>> +    /*
>>>> +     * The vmstate_register_ram_global() puts the memory in
>>>> +     * migration stream, where it is written back to the memory
>>>> +     * upon reaching the destination, which causes the backing
>>>> +     * file to be updated (with share=on).
>>>> +     */
>>>> +    vmstate_register_ram_global(s->hostmem_mr);
>>>> +
>>>> +    trace_acpi_erst_realizefn_out(s->prop_size);
>>>> +}
>>>> +
>>>> +static void erst_reset(DeviceState *dev)
>>>> +{
>>>> +    ERSTDeviceState *s = ACPIERST(dev);
>>>> +
>>>> +    trace_acpi_erst_reset_in(s->record_count);
>>>> +    s->operation = 0;
>>>> +    s->busy_status = 0;
>>>> +    s->command_status = ACPI_ERST_STATUS_SUCCESS;
>>>    
>>>> +    /* indicate empty/no-more until further notice */
>>> pls rephrase, I'm not sure what it's trying to say
>> Eliminated; I don't know why I was trying to say there either
>>>    
>>>> +    s->record_identifier = ERST_INVALID_RECORD_ID;
>>>> +    s->record_offset = 0;
>>>> +    s->next_record_index = 0;
>>>    
>>>> +    /* NOTE: record_count and nvram are initialized elsewhere */
>>>> +    trace_acpi_erst_reset_out(s->record_count);
>>>> +}
>>>> +
>>>> +static Property erst_properties[] = {
>>>> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
>>>> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
>>>> +    DEFINE_PROP_END_OF_LIST(),
>>>> +};
>>>> +
>>>> +static void erst_class_init(ObjectClass *klass, void *data)
>>>> +{
>>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>>> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>> +
>>>> +    trace_acpi_erst_class_init_in();
>>>> +    k->realize = erst_realizefn;
>>>> +    k->vendor_id = PCI_VENDOR_ID_REDHAT;
>>>> +    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
>>>> +    k->revision = 0x00;
>>>> +    k->class_id = PCI_CLASS_OTHERS;
>>>> +    dc->reset = erst_reset;
>>>> +    dc->vmsd = &erst_vmstate;
>>>> +    dc->user_creatable = true;
>>>> +    device_class_set_props(dc, erst_properties);
>>>> +    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
>>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>>> +    trace_acpi_erst_class_init_out();
>>>> +}
>>>> +
>>>> +static const TypeInfo erst_type_info = {
>>>> +    .name          = TYPE_ACPI_ERST,
>>>> +    .parent        = TYPE_PCI_DEVICE,
>>>> +    .class_init    = erst_class_init,
>>>> +    .instance_size = sizeof(ERSTDeviceState),
>>>> +    .interfaces = (InterfaceInfo[]) {
>>>> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>> what is this for here?
>>>    
>>>> +        { }
>>>> +    }
>>>> +};
>>>> +
>>>> +static void erst_register_types(void)
>>>> +{
>>>> +    type_register_static(&erst_type_info);
>>>> +}
>>>> +
>>>> +type_init(erst_register_types)
>>>> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
>>>> index dd69577..262a8ee 100644
>>>> --- a/hw/acpi/meson.build
>>>> +++ b/hw/acpi/meson.build
>>>> @@ -4,6 +4,7 @@ acpi_ss.add(files(
>>>>      'aml-build.c',
>>>>      'bios-linker-loader.c',
>>>>      'utils.c',
>>>> +  'erst.c',
>>>>    ))
>>>>    acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
>>>>    acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))
>>>    
>>
> 


Obtained via a running guest with:
iasl -d -vt /sys/firmware/acpi/tables/ERST

/*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180105 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  *
  * Disassembly of ERST.blob, Mon Jul 26 14:31:21 2021
  *
  * ACPI Data Table [ERST]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

[000h 0000   4]                    Signature : "ERST"    [Error Record Serialization Table]
[004h 0004   4]                 Table Length : 00000390
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : C8
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]  Serialization Header Length : 00000030
[028h 0040   4]                     Reserved : 00000000
[02Ch 0044   4]      Instruction Entry Count : 0000001B

[030h 0048   1]                       Action : 00 [Begin Write Operation]
[031h 0049   1]                  Instruction : 03 [Write Register Value]
[032h 0050   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[033h 0051   1]                     Reserved : 00

[034h 0052  12]              Register Region : [Generic Address Structure]
[034h 0052   1]                     Space ID : 00 [SystemMemory]
[035h 0053   1]                    Bit Width : 20
[036h 0054   1]                   Bit Offset : 00
[037h 0055   1]         Encoded Access Width : 03 [DWord Access:32]
[038h 0056   8]                      Address : 00000000C1063000

[040h 0064   8]                        Value : 0000000000000000
[048h 0072   8]                         Mask : 00000000000000FF

[050h 0080   1]                       Action : 01 [Begin Read Operation]
[051h 0081   1]                  Instruction : 03 [Write Register Value]
[052h 0082   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[053h 0083   1]                     Reserved : 00

[054h 0084  12]              Register Region : [Generic Address Structure]
[054h 0084   1]                     Space ID : 00 [SystemMemory]
[055h 0085   1]                    Bit Width : 20
[056h 0086   1]                   Bit Offset : 00
[057h 0087   1]         Encoded Access Width : 03 [DWord Access:32]
[058h 0088   8]                      Address : 00000000C1063000

[060h 0096   8]                        Value : 0000000000000001
[068h 0104   8]                         Mask : 00000000000000FF

[070h 0112   1]                       Action : 02 [Begin Clear Operation]
[071h 0113   1]                  Instruction : 03 [Write Register Value]
[072h 0114   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[073h 0115   1]                     Reserved : 00

[074h 0116  12]              Register Region : [Generic Address Structure]
[074h 0116   1]                     Space ID : 00 [SystemMemory]
[075h 0117   1]                    Bit Width : 20
[076h 0118   1]                   Bit Offset : 00
[077h 0119   1]         Encoded Access Width : 03 [DWord Access:32]
[078h 0120   8]                      Address : 00000000C1063000

[080h 0128   8]                        Value : 0000000000000002
[088h 0136   8]                         Mask : 00000000000000FF

[090h 0144   1]                       Action : 03 [End Operation]
[091h 0145   1]                  Instruction : 03 [Write Register Value]
[092h 0146   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[093h 0147   1]                     Reserved : 00

[094h 0148  12]              Register Region : [Generic Address Structure]
[094h 0148   1]                     Space ID : 00 [SystemMemory]
[095h 0149   1]                    Bit Width : 20
[096h 0150   1]                   Bit Offset : 00
[097h 0151   1]         Encoded Access Width : 03 [DWord Access:32]
[098h 0152   8]                      Address : 00000000C1063000

[0A0h 0160   8]                        Value : 0000000000000003
[0A8h 0168   8]                         Mask : 00000000000000FF

[0B0h 0176   1]                       Action : 04 [Set Record Offset]
[0B1h 0177   1]                  Instruction : 02 [Write Register]
[0B2h 0178   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[0B3h 0179   1]                     Reserved : 00

[0B4h 0180  12]              Register Region : [Generic Address Structure]
[0B4h 0180   1]                     Space ID : 00 [SystemMemory]
[0B5h 0181   1]                    Bit Width : 20
[0B6h 0182   1]                   Bit Offset : 00
[0B7h 0183   1]         Encoded Access Width : 03 [DWord Access:32]
[0B8h 0184   8]                      Address : 00000000C1063008

[0C0h 0192   8]                        Value : 0000000000000000
[0C8h 0200   8]                         Mask : 00000000FFFFFFFF

[0D0h 0208   1]                       Action : 04 [Set Record Offset]
[0D1h 0209   1]                  Instruction : 03 [Write Register Value]
[0D2h 0210   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[0D3h 0211   1]                     Reserved : 00

[0D4h 0212  12]              Register Region : [Generic Address Structure]
[0D4h 0212   1]                     Space ID : 00 [SystemMemory]
[0D5h 0213   1]                    Bit Width : 20
[0D6h 0214   1]                   Bit Offset : 00
[0D7h 0215   1]         Encoded Access Width : 03 [DWord Access:32]
[0D8h 0216   8]                      Address : 00000000C1063000

[0E0h 0224   8]                        Value : 0000000000000004
[0E8h 0232   8]                         Mask : 00000000000000FF

[0F0h 0240   1]                       Action : 05 [Execute Operation]
[0F1h 0241   1]                  Instruction : 03 [Write Register Value]
[0F2h 0242   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[0F3h 0243   1]                     Reserved : 00

[0F4h 0244  12]              Register Region : [Generic Address Structure]
[0F4h 0244   1]                     Space ID : 00 [SystemMemory]
[0F5h 0245   1]                    Bit Width : 20
[0F6h 0246   1]                   Bit Offset : 00
[0F7h 0247   1]         Encoded Access Width : 03 [DWord Access:32]
[0F8h 0248   8]                      Address : 00000000C1063008

[100h 0256   8]                        Value : 000000000000009C
[108h 0264   8]                         Mask : 00000000000000FF

[110h 0272   1]                       Action : 05 [Execute Operation]
[111h 0273   1]                  Instruction : 03 [Write Register Value]
[112h 0274   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[113h 0275   1]                     Reserved : 00

[114h 0276  12]              Register Region : [Generic Address Structure]
[114h 0276   1]                     Space ID : 00 [SystemMemory]
[115h 0277   1]                    Bit Width : 20
[116h 0278   1]                   Bit Offset : 00
[117h 0279   1]         Encoded Access Width : 03 [DWord Access:32]
[118h 0280   8]                      Address : 00000000C1063000

[120h 0288   8]                        Value : 0000000000000005
[128h 0296   8]                         Mask : 00000000000000FF

[130h 0304   1]                       Action : 06 [Check Busy Status]
[131h 0305   1]                  Instruction : 03 [Write Register Value]
[132h 0306   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[133h 0307   1]                     Reserved : 00

[134h 0308  12]              Register Region : [Generic Address Structure]
[134h 0308   1]                     Space ID : 00 [SystemMemory]
[135h 0309   1]                    Bit Width : 20
[136h 0310   1]                   Bit Offset : 00
[137h 0311   1]         Encoded Access Width : 03 [DWord Access:32]
[138h 0312   8]                      Address : 00000000C1063000

[140h 0320   8]                        Value : 0000000000000006
[148h 0328   8]                         Mask : 00000000000000FF

[150h 0336   1]                       Action : 06 [Check Busy Status]
[151h 0337   1]                  Instruction : 01 [Read Register Value]
[152h 0338   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[153h 0339   1]                     Reserved : 00

[154h 0340  12]              Register Region : [Generic Address Structure]
[154h 0340   1]                     Space ID : 00 [SystemMemory]
[155h 0341   1]                    Bit Width : 20
[156h 0342   1]                   Bit Offset : 00
[157h 0343   1]         Encoded Access Width : 03 [DWord Access:32]
[158h 0344   8]                      Address : 00000000C1063008

[160h 0352   8]                        Value : 0000000000000001
[168h 0360   8]                         Mask : 00000000000000FF

[170h 0368   1]                       Action : 07 [Get Command Status]
[171h 0369   1]                  Instruction : 03 [Write Register Value]
[172h 0370   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[173h 0371   1]                     Reserved : 00

[174h 0372  12]              Register Region : [Generic Address Structure]
[174h 0372   1]                     Space ID : 00 [SystemMemory]
[175h 0373   1]                    Bit Width : 20
[176h 0374   1]                   Bit Offset : 00
[177h 0375   1]         Encoded Access Width : 03 [DWord Access:32]
[178h 0376   8]                      Address : 00000000C1063000

[180h 0384   8]                        Value : 0000000000000007
[188h 0392   8]                         Mask : 00000000000000FF

[190h 0400   1]                       Action : 07 [Get Command Status]
[191h 0401   1]                  Instruction : 00 [Read Register]
[192h 0402   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[193h 0403   1]                     Reserved : 00

[194h 0404  12]              Register Region : [Generic Address Structure]
[194h 0404   1]                     Space ID : 00 [SystemMemory]
[195h 0405   1]                    Bit Width : 20
[196h 0406   1]                   Bit Offset : 00
[197h 0407   1]         Encoded Access Width : 03 [DWord Access:32]
[198h 0408   8]                      Address : 00000000C1063008

[1A0h 0416   8]                        Value : 0000000000000000
[1A8h 0424   8]                         Mask : 00000000000000FF

[1B0h 0432   1]                       Action : 08 [Get Record Identifier]
[1B1h 0433   1]                  Instruction : 03 [Write Register Value]
[1B2h 0434   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[1B3h 0435   1]                     Reserved : 00

[1B4h 0436  12]              Register Region : [Generic Address Structure]
[1B4h 0436   1]                     Space ID : 00 [SystemMemory]
[1B5h 0437   1]                    Bit Width : 20
[1B6h 0438   1]                   Bit Offset : 00
[1B7h 0439   1]         Encoded Access Width : 03 [DWord Access:32]
[1B8h 0440   8]                      Address : 00000000C1063000

[1C0h 0448   8]                        Value : 0000000000000008
[1C8h 0456   8]                         Mask : 00000000000000FF

[1D0h 0464   1]                       Action : 08 [Get Record Identifier]
[1D1h 0465   1]                  Instruction : 00 [Read Register]
[1D2h 0466   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[1D3h 0467   1]                     Reserved : 00

[1D4h 0468  12]              Register Region : [Generic Address Structure]
[1D4h 0468   1]                     Space ID : 00 [SystemMemory]
[1D5h 0469   1]                    Bit Width : 40
[1D6h 0470   1]                   Bit Offset : 00
[1D7h 0471   1]         Encoded Access Width : 04 [QWord Access:64]
[1D8h 0472   8]                      Address : 00000000C1063008

[1E0h 0480   8]                        Value : 0000000000000000
[1E8h 0488   8]                         Mask : FFFFFFFFFFFFFFFF

[1F0h 0496   1]                       Action : 09 [Set Record Identifier]
[1F1h 0497   1]                  Instruction : 02 [Write Register]
[1F2h 0498   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[1F3h 0499   1]                     Reserved : 00

[1F4h 0500  12]              Register Region : [Generic Address Structure]
[1F4h 0500   1]                     Space ID : 00 [SystemMemory]
[1F5h 0501   1]                    Bit Width : 40
[1F6h 0502   1]                   Bit Offset : 00
[1F7h 0503   1]         Encoded Access Width : 04 [QWord Access:64]
[1F8h 0504   8]                      Address : 00000000C1063008

[200h 0512   8]                        Value : 0000000000000000
[208h 0520   8]                         Mask : FFFFFFFFFFFFFFFF

[210h 0528   1]                       Action : 09 [Set Record Identifier]
[211h 0529   1]                  Instruction : 03 [Write Register Value]
[212h 0530   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[213h 0531   1]                     Reserved : 00

[214h 0532  12]              Register Region : [Generic Address Structure]
[214h 0532   1]                     Space ID : 00 [SystemMemory]
[215h 0533   1]                    Bit Width : 20
[216h 0534   1]                   Bit Offset : 00
[217h 0535   1]         Encoded Access Width : 03 [DWord Access:32]
[218h 0536   8]                      Address : 00000000C1063000

[220h 0544   8]                        Value : 0000000000000009
[228h 0552   8]                         Mask : 00000000000000FF

[230h 0560   1]                       Action : 0A [Get Record Count]
[231h 0561   1]                  Instruction : 03 [Write Register Value]
[232h 0562   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[233h 0563   1]                     Reserved : 00

[234h 0564  12]              Register Region : [Generic Address Structure]
[234h 0564   1]                     Space ID : 00 [SystemMemory]
[235h 0565   1]                    Bit Width : 20
[236h 0566   1]                   Bit Offset : 00
[237h 0567   1]         Encoded Access Width : 03 [DWord Access:32]
[238h 0568   8]                      Address : 00000000C1063000

[240h 0576   8]                        Value : 000000000000000A
[248h 0584   8]                         Mask : 00000000000000FF

[250h 0592   1]                       Action : 0A [Get Record Count]
[251h 0593   1]                  Instruction : 00 [Read Register]
[252h 0594   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[253h 0595   1]                     Reserved : 00

[254h 0596  12]              Register Region : [Generic Address Structure]
[254h 0596   1]                     Space ID : 00 [SystemMemory]
[255h 0597   1]                    Bit Width : 20
[256h 0598   1]                   Bit Offset : 00
[257h 0599   1]         Encoded Access Width : 03 [DWord Access:32]
[258h 0600   8]                      Address : 00000000C1063008

[260h 0608   8]                        Value : 0000000000000000
[268h 0616   8]                         Mask : 00000000FFFFFFFF

[270h 0624   1]                       Action : 0B [Begin Dummy Write]
[271h 0625   1]                  Instruction : 03 [Write Register Value]
[272h 0626   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[273h 0627   1]                     Reserved : 00

[274h 0628  12]              Register Region : [Generic Address Structure]
[274h 0628   1]                     Space ID : 00 [SystemMemory]
[275h 0629   1]                    Bit Width : 20
[276h 0630   1]                   Bit Offset : 00
[277h 0631   1]         Encoded Access Width : 03 [DWord Access:32]
[278h 0632   8]                      Address : 00000000C1063000

[280h 0640   8]                        Value : 000000000000000B
[288h 0648   8]                         Mask : 00000000000000FF

[290h 0656   1]                       Action : 0D [Get Error Address Range]
[291h 0657   1]                  Instruction : 03 [Write Register Value]
[292h 0658   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[293h 0659   1]                     Reserved : 00

[294h 0660  12]              Register Region : [Generic Address Structure]
[294h 0660   1]                     Space ID : 00 [SystemMemory]
[295h 0661   1]                    Bit Width : 20
[296h 0662   1]                   Bit Offset : 00
[297h 0663   1]         Encoded Access Width : 03 [DWord Access:32]
[298h 0664   8]                      Address : 00000000C1063000

[2A0h 0672   8]                        Value : 000000000000000D
[2A8h 0680   8]                         Mask : 00000000000000FF

[2B0h 0688   1]                       Action : 0D [Get Error Address Range]
[2B1h 0689   1]                  Instruction : 00 [Read Register]
[2B2h 0690   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[2B3h 0691   1]                     Reserved : 00

[2B4h 0692  12]              Register Region : [Generic Address Structure]
[2B4h 0692   1]                     Space ID : 00 [SystemMemory]
[2B5h 0693   1]                    Bit Width : 40
[2B6h 0694   1]                   Bit Offset : 00
[2B7h 0695   1]         Encoded Access Width : 04 [QWord Access:64]
[2B8h 0696   8]                      Address : 00000000C1063008

[2C0h 0704   8]                        Value : 0000000000000000
[2C8h 0712   8]                         Mask : FFFFFFFFFFFFFFFF

[2D0h 0720   1]                       Action : 0E [Get Error Address Length]
[2D1h 0721   1]                  Instruction : 03 [Write Register Value]
[2D2h 0722   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[2D3h 0723   1]                     Reserved : 00

[2D4h 0724  12]              Register Region : [Generic Address Structure]
[2D4h 0724   1]                     Space ID : 00 [SystemMemory]
[2D5h 0725   1]                    Bit Width : 20
[2D6h 0726   1]                   Bit Offset : 00
[2D7h 0727   1]         Encoded Access Width : 03 [DWord Access:32]
[2D8h 0728   8]                      Address : 00000000C1063000

[2E0h 0736   8]                        Value : 000000000000000E
[2E8h 0744   8]                         Mask : 00000000000000FF

[2F0h 0752   1]                       Action : 0E [Get Error Address Length]
[2F1h 0753   1]                  Instruction : 00 [Read Register]
[2F2h 0754   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[2F3h 0755   1]                     Reserved : 00

[2F4h 0756  12]              Register Region : [Generic Address Structure]
[2F4h 0756   1]                     Space ID : 00 [SystemMemory]
[2F5h 0757   1]                    Bit Width : 40
[2F6h 0758   1]                   Bit Offset : 00
[2F7h 0759   1]         Encoded Access Width : 04 [QWord Access:64]
[2F8h 0760   8]                      Address : 00000000C1063008

[300h 0768   8]                        Value : 0000000000000000
[308h 0776   8]                         Mask : 00000000FFFFFFFF

[310h 0784   1]                       Action : 0F [Get Error Attributes]
[311h 0785   1]                  Instruction : 03 [Write Register Value]
[312h 0786   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[313h 0787   1]                     Reserved : 00

[314h 0788  12]              Register Region : [Generic Address Structure]
[314h 0788   1]                     Space ID : 00 [SystemMemory]
[315h 0789   1]                    Bit Width : 20
[316h 0790   1]                   Bit Offset : 00
[317h 0791   1]         Encoded Access Width : 03 [DWord Access:32]
[318h 0792   8]                      Address : 00000000C1063000

[320h 0800   8]                        Value : 000000000000000F
[328h 0808   8]                         Mask : 00000000000000FF

[330h 0816   1]                       Action : 0F [Get Error Attributes]
[331h 0817   1]                  Instruction : 00 [Read Register]
[332h 0818   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[333h 0819   1]                     Reserved : 00

[334h 0820  12]              Register Region : [Generic Address Structure]
[334h 0820   1]                     Space ID : 00 [SystemMemory]
[335h 0821   1]                    Bit Width : 20
[336h 0822   1]                   Bit Offset : 00
[337h 0823   1]         Encoded Access Width : 03 [DWord Access:32]
[338h 0824   8]                      Address : 00000000C1063008

[340h 0832   8]                        Value : 0000000000000000
[348h 0840   8]                         Mask : 00000000FFFFFFFF

[350h 0848   1]                       Action : 10 [Execute Timings]
[351h 0849   1]                  Instruction : 03 [Write Register Value]
[352h 0850   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[353h 0851   1]                     Reserved : 00

[354h 0852  12]              Register Region : [Generic Address Structure]
[354h 0852   1]                     Space ID : 00 [SystemMemory]
[355h 0853   1]                    Bit Width : 20
[356h 0854   1]                   Bit Offset : 00
[357h 0855   1]         Encoded Access Width : 03 [DWord Access:32]
[358h 0856   8]                      Address : 00000000C1063000

[360h 0864   8]                        Value : 0000000000000010
[368h 0872   8]                         Mask : 00000000000000FF

[370h 0880   1]                       Action : 10 [Execute Timings]
[371h 0881   1]                  Instruction : 00 [Read Register]
[372h 0882   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
[373h 0883   1]                     Reserved : 00

[374h 0884  12]              Register Region : [Generic Address Structure]
[374h 0884   1]                     Space ID : 00 [SystemMemory]
[375h 0885   1]                    Bit Width : 40
[376h 0886   1]                   Bit Offset : 00
[377h 0887   1]         Encoded Access Width : 04 [QWord Access:64]
[378h 0888   8]                      Address : 00000000C1063008

[380h 0896   8]                        Value : 0000000000000000
[388h 0904   8]                         Mask : FFFFFFFFFFFFFFFF

Raw Table Data: Length 912 (0x390)

   0000: 45 52 53 54 90 03 00 00 01 C8 42 4F 43 48 53 20  // ERST......BOCHS
   0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
   0020: 01 00 00 00 30 00 00 00 00 00 00 00 1B 00 00 00  // ....0...........
   0030: 00 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0040: 00 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0050: 01 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0060: 01 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0070: 02 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0080: 02 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0090: 03 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   00A0: 03 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   00B0: 04 02 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
   00C0: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
   00D0: 04 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   00E0: 04 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   00F0: 05 03 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
   0100: 9C 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0110: 05 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0120: 05 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0130: 06 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0140: 06 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0150: 06 01 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
   0160: 01 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0170: 07 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0180: 07 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0190: 07 00 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
   01A0: 00 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   01B0: 08 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   01C0: 08 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   01D0: 08 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
   01E0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
   01F0: 09 02 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
   0200: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
   0210: 09 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0220: 09 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0230: 0A 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0240: 0A 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0250: 0A 00 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
   0260: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
   0270: 0B 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0280: 0B 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0290: 0D 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   02A0: 0D 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   02B0: 0D 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
   02C0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
   02D0: 0E 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   02E0: 0E 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   02F0: 0E 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
   0300: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
   0310: 0F 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0320: 0F 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0330: 0F 00 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
   0340: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
   0350: 10 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
   0360: 10 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
   0370: 10 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
   0380: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................

