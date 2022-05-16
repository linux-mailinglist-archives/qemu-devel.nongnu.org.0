Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21590528958
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:58:41 +0200 (CEST)
Received: from localhost ([::1]:58078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqd7I-0002pf-5o
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqcWV-0008Mm-42
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:20:39 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:56832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqcWS-00059e-9n
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:20:38 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24GA0LkU017516;
 Mon, 16 May 2022 08:20:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=3PJxJrJtKOpfm44Cw3Wa1yHhZrUx1262VDv4AY67jvs=;
 b=HhcGihoRQS3SfSJvT1LYvK8nruq6HCuhPbMcDSl4Ru/BBg17+RwqpQjtKt3VGz0UOMr/
 VMOC+DhtRTna6HexirQzro/fZCO97iS1B+W7wzS+1WhalQVLmBiuBc51J0Fj3Ssy0UuU
 hvTc0VtckhQzk47Qt00y/EpIiaPosLLmI/y6ACanglfJK6LxNRBy4J+UnbEreGKbKqkM
 4d9qSW3J59dvb5CTL9+MGWcloF0fLKs3VLkzeFf1yj3BLDUlJNLFiOyp2GlfYjZPC4TL
 Wq3q4l8Szslvogjp1Rz5jJxRiyGqzGnfh4Ur4S0z7ZbPqrTK01NsIQgEe1M962Tb1f7B kQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3g2byykj6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 08:20:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boBGKqsogpY7YZ7fMZibTbbcNmam2WVUtFoMSrNfrfOVsXc6NHCmnBVd5ef0/N8o3fF85AqIa1q4u0nUZu2aJzGrit0PbgjRD7BP/Rqr8hjOU5JcZHqMFXDYCDaht2/X5WX8uh8bQ0qVkAsLiHln1zY7I5R2n+I6H2nX/mgiZAzBtPAwSP5aFx9NbQ9LhwdzRHTh10pdLbIVpU3E/2QaNPk/ubhXqLK5wX50G05E+8N3BgA5Kd/avbPbOwXbY6RhWG141IhKyhowTnnCwtse5ZOSO7npTa6YtSUnQgD/v2MdsfRUH9PQ2AR6TIwYUnNPHnO5t6E6XqpLYdg9taZWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PJxJrJtKOpfm44Cw3Wa1yHhZrUx1262VDv4AY67jvs=;
 b=Sbc0MypIhlcsjv+Z9SodGjviIRVJjtuEElBXS6F94FgCJmSvtHfzEjQGGR7MVY2/2SOLgAajECEaMXgqg2apLXuvtVlUOq59B/cOTLujEXwphz7zYPUjxwcYhRwB2+aJKWlseiuf3CNpC5FYmQy/aNSCatOaBi2Sj90szmrV1h6fpmKD4kkAhJYeYf4B6BxHg3/S1DsJ0uVddE/B+oAuEhhQwL6x0k7fmJew2wdUPaA9rcj25ZLmatlDo6nTgmYjjEfjhi2inLrdRJycWTCM+bzknCgYCXzWFXcu5Dsyiad3g9UG82PakXqqA3VUebXyTprFMYp+tQzhuIKK8KtSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BYAPR02MB5799.namprd02.prod.outlook.com (2603:10b6:a03:128::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 15:20:28 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 15:20:28 +0000
Content-Type: multipart/alternative;
 boundary="------------g0GO0WS3Tck8mibfhhoP0E5e"
Message-ID: <c03d9f6f-1b00-f428-53fe-c5e0a737421c@nutanix.com>
Date: Mon, 16 May 2022 20:50:15 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v5 15/21] migration: Parameter
 x-postcopy-preempt-break-huge
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-16-peterx@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20220425233847.10393-16-peterx@redhat.com>
X-ClientProxiedBy: MAXPR0101CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::29) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d84b9051-88ad-496c-5e2e-08da374f9b85
X-MS-TrafficTypeDiagnostic: BYAPR02MB5799:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB5799E6DF39AC39058CB82979F6CF9@BYAPR02MB5799.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eco0/D954XFsX1iKOACJGTH2cYiROC/5hJJYzV0brruoLzO/0ALZsE0CHuQCMuzwsQsjnO16YBkoD321eA07HqN/4f+D7TcNPyhbdTAAVHDTL7y2Bpa4PWSQ+owACyrIbazn/XO2AOGZKDSjGRkzRDqdnVt+FolBwad9CmGYjQFpzaRPBB52qrATe7zSSdvY01O8r8c7ptZA0afuWWIDIoOSwpY67JoHbSDeKxYwFGhzjNUhhOJxfsYR6rJkmVp0dOhxxkKs/H5mIGnZ0DWFD1LzaCItATA58EFmRIFh259dCXjg25EBwIS5fv9giSQPmwpOFJ2AAatosXw5OqvuI0V51oO6HtGY+QzzNW/g1mV4mBlpiR8YH/zStT/oaZPkwpwpiqKs9b21WYqYsQ2nX15mJFgTl1xxfpM1L2K3slZ9jFhCmcM7LcsOl163+M55z57peo4XHD3Zk3R++S5KXWOIFs+GGet4d6PkUo2XqF5fOFzteoeKW5OkPsbzNg933yfWTjIRh27MANpfhDgZGw/MTJ76kqFl4oWnOgMlbdfLSvZO9DE1MKGN1JYsjv26Ioe3daYcIwS0eqPn0M/0+sX6I2wQYbuPJadzUeFa6v+uiaLyXqPlskmi17pWbdXZ8xVvnwexQAAUzJLCl35q7HV7qmmrqh2a2wH9ggnXpywZ9aZLWJTJeoxH76+4j+GDxoadCmGkV/VfPF+QppJ7R8mBe3phrHpI2p2U3eHjM+S/XrsJaSHRIYg8t9zeVShTvvkOSNtBhxUfjxdzP3eXlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6666004)(2906002)(6512007)(186003)(2616005)(53546011)(6506007)(33964004)(66476007)(8676002)(31686004)(54906003)(31696002)(316002)(66946007)(36756003)(66556008)(4326008)(86362001)(5660300002)(508600001)(38100700002)(8936002)(6486002)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlV6amxyV2gvakxhc2JmeWh5a1JlOVBtUlZaeDFCRWQxTW5hcnBXTTJzS2Ji?=
 =?utf-8?B?K2kxeFpxeXV4blZ2bWFwQ0hSSVpqZEladVpvcE0rZTJxa0FFV1h4d3Q0cHpH?=
 =?utf-8?B?TDdRd01PbklsYkN6akltclB6K0MwYzFpQ2o3SmQ2WHJJSWFCWnk3WDBzQXpQ?=
 =?utf-8?B?bm5qTXBNaHBNZGlqR3VDTWcvd2FZU3ZzNmdPdlRWQnZBZ1NhNjluMXR6Q21Z?=
 =?utf-8?B?OExlSG9PNTYxUTVaSFY1NkdWUkpOcWtibGlqajhzWkY2L2p2NGlGcm8zZmsy?=
 =?utf-8?B?ZVUydHJ3cUZKdjBOemVkZXdLYk1jRUdzTURaUFNmV3grUyttRnVsdWpJcU1w?=
 =?utf-8?B?UDRraklKMEpXZEhtYVlxL1hudWx4OHdBYmhGc043R2NnTmV2eDBpanAvazlD?=
 =?utf-8?B?WjFVdDNBWnY4ZWpIQlJKWXN1TUxuNGk0dHE1ZVIweE8xa3g1T1hRbFFGTkpR?=
 =?utf-8?B?enJ4TWdNbUlIdk96dDRCdEJSYVg5b3lJUUFoMU92V1JheUxoaUtGdHRyaEt5?=
 =?utf-8?B?Zk1venVEczRvVlNkR0dpdnZvcFhWUTlNOFFORlhHbTZZOEk1aFRYbWtaV3cy?=
 =?utf-8?B?WUtvRlM4NVR4S3hab2MyZGx5YWlVL3d3MTVJaENNUEN1VTdmYmQzOExmMkxS?=
 =?utf-8?B?VVR3THZ3NTVxeXNOd3A1aVVyWEZ4MEViVG9mVTg1UlVaTUhsK3VEU0hrQ29U?=
 =?utf-8?B?SVhRSkFjTkxQY3R4U1F1MG1uSE5hK05PaU52V1V0U2Yxd242WDgzSXllY3RB?=
 =?utf-8?B?ME5KSnNnQ1Q1ZjRnUXB0RXUveWhDK0ZhYW95SFJuQkJ6ODhNZXlFUHl3WHNX?=
 =?utf-8?B?RDVKbmRyL3FubHcvTlNOWUtPV0dzWVZuajNXQ283bUp4eVdvTDZTQzI3Q3NN?=
 =?utf-8?B?bzZINmloSlVJb3MwR0Q2Tm5wNkZxTzBZc3E5NVFkcjlvOCtHMkFhVnRURDlz?=
 =?utf-8?B?ODBXaFZXN052SjBrQzhaM3RTNDBpUmFWcE5iN2djOEIvRmM2QSt6YVROZkZy?=
 =?utf-8?B?d2Z6MW1qd0dOMDJ5TUltUnJyenlBcUdIeE90dVVuamFEOCs2UmZhNDJQbExy?=
 =?utf-8?B?bmttZFNPK3M3L0xjaVhJUm5xVjdrUjRMOGhsNnpmSFN3YkNGeE9CQkxBOGFC?=
 =?utf-8?B?ZGN6YTF5bmpjOWNBUFdqM0owN0ZBT2U5bVppYVpkSGpmUzhtTERFVXVYNXRY?=
 =?utf-8?B?dHl1ZzBBd1BZcDArcmpOZk1mQWl3NFBKSGVESDdyMjQzZ05ERTIzdTFvaWJp?=
 =?utf-8?B?RloybklEbnovb3ZBUjViTkc4Uksrb1dwSDR0eWJuZGhoM3MyMTBQazhJVzg2?=
 =?utf-8?B?V2Jtakw0VVE0cGJ2STJ5a1Z4Wm9NbUhPcTF6ODVSczF0bmkrTWdPL2N3N1d6?=
 =?utf-8?B?VXBqK0o0YW1YbkY0V29vaGRxclEvY3RkK29pSVdPUk1wRmE3aGNCTmdnL1NX?=
 =?utf-8?B?VzVsanhyMzhibHdRUXR4NnA0RTNGM1NZVE13UHl2c09DcWhZK2NtVXMzaFQ0?=
 =?utf-8?B?cGRIdXd1VUZOb2w1WWFuc0MwdWZ4OC9TQy9zMGpZUWs0KzRLSlBOeUN6UitF?=
 =?utf-8?B?a1Nqek94YVppZGMvdnVWRSswVlZxSXF0aXl5RDNnRjJCSzFHKytIN2NKN1hI?=
 =?utf-8?B?bTJmMEZmYUplOXNhdDJsd3RzSGYvVEhGS3BmUzcvelNWdGZXQU5PUHgrQkRm?=
 =?utf-8?B?RmZXdFNCNU9mdFRyVGtUWUJ5SHNlcW9hY2xIZk5rNTMwM2swNXM3NER4SjN0?=
 =?utf-8?B?TkozOFAxaDhqbGovODdKdDEra2tsS0lCRVlFQlNuenVMWmk5U1BoRDlCYWZo?=
 =?utf-8?B?NmMycWREWHd2bGZ1WE1rNE9aMjFqdDk5VWphOTFiSmtjK1JCZVJGVzByc2xQ?=
 =?utf-8?B?K3UxL2JBZGx2dkJza3JqV2pGMG9mclV3clhoRk9KSkdacFg4dVRjME5sR1Az?=
 =?utf-8?B?VE5VbzU4NFBMUjBSU2hVZjRkdjRzVXpiOUhKczNHcG1yaXB0QWdyOUVTNVFt?=
 =?utf-8?B?K00zTWtaVW91RlVkRVVsK1F1TkVieXM4Z2l0bk0xRUs1WHNFZEd0NjBNRWtu?=
 =?utf-8?B?VEdldGpERC9ReDNHN0pIcnN6WjV5eXFlQm9hMmc4ajB0bk1Ob3JMTEFKSktM?=
 =?utf-8?B?emZZc1ljSlkvZVNSZUZ1SWo3UzJoclBNRE9qbzM5VWlGaTNoRUtnMWY3b3ZZ?=
 =?utf-8?B?NWt4TXJIUWZ0T2UrTDVPUkcrQ0ROQUdKcEg4ZWYwcFQ5YkxBMU1hTmJ5ZUlI?=
 =?utf-8?B?T3kvakFPUFhxa1ZBYjRwWjZSWVBtTXNKMnFYWmRrbk9FTWpQbE1kQXc3RTBO?=
 =?utf-8?B?M0NOOFpVVFl0Q2xBc3pZWi9EUjRZMjA5czk4R3J0d0x0aWFFV2ZlL0o4anh2?=
 =?utf-8?Q?0hY/KUEDPkl4ep84s8T4QUop/KiFH3pKQrxNDX6r6eAPJ?=
