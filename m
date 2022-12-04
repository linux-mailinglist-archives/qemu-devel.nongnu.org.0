Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BE642015
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 23:40:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1xdX-0005Rr-56; Sun, 04 Dec 2022 17:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=330fc4baf=wilfred.mallawa@wdc.com>)
 id 1p1xdI-0005PX-60; Sun, 04 Dec 2022 17:38:49 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=330fc4baf=wilfred.mallawa@wdc.com>)
 id 1p1xdC-0008Sz-0P; Sun, 04 Dec 2022 17:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1670193521; x=1701729521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BEZbDao+tBpJXmIacAQRhKk0UMdqf+NlJ6PcTQ+Erqo=;
 b=kRplNf2bwh5oejLwgZOUTxRyeuaLkWbJd2g12baY2Y9k6yY9nu4R/fmw
 CEXzxDGAh7SAE/hFcTfNn3ukAGTB+zh6coNCw24fzml72Ewx2A+77jaKv
 98h3l9/8+TnrurA7kwAfPVXjnxgv34AfZ/fY9oJYAY7wNSIQmr9CJ+1Er
 8vYd/uJIMgtPhiBwOmRORSVUSFiz1IXIhTOPBVHi1YKdPhM94Sn8qFc4C
 WcHzf9hu7Gg3BDcAwb3vQ9h+7tNN+vD1qzs7ecV72wXWa3lGWJcdXGjn2
 CZwRlnOGVHIRsynhHdqlQUYhDQ3n27XnMBdB4R4lCJfUU07m6TlmluGvL A==;
X-IronPort-AV: E=Sophos;i="5.96,218,1665417600"; d="scan'208";a="218141307"
Received: from mail-bn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hgst.iphmx.com with ESMTP; 05 Dec 2022 06:38:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbUr9ster0Aglyzq2FxO2+Ko+O9lY0eurRnN8juG0SI3KmvG3VTLEkMlI0o5GK1VyD4n/a5zxWbO8ZWUR/3PhdMDPUAZXxXcSPmRPUgC+LPwu4BCiDzYmkNP4+TXGmEcHzCsmRkLBACtd19kzZK0tyD8K3Ufsofs5QwfISI3ja3OKBYP1RzDMxy3D3+8tQbdZU4k2wxcV0QzCXHiSDcZ5LSMcKd+w00NrXAQ/sOAZfwp7l2YiBrL7BDlropHXkS93ds+ASM6XcuEIuw4vVtOE0stXYIPXJaCbeNNTdcZ+0n06+DLPSEai+k8wgY2E6ym9A4UKD+mqouduASLZ4E54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEZbDao+tBpJXmIacAQRhKk0UMdqf+NlJ6PcTQ+Erqo=;
 b=T95FGKopt/YIV2xQBXMfFHeNBl83hF3gcjFYRbhK18K2eDIoROVrhVLow3UlzTiVc8PujPYgc098X2cB+YUX336cBMuIEM34tmDkBtdRONmwpyab6gZQjhiD/2AKbBA/UASTL8+9rEooJQSBi7uY/Hd7aiZc21WlDGZT32lWRHC3hdbVbxTROff6SphMM97vJ0B1P6Dz5/ZqKBv341hjpHwgtg3ZSYJ5zjBaM06JrvanAzRvursnUjr/TfD89fvZrpZy34y0XyrWRvgQr6K4u4xoH6w7PF17wwh3/fsnfPiXVommerpeVZPlUVWwbAPanAEr2TKBk0pIv+dqZXF+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEZbDao+tBpJXmIacAQRhKk0UMdqf+NlJ6PcTQ+Erqo=;
 b=EJiEntALNAjx7gkDO4PUugHT+u/D45PTEjUQUOeH8tbyt6DmN8YBX70lTasszu92uyj92D6JNf9i6juo2RVTaKmKSN9T5koenISE69eeORhi767MWsADjs63nqc5zT0QD/WnGcwx4eXLK5g0m6kRmJteqi/CZGjaPyydMALEtEw=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by CH2PR04MB7125.namprd04.prod.outlook.com (2603:10b6:610:a3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Sun, 4 Dec
 2022 22:38:34 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%6]) with mapi id 15.20.5880.013; Sun, 4 Dec 2022
 22:38:34 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "jsnow@redhat.com" <jsnow@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "kwolf@redhat.com"
 <kwolf@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>, "crosa@redhat.com"
 <crosa@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: Re: [PATCH 0/3] python: testing fixes
