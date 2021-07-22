Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32CE3D2FBF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 00:18:13 +0200 (CEST)
Received: from localhost ([::1]:50928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6h1A-0004MZ-Kh
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 18:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m6gzD-0003YY-AS
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:16:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m6gzA-0001jH-SH
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:16:10 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MMCm7Q030996; Thu, 22 Jul 2021 22:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=zdsndmdEYaJ+LwACWMrLFKcmmhhVkok/VzTGeJUgi9I=;
 b=L7YJN5EP07GCR2Zz5dAY45z9eNcINBXRDswkUqHE2PrG2gMNBBWV9wfgIqbIbsAOWEGf
 iOj8vqmKn3O1y7hdQ2eoYEZRpNMZFkqVZQPTZ48lm6OgfcRAQGdzJM3lwdHMft7hVPkL
 AxL2hzg365QHW4R55hEsYo53n4Avjd1uJVr1L7UXfVGrqGIG1JahsKz5q4viQ9qkSiEe
 0/aKUnVrFBsERhc5GFcUKsv2ByqBOOydxLbWQLtD0blxLeyhj7jAWC2p7mKQe8dRJ8N6
 ZKoPYGQLJJyhAPUjcLyh1lvrpIKvuTauiau5B//zNi4+j55FFNBp0LffTXrGPiPJ0klW gg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=zdsndmdEYaJ+LwACWMrLFKcmmhhVkok/VzTGeJUgi9I=;
 b=ZTbCrEHa2mpBfh1f50WMU9v6q1U3f0pmS3pl4rYqJELbtw0qSLoGudmWgcnp6rXYvUe3
 /rlczXeZyhqbi3/RB16fxK/QSo+06/QBf7xIq/dBtgWan6F9xcdw4DoZxKNiWSV0wgio
 7j5erCbLXcuGl7XU3vtJNnF6hmDNEE1lZWpshc6LLHlxSDHPzAnfCV5hU0L1HK9X+CbK
 ARvwuMSYHgQD2dyPON3P6b/zuHrShMQReuO81brEmlJsadeWq1MRqD9Z/plJfn6diXbS
 f64DbqK1EDSQqbiCiy6yxeemKo8Wd3axdcyV5IDJb807PZ1Ok7CpbAbFa8j8n10VEqe8 jw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39xu2ftuqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 22:16:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16MMBIYk137184;
 Thu, 22 Jul 2021 22:15:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by aserp3020.oracle.com with ESMTP id 39uq1c1728-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 22:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kK8J3sUx6kfHrEN5dCRrCHjHIfXjEFX06/exGSf1yuY9koNGUBTm/2/8w0gWCUpV3Xr1IsS/TUjAOqFgvUJBQSUEBGQWfR2OagDgPghXeOL9FPKIT7VGGKCyEzZ8ukxAMY3CbklsGbyUQ1fcl4E1e171oqes9EJN1Qh5HbaynEBn2KNcE8BD6J3sYMSLrdhS79uXhvjsGZ76cfUY0ufYhWpFPaHf/eC98NDYRuYBKcR4gpRbq+CjMP59a01eSgDTDTtOZnhS/T7qjO6U2ospLUgi2H0MWNQlVo9shmWRmKtkPBaIe9P1DUT9upQ8tJNKy+PbC/hfg6texNbs3yn0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdsndmdEYaJ+LwACWMrLFKcmmhhVkok/VzTGeJUgi9I=;
 b=UQJotbzc4zBAgy1klFnFfbCp6SKayhr0VwUaXy1PKcgXh77OOLNaEYohILzAdIa2k8+ZptdsrcuWmepp0pBqdHcTlFQVXjSiFq4zYeYqHi8mpdyVOaInGP4fK1gKbazD9uxBS0WnX/D/4b1hoNuoWbNEhEJgiVx17KWCHUdDvIL2sZB8+NvzSLLaqFu67UxihNZqswZuZWAAjxloK2uv4kgaJI4i56SRctJo6ZDoAva1YMbW0hIB92XV1VyM94qVQRe94W3QyJTc/mU9tcp8jhjzX2U4MFNwYrdOjKdaJ+g3+ysRBMeAxu+E1kMkiH4T5SY/z77Abip+vfaCClflGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdsndmdEYaJ+LwACWMrLFKcmmhhVkok/VzTGeJUgi9I=;
 b=Ng/YW6rZ+4mgViIHoYJH8qnB+bdKrqFOxcLD48CcmY0dyy21A8zJVF8NXgsO66v0KNhXTzQNaR8kym4LRbMaP4fQrF/mUJJfsHeZnAAF6kXNRGBf5wWNptvQIf093zjt7oG3ht9sebbu08gnqFjCVaUQW80GNiFxbgYABmfNkDk=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 22 Jul
 2021 22:15:57 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64%5]) with mapi id 15.20.4352.025; Thu, 22 Jul 2021
 22:15:57 +0000
