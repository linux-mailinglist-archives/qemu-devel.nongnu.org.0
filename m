Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA84E3C12
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:59:34 +0100 (CET)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbIb-0005kR-Cj
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:59:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWbFa-0003VI-Rt
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:56:26 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:18602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWbFY-0003LF-0W
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:56:26 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M1eVWT022929;
 Tue, 22 Mar 2022 02:56:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=e3wcQRz6huRStEFucNmGTqWdLldr09HUMJrGonvgrCQ=;
 b=yiXUkdXKRCWEvPmf85+j2UCVSBFkG5dNcrcTbfqnkGz/u/P9r32K/8nyIpDV8+DOGmYD
 hbYisRMWsxV1K49RIXGgyoVVxp+mhZqIjJ/oUVPWjPdi4+8p4WdJFcoS/O5+KEOgt/1L
 YyaXUVV5pnfSLeaNkxGYZFTLwAblozJgSk4ICa4vPfsrkt6OwBFwD0hauy7aS7Eer4Hy
 s+vre29Q4ZoRcaHriTJRJISJbdYE+D/Pp6SozTQA3IXFZS0/eZUabODGPMwSvm9gZoXU
 jIB9eun4UjRBYaIS4llR2dv8OMoVnvjfITtWlkAeGtGKOIwbLbDiECFn3HiS3NTlgfFF vg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3ewegfnhd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 02:56:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F29RZVDpaZAtR/tAnLyFeK9u9oAM1VXYkx8fWF3HZtpt20RIQqUzztq3GLsTliqGCfxnU3Ay5miHYDzCEAP4u+TRBLmS9IDmLRlHfzFxGB14cgc6vpudkfc958W9SWAJoiYZdtB5GJQ/kFIWrW4XB88oe70k4hfu1Uf0or5S6tnTiUgnuYq0wYXYQtW19TyqIsHTpLrLTqRe+6aEliocxb8CuHEFeXCy94HARa8hBsB4tSfms57RkuezNi5peIQpXZPSgpEBRZyzz1eAwvn+TpYgqY9OXN0B8CPuyY6RMcrP4bpuziUp3u1M/fWErm4i6dCS9UGI8hBCIOXvQf52qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3wcQRz6huRStEFucNmGTqWdLldr09HUMJrGonvgrCQ=;
 b=abcjJshor4DqlPffQdQxQe9Mv5fZ1+MAI1DslEuLSJpep6BOcmbVEZ+m7cylFdvtPGeAJbSrQy8e4y7dllEA6pwB/Lf/Wk07FZ3F3mJWCtT/3xRPaMfsJp4ScidotLe6plaAbW2YLG9PBLcudpJYZCmFWgIF0MflN+NttBX6v+CnCv99qf0XNQKXHZ/I6SswhuuVBw6nr5K6ab5+BskIBWp/1ghqEfE3eLWmxxcxChyARhY0Rtb3Mj7BCAqL5xk5E2RlB6YZBzfcq2vBizKKo0LkWx0MSPgc9rAlHaVIve+MHTcz3YMNXnpX81h7F+Ak/CuZj85T10wasbrBXOW9IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by SN4PR0201MB8774.namprd02.prod.outlook.com (2603:10b6:806:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 09:56:19 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 09:56:19 +0000
Message-ID: <49e434f9-d070-7093-5ba2-87845e066c94@nutanix.com>
Date: Tue, 22 Mar 2022 15:26:08 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with screendump
 as PNG
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220322081845.19680-1-kshitij.suri@nutanix.com>
 <20220322081845.19680-2-kshitij.suri@nutanix.com>
 <YjmbL3E2CRqjFii1@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <YjmbL3E2CRqjFii1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR0101CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::30) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28bf4d59-c057-403a-785c-08da0bea3627
