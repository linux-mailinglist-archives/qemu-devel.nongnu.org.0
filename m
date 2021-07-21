Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E43D1269
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:29:35 +0200 (CEST)
Received: from localhost ([::1]:51552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EAA-0002tk-PA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6E7G-0006qW-0s
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:26:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6E7D-0003ga-Mc
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:26:33 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LFCRb1011309; Wed, 21 Jul 2021 15:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=nRL/XqGWktJ3W65TBde3c9TUqvbox4vIWvvEyuu6OyI=;
 b=Pah8XfVlfoKnXvhYFvpJ0UPEx9cBOnRrzR9l4DVRJ6Yc5x6FEBEmrL1Wf4vW6ur3CbeT
 Fv3AW6bDqzdSnzx1Rcs6BVKBm6XCXQLSFF7RLQ7Yr6Kp0meBJoGGtuiMExaTMt8xl15A
 hgQjtqOJCMTa7l8OhlH4iXiPC1DHfl+apkfQWUPzwIrNACAkPj/yAKMmzvyU7ivjZ0dE
 Pvo544WTExyZoCQ501CxcIcBNiReOyq0f3lrDFg9NmQGI0Ejp9/KSmawpz2lmDGQ4DDk
 aU8G3r7NUbkbZRyjLd8+8MbeM0m7mZsGrp7YTaCS5JNPUFv/1qZ4xj8/rEYHNoQ6/jK6 pQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=nRL/XqGWktJ3W65TBde3c9TUqvbox4vIWvvEyuu6OyI=;
 b=NTcUMIFolYhRqMeAYkFN0L9uJfA4hFyPwuiLnPCcb4YftEQJxVVaUIobPR1nN2wRlCdt
 Mi8eZHK825ORibRaVUYjsKPvkwU7uzP1f4Rnn7PoAdWN5nBb5AjGwotm/qfncK+dEx8R
 /UncO0KFhuu2TvlJzkFt9S4METeQUMP7+QQNcMdbA16RrqCec44n9+wEmEM+jG2Zwlfg
 Mo66L8PbWbQBLlPwSVfKnykRFnfYzSwChBcEi8gMNemC8esNAJTWjCiQYrntZjA+1Jso
 Z+T0v7JgfcYpbb+5QrJqlMk+yqA+HEXm3/Cvq+2jYkAZEbP5gDRi9ikmdkcek0BRkFQZ dw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39xmwgr7sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 15:26:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LFBAxx056147;
 Wed, 21 Jul 2021 15:26:29 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2176.outbound.protection.outlook.com [104.47.73.176])
 by aserp3020.oracle.com with ESMTP id 39uq19d141-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 15:26:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/yiMjQ8zYS5fPWJWnZMCksawxPYigNx8uRKqdRmsdbPtz4MK8jPBdd71vKPkAl2ibLdK1uB3cwjx+bR2Ind9x260cedK7hhxYPxSYGCo6+Pfv0H/eg6EzvbVNQJtas2xYp64abR0SfbM54jHjZgRhVjjfG8iSZyIacYEBK26KEciaXh3J4+8wclCG9E2gIWjWezRgjXtPeS+Zi+1PdLPvnOyGjS1nl/QmyiGmxXsTShAcnywqTjweTmE1YzEBFcn90ow4IkxwnV967Lgm9YCWVL3j4aF1DLJDO53RM5oOzM27f0nI30GB0ixb4px298JU1i/UDi66mQaULBXZlDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRL/XqGWktJ3W65TBde3c9TUqvbox4vIWvvEyuu6OyI=;
 b=ZAofhdo4We2Y8MAgeIvYN2IZ7uFwauL8dIWaMHn3Wv74lX2zqce3GOhyvlkO2Fnab9FtaceYaoVC2DQfNkwVynZFDi34fux5gURt/GthmEyQRwnNbWPHYY6FfIv2hpXUitZGOyA+apG2P8+jCr9vdC0mBow20Nf3etjxODKxUIlp8ebaVK4DpKae/H6+99N0EyEES6l6934EOLAp2d7QCKkvV9J6W7G9VI/u5ZHKa/F+seOG4R99E7Psh2MSJeuanZob7WAwyRk0dFFLZBpibPz+gHiHdYl4NRvPVRVBxYiP5O9C0RgmoOjIXPjYxCouJv9hI+vC5+eRX5qP2nAxvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRL/XqGWktJ3W65TBde3c9TUqvbox4vIWvvEyuu6OyI=;
 b=toozJaXjxAgdtziBbavHP6ssW+nB8wTGiGrWiob0ok+sxHqLviEyf0MJSjcwO5Mh//NN0PUvvG/38gTsn23Ql3njJwtHyljjshrN46dWi4rcF0ZpBOmWSfngKgmGgr5R6Sge+cPWqpwdmDbJxhAAE9++DjTt81GpK1Zzl+XrOos=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BY5PR10MB4132.namprd10.prod.outlook.com (2603:10b6:a03:20b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 21 Jul
 2021 15:26:27 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 15:26:27 +0000
