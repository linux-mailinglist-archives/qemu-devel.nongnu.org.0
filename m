Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540D23FAFFA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 05:13:50 +0200 (CEST)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKXk5-0003kf-D4
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 23:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mKXi8-0002Ws-Vz
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 23:11:49 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mKXi6-000714-6V
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 23:11:48 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17TF5RCM006146; 
 Mon, 30 Aug 2021 03:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+21LQsa2GQUfS6CwAuMoWiLth+b36oDEr5P5z7cKRvw=;
 b=Ul9X1Vb3bimNJz7jXCVhBAt0xSNO7ciszuD42h8rIsL01Z2+UWFaUisCwyTgHujJegcW
 XaQvlBud8+INPsLI5AVuPsYl/RGLLOStBSWL9CC9MPTW4qGkho/PoP47jNrk0pBrfscx
 r8iZ42zC+DjL7Numu4KJ90Prz1DC26O2S5+zuaFPSTL2ZOXuHLmmpwWEMqzRg8kkTnit
 KYvg1hTqTZXflk6jshxuFV5KbQtinf1pcXdsOBmMGpl2kXXBZ+VXitfiVEzMj09A11IM
 go/VkQcHPkgy3ZFt2j/QgzGGBrCnSSinqVFbVjtf1/NaXWxArJctQGZnJXldeRrthizD vw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=+21LQsa2GQUfS6CwAuMoWiLth+b36oDEr5P5z7cKRvw=;
 b=upMr7jYh2iR//s2DNZ80rrCzopqbHbccT1gdofgJTIhC1cghwzbb7Z/3nVWGsQOgWw7d
 bu0N+r6APaSHqDY+te1Am6nCS1BpHgeb3fcnvp2wU2mGuWmiTDky+eju77Oj55M/Mx/H
 k0fWafjnDex/ZlmylW4YR2N+DpvvtpCzWVKSYaQWWw9QvkxMW9uz+E/H2/RgxhLbGa2i
 VVKSNWWYl97+d9BlSIY1t2PO9xA/NHzEMKaSH7mD76IFzxLuTOF+d8WU9P/HY0tiRUwM
 NVUHf6EtXArEHQnzvN6au8fbn9CfdnFr3PTt6E+ERgsPu4iz3PNlANGN32qex5AtcJHE gA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3arcjw8dq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 03:11:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17U3A19p155434;
 Mon, 30 Aug 2021 03:11:42 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2049.outbound.protection.outlook.com [104.47.74.49])
 by userp3030.oracle.com with ESMTP id 3arpf1hntj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 03:11:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/sogzJ9RGs1W9pPQgf965RLa6jYXa7eOQvyYYvUUHJv2xKJ2eiyXETA40x8myg49EV7Ip9a4E+nM30CJmTWWTC42ub8HchZMd2TpkFAK9QrNgTty8pqDDjRvdy010wPVt2HRHTUY16lUtilK1OFZHPoy8E8BU74JuLILZYjNaT/9NHb15OfuTFXXFWCUekNWBJ77eVBMDuO34lLiRwG4vysauyvIFkPPLimOwDptnr9JNz5wGVrY6WGAIZR32tLTG8Mv2mtc7A5orV8OZ0wwZL7XVxbIv750e1wlEjsVnz7rtH1LfqZxhZJdiwPrCc5fpv6Giho7oKYQXIVAGuyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+21LQsa2GQUfS6CwAuMoWiLth+b36oDEr5P5z7cKRvw=;
 b=fJ/NudEdEgqoijZS0fkFL4vWIxPvjSUyLfVoUx9EOuNFUcLoQpAuubZkKdxlttY9bbgOTMH3Su8EI4IInMc5YVIL4w8XP1nC3mnCT9ooKqDi26PbolxBGlZkaoo7e2DWkJlgSEySFt4j4s8cA6zUVdlJ5Nk4u1C5Fg1C0K/EAAZBS5gKu1uKI8J1aMI7kfclHLGksngUhT0mY24NyLgae4yyCLo5F4V6Lv3mcsFn6koAmZ98f9PD3u2ULyLpSbqhQs8ZlXYYUXH9RN7TIWmjphjJVsyfvwqAVDJP2LaPDorgtGW+NQ3TQoeMEHRJJ01+xqLHfKyoVspw3vUhw6wTAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+21LQsa2GQUfS6CwAuMoWiLth+b36oDEr5P5z7cKRvw=;
 b=IGPF7D+7fHop435uerMe0zkdjPh1jmSEyB3FEa9RE3WFuPUXhGNrMyqwp5e2L4lcrra9Ntt1C9x1O2VRhAfNJqlb+0bUoYGpEPJwR3AUQU4sNms7vlbPkobjvWx1KnozX1Fdy1G0XiSzWVwIpiMy0amPDgH23Ah881+2wvRL7CQ=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR1001MB2350.namprd10.prod.outlook.com
 (2603:10b6:301:2f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 03:11:39 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4457.017; Mon, 30 Aug 2021
 03:11:39 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 07/16] vfio-user: get device info