Subject: Re: [PATCH v2 1/1] hmp: synchronize cpu state for lapic info
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
References: <20210701214051.1588-1-dongli.zhang@oracle.com>
Message-ID: <8cfc02e5-6471-c34c-9c9c-c195f687c14e@oracle.com>
Date: Thu, 22 Jul 2021 15:15:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210701214051.1588-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:806:122::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::11e9] (2601:646:c303:6700::11e9) by
 SN7PR04CA0105.namprd04.prod.outlook.com (2603:10b6:806:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Thu, 22 Jul 2021 22:15:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f08a556-0939-46c3-7c4a-08d94d5e4772
X-MS-TrafficTypeDiagnostic: BYAPR10MB3255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3255DF10817B5BD14D8DA539F0E49@BYAPR10MB3255.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRerPG3aXAVQVFxExSb4gkO+PyhD6+v71D2wAU2Kfk4fC6sGgarZPEldkxhQzG4RwFbnryhPBKnNA6BuerJNVwmkVxGAE2iwDSVAkDkSUUL/TkEMBmugCWIPXF3Lhe8rYv8XTNm50XV5QUbt+CXSe/LlS3rv8E4AUxzXix7foLRmnypy8w3uBFpdD8EXMyN0nv6fUYSXRqWBZgPRG/W3s4844sdqIQfaanMTT5WXd7+pe5ZO8T8jionGxXVZ1pYHVyliHpAS77/TqD6WDdGWft53TkadNj+HQye2gQNdQnriLKM8dpRQrzBmnSf/rK5giw2T7i1XEMXOOoW2ROUZwaZRDNDE0jpwjMu39ToDgwX3QPMXJLnY9GdpyRgLcXv3+X79nfxYBsuG3mana7kAIk+Z91j1li+TdN/yDi8KUCknj/7OqCKr97Z8jD7xWulj0s6K04XISY1IF46VI5Jc024AFgErMnCqFZltBQLdpau7NvNhbZMJXt/IAt5sarsHtx5uGXNpMamNAMioKAy9+Ml10eTo21Hwyf0yrtOnRPg6BmsIxG/NgI8OUp3ho6Fngg5f5xFNHJ5Dobttyg8HIOobRrL16xd0X+28FeX/NmvsfibmsNwJgtWpfJohfvR5b7hHxNrs5tBxHAXbBLlScsk4A7S0lj/SXfjeWL2R0HSyzSq+UhfUGTbcYSKDHE7UaC7MYVfopDRUdDoGXzPSQM+cQ/Q/fwfi4d9GNq7aUqPCr1luq2L8y7+HU75H5ipk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(396003)(39860400002)(136003)(107886003)(66946007)(36756003)(6916009)(2616005)(316002)(4326008)(2906002)(31686004)(44832011)(66476007)(66556008)(8936002)(38100700002)(5660300002)(8676002)(31696002)(86362001)(478600001)(186003)(6486002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUx1WE13cWhQNndhNXRxWGlCcnJsNkpZcW5Ic09KaFNDWHI0R2xSR3pWdjZs?=
 =?utf-8?B?eWdFbGI4azJmTTY0SURoaXN0WkN1N1FQSC9KUEdqNytINXEvUnNqN1RVYmpV?=
 =?utf-8?B?NUUvVXhPT21aMkVXQlJrMDZwNHcwR2R1aGwzSnUvU0c0a1Y0K1BaMGtzWTR5?=
 =?utf-8?B?V3ArM0ptaU42cUw0eHJDQVZhazlTWVJqc0NFZ1lWR3NHcktHU2hqU1ZsaGF3?=
 =?utf-8?B?b0JDMlExckhBUGhXMXliYVJ2UXBOMXNMSDlyRmhmc2hJRHZoNmlWSjU4emlq?=
 =?utf-8?B?cmhaR1RIR0dQeDAzR2N4b2pFa25oTlZmcDdUc2U3THZUbm9iWEdmOHdnUy9v?=
 =?utf-8?B?QVdkSkFkdmttV083eCtKcTk2VFZuUWpMSUNRWHpRbHdwZld5emdHZXFnNktD?=
 =?utf-8?B?ZGJDZlY1M2JueXFOclMrQ1p0YjIzaFZNVHNxclpqaTJPdytmYUhJNHFJRkZI?=
 =?utf-8?B?YVB4ZXBsKzRzYlV2cjRoc0lRQ0FxVnFhbTM2bkRZZ1E5WHBMTTF3UTZDaEI0?=
 =?utf-8?B?NEF6QnJxQUJrMDhTRThJREtpVWxHbFIzNDdpUFQ5VzV5Z2h4SVNLYzYzWGdx?=
 =?utf-8?B?VDlhM2RVdjB2NUVUZGliVlZHaTRENDFCNHIxREt2Q1NNM3FkRGI2Q2EvTVB3?=
 =?utf-8?B?UnI4bkFraUpZb0RmQ2R3UkJvbyszNDRBd2ZZeFlIdWttbitmQjBCVFNNOEhn?=
 =?utf-8?B?MVU0VXkxbmhBMUM1NlV2TjBrZHhMdWU5aENtOXVMS2Z5QnJacWphdzVabHVa?=
 =?utf-8?B?YVpHd1REMnVDa1VtTWNxZERkWk9nYjI5L3VBVUNydkZUYSt3M2JlbDgzendY?=
 =?utf-8?B?Q1NIT3Q3YW5BWW55RTBHeUxKZWc5NWhOSGk1TlQ5eXl3Qm56THFDanlqT2l6?=
 =?utf-8?B?clVnNWk2WStZWXZZdDlvVFBKWVlUaldvcVJQR1IzV2Y2TDZTS1cwcFUxaEE2?=
 =?utf-8?B?MHd1WCtCRm9PWEZaMTBCdUtONm5Ma3ZCU3dDT2x0M0g2dFZwRTkxSS9jSnpV?=
 =?utf-8?B?MG5ET1ZldE9CUndNak1Sb3RVV3hkd1krWlRWVXB5V0lIM1VwS3Y4cjhwMmto?=
 =?utf-8?B?Rzl4RDhiRThZQ21ydXVJMytaSTNJVlZoSGs2TGZIRk5yT0NIb0xrd2hwLzE1?=
 =?utf-8?B?ZnFNLzdLN3dNcnhKZUJseWwyT2UyTW1kZEJNb3BUb2d0RjF1TU1MQmhXdjhN?=
 =?utf-8?B?LzlKVnphYXhDckhjc0dmWTA0NW02TFNOOXhpaVMxYy9KNTlkWkFob0pucXFX?=
 =?utf-8?B?SUM0NUxpODBLdCtCYW5qc3BreUdRcE1GYWluKzcrRll3VmxMU1ZxcThpYmha?=
 =?utf-8?B?eHF3OENaL280clR5MTVEbXN5aitGeU1oUVA2SGlHMTlLZWx3VFprL1dybFJ4?=
 =?utf-8?B?SEtWbzBWQi9JRllYZlptbGJDL1dqMC92dUErZmE3blRnVjNabnZsSG5PR0hI?=
 =?utf-8?B?VEdpSXViazNXMmtaWENISFljVmgwZHlodWhkQ2RSdEVTSDNkaHk1VEJyYnVu?=
 =?utf-8?B?QVFjMGZwRlorNThTVzM1V3ppRTRwY01oN2pIOWtzd09mS3lRMXJzNGN1Y2tl?=
 =?utf-8?B?UEVCeWR2Rk01eCt5dXByWTE2bytTc3dibUk5VTIvQUNlTFRSa1B2aU5KL2lW?=
 =?utf-8?B?dHg3cTd6STB0VWhHTjhkRDRtWWlxM0RVWUtuOHN0U3FlVGRndmVNZCtWR3Qr?=
 =?utf-8?B?K1BsSDJxdUJ5Y0RNaVRpS20vTExTRjRrSWdBdDFqRzFFWWl3b0R2RTVOQi84?=
 =?utf-8?B?bGhFTkVmZmVJbzZXdEsyUm1pZFpMM3lTOTFsV0kxNXExaEp1bjNjay8wbnJj?=
 =?utf-8?B?bVVhdTNacGVraXdsZm5vZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f08a556-0939-46c3-7c4a-08d94d5e4772
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 22:15:57.2634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiedopMQaU81wyTSyW8oq4oxSDcxsvLTMNlf9CfPVCSehmu6LT4J+TNFAiaLx9f2iB8LNznJywAcbD7qsMULuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3255
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10053
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220143
X-Proofpoint-ORIG-GUID: pMIhDHJP16CExV0LBo48agof66dS6hqM
X-Proofpoint-GUID: pMIhDHJP16CExV0LBo48agof66dS6hqM
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, joe.jin@oracle.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

May I get feedback for this bugfix?

So far the "info lapic <id>" returns stale data and could not accurate reflect
the status in KVM.

Thank you very much!

Dongli Zhang

On 7/1/21 2:40 PM, Dongli Zhang wrote:
> While the default "info lapic" always synchronizes cpu state ...
> 
> mon_get_cpu()
> -> mon_get_cpu_sync(mon, true)
>    -> cpu_synchronize_state(cpu)
>       -> ioctl KVM_GET_LAPIC (taking KVM as example)
> 
> ... the cpu state is not synchronized when the apic-id is available as
> argument.
> 
> The cpu state should be synchronized when apic-id is available. Otherwise
> the "info lapic <apic-id>" always returns stale data.
> 
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> Changed since v1:
>   - I sent out wrong patch version in v1
> 
>  target/i386/monitor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 119211f0b0..d833ab5b8e 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -28,6 +28,7 @@
>  #include "monitor/hmp-target.h"
>  #include "monitor/hmp.h"
>  #include "qapi/qmp/qdict.h"
> +#include "sysemu/hw_accel.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/sev.h"
>  #include "qapi/error.h"
> @@ -656,7 +657,11 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
>  
>      if (qdict_haskey(qdict, "apic-id")) {
>          int id = qdict_get_try_int(qdict, "apic-id", 0);
> +
>          cs = cpu_by_arch_id(id);
> +        if (cs) {
> +            cpu_synchronize_state(cs);
> +        }
>      } else {
>          cs = mon_get_cpu(mon);
>      }
> 

