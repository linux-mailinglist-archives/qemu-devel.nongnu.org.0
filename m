Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7083F9E5E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 19:56:21 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJg5U-0007n3-8v
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 13:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3B-00058C-Ur
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:53:58 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:9756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg37-0006nP-Oi
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:53:57 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RGbv36013579; 
 Fri, 27 Aug 2021 17:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=P+9XTd9MrV1X3OyNZAl9hox36Us575eGuOkcQ5SGFEE=;
 b=bv3JDf+frh8O2+GaT6/6mf17pq2Cvv2ojfu4JMbynZ3VHarhEm9NLn13VuhKfFmxCu0h
 Gk1Ld/YLgI6MX54lgQ9M/eTZtfrSLCUJOC+3kJW6zZ+bKifQhogPNgi/rg2+yZHczI4t
 vJoTCiIEFy7tiPMU4ODboxIEmuGIizMazqbnKDE+ocM8V4Oa2+HxIO0SMNXLSl0pb0jP
 fIEp3KML/lZNN9vFNss7+ag8QygQnCViCcMaBJHfLdTb4nSd5SvGU7A9ER359owFbaKu
 VpvIeO7zZbZYDNSdnP/aiV+AM7kpynIem154kgMQ9l+LJ6JiKDfN+rkCpA9XCerPgntL 3Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=P+9XTd9MrV1X3OyNZAl9hox36Us575eGuOkcQ5SGFEE=;
 b=BZuR+XIJyNd7BybNrLRMLiSNlh1INalnwFRncJxoPx5NUBjKjeBMA9cK7SabvymjlMlg
 4U2N9xj0TXnbRrHjNySPGjEVRZsmE3d7MrbPGCLEJ+/nVZU05XhTkfypnoLOoF4nivhT
 CACJLo+lOXwsmwUmDlm62/W1gmcnfWKZ3rvU1ac6O8whqzcP8zDidg1kureHyZiYFrNM
 EzWfGXkWfG5FxjAKzhNSTcfjuoUIbEFeofMy/eEmjq6f/WSBqGwxqp9wUdSW9PsGn9d2
 UOUK7OAdDfTQ0AZcMdMA+l/7WgLTN+TyanMUo1gpLKG6fgC8P755L+eBf1RKXnRiuj7k KA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ap552c629-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHpjc5005351;
 Fri, 27 Aug 2021 17:53:47 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by aserp3020.oracle.com with ESMTP id 3ajsabkbsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrILTSVa7JDGqn20h12/PME12+gmYPfIwsVF444kMT+058uY4iw+jmVJHj/u6bgVpZ+6cpMr8AVECnfhMToFWLkK3xJZrMKdogqFaJbbfmnj694z353PXoTPBfzSb6PVBrk+C7RqKCfAB6SCZs45Xq2EONegT0ck2P9M363xm9Vks9u25Dj7rculZMyYCQo/VfPYG2NO4OS2ZcQ7igJVG+NfBvkqGgKzIcJOBq0v/ZYVNR8twigIZ85jUiLQy/M4/j0A0LpgabEDmjp9zUWkEN6o1sjj7dkcJaqLOgfVS7acMRwyfhyxAKCMnFQ+ofO1BWjNYXrrVminXY0DyaLGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+9XTd9MrV1X3OyNZAl9hox36Us575eGuOkcQ5SGFEE=;
 b=emKLmwKi9z7uyPx5wUzdzWlCuTguVDoraGQHXiL0d4hNt8rz8iou5j3fKL9gQlU5iMKz3WCoIec1pecEh8rNlEhw9aWzYQckyYVDJbZEAvmZ8quAFEOOluf5f/deOLyoODb5hWVh5OTPGY/pTrvoHnnGC4wyG4BJMG1SCsq5UMZO8bgcIqX2lFnX6QOXh0/pqt/KyfvwmHptSmjfsR+JFgxSw3qnYpz5aw544w/nKomC7DHsK4QAwLRRYqKH5+MGCr5qn/blo1szr97p/iL9zXibNqakqDKSMqQc0lWUj6/AkYhhoNiP3eZzXz9uaM3c2VEH0H3GKi83lHnVCbfG+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+9XTd9MrV1X3OyNZAl9hox36Us575eGuOkcQ5SGFEE=;
 b=j0FPNziKno83B4JMWQnu+9JbPQsH9Xd6ffMPgRTivLRJkgsgsos0RrVztStoVfC6LuBrIQSrm9hnVG4gsgeObtAgvpX1TAkhiJrhBdWoJXSYGG6eEcnvziVZD4as6hkSoZbCzN02U6cXHttXnegn3y/J4ggYeIbz5/08CjSJluA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 17:53:45 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:53:44 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 02/11] vfio-user: define vfio-user object
