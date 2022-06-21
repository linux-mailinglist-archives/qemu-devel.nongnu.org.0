Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67754552990
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 05:00:06 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3U7Z-00055F-1k
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 23:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=317189cffd=zhe.he@windriver.com>)
 id 1o3U5y-0004Jd-Lo; Mon, 20 Jun 2022 22:58:26 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:63166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=317189cffd=zhe.he@windriver.com>)
 id 1o3U5v-000695-Ur; Mon, 20 Jun 2022 22:58:26 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L2qcB8025714;
 Mon, 20 Jun 2022 19:58:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=t7WL4iWaoQaLBKHHDZSPk/PQw9i41Hc/btqhL0c82pY=;
 b=cYbNM8UN2DzzuoVh4UZWMDfGf35DQoH13g0n6uubf65hsFZUgxDYjiG6VP3BHyQ13omG
 XVWFYNZE+ll+aJZCMnf3KOiZvSfNzJVUBYtdPVjyWZnttpVCJQ8tYA6OZpl6MBrPpmrs
 2wr8LVTBzX8Xnnndd7gbr6XzNCM8bk1TyIV06PrV26Z+oESY8Wdi/QqFy5pIvNn2VbcM
 cjU/DWjeqlLZl94lgGh00H/RZb9oMvoApraGlZjjMSCKLnZ/ezz4HEO+tuOnJG+Y5rO9
 qZEhCyJzaA7y1DlS5H/93mv01ZeZF3tDtLBmZ46Vlt2kNmZru0S4iJnbG69LiEtF1827 sQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gse7ksnd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 19:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrXlj1IXH8Fk5yft+IIu1huiP+uxj8N3/dgaqClM1V8DsH4sO7k3Llez6AiERQwlLaWjq9JlaVdQIJFumMd5BSYI1ov2dg9OGy+vgRGJ6NeIjTQJdEFgwlgsJsQCvGrdBCEtMBrfrl0DUJzVwAvK5MBrBbzuFFZUUSq1Q1lK9BWuOVlZm+fW3AStOKE4tQQxD5l6o2BT5e2zMUCJgqw4OmN9B9u/ldcUgxRl5KuOIZPZ5Kw+AVecQEUMTP1MH0RL/zoRHKQ29u9b2Gm26Yg97bMp8Dh+DXfhaZKPUJBGSrWudndwfSKHNEnUZyR9BsrBxWTfm4RUtwGL+LEm7dCouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7WL4iWaoQaLBKHHDZSPk/PQw9i41Hc/btqhL0c82pY=;
 b=MypDXLoq4l2tOYFVdeWIjMqDakwZ4MQf7tqY7a6vXfEKGEvNqrCIZj9G7pN2dZMXuyEbyWE6VU3gDUV8w/p9e9uNitXsWURZGyfGqVSGu47UFv/VLNg5sdTB5n4+hQniBQ+CWfWizpBmYusMB9bKlp1Kxvn9z8DGTd1viAwgUPdcWxKHC7cFROXcU3w45stsyuLRSbaBt5hdcTVF0r69MxTFDgxYqdKrTZnV8CiglSn1RKi7lUXCdxFnjTg8SRN1rEkHBTGs0j/S1c9Pa0fEvVa8f54SIzqpB1fge3IBrsBXdJBicniA8VGmWgPXlEogQUbu6ZAM6i+ckhnxB3yZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by BN9PR11MB5306.namprd11.prod.outlook.com (2603:10b6:408:137::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Tue, 21 Jun
 2022 02:58:10 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::e962:2a9c:c503:db56]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::e962:2a9c:c503:db56%10]) with mapi id 15.20.5353.022; Tue, 21 Jun
 2022 02:58:09 +0000
