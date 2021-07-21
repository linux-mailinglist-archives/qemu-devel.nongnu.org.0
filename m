Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033903D0B01
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:13:09 +0200 (CEST)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68Hs-0002v4-2D
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m68Gh-00028S-Sd; Wed, 21 Jul 2021 05:11:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m68Gf-00083B-R3; Wed, 21 Jul 2021 05:11:55 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16L9AiUG010409; Wed, 21 Jul 2021 09:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=hna0x3sLyNPT1pi+dl6CtMTrQ7ma8DyuiHSG87tC7Ec=;
 b=cm7XwvppUn7dGhoNL1FkE0N5uKLxzWW/Ed+PikQT50nZ5w3cQH38GZKKd/WJYWReA2Wl
 ZEYVpPLvowMrL0AUMa8rl4ofrRT5VzVEwvAQAU0lWLOEczDxFY0RJa8nk82IJFAX9i4n
 PKdYfb2bSQFrq9XC6Rlf+i6b9nD/G9ARhd3VoCTRjK3sNFChVMiRLT3748f+kGdLKYs6
 Zdb4Kmm1YzEb5Yfw02lZzJBDeU8cigJnDDrfSqYbmfeu7GyxPx0Y7XuVtHAXUjXRV75d
 lgrkcVMktDoNSweTtrbRUJAscQv2O5n6pYikFimBXMjFPHDcJdKkItdDcJZgD/MEZyHx Yw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=hna0x3sLyNPT1pi+dl6CtMTrQ7ma8DyuiHSG87tC7Ec=;
 b=bc6Uv7Lr5BFyK/c/zXG0fa5LfiC/2i+ETF9mH50Wm7yfjBAuB9qXzG49Vp6oYkxK4LGa
 5sL7A/UMf7svAZrnZsW4FAXfR6QWxafIe/O174WHObuljKlFaxqotCsw6P9XNBQJbUHD
 mtifelUaJHpN/+EM6W8LMmDnWpS/TbLYf1zFwoy+aqSjB/laOfC/npQZLMPaUW/bMEjW
 hbU9WRC8fn4RDjPKCBy6DFfhyQBuIVI7bb8N0QsDPE2CWMyy2eX9hOWLSk+C/2alFRMj
 jL6othfAmm1umBu87468T/dZVBAdMgoOK9u+DD1PWa+rugWIdwPy74ow2lyeBA1uz6kG hA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wvr8acng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 09:11:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16L9APih063935;
 Wed, 21 Jul 2021 09:11:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by userp3020.oracle.com with ESMTP id 39v8ywyu71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 09:11:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0/tOVSXgeuIwULk/6Lr26aqpcC3Ca6HAWmlheqz5dgQ4Yh/+iYM6MuKDST0SCnCulCQoCDdsB+cEttIIA56d0u+x+HHqnKkdFMdbhDeLONQ8s25+Ru3lSQWd1Q9cCU+6VDGRTi+V727t5CaAfopQScIxKLBuSWxRaZtdVOMNXoAixnCoT5SZQWK/9zDUu8I4tURF78RiT8w7c+LPRnQI6RCbNx1X4G77DaPfhsSbMMZGynLFeJe9UjdjOGsTmYApvL0PMikq9Ef5AMa7KnKNvOFfzRmHecck86mOr7O6ijL6w+E1xi/JkSsVlp+ZTifO7bo4lD54ioXU7WUYaFsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hna0x3sLyNPT1pi+dl6CtMTrQ7ma8DyuiHSG87tC7Ec=;
 b=VnE6Si+mRR7B85MoqAHHRHRiv/YAaqqtJk89BndFbxCXXt8LHd6gJjUIKdKYgpw+KVtIeHDrbYpdWta2zSULgfC99IYWRbsx/KUag56BoWlVqM84SZ1kYVq32D8ElTSRK6o5IcAIvi1Dk7+a4LNcu6qqonWRP5eXkSRJl8QsG2sCJt4kHU3egJ0MuSoWdC/XI6f4nckgxS8YyoUFRmUu+IocubXg6G8NIV1pAVtmg+PpUTGGv/A7rCJE8N8NU4UzS45UM8I2mBT97rQ/HTg7zHu0FUYMZH+pSeOArDoPWDLDAuFZ4un7iZmquCrifa6rcV1BfuAYrB9jDA58XBTibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hna0x3sLyNPT1pi+dl6CtMTrQ7ma8DyuiHSG87tC7Ec=;
 b=wKf805ESrMOhSRJH57U8VlGmqIOHu37QZZCd8UMb3Dfg5CAiJaCpBpFkyk0InOmhm6FKMuC7nTOYXRM582u1vlGrks2XwhfiElNUlJ3izmwd4tRKnOGgf2V4fU7JVVx6Sy4qe7zMU5lJhHDgYVk8M5wCFdh95ZY9p4XomtGQvKo=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4408.namprd10.prod.outlook.com (2603:10b6:510:39::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 09:11:37 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 09:11:37 +0000
Subject: Re: [PATCH v6 6/6] hmp: add virtio commands
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-7-git-send-email-jonah.palmer@oracle.com>
 <a92fd4c4-73cc-3b6b-89fa-b5ae35304a2d@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <5fb48b8e-4380-45b5-2057-97d0e72dcf54@oracle.com>
Date: Wed, 21 Jul 2021 05:11:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a92fd4c4-73cc-3b6b-89fa-b5ae35304a2d@redhat.com>
Content-Type: multipart/alternative;
 boundary="------------973563B49561FFE33C28C449"
Content-Language: en-US
X-ClientProxiedBy: SN4PR0201CA0001.namprd02.prod.outlook.com
 (2603:10b6:803:2b::11) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SN4PR0201CA0001.namprd02.prod.outlook.com (2603:10b6:803:2b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 09:11:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f9aa6d9-a291-49d0-2fe8-08d94c278b03
X-MS-TrafficTypeDiagnostic: PH0PR10MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4408B7353E2590A66573374CE8E39@PH0PR10MB4408.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kh4iqojsz14iUro3zx+xZFQ5SkA1EZrz8si106dYopt07qGDYjcrgQBPkYTjwSKHd32RJ3zsBkYUtmUrcdzcdYIk4QTL4IB9yarJbgXDsf7ZJBLyOcldFa+PTRWYjfDkIjeZ2EqhqvxKPNpJqadXHkkIUR4oWjwIlHx5eiQ3hDy69CwpoAOXrij6505Zl0l4TmZIKnvP7u936qw8M0j4YHjRD3waV101L3YmBiJg+BfBAY/dsEA4bGXYWxqKtX2hSQzpR/lhXecEpcDHAcdBGKF525geF/EDmwpOTNH6rGQ3FM+Nu2WmN0lO0d5Hh1FfRxx6jubco5xNRf1RWOQEwhvlrWM6QOfH6qOZFl+/ebzPK3rxhroebvGBdOnuL5LJQ8XQyqXwWVyuAKZ4q8QIOgMTZJozG+yhIIeBPTiritAUVuZE3RU+4RfGyEahVVc6miGY5fGEi/oAjhb4q0C8jCLzas96sOKZxY3ahTRutVeGmop9FecwmezaAUWx/Sf3DrVTUvsXI5gajvuNKXkdoHI/SVljDipRrhO9xltwMh81i4XOVpGrcbNOr4UvRr0GnYY7hphFZ34tISXMH4iy7VMmt8leK5a9NpDTb13u0wh/f+wkxr/zoUkj9Vii/78TzGpUpRzrVRoJZeTBvGLBN+FvZ3RSrzGJdK50x13/vlG0bcqJFwdsZJQ17elwNI7LcYyMc0LX+T3e1sqaFuHoriab5BlRg7G7lunOr5FDwc5zcg164ea5SckvZpLE8NNf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(136003)(396003)(366004)(376002)(6486002)(44832011)(38100700002)(36756003)(7696005)(5660300002)(478600001)(316002)(2906002)(26005)(186003)(31696002)(4326008)(66946007)(7416002)(86362001)(956004)(53546011)(66476007)(2616005)(66556008)(8676002)(8936002)(33964004)(31686004)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEdITGNuakM2aDNld2FENjhhbjVBM29jQ1VmNHZYRkxmWUlmelI5aDB3dlk3?=
 =?utf-8?B?VDhKdEFnTmF1Y1QyL2pRajFQUWpTTkVQMUZBRG9ZUmcvR0NoM0pHWkNLY2la?=
 =?utf-8?B?RGUvQTBGcEJHZFdycEpxUEZvUWxlcTRYRlVBc1RkNDhDN1UzVTM5RWtVVGNW?=
 =?utf-8?B?Um4xUlJuRlRYNk5zNjdyZzVScTZ6OHVHSE1yTVJUVTk5cXk2cU5vV2d0akpP?=
 =?utf-8?B?R05hYUhrczEzbS9hV0RpMEJvTjRnR1dXcXIra3Q3RG56MC91QmgrdFowRkVN?=
 =?utf-8?B?ZWloZkZoK2JsUzdtTEl0bGt1ejBBVmVTU083ZEczWU1GV2R6OTk4cmEvR3pa?=
 =?utf-8?B?bExjVTkyMXc0bkNWbjBlbmd2bFBEWU9qTi82U1o5Z1czZWRGQ3ZvelN0Vy9L?=
 =?utf-8?B?akFrYVVjeXZoc3BqR2xsdGlSOUF4anRBR3VPalhJRGtZV1dZZ0w4dTUyRytZ?=
 =?utf-8?B?RXBML0hiTU8xVnY3SHRkRWJsVTkvR0YzY3pTNUFISlhGSWNhN2RvWGYwWWdK?=
 =?utf-8?B?aFBqOUgwdmpyQ2hQV1pHWlZqOEpGekoxMThNZnpxU3dVUXZySUo1TVhBOUNU?=
 =?utf-8?B?d2FQS200YWthMGtvek05d2VGdnRtUmI2blpjSHpaU3VzaUVTYVY4alh3UEVR?=
 =?utf-8?B?RmJQL0l1TWlyZElUWlNGeWx0RHpMSWY1VGVVUENaa0NQajkrTUZNN0JYR1kx?=
 =?utf-8?B?L3lZQUljTDJVRWdaQzMvWkxhdXUrRHBCTVJxSUd6VmVyOUhybUtkeVYzcytX?=
 =?utf-8?B?bmxvTEYxS1IyNVJGOTZ6cE1ERXZjUytpRnR4Qmd5cDM4Zis0OGx1VWRGaytL?=
 =?utf-8?B?TURWNlE3MHVsZHFvQWE5aVc4bjdaVVl2NER5OENSUHA1QlFpcG5OZEwxMm9v?=
 =?utf-8?B?T1VPV1c4WkkxeVhSM242OFoxVGVIczBvU01JZW1PRHExOHA5QzllNStuN0Mz?=
 =?utf-8?B?Z2t4RHJXK2p2WUtoekt1UjlRNzVEL0NJdjhTK0I2MDJ6USsvdEdPUU5RdmZD?=
 =?utf-8?B?bllPZ21rK0pZT3JsQzhOTTBNVXpjWFpkdUtrRUNONmtJQ0R4QzlhSnk0QW9u?=
 =?utf-8?B?L1VjY1p5alRVOXhhVmpYRkNSNzNJSWhiR0xGaFFCS0NsaXpSa1V6Rzl3aE9Q?=
 =?utf-8?B?dlRmNk5GUmtXM0dvR1AwZjFFVy9tems2N1N2clBFWm81Z0gwSURSNVFzTmZq?=
 =?utf-8?B?NEp1MUI2bjNscFZKd3BrazVRYWg3V2U0VFBvZGh0dk1vcDZkVUhNOUpaeWpP?=
 =?utf-8?B?b1p4cm16RGFTSnpUTTBaY1R3dDlpVnk2dnF3TVpYd3kwTVQ1MFpEZFZ2WC9z?=
 =?utf-8?B?cTZpOFJ2RGNGVG9CbmZNblJkTjhNYklTS2t4WENlUndaQzEwZUhtWmxhajJG?=
 =?utf-8?B?c3J4dmdSMFdIM1lXS1BmcUZOMVphRy8yVUlETWxwQ3MvM3V0MlVKTVFiOWxs?=
 =?utf-8?B?bEIrN05TK1ZYRVlwMG15SzBjdzA4SWw1dDd1K0xmMmVmcnh0MkdYSWZkaGIy?=
 =?utf-8?B?WUlRM1dIbFJNdXFyVnVpS2JIT0hlSkRnWlZ3bGhvVithZFFMb2dsWkR0S0Vu?=
 =?utf-8?B?SUtmZnJadXI3eURVMGpnUFR6R2ZOdTY1ZUhOTTNmbGdSUTJ4bXo5Y296QVBn?=
 =?utf-8?B?WjFENUNQLzQrMG9zMG1uc0plRTNQNm5hdDVCaXl6RGxZTklpY0JlenlOdjdP?=
 =?utf-8?B?ZXJoc3dWRnI3UkJKczk3WjFyVTlTQUtFUmdhL0ZBc2dlcCtuaTNldjFQR2Zp?=
 =?utf-8?Q?cGTvOO56pzGLgtgDtlY9Eb/mJ0MwdQ8qx5yE8vv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9aa6d9-a291-49d0-2fe8-08d94c278b03
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 09:11:37.0916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yAiKmkg4dxJGzuXQXQ/2tsjlTUCxN2oUJL/SuI8aV3/EZxDac3YY9YuoInU0pzI8gYeKDBdv6LoQOa5ny7LkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4408
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10051
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210051
X-Proofpoint-GUID: 4UQA8HAVOXv-1Zuu4UAyeMsicrFYIYFT
X-Proofpoint-ORIG-GUID: 4UQA8HAVOXv-1Zuu4UAyeMsicrFYIYFT
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------973563B49561FFE33C28C449
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/13/21 10:40 PM, Jason Wang wrote:
>
> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>> +void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
>> +{
>> +    Error *err = NULL;
>> +    const char *path = qdict_get_try_str(qdict, "path");
>> +    int queue = qdict_get_int(qdict, "queue");
>> +    VirtQueueStatus *s = qmp_x_debug_virtio_queue_status(path, 
>> queue, &err);
>> +
>> +    if (err != NULL) {
>> +        hmp_handle_error(mon, err);
>> +        return;
>> +    }
>> +
>> +    monitor_printf(mon, "%s:\n", path);
>> +    monitor_printf(mon, "  device_type:          %s\n",
>> +                   VirtioType_str(s->device_type));
>> +    monitor_printf(mon, "  index:                %d\n", 
>> s->queue_index);
>> +    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
>> +    monitor_printf(mon, "  last_avail_idx:       %d (%"PRId64" %% 
>> %"PRId64")\n",
>> +                   s->last_avail_idx, s->last_avail_idx % s->vring_num,
>> +                   s->vring_num);
>> +    monitor_printf(mon, "  shadow_avail_idx:     %d (%"PRId64" %% 
>> %"PRId64")\n",
>> +                   s->shadow_avail_idx, s->shadow_avail_idx % 
>> s->vring_num,
>> +                   s->vring_num);
>> +    monitor_printf(mon, "  used_idx:             %d (%"PRId64" %% 
>> %"PRId64")\n",
>> +                   s->used_idx, s->used_idx % s->vring_num, 
>> s->vring_num);
>
>
> The modular information is not the case of packed ring where the queue 
> size does not have to be a power of 2.

