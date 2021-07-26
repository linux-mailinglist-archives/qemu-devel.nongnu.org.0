Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0EB3D67C7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:58:39 +0200 (CEST)
Received: from localhost ([::1]:48052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86kI-0004Mo-4B
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86eR-0007lu-8V
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:52:35 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:53104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86eM-0004af-0X
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:52:33 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16QJjhST011417; Mon, 26 Jul 2021 19:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+kGzu3fd44ALT/ArP8jFZ0BiwUHFXVRX/3lZhgw8AtI=;
 b=iHM2DATrRr3MzQFvMCkx6z3Ex0f9A3AlE7bMq76f+mDtstFeDem48OGVTfplvLtDotj+
 wKdoKLK+GIid4kw8DMG/9BOGEvGf9TpAd8BLrjBzYfTmBBgOHZet273SG+6wFcOeTOmL
 9g5K3CIi1m/II7CEOEIc2cQiAm2pBXiK/p3x2kN26iHC5UYbS/oxNN5wrYkgHEyQP6EO
 kQYUiVvV5I3EGt1+BcJpDsLHv6oFnyZC38raWIGVf/pUmGGOY4lIPmVvRYJqTpf+ig52
 OzKxMoVb6HhRPTvAk0GjJbuSw6BbOYOdjiTRXFhCsXOF5W3nRcBvf2Zx1Bofv1XWrf43 BQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=+kGzu3fd44ALT/ArP8jFZ0BiwUHFXVRX/3lZhgw8AtI=;
 b=UKMaub/DSLhAXDZ53krR40AbFjeeFvHTRDDDNQfw+2EDsRrAAc4am8wtbocBlDycFKar
 TiMIOnyhN5KfjeqLVcSIYH32ddzmrlSk5UkE7r/K4xEFs3XV4XdEJJlyZPuxkJasSJJf
 4Z9S5gmJES534NJjchQBcffYedzLNujcDfm8IIB5YVGeKqzgJBgecYQWrfCeIcECUsNq
 e70eB4rCeZdYh3SYmBgYOpnTY85VV5ALJi1v5eK9RRD+APtmXvwfOO43iBUmhZzUbI+5
 tBkVSd1Vp0p18N3n50Qs2MEIOp6ldQMo1YInFvAACEInJaIVl3WhC1ZgNfF0ScSlX+10 zg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a2356g1w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 19:52:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16QJopEK067517;
 Mon, 26 Jul 2021 19:52:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by userp3030.oracle.com with ESMTP id 3a2351h9xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 19:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8fJAJB+oPEMt0CaFO+qtNWpIUYEYtaoICbr5fFybom0uDNDijOqmRh0tDzB1SV0kbK+QSQ5ivDxLAmek1nDHsPFKcL0SigqoYIQVPYVHQ+0qWzNA7BjsjLayaE0+b//vv/kjCDWmJKfQ8H79ykhoxnHimW5f/666Wnv6rHHhTgEWYyB9MMxPo+3S67qiDrqogLok0ktdLPIpSiWKu1mtzgo9oXg8qOApfLWcLy8xq4rCWjgJPoyw3tdM78Xdie33OYaJvmOqx8rlUNpuzVatDO5SfxKD38NCrj73SEf8m+bDFgNH7eU/PE8RtQSbE4TWsSD/OBJdO9ubYCFu8lqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kGzu3fd44ALT/ArP8jFZ0BiwUHFXVRX/3lZhgw8AtI=;
 b=VaBXVG9gyyqRBmvcDYs30Yvr4ESY6+YOskJb5GGuYlY3MPEFsEXC3TWFLDsjo1+Sp2TRveHwTvF8F+ZWMiLdg2fcYTAM/oj8hX/kwjHtJthCzEUdk5IUcENczmtA0ZFcrOUXuJqnubbLuzYS6/1HwbZ+0ZJVE4Cdx9N99feyLFDXTj+W/+bpT2yPkQqf6QohOxuyAcWTRNANDwT9b+Xg08GkVEh9PdHeTpoJXfM6qazPsOqwis4YpuWDpBiJwGJyYy+qykSISVPdNqRGMni58e/9/J5Uk5E3RSXrcAWEjQZXw5ILMDvfWlsnU+VzkH5CppTVEuEU6IhqGL+gZOe6ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kGzu3fd44ALT/ArP8jFZ0BiwUHFXVRX/3lZhgw8AtI=;
 b=TfTKuQZJvUUH1K6NEt0exGwVQ/qm96yGneRtqtMjkRMH1CHRt+bWkFoAWVt48n1V4xjFcaedvHKDd7VUJKE08YZjGS8jFnbNeC+uJcU11JeyoXV5Bgd0GIq/on6cS97bZjqN3t8aCPw5vSGzvKv8WpZ+y9yHUr409ppf1SwzNcA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2383.namprd10.prod.outlook.com (2603:10b6:301:31::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 19:52:19 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5%4]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 19:52:19 +0000
Subject: Re: [PATCH v5 02/10] ACPI ERST: specification for ERST support
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-3-git-send-email-eric.devolder@oracle.com>
 <CO1PR10MB453117598D1ED99EB0A7AA3B97019@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210719170244.7402e008@redhat.com>
 <c0b0a60a-bd4e-ef2c-d398-bef96d8731dc@oracle.com>
 <20210726120650.4bb9272f@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <8631ab5a-943c-900d-ab45-973191cb1064@oracle.com>
Date: Mon, 26 Jul 2021 14:52:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726120650.4bb9272f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0801CA0008.namprd08.prod.outlook.com
 (2603:10b6:803:29::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN4PR0801CA0008.namprd08.prod.outlook.com
 (2603:10b6:803:29::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Mon, 26 Jul 2021 19:52:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18bb69e0-ce8d-4c40-a328-08d9506ee05d
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2383:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2383EF879BD6747F55F7B1F297E89@MWHPR1001MB2383.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CyvRceFA/uW4HTnZRX288F+jz4Tk2IzH+jQ0C02ys/2wB+K/MeLNXs8tlOPtfBP4sMYBsgcskf5L2dK21BuvBPtgdqOpn+Y8bPornlsxZREGvpSwXqZrrq/teIVFlKkTk5wu2O7vJa5rX05RlPRkcGs1ubp/5arPXX5sD4jTzN6cYl7eE+fdVN7aSYhVRX7l+ys27sZn8/exkSk0UMX9YwiOWHW3cJXsJ8wudbwvtNsWafsoSqN3FJ/eDsqBr/Ly727Bltk6SEiQuKdsGKqDyYYlyJ3xdqkRBaiqC+zUSnx7/MeinkTS3yXc0R5S7FznzebPv7BccQ/jVppBK9/4ygbgcWmWgscJyMneBKKXD58YXvB5Yd4L7S8VsvOpNJeVT+1uKdyVmjeDkl0RM190CrXC/j4eXljbWLlzTjaOqpvkYfgBTuvfNA6gQhft9QqznoNsanq6J70k/fasgZzjiYX3ls/ZmUyXQ9DW7Y2FdwjAQAHW+FUhTk41d8IYCseFnti+xpqN+reMb93KYgIJ3j2aUi3evGB9PcAz1wosXpkoenkRYOeFXlwrFBi5OENlDHUIxwSpwaDi7ASO45KIGcOFqzkK2hHO6U3l5r9lNHlnGFr8rMqucrGzILki6XEOTVyhg9lNV3Cm8Lame7Mhhdh4HRrWlIEGCuhWUxisDJ1HCId/H5VCgvn6YPJRJTxz7ZUFGdP5ttXLQHNPq4y1ukRCfXZ0S024FeNC68YnUVlE7z58Hd4eIf508eiWvRcra6gwRTB5BrYRiWTMfxYTWhKBCxIJ+3lwJnSEJNnKcX8nJQS6ya6RaAHjiFuo25nN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(366004)(136003)(39860400002)(966005)(478600001)(36756003)(66946007)(83380400001)(2906002)(30864003)(86362001)(8676002)(6486002)(53546011)(31696002)(8936002)(66556008)(66476007)(38100700002)(316002)(2616005)(31686004)(4326008)(186003)(6916009)(5660300002)(54906003)(45080400002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skw2MFhJMVZ6ODMvVXB6ZEFCMFhZdWRBLzZtSFQrS3ZHSkYxeXJmNVdLRjhl?=
 =?utf-8?B?L2JUUTdvcUdHT3RjWkZwclBhTzJQRDM0MTN4c2VRQ3JIMTVlakh4SnZIMGkv?=
 =?utf-8?B?VjdJdGFra0hHekdNa044SVRwdGF3YjQvT3dxUC9QMHRXL2RvOG1YK2d5WEJG?=
 =?utf-8?B?YTBROGlQSW12eTVZKzhCZjQ5MVBXd3hVY3B0QXJqV3FqeHFtZmlkczJBUnJp?=
 =?utf-8?B?N2dHbXlEakVaV3B5Z2M3SlhMOXgvL0ZPakZRSnh0d1RzQ3FyMjRwaExYSDdU?=
 =?utf-8?B?Q0RzbHBXc1dUS1VrcmtEcDFrVENVbkhIRk5Vdm95MGJMMUFRNjI2YTZmMERh?=
 =?utf-8?B?QzBzRWVnRUxVNFNnR2x1SmorNlQvb25KYmJYNE52RWVHcGNNYVhPZDVubUxv?=
 =?utf-8?B?RXNYOGwrWE9SWVc0a2h2REFOcU1xNW1lN3NVdU8wb3ZSd2dUc3NtQ0VtSFpL?=
 =?utf-8?B?Ri9CK0JlOWtOMWFRTFZZWTVJTlZpMHdXdjJlK1ZXVUYydGJTeUZvRmpscTFm?=
 =?utf-8?B?MVNib1hQb2RMczZTbXAzTmxST0FkY1IwUTFGV281Nmw5bUwxRS93clB2Uy9R?=
 =?utf-8?B?U3hlUGM3SmMvanFjTjBmNjNuR01sUVBhYmQxaGFNdWF2WUxSeFNGdVBFQStI?=
 =?utf-8?B?Q2NCdERIM3FrR0RNQ05IWERXbktjVEsvSEd4T1VhWVhRZXRJNE5wWTNMWEZp?=
 =?utf-8?B?Q0NXOEl6ZWwxT2hEWnhkQmNLbjBIbXF6QjNtdjJaOVRhVTJBYUpNLzFRREts?=
 =?utf-8?B?Ri9jMzRRQW1XY2tkOVVjZktBMk44S2NQUjdnTGd5QVFWbE1nL2lQYXlBbFNU?=
 =?utf-8?B?OFk2bThGaWVEZndpUXk2U0VneEVZbXhVRFZIMU5GSDk4NkU0Q21iZ3hTUC9X?=
 =?utf-8?B?N3plVjhHY2diMjJMT2xWVytwYlIzS0ZxZWtGcDNCck5ES0ZwL25oUmUzVWZv?=
 =?utf-8?B?eHZybkNPMFMrdmEyL3pVaGRYOHZpYjRUKy9xZzBEUzl1SzZLb1dXOGhhU1Vu?=
 =?utf-8?B?dFR5bFh3SmZ4dDlwS2YxRW5Jc3I4OTR4NGtvcGswODVmNnRqQWFRUlc0L1Rv?=
 =?utf-8?B?K25teUJRamhoTEdoUGw5TTF1TC94WEhpV2RrNng0bnZkZXhrd2dydStjYmU4?=
 =?utf-8?B?Und5bU10UmxXWUJUK1JiVE5DWlpWelpvcEpnYTN2Ryt0Sm1qOUd2K1VNZXBr?=
 =?utf-8?B?MC96MlJzcUFqT2ZNTldjc29GRjNtQW5UaDVOTzdpaThKUlZYeGF6R0NkK2pq?=
 =?utf-8?B?SDRjMVR0d3F6a3FwVDlDK2paOWx3cTRBOUFhZXowM2dSMDZWZFhXY25lcktN?=
 =?utf-8?B?WVFsekFBdHF4Z040M0pGTFowdTVLdEZDaXRqd1I5NWM2T29FSUt5Vyt4Tysr?=
 =?utf-8?B?N21JWHJSK0ZOWTd4eU55NlpzZ01OOHpEOTlNRnlNbnV3blE3dy9LbXFXUFBw?=
 =?utf-8?B?aDRWSzJQSlZiOHFnZVdXQklxTHd2djFmcjgyM1lNK21IMVBqenNWUWt3cmlB?=
 =?utf-8?B?dnNvWmVvQ3p0c0NKb2oreVlGQU5MTUU4MGlTSUpod054dnExZEh1c0dZcHNx?=
 =?utf-8?B?QlVwUXhZQmhENHhhbFV1ZmNuMVlhWHI2RnpnTkt2czdkTnFqTTcxUW1zVHlV?=
 =?utf-8?B?MGVPTE9EUis1VUsxYktLWGxJemNURlVGdkhtRTA5QS95WStmMkxzVmRQNkcy?=
 =?utf-8?B?RXB5cDY5eWorV1FxaU5yL0M3WktyelZjMzlNM0I2eUc2S3E1TWw1WUwxV1hz?=
 =?utf-8?B?L1V6c3JsVVFsdlpkY2JzQndraGphTmZRaFRtRWhXRndSR2J2bGM0ejVNM0VY?=
 =?utf-8?B?VWZUWWNINjAzaXVOL3llZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bb69e0-ce8d-4c40-a328-08d9506ee05d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 19:52:19.6696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18nT/ujFzk5qHTqLLXnhxWC0AbYtVZ8JOz2FqoTpmc3eezTaDKpCmTIImEBVr9Q8ciXJ53qdSbJdAORgPzyhSGzisjgaeG6OtnyBDXbxU0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2383
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107260116
X-Proofpoint-ORIG-GUID: 6IfP75skitM0821pLX253LcEOMaeg2M4
X-Proofpoint-GUID: 6IfP75skitM0821pLX253LcEOMaeg2M4
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Eric Blake <eblake@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/26/21 5:06 AM, Igor Mammedov wrote:
> On Wed, 21 Jul 2021 10:42:33 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> On 7/19/21 10:02 AM, Igor Mammedov wrote:
>>> On Wed, 30 Jun 2021 19:26:39 +0000
>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>    
>>>> Oops, at the end of the 4th paragraph, I meant to state that "Linux does not support the NVRAM mode."
>>>> rather than "non-NVRAM mode", which contradicts everything I stated prior.
>>>> Eric.
>>>> ________________________________
>>>> From: Eric DeVolder <eric.devolder@oracle.com>
>>>> Sent: Wednesday, June 30, 2021 2:07 PM
>>>> To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
>>>> Cc: mst@redhat.com <mst@redhat.com>; imammedo@redhat.com <imammedo@redhat.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>>> Subject: [PATCH v5 02/10] ACPI ERST: specification for ERST support
>>>>
>>>> Information on the implementation of the ACPI ERST support.
>>>>
>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>> ---
>>>>    docs/specs/acpi_erst.txt | 152 +++++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 152 insertions(+)
>>>>    create mode 100644 docs/specs/acpi_erst.txt
>>>>
>>>> diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
>>>> new file mode 100644
>>>> index 0000000..79f8eb9
>>>> --- /dev/null
>>>> +++ b/docs/specs/acpi_erst.txt
>>>> @@ -0,0 +1,152 @@
>>>> +ACPI ERST DEVICE
>>>> +================
>>>> +
>>>> +The ACPI ERST device is utilized to support the ACPI Error Record
>>>> +Serialization Table, ERST, functionality. The functionality is
>>>> +designed for storing error records in persistent storage for
>>>> +future reference/debugging.
>>>> +
>>>> +The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
>>>> +(APEI)", and specifically subsection "Error Serialization", outlines
>>>> +a method for storing error records into persistent storage.
>>>> +
>>>> +The format of error records is described in the UEFI specification[2],
>>>> +in Appendix N "Common Platform Error Record".
>>>> +
>>>> +While the ACPI specification allows for an NVRAM "mode" (see
>>>> +GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
>>>> +directly exposed for direct access by the OS/guest, this implements
>>>> +the non-NVRAM "mode". This non-NVRAM "mode" is what is implemented
>>>> +by most BIOS (since flash memory requires programming operations
>>>> +in order to update its contents). Furthermore, as of the time of this
>>>> +writing, Linux does not support the non-NVRAM "mode".
>>>
>>> shouldn't it be s/non-NVRAM/NVRAM/ ?
>>
>> Yes, it has been corrected.
>>
>>>    
>>>> +
>>>> +
>>>> +Background/Motivation
>>>> +---------------------
>>>> +Linux uses the persistent storage filesystem, pstore, to record
>>>> +information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
>>>> +independent of, and runs before, kdump.  In certain scenarios (ie.
>>>> +hosts/guests with root filesystems on NFS/iSCSI where networking
>>>> +software and/or hardware fails), pstore may contain the only
>>>> +information available for post-mortem debugging.
>>>
>>> well,
>>> it's not the only way, one can use existing pvpanic device to notify
>>> mgmt layer about crash and mgmt layer can take appropriate measures
>>> to for post-mortem debugging, including dumping guest state,
>>> which is superior to anything pstore can offer as VM is still exists
>>> and mgmt layer can inspect VMs crashed state directly or dump
>>> necessary parts of it.
>>>
>>> So ERST shouldn't be portrayed as the only way here but rather
>>> as limited alternative to pvpanic in regards to post-mortem debugging
>>> (it's the only way only on bare-metal).
>>>
>>> It would be better to describe here other use-cases you've mentioned
>>> in earlier reviews, that justify adding alternative to pvpanic.
>>
>> I'm not sure how I would change this. I do say "may contain", which means it
>> is not the only way. Pvpanic is a way to notify the mgmt layer/host, but
>> this is a method solely with the guest. Each serves a different purpose;
>> plugs a different hole.
>>
> 
> I'd suggest edit  "pstore may contain the only information" as "pstore may contain information"
> 
Done

>> As noted in a separate message, my company has intentions of storing other
>> data in ERST beyond panics.
> perhaps add your use cases here as well.
>   
> 
>>>> +Two common storage backends for the pstore filesystem are ACPI ERST
>>>> +and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in
>>>> +all guests. With QEMU supporting ACPI ERST, it becomes a viable
>>>> +pstore storage backend for virtual machines (as it is now for
>>>> +bare metal machines).
>>>> +
>>>    
>>>> +Enabling support for ACPI ERST facilitates a consistent method to
>>>> +capture kernel panic information in a wide range of guests: from
>>>> +resource-constrained microvms to very large guests, and in
>>>> +particular, in direct-boot environments (which would lack UEFI
>>>> +run-time services).
>>> this hunk probably not necessary
>>>    
>>>> +
>>>> +Note that Microsoft Windows also utilizes the ACPI ERST for certain
>>>> +crash information, if available.
>>> a pointer to a relevant source would be helpful here.
>>
>> I've included the reference, here for your benefit.
>> Windows Hardware Error Architecutre, specifically Persistence Mechanism
>> https://docs.microsoft.com/en-us/windows-hardware/drivers/whea/error-record-persistence-mechanism
>>
>>>    
>>>> +Invocation
>>> s/^^/Configuration|Usage/
>>
>> Corrected
>>
>>>    
>>>> +----------
>>>> +
>>>> +To utilize ACPI ERST, a memory-backend-file object and acpi-erst
>>> s/utilize/use/
>>
>> Corrected
>>
>>>    
>>>> +device must be created, for example:
>>> s/must/can/
>>
>> Corrected
>>
>>>    
>>>> +
>>>> + qemu ...
>>>> + -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,
>>>> +  size=0x10000,share=on
>>> I'd put ^^^ on the same line as -object and use '\' at the end the
>>> so example could be easily copy-pasted
>>
>> Corrected
>>
>>>    
>>>> + -device acpi-erst,memdev=erstnvram
>>>> +
>>>> +For proper operation, the ACPI ERST device needs a memory-backend-file
>>>> +object with the following parameters:
>>>> +
>>>> + - id: The id of the memory-backend-file object is used to associate
>>>> +   this memory with the acpi-erst device.
>>>> + - size: The size of the ACPI ERST backing storage. This parameter is
>>>> +   required.
>>>> + - mem-path: The location of the ACPI ERST backing storage file. This
>>>> +   parameter is also required.
>>>> + - share: The share=on parameter is required so that updates to the
>>>> +   ERST back store are written to the file immediately as well. Without
>>>> +   it, updates the the backing file are unpredictable and may not
>>>> +   properly persist (eg. if qemu should crash).
>>>
>>> mmap manpage says:
>>>     MAP_SHARED
>>>                Updates to the mapping ... are carried through to the underlying file.
>>> it doesn't guarantee 'written to the file immediately', though.
>>> So I'd rephrase it to something like that:
>>>
>>> - share: The share=on parameter is required so that updates to the ERST back store
>>>            are written back to the file.
>>
>> Corrected
>>
>>>    
>>>> +
>>>> +The ACPI ERST device is a simple PCI device, and requires this one
>>>> +parameter:
>>> s/^.*:/and ERST device:/
>>
>> Corrected
>>
>>>    
>>>> +
>>>> + - memdev: Is the object id of the memory-backend-file.
>>>> +
>>>> +
>>>> +PCI Interface
>>>> +-------------
>>>> +
>>>> +The ERST device is a PCI device with two BARs, one for accessing
>>>> +the programming registers, and the other for accessing the
>>>> +record exchange buffer.
>>>> +
>>>> +BAR0 contains the programming interface consisting of just two
>>>> +64-bit registers. The two registers are an ACTION (cmd) and a
>>>> +VALUE (data). All ERST actions/operations/side effects happen
>>> s/consisting of... All ERST/consisting of ACTION and VALUE 64-bit registers. All ERST/
>>
>> Corrected
>>
>>>    
>>>> +on the write to the ACTION, by design. Thus any data needed
>>> s/Thus//
>> Corrected
>>
>>>    
>>>> +by the action must be placed into VALUE prior to writing
>>>> +ACTION. Reading the VALUE simply returns the register contents,
>>>> +which can be updated by a previous ACTION.
>>>    
>>>> This behavior is
>>>> +encoded in the ACPI ERST table generated by QEMU.
>>> it's too vague, Either drop sentence or add a reference to relevant place in spec.
>> Corrected
>>
>>>
>>>    
>>>> +
>>>> +BAR1 contains the record exchange buffer, and the size of this
>>>> +buffer sets the maximum record size. This record exchange
>>>> +buffer size is 8KiB.
>>> s/^^^/
>>> BAR1 contains the 8KiB record exchange buffer, which is the implemented maximum record size limit.
>> Corrected
>>
>>>
>>>    
>>>> +Backing File
>>>
>>> s/^^^/Backing Storage Format/
>> Corrected
>>
>>>    
>>>> +------------
>>>
>>>    
>>>> +
>>>> +The ACPI ERST persistent storage is contained within a single backing
>>>> +file. The size and location of the backing file is specified upon
>>>> +QEMU startup of the ACPI ERST device.
>>>
>>> I'd drop above paragraph and describe file format here,
>>> ultimately used backend doesn't have to be a file. For
>>> example if user doesn't need it persist over QEMU restarts,
>>> ram backend could be used, guest will still be able to see
>>> it's own crash log after guest is reboot, or it could be
>>> memfd backend passed to QEMU by mgmt layer.
>> Dropped
>>
>>>
>>>    
>>>> +Records are stored in the backing file in a simple fashion.
>>> s/backing file/backend storage/
>>> ditto for other occurrences
>> Corrected
>>
>>>    
>>>> +The backing file is essentially divided into fixed size
>>>> +"slots", ERST_RECORD_SIZE in length, with each "slot"
>>>> +storing a single record.
>>>    
>>>> No attempt at optimizing storage
>>>> +through compression, compaction, etc is attempted.
>>> s/^^^//
>>
>> I'd like to keep this statement. It is there because in a number of
>> hardware BIOS I tested, these kinds of features lead to bugs in the
>> ERST support.
> this doc it's not about issues in other BIOSes, it's about conrete
> QEMU impl. So sentence starting with "No attempt" is not relevant here at all.
Dropped

>    
>>>> +NOTE that any change to this value will make any pre-
>>>> +existing backing files, not of the same ERST_RECORD_SIZE,
>>>> +unusable to the guest.
>>> when that can happen, can we detect it and error out?
>> I've dropped this statement. That value is hard coded, and not a
>> parameter, so there is no simple way to change it. This comment
>> does exist next to the ERST_RECORD_SIZE declaration in the code.
> 
> It's not a problem with current impl. but rather with possible
> future expansion.
> 
> If you'd add a header with record size at the start of storage,
> it wouldn't be issue as ERST would be able to get used record
> size for storage. That will help with avoiding compat issues
> later on.
I'll go ahead and add the header. I'll put the magic and record size in there,
but I do not intend to put any data that would be "cached" from the records
themselves. So no recordids, in particular, will be cached in this header.

I'm not even sure I want to record/cache the number of records because:
  - it has almost no use (undermined by the fact overall storage size is not exposed, imho)
  - we backed off requiring the share=on, so it is conceivable this header value could
    encounter data integrity issues, should a guest crash...
  - scans still happen (see next)

While having it (number of records cached in header) would avoid a startup scan
to compute it, the write operation requires a scan to determine if the incoming
recordid is present or not, in order to determine overwrite or allocate-and-write.

And typically the first operation that Linux does is effectively a scan to
populate the /sys/fs/pstore entries via the GET_RECORD_IDENTIFIER action.

And the typical size of the ERST storage [on hardware systems] is 64 to 128KiB;
so not much storage to examine, especially since only looking at 12 bytes of each
8KiB record.

I'd still be in favor of putting an upper bound on the hostmem object, to avoid
your worst case fears...


> 
>>>> +Below is an example layout of the backing store file.
>>>> +The size of the file is a multiple of ERST_RECORD_SIZE,
>>>> +and contains N number of "slots" to store records. The
>>>> +example below shows two records (in CPER format) in the
>>>> +backing file, while the remaining slots are empty/
>>>> +available.
>>>> +
>>>> + Slot   Record
>>>> +        +--------------------------------------------+
>>>> +    0   | empty/available                            |
>>>> +        +--------------------------------------------+
>>>> +    1   | CPER                                       |
>>>> +        +--------------------------------------------+
>>>> +    2   | CPER                                       |
>>>> +        +--------------------------------------------+
>>>> +  ...   |                                            |
>>>> +        +--------------------------------------------+
>>>> +    N   | empty/available                            |
>>>> +        +--------------------------------------------+
>>>> +        <-------------- ERST_RECORD_SIZE ------------>
>>>
>>>    
>>>> +Not all slots need to be occupied, and they need not be
>>>> +occupied in a contiguous fashion. The ability to clear/erase
>>>> +specific records allows for the formation of unoccupied
>>>> +slots.
>>> I'd drop this as not necessary
>>
>> I'd like to keep this statement. Again, several BIOS on which I tested
>> ERST had bugs around non-contiguous record storage.
> 
> I'd drop this and alter sentence above ending with " in a simple fashion."
> to describe sparse usage of storage and then after that comes example diagram.
Done

> 
> I'd like this part to start with unambiguous concise description of
> format and to be finished with example diagram.
> It is the part that will be considered as the the only true source
> how file should be formatted, when it comes to fixing bugs or
> modifying original impl. later on. So it's important to have clear
> description without any unnecessary information here.
Done

> 
> 
>>>
>>>    
>>>> +
>>>> +
>>>> +References
>>>> +----------
>>>> +
>>>> +[1] "Advanced Configuration and Power Interface Specification",
>>>> +    version 4.0, June 2009.
>>>> +
>>>> +[2] "Unified Extensible Firmware Interface Specification",
>>>> +    version 2.1, October 2008.
>>>> +
>>>> --
>>>> 1.8.3.1
>>>>   
>>>    
>>
> 

