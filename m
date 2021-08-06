Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1BB3E31A9
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:21:01 +0200 (CEST)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8D6-0000ze-2i
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC862-00083Q-SB
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:51820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85z-0004MU-4V
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:42 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBjek007308; Fri, 6 Aug 2021 22:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=nazt+pVIrvR7J5R+6KhuojhkbDmPVepyu7YKCsjds9U=;
 b=SNy128W3zpFhOy2FniIlatPKh7hF0dYmy8r7SZu3kxnPaxfbdayU7eC7JAJzvUkEu7ah
 DdbOc80SoulqlkPk6EoCIp+7aCzN61GBUgyguoCvRpKfDsjVT2A3BGhbynXnkp72rJ/q
 i+QNPa7efGdFMCuMPeGcjxPS44IOj34Lz7+l28Yw0o/Z+BW+AvIv7H7ZEa5BBuKI8jAq
 9UXwGDWI98bi0t0DCLpi6fhFog22D8+ib/fX5iDvoGZHAlcdhhzJp2OofUgurP6ITBoz
 DQox2SyIVKUWWdcXTXLaIQNWEd64ZiZa5MdE1++p7+0fDCqT0tGoR03HUEOVqskFDsD7 4g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=nazt+pVIrvR7J5R+6KhuojhkbDmPVepyu7YKCsjds9U=;
 b=qB9SSLuMpu+rbSY1O8Caur+0SMMf1hFR6PVKGLLIgf6ols+KpwyboM3Pe0EjWZasB5T8
 ex9ZbDmYjCB/2pjSGIFNNcbal84NytPrzn0TiZKvYfOYiGT9WiBlc5VZsHK9vpXXfTwJ
 gDiGbvjWy0KZqFWVJL57TeE7K67sGiA8CmWOtptAxbZRZJXSVGcP3lI6B0h8ZIRpwkxo
 Mls51GqZe0dGMFscOU0DM0SvEMdLEDzD4T8+7HAlAWIIi01XRFivm7lMcMesz6Z6lyr7
 szDce0um3DaXhiS834hAFPTCve4pXqRJ/vyTV+v0VovluyTSF1p4BZcEO6UW1BnXCucS TA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8p6rjpmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBgJL181317;
 Fri, 6 Aug 2021 22:13:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by userp3020.oracle.com with ESMTP id 3a5ga30fgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTE7Kuapz3YbVTdXirgxWX5COSgLzCALs6PLUHIbuU1kA3sNDMH+CnR+3h7a26WhNcB88bRUoYOcxQ2v7Qsmipy46OJVIsZ/ZuRlZfUZKa+ITkb6j8f2WA7nWEtWdv6poq3g+avie6qbfVEUNK5MohsvLPmADnhIvGkI1Fk74FWWLn+gpxCSGOW8i17mR18S6btd6dV8RzqflcDEOL/vD2iVgdh5Nv/G38qspGJJkBNtSv+0lOwkokKDyVAq8RCrOL+BhedOLFDUPOnxq7UlWwt7pSFLTI9x5PjosAevIXSGyKn3R5uhaBhU0+NdNfmJ3BNxRlkn8/+cI0qMmsA05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nazt+pVIrvR7J5R+6KhuojhkbDmPVepyu7YKCsjds9U=;
 b=HwsTSRhxbONzDpTinYX+XvTPIeP4pIHHAXaV6nV/rqJlx1e04Ynm8076x29mMYtQG5+gFpLSsPTVn8Fw5ZJ7PELDwrsrTpOJEB+7rrE0ixQuL69mnvrKQnl1YQGKTPIkh2V/5ndp6D3bSefgefhh9Du/K/Fwp/wKfPKh4IQ+HzG0RqpTcxbvAIcrWtUDwJSpGs1XJrBZRhe74GbCwciKiwrcJkl4w04dRV0XIBbMHB8TzzjAHWeW9JnUaGqRmwdIZw6dhC4d4pkUpTTf9gyOge+zyipkFdeyB5/1wyNPnRdgoNXA6U1lM6P6Dvx4IbgrbqPbieoLCB40xopPpv3Whg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nazt+pVIrvR7J5R+6KhuojhkbDmPVepyu7YKCsjds9U=;
 b=IEyC51gNnWqlxn3Xw8Q0tfxe8NapNM8GBzYQouwwKymFAitq8g1a/O4RRGI25Gr7NbIrfjEFvb2IOWhffBHRJaMgaD/oC+h5DE6HGb9QaGuXiGl19R8b3n4kU15r3ZDybc7nTnvraLibPOUbbuLoB6IQuI3e7fbf+MH2Z6S11Bs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4129.namprd10.prod.outlook.com (2603:10b6:a03:210::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:30 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:30 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 20/27] vfio-pci: cpr part 2 (msi)