Date: Fri, 27 Aug 2021 13:53:21 -0400
Message-Id: <ff8864013462e53eb0bed0aa609b55b21c0b18e0.1630084211.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1630084211.git.jag.raman@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.46) by
 BYAPR11CA0093.namprd11.prod.outlook.com (2603:10b6:a03:f4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:53:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb5f2cff-d764-4362-7be9-08d969839c99
X-MS-TrafficTypeDiagnostic: BLAPR10MB4865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB4865442A941D54F8D194312190C89@BLAPR10MB4865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Z5Y4d60wK2CR4QQxfvd4HLhCmjjxvHZY/VtNO/o+ajLpE8leqtewpj07i1WaY73ud9YKLl6eUhuSNRNmuOMKk5V4F7DLucZvB41slFdgsIDXpMbDIUP/Fjwmkk68hKroGs2U26QLBTqTnlsLKMErEVJ7AsP6molYCNp9rBIJfBDIYCgZVDt8ZyTIrKh3vjQmqmqeNJeUwmQJV/yFU2izg/FegxsTLGeZIfxxDNgktx4Z+43HBAjkUb1o+fgpY55VZVqEW3T6SeRWP4NUENEndAOuDAXD0d/Wym/sBnqBelmgx1f5y+Zi8HD8UCc4XvzBzbgw01q0kvFBvMrVArjVlwVuB2qsLlF/XE40NMKg+tRl06K/blGIOTGkPx+ryiDZVjeeT5Z/dh/5PYfiGmCavj8PqgJcSaq5h7g4voQjXfJuUxUHSYoCAyiwHwl4hDumA6jQ+a8I29+i2Bn1AHGw8stfUwHO49365HJRoZe9aI9FeTfklynk8hw+nguPXFgFyiWKzx+O0LbMNNapwq+LQ5YCgTQnFNS/VPI0nsfwkYi5oisytYk6qpDjp3YsELxnR5fLTh9qF4ArR4dYb2OB4kBvBbMO4KmQtT2baVXfwAvh1SVfC76ps4BAwFom4uQfAY9TRCABPNxsMsnmsiq0aGJk3NLgRzA1dmccfe8p3+/tPScxs1gY4FtGRRK5uQ/5ifOGVeRMUyzZN7A5lD8FQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(2906002)(186003)(2616005)(8936002)(26005)(8676002)(38100700002)(36756003)(52116002)(7696005)(83380400001)(107886003)(478600001)(38350700002)(956004)(7416002)(6486002)(4326008)(6666004)(66946007)(5660300002)(66556008)(66476007)(316002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtWcHBIdlBYUVB0WHVuN3FydGVMeXBydTE2WUo2Q2pTcHlITmVQZ1BsTkdN?=
 =?utf-8?B?Z1BxMFBqSGR0YWprNDQzQnpkWWUwYVRkM1cvUlRwb0w1WWNtTWpOS1BsQkVE?=
 =?utf-8?B?U2lpcGNUV2pyUmdhWDRhWGk3R1hidFZRdnB2NDFWeHBHdkVOdmMxTjN2dmE0?=
 =?utf-8?B?cjVWd2hMUW9iT2wwNE1jbmN2SUtRYS81OWdEMmc0eWhMbHFPeHRWWDBOeGU2?=
 =?utf-8?B?bGM2Nzd5SVU4eFd3VCt3U0kxaHlibk0rSHRmTEVuZFNKOXVYejk2SDErWTJu?=
 =?utf-8?B?MjdQTGROWGlqdWcrMjlmQmw4ZnVGc1IxWTkrcm1saDBTT280YTNIWEhkWTFN?=
 =?utf-8?B?ZlMxa1dFZGU5Q1FiLzZxSmxrbkRJNUtGUGZaZytHVUVqWk1LV1Q0V1g4Q0R4?=
 =?utf-8?B?UTlnYkpiU2ZTaDZ4cE1HMTBzVXNXeHNWQnU4dklhL29RSzh4VXdwN1RDZ2ts?=
 =?utf-8?B?dVJqR1FnOUo2R2JhblBnTGFTNmpOSVlaZDhsWlZQVy9RdUNxRGNuTy9rVXBs?=
 =?utf-8?B?SldQUktGRUNKUGhFSmE1SktWekdwKzBZTWtqREVwOUJwRS9remRoQk9yV0Yv?=
 =?utf-8?B?bW51WDZ0MjJLRURSMzZOeVBVa0tsSkFMT0hHenhFUWR6dmZ0MHkxREV5Y05R?=
 =?utf-8?B?WlFDbEc4bXVaVjFERmd0WXliR3ErUlljM2JJVm5uckE4SVpkT1dzWkt3T205?=
 =?utf-8?B?VVp5anBEdjRxSXkwQk9lcHVHKzlYRjFvVDdjazQzWmRZZWV6TUd6czdpR3do?=
 =?utf-8?B?NjYzRmJ2Q3NjNElndEhvNzYrZHJIUHdxM3JvNFJUYVA4OFpSUEVWSlMwS3ZT?=
 =?utf-8?B?bmpNVzRjdkZ6YUtjTUJTU3VRajFMWExXZExMeGxRZkdMZFFIekpwL3VqMjJ4?=
 =?utf-8?B?U0pnQjJ3VnpsVmNlMjdBakR3OUwxSjhXUStzYU5mUWwrMXBHL1l4TS8reVh3?=
 =?utf-8?B?ZGZjOHVWckR3K3A3WHRXNWJYME03V0o3WEVZQ2dNREUzTlBDZnRkd1pHZmJT?=
 =?utf-8?B?M1QraWt1QlNkVW5pUmxBNVQ5MmVZSFFRd29EVFc1VDQyaGFBYXVOVTNtUHpI?=
 =?utf-8?B?SzBIYUpvWDhVMDZSVzdTd25XNWM0c2VoVk4wYkJvSS8xNUFJN2U2ZWIwWmJD?=
 =?utf-8?B?aTluNitiOC83MFdxanVRcG1iUWVlZzJWd25tK2lEWlZ6K3k4Z0svRlljeXhC?=
 =?utf-8?B?azB2V0VpM2Z5c3d5YVpiNzZIcTB1ZWxlZFEwSjIwakJMK1BoZjAxa0pjRW93?=
 =?utf-8?B?aGc1ejNmUURibnM3ZlRhb290MDFmeVJzVTJJN1Q3YSs5U2FMUjFqTkEzVm9n?=
 =?utf-8?B?QmdDSUlsbnVnRmNMclEvbDNWdFcvazdmNUg2WUx6QlRiSmVLb1NML3hxTjB0?=
 =?utf-8?B?ME9hd3paa3M2N3hpckpQYlVNay9UUXJ3dnh5NG1tNVNxdSsvR3Bkeit4RU5F?=
 =?utf-8?B?b3Z5U3djTktnOUk4T0NVK0U1NUVvQkdUUmtMdU9XNkJ3Wkt5bFl0MysxUFhG?=
 =?utf-8?B?U0dydllodkZOWDJNS2J4Vm1TNy9Xd0ZaVWdnVWFXdE9XMHlHSDJDa3R1cFpo?=
 =?utf-8?B?cUMrYngwMFFIencvejFUUXFZOElyZTd5RjMyZDRmVUdaY1k3eUVPTFJrWHJz?=
 =?utf-8?B?NGZjdExPN0crSWJtdVcyVzFQVzY1d3FBaDhKSjlmOWZrakFMeFVUTHF1ZmpQ?=
 =?utf-8?B?SFlWdk1aQ1QyTk1DcHhub3ZSZ3E3akl1T1oybGtxYzN1aHVGcUV5ekFJTERx?=
 =?utf-8?Q?sVR1QgxtDJ1oPGlkGV6le4U+fuhQrusI0dhx0rz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5f2cff-d764-4362-7be9-08d969839c99
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:53:44.5609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paVVtMCvc47gwrUeMlsLJLXSrv53zkNRlpR2Itwx6iCF2KVP3Gc/As3r6OXdNStIlN7pCcwJug17B2LBxou1fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108270105
X-Proofpoint-GUID: vJlmNxe_SjmrLBz3S2Zdr-18shj9wTFq
X-Proofpoint-ORIG-GUID: vJlmNxe_SjmrLBz3S2Zdr-18shj9wTFq
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 qapi/qom.json             |  20 ++++++-
 hw/remote/vfio-user-obj.c | 145 ++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |   1 +
 hw/remote/meson.build     |   1 +
 hw/remote/trace-events    |   3 +
 5 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index a25616b..3e941ee 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -689,6 +689,20 @@
   'data': { 'fd': 'str', 'devid': 'str' } }
 
 ##
+# @VfioUserProperties:
+#
+# Properties for vfio-user objects.
+#
+# @socket: path to be used as socket by the libvfiouser library
+#
+# @devid: the id of the device to be associated with the file descriptor
+#
+# Since: 6.0
+##
+{ 'struct': 'VfioUserProperties',
+  'data': { 'socket': 'str', 'devid': 'str' } }
+
+##
 # @RngProperties:
 #
 # Properties for objects of classes derived from rng.
@@ -812,7 +826,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    'x-remote-object'
+    'x-remote-object',
+    'vfio-user'
   ] }
 
 ##