Message-ID: <7538efd6-c943-7db0-8eda-5a61eae7f912@windriver.com>
Date: Tue, 21 Jun 2022 10:57:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] target/arm: Fix issue 1078
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220619001541.131672-1-richard.henderson@linaro.org>
From: He Zhe <zhe.he@windriver.com>
In-Reply-To: <20220619001541.131672-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58ca83a7-538a-431e-d280-08da5331df74
X-MS-TrafficTypeDiagnostic: BN9PR11MB5306:EE_
X-Microsoft-Antispam-PRVS: <BN9PR11MB53060E5AEC4EBB4A949F23AF8FB39@BN9PR11MB5306.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPEDd4M+jQ5+08imYzlIn5SODi/q3DrGmufpOautuEzGtVB2CY+le6WibKpsB6q6bvTl3XwIxI4T010XqOwAAKXKVxva393zTXC6h96XFPhg7XBYw+NYE/+cScKa2WNJ1Zt5NSX5+OdXUp/K9QWmUidSS6ITW2UcIkp2+OSkcOUu2jWlLXlxI8210m0W88OdTX46Wq/I5KbSvsxTBJamju7tNEyxLKHuMmNiwqhQVEmQHNeaIA1p+hhUZTaN/mAna6lyaEjuQbf+jjUdXKmJ1qlQZ6Cu3kv0vp9IZsUWyvhMydiU6X2xB20PDxvqo/rLRUEuzXaKvJSto6kwj/cU+zenbjLrx2wMAuNw8cGI6qF6de27iEQBaYV2n9m54aBcE3bzW+9vLjBw6+UzHeFz3+juLpbYyzg9tTsJ+aUjITrPwu2CkCub5mBsv4BAQFC7TGACrd9roOZQaO30bUWQ4Wxck/GtMysYVRKFKzeKUAhQ2j4y1fvg3WpWe2vMay+8ej/2fPNuukPQgzHtcLm+W+qAryPvR02311FylN6RqSsO0O3LxYWwSxFbJbLLeHFmoK0o5v+0xjl/XGNDU+WyadGFa7JzIV04xPBa8U6V3W6WAUk9Vn18Z41ne7CMe+caBOzjursskwc0Soq/WJ7taT2KAcFsKSJC1OH9/AJvsTv3/PWwLbkNCpe6Vt6OkZmw4yC5T7V6550/013/MFsX+uboLTIwxz8Z34RNJ81byGvPZVrbJ6TYtL6y+WEPtYeZCkUbkNUAj5/odCRcpXEyNZCCgolW93C+XKJSeAPiO5Aig0mS/P6urgk+BIiWhpfv/PzcRjn0+d0rbyLGLJkoA1TcoieVaIYeelLWVyyFrWg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(6486002)(36756003)(31686004)(66556008)(4326008)(2906002)(66946007)(66476007)(186003)(83380400001)(966005)(8936002)(478600001)(316002)(38100700002)(8676002)(53546011)(31696002)(6512007)(4744005)(41300700001)(52116002)(2616005)(38350700002)(5660300002)(26005)(86362001)(6666004)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M29CZ1hkZ2FSVDdJK0x2UTBmU2RVaUxsSGZsckZwRUhqd1NOam5LZE4zV0Iz?=
 =?utf-8?B?UjFJWiswMk8vTkVZMk1ZK2diMHhFZllEc0kvNHE4TnJkVndhTi81QzJaZ1pz?=
 =?utf-8?B?QU93TVVMYVZSRDVqMTk3eHJUZVJoM1o1aHI5SlhGSzErVldJOW1yamZLdDVD?=
 =?utf-8?B?bkF3MCszWnVKTGxWczcxT0k4QUdYeG9BalJJUFJsaDRKTlkyaXZDWUF0ZEIr?=
 =?utf-8?B?ekhzWHhQNFhIc2NXODJrZnlqYXUrcHRXOU1rTEpkenAwVWVLYWxmZ2hFTHFu?=
 =?utf-8?B?ZHV3ak84NGhqM25rSm9EZ24rRGJKUlZNdUxZeG9NQjNOc2UxNzhyTmRUdGNl?=
 =?utf-8?B?M1dIMzBsa2VpRXZXRDNuaysxd0wyL0hjY3BySE9TVHNSOFE0VS9vVmpFaDBt?=
 =?utf-8?B?UTJGWk02b2ZuYjJXdGRyNVphU0JQcFhQbTBsQVRGSlNpcDFtd0RiN0x6QlpM?=
 =?utf-8?B?YTlGdGtlSE04SnV0cXExZlhsei81ak1WNytPZ3pSU3BURnFIMU9OYmxCVWZO?=
 =?utf-8?B?WkVnMG0rWWlhVHhsZ0Zpa1ZWOEFMSW1wYU82cWpUMzIyWVN5dThLcnIzK1hh?=
 =?utf-8?B?ZjJqVlEzYjc0QXNQKzIzWHM0TlhmNXlQRjhjL0I0Z2tPL1o3TklvdFNaUXRm?=
 =?utf-8?B?Z1U0ODdHQUlxUzJocTFYWS9oSlN4TWhuVnh0azJRZzNCQVdwdFZYS0s1TWRZ?=
 =?utf-8?B?S3lHbWJYa3lEeWlMYnN1OGlFZCtGK3lSRnUrZFU1aEo1K2JnVHRUY0JEdkor?=
 =?utf-8?B?aFRSeXIwYjRNTVRwcyt0dm9nYlJTYUNwbnZrN1pXUnBPWlRnb3BMd1hSVVlN?=
 =?utf-8?B?aVd6Q084TzlPN1huaGxjbXYxcTl0dFdFZE5nUFV6aHN1b0VBWnpsRVVuZDA4?=
 =?utf-8?B?dDZGL3JTSW8vZHNIVGVuRXoxZFF0cXkvNGIwdzQ1OEFuTnFsL01hTmdjRkJS?=
 =?utf-8?B?RzJvQXBVelI0UjFVdDhsaEhUcFFqYU9OK0ZUUmFEYjkzeHM4MS94M1o0YnRz?=
 =?utf-8?B?S050bGtVUjhvNkx6TitPUVNXNjdjNWNGYW9Rc2RwUk1QZk0vMWJsY0F5Y1lX?=
 =?utf-8?B?a3RHK2o3b0VTZi8rejRidzVycGtiblkwbHVEK1lVT2piVnc4eTVuaDZiZGJn?=
 =?utf-8?B?N2E3VFM3emNNWnprVG1XYUxWd1dhWmlrM09ueW5TRXNzY25pSlJ6ZFNzNGxN?=
 =?utf-8?B?dW5SK2M0Zm9sa1l5V3krMEF3RlRjVHJwMWQ4Ny9ibnVPWnowOXhEYU9Nb0g2?=
 =?utf-8?B?ZWhBUmVGaTIxOTZHdXhxWG4wU2FmazdZRk5BMXc1ZlhlNFNEangzMGdHM2p0?=
 =?utf-8?B?djlYMGdXV0lLVmswelRLSXBUZ1p4cTd5MTV0cDliam83cW15U1NZcS9RUjlz?=
 =?utf-8?B?VmVJcG5LWERQcVNReEFSZGowSDQrZDZsbG9OaGkzY2l0dU1aNDFRZzFubkI2?=
 =?utf-8?B?WkRSdUZWR2FJRFp4VEtJNThxamhQTHVhZzZoOGt3dkdPbVNkNEFFUDRhUHZ2?=
 =?utf-8?B?SDB6V2pvVTkxTmxYK3VIdWtCOUlWc3N3Y3lUMTdXYk04eGN3MzlPUUZ4QjhH?=
 =?utf-8?B?T0c3VlRmZWNCL0ZqVHhFNmUwbWdxVE1TU3AvRC81MndtODZRbXFJSFJZMy9C?=
 =?utf-8?B?Zk1XazM4bG9wenhqUXBUWk1zTDByS3NZb3BRMitsWGg4OG9Jamp3YlBma25L?=
 =?utf-8?B?cUxIMWptOUFuMzMrVXh6Yk1ZOVZ4SGJHY0p2UGtqeDdYQlg5U3BsWVF4K3pn?=
 =?utf-8?B?UlJGZlcwdDgvaUltNVFEYUExNERNZjlxa0RTV2MxTjFIQW5DVlMyZTFkZVN1?=
 =?utf-8?B?Z0JwZ0l3RkpOZGxhdFlZTlZZY1NacGNTczBER3lqbmpJYzhBOUxGWmdmdlVr?=
 =?utf-8?B?ZFRZQnl4cEFVMGJsVkdrUUFVZkczYStPbmplYk01UCszeWhZK1AxYlYzeUF4?=
 =?utf-8?B?cG1GdmFaeFlxeFJ2djRnTHJLK1p0UU1ZbG1TWVU1dFNtYUgwT2FYVVh1TTFP?=
 =?utf-8?B?NVdJUVdjdzQ5ZWxKcnplMzNvS3h3dEp5MUZrQU9uQllkOXVPWlF0K3RjUExy?=
 =?utf-8?B?RnU3NUFCdE1KM1o5K25NNXZ6TlhIaTVOb3dZbFFEZUVyem5jeEJSbVdGZzVS?=
 =?utf-8?B?RFdkNU9QdW9ueEttWk1QMkJPWVRIR01yZktCMTEwb2Q2bDZ0VUI0b2dGUFpy?=
 =?utf-8?B?M3Vsb3RTSWZEQloxbjBSMjhQNXRYaXUyUXc2bStOZ2c3dmFSTU1uVXM2UE5J?=
 =?utf-8?B?UU9GYU0xUUJSNlpncXRhY2ZIN0NhWHFFNGZyZkR3Y3RiWW4wZEZXYUFMTkRp?=
 =?utf-8?B?WHphUGsyZjZkU0RZVVUxRlV4UXJORWdDcWNJb09vdmIwRGdWREhsUT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ca83a7-538a-431e-d280-08da5331df74
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 02:58:09.6793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1lC7IYI0WBKZc99Krnaq1qpIp+/6vF5eItTZ++OzXSLXSNo4bcxxPgCgCfTY0Ewj0osyaI+R/jIvbbydHM02w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5306
X-Proofpoint-GUID: GtzJgWSGJOyFeVaKIWiMldSS-DEPzcst
X-Proofpoint-ORIG-GUID: GtzJgWSGJOyFeVaKIWiMldSS-DEPzcst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_01,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1011
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=926
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210010
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=317189cffd=zhe.he@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/19/22 08:15, Richard Henderson wrote:
> Nicely summarized by the reporter, but I thought it would be
> nicer to pull all of the logic into arm_pamax, rather than
> leave it separated.

Reported-by: He Zhe <zhe.he@windriver.com>

I ran a quick test. qemu still hangs with these two commits applied.

One fact that might help, qemu can boot up successfully if the change of the
following commit is reverted.
https://gitlab.com/qemu-project/qemu/-/commit/39a1fd25287f5dece59fdf4752491faf59310296
The change had been moved to target/arm/ptw.c.

Zhe

>
>
> r~
>
>
> Richard Henderson (2):
>   target/arm: Extend arm_pamax to more than aarch64
>   target/arm: Check V7VE as well as LPAE in arm_pamax
>
>  hw/arm/virt.c    | 10 +---------
>  target/arm/ptw.c | 26 ++++++++++++++++++++------
>  2 files changed, 21 insertions(+), 15 deletions(-)
>


