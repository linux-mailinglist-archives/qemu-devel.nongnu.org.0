Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A8E4B851D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:04:25 +0100 (CET)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHAe-0003MY-6s
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:04:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1nKGef-0000FY-SV
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:31:26 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:32594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1nKGeY-0001lt-6i
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:31:21 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21G8oOWc001515;
 Wed, 16 Feb 2022 01:31:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=xh3uqc0s+QQl8V9LmfWpjRkmWYlElgpGhyUyWq5kZNM=;
 b=Jk9W76JAiIzNlvrzdCWzYdMTXPNzrdSE1t6G/yEI80U//qRl1ZQ2xxSlOBGMqdWlBbHF
 tjUm7ydVy0mF5EPbXArG1hTjS1sYzROhWPpAChsh2dQZi4jC5R7GyBXkv6BRKD0WInsD
 7WMSLPjWPn2lfeJhkkNoxRtsIQKGTC8pfXuhP8xJM/bM/FzI3bU4fv0px5L7qAkiF+En
 4P5Iif7GYPYlLxGRyYZcHGz+MiA/YvIVm2i86Y8uKXUULn0Wz7i+JWFUTw308IP9ctGe
 2CFltO1EytCqIiWMqhQrCkvFsN2u7Tgt6aldOaxEMPXZGWzctCjrrSFlRU4SQ4M+H80T Pg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3e8n4311n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:31:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAiFooc1tva3nBapdds/DUXSGoCUSIj54XAp+TbSzZaZL0d5OAsfV+/gK74tGxTw/+uTF/dEbERumUM5/i+F8uwvCPqmFHkhN+3rEQN/LPmUXThhVUm3QYAdpl12Iisi30DEQ5sPTPfJwFS8XVWuCG6ypcq4xhZ3VRUbfZILrI66WMMJzdCNpR/3njm9SirHHvDRghKSxbdMY1BFhiu+0XrgdjTkFYsVjo7y2SJU6PdaaF1w8KkiTgBkDatdwkr2iuakSRQ6hrcknlUI7zoH1l8ggwUEAafoOQnV/lu56mCr0UVW493s51FXdsEX4ttH0jUuqyMENmfOnuQ0Z8Hm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xh3uqc0s+QQl8V9LmfWpjRkmWYlElgpGhyUyWq5kZNM=;
 b=Mh5WzUF8/vFD25v4iBnyH8oVHlQhKEaIMa+knKFDFQtYmg1NtHxzhYU2byg/PVSUxu0SxdEPnSlFr7P0JFI5hkwGQSlOeZR23sQ+2TcOdZllmzTyZOvrNjk9fwornDw2fFcRWnuUS8cIF3ZPikZXgoo7b9kKRN8OwKnd8WUBUk4Jc3ZFGhCoRnX0TyfQUzs0YJsaxTp4F0vkuZ2q+6RIWoJTYRI18Zc/l5VIy6xJMzl6qCqbEDmO18ltfncNlsaEVV6zSFUmkCsVE4fwD9+pD1EUXDRu+MI8t5V88dHM0u11ZFPQyPmIY5wiAfeR/RWyDv+oGc6wkoWMJntgpF1ZVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR02MB8005.namprd02.prod.outlook.com (2603:10b6:8:16::16) by
 PH0PR02MB8796.namprd02.prod.outlook.com (2603:10b6:510:f3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.12; Wed, 16 Feb 2022 09:31:00 +0000
Received: from DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::603f:f90:aff7:2101]) by DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::603f:f90:aff7:2101%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 09:31:00 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: RE: [RFC v4 08/21] vfio-user: define socket receive functions
Thread-Topic: [RFC v4 08/21] vfio-user: define socket receive functions
Thread-Index: AQHYB1D6K8ghW7qhUU+7F4HUyUpkaayU0lzggAAVPUCAAL5GgIAAe0HQ
Date: Wed, 16 Feb 2022 09:31:00 +0000
Message-ID: <DM8PR02MB8005F8B3B8673CB07B0C8B228B359@DM8PR02MB8005.namprd02.prod.outlook.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <a89cfd3195740dfb313d1947c0c7de583e4d0f46.1641584317.git.john.g.johnson@oracle.com>
 <DM8PR02MB8005963C1D2E796FB7420FBC8B349@DM8PR02MB8005.namprd02.prod.outlook.com>
 <DM8PR02MB80052AF463504BB4BBA397F48B349@DM8PR02MB8005.namprd02.prod.outlook.com>
 <EE50CF72-3E55-4685-83E9-92FD45252A5F@oracle.com>
