Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B05173CF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 18:09:19 +0200 (CEST)
Received: from localhost ([::1]:55392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlYbu-0004aI-2W
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 12:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6121c6eaaf=pdel@fb.com>)
 id 1nlYVr-00068Y-OG; Mon, 02 May 2022 12:03:06 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:41292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6121c6eaaf=pdel@fb.com>)
 id 1nlYVp-0006Cu-Fa; Mon, 02 May 2022 12:03:03 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 241Lo30c007009;
 Mon, 2 May 2022 09:02:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=+OZtVsQ5XPX7Yy8f7g1hX3i7gkOJzK/4pOz5uD4QOBg=;
 b=L2l+kKx8TBTmcEwFIfsVU3ux94WT2boq3v5Y8BxSk87lIt0KeqOh1u7qltWN8sfoFwNW
 XXKq/zl3CFWc32OpdHz3wobtNHmFnQjNw2Nnw/8SzmIAZ3kNA5Dr5UQ6X+3QXD2WzVPn
 2zLLzZ4WNlkKy6Ql4lXgPINMNusOX6OdfIU= 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2043.outbound.protection.outlook.com [104.47.57.43])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fs2mx9m9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 09:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcmEG4we2P79lk0tDbtR+F17GvpS7RjqF38IknqzRA7iGakDTCWVGyoZ0Msj5nY/YaUzGSA2zUKON8Rp5wYyw8Fy3wES3zqOIZmKZbdeSt7HoYXdns5Kz4rS9E7URmBZbqud8vIX7/QeIxr3Oe2baPgKdH0yvTK31P9hlft9269yCwnkUmYW8rpzfY4VfXYIJTSplGJsYAOnnPWfHPfikPcu1urNTaPOAcNYNNH/Ia1I29T0LwshsPan/0rKnV0Gh31mWXFrkvoAdgK+4bVg7p8U30pHiJt1Ro/eGObuSJl1tc+pKpOpgvn7aWnl3wyWylylSyBQhYnyXI5WdhcdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OZtVsQ5XPX7Yy8f7g1hX3i7gkOJzK/4pOz5uD4QOBg=;
 b=jTSTLDqdNnPyA6siW4j8VCtJnv5b1UaQ2L3VYZzxbtvY8JDpzZDAvBrxH/nNr15ufM0jSogF351otzbsrWey0z07pRqPu3bGRwHm8DJHhFbBWGRx9nmke9FAINECpbkPDQNF4vJLhnWuPN363QjvhQhdG6sPfLdBZLmUqSY8y7TjedHaS8x1V1qNeBhPk8CXcM1KCbU4MEvgFU+14U9gT2aLqSkyI9xYoI/5M83myVfQpZODRXIx4LlbuNGee3H7WcbkFoRB7jbFQHtfQ0vcB6xPdHpYr81jlLshYsYKlgbFFqG0pDuWbWpryNvZaHVQPkEQNVtry/e1DpJFMiNc/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB2742.namprd15.prod.outlook.com (2603:10b6:a03:158::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Mon, 2 May
 2022 16:02:50 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541%4]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 16:02:50 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: qemu-arm <qemu-arm@nongnu.org>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 "rashmica.g@gmail.com" <rashmica.g@gmail.com>,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH] hw/gpio/aspeed_gpio: Fix QOM pin property
Thread-Topic: [PATCH] hw/gpio/aspeed_gpio: Fix QOM pin property
Thread-Index: AQHYXfvi7TaWOBdaX0Szd5g0vhERsK0LsUkAgAAO44A=
Date: Mon, 2 May 2022 16:02:50 +0000
Message-ID: <3F8C2AE4-F347-4EC3-8586-E14B140AE9D2@fb.com>
References: <20220502080827.244815-1-pdel@fb.com>
 <80ac0726-f2a0-527c-2125-97d1869fb147@kaod.org>