Date: Fri,  6 Aug 2021 14:43:54 -0700
Message-Id: <1628286241-217457-21-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 994eccc1-cb83-4c86-280f-08d959276c0b
X-MS-TrafficTypeDiagnostic: BY5PR10MB4129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB41292F9801440815B60DA3C9F9F39@BY5PR10MB4129.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AgDRsA+4L6qekOAhF6317Ov+cfSCHslHps97lFYu0CH4mZoVutdy9Q6+xnHqF7iCHd6NrtuN0j+X2fKG1oU0vmGUNrMscgN13oxlRZ1ZXD+qdgRXQLsuX9stGadr2W+UpUK4QhvKP5ROsguVX+cCPn1kL7IIHmme/luEqYROL70YVvN/DT19fj6UcBwmdMvfF9rxKCrT15SSf+8Bqcw+n3ved8qNQTkxiBLGwldx+wYYbMt58fBZaJfbvXNZpABDAD7Gequhy4POgE2Ege8XDYeQ7W+1H7xOUuxk+h+rx5xp6AZM5j/V2fQESxvNSBwVON+8fb3r6txXsdsjpdAVB2kZtLaZ/W85ROgA40kjHvAE5R2Q556DbEIp0GSZlYYoHRoXaCcSfJDeDhvEA/Bc9z7vCg/V8K4yc9rqsZCzrIqGX8PEWaECVv5F0MGdaytUgDOazl/Wl52ZV5pvO1imtUYrT343Zg+7hjeJnrDhwDE0pb64iZ9SoYupTyzphTF9K80+B2CKMAn8ZK1iC2X/JHpW9KeijBWkPsqNi+QUrWp4y1/gVF54NL0G5GhCZZsaWIbzxs25DbBg6fKqRcizmj+zvdb8JZgEZvlR2ToLJ3MKIBYdX/OgZcERXuoQ4FL+5zcNFIFWYMRmv1zfN45EubQnJXigh1kbnakA7MFXw10YQtJvPqH57HYZRYzbpMsgp4C2l8DGnsBl8V8gvghZFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(66946007)(66556008)(956004)(2616005)(316002)(7416002)(38350700002)(8936002)(478600001)(66476007)(36756003)(86362001)(38100700002)(5660300002)(54906003)(8676002)(4326008)(6486002)(7696005)(52116002)(186003)(2906002)(6666004)(107886003)(6916009)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k+WqG4fck+IThUw3RUlPcJG7YsWlAZK64Hw7KsW3soqIXyMjukVBIqQ3sk5v?=
 =?us-ascii?Q?BFlI0vjO88dQ3z4/tv4VCG2NqBTKestY2vyaZvEABNyAQqUuZdRj6l53VYyA?=
 =?us-ascii?Q?jaWKUAnHKkB4+Z5xGwhohp1enYF+SQMJKIVnJpFWJarYrhP2HsvfXhvtv+GJ?=
 =?us-ascii?Q?vnMUhWESSl37ZBs61bvM+CKdXKnEhgp6aF/FHoHSQYz8Qyih97dBVNl9Kn1u?=
 =?us-ascii?Q?oEBwV1rXXR5xyWmEuLH3oMJKXnBHrHlmFLBA5CGj3fvOoi+g/IE1e7bND2Wr?=
 =?us-ascii?Q?Jhr4ogUUv9a4eM2NclkeavaPyKskuMSskV5DZvvh7XlU6A7GzDApUAgJ/1NJ?=
 =?us-ascii?Q?dX61OElfzcldUEr35oj+kUhgtHvXJIbZ6cFnq5OECcE3IHYHRcMkmUkg+gAN?=
 =?us-ascii?Q?vxpMU22Mpe5zAXh3DHmi1fJo7Z0kV8LxHDtEAZFHHxVy4FxrlU7Ps5zJJ5hs?=
 =?us-ascii?Q?9W5sKzyOK572lJZzKceHRPfIXy3+fQHJqeNv7nVmSz3dRfDJSOhKpOFPhXaY?=
 =?us-ascii?Q?Sx/Vb4ZTe3af4z/M9+TkOdYH0ZdNuaVAQIQMvMkQSZyq/zu9mUDoOQ9ln5lp?=
 =?us-ascii?Q?Un0kvMMas+QTF/uBU7r/aec1tlJUjM3SM1UktRcOtdwXYkYjeg0/5xv1YCPB?=
 =?us-ascii?Q?veuAkuwEIZ3QXdwLd97YMNSvutXEp6KE9rRqO/Zv0CRH/Mz9uphOuLXOHekk?=
 =?us-ascii?Q?k36B20e2TiSGyBcLkLpWASsLtv2Os51u+O4aEI1L4mWLc5fZMx7HqL0QkeJm?=
 =?us-ascii?Q?a+B0DqoYpcI9EmAj6ptYeN+CMY/dJWqgAKfUNdi5cSEq8tiU8hZR1YhsvZ24?=
 =?us-ascii?Q?Mx1WseG9Dk5PyCqM+yS2fYBCUdgQqt56vN8RYofR5tt+zi02Tp63B4R0Tezo?=
 =?us-ascii?Q?gifbsxC97m452SMu8qXauvzP/BcbApesZG6WFVP+lX/1AE1j9rYQGmKHPggu?=
 =?us-ascii?Q?Xgpt5L1N+ZSMQTEiGmOLk+BYUQVgrudaXFIKevlXM3s02uP4bHCQK3Js60Tf?=
 =?us-ascii?Q?gnDTOr3Unsnl5UP6DuqO1vUbiotpjkMmghK072l+gy8yskRIUAlR683Du+OS?=
 =?us-ascii?Q?zcLzpQe2G+l1Im0HCpAtnakaxsV9bfj3UhJxQlazgf0y66H9ya1NLp0/lnmY?=
 =?us-ascii?Q?H/vFDrnvke43Qp7n49lRjqxWhyY2P1vu8Fw5fE68gJN2n/7CkW6Ui+t/8i5Q?=
 =?us-ascii?Q?15WfuTxh/vEX5JHYaW2nPueSNi/PyDJt5OSXsm/OY0dY5RhTPqyzmHFDFtTF?=
 =?us-ascii?Q?WF/eeFqJyTGOzZB+I7pNiSrNTdC3eIruGEy78BV41h95XUQ+j1ho9EV80g+K?=
 =?us-ascii?Q?lEKIGN5LDtpQ5Zi0/n+N6qcR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994eccc1-cb83-4c86-280f-08d959276c0b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:30.2452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q19uzGwBVVLOPl1xVEYI6Mca7danTdu+c1bEyBOiAi8AHBQFCmljjxpYtbIvCwWbqlSzXg89JqB1jj+c0MIhMmWxfMzJkwomO/Iyz2C2rBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4129
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: yC7uqWXHvP3AVk-pqqNzu2i8k8-aY_Mk
X-Proofpoint-GUID: yC7uqWXHvP3AVk-pqqNzu2i8k8-aY_Mk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Finish cpr for vfio-pci MSI/MSI-X devices by preserving eventfd's and
vector state.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/pci.c | 108 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 64e2557..1cee52a 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -49,11 +49,31 @@
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
 
