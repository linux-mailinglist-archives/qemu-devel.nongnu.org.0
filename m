Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5B354EF3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:48:20 +0200 (CEST)
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lThNj-00057I-Mm
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lThJP-0003kr-Tk; Tue, 06 Apr 2021 04:43:52 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:49162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lThJK-0003iP-GN; Tue, 06 Apr 2021 04:43:51 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1368Y547066767;
 Tue, 6 Apr 2021 08:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=i+g0Cg+MHTn4tyuZYF/Iw3J7uETztvDWg7+TZ0y0f84=;
 b=vIu5i6qL/N2QpBOZmQclUaTAjhIBduTy5k2FF0ftBP6QfFzeZCiaNLwWhAkLeryyvGMS
 RIOAlk3rTtC0s6jN0mjYiAMa5su2E+jMpY02x2qFt3MUpTX0UUeYLBK+roockuMhHuoi
 g9I6wPp257H8k2xU9TNPOdX4EPk4dfA29qGjBAVIrHbJMl1bGROAhPhEOQgcfXSuBKCN
 ArC00bVgY4y5IC/iaZfQJfx04WW2GKwaSJSICHSkBGI72ghKGyI80j2ZyuXbCryUq3DR
 VPyqzUyNQ2y8FBYO27uLWLmUW3j0/3kKgHywbItOJ4Pt3En/NY/JJTbxOxZPTHavnaMX zw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 37q3bwmjj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Apr 2021 08:43:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1368f1fU058242;
 Tue, 6 Apr 2021 08:43:29 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by userp3020.oracle.com with ESMTP id 37q2pu0187-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Apr 2021 08:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNeBSCWn49Oj+FLTX8jcmffu3b5FFoJIN3iZyL9n/UnpBj7ePQE3gO/PFBcG2DXhZ1AU+JXTm5rcEhfuMyfyaDjuH6KUvbFBt1U7dWy6+bKkMinOp0cIrTV8A4pVL1S1yI40Fyc0ZV6AtAXC5/tp7OINztPdasUff0vTRGr3O7kTlbVg7nZRgYkND2EZmlRvL+BlT7btuYXr4R4MecAq0HKf0/AjvNEYVeukZyTagGjXEfOfoR+7DvTEGVBga1h6Ggxq3FW5y5dSqY3mjQdVfwl5mM5YU7QS7nJXAnu9CYhCLnjQuiqQ9OxATitISVFrqJrHvSIbmZVJJkPSBCMFYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+g0Cg+MHTn4tyuZYF/Iw3J7uETztvDWg7+TZ0y0f84=;
 b=lmeKskVbPeOH9W0p5UHjSPGONYBM1WP4ivt/KIze0QKVx/W6RdiHR/GOtLLyWibgFlQ3b9KV/LBBJ8rqMlvAeSH7xPFqCZWfQJk0XddfOwmM71zAkFRo79PqVJqAClMrTzh6pCsGfSALDkQGfLNvk6S+xsHaIS6Hg1QYg4zW/FZwvYj4g3x1SwcPzrbWlVebvMRiSj37EVCkYl3XfGj831jNoGJQDr+k1ygKRo0iP425BxAAxGCiclWgTk1BCIefhCdtlflYvMHzGd2fZuY9GDAK1cjePwV/8n/1zEWX92Akw59jIULZPLTdf9fnrpYjz/GcrzwhH2lQXbFQOmobiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+g0Cg+MHTn4tyuZYF/Iw3J7uETztvDWg7+TZ0y0f84=;
 b=UXsjtYP1XQAX4qX9yAzkyOIxFUSM7pUCl/H+UlKEw+DNZIabbcEg7nI7KuDf0XXJNTCIKlNym6YjfWORnqT0ZWtglsv5T3zVQUWbRD2zfS0kD852arjYDGE2dSEhrAbqC3g3YjaFLrid84yDBZSRa/BojfFCc5o9Wt7/QwcnFe0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3096.namprd10.prod.outlook.com (2603:10b6:a03:151::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 08:43:26 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 08:43:26 +0000
Subject: Re: [PATCH 0/6] Add debug interface to kick/call on purpose
To: Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
 <440216a8-821f-92dd-bc8b-fb2427bdc0e6@redhat.com>
 <d5549b12-d269-a04d-01d2-2dbd1ee7fca0@oracle.com>
 <ceb1f31a-e353-2542-a516-68b49735672c@redhat.com>
 <9248ae00-9a7d-c960-a673-9b3a3ede0452@oracle.com>
 <da0ae46e-da09-5894-21d4-732e5e20d070@redhat.com>
 <2e48f463-0a17-4ffd-c3a6-4a847e0e34c6@oracle.com>
 <5b21b2a2-e3bd-3812-61d7-bd3550cf680f@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <f2a81508-e000-4a48-a023-290d40a77b8e@oracle.com>
Date: Tue, 6 Apr 2021 01:43:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <5b21b2a2-e3bd-3812-61d7-bd3550cf680f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: SN4PR0201CA0045.namprd02.prod.outlook.com
 (2603:10b6:803:2e::31) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 SN4PR0201CA0045.namprd02.prod.outlook.com (2603:10b6:803:2e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Tue, 6 Apr 2021 08:43:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4ca0641-8ee5-44ab-dc47-08d8f8d80b9c
X-MS-TrafficTypeDiagnostic: BYAPR10MB3096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3096DEAA99EC3FC751854AB6F0769@BYAPR10MB3096.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y+6zcB47FIZx5kNC/tOfOBcTdWOsSKKHiSbx6tKc2luoYIwNORRUI4tlCrYBNgsmIkBQ2wKUIekngVB1e7wAh1b2DlBzLWWTXBOrmE0aocAnCAsBcl7EPMFl9931cGgpi1Tw1DWKqOMRdMqiWyjpf+AC69E5XB8BHM7n3A/Gi5OUcoBepVKF3Vmi/1QBDbQRHsayDp3PHl4f+iBrRNjrLHO+YWPGeSkqpQ13u2SqEmtSX2sWtn9gG6dnrDEPtX419ASzetY6tdx7fVuwDRjYcCbbB8xNEGhJohKt9U0In6Uq+sfka23F72wdnwlDdFwJQg/ipqni9VzZdRdjuVk89Utz+sx9nAXWwVuPfxOHgeqmuPzg2ngrg1JQWnH/aZVj9tRsDPAd9pIG/EmWOzzv+2ZEjv0Q/ho0o60wSyuljzazXOHx9YcAjaPCn1m37E1jlSC/hgPAlH1xXvdZ+2dX2VSQW4ecFKq+H54Y0IyHp4BKAVLqrWkHfxgRJMC9U0Lm3+5PoZEdcm2aYn4Yqn1ppNQYPGEIzknKE7Gx+ZZV++B73uXBW96mYOd56zMeWqcPEWoaBH+YcTxcjACIJN5wbFb4eff00tsX8MCcthCMerRQH9A14C8D0Dx8h5QZBjREExga22R0ZM2roJNwSHi1n0Dkco1N+BjUCP/Hrl30JYA+0R/0/Wzkbe77MwFTUgUvSMaCy9vzbFz/Sg51/0RG8ZxupjNcqa0mEqTGf9vKwcCjOdHpN/AyCaPnwjs6/98v9E+hDEtLWqgVQ0/aqUWdwE5l2uLh1LKHPwqVbxPrY9O8CJEZvxmhsTPJF7KJqlNF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(136003)(396003)(346002)(366004)(2906002)(7416002)(86362001)(16526019)(8676002)(186003)(38100700001)(5660300002)(8936002)(44832011)(316002)(53546011)(83380400001)(31696002)(66476007)(30864003)(2616005)(4326008)(31686004)(36756003)(6486002)(966005)(66946007)(66556008)(478600001)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WVVuT2VQanA5bWtRZ084WWR1dnVqdERFcUE4aHJscVhreG1LdU1ZZHVlSEVL?=
 =?utf-8?B?YStTcnVFcWV1VTVlcEhtY3MzQ3pYSHNEaGExaUZhVW9ibVh2aWdiSUI4RGZm?=
 =?utf-8?B?Z1d6NGFvSVZBeTJCTDFPUCtvOFIvcjNYRU55RG83SWd1dDZlcWtVOHFGR2Ft?=
 =?utf-8?B?N3VJQmxQRkIrM1hzL3FTcFZLOFg1UXU5WEN0dVViZlpJV1k4YUgzczFWRktJ?=
 =?utf-8?B?YXpza0tNTm9EUjd4RjRZVGhQUW5QR3hDQS91RTlodkRxQXZiWjgwWE0xdUd0?=
 =?utf-8?B?Uk1vR3ZEb2NrOXZ6NmdaWUVla2pBNnE4Ny9zUWZsRVlyeWRoTGMwUXF0M214?=
 =?utf-8?B?b3JBNzVyQTY4NTdVb2k5NG15NGN1dThwU29xSGtnOUtvaDBUNmx1czFVcEFr?=
 =?utf-8?B?eUdJUU5MUGdsZ3NQZTN2SjN5L3gybGdTYzF4VDYwNmsrcFJ2aEUyZ01SbnVS?=
 =?utf-8?B?MXNrQXAvVjJzbXNxT05xSzVHRDE0R3dxbUhQNDRPR3B0WXhLbWJtRnZ5QTJG?=
 =?utf-8?B?UDZnUzZHeHlyZUZTNVl1cm4vYzlBVzI5NHhRa053WmhqNUZNSkc5YjlsYkJF?=
 =?utf-8?B?dDFBS3Zaa0ZuYnZJTy9yTU96N1dXTHVNRGtUOUdnczVUeDhNczZWMnVZanhB?=
 =?utf-8?B?b0p0U0tmcHJrZWtoV0VuRjV3QWNwUCtDZmYzZEVWK0lVVTZDbXhPL0VPNThy?=
 =?utf-8?B?SFNvY09TaXdrdER2NkRjYnQvUHo4cnJmM21ibCtFWk1tOWRVODZyVjhONVpq?=
 =?utf-8?B?dnIwMmczUVBNMnpHYVUzejIwOHl2ZW9mTlAyZlNGVTJNWGIxVUlyODhBWGlX?=
 =?utf-8?B?YUpBdkVQb3c3UWlhYXRXcFoyN20xWkNRT3cvQ2xCbGRsS3htK3VYeTJQY29m?=
 =?utf-8?B?WXZ1U0Z3YmQweFhzbVB2UW8xV3NLS0dmb2xNOFc2NGlkYXZjeWRzMlAyL2pu?=
 =?utf-8?B?b0RUMXU1Mk9BMk83K2UydVFFZzFJekVFSzlDYmJkdmdwTUhMVTZRaVpZY0c5?=
 =?utf-8?B?YVlUdER5U2drTEkrWnpqKzZLaHZvdFNNRlU2d1A2dWlaRWwrSDY5ZWVRbHhL?=
 =?utf-8?B?MkhWYll0dVFYWlVsY2dtbWhaeWJ0VXROSTlOYUdybzV1U2doUS9WdWlabHNG?=
 =?utf-8?B?NjJkUFJoTGI1am1xZ08wOVY2ZlBpbHFYYmQ3bnRWd3VlbWJVZVNCdGx5R0lQ?=
 =?utf-8?B?Umx1a3VVTXI1UzVYZFVKSWFPTmN0KytvczZpVGZkb1ZVZzdoaWlnMGZUMEN1?=
 =?utf-8?B?ZzZHWmFHdzlVU1VGUXU3N1gvTWdyWVpOeTFkKy9zaURPWHNKcmhhMmFpbTRy?=
 =?utf-8?B?dlk2OUZab2NuYkRnTVVCUzdwWlFQWVh0RzRYQVpRTHpKSTRhZzFkblVFcDZm?=
 =?utf-8?B?bEsrUUZINjQ1cDdFbk9TQ3JjcDJqbzJOWldWcG96UUpOalpTMG40VEd6cmtt?=
 =?utf-8?B?VHN3SWs0UzR3SXVKeVY0OEJWZWFVd2RCRUJYNElrejlwcWhJTk5INXlicVla?=
 =?utf-8?B?RGhneUMwL1BkUEF3d1NRdUsxSGJNSlZObk9USTl2M2FxQWFtL0JMdUl0eEFR?=
 =?utf-8?B?RHRjaWNMcEFITGhwOHJpeTZKcHJtM1hHNitscGYvRFVkVktnSG9qd0w5UzAw?=
 =?utf-8?B?VWp2UFovVTdzRGppRkRHcHFTR2pTK0RaMlM0TnNjK0xuRzNmbFVFWER0ZG85?=
 =?utf-8?B?U2s0eFBCV0U0VnhWckl4TDViNW5HTCtrdExudCt5TXBKN3ZCcXNKVUEzNG1E?=
 =?utf-8?B?R3E4MktDcUNhK0ZkQ2RRdkVUWFpWcG0rYUFGalZsVjhhbUgxVDhlaCtiU25U?=
 =?utf-8?B?akU2MmhsUzQ2Q0dRcDg5QT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ca0641-8ee5-44ab-dc47-08d8f8d80b9c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 08:43:26.5878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/PUvA+QkGYjmV1LeasL3PeHSM+3uJ/aLZ9nfhCEmfmPHZCebKEMobxUFZF7uqxlYl+XZTB+Fco/nTuFbVfn3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3096
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9945
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060060
X-Proofpoint-GUID: 28nERK_BjRTmJ0Lm0mskcy-8dy4r6Bxc
X-Proofpoint-ORIG-GUID: 28nERK_BjRTmJ0Lm0mskcy-8dy4r6Bxc
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9945
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060059
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=dongli.zhang@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/5/21 6:55 PM, Jason Wang wrote:
> 
> 在 2021/4/6 上午4:00, Dongli Zhang 写道:
>>
>> On 4/1/21 8:47 PM, Jason Wang wrote:
>>> 在 2021/3/30 下午3:29, Dongli Zhang 写道:
>>>> On 3/28/21 8:56 PM, Jason Wang wrote:
>>>>> 在 2021/3/27 上午5:16, Dongli Zhang 写道:
>>>>>> Hi Jason,
>>>>>>
>>>>>> On 3/26/21 12:24 AM, Jason Wang wrote:
>>>>>>> 在 2021/3/26 下午1:44, Dongli Zhang 写道:
>>>>>>>> The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
>>>>>>>> the loss of doorbell kick, e.g.,
>>>>>>>>
>>>>>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html__;!!GqivPVa7Brio!KS3pAU2cKjz4wgI4QSlE-YsJPhPG71nkE5_tGhaOf7mi_xvNxbvKkfn03rk5BNDLSEU$
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> ... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
>>>>>>>> fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").
>>>>>>>>
>>>>>>>> This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
>>>>>>>> to help narrow down if the issue is due to loss of irq/kick. So far the new
>>>>>>>> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
>>>>>>>> virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
>>>>>>>> or legacy IRQ).
>>>>>>>>
>>>>>>>> The 'call' is to inject irq on purpose by admin for a specific device
>>>>>>>> (e.g.,
>>>>>>>> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
>>>>>>>> on purpose by admin at QEMU/host side for a specific device.
>>>>>>>>
>>>>>>>>
>>>>>>>> This device can be used as a workaround if call/kick is lost due to
>>>>>>>> virtualization software (e.g., kernel or QEMU) issue.
>>>>>>>>
>>>>>>>> We may also implement the interface for VFIO PCI, e.g., to write to
>>>>>>>> VFIOPCIDevice->msi_vectors[i].interrupt will be able to inject IRQ to VM
>>>>>>>> on purpose. This is considered future work once the virtio part is done.
>>>>>>>>
>>>>>>>>
>>>>>>>> Below is from live crash analysis. Initially, the queue=2 has count=15 for
>>>>>>>> 'kick' eventfd_ctx. Suppose there is data in vring avail while there is no
>>>>>>>> used available. We suspect this is because vhost-scsi was not notified by
>>>>>>>> VM. In order to narrow down and analyze the issue, we use live crash to
>>>>>>>> dump the current counter of eventfd for queue=2.
>>>>>>>>
>>>>>>>> crash> eventfd_ctx ffff8f67f6bbe700
>>>>>>>> struct eventfd_ctx {
>>>>>>>>       kref = {
>>>>>>>>         refcount = {
>>>>>>>>           refs = {
>>>>>>>>             counter = 4
>>>>>>>>           }
>>>>>>>>         }
>>>>>>>>       },
>>>>>>>>       wqh = {
>>>>>>>>         lock = {
>>>>>>>>           {
>>>>>>>>             rlock = {
>>>>>>>>               raw_lock = {
>>>>>>>>                 val = {
>>>>>>>>                   counter = 0
>>>>>>>>                 }
>>>>>>>>               }
>>>>>>>>             }
>>>>>>>>           }
>>>>>>>>         },
>>>>>>>>         head = {
>>>>>>>>           next = 0xffff8f841dc08e18,
>>>>>>>>           prev = 0xffff8f841dc08e18
>>>>>>>>         }
>>>>>>>>       },
>>>>>>>>       count = 15, ---> eventfd is 15 !!!
>>>>>>>>       flags = 526336
>>>>>>>> }
>>>>>>>>
>>>>>>>> Now we kick the doorbell for vhost-scsi queue=2 on purpose for diagnostic
>>>>>>>> with this interface.
>>>>>>>>
>>>>>>>> { "execute": "x-debug-device-event",
>>>>>>>>       "arguments": { "dev": "/machine/peripheral/vscsi0",
>>>>>>>>                      "event": "kick", "queue": 2 } }
>>>>>>>>
>>>>>>>> The counter is increased to 16. Suppose the hang issue is resolved, it
>>>>>>>> indicates something bad is in software that the 'kick' is lost.
>>>>>>> What do you mean by "software" here? And it looks to me you're testing
>>>>>>> whether
>>>>>>> event_notifier_set() is called by virtio_queue_notify() here. If so, I'm not
>>>>>>> sure how much value could we gain from a dedicated debug interface like this
>>>>>>> consider there're a lot of exisinting general purpose debugging method like
>>>>>>> tracing or gdb. I'd say the path from virtio_queue_notify() to
>>>>>>> event_notifier_set() is only a very small fraction of the process of
>>>>>>> virtqueue
>>>>>>> kick which is unlikey to be buggy. Consider usually the ioeventfd will be
>>>>>>> offloaded to KVM, it's more a chance that something is wrong in setuping
>>>>>>> ioeventfd instead of here. Irq is even more complicated.
>>>>>> Thank you very much!
>>>>>>
>>>>>> I am not testing whether event_notifier_set() is called by
>>>>>> virtio_queue_notify().
>>>>>>
>>>>>> The 'software' indicates the data processing and event notification mechanism
>>>>>> involved with virtio/vhost PV driver frontend. E.g., while VM is waiting
>>>>>> for an
>>>>>> extra IRQ, vhost side did not trigger IRQ, suppose vring_need_event()
>>>>>> erroneously returns false due to corrupted ring buffer status.
>>>>> So there could be several factors that may block the notification:
>>>>>
>>>>> 1) eventfd bug (ioeventfd vs irqfd)
>>>>> 2) wrong virtqueue state (either driver or device)
>>>>> 3) missing barriers (either driver or device)
>>>>> 4) Qemu bug (irqchip and routing)
>>>>> ...
>>>> This is not only about whether notification is blocked.
>>>>
>>>> It can also be used to help narrow down and understand if there is any
>>>> suspicious issue in blk-mq/scsi/netdev/napi code. The PV drivers are not only
>>>> drivers following virtio spec. It is closely related to many of other kernel
>>>> components.
>>>>
>>>> Suppose IO was recovered after we inject an IRQ to vhost-scsi on purpose, we
>>>> will be able to analyze what may happen along the IO completion path starting
>>>> from when /where the IRQ is injected ... perhaps the root cause is not with
>>>> virtio but blk-mq/scsi (this is just an example).
>>>>
>>>>
>>>> In addition, this idea should help for vfio-pci. Suppose the developer for a
>>>> specific device driver suspects IO/networking hangs because of loss if IRQ, we
>>>> will be able to verify if that assumption is correct by injecting an IRQ on
>>>> purpose.
>>>>
>>>> Therefore, this is not only about virtio PV driver (frontend/backend), but also
>>>> used to help analyze the issue related to entire IO/networking/passthrough
>>>> virtualization stacks, especially in production env where the issue can only be
>>>> reproduced randomly.
>>>
>>> So it looks to me you'd better having things like this in the EventNotifier
>>> layer and introduce qmp commands to write/read that instead of starting with a
>>> virtio specific commands. Or it might be even helpful to start from some
>>> counters for event notifiers which could be accessed via monitor to help to for
>>> debugging to start with which is much more safe in the environment of
>>> production. Having artifical events are always dangerous.
>>
>> The EventNotifier is just fd used by different QEMU components. There is not a
>> way to track each EventNotifier used by a QEMU process so that I do not think we
>> are able to track at EventNotifier layer, unless we add extra code to track the
>> init/uninit of each eventfd, or modify kernel.
>>
>> That's try I introduced "DeviceEvent event" to "struct DeviceClass" so that each
>> device type will be able to customize its own way to track its eventfd list.
>>
>>
>> Would you prefer "write to a specific eventfd for a specific QEMU device",
>> instead of "kick/call for a specific device"?
> 
> 
> It might be better. But note that eventfd is Linux specific, that's why we need
> do it at higher level (EventNotifier level to make it work for e.g win).
> 
> And it might be even better to start with reading the counters.