Thread-Topic: [PATCH 0/3] python: testing fixes
Thread-Index: AQHZBrHOlLBEaVbLDUyhsiS8nEajl65eVOOA
Date: Sun, 4 Dec 2022 22:38:34 +0000
Message-ID: <42bbc7e8420283f834cff7e3df362ba98c5d7346.camel@wdc.com>
References: <20221203005234.620788-1-jsnow@redhat.com>
In-Reply-To: <20221203005234.620788-1-jsnow@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|CH2PR04MB7125:EE_
x-ms-office365-filtering-correlation-id: 26dc1b8a-56c9-4d67-ed63-08dad6484715
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ScaCAxgROwxlO1OihF36Xr6ljZHzbe323RTxAraECOxMBbbmj9XGjnsZz9iypGw3+s9SdibiYZcHsP5phThLQTizZW3LjHuDZ+mD9LWpqniCXQTlUdGT5okHVceHvCHRNVngXe9QwX2cgQC5G9EKeczWUVC7jr4N1m5ATbDmMp9yUcjXoqmD6DibW3vj2/NkBXhAmq/RXpqccj6JEtpAStIPGrsJiN8rz/ChanNcZKH12b7yRJ/ihQmupGV8Jczxfj800HuJYzRiN0Roiq5kzci6hPC/ywjU/ZR3etu7TbiT2o+NkTWzxzI5vQKjboF3Ns8KrLtGZGOvpcC49Jpe3BlEoVS+YT5/aspVmPts7lhO47CI01OgJWa7ZtAJnUquuTJycU9LeDqO+U8StNo/EErMSG8bxeZ/cbF4c2IM2vnZsL2+GD5rDudRrLrKYNbx8taW/nGubwKoda/OWPnW3ZruzCQvjG+SbZOxNhn9DHExTMd5rX4MHS2TDlaZ+paWfqaioWW68TlvnVHEu4co67+E06hFQzq1wKE5YXJI9oSizNC6lsYXERWcnMgwGjmNAoS4Dk2T/tpVVz8nriVHi21K2ki6CJ9Tg1EVFSj93k/7DdPVdTRgKUfkQRq0krd8fHpnLkjBngr6E9ZJNSquQ/h8wgxOKXX1zH8RNbyWEKPaOI2IJ4Mg7dsYjHtRjPpZzPh74DFPKvqiMnsiA5FwqQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199015)(5660300002)(36756003)(316002)(110136005)(71200400001)(54906003)(6486002)(478600001)(41300700001)(83380400001)(38100700002)(122000001)(82960400001)(6506007)(86362001)(38070700005)(6512007)(26005)(8936002)(186003)(2616005)(8676002)(4326008)(2906002)(66476007)(66446008)(66556008)(64756008)(91956017)(76116006)(66946007)(4744005)(44832011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmxqTnVaMm5PT0JOd2ZQU3lrSVVkSklBQ0VhZ1YwamZvQzFJMHV2NDc4clV0?=
 =?utf-8?B?eDNvUWZ0cXNIWWIxNU5FbXIyejBPSzhrSExKREE4WHFiVXRibEN3Rml1d2hW?=
 =?utf-8?B?Q2thMEI4RWlHd014czQwMjFhanUyUFczaVUwbTZ3NjRBLzlFNnVPbGV4VytT?=
 =?utf-8?B?aVJod01vYkxoOW96MmNJQzV3VzRzYXpERzBabDAyb2xEZkgrUlBqSGhnY2FM?=
 =?utf-8?B?WjBVdWRTVDdaUC9FUUgyYzFtcXV5V2o4ODQrK3dEL3I2VHlqSFg3cC81bkR0?=
 =?utf-8?B?aFZiMERuTC8zZSs0ck81dmhhOWFMaCt3V0JjdHYya1J3QTFnTUhZV0Vabm5z?=
 =?utf-8?B?UUx2SFFhd0VBWWc1Qko2MlV3VDBzYm9lbjhWYUI3L2VQT0NnVFJZcythYW9t?=
 =?utf-8?B?YmdKcTVvdHpxK2dSUjVjZGFnOFk4UnVhYm0zb3BFand0U2hzZllNVFpDSXRa?=
 =?utf-8?B?TXdtelM5ZU1uMWhSWmJsR0xPQ09sMFp1R1ovV29PZ1FtMlk4bEhQWXdsZm1m?=
 =?utf-8?B?N2VmbisxUGxPTHFTMWhMYWVDbmQ3MU1GUFcxVW5ocEk0Tjd0QVR1d0lnbzJC?=
 =?utf-8?B?alJ3TVRoRk9sMUU1UHM2SUF6cmdmVHZHaldHQ2RIaXVBcVFoNGpXQm5QUVJP?=
 =?utf-8?B?eEEwZTQ0QlNUckhMYTVyckRCenBoeWVRV2pDR2x3N3dTbkJGcnFlTytCZ1Bv?=
 =?utf-8?B?dzJNL0lydkl6aDl5ajJ2dWFFTE9aS1Frdld0Wmo1dkg0cU9iU3FKWG9yR2p4?=
 =?utf-8?B?SUNMWFpSRzJCS1pIYktwUHdTNXlJODVTTEdHc25yVWYxRGNMcmVNYXlVb3lJ?=
 =?utf-8?B?ZnExWnMyUW5GUFNySXA3YVJYNlI4WkprUmxVNjBQWmw0OElMUUlOSG01VDJn?=
 =?utf-8?B?WnhOSDN6UDNPaU9oUXF1UHRDME5VOEgyNTlHVFVveGdiL2JjU3JJRDFzNklk?=
 =?utf-8?B?d3NvbEVwZ2NHSHkwWXJmUzZXLytDUkpBdlphV056NDVzOUxPWkM2ZjRvRVVj?=
 =?utf-8?B?SjUveU00R3BReGlqRHZscklTSUY3S0llV3h6TERLRkI4UkdmSVVIeTBSNmlU?=
 =?utf-8?B?YnZDQ0RaVDNWV0ZGWnhjL1JMd0JaclkvdHJXYWZEV3puZDNkeTRaaE1vTzdC?=
 =?utf-8?B?aDFkU0FkNGFRemtpcUp4SUc5MHFSUWdIUzdFMWV6MER3eHpmUG14Q0FBUlJM?=
 =?utf-8?B?MlYxRkFma2lRYkEybDIvSC9iWklUVldCN0Qxa1EzOWpvb2creWU1RmNWRjdy?=
 =?utf-8?B?UVhWNDlEZWs2QkxaZk9FbWJPcmE3UWx1WmVuY2tBdCsvQWUxMituRFlaZmRa?=
 =?utf-8?B?aTMxNHc1cEZWV09YVUM3d0sxeXo3WTZGY1NsaXdUSnp1UU9sdjZiZFZyTC9T?=
 =?utf-8?B?Nzd2Rk01aHpGZEo1YVFxb2V6bnhmQk0xNGZnVEM4TllmSXMyMXNpeVhCb1pn?=
 =?utf-8?B?bFpNbDdIVkJxaURVa2pvT3lFbk1seDJSZE9wcVhlQVVuMU9jZmhZZVUwTHFV?=
 =?utf-8?B?TjZaMzYyZ3BTM3laUG1EU2xGYU50dEtUTUN1YlhaNlBRaVlPYlpjNXhRaGpI?=
 =?utf-8?B?WFVkNS9wcjRhWnVFSDlLWk1wU21YTitTTkt6SUpoWDhsczBndFN1UURwZ21O?=
 =?utf-8?B?RmMrNHZJVXIyTDVheFROMlRPRnJ6b0RrYy91cWJuTFVXcVVITnBxbUNvbEsr?=
 =?utf-8?B?Tm01ZnU3b0crVHBFWjdkTkxtZ0I3RUlhWGtOOXR4VHVzUmxZV3BhY0RaaTU3?=
 =?utf-8?B?SU9QbE5PZWlGSS9mbWxHZXd1U09wN0w0cUJ1S1ZMRCszZm02bWFqRVIrREdN?=
 =?utf-8?B?dnBybTVCL2pCTnkrZGdTSDVicGtycGtnbmhLWFlpNHF0UmR4VGJPb1QyM0sw?=
 =?utf-8?B?d1NIUmhqRGN6MnZkVER2R1ZmR0NFNmNqWU9RT2NZc1pXU1N6V0VCeVQrZGJP?=
 =?utf-8?B?VXBnRUVEZzJ3dlVPY2kzSkhOTkNkRHF6YW8vYkExUzUrTVc3NGk5UVlSWS9k?=
 =?utf-8?B?YjFab3hESmIxQlV0bk83ZjdMcTdWNnJ0ejgwZG5EeVZ3bFpqZVNJK3FmTWlm?=
 =?utf-8?B?K28wT2hsQ0pjV2tEdmoyQXZTUGg1ZmlRQlVHWHBMejFUcnV1U09zZ0crZXFk?=
 =?utf-8?B?TlZFTnFtSUkzaUcwN2M2TXVLdjZhc3lDWEpjU083TDJKU2dIdFZ3OW1saXFR?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <077DB67DB9CD96409F85586E05FC79A9@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?VFBjckVlUXE2Z212YzU5N3VpY25Lc0Z3d0V6WlVYL3RuSVR5UHBhbEZ5dE14?=
 =?utf-8?B?U2psVEZjYmxzb1p3MGtPcHFrMExpWmVEYWJXVVNWNHd1RUNyR2R2VWNSTTlp?=
 =?utf-8?B?SHhuL1Nib09YdGpmN29EMEhjZnJxVXhiN0V5a3ZFZUVJaHpBdjVocHdlSmxH?=
 =?utf-8?B?czZ4cGt6Vm1DeUovRHdVUU02eDFUYU42b3lCR3NHWi85TTFDWVoyY1lOQjEx?=
 =?utf-8?B?cDhWVjVVRjcyaHRxdG8ra0s1M0NpZ3hNYVlMaWlCa01IYm1CRFdLd0JmajVS?=
 =?utf-8?B?Q3pFeks1a0xnTktoWXp0UEs2UkpPVVp0bGxoUGVtTHVzRWZXczNNUCtHb3NC?=
 =?utf-8?B?djliUE5odlRxVVMzaU5KZjAwRzlnYXhYYis3MDBqU3N0bjRZYm42NkY2NGFF?=
 =?utf-8?B?dXRMcFcxSGVRRHQ2SzNidlQvOGx5WkVjaWduQzduZnhSRzlxYVZKRDRkUUYy?=
 =?utf-8?B?ZkNBREc3b04xaC9iU1Mwc0ErZlArL3owdzBkMjRiQ0lFaHdiWnpLSVAwbWI5?=
 =?utf-8?B?dnBsdXE5NTE3clVCMjMxYjlXdDAvVDRQR09NNnZwSmcwRHhsdzJLeHJrMFBI?=
 =?utf-8?B?MmpHVDVGaXJsUkVBM0Qxdi9wWnNkbTNYNEViUmc3Z0QxKzBNblpQekdtU3Ft?=
 =?utf-8?B?eVM3UjNINHUwVDBJTDczejFETzlrUE00ZE45MDdqMFhPaWJORlBqakhPSzZX?=
 =?utf-8?B?azFmZ3dCN0Y1QnR0aHhybG02ajJMd0dPMmlOQTRkaCtQNkRPYU9iMXliQ2Uz?=
 =?utf-8?B?QmcrM2E3WFpub1JJTHNMVTBVV1RJS2NyYW1VMWFyOGZvMlZ2K1ZFeGl2OWRa?=
 =?utf-8?B?Z3RDMUlrQlArWW1xcEduMllWYXI4VG8rdWoxV0txM2hTSUhHWTZrWGZSM1Vs?=
 =?utf-8?B?M1ZBbktzRHhXaVh6UjJyOXltdS8zT0N0cTA2bDU4ODcwbmVHUVpEeFJuU01i?=
 =?utf-8?B?YzJFZ3BGUjZVMWdheHhUd2tueUp1bjRvTml4bmx0ZUpGVDJ2RERNeXoxVUUv?=
 =?utf-8?B?VW5hdGtoMnhQVlJJL0U0UVV6R2dBRlNWUTNwMlkydDFqdHE2Nm5TYnFZWjhY?=
 =?utf-8?B?OFVUMG9EOWxvOGFVdkxGOVNyZUgzMXQxTWw4Zldrdkp1R016SGhDNjlYS0h2?=
 =?utf-8?B?R2Y3TEcwZklrZzI1UkpYeWtFOW53U3E4WFNaTk9iUWNPT3hWM3k0enN3WGdQ?=
 =?utf-8?B?SDNpb283TTROS1BRbjVuNXl4NDk5dlFIT2NhaXZIWHJtR3dURlhTbUFtRGl1?=
 =?utf-8?Q?0G/5ElRD8P/dld3?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dc1b8a-56c9-4d67-ed63-08dad6484715
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2022 22:38:34.4798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0wN5axbMPSeM86NeTW3cmOmHCVThYHEpOy6Pd7di+Jd2Rtp1Mcn+X/Ob8piTR3bx5QFpLztk3BsRke3eUTZmew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7125
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=330fc4baf=wilfred.mallawa@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

T24gRnJpLCAyMDIyLTEyLTAyIGF0IDE5OjUyIC0wNTAwLCBKb2huIFNub3cgd3JvdGU6DQo+IEEg
ZmV3IHRpbnkgdG91Y2h1cHMgbmVlZGVkIGZvciBjdXR0aW5nIGVkZ2UgJ2ZsYWtlOCcgdG9vbGlu
ZywgYSBtaW5vcg0KPiB0eXBlIHRvdWNodXAgaW4gaW90ZXN0cywgYW5kIGV4dGVuZGluZyB0aGUg
cHl0aG9uIHRlc3RzIHRvIGNvdmVyIHRoZQ0KPiByZWNlbnRseSByZWxlYXNlZCBQeXRob24gMy4x
MS4NCj4gDQo+IEpvaG4gU25vdyAoMyk6DQo+IMKgIFB5dGhvbjogZml4IGZsYWtlOCBjb25maWcN
Cj4gwqAgaW90ZXN0cy9jaGVjazogRml4IHR5cGluZyBmb3Igc3lzLmV4aXQoKSB2YWx1ZQ0KPiDC
oCBweXRob246IGFkZCAzLjExIHRvIHN1cHBvcnRlZCBsaXN0DQo+IA0KPiDCoHB5dGhvbi9zZXR1
cC5jZmfCoMKgwqDCoMKgwqDCoMKgIHwgNiArKysrLS0NCj4gwqB0ZXN0cy9xZW11LWlvdGVzdHMv
Y2hlY2sgfCAyICstDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pDQo+IA0KPiAtLSANCj4gMi4zOC4xDQo+IA0KSSBzZWUgeW91J3ZlIGxlZnQgV2Vz
dGVyb3MhIHhEDQoNClJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3
YUB3ZGMuY29tPg0KPiANCj4gDQoNCg==

