Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F73F5F91
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:53:20 +0200 (CEST)
Received: from localhost ([::1]:33946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWre-0007ao-Tf
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mIWqT-0006tP-Eo
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:52:05 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mIWqP-00009k-S0
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:52:04 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17OCi5D7000921;
 Tue, 24 Aug 2021 13:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=anfhy1ptybfgi72kKzbyye5fQ8LL6VsdYElk3NIKzhU=;
 b=NwSrOY4Z2PAQFEMu270ISvt68CQfDUx5JHjOW63p1I/KwYYnpP7iu1xPKUoM6egFNTKI
 YGW4QaVe8iVg5HkOreOH7E2QEXNSTWLL/HXoOe28GgK4hBLCm4H4wml3XGKQECoKP/Io
 Ma9aHAZcZyvscVrQYDHcxpqBFX9yp3C51yjtL36/DrehFq1IPdE47GJKVU0WrswSK9yF
 jX4Ah7WtSnr3vHDVp5FbA5DoU3ZR5o2u1pyAaiX7lYReh99049fWJFLoTgt7DhdxEOew
 gSi0G/jxPII1bqX6nQUgQmKZycWlpm3O+8Ubrm5a+OBqZJjhgjKjXIeWsxJ2hOhMYZlU +A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=anfhy1ptybfgi72kKzbyye5fQ8LL6VsdYElk3NIKzhU=;
 b=uCZn7Jh3LA8ecyKS3E2HGNlmcXTd7rW6Wxfd0udKQHJfq902b26/K1rcn1h0ckS7JbtE
 aeL1FkX0uJp7HDpqKNCUdQbY6P7mQBXprtA3VoK56nKMnuAK95N35pEkgCWszmO4JbCn
 Ps5N3qSltq2JXKLqWVQHZoGctXEOUVrYchiSprSkLTVgtXQztuX/sSzBkuMoC23MnQuL
 sYd/BaRCL+tQxEsrw0WQuTrrORQXBmjHCYAoBTaW8i2tJblub4reDwIgpx6TgE4pJRRh
 lfqv3Ex/G9bzcOMeD32aN+J7Qn9fjqNIw7YjbCwaHRWzZu0beYzCg/wQP9BWTuHGtRh5 HQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3amwpd8n27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Aug 2021 13:51:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17ODjX9G141132;
 Tue, 24 Aug 2021 13:51:54 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by userp3030.oracle.com with ESMTP id 3ajpkxbbck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Aug 2021 13:51:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/pgzwpXN8lWZWEIw6JtCBHNwT8MPvwE+/pkPHvtlAOTudtAbA31PfwgjTc0nz0lHUf18NLc6oSNJc7U0WD3o2P4XKpMYpNiFdq9fJMYO0h3zsBs0Gbinz5SA9WDrY6DOa/yf5Sanyvxeist4i5zZNDJxG7jdkgHUY6bF2d+CDXgks++8Y3QT/7RYogCLB2W7qL9MpXOgD+4IQVgeT+a2mhYGCpxvnxmi3UQ+AA8TPpUzueDEBHKZui9EjjFXXIhXdFIEJApFPMSkMRkXw4tQhKf8b95pUOIp+EpyZCX/AeLWDHcTDk0zPbcB6rtNk8suIQgbnZqDcdaw2VazAN49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anfhy1ptybfgi72kKzbyye5fQ8LL6VsdYElk3NIKzhU=;
 b=MjWZo/0DYTpEEdy4o4Sb61vKmzGGZ+kNneV1tjHDOa8iRhu0WqxntVAE19BVATKqLTvJzXwmOs5jpXlYckTZxqJy4MkbTKyU7y8MGgcHk63OmhsMtI0d1FCVslObRkQ+CULIs749ISqNLpwAXr/vSQwIFxW9J/zocB5uO1k5P+SEduXnUNJXHHgvLN7ZGn5kGCt4fcONtNMhIktyw4GYHJASl70saDESa356T/yhmuyct2OOcBlyqGHLJ3QVcCw7XRe+7t/6F39Zn4cqBk3Yvqo43GzPqe7cws+y/vv+pq5B4+1+DUWmF//DAFlHgP+klx1KPzBX3HyOQowWZbetug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anfhy1ptybfgi72kKzbyye5fQ8LL6VsdYElk3NIKzhU=;
 b=o4Hmr9gOn8elyLdx+UIWE/3VDyLEQdP61evG9MgUfxIVUYe2TtATjE1hIUtw0tWoQ5gCL9jG1pyBBkS3glFyxzcs/AM2PjMMnIdV4dQDeEZuj2U97ES+Gcz6Z+kiaOcuzCW/uY5hVgtmqh4ZwU50ky38IJa+X2bs8I4XV7Z1nrY=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BLAPR10MB5379.namprd10.prod.outlook.com (2603:10b6:208:325::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Tue, 24 Aug
 2021 13:51:52 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::6c3b:ee48:fd8:b568]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::6c3b:ee48:fd8:b568%9]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 13:51:52 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH] MAINTAINERS: add fuzzing reviewer