Is it possible to read from eventfd without modifying kernel?

QEMU has only event_notifier_test_and_clear(). According to kernel code, to read
from eventfd will decreate ctx->count as line 190.

185 void eventfd_ctx_do_read(struct eventfd_ctx *ctx, __u64 *cnt)
186 {
187         lockdep_assert_held(&ctx->wqh.lock);
188
189         *cnt = (ctx->flags & EFD_SEMAPHORE) ? 1 : ctx->count;
190         ctx->count -= *cnt;
191 }

Can I assume it is not appropriate to read from eventfd?

> 
> 
>>
>>
>>>
>>>>> Consider we want to debug virtio issue, only 2) or 3) is what we really cared>
>>>>> So for kick you did (assume vhost is on):
>>>>>
>>>>> virtio_device_event_kick()
>>>>>       virtio_queue_notify()
>>>>>           event_notifier_set()
>>>>>
>>>>> It looks to me you're actaully testing if ioeventfd is correctly set by Qemu.
>>>>>
>>>>> For call you did:
>>>>>
>>>>> virtio_device_event_call()
>>>>>       event_notifier_set()
>>>>>
>>>>> A test of irqfd is correctly set by Qemu. So all of those are not virtio
>>>>> specific stuffs but you introduce virtio specific command to do debug non
>>>>> virtio
>>>>> functions.
>>>>>
>>>>> In the case of what you mentioned for vring_need_event(), what we really
>>>>> want is
>>>>> to dump the virtqueue state from the guest. This might requries some work of
>>>>> extending virtio spec (e.g to dump device status like indices, event, wrap
>>>>> counters).
>>>> Suppose the issue is only randomly reproducible in production env, we should
>>>> always take 4) into consideration because we will not be able to know where is
>>>> the root cause at the very beginning of bug analysis.
>>>
>>> So if it truns out to be an issue of irqchip, how will you do the debugging
>>> then? I guess what's really helpful is a qmp command to dump irqchip
>>> status/information.
>> Thank you very much for suggestion. That will be a different problem and we may
>> consider as future work.
>>
>> This patchset is about to do introduce change/events to help narrow down where
>> may be the root case in order to facilitate diagnostic (especially for prod env
>> issue and when it is not easy to reproduce).
>>
>>>
>>>>>> This was initially proposed for vhost only and I was going to export
>>>>>> ioeventfd/irqfd from vhost to admin via sysfs. Finally, I realized I would
>>>>>> better implement this at QEMU.
>>>>>>
>>>>>> The QEMU inits the eventfd (ioeventfd and irqfd), and offloads them to
>>>>>> KVM/vhost. The VM side sends requests to ring buffer and kicks the doorbell
>>>>>> (via
>>>>>> ioeventfd), while the backend vhost side sends responses back and calls
>>>>>> the IRQ
>>>>>> (via ioeventfd).
>>>>>>
>>>>>> Unfortunately, sometimes there is issue with virtio/vhost so that
>>>>>> kick/call was
>>>>>> missed/ignored, or even never triggered. The example mentioned in the
>>>>>> patchset
>>>>>> cover letter is with virtio-net (I assume vhost=on), where a kick to ioventfd
>>>>>> was ignored, due to pci-bridge/hotplug issue.
>>>>> So this is not a good example since it was a chipset bug. You need to use
>>>>> other
>>>>> tool to debug chipset code isn't it?
>>>> As this issue is reproducible only randomly, we will not be able to realize it
>>>> is a chipset bug at the very beginning.
>>>>
>>>> While the link is about vhost-net, it is applicable to vhost-scsi as well.
>>>> Suppose DEBUG_UNASSIGNED is not enabled, the developer will need to investigate
>>>> all of blk-mq, scsi, virtio-scsi (ioeventfd), vhost-scsi (target), pci-bridge
>>>> and pci-hotplug, in order to identify the root case.
>>>>
>>>> The "call/kick" interface is used to narrow down and verify the analysis,
>>>> especially when many kernel components are involved.
>>>>
>>>>>> The hotplug is with a very small window but the IO hangs permanently. I did
>>>>>> test
>>>>>> that kicking the doorbell again will help recover the IO, so that I would be
>>>>>> able to conclude this was due to lost of kick.
>>>>>>
>>>>>> The loss of irq/doorbell is painful especially in production environment
>>>>>> where
>>>>>> we are not able to attach to QEMU via gdb. While the patchset is only for
>>>>>> QEMU,
>>>>>> Xen PV driver used to experience loss of IRQ issue as well, e.g., linux
>>>>>> kernel
>>>>>> commit 4704fe4f03a5 ("xen/events: mask events when changing their VCPU
>>>>>> binding").
>>>>> So looking at the git history we can see it has little possibility that the
>>>>> missing is due to virtio/vhost itself. So the commit you mention here is not
>>>>> good as well since it's not a netfront/netbackend bug.
>>>> I mentioned the xen issue just to explain that the loss of event/irq issue may
>>>> happen and is very painful. Another xen example is (equivalent to KVM VFIO):
>>>>
>>>> https://urldefense.com/v3/__https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=56348df32bbc782e63b6e3fb978b80e015ae76e7__;!!GqivPVa7Brio!JY2OqmcXAmza_G2gR-dQwV2Oa0hGG_6trVkxSUMocoYi4A_VXwZbzVn_VA9yx10i7Hk$
>>>>
>>>
>>>
>>> Sorry, I can't figure out how is this related to VFIO or virtio. It should be
>>> reproducible for devices without using eventfd?
>>>
>> Yes, although not involving eventfd, other drivers/virtualization may encounter
>> the loss of irq/kick as well. There is no relation between xen and vfio/virtio.
>>
>> That's why a diagnostic interface is appreciated.
>>
>> In my opinion, the 'diagnostic' is not only to collect data,
> 
> 
> Usually, collecting the data is the first step :)
> 
> 
>>   but also to
>> introduce event/change (e.g., inject IRQ) and then monitor/observe what will
>> happen to the stalled VM.
> 
> 
> It might be helpful yes, but it's also very dangerous.
> 
> 
>>
>>>> That's why I mentioned this idea helps for VFIO (not only VFIO, but actually
>>>> blk-mq+nvme+pci+kvm+vfio, assuming it is for nvme passthrough) as well.
>>>>
>>>>> So for the case of event call, what you did is:
>>>>>
>>>>> satic void virtio_device_event_call(VirtQueue *vq, bool eventfd,
>>>>>                                        Error **errp)
>>>>> {
>>>>> #ifdef DEBUG_VIRTIO_EVENT
>>>>>       printf("The 'call' event is triggered for path=%s, queue=%d,
>>>>> irqfd=%d.\n",
>>>>>              object_get_canonical_path(OBJECT(vq->vdev)),
>>>>>              vq->queue_index, eventfd);
>>>>> #endif
>>>>>
>>>>>       if (eventfd) {
>>>>>           virtio_set_isr(vq->vdev, 0x1);
>>>>>           event_notifier_set(&vq->guest_notifier);
>>>>>       } else {
>>>>>           virtio_irq(vq);
>>>>>       }
>>>>> }
>>>>>
>>>>> This means, when eventfd is set, you bypasses the MSI mask which is very
>>>>> dangerous to make it used in the case of production environment. And if you
>>>>> check masking, it won't help a lot if the MSI is masked wrongly.
>>>> You are right.
>>>>
>>>> Only the vhost-net is dangerous because it masks a vector by registering an
>>>> alternative masked_notifier to KVM, while virtio-blk/vhost-scsi/virtio-scsi
>>>> will
>>>> un-register the guest notifier.
>>>>
>>>>>> This can help "narrow down" if the IO/networking hang is due to loss of
>>>>>> IRQ/doorbell issue (or VM MSI-x is erroneously masked), especially in
>>>>>> production
>>>>>> env. This can also be used as a workaround so that VM owner will not need to
>>>>>> reboot VM.
>>>>> So having such extra workaround is pretty dangerous in production environemnt
>>>>> where I think we need to be conservative which means we need to collect
>>>>> information instead of generating artificial event.
>>>>>
>>>>> And it doesn't help if the wrokaround can be triggered through management API.
>>>> I agree with this.
>>>>
>>>> This depends on the administrator. This workaround should only be used in very
>>>> limited and special case.
>>>>
>>>>>> In addition, the VFIO will benefit from it. We will be able to test if to
>>>>>> inject
>>>>>> IRQ on purpose helps when the driver (e.g., PCI, NVMe, Ethernet) developers
>>>>>> blame the hang is caused by loss of IRQ with KVM/VFIO.(It seems there is more
>>>>>> chance to loose IRQ during CPU hotplug or changing IRQ affinity).
>>>>>>
>>>>>>> I think we could not gain much for introducing an dedicated mechanism for
>>>>>>> such a
>>>>>>> corner case.
>>>>>> As replied by Dave for prior RFC, the QEMU already supports
>>>>>> hmp_ioport_write to
>>>>>> trigger an ioport write on purpose.
>>>>> If that applies. I would rather have a hmp_mem_write then we can test both MSI
>>>>> and doorbell. But again, they are very dangerous to be used in production
>>>>> envronment.
>>>> This is just not convenient for production env administrator. We will need to
>>>> first obtain the virtio pci info (e.g., via "lspci -vv"), and then prepare for
>>>> the command after calculating the address of doorbell.
>>>>
>>>> Something bad may happen if the developer did not calculate the address
>>>> correctly.
>>>
>>> It won't be worse than hmp_ioport_write I think?
>> I always believe it is worth adding hmp_mem_write().
>>
>> While it won't be worse than hmp_ioport_write(), in my opinion, it is not as
>> easy/convenient as to write to eventfd.
>>
>>>
>>>> It should be much more easier for developer to just ask administrator to "call"
>>>> queue X for a specific virtio device.
>>>
>>> We can have the commands like "info virtio" which can show all the MSI/doorbell
>>> information for user to use. Or limit its use for virtio and vfio device only to
>>> avoid unexpected result.
>> So far the method by this patchset is to introduce "DeviceEvent event" to
>> "struct DeviceClass".
>>
>> Only virtio-pci-xxx and vfio (future work) will implement this interface.
>>
>>
>>>
>>>>>> The linux block layer also supports the below to kick the IO queue on
>>>>>> purpose.
>>>>>>
>>>>>> echo "kick" > /sys/kernel/debug/block/sda/state
>>>>> This might be fine for hardware device but not virtio. The device can
>>>>> choose to
>>>>> poll the virtqueue instead of depending of the doorbell to work. And for
>>>>> networking subsystem, we don't have such stuffs, instead ethtool support to
>>>>> dump
>>>>> ring and vendor specific stuffs which could be used for dumping virtqueue
>>>>> state
>>>>> in this case.
>>>> This is just another example to help explain the philosophy behind the
>>>> "kick/call" idea: sometimes to trigger the event on purpose will help us narrow
>>>> down and verify our analysis of a kernel bug, especially a bug that is only
>>>> randomly reproducible in production environment.
>>>>
>>>>
>>>> I understand it is possibly not proper to introduce such interface to QEMU.
>>>> That's why I used to send out the RFC.
>>>>
>>>> https://urldefense.com/v3/__https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg03441.html__;!!GqivPVa7Brio!JY2OqmcXAmza_G2gR-dQwV2Oa0hGG_6trVkxSUMocoYi4A_VXwZbzVn_VA9yu-n97gA$
>>>>
>>>>
>>>> In my opinion, this interface is pretty useful when the diagnostic invokes many
>>>> kernel components, or when developers from different components are working on
>>>> the same bug, no matter whether the root cause is at virtio or not.
>>>
>>> So for virtio, it's not hard to events without those interface. E.g for
>>> networking you can generate some traffic and trace on where-ever you suspect
>>> that could block the event (kick/call).
>> Suppose the vhost-net backend is TUN. Once virtio-net RX path is stuck and its
>> vring is full, the ring used by tun_net_xmit()-->ptr_ring_produce() will be full
>> as well. I do not have a way to generate traffic for RX path in such situation.
> 
> 
> Right, but as discussed, we need interface to dump virtqueue state, then it
> would be very easy to start with.
> 
> 
>>
>>> I still prefer hmp_mem_write()/read() which looks more generic, in the same
>>> time, we can add more debug informaiton likes:
>>>
>>> 1) satistics like eventfd counters
>>> 2) device information, register layout, doorbell/MSI-X information
>>> 3) irqchip infromation
>> Would you mind help for below questions?
>>
>> 1. Regardless about kick/call or hmp_mem_write(), is it safe to add such
>> interfaces? I think it is safe because:
>>
>> (1) This affects only specific VM (QEMU), not all/others.
>>
>> (2) It is dangerous only when sysadmin triggers the events on purpose. If this
>> interface is dangerous, both "(qemu) mce 0 1 0xb200000000000000 0x0 0x0 0x0" (to
>> inject uncorrected error) and "echo c > /proc/sysrq-trigger" (to crash kernel)
>> will be dangerous as well.
>>
>> (3) While this is implemented for only vhost-scsi-pci and vhost-vhost-pci, I do
>> not see issue for host kernel. It will be security bug if to read/write eventfd
>> from userspace crashes kernel space.
>>
>> (4) We primarily use this interface when VM is running into issue (unless we use
>> it as workaround).
> 
> 
> Besides the above, I think it's only "safe" if we clearly define the semanic of
> this command. E.g:
> 
> 1) Does it work at EventNotifier (eventfd) level or virtio/vfio level?

