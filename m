Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6E658C580
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 11:25:22 +0200 (CEST)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKz0j-0000xB-12
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 05:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Frederic.Konrad@amd.com>)
 id 1oKyrB-0002RS-8f
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 05:15:41 -0400
Received: from mail-bn7nam10on2087.outbound.protection.outlook.com
 ([40.107.92.87]:17248 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Frederic.Konrad@amd.com>)
 id 1oKyqo-0004i4-CS
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 05:15:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrUDXztXbCWH6GA3wZuFKkNPGuGqakz9FJDO9lUocHnLUYhCxk8XlvpAZ71gSuSBvoPgqBJx8rTJs+sfFRtgmMYfkVZLIUb+XiH06wAnUyhK9aX2Zrah93Ev/I3gHe9WOuJFEIDG19BhFJV+hH+bNnRUhE343Lgxds+QMHBoyq7EsJ6c1qj91+VI1aTn95Jpk+h4R9nJaCe2CgRY9I+W2O/uzUrCf0tfWsEkGFk/ytJxXQbZDnoMrtF+LLeQd3WDFCWgjcvdGjoCPDhYtAaUX+pBBklJj4QSdI5G4bU+3/rJUIlTDnXzMDJRWDKCFtYEm7K4exh+jgMaulXpIPaQDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RI/y09KSVG8cr7WcucHGrMPqqsWqk60XgNHYw5PdD28=;
 b=Ko4PQ4arewK4IQ8ho2wWT5su3q7XvBPq3+E4LoDCD1+8rxexvvjWN80s5IiDOq3uBMT/9YEkBCkjljqu1Misq6WWDMO6zGGFkgAGjBBy8nV2e//iRzE3HkvLJGi38bg8Q5AKtZLqw70+9SyMFgYycSqFO2IpgZ00nNP5y7DcLDYVchovvxUV+7rqwtFxx6cnw8ISfmVMlAQLpQMZ+xeyWtyybLeWst2xssuLqwrTaJ0BmjeARQPuEg0XBun838708Qf/G9yniCA30BWIgOBqC87Z0YTlLAPHmptgn7QFJw98gMD2RQvjAgQfzv7v5yTnfJhOb7B8eDVYMCv8ICaZgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RI/y09KSVG8cr7WcucHGrMPqqsWqk60XgNHYw5PdD28=;
 b=CTWzFL+GT53khPE5b5rqXZ7dJvM1QUdixVcHq3FkIlLgb6M9Qwb85MhoPwZKkCFtOIuPwBhKW16orbHO5iBAuQDo1Z1r7DCzVFQoq9/nEiN8imEvT2LfSDdSp6fIQxeQP/lB7mFSZbAnNaZgrNTWDteONCmZ4IK37Yplg5LSOJs=