Thread-Topic: [PATCH RFC v2 07/16] vfio-user: get device info
Thread-Index: AQHXkr3FfmDSaQ9cD0KPNxPGq3B2nquC3eGAgAiWIQA=
Date: Mon, 30 Aug 2021 03:11:39 +0000
Message-ID: <057C9D51-759C-4424-A582-ABA783C4D923@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <d2c6a72f9b0b207bcb2c7fe49abe45854d4e017b.1629131628.git.elena.ufimtseva@oracle.com>
 <YSUYfS442NY5TltC@stefanha-x1.localdomain>
In-Reply-To: <YSUYfS442NY5TltC@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2969feed-e87b-45cb-1dda-08d96b63e264
x-ms-traffictypediagnostic: MWHPR1001MB2350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB23507CD82735338E4AD217ECB6CB9@MWHPR1001MB2350.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /0fVoEHMLpQmsijMYdgargZI+dMY/XRa+2Rh1mBWF4uUbvs+gpAVZF4JPf3cUcHorbwULpkCqm/3ZoN1xITatYAb9V5mSifK1y3W9wa2XxqDlVPAwzrsQJbqeeSxxTnZxAKcEPzrwPSKWWvHzLR7z9bYQYg4IpDweGRbMbXbY+d3cYaMKL0E6fSu86c36J1hlXXTY+CClNvNmiCG1PyQ5cd0tNeaOBP9/W2DGhoTlKN5u1SjUrECx1efBQku0Ox030BXe2/Kzk06Y7VuGpRKUgogY8LiX0hu9lSecM/z/mUQASqgAbvsEhapuWX+2IAeb6VErmB9SXnr5apOGktPc9GoMnyOt08IOTKt1heJPCnInlqui8+1pEwLsapDAG6xhuunlEdIX88GfNeeDGTwPC94MeknuIjHzMiPkzi3dVOB+OXglazCz8lhxe+jPGBdBWDRG8ZhFm2hkTFp8njpiZl2+KHFEcRuvYW7FcYN87Cd/waENj12eGsXmzrXS6GdH5sN1D/693cRZYK19AAcdVp7HcDIHlhTsBVJfoqSbdMQgbnFYiGFVzh7tXPgs34GcPtqCUFTmL9Ad4NiaoqMKPHWlmQ5/hBFI+UqtIOptpJ8Yv08SC2EvwJoIKVtIvaekVpWTNwMvT3VgmUPfVZHoPPLQIJ5ZDTJkY/5L9Yujo5L1d73iRzBXrozPXjpq8OGmfObqVzTizKDdO+TBnttO32MMAzFXbBqp58+pAiNy68=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(39860400002)(366004)(136003)(86362001)(4326008)(186003)(2906002)(66946007)(76116006)(38100700002)(122000001)(36756003)(66446008)(64756008)(66556008)(66476007)(54906003)(33656002)(53546011)(71200400001)(91956017)(6916009)(8676002)(8936002)(26005)(6486002)(478600001)(6512007)(83380400001)(5660300002)(6506007)(38070700005)(2616005)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEt6cXBmUm9pZDNpVHliM0pNSFd4VllvdUVJQXE5a0dPNFNVYWxNSnBLV0NM?=
 =?utf-8?B?Skh5d3NweG1XQjJtVGxHdTIrSWtXdHBsc295Y24xamZFOVRWdXNQZGNreU53?=
 =?utf-8?B?anF4S1g5UXU0c2tKeXFnSGlyMTJpd2ZoQ1RSODhhRnV4Z04vWDF5dGFsTU5D?=
 =?utf-8?B?MW9ValF3QjBnRXo0SWliQmdzeFkzTG5CZ2N0N2tMcVNWRWRZNC9meW5YL0tU?=
 =?utf-8?B?MTZZcFhYUGJ2WU1IK21ja3B4UFBaSXFDQnlrNEhaSEJQSWszb0EzaFRKcXdJ?=
 =?utf-8?B?UDQ3OVV5T0RuTXZzSXk3OHNNd090QnRQcUdoRUdBTDBiVVRMRmMzQW1pUzNN?=
 =?utf-8?B?dWF2NkdQcnVNd3VVMG9oS2hWbjNYZVpKNmZnKzhMMGd3Sk8zZ081SnBvd1RW?=
 =?utf-8?B?Wk8xVEYxTXkrM1hrZzNicmpTWEVaUWNZUVE0V2UwcVoxdmFzc2cxMExPc0Rj?=
 =?utf-8?B?UkFMaGI1OXl3d1FiSDQ1Z3JuZHc1enJIK1FCYmVkYzBxaFU1S2xuRHEzZVBF?=
 =?utf-8?B?eExGam5pNDlZNWI2cGxsUjdPSG4rSFJLWWZ0VkxPQlBUK05oekpYQlh4NDd0?=
 =?utf-8?B?ZnlpVFVQdkJvSWxpM3ZTNGZLVG1WcmxjNEJBdzVRNENUZ2w0TFVmWUpac213?=
 =?utf-8?B?NkYwb1M2WEJaM29vb0VIdTVnVHhLRTJMdzB4ZTBkTzlrQXhFdy92ZkpicVQ2?=
 =?utf-8?B?UEhkTjM0R0VYSlY4d2d3azE0ejJkcVhad2hGajIvMTJRTU9wN0YyclI5ZnJS?=
 =?utf-8?B?eUtxZDFPYzh6ejJqNnhRek9kWmJxNGtlaDErVGVkczBTdXk4d1hFTGZMM1B1?=
 =?utf-8?B?RDVhQ3A4bTBuc1Q5ZmMyalQ4TU9oMU5ocEg3RGdRVHpqYVM5NkNQWlZKdXZ6?=
 =?utf-8?B?MGJVQ0JaV0NBVkNEbWs3WFBneG9rNU91dlVNRXVwZnRsQnpxdldBaWRxR01I?=
 =?utf-8?B?NjZSMS9LbFl0eWxWTmZTSkZNUjRRQ0tUTWdGZkQ1M2htbWVFTWRTSDFMODBL?=
 =?utf-8?B?cWtlaklNeTRUM0FBeWlVT3V4cDBReE4zZkNURVhxKzc0WVZmeWxubi9VcnFz?=
 =?utf-8?B?S1VKaFFQZzZGYitud1h4LzRWNkRaMUZmaVJQL1BQNVpDYVFkRnk2Umx4V0Ey?=
 =?utf-8?B?cGM3TGRTUDc2OWo3TTZNUGkrU2VxUnFlbFVaYVlyd3pXTE9QYnJRVEFJd3k2?=
 =?utf-8?B?RkdaR2h4Rk5UWWRhU1JXb3RVb3pVbVhTOStqTEo5azFDcHFWaXYycWR0MERn?=
 =?utf-8?B?QnQxcEg2YUtpUUFVNDZjamVBa05pU1ZRUzU2TUwyZVVKLzNMVUMyMTJZSTFj?=
 =?utf-8?B?UjRLUWs5b2xlQnJnVVUwSkJGeFdUU1RmV0xHRi9sVkNPWHNOOW9KWFI0ZWgz?=
 =?utf-8?B?bFZOOFRVVHpDdGtLVE1DQ2t2cE1ndmZGSDJGMEs5WEN4VkphTHcwK0tpSEdW?=
 =?utf-8?B?bDlXWjNuRm11MTJRMThXVko4NXI2cDk4RnlGMGVHTE5iRjJNdmN5eEM1UVVH?=
 =?utf-8?B?aUYxQ0NqbjRBTGttVHcvTzNtMmhmN2w3WHB4Z1h3VWxwSGpPRDZiR0k1R3VC?=
 =?utf-8?B?Sm85UW9sQXNtSnZjb0dkSldBNndFb3lQMVZKZU93Q0lJUWxobG9IRC9pdWV5?=
 =?utf-8?B?QnBaS21OVVArL002bDJCbFFXVlpQZHdVMnorTjgxRDhlY2pEOW56allidW1v?=
 =?utf-8?B?ZGRTT2p3NitxSkpBVktsUG1VN0s4bkRVQ3hIS0FZaXZaUTFnam0vNktNTng2?=
 =?utf-8?Q?xN8t+ojVV1L2e87kE2yMVUwdsXP1lZa3b9Y7yqJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C123B1CADCEDF498F801B2BB077890C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2969feed-e87b-45cb-1dda-08d96b63e264
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 03:11:39.2432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BN5iEaHoFZff5E70SA4PeA04XgIZ1+vuA4FWIu0jMCtzBBYmp9DOEWLpALEYyGM1F6fEMO7W4lzSGrAfB7P0FZsZ2HGQlzRH+1zKhRQcrqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2350
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10091
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300019
X-Proofpoint-ORIG-GUID: 4P6_21x2FxO_EhnPUHBVqI3mm-QISE0Y
X-Proofpoint-GUID: 4P6_21x2FxO_EhnPUHBVqI3mm-QISE0Y
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXVnIDI0LCAyMDIxLCBhdCA5OjA0IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBBdWcgMTYsIDIwMjEgYXQgMDk6
NDI6NDBBTSAtMDcwMCwgRWxlbmEgVWZpbXRzZXZhIHdyb3RlOg0KPj4gK2ludCB2ZmlvX3VzZXJf
Z2V0X2luZm8oVkZJT0RldmljZSAqdmJhc2VkZXYpDQo+PiArew0KPj4gKyAgICBWRklPVXNlckRl
dmljZUluZm8gbXNnOw0KPj4gKw0KPj4gKyAgICBtZW1zZXQoJm1zZywgMCwgc2l6ZW9mKG1zZykp
Ow0KPj4gKyAgICB2ZmlvX3VzZXJfcmVxdWVzdF9tc2coJm1zZy5oZHIsIFZGSU9fVVNFUl9ERVZJ
Q0VfR0VUX0lORk8sIHNpemVvZihtc2cpLCAwKTsNCj4+ICsgICAgbXNnLmFyZ3N6ID0gc2l6ZW9m
KHN0cnVjdCB2ZmlvX2RldmljZV9pbmZvKTsNCj4+ICsNCj4+ICsgICAgdmZpb191c2VyX3NlbmRf
cmVjdih2YmFzZWRldi0+cHJveHksICZtc2cuaGRyLCBOVUxMLCAwLCAwKTsNCj4+ICsgICAgaWYg
KG1zZy5oZHIuZmxhZ3MgJiBWRklPX1VTRVJfRVJST1IpIHsNCj4+ICsgICAgICAgIHJldHVybiAt
bXNnLmhkci5lcnJvcl9yZXBseTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICB2YmFzZWRldi0+
bnVtX2lycXMgPSBtc2cubnVtX2lycXM7DQo+PiArICAgIHZiYXNlZGV2LT5udW1fcmVnaW9ucyA9
IG1zZy5udW1fcmVnaW9uczsNCj4+ICsgICAgdmJhc2VkZXYtPmZsYWdzID0gbXNnLmZsYWdzOw0K
Pj4gKyAgICB2YmFzZWRldi0+cmVzZXRfd29ya3MgPSAhIShtc2cuZmxhZ3MgJiBWRklPX0RFVklD
RV9GTEFHU19SRVNFVCk7DQo+IA0KPiBObyBpbnB1dCB2YWxpZGF0aW9uLiBJIGhhdmVuJ3QgY2hl
Y2tlZCB3aGF0IGhhcHBlbnMgd2hlbiBudW1faXJxcywNCj4gbnVtX3JlZ2lvbnMsIG9yIGZsYWdz
IGFyZSBib2d1cyBidXQgaXQncyBhIGxpdHRsZSBjb25jZXJuaW5nLiBVbmxpa2UNCj4ga2VybmVs
IFZGSU8sIHdlIGRvIG5vdCB0cnVzdCB0aGVzZSB2YWx1ZXMuDQo+IA0KDQoJQXMgaW4gdGhlIGxh
c3QgcmVwbHksIHZmaW8tdXNlciBkb2VzbuKAmXQga25vdyB2YWxpZCB2YWx1ZXMNCmZyb20gaW52
YWxpZCwgc28gSSBuZWVkIHRvIHJlLXdvcmsgdGhpcyBzbyB0aGUgUENJLXNwZWNpZmljIGNvZGUg
dGhhdA0KY2FsbHMgdmZpby11c2VyX2dldF9pbmZvKCkgY2FuIHRlc3QgZm9yIGludmFsaWQgdmFs
dWVzLg0KDQoJCQkJCQkJSkoNCg0KDQo=

