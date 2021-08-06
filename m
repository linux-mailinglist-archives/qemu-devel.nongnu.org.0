Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0333E31C1
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:28:25 +0200 (CEST)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8KG-0002lW-Gf
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC861-0007y4-A9
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:41 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85x-0004LD-4P
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:41 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBdcD032510; Fri, 6 Aug 2021 22:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=SQqYrioUhIu+iP1XhaZzIqU/EWmZ+h17CMRsdvXlLs0=;
 b=yfuGLqkmLZlEnGfJjFCA62u+4qpBTzdUg0OpacAdW+hus7pSgGQpiDun+jJEsuRovU3y
 L3ZNbIbi1m5HxTukgrWihkhhMmnO3eqbq7Qz4pUdSoKqEwzBO1XFJd1kamDybTTpVAjG
 1vf/qqnkLrNn5R9oV87tePT8xpQxS83Ixy3IU+4a4BVb/dn8X+Vkmj8W9bVqcn7feQBs
 e1ATxc691+RaoL27gYMW5nI/oGb6w9V+aSFniWnQnoUlsKwvjvcMDrnTcolpQ+CaJ4B5
 8tHONf49EHcZxd4gnAISTv1glc8up/oTfbzWk75h3Oj+DfpHqhy1ijhuq8Z5FqR5MRZ2 Kg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=SQqYrioUhIu+iP1XhaZzIqU/EWmZ+h17CMRsdvXlLs0=;
 b=uc7Vca3pYG1hY6mLRsEHRwzoJ2tc3KBRMZlVa0DICxtP5g7P7c33mZEWieiJGX58S5tg
 uR9T5XA9mZz71SqCwUWXq3YtRug8uV5PchKK9ABy+DfDeBVR1wRd4Zc6McwJXhOz0oTH
 HhNG97nPED6wWuyvniDw2/gE4mL+lpHDWxXOiY77nKl9RElMLJMBV9D99u3mYxEz/bHN
 nL6EhSqoS1m4HJ2r84T2CGYYMyzvU7tuYZM87eDsE79qX31UXL4EqmkToUKZP9IBH3Ey
 hHiHZrwjHj2cw+ILp8wJwKi5awftjbgOzxHe9sH7z4D6xMi85fYUnzko0M9lmMyt6BPO mQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a9661s13x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MABQQ083043;
 Fri, 6 Aug 2021 22:13:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by aserp3020.oracle.com with ESMTP id 3a7r4cay6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+T7F3/ce7rOecL3dKldCUoT9t0ebHsQZbbwkYB5JpRlavhxjmVsKKVy2U1sBEpafGPuzK+MD3bJqvOGtwq2ua7rrB/HLPA8y2LrUoYqWH/pybqqT1lofuFPSTf4Cz7ksfwxOwir7BdwrXQ6djLWovKjNwhQyUtwXQkoqgyecl+6UOgMdIVQXesYcF5YIETCPkq79c+7e1iX2Pt/AYNmf4HCRLSHqCY9OGipUz5tlhRtjXQ1+x/XpemqD7KEH8MeOPgopVcj82Fp9Utez9RCHXr1sRF2cMm9ikxkBcTvKZxdUfKQgmggkvmmIHCtSmfp348qA571Kv1WG1BbDBLaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQqYrioUhIu+iP1XhaZzIqU/EWmZ+h17CMRsdvXlLs0=;
 b=bfGzO4qdllC7ao/ZjP9CHQ2SM6P5rc6b0JU0Cb4tplDEkebvox80a10n3umPRtETkYOefTxhWpAuD3eTOkfrWhlAHUdLxTFckaKlRc1Xjpne1X/1x7bQHpREtctdl7uBeSZKXWiWRNzOsRZcd/O2Pcip7NAxygkIB1+hC//qmMKhv18FqbC5nETPvqdqPFsED/0pGGBlZ4PXbkRkgW/NBm/gQFHiVYAkcheQMgoWL/JhGuBuy035fmDROxyVIeoXd1NO1I+BVrXju1j+eZV51zWLOhcS8ca7YXulLlUYrm+dRjODtUe7WLD6SNKfysTSZaau/OCHTrMczsx3wWiYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQqYrioUhIu+iP1XhaZzIqU/EWmZ+h17CMRsdvXlLs0=;
 b=PqIZBj8QanvzooPN0MMK6NKRR3X1YF++5rAnuK+WGZthQFGFNWs9h/aQUbPgnJuyx9zhYMVE32rbDkq3KDgI/EdJYuzPe0+dEp4ZZVldgTCiCyzmTBViQVXH+puMLCpL0yEr3etz6s15inY9ioBT3QngARMluMOsJPDix5FuZqs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4129.namprd10.prod.outlook.com (2603:10b6:a03:210::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:28 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:28 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 19/27] vfio-pci: cpr part 1 (fd and dma)
