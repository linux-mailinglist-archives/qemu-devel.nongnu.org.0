Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A128F66CFD4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 20:59:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHVd9-0005Xt-Ts; Mon, 16 Jan 2023 14:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1pHVd8-0005XU-1b
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 14:58:54 -0500
Received: from mail-dm6nam04on20605.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::605]
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1pHVd5-0006eu-Ep
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 14:58:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EB3sOwf+Lbe5G1JSUl9HY/tDFbg9w7WfMUeHppOHWDvTwSSwzs/OsCx5tIz3tTDqDzrspV+fz9Ys36zlPpgzyMhWUvOsxmSfJD+2+5SgfriRjwovODV8WkOWLw+uxBJfxCdk9464brxBXntJkZwYUivcYA0rzozunxZ8FZ6ncQ0bb2YjcZYbfJQR5M8guXK03exn8BJvCDz7wMgcQ5rSJFX6vJy0KlRKLRJiDOfKu6ZMZAatcvvORcLP2omUdTH+KR1VOHaFffW7v349PTDq290FkRYctW3WdnrijwZ80kxzxRm622I+eEtagVuh1BbpOLBxCCVMrI+8Li3Sc2M88w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gKTbw9kjM8gaGDo8t+R2ARZn3sYTB02G0tdYK2rPQU=;
 b=kQD65CWU8CLFBl/2NCpBEUNVuRSbmpk/dTV8XsiHZLFqS223jVxLylQtaodNA2TZc0MCDxwaRYWdHXwhbxG60tcStdxownZQVL98gIyEWo3l9Ge2GB22/ZKcekZKnqtw+YTU5YdceyI9NaJufXWub/k8YwYd5HiVqewubJF+Z/s808CqmnOfZa/qx2RWsKmZvLGYovRUoyGzIhgbzsweGQ4g5k54H2IN9I0KdjZmH39OqUiVbpAFsTEBZbu1qxMnjfy4IwbVMMERbz7pn4ASB+NNpwbgnkUh/0lSjzocgw7BZjNTOpYgso+Dhs7IETmYkLEHBn+rCdRApD4p46lUDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gKTbw9kjM8gaGDo8t+R2ARZn3sYTB02G0tdYK2rPQU=;
 b=MBYhu0JtDbE5111F9pkkjgOmaGSEZzeRg9YofgKDJgT+vIPclk9rCr9Qfl9lg+yrdScTonvy2Py/hN68O6gcn4tELN0YZUL0khwk+wyfe7TfEpU/eFkx9YpW5RBJ25gLbS6mZQM9UfMqijZ/cNMRq+ADivIMVQjCOjQEDZjUQTF4wy+O8vEfCtMv/OBHIILPD0JwWb/4WQqK/Gtjl4/6lciOwCCiYPvaHxu3aNi7engK1BVT03Y0GyikMY5W3Z9KiobhSf4JKe/WhUc7jjZZMAeo3sjOjFh4h5Gl8gFeWMgVjomFZgBC0mw3cEDZW4t9uBC9aN9As9YNAwLz+iGWdA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 19:53:45 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::a891:beb7:5440:3f0]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::a891:beb7:5440:3f0%5]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 19:53:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Liuxiangdong
 <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>, Harpreet
 Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, Zhu
 Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>, Si-Wei Liu
 <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Eli
 Cohen <elic@nvidia.com>, Stefano Garzarella <sgarzare@redhat.com>, Juan
 Quintela <quintela@redhat.com>
Subject: RE: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
Thread-Topic: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
Thread-Index: AQHZCMvCocomO4wJGEu6CYOEXtA/lK5gMvUAgDb0UJCAAbMxAIAAAETAgAAVEgCACMXd4A==
Date: Mon, 16 Jan 2023 19:53:45 +0000
Message-ID: <PH0PR12MB5481E8F016A31A666E34C4CFDCC19@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
 <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
 <PH0PR12MB5481EB05212DD70C97AC5729DCFF9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthSYTw9JEHT_CM2FdV88eDqan+Ckj7McwTBRK92ziyUg@mail.gmail.com>
 <PH0PR12MB548141C98FA3C7593E4B3C40DCFC9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvriASFy1JTXHPrnP2O99B+mjYY+NMB9x9dHbiG0J7Y3w@mail.gmail.com>
