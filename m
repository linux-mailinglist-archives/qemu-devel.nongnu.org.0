Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A10B5BFE25
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:44:43 +0200 (CEST)
Received: from localhost ([::1]:43026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaz5m-0004B8-Dy
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=626359b9fd=bin.meng@windriver.com>)
 id 1oayZT-0008Ni-Aw; Wed, 21 Sep 2022 08:11:19 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:63780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=626359b9fd=bin.meng@windriver.com>)
 id 1oayZQ-0006T4-DZ; Wed, 21 Sep 2022 08:11:18 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LBQfJ8025985;
 Wed, 21 Sep 2022 05:10:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=5IX1cmyERLLuY1chZ9Widkd03GyVzZX+bbBRRCiGUlg=;
 b=Y3du+fMOJi3J/JN48EuiGuuptYgs1/44bRbEATLxh3aIMJQNRRhykDgZ2As44YkTlDqU
 uoBVbTOIe1SADg+Jga9boMTnhEQV455YM1VIttgmEUfaU8zlQ9ILI1Bla0FcOOTvfY2T
 krDwn5zoDEwm4exDWN4d9YBZ6JZBfHzlbwcllG3J8dhrFXrEabr2v1SRkCOyFK9e8/ee
 ROQ8KFL2GMTsf7M2nXd2aKfAaN0T+42JZPbP0X1O7ijhfaHzFJWu4Glrgl9CmUoy7YGO
 gcgShYXtMJfGzk+DTkrwVCbyjQF50+fUAuhDQrduEuJKeHYiRftVcDxOdecGvqUUL/db aA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jndrkk4x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Sep 2022 05:10:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6Fv4IvFnnI2E2Ib/uflyJfJnKnX80reCaD28AHG5UN6tgq5T3I9vJS3uBHC2GTQYmxKmtCd5sKv2GNLze0exT0G2ocUpMeNRwsRCifHzHCEA2JmN5W3+e0r3IfXSz962RWC7xgCsIdJnPoEab3HiNNEks/9nleWaWlQuqtRPaWxx4J14Cf96PY4QGU3VupbGVbPPLHHyWiMd3enVrfR8XCNFK3QzuFUQQSIoAwr0RhEfm+jHcPk4jZLgRIEIanx+THxSRNkWdE4QwVNxYyw3i/puabNBA0T/vzeq5DpNL5xloBU7U2RtkE8fhc0Ux2WshbkRTwoakT17uPa57eusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IX1cmyERLLuY1chZ9Widkd03GyVzZX+bbBRRCiGUlg=;
 b=PQcoja8i8jqSOfw/GNH9+j08szDgm5vdtyES6SEaOtEWxG7uMhkJ/EqnH/eyE9O5Tknt2VSgrDo4pQYOmz+x5Hqfk+zMSIqrvKiqclccTIVhgJPdwQ+2RPHq2gNBKssJEwn7c1Smtc8YVluQu7ynJVmbAnsnNNjAb9ghd798b/2SML0ktTMrrSHzpHNoBXmldw27Hob3eYO9a1khdtBW3y+PeQt601KsuSkCx7e1jy1u98pKmHDuNOJt1YyrTlE9E77CU5hdSXqoW70VmIM0uEdPn8UTv07iok/SSXXOmoQNqf6EAjWt9zfI+7rmqsMHs3/ORcjxwifH76cOJ0luWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 12:10:53 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::1c50:83e9:d2fa:ebe9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::1c50:83e9:d2fa:ebe9%8]) with mapi id 15.20.5632.021; Wed, 21 Sep 2022
 12:10:52 +0000
From: "Meng, Bin" <Bin.Meng@windriver.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Bin Meng
 <bmeng.cn@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Peter
 Lieven <pl@kamp.de>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: RE: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
Thread-Topic: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
Thread-Index: AQHYytz4lHGYqqwbo06dehr9B37FKK3pzg4Q
Date: Wed, 21 Sep 2022 12:10:52 +0000
Message-ID: <DM4PR11MB53589BB8CFF45CE67683E762914F9@DM4PR11MB5358.namprd11.prod.outlook.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-6-bmeng.cn@gmail.com>
 <f3447651-dadb-c0ed-f1f8-4ad80b551acf@amsat.org>
