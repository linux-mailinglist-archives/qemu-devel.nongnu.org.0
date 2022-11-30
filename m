Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5863E59E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 00:40:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Wek-0002dm-Dq; Wed, 30 Nov 2022 18:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=32644476e=wilfred.mallawa@wdc.com>)
 id 1p0Wei-0002dC-7H
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 18:38:20 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=32644476e=wilfred.mallawa@wdc.com>)
 id 1p0Wee-0001FL-WC
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 18:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669851496; x=1701387496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sQd2hvNnq3KejedxymZ0tGdGyvanl8oFVYhoD2u2Ius=;
 b=T0AnNoqHqlTkWbKiW7Qny0VtHjwi94cNt2Rrk52kX0rQVr6GrDEgNtoE
 L0EEXkAmdCBi70blgSrBQmKBKt7qsZa9DD3Ufaqv484qL2FyDoHeIQHIr
 dbCtM9QjnQTAsEVeClKHWX1RIWBawlowxljQsnTGf1EqYosZKKghE0Zh+
 SFnoh57y7xq9oaQuNiK72Ipl6b58R3zlGVxlL7gi4E9CvP34Q9Lxctkyt
 /pYMpESWVWwIbUuQWzzfdI7DFKe52GI2Ddk8CzNs2hZJJfMkDYdcQuFLO
 D/tbeNUaRWXDqG6ruq0/RLlUJSJXdRpp75tVMcYwfgvXJrfIrFO9XaUoD w==;
X-IronPort-AV: E=Sophos;i="5.96,207,1665417600"; d="scan'208";a="217882567"
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2022 07:38:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bei7NmEXP5FjHk/Zjhu+DI6SWlIeD48ndLC6yDBF4vjsYs1PRQojOz3D8py882m+Ft7KHbMEKQ/zrYhYDgqx163qz8RFfQTWl68eVBTfZjuqh1QmkbnCDNR78COFfbWftTpzMIrheB3A4P6+KT1Dq3YLFRvj5XeklkmLD1UsHNyUGyvfnlEpU0lefRvQW84XK/wwVKVQP2eOjIVOr+EERsDTSLVD7av4hyR7+sZqqPlqifns1cMRMFjoFY8XJO1H0lo0OptX7Xv8lNkgl01mLR6J/to3ZLN3+UsMpTa7SGRd6YdHQPFQv9qufaJDZWKkKMMbpJPEpk1sLHMjZmOg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQd2hvNnq3KejedxymZ0tGdGyvanl8oFVYhoD2u2Ius=;
 b=UTEcEoorTXQw5M++ricaiOKGv5s9zM78/6LG8Qj93+uVlw1D3nbLjQKH7/wXzFZVfvfua3QCNh1fYrMFVi5rnsl9+G6AbUZEP7fnKoKBqDFyPM1+ir2cA2fuTOx7KTl3+s4KONPFVPcd3RPFsGuesnOHPMQgxLtSSk6CfyJ7HfMc52HLuM5Om067DAGbgkvrr1vAWGucr/WWla9hR/8brgsCg2oo7IsZJjeIzHV+CiuP+IsUBhJbEbGr6fC33Tm9EE6wGr0clZYgtyYzQC98InWtixbM9Lj7oriRw5TOZwYIlag+GMjKzP4TYaH7r+zs4g5CPM/9oVwNgVMTpy6ewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQd2hvNnq3KejedxymZ0tGdGyvanl8oFVYhoD2u2Ius=;
 b=gnqmz5Fyb0ncdCA8ncRXu4rlZB06ZsXRAjg/NuIg9Do/6nVNjpYGTkr2V+n9i4pfGK5zIoKCoL525j53BEIyXbJEuU/fRqvdMlY1srb0OBvytxQGAfsrolrc4FCY7/m46F1r92Grpy8gP1pCST3RKpoJG0jnHJtUzzD4qvS6mm4=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by DM5PR04MB0460.namprd04.prod.outlook.com (2603:10b6:3:9f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 23:38:04 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 23:38:04 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "philmd@linaro.org"
 <philmd@linaro.org>
CC: "wangyanan55@huawei.com" <wangyanan55@huawei.com>, "eduardo@habkost.net"
 <eduardo@habkost.net>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-8.0 2/2] hw: Reduce "qemu/accel.h" inclusion
