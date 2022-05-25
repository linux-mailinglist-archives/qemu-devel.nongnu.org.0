Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74FA534066
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 17:31:26 +0200 (CEST)
Received: from localhost ([::1]:54048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntsyr-0006qX-IN
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 11:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6144085ad1=pdel@fb.com>)
 id 1ntsv7-0003m8-M8; Wed, 25 May 2022 11:27:33 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:65304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6144085ad1=pdel@fb.com>)
 id 1ntsv5-0006Nk-6G; Wed, 25 May 2022 11:27:33 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24P5Okft023561;
 Wed, 25 May 2022 08:27:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Poc3qi1m0fA0yQKw60/KiYwAyQ9ANn1Uss5rfD3epDg=;
 b=BBpuhi8KwFvqJ/Jzn8zKDgc2F4LcUUKHQH+5dICcCjiYKdi8o2iDoVfAzeMiSFJKRDFY
 5G6dedTqGRjcXaP+t//p6+TIECRppC94AY9EsXaxsLly1xBsLcQkoXZqNx99jv7URFQ8
 /MEJjZ2UArQF2lL6U1GD6wwhg/eUzhRYzrA= 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g93tvpm1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 08:27:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZU55u28codrBonXpsLzAHWUSmLh5lpquf+T/FN7w/+Fqi8aVEkWHGQ+G8GV0PrWDCJyRVHTwz/XV0V5MH62Yi8k2dujrL2PBL2gIwQtMRIueQ/Sk+VOReeEZXVpa/wQn11MG21MCDbYzkc0b2D2C3/hWiWzMyo8Lw/KOCn/1HRd1HTOGaHeA+tFN7wyuVCoaY5spjTSeubHFSzjXi16tYXq9XwuniRLYIx2mEH1nJstlbaJx96SRS2MosBSGO5ANRkQCHbfj4TXNP3oc1bLvsLAEcwhfT7FZqWV7dHWwenKfDvVo8vfpBzbf9LSQdfR/qBQSOt+ngy3SWbyppvd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Poc3qi1m0fA0yQKw60/KiYwAyQ9ANn1Uss5rfD3epDg=;
 b=Vim2xe5p8/WrlbByZZM2ot0UEHcybKpCYuxsZyrLUSVeKY6uElumqSIFls3iD9hD1B+XBNQFwmQj4xe5QH1HM4QOSAIo8KyWrS1DBgDqtSep09BwQsPWAn0ZPG9KW9pjoexZS18QImvSFehoaOuyonO139UCItbiKVpzrbVJuiGzQzdh//N2iK/FaoDzGN3gAifd/EZ8+CksypBUiCw5XM4JX9NzCRDSUkgNQ2F2HRLQqkHgDPkEEdMJCpG1MNUytF/mtydfh6nSYhSHZ7YGX/dr0+INN2CBYh21yoeybVBwlbcygMLu5z98dmmYHjLDxjBHvEPb5bey8WktkcE+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by DM6PR15MB2937.namprd15.prod.outlook.com (2603:10b6:5:138::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Wed, 25 May
 2022 15:27:17 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081%6]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 15:27:17 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Thread-Topic: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Thread-Index: AQHYX0HIkqOKjoOJ/k+YKhqMRITql60vZ8qAgABxh+g=
Date: Wed, 25 May 2022 15:27:17 +0000
Message-ID: <6823A1FC-6385-43EB-B201-E940C3136510@fb.com>
References: <20220503225925.1798324-1-pdel@fb.com>
 <20220503225925.1798324-2-pdel@fb.com>
 <b9d55cf6-6240-003b-c9d4-c7bb73327685@kaod.org>
