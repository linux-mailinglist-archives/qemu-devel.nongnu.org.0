Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FB448A4DE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 02:18:33 +0100 (CET)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n75o0-0002ex-6F
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 20:18:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1n75lO-0000yN-V3; Mon, 10 Jan 2022 20:15:50 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1n75lM-0006n8-B2; Mon, 10 Jan 2022 20:15:50 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20B09A6N011416; 
 Tue, 11 Jan 2022 01:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=got/GzXUNcHr3FOECiC67lZWpuJZjvEh0fv3lz9Lo0o=;
 b=teydffr42FAp93um+QOTZBwL7y+NIEh5cW5OZ9D1SgSo05REMLd8q7DnYGuJOOd+La9d
 SIj9FwQIjzQITtn4HMjFx3Wm3nXfcHnhDnUe7eoqMorRy1M8Q57juy12WMJeQzbD7iP2
 898DcGijBAkDlCuYzeTbk2l69vltQ++krSBDqecpqJbhBh90WZr86rwJdOz4YEld1MOT
 CgxhKCLGFXorDDue9OL9TAur77mF/NFAZRe4NPp3sexwwwogPlMsgwqbe6sPwm3bKj/g
 1fg+2wDKEOY4LOvRUijUAbFm2BkVpx9JEp9E6kkd/Of1GCF1sGj2eqx3O9GsqyWtkEzq EA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjdbt4bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 01:15:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20B0puA8113864;
 Tue, 11 Jan 2022 01:15:36 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
 by aserp3020.oracle.com with ESMTP id 3df2e42n71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 01:15:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqfJ0cfXQM6epPAud9rGrBG27pT4l1lwVhMUbn1lr6uQUTXNqQWGn/O32kZkFLDyq0spxRhXiMmhhJegere47YAnTdllg347KhjS1iknMxwQtBz42yDUZ8PkgTpnqPtpJmM0ypsTRf9eBX7eNXRNJXjmxr8rL2Zl+OGdOUv+NqNQe2gPhf0qBPh2ndVc2+u/uBFYo8JGYBw2RQyD9ChwU4QRDthpfRst2A+ESraG5aNmoYScBv3r12QzodDxXvNHcpnRJVAuptovkfLH4VYJ+sFZaxwrleKUPfSwJlq1X3bbObdYCZJ53o4tDXnu1m4qzXiuTze7R0EdxavEZebKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=got/GzXUNcHr3FOECiC67lZWpuJZjvEh0fv3lz9Lo0o=;
 b=S7LR6YBR/h5/qVpySU7usfNatZxBlJEKMx4E8oIPxEgcNChMndmDbnljvcI+mIRDFj1n/WWr3WZY8s7n3jcR6qgsJMINbxgzxni36hUPiKpsrltX7tzf4uYtIq5YE7IqzOG/3NmnFzysjAl50M3NtFFnEMpm4CtDGcJafGtwUs/NOl5RSIKQgaAkQiJaAuxj7G+N4ia6t4L+rrGJtgXK5Otjc5wnIM4nVBKF/nx7FB3zYfW5E0h/kFixI4gbUxHUnGNFr/frW6rZdn9HyE2aNBPNvJHNRl1gteCmlG7OKdrGb2K2SKAYf2/uMVj+uasOgzvrWa/s6IhoHgsE3dlYSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=got/GzXUNcHr3FOECiC67lZWpuJZjvEh0fv3lz9Lo0o=;
 b=dMzP43VH2o3cIplgPmqCHBol7qCFZSLSfyHyHOaRlCORvjG9izzZZX7Ni1p45deAQrUrECQiI2Cavv0jldKl6OgY1jUJknstigM6DNir3RdtQEPFajqBiavbN59CgDtj98QVNhA7Itoea2C9quS/Iu+K3UEZC5txpaSoR3Sb5Vw=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB5486.namprd10.prod.outlook.com (2603:10b6:a03:301::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 01:15:35 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::91ce:8d4f:e5d1:c67b]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::91ce:8d4f:e5d1:c67b%7]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 01:15:34 +0000
