Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADC740B03D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:06:26 +0200 (CEST)
Received: from localhost ([::1]:48746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ94r-00030n-41
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mQ90h-00071x-Qg; Tue, 14 Sep 2021 10:02:07 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mQ90d-0006Af-Nn; Tue, 14 Sep 2021 10:02:07 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ECdNs9025165; 
 Tue, 14 Sep 2021 14:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=aQVvQg5kDkbkwuS2Te+ElX6xFxL1oz15MzbUNFIGE3g=;
 b=ZA+wDoLr5qrsamIRe3Z0kBf4ep/EF3HkQ5ks4ayK5ef2scNdPEGJ7/XxnG0regv6T/xh
 F0TfhECcRTozXKpIrBfGDHSWBBUn/ZzNaLIWtfEw1zkrlGy3fv5ndAwEvGTsHX5Qjl+N
 oJipmRTG5F3ZbxMYDZN1CLvl5aFrz5y2gD31ENEKgOpJbM2uh3gRjff3d25cr+Axf04O
 opP31iVvVR9uLm9I7ofGErONz09sC/Wqcwct26A5SyJog/Za7ITzzUfFMz6ZpL44DXN7
 Qr6YDILyGfVP3VDUhG085njdq4OunU0Z+8K+Jq2xJqFu6UN+867fLcfRuk8TY6+huR/z ZA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=aQVvQg5kDkbkwuS2Te+ElX6xFxL1oz15MzbUNFIGE3g=;
 b=lgFnXjF/g/peVyorxzhQ8rN8TEgfutqNFwGfcSOcYaaCxkeEhT2W5J4btOEct4c9OHRE
 JeGYZXoJ+MiDgzu6sWtBJ2cH54FffINfkeAvXo+P3O2j70Ijw8l3YWERes+vpbkmLIxE
 QHN6WSo+tAYYoBa/yc5LTMZuNvWe9o0Y0Z0MazvEjh3zSzJl/QT/gG+sGlP77pMm9wyP
 WoDBrFRhBHQBFrZs7epxEFDDZm/6jKRNQUbK2eV523Xg5XyZG7lS/Zo+4tNjxo0nt3cG
 dVMjGLybJWFOY55EmscSIbdmFv//6YS688YooLUqak4T/tiJPnZQOf/7gWvYaTg9x74y AQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b2p3mhn4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 14:01:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18EDtBqI050571;
 Tue, 14 Sep 2021 14:01:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3030.oracle.com with ESMTP id 3b0hjv6xve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 14:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTKUlSjHZd9mL7hNgVl3NWiDOn8KvRRVvYf2vNBkIJh8aJCSFIJ6m34Ehtp86cwur0iJ8jOjzshRYpLERG6OdESu8LhmS3+uUrRwuSB+3jmthfkyTQb5NCRas5azE9gZw4NIpaY12Q2wD8QXY+v2MHwUd3Dsetfq2EDiAHOKwZOjmpu/SikU4FyQY9bShbDI0aPESLAVxvPwzfqXQBLz0E9nhRsLCg4mR7kDUL8M7FjnA6E+5lb1kw/X/Ii3HzhnocdN30PnUqGkSndYbfmUPVMTb3MgZ7oMvC0vdjkZFyEjMT1ntztI34UKaCOPD4yOnQWiu09T8BQYRY8+8RfxlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=aQVvQg5kDkbkwuS2Te+ElX6xFxL1oz15MzbUNFIGE3g=;
 b=ewp4IBUCJuJfEDdOkjJDm1MVFYk9YOJL12xc/7ZWJCCNVKYrVUx1OMb09nFIVBvnh5EOOVRYaESeaB5O36ylzg5lAhtp18QqhcF8n38Z3ygZ6d8V2wauvnX+BZxBdCHRITv5KAwPMLU6uqsR0Kv3y941iG62AjLPM4RwJnYaPDBEkPZfcrtqB0O/fHixS0310x+n8/zTLB1ON1VimqoegM3eU8EGT8KYbG+x2Hm2Fo/JoUiMh2/Cnq8ilmKLIhPFmhkIFZ3TOd2CAdDdH66gS/HVSy0sKgshftlyw/JzoiR1MKajWtG201oFa59h470BgrcsfOk15CdRc1fFAuEsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQVvQg5kDkbkwuS2Te+ElX6xFxL1oz15MzbUNFIGE3g=;
 b=vspW6kLskPxIshZMZcCa+bFZH6zybdIHkrIoRH9mH6YNTHLxsX6QgnX5injCpJ5oGMtGe0S1lvJ3MQnb9q8FUSxo/N2PpaCwfuHY40qnm7+TqXEFeVG7M9qgOn/8YvicHXNaXi1d5f6IBer0x502ijvh2g3VM2Ed+AiRikgsqHY=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB4990.namprd10.prod.outlook.com (2603:10b6:5:3a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 14 Sep
 2021 14:01:34 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::7c73:f280:20d6:35cf]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::7c73:f280:20d6:35cf%3]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 14:01:34 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 1/1] hw/pflash_cfi01: Allow backing devices to be
 smaller than memory region
