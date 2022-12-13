Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173064B9E0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:36:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58FK-0006zt-3C; Tue, 13 Dec 2022 11:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <felipe@nutanix.com>)
 id 1p58FB-0006y4-O4
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:35:03 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <felipe@nutanix.com>)
 id 1p58F9-0002tx-Dl
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:35:01 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDAhFx7026946; Tue, 13 Dec 2022 08:34:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=oAaE13RaS6vKZwh7HZrt3YRQxE3oDYeXY/Y0vBDfyIk=;
 b=LlbvgZhaYgGq9g20AgsFOta0o7lwCmkg3babpjyKfXzwCiQZSR4G7zfz5h6GtRcOuUC1
 Gu5+Qa14d5PGQbbY1y6hKoESntyFJhqlSd0kEody/F0yc0BMmsJ5l6CdhdWePDR4vOyM
 t1UbSjSrr/+h/MyjrqB+Uxh0TYd/vLgeHAH4++0MUxRwatcbnWp0bkCatvyrOnXAPnV1
 VVgIeX8JHjgsb+3ioZWUD1hjmfcEdlZkquMJy/rzu0sSbrJM00SK5SCLvZZEHYQaKYYn
 q5d0U1zeBLTeQcSoDXzi8Dc9BDrZravpClZjzSA1TmqkhGfMmRLaLQNNblOD0zjiWzSx 5Q== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3mcs3p7qu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 08:34:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwoxGEeW8pWgCyc6qtYOBJ2RjiyjtPe11VFsC1VbOkRb7YzV3O9A92RwoEHveZzM/MFUmgR0cpG1qWZ/e8r06JVbbfKw+exKXHZEb+xYBuJi9BJu2iWh21ZJa9AdQRA+Bf3T2lyhVgBcw6flNJw+ZN/5maiw2VaSUE9aQUidR4meaC9WOQAJAUr+NRhbZLvRRqFQK6FXDSFQr0rA0YsqRqteM6UhNZ6sFaMEeBXq5i2ViYdw0f+uMAnYyOB3wLIieEPozobSm9CcxUdOgzDMeyyBmHzcnRxkPZPC7vBO/yyFmy6kof4eoE9bwleiVRxukLidMn27lDhI/ddxRbumDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAaE13RaS6vKZwh7HZrt3YRQxE3oDYeXY/Y0vBDfyIk=;
 b=e+VqEBFepj+p8X+qwKHUXlmNqSq22gE6/UFHcevKwzBXVbx5bOK4I25WeM5K3iCYxwFIST4j+QA2A0qT1fOY/5GzG/uyLjfEFxjhkuAlOQ+qKBd79QmkLXiPIELaXpQQJmavUTt+foQriuXI+3PANfahV3giqgX4u4Djp+PLQlCCPrk56WEG3QMKqcCYzugbUhtB8AP9dhNlhcQKqwWuuO30PWV6p0TMrEEA2WruBPeAdrwRiUx2PWRzUQyvE6qwfWDUnC9x334bGRvwWWoT/yaGmgCAY99t3PuXPcEbc9djZtbjAgIwvdID+96kiF0ZXkPdCuzdJgRbmEP1FIwFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAaE13RaS6vKZwh7HZrt3YRQxE3oDYeXY/Y0vBDfyIk=;
 b=bYo76mDeQhnLOD0vuGGG8h8k01Uz8R03hb2zL9jTVXt5rRbj6YXeg7oepvNMBNcUD/R2kDY9Up3gHZ0ZonHKW/mBgO5hmOBH6R2ns3vAs8mv1cfaeqMAWum8i49hasVOIrZhz5gI18Wz2GBJi35vIzELuKqNixKtFEyuXxGud3GkMUqg8qH2IJ/O9PN+H/Jz52u6rcr7mBOaNOyvt1vZ5DKye81x0cWmKMMGa4yvN0ITlxvnWUh1UpJyVGwMVjaOdua75ts4imBKJ9RTmzyfs83Ywnyprv1Xm9EeD60H/ndYoUZe+A9rAVmrEvY9YLvU1NoIl2nicvxSlKA7g8Hq2g==