Subject: Re: [PATCH v5 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <20210720165751.52805aed@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <8965206e-f8cc-b0bf-553d-661ae6179fd6@oracle.com>
Date: Wed, 21 Jul 2021 10:26:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720165751.52805aed@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR1PR80CA0043.lamprd80.prod.outlook.com (2603:10d6:201::29)
 To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by FR1PR80CA0043.lamprd80.prod.outlook.com
 (2603:10d6:201::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Wed, 21 Jul 2021 15:26:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ca55ed1-7dbf-43be-f5ca-08d94c5be814
X-MS-TrafficTypeDiagnostic: BY5PR10MB4132:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4132B66CC27EEA7F0A4E11A597E39@BY5PR10MB4132.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5LtaU4WELC9OmPRGBUKLsCviQkQlTyhXsMt5dTmjeZKhJz5rtfg2of89JBlyxUisR93tv6zPMKbadp7626QMeAOyYxzi9Y+5G+TZzPiSwqk27eM58PXOwu2cXAECRGfDXh7Re512OHF4DQkXzR2BoDVhKdiWOHii5vVAsu5vX2w175BIqaRBLSr0PcQJQxSDGXUFsnyIPTgmUAYzBJEuNfNxWpM5ecn7bpLmCdg9JyS7jb+u1KP1PN+4drTqEw6YkBc+2WeQ7z+F+6bBL7lE/v9f5JrK0iRd3gFinu3nCCJqc7CHFcDnyI0W1+KTxMZhnBTmD0aqJzg8re+3iFITIboB4VTcp7NvBONXyPUVn7kCeL2SufqzEz9OSt8HvMTleDCzaO7adQnm6PJeWEGyfKdSeDL7N/fiZWX38CRBphJqgEhSIvYbxZYMYsHhNgba/Xk1bkwWYh0n0jsOunqiKanUq9uuniyEQIrb+2tpv/ZQgfgr+OYl3ChhJdrBqFSnIgMEn/CNPi20Y9jJmD+R/vpUJ2lKCdWDlGTdsQ9wmF3Ga1vZX9FF+5ej/sG1viwBBhuPl7ETd3FL+TDV7qQS4/U85YaxhSlQ6ZVWNr6i4knQllKqjMIrdzH279881ikDiCTQiNFg+a1792wmONS5zmSDqO2QCQySihOGNB4WxmPoPyOalvbsJSzg7pP+ePALT68bkpuOjUYRuToIFzCFKLoHmJPPbfodq31Wm/TWj6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(376002)(136003)(39860400002)(478600001)(53546011)(31686004)(2616005)(66946007)(8936002)(66556008)(66476007)(83380400001)(4326008)(8676002)(86362001)(31696002)(6916009)(6666004)(2906002)(38100700002)(316002)(107886003)(186003)(6486002)(5660300002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFYrVEI3STNMaEJqS2N5bS9HaGNVZkMzL05WakEyclV2R0N3ZVpJc1N2amVk?=
 =?utf-8?B?VXBXYjNYdk9wZDBmMUE5MkdDZVZLMTZMMEo1MHdTSlZsdmpLMGR3Ui9QRWwy?=
 =?utf-8?B?RUVpZklyekx0eURCWS9wRGpXaDBzOC9hQ1JhSWh0RmN1NnFaTEFoZ3RZU3hR?=
 =?utf-8?B?WmJvdTgrenZpdkhpR0dPVFQ2NEtydFlCcURQN0UwczNnRjRWRi9UOWZIZFVm?=
 =?utf-8?B?UUJxZ0dMczZST0ZBSm5nNyswOW1NSE9FQ3NSOWVLc0R3MFNzYzdNdGVsTFZt?=
 =?utf-8?B?a3dzNlJFOC9rM0hmU21tdjhPalBZMmVLbW9rTExQVjVpSVkxYmdVdGFSNTgx?=
 =?utf-8?B?UVJJaEJ5QWppZXZLaVhUemRtR013ci9mUE9PbnB6bll3WStucm1xcWpOcGlK?=
 =?utf-8?B?VzB4azdSVmphQXFhenhWSzJsL3lIV3BEaEJlTDg2eHZCcHFBdWNCL2RHWE8y?=
 =?utf-8?B?MnNxUzFLazQrdWtYbFhpYlpwL2x6aVJIQXErVDBBZDQ5azJGRDZPMTFRTWp0?=
 =?utf-8?B?WjhyL0tQVVJGQmF5Y0djcEhCcm0xREZCU0RmMnU4dWtySWVBMzZVNjg0ZEJR?=
 =?utf-8?B?MTVHdTUreWNEUEMvdXVIelpNTmFiRCtTSXhlYXRWY3BXTEpMQmJ4Y3Z1QWNi?=
 =?utf-8?B?QjVSSHByZlgwTjQ5bXdoSisxWHBaY3krRlZxTXNYN0NlZGpDMmhhditlcWl5?=
 =?utf-8?B?UVFseG96LzNQWTduMEtPb3dDTDlQcWJhZGhna2Zkc2dGN3VIQytsQkg1M21B?=
 =?utf-8?B?cUc2Yng5K1hITlV3UzJGREpnaUdueTB0QUhsS3o3TDhpZG1sc09FZnRYZlk4?=
 =?utf-8?B?cDNmbnJ5MUVtbTI0TnZrd0w4aElJcHN0S1ErYldmL0ZyKzRqM2JHSklJVUtW?=
 =?utf-8?B?MkFKZkI5ZWJHOHNhckFyU0tvVWQ0eTJwZDQyeFFNcFRSUGN2ZUhyTlFPZk1O?=
 =?utf-8?B?aXhMYVdrSEJYUFVUK3cwY3hPa3A2Smc5dHFEM1RZMjhkTUU1ZUJEYTFuYWVT?=
 =?utf-8?B?Umk3aitGeHBOR1NsMFpxUWU1VW5ENFRHMDhsWU1GQXFvb3YrQ3JqYjRaK0tN?=
 =?utf-8?B?YURlNmhEaHNlTVdCZUFYR1hiN0ZJckRWZDMyMFdtUU96czIrNm1pNWtSMUtX?=
 =?utf-8?B?MWpQb0ZBMnl5emdyN1BQUkFoUTdIdUE5NWhadHdkdWFsT21wUU54S0VUM0kr?=
 =?utf-8?B?d21IdmNGSlhJeEU2ZmJSeXFvbzg2Qld2Tm9MVi96NHRaSXpLVTFxbTlIcjgr?=
 =?utf-8?B?YjdBYy9MU0kvQlN2ZUFmZ1N3a09wbCtRckNwWHh2NldHekdMclZRdWEzYXVM?=
 =?utf-8?B?OTdsc0M0dS9FakU2VG1GVjEwRkZ0cmx2NEV3LzRPTjhwdFNrVVFYWWJidzZy?=
 =?utf-8?B?cHBiVDNQOWU5YW9kMm1pSC9FanlhOHcxblU1VDJqeXlRZmFaNjhjekFQb0pB?=
 =?utf-8?B?c3ZSdW5NQ3NCeXFQOGlPMFlsWmptcW9zeFg1N0ovTkQrWnAxYUJ2ZkIwVXpC?=
 =?utf-8?B?eUFtVnZ5bnVCTWcrdGgvVmNaT3E0K0JWQWZrRE84Z0ZGTHJpZlhVL2JmaEQr?=
 =?utf-8?B?MWxMRllHQlJtWUZhQm94SDB5Uyt2aVBnMnlNY1Rta0lrdHFmRGd2cFNJaWQx?=
 =?utf-8?B?aTdZbTd4ZUJJYy9RTWZnWTdJbTF1VVByN0ZIcCtwRDdEa1ZFUGh0dFZhRzAr?=
 =?utf-8?B?Ymw2R3lIei91ekI1V3VqeWtJZ0NkMlRaSVI0UUZWTnYvV0VISFRsSGcxdVFI?=
 =?utf-8?B?MzJDR1dVWFdHNWtBRVlIdzlOdHVOQzFEZU9wYTdBL2VFQU5SUlp6dlZDTzdz?=
 =?utf-8?B?MlczMXJKUkVmSlBhaDRvUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca55ed1-7dbf-43be-f5ca-08d94c5be814
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 15:26:27.0064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuG3/U3ReLValqCbV4BWwVjl88gU/8qNPaxJwj2JMzyFc8SxUvw1VAd/UrfoJSl3Y6iIsgD6wVql+IHf9NEHuQRP4uSXxMgSwUJ+qmwokZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4132
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210089
X-Proofpoint-ORIG-GUID: 6meQ6W3SRJVnaF4AHuQCmrVUE_GT7ADA
X-Proofpoint-GUID: 6meQ6W3SRJVnaF4AHuQCmrVUE_GT7ADA
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/20/21 9:57 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 15:07:11 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> =============================
>> I believe I have corrected for all feedback on v4, but with
>> responses to certain feedback below.
>>
>> In patch 1/6, Igor asks:
>> "you are adding empty template files here
>> but the later matching bios-tables-test is nowhere to be found
>> Was testcase lost somewhere along the way?
>>
>> also it seems you add ERST only to pc/q35,
>> so why tests/data/acpi/microvm/ERST is here?"
>>
>> I did miss setting up microvm. That has been corrected.
>>
>> As for the question about lost test cases, if you are referring
>> to the new binary blobs for pc,q35, those were in patch
>> 6/6. There is a qtest in patch 5/6. If I don't understand the
>> question, please indicate as such.
> 
> All I see in this series is
>   [PATCH v5 09/10] ACPI ERST: qtest for ERST
> which is not related to bios-tables-test and blobs whatsoever.
> 
> Blobs are for use with bios-tables-test and I'm referring to
> missing test case in bios-tables-test.c

I now understand that "missing test case" are in bios-tables-test.c.
I've got those implemented, though I'm debugging a problem with the
microvm version.

> 
>>
>>
>> In patch 3/6, Igor asks:
>> "Also spec (ERST) is rather (maybe intentionally) vague on specifics,
>> so it would be better that before a patch that implements hw part
>> were a doc patch describing concrete implementation. As model
>> you can use docs/specs/acpi_hest_ghes.rst or other docs/specs/acpi_* files.
>> I'd start posting/discussing that spec within these thread
>> to avoid spamming list until doc is settled up."
>>
>> I'm thinking that this cover letter is the bulk of the spec? But as
>> you say, to avoid spamming the group, we can use this thread to make
>> suggested changes to this cover letter which I will then convert
>> into a spec, for v6.
>>
>>
>> In patch 3/6, in many places Igor mentions utilizing the hostmem
>> mapped directly in the guest in order to avoid need-less copying.
>>
>> It is true that the ERST has an "NVRAM" mode that would allow for
>> all the simplifications Igor points out, however, Linux does not
>> support this mode. This mode puts the burden of managing the NVRAM
>> space on the OS. So this implementation, like BIOS, is the non-NVRAM
>> mode.
> see per patch comments where copying is not necessary regardless of
> the implemented mode.
> 
> 
>> I did go ahead and separate the registers from the exchange buffer,
>> which would facilitate the support of NVRAM mode.
>>
>>   linux/drivers/acpi/apei/erst.c:
>>   /* NVRAM ERST Error Log Address Range is not supported yet */
>>   static void pr_unimpl_nvram(void)
>>   {
>>      if (printk_ratelimit())
>>          pr_warn("NVRAM ERST Log Address Range not implemented yet.\n");
>>   }
>>
>>   static int __erst_write_to_nvram(const struct cper_record_header *record)
>>   {
>>      /* do not print message, because printk is not safe for NMI */
>>      return -ENOSYS;
>>   }
>>
>>   static int __erst_read_to_erange_from_nvram(u64 record_id, u64 *offset)
>>   {
>>      pr_unimpl_nvram();
>>      return -ENOSYS;
>>   }
>>
>>   static int __erst_clear_from_nvram(u64 record_id)
>>   {
>>      pr_unimpl_nvram();
>>      return -ENOSYS;
>>   }
>>
>> =============================
> PS:
> it's inconvenient when you copy questions/parts of unfinished discussion
> from previous revision with a little context.
> Usually discussion should continue in the original thread and
> once some sort of consensus is reached new series based on it
> is posted. Above blob shouldn't be here. (You can look at how others
> handle multiple revisions)
> 
> The way you do it now, makes reviewer to repeat job done earlier
> to point to the the same issues, so it wastes your and reviewer's time.
> So please finish discussions in threads they started at and then post
> new revision.

Yes, I apologize. The email tool I was using did not handle threads very well.
I've switched email tools and I'm able to respond to each thread much better now.

> 
>> This patchset introduces support for the ACPI Error Record
>> Serialization Table, ERST.
>>
>> For background and implementation information, please see
>> docs/specs/acpi_erst.txt, which is patch 2/10.
>>
>> Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>
>> ---
>> v5: 30jun2021
>>   - Create docs/specs/acpi_erst.txt, per Igor
>>   - Separate PCI BARs for registers and memory, per Igor
>>   - Convert debugging to use trace infrastructure, per Igor
>>   - Various other fixups, per Igor
>>
>> v4: 11jun2021
>>   - Converted to a PCI device, per Igor.
>>   - Updated qtest.
>>   - Rearranged patches, per Igor.
>>
>> v3: 28may2021
>>   - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
>>     internal array with explicit file operations, per Igor.
>>   - Changed the way the qdev and base address are handled, allowing
>>     ERST to be disabled at run-time. Also aligns better with other
>>     existing code.
>>
>> v2: 8feb2021
>>   - Added qtest/smoke test per Paolo Bonzini
>>   - Split patch into smaller chunks, per Igor Mammedov
>>   - Did away with use of ACPI packed structures, per Igor Mammedov
>>
>> v1: 26oct2020
>>   - initial post
>>
>> ---
>>
>> Eric DeVolder (10):
>>    ACPI ERST: bios-tables-test.c steps 1 and 2
>>    ACPI ERST: specification for ERST support
>>    ACPI ERST: PCI device_id for ERST
>>    ACPI ERST: header file for ERST
>>    ACPI ERST: support for ACPI ERST feature
>>    ACPI ERST: build the ACPI ERST table
>>    ACPI ERST: trace support
>>    ACPI ERST: create ACPI ERST table for pc/x86 machines.
>>    ACPI ERST: qtest for ERST
>>    ACPI ERST: step 6 of bios-tables-test.c
>>
>>   docs/specs/acpi_erst.txt     | 152 +++++++
>>   hw/acpi/erst.c               | 918 +++++++++++++++++++++++++++++++++++++++++++
>>   hw/acpi/meson.build          |   1 +
>>   hw/acpi/trace-events         |  14 +
>>   hw/i386/acpi-build.c         |   9 +
>>   hw/i386/acpi-microvm.c       |   9 +
>>   include/hw/acpi/erst.h       |  84 ++++
>>   include/hw/pci/pci.h         |   1 +
>>   tests/data/acpi/microvm/ERST | Bin 0 -> 976 bytes
>>   tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
>>   tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
>>   tests/qtest/erst-test.c      | 129 ++++++
>>   tests/qtest/meson.build      |   2 +
>>   13 files changed, 1319 insertions(+)
>>   create mode 100644 docs/specs/acpi_erst.txt
>>   create mode 100644 hw/acpi/erst.c
>>   create mode 100644 include/hw/acpi/erst.h
>>   create mode 100644 tests/data/acpi/microvm/ERST
>>   create mode 100644 tests/data/acpi/pc/ERST
>>   create mode 100644 tests/data/acpi/q35/ERST
>>   create mode 100644 tests/qtest/erst-test.c
>>
> 