Thread-Topic: [PATCH-for-8.0 2/2] hw: Reduce "qemu/accel.h" inclusion
Thread-Index: AQHZBMO2XmYqsuJk1UWRk4AzZf6zdq5YIAqA
Date: Wed, 30 Nov 2022 23:38:04 +0000
Message-ID: <a0f4b2440714caaa0f90653b3fb54e6a4a57731b.camel@wdc.com>
References: <20221130135641.85328-1-philmd@linaro.org>
 <20221130135641.85328-3-philmd@linaro.org>
In-Reply-To: <20221130135641.85328-3-philmd@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|DM5PR04MB0460:EE_
x-ms-office365-filtering-correlation-id: 453de4e5-1152-4cb1-0c84-08dad32bed3e
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N2zCqlsdGt0jJKkP7+YQNewn35Y2+80ntwJ98BOwPubnXv33uiN0SzLDVxXaNW3xEJleA+nHAtsMyRXful09ElfkEV/DxsDW6ttgUxy0SDhjccEj9b8V4Q1o26tajiTcbFYajR5vY817KmMzDqvv843gm3erL/yzb7QupOeVhCbWhHaLrAMrPx6wCv7pvazZBXVWcMCzqqblnHK1fMFNGFVl5GjPVm1/2q2ZqmsUdcp1bUv7TG5xmHvLM3vNTKfgpVfwMo0vKaV7iHX8/A+eJbumSxcRo2qioYOU+BsayMi5/9rU9iRMbuPu2Y5WY2fTfKb50ixV+Qc/XxiEIOHNSJ/D2rzOBc9glrsDZQZKyt3EXNa0b+/lbrddWHCZlhSCAUMsGD1iAnGhH/IHQH82xJL9ljqWjELBKz5Y/9bZXPeshcVTma9rhr65k+Gp/HAV+bdeDR4kUA22JRSa4l9EIWk2y+VN0+ysXaBTJvPUEp5+Q1fi0XRYmOIjXf+TFQs1Vz+kvnG1rKFlE0OYhqCJIAkUOMzFTBah/fT9r7GJBppzjhYhfkhjPAEqYUW7J2q8nmJNwxdvQdGYhbFBBBYe56EW8xTKKtzM3AR8rDnvIjRGvA2ssP4AWD3RWdKXSBHx6APlThZGydjpBwGh4DKfvNmNqRCOliHhmmtstZy11GV+i9I1DZ2y4hA7JbsvVl513l9iDzflixjqZXEBD8wbiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199015)(44832011)(38100700002)(6506007)(83380400001)(36756003)(6512007)(26005)(82960400001)(66556008)(86362001)(316002)(66946007)(8936002)(76116006)(5660300002)(91956017)(66446008)(8676002)(66476007)(71200400001)(4326008)(64756008)(54906003)(110136005)(122000001)(2616005)(4001150100001)(2906002)(6486002)(478600001)(186003)(38070700005)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ai9HT3g0TVQ1VElzU1NnTFJOcGZJVEEzK3EyU3NyYXVkbzliWk5CNGN3LzNL?=
 =?utf-8?B?ZDZkdWF5YVB4dTc4MVE0cWhnQWtMSjRNTUZVeDFUNEJrL1ZHY2tmdVMrUm1L?=
 =?utf-8?B?TXJDMzNSNDJTY05IVHBhVlVEQ1k1a0NFaHdCMDdrK3hxOEQ5cnZJWVRnVSt6?=
 =?utf-8?B?ZzJMM0dFQ0RsWDZkS2Z6SUZ6ZlJ3Tk9rR3VHY1ZXRXA2VTFCQytrOXF5bWx2?=
 =?utf-8?B?Nm44VTVuemFnQnhyMkZaVzVVRkZDSVA0ME9uRjIxSThHemhtLzE3NmhEZkNr?=
 =?utf-8?B?Wit0UGRSSnNIQ0JHOXFSak5tZVA2ck10NE56L2RoempSbmdESGxBeEZaWjNk?=
 =?utf-8?B?TjdtRXRFK2JweHJodkQ2ZzdSUUk3dE5YL1h1R3BDc1BWZUJwRWtHMTJ3aWZz?=
 =?utf-8?B?ZW5BQ1RLMzNQT0tjUE56bGtvQTkxUGFQZUw0THdCL1VFMkUxZUZYR29aaDFD?=
 =?utf-8?B?RDVqUTFmVWRVbVYwSFJKb3ZmanhjOUpwbHpTdjlVekNrOUlCd1VGMkUwMURJ?=
 =?utf-8?B?dklVblJzcWkwbHZOeGdkR1pyKzZFdjFUWTBXL0h0VTBSMSt5K05XYU9EclZw?=
 =?utf-8?B?VWZobmhTRDZ1L0k1ZXRiWVdOSVRCZXZKYU5zVXFHM290amp4RUNHMGsyNDNl?=
 =?utf-8?B?Wkh3eEorSEI0M05Va1NPZ0NGMThVNXBmeFBVV2tyNFZTVEFzYUtrV0RyM1Y5?=
 =?utf-8?B?Zm1sVm5UVjRvOXlyMUY5UCtKQ1Rqa241czVUTDFqL2diS2lJZC92YnpZVUxs?=
 =?utf-8?B?YnVsazFhVFo2YmszOXpPb2xkMHhjOGJEdFRuclBJSWt3b0dYbEQ0RTR0dWE5?=
 =?utf-8?B?bXFJekt1cFgzZ2dCejJ4NXlwaDNUdVkwcVBFZFJETU1ITzZNdmg0aFhXYnR1?=
 =?utf-8?B?cG0wZzNqVllLRDJsbFRjbFd3TEFrdmdGazFCeFl6R1JBcEVSQ2p0NTU0MUJD?=
 =?utf-8?B?NXhhU1B2Tkplb2xyQVhvdC9hYW1FNWQ3THVhS0FjelE3RTIvdXlPS1duWWlQ?=
 =?utf-8?B?RlZrUnQ2OEQ0MXRtN2w0T0pXUjZEVGQrZjNOaVlFK1Rrc2hUQWR0WkhPOGFO?=
 =?utf-8?B?cnAxS3V4cGxUcFUxZk5wREo5ZnN2a3h3QnFIWExWT3Y5OXFqb1BKd3VnYjR1?=
 =?utf-8?B?QXBvbWpjb0grZVA3MWZyd1pzV3hNdHJuNGxLdWp0QlYzTkVXNjhaLytXVlZp?=
 =?utf-8?B?TkYxRkVGY2xCcmtPWUlEcklSNVBMd3FuRktWNVViVWllUm4walhGdDh1dmVW?=
 =?utf-8?B?Q1JaU2dLOFZFM2ZQQXY4T3N0TWRubCtqemZNVjEwWFIvNDZUS0RybWorc0xw?=
 =?utf-8?B?cm1GTU9hd1pTVHhDU2JZd3U1ZW9HMzB3QVJMQ0pxaG1vaW9NVkRrTFBhV3BG?=
 =?utf-8?B?OVJvaERVbUljQVZ1eW9uOGVqUVcrcnltZURCUklPV1JRVXYzNGRna1ZtWU1I?=
 =?utf-8?B?VjZhYkd4R2w3bGFmNXMwaGNsM1JzcmNBMzZJZmVVRlZZRXRsRlJHZXZGemZW?=
 =?utf-8?B?eE1RNi9JcUExcGdPbWFYd25kMlJranNJZC95cTZkL3JLUFBsZzZ0aWJKdUFI?=
 =?utf-8?B?eEJ6TmdGcSszckQwZWRxdjNDRloybEJxdzBIeGV0OXpndWFkWDZtVnlQbzh2?=
 =?utf-8?B?SWZxLy9paTQ3anlFSjVXUmp5NDAzanVXVkFqNCtQNCtsdDVsT0tYazRGREt0?=
 =?utf-8?B?c0drQjVMVThTWXdkNjNtQStHT0FaRjgzRjlNTTVRcjZ5VjJVK0dQL3g3d1VP?=
 =?utf-8?B?THp1NFhPV25HRXpUN0pWSVcwMjY5Q1loWEpseENqeXhZTUNxaWJyd0hOcWJw?=
 =?utf-8?B?Szl5UkdnMm9OOXFLOE5aZjM5aGtEckNMMXpwRDZYZTdCZkIzTUpyTUpDeWx0?=
 =?utf-8?B?cHNXR1V4dXhNZytsVFhKYWFHMkUzdlMvQUFNaXFNYVhjN2dnL1VpWHRtTWJi?=
 =?utf-8?B?c0Rob1g1QjlNNU1JYnNUZ092RjlyVFkyMnFkZWZKUHFwM0dESFpWeWV0cnE0?=
 =?utf-8?B?TDdxUDJHYy82eVNrdVo4NGRNeEZJUFZVVEN3U2FBcXU3d2d2bkx3ekY2QXQw?=
 =?utf-8?B?ZlMwWnkwZzJzK2JnN2d3Z1ptVW56bWQzSmpWa09pVE9TUFJiNlNCdDhjRjdS?=
 =?utf-8?B?dWIzbU5FaEVkY2hpTEtUMFNPY24zVDBRMFNmS1FFdDFPL0hLTENBRW94MThB?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A97C0866B4C6F843A16683A2FB9693E5@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?clVBMzFyTUhJT0NaMkt2K3FwK2xIaWxzdE4zTjFVWG9ja3dQa3IzcFRyR3A2?=
 =?utf-8?B?dlVCV1dEckJTUVZTa2RGakZlNjhxUzc5ZWZURmMweVpSR0U2S2I1SmU4OWdV?=
 =?utf-8?B?V1VxV0JSbXNNKzhCbWkvOHhrS1lyRS92NlZrRDYydkxBdGJMWVJvODRsQTY3?=
 =?utf-8?B?Qjhiek96eE5jUGdNZlQzTmk4Nm4rSXB1NXFiN1dEcENDbjB2TlRObytvbzly?=
 =?utf-8?B?UVRvL0V1SUJoNUpFQTB2R2pQM3k5T3V2Q01ndE9odVZoYlNmTGJtNzRrNm91?=
 =?utf-8?B?VFJNVG1jYktFNm1KTFhMeVlPaURpdGN2T0dmNDFmYm1KTmR5QWRxM283WjRr?=
 =?utf-8?B?Q2xXemtqZk84SHpjejJsZHRaalcrRTNqRDdwdWsrWlgvVkZ2ZnJQd3NZaHVu?=
 =?utf-8?B?RXU3cUpIWjJOOE1UWUVoRXdDREVXZmNUdE1PWmFzUTRWOGN2YnBocm8wK0dU?=
 =?utf-8?B?aEpFV2VwaDRTenNxMWVCRS92M2dNbVBjOG42TGFUekdFcEVwUW5EbFRZK3A4?=
 =?utf-8?B?MU9rOVNGV3NBRW8raGIwQTU4R2hKdS91Z1dPeklhNUI4clJnQ1Z6V0FCVXdT?=
 =?utf-8?B?bUZ2bGVGUnhpVUZXT1gralFpWENKL3ZGRCtVcHY5OENuQjRxMngyekNYODN4?=
 =?utf-8?B?anRRRmxKMXNVTVRwaTYvNGVEWEp0R29Wdi9mZTFIb283bTFJTmE1LzNHV2lo?=
 =?utf-8?B?Q3FpZlp6eGMrcVFYaHJCNFA1YUwrRHBSRm8xZTd5YjM5d2UrNHplN2NKaUJt?=
 =?utf-8?B?RHZmWGJ2UVd6b2ZXUEJqaVFqdEJXam5rZlRFZUk2elNpTHdsakMrb0l6UHZI?=
 =?utf-8?B?THFBTnBDc0xyeWFHcUVUKzg4aE9IUjVBWTZOSUhwMytiN2E1eU9tUjM0amFU?=
 =?utf-8?B?SHI1YlFZdHdUemNPWVBzVVowZEtqV3R1dCtzVjJ4RUxXdFRDd3FGTGRYb1pK?=
 =?utf-8?B?bVRiQzhqTlNHTjJjQWJCQ3VhYXh3MzNlNUlIcjM0TFNYTlE4QytZeGV5RUpS?=
 =?utf-8?B?bnJRZU9USk95VGpyVFdyTmwvdEw3YXBVQlJxMnllT2I2WWs2NWpIK2xsREV2?=
 =?utf-8?B?WnI0NWFhUmhTdmhHdTVXTUcwREQ3SFNXU1d0UE03M2phOE5WaDczeGpGaEMz?=
 =?utf-8?B?dHkzejd6VkhoanZqVmYzb3FIWjFjMnpzYk0xcnBwckFpekkrdHU0MDJJdUNW?=
 =?utf-8?B?R3pUc2ZaUjBXUURqMTR5Nzh0dDEzRkFoYjgvcGV6N2pHdE5HUGR5RFB5WGNQ?=
 =?utf-8?B?bWdOeXR5YjdMaUxKMjc3WlJRd1ZuZkZlb2ZsQytEbmtERDNTVFRVWDdZUUsw?=
 =?utf-8?Q?hlqBZBe2popCM=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453de4e5-1152-4cb1-0c84-08dad32bed3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 23:38:04.3511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0XbXIO5xTEKUYpBWwC6SG6vnCf3bKoIbNHTEfvXKizGaiags5kmMokL1McIVGnhNImxQtwLnKBxsESrtmnxiUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0460
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=32644476e=wilfred.mallawa@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gV2VkLCAyMDIyLTExLTMwIGF0IDE0OjU2ICswMTAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB3cm90ZToNCj4gTW92ZSAicWVtdS9hY2NlbC5oIiBpbmNsdWRlIGZyb20gdGhlIGhlYXZpbHkg
aW5jbHVkZWQNCj4gImh3L2JvYXJkcy5oIiB0byBody9jb3JlL21hY2hpbmUuYywgdGhlIHNpbmds
ZSBmaWxlIHVzaW5nDQo+IHRoZSBBY2NlbFN0YXRlIGRlZmluaXRpb24uDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0t
LQ0KPiDCoGh3L2NvcmUvbWFjaGluZS5jwqDCoCB8IDEgKw0KPiDCoGluY2x1ZGUvaHcvYm9hcmRz
LmggfCAxIC0NCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KUmV2aWV3ZWQtYnk6IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdk
Yy5jb20+DQo+IGRpZmYgLS1naXQgYS9ody9jb3JlL21hY2hpbmUuYyBiL2h3L2NvcmUvbWFjaGlu
ZS5jDQo+IGluZGV4IDhkMzRjYWEzMWQuLjQyZmM2ZjFlODQgMTAwNjQ0DQo+IC0tLSBhL2h3L2Nv
cmUvbWFjaGluZS5jDQo+ICsrKyBiL2h3L2NvcmUvbWFjaGluZS5jDQo+IEBAIC0xMiw2ICsxMiw3
IEBADQo+IMKgDQo+IMKgI2luY2x1ZGUgInFlbXUvb3NkZXAuaCINCj4gwqAjaW5jbHVkZSAicWVt
dS9vcHRpb24uaCINCj4gKyNpbmNsdWRlICJxZW11L2FjY2VsLmgiDQo+IMKgI2luY2x1ZGUgInFh
cGkvcW1wL3FlcnJvci5oIg0KPiDCoCNpbmNsdWRlICJzeXNlbXUvcmVwbGF5LmgiDQo+IMKgI2lu
Y2x1ZGUgInFlbXUvdW5pdHMuaCINCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvYm9hcmRzLmgg
Yi9pbmNsdWRlL2h3L2JvYXJkcy5oDQo+IGluZGV4IDkwZjFkZDNhZWIuLmYwMGY3NGM1ZjQgMTAw
NjQ0DQo+IC0tLSBhL2luY2x1ZGUvaHcvYm9hcmRzLmgNCj4gKysrIGIvaW5jbHVkZS9ody9ib2Fy
ZHMuaA0KPiBAQCAtNiw3ICs2LDYgQEANCj4gwqAjaW5jbHVkZSAiZXhlYy9tZW1vcnkuaCINCj4g
wqAjaW5jbHVkZSAic3lzZW11L2hvc3RtZW0uaCINCj4gwqAjaW5jbHVkZSAic3lzZW11L2Jsb2Nr
ZGV2LmgiDQo+IC0jaW5jbHVkZSAicWVtdS9hY2NlbC5oIg0KPiDCoCNpbmNsdWRlICJxYXBpL3Fh
cGktdHlwZXMtbWFjaGluZS5oIg0KPiDCoCNpbmNsdWRlICJxZW11L21vZHVsZS5oIg0KPiDCoCNp
bmNsdWRlICJxb20vb2JqZWN0LmgiDQoNCg==

