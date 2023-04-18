Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0050C6E586A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 07:15:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1podev-0001zt-Q9; Tue, 18 Apr 2023 01:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1podee-0001vf-Vm; Tue, 18 Apr 2023 01:13:26 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1podeb-0003AB-Aw; Tue, 18 Apr 2023 01:13:23 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33I3gr9a017156; Mon, 17 Apr 2023 22:13:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=EeT85IoLeOdcnkDNwIahT2zdhf/juo2lFEZa/ZYExRg=;
 b=rBTnoQ1WtacNr8Ejqvk7qxg7yz2IMAx+bvRMA8WHiWmszps8OOXtbS2hzffvMts1nJAt
 DfxR0Xxl6v2Iikkg7qirHhDZvaQFwaKAgV2Pw++yVpsl3QYX1LJkEeWpufqHxIy6wDWi
 8GoCQt4GrWLzFX0UU61rnGgtySZen/ZlQIyz+fVt0dqXuf+PyhVAV4T/uxPDvWikkJbp
 YEAp45dS3ZaIMZLPUHZg58YkNbjNYpuF1ldBP53Sgf6VOZohL+6sdYRcHp6N+ymoNFpF
 r0HFZN70V2Bd3hcnIum5aE2PPKUEoS0uYtdxvGiFpdwSVjt5nId9U8MN89P/j3f6/s7W 1A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3pyr8uw810-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 22:13:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a25cPOevcryrz2YSlw9jv4PFW05hYe26L2jMC10s8U1dacnlXXO9A8VoFm4/9QmMsulQev8+fOULZgIBKege0kaqxnI6ZHjtNToHcX5s/QdGokjAIs5TVD/P++t3hKkw2BgwHQV6F1u9slhO9rYAtdftoN/fi3WqHquC+KQvvdFJNJU8HtFKCW4imXbpfyy56dzDlBPAG/VaAQBXyiOpxNMzab+gpuIB7M4iEQcuUcNK03MfNNOPr60mvjE+CsNHpx3c0B1yDzY3BpLzR90KYnx1UIfjHfAQZJouE1PljaI+rPELSc0Ydvi7+H2W8+Kohi7WiVvYY076VZ0AhyZXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeT85IoLeOdcnkDNwIahT2zdhf/juo2lFEZa/ZYExRg=;
 b=XnyhsIv/IrO0X/7XggisW1ttoT1IgPuUFd+8gGc3LuImI2pMyhOO22SarnihG2QcLcfI18kZ7fvDFTI7urwM/TWnr7yn8ZMgSyXhaBjb/aAl7U/zQ13OokIODI2v9VaVbYlvB6oH4GYgjpryesF6JL+b8JctZe2W2wi0oDoJUokvgqugHN46nY3CnQ5Vibq5zZGgxAqWeeB8XpZCw5+0iZnwT616zvycTWZbZgcknlpda98AFJkXDKtU1QoKKc6FTRDRHXvPXva4pspt8d1ERw8s8fXoQDpjFDk2h06Ruo14/S+L6xhvHPIVc3gNfvoTeje3D4/40OOd8BYv0qJjkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeT85IoLeOdcnkDNwIahT2zdhf/juo2lFEZa/ZYExRg=;
 b=VEkyXP2J+qC3xUfzg5O7kI3PoEhVNySV+Azim78mix/r+GUvodX7DyrVW9yDU9Mxw6RbYPX2SBRENlm+8KhTriLZg0Q19s3zYa3uk0PooWr7YeurQE8pLCBTVqi78RU6sjVrmtzX7DDGV1n2OuT3AuTu2mcJFfpcUSew9tOmW+PjxgEjoUQzJSZwt4GAYLKzMhreEbLT17tFNm9vn9dBaPukSHxKQNHBbLSAmWJzXn26+vH402GBRoFduXMx983L0/drinpHW5DLvB3sw5w8G4zmBzRziNR9SQnK2SNmAyUsEFMGICQwXjN2HrbST6nxzVOex5+EMNkk6y6qPg0RjQ==
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by SJ2PR02MB9684.namprd02.prod.outlook.com (2603:10b6:a03:53a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 05:13:12 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::8ab7:431:ac7:7836]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::8ab7:431:ac7:7836%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 05:13:11 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "open list:Block layer core"
 <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Yongji Xie <xieyongji@baidu.com>, Chai Wen <chaiwen@baidu.com>, Ni Xun
 <nixun@baidu.com>,
 "d-tatianin@yandex-team.com" <d-tatianin@yandex-team.com>,
 "yc-core@yandex-team.com" <yc-core@yandex-team.com>,
 "vsementsov@yandex-team.com" <vsementsov@yandex-team.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>