In-Reply-To: <f3447651-dadb-c0ed-f1f8-4ad80b551acf@amsat.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5358:EE_|MN2PR11MB4568:EE_
x-ms-office365-filtering-correlation-id: ed8d1e07-ca77-4088-a0a0-08da9bca5445
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ua0iEtWHU5i7fl53LNnzzeOCH4US+8J8unRWeLbqupLQ+EW3r6juDA76UE5KpzdYTlDHcRwLAH6OnEYZHVXDWu4fxWzxBmcX1RPt7mFF4EA9VukHzKLHsZUQR4N+kj0Zd39o5/pAAAqTQjKfKOQz18x4k8EsoEVRF5/lzsL7UyUmSmZo87aUcYNP4CN9Uip033X44Uz6M+23q7VaYB2cLWAi/j8s0Hv07z1y3ijjTERfeQyLgFoXDdEHC4Go0fi7cl1GD2UEvyvlaV5/Ceh6cq0DO6yMd1clS1X6wmwlCVZY6omrqejERp9EJtmqLs6cjHPPbvugzVfa+qpjpCD8cRI8gBx0BFNYtifvwRpxN45POlvUEofYP1mRdbm38ilfn/FrBxd7wknknCePhFoit3y2aasoR3g1XZaD4bXNRe0xrZSSRCo/tI+0NmE14fnoVjrv/HVWkzupViwFxUpjCDKFSGf8TiLu+28FlBNaNcCtNEXLV2qUNAY3VxDVQIPn45Icq87QFELYWpU9UXs1ejMJ1KF9VOwJpxipZJR9xzDtRdo9YqMMtK/hf7Q9w9dJkYI411A9cRxa9PQDCfINkoJamrviUIQc/B8/4xUTEgJyHUh3i7QGKIkdJ1B+KluCQ7sMsSGzac6bmjK4kfmFP4zDnf7L5V9jhp3ZzueVDLHZ0GMwZJGMPA2uZkK9AoHbF3Mi+GQt2u4ts4XadlWxhNZe218rGF0UBcauMBdIWt3mhE9nPrZ4boCo/gRd1T5Gl+DlPVu8IcWH0jk1URQj3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(346002)(136003)(39850400004)(451199015)(66446008)(8676002)(76116006)(64756008)(7696005)(55016003)(478600001)(41300700001)(66476007)(52536014)(66946007)(66556008)(4326008)(5660300002)(8936002)(316002)(54906003)(110136005)(38070700005)(2906002)(38100700002)(33656002)(122000001)(86362001)(71200400001)(186003)(9686003)(83380400001)(53546011)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXRsaVVBVnlrWjhaa0xXdTlnQmM4MWhhb1FyMlV3aDBiSUkxTjFhUzV3Zmlp?=
 =?utf-8?B?RzhJMnZlcjYxbUtqeGorcEFkOFBzTVBuYW5hM2xESWxDaHhwa1A1VXcrS3h6?=
 =?utf-8?B?Vmp4eVBBbVcrcStDS0s3Q01naW5qaHJObTR5cVh6RVBkMFMwUkgvSkxER3Rk?=
 =?utf-8?B?SzFEam04L3JRd3FBaTlCTVRaaGI3eFVSNGYwbGtva3pnTmRndlFVTkJIMVNU?=
 =?utf-8?B?eE9MUFVUcXVDMmVmTVhvU3ZhQ0xIeld2czgzUW8wNGQ1bmQrVGdIZS8xUG9a?=
 =?utf-8?B?Mm4wMStoNVVjSHVzL2IrQlRHeXJLbFhRdzNlMHZKRHNqRG0zMzJ4azlWeDNN?=
 =?utf-8?B?NEJiMS8vaWpHMEF0TkZJZHYwYXVQTlJ5dTY2dGxvVmViWE9iVEJ6YmszaDJW?=
 =?utf-8?B?OUdZa3NLQ0Q5WWlFQTVSTEJjRHhMd0M2bkx6NFF4QStTbXl5b1BwbWtoSHkw?=
 =?utf-8?B?dkpvNnRqcTBiL0RNengxWWVOMEJib0hqRlFnT05yY3RJeTBRRjJ2VUpYQ29k?=
 =?utf-8?B?ME1nZk53THRlL3hUVm41UXJMcG5LNDBQcUJnUnBVZHJuQVlDS2JERWFUQ0c2?=
 =?utf-8?B?a09IZzc3amJyeEhhUjJBRlBNdWR1UDZQeXIrNk5IZE9hZUdFVy9GYXR0U0lj?=
 =?utf-8?B?WkxkbDk0VEJaZVFiWTJkRnhNcEM0eUdnSnAwTWFuU0tCT0VzMDNQT1VRbTBj?=
 =?utf-8?B?NEpiSUFIVGt5cWZnS3JCYmZYVGp3bGhuUDM5R2pPYVpLQUZMcVdSMklweGow?=
 =?utf-8?B?T3dYWllVU0dLb0tzcEdaa2pJMDdtb3pwMEpSeUxzY0JGVGNyWHcySFpKNHJt?=
 =?utf-8?B?eTVSb0NqeUdCWUZEcE12bzRWcjhXVlZqbG5ZOFNpRWl4Ly9tREdwMkpCZkN4?=
 =?utf-8?B?MmZQYzg2MVlQQ3ZGWUpCTzRpRWVKc0Zob3VWWkpWM1A1bjlwbGxhenZ5OXZq?=
 =?utf-8?B?c1pGVXhNQVQxM05kek5FRXJlVXBjUVN2ZnFyODdWSWpDR1hONGhZNnBHN1dT?=
 =?utf-8?B?VEtkSlNkTnBOMmNzdnBRb3pKQ1VGdmdHRDNwTmViYTloTGVSbFp4Z01RUGpu?=
 =?utf-8?B?bHM4WHhYT0xnbkk2MUcxWU5Fcmw5N3R3Y3NFc09pZWs2RWlSeTVZNi8yWHJu?=
 =?utf-8?B?RVovS05GbjRtcmh0NFFRbW5wT1huWUFjRmFPaS92MkZ4ZHpFcHlwKzBzL1dN?=
 =?utf-8?B?OVZaSjVJb2hLeXpyc0paM3hqK3dzNWFwclYwaXMvVGt0b2VYSFZsU0N1dnJJ?=
 =?utf-8?B?dlZxdGJCVjJKL1Z4d1lPb2xYUjBqenpFZEljc1BlZTI4eEwxVm9YVVVld2R1?=
 =?utf-8?B?NytlY3dsbUNnR2crTFZhYTJxU3dxSHV1ODBWZStTYlFsQnVFWi93ZFVicjN0?=
 =?utf-8?B?SEZsUFZJRmRETzNDQzBtZG8vTVY2cGp1dWhFRGJvY1JpZFpzQWJFMDVpWWFR?=
 =?utf-8?B?aXV5VXI2UzhBdzRoMXJZT2I0bjdPWlVLL3c5d2EwalBnN3Y0a3o1MDV3WTVN?=
 =?utf-8?B?aTgvZnV5c3FRMDJ2ZXA3M25zRmxsbHh6VE9HdkhLSVdEc25vTmh6TUtraGxo?=
 =?utf-8?B?RXJDcXJaNTFsamdlN2ZKVlQwYlljaXM3SnhpTkdmYWJKWXRjVzIyaTlQTzBU?=
 =?utf-8?B?d092R0JiTEhFcXVWc3lHeVdKcjB0dGF5TUdZM2JnZ01EakYrd1dYa3RIUHJs?=
 =?utf-8?B?ZjVjcFN4aG5MNTVibXlHdXNnR0pBQVNPNEErZitrYzl4bXhMcTBTOHNFcnVa?=
 =?utf-8?B?dEZuV3IzRkczdmc5VjlpU2lqcDJSUkZtVGFPbjNVQzNsdzlLVzhVcFJJTXhP?=
 =?utf-8?B?LzBaMVIrYTFZWk5ubTh4VDQ1RXVpOVpjeG1UOVVxNWgyZkYxc2t2WkVaNU9D?=
 =?utf-8?B?UGdTUE9mc0VIb29UeU0vRGF4b1liRll6YWZRakJZYlNVRG9YSVp4a0RXczJS?=
 =?utf-8?B?T012ZmlzZnBoeEp2ZFRZTHJRM3lPVGJzMWhQaUNVa1ZvV25nZmlWeGVMUEJX?=
 =?utf-8?B?cUw4VDFsMkxXb3A4Y3hyd3k0OERUS2lQQ2ZDODdxOTlDN1p3ODVTUFlKM3k3?=
 =?utf-8?B?SW5Qc1N4ZVNpSFZmcUwyR013bXY3SkpsWE9Nc1NNdXVYZzBOWlpBN2pmMXBm?=
 =?utf-8?B?N2NVaWRNclJJTW9sR3l4NmpLUVh0VXhQaFdkUyt6NngvYmVhQW1TOHAvQzhC?=
 =?utf-8?Q?Md1smIaeBxAFNupMXiqgMQYKzfeU8T+nmxLnvp8VXV9Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8d1e07-ca77-4088-a0a0-08da9bca5445
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 12:10:52.5426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2mcgJNK5w2CimNlEUcp73UtCxLDtIk7fOzQEr/7Tnt51+hW+0DuLCUvNEpz2giON7rs/W3Fur9mnDDCBKKiZzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
X-Proofpoint-GUID: _0kYREMBG4j6P_hNYN535sCSbSuXoQbn
X-Proofpoint-ORIG-GUID: _0kYREMBG4j6P_hNYN535sCSbSuXoQbn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_06,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210084
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=626359b9fd=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsaXBwZS5tYXRoaWV1LmRhdWRlQGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpDQpTZW50OiBTdW5kYXksIFNlcHRlbWJlciAxOCwgMjAyMiA1OjMyIEFN
DQpUbzogQmluIE1lbmcgPGJtZW5nLmNuQGdtYWlsLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9y
Zw0KQ2M6IE1lbmcsIEJpbiA8QmluLk1lbmdAd2luZHJpdmVyLmNvbT47IEhhbm5hIFJlaXR6IDxo
cmVpdHpAcmVkaGF0LmNvbT47IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+OyBQZXRlciBM
aWV2ZW4gPHBsQGthbXAuZGU+OyBxZW11LWJsb2NrQG5vbmdudS5vcmcNClN1YmplY3Q6IFJlOiBb
UEFUQ0ggNS83XSBibG9jay9uZnM6IEZpeCAzMi1iaXQgV2luZG93cyBidWlsZA0KDQpbUGxlYXNl
IG5vdGU6IFRoaXMgZS1tYWlsIGlzIGZyb20gYW4gRVhURVJOQUwgZS1tYWlsIGFkZHJlc3NdDQoN
Ck9uIDgvOS8yMiAxNToyOCwgQmluIE1lbmcgd3JvdGU6DQo+IEZyb206IEJpbiBNZW5nIDxiaW4u
bWVuZ0B3aW5kcml2ZXIuY29tPg0KPg0KPiBsaWJuZnMuaCBkZWNsYXJlcyBuZnNfZnN0YXQoKSBh
cyB0aGUgZm9sbG93aW5nIGZvciB3aW4zMjoNCj4NCj4gICAgaW50IG5mc19mc3RhdChzdHJ1Y3Qg
bmZzX2NvbnRleHQgKm5mcywgc3RydWN0IG5mc2ZoICpuZnNmaCwNCj4gICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgX19zdGF0NjQgKnN0KTsNCj4NCj4gVGhlICdzdCcgcGFyYW1ldGVyIHNob3VsZCBi
ZSBvZiB0eXBlICdzdHJ1Y3QgX19zdGF0NjQnLiBUaGUgY29kZXMgDQo+IGhhcHBlbiB0byBidWls
ZCBzdWNjZXNzZnVsbHkgZm9yIDY0LWJpdCBXaW5kb3dzLCBidXQgaXQgZG9lcyBub3QgYnVpbGQg
DQo+IGZvciAzMi1iaXQgV2luZG93cy4NCj4NCj4gRml4ZXM6IDY1NDJhYTljNzViYyAoImJsb2Nr
OiBhZGQgbmF0aXZlIHN1cHBvcnQgZm9yIE5GUyIpDQo+IEZpeGVzOiAxOGE4MDU2ZTBiYzcgKCJi
bG9jay9uZnM6IGNhY2hlIGFsbG9jYXRlZCBmaWxlc2l6ZSBmb3IgDQo+IHJlYWQtb25seSBmaWxl
cyIpDQo+IFNpZ25lZC1vZmYtYnk6IEJpbiBNZW5nIDxiaW4ubWVuZ0B3aW5kcml2ZXIuY29tPg0K
PiAtLS0NCj4NCj4gICBibG9jay9uZnMuYyB8IDggKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9ibG9jay9uZnMuYyBiL2Jsb2Nr
L25mcy5jIGluZGV4IDQ0NGM0MGI0NTguLmQ1ZDY3OTM3ZGQgDQo+IDEwMDY0NA0KPiAtLS0gYS9i
bG9jay9uZnMuYw0KPiArKysgYi9ibG9jay9uZnMuYw0KPiBAQCAtNDE4LDcgKzQxOCwxMSBAQCBz
dGF0aWMgaW50NjRfdCBuZnNfY2xpZW50X29wZW4oTkZTQ2xpZW50ICpjbGllbnQsIEJsb2NrZGV2
T3B0aW9uc05mcyAqb3B0cywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50
IGZsYWdzLCBpbnQgb3Blbl9mbGFncywgRXJyb3IgKiplcnJwKQ0KPiAgIHsNCj4gICAgICAgaW50
NjRfdCByZXQgPSAtRUlOVkFMOw0KPiArI2lmZGVmIF9XSU4zMg0KPiArICAgIHN0cnVjdCBfX3N0
YXQ2NCBzdDsNCj4gKyNlbHNlDQo+ICAgICAgIHN0cnVjdCBzdGF0IHN0Ow0KPiArI2VuZGlmDQo+
ICAgICAgIGNoYXIgKmZpbGUgPSBOVUxMLCAqc3RycCA9IE5VTEw7DQo+DQo+ICAgICAgIHFlbXVf
bXV0ZXhfaW5pdCgmY2xpZW50LT5tdXRleCk7IEBAIC03ODEsNyArNzg1LDExIEBAIHN0YXRpYyBp
bnQgDQo+IG5mc19yZW9wZW5fcHJlcGFyZShCRFJWUmVvcGVuU3RhdGUgKnN0YXRlLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJsb2NrUmVvcGVuUXVldWUgKnF1ZXVlLCBFcnJv
ciAqKmVycnApDQo+ICAgew0KPiAgICAgICBORlNDbGllbnQgKmNsaWVudCA9IHN0YXRlLT5icy0+
b3BhcXVlOw0KPiArI2lmZGVmIF9XSU4zMg0KPiArICAgIHN0cnVjdCBfX3N0YXQ2NCBzdDsNCj4g
KyNlbHNlDQo+ICAgICAgIHN0cnVjdCBzdGF0IHN0Ow0KPiArI2VuZGlmDQo+ICAgICAgIGludCBy
ZXQgPSAwOw0KPg0KPiAgICAgICBpZiAoc3RhdGUtPmZsYWdzICYgQkRSVl9PX1JEV1IgJiYgYmRy
dl9pc19yZWFkX29ubHkoc3RhdGUtPmJzKSkgDQo+IHsNCg0KV2hhdCBhYm91dCB0aGUgZmllbGQg
aW4gc3RydWN0IE5GU1JQQz8NCg0KTkZTUlBDOjpzdHJ1Y3Qgc3RhdCBpcyB1c2VkIGluIG5mc19n
ZXRfYWxsb2NhdGVkX2ZpbGVfc2l6ZV9jYigpIGFuZCBuZnNfZ2V0X2FsbG9jYXRlZF9maWxlX3Np
emUoKSB0aGF0IGFyZSBub3QgYnVpbHQgb24gd2luMzIsIHNvIHRoZXJlIGlzIG5vIHByb2JsZW0u
DQoNClJlZ2FyZHMsDQpCaW4NCg0KDQo=