Date: Fri,  6 Aug 2021 14:43:53 -0700
Message-Id: <1628286241-217457-20-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bc10d25-c429-4eaf-3365-08d959276ae6
X-MS-TrafficTypeDiagnostic: BY5PR10MB4129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4129BAC63BB15B9538C3A979F9F39@BY5PR10MB4129.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:392;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SiclzzOUDYTxkgLZLbBINI1rWyxEblCVZRc7azTtoa0gfIJfQOXtmkWTj/i4UscZtKEGN9URfqOwpHCExC6P117Vslw4BDtLuvp/hw852LT4JT9UZqdMHEJVQMitgO8NKH2tTf5hSoIx1G+mJV7Set0dJHZMk4adqsJg/hEnkpwITN5ZGD+AWuIpsV1tW5e0HHFyecEN5DghRpj/2r3bbvIDsmJ+L7Yc7J/Ngzkn/ow8QsxSqNAq040acykUMl2qptjTTKuusqwMI8Okjz3Skh4R98V5JyOG5tNyy63Hc42H4wdIVOejuUy3KdRrLxVspXj4il2bml+i8IRRNafgitBXQiQ21v5TXtMXtR9ttB3JanKZSX2FJkRmaoI3KlxNGliumf+NucNBEnKlFUeG3vnzwef8O0OdthqKf78ECgva1w/FZ9e5C1onwdQ7ANFB6L9VX55HGjy45cG3myw+v/TmzeD1FKEXW4utO4LDLfAANaY29+GN9xuT+AFXhbcTo+lJtV3+qpHQTnr1K07m3QdXDxEebJ7Pnn+7eJAYEkY5fOjbGg0hVYzsE+LS7MlIY34rS3n2m5lzugTc6LEimBKm7mUfGXZpgYGfIxBpnLwVNhM41iVH+R6SoHpYyuIrODlXXxlO8HNGkkDOZ4J4NDzXBgq+k7SKPVjRU2Fs4sIpoFXqOhMwtBbzPdp37Jhvhi5rUQoRfWy8WJ5PDsrQSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(66946007)(66556008)(956004)(2616005)(316002)(7416002)(38350700002)(8936002)(478600001)(66476007)(36756003)(86362001)(38100700002)(5660300002)(54906003)(8676002)(4326008)(6486002)(7696005)(52116002)(186003)(2906002)(6666004)(107886003)(30864003)(6916009)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4TSM+O+s+J9Fh2uor66oqJBAPFdyw9L/aK+jecrM/l2nrbb2YeumwJey/2uS?=
 =?us-ascii?Q?4TqB+E03U7tcs9gda7xRBv2wrJshHSQ6+2BZv/OM1rn3A+b8BZoAgyVYqrwR?=
 =?us-ascii?Q?Gn/SYt/O4RyLn4KTuUl71Wkrim+j+H4PuL0vZm0oSjkj7GoIqXCgPbpFZJT/?=
 =?us-ascii?Q?lwDW1eqBKJ5b1vBAG1ROezmqAqtjCptxxLP2rntrF1miBPV4jqGSfPihePEC?=
 =?us-ascii?Q?R7peVdjkFChrLHiYNiGPixvSVMJ2RMM0kJTUhPX8k74aoedJnBGxQ0q49KjN?=
 =?us-ascii?Q?K5UyeRB8vp9NwOg/zVdNbWfdl6sAEQvxPPtU5M3ce8UzIbYr2welsaBK6TZD?=
 =?us-ascii?Q?MQqWutoifP+a4bWJ5tW6LDG27Wwn2yhtu0KmISLNzkBS6h7H7mrAaRAzz9BZ?=
 =?us-ascii?Q?k4YFLjEnIfi2YqX/HSG3foPQjgyaVnRj+CQATbu7X5xvcTofRDuXvwVMhkiC?=
 =?us-ascii?Q?A8ONmAKuUmX7toBjvg5qwbkt59Vv5RQaATQe6mysVkoCTtNrdpbeeWCCXGKa?=
 =?us-ascii?Q?nqA4z1/BwkpjBrF5wh+0PXBSk8kBODBQEaBGrg/TA727XeJFFS4mLz4i0pXa?=
 =?us-ascii?Q?KCPLJ8crNCIhZEgragVawL+nuNOH0f5tfvM9X61s9DlpI689CrZ186a3lQqi?=
 =?us-ascii?Q?wu0PfusPfoXQB81uvCwBiCP8fOzqcM3JkIV074dyOgI9HisX7LjPmZXf+f53?=
 =?us-ascii?Q?qnSdqSYj59xWwkxvhaStoCNPG0LwmHS+4IGHbHI0naje1SJDsEUBFfpFHrHP?=
 =?us-ascii?Q?gH7i2Cl46SuGeCgqi01xu9KMeJD8SGYA1YIH4vz8fU7tJcIpifeeAF4h2kum?=
 =?us-ascii?Q?2EMUooag4J+w764VnBURIcV0q723nz6iJkUZaDPL5oLbSePJWdppVzUUs4xe?=
 =?us-ascii?Q?cbnM9u7I+6B8FYUupv7PU3bXysS+lTEJn4vK0jDeC/dX/nj9eLMWdHFZr8y+?=
 =?us-ascii?Q?rootl4sU0XAlhyQ/FH8reWCP2+0+5f2Es6do0TA9hhdoK0qgKsfnPDifYRwJ?=
 =?us-ascii?Q?BBo/4/Kvw0Vzf4RHICUi8xoFJanVVLnSupsOsG14Wxi78wEGcdsmfcxtE8NS?=
 =?us-ascii?Q?/lLr9nhG17G43zOlKJP0j0CJ73yrDjQGEJ9uBwjXfcgQooym49tLc+KWl2P2?=
 =?us-ascii?Q?hbKd69uJLwgL3ufhj9wJ1vAkLQVdE4NOdoYbGQKtCqWoDb99PQfcz6JaZS3G?=
 =?us-ascii?Q?pXAxj8xnw3b94TJOoIj7fVRDv6QQpOW82qZdQPkHC0q3T4/hdrk4bQmzqlAI?=
 =?us-ascii?Q?N6TVyBKBCC4zRPRoQrc6j98YSH1W/9gVykqs7tSHCEvkBBDFP+dap3QFy0ci?=
 =?us-ascii?Q?Ga9i7fHCI2Ykao2WojUNxNWZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc10d25-c429-4eaf-3365-08d959276ae6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:28.3462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1y70b2fqbzrvqqKkAYFHkM9zxT6GO0m5nmUWZ1pppPGnVGRhl4sv5su5T0L/RSlQlwyStUlJp1s9+7WRvBkEeuEsudGTWZsqPZrV9zPE4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4129
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: E2OUhkuVCl3sd0X9Pbf7XA3EcYr1X9oZ
X-Proofpoint-ORIG-GUID: E2OUhkuVCl3sd0X9Pbf7XA3EcYr1X9oZ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable vfio-pci devices to be saved and restored across an exec restart
of qemu.