In-Reply-To: <20210824084339.sn7kb6uvulhpwpuq@mozz.bu.edu>
References: <PN0PR01MB63528E3A58EA06BD1B242486FCC59@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
 <20210824084339.sn7kb6uvulhpwpuq@mozz.bu.edu>
Date: Tue, 24 Aug 2021 14:51:46 +0100
Message-ID: <m2tujfhrwt.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6PR0402CA0009.eurprd04.prod.outlook.com
 (2603:10a6:4:91::19) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (46.7.162.180) by
 DB6PR0402CA0009.eurprd04.prod.outlook.com (2603:10a6:4:91::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 13:51:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee270e7f-9032-4cb7-c669-08d96706538d
X-MS-TrafficTypeDiagnostic: BLAPR10MB5379:
X-Microsoft-Antispam-PRVS: <BLAPR10MB5379507412185AE0457B69ABF4C59@BLAPR10MB5379.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f5Pd2KM6aEn5uOAfsoBy7nxNrNtGC/pDpaPlry4RVSHkY1dW9pgsa3ylHL8OsvG8wkx08EdvGFvUto0IAEhplZuXqC46n4RWmaR/YfFDrsLIXORLiWnSiI+j6PeJkfU3Tl/RdSw0xpNCYB7kIJ3tcLET8c1FsKoUBdAVnp4msl/FvVwXoYoBQlAmtqx03KLTq8P38msRQDqz+kgQGCSyAvGMAlt9AMxZw7V8RFNRaYCWXlmpfydFaqJ3Iv2N8cfrAn7gJJMBVsM01OBmi9ha0iDNEZRalZJH6+o8zAMMymZ1T//loPCY2HWYk9FnPMGatHO++eC3F7mSJ1Fvzoh+pKxSgOWYasmSHkqJrU2a5TwMz7Z6Jq7XDaC67b3OX1KoK1Taut3AZ3PCt22AkhJPkiOrDFpvBfUEs5A9EUPAP4jXtaqx62D2sXBa2pb1LH7y3BsLIXwf19uozlfzhZRJCJCo58yjtFiXNduUW9lqg+UneyLnRhs4oBjdTExwTCLJR3+LXjIIB9d7z6P525QwZfB5aZHTD6CRsDIbH9vuBM7CWMD/CrZIGh2seJHObrZIW+mgtksb3jSqwo0lWrf9WMsOXxeV1rXbO4wEvrfHIG0bXeVCwrxIUqHzVFr+UKFnDufvIT2RtyjvVdeCHI2+IAXSPu4mZSBtsMTzYW8pMBzlwqXWjj6SgvNwzHtwyDTIZ975KjWHACDqMZRiSXGtj9/aG+Ge4fFjB5Durm3jaQ9daBZ8HKqvTwskf6oFgWtJmwVMLL04Oqv3b8qHCa+CDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(346002)(366004)(376002)(66946007)(45080400002)(2616005)(110136005)(478600001)(186003)(86362001)(6666004)(38100700002)(66556008)(5660300002)(966005)(36756003)(38350700002)(52116002)(956004)(8936002)(7696005)(4326008)(8886007)(44832011)(55016002)(26005)(8676002)(316002)(4744005)(66476007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q1imZcx6HSjoj7mATgzsFnW+Am0vHCZh3HDGD7dpn9Yr7BG67VJ7XpWDFcrO?=
 =?us-ascii?Q?JIe0usimDrZgbwfV1sEhkLnbDcc8wKDFTZoZ/l69dpeui/HE5EUEkPIKMi+n?=
 =?us-ascii?Q?khlCwnDUwhDV21xwD223c1tFv41o7TfL9ipE/JBnzQ15hhO6THxdO+yd55Ru?=
 =?us-ascii?Q?/7LWPgaMy4AIhhBFC9eNQOJMCs6S3kFm2R19E4VNB+HqBsvo/FfV0EGf3lIN?=
 =?us-ascii?Q?xK1w5ilTWg0coeEju2j8MidZl0yA9mpK6jnJbPLYfb4wZOSbEVXJnZNSQLXT?=
 =?us-ascii?Q?CTC47ECw9axT4WQt+vNKq3GN0lD81pG0scukCq2MWOArysB3Xw2nBMIXURVY?=
 =?us-ascii?Q?4zlzCGgBerVctxWnSTRgHGjtWUUz+LT2mstVQYLvGS6rvhtIy1pA6mKRvbZS?=
 =?us-ascii?Q?CWrRMuqM6AEXm4t+B/XN34KRjAt3LPvQFIoIcszhJs6KcUScCvVlmut4niLb?=
 =?us-ascii?Q?KGYnCGqcAWOHeFVjVG+zu5aUPNyPhXGgV8bJEoVJFk0YHWhcBxdXSDVPskVe?=
 =?us-ascii?Q?ZZInUCRqK0+Q+6/UMqnCPK3CxnXma3Egvz8QJnsZAnU68CVawRAmvNmRchsO?=
 =?us-ascii?Q?elfnXiwOYOGuod2u7dLgVyQVnYTtH2tTvutxsDYtD5AxfHiq5sYx8CMMQYcC?=
 =?us-ascii?Q?qWnp7c3NzImqc5TrCuaQxXbdW/ZdMHXF6lxHsT+Vr6zmEvxvHhrlE8vd2qoH?=
 =?us-ascii?Q?Xf197ae7DPOUd18x9i95Dk5k8de248MRXqw79lyW828ggJMZPRkoHk/QBZCx?=
 =?us-ascii?Q?dchG/uyeUm+J/CII1pDXVTYOmEXvqV7QiuFBJ43ql5pnJH/es+4XPYbgMJuE?=
 =?us-ascii?Q?PSVAbJofFcnQp1d3XDUrjbkmNFrlrqiecZv9oOUmOnTlRRdUNCIXa/H7unmr?=
 =?us-ascii?Q?0PldigV7XIngm8DPJLXFNSMJWDdXHsX/9jREqh3SN2vsefzQQ/8za2bTCd+e?=
 =?us-ascii?Q?SfCAImVafnlgBDCw9onMuFXOH0w4JE8bxi8uo8UnCL20kXcAW3RsWJQzLYzb?=
 =?us-ascii?Q?Tyvc9tjHUIGgasE9NXze69GPVkUO3nJshU6XheWLrKG0VlfjjT3w5FytAAS5?=
 =?us-ascii?Q?dRDSM0MpRuQTUIAaRd1H60ZdhLRm2SukAiYcTaV/QoSlnPyeABXLRwgfRVO5?=
 =?us-ascii?Q?1uyOFA7MzxAb9xdYoN11D99gMO7Ces/HuEQAxyXqyon0L2A6S4iGkw22x+0h?=
 =?us-ascii?Q?9KRNVyyLKrc55AdzSrIpDjB8nUNY5l2nY26ObdLdBPioduNLfqMPsiAXgg4S?=
 =?us-ascii?Q?SciPC3f3q0Zc1WUJoAA567TvzMvI+Db7rBxNRAAx+mXePyyC5y1fVY5TF3YU?=
 =?us-ascii?Q?Q/DkvdJTFM2ayd82OrCHB5hs?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee270e7f-9032-4cb7-c669-08d96706538d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:51:52.1320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJXmc6IyHFpfcFviRh9IyzZLvBJBe0zuECvQDcEhpU/A+R/6QltWFSYgleP3gdiS+MpZcsoLVfv8fLB+ZhdOQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5379
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240092
X-Proofpoint-ORIG-GUID: Qh0udKAMLfLW0S7brl9zwC0WWd8HREbr
X-Proofpoint-GUID: Qh0udKAMLfLW0S7brl9zwC0WWd8HREbr
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, bsd@redhat.com, thuth@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-08-24 at 04:43:39 -04, Alexander Bulekov wrote:
> On 210824 1426, Qiuhao Li wrote:
>> To keep me cc-ed when something changes. Suggested by Alexander.
>> 
>> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03631.html
>> 
>> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
>
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

/me toddles off now to add himself too, duh...