In-Reply-To: <80ac0726-f2a0-527c-2125-97d1869fb147@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67db3936-fb54-4639-0895-08da2c55351d
x-ms-traffictypediagnostic: BYAPR15MB2742:EE_
x-microsoft-antispam-prvs: <BYAPR15MB2742BB95E298EEB031A34B77ACC19@BYAPR15MB2742.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8bvgtlUxc+njyL/xQ42bTW95gbK7CVrJQjSHjg2aTaaqH+FS4jn95YIUh3u2GwNJo5KAtnbvpxdP8uMptbUtIfWTWRara0Xd2FhEgGRuAWHTXMl7xlIr/cVqe/z5Qr7wz0uxzeEYw4mKdZ3GBL/dmVq6qIM8Zvzhx7JQsZoZG+pzEySiu/p3hHoF3fLK7RY2UwOnXxTudCvCn//VI2uHUP+AogIE1tjsroSj/Y57dNmxduAi3/vT+SZ0Ihn9ALK8MZ6phpthanSznaK0k6eQstTQjS/1vw0ksWXxXm0t+Xg000YOQCVIVy7UcbuRQ34AyG0ED7ABnv2uZ2my6cxQ6zNPUh1+FHwOsoel5p2Os+tHsaZ8gbmqUdvyi9LPe4B+vRy7ZVmTQO0iXD9zcsd+h3iPI8GUExPKTshgAjc7lDo4ICkIcZM8nYZcRJeAFjb4lQtRBt2VqH8OizATAnh505mZ2SvqGoagyqmKUEwfZNvzDDBn9KXVJzZxEMmJvyJGZLQW4YzrX4XQwhdOI0JaI+Q61GjDiBfIXapDQRSWiUXdik+AY9nOyORbD/Kpzm1F/387dhm+G1jLfi52Dz9hlyYYPpBfm3Hz/f98DUtvxCfHrqqK/tgJ13cr00K8Jp0bX9/8sQQOiitb4pQ5PaAQNlz9nohzFmofVD1Uo5G4PC33tr29aRIbF3Y06oIjJoxm2YxFX7eqGgInH/2F/szugFkiC4hd3ODw3G59Ig8LjzKHve+6BdtQM2wG4csjbzQI+wQt80atrT0gUEaqVM/9m5uzUFs2L1m0ysSsxh/rkgzKJnjw5ErFYfg9+xZH5ix3DE2Xt/QwC6jnAcq6aYbtVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(316002)(5660300002)(66574015)(8936002)(66946007)(66556008)(66476007)(76116006)(71200400001)(8676002)(4326008)(66446008)(33656002)(38100700002)(86362001)(6486002)(36756003)(2906002)(122000001)(6506007)(38070700005)(53546011)(186003)(2616005)(54906003)(83380400001)(508600001)(6512007)(109986005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkdMelhHazVWaDMrM3FhOWZSa0x3bVYrWmkvL2N2V016dys3UFBBUTFhYVlv?=
 =?utf-8?B?eDl0VURVNW0vaUJhcEdQbE1aeGUzY20vQUsvL1NmRzVXK3J6S2tEcVZlSFFi?=
 =?utf-8?B?UGZIc1dHMGtLdmhjQm0wZmViQkVxTmJzbitLREZMdG43aVgrdmJyL3cyT3gy?=
 =?utf-8?B?TmFyN1I3d2lPaVJQdStGTm9lbmhzSitQQlRZZ1FBZll5NkE0dUdmYWZNZm9N?=
 =?utf-8?B?RDB5SUhmckYybG1vMmpydVQxUFBEV1FQMVBGbWNUbGdZZEp2UE1iUDZOQUdo?=
 =?utf-8?B?dzE5WUoxeTNGRDFNdkpKT2FyNHVxZzJQcGp2akR2Q3d4WnlEVVVBM2NCaUg5?=
 =?utf-8?B?djBla2d3c2RjOEEzUFBpbVdJeDdIdE1yeHFYM0p3K2w3dFVXSzV5YU1YdDJG?=
 =?utf-8?B?d21FdmJzT0psRDNEbDA2b1cwUjBLeWFCVDhHNmc0OU12Sk9zSlVpU3VzMUJa?=
 =?utf-8?B?VzFBVGJtdjM0bjJTRDJBYm9DU1oyWHNJSGw1bm9sL2RvYStBKzZhdi9ydlRS?=
 =?utf-8?B?Mkg3T1N0VGJtUUJQYWxXS2FpUkpDdmFVSzkxb2ViZzhZdkxqVWlPaUN0c2lx?=
 =?utf-8?B?LzM3M0RYZEwrdUhldDVkM1hMcC9qWis2d1h0OTFRL2JxVjUzUStnUmNEVFpy?=
 =?utf-8?B?amQ2SzZiNkg1aW82ZHB3emc3WXBFeHFOS05mRWdhc3JlbVJad21VUFF3azh0?=
 =?utf-8?B?MzMvdEM3SFRrS2NHc0RhZUNueUxsL1ZqNkEwNm5pNlp4dkxNMVBSZmJQN2tr?=
 =?utf-8?B?Z0p2aTVTL0NKRk9seUFOM0VMUWduVmRibkIrbzlsTU1ZdzJqUTJyeEJaOVNM?=
 =?utf-8?B?V1NrUzhCUm5CMHczdzJIUzJRcXNWV1BnOUJlOUNZZlFKNVhaU0thWVgrbkJi?=
 =?utf-8?B?Sm1QRzMrZ1g3NHBWZ3lMb2ZPRTRES3VqTVV0d0o4NUNURzBlZ1NjbkxKZ1lm?=
 =?utf-8?B?UFJndUcwT2tLS1haMUowSzRudTM3SEUvei82VjZtMlNQTERHUjFzdjByMW9a?=
 =?utf-8?B?VFhnZDlDOStxYk5Vc3FNZDBiK1plU2xka1lNdGtYd2kzRUNSWFVzNENNN093?=
 =?utf-8?B?TjlNbkxkbXdzK0dtM0lObGpjblZiQmJUVnN5Y2w5VE90MkhXd21pMzBxUTZr?=
 =?utf-8?B?cjNIOE8xQmVFaWh1MjlNVTBYbnloZm1JZk9FWWtCZ25nZkFQOXlkeUJ0SkRR?=
 =?utf-8?B?WjJXNEp0S01aL0pzdGVWYm5scFpZSndqVmMySG9tVE9LUFFLS3ozR3h4cmdI?=
 =?utf-8?B?OUV1WlRycVJBWmp1a2dUVit2d0VSVW04YzNneXREVDhqMzBrYlR0VGQ0SUJm?=
 =?utf-8?B?cDN6M0ZSaGQ4SmZUK2RYVm5DL1BERVhFeWNqRUhEeE5US05paVVoMFN1RGp0?=
 =?utf-8?B?MFRYbTdFRG9rVC91dVlKUWU2aUtONU8xZGl1OHh0RlhvQmlTb2habGN1a2FU?=
 =?utf-8?B?UnRsYkVrSDhZSEcyaFVYUmQwOEtFeDc2eW5XUVZLQXN4Y01MYThWTmRKWkhH?=
 =?utf-8?B?UHM2bU1wSWV5ZTVQeU1sdXlpK0JVZHA5bFc3S3hwNUdMY2JydytoMFh0c0hi?=
 =?utf-8?B?ZXFqS2VNWEpOMlRIRW9Vbmhxb2NyVGRvbkRId1BpRDNBb2JLenl0UVh2eER6?=
 =?utf-8?B?SnJmVkwyYTNuOU9wMkRJMDNFSzBvODNkbVQ1WWRNZWVTS2Q0Kzdhako4Ym1z?=
 =?utf-8?B?VzByQjRRbXp4RFJqZThub2tMWHNVWjA3MHRxZzBndEZUS015eldickhxRWU4?=
 =?utf-8?B?SHJMVWlqYUtZcUdaMkw1ZGg4SldvV2dIbklsMGV4VFBvaUZXd0VwUm96NCs1?=
 =?utf-8?B?RUtEVXpZRXlOZHBvbkxzVmQzc3JlelhQWjBOYVBrcHRZWXY1aHJRYnkrbVky?=
 =?utf-8?B?M3EzcFBjNE1lMkJGQUFBOVVPTVo5ZHdtbkNEQWc1YTB4SDc5TG41cWgzUVNw?=
 =?utf-8?B?QnlySE5wMGpPMGExRHVoMmNVVG9EaHlMdERqU0ZHTWpoNXlmY1dZMzBETmM3?=
 =?utf-8?B?cVZvTURmNi8xTTJBcVhyczlGald1YTdTMmI5ZnJFY1VjVzRpWEQrclF1bnFl?=
 =?utf-8?B?amtjQllrTkhidjNUZzBNZmJ1dWdENEFkT0hTNVlYcmhGUGdEZEVOL2pYbm9r?=
 =?utf-8?B?NlVFMXpnLzQrdUFrbDlUQmx3MTYzREhETzBhTTBLc2xIZERyOEZDaFFsM25k?=
 =?utf-8?B?TDRld2JvT3BLSlp2Z2hheWtYZXhTakxkQVEya0FFdHZ2bWNnd29rNW1YWlZw?=
 =?utf-8?B?eUtCcFhQK0VWMDB5S2JwYmM4Y01tS1BJNFJLbXUwK1dyczVkYTVtL0I4VEl5?=
 =?utf-8?B?OEdZVWl5WW8rcU1yNUdQeS9SVFJuUHd5TEJhK1ZYUUUraDI5cWpEcmFYa1I2?=
 =?utf-8?Q?l4dfQylPX/xEdpvk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD2D0AFE0973F14C85B66A0699A06085@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67db3936-fb54-4639-0895-08da2c55351d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 16:02:50.1127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xFPb44LUXd5swYEAOXKDTAHQiWeh/oUtJVyaC7Z+TjVYkRZw5Ko8mqFnPGJaTOKK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2742