In-Reply-To: <b9d55cf6-6240-003b-c9d4-c7bb73327685@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a55baa95-592f-4f01-431c-08da3e630d4a
x-ms-traffictypediagnostic: DM6PR15MB2937:EE_
x-microsoft-antispam-prvs: <DM6PR15MB2937F97DE0102D6FBB978C85ACD69@DM6PR15MB2937.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W1UjO/4NLcmbT0rNsd7olEDhU5F4gXWCA8H6WoQJvrkFip6B7LxlohZ3UHIfLRKHo9FP5kgslTfeOjdvk8C79VZRbS+cS4Ye4LCzl1fmASwfpPQFBwSmuWP/+2ar4rYhKZqgC+sgQISiSCjznj0GFEvVhWPa2rRJ1oXFqQBTPRvQlfor2iLiG2A9Jv/d6O/a11FuOlnB6sIWBljTtrHHd/w7uN3Zb6WFKhAlDKZSsQLNXqc+3BtF+KuLlk7xihoqo6NrYYfXbgbM14Z/ESm3ehnRCL1CgAmSbDdLQLm89nH5i4sKDO/WlBrnZU0l3LFoJ/+d1yNEDdW7rrSXPWIqPRS/ElHfsqDRHlbARN30TVNM9y3TqHyfQ9zTKsrgmvSGxU6CuGrYlGIvDVaZyHJWxLGw0KglIKQiiTQj7vJUEoFh5S87roV9RWgwBwfExe+4MX8D06++yp/jBqALlU7FWe4ZZRwuXHxe2x7zsUSL9FBLDsZOpbzcQ5Xs28kr20pEn0tBRxTgAdiWlKVg59PqzPrZQSTDG5yeeF4xf+ZqdPxbWh/TAVgbO2FuWG0674m+iPdhzoEfz8z+PLCoPBP+qKjNqTof3nI65d6T8BDt2+epYudR1rvKA0OHK0uxDpJnHa1sJ/yMRs+LY4LvlHBpKwAS9Tpoz+qOB1J641ODkqrnuQ/1VyUDgKsjPgpOon7CEdiBoPPO7hYxBcEdlxxAVpCBX6gAcMHtwuwfpzvyArqTSLoa8/gZ44CflBXurkfhyA0vQ2hPB03lMbG4YeLBlXTXQkCa/JNSpY1dLzTZfMub/p07YxqspbELn4scj6B1trZ1UnKakIVlisNOYYSfp+zArAECBN+ASAs5Ot4bN+I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(6506007)(5660300002)(316002)(6512007)(8936002)(38100700002)(54906003)(33656002)(6916009)(6486002)(53546011)(122000001)(38070700005)(186003)(86362001)(66446008)(83380400001)(4326008)(36756003)(8676002)(66476007)(66946007)(64756008)(66556008)(2616005)(2906002)(966005)(508600001)(71200400001)(76116006)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHBJdXNlOWxLRHZISmxwVWllK0ZnT3hZRVF0RndReDVyZ3RDTkQzckc4NGpP?=
 =?utf-8?B?eG1XUElOV0RvVmhCeEdqNC93WU55QkpnQmpabFZMSTlwbnRwRFRCVkUrak1M?=
 =?utf-8?B?dmtRYlMyYXRKSjZ5RUx4WWMyQk41RjFwQ0hya3NjSWYzYjVGT0pYUTI5ZkVC?=
 =?utf-8?B?T2xHc0VVUURwVDNaQURhRWxwVkpsTlcycDNKRmJtTGh1MWdNSzhUQkJUT012?=
 =?utf-8?B?WUFta095a2pUVW40U3Y0c3BBL1JoQ08rMFcyZkdqT2hPRTV2QTd0R1BIUURN?=
 =?utf-8?B?ZVNoV29XcWwvd05PczdDd0l2ZXpmcEVyL1pkc1FMRHZicVFjaWpCSlpiUEJ4?=
 =?utf-8?B?eUZyaTlDREZFR2k3Q1ZPQklhYzNrWGdLM0tXOTByZjh0a05rVHplMSs1bkI5?=
 =?utf-8?B?T001R2kvUFNJS01CL0ZEZGZTR3crVmR4NjlFRlByb0RkMlhnaW1ZOXZSVUg3?=
 =?utf-8?B?K3NudjJaQlpqKytiUWRibEJyT0FrZkNWMjQzOXFpeFJTTkNyWTRUNzRSQ0R6?=
 =?utf-8?B?c1RqaHRqWEVxWDVwTXBQMEpWSHNveVB0cTBQcWJzelN3QTRsTnkyd1RvSUNj?=
 =?utf-8?B?M1Q0VjNFWjFZSUhhTkc5eVZMazBRU3IwVFFXMXV3RUtlR1BLZzF5cTV1K3Vi?=
 =?utf-8?B?Yi90Yjl5aGFLVERFMW9hTGFacXZrRmd4SUJ3d0Y3alI0WVBuSFRrWFdubmQ5?=
 =?utf-8?B?UlplUkZqVERkTWJaWnN2ZEZ0WDk4TDAvbGJERkIrc2VaWTM4ejE0M1VDTzVY?=
 =?utf-8?B?RU1oSXdjVEo5VFVXQ1UraThqUXluU0l1WkpsaU1JemJXdWJwM2JFNGtwVWgz?=
 =?utf-8?B?R2g2T0NzVi9aM0Z4OWh0WDFJelBCWXVQcllZTk1QcWtPUncvSmhYRU00a092?=
 =?utf-8?B?UDVHR0RDUGRHK3Q0QTJRakk1Z2svL3oxU3pwVitTd0dmR2lUclZCaGsxeGgy?=
 =?utf-8?B?ZDRsODhRbEJqN05tQStNR3RXUkxBeTVXMFNjL0dyQ0NMdmFlV3pGdW5aT3lx?=
 =?utf-8?B?czJEcTJyNmRudWZ4MU01a3JPSDFMWkFCUytvNk5NbUxvdWliWGxLVkFnNXhZ?=
 =?utf-8?B?WmEwQTc3aFczcEh6dGdsbjNkbTQrdmd6cnh0SzhlSURQZExXQklURVp1Slcw?=
 =?utf-8?B?blhONjEvUjZvMkdvSDBiZ0FVWUp2cm8xaGVsQXNGajE5Wk9vTmMzVE0yK2pt?=
 =?utf-8?B?NTZYUGFrSzdqQmF6VTNkc21JTGNLRWlPZ1JTcFZoM0c2QmRSczR0byt2UUt4?=
 =?utf-8?B?c1VIZEk4TFNRQXZIdFZsVnp2WHRDZFE2YmFDZTdTTHErUGt4SEpKMWFhYVhy?=
 =?utf-8?B?ajBCZ1BzaXBmelJoMlpVUG92enVubkJBMktBN0NvTDRKVENFT2prU003d1k5?=
 =?utf-8?B?b1Rtb3hzRDFBNks2Z0FZOUV6QnlrZFlXRmV2bnJnaStyTkM4Ly9rOHBBY1I0?=
 =?utf-8?B?aUFiLysxakxmQ1JGREowVkZRRThTZWR0bElWdlF4Mm96eHJxZTNtZmRpT0Fs?=
 =?utf-8?B?MjZtSEEzUDBPTnVucWVUWGhJaW9ya2dqS21OdW1CVitCQzg0WlYrZ0owbUsv?=
 =?utf-8?B?R3RrRFZMSU9vUGtOQ2ZubTl2QSt6Y0grYXZSc1JTZUxXQlRLRysxRWN1TDgy?=
 =?utf-8?B?cGY0c0dmV0ZBRHZpUnRGR1FGejFoK3VPNFdLRGYxL2J3d0tWaFNORmhCU0xk?=
 =?utf-8?B?YUFZVDhsQ1hOVFBXencvV3pua2RoZnlhenF0Q3hXTjVJSkhTbVZYdnZhbXBB?=
 =?utf-8?B?NUJOOWlSUmFmUys3dENpQ2VPK0Y5aEdpY253WVFqbFlzRXVqa2doVlBnaHhY?=
 =?utf-8?B?cWN3WnB5cGNuSjE3UnZ6Y0htTmtSWktoSXRCZkd0UHJjdTVvSEswSVpMTGoz?=
 =?utf-8?B?Q0JFU0lBZm1GRnl2M3M5MVFJcjcwNTRNMlFYSWtKVW5tZjJOWVp2WHltT3lP?=
 =?utf-8?B?YU1rUnVMNE5FTS94MnRBVFlzUDNVRjZQc1JQTHlVTUw4dFFWNHYzZXBoVElT?=
 =?utf-8?B?NGxCalVUNVFza1pGNWRPTGZPQlR6dDQrZzU1WVlPKzlJSVd3Nm90dGJaa2hq?=
 =?utf-8?B?YUtsOUlPSFhlV2JoZkdYWkpyUTdlaDFGQ3V6M0x5NTVrZ2ZOc1M4WjZsQU5m?=
 =?utf-8?B?YnBaZDBrR0xjNzJNdmpuYUpjM3pFRmQ4R2hIZ0lYSFQrbkxQOUErUVZzdUs1?=
 =?utf-8?B?REMyd1NQRnd3bC9qRVJYUjBETDZlSmtJNGQvRHliK2xGVWJ2ZmNPdHpDVWlz?=
 =?utf-8?B?M3gvNWNhNzhMUDlQRkt5UXBkTDUvWnFsY29UcExxMEcrMHBsdWlZZEwvcmha?=
 =?utf-8?Q?bZTJYh4S9FI5Pnud6t?=