@@ -868,7 +883,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'vfio-user':                  'VfioUserProperties'
   } }
 
 ##
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
new file mode 100644
index 0000000..4a1e297
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,145 @@
+/**
+ * QEMU vfio-user server object
+ *
+ * Copyright © 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/**
+ * Usage: add options:
+ *     -machine x-remote
+ *     -device <PCI-device>,id=<pci-dev-id>
+ *     -object vfio-user,id=<id>,socket=<socket-path>,devid=<pci-dev-id>
+ *
+ * Note that vfio-user object must be used with x-remote machine only. This
+ * server could only support PCI devices for now.
+ *
+ * socket is path to a file. This file will be created by the server. It is
+ * a required option
+ *
+ * devid is the id of a PCI device on the server. It is also a required option.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "qom/object.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+
+#define TYPE_VFU_OBJECT "vfio-user"
+OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
+
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+
+    /* Maximum number of devices the server could support */
+    unsigned int max_devs;
+};
+
+struct VfuObject {
+    /* private */
+    Object parent;
+
+    char *socket;
+    char *devid;
+};
+
+static void vfu_object_set_socket(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->socket);
+
+    o->socket = g_strdup(str);
+
+    trace_vfu_prop("socket", str);
+}
+
+static void vfu_object_set_devid(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->devid);
+
+    o->devid = g_strdup(str);
+
+    trace_vfu_prop("devid", str);
+}
+
+static void vfu_object_init(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+
+    if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
+        error_report("vfu: %s only compatible with %s machine",
+                     TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
+        return;
+    }
+
+    if (k->nr_devs >= k->max_devs) {
+        error_report("Reached maximum number of vfio-user devices: %u",
+                     k->max_devs);
+        return;
+    }
+
+    k->nr_devs++;
+}
+
+static void vfu_object_finalize(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs--;
+
+    g_free(o->socket);
+    g_free(o->devid);
+
+    if (k->nr_devs == 0) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void vfu_object_class_init(ObjectClass *klass, void *data)
+{
+    VfuObjectClass *k = VFU_OBJECT_CLASS(klass);
+
+    /* Limiting maximum number of devices to 1 until IOMMU support is added */
+    k->max_devs = 1;
+    k->nr_devs = 0;
+
+    object_class_property_add_str(klass, "socket", NULL,
+                                  vfu_object_set_socket);
+    object_class_property_add_str(klass, "devid", NULL,
+                                  vfu_object_set_devid);
+}
+
+static const TypeInfo vfu_object_info = {
+    .name = TYPE_VFU_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(VfuObject),
+    .instance_init = vfu_object_init,
+    .instance_finalize = vfu_object_finalize,
+    .class_size = sizeof(VfuObjectClass),
+    .class_init = vfu_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void vfu_register_types(void)
+{
+    type_register_static(&vfu_object_info);
+}
+
+type_init(vfu_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 0c5a18e..f9d8092 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3391,6 +3391,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index fb35fb8..cd44dfc 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: vfiouser)
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 0b23974..7da12f0 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -2,3 +2,6 @@
 
 mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
 mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
+
+# vfio-user-obj.c
+vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
-- 
1.8.3.1


