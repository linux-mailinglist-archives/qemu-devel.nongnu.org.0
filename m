Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13A3E095C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 22:29:22 +0200 (CEST)
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBNVx-000054-JR
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 16:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mBNUd-0007qS-5R
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:27:59 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mBNUb-0001LW-EH
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:27:58 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174KOT8s028893; Wed, 4 Aug 2021 20:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=iwN4gE2aodXxa6JOpv2Zx4CNotg+j9P6u3M/hLB5/D8=;
 b=zE7DTWWgtF8eSBV6x7yR1R72NEtWLz7oArpZBiawiJYdI0qNCwlAI796Y2MPcWj21vC8
 vsvSYt0sqQWFWIgk2e66Wp9uOLYA77lG812ZITUXier3sCjO12oljCYOI2VnPeOYxPhE
 JuOuvYTOkZbV6+z3jxioelRt3BwlACjvnwEqwMBia610nGg9NuInphs1Yh9cnF4TsRRp
 izQoZ1DQA6uW+cfjoeBcrlKLSdx45RMe5i/foiwquKj8mavcskT/4+jbxwAORhempKih
 WIzQ4CtKU4DWfw2sw/288hnGZEinopSfMYLDAX68fijhmkG+cxsMbjF8C5MNoLkvlaHT /g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=iwN4gE2aodXxa6JOpv2Zx4CNotg+j9P6u3M/hLB5/D8=;
 b=MYrs9VMN/cW83xrf7Gu/NY+th9kaANZoJlOR3eJSU3DVyITQe11qrMfsDbUAngcDAEm+
 uv1Hq3d3ltvcngm0Qbep+fAQ7SIOBEMCc6lEXKFI9LTS2bLaVWXGdkdlNyC2OsbxRdwb
 MOSLvwc67gz3hQ2I4nicFOCORZ8c6UnpnGvWaXGHwn7zWoB2RAcUoQLckmlJzRHJOdk9
 mGEFDRxb2LzfzB78ne0AC2H8d1NTDZgarPiP2uAJWf/dmX1jJGzSVz/z9CLCWWXpGJjA
 frzaX/fNa+vEXygvrC6p7BoNeGy0u5FPBDx0NkpKwLkO5LqNAIW/tWVabY+lE7JVSnaq lw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7wqv0my2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 20:27:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 174KLXgI086928;
 Wed, 4 Aug 2021 20:27:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by userp3030.oracle.com with ESMTP id 3a4un2cfg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 20:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By1dQbj3JZr5IuuO8TDt44DIswuHD7v6cPBWPibFj4rGijHmXQpVFKJdMxhY8Pifncm6l5m6QP/gNrBw2wpXsBBLG3b92IXnj7G8ojgjtiiZqp8ThIE8LuUl+IuxVenb61u8+oMowXa1U3paz/IQcJ+REGVcFhIQcEbFV7WFA+2VKaSE+E5zGSZ//1xgiT5Mmu3wRZb3ZIbP8F610ot8yBlY+nE9KPOmkX+6O7aS8WiukmkX8AlHuxbLZ0dkGWWSI5e6UYqKp2/E+j5WRr7+DNJZa50DNa/QGGKW5LCNSXzRKvuzkEM/IDeLPe29cwPVxBXEa8DT13mU7C3e1GirpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwN4gE2aodXxa6JOpv2Zx4CNotg+j9P6u3M/hLB5/D8=;
 b=nsw0l4/XPSzPRZ+xV37O0SiWU6w1EmKsEU4HBrnIqfzdV9qKbnZ34yyCmYxWe7N1tnPeCHTKMnSy24NOKr4Mff11wTFZQpc/Z17KCcgc6liw652OMaDYIqfJZXNPritZghYSMkhCHtniTU9S6YJ2VK2BQnqMoDY0NX7Vg8N2yIje0H8aOaKw1eGKdvR9dLkSdMAvlFxx16gWQLTfgOZexHuEJH8N5GWM+CqlmS0WYko0n23AFECdDvDIM3cgrm1rQDISO+KDqr/Ot9ZWKRosgvhX8HRyhxy2R5hplL2d+o61NDgKJ24vcYawaSs153jjz9NKRVYU2UuRF1X538qTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwN4gE2aodXxa6JOpv2Zx4CNotg+j9P6u3M/hLB5/D8=;
 b=ieLyWhXt3ACWLUtgprqwL1fWslJbcXmjg0eOw7b7JJZSzRuBr6dOu8/RUx9MNx7lWufYCfctBHocyhsaw8H61LSqB+MYm/bU5VR4LiH8DS7ipEFA6avAM0mpU8RNq0BFSxri+IV0HlH2MYwsbdOVWAe6gUQkGYMN9t+f/Ekim+w=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3429.namprd10.prod.outlook.com (2603:10b6:a03:81::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 20:27:50 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 20:27:50 +0000
Subject: Re: [PATCH V5 03/25] cpr: QMP interfaces for reboot
To: Eric Blake <eblake@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-4-git-send-email-steven.sistare@oracle.com>
 <20210804154823.xr75z5u65nk7oufg@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <ceea719f-1c09-0c37-0627-d543bb07e823@oracle.com>
Date: Wed, 4 Aug 2021 16:27:45 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210804154823.xr75z5u65nk7oufg@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:806:121::18) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.21] (73.219.99.178) by
 SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Wed, 4 Aug 2021 20:27:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f55dd70-0962-4545-c297-08d95786544c