Content-Type: text/plain; charset="utf-8"
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55baa95-592f-4f01-431c-08da3e630d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 15:27:17.1845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAHfmFZOlDT+qnSsh+5Es8hRY5KNOFhtmk0JqMcsy/tO0ZMhYOKp9TpbIswgtZCm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB2937
X-Proofpoint-GUID: TUFBLaSB76i1iWpqOK3TjqGabC5zf_Od
X-Proofpoint-ORIG-GUID: TUFBLaSB76i1iWpqOK3TjqGabC5zf_Od
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_04,2022-05-25_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6144085ad1=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWF5IDI1LCAyMDIyLCBhdCAxOjQxIEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToNCj4gDQo+IO+7v0hlbGxvIFBldGVyLA0KPiANCj4+IE9uIDUvNC8y
MiAwMDo1OSwgUGV0ZXIgRGVsZXZvcnlhcyB3cm90ZToNCj4+IEFkZCB0aGUgJ2ZieTM1LWJtYycg
bWFjaGluZSB0eXBlIGJhc2VkIG9uIHRoZSBrZXJuZWwgRFRTWzFdIGFuZCB1c2Vyc3BhY2UNCj4+
IGkyYyBzZXR1cCBzY3JpcHRzWzJdLiBVbmRlZmluZWQgdmFsdWVzIGFyZSBpbmhlcml0ZWQgZnJv
bSB0aGUgQVNUMjYwMC1FVkIuDQo+PiBSZWZlcmVuY2UgaW1hZ2VzIGNhbiBiZSBmb3VuZCBpbiBG
YWNlYm9vayBPcGVuQk1DIEdpdGh1YiBSZWxlYXNlIGFzc2V0cw0KPj4gYXMgImZieTM1Lm10ZCIu
IFszXQ0KPj4gWW91IGNhbiBib290IHRoZSByZWZlcmVuY2UgaW1hZ2VzIGFzIGZvbGxvd3MgKGZi
eTM1IHVzZXMgZHVhbC1mbGFzaCk6DQo+PiBxZW11LXN5c3RlbS1hcm0gLW1hY2hpbmUgZmJ5MzUt
Ym1jIFwNCj4+ICAgICAtZHJpdmUgZmlsZT1mYnkzNS5tdGQsZm9ybWF0PXJhdyxpZj1tdGQgXA0K
Pj4gICAgIC1kcml2ZSBmaWxlPWZieTM1Lm10ZCxmb3JtYXQ9cmF3LGlmPW10ZCBcDQo+PiAgICAg
LW5vZ3JhcGhpYw0KPj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9mYWNlYm9vay9vcGVuYm1jLWxp
bnV4L2Jsb2IvNDEyZDUwNTMyNTgwMDcxMTdlOTRiMWUzNjAxNWFlZmMxMzAxNDc0Yi9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtYm1jLWZhY2Vib29rLWZieTM1LmR0cw0KPj4gWzJdIGh0dHBzOi8v
Z2l0aHViLmNvbS9mYWNlYm9vay9vcGVuYm1jL2Jsb2IvZTIyOTRmZjVkMzFkZDY1YzI0OGZlMzk2
YTM4NTI4NmQ2ZDVjNDYzZC9tZXRhLWZhY2Vib29rL21ldGEtZmJ5MzUvcmVjaXBlcy1mYnkzNS9w
bGF0LXV0aWxzL2ZpbGVzL3NldHVwLWRldi5zaA0KPj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9m
YWNlYm9vay9vcGVuYm1jL3JlbGVhc2VzDQo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9y
eWFzIDxwZGVsQGZiLmNvbT4NCj4+IC0tLQ0KPj4gdjI6IFJlbW92ZWQgYXZvY2FkbyB0ZXN0LCB1
cGRhdGVkIGNvbW1pdCBtZXNzYWdlLg0KPj4gIGh3L2FybS9hc3BlZWQuYyB8IDYzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNjMgaW5zZXJ0aW9ucygrKQ0KPj4gZGlmZiAtLWdpdCBhL2h3L2FybS9hc3BlZWQuYyBi
L2h3L2FybS9hc3BlZWQuYw0KPj4gaW5kZXggYTc0YzEzYWIwZi4uNzI1YzE2OTQ4OCAxMDA2NDQN
Cj4+IC0tLSBhL2h3L2FybS9hc3BlZWQuYw0KPj4gKysrIGIvaHcvYXJtL2FzcGVlZC5jDQo+PiBA
QCAtMjEsNiArMjEsNyBAQA0KPj4gICNpbmNsdWRlICJody9taXNjL2xlZC5oIg0KPj4gICNpbmNs
dWRlICJody9xZGV2LXByb3BlcnRpZXMuaCINCj4+ICAjaW5jbHVkZSAic3lzZW11L2Jsb2NrLWJh
Y2tlbmQuaCINCj4+ICsjaW5jbHVkZSAic3lzZW11L3Jlc2V0LmgiDQo+PiAgI2luY2x1ZGUgImh3
L2xvYWRlci5oIg0KPj4gICNpbmNsdWRlICJxZW11L2Vycm9yLXJlcG9ydC5oIg0KPj4gICNpbmNs
dWRlICJxZW11L3VuaXRzLmgiDQo+PiBAQCAtOTUxLDYgKzk1MiwzNSBAQCBzdGF0aWMgdm9pZCBi
bGV0Y2hsZXlfYm1jX2kyY19pbml0KEFzcGVlZE1hY2hpbmVTdGF0ZSAqYm1jKQ0KPj4gICAgICBp
MmNfc2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbMTJdLCBUWVBFX1BDQTk1NTIsIDB4NjcpOw0KPj4g
IH0NCj4+ICArc3RhdGljIHZvaWQgZmJ5MzVfaTJjX2luaXQoQXNwZWVkTWFjaGluZVN0YXRlICpi
bWMpDQo+PiArew0KPj4gKyAgICBBc3BlZWRTb0NTdGF0ZSAqc29jID0gJmJtYy0+c29jOw0KPj4g
KyAgICBJMkNCdXMgKmkyY1sxNl07DQo+PiArDQo+PiArICAgIGZvciAoaW50IGkgPSAwOyBpIDwg
MTY7IGkrKykgew0KPj4gKyAgICAgICAgaTJjW2ldID0gYXNwZWVkX2kyY19nZXRfYnVzKCZzb2Mt
PmkyYywgaSk7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1w
bGUoaTJjWzJdLCBUWVBFX0xNNzUsIDB4NGYpOw0KPj4gKyAgICBpMmNfc2xhdmVfY3JlYXRlX3Np
bXBsZShpMmNbOF0sIFRZUEVfVE1QNDIxLCAweDFmKTsNCj4+ICsgICAgLyogSG90c3dhcCBjb250
cm9sbGVyIGlzIGFjdHVhbGx5IHN1cHBvc2VkIHRvIGJlIG1wNTkyMCBvciBsdGM0MjgyLiAqLw0K
Pj4gKyAgICBpMmNfc2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbMTFdLCAiYWRtMTI3MiIsIDB4NDQp
Ow0KPj4gKyAgICBpMmNfc2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbMTJdLCBUWVBFX0xNNzUsIDB4
NGUpOw0KPj4gKyAgICBpMmNfc2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbMTJdLCBUWVBFX0xNNzUs
IDB4NGYpOw0KPj4gKw0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzRdLCAweDUxLCAx
MjggKiBLaUIpOw0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzZdLCAweDUxLCAxMjgg
KiBLaUIpOw0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzhdLCAweDUwLCAzMiAqIEtp
Qik7DQo+PiArICAgIGFzcGVlZF9lZXByb21faW5pdChpMmNbMTFdLCAweDUxLCAxMjggKiBLaUIp
Ow0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzExXSwgMHg1NCwgMTI4ICogS2lCKTsN
Cj4+ICsNCj4+ICsgICAgLyoNCj4+ICsgICAgICogVE9ETzogVGhlcmUgaXMgYSBtdWx0aS1tYXN0
ZXIgaTJjIGNvbm5lY3Rpb24gdG8gYW4gQVNUMTAzMCBNaW5pQk1DIG9uDQo+PiArICAgICAqIGJ1
c2VzIDAsIDEsIDIsIDMsIGFuZCA5LiBTb3VyY2UgYWRkcmVzcyAweDEwLCB0YXJnZXQgYWRkcmVz
cyAweDIwIG9uDQo+PiArICAgICAqIGVhY2guDQo+PiArICAgICAqLw0KPj4gK30NCj4+ICsNCj4+
ICBzdGF0aWMgYm9vbCBhc3BlZWRfZ2V0X21taW9fZXhlYyhPYmplY3QgKm9iaiwgRXJyb3IgKipl
cnJwKQ0KPj4gIHsNCj4+ICAgICAgcmV0dXJuIEFTUEVFRF9NQUNISU5FKG9iaiktPm1taW9fZXhl
YzsNCj4+IEBAIC0xMjkzLDYgKzEzMjMsMzUgQEAgc3RhdGljIHZvaWQgYXNwZWVkX21hY2hpbmVf
YmxldGNobGV5X2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKQ0KPj4gICAg
ICAgICAgYXNwZWVkX3NvY19udW1fY3B1cyhhbWMtPnNvY19uYW1lKTsNCj4+ICB9DQo+PiAgK3N0
YXRpYyB2b2lkIGZieTM1X3Jlc2V0KE1hY2hpbmVTdGF0ZSAqc3RhdGUpDQo+PiArew0KPj4gKyAg
ICBBc3BlZWRNYWNoaW5lU3RhdGUgKmJtYyA9IEFTUEVFRF9NQUNISU5FKHN0YXRlKTsNCj4+ICsg
ICAgQXNwZWVkR1BJT1N0YXRlICpncGlvID0gJmJtYy0+c29jLmdwaW87DQo+PiArDQo+PiArICAg
IHFlbXVfZGV2aWNlc19yZXNldCgpOw0KPj4gKw0KPj4gKyAgICAvKiBCb2FyZCBJRCAqLw0KPj4g
KyAgICBvYmplY3RfcHJvcGVydHlfc2V0X2Jvb2woT0JKRUNUKGdwaW8pLCAiZ3Bpb1Y0IiwgdHJ1
ZSwgJmVycm9yX2ZhdGFsKTsNCj4+ICsgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9ib29sKE9CSkVD
VChncGlvKSwgImdwaW9WNSIsIHRydWUsICZlcnJvcl9mYXRhbCk7DQo+PiArICAgIG9iamVjdF9w
cm9wZXJ0eV9zZXRfYm9vbChPQkpFQ1QoZ3BpbyksICJncGlvVjYiLCB0cnVlLCAmZXJyb3JfZmF0
YWwpOw0KPj4gKyAgICBvYmplY3RfcHJvcGVydHlfc2V0X2Jvb2woT0JKRUNUKGdwaW8pLCAiZ3Bp
b1Y3IiwgZmFsc2UsICZlcnJvcl9mYXRhbCk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lk
IGFzcGVlZF9tYWNoaW5lX2ZieTM1X2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpk
YXRhKQ0KPj4gK3sNCj4+ICsgICAgTWFjaGluZUNsYXNzICptYyA9IE1BQ0hJTkVfQ0xBU1Mob2Mp
Ow0KPj4gKyAgICBBc3BlZWRNYWNoaW5lQ2xhc3MgKmFtYyA9IEFTUEVFRF9NQUNISU5FX0NMQVNT
KG9jKTsNCj4+ICsNCj4+ICsgICAgbWMtPmRlc2MgICAgICAgPSAiRmFjZWJvb2sgZmJ5MzUgQk1D
IChDb3J0ZXgtQTcpIjsNCj4+ICsgICAgbWMtPnJlc2V0ICAgICAgPSBmYnkzNV9yZXNldDsNCj4+
ICsgICAgYW1jLT5mbWNfbW9kZWwgPSAibXg2NmwxZzQ1ZyI7DQo+PiArICAgIGFtYy0+bnVtX2Nz
ICAgID0gMjsNCj4+ICsgICAgYW1jLT5tYWNzX21hc2sgPSBBU1BFRURfTUFDM19PTjsNCj4+ICsg
ICAgYW1jLT5pMmNfaW5pdCAgPSBmYnkzNV9pMmNfaW5pdDsNCj4+ICsgICAgLyogRklYTUU6IFJl
cGxhY2UgdGhpcyBtYWNybyB3aXRoIHNvbWV0aGluZyBtb3JlIGdlbmVyYWwgKi8NCj4+ICsgICAg
bWMtPmRlZmF1bHRfcmFtX3NpemUgPSBGVUpJX0JNQ19SQU1fU0laRTsNCj4+ICt9DQo+PiArDQo+
PiAgI2RlZmluZSBBU1QxMDMwX0lOVEVSTkFMX0ZMQVNIX1NJWkUgKDEwMjQgKiAxMDI0KQ0KPj4g
IC8qIE1haW4gU1lTQ0xLIGZyZXF1ZW5jeSBpbiBIeiAoMjAwTUh6KSAqLw0KPj4gICNkZWZpbmUg
U1lTQ0xLX0ZSUSAyMDAwMDAwMDBVTEwNCj4+IEBAIC0xNDExLDYgKzE0NzAsMTAgQEAgc3RhdGlj
IGNvbnN0IFR5cGVJbmZvIGFzcGVlZF9tYWNoaW5lX3R5cGVzW10gPSB7DQo+PiAgICAgICAgICAu
bmFtZSAgICAgICAgICA9IE1BQ0hJTkVfVFlQRV9OQU1FKCJibGV0Y2hsZXktYm1jIiksDQo+PiAg
ICAgICAgICAucGFyZW50ICAgICAgICA9IFRZUEVfQVNQRUVEX01BQ0hJTkUsDQo+PiAgICAgICAg
ICAuY2xhc3NfaW5pdCAgICA9IGFzcGVlZF9tYWNoaW5lX2JsZXRjaGxleV9jbGFzc19pbml0LA0K
Pj4gKyAgICB9LCB7DQo+PiArICAgICAgICAubmFtZSAgICAgICAgICA9IE1BQ0hJTkVfVFlQRV9O
QU1FKCJmYnkzNS1ibWMiKSwNCj4+ICsgICAgICAgIC5wYXJlbnQgICAgICAgID0gTUFDSElORV9U
WVBFX05BTUUoImFzdDI2MDAtZXZiIiksDQo+IA0KPiBNYWNoaW5lICJmYnkzNS1ibWMiIGluaGVy
aXRzIGZyb20gdGhlICJhc3QyNjAwLWV2YiIgbWFjaGluZSBkZWZpbml0aW9ucw0KPiB3aGljaCBt
ZWFucyB0aGF0IGFueSBjaGFuZ2VzIGluICJhc3QyNjAwLWV2YiIgd2lsbCBzaWxlbnRseSBtb2Rp
ZnkNCj4gImZieTM1LWJtYyIuIElzIHRoYXQgd2hhdCB5b3Ugd2FudCA/DQoNCldoZW4gSSB3cm90
ZSB0aGlzLCB5ZXMsIHRoYXTigJlzIHdoYXQgSSBpbnRlbmRlZC4gaSB3YW50ZWQgdG8gbWFrZSB0
aGUgbWFjaGluZSBkZWZpbml0aW9uIGFzIHNpbXBsZSBhcyBwb3NzaWJsZS4NCg0KSSBkb27igJl0
IGtub3cgd2hhdCB0aGUgSFcgc3RyYXBzIHNob3VsZCBiZSwgc28gSSB3YW50ZWQgdG8gaW5oZXJp
dCB0aGVtIGZyb20gdGhlIEVWQi4NCg0KIEJ1dCB0aGlua2luZyBhZ2FpbiwgSeKAmW0gbm90IGNv
bXBsZXRlbHkgc3VyZS4NCg0KIEkgdGhpbmsgZm9yIG5vdywgSeKAmW0gb2sgd2l0aCBpdCwgYnV0
IGlmIG5lY2Vzc2FyeSwgY2hhbmdlcyB0byB0aGUgRVZCIHNob3VsZCBmZWVsIGZyZWUgdG8gYnJl
YWsgdGhpbmdzIGluIHRoaXMgbW9kZWwuIE9uY2UgSSBrbm93IHRoZSBIVyBzdHJhcCB2YWx1ZXMs
IG1heWJlIEkgY291bGQgcmVtb3ZlIHRoZSBkZXBlbmRlbmN5Lg0KDQo+IA0KPiBUaGFua3MsDQo+
IA0KPiBDLg0KPiANCj4+ICsgICAgICAgIC5jbGFzc19pbml0ICAgID0gYXNwZWVkX21hY2hpbmVf
ZmJ5MzVfY2xhc3NfaW5pdCwNCj4+ICAgICAgfSwgew0KPj4gICAgICAgICAgLm5hbWUgICAgICAg
ICAgID0gTUFDSElORV9UWVBFX05BTUUoImFzdDEwMzAtZXZiIiksDQo+PiAgICAgICAgICAucGFy
ZW50ICAgICAgICAgPSBUWVBFX0FTUEVFRF9NQUNISU5FLA0KPiANCg==

