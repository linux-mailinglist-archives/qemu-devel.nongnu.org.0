Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C713DB8E5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 14:52:04 +0200 (CEST)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Rzf-0006v7-Eb
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 08:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m9RyE-0005on-MG
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 08:50:34 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m9RyC-0000lh-EL
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 08:50:34 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UCjjAe000741; Fri, 30 Jul 2021 12:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=WvO12R4azaBVexLZB3711KznGxGkMuGYzLy4Y07vFxI=;
 b=SpdaFYvZkyVr7nCZvv90gDiH/+QCuymDKlRBPTiaKoGtaIJrpNEGOuyFty0Op0ZoIsAU
 452RAJE+L0tiFIYK9yIxlujPShR07FdRTwjPdRZVT+KWKLTabVyQwSjDT/pVpxl/Qmlf
 PQM4LPUU8YkiHuFUMUIR8tUlwAI7MWmOOYpKml2bp9uzaCsUgiZJQxwJnirkEGVPqKWv
 3s5mRMvTiDBj7qVsypbYSKCHBWbUAhCyRDgq2hxR+TvsUghylb+o3LBVFDWAXJ/P/4Wq
 u34tiwj0JzmyY+58RT7gtLBynsFvxIRgDfZvjLHysf8/jcfy3kyjU3Ic1PjQH6L+noRq NA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=WvO12R4azaBVexLZB3711KznGxGkMuGYzLy4Y07vFxI=;
 b=AERJ3nr2HPJPI75fGWAw7P7WzSpbnH7RP8f2SAA8HQEHmTa/h//66cCaXtfbHmL91tv7
 1ljE48HRjjREjq/E3dgTOgmIprRMr6oQekIQP4valTEZaSlzG1wJuv4ErGTaCshS51Ou
 Qze3VKdqEcIZupWTaVmq2vn3M+DhQap2U+LZugFG8nI4+3urVJwHEXCaIkpWqziuEASs
 79qXDtpzjeZcIEy6OP6+ZgPDyzXMA1V5QgBsfZjygBG1a/YntjymOdCncrcM+Y84Ydh8
 0KZ35e7ntd8VWnFEttNUryleNLBrLn4rLJvslhzcJdsB6ivN58puzRz/rVky0v6JjUUn /w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a3uujart4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 12:50:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16UCnfbE020090;
 Fri, 30 Jul 2021 12:50:21 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by aserp3020.oracle.com with ESMTP id 3a234e6m5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 12:50:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHrkVJqpwxuwijH3rY+CFL3Afky2qMgrCOa11r0vAdInqtmObbNuod+9EI4ZdQHDaELHLTr0ikIAv1uFae16/YIxlUqtDVdY+yqC34yHHXcOfeg4Lg68Mps5QjpBo1b2i0k1qBIek8+7PXmc5g+lbMGuGqz7xh0ZdO4m56fGV6FwKVf0SA5apCzf+iOCTTvi79WMmH3S9z3c6X6Ed+Ico6jzZp1O/BQV0jpvT1E5toOKiWTkvn2niyFv1DWVTALz8lZvrbN6WfZI+5WYRCm1PEkGot5+gFPGsQsP9eOWpceQY3stujuq2wHKNQ3N+gWiGoICqoibXBBdQpPTFfliaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvO12R4azaBVexLZB3711KznGxGkMuGYzLy4Y07vFxI=;
 b=hyQ3vJ626hjtPp8yzYGl/WMWdho/Vh8cj3nfoYP2ffuHjKVngDdrZ0V3aWpk/136xDHVmZCaZxu0jM3EWwMG9RIq5XsJy8M5y3pxkkiu+ORPt/EEO0us6zlT0IBih5t5wtEzyYjjOqZwAhUgnuFlkmz6xHFZkN3Ydhl5N6Z7tOWtSFCluk0Q6YJe7jdmRdvNG7gcRwtkrn6Vws6QwXX68FTQGuPQzrQmXtDfusbW8ovZIJDVmXXltOTxz36g8BP8wHzubuctdtk2IdnOJWxFpZfzSkVJVj6Ik35dK5j474H9VWAoDnTyHfgnhXXGcvUoI9CHM0ZgGjKyhrDRYJSawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvO12R4azaBVexLZB3711KznGxGkMuGYzLy4Y07vFxI=;
 b=lJNORqvqnQfsTdgfBojXeU3BIwxxOh/ODbduUgn77h30GOBsrclvv5OSZCbpb/pbGmfQY/ERHD34t4oYZvhVGX1TdTiGkZbzWkcmw3kToyjYI6rCPeXu5V6vQuGEbzcbkgFnWOUqn85IySXdwt7lti3HKfI+ufLt18ke4vo5PKU=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Fri, 30 Jul
 2021 12:50:18 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 12:50:18 +0000
