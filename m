Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A751C4C3E22
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 06:58:59 +0100 (CET)
Received: from localhost ([::1]:38800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNTd2-0000xo-ES
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 00:58:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNTap-0000Bp-Rl
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 00:56:39 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:15836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNTak-0008AT-TF
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 00:56:38 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21P0j2AP022992;
 Thu, 24 Feb 2022 21:56:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=GtDQCfGIShb27fOm9HtvL09/FrrKYPpZISvF96e22dM=;
 b=yBsALhEt+UxzZkB76q2YrOvtfbouw9J1lIv+yBFG8g/bDOlZScYkIHWNLtQzsbJ4SXj2
 epwuVnD5GeLVErgre5Ws5dUUQf5fzLDJ2whQcxAoGSXZM93EyIWPGpohk/IK3oOKSXU+
 MhnX48aMlJ3roGS7pviZ9jGgdgcVyqPg1Bwlhu6NYyDEEpxcjOLvl32RN66ae28/7eKU
 KjXDMTPrOFZpvlzZKI7c2T422v8Ay8IlBoq2eV3/X/WQS3/0HxtwVSDeKsG7OpZRlhwY
 rof7npkRwnp4azhT/2L+tpAiOm9TlsM9oWyUbHI5yqp0vfXIGlGpD7j/kLMUZl7rmkNs nQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3edgm5npeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 21:56:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRJXn9CiPiOU8RjE6AnbwjnYKeWgVztsVfXcBSznYYQWQQ7bVaku7l48FZv11XQqdSXBDKTOUWXFpKUJoduo+D1SjTH4bwNIFp9PW3S1t+odKVsNSsAwowlzU9iKsEmPkXwY7uzYpJoCfAZk3GLi38K9wP1iy+1S69Ik6xE77x9+32zkOyunOhNUbyQNm/6riZtN6XTNFwXCtamvHFV0CAU5GTMIkSkL+bvsDwce26p1Y8s/BsuVom9Qmsn0ICSaiihXd59FmGxHF7LoEGPO/cewMZHiBVDoHEAHCbZzMAckiIoYQKTxKRumaOAfiV9se8h5lczCZ/DV0QC933uOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtDQCfGIShb27fOm9HtvL09/FrrKYPpZISvF96e22dM=;
 b=DrTN/cFFeKK4VIu0/g7ZovGEP7ReLQS8QmCk8V9guZanVkbQpq+J0U7vuWIoroAot+QOQka+EwFW884b/eYkzFtvEVoQG2YHe7l9dkpRxDqZ4yF29KnKlBOhZc+Dca4iLKe5S2Rw+VvrPyYuaoc16aABONLuBV3YOsu+83N7X5Et7JmwSoS78zf54vIAg5xzYThpk5LtgNx1Z+udxflZ/wNOamsSnZ7WbknIEwDKFGf7ui72bJkfIaqRlUGz7OcXOmv80FBTYNg5BcIRqMFQwo9w8ySv+QfbMdbZp90rdBz2q3iTfvow4qZ9dER/QZ+i6RnuMtQDg/k0RCB5qMPfxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB2435.namprd02.prod.outlook.com (2603:10b6:404:52::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Fri, 25 Feb
 2022 05:56:30 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 05:56:30 +0000
Content-Type: multipart/alternative;
 boundary="------------3eCPCznPcGewm1RFmgZLodmV"
Message-ID: <8dad1e54-1118-54c2-baea-7a8c6daee286@nutanix.com>
Date: Fri, 25 Feb 2022 11:26:20 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] Added parameter to take screenshot with screendump as
 PNG
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220224115908.102285-1-kshitij.suri@nutanix.com>
 <YhevxnLUi5BHWJ9G@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <YhevxnLUi5BHWJ9G@redhat.com>
X-ClientProxiedBy: MA1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::14) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3b63094-4a80-4726-96cc-08d9f8239169
X-MS-TrafficTypeDiagnostic: BN6PR02MB2435:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB243544E96B9C3811AC753DC5993E9@BN6PR02MB2435.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vQdC9o42qRdStMMDKOoj0HC7yMz1sreu2aMxxIohNMWhX8faxUa/cX5OKs7v+Q9Hanh2+nOgyQCuQzTiqIk4FAck3lRTxRce6/HXlX2dzbJ4WH8teJ/s8uItopyX/nrguP4sMOrXNi8tzaLu24n9im0yLKKWKZ2AH5LGNqxdjha6Q+x5o063/TBLtDkjUqZuMh63BrFemOtdXD+TACVzixzrmUN5spZkxTNkmgWyqDVrAeFO2a5pnH0VmU5TM794NFKjOYNSNYkJiJVVX2qQ4E7f6BVS4oXeyyfO6N8XrHqX/JXj1GQkE08wPDlwZNDr9zLXxDCnwPyutSUJfbIO2lBB3syhdsF5D5Elz3iQTCSfl6CAvEE2/baUKVyxogVPZRwWEi0P0UsqKOdcCxIkQcaSKdCk/taoZOY/dre773X/nFYaNmlEPWsjnbz8/8Bk0Nbnbq72IkrSdd8Fsm/Ov2B9TsYe+9zDR2Dn0gRPKxS/N/2V5f6EiE7yrF9XyPoskb1pweyAGW53iQ9FgS1uL0YlYafKx1L/U3PwY6Qt4U+r43lfZUfCNjI4svc8421UKO86z0enit2YGRmWIEk2VF6HqhDBg0TezEJwoSWFK/2heC1sdH12+Pb1D1gobCa1S6RYaMeDBAqj7uWtGzie4zdCLauHIPgQ6eDzd2Y6mtXim6zVZBX3hd3jQ60YACANq5odStRisGrUK+LfVUrYGxGJ9OS0ZX5CcgvxL5/zEZjh6TxPZRuFvOfL0r5xMv1CnsNDeTb0QC5EjiTi6PgiMCPENpg+h8BpAy7f9q9hOYY9B1mOe4iVR9Vjy19s4nGb/hdwIheq8z4ETvDqhIrTJO/KM4+CNZazsPwQvKA+nGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(5660300002)(8936002)(83380400001)(66556008)(66476007)(66574015)(4326008)(36756003)(508600001)(966005)(31686004)(6486002)(8676002)(26005)(186003)(6512007)(66946007)(31696002)(53546011)(52116002)(44832011)(6916009)(33964004)(6506007)(30864003)(38350700002)(316002)(38100700002)(166002)(6666004)(2906002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG9aeUN4YUpnUkNDcnowU3IyeXhGb3cwWUJEbEozNEZ5SFlFUDN1NXBWVlpF?=
 =?utf-8?B?VzJXaWFSWDl6aVgzbUc2cXE3ZFB3MWhjN3l4TXRJRHVQN0RjNXF6MWVqZnVD?=
 =?utf-8?B?UHYya2RJTUJIUmFhMlkvUWYzV1JKV2xQNW1QSlBBYnZBUjIwUVRiZEhpeGh4?=
 =?utf-8?B?MUk0SUtLbE1CKzlCV1dQMGJjSHZTc2NJUlhuWEhpV0wyZFhHYUMvK2VDOGN5?=
 =?utf-8?B?a1dPUVRHZkJRZ2JmaWtkeFpsUU1jWU1UbEpnVnAvcjZUYVM4MSttbUVIQk1Q?=
 =?utf-8?B?SUU0KzJiUGhXbWYzUFhua3oxRUxnLzBWaGRlK1RjVnc4aGxiUU9sTkF5YlBW?=
 =?utf-8?B?SUF5K1FraFBwbzJ0b0I3UlFJOCtEM1k5YmpyUUMwU1ZaQzc4T0xzOGhHK1gz?=
 =?utf-8?B?ZU04V0FuaFF1TG1RT1dpWi9ucHNwZHQ4bnI4eHFvczBXU3pjYWVQL01kbGxi?=
 =?utf-8?B?VG9xdDdFakF5T2xFcW9aeFUxZnJZNXhsYzZMbzVuRzV5bzJJbnB1SVRyV3ln?=
 =?utf-8?B?UXlyWDRva3ovMXhWS2FGR0x3aU0zVEtldmIzeGlEUjFzR1BYVlJTd1BMN2Rt?=
 =?utf-8?B?djFvMUhUck5VWlB4aUFIbDNnajZBUmtMdVJiM3hZTmNkTlBqemZrRmVRQys2?=
 =?utf-8?B?UzZ3d3FIWEV2U2drV2REZExYRTdMWU9hb0FaZXFKYnhmLzJDOG1VcG5Ya0ZK?=
 =?utf-8?B?L2VxcEVhdkJlUVl0ZGNIQXdrZ204dTI4c2xYZUlWeG5lYmpKaXBMSVdJSjFF?=
 =?utf-8?B?S05kTXhYdjJyRFVrNGV5QkZLRE9CMmNLL2QreTNteDgxU25VRzZRWHBiaG1M?=
 =?utf-8?B?ZlJCeTY5S1FlcXlCbUs0Rk1HcDhGRWF6UDlRaUlZcm12bVI4Wk9ra0xSQUhi?=
 =?utf-8?B?Zng1cHB0MXEwVTRhWS8xa1hHcDdVdEJ2Mi9tcGd3dytkbHZHTytVWDhTd1NL?=
 =?utf-8?B?T2hxR09PbXlpV293ay84YmR3K05xd3dVOFIxeVRWZUNvSllFdXYwVW1UbDBN?=
 =?utf-8?B?d1hxeG1HbkVFVFNiMDV4SU9RWmRiWnlXdStrUTNCOGZLdkgrWkRCOHBCU1lj?=
 =?utf-8?B?am5DaGdHR0tSZEVWenhwZWtXRkYzUmdWMzF6V2Z3Snp1VFpQNnExOVZ0ZVJE?=
 =?utf-8?B?NlRjdW1ITTFkeExkLzlKRW1lZlIwOVNmZXhIVkxSSkY0Mk44QW1PbkQwbjEx?=
 =?utf-8?B?WkUxRnBRNkgxQjdDUVg5WnNJQlE4MWViTndmelhnZmRpaVNPRXI5dUVUODFw?=
 =?utf-8?B?cVQvQm1zbzBaY25TancwNS8vZjZJTEo1MHg3Vm1iV3ZrbFJVek1xSnFvVnU1?=
 =?utf-8?B?aE5VcmhXR09kZjNHY3ZKSEJHOWYvbkxPN0tPT0EyQzVHSXQzTzFaUHRsMVRq?=
 =?utf-8?B?VGpjb0FFZEtxZWc5elBtc2lwYjhGWDdPaWQ2SDNYL2tZdjY0YzdDZkl2K0l5?=
 =?utf-8?B?VlR4ZnZzcytlaEZRVGVDMWx3Z1RpTkYrM2xjVHpjMTVNTUJEUVE0aHI1K2xW?=
 =?utf-8?B?L2N3bGxJQnFKc0hkTjNUbWg3Mit0b3diOC9uRmZFeHBhaHd3YzhiaW5DVDZj?=
 =?utf-8?B?Vkd5NnVnMlkrOTEyUlJIZGFJUHAzbGQrNUdZaE5PRGZuRWFVbnVYVHlHMGU5?=
 =?utf-8?B?S0xTU3ZlMVA4N3M2MlF5TVIwWSs4dk4ydm9YekdIQ3Y2Q2I1Ry9IWXZvYmdK?=
 =?utf-8?B?TDBLM3pLaWNmYUQyWGw3S1NqV0dZcEJ0QUI3dlBrUUxRRlZGbEFLRVpSZUYx?=
 =?utf-8?B?eVU5K0lNRzNSSWpLOHR1OVl1MFRBVExRYlFML3IrRXRVRUJlNG12NnBFTTdu?=
 =?utf-8?B?K1lTTDdxVTY1L01IUjBoWm1HQ2RGZ3E3UEloaFBoc3ZaUVY1aFpobllWOEQz?=
 =?utf-8?B?UUlLa1crMFBnYUZZQW5NMmxxbVZUOXJCZHhubWZDY2JuU3RIaGdBV0NadHFL?=
 =?utf-8?B?TnFNTitmOE54QkY4Y0M3aitjRE1DSHhLSWQ2dmJDR0ZrUlhJSlo5SzI5ajI2?=
 =?utf-8?B?YkwwaG9MMkNpTTBxMzh0ckV3NE5TS2NkUDBHN1h2OHZ4aGd1OWJiTEExQ3hk?=
 =?utf-8?B?TFFOSUYvZFpDbUdjUG85VFdtQkMvY2tTdCtvblFyQnhYZDhFdStqTlNmd0ow?=
 =?utf-8?B?SmRtcUJYaVhLbWdsVGI0ZlVzSVJDMU1yQUxVVERMKzJvNEt1OWEyRi9YS2pk?=
 =?utf-8?B?VVZIYk1TV29Ja25jVjJpRUZtWGFhUjUrYkVCMk9CQldENFpoM0FpL3hYaFhJ?=
 =?utf-8?Q?jXaQY2l1S3IWAbJqeOfRbtCmdk7c19evIBW68P969s=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b63094-4a80-4726-96cc-08d9f8239169
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 05:56:30.0233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMKixefagYYQcHP3LVJXbUSmIQsKlyBQkT11OGyE51dU41EG7mfRhjp24pavECUY3iajf9MDl7Qn5v3nGgcI4ofIyzCPN1C+UO3V7fs0nDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2435
X-Proofpoint-ORIG-GUID: _pr0tWm-IyxLb1MVaJu7D3hdxbr_Lliv
X-Proofpoint-GUID: _pr0tWm-IyxLb1MVaJu7D3hdxbr_Lliv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_04,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------3eCPCznPcGewm1RFmgZLodmV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/02/22 9:48 pm, Daniel P. Berrangé wrote:
> On Thu, Feb 24, 2022 at 11:59:08AM +0000, Kshitij Suri wrote:
>> Currently screendump only supports PPM format, which is un-compressed and not
>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>> to support PNG image capture using libpng. The param was added in QAPI schema
>> of screendump present in ui.json along with png_save() function which converts
>> pixman_image to PNG. HMP command equivalent was also modified to support the
>> feature.
>>
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image", "format":"png" } }
>>
>> Resolves:https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=Hu1QTP-aSF7FeXYQcdODcxg2wW1sBEpxaD4jWHYF5kxD2Z6ihhXkxRFOkovubo-f&s=YwpDKYWnYlYBM7aE1jNrISGXxP9nKm5f9Kfotxm5rZ4&e=  
>>
>> Signed-off-by: Kshitij Suri<kshitij.suri@nutanix.com>
>> ---
>> diff to v1:
>>    - Removed repeated alpha conversion operation.
>>    - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>>    - Added a new CONFIG_PNG parameter for libpng support.
>>    - Changed input format to enum instead of string.
>>
>>   hmp-commands.hx    | 11 +++---
>>   meson.build        | 13 +++++--
>>   meson_options.txt  |  2 +
>>   monitor/hmp-cmds.c |  8 +++-
>>   qapi/ui.json       | 24 ++++++++++--
>>   ui/console.c       | 97 ++++++++++++++++++++++++++++++++++++++++++++--
>>   6 files changed, 139 insertions(+), 16 deletions(-)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 70a9136ac2..e43c9954b5 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -244,17 +244,18 @@ ERST
>>   
>>       {
>>           .name       = "screendump",
>> -        .args_type  = "filename:F,device:s?,head:i?",
>> -        .params     = "filename [device [head]]",
>> -        .help       = "save screen from head 'head' of display device 'device' "
>> -                      "into PPM image 'filename'",
>> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
>> +        .params     = "filename [device [head]] [format]",
>> +        .help       = "save screen from head 'head' of display device 'device'"
>> +                      "in specified format 'format' as image 'filename'."
>> +                      "Currently only 'png' and 'ppm' formats are supported.",
>>           .cmd        = hmp_screendump,
>>           .coroutine  = true,
>>       },
>>   
>>   SRST
>>   ``screendump`` *filename*
>> -  Save screen into PPM image *filename*.
>> +  Save screen as an image *filename*.
>>   ERST
>>   
>>       {
>> diff --git a/meson.build b/meson.build
>> index 8df40bfac4..fd550c01ec 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1112,13 +1112,16 @@ if gtkx11.found()
>>     x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
>>                      kwargs: static_kwargs)
>>   endif
>> -vnc = not_found
>>   png = not_found
>> +png = dependency('libpng', required: get_option('png'),
>> +                   method: 'pkg-config', kwargs: static_kwargs)
>> +vnc = not_found
>> +vnc_png = not_found
>>   jpeg = not_found
>>   sasl = not_found
>>   if get_option('vnc').allowed() and have_system
>>     vnc = declare_dependency() # dummy dependency
>> -  png = dependency('libpng', required: get_option('vnc_png'),
>> +  vnc_png = dependency('libpng', required: get_option('vnc_png'),
>>                      method: 'pkg-config', kwargs: static_kwargs)
>>     jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
>>                       method: 'pkg-config', kwargs: static_kwargs)
>> @@ -1537,9 +1540,10 @@ config_host_data.set('CONFIG_TPM', have_tpm)
>>   config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>>   config_host_data.set('CONFIG_VDE', vde.found())
>>   config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
>> +config_host_data.set('CONFIG_PNG', png.found())
>>   config_host_data.set('CONFIG_VNC', vnc.found())
>>   config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
>> -config_host_data.set('CONFIG_VNC_PNG', png.found())
>> +config_host_data.set('CONFIG_VNC_PNG', vnc_png.found())
>
> I think we should be removing  CONFIG_VNC_PNG entirely - the VNC
> code should just use  CONFIG_PNG.
>
> I'd suggest splitting ths into two patches.  The first patch
> updates meson.build to look for libpng unconditionally and
> rename to CONFIG_PNG.  The second patch introduces the PNG
> support for screendump.
Yes can remove entirely with a combination of CONFIG_VNC and CONFIG_PNG 
as follows

#ifdef CONFIG_VNC_PNG -> #if defined(CONFIG_VNC) && defined(CONFIG_PNG)

But won't removing the vnc_png option cause problems in the build 
scripts of users with the current
version? Instead, can we use the new png meson-option to denote PNG 
format for VNC as well while maintaining backward compatibility? The 
change would look like

vnc_png = dependency('libpng', required: get_option('vnc_png'), method: 
'pkg-config', kwargs: static_kwargs)

gets changed to

vnc_png = dependency('libpng', required: get_option('vnc_png') || get_option('png'),
                     method: 'pkg-config', kwargs: static_kwargs)

>>   config_host_data.set('CONFIG_VNC_SASL', sasl.found())
>>   config_host_data.set('CONFIG_VIRTFS', have_virtfs)
>>   config_host_data.set('CONFIG_VTE', vte.found())
>> @@ -3579,11 +3583,12 @@ summary_info += {'curses support':    curses}
>>   summary_info += {'virgl support':     virgl}
>>   summary_info += {'curl support':      curl}
>>   summary_info += {'Multipath support': mpathpersist}
>> +summary_info += {'PNG support':       png}
>>   summary_info += {'VNC support':       vnc}
>>   if vnc.found()
>>     summary_info += {'VNC SASL support':  sasl}
>>     summary_info += {'VNC JPEG support':  jpeg}
>> -  summary_info += {'VNC PNG support':   png}
>> +  summary_info += {'VNC PNG support':   vnc_png}
>>   endif
>>   if targetos not in ['darwin', 'haiku', 'windows']
>>     summary_info += {'OSS support':     oss}
>> diff --git a/meson_options.txt b/meson_options.txt
>> index 52b11cead4..88148dec6c 100644
>> --- a/meson_options.txt
>> +++ b/meson_options.txt
>> @@ -177,6 +177,8 @@ option('vde', type : 'feature', value : 'auto',
>>          description: 'vde network backend support')
>>   option('virglrenderer', type : 'feature', value : 'auto',
>>          description: 'virgl rendering support')
>> +option('png', type : 'feature', value : 'auto',
>> +       description: 'PNG support with libpng')
>>   option('vnc', type : 'feature', value : 'auto',
>>          description: 'VNC server')
>>   option('vnc_jpeg', type : 'feature', value : 'auto',
>
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 9354f4c467..8caeb2d3bb 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -73,12 +73,27 @@
>>   ##
>>   { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
>>   
>> +##
>> +# @ImageFormat:
>> +#
>> +# Available list of supported types.
>> +#
>> +# @png: PNG format
>> +#
>> +# @ppm: PPM format
>> +#
>> +# Since: 6.3
>> +#
>> +##
>> +{ 'enum': 'ImageFormat',
>> +  'data': ['ppm', 'png'] }
>> +
>>   ##
>>   # @screendump:
>>   #
>> -# Write a PPM of the VGA screen to a file.
>> +# Write a screenshot of the VGA screen to a file.
>>   #
>> -# @filename: the path of a new PPM file to store the image
>> +# @filename: the path of a new file to store the image
>>   #
>>   # @device: ID of the display device that should be dumped. If this parameter
>>   #          is missing, the primary display will be used. (Since 2.12)
>> @@ -87,6 +102,9 @@
>>   #        parameter is missing, head #0 will be used. Also note that the head
>>   #        can only be specified in conjunction with the device ID. (Since 2.12)
>>   #
>> +# @format: image format for screendump is specified. Currently only PNG and
>> +#             PPM are supported.
> Mention that PPM is the default if omitted.
>
>> diff --git a/ui/console.c b/ui/console.c
>> index 40eebb6d2c..911092c908 100644
>> --- a/ui/console.c
>> +++ b/ui/console.c
>> @@ -37,6 +37,9 @@
>>   #include "exec/memory.h"
>>   #include "io/channel-file.h"
>>   #include "qom/object.h"
>> +#ifdef CONFIG_PNG
>> +#include "png.h"
> System headers should use  <...> for includes
>
>> +#endif
>> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
>> +{
>> +    int width = pixman_image_get_width(image);
>> +    int height = pixman_image_get_height(image);
>> +    png_structp png_ptr;
>> +    png_infop info_ptr;
>> +    g_autoptr(pixman_image_t) linebuf =
>> +                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
>> +    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
>> +    FILE *f = fdopen(fd, "wb");
>> +    int y;
>> +    if (!f) {
>> +        error_setg(errp, "Failed to create file from file descriptor");
>> +        return false;
>> +    }
> This leaks 'f', as do following error paths.
>
>> +
>> +    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
>> +                                           NULL, NULL);
>> +    if (!png_ptr) {
>> +        error_setg(errp, "PNG creation failed. Unable to write struct");
>> +        return false;
>> +    }
>> +
>> +    info_ptr = png_create_info_struct(png_ptr);
>> +
>> +    if (!info_ptr) {
>> +        error_setg(errp, "PNG creation failed. Unable to write info");
>> +        return false;
> This leaks 'png_ptr' too
>
>> +    }
>> +
>> +    png_init_io(png_ptr, f);
>> +
>> +    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
>> +                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
>> +                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
>> +
>> +    png_write_info(png_ptr, info_ptr);
>> +
>> +    for (y = 0; y < height; ++y) {
>> +        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
>> +        png_write_row(png_ptr, buf);
>> +    }
>> +    qemu_pixman_image_unref(linebuf);
>> +
>> +    png_write_end(png_ptr, NULL);
>> +
>> +    png_destroy_write_struct(&png_ptr, &info_ptr);
>> +
>> +    if (fclose(f) != 0) {
>> +        error_setg(errp, "PNG creation failed. Unable to close file");
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
> Regards,
> Daniel
Thank you for your review! Will update the error handling and 
documentation in the upcoming patch.

Regards,
Kshitij
--------------3eCPCznPcGewm1RFmgZLodmV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 24/02/22 9:48 pm, Daniel P. Berrang=
=C3=A9
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:YhevxnLUi5BHWJ9G@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Thu, Feb 24, 2022 at 11:59:=
08AM +0000, Kshitij Suri wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Currently screendump only su=
pports PPM format, which is un-compressed and not
standard. Added a &quot;format&quot; parameter to qemu monitor screendump c=
apabilites
to support PNG image capture using libpng. The param was added in QAPI sche=
ma
of screendump present in ui.json along with png_save() function which conve=
rts
pixman_image to PNG. HMP command equivalent was also modified to support th=
e
feature.

Example usage:
{ &quot;execute&quot;: &quot;screendump&quot;, &quot;arguments&quot;: { &qu=
ot;filename&quot;: &quot;/tmp/image&quot;, &quot;format&quot;:&quot;png&quo=
t; } }

Resolves: <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttps-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_=
718&amp;d=3DDwIBaQ&amp;c=3Ds883GpUCOChKOHiocYtGcg&amp;r=3Dutjv19Ej9Fb0TB7_D=
X0o3faQ-OAm2ypPniPyqVSoj_w&amp;m=3DHu1QTP-aSF7FeXYQcdODcxg2wW1sBEpxaD4jWHYF=
5kxD2Z6ihhXkxRFOkovubo-f&amp;s=3DYwpDKYWnYlYBM7aE1jNrISGXxP9nKm5f9Kfotxm5rZ=
4&amp;e=3D">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gitlab.c=
om_qemu-2Dproject_qemu_-2D_issues_718&amp;d=3DDwIBaQ&amp;c=3Ds883GpUCOChKOH=
iocYtGcg&amp;r=3Dutjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&amp;m=3DHu1QTP=
-aSF7FeXYQcdODcxg2wW1sBEpxaD4jWHYF5kxD2Z6ihhXkxRFOkovubo-f&amp;s=3DYwpDKYWn=
YlYBM7aE1jNrISGXxP9nKm5f9Kfotxm5rZ4&amp;e=3D</a>=20

Signed-off-by: Kshitij Suri <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:kshitij.suri@nutanix.com">&lt;kshitij.suri@nutanix.com&gt;</a>
---
diff to v1:
  - Removed repeated alpha conversion operation.
  - Modified logic to mirror png conversion in vnc-enc-tight.c file.
  - Added a new CONFIG_PNG parameter for libpng support.
  - Changed input format to enum instead of string.

 hmp-commands.hx    | 11 +++---
 meson.build        | 13 +++++--
 meson_options.txt  |  2 +
 monitor/hmp-cmds.c |  8 +++-
 qapi/ui.json       | 24 ++++++++++--
 ui/console.c       | 97 ++++++++++++++++++++++++++++++++++++++++++++--
 6 files changed, 139 insertions(+), 16 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 70a9136ac2..e43c9954b5 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -244,17 +244,18 @@ ERST
=20
     {
         .name       =3D &quot;screendump&quot;,
-        .args_type  =3D &quot;filename:F,device:s?,head:i?&quot;,
-        .params     =3D &quot;filename [device [head]]&quot;,
-        .help       =3D &quot;save screen from head 'head' of display devi=
ce 'device' &quot;
-                      &quot;into PPM image 'filename'&quot;,
+        .args_type  =3D &quot;filename:F,device:s?,head:i?,format:f?&quot;=
,
+        .params     =3D &quot;filename [device [head]] [format]&quot;,
+        .help       =3D &quot;save screen from head 'head' of display devi=
ce 'device'&quot;
+                      &quot;in specified format 'format' as image 'filenam=
e'.&quot;
+                      &quot;Currently only 'png' and 'ppm' formats are sup=
ported.&quot;,
         .cmd        =3D hmp_screendump,
         .coroutine  =3D true,
     },
=20
 SRST
 ``screendump`` *filename*
-  Save screen into PPM image *filename*.
+  Save screen as an image *filename*.
 ERST
=20
     {
diff --git a/meson.build b/meson.build
index 8df40bfac4..fd550c01ec 100644
--- a/meson.build
+++ b/meson.build
@@ -1112,13 +1112,16 @@ if gtkx11.found()
   x11 =3D dependency('x11', method: 'pkg-config', required: gtkx11.found()=
,
                    kwargs: static_kwargs)
 endif
-vnc =3D not_found
 png =3D not_found
+png =3D dependency('libpng', required: get_option('png'),
+                   method: 'pkg-config', kwargs: static_kwargs)
+vnc =3D not_found
+vnc_png =3D not_found
 jpeg =3D not_found
 sasl =3D not_found
 if get_option('vnc').allowed() and have_system
   vnc =3D declare_dependency() # dummy dependency
-  png =3D dependency('libpng', required: get_option('vnc_png'),
+  vnc_png =3D dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', kwargs: static_kwargs)
   jpeg =3D dependency('libjpeg', required: get_option('vnc_jpeg'),
                     method: 'pkg-config', kwargs: static_kwargs)
@@ -1537,9 +1540,10 @@ config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_s=
erver)
+config_host_data.set('CONFIG_PNG', png.found())
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
-config_host_data.set('CONFIG_VNC_PNG', png.found())
+config_host_data.set('CONFIG_VNC_PNG', vnc_png.found())
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">

I think we should be removing  CONFIG_VNC_PNG entirely - the VNC
code should just use  CONFIG_PNG.

I'd suggest splitting ths into two patches.  The first patch
updates meson.build to look for libpng unconditionally and
rename to CONFIG_PNG.  The second patch introduces the PNG
support for screendump.
</pre>
    </blockquote>
    Yes can remove entirely with a combination of CONFIG_VNC and
    CONFIG_PNG as follows<br>
    <pre class=3D"c-mrkdwn__pre" data-stringify-type=3D"pre" data-darkreade=
r-inline-color=3D"" style=3D"color: rgb(209, 210, 211); font-style: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orpha=
ns: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-=
decoration-style: initial; text-decoration-color: initial; box-sizing: inhe=
rit; margin: 4px 0px; padding: 8px; --saf-0:rgba(var(--sk_foreground_low,29=
,28,29),0.13); font-size: 12px; line-height: 1.50001; font-variant-ligature=
s: none; white-space: pre-wrap; overflow-wrap: break-word; word-break: norm=
al; tab-size: 4; border: 1px solid var(--saf-0); border-radius: 4px; backgr=
ound: rgba(var(--sk_foreground_min,29,28,29),0.04); counter-reset: list-0 0=
 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 li=
st-9 0; text-align: left; font-family: Monaco, Menlo, Consolas, &quot;Couri=
er New&quot;, monospace !important; --darkreader-inline-color:#ccc7c0;">#if=
def CONFIG_VNC_PNG -&gt; #if defined(CONFIG_VNC) &amp;&amp; defined(CONFIG_=
PNG)
</pre>
    But won't removing the vnc_png option cause problems in the build
    scripts of users with the current<br>
    version? Instead, can we use the new png meson-option to denote PNG
    format for VNC as well while maintaining backward compatibility? The
    change would look like<br>
    <p class=3D"c-mrkdwn__pre" data-stringify-type=3D"pre" data-darkreader-=
inline-color=3D"" style=3D"color: rgb(209, 210, 211); font-style: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial; box-sizing: inheri=
t; margin: 4px 0px; padding: 8px; --saf-0:rgba(var(--sk_foreground_low,29,2=
8,29),0.13); font-size: 12px; line-height: 1.50001; font-variant-ligatures:=
 none; white-space: pre-wrap; overflow-wrap: break-word; word-break: normal=
; tab-size: 4; border: 1px solid var(--saf-0); border-radius: 4px; backgrou=
nd: rgba(var(--sk_foreground_min,29,28,29),0.04); counter-reset: list-0 0 l=
ist-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list=
-9 0; text-align: left; font-family: Monaco, Menlo, Consolas, &quot;Courier=
 New&quot;, monospace !important; --darkreader-inline-color:#ccc7c0;">vnc_p=
ng =3D dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', kwargs: static_kwargs)
</p>
    gets changed to<br>
    <pre class=3D"c-mrkdwn__pre" data-stringify-type=3D"pre" data-darkreade=
r-inline-color=3D"" style=3D"color: rgb(209, 210, 211); font-style: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orpha=
ns: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-=
decoration-style: initial; text-decoration-color: initial; box-sizing: inhe=
rit; margin: 4px 0px; padding: 8px; --saf-0:rgba(var(--sk_foreground_low,29=
,28,29),0.13); font-size: 12px; line-height: 1.50001; font-variant-ligature=
s: none; white-space: pre-wrap; overflow-wrap: break-word; word-break: norm=
al; tab-size: 4; border: 1px solid var(--saf-0); border-radius: 4px; backgr=
ound: rgba(var(--sk_foreground_min,29,28,29),0.04); counter-reset: list-0 0=
 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 li=
st-9 0; text-align: left; font-family: Monaco, Menlo, Consolas, &quot;Couri=
er New&quot;, monospace !important; --darkreader-inline-color:#ccc7c0;">vnc=
_png =3D dependency('libpng', required: get_option('vnc_png') || get_option=
('png'),
                    method: 'pkg-config', kwargs: static_kwargs)</pre>
    <blockquote type=3D"cite" cite=3D"mid:YhevxnLUi5BHWJ9G@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D""> config_host_data.set('CONFI=
G_VNC_SASL', sasl.found())
 config_host_data.set('CONFIG_VIRTFS', have_virtfs)
 config_host_data.set('CONFIG_VTE', vte.found())
@@ -3579,11 +3583,12 @@ summary_info +=3D {'curses support':    curses}
 summary_info +=3D {'virgl support':     virgl}
 summary_info +=3D {'curl support':      curl}
 summary_info +=3D {'Multipath support': mpathpersist}
+summary_info +=3D {'PNG support':       png}
 summary_info +=3D {'VNC support':       vnc}
 if vnc.found()
   summary_info +=3D {'VNC SASL support':  sasl}
   summary_info +=3D {'VNC JPEG support':  jpeg}
-  summary_info +=3D {'VNC PNG support':   png}
+  summary_info +=3D {'VNC PNG support':   vnc_png}
 endif
 if targetos not in ['darwin', 'haiku', 'windows']
   summary_info +=3D {'OSS support':     oss}
diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead4..88148dec6c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -177,6 +177,8 @@ option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
+option('png', type : 'feature', value : 'auto',
+       description: 'PNG support with libpng')
 option('vnc', type : 'feature', value : 'auto',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">diff --git a/qapi/ui.json b/=
qapi/ui.json
index 9354f4c467..8caeb2d3bb 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -73,12 +73,27 @@
 ##
 { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'}=
 }
=20
+##
+# @ImageFormat:
+#
+# Available list of supported types.
+#
+# @png: PNG format
+#
+# @ppm: PPM format
+#
+# Since: 6.3
+#
+##
+{ 'enum': 'ImageFormat',
+  'data': ['ppm', 'png'] }
+
 ##
 # @screendump:
 #
-# Write a PPM of the VGA screen to a file.
+# Write a screenshot of the VGA screen to a file.
 #
-# @filename: the path of a new PPM file to store the image
+# @filename: the path of a new file to store the image
 #
 # @device: ID of the display device that should be dumped. If this paramet=
er
 #          is missing, the primary display will be used. (Since 2.12)
@@ -87,6 +102,9 @@
 #        parameter is missing, head #0 will be used. Also note that the he=
ad
 #        can only be specified in conjunction with the device ID. (Since 2=
.12)
 #
+# @format: image format for screendump is specified. Currently only PNG an=
d
+#             PPM are supported.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Mention that PPM is the default if omitted.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">diff --git a/ui/console.c b/=
ui/console.c
index 40eebb6d2c..911092c908 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,6 +37,9 @@
 #include &quot;exec/memory.h&quot;
 #include &quot;io/channel-file.h&quot;
 #include &quot;qom/object.h&quot;
+#ifdef CONFIG_PNG
+#include &quot;png.h&quot;
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
System headers should use  &lt;...&gt; for includes</pre>
    </blockquote>
    <blockquote type=3D"cite" cite=3D"mid:YhevxnLUi5BHWJ9G@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+#endif
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+static bool png_save(int fd=
, pixman_image_t *image, Error **errp)
+{
+    int width =3D pixman_image_get_width(image);
+    int height =3D pixman_image_get_height(image);
+    png_structp png_ptr;
+    png_infop info_ptr;
+    g_autoptr(pixman_image_t) linebuf =3D
+                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, wi=
dth);
+    uint8_t *buf =3D (uint8_t *)pixman_image_get_data(linebuf);
+    FILE *f =3D fdopen(fd, &quot;wb&quot;);
+    int y;
+    if (!f) {
+        error_setg(errp, &quot;Failed to create file from file descriptor&=
quot;);
+        return false;
+    }
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
This leaks 'f', as do following error paths.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+    png_ptr =3D png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
+                                           NULL, NULL);
+    if (!png_ptr) {
+        error_setg(errp, &quot;PNG creation failed. Unable to write struct=
&quot;);
+        return false;
+    }
+
+    info_ptr =3D png_create_info_struct(png_ptr);
+
+    if (!info_ptr) {
+        error_setg(errp, &quot;PNG creation failed. Unable to write info&q=
uot;);
+        return false;
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
This leaks 'png_ptr' too</pre>
    </blockquote>
    <blockquote type=3D"cite" cite=3D"mid:YhevxnLUi5BHWJ9G@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+    }
+
+    png_init_io(png_ptr, f);
+
+    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
+                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
+                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
+
+    png_write_info(png_ptr, info_ptr);
+
+    for (y =3D 0; y &lt; height; ++y) {
+        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
+        png_write_row(png_ptr, buf);
+    }
+    qemu_pixman_image_unref(linebuf);
+
+    png_write_end(png_ptr, NULL);
+
+    png_destroy_write_struct(&amp;png_ptr, &amp;info_ptr);
+
+    if (fclose(f) !=3D 0) {
+        error_setg(errp, &quot;PNG creation failed. Unable to close file&q=
uot;);
+        return false;
+    }
+
+    return true;
+}
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Regards,
Daniel</pre>
    </blockquote>
    Thank you for your review! Will update the error handling and
    documentation in the upcoming patch.<br>
    <br>
    Regards,<br>
    Kshitij<br>
    <blockquote type=3D"cite" cite=3D"mid:YhevxnLUi5BHWJ9G@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------3eCPCznPcGewm1RFmgZLodmV--