+static void save_event_fd(VFIOPCIDevice *vdev, const char *name, int nr,
+                          EventNotifier *ev)
+{
+    int fd = event_notifier_get_fd(ev);
+
+    if (fd >= 0) {
+        g_autofree char *fdname =
+            g_strdup_printf("%s_%s", vdev->vbasedev.name, name);
+        cpr_save_fd(fdname, nr, fd);
+    }
+}
+
+static int load_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
+{
+    g_autofree char *fdname =
+        g_strdup_printf("%s_%s", vdev->vbasedev.name, name);
+    int fd = cpr_find_fd(fdname, nr);
+    return fd;
+}
+
 /* Create new or reuse existing eventfd */
 static int vfio_named_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
                                     const char *name, int nr)
 {
-    int fd = -1;   /* placeholder until a subsequent patch */
+    int fd = name ? load_event_fd(vdev, name, nr) : -1;
 
     if (fd >= 0) {
         event_notifier_init_fd(e, fd);
@@ -2709,6 +2729,10 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
     fd = event_notifier_get_fd(&vdev->err_notifier);
     qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
 
+    if (vdev->pdev.reused) {
+        return;
+    }
+
     if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_ERR_IRQ_INDEX, 0,
                                VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
@@ -2774,6 +2798,11 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
     fd = event_notifier_get_fd(&vdev->req_notifier);
     qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
 
+    if (vdev->pdev.reused) {
+        vdev->req_enabled = true;
+        return;
+    }
+
     if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_REQ_IRQ_INDEX, 0,
                            VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
@@ -3302,13 +3331,87 @@ static void vfio_merge_config(VFIOPCIDevice *vdev)
     }
 }
 