X-Proofpoint-GUID: INVhFwyUItcAfLEluyho17uMbIpwkAZM
X-Proofpoint-ORIG-GUID: INVhFwyUItcAfLEluyho17uMbIpwkAZM
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_04,2022-05-02_03,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6121c6eaaf=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

DQoNCj4gT24gTWF5IDIsIDIwMjIsIGF0IDg6MDkgQU0sIEPDqWRyaWMgTGUgR29hdGVyIDxjbGdA
a2FvZC5vcmc+IHdyb3RlOg0KPiANCj4gT24gNS8yLzIyIDEwOjA4LCBQZXRlciBEZWxldm9yeWFz
IHdyb3RlOg0KPj4gSSB3YXMgc2V0dGluZyBncGlvVjQtNyB0byAiMTExMCIgdXNpbmcgdGhlIFFP
TSBwaW4gcHJvcGVydHkgaGFuZGxlciBhbmQNCj4+IG5vdGljZWQgdGhhdCBsb3dlcmluZyBncGlv
Vjcgd2FzIGluYWR2ZXJ0ZW50bHkgbG93ZXJpbmcgZ3Bpb1Y0LTYgdG9vLg0KPj4gKHFlbXUpIHFv
bS1zZXQgL21hY2hpbmUvc29jL2dwaW8gZ3Bpb1Y0IHRydWUNCj4+IChxZW11KSBxb20tc2V0IC9t
YWNoaW5lL3NvYy9ncGlvIGdwaW9WNSB0cnVlDQo+PiAocWVtdSkgcW9tLXNldCAvbWFjaGluZS9z
b2MvZ3BpbyBncGlvVjYgdHJ1ZQ0KPj4gKHFlbXUpIHFvbS1nZXQgL21hY2hpbmUvc29jL2dwaW8g
Z3Bpb1Y0DQo+PiB0cnVlDQo+PiAocWVtdSkgcW9tLXNldCAvbWFjaGluZS9zb2MvZ3BpbyBncGlv
VjcgZmFsc2UNCj4+IChxZW11KSBxb20tZ2V0IC9tYWNoaW5lL3NvYy9ncGlvIGdwaW9WNA0KPj4g
ZmFsc2UNCj4+IEFuIGV4cHJlc3Npb24gaW4gYXNwZWVkX2dwaW9fc2V0X3Bpbl9sZXZlbCB3YXMg
dXNpbmcgYSBsb2dpY2FsIE5PVA0KPj4gb3BlcmF0b3IgaW5zdGVhZCBvZiBhIGJpdHdpc2UgTk9U
IG9wZXJhdG9yOg0KPj4gdmFsdWUgJj0gIXBpbl9tYXNrOw0KPj4gVGhlIG9yaWdpbmFsIGF1dGhv
ciBwcm9iYWJseSBpbnRlbmRlZCB0byBtYWtlIGEgYml0d2lzZSBOT1QgZXhwcmVzc2lvbg0KPj4g
In4iLCBidXQgbWlzdGFrZW5seSB1c2VkIGEgbG9naWNhbCBOT1Qgb3BlcmF0b3IgIiEiIGluc3Rl
YWQuIFNvbWUNCj4+IHByb2dyYW1taW5nIGxhbmd1YWdlcyBsaWtlIFJ1c3QgdXNlICIhIiBmb3Ig
Ym90aCBwdXJwb3Nlcy4NCj4+IEZpeGVzOiA0YjdmOTU2ODYyZGMgKCJody9ncGlvOiBBZGQgYmFz
aWMgQXNwZWVkIEdQSU8gbW9kZWwgZm9yIEFTVDI0MDAgYW5kDQo+PiBBU1QyNTAwIikNCj4+IFNp
Z25lZC1vZmYtYnk6IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPiANCj4gTmljZSBj
YXRjaCAhDQo+IA0KPiBSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9y
Zz4NCj4gDQo+IEkgd2FzIGdvaW5nIHRvIHNlbmQgYSBQUiBidXQgSSB3aWxsIHdhaXQgYSBiaXQg
dG8gaW5jbHVkZSB0aGlzIGZpeC4NCg0KVGhhdOKAmXMgZ3JlYXQsIHRoYW5rcyENCg0KPiANCj4g
VGhhbmtzLA0KPiANCj4gQy4NCj4gDQo+IA0KPj4gLS0tDQo+PiBody9ncGlvL2FzcGVlZF9ncGlv
LmMgfCAyICstDQo+PiB0ZXN0cy9xdGVzdC9hc3BlZWRfZ3Bpby10ZXN0LmMgfCA4NyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiB0ZXN0cy9xdGVzdC9tZXNvbi5idWlsZCB8
IDMgKy0NCj4+IDMgZmlsZXMgY2hhbmdlZCwgOTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9xdGVzdC9hc3BlZWRfZ3Bpby10ZXN0LmMN
Cj4+IGRpZmYgLS1naXQgYS9ody9ncGlvL2FzcGVlZF9ncGlvLmMgYi9ody9ncGlvL2FzcGVlZF9n
cGlvLmMNCj4+IGluZGV4IGM2MzYzNGQzZDMuLjliNzM2ZTdhOWYgMTAwNjQ0DQo+PiAtLS0gYS9o
dy9ncGlvL2FzcGVlZF9ncGlvLmMNCj4+ICsrKyBiL2h3L2dwaW8vYXNwZWVkX2dwaW8uYw0KPj4g
QEAgLTMxMiw3ICszMTIsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfZ3Bpb19zZXRfcGluX2xldmVs
KEFzcGVlZEdQSU9TdGF0ZSAqcywgdWludDMyX3Qgc2V0X2lkeCwNCj4+IGlmIChsZXZlbCkgew0K
Pj4gdmFsdWUgfD0gcGluX21hc2s7DQo+PiB9IGVsc2Ugew0KPj4gLSB2YWx1ZSAmPSAhcGluX21h
c2s7DQo+PiArIHZhbHVlICY9IH5waW5fbWFzazsNCj4+IH0NCj4+IGFzcGVlZF9ncGlvX3VwZGF0
ZShzLCAmcy0+c2V0c1tzZXRfaWR4XSwgdmFsdWUpOw0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3F0
ZXN0L2FzcGVlZF9ncGlvLXRlc3QuYyBiL3Rlc3RzL3F0ZXN0L2FzcGVlZF9ncGlvLXRlc3QuYw0K
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLmMxMDAzZjJkMWIN
Cj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL3Rlc3RzL3F0ZXN0L2FzcGVlZF9ncGlvLXRlc3Qu
Yw0KPj4gQEAgLTAsMCArMSw4NyBAQA0KPj4gKy8qDQo+PiArICogUVRlc3QgdGVzdGNhc2UgZm9y
IHRoZSBBc3BlZWQgR1BJTyBDb250cm9sbGVyLg0KPj4gKyAqDQo+PiArICogQ29weXJpZ2h0IChj
KSBNZXRhIFBsYXRmb3JtcywgSW5jLiBhbmQgYWZmaWxpYXRlcy4gKGh0dHA6Ly93d3cubWV0YS5j
b20pDQo+PiArICoNCj4+ICsgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9m
IGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5DQo+PiArICogb2YgdGhpcyBz
b2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJl
IiksIHRvIGRlYWwNCj4+ICsgKiBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwg
aW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzDQo+PiArICogdG8gdXNlLCBj
b3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQv
b3Igc2VsbA0KPj4gKyAqIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVy
c29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcw0KPj4gKyAqIGZ1cm5pc2hlZCB0byBkbyBzbywg
c3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6DQo+PiArICoNCj4+ICsgKiBUaGUg
YWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBi
ZSBpbmNsdWRlZCBpbg0KPj4gKyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMg
b2YgdGhlIFNvZnR3YXJlLg0KPj4gKyAqDQo+PiArICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVE
ICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1INCj4+ICsg
KiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9G
IE1FUkNIQU5UQUJJTElUWSwNCj4+ICsgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTA0KPj4gKyAqIFRIRSBBVVRI
T1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VT
IE9SIE9USEVSDQo+PiArICogTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05U
UkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwNCj4+ICsgKiBPVVQgT0YgT1Ig
SU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJ
TkdTIElODQo+PiArICogVEhFIFNPRlRXQVJFLg0KPj4gKyAqLw0KPj4gKw0KPj4gKyNpbmNsdWRl
ICJxZW11L29zZGVwLmgiDQo+PiArI2luY2x1ZGUgInFlbXUvYml0b3BzLmgiDQo+PiArI2luY2x1
ZGUgInFlbXUvdGltZXIuaCINCj4+ICsjaW5jbHVkZSAicWFwaS9xbXAvcWRpY3QuaCINCj4+ICsj
aW5jbHVkZSAibGlicXRlc3Qtc2luZ2xlLmgiDQo+PiArDQo+PiArc3RhdGljIGJvb2wgcW9tX2dl
dF9ib29sKFFUZXN0U3RhdGUgKnMsIGNvbnN0IGNoYXIgKnBhdGgsIGNvbnN0IGNoYXIgKnByb3Bl
cnR5KQ0KPj4gK3sNCj4+ICsgUURpY3QgKnI7DQo+PiArIGJvb2wgYjsNCj4+ICsNCj4+ICsgciA9
IHF0ZXN0X3FtcChzLCAieyAnZXhlY3V0ZSc6ICdxb20tZ2V0JywgJ2FyZ3VtZW50cyc6ICINCj4+
ICsgInsgJ3BhdGgnOiAlcywgJ3Byb3BlcnR5JzogJXMgfSB9IiwgcGF0aCwgcHJvcGVydHkpOw0K
Pj4gKyBiID0gcWRpY3RfZ2V0X2Jvb2wociwgInJldHVybiIpOw0KPj4gKyBxb2JqZWN0X3VucmVm
KHIpOw0KPj4gKw0KPj4gKyByZXR1cm4gYjsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQg
cW9tX3NldF9ib29sKFFUZXN0U3RhdGUgKnMsIGNvbnN0IGNoYXIgKnBhdGgsIGNvbnN0IGNoYXIg
KnByb3BlcnR5LA0KPj4gKyBib29sIHZhbHVlKQ0KPj4gK3sNCj4+ICsgUURpY3QgKnI7DQo+PiAr
DQo+PiArIHIgPSBxdGVzdF9xbXAocywgInsgJ2V4ZWN1dGUnOiAncW9tLXNldCcsICdhcmd1bWVu
dHMnOiAiDQo+PiArICJ7ICdwYXRoJzogJXMsICdwcm9wZXJ0eSc6ICVzLCAndmFsdWUnOiAlaSB9
IH0iLA0KPj4gKyBwYXRoLCBwcm9wZXJ0eSwgdmFsdWUpOw0KPj4gKyBxb2JqZWN0X3VucmVmKHIp
Ow0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCB0ZXN0X3NldF9jb2xvY2F0ZWRfcGlucyhj
b25zdCB2b2lkICpkYXRhKQ0KPj4gK3sNCj4+ICsgUVRlc3RTdGF0ZSAqcyA9IChRVGVzdFN0YXRl
ICopZGF0YTsNCj4+ICsNCj4+ICsgLyoNCj4+ICsgKiBncGlvVjQtNyBvY2N1cHkgYml0cyB3aXRo
aW4gYSBzaW5nbGUgMzItYml0IHZhbHVlLCBzbyB3ZSB3YW50IHRvIG1ha2UNCj4+ICsgKiBzdXJl
IHRoYXQgbW9kaWZ5aW5nIG9uZSBkb2Vzbid0IGFmZmVjdCB0aGUgb3RoZXIuDQo+PiArICovDQo+
PiArIHFvbV9zZXRfYm9vbChzLCAiL21hY2hpbmUvc29jL2dwaW8iLCAiZ3Bpb1Y0IiwgdHJ1ZSk7
DQo+PiArIHFvbV9zZXRfYm9vbChzLCAiL21hY2hpbmUvc29jL2dwaW8iLCAiZ3Bpb1Y1IiwgZmFs
c2UpOw0KPj4gKyBxb21fc2V0X2Jvb2wocywgIi9tYWNoaW5lL3NvYy9ncGlvIiwgImdwaW9WNiIs
IHRydWUpOw0KPj4gKyBxb21fc2V0X2Jvb2wocywgIi9tYWNoaW5lL3NvYy9ncGlvIiwgImdwaW9W
NyIsIGZhbHNlKTsNCj4+ICsgZ19hc3NlcnQocW9tX2dldF9ib29sKHMsICIvbWFjaGluZS9zb2Mv
Z3BpbyIsICJncGlvVjQiKSk7DQo+PiArIGdfYXNzZXJ0KCFxb21fZ2V0X2Jvb2wocywgIi9tYWNo
aW5lL3NvYy9ncGlvIiwgImdwaW9WNSIpKTsNCj4+ICsgZ19hc3NlcnQocW9tX2dldF9ib29sKHMs
ICIvbWFjaGluZS9zb2MvZ3BpbyIsICJncGlvVjYiKSk7DQo+PiArIGdfYXNzZXJ0KCFxb21fZ2V0
X2Jvb2wocywgIi9tYWNoaW5lL3NvYy9ncGlvIiwgImdwaW9WNyIpKTsNCj4+ICt9DQo+PiArDQo+
PiAraW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KPj4gK3sNCj4+ICsgUVRlc3RTdGF0
ZSAqczsNCj4+ICsgaW50IHI7DQo+PiArDQo+PiArIGdfdGVzdF9pbml0KCZhcmdjLCAmYXJndiwg
TlVMTCk7DQo+PiArDQo+PiArIHMgPSBxdGVzdF9pbml0KCItbWFjaGluZSBhc3QyNjAwLWV2YiIp
Ow0KPj4gKyBxdGVzdF9hZGRfZGF0YV9mdW5jKCIvYXN0MjYwMC9ncGlvL3NldF9jb2xvY2F0ZWRf
cGlucyIsIHMsDQo+PiArIHRlc3Rfc2V0X2NvbG9jYXRlZF9waW5zKTsNCj4+ICsgciA9IGdfdGVz
dF9ydW4oKTsNCj4+ICsgcXRlc3RfcXVpdChzKTsNCj4+ICsNCj4+ICsgcmV0dXJuIHI7DQo+PiAr
fQ0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L21lc29uLmJ1aWxkIGIvdGVzdHMvcXRlc3Qv
bWVzb24uYnVpbGQNCj4+IGluZGV4IDZiOTgwN2MxODMuLjMyZmI4Y2Y3NTUgMTAwNjQ0DQo+PiAt
LS0gYS90ZXN0cy9xdGVzdC9tZXNvbi5idWlsZA0KPj4gKysrIGIvdGVzdHMvcXRlc3QvbWVzb24u
YnVpbGQNCj4+IEBAIC0xODksNyArMTg5LDggQEAgcXRlc3RzX25wY203eHggPSBcDQo+PiAoc2xp
cnAuZm91bmQoKSA/IFsnbnBjbTd4eF9lbWMtdGVzdCddIDogW10pDQo+PiBxdGVzdHNfYXNwZWVk
ID0gXA0KPj4gWydhc3BlZWRfaGFjZS10ZXN0JywNCj4+IC0gJ2FzcGVlZF9zbWMtdGVzdCddDQo+
PiArICdhc3BlZWRfc21jLXRlc3QnLA0KPj4gKyAnYXNwZWVkX2dwaW8tdGVzdCddDQo+PiBxdGVz
dHNfYXJtID0gXA0KPj4gKGNvbmZpZ19hbGxfZGV2aWNlcy5oYXNfa2V5KCdDT05GSUdfTVBTMicp
ID8gWydzc2UtdGltZXItdGVzdCddIDogW10pICsgXA0KPj4gKGNvbmZpZ19hbGxfZGV2aWNlcy5o
YXNfa2V5KCdDT05GSUdfQ01TREtfQVBCX0RVQUxUSU1FUicpID8gWydjbXNkay1hcGItZHVhbHRp
bWVyLXRlc3QnXSA6IFtdKSArIFwNCg0K