Received: from CO1PR02MB8855.namprd02.prod.outlook.com (2603:10b6:303:158::9)
 by BL0PR02MB6513.namprd02.prod.outlook.com (2603:10b6:208:1c3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 16:34:08 +0000
Received: from CO1PR02MB8855.namprd02.prod.outlook.com
 ([fe80::de4f:ad86:5d74:8325]) by CO1PR02MB8855.namprd02.prod.outlook.com
 ([fe80::de4f:ad86:5d74:8325%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 16:34:07 +0000
From: Felipe Franciosi <felipe@nutanix.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
CC: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, John Snow
 <jsnow@redhat.com>, Mark Burton <mburton@qti.qualcomm.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Brian Cain <bcain@quicinc.com>,
 Warner Losh <imp@bsdimp.com>, Luc Michel <luc@lmichel.fr>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alessandro Di
 Federico <ale@rev.ng>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>, Alistair Francis
 <alistair.francis@wdc.com>, =?utf-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>, Michal Privoznik
 <mprivozn@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 "Denis V. Lunev" <den@virtuozzo.com>, Cleber Rosa <cleber@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, Dominik
 Csapak <d.csapak@proxmox.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jagannathan Raman
 <jag.raman@oracle.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Dongli Zhang <dongli.zhang@oracle.com>,
 "afaerber@suse.de" <afaerber@suse.de>, "andrea.arcangeli@redhat.com"
 <andrea.arcangeli@redhat.com>, "bazulay@redhat.com" <bazulay@redhat.com>,
 "bbauman@redhat.com" <bbauman@redhat.com>, "cjia@nvidia.com"
 <cjia@nvidia.com>, "cw@f00f.org" <cw@f00f.org>, "digitaleric@google.com"
 <digitaleric@google.com>, "dustin.kirkland@canonical.com"
 <dustin.kirkland@canonical.com>, Eric Blake <eblake@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, "iggy@theiggy.com" <iggy@theiggy.com>, Jan Kiszka
 <jan.kiszka@web.de>, Jason Gunthorpe <jgg@nvidia.com>,
 "jidong.xiao@gmail.com" <jidong.xiao@gmail.com>,
 "jjherne@linux.vnet.ibm.com" <jjherne@linux.vnet.ibm.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "mburton@qti.qualcom.com" <mburton@qti.qualcom.com>, "mdean@redhat.com"
 <mdean@redhat.com>, "mimu@linux.vnet.ibm.com" <mimu@linux.vnet.ibm.com>,
 "z.huo@139.com" <z.huo@139.com>, "zwu.kernel@gmail.com"
 <zwu.kernel@gmail.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Thread-Topic: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Thread-Index: AQHZDbo4UkHHd0bEQ06wSb5QbVxOnq5r3WiAgAAokYA=
Date: Tue, 13 Dec 2022 16:34:07 +0000
Message-ID: <236991F2-4CDA-46BA-AE68-66E8D329F459@nutanix.com>
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
In-Reply-To: <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR02MB8855:EE_|BL0PR02MB6513:EE_
x-ms-office365-filtering-correlation-id: be6fffeb-295b-4847-dff5-08dadd27db45
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k/B+hNmTudwzmjbF6cT2odky+5w6h6aqvOIc5J91LMbu1n2MLZkxOzV//aX9SQTpddUlRmvxnKgfIgR78APZN51YXlXrWvFtWcRI9PeNa2oJbHWra+RIC4bEnlS+1C3uM8tlOv3vZt7SCS9ZdCyMtg9ff985aePL62gX6AUTVPpOSQpZwzrzMORwRZ8Wz4qeh5SpCVwOV4wJkI38oIyskCj4bL2UpVKUHUHg+vLeFlOMQoDb2qyfferkKCMmGmF2LobItruJ71lju4FkEF7mEfVKzIgof/g1o/mHMMRf4J59Y3jpjp1mD9wOOAfUrztIcmnslxKTFC9lOsdAUkzN87KGRCn3oMrNNodHhJB2uBxwkCKqOU4SiFb5Wgkr7EjgeAxsH0ZlRWfZX3X0C6GDSXeRPiUfKzg15Jt6iy2aBKHSooSjWUa3zi5ndeILKfZX3oooDXaixVTAgc07kZwDt3ob8BZFIwWnR04ZktNnj3Y57jUUoYGy/CgK8GoaaW7cgVDALWwHOwapCZ/SSfQTMyisBMm7hEZY42G4k1NbD/mLJXfFBC3KVPlw9pN8WKr1tL6kupmVt8Assl9MXWy/nARGtTwlZcfg6hmgmeRJWwNmlvVYD10gFTHBpFWjNVUwkENbv0Kvc65KgPhsLJJO9ksk10Nd9FEsi2waA5h7/tpMWvEKejzbO/EiJxUCeTSDaHXBlp46ljl5nsCWL5oF6Rzyh51yvn2XCk6E6rc8FW5lQxuES58MYqstvRTjl+Nq+KT5RIIH9aqBShVLHX3ixw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR02MB8855.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(366004)(136003)(396003)(39850400004)(451199015)(38100700002)(478600001)(71200400001)(2906002)(966005)(33656002)(2616005)(122000001)(6506007)(53546011)(6512007)(186003)(36756003)(4744005)(5660300002)(66899015)(7416002)(8936002)(7406005)(7366002)(4326008)(91956017)(41300700001)(6916009)(64756008)(66446008)(8676002)(66556008)(66476007)(66946007)(6486002)(76116006)(316002)(38070700005)(54906003)(86362001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEh0Uk56YmRFV3pMS29tY3JlWW54RjNuQ3dmOGx0ejNuZDR0OGdUV00zSk83?=
 =?utf-8?B?VXM4NEZDZDRwbG43QTRZdjlzRHNwM29HV0FnZ0tJaFZZMDM5TnpvV1hMelJL?=
 =?utf-8?B?c1VhRGdoT3M1dlZ2Rmt5UUl1QWpBdGJpemxCaXBsQjVpU2ZmZHhiSGpNK0FX?=
 =?utf-8?B?V3lUOXFYbmlSRU5yUjRZaDBkT3NwN0pJdXA0aUUyNW85MkMyb2o4R05mYk5i?=
 =?utf-8?B?V01QZndOaEpaZ2d5NWhEd1ZFTUYwcS8zUFg2ZjRvVk9jSVNHQmNITlFOc2k1?=
 =?utf-8?B?TG1DV1Y2MlhRTVBlU0JIeE5MNThYS3RleUlxUFUwbkkzUTRxaEdiaDZKcGx2?=
 =?utf-8?B?YTlUdWFneExZYTZsUUNmTm42UDc2UitIek9ZdTZERFRPUDJ2b3c5RVBGZnFr?=
 =?utf-8?B?d21hbTNPOFZkMDJmN1B6T2J4VllyOXlOQjlJSjlUenRmb1c0bS9vMXRWMlZU?=
 =?utf-8?B?TDc2bENMc1Zmb2o3NFZmd3lRT3R5emtuRjlEMCtCQzlzNCtXeWc1NVFoaUFN?=
 =?utf-8?B?RTFhcFJvRU9tUmJiQWRTSUp5RWxUZGFYZHZTbzBWODA1djE5TC9TYnF3N0ts?=
 =?utf-8?B?Z2V2YmROQkV3TWlyS2txQnhQa2tjeHRabGZzWVA0NldpSnlhaFRSQXFWMEtK?=
 =?utf-8?B?TTRPektMUit5eFBhOHRkdTNxOTJpK3BMSUdYRDY3d0YxSWxxSGJldXdaYnF6?=
 =?utf-8?B?ckdMMGJOTWZFMGVEYXdyMTYwVjIyTzdGVnppVDR4VGs0b1pZSXRPVURLdjdJ?=
 =?utf-8?B?L1NSQkt5VzhjYVBxSmlBMThVeUpYRHY5QWVDb1FnUE1ocEpBMjlQRjlLMEQ5?=
 =?utf-8?B?NUpKU3NnZGVTdXNjMlpWYjcreHl3dS94c1RzVVJSVWxwODVONkRZcGVxZDdF?=
 =?utf-8?B?Uk1vSnFwL1VKRjFaYktKN1l2NCt6TUhxZVpsM3FldVN5aFVuQmxCY0V0aWNz?=
 =?utf-8?B?aXFZNElGTGNVcXBwMFB5NUF5V3d3a2RreDJEczZhTjlIZjNmY2YwNi85RS9M?=
 =?utf-8?B?RU0ram5IZE5OdURCZVE5WGtaUmFoVlVsWmZNU0dlVzhYTzQ3RlVTa2hhL0dC?=
 =?utf-8?B?c1BjV04wWVQ5Z0pKSkU0cStnekJSMitmeW1wWFhpaEdQNFIrYkF5ZVNVSWRW?=
 =?utf-8?B?em5LUVFmMVhFZ1ViNW8ydG9RRnBZck04eklhNHlUNkJNMit2cUtvMFJmQm5D?=
 =?utf-8?B?OTAyWC9hMy9uZ1RLNWNRRlc1dEx3V0orSUFwQ0NUaEEzQVZsRlRvY3YxUE9z?=
 =?utf-8?B?WWxXZnljUDJzUUV0anJHNWd2czJadVhyT0VDL3drVWgrRVBHbVpKTzZjd0RB?=
 =?utf-8?B?NVlud1gyWXk2MEsyQ0hISzlWVnc4NWxWdHRESjAyS1dxVG1sWTdRdnVVNzFO?=
 =?utf-8?B?emkzT2xDbGx6RExkQmhpNWpjOUpFUHM0K21UV1NNWndyMnJGQVZySlgxOFpE?=
 =?utf-8?B?M3d3R3ZPNXI4eDJxUGlWT3U3dXJOQStoSXJvbktNNVRJdjZHd25xVTI5Ykpy?=
 =?utf-8?B?NFI4SUVIUUlHRnZ2N3hEckd5ZTB0TlgyMHljd0wrclpITDVTNnpadTlpQ1FT?=
 =?utf-8?B?bitLaHZNaUU2S1cwV0FtZ25BWmxlc0xMVEw3dElWSDZnNnM4NFpXeGNFYzVC?=
 =?utf-8?B?SmNBV2dXUmdpa0FuL1dJVG10bEJlWWZyRit4TW9VbDFHaWJPVnVwVU9KTisz?=
 =?utf-8?B?U3A2T2dPbUhFVG5ndG1UZmFRQk1PS2NsMTVXUVVNSzNPK1hhMWxGRlA1ZnA1?=
 =?utf-8?B?R09qdHU5OXgrRDZVOWZpUFZvM2dYMlBqOHJrOVIvWGFYZllHODlEbktGWnZB?=
 =?utf-8?B?dmRiWDdyNmdjZkIzSkw3N3dZdEQ2UTlrQmltRXpQblNtOXpsMTJzcXl6NUZo?=
 =?utf-8?B?ZEtSSmF0OC9zVXRzSzZNYVlHT3llczFRK3N6SWh1d0RGRERJMEhLU01mRktE?=
 =?utf-8?B?R2luYnJPUG5qMlloQnNieGZra3NCd3hJdG1BWXhUUjFsMkNNZnNRVzM2MkZm?=
 =?utf-8?B?dGZZc0VTYmpNVlpOYWhwQmpRL2ZNV3NEQ0RNTDlWMjJvYzhaS3BjaFVnQk80?=
 =?utf-8?B?Mk9RckpkbkZWZVR5OWE5UklnVDBVdG9aL3UrTGh6ZXNRQzZZRFRLa1NHNlUy?=
 =?utf-8?B?c1VIbUhhR2lzTHpydkdiK1NJWmdxYkdCYmZuNFFMUGovNVNmeGtZb2xzS1F6?=
 =?utf-8?B?bXNWMis1WHNLN0dpMUtFaWxGMEswSFV6Q3dwUWdLZHFiZDhPU1JDNHRXbEZm?=
 =?utf-8?Q?oULiJsaKRF2mswPMtGoiftZ4yz7U5XwpUwGLqS0kpY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04A9DFD720D0C74B828341ED91CD95EF@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR02MB8855.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6fffeb-295b-4847-dff5-08dadd27db45
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 16:34:07.8442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ghS1scU+6XrbnNqhSM4DtG4iU6SYwKsmr4q0hL3MmfMclTA6QTrGsapdHvtvDtha8fYrwylaBZaToCN3br+F1JmvbxMLLGfJ8LjctlqXN5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6513
X-Proofpoint-GUID: dEg2Rd4fM4UA3g1aat75QVLlYmfgqoyT
X-Proofpoint-ORIG-GUID: dEg2Rd4fM4UA3g1aat75QVLlYmfgqoyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=felipe@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

DQo+IE9uIDEzIERlYyAyMDIyLCBhdCAxNDowOCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IFdlIG1vdmVkIHRoZSBjYWxsIGhlcmU6DQo+
IA0KPiBodHRwczovL3RlYW1zLm1pY3Jvc29mdC5jb20vXyMvcHJlLWpvaW4tY2FsbGluZy8xOTpt
ZWV0aW5nX01qVTJORGhrT0dZdE9HWTVaQzAwTXpSakxXSmpOamd0WVdJMk9EUXhaR0V4TVdOakB0
aHJlYWQudjINCg0KSnVzdCB3b25kZXJpbmc6IHdoYXQncyB3cm9uZyB3aXRoIEdvb2dsZSBIYW5n
b3V0Pw0KDQpJZiBwZW9wbGUgd2FudCB0byB0cnkgWm9vbSwgSSdkIGJlIGhhcHB5IHRvIGxvb2sg
aW50byBzZXR0aW5nIGl0IHVwLg0KDQpGLg==