References: <20210810134050.396747-1-david.edmondson@oracle.com>
 <20210810134050.396747-2-david.edmondson@oracle.com>
 <384a5d1d-de25-78d7-d8b0-226ebca44a6d@redhat.com>
Date: Tue, 14 Sep 2021 15:01:26 +0100
In-Reply-To: <384a5d1d-de25-78d7-d8b0-226ebca44a6d@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 9 Sep 2021 11:27:56
 +0200")
Message-ID: <cunlf3z9ryh.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
Received: from disaster-area (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1ab::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 14:01:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9786e94-b028-4b5b-c0c4-08d977882961
X-MS-TrafficTypeDiagnostic: DS7PR10MB4990:
X-Microsoft-Antispam-PRVS: <DS7PR10MB49909C32811949DAE25ECEE488DA9@DS7PR10MB4990.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ZBEoyi0c5JrcKgW/R0rMx+FXpAuKJhnBnbZq3iZj1zuukJc8R+HS3aMWdFqrIJrI1hTppFvqJ1zDIxssOxV4z6oJ+pXY2w5IM6svxoSkwGiFm8rUHmh1frgcKuPkPnfXjfc3Bwhpmo/NTh7G8B/CaYCLqlAG7b3DuJ7ZQnx6hQJnSxZN1kiuVE6kFM8U43C1us8xKsLPd3nmuae0tRT9w1C/AhgZofxFAnbHeVb5PlyK2WWzVY4VEmjwadFghXtYVw9vuRky4+DjOF0UIynn7WwcXqw6V2E4y4kmzkxlHeEkfybQVSThtxOvKlj6JuT6ldktuHfVaex1JiVsklfwDd+wZDa2VGa67McRy21UygSFh8ZTBAiQDo9DFmdPy8StAPsrGTNaRk1xOWZtiyuuCwl2Svr/oJ2gY1qvnkwjJuDTtG8h7rxSZ7Xbe/Q22np4Y3CkLoWzOypS4BkGLtMWLPWOhKIZDEijnaJdr4JGBGAYWq7ULnTN6Ydbft2dtNjKSLLplJmqO34cXlVmChnCwVgefiuST69NCxy24L3Kap3815KtGwcCtN/PNM6rT2MKP9M56fK0WpIIhNDcdRwY+H7ihDrkbrqUVZJMd8cdAKF8wdHZKNnx6qaip1x0tSDQQ4AN6aTUujI08ZgJZlkzCS6ab8Rj+/o3U1Ov0Fyt72OMDAZNGd3CLOF+ck6Mz0ViL4vW7o5MFowM06MS5aNEWtY9tHNj7LakyeStH4vWds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(366004)(136003)(396003)(346002)(66476007)(66946007)(966005)(54906003)(66556008)(7416002)(36756003)(52116002)(316002)(5660300002)(6916009)(8936002)(186003)(6496006)(8676002)(38100700002)(83380400001)(4326008)(44832011)(478600001)(6666004)(2616005)(86362001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHpPZ2JRMTN5cDF1RlBuTHhXR1pDUUl1aVVNTHdZcEJzRTM2OGtmREJMOE5M?=
 =?utf-8?B?MkFURXRQTUFNK1B3T0xicjJxMzJvOGw0cnNKS3U3QzhpcExZNXJscmNmcncv?=
 =?utf-8?B?UjJEOVpBNzJabVNLdWg3ZmxHVkIyM2VGNDlacXhpYlZPeU42Zk5zVHFEM2ND?=
 =?utf-8?B?Z0J4S2Jra01SU2xnU3U0R1IzYWRZNzdORlhyM3ZMZGw2dEtDaXlqNmhXdmU1?=
 =?utf-8?B?SDkwcEw2RWZoclRqc0s5ajVEaFZYbXZiRkFqc29BclRtNkNiNWZReWRRbGVL?=
 =?utf-8?B?NFVlOWR1UHdZc1BSK0hOOUdTcTVqWEUzT1ZpS2VlZlZ3V2Jtb1JRM1liSGR3?=
 =?utf-8?B?OVZNUU8zRmJldTFmSzZIWnQyYUcvTUZjenlFMXQxRXZhakRZWkYyVDNHNEMy?=
 =?utf-8?B?QnlEWTRmeVdXUHJXdkx3MjNIVnI4ekV5ZUxvdUI5T00yZUNkenYyR29jWXpl?=
 =?utf-8?B?d2RQYjBmbVdPVTMraXhUWGJhYW90U3hWb0VrS2FhNG5SNkVmamlOU3FSa3M4?=
 =?utf-8?B?YXgrTmsyUEEyV29xL2wvd0YvUlZZc2RYVUpmWmQ5SXZVdFdIQUtYL05UYVBi?=
 =?utf-8?B?RFYxZ1hPeG1vMlpYQ3dCV1FiVTFjUWJuQ2pOVGlBZllPSUxuYURyVlNTNFhw?=
 =?utf-8?B?Vk13c0FsRlVnOXpYVjJFd294cFd6M1p1eEtkREl1bjVOVzAzWjBYYXJQQ3gy?=
 =?utf-8?B?MGV1RTY1VU5EZ1V3cm8vTTdrd3RZcnpmWVJOQ08vMnFrRGp4NzBQcmlXS1B2?=
 =?utf-8?B?Yi9ET0tjMWFYNGxrcU1kM1lyOGRuSE1xKzZaUGl3NDRVbWl6UTNJSnhVY0sz?=
 =?utf-8?B?b2pGdmNhVGY1cFZWYXZyaWFqUGw3c3pVdFI0c2FYZ0ZlekQvNitzT09aUS83?=
 =?utf-8?B?Ym9CWHFLVXljK215K2RVc0kxam5OUHNJUmttN1VqZS9oeEFHeFZackhOZkla?=
 =?utf-8?B?UnNlT2RLZEg2TkNveHA2YkxjVVN5VjF1OEhjeGFNaHVtU3g4UDVTNVhJZEtq?=
 =?utf-8?B?RmppQmUzWHNDSThCQ2ZUZW92cTdJRCtQa1l1T2FqaUJubWtMVzM1OW5xYzR4?=
 =?utf-8?B?dWdxMVUvaktVNS9BY0cvM2M0MlBVSlUwbjF5L0xWOHgvdG5RT2JUbldCRW52?=
 =?utf-8?B?cGUvNkgwSDJ1ek5mQVRqOHRBYUtLU0R4MFYwdGtOZCt1L0lEekNKSE9oNnI4?=
 =?utf-8?B?WjE3UGpIaHRmNURWMUNnRnp6NjFoMC9BcDVMZ0R1OFNMQmhFSFZnYWRkak0w?=
 =?utf-8?B?bXRUaEkvdjF0cTJ0eDc0bXpHdGxuTjRlVGprZDlQR0oyVytFU09WbXRXM1ZN?=
 =?utf-8?B?MXkyOUIvMzdhN2paK1RqbTRicmM0MUtkclUyYVFJSnM5V2FBTDhwNHVJUWxk?=
 =?utf-8?B?SzZUd0diYmNETElqMFU1UlU5ZmNvczg0b09lQkc0Q01TelVuWVI1ckVxVURh?=
 =?utf-8?B?ZVIvQ2t1T0NKTWpNZXVwZHo4ZWdmczhiWFFxc3B4R1B6d2QyMFloeE9kTkVt?=
 =?utf-8?B?R2xONXl5dExTTVpEeFJ2UlNBZEx0cEtSYzhGZ2hLZ0NUMko1NEh1ZDZUVWlP?=
 =?utf-8?B?SzIxN1lEWjdScmpqdXhrbitkN0xJVStSbDNjeXM1YmFBNW5ucXlzMEVlekxT?=
 =?utf-8?B?MHpXOGJjOWxVdE9NcGROMmt4UllqRHNXMDJLT1krdkJ2Zk1LZkpxVVRXUGhZ?=
 =?utf-8?B?Um9GNHdFdzlHak5zd3lWNDhVN2tvMXpIYWk2Qi96cWkyTXNhaXFub2hTOUgv?=
 =?utf-8?B?a0tqNnQ4SXZlVG52Zm1sbjZFbzYxZWVHNEtteFNBSytrUG5qUFdCTS82Z1hX?=
 =?utf-8?B?ZjBuRkNyU25HS05QSjBIdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9786e94-b028-4b5b-c0c4-08d977882961
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 14:01:34.5994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhj/etAEnMMuTfXSsCZtje9dQuX7M8wnP/kEbMOFdlB3BTcQ1UPy/8mswlM1Y6WZU8zF0PwszYHEHChnKM6vu5tHsBiBcITWYaQyLLZjWzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4990
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10106
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 phishscore=0
 mlxlogscore=913 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109140087
X-Proofpoint-GUID: NI-6kA4hWmmxHnmTmBeC7B9SvbL_s4UR
X-Proofpoint-ORIG-GUID: NI-6kA4hWmmxHnmTmBeC7B9SvbL_s4UR
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Xu Yandong <xuyandong2@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org,
 =?utf-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?= <haibinzhang@tencent.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2021-09-09 at 11:27:56 +02, Philippe Mathieu-Daud=C3=A9 wrote:

> Hi David,

Philippe, thank you for the careful and considered review.

>> +static MemTxResult pflash_outer_write_with_attrs(void *opaque, hwaddr a=
ddr,
>> +                                                 uint64_t value, unsign=
ed len,
>> +                                                 MemTxAttrs attrs)
>> +{
>> +    PFlashCFI01 *pfl =3D opaque;
>> +
>> +    trace_pflash_outer_write(pfl->name, addr, len);
>> +    if (pfl->ro) {
>> +        return MEMTX_ERROR;
>> +    } else {
>> +        warn_report_once("%s: "
>> +                         "attempt to write outside of the backing block=
 device "
>> +                         "(offset " TARGET_FMT_plx ") ignored",
>> +                         pfl->name, addr);
>
> This doesn't seem acceptable on mainstream, see:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html

If this position still holds (it seems reasonable to assume so), then
the approach in this patch isn't going to be useful for writeable pflash
devices. With appropriate adjustment for your other comments, it may
well be fine for read-only devices.

Given that, I will go back to trying to find an approach that works for
writeable devices, perhaps by always intercepting reads/writes and
driving the block layer directly (while I previously had that working,
the performance was poor, which I can re-examine).