At vfio creation time, save the value of vfio container, group, and device
descriptors in cpr state.

In cpr-save and cpr-exec, suspend the use of virtual addresses in DMA
mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
at a different VA after exec.  DMA to already-mapped pages continues.  Save
the msi message area as part of vfio-pci vmstate, save the interrupt and
notifier eventfd's in cpr state, and clear the close-on-exec flag for the
vfio descriptors.  The flag is not cleared earlier because the descriptors
should not persist across miscellaneous fork and exec calls that may be
performed during normal operation.

On qemu restart, vfio_realize() finds the descriptor env vars, uses
the descriptors, and notes that the device is being reused.  Device and
iommu state is already configured, so operations in vfio_realize that
would modify the configuration are skipped for a reused device, including
vfio ioctl's and writes to PCI configuration space.  The result is that
vfio_realize constructs qemu data structures that reflect the current
state of the device.  However, the reconstruction is not complete until
cpr-load is called. cpr-load loads the msi data and finds eventfds in cpr
state.  It rebuilds vector data structures and attaches the interrupts to
the new KVM instance.  cpr-load then walks the flattened ranges of the
vfio_address_spaces and calls VFIO_DMA_MAP_FLAG_VADDR to inform the kernel
of the new VA's.  Lastly, it starts the VM and suppresses vfio device reset.