Doesn't modulo work for any integer, regardless if it's a power of 2 or not? Could you clarify this for me?

Thank you,

Jonah

>
> Thanks
>
>
>> +    monitor_printf(mon, " signalled_used:       %d (%"PRId64" %% 
>> %"PRId64")\n",
>> +                   s->signalled_used, s->signalled_used % s->vring_num,
>> +                   s->vring_num);
>> +    monitor_printf(mon, "  signalled_used_valid: %d\n", 
>> s->signalled_used_valid);
>> +    monitor_printf(mon, "  VRing:\n");
>> +    monitor_printf(mon, "    num:         %"PRId64"\n", s->vring_num);
>> +    monitor_printf(mon, "    num_default: %"PRId64"\n", 
>> s->vring_num_default);
>> +    monitor_printf(mon, "    align:       %"PRId64"\n", 
>> s->vring_align);
>> +    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", 
>> s->vring_desc);
>> +    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", 
>> s->vring_avail);
>> +    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", 
>> s->vring_used);
>> +
>> +    qapi_free_VirtQueueStatus(s);
>

--------------973563B49561FFE33C28C449
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/13/21 10:40 PM, Jason Wang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a92fd4c4-73cc-3b6b-89fa-b5ae35304a2d@redhat.com">
      <br>
      在 2021/7/12 下午6:35, Jonah Palmer 写道:
      <br>
      <blockquote type="cite">+void hmp_virtio_queue_status(Monitor
        *mon, const QDict *qdict)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; Error *err = NULL;
        <br>
        +&nbsp;&nbsp;&nbsp; const char *path = qdict_get_try_str(qdict, &quot;path&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; int queue = qdict_get_int(qdict, &quot;queue&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; VirtQueueStatus *s = qmp_x_debug_virtio_queue_status(path,
        queue, &amp;err);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (err != NULL) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hmp_handle_error(mon, err);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;%s:\n&quot;, path);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp; device_type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %s\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VirtioType_str(s-&gt;device_type));
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp; index:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %d\n&quot;,
        s-&gt;queue_index);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp; inuse:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %d\n&quot;,
        s-&gt;inuse);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp; last_avail_idx:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %d (%&quot;PRId64&quot;
        %% %&quot;PRId64&quot;)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;last_avail_idx, s-&gt;last_avail_idx %
        s-&gt;vring_num,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;vring_num);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp; shadow_avail_idx:&nbsp;&nbsp;&nbsp;&nbsp; %d (%&quot;PRId64&quot;
        %% %&quot;PRId64&quot;)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;shadow_avail_idx,
        s-&gt;shadow_avail_idx % s-&gt;vring_num,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;vring_num);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp; used_idx:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %d (%&quot;PRId64&quot;
        %% %&quot;PRId64&quot;)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;used_idx, s-&gt;used_idx %
        s-&gt;vring_num, s-&gt;vring_num);
        <br>
      </blockquote>
      <br>
      <br>
      The modular information is not the case of packed ring where the
      queue size does not have to be a power of 2.
      <br>
    </blockquote>
    <pre>Doesn't modulo work for any integer, regardless if it's a power of 2 or not? Could you clarify this for me?