In-Reply-To: <EE50CF72-3E55-4685-83E9-92FD45252A5F@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47842596-3689-4902-1ddf-08d9f12f0b55
x-ms-traffictypediagnostic: PH0PR02MB8796:EE_
x-microsoft-antispam-prvs: <PH0PR02MB8796D2F4FB5EBF8AFAF8F30C8B359@PH0PR02MB8796.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PL5r+sYNlEAv3miupWdcvI4++7AqDgWF+Q5GXBMO2QJka1yBss1DRhWArZtdeJIMXMciFuVsXac2xWSnUBkHw7A7Mx+trOthWOBFJrOjW4ESxptp8YaRPl9LgE5hHTjwh4e21rKE5+ZmIdrd0/njQ0dokEMbguEOLYcIoutXnw6W+JOZNXtfzZDA3Q9vYVY6zoJMeujC4rPuSGC53jRgFymFSusveKzaOGkrFOo3OrlCecSmFlCoGTpYo6hsCBGh38B7OIrGD9iBhMAlgm9BVzJlpGJO563XMcA8xBNCljDsiJDmzASROkY36XF9JQnLw202zlqiRDCLmWeWsiCekvnOBUPDK7Z697vAp1SM4vD609pVEAI4MtpJ7N2oNcJso3+hEL6sw6i/AfrIXYLSSEtprCvyV0vHvjvxpYl69Pn7jIhxFUx3wfyeHuyhuI6BwXuxfByfq21Oy8hlN7uHoO3hRUuACeAETX/AiJKrPYy50lFn+YXvnON9E8wthW9HE2LYuep0WuyAGMXJhC6/Bkh5yjahRl2pBMHtTyvjL3nspvykjgcmt3UoTbDJyDaP/EBGVXoSDHPSGvTgY7Qk7lV0BBFGLrrl4yPpUUnZaUVcM06rtDpByjvrFyNwpfgjZfZjVbPvWCHPA2jHxjQ9nvW4+FwthSpnDDK1VxO6pzluqTwT3EHz/2i83xNX9h0PbuqF3Zur+5Gc6k9Tk8E/Zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8005.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(55016003)(122000001)(86362001)(33656002)(38100700002)(5660300002)(52536014)(8936002)(53546011)(4744005)(186003)(44832011)(71200400001)(316002)(26005)(4326008)(6506007)(8676002)(508600001)(7696005)(66446008)(66946007)(66556008)(76116006)(66476007)(83380400001)(2906002)(6916009)(64756008)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWxndEJqOVpJaDR0b2E5MnlJK2ZWU013T3dwRFF1cXRMdWJZeHpuNlJ2LzJD?=
 =?utf-8?B?NGJTOHUzMEVMSnE1UlBYaHpiejVod0F0S1pyamw1OFRzYmhvREI0RTJtMjUx?=
 =?utf-8?B?VVVITkphZG9BWmVnaHNZRmlEUC9QdjVRbFZuOFRpZjFWZ0NsZ2ZXYk5raW1I?=
 =?utf-8?B?dk1RV1lmdlFRMTJJVmJwMjd6RGxIaEtTeFQ2aXh0bC9WK0IrTGlWNGhWaTly?=
 =?utf-8?B?c2FiY0NvMEFXaXhLYzQzeG5FMTNuRElZZE5jc2cxNGxWYUZwaGxlRlA3TlpD?=
 =?utf-8?B?YmdBZGFhVGF5ZXVrWkMrNk1kNW9mTjRnMlY4ZWFrcFpHeVhNbnkrbkMvZlBk?=
 =?utf-8?B?UU1MMkJ1bERZQ2NvZ2FLZVRTNUF4bkloSTRaZnRKUTZqdE1MZlJHYXhuMjlm?=
 =?utf-8?B?T2JEQzFleElFMlpMaTV4VmNwS0ljY2ZPSnE0ZnhsL3laN3Z3V0Q4WSs4Nm5S?=
 =?utf-8?B?aGcyT3BQaGdxcmhobnhNSi9SY2JVYktSanFYaHBjd3A0bm5jeXFuQzI5bU4w?=
 =?utf-8?B?eENIM1RZdlRENk5EeDR2SHdhWEdPWmY4SWp0N3Y2TzdHYlMweHlQcVFkeUdi?=
 =?utf-8?B?QXU1eGRRN3BRRWVCZDRTbDVWNks5OFBQU1NpTXhRTW8rbHUyd21RR0tzektE?=
 =?utf-8?B?RVloYXR3S3dGS2dVVm5tNzc2N0pkTlY3MkJLV1JmeHFHWFFraEZ0bW1kODNL?=
 =?utf-8?B?Ky8zV0xaWlpsRFJWYjRsM0d5OTNlTG9aQjdkVW51ZCtWdURSVFIwNmZrT2wv?=
 =?utf-8?B?VGpLaVorYnZwdENEYThIbnEvUS9BbHlTT2NCSHBncXVoMjVCTEN1Zk16RXBw?=
 =?utf-8?B?WDVDRjJaNUwrc2p2MEFhcm1WeDlhWXJsNXVFME1NZE9XNkMwRFUzUFBPclNl?=
 =?utf-8?B?S0NXVlZuWXI3Z1hLRVZrc0xnUE95ZzE5STUrUjlWeURQSGFzd0x2c0hMSnVW?=
 =?utf-8?B?RkVGRVp0L1Y5UnRJZzBLb2U0c3gyRVBoVk5zL2d1T0E5Nnc5d0FsZWdPc0Fm?=
 =?utf-8?B?NWVIZE9xN25vcU11T3BjWjRTTVNyaHlyMFNSdlU0UmtFQ0FDTzZmeGtPNUt5?=
 =?utf-8?B?YVpJQVBUOUNLNFR6cE52cVo0dzVGeDRJRzZIT1N4K0V0K3piVXVJY1hQMVdn?=
 =?utf-8?B?dnRKRGVjRjFSMTVTQjcyUEdRdG5jOVZkcGpXVXRsQ3hwdWQreEJtSjBaOVF2?=
 =?utf-8?B?RFlPa2VJWjZNdHNyVWgwVkFSNFhlYlZ4d21kNkF2ZFFPaGV3UlJiTU4rb2tD?=
 =?utf-8?B?aUdTL3Z0TlNPNVU2YVlNd2I5UllLRzMvU3hwcGZZcUZISHd4bTd5U2V6UThH?=
 =?utf-8?B?bkR6M2l5RjhZNDRBeHJLZFJ6M2xEZm1xZkp6c0FVWnc5Vk0zWDA4ZjU4ejdT?=
 =?utf-8?B?SkFWV28rQ0FueEpOK1M5Vlk5OFlrMXo0Q0gxd3ZVMjJHZWNBMTZFbmJ3eTlr?=
 =?utf-8?B?RVRBbEdqV2FwSysrdU52QTh4SWRwRG1UUDk2eklEcHZiZEFIMkJwWXZvZGZD?=
 =?utf-8?B?UUkxTTdIMGR5L2dLOGJ6alptczJ4QUpzeGpWVks2QzIwU2VteUtDSWpUSWdS?=
 =?utf-8?B?WThvVW9DVFFEQzFTeW9IZTBCYWRrT3RzM0hZWWlhdGxnM0M4OFZhN2J4N0gx?=
 =?utf-8?B?NUhZbG1mY0RVaXV5b2wxaURzWXJOSU9PRU1WSFp1TjFPdlZJNnRoc1lGNGpp?=
 =?utf-8?B?R0NEWS9uYXZuSEovV2RmQnNFdExBS21zcklSUXFoMEx4UkZKSXRqNDZWY2d5?=
 =?utf-8?B?UDFzRWJEUGV3K1hKcElScEp4UzZLbS9nTTFnVGNORG5zcllHOEdia2pwQXh0?=
 =?utf-8?B?cll5SE5GWWljdDA0MTNUbTRXVEMzY2hPczFGbzU4UGNsT2dlRnFhOWJCMG1O?=
 =?utf-8?B?ckcrRDlhY3VHS3lINEh5RGpBVlRNelVxYlU1MzFmM1MyQkdMbHJkV2ZGVVQ3?=
 =?utf-8?B?dml4bjh3SGN6M2xheTMxNkdiaGFrcnA1a3d6OWwrUDVRQ0llcSsrbnZHWm8y?=
 =?utf-8?B?SWg1d2VMN2F0QWZWY25CNnJFbG5HTXBGREU5dlpQZHRjWm9tendka3dOZllP?=
 =?utf-8?B?dW1janlZZFBndE54a2Z0TWExTHVFaDFkTkNoVWZUVlFNaUlwNlB0RXJ0QnJU?=
 =?utf-8?B?OE4ySDBacGNuK1lUdUNtRnhpM2ZDV3g1OHpIUUtXQWdxN1lwekRQOUFLb2RR?=
 =?utf-8?B?L0d6VWtQSXUxLzVWM0lJdStsVXBNYW45VUJsb0dJYTE0WkpkQjE3RmNBT0pq?=
 =?utf-8?B?OGJZaTN2VG9BYjZ1aHZjWmw4b1B3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8005.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47842596-3689-4902-1ddf-08d9f12f0b55
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 09:31:00.5051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mWdpJKMc3e39mejD1PsE5T4hOUgK/Bbe41fF9CII2yZphjZnT3AkSHrJBuxADHHTwvTR2yOclEAbynEmBswNHS/kXfYpR6NBe00s36v2xSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8796
X-Proofpoint-ORIG-GUID: LCLFEPokCbqT3sCROMmzbH-MAsQznyy2
X-Proofpoint-GUID: LCLFEPokCbqT3sCROMmzbH-MAsQznyy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9obiBKb2huc29uIDxq
b2huLmcuam9obnNvbkBvcmFjbGUuY29tPg0KPiBTZW50OiAxNiBGZWJydWFyeSAyMDIyIDAyOjEw
DQo+IFRvOiBUaGFub3MgTWFrYXRvcyA8dGhhbm9zLm1ha2F0b3NAbnV0YW5peC5jb20+DQo+IENj
OiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gU3ViamVjdDogUmU6IFtSRkMgdjQgMDgvMjFdIHZm
aW8tdXNlcjogZGVmaW5lIHNvY2tldCByZWNlaXZlIGZ1bmN0aW9ucw0KPiANCj4gDQo+IA0KPiA+
IE9uIEZlYiAxNSwgMjAyMiwgYXQgNjo1MCBBTSwgVGhhbm9zIE1ha2F0b3MNCj4gPHRoYW5vcy5t
YWthdG9zQG51dGFuaXguY29tPiB3cm90ZToNCj4gPg0KPiA+Pj4NCj4gPg0KPiA+IE9uIHNlY29u
ZCB0aG91Z2h0LCBzaG91bGQgd2UgZHVtcCB0aGUgZW50aXJlIGhlYWRlciBpbiBjYXNlIG9mIHN1
Y2ggZXJyb3JzPw0KPiBJZiBub3QgYnkgZGVmYXVsdCB0aGVuIGF0IGxlYXN0IGluIGRlYnVnIGJ1
aWxkcz8NCj4gDQo+IA0KPiAJSSB3YXMgdGhpbmtpbmcgb2YgYWRkaW5nIHFlbXUgdHJhY2Vwb2lu
dHMgaW4gdGhlIHJlY3YgYW5kIHNlbmQgcGF0aHMNCj4gZm9yIHlvdXIgb3RoZXIgZGVidWcgcmZl
LiAgTWF5YmUgSeKAmWxsIGFkZCBvbmUgc2V0IGZvciB0aGUgbm9ybWFsIHBhdGggdGhhdA0KPiBw
cmludHMgYW4gYWJicmV2aWF0ZWQgaGVhZGVyLCBhbmQgYW5vdGhlciBzZXQgZm9yIHRoZSBlcnJv
ciBjYXNlIHRoYXQgcHJpbnRzDQo+IHRoZSB3aG9sZSBoZWFkZXIuICBXb3VsZCB0aGF0IHdvcms/
DQoNClllcyB0aGF0IHdvdWxkIGJlIGdyZWF0Lg0K