This functionality is delivered by 3 patches for clarity.  Part 1 handles
device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
support.  Part 3 adds INTX support.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS                   |   1 +
 hw/pci/pci.c                  |   4 ++
 hw/vfio/common.c              |  69 ++++++++++++++++--
 hw/vfio/cpr.c                 | 160 ++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/meson.build           |   1 +
 hw/vfio/pci.c                 |  57 +++++++++++++++
 hw/vfio/trace-events          |   1 +
 include/hw/pci/pci.h          |   1 +
 include/hw/vfio/vfio-common.h |   5 ++
 include/migration/cpr.h       |   3 +
 linux-headers/linux/vfio.h    |   6 ++
 migration/cpr.c               |  10 ++-
 migration/target.c            |  14 ++++
 13 files changed, 325 insertions(+), 7 deletions(-)
 create mode 100644 hw/vfio/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a9d2ed8..3132965 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2904,6 +2904,7 @@ CPR
 M: Steve Sistare <steven.sistare@oracle.com>
 M: Mark Kanda <mark.kanda@oracle.com>
 S: Maintained
+F: hw/vfio/cpr.c
 F: include/migration/cpr.h
 F: migration/cpr.c
 F: qapi/cpr.json
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 59408a3..b9c6ca1 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -307,6 +307,10 @@ static void pci_do_device_reset(PCIDevice *dev)
 {
     int r;
 
+    if (dev->reused) {
+        return;
+    }
+
     pci_device_deassert_intx(dev);
     assert(dev->irq_state == 0);
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7918c0d..872a1ac 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -31,6 +31,7 @@
 #include "exec/memory.h"
 #include "exec/ram_addr.h"
 #include "hw/hw.h"
+#include "migration/cpr.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
@@ -464,6 +465,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
+    if (container->reused) {
+        return 0;
+    }
+
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
         /*
          * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
@@ -501,6 +506,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .size = size,
     };
 
+    if (container->reused) {
+        return 0;
+    }
+
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
@@ -1872,6 +1881,10 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
     if (iommu_type < 0) {
         return iommu_type;
     }
+    if (container->reused) {
+        container->iommu_type = iommu_type;
+        return 0;
+    }
 
     ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
     if (ret) {
@@ -1972,6 +1985,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
 {
     VFIOContainer *container;
     int ret, fd;
+    bool reused;
     VFIOAddressSpace *space;
 
     space = vfio_get_address_space(as);
@@ -2007,7 +2021,13 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
      * details once we know which type of IOMMU we are using.
      */
 
+    fd = cpr_find_fd("vfio_container_for_group", group->groupid);
+    reused = (fd >= 0);
+
     QLIST_FOREACH(container, &space->containers, next) {
+        if (container->fd == fd) {
+            break;
+        }
         if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
             ret = vfio_ram_block_discard_disable(container, true);
             if (ret) {
@@ -2020,14 +2040,25 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                 }
                 return ret;
             }
-            group->container = container;
-            QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+            break;
+        }
+    }
+
+    if (container) {
+        group->container = container;
+        QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+        if (!reused) {
             vfio_kvm_device_add_group(group);
-            return 0;
+            cpr_save_fd("vfio_container_for_group", group->groupid,
+                        container->fd);
         }
+        return 0;
+    }
+
+    if (!reused) {
+        fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
     }
 
-    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
     if (fd < 0) {
         error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
         ret = -errno;
@@ -2045,6 +2076,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container = g_malloc0(sizeof(*container));
     container->space = space;
     container->fd = fd;
+    container->reused = reused;
     container->error = NULL;
     container->dirty_pages_supported = false;
     container->dma_max_mappings = 0;
@@ -2183,6 +2215,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     }
 
     container->initialized = true;
+    cpr_save_fd("vfio_container_for_group", group->groupid, fd);
 
     return 0;
 listener_release_exit:
@@ -2212,6 +2245,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
 
     QLIST_REMOVE(group, container_next);
     group->container = NULL;