X-MS-TrafficTypeDiagnostic: BYAPR10MB3429:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB34297E3787864A549097EA29F9F19@BYAPR10MB3429.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /24Nh3FT9eE5Dsv2eSyq5WlZPbGT2yzXR1yzwEyA4/kir7EN/QB0E99aulTfj8PhASGWtYQHn7EvgvX2zbJ4TFo0y1M4EIlNcURFpRH7yT8JTyQ24S+PPOWee1SSfQsAmX7M3/MvFPguajjWGK2fqRuSKaiuPgxwbvgBDKpsnEMGFilqwGm+LufGu9omlu9yxrTu/ELEb/s7x6O79svD6D7tENUg+bSYzQ52Xej6wxnBvaD3avk3Jgl/gfWLW0xmIxVJiFF0vjitA4w+y30XrUMkFdiQ79Fz6mgDlEwrWn0qF/OtvZgLKcNeK8Q34NLdT3KjewwTfq4Lth+C+b7CQwc0uypBAi43NSoikLVAcC6fDVTWANxUXQCx4hCjAzpgT5v04mDNt1O7ovCf/Cc0E9Fe2blcU2K3I4GIZGk48E6EHexvdC/UVs/L2AiDcWC3m+VtvAyl9wjR+wbaajGWfkyBNFliAonx9Q/LoNemggoVWoVmWYovZEOO0Z0+p/SlJQ4Bs40Pz7HeoTbWgmcIPzykwC5GmEqestbRRDtNB12oCOIHuQZ9lHGDmmgag7ylx3ale0cdSGrtqXzA7ufjxrF5wWZuF8MvALxywGK0Iw4chwdaBHONN6azxYmsfnOF1fHjlR787OIA3BZRxIjNW8XdazM6x3KdZFZyiuVO5drpRdVdsWr4Oas2CnaRGaJXRBxJQAwZfro7Xhj/EQn0byu7QBf+xJPNHXiDfudPZBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(36916002)(316002)(38100700002)(16576012)(86362001)(4326008)(54906003)(6916009)(6666004)(107886003)(478600001)(7416002)(8676002)(53546011)(36756003)(66946007)(956004)(2616005)(186003)(26005)(66476007)(5660300002)(66556008)(31696002)(44832011)(8936002)(31686004)(2906002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tjh0S2xPd21GMWV3VklQR2JuTlpqeTVFdUdIY1lIRU5PMEpiOVJkcXRzaEdF?=
 =?utf-8?B?NGRuMStHbkdHM3BOTlZ6TXZPQ2RCanpxUzBuRVhsYlUyQTRpNjFieEJ2VGVx?=
 =?utf-8?B?djMxMTZtRktqZzlsYUhxZURTMElMQzJCSmY3K0RnV1hjZ2MyUFE5cU1VN1VC?=
 =?utf-8?B?eDVJdUplYUlqajRrNi90RjVkN3hMdXlBMHU4aGNnVTZsTXdNZWtqTFN5Rlgy?=
 =?utf-8?B?aHZTU3g1OGppR25BRkVUUlRCQkxwK21UMCtNWUFscVVvUHAvVUxoK0RGNVpj?=
 =?utf-8?B?NFZOQ1Y4d2hIajdPaDQwY2NQVVZXUG9wdTFLY0YvZUp3bDVxMUhPeEJQd0x6?=
 =?utf-8?B?L1VXdzVvZlk0cVlvSCthbVJKV2NveHJPNzR5dEVSdWthZVRpVDFweGZNZGNa?=
 =?utf-8?B?Tlg3VGtUVC9tMWlPdnpGK05WMTBMVDRaMzZidC9ocS8yMm9FR2dSaFZUbmNn?=
 =?utf-8?B?TXFGMXJ6bzRZK29tV1Rqcm1aRmwrNzlDVUQ5WWI2WUVMQjcvY1ZrSUd1anlq?=
 =?utf-8?B?dHkyVjRrdWFjLzZKT2Y3Q0oyR2pCOXFGeGZ0SUF5NER1clVwR044aUx1WkRh?=
 =?utf-8?B?Njc1dHd5aStPYkxuZS9LMzFDYW85M1pLMlJHdGQrSlZOQXZTdGJZWm1uRGlQ?=
 =?utf-8?B?WVppa2FLUENWQjg5dXA4UzBOWG9mR1dETW03cERweHk1bTYzODNQb0hOZTBn?=
 =?utf-8?B?bWZhOTJBNVJDd3hXWEhHOFpSSkhrRlp0VS95TDFiNUZMSUUraWJNNEtWb09h?=
 =?utf-8?B?MVlyR1ZEbmNNRFdQQmFhalFvaVZCd1AvaHZoY2dhcE02Uk1CY3gxTU5wOHVX?=
 =?utf-8?B?bm5LdDRHK1JmSTNnYmlUQXpZdGxCTWtTdHQ4ZC9MbHkvQnBDTWxWd1BrTnFQ?=
 =?utf-8?B?aldoZjM5NlE4b1RGbVd3aEcwWFJteHFxRkY1ckNGbmVMd2N4ZEJNYk9aOURF?=
 =?utf-8?B?eEF4UXFYZkhjejExOXNnaFB4Q1owSk9ack5jY2Nxa09hRTNTKyttL0xnaXJt?=
 =?utf-8?B?c0RROGNSMFpoK1dMNXE2dldiTFIxLy8rL2tWTVBQaXcydHR2ZUZqNnd2OTVY?=
 =?utf-8?B?eFIzekFiWFA3Nmw0VVU3YytFRHVSa0ZvYXZEUmtnTWlqaDdSQ05rRHR5Nis4?=
 =?utf-8?B?bmw5WkdWZ1Y2TUlienQ1VTFtdEVMQWx4TXBRc3ZvbUVuS3BFYWpubUQxTG9X?=
 =?utf-8?B?MWJtMmFFODAyUUR1bjdqN3dQaE85azRpcUJkTnRTVjhjc05wK0taMWVDMEdn?=
 =?utf-8?B?ZzR3YUpwVFUxdmQzTkpKTGtIWEFmS3U2bUFZT2h6U2d6b01hWUZ3YWZiOWF6?=
 =?utf-8?B?eDZCRlRjQTRCaHVocm1zS0xlb2pFZy9NaEdOZG03NDFabmZ2Y0RPMU9MRmJw?=
 =?utf-8?B?c0tFSFhadFN0eUVwSUVvSjNCNW1lKzRmK3FwNkJNblQvTCtTUlE1TG41QTFQ?=
 =?utf-8?B?QjBWWmp2elJHOTJ0ZHl4cUN6eXNRZjhSTkdiUVJKWmZEOEgzUDJaajZ1ZDhP?=
 =?utf-8?B?M3NMdktnRE9EUUdlVmRFcy9OT0hjZTBNd1U5ZXkreHo1cTNySEdpUk9FQ1U2?=
 =?utf-8?B?Qmprcmk2dHd1WDVqTjQ1VnNHUnlBaGFIT1E4RUdCbmcvcjA3MHQvd214TWNY?=
 =?utf-8?B?eitBVTI4UTRWay9nU1B2aDNKTEhCWURDMjZuamUvdlpwcElwOWZNd2xiTHlo?=
 =?utf-8?B?dFo5SWxlQnpIaHAzc2RVcWg0SjhiY1hmVUJSVEFrVmhPek43Vk9VV0lqbEZv?=
 =?utf-8?Q?KLAbPaJWPBoON4hhokhR3Y802Po2zQxa2mxmuL0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f55dd70-0962-4545-c297-08d95786544c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 20:27:50.3395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KsvUaXglR/Z9jO3Yq60coduIB+fk8XSdlA8RTJbLeYuchEPsvhPGMcm1Z6MGr451jja/vcaKxsXonS3v2TWXMgVGeD3hKzX0znKV33AQMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3429
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10066
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040124
X-Proofpoint-GUID: 6PU_cjzGwMoyBbQSO-OYjRw2nfCWt4kJ
X-Proofpoint-ORIG-GUID: 6PU_cjzGwMoyBbQSO-OYjRw2nfCWt4kJ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/2021 11:48 AM, Eric Blake wrote:
> On Wed, Jul 07, 2021 at 10:20:12AM -0700, Steve Sistare wrote:
>> cprsave calls cprsave().  Syntax:
>>   { 'enum': 'CprMode', 'data': [ 'reboot' ] }
>>   { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'CprMode' } }
>>
>> cprload calls cprload().  Syntax:
>>   { 'command': 'cprload', 'data': { 'file': 'str' } }
> 
> Does this also allow the magic "/dev/fdset/NNN" syntax for opening an
> fd already passed in previously?
> /me goes back to patch 2 to check
> Yes, it looks like it should.
> 
>>
>> cprinfo returns a list of supported modes.  Syntax:
>>   { 'struct': 'CprInfo', 'data': { 'modes': [ 'CprMode' ] } }
>>   { 'command': 'cprinfo', 'returns': 'CprInfo' }
> 
> As pointed out elsewhere, relying on introspection seems nicer than
> adding this command.
> 
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
> 
>> +++ b/qapi/cpr.json
>> @@ -0,0 +1,74 @@
>> +# -*- Mode: Python -*-
>> +#
>> +# Copyright (c) 2021 Oracle and/or its affiliates.
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2.
>> +# See the COPYING file in the top-level directory.
>> +
>> +##
>> +# = CPR
> 
> Might be worth expanding what this acronym stands for here.> 
>> +##
>> +
>> +{ 'include': 'common.json' }
>> +
>> +##
>> +# @CprMode:
>> +#
>> +# @reboot: checkpoint can be cprload'ed after a host kexec reboot.
>> +#
>> +# Since: 6.1
> 
> As this missed 6.1, you'll need to (eventually) rebase the series to
> mention 6.2 everywhere.

Will do for both. (Marc-Andre also asked).  And I'll fix the indentation problem in patch 2.

- Steve