X-MS-Exchange-AntiSpam-MessageData-1: G/qlkI+9JiLSrPyd6f06WXuVOTIZwtR8JbQ=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84b9051-88ad-496c-5e2e-08da374f9b85
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 15:20:27.9217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhlG6QliGfRX7Fjkol834jbsadnHXq8u+5kiyF8eKPyYDyPzzJr/hAJHAoxYDmooYcCl3SOe3n5L1PdW2/gJnfDhW573azpX1RRVTr5okQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5799
X-Proofpoint-GUID: JNIeARA-F1uIHOl8BzodeGM5cPx2LZDx
X-Proofpoint-ORIG-GUID: JNIeARA-F1uIHOl8BzodeGM5cPx2LZDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_14,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--------------g0GO0WS3Tck8mibfhhoP0E5e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26/04/22 5:08 am, Peter Xu wrote:
> Add a parameter that can conditionally disable the "break sending huge
> page" behavior in postcopy preemption.  By default it's enabled.
>
> It should only be used for debugging purposes, and we should never remove
> the "x-" prefix.
>
> Signed-off-by: Peter Xu<peterx@redhat.com>
Reviewed-by: Manish Mishra <manish.mishra@nutanix.com>
> ---
>   migration/migration.c | 2 ++
>   migration/migration.h | 7 +++++++
>   migration/ram.c       | 7 +++++++
>   3 files changed, 16 insertions(+)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index cce741e20e..cd9650f2e2 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -4329,6 +4329,8 @@ static Property migration_properties[] = {
>       DEFINE_PROP_SIZE("announce-step", MigrationState,
>                         parameters.announce_step,
>                         DEFAULT_MIGRATE_ANNOUNCE_STEP),
> +    DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
> +                      postcopy_preempt_break_huge, true),
>   
>       /* Migration capabilities */
>       DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> diff --git a/migration/migration.h b/migration/migration.h
> index f898b8547a..6ee520642f 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -340,6 +340,13 @@ struct MigrationState {
>       bool send_configuration;
>       /* Whether we send section footer during migration */
>       bool send_section_footer;
> +    /*
> +     * Whether we allow break sending huge pages when postcopy preempt is
> +     * enabled.  When disabled, we won't interrupt precopy within sending a
> +     * host huge page, which is the old behavior of vanilla postcopy.
> +     * NOTE: this parameter is ignored if postcopy preempt is not enabled.
> +     */
> +    bool postcopy_preempt_break_huge;
>   
>       /* Needed by postcopy-pause state */
>       QemuSemaphore postcopy_pause_sem;
> diff --git a/migration/ram.c b/migration/ram.c
> index a4b39e3675..f3a79c8556 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2266,11 +2266,18 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
>   
>   static bool postcopy_needs_preempt(RAMState *rs, PageSearchStatus *pss)
>   {
> +    MigrationState *ms = migrate_get_current();
> +
>       /* Not enabled eager preempt?  Then never do that. */
>       if (!migrate_postcopy_preempt()) {
>           return false;
>       }
>   
> +    /* If the user explicitly disabled breaking of huge page, skip */
> +    if (!ms->postcopy_preempt_break_huge) {
> +        return false;
> +    }
> +
>       /* If the ramblock we're sending is a small page?  Never bother. */
>       if (qemu_ram_pagesize(pss->block) == TARGET_PAGE_SIZE) {
>           return false;
--------------g0GO0WS3Tck8mibfhhoP0E5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 26/04/22 5:08 am, Peter Xu wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20220425233847.10393-16-peterx@re=
dhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Add a parameter that can condi=
tionally disable the &quot;break sending huge
page&quot; behavior in postcopy preemption.  By default it's enabled.

It should only be used for debugging purposes, and we should never remove
the &quot;x-&quot; prefix.

Signed-off-by: Peter Xu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:p=
eterx@redhat.com">&lt;peterx@redhat.com&gt;</a></pre>
    </blockquote>
    <span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fam=
ily: monospace; font-size: 12px; font-style: normal; font-variant-caps: nor=
mal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: pre; widows: 2; wor=
d-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: =
0px; background-color: rgb(255, 255, 255); text-decoration: none; display: =
inline !important; float: none;">Reviewed-by: Manish Mishra </span><a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:manish.mishra@nutanix.com" title=
=3D"mailto:manish.mishra@nutanix.com" style=3D"font-family: monospace; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: pre; widows: 2; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-colo=
r: rgb(255, 255, 255); color: rgb(0, 120, 212) !important;" contenteditable=
=3D"false">&lt;manish.mishra@nutanix.com&gt;</a>
    <blockquote type=3D"cite" cite=3D"mid:20220425233847.10393-16-peterx@re=
dhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
---
 migration/migration.c | 2 ++
 migration/migration.h | 7 +++++++
 migration/ram.c       | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index cce741e20e..cd9650f2e2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4329,6 +4329,8 @@ static Property migration_properties[] =3D {
     DEFINE_PROP_SIZE(&quot;announce-step&quot;, MigrationState,
                       parameters.announce_step,
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
+    DEFINE_PROP_BOOL(&quot;x-postcopy-preempt-break-huge&quot;, MigrationS=
tate,
+                      postcopy_preempt_break_huge, true),
=20
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP(&quot;x-xbzrle&quot;, MIGRATION_CAPABILITY_XBZRLE)=
,
diff --git a/migration/migration.h b/migration/migration.h
index f898b8547a..6ee520642f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -340,6 +340,13 @@ struct MigrationState {
     bool send_configuration;
     /* Whether we send section footer during migration */
     bool send_section_footer;
+    /*
+     * Whether we allow break sending huge pages when postcopy preempt is
+     * enabled.  When disabled, we won't interrupt precopy within sending =
a
+     * host huge page, which is the old behavior of vanilla postcopy.
+     * NOTE: this parameter is ignored if postcopy preempt is not enabled.
+     */
+    bool postcopy_preempt_break_huge;
=20
     /* Needed by postcopy-pause state */
     QemuSemaphore postcopy_pause_sem;
diff --git a/migration/ram.c b/migration/ram.c
index a4b39e3675..f3a79c8556 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2266,11 +2266,18 @@ static int ram_save_target_page(RAMState *rs, PageS=
earchStatus *pss)
=20
 static bool postcopy_needs_preempt(RAMState *rs, PageSearchStatus *pss)
 {
+    MigrationState *ms =3D migrate_get_current();
+
     /* Not enabled eager preempt?  Then never do that. */
     if (!migrate_postcopy_preempt()) {
         return false;
     }
=20
+    /* If the user explicitly disabled breaking of huge page, skip */
+    if (!ms-&gt;postcopy_preempt_break_huge) {
+        return false;
+    }
+
     /* If the ramblock we're sending is a small page?  Never bother. */
     if (qemu_ram_pagesize(pss-&gt;block) =3D=3D TARGET_PAGE_SIZE) {
         return false;
</pre>
    </blockquote>
  </body>
</html>

--------------g0GO0WS3Tck8mibfhhoP0E5e--

