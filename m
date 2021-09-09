Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54C04044C8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 07:12:59 +0200 (CEST)
Received: from localhost ([::1]:54992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOCMs-00053Y-Fv
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 01:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOCLv-0004Hj-Dr
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 01:11:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOCLt-0003su-0p
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 01:11:59 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1893oE7J028121; 
 Thu, 9 Sep 2021 05:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=pNPjMiOxbKPjVFXKocw58w9yV55/G+YJTxMdouAFdQw=;
 b=ZP2LiieTxYyUYuktRQxVjN4MWyr5OhyPR8N7RpPPS9UjwiyhSE/fyeHFFALzu/tTScHK
 Q9lewjdHcwbGI7LgM4APdoCsbCHW+lqwbhFrV5m2vGs/ODLzICkdjKuTYcjG0RdRfIpM
 BKukY8yaAe4hyP5H9f5HImtbCBW4Iawz1K6Vrfxy4M4UIdxqsxYzxMDvu5fXKPAbpAu9
 uj0QCPGUb2eBenR9ODwswG7RkCnnsongZLWBLqHkMEUC515ePPYSwLNqeEFdINSQSu80
 OUl44EmW5wHFzMJFXc3bb5oRdr3U3GksojF0LSsyryge+G4ukHO68WHdDsGbEl+DeZ9F Sg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=pNPjMiOxbKPjVFXKocw58w9yV55/G+YJTxMdouAFdQw=;
 b=zfgtcRMfJZsFSQKlU1Z2TPgc8sT74F56d+WXCQQ6JaNR96iD5aspboClPT0DABwOO/qb
 XT58n6wjiMCK4QbExkkWJeGyV0YE5JysPioqC039RONsW7Yys5ndtZa3USQB7dKI9Tjk
 meLMcuwW67txycDy5/R6eQv+/UEs7BcuPQ9SeFnLhak6RJAlhOnhyYLKK2i9JWFU6D+A
 muLDj95FBUgmSDkAB0xXaRMNhXE9rjXSoXBk3dr0ne5RSPWcc1BTu0c3j67icbEkmdz5
 XFrnyzgYUOKGEGga5A9Lwln5GXyG/k1L9jCG6eHxaLcuyeCUufu/l/GfBrY708d6LyBB dA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3axd8q52me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Sep 2021 05:11:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1895A6Gi129388;
 Thu, 9 Sep 2021 05:11:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by aserp3020.oracle.com with ESMTP id 3axcpn6t2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Sep 2021 05:11:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbVVgYiKPENdAp0e7V6pcxoZB08e5jyfjPJYmFwEm1W585UcJy6/OEYdxbw/OQiaQhiRv+HnZEWAet6s6Covpc5/KuEioDIV4LKigMAG3UzbMVeXvOa2SKZypFQoX4HIOzSqnhplVU9jGTrk563BPa0pXOipYinzP7G9mD3E3ekYM3pXSpaMBcVCdxMF7Dk1MYjuRb3DTaTJpcsazaoxq8qXdpKDcPBudEvwlUaSGGjiw0PE667ynRQE4hns1vRZBl1KTS5uuANVQ/xKhUoQsOfjmemIHJjmZG31XRbFwxqILHuSaWY99auDFpJ7/8UhET2kcUg2VAm3/1QtbvD5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=pNPjMiOxbKPjVFXKocw58w9yV55/G+YJTxMdouAFdQw=;
 b=PnprHD6bdmjd0CkfdEEHQmr3o5aPmn/RfdGsNQk9r44hAGqmZPSnhJfGJP8sGEH9EZtII0LhL063glYMJds3RABOp8LgIZhUy28njcbcZGPYXuxwCJbPwPQmh5jFkeLTPgYQgVp7lbEkZFGKY/cNDyTpruSpP6Bd/BkYTAbfY21YE4rBbDSj7+hL7rltof/1Lqx3QkeeAntdqthKxzX+HIKnoF23iYwNoz8Zpcvffa/yF6yeqlxvm5c8kvqWy+gOTE34FRMbfGZodoxLbUDiXhoYJLLlhOqY1rfBBxQdgqFe56rQ5naCggxZB7sF1daAAGo7XvPQcMnNVPoQDIvKgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNPjMiOxbKPjVFXKocw58w9yV55/G+YJTxMdouAFdQw=;
 b=A6kxrKTzjd2e2gt+bWbqdvyhHCodQpuZmQC7iglcsU0R49/VHYdu+e7LAjFPPrG7dqKsUV5yw1jFsjnu6SBwyYiTyk6X/dVu74SCxGanjUak8oaIqfQYB3vjRLzJBhyIhk8U3Vn6cMslcEzDt4vne6YDxV4OFpSu2tevoGNfPIM=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR10MB1808.namprd10.prod.outlook.com
 (2603:10b6:300:10a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 9 Sep
 2021 05:11:49 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 05:11:49 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Topic: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Index: AQHXkr3ElMGqWLWPTUyD8mY3/VudXauCv3UAgAixeACADUAUgIACm+QA
Date: Thu, 9 Sep 2021 05:11:49 +0000
Message-ID: <22CBE2AD-14EB-4162-9E97-FB7D279480AA@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <YST++FLqV02TlusW@stefanha-x1.localdomain>
 <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
 <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
In-Reply-To: <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19314bf8-6d64-4fb2-86e3-08d9735053f3
x-ms-traffictypediagnostic: MWHPR10MB1808:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB1808F2FFCA74DB976ACCAE03B6D59@MWHPR10MB1808.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: peeQqvMQFGvgrOfPFyEze8xo3swRN1BWebi05+IVUGKbNnwllXxPu4eRqSV8DbAk4t3R1T3SIoZFsNPK3o6RFajkzzqS3rjo6ZbSPTuFJyyA3XxBLAFVHxiKJSskh1rErIeeEk2rX7b+9U6i9w9Q1pYhiRK2Kb2o5c+F/Hg+9keXQY0dBrp4Skv4CqS8+y54z/OZW+66P0S3jk8IWtXjvnBrZpCEYb9jiomhqMdZ7bmR9dZbkgLtBethtQB6wyipf7YFedBj2QIg7U7T29Ymfwk27Dz1bpZ7YYF655dDoK9/X08DUw5r7ryp+7o/6IXvfoCbqyK1d7QhQ2p1u6oVKNN98zfGK8qCuAye1yAlj+sVqn5Dkz8KHHMDR070uZJ5aMqPXUR7ZuoCDtKU2ckvcqzTA00hb/xoUyAg7Ff+jqoaik/KC8TX84eDpOYsM1OszfSy0FPgu9k2mQN9I0uqIDVaS5t5NFSx0+Zk55dUarbztZWGXwjDV7WcfRyZqMvn9SM9tDPO/+XoopY7eOil/McA3KyKCwKacgs5IjPLApJtlkHBgmyU2n+QsjPRQLpTNwcDfbGhfrvxiRT0MCwOQxvLhxcsGHz1jmbDMeadw2mjOCQtbWcnhJwyh2y+52ngMIpfkViVFXGBt7GyBr8nhrOeUHQKhW/YLfqnBdfwc6Gi7ZVXGUEFpoxI5kjvzuQP0nz63xc3rRLJe+QitcBuHEsTNDs7ENG042LxmqB/7VSXOQcjc4EJ6HmI7z6uwDbm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(39860400002)(346002)(376002)(6486002)(4326008)(36756003)(5660300002)(83380400001)(53546011)(71200400001)(66556008)(76116006)(186003)(33656002)(6506007)(26005)(8936002)(316002)(86362001)(8676002)(2906002)(66946007)(38070700005)(66476007)(122000001)(91956017)(54906003)(64756008)(6916009)(478600001)(38100700002)(6512007)(66446008)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXd5UG0wUXpCbFh6QVpHVExRU3ZuVU91NmJtTkFCcEtVUy9WdmhGQVRlaE5X?=
 =?utf-8?B?OVVjVW9EVHJaQlQzM0VDcVFsV3U2OFlxZExxMkpGczVaVXV0dFlIK2IwOWpE?=
 =?utf-8?B?TllaVUlXT0EzelJWU0Mrb1QvUmZVYnpsc2ZleE11R0w0aHNlWUswdFhYVFI3?=
 =?utf-8?B?VkVtcnp4enMyVHcwV2NiOEhZODhrT2Q4RGVKVkFwc2EvNHBrNXBkMmlpUWd1?=
 =?utf-8?B?RFBtSUgxMDNuR0dlS2NuTFJCRTJ1QjFmRjdaU3FUcCtjNjdCR0g0OVRhZS80?=
 =?utf-8?B?bGRkVXdaektVeDlnb1ZJVGozYUc1dXdJVUpUR20rcUhCbzFVRk9Gak1BcEZz?=
 =?utf-8?B?Y1BOc2FWeE4vU1V6Z2VNSmJQdEplSE10cXcyUit0ZGVudERZU2hpaHgvcGsy?=
 =?utf-8?B?L1hHNEFtL2RqN2E4L2hOcjdYY2dKNFFrZ3ByVjR6bkkwSXZxSVVHUnlhYm5o?=
 =?utf-8?B?akpNazBabDVSSFY3WS9JaDZXZWYzRFAzQVgxcmxVamk0K1cwbTdzYzQ2cDBs?=
 =?utf-8?B?V2c5LzkyVVhaK0tPckJLR3ROaVhNTExoRUdHVjdPWEVzMEdBRE1FTHpLWUYx?=
 =?utf-8?B?WVBpV1p4QnpzWCtiZTZXN2J0Z29rYm5YbUQzNFVMb213WFE0YUlVY0lVZkQy?=
 =?utf-8?B?NENHbFplZDBGSWlvSTFUSDBuWDB2OThoMDRuTjB4cG9jUlNOVm9NcnRuTEJp?=
 =?utf-8?B?QzFPZi9LUVUrc0VkK1h3TVdFd2Iydi9IVGtDUUZVaGpMU2JvS3I2WWl2bkF5?=
 =?utf-8?B?RnVwSEZ5UUxoSUlCOFFpK2M1SGpsVEpVMWVIUkg3YS8wbUdCVlc0S1lxZlVl?=
 =?utf-8?B?eUV6RE5DSjJjaUJSL214U1A0ZmREZHhBYUFQWlVDK0tIU2R6U1VDdVdheXFj?=
 =?utf-8?B?ZXJwVjVzQ1RaRERmdG1KNkNBb3VSNjc1VUtWc1VWNHk1MlJwSytGWkhxTWs3?=
 =?utf-8?B?Q3lmZzY4QWo1YWZBY1IybnIzdTN2dFlMS1NKdHpOZmlyazg2NU5Ua1pidU52?=
 =?utf-8?B?RzBFNlZDd0sxNDRpSGI2S0M4WUUrak9PRlczSUlIQ29QUFZPRk1Lc0tQZDRF?=
 =?utf-8?B?dVUrSzhYTEl5Yi9tNlFMb1NKV0FzZlA3WWUwZDd4T1VwZ3B3bHRYdDd1Vnpq?=
 =?utf-8?B?eWpXM2dPK05WMHBWdjFwN0tyd2FKdFlHS200MmJyY2ZaSFNrbStpcXpSd2p3?=
 =?utf-8?B?SGtzNkE4M1A3bldFSStNamFsSngrOVFrUW9ORmJKNXpxZEVKNEU3dG5BREdS?=
 =?utf-8?B?cGxyc21TRDVqblNPN1EvSnlSaTNRV2FMN0MwMEhHdGFXUVhyL1N0SWxzVW1F?=
 =?utf-8?B?c1BzQmVlTWNVc1hQc2FkWUZVMHZuc3JpZHVycVJZRkpHejBBUVV3UWRnbDN2?=
 =?utf-8?B?WG5jNERST25qbGJveDF4SU1oeDhKTnB6USsrR1BXODAyd2thL3FvQ09lQXcy?=
 =?utf-8?B?MUg0Z2hUbmhYejdkWGR4UU5FRERRTWRSaTJIZ3Jia2xmbFlDNVVONEh5YjVX?=
 =?utf-8?B?YlVVeUl6K1RNcUdXcFdNd0dXQ2dJMDdDUlZLckE4V3BJWTluN2toZXRtUDFQ?=
 =?utf-8?B?NjlPYVB5NXcvZHRpSSt6OXF1NW0xaHQzMDZITzhOUWZTNkc2YXp5MnFTOFFL?=
 =?utf-8?B?MElpMTIrQUx2SlJuc0dNWXRPQTR3Zm5DWDh0UTNUVnU5NkhWN0NhdTRHNDNl?=
 =?utf-8?B?TVloTnVKTTFtdXZ3LzR6VG5vamExclU5d04xclN1ZmtwSEZ1ZS81YzdYc2tC?=
 =?utf-8?Q?bPaOm6oZ6UtUsKkykfRsvlX/iGPzQdEaIvs5O5H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A308163793528469D451334DC4DA068@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19314bf8-6d64-4fb2-86e3-08d9735053f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 05:11:49.1323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JbrUVUJVN4ziu9Atvmubh8BpMEDfIkjPd/tFzCjmeTPKAjnnqaXaZO38aj2D+DZ5mx5EK11cKqN16Egh9Izsm5n+H1vf143ipcLplKqJir0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1808
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10101
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090032
X-Proofpoint-GUID: YPk2i8Lk0mehBQCTp84ORxxjqcfwENeT
X-Proofpoint-ORIG-GUID: YPk2i8Lk0mehBQCTp84ORxxjqcfwENeT
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDcsIDIwMjEsIGF0IDY6MjEgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gVGhpcyB3YXkgdGhlIG5ldHdvcmsgY29t
bXVuaWNhdGlvbiBjb2RlIGRvZXNuJ3QgbmVlZCB0byBrbm93IGhvdw0KPiBtZXNzYWdlcyB3aWxs
IGJ5IHByb2Nlc3NlZCBieSB0aGUgY2xpZW50IG9yIHNlcnZlci4gVGhlcmUgaXMgbm8gbmVlZCBm
b3INCj4gaWYgKGlzcmVwbHkpIHsgcWVtdV9jb25kX3NpZ25hbCgmcmVwbHktPmN2KTsgfSBlbHNl
IHsNCj4gcHJveHktPnJlcXVlc3QocHJveHktPnJlcWFyZywgYnVmLCAmcmVxZmRzKTsgfS4gVGhl
IGNhbGxiYWNrcyBhbmQNCj4gdGhyZWFkcyBhcmVuJ3QgaGFyZGNvZGVkIGludG8gdGhlIG5ldHdv
cmsgY29tbXVuaWNhdGlvbiBjb2RlLg0KPiANCg0KCUkgZmVhciB3ZSBhcmUgdGFsa2luZyBwYXN0
IGVhY2ggb3RoZXIuICBUaGUgdmZpby11c2VyIHByb3RvY29sDQppcyBiaS1kaXJlY3Rpb25hbC4g
IGUuZy4sIHRoZSBjbGllbnQgYm90aCBzZW5kcyByZXF1ZXN0cyB0byB0aGUgc2VydmVyDQphbmQg
cmVjZWl2ZXMgcmVxdWVzdHMgZnJvbSB0aGUgc2VydmVyIG9uIHRoZSBzYW1lIHNvY2tldC4gIE5v
IG1hdHRlcg0Kd2hhdCB0aHJlYWRpbmcgbW9kZWwgd2UgdXNlLCB0aGUgcmVjZWl2ZSBhbGdvcml0
aG0gd2lsbCBiZToNCg0KDQpyZWFkIG1lc3NhZ2UgaGVhZGVyDQppZiBpdOKAmXMgYSByZXBseQ0K
ICAgc2NoZWR1bGUgdGhlIHRocmVhZCB3YWl0aW5nIGZvciB0aGUgcmVwbHkNCmVsc2UNCiAgIHJ1
biBhIGNhbGxiYWNrIHRvIHByb2Nlc3MgdGhlIHJlcXVlc3QNCg0KDQoJVGhlIG9ubHkgd2F5IEkg
Y2FuIHNlZSBjaGFuZ2luZyB0aGlzIGlzIHRvIGVzdGFibGlzaCB0d28NCnVuaS1kaXJlY3Rpb25h
bCBzb2NrZXRzOiBvbmUgZm9yIHJlcXVlc3RzIG91dGJvdW5kIHRvIHRoZSBzZXJ2ZXIsDQphbmQg
b25lIGZvciByZXF1ZXN0cyBpbmJvdW5kIGZyb20gdGhlIHNlcnZlci4NCg0KCVRoaXMgaXMgdGhl
IHJlYXNvbiBJIGNob3NlIHRoZSBpb3RocmVhZCBtb2RlbC4gIEl0IGNhbiBydW4NCmluZGVwZW5k
ZW50bHkgb2YgYW55IHZDUFUvbWFpbiB0aHJlYWRzIHdhaXRpbmcgZm9yIHJlcGxpZXMgYW5kIG9m
DQp0aGUgY2FsbGJhY2sgdGhyZWFkLiAgSSBkaWQgbXVkZGxlIHRoaXMgaWRlYSBieSBoYXZpbmcg
dGhlIGlvdGhyZWFkDQpiZWNvbWUgYSBjYWxsYmFjayB0aHJlYWQgYnkgZ3JhYmJpbmcgQlFMIGFu
ZCBydW5uaW5nIHRoZSBjYWxsYmFjaw0KaW5saW5lIHdoZW4gaXQgcmVjZWl2ZXMgYSByZXF1ZXN0
IGZyb20gdGhlIHNlcnZlciwgYnV0IGlmIHlvdSBsaWtlIGENCnB1cmUgZXZlbnQgZHJpdmVuIG1v
ZGVsLCBJIGNhbiBtYWtlIGluY29taW5nIHJlcXVlc3RzIGtpY2sgYSBCSCBmcm9tDQp0aGUgbWFp
biBsb29wLiAgZS5nLiwNCg0KaWYgaXTigJlzIGEgcmVwbHkNCiAgIHFlbXVfY29uZF9zaWduYWwo
cmVwbHkgY3YpDQplbHNlDQogICBxZW11X2JoX3NjaGVkdWxlKHByb3h5IGJoKQ0KDQoJVGhhdCB3
b3VsZCBhdm9pZCBkaXNjb25uZWN0IGhhdmluZyB0byBoYW5kbGUgdGhlIGlvdGhyZWFkDQpibG9j
a2VkIG9uIEJRTC4NCg0KDQo+IFRoaXMgZ29lcyBiYWNrIHRvIHRoZSBxdWVzdGlvbiBlYXJsaWVy
IGFib3V0IHdoeSBhIGRlZGljYXRlZCB0aHJlYWQgaXMNCj4gbmVjZXNzYXJ5IGhlcmUuIEkgc3Vn
Z2VzdCB3cml0aW5nIHRoZSBuZXR3b3JrIGNvbW11bmljYXRpb24gY29kZSB1c2luZw0KPiBjb3Jv
dXRpbmVzLiBUaGF0IHdheSB0aGUgY29kZSBpcyBlYXNpZXIgdG8gcmVhZCAobm8gY2FsbGJhY2tz
IG9yDQo+IHRocmVhZCBzeW5jaHJvbml6YXRpb24pLCB0aGVyZSBhcmUgZmV3ZXIgdGhyZWFkLXNh
ZmV0eSBpc3N1ZXMgdG8gd29ycnkNCj4gYWJvdXQsIGFuZCB1c2VycyBvciBtYW5hZ2VtZW50IHRv
b2xzIGRvbid0IG5lZWQgdG8ga25vdyBhYm91dCBhZGRpdGlvbmFsDQo+IHRocmVhZHMgKGUuZy4g
Q1BVL05VTUEgYWZmaW5pdHkpLg0KPiANCg0KDQoJSSBkaWQgbG9vayBhdCBjb3JvdXRpbmVzLCBi
dXQgdGhleSBzZWVtZWQgdG8gd29yayB3aGVuIHRoZSBzZW5kZXINCmlzIHRyaWdnZXJpbmcgdGhl
IGNvcm91dGluZSBvbiBzZW5kLCBub3Qgd2hlbiByZXF1ZXN0IHBhY2tldHMgYXJlIGFycml2aW5n
DQphc3luY2hyb25vdXNseSB0byB0aGUgc2VuZHMuDQoNCgkJCQkJCQkJSkoNCg0K

