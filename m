Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78473D91AA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 17:18:25 +0200 (CEST)
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8lKC-00014T-Ai
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 11:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m8lJ0-0000MV-C7
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:17:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m8lIw-0000Bh-AA
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:17:09 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SFClsW026750; Wed, 28 Jul 2021 15:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=JxsrdJL/wruvKPTZhWHwF6L9Tk4X049k0B0y9GeAzTE=;
 b=antc9nzgo/UvtVeLfdO098IQcu/AVX2ZU3E1zZvN8oq5kEbRHKG+ED1i6uaX6xpJy4KQ
 yg6VvBqh93HYaWcBNBWneuCTgAihmWpr/AOn0fTtErox2wnyLuKXLgu9e4wR7Wq1C2tx
 zf/ASzyrqRcmL7C891LvL8YXspRtp9o7q9IpCVxGvLCOcWB6CbcExC2MW39AkeLmGjiJ
 YVppHQmOfSL5wj231hukkZDlBaMhUHpr04ryzquMO9mOC69BPqqPYaNu25wqOGypk6fD
 GARM8vJFRY2afSrqnu69ba/n+TrlNtzj6oQiVnubiJiRpxiD2P8Sd/oi+socpbXPXYwD +Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=JxsrdJL/wruvKPTZhWHwF6L9Tk4X049k0B0y9GeAzTE=;
 b=h9vRAo3pIOa0WWQeJ83zYxncmhc4p86UZ46j2febKCii3KQMXQxRAvgL7vao7TdvXB2Y
 Rv7VcLjBtUlC4U04EJpgOxrUarv1ictX9HkT5zxxsxzJPzWIqCqsPc7Mi/yKm//b3cSK
 GTGF6wJwZDhxmE03w1yZSghtEBssOqCWKyCaWOgFxwbFzMv5ny3sZQ6Q2r55oZEnV02V
 DwA1zEkAh0y+oOr3/AThKo0YGlzrHm26EY78by6XmwmfWhPZXcWh4K3MFZNTPZvYORiL
 qdzqKB9nO9KfxjeeACJfSDcAnFtcuOgKColOGJNOFDj6gKdTe8WDpckHLnJIj9xxrGAG iQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a2jkfb28h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 15:17:01 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16SFAqt7032373;
 Wed, 28 Jul 2021 15:17:00 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by userp3020.oracle.com with ESMTP id 3a234xx95b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 15:17:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQ/n+MuAJhnZB9+fzxmn6XaDbRiU6G472i9gtTqZ8rUVL7JdUV0+YEsuhnqxfjKhv7Hc7MKit3bsUoIvf1g9Ns0lyul0niy6iBe0nxdy2EzmrtQIz1JqcSdFlfcbeJQhkU8uHNNan8VWa2JA919lw5kcH2T+86kjq+g5Es7iRXlLVDXmc7VgxB5suTOWclZfLm9kSHEkTyrsH/koFBFnTjuQYvnFS+ht9Xh4P9y5Q35/hk6J9XaDnGFnvUrWbTmOZUe9pscqZCMo12XoTyMb1A2OccUNvCKrnbYZ5bE78OnkEucLPwfX2vEblAGRVGwAj1UDXgjRuLHIUIpOwpbhMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxsrdJL/wruvKPTZhWHwF6L9Tk4X049k0B0y9GeAzTE=;
 b=G6ZGgOQj9soJOxn7SpPA01HAF6tDbnkuuY4+K8fhoAqqEz+LWtpZcF6A1iT4FMk3dPb9fXx0rWBkHDo1FK9DE9o0Kx+zSSdiXiJu3sNd9Q/Ee98einlZXRsm9+hYilKlmokt8OpyJL2Q0aVCJ/q6WowkGFT00qVy/b0uEaeFt1rEwxKjKwOIOAI0cUmNwiFSrSFSrL8EHFPR6IzOJZr32ALcOSTlXoyWEflahp9hXtmLjN0L14OcIMvLcl4Aw/U0roDJJ/TJbXgShM9GinstmJ4FBcNA5o8un38n6PngrQFzzmrVsTq+Z+skjg9jt0Q64ovZrb/lDaOtqme6Wi3bxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxsrdJL/wruvKPTZhWHwF6L9Tk4X049k0B0y9GeAzTE=;
 b=NDUmuQjoJ/ChR4sgXr+7pa2o7XAZCbwqpGaObpHHjWvWmmvX3LM91LjngRidJbBKv/5IjRGz1rNS8t5cRuta7VU39lL2pMroEJ684gEhTGh7QeUnj5IDvUSW4fPjTqRt6vk2NCcqf9TTHiWc6K2AmlRTvYDyoq46QxQtGHZ6ooI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Wed, 28 Jul
 2021 15:16:58 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5%5]) with mapi id 15.20.4373.020; Wed, 28 Jul 2021
 15:16:58 +0000
