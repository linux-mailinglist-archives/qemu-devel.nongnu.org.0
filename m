Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71B040BC8D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 02:23:03 +0200 (CEST)
Received: from localhost ([::1]:43152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQIha-00033g-AP
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 20:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mQIfw-0002NQ-UJ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 20:21:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mQIft-0000eF-Qs
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 20:21:20 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18EKxZlG025976; 
 Wed, 15 Sep 2021 00:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=tF76pcHxkBMsXc9MPnQ8q3peXaezx2mv9APlkNUgfOw=;
 b=EyRF2T+83rFUNkuDN7bG0++oJ3JucQ2n02RiT6xv4DVPSjJmLtG8glR2UOuM2u2yohC3
 AQJr3ZNI3k5H06QK2IdzLXPrXjfPJ9Gx5w+49r2g5t5sQLZScjOAZV04g5bOA/inGPtG
 gW2QqzwHCMV5eLA2RUvt84wUR4gaYrKUT+b93NfdrrgEqUKHODIGMbN5mOXOhn/I2xAZ
 K935KfltKAAw/FxouebFffAldukEo/mYy5aFaF3seqMc3tR85ibDS+ZCpnw0hVNlmezQ
 UAl2HLcEIDg6Fk/3IhU0XgYNN5gdPQhs+hJ1gCLdkNQC0p4XQvUer3l+0pOsP9EFXiAL Vg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=tF76pcHxkBMsXc9MPnQ8q3peXaezx2mv9APlkNUgfOw=;
 b=nlaQKXDY4dUZAtgVUViasiyvGQqcex0ZPTheA3U3dCrYP4G9km9geySZaUXBjC3dkHpn
 VnwC30yd9E3miPC91bXxiJlIWl0LjRWJxTph7vmJGjzTqpZnan4Yo7ilkPpj+3tI5xhs
 GZE1P3PWIrvx+XcVVzZU1RJajFYgsUjHTAwzaU3OhIiS+KklmflbdqeNgtNKG51Yfqnp
 0eFr8bkJZLPia0Lkv5MmtxaVduU1sH7DpQu8uZbhWzuLz03BXVJra6wCCDa3IBR+GZhe
 UzeRw8LDCvac4eAcZd6fU8DL9BZj6F1CrFCV1HoFxWtnmyTIefsYFiHjoCsxmw/p+0bt mw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b2j4sbnpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 00:21:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18F0KRg0195900;
 Wed, 15 Sep 2021 00:21:12 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
 by aserp3020.oracle.com with ESMTP id 3b0m971wm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 00:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j42lOKAzds6HAxvQRfXzVOAQxoPmP/0qb2LSf12f/v1C4EvUVg3QAD6l90KXytQZVItThYmKjJag7OQdr0kyYe+TJ7YC8/IWG6DTLxc0yGRz3lg/JpM8B1nWOEG6qi9p3o2cdNpF3p0MC1NObXWOKNI5q0Rx21yHp+Hu0mRkYb6yfvmiSGXMTbZ/fdo2+i//bMD0HswtWOpSGcwmmMkRJsqmaGw7YWfGJIVYTXgmVRCPpRhLek7bSQUZ8rC9D/21IwNLksF4vZfZcZ4vH+02aV9GtpKuM6m0LlwrWu/9BwUQFeLWSKvSl8fqwvC6TQ050F/6XIqAY13ce4Xbvzj/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tF76pcHxkBMsXc9MPnQ8q3peXaezx2mv9APlkNUgfOw=;
 b=JmUJ7gSoSlDEEvMn76f1rUdquOhVP+HE+Xh2F2N7h9KD88ablMddOkV3pd9jgY6m27A8YEf2SwS9yW4DJgE36NkpCFBaY/sgNSgdtdLCLRJ7bh0FdRAZCBKMlMmFC2irLoUuEdZGh1P+s5Pvi3mNZzh9l7Dtl7ZlCMpAaytdY8mPtjlLjVRBJdFqrTQlFvBA77aeoZvk/cOUZGCl/ipGEGHpCRUJ5uWcgbLxITsKe5skPBbKJR3qALemP/DMWtMx+QsByrrSKVWojJYDDAlxKPP7SpP/fQ+F2ggoojMCOkaDtm9N+9eWYttfiVaG+nneGfDb5nLwfaGaqgVXbrej2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tF76pcHxkBMsXc9MPnQ8q3peXaezx2mv9APlkNUgfOw=;
 b=MZNNqt+ZJmbWA0bvqRdNJ+sdYz86a7vwDlbOgdM7O+De7KnBJARl7kCPhKCEDreil96QzAjz7wzSj64lzfprg/r65v8JAfftwP/ynixaRgSBLnacSscGcVXSzGbZRLbp2C4ChNAr3ZRDL7Q3+v4vj4nWu90/27eh4BVmOpQsbxU=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR1001MB2111.namprd10.prod.outlook.com
 (2603:10b6:301:34::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 15 Sep
 2021 00:21:10 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 00:21:10 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Topic: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Index: AQHXkr3ElMGqWLWPTUyD8mY3/VudXauCv3UAgAixeACADUAUgIACm+QAgAAVpICAAYBwAIAFf7EAgAFKaYCAALycAA==
Date: Wed, 15 Sep 2021 00:21:10 +0000
Message-ID: <F156C9C7-7AAB-4FCB-83AF-AC25F3AB9562@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <YST++FLqV02TlusW@stefanha-x1.localdomain>
 <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
 <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
 <22CBE2AD-14EB-4162-9E97-FB7D279480AA@oracle.com>
 <YTmpu6BQ8NNrl8gk@stefanha-x1.localdomain>
 <9F0B3728-7F6C-4FBB-BF4C-49F29324F1F5@oracle.com>
 <B1D64D41-DC76-42A2-85C2-85D6DF9D973A@oracle.com>
 <YUCeP3jGesiv0Xf5@stefanha-x1.localdomain>
In-Reply-To: <YUCeP3jGesiv0Xf5@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46bdf318-52ba-4d24-8271-08d977deb825
x-ms-traffictypediagnostic: MWHPR1001MB2111:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB2111B50EDF4710092C4427B2B6DB9@MWHPR1001MB2111.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UdyEV0dvSDtbgoB/Vd/SG7GS9LsF+OXNxxBaIGgG5NzD+raFbXRhkre4DTUAzBxXhWZAdWfrX3iIaF9WP+5fUeLTpsFjnDLTQmD7iOGw2bJT0O1Yg0YMhPt1bqSk3rWbyaxqGlenqotuLdPqEfPnzdYxFdBt8QGXyiCxjKzVl6cBarzQynka+N/yhxXEgMcXRjT9wC7kd50R1zd/MAcxGdttw3KLkINfw72lbSEeMSALKKILEbR6E498FvDM7Lc/0guhRbmcW8RCa39ukoZ6XochmhJy/L64mZfOEXVYi+ge4Ise6aYzmXDYGhGA3YRBwFO4tjYaGbRvLDH4cOgG9TFpkC+PmnOtsymDC41zFmoxEJKTbRI+j1NJLM1i2ea9CFOoUxvVo+htcv0arH+2XtLMTXOsYK9BG0phGatOC4+LZaRS9rJRV3vK2ud2cRpHLxT/85/8Bq6w4QwJeFb0qtE2PaGNb2C2QWM0OSIhSungikGA3/Hz8vhtCt4Q8MdWeGUSHLK9TzeJS13GMUzmsKiJkc8XhWg5aHpS15QCO6p3uHWL7xaXRSc2ri0w/Cpw6oVLVp6A6BUWSoWvhcKKCNOFs2ducqfAufo/74KcNMkncM9Ew55dIiPdWWDr9vU6RHF8HzkiwtcGi5i+OeSFRHQ+H80e2sJwr46EKMUAroLxCDpy2FC/oXL9FlB4v2EwVZZtiMxeR3tlUsMgY33/bHpqVDODn6vcMnmGvTvP0XzGmcoxmQeXEf6TlWc7WjJa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(39860400002)(396003)(366004)(6512007)(122000001)(2616005)(66946007)(26005)(36756003)(38100700002)(66556008)(186003)(4326008)(6506007)(316002)(66446008)(38070700005)(66476007)(64756008)(6916009)(76116006)(54906003)(5660300002)(71200400001)(8936002)(6486002)(8676002)(86362001)(478600001)(83380400001)(53546011)(33656002)(91956017)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTBvdVN3VUI0N2EydkR4eGg3NTF0M0tWa29vc1A2T3o4SWNQUVRrTTF4VzhX?=
 =?utf-8?B?NElEU01lcldCRHBzWnRQME5YWjMrcXNwZHB6bEYxeXFYUzRROFlKV1RpQkJS?=
 =?utf-8?B?VEwzMnM2TksraTJjUGJoNWRPRlZYZ1JieERxUTB1Z0ZjU0NPQlB2UUVHTlRI?=
 =?utf-8?B?Wmx5ZUxTMzlrVHZpSEdsMm4za3ZNLzlzUXd5RU5Jd1B3VGN3S0ZtNitmdVdP?=
 =?utf-8?B?eUdHMDczWDNNNEdrN3Myc2RVdWpnMDBOVmE5a0l6SndEYkFnRFV3UldYRlZh?=
 =?utf-8?B?SU96SGJVREdLNXR2TUN1T1BwS0lwSWdwV281U3VmbnhDNkpkSEtGYnRZZHZ5?=
 =?utf-8?B?SkxmUjQvSlQxK2lCMmhJWFdSdXhtYkh6ZndhMDAvV1QzNU1XekFTUHFndVp2?=
 =?utf-8?B?Vzlsbmlndmx1WHN5OEtEbDBpK1JzS2NXK3dtOWs5aDJ4MEZYNXJtNDAxanBU?=
 =?utf-8?B?OVdWdEdtb1JxN0syV2FWN3BkUXdIUlJSSzB2QjlBemkvWStZN2R2Yjc1Y0po?=
 =?utf-8?B?UjFlLzNtZXhlVVk0NnphUVp2QkFYU2tVck1WWWJvR1VMazZBMUF2WlcwVGNC?=
 =?utf-8?B?N0FSN2pmWkgvUzFWSVB6Q29qNjlKV1FDTW50eHptaCtUa2xMNmJ3VVlPaHFG?=
 =?utf-8?B?cjV3aVd4ckllNlZ2SFEzZEZzeThOODZzTFUxUmxrSkY3UlZqMVJOS1NScFhE?=
 =?utf-8?B?QVQ2c2taM2ZkcHFiakNVdnJZTGk2QkZaN3J1ZmNIbUdYL0QvbDlpQjhXbzdV?=
 =?utf-8?B?RXZGK0JJekpOWUlPTEwrTWVDRXY3VW0xay9UQXNDRFhjRmZBbWdtQ0k4UHNm?=
 =?utf-8?B?NWJHTmVqYVR5NjE2UzVxd3NYYmIwWlRFM3k0Zi9QRkFGWlRBOXVKT2VqS2ND?=
 =?utf-8?B?SUUyaVBHT0VQYzN2eHJZak1IbnRybnpoTnVoZlVGbXRqUys3dTRhMy9MNEdr?=
 =?utf-8?B?aEdUZjE3bHg4cGxwOVhTSk5PMHR2UVVVZjdiTXBlWCt1aHZGQkhPem1OOWdY?=
 =?utf-8?B?MlQ2aVZXSUJRZHNRZmZvUDRPNWhiUzBFSXlOZ2lFRFpWVGxsbkJhWEVHVEwr?=
 =?utf-8?B?NGMyb1lIeEV1cTYzQUZRcjJ2M0dJZXh2WldBTE5udHhxOTg3TkpNRUpoSEhZ?=
 =?utf-8?B?RDFWS0VYVmdETVo3d2I4OU82bkdKTjJEVEZpMGJZUldaZVVVbW1EdFVFTUh3?=
 =?utf-8?B?RGk3d2tLejV3bTdGbHpsZkxtTEd2ZEhhNE8zOWRLRldVS3FmL1E2QjFMWHdy?=
 =?utf-8?B?V25FWElGejlldEE3TkptalBHM1l1bDJhU3pxQVV0dkp5U0lPOTh6WFFUZlZG?=
 =?utf-8?B?VHNPMEtHdTJZait3d1VBdENvekhXbHlwMlJiQUQ4YVZvQmJ0Vnp3TjdVTi9y?=
 =?utf-8?B?OFNQaVQ0MmRZak55SmNhR1Z3ZWFnMTBQbWd3cUV3N0hDMlVBZ21Oa0FTQXRu?=
 =?utf-8?B?eWJndG95eGQ4K0crNzBOdlJtaTN2cHZ0c2syWXZsaDAwZXVXTGlXNENhczhK?=
 =?utf-8?B?K1FYNWE2WmptNEpVUGhSbC95ZlpHOWlGM3BBWi80RXVTbm15NmQyeVMxY0s2?=
 =?utf-8?B?T1c3OVZERVJqSUdHdHJ0aXZscC9JWFhDVEZ4VUtvVVgwS3gySmcyaDZESWZN?=
 =?utf-8?B?Q3RUTkZHYW9wQzdPRExmaDFxeW9oSmRISVd5Zkdid1FoV1R2aktHd2djK3dw?=
 =?utf-8?B?Zkl4YzdjbTFUY0lpK0NMb1pyWlRWTk9lTi8vNmpOcUdMeUwwMkRBYnRlMVhY?=
 =?utf-8?Q?agQ24iSEiJ5Gw+1wDvButFmLskDzBjFVwUA1MVt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B997CD50E953194EB2C23015FE1C837A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bdf318-52ba-4d24-8271-08d977deb825
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 00:21:10.4157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1snlaxL+5WcemQZzQ51zFrLAlnjmmUs/CsuxKjB3GtlizIuT7FmrpN3lCXKDQ11QFgaVGcdhu89GyvAWstq41hGQSLbpT5+Pq8Vixgr3aao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2111
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10107
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109150000
X-Proofpoint-ORIG-GUID: h8FOC9UrhDMEqsIC_2nlWGqHQ4j6LiPz
X-Proofpoint-GUID: h8FOC9UrhDMEqsIC_2nlWGqHQ4j6LiPz
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDE0LCAyMDIxLCBhdCA2OjA2IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBTZXAgMTMsIDIwMjEgYXQgMDU6
MjM6MzNQTSArMDAwMCwgSm9obiBKb2huc29uIHdyb3RlOg0KPj4+PiBPbiBTZXAgOSwgMjAyMSwg
YXQgMTA6MjUgUE0sIEpvaG4gSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4gd3Jv
dGU6DQo+Pj4+PiBPbiBTZXAgOCwgMjAyMSwgYXQgMTE6MjkgUE0sIFN0ZWZhbiBIYWpub2N6aSA8
c3RlZmFuaGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiBUaHUsIFNlcCAwOSwgMjAyMSBh
dCAwNToxMTo0OUFNICswMDAwLCBKb2huIEpvaG5zb24gd3JvdGU6DQo+Pj4+Pj4gCUkgZGlkIGxv
b2sgYXQgY29yb3V0aW5lcywgYnV0IHRoZXkgc2VlbWVkIHRvIHdvcmsgd2hlbiB0aGUgc2VuZGVy
DQo+Pj4+Pj4gaXMgdHJpZ2dlcmluZyB0aGUgY29yb3V0aW5lIG9uIHNlbmQsIG5vdCB3aGVuIHJl
cXVlc3QgcGFja2V0cyBhcmUgYXJyaXZpbmcNCj4+Pj4+PiBhc3luY2hyb25vdXNseSB0byB0aGUg
c2VuZHMuDQo+Pj4+PiANCj4+Pj4+IFRoaXMgY2FuIGJlIGRvbmUgd2l0aCBhIHJlY2VpdmVyIGNv
cm91dGluZS4gSXRzIGpvYiBpcyB0byBiZSB0aGUgb25seQ0KPj4+Pj4gdGhpbmcgdGhhdCByZWFk
cyB2ZmlvLXVzZXIgbWVzc2FnZXMgZnJvbSB0aGUgc29ja2V0LiBBIHJlY2VpdmVyDQo+Pj4+PiBj
b3JvdXRpbmUgcmVhZHMgbWVzc2FnZXMgZnJvbSB0aGUgc29ja2V0IGFuZCB3YWtlcyB1cCB0aGUg
d2FpdGluZw0KPj4+Pj4gY29yb3V0aW5lIHRoYXQgeWllbGRlZCBmcm9tIHZmaW9fdXNlcl9zZW5k
X3JlY3YoKSBvcg0KPj4+Pj4gdmZpb191c2VyX3BjaV9wcm9jZXNzX3JlcSgpLg0KPj4+Pj4gDQo+
Pj4+PiAoQWx0aG91Z2ggdmZpb191c2VyX3BjaV9wcm9jZXNzX3JlcSgpIGNvdWxkIGJlIGNhbGxl
ZCBkaXJlY3RseSBmcm9tIHRoZQ0KPj4+Pj4gcmVjZWl2ZXIgY29yb3V0aW5lLCBpdCBzZWVtcyBz
YWZlciB0byBoYXZlIGEgc2VwYXJhdGUgY29yb3V0aW5lIHRoYXQNCj4+Pj4+IHByb2Nlc3NlcyBy
ZXF1ZXN0cyBzbyB0aGF0IHRoZSByZWNlaXZlciBpc24ndCBibG9ja2VkIGluIGNhc2UNCj4+Pj4+
IHZmaW9fdXNlcl9wY2lfcHJvY2Vzc19yZXEoKSB5aWVsZHMgd2hpbGUgcHJvY2Vzc2luZyBhIHJl
cXVlc3QuKQ0KPj4+Pj4gDQo+Pj4+PiBHb2luZyBiYWNrIHRvIHdoYXQgeW91IG1lbnRpb25lZCBh
Ym92ZSwgdGhlIHJlY2VpdmVyIGNvcm91dGluZSBkb2VzDQo+Pj4+PiBzb21ldGhpbmcgbGlrZSB0
aGlzOg0KPj4+Pj4gDQo+Pj4+PiBpZiBpdCdzIGEgcmVwbHkNCj4+Pj4+ICAgIHJlcGx5ID0gZmlu
ZF9yZXBseSguLi4pDQo+Pj4+PiAgICBxZW11X2Nvcm91dGluZV9lbnRlcihyZXBseS0+Y28pIC8v
IGluc3RlYWQgb2Ygc2lnbmFsbGluZyByZXBseS0+Y3YNCj4+Pj4+IGVsc2UNCj4+Pj4+ICAgIFFT
SU1QTEVRX0lOU0VSVF9UQUlMKCZwZW5kaW5nX3JlcXMsIHJlcXVlc3QsIG5leHQpOw0KPj4+Pj4g
ICAgaWYgKHBlbmRpbmdfcmVxc193YXNfZW1wdHkpIHsNCj4+Pj4+ICAgICAgICBxZW11X2Nvcm91
dGluZV9lbnRlcihwcm9jZXNzX3JlcXVlc3RfY28pOw0KPj4+Pj4gICAgfQ0KPj4+Pj4gDQo+Pj4+
PiBUaGUgcGVuZGluZ19yZXFzIHF1ZXVlIGhvbGRzIGluY29taW5nIHJlcXVlc3RzIHRoYXQgdGhl
DQo+Pj4+PiBwcm9jZXNzX3JlcXVlc3RfY28gY29yb3V0aW5lIHByb2Nlc3Nlcy4NCj4+Pj4+IA0K
Pj4+PiANCj4+Pj4gDQo+Pj4+IAlIb3cgZG8gY29yb3V0aW5lcyB3b3JrIGFjcm9zcyB0aHJlYWRz
PyAgVGhlcmUgY2FuIGJlIG11bHRpcGxlIHZDUFUNCj4+Pj4gdGhyZWFkcyB3YWl0aW5nIGZvciBy
ZXBsaWVzLCBhbmQgSSB0aGluayB0aGUgcmVjZWl2ZXIgY29yb3V0aW5lIHdpbGwgYmUNCj4+Pj4g
cnVubmluZyBpbiB0aGUgbWFpbiBsb29wIHRocmVhZC4gIFdoZXJlIHdvdWxkIGEgdkNQVSBibG9j
ayB3YWl0aW5nIGZvcg0KPj4+PiBhIHJlcGx5PyAgSSB0aGluayBjb3JvdXRpbmVfeWllbGQoKSBy
ZXR1cm5zIHRvIGl0cyBjb3JvdXRpbmVfZW50ZXIoKSBjYWxsZXINCj4+PiANCj4+PiANCj4+PiAN
Cj4+PiBBIHZDUFUgdGhyZWFkIGhvbGRpbmcgdGhlIEJRTCBjYW4gaXRlcmF0ZSB0aGUgZXZlbnQg
bG9vcCBpZiBpdCBoYXMNCj4+PiByZWFjaGVkIGEgc3luY2hyb25vdXMgcG9pbnQgdGhhdCBuZWVk
cyB0byB3YWl0IGZvciBhIHJlcGx5IGJlZm9yZQ0KPj4+IHJldHVybmluZy4gSSB0aGluayB3ZSBo
YXZlIHRoaXMgc2l0dWF0aW9uIHdoZW4gYSBNZW1vcnlSZWdpb24gaXMNCj4+PiBhY2Nlc3NlZCBv
biB0aGUgcHJveHkgZGV2aWNlLg0KPj4+IA0KPj4+IEZvciBleGFtcGxlLCBibG9jay9ibG9jay1i
YWNrZW5kLmM6YmxrX3BydygpIGtpY2tzIG9mZiBhIGNvcm91dGluZSBhbmQNCj4+PiB0aGVuIHJ1
bnMgdGhlIGV2ZW50IGxvb3AgdW50aWwgdGhlIGNvcm91dGluZSBmaW5pc2hlczoNCj4+PiANCj4+
PiAgQ29yb3V0aW5lICpjbyA9IHFlbXVfY29yb3V0aW5lX2NyZWF0ZShjb19lbnRyeSwgJnJ3Y28p
Ow0KPj4+ICBiZHJ2X2Nvcm91dGluZV9lbnRlcihibGtfYnMoYmxrKSwgY28pOw0KPj4+ICBCRFJW
X1BPTExfV0hJTEUoYmxrX2JzKGJsayksIHJ3Y28ucmV0ID09IE5PVF9ET05FKTsNCj4+PiANCj4+
PiBCRFJWX1BPTExfV0hJTEUoKSBib2lscyBkb3duIHRvIGEgbG9vcCBsaWtlIHRoaXM6DQo+Pj4g
DQo+Pj4gIHdoaWxlICgoY29uZCkpIHsNCj4+PiAgICBhaW9fcG9sbChjdHgsIHRydWUpOw0KPj4+
ICB9DQo+Pj4gDQo+PiANCj4+IAlJIHRoaW5rIHRoYXQgd291bGQgbWFrZSB2Q1BVcyBzZW5kaW5n
IHJlcXVlc3RzIGFuZCB0aGUNCj4+IHJlY2VpdmVyIGNvcm91dGluZSBhbGwgcG9sbCBvbiB0aGUg
c2FtZSBzb2NrZXQuICBJZiB0aGUg4oCcd3JvbmfigJ0NCj4+IHJvdXRpbmUgcmVhZHMgdGhlIG1l
c3NhZ2UsIEnigJlkIG5lZWQgYSBzZWNvbmQgbGV2ZWwgb2Ygc3luY2hyb25pemF0aW9uDQo+PiB0
byBwYXNzIHRoZSBtZXNzYWdlIHRvIHRoZSDigJxyaWdodOKAnSBvbmUuICBlLmcuLCBpZiB0aGUg
dkNQVSBjb3JvdXRpbmUNCj4+IHJlYWRzIGEgcmVxdWVzdCwgaXQgbmVlZHMgdG8gcGFzcyBpdCB0
byB0aGUgcmVjZWl2ZXI7IGlmIHRoZSByZWNlaXZlcg0KPj4gY29yb3V0aW5lIHJlYWRzIGEgcmVw
bHksIGl0IG5lZWRzIHRvIHBhc3MgaXQgdG8gYSB2Q1BVLg0KPj4gDQo+PiAJQXZvaWRpbmcgdGhp
cyBjb21wbGV4aXR5IGlzIG9uZSBvZiB0aGUgcmVhc29ucyBJIHdlbnQgd2l0aA0KPj4gYSBzZXBh
cmF0ZSB0aHJlYWQgdGhhdCBvbmx5IHJlYWRzIHRoZSBzb2NrZXQgb3ZlciB0aGUgbXAtcWVtdSBt
b2RlbCwNCj4+IHdoaWNoIGRvZXMgaGF2ZSB0aGUgc2VuZGVyIHBvbGwsIGJ1dCBkb2VzbuKAmXQg
bmVlZCB0byBoYW5kbGUgaW5jb21pbmcNCj4+IHJlcXVlc3RzLg0KPiANCj4gT25seSBvbmUgY29y
b3V0aW5lIHJlYWRzIGZyb20gdGhlIHNvY2tldCwgdGhlICJyZWNlaXZlciIgY29yb3V0aW5lLiBJ
biBhDQo+IHByZXZpb3VzIHJlcGx5IEkgc2tldGNoZWQgd2hhdCB0aGUgcmVjZWl2ZXIgZG9lczoN
Cj4gDQo+ICBpZiBpdCdzIGEgcmVwbHkNCj4gICAgICByZXBseSA9IGZpbmRfcmVwbHkoLi4uKQ0K
PiAgICAgIHFlbXVfY29yb3V0aW5lX2VudGVyKHJlcGx5LT5jbykgLy8gaW5zdGVhZCBvZiBzaWdu
YWxsaW5nIHJlcGx5LT5jdg0KPiAgZWxzZQ0KPiAgICAgIFFTSU1QTEVRX0lOU0VSVF9UQUlMKCZw
ZW5kaW5nX3JlcXMsIHJlcXVlc3QsIG5leHQpOw0KPiAgICAgIGlmIChwZW5kaW5nX3JlcXNfd2Fz
X2VtcHR5KSB7DQo+ICAgICAgICAgIHFlbXVfY29yb3V0aW5lX2VudGVyKHByb2Nlc3NfcmVxdWVz
dF9jbyk7DQo+ICAgICAgfQ0KPiANCg0KCVNvcnJ5LCBJIHdhcyBhc3N1bWluZyB3aGVuIHlvdSBz
YWlkIHRoZSBjb3JvdXRpbmUgd2lsbCBibG9jayB3aXRoDQphaW9fcG9sbCgpLCB5b3UgaW1wbGll
ZCBpdCB3b3VsZCBhbHNvIHJlYWQgbWVzc2FnZXMgZnJvbSB0aGUgc29ja2V0Lg0KIA0KDQo+IFRo
ZSBxZW11X2Nvcm91dGluZV9lbnRlcihyZXBseS0+Y28pIGNhbGwgcmUtZW50ZXJzIHRoZSBjb3Jv
dXRpbmUgdGhhdA0KPiB3YXMgY3JlYXRlZCBieSB0aGUgdkNQVSB0aHJlYWQuIElzIHRoaXMgdGhl
ICJzZWNvbmQgbGV2ZWwgb2YNCj4gc3luY2hyb25pemF0aW9uIiB0aGF0IHlvdSBkZXNjcmliZWQ/
IEl0J3MgdmVyeSBzaW1pbGFyIHRvIHNpZ25hbGxpbmcNCj4gcmVwbHktPmN2IGluIHRoZSBleGlz
dGluZyBwYXRjaC4NCj4gDQoNCglZZXMsIHRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgaXQgd291bGQg
YmUgd29rZW4gb24gZWFjaCBtZXNzYWdlLA0KZXZlbiB0aG91Z2ggaXQgZG9lc27igJl0IHJlYWQg
dGhlbS4gIFdoaWNoIGlzIHdoYXQgSSB0aGluayB5b3XigJlyZSBhZGRyZXNzaW5nDQpiZWxvdy4N
Cg0KDQo+IE5vdyBJJ20gYWN0dWFsbHkgdGhpbmtpbmcgYWJvdXQgd2hldGhlciB0aGlzIGNhbiBi
ZSBpbXByb3ZlZCBieSBrZWVwaW5nDQo+IHRoZSBjb25kdmFyIHNvIHRoYXQgdGhlIHZDUFUgdGhy
ZWFkIGRvZXNuJ3QgbmVlZCB0byBjYWxsIGFpb19wb2xsKCkNCj4gKHdoaWNoIGlzIGF3a3dhcmQg
YmVjYXVzZSBpdCBkb2Vzbid0IGRyb3AgdGhlIEJRTCBhbmQgdGhlcmVmb3JlIGJsb2Nrcw0KPiBv
dGhlciB2Q1BVcyBmcm9tIG1ha2luZyBwcm9ncmVzcykuIFRoYXQgYXBwcm9hY2ggd291bGRuJ3Qg
cmVxdWlyZSBhDQo+IGRlZGljYXRlZCB0aHJlYWQgZm9yIHZmaW8tdXNlci4NCj4gDQoNCglXb3Vs
ZG7igJl0IHlvdSBuZWVkIHRvIGFjcXVpcmUgQlFMIHR3aWNlIGZvciBldmVyeSB2Q1BVIHJlcGx5
OiBvbmNlIHRvDQpydW4gdGhlIHJlY2VpdmVyIGNvcm91dGluZSwgYW5kIG9uY2Ugd2hlbiB0aGUg
dkNQVSB0aHJlYWQgd2FrZXMgdXAgYW5kIHdhbnRzDQp0byByZXR1cm4gdG8gdGhlIFZGSU8gY29k
ZS4gIFRoZSBtaWdyYXRpb24gdGhyZWFkIHdvdWxkIGFsc28gYWRkIGEgQlFMDQpkZXBlbmRlbmN5
LCB3aGVyZSBpdCBkaWRu4oCZdCBoYXZlIG9uZSBiZWZvcmUuDQoNCglJcyB5b3VyIG9iamVjdGlv
biB3aXRoIHVzaW5nIGFuIGlvdGhyZWFkLCBvciB1c2luZyBhIHNlcGFyYXRlIHRocmVhZD8NCkkg
Y2FuIGNoYW5nZSB0byB1c2luZyBxZW11X3RocmVhZF9jcmVhdGUoKSBhbmQgcnVubmluZyBhaW9f
cG9sbCgpIGZyb20gdGhlDQp0aHJlYWQgcm91dGluZSwgaW5zdGVhZCBvZiBjcmVhdGluZyBhbiBp
b3RocmVhZC4NCg0KDQoJT24gYSByZWxhdGVkIHN1YmplY3Q6DQoNCk9uIEF1ZyAyNCwgMjAyMSwg
YXQgODoxNCBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPiB3cm90ZToN
Cg0KPj4gKyAgICByZXQgPSBxaW9fY2hhbm5lbF9yZWFkdl9mdWxsKHByb3h5LT5pb2MsICZpb3Ys
IDEsICZmZHAsICZudW1mZHMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JmxvY2FsX2Vycik7DQo+IA0KPiBUaGlzIGlzIGEgYmxvY2tpbmcgY2FsbC4gTXkgdW5kZXJzdGFu
ZGluZyBpcyB0aGF0IHRoZSBJT1RocmVhZCBpcyBzaGFyZWQNCj4gYnkgYWxsIHZmaW8tdXNlciBk
ZXZpY2VzLCBzbyBvdGhlciBkZXZpY2VzIHdpbGwgaGF2ZSB0byB3YWl0IGlmIG9uZSBvZg0KPiB0
aGVtIGlzIGFjdGluZyB1cCAoZS5nLiB0aGUgZGV2aWNlIGVtdWxhdGlvbiBwcm9jZXNzIHNlbnQg
bGVzcyB0aGFuDQo+IHNpemVvZihtc2cpIGJ5dGVzKS4NCg0KDQoJVGhpcyBzaG91bGRu4oCZdCBi
bG9jayBpZiB0aGUgZW11bGF0aW9uIHByb2Nlc3Mgc2VuZHMgbGVzcyB0aGFuIHNpemVvZihtc2cp
DQpieXRlcy4gIHFpb19jaGFubmVsX3JlYWR2KCkgd2lsbCBldmVudHVhbGx5IGNhbGwgcmVjdm1z
ZygpLCB3aGljaCBvbmx5IGJsb2NrcyBhDQpzaG9ydCByZWFkIGlmIE1TR19XQUlUQUxMIGlzIHNl
dCwgYW5kIGl04oCZcyBub3Qgc2V0IGluIHRoaXMgY2FzZS4gIHJlY3Ztc2coKSB3aWxsDQpyZXR1
cm4gdGhlIGRhdGEgYXZhaWxhYmxlLCBhbmQgdmZpb191c2VyX3JlY3YoKSB3aWxsIHRyZWF0IGEg
c2hvcnQgcmVhZCBhcyBhbiBlcnJvci4NCg0KCQkJCQkJCQlKSg0KDQo=

