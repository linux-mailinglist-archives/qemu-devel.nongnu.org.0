Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB7B3D67E3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 22:08:32 +0200 (CEST)
Received: from localhost ([::1]:39948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86tr-0001KC-Dd
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 16:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86sR-0007uL-2B
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:07:03 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86sO-0005nw-CV
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:07:02 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16QK1dxZ003074; Mon, 26 Jul 2021 20:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ckZPYeu6wE8+I1ef3rFtTs4mcN61PixmmgYGdIX5sv0=;
 b=lIYe6+jzrwMEHGNQ4Av8JPZYPIU/Lf03UkL2opDCq1Ey/wCgGgAT0MhUVM3Zy8gX45XT
 YNtjY03gGdvOuOHDMJNcforMOeXcTbZw9B+mW/B7SzMGzmDo1t0Kz40lG5BdE79J/9Og
 btCpPJZg07DwUYb8VuUakusxkeHC3DQQqYXYHUIXsuCvUg5UY9SIFGSi4u+mPfv6KwWQ
 vUC5ArNTMKITUiVsCzU0BqUsjDcRZ4kLDoPslicDMES+wKGOnnTZaaIugkmqw3X79L+Q
 1ShKp8hNqI7q//Gj+pOPC+EB/SG52izRB0fM6EzSC93uwLkJ1aQplb/VWeYZhAr4RgCB Gw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ckZPYeu6wE8+I1ef3rFtTs4mcN61PixmmgYGdIX5sv0=;
 b=hF4QkfdTBkXdgnKD0SBxvOiqV4HF+rfgxQBnOxmDor4HHBbgNxUBXcMl3Kaayz7hUTSa
 1PnEQeey5rJQ3DKLPC0A+CfJ6NEu//0mcBiWfwXxT7clUomnkTYZOpEwHBrSj8L28UcD
 xPm7FxNFYEQR0mBtbcx/JkrzjMLFAb9pZCxlAM+piQv3EhAiK6gdtTjiywj6wZzlmgIQ
 FWzjMWDyJeC9WLkVAQ+sBmXWHfU/sActVkofKKVi84luFzRIblU0hgKwB2B0DsT5dtwe
 wjkx40NV6V4K3TtWLEb7jF+FFfaJrGw2ifBBpcY9TvswF7iY/sDuosBribnIzll4kyHI LQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a2356g321-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 20:06:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16QK0gZc022615;
 Mon, 26 Jul 2021 20:06:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3020.oracle.com with ESMTP id 3a234u1yd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 20:06:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzpHcyw0wzJluO/Kt3X0zHWmGktlMc/W5NcuFtodm/x8dr3vTxYfCNuoYTHLaHbbNkyQFlXlyE3DW6+7zEX++/Fl+7GqfOk7GaR5KXrJ5CNtSOz3mCRkhuZsmzK4LKc71meDxYBaYrVxLdg+/y1H8enFUgKM9TB7dlrx9KqtJLmrWRUNVRb31jMaJCyRdN8nMhI2rjUNcj+Dpcxxmyv3N3aLPMRejRdXIuOVqxIuv8w0SBGfpPGQqv+6Rt2u7fDLThDyK3w0608k36MIICm1kuf7kX1sZ8VCQc9EC7jgUeCY/Pgvb+tWDdnynY49TqvAch3/+RIf9JE79TmSC7UOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckZPYeu6wE8+I1ef3rFtTs4mcN61PixmmgYGdIX5sv0=;
 b=gWv2T7AV8FlOMC5aAWyP7jpZoZBnpbBdUKd3XkBT56dqrF5smB8sYJdYFzdiCA4NWwzYGispOsKraWXYwyZtTI6X7BeutIqf+F/1LHGjsnSeyuaG28FReSNpmaxltTZoxmSoOLFFSTAnbDGNiuMkwkQjt4F6w9pTyWt3ikg+ME9Y7sn0il+hQvha6CQEBt9Ikf573TU7zIbu0RfEFw0z1cu1Eg0EZzgyihNeHM6NthDbo2bOiD0hKDuXio8e3Q631IzHWojhwq8WzJMNHpscAiD6xGlMaITOF1OuRt7ch+0FuEdM35qdtUAxKUvdJPiSc/fqoCOA6imBoTRfmxTyLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckZPYeu6wE8+I1ef3rFtTs4mcN61PixmmgYGdIX5sv0=;
 b=mX2bOWlQs3fnGyFb+6Ki60CMBb/w6McC6xqA7kRDdv/ewcxlM6bTN9Qr6q4dewPyOSsRxlObULBkSpRu4bE3yyozPWiXiwQFVVH0fT2war0zAvNeNP96avnfexC0KxNlv7VRaOzkrLa2FFJE6w8/xT19E1z9+1wOBLIDU5XsC8Y=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4675.namprd10.prod.outlook.com (2603:10b6:303:93::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Mon, 26 Jul
 2021 20:06:54 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5%4]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 20:06:54 +0000
Subject: Re: [PATCH v5 09/10] ACPI ERST: qtest for ERST
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-10-git-send-email-eric.devolder@oracle.com>
 <20210720153830.71bd4b8e@redhat.com>
 <f80724d7-f319-1e97-ce3a-7dc8682ac193@oracle.com>
 <20210726134526.0eb2cff7@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <7613e210-e070-378d-d6f3-7b6324e90448@oracle.com>
Date: Mon, 26 Jul 2021 15:06:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726134526.0eb2cff7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Mon, 26 Jul 2021 20:06:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d7374eb-e203-4292-7d48-08d95070ea07
X-MS-TrafficTypeDiagnostic: CO1PR10MB4675:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4675F543045950413433456097E89@CO1PR10MB4675.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZKpYt75r0dBlTU4xNs7nKboQGNmKbbEpz6nSRAoBo/lksUnDx4a/nUIEuCnQQM4h938iKE5b76RVMVJgbuhTD94YUZxKiuzV4N1/K820HS5WQHv1m6/Wyg7tTQlIFo46BOea0ZgrL5rml6LQ968/JlYFs1u54FtkvbpUSYIhqlS2ZF43ljIwg+ZAYVMp7Bi15eW1YTQOjKtLl2S7qPUi86SXKWBn+SEYeKwBDjTusm4nEky0SHjsK521AgH03gCV7sGsw4k/83goSE1Du42utWHx4qLThe1yYKVZMBokderRMk+qf1PhADnXbZuBt/6UW4xlEPF3N6HQ8mcagWJ0HJhcv2KSdnIuiv65CGoFQSfRohY1RhiKLEh8e0rwZaI0hUfApFXkoOYaftAM4ZKpHot3Ncp0uc/kWgMNrHMUmeWR992lBBZAtXexy6pPgYRT0BaU87XSo41lCVRo9VpX9IMebkclfJpN1RCaRPBfwwzBLPMmkf9JTNm4ebeoLL8bZV1NucRBSKEM0tN+sE3el3F9lzGg/xmCEMvAMHtBYbkr//ORQFcPFOITi0evT4EECU6Lshn9LEtbPiSPdCDafoBq85oUax5sILkeIOh6yYOq14bIOfEjdQm/Yg57GLAs4/VLjkjpacHUcnsPZMNDg+/pz1d80DO0mm6uWy/ejSFVMwfs/4fU7bybs8vtF07DFOHZYy79NAkiXjMcrK/5VGJWLuE0CobNU9Yozgib4A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(376002)(346002)(136003)(39860400002)(316002)(2616005)(107886003)(4326008)(83380400001)(36756003)(31696002)(53546011)(31686004)(478600001)(5660300002)(38100700002)(2906002)(8676002)(66946007)(6486002)(86362001)(8936002)(186003)(6916009)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0NmZnp3cklURmZWSjFlNHVJTWpiNFRaS1Y0YjNscjFZeDB3Zk9sTVhxZmhr?=
 =?utf-8?B?L3JTZVdPTFU0V0NDMUhDT0xEY3hFMFBsS2RJMXpnZVZxNnc3aFFlRnVrcHV5?=
 =?utf-8?B?SGc3RCs3Y1QybHkyM3lWUmlKeUkyRXZMWXFKdVdwSVZQNHdwSHQwc2FGZkRY?=
 =?utf-8?B?UlJ6U0JEQVZUdnViRHNBYk5LVlRidDNQdTFZVmsrNEt1M3NZMGNSVDVZbnVR?=
 =?utf-8?B?NVpHQ3ZhR3RET0F2eHYwK25KTzZxUlJBMDlTTEJ5aUU5Y3dOQlVzYzBQMmk1?=
 =?utf-8?B?OWhTeHJWZ01qZHFxTkxha0xRQ0RVSUJyODJYTDRSRENMbEtuYm9OMHlZYUNM?=
 =?utf-8?B?dGgxQ1JPdDZGMEZHN1lIZVY4S255ek9PVDdtRzlXMGFTRWdLeXh5R2VXclg5?=
 =?utf-8?B?bWxQY25rTjVTUllLTVFSa0xmNEZlbHBWbjRDclJzWHpJWlppV3FNa3E0TXdT?=
 =?utf-8?B?K1drTHZaRmVKc29jWTdrdG8xOUpNZmZteEdDRmo1OWk0M3k3bFB5UW5rZTUz?=
 =?utf-8?B?dzh1Y0RQL1gyZXlhMjY5UWxTZHZCbXAyZmtzdUdQbWRLakJaT3g4SGNvT3Bi?=
 =?utf-8?B?d01PNWNiZ2R4U0hmR3lhbVBvNm9mVzZYVENCeFhhd29BV2FyWXpYSDZWZERx?=
 =?utf-8?B?bHpwVndmcDhwdWUyOTI5QWNSLzhNcDVubFpPTTRrWmJla293MkJpaC9ObExK?=
 =?utf-8?B?cStKUlVuRHhjbk94S3NteWpFRFBuUCtvWktwemx3d05XaHM1T0x1bzJkdVpG?=
 =?utf-8?B?aUV0cE1VMGFYYm9yNHYrYnFINTBYV3BIcS91VXNya25neFJPaXNpbTdCUEVM?=
 =?utf-8?B?UHJVVmJDeXhlcUhEbUx2WUVlWVpRT3hXS3JDOWJDOXBYR0lNZWhJTmpUMVl2?=
 =?utf-8?B?UUJUSm11OU0zL2RVY0NHQ3NLUjBhQlUvS3J5ZXNWWnplNmdNUGNaMW9TR0My?=
 =?utf-8?B?bkdZUlFrODgrSjdkZ0JzS2JSWENna3NoSGZoYi92UjNCSzJzdk41M2VMTUJY?=
 =?utf-8?B?alNPSlFxVlA2QVhBMGxqUTN6RTVMbC84V1ZRYW5CSFR4d0Nhbk5MSnE2Ni9M?=
 =?utf-8?B?RE4zN3VjNWpXVGoxOC9sQ1BhMnBjbWhtTmlMV0kyMC9XWjFjS0FWU1ZkOUg3?=
 =?utf-8?B?WHBKMU9iQU92N29RdHdlWXZhWVl6RXEyaVB3b1ZvajRRY2JYalZ4U0Q5aU9v?=
 =?utf-8?B?MFpwM3BlYWllaW1qeGZZbTYwMTdHWVRtMlJ6VW1LM0Fnb1JIZW90QlFiVmtI?=
 =?utf-8?B?Vm0weXpBVFZMTjFwY01PREo5RWtJQkdNbzdWRVlTMjlKbVJEVXpyd1BOS3Bl?=
 =?utf-8?B?dXFjUll3NzBlSVI5anpnV2l2VzhoU0FkR3hwMnlodmdTTWViN2ZKeGd0Vmln?=
 =?utf-8?B?V2JoWkNoM1lmS1B5djdvbmVFbGhHemtRRW1nc0pJcThGWVFQRWpqdmkySllK?=
 =?utf-8?B?dkg2UUVSaFRySVFNNjVxK0xwRnRDbjdkdzIwRkdmYzJqRmF3aitzcFhHVHdI?=
 =?utf-8?B?NzFjREdQMjhJSTM2SHM1UkRaMkFIcU9GbTBvcGtLWDgraDBDcDQxaThYVUFa?=
 =?utf-8?B?WlNoZ3NJOXdVanhXOHpuZXB1Y1lUbm5LT1I1ZEluNDZQcVE0YlFvVWEwRDNi?=
 =?utf-8?B?VWEyZVJmN3JtNEZLUSswOXRUM3VkeXhxc0p5V1U4VG9iQXhaYXlxd1V2TjNP?=
 =?utf-8?B?aG53aWRIOCtXekpUSVREN2taYkNKN2VVblUwM3FwRXR0TzJrNDNNQU5yMkVn?=
 =?utf-8?B?cHA3SWJGS1NUVUZOdFEzNGx2NHoyVmh4dWJHSUtBZVZ2RmM0dll5UVAzMldl?=
 =?utf-8?B?azM1amhDK25QU0RzS1ZkZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7374eb-e203-4292-7d48-08d95070ea07
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 20:06:54.3798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CpoRUMXYNe5WTiGFVWKzTc9oBtvkHyd5Ma0Khf4KIrADBSk7MI7LvL2u6p4NQ2vcznP5g5VdwGU8f7vG59pzryQdtm/+hm1obOUfx9IDVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4675
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107260118
X-Proofpoint-ORIG-GUID: 3RK97CKuih8UdWHwy_NSsSx1vUmCs_DG
X-Proofpoint-GUID: 3RK97CKuih8UdWHwy_NSsSx1vUmCs_DG
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/26/21 6:45 AM, Igor Mammedov wrote:
> On Wed, 21 Jul 2021 11:18:44 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> On 7/20/21 8:38 AM, Igor Mammedov wrote:
>>> On Wed, 30 Jun 2021 15:07:20 -0400
>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>    
>>>> This change provides a qtest that locates and then does a simple
>>>> interrogation of the ERST feature within the guest.
>>>>
>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>> ---
>>>>    tests/qtest/erst-test.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    tests/qtest/meson.build |   2 +
>>>>    2 files changed, 131 insertions(+)
>>>>    create mode 100644 tests/qtest/erst-test.c
>>>>
>>>> diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
>>>> new file mode 100644
>>>> index 0000000..ce014c1
>>>> --- /dev/null
>>>> +++ b/tests/qtest/erst-test.c
>>>> @@ -0,0 +1,129 @@
>>>> +/*
>>>> + * QTest testcase for ACPI ERST
>>>> + *
>>>> + * Copyright (c) 2021 Oracle
>>>> + *
>>>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>>> + * See the COPYING file in the top-level directory.
>>>> + */
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "qemu/bitmap.h"
>>>> +#include "qemu/uuid.h"
>>>> +#include "hw/acpi/acpi-defs.h"
>>>> +#include "boot-sector.h"
>>>> +#include "acpi-utils.h"
>>>> +#include "libqos/libqtest.h"
>>>> +#include "qapi/qmp/qdict.h"
>>>> +
>>>> +#define RSDP_ADDR_INVALID 0x100000 /* RSDP must be below this address */
>>>> +
>>>> +static uint64_t acpi_find_erst(QTestState *qts)
>>>> +{
>>>> +    uint32_t rsdp_offset;
>>>> +    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
>>>> +    uint32_t rsdt_len, table_length;
>>>> +    uint8_t *rsdt, *ent;
>>>> +    uint64_t base = 0;
>>>> +
>>>> +    /* Wait for guest firmware to finish and start the payload. */
>>>> +    boot_sector_test(qts);
>>>> +
>>>> +    /* Tables should be initialized now. */
>>>> +    rsdp_offset = acpi_find_rsdp_address(qts);
>>>> +
>>>> +    g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
>>>> +
>>>> +    acpi_fetch_rsdp_table(qts, rsdp_offset, rsdp_table);
>>>> +    acpi_fetch_table(qts, &rsdt, &rsdt_len, &rsdp_table[16 /* RsdtAddress */],
>>>> +                     4, "RSDT", true);
>>>> +
>>>> +    ACPI_FOREACH_RSDT_ENTRY(rsdt, rsdt_len, ent, 4 /* Entry size */) {
>>>> +        uint8_t *table_aml;
>>>> +        acpi_fetch_table(qts, &table_aml, &table_length, ent, 4, NULL, true);
>>>> +        if (!memcmp(table_aml + 0 /* Header Signature */, "ERST", 4)) {
>>>> +            /*
>>>> +             * Picking up ERST base address from the Register Region
>>>> +             * specified as part of the first Serialization Instruction
>>>> +             * Action (which is a Begin Write Operation).
>>>> +             */
>>>> +            memcpy(&base, &table_aml[56], sizeof(base));
>>>> +            g_free(table_aml);
>>>> +            break;
>>>> +        }
>>>> +        g_free(table_aml);
>>>> +    }
>>>> +    g_free(rsdt);
>>>> +    return base;
>>>> +}
>>> I'd drop this, bios-tables-test should do ACPI table check
>>> as for PCI device itself you can test it with qtest accelerator
>>> that allows to instantiate it and access registers directly
>>> without overhead of running actual guest.
>> Yes, bios-tables-test checks the ACPI table, but not the functionality.
>> This test has actually caught a problem/bug during development.
> 
> What I'm saying is not to drop test, but rather use qtest
> accelerator to test PCI hardware registers. Which doesn't run
> guest code. but lets you directly program/access PCI device.
> 
> So instead of searching/parsing ERST table, you'd program BARs
> manually on behalf of BIOS, and then test that it works as expected.
> 
> As for ACPI tables, we don't have complete testing infrastructure
> in tree, bios-tables-test, only tests matching to committed
> reference blobs. And verifying that reference blob is correct,
> is manual process currently.
> 
> To test whole stack one could write an optional acceptance test,
> which would run actual guest (if you wish to add that, you can look at
> docs/devel/testing.rst "Acceptance tests ...").
> 

I've reworked this to pattern it after ivshmem test.

> 
> 
>>> As example you can look into megasas-test.c, ivshmem-test.c
>>> or other PCI device tests.
>> But I'll look at these and see about migrating to this approach.
>>
>>>    
>>>> +static char disk[] = "tests/erst-test-disk-XXXXXX";
>>>> +
>>>> +#define ERST_CMD()                              \
>>>> +    "-accel kvm -accel tcg "                    \
>>>> +    "-object memory-backend-file," \
>>>> +      "id=erstnvram,mem-path=tests/acpi-erst-XXXXXX,size=0x10000,share=on " \
>>>> +    "-device acpi-erst,memdev=erstnvram " \
>>>> +    "-drive id=hd0,if=none,file=%s,format=raw " \
>>>> +    "-device ide-hd,drive=hd0 ", disk
>>>> +
>>>> +static void erst_get_error_log_address_range(void)
>>>> +{
>>>> +    QTestState *qts;
>>>> +    uint64_t log_address_range = 0;
>>>> +    unsigned log_address_length = 0;
>>>> +    unsigned log_address_attr = 0;
>>>> +
>>>> +    qts = qtest_initf(ERST_CMD());
>>>> +
>>>> +    uint64_t base = acpi_find_erst(qts);
>>>> +    g_assert(base != 0);
>>>> +
>>>> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE command */
>>>> +    qtest_writel(qts, base + 0, 0xD);
>>>> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE result */
>>>> +    log_address_range = qtest_readq(qts, base + 8);\
>>>> +
>>>> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE_LENGTH command */
>>>> +    qtest_writel(qts, base + 0, 0xE);
>>>> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE_LENGTH result */
>>>> +    log_address_length = qtest_readq(qts, base + 8);\
>>>> +
>>>> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES command */
>>>> +    qtest_writel(qts, base + 0, 0xF);
>>>> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES result */
>>>> +    log_address_attr = qtest_readq(qts, base + 8);\
>>>> +
>>>> +    /* Check log_address_range is not 0,~0 or base */
>>>> +    g_assert(log_address_range != base);
>>>> +    g_assert(log_address_range != 0);
>>>> +    g_assert(log_address_range != ~0UL);
>>>> +
>>>> +    /* Check log_address_length is ERST_RECORD_SIZE */
>>>> +    g_assert(log_address_length == (8 * 1024));
>>>> +
>>>> +    /* Check log_address_attr is 0 */
>>>> +    g_assert(log_address_attr == 0);
>>>> +
>>>> +    qtest_quit(qts);
>>>> +}
>>>> +
>>>> +int main(int argc, char **argv)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret = boot_sector_init(disk);
>>>> +    if (ret) {
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    g_test_init(&argc, &argv, NULL);
>>>> +
>>>> +    qtest_add_func("/erst/get-error-log-address-range",
>>>> +                   erst_get_error_log_address_range);
>>>> +
>>>> +    ret = g_test_run();
>>>> +    boot_sector_cleanup(disk);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>>>> index 0c76738..deae443 100644
>>>> --- a/tests/qtest/meson.build
>>>> +++ b/tests/qtest/meson.build
>>>> @@ -66,6 +66,7 @@ qtests_i386 = \
>>>>      (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
>>>>      (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
>>>>      (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
>>>> +  (config_all_devices.has_key('CONFIG_ACPI') ? ['erst-test'] : []) +                 \
>>>>      qtests_pci +                                                                              \
>>>>      ['fdc-test',
>>>>       'ide-test',
>>>> @@ -237,6 +238,7 @@ qtests = {
>>>>      'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
>>>>      'cdrom-test': files('boot-sector.c'),
>>>>      'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
>>>> +  'erst-test': files('erst-test.c', 'boot-sector.c', 'acpi-utils.c'),
>>>>      'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
>>>>      'migration-test': files('migration-helpers.c'),
>>>>      'pxe-test': files('boot-sector.c'),
>>>    
>>
> 