In-Reply-To: <CACGkMEvriASFy1JTXHPrnP2O99B+mjYY+NMB9x9dHbiG0J7Y3w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA0PR12MB4350:EE_
x-ms-office365-filtering-correlation-id: 714a641a-09ee-4adf-d161-08daf7fb6066
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8a8gADzddvxVKnNvoAAplAProiFWyrq9JRhCVb4bKsNZuyMsckiB051/4TgikwHnaBvfSvbfvF+BJRh7EZQbOqdqUJvfgLsThJXeaaATBIEy6qjWYZYCKhoLlbUmmLm5SvH/CMb9rzCP0hlQRotTjrpsE0WdHeOrv9w/yWz6ZuHj26h/xSJoqYGUml1J0lI8lltMcIsp9gjmKP82OQpqx2DrFqAkVdcfaYc2tjyjiJPOnE6avGTILPqCnqDZ5JOqNkXqad0SV3dt96HCXeFz4+jcnbFAt7eEQqrBjZdT+CJGqHqq0n2BYj9sezXl7KtnHOU6hBzACqkKPiQmCxzQpd/ges1t828AHG65juhPtaYBaRnl7fVkJmPvK1WxF7OWpt8VJeE1IRJ/nX+Um6EWmZPIx6GY4jpQWXRIW39cTO/ZJ9oBf/ho0JH2/tRLe3PHNUpb/ECyEimOt690K/buEba1cnAfGBJZH+G8F7oWjipK2zGH6wpyavTna+IaMQqr9yxPRKy01p8mLHkMwHMiWWLzDZnSmTBbTb0sBV/dDii9A1G4n+XMVgGBaRJuWZr7RTM/wKIjeoFrIpC2E/t/l7FbybdWAx3GZuXERkKb89lxQZ+sQBfz9ZIkX3CqhT4dA30tRgHJrJMphv6KbvBan67jd7IFIxaIR4mE1cc9YR6rrIFScQnATfZhaQyrhUsffDu/+zqy9YYi+DRZqXdPA9tMB0LtB1clJJGKmjCvt3s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199015)(33656002)(54906003)(316002)(6916009)(66556008)(8936002)(52536014)(83380400001)(66476007)(7416002)(5660300002)(64756008)(76116006)(66446008)(8676002)(4326008)(66946007)(41300700001)(38070700005)(38100700002)(122000001)(7696005)(86362001)(53546011)(71200400001)(55016003)(6506007)(478600001)(186003)(966005)(9686003)(66899015)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2JENlB1ZnlqTnFzakRtT2IyRzhQY3BxcEEwRGx3dE9kZGV3UEdFZjEvcHZm?=
 =?utf-8?B?dnZzMWJNdFhQVkVZODRZclFkOUhjYWNDcmJ2WEwwTkVPSTFuRVJMdncvUjZr?=
 =?utf-8?B?azdnRFlqcVVJL1RSUy91SzVOZ1ZqUkY4RmZMOGFJbXJiZy9UWFlZOUZkcHFk?=
 =?utf-8?B?YXRqL3NXTGdpS0dzbEwvQ054SDQvRnVIc2dxMGhjREJtS2l1c2VLZDdPVzNl?=
 =?utf-8?B?ZVBCY2JCYzU1VHdiT0F3N1Zra3YxSlNLRGdySWV0RW1iUXNWaGYra05RRlB0?=
 =?utf-8?B?WUV5cTJUMnIvSS9FMDA0TG5ZUTJHNUpPUHRGL0N2aEszYjAvMTdBNjZLNTlp?=
 =?utf-8?B?Y2RlSWtDWE5UdDNDdUplTlY5Y3dXMDBGMUxmNndCb2xHdVRqKzdnQlEvUEFw?=
 =?utf-8?B?NnJSVVJyRmJtcU43dEloM2NZVTIxY2JyQ1dHZHczby9zOVFueFc3VklySysx?=
 =?utf-8?B?OTdGeldZMzdYaFZ5YUdEQlp3dDlPQTBpMC92V3RpSFU4SUdqOEJwNFNNK29X?=
 =?utf-8?B?cnI1VmxvQXBiMXpFNkZ4VTlRL1RYRGliSnVnRU1aMitqV2tHWWtHd0pjcFVo?=
 =?utf-8?B?TG0rM0ZWTVlsRmEzUVJkMWlJVWo1bllaQ3RzSmJPS0UzeWFucFplVXhCeDRs?=
 =?utf-8?B?T3MySWJQUTNQYU9VRHd3N296U3JCcTN0R2t5Qm50ekpqNHR3dW5URTJRQ205?=
 =?utf-8?B?NWxCRnA0c2w0SVM0WlJKRkNHQkJJMHR6aFZiSnlZMlN6Zzh4QkpzS0pKYUk5?=
 =?utf-8?B?TVNQcWx0aWZpY3hxaXZXbGQyL2lkQjV6dnIvTGttaUlpU281RzZUVityaUJK?=
 =?utf-8?B?Nnh3VytTM3FZSkovelR6SGN2eXZ5UzRnQlgwOEZIMm9MUUtuQmtWS3RDWkdB?=
 =?utf-8?B?bGEvYmlWczlqMENQYTBLVllGcnpPWWkzVE1PVm05SmI1UytHKzgxU0g3YTQ5?=
 =?utf-8?B?REtqWlRwWGc3cFhlUHl6dGtsWDRTcFNOZUhTRGYrY2NBdml1QVVIemJiQURk?=
 =?utf-8?B?dndIYm5ycHZ4MVgvWnp2Y2t4di91cW43ckUyd1haTmZ1clYzZm5RUTBXK21X?=
 =?utf-8?B?cGJWUGtQcnhPbFZhWUJIckRzUjFCdHZOZlF6cGo3Q2ZjMXNld0Z6VThqeklF?=
 =?utf-8?B?M2FYTlA4Yng2STV2UnpFbkZTRC9UWGpkU1FwaEFSRkRyV0xORFZXR2NLSFdp?=
 =?utf-8?B?blprdVhvQlJFR2tDb2xsQ0UwV0c1cUNZMFRmRmJLVG00ak1KNHpHTnVPV0lZ?=
 =?utf-8?B?NEQ1ZGRiVG5MUWR6R25UZFpKbnBBQzBja0tmVGdsOCtNejVxRGduWXFwTThF?=
 =?utf-8?B?bW9mTGFCQ0pOOUJHRVVIL0RCakduNkJSNmZCcmd4TktFRS9TZzM5c04ySGdQ?=
 =?utf-8?B?OHZCc2NaQ0JRdXJDSmJiQUZ4YkJpc2JuMVJlQ3Y4a0ttUGZtcmNRMGxUSFVl?=
 =?utf-8?B?TzdVbCt0RENhM0FsOHlRYkZpQVFYY3lYeVNwVzhDcVo2dXBFMUl6VXZtYWoz?=
 =?utf-8?B?eWc0SklQS004d25nd1h6ajIwL3lkRERITG5hU2hsUEtsQjZmOXJncnFJWUZu?=
 =?utf-8?B?UWZadEw2VGVTc0EvY0pKbDUyc1E5Mk5TRHZRQUdHdmhEaWZrOGF0MzMzemEv?=
 =?utf-8?B?cE1Nd3FvcjNTeTMyd0thR3phS082S1BLMUFLcklMTTNmbjFNRzVURWppTEh4?=
 =?utf-8?B?NWs0ZjQ5Q1o1N0g1Qm5xeGNxaHFMcWlsNWI5ZUU2MEQ3NkhMSHBjNk9TZXJo?=
 =?utf-8?B?a2lyMFF2ZU82WnNGUXJKN2tkclpDRmR6QnBxZEhjOGlrZmY2TEFRVUpkdzlw?=
 =?utf-8?B?Q09tUkNNdWM4UjRzY0ptMkd6bnBDKzRLS3VmYmVuQUpDOVdmSWVIYTUxQkJz?=
 =?utf-8?B?UU1YRkZIUDZPYnExRDBuWTM0WnlweWdyZzhPWENuY0lhaGhGOTBabjVwUENO?=
 =?utf-8?B?R3NmVktBOU9TRUIzRUQyK29DeHRpaTNEcEUrOW5YSnBSSnpjTWFzYUNzaTM1?=
 =?utf-8?B?NkFnMXlOQmRoMWJyM0FmK2E3MHZ4OFBMSjZSbUd0U01OWjVSalorSVRDOEVZ?=
 =?utf-8?B?NVQ5OG0rRkYwaDJKd2x4T0JwWG9QcUJNcWl5S3pWNzZiMGJ6YUVSU3lWd1Mr?=
 =?utf-8?B?NXZDZXIxSGJGVWlnSEdRakR2dW9lYlFLSFZQa0sxcDN5c3dQeHhMWUVlQTkw?=
 =?utf-8?Q?yOiDNz8lAC+9/LtdExHcC2Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714a641a-09ee-4adf-d161-08daf7fb6066
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 19:53:45.1924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejpXdBt+zf5Q3pab0yg8RyR0/rlkx0lWUhoJo1BGtmYNNW/B2P9DjeZHpxK8+mKkP3uu6EUxtw6WHBDE89QEew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350
Received-SPF: softfail client-ip=2a01:111:f400:7e8b::605;
 envelope-from=parav@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgSmFudWFyeSAxMSwgMjAyMyAxMjo1MSBBTQ0KPiANCj4gT24gV2VkLCBKYW4gMTEsIDIw