+    cpr_delete_fd("vfio_container_for_group", group->groupid);
 
     /*
      * Explicitly release the listener first before unset container,
@@ -2253,6 +2287,7 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
     VFIOGroup *group;
     char path[32];
     struct vfio_group_status status = { .argsz = sizeof(status) };
+    bool reused;
 
     QLIST_FOREACH(group, &vfio_group_list, next) {
         if (group->groupid == groupid) {
@@ -2270,7 +2305,13 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
     group = g_malloc0(sizeof(*group));
 
     snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
-    group->fd = qemu_open_old(path, O_RDWR);
+
+    group->fd = cpr_find_fd("vfio_group", groupid);
+    reused = (group->fd >= 0);
+    if (!reused) {
+        group->fd = qemu_open_old(path, O_RDWR);
+    }
+
     if (group->fd < 0) {
         error_setg_errno(errp, errno, "failed to open %s", path);
         goto free_group_exit;
@@ -2304,6 +2345,10 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 
     QLIST_INSERT_HEAD(&vfio_group_list, group, next);
 
+    if (!reused) {
+        cpr_save_fd("vfio_group", groupid, group->fd);
+    }
+
     return group;
 
 close_fd_exit:
@@ -2328,6 +2373,7 @@ void vfio_put_group(VFIOGroup *group)
     vfio_disconnect_container(group);
     QLIST_REMOVE(group, next);
     trace_vfio_put_group(group->fd);
+    cpr_delete_fd("vfio_group", group->groupid);
     close(group->fd);
     g_free(group);
 
@@ -2341,8 +2387,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 {
     struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
     int ret, fd;
+    bool reused;
+
+    fd = cpr_find_fd(name, 0);
+    reused = (fd >= 0);
+    if (!reused) {
+        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
+    }
 
-    fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
     if (fd < 0) {
         error_setg_errno(errp, errno, "error getting device from group %d",
                          group->groupid);
@@ -2387,6 +2439,10 @@ int vfio_get_device(VFIOGroup *group, const char *name,
     vbasedev->num_irqs = dev_info.num_irqs;
     vbasedev->num_regions = dev_info.num_regions;
     vbasedev->flags = dev_info.flags;
+    vbasedev->reused = reused;
+    if (!reused) {
+        cpr_save_fd(name, 0, fd);
+    }
 
     trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
                           dev_info.num_irqs);
@@ -2403,6 +2459,7 @@ void vfio_put_base_device(VFIODevice *vbasedev)
     QLIST_REMOVE(vbasedev, next);
     vbasedev->group = NULL;
     trace_vfio_put_base_device(vbasedev->fd);
+    cpr_delete_fd(vbasedev->name, 0);
     close(vbasedev->fd);
 }
 
diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
new file mode 100644
index 0000000..0981d31
--- /dev/null
+++ b/hw/vfio/cpr.c
@@ -0,0 +1,160 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+#include <linux/vfio.h>
+#include "hw/vfio/vfio-common.h"
+#include "sysemu/kvm.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+static int
+vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
+{
+    struct vfio_iommu_type1_dma_unmap unmap = {
+        .argsz = sizeof(unmap),
+        .flags = VFIO_DMA_UNMAP_FLAG_VADDR | VFIO_DMA_UNMAP_FLAG_ALL,
+        .iova = 0,
+        .size = 0,
+    };
+    if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
+        error_setg_errno(errp, errno, "vfio_dma_unmap_vaddr_all");
+        return -errno;
+    }
+    return 0;
+}
+
+static int vfio_dma_map_vaddr(VFIOContainer *container, hwaddr iova,
+                              ram_addr_t size, void *vaddr,
+                              Error **errp)
+{
+    struct vfio_iommu_type1_dma_map map = {
+        .argsz = sizeof(map),
+        .flags = VFIO_DMA_MAP_FLAG_VADDR,
+        .vaddr = (__u64)(uintptr_t)vaddr,
+        .iova = iova,
+        .size = size,
+    };
+    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
+        error_setg_errno(errp, errno,
+                         "vfio_dma_map_vaddr(iova %lu, size %ld, va %p)",
+                         iova, size, vaddr);
+        return -errno;
+    }
+    return 0;
+}
+
+static int
+vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
+{
+    MemoryRegion *mr = section->mr;
+    VFIOContainer *container = handle;
+    const char *name = memory_region_name(mr);
+    ram_addr_t size = int128_get64(section->size);
+    hwaddr offset, iova, roundup;
+    void *vaddr;
+
+    if (vfio_listener_skipped_section(section) || memory_region_is_iommu(mr)) {
+        return 0;
+    }
+
+    offset = section->offset_within_address_space;
+    iova = REAL_HOST_PAGE_ALIGN(offset);
+    roundup = iova - offset;
+    size -= roundup;
+    size = REAL_HOST_PAGE_ALIGN(size);
+    vaddr = memory_region_get_ram_ptr(mr) +
+            section->offset_within_region + roundup;
+
+    trace_vfio_region_remap(name, container->fd, iova, iova + size - 1, vaddr);
+    return vfio_dma_map_vaddr(container, iova, size, vaddr, errp);
+}
+
+bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
+{
+    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
+        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
+        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
+                         "or VFIO_UNMAP_ALL");
+        return false;
+    } else {
+        return true;
+    }
+}
+
+int vfio_cpr_save(Error **errp)
+{
+    ERRP_GUARD();
+    VFIOAddressSpace *space, *last_space;
+    VFIOContainer *container, *last_container;
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            if (!vfio_is_cpr_capable(container, errp)) {
+                return -1;
+            }
+        }
+    }
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            if (vfio_dma_unmap_vaddr_all(container, errp)) {
+                goto unwind;
+            }
+        }
+    }
+    return 0;
+
+unwind:
+    last_space = space;
+    last_container = container;
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            Error *err;
+
+            if (space == last_space && container == last_container) {
+                break;
+            }
+            if (address_space_flat_for_each_section(space->as,
+                                                    vfio_region_remap,
+                                                    container, &err)) {
+                error_prepend(errp, "%s", error_get_pretty(err));
+                error_free(err);
+            }
+        }
+    }
+    return -1;
+}
+
+int vfio_cpr_load(Error **errp)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            if (!vfio_is_cpr_capable(container, errp)) {
+                return -1;
+            }
+            container->reused = false;
+            if (address_space_flat_for_each_section(space->as,
+                                                    vfio_region_remap,
+                                                    container, errp)) {
+                return -1;
+            }
+        }
+    }
+    QLIST_FOREACH(group, &vfio_group_list, next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            vbasedev->reused = false;
+        }
+    }
+    return 0;
+}
diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index da9af29..e247b2b 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -5,6 +5,7 @@ vfio_ss.add(files(
   'migration.c',
 ))
 vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
+  'cpr.c',
   'display.c',
   'pci-quirks.c',
   'pci.c',
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e8e371e..64e2557 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -29,6 +29,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
+#include "migration/cpr.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -2899,6 +2900,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         vfio_put_group(group);
         goto error;
     }
+    pdev->reused = vdev->vbasedev.reused;
 
     vfio_populate_device(vdev, &err);
     if (err) {
@@ -3168,6 +3170,10 @@ static void vfio_pci_reset(DeviceState *dev)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(dev);
 
+    if (vdev->pdev.reused) {
+        return;
+    }
+
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
     vfio_pci_pre_reset(vdev);
@@ -3275,6 +3281,56 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void vfio_merge_config(VFIOPCIDevice *vdev)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    int size = MIN(pci_config_size(pdev), vdev->config_size);
+    g_autofree uint8_t *phys_config = g_malloc(size);
+    uint32_t mask;
+    int ret, i;
+
+    ret = pread(vdev->vbasedev.fd, phys_config, size, vdev->config_offset);
+    if (ret < size) {
+        ret = ret < 0 ? errno : EFAULT;
+        error_report("failed to read device config space: %s", strerror(ret));
+        return;
+    }
+
+    for (i = 0; i < size; i++) {
+        mask = vdev->emulated_config_bits[i];
+        pdev->config[i] = (pdev->config[i] & mask) | (phys_config[i] & ~mask);
+    }
+}
+
+static int vfio_pci_post_load(void *opaque, int version_id)
+{
+    VFIOPCIDevice *vdev = opaque;
+    PCIDevice *pdev = &vdev->pdev;
+
+    vfio_merge_config(vdev);
+
+    pdev->reused = false;
+
+    return 0;
+}
+
+static bool vfio_pci_needed(void *opaque)
+{
+    return cpr_mode() == CPR_MODE_RESTART;
+}
+
+static const VMStateDescription vfio_pci_vmstate = {
+    .name = "vfio-pci",
+    .unmigratable = 1,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .post_load = vfio_pci_post_load,
+    .needed = vfio_pci_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -3282,6 +3338,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 
     dc->reset = vfio_pci_reset;
     device_class_set_props(dc, vfio_pci_dev_properties);
+    dc->vmsd = &vfio_pci_vmstate;
     dc->desc = "VFIO-based PCI device assignment";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     pdc->realize = vfio_realize;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 0ef1b5f..63dd0fe 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -118,6 +118,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_region_remap(const char *name, int fd, uint64_t iova_start, uint64_t iova_end, void *vaddr) "%s fd %d 0x%"PRIx64" - 0x%"PRIx64" [%p]"
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index bf5be06..f079423 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -360,6 +360,7 @@ struct PCIDevice {
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
     uint32_t acpi_index;
+    bool reused;
 };
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index cb04cc6..0766cc4 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -85,6 +85,7 @@ typedef struct VFIOContainer {
     Error *error;
     bool initialized;
     bool dirty_pages_supported;
+    bool reused;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
@@ -136,6 +137,7 @@ typedef struct VFIODevice {
     bool no_mmap;
     bool ram_block_discard_allowed;
     bool enable_migration;
+    bool reused;
     VFIODeviceOps *ops;
     unsigned int num_irqs;
     unsigned int num_regions;
@@ -212,6 +214,9 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+int vfio_cpr_save(Error **errp);
+int vfio_cpr_load(Error **errp);
+bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index 83f69c9..e9b987f 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -25,4 +25,7 @@ int cpr_state_load(Error **errp);
 CprMode cpr_state_mode(void);
 void cpr_state_print(void);
 
+int cpr_vfio_save(Error **errp);
+int cpr_vfio_load(Error **errp);
+
 #endif
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index e680594..48a02c0 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -52,6 +52,12 @@
 /* Supports the vaddr flag for DMA map and unmap */
 #define VFIO_UPDATE_VADDR		10
 