Subject: Re: [PATCH 0/2] scsi: to fix issue on passing host_status to the
 guest kernel
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20211210141615.2585-1-dongli.zhang@oracle.com>
Message-ID: <cbd4d82f-9998-fa03-9431-ebd73f9a3354@oracle.com>
Date: Mon, 10 Jan 2022 17:15:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20211210141615.2585-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::36) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67c2a5ce-0adf-4516-54bd-08d9d49fde7f
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5486:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB548641FE37E3702E8093EABDF0519@SJ0PR10MB5486.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cCH7Gkjx2SlxFMjwz0VqviLkn9d3l3ipN7AKab7auma5iCwXmEqhDMBulv00Y8FFd1oyZjmVsjzniBviSysaaWH+rFR6yryIjxd8hM45lNbuLdhe8speTUYK36qzhCba6U3G2jArWB567yiFf80OOjR3zvQqpF14cW6sfGiU8mS8gJd8a1FkQHRMCYeemH0fnPKYiciLiqSFVnaBt2yFcPTlIrR63kD6TFYCjteqW0SFRBwdIEvjUlH1WcuIPt3nZ1AAqLt7jZ0F4Sx795JcTxNh6jcKdBg53ijs5j/21VtDr8KLQx7nPEcCKPGDUzpiJ4g9NvzUm9vEDGFU6NfgFhJufg2rHKOdpxGLBdgdViG/hpUx5vk40pr+pT8SlymiLM0i0mj3e+39tQAr26aVSNcdLcyCUeOHYARt+UU12L7+L6jEXQYLEJSEb4dx6Rcuvi3DEcp1LV0xrVGmwKHIS2YnZl3teQRHgyt5yUiwkn36osYk8+Sv+LcagBSIz/st0+HbJ/EprXM6S+bFyQlBxG3E2e7vVU15QwQeH14ZX4hAjPY0Q4vxl+opApSoSCW9RkbPJhguoRLhftYHylilj+041AZpv/MeMpULDl1Yb4tbDAL8k38LbPmL7jaXKp6tIKjv/mVm95N296mPfyJEmwl8ja/CUhJ++fk7RiUYSb74/IWBdM1jqq8h5A+TZv10eQfaIOjG5lRqOnTR2LyZ7lURf8w3iLwgRwnNgu8Idsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(6512007)(6666004)(2616005)(508600001)(5660300002)(83380400001)(44832011)(8936002)(6486002)(2906002)(31686004)(38100700002)(36756003)(8676002)(86362001)(316002)(66476007)(66946007)(4744005)(4326008)(66556008)(53546011)(6506007)(186003)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzd3M2EyeGhsdTRZL2UyNlc3V1llZng0aDVrQ2drYUw0a0xidnc4SHhsVDAx?=
 =?utf-8?B?NTQ5TzZITUJaUU5MS1JxYzU1aGdhOTNWY0h3Q3Z3d0tJMlhvZ1htT3RyU3Fx?=
 =?utf-8?B?NExjTTVJaU9CWGFzbkRjMmkvYzFXcEpKRU5NeDRGUXoxN1Rsdmwzb0k1QzE0?=
 =?utf-8?B?ZnpYQmNKOFZ4b1ZIWG9HbytYT2RNWFBFM2ZYazFvcGpMQlEzenpHTldjeTAx?=
 =?utf-8?B?RjBLRFRKb1ZoRysvMHpDdER1SitnLzAyNUg2Q0VsSEJDRlkxTk5KL1hqSUpY?=
 =?utf-8?B?OWNYR0tJWUpzZXpmWktUbjFqMXByaVFIV2ZsZzd2bHluUk9xS0ZtUzhoTjYr?=
 =?utf-8?B?Wm9YanhzQXpxVUo3QkY2Z1hqVjNORjRnYUgyV1dXVlhJVTBsV1FDVkcwZjkr?=
 =?utf-8?B?MitnRG44anNjbjNyTHB6QjZpcUdLV3JpcUZzK2RXa2FINERlZHJ3UFV3bURa?=
 =?utf-8?B?MEhEMXduRG52VlRRSE9CUER5ZEZFaHR3Wi9XSm1FaXQ5azdKOGpRUVV5RmxP?=
 =?utf-8?B?YitTUkdnTlBMUExBbTdJaVhPYTJtcTdFMGsyQlZ4MllFUDBMT3U5N2FVdnN1?=
 =?utf-8?B?TEljcE9kZGQ0SjNxQmtwcllFUVo3bXRKMnQ3eStpNkkwUnVoamo4TFAzRHdD?=
 =?utf-8?B?eFpyTjJFdno1SjVFdDRMUDF5M1JWekE1SUM0dWduZXRrUmZJY2VXS2xTZGsw?=
 =?utf-8?B?dzE4WERHQ05sQW5pbGJra2tTVFRHeWxDWnhKTzc3cklMUUpwODkxQU1pbGp4?=
 =?utf-8?B?QjBuODRUdDFaWmZueUhUd3lhMHI2SWsraXlHS3NtSFgreGxBZGJjMkpqNTN6?=
 =?utf-8?B?ZlFNNzlXZzRGMDdTalJMRkxGN29UVnU1bS9USWRkZTJPZFF0T3A3UEZrVDdF?=
 =?utf-8?B?NXFZeUE3aFM2YU9zRkZqejdMcUYxSnYvZ0UxeVM0bFdKQTNMR2NpbWRXVExP?=
 =?utf-8?B?K1lvSjFST0g4U2hlYmJaU0VESDdpaDBqbHd4QURkdDM2NHNyUy9aSWRXMmNJ?=
 =?utf-8?B?cWc0RXhQdUVVRU9vdllJYlBzb3JVZE5wUTc2S0I0dVRJNnBsM3Z6UzF5bnZn?=
 =?utf-8?B?anphUnhqZnRTNlFKb2NucUVWSWJpMGJOSS9OUmRWaloySXFwWkw2RjlHbWtM?=
 =?utf-8?B?bURrUStLc09IUWl0TURjL01jako2TTZFNEU3UVUydTYrNitmU3djSENwWDNh?=
 =?utf-8?B?aDhRQjJTRWxhUVM0b0QyOUE3RkVaZDFrK2RmWDU4TG1EWWFzSHUwRXJBaTB0?=
 =?utf-8?B?VFVCQU1XV0lDOWEzWTNGenZ5bXl3OERxM3hZc3NmNVpYUU5QazA5dHlaTkov?=
 =?utf-8?B?b0xieVdOVlcyUDlqSFd3TXMzV01HZW96cXJ6cFJxTFR4QkZIZEY0Z3hhbnE5?=
 =?utf-8?B?UWRCTUxKNDZVOWU1VW0wVEwvQ3RQN3JVSVlxN3JmYnVmVHZmL0Myb1BaaTZU?=
 =?utf-8?B?TnhVZFRRK1BYeWZhYUpyNUhqL2M4WjdxNGVNeGZmT2VrM0cralFhTWg4aTlQ?=
 =?utf-8?B?MHl4Ky9tUzlDRWVhbVNGVG9lOS9HQkNqbXJUSXR3TEFEcGRQa0xscGtMM1Br?=
 =?utf-8?B?S2ZIaHlHM3NLTW9ISkJzZkdzV05BRGJBZUU4ZmFYRU0rb2txK1FFbWZpZ3Bw?=
 =?utf-8?B?VHFGYUJhcHpuYWEybmR5OVExVXBWVE5wSm9mY3ZjREo3QjVuSlhZbVE5QnZY?=
 =?utf-8?B?Rkd2aVluTE9BRXRVLzM0K1dIRVJqQ1gxaUZiMEY2WjJ5K3FzdXZKU3V1M0x6?=
 =?utf-8?B?dkJRWnRmWkUrSlhVNWFBQzVmNkQ3dHFPTnE2bkpXM0J6RHJaeFIxSXpFNjZ0?=
 =?utf-8?B?c05VNFJOY0JSNEYzNHY1QzhJSlowRFA3bzZFUExCRmVZYVNzVHFMbkdVTEp1?=
 =?utf-8?B?RENCakZwTmdXcm9uSm5KQTNjY1pDQkFOUnU0QzJ6Q2RUSVhpNFpZcjl5akY4?=
 =?utf-8?B?UC9IQzdnMlZ5b041aUlRZk4xRFZNSUhydk55cENjWHZnei9EcGxWN2xNTkxl?=
 =?utf-8?B?TzdSeUpiK0VWS2JxY1Y0UEF4bUlSSDJIM0tRLzEwK0k4Y3VPTWxqZTdMSGN5?=
 =?utf-8?B?ZWN1Yzk4MmppUVpiMkZ2YjM4V1JwMm5RNlpKM09vR1kwUzc0STRqdlE0OWRp?=
 =?utf-8?B?MytGWEtoRnM1djk2d3YwcFNtU2dDWU9IMEIyNGhoVlgyeEwwZlRPRGUyT2N5?=
 =?utf-8?Q?aZCvTX3Fygo8SemRRa1mYdZIeZDLA+M0c7PvgbfOH03U?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c2a5ce-0adf-4516-54bd-08d9d49fde7f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 01:15:34.8661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uil3hNpQTNDVIlJUmIlhPFtyubt3NlELo0UzlTzHeup6Tn+QW5Y7oym4jrC8GgiwRZrqvcZlnGzTD1hsGYKr+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5486
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201110001
X-Proofpoint-GUID: 5xzyKOiXhhz2LzmUXjc4rGQqPOCey-6z
X-Proofpoint-ORIG-GUID: 5xzyKOiXhhz2LzmUXjc4rGQqPOCey-6z
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, pbonzini@redhat.com, rui.loura@oracle.com,
 adnan.misherfi@oracle.com, joe.jin@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

Thank you very much!

Dongli Zhang

On 12/10/21 6:16 AM, Dongli Zhang wrote:
> This patchset fixes the issue on passing 'host_status' to the guest kernel.
> 
> The 1st patch fixes the erroneous usage of req->host_status.
> 
> The 2nd patch is to pass the SCSI_HOST_ERROR to the guest kernel when the
> req->bus->info->fail() is not implemented. I do not add 'Fixes:' because I
> am not sure if to not pass SCSI_HOST_ERROR was on purpose, especially for
> security reason.
> 
> Thank you very much!
> 
> Dongli Zhang
> 
> 
> 