Subject: Re: [PATCH v5 02/10] ACPI ERST: specification for ERST support
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-3-git-send-email-eric.devolder@oracle.com>
 <CO1PR10MB453117598D1ED99EB0A7AA3B97019@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210719170244.7402e008@redhat.com>
 <c0b0a60a-bd4e-ef2c-d398-bef96d8731dc@oracle.com>
 <20210726120650.4bb9272f@redhat.com>
 <8631ab5a-943c-900d-ab45-973191cb1064@oracle.com>
 <20210727134523.086b3ed0@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <f1c13525-e359-67aa-f7d3-8feb6dfdd3bf@oracle.com>
Date: Wed, 28 Jul 2021 10:16:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210727134523.086b3ed0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0701CA0019.namprd07.prod.outlook.com
 (2603:10b6:803:28::29) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN4PR0701CA0019.namprd07.prod.outlook.com
 (2603:10b6:803:28::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 15:16:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 984fd81d-846e-485d-bb35-08d951dabcc6
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB56368D86544CDE007184839097EA9@CO6PR10MB5636.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CtUC1WGN1rCxxgF59oQcDtP60fK33sZQJ51AwoHKe72wdWOH55mYAPBRp/8w+V6APq8/sG7oL/PH2e0jOQPrK4nH2TCjML8dW+0igSxulPllWF8nNX6CtZrvq46vVNHCKGyImZfbhBZfHi//hpWEDC3B8dgYCrkaMxk/B9hv2Li1f0adiIhneGeS+ROeXVbl4CU95OhZ4NV4YO3I+LrtA/EK2agMZLJFAeZCGWPwdZkWHPbBxKtsjEgobqIFwN+YAtqJnhERqd6lHv9X1/j8VwaPaWwtwfE1PMieHs0cl/I3QZVwBeOQtjIA+TtxUzAuVdZJovuXiOL0upWSlOGwdxDPZ+YVN436nY9H1hViVES4yuB0PDzx0ZMOGMzKmCZ1gFx7DUiQ6jWxFplKAUmA9xIn4T/EqUYZjDRRfscMYIqjF+Bn1DvJEGxuoucjzfw38Bvbb2h9kNOZyAi2Z4IW1/eNtcBeldDrvBTM6qIjE6rRnpzfNbsGDKbCGb5zg4DBsHDwH1B4QCr6Rz1dxDoAXx4uzAAsnaR4M6VYdh+7aQ4vlsIIuezadpFq8Gaey9lke11j0JzqQaDlVy6853GPIdRgyRqT1OUl0pN2GdqfoI+Tr7Z2W+1AHqPBAVBHsK+Ek7+Q57nwJ4X/LLDV8jvyhwTlTqItzQF4ahQoMDC+m3/soD8on8VMP74dIKBgAwwahXKCIAjMd8LwCfBRl25LoD2T0q2Oxut2+2VgD7Of/tJAtuP9G3EtLJTWCMLhROMoc2fPkLTzCFsfLhPprvItJosl724EVN91kgRcqqJk4wJcZutARnwfAgPvp3ZLsOLh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39860400002)(346002)(366004)(54906003)(31696002)(316002)(5660300002)(4326008)(186003)(6486002)(8936002)(83380400001)(38100700002)(86362001)(478600001)(66476007)(66556008)(2616005)(45080400002)(6916009)(36756003)(53546011)(31686004)(30864003)(8676002)(66946007)(966005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWE5a3JIbVp5WnJWUzNFL3RTcTVPN2svSmEvWkViSkZPT2hoN1hNWEIyWHgw?=
 =?utf-8?B?R05nYVV0LzVZTHYwcEJndUFvVGZOV1RpZ2NyeXJNRSsra3h0bGRuamxTWGk5?=
 =?utf-8?B?MjBCUHJwMEFUWlozZXF3SVJYdVJDSWZJYlR6Y1Z1M2Mya2kxTmtmcktXVXd3?=
 =?utf-8?B?RVZuaHZhSnlEN3BBUTZyOEEvTjh6ZVBlYVNsQUFwKzZCNkVxSlNlVjFKQTBW?=
 =?utf-8?B?QnpuRHNCd05ZNEFyTktHbDlRaGV1MkZyczVtQ1FLck5rVE96TTVOQzZYRnZU?=
 =?utf-8?B?K2N1VTBDZGpLR2NJSm1LLzJzNUdnUmRTNFNQMHk0aDh5QlQ4cy9qWjNsMmx6?=
 =?utf-8?B?T1p0YzZOTlJNejhZNEdOZTBWcUpMblcyeGVTQldqTVdXb0VsUUdSbkM5NkFx?=
 =?utf-8?B?QXB6TzBPdDdyakg1ZWcxWlNTQ3M5dmE0OHdmZTZ1d0pOUWM0Q3BReHRSTWFz?=
 =?utf-8?B?WlM2aWZ6TzVNeGliMURHR2UxTithVlZKck9kUmZRT2p3SFByblZSQjZCTEVI?=
 =?utf-8?B?NXFNdk1CZ002ZjVySVhXOVB2cHUzQnZyWThML0xvNVlmejFrU0pkSncvUFdv?=
 =?utf-8?B?R0E1VGgxcGtNdzVyUTJTenJQL01kU0Rkck1MY1NEa2RkNHpJZndEbUV0L0hS?=
 =?utf-8?B?enFYdzIyN1RBNlg5NitlZHJpRWZ6cWh5ZHgzcmVveXhxaFRyaGFvVjl6VTlO?=
 =?utf-8?B?WnRFRzUvQUZvUFp2SmsrTFRlODZoZWdBNmY0OHhSR1hXdzBoUXlvZ1NtOHJN?=
 =?utf-8?B?bVExMlBUcU5KNHVWd3YzdDQ0MGpyNWpFdENKcHcyVmgwVUxjc1ZkM1FON0tO?=
 =?utf-8?B?NGdQZjZIVFdjczFFRlhVaGNlYU1oQkp1aytiSVc5RmF4ZUdmVEtiZGlFcHFt?=
 =?utf-8?B?LzlSYUxSVFRNUWdoN1RiMHRHTityUzFodFh2bTNCVmU1bldIRzFJaG9UQ1A4?=
 =?utf-8?B?NTZuZEhtaitPM01FZjZzZ00vVnhaT2JYU1BTK1N1VmZEMHBKUnFVbHc3NzU2?=
 =?utf-8?B?Z1I1VDVqUDVISktnb1dzVy9veHIxR3VVZUx4dGF2ZDlGSUlGYm9ORTd3bnds?=
 =?utf-8?B?Q3JNRWV4dE5XazR5SW1SNG9VYjhrS3hoWEF2REs0L3ptcm9YZmtPN2oveGIz?=
 =?utf-8?B?Y2ZZT1ZDZEpIaVVKTkRMTE9SbU00bWtwaHI2ZTAxaGtpcmNaS3JhSFhpeHdS?=
 =?utf-8?B?T2JnM1dqTUl3K1lLdk9BaGxnMllLaEplb0w1MVY3UC9OeFE5RVdRMGZWcUZi?=
 =?utf-8?B?NjJwYXdNZmhuUU9kbE9SMi9OYlR0RHFtTG4xSkRJOGR5V1hWVk5FbEg3d29K?=
 =?utf-8?B?SU15MFlNU2JWUm4xaWJWdkpyTjhuejFrMjNPcW5JVVc2N05hamoxZEpHb1NL?=
 =?utf-8?B?VTlvbjc5cFA1Y3E4cXlUaHl3dFArR1F6TWJHOHNuR3o2NTJ5Q1YveXUxZHE3?=
 =?utf-8?B?M3gxWXdDQXE3R0p1RlVlTVI4N1BWeENwSElXcXpBN1NkMjNtRmZuMmQyT2xJ?=
 =?utf-8?B?RFQwN3RCeWF1VEdRbHVqUDJ6SVBueDBtRHlxL1M1MmdJVVVJWTFwemlocndu?=
 =?utf-8?B?dHFSU3dyTFlMTFFqa2YwWms4M05FWm5PVDRSZmY3Y2NPcGN4VXVrYnFuOHQ0?=
 =?utf-8?B?Mk4ydVk0YVdKaEh2M2dpbUxzK1JKaU1EcDRLdkZHTlNJbGVpQS9CZnMzWkhy?=
 =?utf-8?B?bnBrSEh0R2tGeXZzMkdIdThZTFRHYnlGSUNQU0dIWG5sSzhDbFJubytHMWZm?=
 =?utf-8?B?T1JUNEEwbDN5bVEzaldYZERZNjJ0LzZmRnYwOC9Ra0VDZ1RkcFRZakZJRGs2?=
 =?utf-8?B?cnNXVG5YR21HdFJNb2ttdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984fd81d-846e-485d-bb35-08d951dabcc6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 15:16:58.3201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVm0sqO2TFa4v35mep4ItVE83RgfSfMxANCH2T6DdVNMUjiAgzFFHDrYNQiNX0F0aDxoxC/ozZaOe8acAHmxfVcMD3Fx5a44gtKkveDQvB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5636
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10059
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280085
X-Proofpoint-GUID: RxIhCvt_0oYNZjgqfxlhBexJkQHEKDAn
X-Proofpoint-ORIG-GUID: RxIhCvt_0oYNZjgqfxlhBexJkQHEKDAn
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Eric Blake <eblake@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/27/21 6:45 AM, Igor Mammedov wrote:
> On Mon, 26 Jul 2021 14:52:15 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> On 7/26/21 5:06 AM, Igor Mammedov wrote:
>>> On Wed, 21 Jul 2021 10:42:33 -0500
>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>    
>>>> On 7/19/21 10:02 AM, Igor Mammedov wrote:
>>>>> On Wed, 30 Jun 2021 19:26:39 +0000
>>>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>>>       
>>>>>> Oops, at the end of the 4th paragraph, I meant to state that "Linux does not support the NVRAM mode."
>>>>>> rather than "non-NVRAM mode", which contradicts everything I stated prior.
>>>>>> Eric.
>>>>>> ________________________________
>>>>>> From: Eric DeVolder <eric.devolder@oracle.com>
>>>>>> Sent: Wednesday, June 30, 2021 2:07 PM
>>>>>> To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
>>>>>> Cc: mst@redhat.com <mst@redhat.com>; imammedo@redhat.com <imammedo@redhat.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>>>>> Subject: [PATCH v5 02/10] ACPI ERST: specification for ERST support
>>>>>>
>>>>>> Information on the implementation of the ACPI ERST support.
>>>>>>
>>>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>>>> ---
>>>>>>     docs/specs/acpi_erst.txt | 152 +++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 152 insertions(+)
>>>>>>     create mode 100644 docs/specs/acpi_erst.txt
>>>>>>
>>>>>> diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
>>>>>> new file mode 100644
>>>>>> index 0000000..79f8eb9
>>>>>> --- /dev/null
>>>>>> +++ b/docs/specs/acpi_erst.txt
>>>>>> @@ -0,0 +1,152 @@
>>>>>> +ACPI ERST DEVICE
>>>>>> +================
>>>>>> +
>>>>>> +The ACPI ERST device is utilized to support the ACPI Error Record
>>>>>> +Serialization Table, ERST, functionality. The functionality is
>>>>>> +designed for storing error records in persistent storage for
>>>>>> +future reference/debugging.
>>>>>> +
>>>>>> +The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
>>>>>> +(APEI)", and specifically subsection "Error Serialization", outlines
>>>>>> +a method for storing error records into persistent storage.
>>>>>> +
>>>>>> +The format of error records is described in the UEFI specification[2],
>>>>>> +in Appendix N "Common Platform Error Record".
>>>>>> +
>>>>>> +While the ACPI specification allows for an NVRAM "mode" (see
>>>>>> +GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
>>>>>> +directly exposed for direct access by the OS/guest, this implements
>>>>>> +the non-NVRAM "mode". This non-NVRAM "mode" is what is implemented
>>>>>> +by most BIOS (since flash memory requires programming operations
>>>>>> +in order to update its contents). Furthermore, as of the time of this
>>>>>> +writing, Linux does not support the non-NVRAM "mode".
>>>>>
>>>>> shouldn't it be s/non-NVRAM/NVRAM/ ?
>>>>
>>>> Yes, it has been corrected.
>>>>   
>>>>>       
>>>>>> +
>>>>>> +
>>>>>> +Background/Motivation
>>>>>> +---------------------
>>>>>> +Linux uses the persistent storage filesystem, pstore, to record
>>>>>> +information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
>>>>>> +independent of, and runs before, kdump.  In certain scenarios (ie.
>>>>>> +hosts/guests with root filesystems on NFS/iSCSI where networking
>>>>>> +software and/or hardware fails), pstore may contain the only
>>>>>> +information available for post-mortem debugging.
>>>>>
>>>>> well,
>>>>> it's not the only way, one can use existing pvpanic device to notify
>>>>> mgmt layer about crash and mgmt layer can take appropriate measures
>>>>> to for post-mortem debugging, including dumping guest state,
>>>>> which is superior to anything pstore can offer as VM is still exists
>>>>> and mgmt layer can inspect VMs crashed state directly or dump
>>>>> necessary parts of it.
>>>>>
>>>>> So ERST shouldn't be portrayed as the only way here but rather
>>>>> as limited alternative to pvpanic in regards to post-mortem debugging
>>>>> (it's the only way only on bare-metal).
>>>>>
>>>>> It would be better to describe here other use-cases you've mentioned
>>>>> in earlier reviews, that justify adding alternative to pvpanic.
>>>>
>>>> I'm not sure how I would change this. I do say "may contain", which means it
>>>> is not the only way. Pvpanic is a way to notify the mgmt layer/host, but
>>>> this is a method solely with the guest. Each serves a different purpose;
>>>> plugs a different hole.
>>>>   
>>>
>>> I'd suggest edit  "pstore may contain the only information" as "pstore may contain information"
>>>    
>> Done
>>
>>>> As noted in a separate message, my company has intentions of storing other
>>>> data in ERST beyond panics.
>>> perhaps add your use cases here as well.
>>>    
>>>    
>>>>>> +Two common storage backends for the pstore filesystem are ACPI ERST
>>>>>> +and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in
>>>>>> +all guests. With QEMU supporting ACPI ERST, it becomes a viable
>>>>>> +pstore storage backend for virtual machines (as it is now for
>>>>>> +bare metal machines).
>>>>>> +
>>>>>       
>>>>>> +Enabling support for ACPI ERST facilitates a consistent method to
>>>>>> +capture kernel panic information in a wide range of guests: from
>>>>>> +resource-constrained microvms to very large guests, and in
>>>>>> +particular, in direct-boot environments (which would lack UEFI
>>>>>> +run-time services).
>>>>> this hunk probably not necessary
>>>>>       
>>>>>> +
>>>>>> +Note that Microsoft Windows also utilizes the ACPI ERST for certain
>>>>>> +crash information, if available.
>>>>> a pointer to a relevant source would be helpful here.
>>>>
>>>> I've included the reference, here for your benefit.
>>>> Windows Hardware Error Architecutre, specifically Persistence Mechanism
>>>> https://docs.microsoft.com/en-us/windows-hardware/drivers/whea/error-record-persistence-mechanism
>>>>   
>>>>>       
>>>>>> +Invocation
>>>>> s/^^/Configuration|Usage/
>>>>
>>>> Corrected
>>>>   
>>>>>       
>>>>>> +----------
>>>>>> +
>>>>>> +To utilize ACPI ERST, a memory-backend-file object and acpi-erst
>>>>> s/utilize/use/
>>>>
>>>> Corrected
>>>>   
>>>>>       
>>>>>> +device must be created, for example:
>>>>> s/must/can/
>>>>
>>>> Corrected
>>>>   
>>>>>       
>>>>>> +
>>>>>> + qemu ...
>>>>>> + -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,
>>>>>> +  size=0x10000,share=on
>>>>> I'd put ^^^ on the same line as -object and use '\' at the end the
>>>>> so example could be easily copy-pasted
>>>>
>>>> Corrected
>>>>   
>>>>>       
>>>>>> + -device acpi-erst,memdev=erstnvram
>>>>>> +
>>>>>> +For proper operation, the ACPI ERST device needs a memory-backend-file
>>>>>> +object with the following parameters:
>>>>>> +
>>>>>> + - id: The id of the memory-backend-file object is used to associate
>>>>>> +   this memory with the acpi-erst device.
>>>>>> + - size: The size of the ACPI ERST backing storage. This parameter is
>>>>>> +   required.
>>>>>> + - mem-path: The location of the ACPI ERST backing storage file. This
>>>>>> +   parameter is also required.
>>>>>> + - share: The share=on parameter is required so that updates to the
>>>>>> +   ERST back store are written to the file immediately as well. Without
>>>>>> +   it, updates the the backing file are unpredictable and may not
>>>>>> +   properly persist (eg. if qemu should crash).
>>>>>
>>>>> mmap manpage says:
>>>>>      MAP_SHARED
>>>>>                 Updates to the mapping ... are carried through to the underlying file.
>>>>> it doesn't guarantee 'written to the file immediately', though.
>>>>> So I'd rephrase it to something like that:
>>>>>
>>>>> - share: The share=on parameter is required so that updates to the ERST back store
>>>>>             are written back to the file.
>>>>
>>>> Corrected
>>>>   
>>>>>       
>>>>>> +
>>>>>> +The ACPI ERST device is a simple PCI device, and requires this one
>>>>>> +parameter:
>>>>> s/^.*:/and ERST device:/
>>>>
>>>> Corrected
>>>>   
>>>>>       
>>>>>> +
>>>>>> + - memdev: Is the object id of the memory-backend-file.
>>>>>> +
>>>>>> +
>>>>>> +PCI Interface
>>>>>> +-------------
>>>>>> +
>>>>>> +The ERST device is a PCI device with two BARs, one for accessing
>>>>>> +the programming registers, and the other for accessing the
>>>>>> +record exchange buffer.
>>>>>> +
>>>>>> +BAR0 contains the programming interface consisting of just two
>>>>>> +64-bit registers. The two registers are an ACTION (cmd) and a
>>>>>> +VALUE (data). All ERST actions/operations/side effects happen
>>>>> s/consisting of... All ERST/consisting of ACTION and VALUE 64-bit registers. All ERST/
>>>>
>>>> Corrected
>>>>   
>>>>>       
>>>>>> +on the write to the ACTION, by design. Thus any data needed
>>>>> s/Thus//
>>>> Corrected
>>>>   
>>>>>       
>>>>>> +by the action must be placed into VALUE prior to writing
>>>>>> +ACTION. Reading the VALUE simply returns the register contents,
>>>>>> +which can be updated by a previous ACTION.
>>>>>       
>>>>>> This behavior is
>>>>>> +encoded in the ACPI ERST table generated by QEMU.
>>>>> it's too vague, Either drop sentence or add a reference to relevant place in spec.
>>>> Corrected
>>>>   
>>>>>
>>>>>       
>>>>>> +
>>>>>> +BAR1 contains the record exchange buffer, and the size of this
>>>>>> +buffer sets the maximum record size. This record exchange
>>>>>> +buffer size is 8KiB.
>>>>> s/^^^/
>>>>> BAR1 contains the 8KiB record exchange buffer, which is the implemented maximum record size limit.
>>>> Corrected
>>>>   
>>>>>
>>>>>       
>>>>>> +Backing File
>>>>>
>>>>> s/^^^/Backing Storage Format/
>>>> Corrected
>>>>   
>>>>>       
>>>>>> +------------
>>>>>
>>>>>       
>>>>>> +
>>>>>> +The ACPI ERST persistent storage is contained within a single backing
>>>>>> +file. The size and location of the backing file is specified upon
>>>>>> +QEMU startup of the ACPI ERST device.
>>>>>
>>>>> I'd drop above paragraph and describe file format here,
>>>>> ultimately used backend doesn't have to be a file. For
>>>>> example if user doesn't need it persist over QEMU restarts,
>>>>> ram backend could be used, guest will still be able to see
>>>>> it's own crash log after guest is reboot, or it could be
>>>>> memfd backend passed to QEMU by mgmt layer.
>>>> Dropped
>>>>   
>>>>>
>>>>>       
>>>>>> +Records are stored in the backing file in a simple fashion.
>>>>> s/backing file/backend storage/
>>>>> ditto for other occurrences
>>>> Corrected
>>>>   
>>>>>       
>>>>>> +The backing file is essentially divided into fixed size
>>>>>> +"slots", ERST_RECORD_SIZE in length, with each "slot"
>>>>>> +storing a single record.
>>>>>       
>>>>>> No attempt at optimizing storage
>>>>>> +through compression, compaction, etc is attempted.
>>>>> s/^^^//
>>>>
>>>> I'd like to keep this statement. It is there because in a number of
>>>> hardware BIOS I tested, these kinds of features lead to bugs in the
>>>> ERST support.
>>> this doc it's not about issues in other BIOSes, it's about conrete
>>> QEMU impl. So sentence starting with "No attempt" is not relevant here at all.
>> Dropped
>>
>>>       
>>>>>> +NOTE that any change to this value will make any pre-
>>>>>> +existing backing files, not of the same ERST_RECORD_SIZE,
>>>>>> +unusable to the guest.
>>>>> when that can happen, can we detect it and error out?
>>>> I've dropped this statement. That value is hard coded, and not a
>>>> parameter, so there is no simple way to change it. This comment
>>>> does exist next to the ERST_RECORD_SIZE declaration in the code.
>>>
>>> It's not a problem with current impl. but rather with possible
>>> future expansion.
>>>
>>> If you'd add a header with record size at the start of storage,
>>> it wouldn't be issue as ERST would be able to get used record
>>> size for storage. That will help with avoiding compat issues
>>> later on.
>> I'll go ahead and add the header. I'll put the magic and record size in there,
>> but I do not intend to put any data that would be "cached" from the records
>> themselves. So no recordids, in particular, will be cached in this header.
> maybe also add offset of the 1st slot, so however comes later
> to fix performance issues will have less compatibility issues.
Done

> 
>>
>> I'm not even sure I want to record/cache the number of records because:
>>    - it has almost no use (undermined by the fact overall storage size is not exposed, imho)
>>    - we backed off requiring the share=on, so it is conceivable this header value could
>>      encounter data integrity issues, should a guest crash...
> guest crash won't affect data,  and if backend is not shared then,
> data won't be persistently stored anyways, they will live only for
> lifetime of QEMU instance.
> The only time where integrity is affected is host crash and we already
> agreed that we don't care about this case.
See further below

> 
>>    - scans still happen (see next)
>>
>> While having it (number of records cached in header) would avoid a startup scan
>> to compute it, the write operation requires a scan to determine if the incoming
>> recordid is present or not, in order to determine overwrite or allocate-and-write.
> if present/non present per slot status is cached, you don't have to do
> expensive full scan when guest scans slots.
Done

> 
>> And typically the first operation that Linux does is effectively a scan to
>> populate the /sys/fs/pstore entries via the GET_RECORD_IDENTIFIER action.
>>
>> And the typical size of the ERST storage [on hardware systems] is 64 to 128KiB;
>> so not much storage to examine, especially since only looking at 12 bytes of each
>> 8KiB record.
>>
>> I'd still be in favor of putting an upper bound on the hostmem object, to avoid
>> your worst case fears...
> 
> Considering device is not present by default, I give up on
> trying to convince you to design it efficiently.
> 
> If one would wish to use this with container like workloads
> where fast startup matters, one would have to live with crappy
> performance or rewrite your impl.

I've embraced your assurance of no data integrity issues, and have changed
the implementation to include a header that also tracks/caches the record_ids.
This eliminates all scanning of the entire backend storage.
My original goal was to offer ERST as BIOS do, so backend storage size of about
64 to 128KiB; where the current implementation would be just fine.
But I did mention that we were looking to do more with ERST, and
the backend storage can be quite large, so you are right to push for
better implementation.


> 
>>>>>> +Below is an example layout of the backing store file.
>>>>>> +The size of the file is a multiple of ERST_RECORD_SIZE,
>>>>>> +and contains N number of "slots" to store records. The
>>>>>> +example below shows two records (in CPER format) in the
>>>>>> +backing file, while the remaining slots are empty/
>>>>>> +available.
>>>>>> +
>>>>>> + Slot   Record
>>>>>> +        +--------------------------------------------+
>>>>>> +    0   | empty/available                            |
>>>>>> +        +--------------------------------------------+
>>>>>> +    1   | CPER                                       |
>>>>>> +        +--------------------------------------------+
>>>>>> +    2   | CPER                                       |
>>>>>> +        +--------------------------------------------+
>>>>>> +  ...   |                                            |
>>>>>> +        +--------------------------------------------+
>>>>>> +    N   | empty/available                            |
>>>>>> +        +--------------------------------------------+
>>>>>> +        <-------------- ERST_RECORD_SIZE ------------>
>>>>>
>>>>>       
>>>>>> +Not all slots need to be occupied, and they need not be
>>>>>> +occupied in a contiguous fashion. The ability to clear/erase
>>>>>> +specific records allows for the formation of unoccupied
>>>>>> +slots.
>>>>> I'd drop this as not necessary
>>>>
>>>> I'd like to keep this statement. Again, several BIOS on which I tested
>>>> ERST had bugs around non-contiguous record storage.
>>>
>>> I'd drop this and alter sentence above ending with " in a simple fashion."
>>> to describe sparse usage of storage and then after that comes example diagram.
>> Done
>>
>>>
>>> I'd like this part to start with unambiguous concise description of
>>> format and to be finished with example diagram.
>>> It is the part that will be considered as the the only true source
>>> how file should be formatted, when it comes to fixing bugs or
>>> modifying original impl. later on. So it's important to have clear
>>> description without any unnecessary information here.
>> Done
>>
>>>
>>>    
>>>>>
>>>>>       
>>>>>> +
>>>>>> +
>>>>>> +References
>>>>>> +----------
>>>>>> +
>>>>>> +[1] "Advanced Configuration and Power Interface Specification",
>>>>>> +    version 4.0, June 2009.
>>>>>> +
>>>>>> +[2] "Unified Extensible Firmware Interface Specification",
>>>>>> +    version 2.1, October 2008.
>>>>>> +
>>>>>> --
>>>>>> 1.8.3.1
>>>>>>      
>>>>>       
>>>>   
>>>    
>>
> 