Received: from BN7PR12MB2801.namprd12.prod.outlook.com (2603:10b6:408:2d::33)
 by BN6PR12MB1123.namprd12.prod.outlook.com (2603:10b6:404:1b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 09:15:03 +0000
Received: from BN7PR12MB2801.namprd12.prod.outlook.com
 ([fe80::64e3:bc0f:b296:7987]) by BN7PR12MB2801.namprd12.prod.outlook.com
 ([fe80::64e3:bc0f:b296:7987%7]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 09:15:03 +0000
From: "Konrad, Frederic" <Frederic.Konrad@amd.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Fabien Chouteau
 <chouteau@adacore.com>, Frederic Konrad <konrad.frederic@yahoo.fr>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Subject: RE: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit
 accesses
Thread-Topic: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit
 accesses
Thread-Index: AQHYpnL4QHZnK+MYAkisd0/geL+yna2bpNYwgAAH9ACACRS7EA==
Date: Mon, 8 Aug 2022 09:15:03 +0000
Message-ID: <BN7PR12MB28019A8C06458A552225525AE6639@BN7PR12MB2801.namprd12.prod.outlook.com>
References: <20220802131925.3380923-1-peter.maydell@linaro.org>
 <BN7PR12MB280161C3A847924FA5C3AF1BE69D9@BN7PR12MB2801.namprd12.prod.outlook.com>
 <CAFEAcA-fMUrwnpu90Qf1LWGsQ36M-PmX2uC1+kenT__otLxjTg@mail.gmail.com>
In-Reply-To: <CAFEAcA-fMUrwnpu90Qf1LWGsQ36M-PmX2uC1+kenT__otLxjTg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fd21333-198d-4d09-dd54-08da791e7a2b
x-ms-traffictypediagnostic: BN6PR12MB1123:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hdsT4mJ+eHpfwz6OXMi8uSDlo1SV+4+zBQS/xhvgOPdx9nd9B+6muVIZLCOmZm5O1P0s+W34QDVhZSC6UsxWrLHUqHZP4LdKwYR73LAvWvCFNysmIY0yw2Tc6ZPef4P1iuh7diNI9sg8v6iWVDuCqmC85qZKt4uwK2L7bFpKio5V9zfPSVpe40JzdVSmGNMLD6vEb7TzP/sILayK1wxoP+19cxeTl3ksRMSMJQAlqRisvXV+ldenMyJVTEsIB4qG+fZxiLJdKwHpQ0cIKUI+bWNLWMVOfN3z9fGyxTwhrc7mwGd61SDM8bPWOixH/LN7IganbgN6DBiVf0GUYKR6I3Q2taoo2J5/e7gfdGyJXK6pz+HzvBNQ3Qiu89zeIZrW9H1Fdytc0DiGeGXnPYx/1LwGKDF1lKCi+JNYi/8wuUQw/USovEu11oKXA4QxgmzMP3cuYPGy+8I/6iOjG2nrEcx67M/ypgKrATwoIbWmyi3fdGaAF2VxB5Bx0i3cZaV07nCYfZSFFErMR4J+vM3w8ewUeKJAFfvQXcDgqrlytpsqWTPqiyyvbMhFQqtPohMyl+8hCELzInCdeVsq9NJ2Cz6r2eZM4aZvF/AeJ1WaIOhj2H387QDMF1/RLNi0y0TPL5sViFHRzX5BxZ4MWWe95wX/Gq9juxwGNJ5yvJeqnDg6hl4C367/BvdBtRBcgk3D+BnZUgUMsNxU/PJAVIn2Wp9tJNPt0oAvEfnx5VloxhEPwsgQI9PSpoiG01jtcT7GXXdMIbY8lt7G6w+1b84ofamok6EyMend+JK+PDT659IWFZw3H2poxDT7ANhnnz9sxeyO71OCr71rhNEf0hlX1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR12MB2801.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(76116006)(66556008)(66476007)(66446008)(64756008)(8676002)(8936002)(71200400001)(4326008)(186003)(966005)(33656002)(52536014)(478600001)(316002)(54906003)(6916009)(5660300002)(86362001)(66946007)(41300700001)(26005)(83380400001)(7696005)(6506007)(53546011)(38070700005)(9686003)(2906002)(38100700002)(122000001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEY5eFg1NTFNck11S0szZTcvZ3h3MXpibmVDVkhEWGNBMmZnd0V0ekNYUlVC?=
 =?utf-8?B?UGtVMXRrbTlvbExaZFIyY1Rid1FnN2FpU0Ewb0dCSkxQNU4zWEI2ZkFFODJN?=
 =?utf-8?B?WTNMR0lOU0ZxQkJXK1JTbE44TDBmMlZXMjNmZmJnalBsUjd1bVpMc3VoRzE5?=
 =?utf-8?B?UXBYTEJ0S1ZDTFI5VzZUZjhHM0l0UzZVOXEyRmxVdUZtb2lnczdISTFSTDBz?=
 =?utf-8?B?RzdVd3A2OWk2MTVoZmwwc1l6em9MTURYdE5IYnhyREpjL1JXb0tOZDF5VDJa?=
 =?utf-8?B?TGo5R1d2SERxc3JOeDVORUpsQzh5SWk3QTdFbjFUOFM3dUZmYUNpSlk0QnZR?=
 =?utf-8?B?c0dvQTU1V0tPbTJJcXR6Mnk0Y1lscFRTc1ZXRmM3U3gwNWwwM1lLVENicWx0?=
 =?utf-8?B?aEJXQS9WUytBU2x6bnN0TVVXWGpFRlZoc0lEZVB6MUJiQmkrY05tV3pUdHV6?=
 =?utf-8?B?eE94ZVpJbXlKUzUxN3lpU3U3dThpTzJ5K1FTK1MyTWRITmJ2cWxtVUlxa014?=
 =?utf-8?B?Zlk3SUwwYWh5Zmg3bzRIL3U2TzVYcE5JZ3g4VDRYWnpsaUs0Tk5UMTBPSngv?=
 =?utf-8?B?Z1diNFdici94ZVdSY3NVOUlBZ1J0UGJmaGdwWGpEcnZXcXRKRnZtUU82Y3RB?=
 =?utf-8?B?VHR6L3RmemNLRk9wd0xpWFJyenBDbGJzdk5hMll1eCtHYkZ3dVZSNUdtUGE4?=
 =?utf-8?B?Uk9ISHg3RnRvQXlBZ1k0ellaY0E5eFZpeERyenRUS1B1WWdKWkRoN2poa0dG?=
 =?utf-8?B?VTN0V21JQ2gvaXRyZTNiMU9ITXBYOGdpdGxXMmROeXB6Ri8vZTRvVGNucWhl?=
 =?utf-8?B?ZkpXcjl0bDBJRlNQc3VLNFZhZlNYeXNvMkwySnpuVWRoaHZKZ0lTN0xaYVcy?=
 =?utf-8?B?d051RUhPUjFDNVdmbGZURHM0dmdnbXJ1dUNwZHBqd0NwV1V0Z3VlVWtEcFM1?=
 =?utf-8?B?QVR1dlJYMlVKY011aWlNUGNrNk0yWjZlZ25XVWJnQUxnUkJKVlZTdFZxWmds?=
 =?utf-8?B?RE5wMUdkTFQwNzdWZ2w3bkZmelAwYTlQTVJXdHpzamk0bmo5ZnZsNjErRGVG?=
 =?utf-8?B?TEM0aTBDME1TWUR1bXdwUGJ2dnhnUTl5c3FWMmhuSmtMS1dlbkR3MmY4T1cy?=
 =?utf-8?B?aVVROU4yNDNraVpyc3hKNjNYUTZTUW4yZ0JxSHBQM2JVcUp5WUhMR1k0bnUr?=
 =?utf-8?B?VUZQM1lxQmU4Zm51ejBzUjV5SjJBZXU0OXRGOXRTVHorVlg4cjRCVGFyc05q?=
 =?utf-8?B?U0RmVTk4OW1VRTY2bVBzK2hLQmQvK09ZWFVPT3VEcmVQYmRUN2VtMVF2WTVx?=
 =?utf-8?B?TUhLWTRKanFYNUw3b0t4ZnNSc0NPMlkrSlVmWDh0Z3RQQS8vM2M4MWswREZr?=
 =?utf-8?B?M01BNEJnZ1crR2czSEhMT0V2WE9oRUxFZzl1cmgxbzFzbjRObDNETHRHVGh1?=
 =?utf-8?B?WHNGN2xRVlFTY2tWNFFDaFA2bHV5bnN5TzhOaXJIcjIvQnVYZ280M3lScU1Y?=
 =?utf-8?B?MlBFVVZtbmorM21LL2NodGxzU2dmRkNZUndIbDBGZnRHYkFObU93b1hBYUhs?=
 =?utf-8?B?TGZibU9FZ3liOTJvNHJUOGlwd3A0Vk9wTWJHUTEvNUt4OGJaQVpEb094NjBW?=
 =?utf-8?B?STZvVzhNQnN5UTM5WFkrTWl1K2prN0RWbDhpS1VPVmk2dHpxS0J3elB2V1ox?=
 =?utf-8?B?RUJJZzkrZXBnRlVIbW4vYmI4NjBOa2MvQzZHdmFnbzhOandJb0VzOG9IUUxN?=
 =?utf-8?B?SHM5UTV6Vy9pZ21RRXBDQnJDRVIwMWowUU9aZnBWTVpXMnpkN1Q3amUvZkhi?=
 =?utf-8?B?NER2NjRnN3hUSXRCcHVCWTBXWUUrZWRQWVVQRjczTXcwM1dOZXpiQjVqOEZN?=
 =?utf-8?B?M2ptdjJPMDQwSnJMQmJXNW1yQkpSdmdWNnBMY3I4K1kzTDA3K2tvV3pVTmFG?=
 =?utf-8?B?NWtyd0dVb05mUHd1RlRyM0JLOXVTbVRsNDIxNnNrK1BBbnJYa3dENkxJczlT?=
 =?utf-8?B?cktyb3lSTWZWK1Bab0czWTRpRHl3anhnbHpWSGFTM1RzeGEzejJWRVV5Q3Ni?=
 =?utf-8?B?ci9UZllLcGQwOGVNMWIrNnFwSndFaUNBcjdQOTdSWHZHK1hjckZtaFJuQW5n?=
 =?utf-8?Q?DSKQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2801.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd21333-198d-4d09-dd54-08da791e7a2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 09:15:03.1396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bnT0Tkt5ZWUbzvz8o2iIjBnUm7AcLVWSKXSvZRgMxtZTezDCmJATPSqxa7werCYE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1123
Received-SPF: softfail client-ip=40.107.92.87;
 envelope-from=Frederic.Konrad@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiAwMiBBdWd1c3QgMjAyMiAxNTozNA0K
PiBUbzogS29ucmFkLCBGcmVkZXJpYyA8RnJlZGVyaWMuS29ucmFkQGFtZC5jb20+DQo+IENjOiBx
ZW11LWRldmVsQG5vbmdudS5vcmc7IEZhYmllbiBDaG91dGVhdSA8Y2hvdXRlYXVAYWRhY29yZS5j
b20+Ow0KPiBGcmVkZXJpYyBLb25yYWQgPGtvbnJhZC5mcmVkZXJpY0B5YWhvby5mcj47IGY0YnVn
QGFtc2F0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGZvci03LjFdIGh3L21pc2MvZ3JsaWJf
YWhiX2FwYl9wbnA6IFN1cHBvcnQgOCBhbmQgMTYNCj4gYml0IGFjY2Vzc2VzDQo+IA0KPiBPbiBU
dWUsIDIgQXVnIDIwMjIgYXQgMTU6MjAsIEtvbnJhZCwgRnJlZGVyaWMgPEZyZWRlcmljLktvbnJh
ZEBhbWQuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IEhpIFBldGVyLA0KPiA+DQo+ID4gQ0MnaW5n
IFBoaWxpcHBlLg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4g
RnJvbTogUWVtdS1kZXZlbCA8cWVtdS1kZXZlbC0NCj4gPiA+IGJvdW5jZXMrZmtvbnJhZD1hbWQu
Y29tQG5vbmdudS5vcmc+IE9uIEJlaGFsZiBPZiBQZXRlciBNYXlkZWxsDQo+ID4gPiBTZW50OiAw
MiBBdWd1c3QgMjAyMiAxNDoxOQ0KPiA+ID4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiA+
ID4gQ2M6IEZhYmllbiBDaG91dGVhdSA8Y2hvdXRlYXVAYWRhY29yZS5jb20+OyBGcmVkZXJpYyBL
b25yYWQNCj4gPiA+IDxrb25yYWQuZnJlZGVyaWNAeWFob28uZnI+DQo+ID4gPiBTdWJqZWN0OiBb
UEFUQ0ggZm9yLTcuMV0gaHcvbWlzYy9ncmxpYl9haGJfYXBiX3BucDogU3VwcG9ydCA4IGFuZCAx
Ng0KPiBiaXQNCj4gPiA+IGFjY2Vzc2VzDQo+ID4gPg0KPiA+ID4gSW4gcmVhbCBoYXJkd2FyZSwg
dGhlIEFQQiBhbmQgQUhCIFBOUCBkYXRhIHRhYmxlcyBjYW4gYmUgYWNjZXNzZWQNCj4gPiA+IHdp
dGggYnl0ZSBhbmQgaGFsZndvcmQgcmVhZHMgYXMgd2VsbCBhcyB3b3JkIHJlYWRzLiAgT3VyDQo+
ID4gPiBpbXBsZW1lbnRhdGlvbiBjdXJyZW50bHkgb25seSBoYW5kbGVzIHdvcmQgcmVhZHMuICBB
ZGQgc3VwcG9ydCBmb3INCj4gPiA+IHRoZSA4IGFuZCAxNiBiaXQgYWNjZXNzZXMuICBOb3RlIHRo
YXQgd2Ugb25seSBuZWVkIHRvIGhhbmRsZSBhbGlnbmVkDQo+ID4gPiBhY2Nlc3NlcyAtLSB1bmFs
aWduZWQgYWNjZXNzZXMgc2hvdWxkIGNvbnRpbnVlIHRvIHRyYXAsIGFzIGhhcHBlbnMgb24NCj4g
PiA+IGhhcmR3YXJlLg0KPiA+ID4NCj4gPiA+IFJlc29sdmVzOiBodHRwczovL2dpdGxhYi5jb20v
cWVtdS1wcm9qZWN0L3FlbXUvLS9pc3N1ZXMvMTEzMg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGV0
ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiA+ID4gLS0tDQo+ID4gPiBJ
dCB3b3VsZCBiZSBuaWNlIGlmIHdlIGNvdWxkIGp1c3Qgc2V0IHRoZSAudmFsaWQubWluX2FjY2Vz
c19zaXplIGluDQo+ID4gPiB0aGUgTWVtb3J5UmVnaW9uT3BzIHRvIDEgYW5kIGhhdmUgdGhlIG1l
bW9yeSBzeXN0ZW0gY29yZQ0KPiBzeW50aGVzaXplDQo+ID4gPiB0aGUgMSBhbmQgMiBieXRlIGFj
Y2Vzc2VzIGZyb20gYSA0IGJ5dGUgcmVhZCwgYnV0IGN1cnJlbnRseSB0aGF0DQo+ID4gPiBkb2Vz
bid0IHdvcmsgKHNlZSB2YXJpb3VzIHBhc3QgbWFpbGluZyBsaXN0IHRocmVhZHMpLg0KPiA+DQo+
ID4gVGhhdCBsb29rcyBnb29kIHRvIG1lIGJ1dCBJIHRob3VnaHQgdGhpcyB3YXMgZml4ZWQgYnkg
MWE1YTU1NzAgYW5kDQo+IDBmYmUzOTRhDQo+ID4gYmVjYXVzZSBSVEVNUyBkbyBieXRlcyBhY2Nl
c3Nlcz8NCj4gPg0KPiA+IERpZCB0aGF0IGJyZWFrIGF0IHNvbWUgcG9pbnQ/DQo+IA0KPiBJIGRl
ZmluaXRlbHkgdHJpZWQgbGV0dGluZyB0aGUgLmltcGwgdnMgLnZhbGlkIHNldHRpbmdzIGhhbmRs
ZSB0aGlzLA0KPiBidXQgdGhlIGFjY2Vzc193aXRoX2FkanVzdGVkX3NpemUoKSBjb2RlIGRvZXNu
J3QgZG8gdGhlIHJpZ2h0IHRoaW5nLg0KPiAoSW4gcGFydGljdWxhciwgdGhlIHRlc3QgY2FzZSBF
TEYgaW4gdGhlIGJ1ZyByZXBvcnQgd29ya3Mgd2l0aA0KPiB0aGlzIHBhdGNoLCBhbmQgZG9lc24n
dCB3b3JrIHdpdGhvdXQgaXQuLi4pDQo+IA0KPiBJJ20gcHJldHR5IHN1cmUgdGhlIHByb2JsZW0g
d2l0aCBhY2Nlc3Nfd2l0aF9hZGp1c3RlZF9zaXplKCkgaXMgYQ0KPiBsb25nLXN0YW5kaW5nIGJ1
ZyAtLSBJIGZvdW5kIGEgY291cGxlIG9mIG1haWxpbmcgbGlzdCB0aHJlYWRzIGFib3V0DQo+IGl0
LiBXZSByZWFsbHkgb3VnaHQgdG8gZml4IHRoYXQgcHJvcGVybHksIGJ1dCB0aGF0J3MgZGVmaW5p
dGVseSBub3QNCj4gZm9yLTcuMSBtYXRlcmlhbC4NCg0KT2sgZ290IGl0LCB0aGFua3MuDQoNClJl
dmlld2VkLWJ5OiBGcmVkZXJpYyBLb25yYWQgPGZrb25yYWRAYW1kLmNvbT4NCg0KPiANCj4gLS0g
UE1NDQo=