+static int vfio_pci_pre_save(void *opaque)
+{
+    VFIOPCIDevice *vdev = opaque;
+    PCIDevice *pdev = &vdev->pdev;
+    int i;
+
+    if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
+        assert(0);      /* completed in a subsequent patch */
+    }
+
+    for (i = 0; i < vdev->nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+        if (vector->use) {
+            save_event_fd(vdev, "interrupt", i, &vector->interrupt);
+            if (vector->virq >= 0) {
+                save_event_fd(vdev, "kvm_interrupt", i,
+                                &vector->kvm_interrupt);
+            }
+        }
+    }
+    save_event_fd(vdev, "err", 0, &vdev->err_notifier);
+    save_event_fd(vdev, "req", 0, &vdev->req_notifier);
+    return 0;
+}
+
+static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
+{
+    int i, fd;
+    bool pending = false;
+    PCIDevice *pdev = &vdev->pdev;
+
+    vdev->nr_vectors = nr_vectors;
+    vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
+    vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
+
+    for (i = 0; i < nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+
+        fd = load_event_fd(vdev, "interrupt", i);
+        if (fd >= 0) {
+            vfio_vector_init(vdev, "interrupt", i);
+            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
+        }
+
+        if (load_event_fd(vdev, "kvm_interrupt", i) >= 0) {
+            vfio_add_kvm_msi_virq(vdev, vector, "kvm_interrupt", i, msix);
+        }
+
+        if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
+            set_bit(i, vdev->msix->pending);
+            pending = true;
+        }
+    }
+
+    if (msix) {
+        memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
+    }
+}
+
 static int vfio_pci_post_load(void *opaque, int version_id)
 {
     VFIOPCIDevice *vdev = opaque;
     PCIDevice *pdev = &vdev->pdev;
+    int nr_vectors;
 
     vfio_merge_config(vdev);
 
+    if (msix_enabled(pdev)) {
+        nr_vectors = vdev->msix->entries;
+        vfio_claim_vectors(vdev, nr_vectors, true);
+        msix_init_vector_notifiers(pdev, vfio_msix_vector_use,
+                                   vfio_msix_vector_release, NULL);
+
+    } else if (msi_enabled(pdev)) {
+        nr_vectors = msi_nr_vectors_allocated(pdev);
+        vfio_claim_vectors(vdev, nr_vectors, false);
+
+    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
+        assert(0);      /* completed in a subsequent patch */
+    }
+
     pdev->reused = false;
 
     return 0;
@@ -3325,8 +3428,11 @@ static const VMStateDescription vfio_pci_vmstate = {
     .version_id = 0,
     .minimum_version_id = 0,
     .post_load = vfio_pci_post_load,
+    .pre_save = vfio_pci_pre_save,
     .needed = vfio_pci_needed,
     .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
+        VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
1.8.3.1