Subject: Re: [PATCH] block/vhost-user-blk: Fix hang on boot for some odd guests
Thread-Topic: [PATCH] block/vhost-user-blk: Fix hang on boot for some odd
 guests
Thread-Index: AQHZa4dfgWTimA5YfUa4D0WNPSpzYa8krlaAgAvjh4A=
Date: Tue, 18 Apr 2023 05:13:11 +0000
Message-ID: <A73B3DE0-41D0-4EDC-B589-2647158AD2D4@nutanix.com>
References: <20230410083509.3311-1-arbn@yandex-team.com>
 <fcc6073f-280b-580e-b6f7-bc176a64e810@yandex-team.com>
In-Reply-To: <fcc6073f-280b-580e-b6f7-bc176a64e810@yandex-team.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|SJ2PR02MB9684:EE_
x-ms-office365-filtering-correlation-id: 38b11c5c-dbd0-4c1c-3bd2-08db3fcb9b41
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ALBOSRAyflKcEImS2pEAhYj9AqEzlEjlr5zYZEtbXaT37UUEYButPG8EovYiMBLfkc0pU/WPhuoeBtND+6WPxOGfduESa04ZH5fXvipWXNVEo83kfNp6qObOFrm4gW6dum39cXJQ8uDvHS/FAEBg6vO/Abhxo177S9XydytIZGq5tkzu7VFvHmuRWk7iLk+XwhrCKvSES241fw6OWPT6wW/WT8anxyvhJDZYGDsp+S4Y3LwCzNYCqKSFMuvvVvVaMxLawn+qiOQRhbzjuKXuPQwD5gDMNepeNuoVsMWtZDNyaZDGKwhNRmgJrAA7n+59OnsTSByrDrNJUNIjnPX1/7vTihlsxV4D1rs8AveOcMTOQ44QxyD8lu5t3j1n1s4cExWPQhL7C0hiUnAjZd3gkwW6Gu/QvgsVvGCnE1A8Mwvz3JZRAE+JLjXwULfQbBN20kXiUNIq/TZ0kBRORCHJxe+dshWN4i4gLPjt55oyXoG4p2FfTgIgcCkkgaH5I4y2RLeXot/2smWqn9MqbLoTqQAqW0S5r4+lY/yyVazyaPaprIx4pxjURpB5gF4Ur/6DwJ/UC48laHBIWHaHui7V2LU/qjkM9AI+njVgXM2KBhPcYi2WuT41M2BljLY0fwlycWbVbXRmO87VQ9rea1qISA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199021)(2906002)(7416002)(76116006)(91956017)(8936002)(5660300002)(66899021)(44832011)(478600001)(8676002)(41300700001)(316002)(64756008)(66946007)(83380400001)(66476007)(36756003)(66556008)(33656002)(54906003)(66446008)(4326008)(6916009)(6506007)(86362001)(122000001)(38070700005)(38100700002)(53546011)(6512007)(186003)(26005)(6486002)(71200400001)(2616005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elZ1RVJnWFAwelZFWmpxV2xXRSs0UW1VVXlaY2l6ZzI0cUpKOW14RUNka3c4?=
 =?utf-8?B?dnhNMFNZWHdQRStmWUZQMlJZRUdlcklJWlltSGJuN0QyZExqRlg0MVNGWVNn?=
 =?utf-8?B?NkJvKytYT1NwRTE4U2dsZmc1TExTMFFXSk51ZUNqQVdjZzBUSmhyR0JlajZZ?=
 =?utf-8?B?b04rRmNsNTZJaDJHSFkyUlc5RXRMQVE0NkEzbDNmN1ZPSVNrbEtDbEFNZUpJ?=
 =?utf-8?B?REo0MHJZcXAzSDE1bnRQdm96VCtTMUtwQnRTeUZmK2RSTEJCLzRCSEpLNWVG?=
 =?utf-8?B?Q1A2YzFTS1JscmJBY3lFOFdEWlVtZHltSmJEaHljbW9oMExNVytNdUlHckRB?=
 =?utf-8?B?ME5QOThiVUh3UG40VEFWcjlidDVBMVF0elI0QmZoY1dFQkI0THNDUFBBTGlU?=
 =?utf-8?B?aE9XNmp4NkovMFBtL3k3Y1BDMVYya21adlRQVjVkZXZTWVZDMFBmeDFXR3lD?=
 =?utf-8?B?UVdyanRhcEl0SkJ1Mnl0RVd3VVRwUG5tdnZnWVJXdCtGYk9SdmY2TThOdXl1?=
 =?utf-8?B?TUhHdTRYc0hDdVBROXFia21PMTNEV2M0YjV4eTFNRkZUTXI2c0hMRUYxMVFk?=
 =?utf-8?B?eGNrckROckwvaFR4aHhmb3BQcXdMSHo4ZjRaNU1lN1JsZE51OFhSUDd3aTlq?=
 =?utf-8?B?dVo5MUlKOGtWU25SQ3A2djFpZDdYVmlGbFFmRVhyRXVqSnFFWEY2bmVvczJq?=
 =?utf-8?B?VUNBbElLSHkxRVJHV2ZiVTNZUEZmU1grcWxwY3EzMXBaSzUvbWNaeGxxWHJK?=
 =?utf-8?B?WXMyL01FQ2phRnpuUVYwRVc1UGErSWdlMlhTYytrdkFWMTJpeE1YQ2dPY2pV?=
 =?utf-8?B?YjJMOWNuUml6bm5tb1BQTlJXZVRsUy9NUCtWY1ZiVVRRQ2NyUG9CVGVZMmVQ?=
 =?utf-8?B?RTEveSszMnBZSEdralM4STd5YWp6VmNjVXJIaXc3MS9MdS9kRndJS2dhaGhK?=
 =?utf-8?B?V1JPVjR3SVVNUWs5UzIxVjhETkJOdURkb2xneVBNY3pBYlIzVlFhTFZwa2gw?=
 =?utf-8?B?amptL1N6dXgvcEJTdzEyU0cwaUpEMXZrWllFZERpVkk2b01ISG1vSlZxeHdB?=
 =?utf-8?B?NG0zSy9iWXprc1lDanFUcGVaWWthUVZlbmpLeXE4dTl3bDZvL3BXTTZwN0Fh?=
 =?utf-8?B?Q3c1eFdDbEhUMmJLNXZEcGJpQWF6Qm9GSW4vT3dCa21UR3Z2ZU4wRmpEYm9E?=
 =?utf-8?B?WGdLQ0dxbDBBRjBWKzlMRmxxQzNqZzJEWVhWL2o3a1NZV1cwOWlvdlA2OHNy?=
 =?utf-8?B?RVJaOTFZZE9RR1h5NWFKZVdmN3VmWDlwRDFYZDlSUzB0WXY4UElIV0Q3eitI?=
 =?utf-8?B?NVVWZFlXeExqa2owcExpOFh2aGZOK3VrYm0zeHdnb285bERzSGJibTE1dUo5?=
 =?utf-8?B?TENqUDk5WkRxVHlJQnVhWDlLc2VUR2c3TDYxb0N1bXRtUEorVEJhMEFGQVRO?=
 =?utf-8?B?K2ZFOEJ1NmRCVjRsNWRiem5IRkRGVkxYeE5LVnB6Mk51dDdFK0VEamdsdmlw?=
 =?utf-8?B?cHY4TXY5MnkvNkRibVVON3hCdFFNeXBINnc2c3JJenRUWUFJL2F2Z1p1L3F4?=
 =?utf-8?B?Z1E2eGNNY2M2c0NDSFVLS2xJK0trdXhhMEFxL0IxTWNCc0V3dkZuaVh2eEdH?=
 =?utf-8?B?aFMzcFBLZGpicldQemRRMmNXTWh4UERWTmlvaUk3TmNxcHBBQ25GcWZheDNw?=
 =?utf-8?B?MkFmSStYRFFyWTN5N3dlQ3Z1dHdoaXlFbnErc0w5WkExVk5jb0ErYWVBWVJQ?=
 =?utf-8?B?clFkSUtjRENJUWZjbGNWSWRoV202a3R3T3V6RzFzcExNV2hJVDJYdkZEMGxO?=
 =?utf-8?B?MnpsWGZrcE55TjI5bGUyUk1LSGpBNnlQdlJPM1hJV1NlaTd0aXpxb2lQRm1u?=
 =?utf-8?B?emZUUElFZ1I3d21ZclpoOVAwaFVISEFzSjM3MzA2UlV2dHZPUTZhSlA5SEdW?=
 =?utf-8?B?c3BlbEFmVW53cWR2Z1V3dVBuNUtCL2cxMVB0NDlaNjEzeDdjN0oveG5BN0RK?=
 =?utf-8?B?VktKRm8rWGRSR3A2NTg2enRWQWlkUkRjSUdNUm9CRnlCOGJUdXBwVEg1cXdo?=
 =?utf-8?B?RGFFV014UTNCcWhucmcwbGY0d0I3MC9SVVN0ekdGa29DMCtENzN2dXZ3Umh1?=
 =?utf-8?B?ZmY4UTE2dTZoU3gzRndFUU15STZMMjFET3p5SnMyM3dOc0ttT3Q3ckZHTUtn?=
 =?utf-8?Q?XT71RQwXfLsUx4VF2454U80=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5B48EC327DE5A4D9D8E654447CBB7E1@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b11c5c-dbd0-4c1c-3bd2-08db3fcb9b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 05:13:11.8660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YZ1GvSkUt74lKiGl6trzs5i1BDeKlXVqNGrQrPVvErq7a2QQRayQbQTVoXNOPUtHuz6GdnkyOP+sxPo+KNxbkKd6619M5Ec8gLigN0GMQ0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB9684
X-Proofpoint-GUID: KEgPaC7DOXLYQ1QgxosEJ2W01xemwREG
X-Proofpoint-ORIG-GUID: KEgPaC7DOXLYQ1QgxosEJ2W01xemwREG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_02,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGV5IEFuZHJleSAtIGFwb2xvZ2llcyBmb3IgdGhlIGxhdGUgcmVwbHkgaGVyZS4NCg0KSXQgc291
bmRzIGxpa2UgeW91IGFyZSBkZWFsaW5nIHdpdGggYSBidWdneSBndWVzdCwgcmF0aGVyIHRoYW4g
YSBRRU1VIGlzc3VlLg0KDQo+IE9uIEFwciAxMCwgMjAyMywgYXQgMTE6MzkgQU0sIEFuZHJleSBS
eWFiaW5pbiA8YXJibkB5YW5kZXgtdGVhbS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiA0
LzEwLzIzIDEwOjM1LCBBbmRyZXkgUnlhYmluaW4gd3JvdGU6DQo+PiBTb21lIGd1ZXN0cyBoYW5n
IG9uIGJvb3Qgd2hlbiB1c2luZyB0aGUgdmhvc3QtdXNlci1ibGstcGNpIGRldmljZSwNCj4+IGJ1
dCBib290IG5vcm1hbGx5IHdoZW4gdXNpbmcgdGhlIHZpcnRpby1ibGsgZGV2aWNlLiBUaGUgcHJv
YmxlbSBvY2N1cnMNCj4+IGJlY2F1c2UgdGhlIGd1ZXN0IGFkdmVydGlzZXMgVklSVElPX0ZfVkVS
U0lPTl8xIGJ1dCBraWNrcyB0aGUgdmlydHF1ZXVlDQo+PiBiZWZvcmUgc2V0dGluZyBWSVJUSU9f
Q09ORklHX1NfRFJJVkVSX09LLCBjYXVzaW5nIHZkZXYtPnN0YXJ0X29uX2tpY2sgdG8NCg0KVmly
dGlvIDEuMSBTZWN0aW9uIDMuMS4xLCBzYXlzIGR1cmluZyBzZXR1cCDigJxbdF1oZSBkcml2ZXIg
TVVTVCBOT1Qgbm90aWZ5IHRoZSBkZXZpY2UgYmVmb3JlIHNldHRpbmcgRFJJVkVSX09LLuKAnQ0K
DQpUaGVyZWZvcmUgd2hhdCB5b3UgYXJlIGRlc2NyaWJpbmcgaXMgYnVnZ3kgZ3Vlc3QgYmVoYXZp
b3IuIFNvdW5kcyBsaWtlIHRoZSBkcml2ZXIgc2hvdWxkIGJlIG1hZGUgdG8gZWl0aGVyDQotIG5v
dCBhZHZlcnRpc2UgVklSVElPX0ZfVkVSU0lPTl8xDQotIG5vdCBraWNrIGJlZm9yZSBzZXR0aW5n
IFZJUlRJT19DT05GSUdfU19EUklWRVJfT0sNCg0KSWYgYW55dGhpbmcsIHRoZSB2aXJ0aW8tYmxr
IHZpcnRpb19ibGtfaGFuZGxlX291dHB1dCgpIGZ1bmN0aW9uIHNob3VsZCBwcm9iYWJseSBjaGVj
ayBzdGFydF9vbl9raWNrPw0KDQo+PiBiZSBmYWxzZSBpbiB2aG9zdF91c2VyX2Jsa19oYW5kbGVf
b3V0cHV0KCkgYW5kIHByZXZlbnRpbmcgdGhlIGRldmljZSBmcm9tDQo+PiBzdGFydGluZy4NCj4+
IA0KPj4gRml4IHRoaXMgYnkgcmVtb3ZpbmcgdGhlIGNoZWNrIGZvciB2ZGV2LT5zdGFydF9vbl9r
aWNrIHRvIGVuc3VyZQ0KPj4gdGhhdCB0aGUgZGV2aWNlIHN0YXJ0cyBhZnRlciB0aGUga2ljay4g
VGhpcyBhbGlnbnMgdGhlIGJlaGF2aW9yIG9mDQo+PiAndmhvc3QtdXNlci1ibGstcGNpJyBkZXZp
Y2Ugd2l0aCAndmlydGlvLWJsaycgYXMgaXQgZG9lcyB0aGUgc2ltaWxhcg0KPj4gdGhpbmcgaW4g
aXRzIHZpcnRpb19ibGtfaGFuZGxlX291dHB1dCgpIGZ1bmN0aW9uLg0KPj4gDQo+PiBGaXhlczog
MTEwYjk0NjNkNWM4ICgidmhvc3QtdXNlci1ibGs6IHN0YXJ0IHZob3N0IHdoZW4gZ3Vlc3Qga2lj
a3MiKQ0KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IFJ5YWJpbmluIDxhcmJuQHlhbmRleC10ZWFt
LmNvbT4NCj4+IC0tLQ0KPj4gaHcvYmxvY2svdmhvc3QtdXNlci1ibGsuYyB8IDQgLS0tLQ0KPj4g
MSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9ody9i
bG9jay92aG9zdC11c2VyLWJsay5jIGIvaHcvYmxvY2svdmhvc3QtdXNlci1ibGsuYw0KPj4gaW5k
ZXggYWZmNGQyYjhjYmQuLjQ0OGVhZDQ0OGYzIDEwMDY0NA0KPj4gLS0tIGEvaHcvYmxvY2svdmhv
c3QtdXNlci1ibGsuYw0KPj4gKysrIGIvaHcvYmxvY2svdmhvc3QtdXNlci1ibGsuYw0KPj4gQEAg
LTI3OSwxMCArMjc5LDYgQEAgc3RhdGljIHZvaWQgdmhvc3RfdXNlcl9ibGtfaGFuZGxlX291dHB1
dChWaXJ0SU9EZXZpY2UgKnZkZXYsIFZpcnRRdWV1ZSAqdnEpDQo+PiAgICAgRXJyb3IgKmxvY2Fs
X2VyciA9IE5VTEw7DQo+PiAgICAgaW50IGksIHJldDsNCj4+IA0KPj4gLSAgICBpZiAoIXZkZXYt
PnN0YXJ0X29uX2tpY2spIHsNCj4+IC0gICAgICAgIHJldHVybjsNCj4+IC0gICAgfQ0KPj4gLQ0K
Pj4gICAgIGlmICghcy0+Y29ubmVjdGVkKSB7DQo+PiAgICAgICAgIHJldHVybjsNCj4+ICAgICB9
DQo+IA0KPiANCj4gQWZ0ZXIgbG9va2luZyBhIGJpdCBjbG9zZXIgdG8gdGhpcyAtPnN0YXJ0X29u
X2tpY2sgdGhpbmcgKCBjb21taXQgYmFkYWY3OWNmZGJkICgidmlydGlvOiBJbnRyb2R1Y2Ugc3Rh
cnRlZCBmbGFnIHRvIFZpcnRpb0RldmljZSIpDQo+IGFuZCBmb2xsb3cgdXBzKSBJJ20gc3RhcnRp
bmcgdG8gdGhpbmsgdGhhdCByZW1vdmluZyBpdCBlbnRpcmVseSB3b3VsZCBiZSB0aGUgcmlnaHQg
dGhpbmcgdG8gZG8gaGVyZS4NCj4gVGhlIHdob2xlIHJlYXNvbiBmb3IgaXQgd2FzIHRvIGFkZCBz
cGVjaWFsIGNhc2UgZm9yICFWSVJUSU9fRl9WRVJTSU9OXzEgZ3Vlc3RzLg0KDQpUaGUgdmlydGlv
IDEuMCBzcGVjIHNlY3Rpb24gMi4xLjIgZXhwbGljaXRseSBzYXlzOiAiVGhlIGRldmljZSBNVVNU
IE5PVCBjb25zdW1lIGJ1ZmZlcnMgb3Igbm90aWZ5IHRoZSBkcml2ZXIgYmVmb3JlIERSSVZFUl9P
Sy7igJ0NCg0KWW91ciBjaGFuZ2UgaGVyZSB3b3VsZCBtYWtlIFFFTVUgdmlvbGF0ZSB0aGlzIGNv
bmRpdGlvbi4gSSBkb27igJl0IGtub3cgd2hhdCB0aGUgZGFuZ2VyIGlzIGJ1dCBJIGFzc3VtZSB0
aGF0IHdvcmRpbmcgaXMgdGhlcmUgZm9yIGEgcmVhc29uLg0KDQpVbmxlc3MgTVNUIG9yIENvcm5l
bGxpYSAoQ0NlZCkgc2F5IG90aGVyd2lzZSBJIGRvbuKAmXQgdGhpbmsgdGhpcyBpcyB0aGUgY29y
cmVjdCBhcHByb2FjaC4NCg0KPiBJZiB3ZSBtYWtpbmcgc3RhcnQgb24ga2ljayB0aGluZyBmb3Ig
bWlzYmVoYXZpbmcgVklSVElPX0ZfVkVSU0lPTl8xIGd1ZXN0cyB0b28sIHRoYW4gdGhlIGZsYWcg
aXMgbm8gbG9uZ2VyIHJlcXVpcmVkLA0KPiBzbyB3ZSBjYW4gZG8gZm9sbG93aW5nOg0KPiANCj4g
LS0tDQo+IGh3L2Jsb2NrL3Zob3N0LXVzZXItYmxrLmMgIHwgIDQgLS0tLQ0KPiBody92aXJ0aW8v
dmlydGlvLXFtcC5jICAgICB8ICAyICstDQo+IGh3L3ZpcnRpby92aXJ0aW8uYyAgICAgICAgIHwg
MjEgKystLS0tLS0tLS0tLS0tLS0tLS0tDQo+IGluY2x1ZGUvaHcvdmlydGlvL3ZpcnRpby5oIHwg
IDUgLS0tLS0NCj4gNCBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L2Jsb2NrL3Zob3N0LXVzZXItYmxrLmMgYi9ody9i
bG9jay92aG9zdC11c2VyLWJsay5jDQo+IGluZGV4IGFmZjRkMmI4Y2JkLi40NDhlYWQ0NDhmMyAx
MDA2NDQNCj4gLS0tIGEvaHcvYmxvY2svdmhvc3QtdXNlci1ibGsuYw0KPiArKysgYi9ody9ibG9j
ay92aG9zdC11c2VyLWJsay5jDQo+IEBAIC0yNzksMTAgKzI3OSw2IEBAIHN0YXRpYyB2b2lkIHZo
b3N0X3VzZXJfYmxrX2hhbmRsZV9vdXRwdXQoVmlydElPRGV2aWNlICp2ZGV2LCBWaXJ0UXVldWUg
KnZxKQ0KPiAgICAgRXJyb3IgKmxvY2FsX2VyciA9IE5VTEw7DQo+ICAgICBpbnQgaSwgcmV0Ow0K
PiANCj4gLSAgICBpZiAoIXZkZXYtPnN0YXJ0X29uX2tpY2spIHsNCj4gLSAgICAgICAgcmV0dXJu
Ow0KPiAtICAgIH0NCj4gLQ0KPiAgICAgaWYgKCFzLT5jb25uZWN0ZWQpIHsNCj4gICAgICAgICBy
ZXR1cm47DQo+ICAgICB9DQo+IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmlydGlvLXFtcC5jIGIv
aHcvdmlydGlvL3ZpcnRpby1xbXAuYw0KPiBpbmRleCBlNGQ0YmVjZTJkNy4uNDg2NTgxOWNkMmYg
MTAwNjQ0DQo+IC0tLSBhL2h3L3ZpcnRpby92aXJ0aW8tcW1wLmMNCj4gKysrIGIvaHcvdmlydGlv
L3ZpcnRpby1xbXAuYw0KPiBAQCAtNzczLDcgKzc3Myw3IEBAIFZpcnRpb1N0YXR1cyAqcW1wX3hf
cXVlcnlfdmlydGlvX3N0YXR1cyhjb25zdCBjaGFyICpwYXRoLCBFcnJvciAqKmVycnApDQo+ICAg
ICBzdGF0dXMtPmRpc2FibGVkID0gdmRldi0+ZGlzYWJsZWQ7DQo+ICAgICBzdGF0dXMtPnVzZV9z
dGFydGVkID0gdmRldi0+dXNlX3N0YXJ0ZWQ7DQo+ICAgICBzdGF0dXMtPnN0YXJ0ZWQgPSB2ZGV2
LT5zdGFydGVkOw0KPiAtICAgIHN0YXR1cy0+c3RhcnRfb25fa2ljayA9IHZkZXYtPnN0YXJ0X29u
X2tpY2s7DQo+ICsgICAgc3RhdHVzLT5zdGFydF9vbl9raWNrID0gdHJ1ZTsNCj4gICAgIHN0YXR1
cy0+ZGlzYWJsZV9sZWdhY3lfY2hlY2sgPSB2ZGV2LT5kaXNhYmxlX2xlZ2FjeV9jaGVjazsNCj4g
ICAgIHN0YXR1cy0+YnVzX25hbWUgPSBnX3N0cmR1cCh2ZGV2LT5idXNfbmFtZSk7DQo+ICAgICBz
dGF0dXMtPnVzZV9ndWVzdF9ub3RpZmllcl9tYXNrID0gdmRldi0+dXNlX2d1ZXN0X25vdGlmaWVy
X21hc2s7DQo+IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmlydGlvLmMgYi9ody92aXJ0aW8vdmly
dGlvLmMNCj4gaW5kZXggZjM1MTc4ZjVmY2QuLjIxODU4NGVhZTg1IDEwMDY0NA0KPiAtLS0gYS9o
dy92aXJ0aW8vdmlydGlvLmMNCj4gKysrIGIvaHcvdmlydGlvL3ZpcnRpby5jDQo+IEBAIC0yMTI2
LDcgKzIxMjYsNiBAQCB2b2lkIHZpcnRpb19yZXNldCh2b2lkICpvcGFxdWUpDQo+ICAgICAgICAg
ay0+cmVzZXQodmRldik7DQo+ICAgICB9DQo+IA0KPiAtICAgIHZkZXYtPnN0YXJ0X29uX2tpY2sg
PSBmYWxzZTsNCj4gICAgIHZkZXYtPnN0YXJ0ZWQgPSBmYWxzZTsNCj4gICAgIHZkZXYtPmJyb2tl
biA9IGZhbHNlOw0KPiAgICAgdmRldi0+Z3Vlc3RfZmVhdHVyZXMgPSAwOw0KPiBAQCAtMjI0OCw5
ICsyMjQ3LDcgQEAgc3RhdGljIHZvaWQgdmlydGlvX3F1ZXVlX25vdGlmeV92cShWaXJ0UXVldWUg
KnZxKQ0KPiAgICAgICAgIHRyYWNlX3ZpcnRpb19xdWV1ZV9ub3RpZnkodmRldiwgdnEgLSB2ZGV2
LT52cSwgdnEpOw0KPiAgICAgICAgIHZxLT5oYW5kbGVfb3V0cHV0KHZkZXYsIHZxKTsNCj4gDQo+
IC0gICAgICAgIGlmICh1bmxpa2VseSh2ZGV2LT5zdGFydF9vbl9raWNrKSkgew0KPiAtICAgICAg
ICAgICAgdmlydGlvX3NldF9zdGFydGVkKHZkZXYsIHRydWUpOw0KPiAtICAgICAgICB9DQo+ICsg
ICAgICAgIHZpcnRpb19zZXRfc3RhcnRlZCh2ZGV2LCB0cnVlKTsNCj4gICAgIH0NCj4gfQ0KPiAN
Cj4gQEAgLTIyNjgsOSArMjI2NSw3IEBAIHZvaWQgdmlydGlvX3F1ZXVlX25vdGlmeShWaXJ0SU9E
ZXZpY2UgKnZkZXYsIGludCBuKQ0KPiAgICAgfSBlbHNlIGlmICh2cS0+aGFuZGxlX291dHB1dCkg
ew0KPiAgICAgICAgIHZxLT5oYW5kbGVfb3V0cHV0KHZkZXYsIHZxKTsNCj4gDQo+IC0gICAgICAg
IGlmICh1bmxpa2VseSh2ZGV2LT5zdGFydF9vbl9raWNrKSkgew0KPiAtICAgICAgICAgICAgdmly
dGlvX3NldF9zdGFydGVkKHZkZXYsIHRydWUpOw0KPiAtICAgICAgICB9DQo+ICsgICAgICAgIHZp
cnRpb19zZXRfc3RhcnRlZCh2ZGV2LCB0cnVlKTsNCj4gICAgIH0NCj4gfQ0KPiANCj4gQEAgLTI4
ODEsMTIgKzI4NzYsNiBAQCBpbnQgdmlydGlvX3NldF9mZWF0dXJlcyhWaXJ0SU9EZXZpY2UgKnZk
ZXYsIHVpbnQ2NF90IHZhbCkNCj4gICAgICAgICAgICAgfQ0KPiAgICAgICAgIH0NCj4gICAgIH0N
Cj4gLSAgICBpZiAoIXJldCkgew0KPiAtICAgICAgICBpZiAoIXZpcnRpb19kZXZpY2Vfc3RhcnRl
ZCh2ZGV2LCB2ZGV2LT5zdGF0dXMpICYmDQo+IC0gICAgICAgICAgICAhdmlydGlvX3ZkZXZfaGFz
X2ZlYXR1cmUodmRldiwgVklSVElPX0ZfVkVSU0lPTl8xKSkgew0KPiAtICAgICAgICAgICAgdmRl
di0+c3RhcnRfb25fa2ljayA9IHRydWU7DQo+IC0gICAgICAgIH0NCj4gLSAgICB9DQo+ICAgICBy
ZXR1cm4gcmV0Ow0KPiB9DQo+IA0KPiBAQCAtMzAzOSwxMSArMzAyOCw2IEBAIGludCB2aXJ0aW9f
bG9hZChWaXJ0SU9EZXZpY2UgKnZkZXYsIFFFTVVGaWxlICpmLCBpbnQgdmVyc2lvbl9pZCkNCj4g
ICAgICAgICB9DQo+ICAgICB9DQo+IA0KPiAtICAgIGlmICghdmlydGlvX2RldmljZV9zdGFydGVk
KHZkZXYsIHZkZXYtPnN0YXR1cykgJiYNCj4gLSAgICAgICAgIXZpcnRpb192ZGV2X2hhc19mZWF0
dXJlKHZkZXYsIFZJUlRJT19GX1ZFUlNJT05fMSkpIHsNCj4gLSAgICAgICAgdmRldi0+c3RhcnRf
b25fa2ljayA9IHRydWU7DQo+IC0gICAgfQ0KPiAtDQo+ICAgICBSQ1VfUkVBRF9MT0NLX0dVQVJE
KCk7DQo+ICAgICBmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsNCj4gICAgICAgICBpZiAodmRl
di0+dnFbaV0udnJpbmcuZGVzYykgew0KPiBAQCAtMzE2Miw3ICszMTQ2LDYgQEAgdm9pZCB2aXJ0
aW9faW5pdChWaXJ0SU9EZXZpY2UgKnZkZXYsIHVpbnQxNl90IGRldmljZV9pZCwgc2l6ZV90IGNv
bmZpZ19zaXplKQ0KPiAgICAgICAgICAgICBnX21hbGxvYzAoc2l6ZW9mKCp2ZGV2LT52ZWN0b3Jf
cXVldWVzKSAqIG52ZWN0b3JzKTsNCj4gICAgIH0NCj4gDQo+IC0gICAgdmRldi0+c3RhcnRfb25f
a2ljayA9IGZhbHNlOw0KPiAgICAgdmRldi0+c3RhcnRlZCA9IGZhbHNlOw0KPiAgICAgdmRldi0+
dmhvc3Rfc3RhcnRlZCA9IGZhbHNlOw0KPiAgICAgdmRldi0+ZGV2aWNlX2lkID0gZGV2aWNlX2lk
Ow0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLmggYi9pbmNsdWRlL2h3
L3ZpcnRpby92aXJ0aW8uaA0KPiBpbmRleCA3N2M2YzU1OTI5Zi4uNTc0Mjg3NmI0ZmEgMTAwNjQ0
DQo+IC0tLSBhL2luY2x1ZGUvaHcvdmlydGlvL3ZpcnRpby5oDQo+ICsrKyBiL2luY2x1ZGUvaHcv
dmlydGlvL3ZpcnRpby5oDQo+IEBAIC0xNDQsNyArMTQ0LDYgQEAgc3RydWN0IFZpcnRJT0Rldmlj
ZQ0KPiAgICAgICovDQo+ICAgICBib29sIHVzZV9zdGFydGVkOw0KPiAgICAgYm9vbCBzdGFydGVk
Ow0KPiAtICAgIGJvb2wgc3RhcnRfb25fa2ljazsgLyogd2hlbiB2aXJ0aW8gMS4wIGZlYXR1cmUg
aGFzIG5vdCBiZWVuIG5lZ290aWF0ZWQgKi8NCj4gICAgIGJvb2wgZGlzYWJsZV9sZWdhY3lfY2hl
Y2s7DQo+ICAgICBib29sIHZob3N0X3N0YXJ0ZWQ7DQo+ICAgICBWTUNoYW5nZVN0YXRlRW50cnkg
KnZtc3RhdGU7DQo+IEBAIC00NjAsMTAgKzQ1OSw2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB2aXJ0
aW9fZGV2aWNlX3Nob3VsZF9zdGFydChWaXJ0SU9EZXZpY2UgKnZkZXYsIHVpbnQ4X3Qgc3RhdHVz
DQo+IA0KPiBzdGF0aWMgaW5saW5lIHZvaWQgdmlydGlvX3NldF9zdGFydGVkKFZpcnRJT0Rldmlj
ZSAqdmRldiwgYm9vbCBzdGFydGVkKQ0KPiB7DQo+IC0gICAgaWYgKHN0YXJ0ZWQpIHsNCj4gLSAg
ICAgICAgdmRldi0+c3RhcnRfb25fa2ljayA9IGZhbHNlOw0KPiAtICAgIH0NCj4gLQ0KPiAgICAg
aWYgKHZkZXYtPnVzZV9zdGFydGVkKSB7DQo+ICAgICAgICAgdmRldi0+c3RhcnRlZCA9IHN0YXJ0
ZWQ7DQo+ICAgICB9DQo+IC0tIA0KPiAyLjM5LjINCg0K