X-MS-TrafficTypeDiagnostic: SN4PR0201MB8774:EE_
X-Microsoft-Antispam-PRVS: <SN4PR0201MB8774A19FF1B8718941C1084999179@SN4PR0201MB8774.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bLHMDq08xsUTvZFQhJNi9XPSkur+ID8EilSZoVUlyvUk2KpaCXOKSDvqOCM2raXVpnI/URQLKt4HCZUBpZN0CPOvHfZsGYrotl0lhgp8uDYPFC7LMnVItUsw97IUF1gXsjZZECF+tZfCjSUZMVrSUzMIKvSI11v01Lz6q9r/gHNxzHUCvRZMwydy4JY/avQGCXlRcf9SiGcs0vYxNkRYHETH2OmBqv90iUiOYLF1fbBMHTSgxGB/aM+oOi6b1Xg6p++g7+e/C2AzWBvQKvyHT9DDPGIYDjGjXWxGkrEpTB9J3nLQVikre7raz2t+CWdkbfwoBT9ew9p5mwrIoO35IfKQAVP48fOFLf8J6zEJE3yAFKZVcoSUB4VTReKOUPIWFtx00AViU6rN3yfrfRSxuT+9UxGCeWEcqeVwD3je+99fO+DqkwHpoFBv2KT7v/TzpYOf8PteZ/SYaTt5Sn/3aRfxYDjRMgMBEOwQpuWzqlDxbCyF/gPMOmx6zbSiRJ+Zu1+14cizCDSYDkkN4bttVB9oQ19ZNICOiBIn0kkmzF6o4ArdzRzYzbQDgOdWA07bZCg1EJwiQ/u6tMdVazW5wabRrCmd8fVzApmeu9W8rLfx1kbyCKu5pBu5VbG+swtcyO2qp9LQC6ubbbLVZYxd7msfOeTTWGmcIo9mfugGb+gVZzj5ziVtsz9FXPxlPjlaJtYR3LdHxrDLdam7Cgm+2rpcIwYJVA+/3L2SZqoHOnNOMaNh9AFqPWocuEZfzUbeYeb5dZI+swHMFPpCU6PmhGft95jX+olWWYbbnP8ijkjM5UgVKamLUZ4XGh6xY1JjQ2rJym7m01dpLMMGwyjilDtOFJbHzzIY5O+4cnW11aI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(83380400001)(44832011)(66476007)(8676002)(66946007)(4326008)(66556008)(6486002)(966005)(53546011)(52116002)(6506007)(508600001)(6666004)(2906002)(31686004)(2616005)(186003)(26005)(6916009)(8936002)(316002)(5660300002)(38100700002)(38350700002)(36756003)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEVQaWgzeG1ESkQ5RHdYMHJBc0N6WlhuaHZxQWVIbm1relorQjJBR0NDQVR1?=
 =?utf-8?B?bVZnTXJ1dUdML2hDaDF1R2JMelZjbFloZVA4akZkVUJPTDczRDlnZ2huYmUz?=
 =?utf-8?B?N09IWkJXZ1ZiSDJPUHdDRzM1S2d0MkIvQ2Exc1crODJqZWtwQ2JOMStFa2wr?=
 =?utf-8?B?S3RTY1doN0RSeDFWcXJ4OFRYQkVDMC9waUJrdVhlNE5GK0tGTlpGNWtwWHRB?=
 =?utf-8?B?azhxYjFZcVdYYkY1QmNnWXZYNmxwQ1hGRS8ybnZSK0lzQ2VDczBTaFBWWjMz?=
 =?utf-8?B?R3ZGUVk3M2pncEd3MXVUTUdPRHMrY2VvcHZmM3p2TWFUaWJ0cXBxTE1sTXNU?=
 =?utf-8?B?dk5mSXI3cW1KUTNObnpZOURFRzZyQ2lUWFJiYTVKRitUQ0pGRTdWV0EzRXJ6?=
 =?utf-8?B?WGRlM1ZBSmJCanZXM1ZFU2VQRzhJOGZQZ3IxUnR0akZ6SmY2dGE5U3h2MDIv?=
 =?utf-8?B?S0hhVjhxR3pGSm1uVlVWL0lOaVc4cTdrWkVYUFcwNEp5WTMrMzhQK2dCVmNN?=
 =?utf-8?B?ZEFNOEFuM1RuWFBFSnhadGJkWFNoR0NtbHJnM2h1STdIWkpGQS9xSGFKVS9E?=
 =?utf-8?B?eUFLckNBVk5XdEJ6QmVPUFJlNFQyOEpGMHA2c2hqenlQWWFrZXZRZG1PZEZY?=
 =?utf-8?B?WXBNZTR0b2Z5T0QrK2VodEZSeWphdkUreFNrRUk0ZHM4ZHlGZURUZlZuV2Y4?=
 =?utf-8?B?ajRnN2M0Nm5CNGdBai9Dc28xcU5CdUpkSmoyRXRpZ3llY044NGhYRkprTmpZ?=
 =?utf-8?B?QzJBaHVIaTg3cWQxeEFOekxKTEJZaXNvKzVGZjVGS2ZFZ3NTa2pmcENoZmth?=
 =?utf-8?B?dU9yYnVjbGk5dHI4bUlLQlg5eWJiTkxrVzBFeHBscUc2NGhUWE5FNUtMR29V?=
 =?utf-8?B?a3UrbmtBaXNpdVhnenhpZnhFR2hGRXpBTE1RaHNLS0RZbTIwbU1NMFB2QXIw?=
 =?utf-8?B?cXBEOEdBbjF3bnhwWDR2Rnl6ZWovK1RMR0txOFBua1cvbnBEcEF0aVE1VVpD?=
 =?utf-8?B?WS9BdzkxRDU5WXRIT2FWSUcxakRHWlU1c2ZWa1FyQkM4ZVJHa2RNckt2c09P?=
 =?utf-8?B?Z0JJcUJwbWwvZmVJMW1hZ2JPcjk4dVgyNERFMEt2ZE42T3A3MGljTnZQY01G?=
 =?utf-8?B?RUJuT083TU54eFAxc2R3dFRFOXF0b0pDUForc3ZiR3paT3h5eUVvbk8wR091?=
 =?utf-8?B?UUVsR1VIZjFyeWIvUFkrNGxzZGJQVDJ4a0R2d2xzSkpmdjBTVktvTWpqVmow?=
 =?utf-8?B?emlHV1FtWnQ4b2xCSEdzajhFOHhGT0VRNisvVVExT2Y1WmlGRno5cW84b3hi?=
 =?utf-8?B?Mk5OT3kzZnhjSkZJR0ZXcnlaWnJhS2RobWY2RkluZEFLMmUvbUsvTGt0WCtw?=
 =?utf-8?B?UzBQNVdRUXBGeFJMQVhHWkY0QlFmejJTcW9uMTFaRUQ4ZWhGdDkyYTk3NXBB?=
 =?utf-8?B?VUJybUlrNnRNRmhmd2RYbVNaN2NDdkc2QVY4U2Q4MmFMWXh4bmdKc0FQKzVB?=
 =?utf-8?B?ZTNwNVNrbjZhSWpHbHArQlFkbTBXQyt3bm1iWmFsdDV3bGZEcE9LVjJPRkZF?=
 =?utf-8?B?RFgwMFRVRWhKcWxkSVJhWGZHZW13VlZFMlllK1FOTEUwcXhjSG03RVRWcTV4?=
 =?utf-8?B?N2Fkb0hyMXJaOUpEcS9jVHlMaTVNSDh6TGZmS3Y5NXVVOW0rVDk1dzhSV2tR?=
 =?utf-8?B?UVRaM0s2Sk9kNHNZNVAvd3QvZ0dWaEsxY1hoKytOUnV5Z3IyMmZrYXRVczZy?=
 =?utf-8?B?TE5RZDQ0bkZhdHZaVDgyVUp2bXVmemF4R0xUcy9XQ1lKQVdNZjZPSXJkZm4w?=
 =?utf-8?B?RU5CelJ6WkZJRkNwZlZ6eHBCMGVxY2o0T2VCek5zVytaSFEzRWN1U2FVVjVu?=
 =?utf-8?B?aytvV0R4SEl0SjVQT083a1ltMDhyRm8wRlUvWVdXWWdnZzFKOE4rR0NQMTRH?=
 =?utf-8?B?dWRoaXFqVmhYWHZmeG9oZjRwd1RRcG43ZVpmbmdyT2VHaWtJT3hoa0tnekZr?=
 =?utf-8?B?TC9KK1llMjVBPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bf4d59-c057-403a-785c-08da0bea3627
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 09:56:18.9061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6X+WPDwYxLfhbtWXmUzAfJLfafEP5w4wObG/5+oKaU5lAbiO1idRtulfpc8oOdn2vFcvv22nzD4TJ3kqEqfkk3YnVtpBcGx7hxT+Nx5QYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8774
X-Proofpoint-ORIG-GUID: UQg3vHRMvS3i5yhdR7RV5Ag93XngMmSO
X-Proofpoint-GUID: UQg3vHRMvS3i5yhdR7RV5Ag93XngMmSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_03,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 armbru@redhat.com, qemu-devel@nongnu.org, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 22/03/22 3:17 pm, Daniel P. Berrangé wrote:
> On Tue, Mar 22, 2022 at 08:18:45AM +0000, Kshitij Suri wrote:
>> Currently screendump only supports PPM format, which is un-compressed and not
>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>> to support PNG image capture using libpng. The param was added in QAPI schema
>> of screendump present in ui.json along with png_save() function which converts
>> pixman_image to PNG. HMP command equivalent was also modified to support the
>> feature.
>>
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>> "format":"png" } }
>>
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=n4gY8td5J_mIXLjj-t4OvqdRNDLAKuLn003VbLjWtqVaIGciyzeqQ8Fij45WWQ9m&s=gw9lEcMePStOP8Kcb4RSP_znNQSVAEUtBC63b1g1x5Q&e=
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> ---
>> diff to v1:
>>    - Removed repeated alpha conversion operation.
>>    - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>>    - Added a new CONFIG_PNG parameter for libpng support.
>>    - Changed input format to enum instead of string.
>>    - Improved error handling.
>>   hmp-commands.hx    |  11 ++---
>>   monitor/hmp-cmds.c |  20 ++++++++-
>>   qapi/ui.json       |  24 +++++++++--
>>   ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>>   4 files changed, 144 insertions(+), 12 deletions(-)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 8476277aa9..19b7cab595 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -244,11 +244,12 @@ ERST
>>   
>>       {
>>           .name       = "screendump",
>> -        .args_type  = "filename:F,device:s?,head:i?",
>> -        .params     = "filename [device [head]]",
>> -        .help       = "save screen from head 'head' of display device 'device' "
>> -                      "into PPM image 'filename'",
>> -        .cmd        = hmp_screendump,
>> +        .args_type  = "filename:F,format:s?,device:s?,head:i?",
>> +        .params     = "filename [format] [device [head]]",
>> +        .help       = "save screen from head 'head' of display device 'device'"
>> +                      "in specified format 'format' as image 'filename'."
>> +                      "Currently only 'png' and 'ppm' formats are supported.",
>> +         .cmd        = hmp_screendump,
>>           .coroutine  = true,
>>       },
>>   
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 634968498b..bf3ba76bd3 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1720,9 +1720,27 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>>       const char *filename = qdict_get_str(qdict, "filename");
>>       const char *id = qdict_get_try_str(qdict, "device");
>>       int64_t head = qdict_get_try_int(qdict, "head", 0);
>> +    const char *input_format  = qdict_get_try_str(qdict, "format");
>>       Error *err = NULL;
>> +    ImageFormat format;
>>   
>> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
>> +    int val = qapi_enum_parse(&ImageFormat_lookup, input_format,
>> +                              IMAGE_FORMAT_PPM, &err);
>> +    if (err) {
>> +        goto end;
>> +    }
>> +
>> +    switch (val) {
>> +    case IMAGE_FORMAT_PNG:
>> +        format = IMAGE_FORMAT_PNG;
>> +        break;
>> +    default:
>> +        format = IMAGE_FORMAT_PPM;
>> +    }
> This switch looks pointless - the code is passing the default into
> qapi_enum_parse already, this doesn't need to handle defaulting
> again. This just needs
>
>          format = qapi_enum_parse(&ImageFormat_lookup, input_format,
>                                   IMAGE_FORMAT_PPM, &err);
>          if (err) {
>             goto end;
>           }
Apologies, missed that. Will update in the following patch.
>> +
>> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
>> +                   input_format != NULL, format, &err);
>> +end:
>>       hmp_handle_error(mon, err);
>>   }
>>   
>> +    for (y = 0; y < height; ++y) {
>> +        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
>> +       png_write_row(png_ptr, buf);
>> +    }
> Tiny style bug, indent off-by-1
>
>
> With regards,
> Daniel
Thank you for your review!

Regards,
Kshitij Suri