I am still confused with the difference between EventNotifier level and
virtio/vfio level.

There is not a global mechanism to track the EventNotifier used by each device.
We will still need per-device-type interface to dump EventNotifier for each device.

Please see more below.

> 2) Can it bypass the masking?

This is a good question and please see below for the answer.

> 
> 
>>
>>
>> 2. Is it fine to add such interface to QEMU software upstream, or such interface
>> is not good for software upstream so that the interface should be added only
>> when QEMU is customized for specific products' usage?
> 
> 
> We can listen to the comments from other experts on the list. But I think having
> a generic trigger at EventNotifier level should be ok.

Would you mind share and confirm if this is what you are looking for?

To dump EventNotifier for each device.

(qemu) x-debug-device-event-notifier /machine/peripheral/vscsi0 dump

... list all event-notifier related to this device ...


Write to a specific EventNotifier. The id is from prior dump.

(qemu) x-debug-device-event-notifier /machine/peripheral/vscsi0 write <dump id>

... print which event-notifier is written to ...


This will answer your question that "Can it bypass the masking?".

For vhost-scsi, virtio-blk, virtio-scsi and virtio-net, to write to eventfd is
not able to bypass masking because masking is to unregister the eventfd. To
write to eventfd does not take effect.

However, it is possible to bypass masking for vhost-net because vhost-net
registered a specific masked_notifier eventfd in order to mask irq. To write to
original eventfd still takes effect.

We may leave the user to decide whether to write to 'masked_notifier' or
original 'guest_notifier' for vhost-net.

Thank you very much!

Dongli Zhang


> 
> Thanks
> 
> 
>>
>>
>> We may discuss how, e.g., hmp_mem_write() vs. kick/call if it is fine to add
>> such interfaces.
>>
>> Thank you very much!
>>
>> Dongli Zhang
>>
> 