Subject: Re: [PATCH V5 16/25] vfio-pci: cpr part 1
To: Zheng Chuan <zhengchuan@huawei.com>, qemu-devel@nongnu.org
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-17-git-send-email-steven.sistare@oracle.com>
 <50a6096e-f49d-4dad-970a-0f78ba601259@huawei.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <eef04001-b3af-98e0-386d-92b0e7c7fea9@oracle.com>
Date: Fri, 30 Jul 2021 08:50:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <50a6096e-f49d-4dad-970a-0f78ba601259@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0059.namprd11.prod.outlook.com
 (2603:10b6:a03:80::36) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 BYAPR11CA0059.namprd11.prod.outlook.com (2603:10b6:a03:80::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Fri, 30 Jul 2021 12:50:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d94472b2-071c-45f4-3fa4-08d9535895a4
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2805572DC5A193CE7AC38C04F9EC9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o85x0EwUkPjF/7S6+JRRJK1co+VpBLdQH+wGYRRevQXbj1vHX8HleXo+CTrVBJMDLTfvILYcRoEM0JjlTKf34o63G3QzeWb6bcdlYRud93KMx72LOqotvvgvsYt0C86atEl4Rcf254HEarWRj3XFa0oumg3LbwEBAslswvyr+N814X8oKmGs5ZPU9WNOqVUXm2CArTaWXB5Y/4S+AxUKk9CBTlig7ErH1ld66YuDdHZZB616g/JLAL58TwJd5MIoXc0nfk6cjcKmyQ8oE1Q3LNrBNgCuIB5ZEgpAJVjpHcUtteWlsfrjkS64jyJD1PDleen6Ylo/wZRcVs1zHyd3kEYkCWnnL5QQo9Omjv+L/Eg8SEAQPu6IRl8DDD5h6dq0dOPRKVj4AFaBgXL5IiVa9z+prYO5J7PqOqsvOiwCCsaFLux6maG89GM7tLuTTySs76TMjz8Uope1lM6+UHdBGyaVdoV5bMsTV57EJ6N1WHgRTd9+D9HINQ1CbsMolCKs2IKGCpl3O2yeoY+17BI0MvQf+QuSy3IPWt5vztpv9Kmjn3LEfT0/EYeNg1KopkiPDDvkvj77E48hi2cFw75iw6wDgfB9uXdFn5UuQ+UUiQjWEO5vMSqMDyvb6kgA5P/pAswAzk9HHFFsNulhCIW6CVIN5gaI8kdhVyyLRX5GpjMoDApNvzcKHX6V1T9L3Kaidy/iZGsKIE7nPNO+OA19E6myNUwFa2AchTWIFJPaC8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(346002)(366004)(39860400002)(31686004)(6486002)(5660300002)(956004)(186003)(66556008)(16576012)(316002)(66476007)(8676002)(53546011)(36756003)(86362001)(38100700002)(66946007)(31696002)(2616005)(2906002)(7416002)(44832011)(4326008)(8936002)(36916002)(54906003)(26005)(478600001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1pFZDVXNWpwNjIwUWdBc3dQamc2N1ptZ3E5Vmc1c3VOZGlJbHBOR0lZR1VP?=
 =?utf-8?B?TUZCQ0h0aFE4VFNlSEdYaEgzaWJPNVpFSkpsU1ZGdlF2ZWY3Yk1aTmtDRjRL?=
 =?utf-8?B?WlJlNXVOcXJwQWUxc0U0VDBmZ01HU0ljZUgvdnA5RkI4RWh0MWNSaXFCVzRP?=
 =?utf-8?B?Y0xxN0drNWVLa24xQUVqUXhwWTVOUElTd0xkWWhuQ0owWDRSOW80R0dwdWVX?=
 =?utf-8?B?bExSNHV4c1R2VnhxUFloeldmRTQ3bUhWcGZJQlBqQjhnazVkVGtTOUFQWUFN?=
 =?utf-8?B?WWF4RUZZd1RzbGVhNFgxbTR4aGJTVTJLUjhZc1ExTStkdlNoMUp4ZEY5aU1X?=
 =?utf-8?B?dzkraXQ2OUEzTUF3Zk1ZM2dUb2pqVlRaZ1d2bmNYTDlwYWYzM1dTK1lMclFi?=
 =?utf-8?B?RjdGRlB0alEzRHBQVXZXbVJ2Ti9wUDRaRm9aZXlxbk1BU25XclRrcUtVUFQz?=
 =?utf-8?B?WEoxR2xwNUkybnB5N0tTYkhPbWFQK1JQdFBGQ1ZycTl1Z1NaaEVrcmx1a3Bl?=
 =?utf-8?B?Yjg1aElmUjFUOXFkWGdWaExwdjBGS2N1SzVGak8xR2F2Zm95WkIydDJydDA3?=
 =?utf-8?B?YmFJemJsN1VqMmR3QnhINlBrZUlYOEN1azhuK09GSVRHYlJtVlJFNU11enR0?=
 =?utf-8?B?b2g3MXRna0gxZU15aC90OVpDcnZJeHE3bWJ3VG5ZY0w3bXBiQ01ieXM3eWV0?=
 =?utf-8?B?K3lQUTVsU3Z2Yk9FRVdYNzFKTVBqekRoa3RCTWV4ZnBJcXpwQ1F2WlJJZDUr?=
 =?utf-8?B?K0tNZ3Q0cmNZM0ZBRVpFYnc5QUJQcVVFUmhJaHdRQjVzVzdGc1AzQmU2NE1L?=
 =?utf-8?B?Q3M4MDRGRGlncWp4SlNRZ21DTjRFMDd1VGF4MTlsSlp3T3VYSS9Nem1OZ0h6?=
 =?utf-8?B?MEd6SEw3OXh3N2U3SGVlcXJkc2d4YW5Dc2t3R0NhVk9UUE13UktuZFRvYnlZ?=
 =?utf-8?B?SmoyVGYxY3R3bjQwdGtrTUlVQy9ETzk2OE84cDRkWXA4QnNaL1REZ3JGQjgy?=
 =?utf-8?B?OU9WRjdyMlY2MmNZN2s4U2V5Nnl4am15REFnSEZhbVFIcW8xNmxtTGx6dFp4?=
 =?utf-8?B?bFYyMlZnTWl0UThuZVo0ZFkyQXRPQWJQVDFYNkErRXNlaDZsS1E4SmdNcklY?=
 =?utf-8?B?dGdZT25URnhQOXFZZENicmcrbFI1dmNZMDU3M0JXUjlOUXpjZlJiQUxyM0pk?=
 =?utf-8?B?MGpiZzF1NlNVVzhWbmFkQ2cwZmc3d1JHaFpiVlE0Rmo3UWtySTJLTkswU0ZB?=
 =?utf-8?B?b3RmZzZ1UytvNmgwY0ljb1VBQmVzSlNDbFVLNmZoV2ppcTBrOVYxWlUzdS9o?=
 =?utf-8?B?SUpPRjhKbGVJT21hdmtVeEtUdE5SbnVTZmpuQy9DcHdTQ3Z5bmYwYXo4Qy9L?=
 =?utf-8?B?cWdkTWx5TmFtUUQ4ckhCRlF4c0JERVl4OU9mYWx2MDhNUnJ2K013Z056MFEw?=
 =?utf-8?B?bXdYU09rMm9nd0ZSRDlkb2ttV2dJWENyYmhHM281NnRrVnZ1S2RrTEovc0NX?=
 =?utf-8?B?MC9UTnVSRXBoblFpUnI2Y0pXNGRYVHhWUkZLNllFUmRWaFNIcHlvd3ZYdnlH?=
 =?utf-8?B?THhnRVdoZ1grWW9OMk1GbHQwMzBGbXZQY2J4UEJUMk9qMTdPaE1hVkJyZ1F3?=
 =?utf-8?B?anVnc0c2amF3RVZBRFBIUDlkSUdCalQzTEtYYUdPQk5FMXVNNUtINlU4VlZZ?=
 =?utf-8?B?VmM1OUhFWU0xZ0h4cTNkSDZ3ci9oWVpzVnJPZmVBSHFvRWVuaFhuYnIwMW1o?=
 =?utf-8?Q?Xc6z0L2izbe6JgoCF0ihRkbQe/dmNbYTcYDjLf4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94472b2-071c-45f4-3fa4-08d9535895a4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 12:50:18.4981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMdoL+c27Key/KVbVLUwyqNQceBbUjc9GwycT/ZsbgDxeg9weYgn57g3mSnBxQleJ9ErK8pMXiEQzBVfCY4C79nGaTqYFWI7c9RFPDOIDwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10060
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107300083
X-Proofpoint-ORIG-GUID: Dlk-K7JiKXJnRqiaUFsG6ln1Vhf7Ae-h
X-Proofpoint-GUID: Dlk-K7JiKXJnRqiaUFsG6ln1Vhf7Ae-h
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/2021 12:56 AM, Zheng Chuan wrote:
> On 2021/7/8 1:20, Steve Sistare wrote:
>> Enable vfio-pci devices to be saved and restored across an exec restart
>> of qemu.
>>
>> [...]
>> --- a/migration/cpr.c
>> +++ b/migration/cpr.c
>> @@ -31,6 +31,13 @@
>>  #include "hw/virtio/vhost.h"
>>  #include "qemu/env.h"
>>  
>> +static CprMode cpr_active_mode = CPR_MODE_NONE;
>> +
>> +CprMode cpr_mode(void)
>> +{
>> +    return cpr_active_mode;
>> +}
>> +
>>  QEMUFile *qf_file_open(const char *path, int flags, int mode,
>>                                const char *name, Error **errp)
>>  {
>> @@ -92,6 +99,7 @@ void cprsave(const char *file, CprMode mode, Error **errp)
>>      }
>>      vm_stop(RUN_STATE_SAVE_VM);
>>  
>> +    cpr_active_mode = mode;
>>      ret = qemu_save_device_state(f);
>>      qemu_fclose(f);
>>      if (ret < 0) {
>> @@ -105,6 +113,7 @@ err:
>>      if (saved_vm_running) {
>>          vm_start();
>>      }
>> +    cpr_active_mode = CPR_MODE_NONE;
>>  done:
>>      return;
>>  }
>> @@ -125,6 +134,13 @@ void cprexec(strList *args, Error **errp)
>>          error_setg(errp, "runstate is not save-vm");
>>          return;
>>      }
>> +    if (cpr_active_mode != CPR_MODE_RESTART) {
>> +        error_setg(errp, "cprexec requires cprsave with restart mode");
>> +        return;
>> +    }
>> +    if (vfio_cprsave(errp)) {
>> +        return;
>> +    }
>>      walkenv(FD_PREFIX, preserve_fd, 0);
>>      qemu_system_exec_request(args);
>>  }
>> @@ -158,6 +174,10 @@ void cprload(const char *file, Error **errp)
>>          return;
>>      }
>>  
>> +    if (vfio_cprload(errp)) {
>> +        return;
>> +    }
>> +
> It will compile failed in some targets without vfio support such as m68k.
> Maybe CONFIG_VFIO should be added for vfio_{save, load}.
> 
>>      state = global_state_get_runstate();
>>      if (state == RUN_STATE_RUNNING) {
>>          vm_start();

Thank-you Zheng.  I will fix this and the other mistakes you found.

- Steve

