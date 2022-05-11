Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA940523B3D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 19:15:14 +0200 (CEST)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nopvd-0000bV-SL
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 13:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nopow-0000Vk-16
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:08:19 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:18814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nopos-0006J7-S5
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:08:17 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BD8UO8013934;
 Wed, 11 May 2022 10:08:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=n/Zc7Y4NK4ivR86w/rhz0niIrIedi+1buY3eHI4J8n8=;
 b=ZU6PSAHlDG3AskpD55+m5zj/BtHUZKH3zYDVGShlp08mXA0vP9YCZPigcY6+EVFy0fV+
 olhXi/rnQH+I5+k+ezanEJSrh3UFSt0uVaXy6G96emv5gSMlji0o+XTw4AzZODKRFm00
 9kIReJC23OuDkqoQRQEwSP3tdKUzZqVDuXRl9F4BPF9nW3/XGbPYh86Ag1P3ipXTLZRg
 N4ZCQOcNccK0brHP+b+H7TPyyAZ1x+L5b2zsnPtydHuGGYWLTqitH/aroFaMUNysolM2
 jktSol0VDcw2ZWWWY9a71zYW36A2+eAsyZJJfPu0yLD+oF7SmHbS+wkOtN/kaKbEr2L2 7A== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3fwrdp8wqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 10:08:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Scpb4B04ZMi5N+8rLwKjU9K4ty/Y0W9+YxyNclV5nkHBvcXDCIZXE50s5gug3Zy4FxiEgSEkrNT1pmhBGjfvv6ZQZNb4rCVbSQa/XUUSbTDnXkKioyR4GJB/Lm9cFTIpRpW5qbl4S2oLujbPGWalXybiCuQ6ilzi3cymRl17cvZIGhsqLV5WzIPUJm6EogB76wUmPZo8JN5dIqZ16QvHxJUyka4viajbTcO4Ka1VbiQM787cAe1gtbPz82sntDlFUYMCdSaIgA4TGjvpXwkPt4dqX7QVVH9cJiOPx2SMH79pwJeDajz1B+dNzx5jXow/HPXIeDHjHEgzrgGUAAKFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/Zc7Y4NK4ivR86w/rhz0niIrIedi+1buY3eHI4J8n8=;
 b=ZWLtKyYJYlWaZH5fss8vOikukr2YJsxNxjutAuj/ogZBlbwuwTcGZTLELhD3iLxj462TTFMr2K3R2n7t/yuEEd9deHjXbYcRlkM5OIqFmvtCpPeSixCUkIVe4sslmgChv4ujh1CdQwMeh9FXpEIPP3EqoekuS8vCdxBCfGnI4YR4/I5pzLpePbRr1Rhy/7rRU0nZN+g0a/Q1qjBN6qQDUnBwJ6E1VT0Cvk9xd/4LDKN5YmNTppNP415N4T7rhrpn73/Y53+VbPFsoksSwnkXrHyP1nT/mhnRUhSEantVvzSBLT5P1hf9IqeCgKNXcTe3PeCgC2udlhTulRWCiK3/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB7112.namprd02.prod.outlook.com (2603:10b6:510:1c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 17:08:10 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 17:08:10 +0000
Message-ID: <d1bb73d6-ed34-f15c-f56d-407cdb571c08@nutanix.com>
Date: Wed, 11 May 2022 22:38:00 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v5 11/21] migration: Postcopy preemption preparation on
 channel creation
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-12-peterx@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20220425233847.10393-12-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 646a4575-6391-4221-8e6a-08da3370d305
X-MS-TrafficTypeDiagnostic: PH0PR02MB7112:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB7112CD06596B4CF3311FDF54F6C89@PH0PR02MB7112.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtwP4y7DkCEwHl8+iQ91/0UhuzwqgW2+LMiaV5POhA8IcUsgyz7PjHaMkTUv1ZyTyF8WxOZajpvzBwqioQJ1Q84DRuFJk5i8UZQjsISUaN1LGlAYt8x+b2Rx5NJTsmsykcxezi2YzXFb34RfbYlNith1Nl6t8oiGr8vsTopPVm/kAwWdYw67iSp9FLCSZECHqabRm9qR7N9NqkW/BFyjI6tZpzxW1P2icDeP4CipIP0R2jkF00QKsGoVUR/psxZqADLcz8Of6YTvc2GH2Qb+ZEyIZgHuinDHNvvP4YrUE5CrCghP3+CYJfxvqf9b08auT7qlwrl96xadfFiop/nVeFi+elFLSPgu7Thpmzz7wiDidMQEyW1C75xfDpBI2gnar/p8yYWapd+uqmhAtvP7trvEAH8Z0Wa76CNmE+hQP+nW3ViUrauJJlDnZTeiZDg5Pg0ds5VlZ5+teCvlQzDIr0uH+cFB2d3rH2HHSeK0YwW1g3khDxFyaKB6cl++H8hr/nfbD+aKzGL6EvcGEch2AFlDCNHhNLOjv8utGSoRjoptncSHtQ+N++PoCNFd2NVxhA91N5P8fEouQ6GY1I8yQtFGWFtXMsYhMgmObN13y3dCXt5bq4FZdKcXpxRPC+jVBxHDFJcWXugwOPB6frrMTvYkvpvBhsJ7xRyJxkkqmRw//041gPVIeHQSKQDgBUJParvj2tOx5sWP3xyp4UdKKDd1jLUsvqcggNaZM2jRhvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(84040400005)(83380400001)(36756003)(2616005)(8936002)(66476007)(8676002)(54906003)(66556008)(66946007)(4326008)(38100700002)(31686004)(31696002)(53546011)(26005)(6512007)(6486002)(30864003)(316002)(508600001)(2906002)(5660300002)(186003)(6666004)(6506007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlMyVUNvbFJBK01uSmF6R3dmTlZqNDNrcGIwaXBRMTlCZ0JoUmluSzJyaTAx?=
 =?utf-8?B?TjUraXFFNWdpUHJlY2w2YWt4V3ozNTJYc21LUDA2aVZFWDMrYmIySnoxRUpM?=
 =?utf-8?B?SEZaTlJ4cm1vcWxnMHl0Q2RkekNyZHJZOFpoTVZTZEVua3Y4Mm5XdTFLTldJ?=
 =?utf-8?B?aGlVdHB3UERidm41R2oxMzg0SGVPdmdPL3VXKzFVZHdEMGIzM2tFeUgyeU5k?=
 =?utf-8?B?MUZnMjFRamdXU1Zvb01rVGRMdGdZNUw1OWw4cU9NR0JtbUpvTWIyc0xWWWR3?=
 =?utf-8?B?bEZaRjZIZVZ5WkZEN29QR0Y5QXMwM3V3UXJIbTNPWGFaVkttREFVMHhtQzFy?=
 =?utf-8?B?bS90eHdMalJLdVpMK1pYd0dVcVRuaEVBL3drMjFPc2xQSERKd2ZWc3RXUWVS?=
 =?utf-8?B?Wm5TTm00eGZYdEdqYW0rNEtUVmltUVFibHRiMmZKSkNXZWpiM2p6Y3FJeWhG?=
 =?utf-8?B?T3RwNnd5STRZRjlpNnJCVDhOdTRKQ0ozWThITmZUZXRuNFBnZmthME1rUjFi?=
 =?utf-8?B?Q0JUR1JmUm5xL09iN2s1cDlxUXF3UkxRSjl4TmFLdWZHeDBXUUR4QzIySER1?=
 =?utf-8?B?OUF5M2Q3OGJhSC9TdllvT1BhOG1ROXliQnFIVGhVSmVKTGJMdHlsY2xpNGZX?=
 =?utf-8?B?UUJzeHRDMVZSYXVLWEZObUpiRVVrR1FXVmNxc0lwODJzcnZOQzlvU2JvNWNH?=
 =?utf-8?B?dHU0ZnhxaVZNMmh4T3hNVWlpeVFSUnRZSWk2VzBZZFlRd1QxenhSeS9KQ1cz?=
 =?utf-8?B?VThNOE1hbmwzTlVCWVRqVWFJT2JpVzJKNklYYmxVdzBpbEFyRm96d0Z6ODA2?=
 =?utf-8?B?V0pCMFZhOFFTV0FYSGRkSnNseUhuVUlwYnFUbW8weEl0QTJhdWt2U21ydFVp?=
 =?utf-8?B?WUZZNW94WWc4aDdsZFV5MlFNcUhvamJFOHZWTmJROFh0b01wZ3BicnVLbC9G?=
 =?utf-8?B?emt0RkVCUXRBcEhjdkNqdTY5RDl1UEJFTGQxVnF5TDFDSGxpOFNjMGR6YU9J?=
 =?utf-8?B?L1dxL2dvWG1mQmNVWkFONkhkcWJxWFR2dlljZmlFM0JLRHgxd04zNHNUKzRl?=
 =?utf-8?B?MCswMzhwQ1IzUVg3RlFMWFNUZTcxdkRuMjEvNDlzSG9ZWkNSRWl4RXd1WW9l?=
 =?utf-8?B?enh4NVpjTldZVndqUTJKcm1HSENFbWVSd3FEazJLakZtRjJHM055SGlSV0hT?=
 =?utf-8?B?NlVoa2RoWHEyRkhNcytvbXQzQkJoYW5NblNQeEFDdlZCVjFrWUd5K3RBd2l3?=
 =?utf-8?B?WUpXSXYyMFhYNzcyU3k0bnJ2aEExbnlHSnFVQnhCZHlpODNGRVJJSFFJbGlT?=
 =?utf-8?B?NnVub29LdWxuSUFYL01weFpEUk1NZ0RKT3FoejE5Vi83eERhczJWVjZiOWMr?=
 =?utf-8?B?bXBYWm9EWnpRUEh5TFBqZmlxYk16aEFpcjZrRlhGOTlkY0ZDYm9naGpnOVp0?=
 =?utf-8?B?bTYzQWc1UUUrVDYvSDVYSE1JemRGcVBCTzBvZENJc0NrNHFERmxvaUpTb3JD?=
 =?utf-8?B?aUg4NThPQkU0N2FhcTk3QmZuQjMweDF1R1U5RzUzZi9Jc0JLTEI1UldoRjFQ?=
 =?utf-8?B?ZVVQZmwwNDFNUllZSWNDNUhuSWRkN1BrbEV2Q3JIYkM4dEx6REhGTXJQd1p1?=
 =?utf-8?B?bnYvSTFoTm1VaC9VbnEwRms3SDFVOTIxUzlqdTJXTEoyamFwTHQzRm9aenFz?=
 =?utf-8?B?bmk2eHpuditSNEhqYzJ0NTRFTXBIKzFZWWx6eis2NG1DNFhnQ1MvY1V6ZUFC?=
 =?utf-8?B?NHNIZHFJYWtzdHQvU2RUcGlzVkdDSkdNTzNHOStpcFNocUdtRHdERTBQWGhN?=
 =?utf-8?B?K1lXKy9Cd2Rmc2hBMEdaeEdlY3A0SEp5ZzQyRjYxMTkvYnlzb1h4YjY5THBN?=
 =?utf-8?B?S1NObCs1MDNmSTZ4ZjVQNjZ1ZUJCczJKQU9qbEJkcTNoUHFSNkFpSVJnOUl1?=
 =?utf-8?B?bFJGWktzUHB2bEMvM1d2ZGF6RzB4M3I3Mk9CYVY2SVV4MTRxRlRJMFlocDhH?=
 =?utf-8?B?U1RZcUJ2cThXR3A3VldSR0VNL2sxRlkxelVzN2NFT2Z6R1VHRXpQaURFNEtT?=
 =?utf-8?B?YWhabnNjSWNEQmhZY21SWi9INE1SUFhvaDNyNEJTdDZ4aGQ5aXlqVmF5VGRO?=
 =?utf-8?B?c0RIbjBvNXFPeEJHaEhRODB0REhwQTdUTVVnSk9ldldReGh1QzhCT0QxUTEw?=
 =?utf-8?B?SUdqTWJ5Vm52UEFid2gyS3J5dUlHR2dubWJhNEhhUlZ1VTFUKytmYy9SQmsz?=
 =?utf-8?B?UTVaNk1objdEVXo2NXVaVWNpZy95WDh2cW1YVUVobFNZK0NPbGZMSHNlRTJI?=
 =?utf-8?B?WmFrQTZ5NitodkpyblV3S05YeHgxNTNVRE1acFNFWXdxUU9lMWVqSlA1MVFa?=
 =?utf-8?Q?dAu8FQ7LYQcmWwdk=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646a4575-6391-4221-8e6a-08da3370d305
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 17:08:10.1212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mesUNBdRp46nDr1mIald5h5A+GfoC7IjDpUi+u+Rj9n219ZH7mjPNzogoACeX49bsX60DISo2OP4NEUwJINWA6Pmh2I7pt8UNFL7QtgUgBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7112
X-Proofpoint-GUID: KOSxYPYv-2habZHJCFPQMggRwg8Sl0aM
X-Proofpoint-ORIG-GUID: KOSxYPYv-2habZHJCFPQMggRwg8Sl0aM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URG_BIZ=0.573 autolearn=no autolearn_force=no
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