MjMgYXQgMTI6NDAgUE0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4g
Pg0KPiA+DQo+ID4gPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+
ID4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxMCwgMjAyMyAxMTozNSBQTQ0KPiA+ID4NCj4gPiA+
IE9uIFR1ZSwgSmFuIDEwLCAyMDIzIGF0IDExOjAyIEFNIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZp
ZGlhLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEhpIEphc29uLA0KPiA+ID4gPg0KPiA+
ID4gPiA+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+ID4gPiA+ID4g
U2VudDogTW9uZGF5LCBEZWNlbWJlciA1LCAyMDIyIDEwOjI1IFBNDQo+ID4gPiA+DQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBBIGR1bWIgcXVlc3Rpb24sIGFueSByZWFzb24gd2UgbmVlZCBib3RoZXIg
d2l0aCB2aXJ0aW8tbmV0PyBJdA0KPiA+ID4gPiA+IGxvb2tzIHRvIG1lIGl0J3Mgbm90IGEgbXVz
dCBhbmQgd291bGQgY29tcGxpY2F0ZSBtaWdyYXRpb24NCj4gY29tcGF0aWJpbGl0eS4NCj4gPiA+
ID4NCj4gPiA+ID4gVmlydGlvIG5ldCB2ZHBhIGRldmljZSBpcyBwcm9jZXNzaW5nIHRoZSBkZXNj
cmlwdG9ycyBvdXQgb2Ygb3JkZXIuDQo+ID4gPiA+IFRoaXMgdmRwYSBkZXZpY2UgZG9lc27igJl0
IG9mZmVyIElOX09SREVSIGZsYWcuDQo+ID4gPiA+DQo+ID4gPiA+IEFuZCB3aGVuIGEgVlEgaXMg
c3VzcGVuZGVkIGl0IGNhbm5vdCBjb21wbGV0ZSB0aGVzZSBkZXNjcmlwdG9ycyBhcw0KPiA+ID4g
PiBzb21lDQo+ID4gPiBkdW1teSB6ZXJvIGxlbmd0aCBjb21wbGV0aW9ucy4NCj4gPiA+ID4gVGhl
IGd1ZXN0IFZNIGlzIGZsb29kZWQgd2l0aCBbMV0uDQo+ID4gPg0KPiA+ID4gWWVzLCBidXQgYW55
IHJlYXNvbiBmb3IgdGhlIGRldmljZSB0byBkbyBvdXQtb2Ytb3JkZXIgZm9yIFJYPw0KPiA+ID4N
Cj4gPiBGb3Igc29tZSBkZXZpY2VzIGl0IGlzIG1vcmUgb3B0aW1hbCB0byBwcm9jZXNzIHRoZW0g
b3V0IG9mIG9yZGVyLg0KPiA+IEFuZCBpdHMgbm90IGxpbWl0ZWQgdG8gUlguDQo+IA0KPiBUWCBz
aG91bGQgYmUgZmluZSwgc2luY2UgdGhlIGRldmljZSBjYW4gYW55aG93IHByZXRlbmQgdG8gc2Vu
ZCBhbGwgcGFja2V0cywgc28NCj4gd2Ugd29uJ3QgaGF2ZSBhbnkgaW4tZmxpZ2h0IGRlc2NyaXB0
b3JzLg0KPiANCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiBTbyBpdCBpcyBuZWVkZWQgZm9yIHRoZSBk
ZXZpY2VzIHRoYXQgZG9lc27igJl0IG9mZmVyIElOX09SREVSIGZlYXR1cmUuDQo+ID4gPiA+DQo+
ID4gPiA+IFsxXQ0KPiA+ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQNCj4gPiA+ID4gL3RyZQ0KPiA+ID4gPiBlL2Ry
aXZlcnMvbmV0L3ZpcnRpb19uZXQuYz9oPXY2LjItcmMzI24xMjUyDQo+ID4gPg0KPiA+ID4gSXQg
aXMgb25seSBlbmFibGVkIGluIGEgZGVidWcga2VybmVsIHdoaWNoIHNob3VsZCBiZSBoYXJtbGVz
cz8NCj4gPiBpdCBpcyBLRVJOX0RFQlVHIGxvZyBsZXZlbC4gSXRzIGlzIG5vdCBkZWJ1ZyBrZXJu
ZWwsIGp1c3QgdGhlIGRlYnVnIGxvZyBsZXZlbC4NCj4gDQo+IE9rLCBidXQgdGhlIHByb2R1Y3Rp
b24gZW52aXJvbm1lbnQgc2hvdWxkIG5vdCB1c2UgdGhhdCBsZXZlbCBhbnlob3cuDQo+IA0KPiA+
IEFuZCByZWdhcmRsZXNzLCBnZW5lcmF0aW5nIHplcm8gbGVuZ3RoIHBhY2tldHMgZm9yIGRlYnVn
IGtlcm5lbCBpcyBldmVuIG1vcmUNCj4gY29uZnVzaW5nLg0KPiANCj4gTm90ZSB0aGF0IGl0IGlz
IGFsbG93ZWQgaW4gdGhlIHZpcnRpby1zcGVjWzFdICh3ZSBwcm9iYWJseSBjYW4gZml4IHRoYXQg
aW4gdGhlDQo+IGRyaXZlcikgYW5kIHdlIGhhdmUgcHJfZGVidWcoKSBhbGwgb3ZlciB0aGlzIGRy
aXZlcnMgYW5kIG90aGVyIHBsYWNlcy4gSXQgZG9lc24ndA0KPiBjYXVzZSBhbnkgc2lkZSBlZmZl
Y3RzIGV4Y2VwdCBmb3IgdGhlIGRlYnVnZ2luZyBwdXJwb3NlLg0KPiANCj4gU28gSSB0aGluayBo
YXZpbmcgaW5mbGlnaHQgdHJhY2tpbmcgaXMgdXNlZnVsLCBidXQgSSdtIG5vdCBzdXJlIGl0J3Mg
d29ydGggYm90aGVyaW5nDQo+IHdpdGggdmlydGlvLW5ldCAob3Igd29ydGggdG8gYm90aGVyaW5n
IG5vdyk6DQo+IA0KPiAtIHplcm8gbGVuZ3RoIGlzIGFsbG93ZWQNClRoaXMgaXNu4oCZdCBleHBs
aWNpdGx5IGNhbGxlZCBvdXQuIEl0IG1heSBiZSB3b3J0aCB0byBhZGQgdG8gdGhlIHNwZWMuDQoN
Cj4gLSBpdCBvbmx5IGhlbHBzIGZvciBkZWJ1Z2dpbmcNCj4gLSBtYXkgY2F1c2UgaXNzdWVzIGZv
ciBtaWdyYXRpb24gY29tcGF0aWJpbGl0eQ0KV2UgaGF2ZSB0aGlzIG1pc3NpbmcgZm9yIGxvbmcg
dGltZSByZWdhcmRsZXNzIG9mIHRoaXMgZmVhdHVyZS4gU28gbGV0J3Mgbm90IG1peCBoZXJlLg0K
DQpUaGUgbWx4NSB2ZHBhIGRldmljZSBjYW4gZG8gZXZlbnR1YWwgaW4tb3JkZXIgY29tcGxldGlv
biBiZWZvcmUvYXQgdGltZSBvZiBzdXNwZW5kLCBzbyBJIHRoaW5rIHdlIGNhbiB3YWl0IGZvciBu
b3cgdG8gdW50aWwgbW9yZSBhZHZhbmNlIGh3IGFycml2ZXMuDQoNCj4gLSByZXF1aXJlcyBuZXcg
aW5mcmFzdHJ1Y3R1cmUgdG8gYmUgaW52ZW50ZWQNCj4gDQo+IFRoYW5rcw0KPiANCj4gWzFdIHNw
ZWMgc2FpZA0KPiANClRoaXMgZG9lc27igJl0IHNheSB0aGF0IGl0cyB6ZXJvLWxlbmd0aCBjb21w
bGV0aW9uLiBMZW4gaXMgYSBtYW5kYXRvcnkgZmllbGQgdG8gdGVsbCBob3cgbWFueSBieXRlcyBk
ZXZpY2Ugd3JvdGUuDQo+ICINCj4gTm90ZTogbGVuIGlzIHBhcnRpY3VsYXJseSB1c2VmdWwgZm9y
IGRyaXZlcnMgdXNpbmcgdW50cnVzdGVkIGJ1ZmZlcnM6DQo+IGlmIGEgZHJpdmVyIGRvZXMgbm90
IGtub3cgZXhhY3RseSBob3cgbXVjaCBoYXMgYmVlbiB3cml0dGVuIGJ5IHRoZSBkZXZpY2UsIHRo
ZQ0KPiBkcml2ZXIgd291bGQgaGF2ZSB0byB6ZXJvIHRoZSBidWZmZXIgaW4gYWR2YW5jZSB0byBl
bnN1cmUgbm8gZGF0YSBsZWFrYWdlDQo+IG9jY3Vycy4NCj4gIg0KDQo=