Thank you,

Jonah
</pre>
    <blockquote type="cite" cite="mid:a92fd4c4-73cc-3b6b-89fa-b5ae35304a2d@redhat.com">
      <br>
      Thanks
      <br>
      <br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp;
        signalled_used:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %d (%&quot;PRId64&quot; %% %&quot;PRId64&quot;)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;signalled_used, s-&gt;signalled_used %
        s-&gt;vring_num,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;vring_num);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp; signalled_used_valid: %d\n&quot;,
        s-&gt;signalled_used_valid);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp; VRing:\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp;&nbsp;&nbsp; num:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %&quot;PRId64&quot;\n&quot;,
        s-&gt;vring_num);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp;&nbsp;&nbsp; num_default: %&quot;PRId64&quot;\n&quot;,
        s-&gt;vring_num_default);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp;&nbsp;&nbsp; align:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %&quot;PRId64&quot;\n&quot;,
        s-&gt;vring_align);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp;&nbsp;&nbsp; desc:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x%016&quot;PRIx64&quot;\n&quot;,
        s-&gt;vring_desc);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp;&nbsp;&nbsp; avail:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x%016&quot;PRIx64&quot;\n&quot;,
        s-&gt;vring_avail);
        <br>
        +&nbsp;&nbsp;&nbsp; monitor_printf(mon, &quot;&nbsp;&nbsp;&nbsp; used:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x%016&quot;PRIx64&quot;\n&quot;,
        s-&gt;vring_used);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; qapi_free_VirtQueueStatus(s);
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------973563B49561FFE33C28C449--