+/* Supports VFIO_DMA_UNMAP_FLAG_ALL */
+#define VFIO_UNMAP_ALL                        9
+
+/* Supports VFIO DMA map and unmap with the VADDR flag */
+#define VFIO_UPDATE_VADDR              10
+
 /*
  * The IOCTL interface is designed for extensibility by embedding the
  * structure length (argsz) and flags into structures passed between
diff --git a/migration/cpr.c b/migration/cpr.c
index 72a5f4b..16f11bd 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -7,6 +7,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/memory.h"
+#include "hw/vfio/vfio-common.h"
 #include "io/channel-buffer.h"
 #include "io/channel-file.h"
 #include "migration.h"
@@ -108,7 +109,9 @@ void qmp_cpr_exec(strList *args, Error **errp)
         error_setg(errp, "cpr-exec requires cpr-save with restart mode");
         return;
     }
-
+    if (cpr_vfio_save(errp)) {
+        return;
+    }
     cpr_walk_fd(preserve_fd, 0);
     if (cpr_state_save(errp)) {
         return;
@@ -148,6 +151,11 @@ void qmp_cpr_load(const char *filename, Error **errp)
         goto out;
     }
 
+    if (cpr_active_mode == CPR_MODE_RESTART &&
+        cpr_vfio_load(errp)) {
+        goto out;
+    }
+
     state = global_state_get_runstate();
     if (state == RUN_STATE_RUNNING) {
         vm_start();
diff --git a/migration/target.c b/migration/target.c
index 4390bf0..984bc9e 100644
--- a/migration/target.c
+++ b/migration/target.c
@@ -8,6 +8,7 @@
 #include "qemu/osdep.h"
 #include "qapi/qapi-types-migration.h"
 #include "migration.h"
+#include "migration/cpr.h"
 #include CONFIG_DEVICES
 
 #ifdef CONFIG_VFIO
@@ -22,8 +23,21 @@ void populate_vfio_info(MigrationInfo *info)
         info->vfio->transferred = vfio_mig_bytes_transferred();
     }
 }
+
+int cpr_vfio_save(Error **errp)
+{
+    return vfio_cpr_save(errp);
+}
+
+int cpr_vfio_load(Error **errp)
+{
+    return vfio_cpr_load(errp);
+}
+
 #else
 
 void populate_vfio_info(MigrationInfo *info) {}
+int cpr_vfio_save(Error **errp) { return 0; }
+int cpr_vfio_load(Error **errp) { return 0; }
 
 #endif /* CONFIG_VFIO */
-- 
1.8.3.1