LGTM

On 26/04/22 5:08 am, Peter Xu wrote:
> Create a new socket for postcopy to be prepared to send postcopy requested
> pages via this specific channel, so as to not get blocked by precopy pages.
>
> A new thread is also created on dest qemu to receive data from this new channel
> based on the ram_load_postcopy() routine.
>
> The ram_load_postcopy(POSTCOPY) branch and the thread has not started to
> function, and that'll be done in follow up patches.
>
> Cleanup the new sockets on both src/dst QEMUs, meanwhile look after the new
> thread too to make sure it'll be recycled properly.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   migration/migration.c    | 62 +++++++++++++++++++++++----
>   migration/migration.h    |  8 ++++
>   migration/postcopy-ram.c | 92 ++++++++++++++++++++++++++++++++++++++--
>   migration/postcopy-ram.h | 10 +++++
>   migration/ram.c          | 25 ++++++++---
>   migration/ram.h          |  4 +-
>   migration/savevm.c       | 20 ++++-----
>   migration/socket.c       | 22 +++++++++-
>   migration/socket.h       |  1 +
>   migration/trace-events   |  5 ++-
>   10 files changed, 218 insertions(+), 31 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 75d9185c3a..e27aa306bc 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -321,6 +321,12 @@ void migration_incoming_state_destroy(void)
>           mis->page_requested = NULL;
>       }
>   
> +    if (mis->postcopy_qemufile_dst) {
> +        migration_ioc_unregister_yank_from_file(mis->postcopy_qemufile_dst);
> +        qemu_fclose(mis->postcopy_qemufile_dst);
> +        mis->postcopy_qemufile_dst = NULL;
> +    }
> +
>       yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>   }
>   
> @@ -714,15 +720,21 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
>       migration_incoming_process();
>   }
>   
> +static bool migration_needs_multiple_sockets(void)
> +{
> +    return migrate_use_multifd() || migrate_postcopy_preempt();
> +}
> +
>   void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>   {
>       MigrationIncomingState *mis = migration_incoming_get_current();
>       Error *local_err = NULL;
>       bool start_migration;
> +    QEMUFile *f;
>   
>       if (!mis->from_src_file) {
>           /* The first connection (multifd may have multiple) */
> -        QEMUFile *f = qemu_fopen_channel_input(ioc);
> +        f = qemu_fopen_channel_input(ioc);
>   
>           if (!migration_incoming_setup(f, errp)) {
>               return;
> @@ -730,13 +742,18 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>   
>           /*
>            * Common migration only needs one channel, so we can start
> -         * right now.  Multifd needs more than one channel, we wait.
> +         * right now.  Some features need more than one channel, we wait.
>            */
> -        start_migration = !migrate_use_multifd();
> +        start_migration = !migration_needs_multiple_sockets();
>       } else {
>           /* Multiple connections */
> -        assert(migrate_use_multifd());
> -        start_migration = multifd_recv_new_channel(ioc, &local_err);
> +        assert(migration_needs_multiple_sockets());
> +        if (migrate_use_multifd()) {
> +            start_migration = multifd_recv_new_channel(ioc, &local_err);
> +        } else if (migrate_postcopy_preempt()) {
> +            f = qemu_fopen_channel_input(ioc);
> +            start_migration = postcopy_preempt_new_channel(mis, f);
> +        }
>           if (local_err) {
>               error_propagate(errp, local_err);
>               return;
> @@ -761,11 +778,20 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>   bool migration_has_all_channels(void)
>   {
>       MigrationIncomingState *mis = migration_incoming_get_current();
> -    bool all_channels;
>   
> -    all_channels = multifd_recv_all_channels_created();
> +    if (!mis->from_src_file) {
> +        return false;
> +    }
> +
> +    if (migrate_use_multifd()) {
> +        return multifd_recv_all_channels_created();
> +    }
> +
> +    if (migrate_postcopy_preempt()) {
> +        return mis->postcopy_qemufile_dst != NULL;
> +    }
>   
> -    return all_channels && mis->from_src_file != NULL;
> +    return true;
>   }
>   
>   /*
> @@ -1862,6 +1888,12 @@ static void migrate_fd_cleanup(MigrationState *s)
>           qemu_fclose(tmp);
>       }
>   
> +    if (s->postcopy_qemufile_src) {
> +        migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
> +        qemu_fclose(s->postcopy_qemufile_src);
> +        s->postcopy_qemufile_src = NULL;
> +    }
> +
>       assert(!migration_is_active(s));
>   
>       if (s->state == MIGRATION_STATUS_CANCELLING) {
> @@ -3237,6 +3269,11 @@ static void migration_completion(MigrationState *s)
>           qemu_savevm_state_complete_postcopy(s->to_dst_file);
>           qemu_mutex_unlock_iothread();
>   
> +        /* Shutdown the postcopy fast path thread */
> +        if (migrate_postcopy_preempt()) {
> +            postcopy_preempt_shutdown_file(s);
> +        }
> +
>           trace_migration_completion_postcopy_end_after_complete();
>       } else {
>           goto fail;
> @@ -4124,6 +4161,15 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>           }
>       }
>   
> +    /* This needs to be done before resuming a postcopy */
> +    if (postcopy_preempt_setup(s, &local_err)) {
> +        error_report_err(local_err);
> +        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> +                          MIGRATION_STATUS_FAILED);
> +        migrate_fd_cleanup(s);
> +        return;
> +    }
> +
>       if (resume) {
>           /* Wakeup the main migration thread to do the recovery */
>           migrate_set_state(&s->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
> diff --git a/migration/migration.h b/migration/migration.h
> index af4bcb19c2..caa910d956 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -23,6 +23,7 @@
>   #include "io/channel-buffer.h"
>   #include "net/announce.h"
>   #include "qom/object.h"
> +#include "postcopy-ram.h"
>   
>   struct PostcopyBlocktimeContext;
>   
> @@ -112,6 +113,11 @@ struct MigrationIncomingState {
>        * enabled.
>        */
>       unsigned int postcopy_channels;
> +    /* QEMUFile for postcopy only; it'll be handled by a separate thread */
> +    QEMUFile *postcopy_qemufile_dst;
> +    /* Postcopy priority thread is used to receive postcopy requested pages */
> +    QemuThread postcopy_prio_thread;
> +    bool postcopy_prio_thread_created;
>       /*
>        * An array of temp host huge pages to be used, one for each postcopy
>        * channel.
> @@ -192,6 +198,8 @@ struct MigrationState {
>       QEMUBH *cleanup_bh;
>       /* Protected by qemu_file_lock */
>       QEMUFile *to_dst_file;
> +    /* Postcopy specific transfer channel */
> +    QEMUFile *postcopy_qemufile_src;
>       QIOChannelBuffer *bioc;
>       /*
>        * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index a66dd536d9..e92db0556b 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -33,6 +33,9 @@
>   #include "trace.h"
>   #include "hw/boards.h"
>   #include "exec/ramblock.h"
> +#include "socket.h"
> +#include "qemu-file-channel.h"
> +#include "yank_functions.h"
>   
>   /* Arbitrary limit on size of each discard command,
>    * keeps them around ~200 bytes
> @@ -567,6 +570,11 @@ int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
>   {
>       trace_postcopy_ram_incoming_cleanup_entry();
>   
> +    if (mis->postcopy_prio_thread_created) {
> +        qemu_thread_join(&mis->postcopy_prio_thread);
> +        mis->postcopy_prio_thread_created = false;
> +    }
> +
>       if (mis->have_fault_thread) {
>           Error *local_err = NULL;
>   
> @@ -1102,8 +1110,13 @@ static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
>       int err, i, channels;
>       void *temp_page;
>   
> -    /* TODO: will be boosted when enable postcopy preemption */
> -    mis->postcopy_channels = 1;
> +    if (migrate_postcopy_preempt()) {
> +        /* If preemption enabled, need extra channel for urgent requests */
> +        mis->postcopy_channels = RAM_CHANNEL_MAX;
> +    } else {
> +        /* Both precopy/postcopy on the same channel */
> +        mis->postcopy_channels = 1;
> +    }
>   
>       channels = mis->postcopy_channels;
>       mis->postcopy_tmp_pages = g_malloc0_n(sizeof(PostcopyTmpPage), channels);
> @@ -1170,7 +1183,7 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
>           return -1;
>       }
>   
> -    postcopy_thread_create(mis, &mis->fault_thread, "postcopy/fault",
> +    postcopy_thread_create(mis, &mis->fault_thread, "fault-default",
>                              postcopy_ram_fault_thread, QEMU_THREAD_JOINABLE);
>       mis->have_fault_thread = true;
>   
> @@ -1185,6 +1198,16 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
>           return -1;
>       }
>   
> +    if (migrate_postcopy_preempt()) {
> +        /*
> +         * This thread needs to be created after the temp pages because
> +         * it'll fetch RAM_CHANNEL_POSTCOPY PostcopyTmpPage immediately.
> +         */
> +        postcopy_thread_create(mis, &mis->postcopy_prio_thread, "fault-fast",
> +                               postcopy_preempt_thread, QEMU_THREAD_JOINABLE);
> +        mis->postcopy_prio_thread_created = true;
> +    }
> +
>       trace_postcopy_ram_enable_notify();
>   
>       return 0;
> @@ -1514,3 +1537,66 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
>           }
>       }
>   }
> +
> +bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
> +{
> +    /*
> +     * The new loading channel has its own threads, so it needs to be
> +     * blocked too.  It's by default true, just be explicit.
> +     */
> +    qemu_file_set_blocking(file, true);
> +    mis->postcopy_qemufile_dst = file;
> +    trace_postcopy_preempt_new_channel();
> +
> +    /* Start the migration immediately */
> +    return true;
> +}
> +
> +int postcopy_preempt_setup(MigrationState *s, Error **errp)
> +{
> +    QIOChannel *ioc;
> +
> +    if (!migrate_postcopy_preempt()) {
> +        return 0;
> +    }
> +
> +    if (!migrate_multi_channels_is_allowed()) {
> +        error_setg(errp, "Postcopy preempt is not supported as current "
> +                   "migration stream does not support multi-channels.");
> +        return -1;
> +    }
> +
> +    ioc = socket_send_channel_create_sync(errp);
> +
> +    if (ioc == NULL) {
> +        return -1;
> +    }
> +
> +    migration_ioc_register_yank(ioc);
> +    s->postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
> +
> +    trace_postcopy_preempt_new_channel();
> +
> +    return 0;
> +}
> +
> +void *postcopy_preempt_thread(void *opaque)
> +{
> +    MigrationIncomingState *mis = opaque;
> +    int ret;
> +
> +    trace_postcopy_preempt_thread_entry();
> +
> +    rcu_register_thread();
> +
> +    qemu_sem_post(&mis->thread_sync_sem);
> +
> +    /* Sending RAM_SAVE_FLAG_EOS to terminate this thread */
> +    ret = ram_load_postcopy(mis->postcopy_qemufile_dst, RAM_CHANNEL_POSTCOPY);
> +
> +    rcu_unregister_thread();
> +
> +    trace_postcopy_preempt_thread_exit();
> +
> +    return ret == 0 ? NULL : (void *)-1;
> +}
> diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
> index 07684c0e1d..34b1080cde 100644
> --- a/migration/postcopy-ram.h
> +++ b/migration/postcopy-ram.h
> @@ -183,4 +183,14 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd, uint64_t client_addr,
>   int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
>                                    uint64_t client_addr, uint64_t offset);
>   
> +/* Hard-code channels for now for postcopy preemption */
> +enum PostcopyChannels {
> +    RAM_CHANNEL_PRECOPY = 0,
> +    RAM_CHANNEL_POSTCOPY = 1,
> +    RAM_CHANNEL_MAX,
> +};
> +
> +bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
> +int postcopy_preempt_setup(MigrationState *s, Error **errp);
> +
>   #endif
> diff --git a/migration/ram.c b/migration/ram.c
> index a2489a2699..f5615e0a76 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3644,15 +3644,15 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis)
>    * rcu_read_lock is taken prior to this being called.
>    *
>    * @f: QEMUFile where to send the data
> + * @channel: the channel to use for loading
>    */
> -int ram_load_postcopy(QEMUFile *f)
> +int ram_load_postcopy(QEMUFile *f, int channel)
>   {
>       int flags = 0, ret = 0;
>       bool place_needed = false;
>       bool matches_target_page_size = false;
>       MigrationIncomingState *mis = migration_incoming_get_current();
> -    /* Currently we only use channel 0.  TODO: use all the channels */
> -    PostcopyTmpPage *tmp_page = &mis->postcopy_tmp_pages[0];
> +    PostcopyTmpPage *tmp_page = &mis->postcopy_tmp_pages[channel];
>   
>       while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
>           ram_addr_t addr;
> @@ -3676,7 +3676,7 @@ int ram_load_postcopy(QEMUFile *f)
>           flags = addr & ~TARGET_PAGE_MASK;
>           addr &= TARGET_PAGE_MASK;
>   
> -        trace_ram_load_postcopy_loop((uint64_t)addr, flags);
> +        trace_ram_load_postcopy_loop(channel, (uint64_t)addr, flags);
>           if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
>                        RAM_SAVE_FLAG_COMPRESS_PAGE)) {
>               block = ram_block_from_stream(mis, f, flags);
> @@ -3717,10 +3717,10 @@ int ram_load_postcopy(QEMUFile *f)
>               } else if (tmp_page->host_addr !=
>                          host_page_from_ram_block_offset(block, addr)) {
>                   /* not the 1st TP within the HP */
> -                error_report("Non-same host page detected.  "
> +                error_report("Non-same host page detected on channel %d: "
>                                "Target host page %p, received host page %p "
>                                "(rb %s offset 0x"RAM_ADDR_FMT" target_pages %d)",
> -                             tmp_page->host_addr,
> +                             channel, tmp_page->host_addr,
>                                host_page_from_ram_block_offset(block, addr),
>                                block->idstr, addr, tmp_page->target_pages);
>                   ret = -EINVAL;
> @@ -4107,7 +4107,12 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
>        */
>       WITH_RCU_READ_LOCK_GUARD() {
>           if (postcopy_running) {
> -            ret = ram_load_postcopy(f);
> +            /*
> +             * Note!  Here RAM_CHANNEL_PRECOPY is the precopy channel of
> +             * postcopy migration, we have another RAM_CHANNEL_POSTCOPY to
> +             * service fast page faults.
> +             */
> +            ret = ram_load_postcopy(f, RAM_CHANNEL_PRECOPY);
>           } else {
>               ret = ram_load_precopy(f);
>           }
> @@ -4269,6 +4274,12 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
>       return 0;
>   }
>   
> +void postcopy_preempt_shutdown_file(MigrationState *s)
> +{
> +    qemu_put_be64(s->postcopy_qemufile_src, RAM_SAVE_FLAG_EOS);
> +    qemu_fflush(s->postcopy_qemufile_src);
> +}
> +
>   static SaveVMHandlers savevm_ram_handlers = {
>       .save_setup = ram_save_setup,
>       .save_live_iterate = ram_save_iterate,
> diff --git a/migration/ram.h b/migration/ram.h
> index ded0a3a086..5d90945a6e 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -61,7 +61,7 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms);
>   /* For incoming postcopy discard */
>   int ram_discard_range(const char *block_name, uint64_t start, size_t length);
>   int ram_postcopy_incoming_init(MigrationIncomingState *mis);
> -int ram_load_postcopy(QEMUFile *f);
> +int ram_load_postcopy(QEMUFile *f, int channel);
>   
>   void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
>   
> @@ -73,6 +73,8 @@ int64_t ramblock_recv_bitmap_send(QEMUFile *file,
>                                     const char *block_name);
>   int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *rb);
>   bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t start);
> +void postcopy_preempt_shutdown_file(MigrationState *s);
> +void *postcopy_preempt_thread(void *opaque);
>   
>   /* ram cache */
>   int colo_init_ram_cache(void);
> diff --git a/migration/savevm.c b/migration/savevm.c
> index d9076897b8..ecee05e631 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2575,16 +2575,6 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
>   {
>       int i;
>   
> -    /*
> -     * If network is interrupted, any temp page we received will be useless
> -     * because we didn't mark them as "received" in receivedmap.  After a
> -     * proper recovery later (which will sync src dirty bitmap with receivedmap
> -     * on dest) these cached small pages will be resent again.
> -     */
> -    for (i = 0; i < mis->postcopy_channels; i++) {
> -        postcopy_temp_page_reset(&mis->postcopy_tmp_pages[i]);
> -    }
> -
>       trace_postcopy_pause_incoming();
>   
>       assert(migrate_postcopy_ram());
> @@ -2613,6 +2603,16 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
>       /* Notify the fault thread for the invalidated file handle */
>       postcopy_fault_thread_notify(mis);
>   
> +    /*
> +     * If network is interrupted, any temp page we received will be useless
> +     * because we didn't mark them as "received" in receivedmap.  After a
> +     * proper recovery later (which will sync src dirty bitmap with receivedmap
> +     * on dest) these cached small pages will be resent again.
> +     */
> +    for (i = 0; i < mis->postcopy_channels; i++) {
> +        postcopy_temp_page_reset(&mis->postcopy_tmp_pages[i]);
> +    }
> +
>       error_report("Detected IO failure for postcopy. "
>                    "Migration paused.");
>   
> diff --git a/migration/socket.c b/migration/socket.c
> index 05705a32d8..a7f345b353 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -26,7 +26,7 @@
>   #include "io/channel-socket.h"
>   #include "io/net-listener.h"
>   #include "trace.h"
> -
> +#include "postcopy-ram.h"
>   
>   struct SocketOutgoingArgs {
>       SocketAddress *saddr;
> @@ -39,6 +39,24 @@ void socket_send_channel_create(QIOTaskFunc f, void *data)
>                                        f, data, NULL, NULL);
>   }
>   
> +QIOChannel *socket_send_channel_create_sync(Error **errp)
> +{
> +    QIOChannelSocket *sioc = qio_channel_socket_new();
> +
> +    if (!outgoing_args.saddr) {
> +        object_unref(OBJECT(sioc));
> +        error_setg(errp, "Initial sock address not set!");
> +        return NULL;
> +    }
> +
> +    if (qio_channel_socket_connect_sync(sioc, outgoing_args.saddr, errp) < 0) {
> +        object_unref(OBJECT(sioc));
> +        return NULL;
> +    }
> +
> +    return QIO_CHANNEL(sioc);
> +}
> +
>   int socket_send_channel_destroy(QIOChannel *send)
>   {
>       /* Remove channel */
> @@ -158,6 +176,8 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
>   
>       if (migrate_use_multifd()) {
>           num = migrate_multifd_channels();
> +    } else if (migrate_postcopy_preempt()) {
> +        num = RAM_CHANNEL_MAX;
>       }
>   
>       if (qio_net_listener_open_sync(listener, saddr, num, errp) < 0) {
> diff --git a/migration/socket.h b/migration/socket.h
> index 891dbccceb..dc54df4e6c 100644
> --- a/migration/socket.h
> +++ b/migration/socket.h
> @@ -21,6 +21,7 @@
>   #include "io/task.h"
>   
>   void socket_send_channel_create(QIOTaskFunc f, void *data);
> +QIOChannel *socket_send_channel_create_sync(Error **errp);
>   int socket_send_channel_destroy(QIOChannel *send);
>   
>   void socket_start_incoming_migration(const char *str, Error **errp);
> diff --git a/migration/trace-events b/migration/trace-events
> index 1aec580e92..4bc787cf0c 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -91,7 +91,7 @@ migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned
>   migration_throttle(void) ""
>   ram_discard_range(const char *rbname, uint64_t start, size_t len) "%s: start: %" PRIx64 " %zx"
>   ram_load_loop(const char *rbname, uint64_t addr, int flags, void *host) "%s: addr: 0x%" PRIx64 " flags: 0x%x host: %p"
> -ram_load_postcopy_loop(uint64_t addr, int flags) "@%" PRIx64 " %x"
> +ram_load_postcopy_loop(int channel, uint64_t addr, int flags) "chan=%d addr=0x%" PRIx64 " flags=0x%x"
>   ram_postcopy_send_discard_bitmap(void) ""
>   ram_save_page(const char *rbname, uint64_t offset, void *host) "%s: offset: 0x%" PRIx64 " host: %p"
>   ram_save_queue_pages(const char *rbname, size_t start, size_t len) "%s: start: 0x%zx len: 0x%zx"
> @@ -278,6 +278,9 @@ postcopy_request_shared_page(const char *sharer, const char *rb, uint64_t rb_off
>   postcopy_request_shared_page_present(const char *sharer, const char *rb, uint64_t rb_offset) "%s already %s offset 0x%"PRIx64
>   postcopy_wake_shared(uint64_t client_addr, const char *rb) "at 0x%"PRIx64" in %s"
>   postcopy_page_req_del(void *addr, int count) "resolved page req %p total %d"
> +postcopy_preempt_new_channel(void) ""
> +postcopy_preempt_thread_entry(void) ""
> +postcopy_preempt_thread_exit(void) ""
>   
>   get_mem_fault_cpu_index(int cpu, uint32_t pid) "cpu: %d, pid: %u"
>   

