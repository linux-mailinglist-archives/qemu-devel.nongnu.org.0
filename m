Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450860DB14
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 08:19:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onZj0-00024F-12; Wed, 26 Oct 2022 02:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1onZiq-0001Fo-IX
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 02:17:07 -0400
Received: from mail-dm6nam10on2062f.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62f]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1onZie-0008AT-7s
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 02:17:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lf7eiiE/N3xvZDwkRI33GNUgJn3+gXXVo/3QjZ5MPNkS+5Nj0htx+mwONVgY+aJ8ahIyY0/6HLl5IXop1+DcuronD5Ihms0uGMV/EV0xWtZBc8GUNiMhoMh6YthBxMlpKJQ4XJ2d2pZuskt5YfBXG2z8SSs9qRPbK67R5n16SMzZHB3hFf1g6V4mttms2cYvqfkkJkvrGdeRJvCD5R/eVfF/fx3ZkFYlvBmaAh4WpOHYeYU0EELK7d7vOTTB80inPx1iETXEqyvkgFsoq5IRl4BJb2eOZOWZGQr5kUOlrEB//zo6vv3YeLKmuhcIOm011D1fTr14SXlrlOLQ7DxZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OM1IyJ3nk7Qnf53R8CZXVVI18FcR7+p4+5jfGUxLt8=;
 b=i8xNJ3sGNuBGbFQxPmbUP5R7xfxGLulWcsw9XtrhAbQ5H624MgzhaBI9VQVs8C0fG+e1Ip6ISk68woldYtNgrtX8GyrlEaIIWDcczwmOD+q9nly2edBTc/38jraoI0ekcVQXl1C6XpDdfRsDtSchi0plqeMPh0o+C4IxV949cWKjUsNuTepgoTPLa+OpJOmHsSGGQuOwKQ4pghcCtRnq07pNYgqXToUZBXcH8gv4RL/r6DT2ch/Dfyx7gKGw/VDiidbUI45UjiDdexYrfl56obmdt1OMyy+i5myT/buuIiaQN4AZHwdpAW4mOwNyZPDUQQOcmi6osSPDZoBuwj839Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OM1IyJ3nk7Qnf53R8CZXVVI18FcR7+p4+5jfGUxLt8=;
 b=JvpIM41nLfHQ+7l3nwvmOtNwNdf92e3CL1cY6QWJiiEndRQYsNuLxMTxcQ+jFwo5S51zhU1Jv3WBBHR8i0i4ljyiCT2qbTKV0db+V2vm5IDVsVBoGBttsXdmMiDtc97ZHdo8Uzo1Kzs/E5xCYXgGpNtn5sQtS4foD8Q4hIFPjamuxi0cqpsnwo8tKWDvcei3/TWt0K3SE1SdzQu8uQ/IsZBmutayesAis2bBLpjb26jDY0UxPrnGGqjpmLCMCbXoaU4MceV2YFWxtbIcKy5dI6jGnydDq1bz3JjahF8d+9YDJxXtgZqZklS2PaIlbD+9vH9aegQeMDyNxBuLpIBtqQ==
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.26; Wed, 26 Oct 2022 06:11:43 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::2bec:c2ce:ead9:c610]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::2bec:c2ce:ead9:c610%9]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 06:11:42 +0000
From: Yajun Wu <yajunw@nvidia.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "mst@redhat.com" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Subject: RE: [PATCH  v2 1/4] hw/virtio: incorporate backend features in
 features
Thread-Topic: [PATCH  v2 1/4] hw/virtio: incorporate backend features in
 features
Thread-Index: AQHYoo420afh1hRyOUGAOazdHACteK4guCnw
Date: Wed, 26 Oct 2022 06:11:42 +0000
Message-ID: <DM4PR12MB5168A6071D5A3A961E0CCB69B6309@DM4PR12MB5168.namprd12.prod.outlook.com>
References: <20220728135503.1060062-1-alex.bennee@linaro.org>
 <20220728135503.1060062-2-alex.bennee@linaro.org>
In-Reply-To: <20220728135503.1060062-2-alex.bennee@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5168:EE_|SA0PR12MB4512:EE_
x-ms-office365-filtering-correlation-id: 8cd0b54e-f55a-400b-4484-08dab718f40f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L2jtFeNtsfu+r+xbRENg+DXGQbb06O8Fm/li9MbKROLCD+Dfjn0ulN2ZWaYeZzAjI+k4KNUq9aHeJ2+jO/QpGdp5sz8rMAoTGr4m+DwODFrGL51hPBaD9/HkDLvMa+cUJD1JrOYH5nFSd6XvVndsakJXLEiravq6dAOVeNlsJ5CPQ9nkdtI5h5igQWEN2tEIDQlXKb7eQi9WAh2jRxvmtioDIixGrUTUbc22NZPh/4UBT4ayNvC06ak8WcZCX1yVG6Q2F2H8MFNF+xirkE4Tyrj8p0HIH06juTCZiIYyO6dnWzfNzToigCcyuoVtz6cHwZSVImHklo1HmGGqG2aALM3A4mdKrEm4ooKdNxyttQWUE8wXvIlOBzDplWS7syIab34bPUcgyW0yT5aU4QWQqZdIPqXEKH4Gu3gnYboAjY2yQ5u9OZ+MUnjD5u8ESn6NcD8T3WV2AHDa7R/KxY5uQ4xD3GJ26n1XFGH6tFLoPNM+IVlhWPlODDJ4CUotEiT+8wacLqdOwQc0W4WQjXUeXrPC5hyN+h5BPQfyKsHUNVdmX1WXJXPOIud0UmrWZ1jh22aolTMjzfvVYn3w+usvy6tPrZUeTIJXFEZnawZanDr0Y3PaZyDHau5dw+PGvxbwlHiY4SbwI1c5bDCVCdiH9bXRnhNbje3qmj3HpvU0ClWXg90RkCyfiMTpyLyQwHDK3MFWpBBpmeBnUyTYUFSM8OOA/I+V3MJnQwhmHAQalTSl8WN91mRYnd8DgVbxm+ZyiK5kzHPgOV1Z6vf9Wk6yD2R8WXMnhMLQ47EIgfgDbjg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5168.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199015)(26005)(8936002)(76116006)(41300700001)(7696005)(8676002)(52536014)(66446008)(110136005)(66556008)(64756008)(54906003)(5660300002)(53546011)(4326008)(66946007)(66476007)(9686003)(6506007)(38070700005)(107886003)(316002)(33656002)(38100700002)(66574015)(2906002)(186003)(122000001)(55016003)(83380400001)(86362001)(966005)(71200400001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFdocmFVYkpnUmJuTU8rNWxJeTR5eHpTa0QxZ2NQWjAxc2FmUGNVUFNuTXBD?=
 =?utf-8?B?b1lGeUdybnF1M0R2RU1YVWlmYWZOelRMdEVRSU4rSktocStoTkxzMXE2SWFH?=
 =?utf-8?B?NjRSdDIxTEhMR21CVXdjbklHR0RZcnp1SWlzYk1jckM2VkZZc2loS2UzeWtD?=
 =?utf-8?B?Wi8rY0M4YlVIVW1hWWVsckZTSjI5NnlEa2VqUWtNZ21Ud1VwV2NQbndqWXdT?=
 =?utf-8?B?TzZ2ZGxuR3FGRTZRZC80WFlub0ZFM0NEK0dHa3lXbFJ2ZVZBY1YyQ1dRb1lM?=
 =?utf-8?B?N1JIaWZ6ZGhQaVhWTnFjUUpORFNCcEpQWVRsMVlOWmJSbXZORFFBZjQ4MStr?=
 =?utf-8?B?MmxyV2FGbGN0K1Fwem90VkFxWEJtTW9id2lPWDZ4c3NmdXNSYUFLMlhGMUc2?=
 =?utf-8?B?Skp5VXFvQlplZExXZnhPbU0vT0M4K3VDRFBTSEptbDgxR1l0OVJlb2EvWmg1?=
 =?utf-8?B?WXdKVVk5SUhpOVc3ZHJNZ0x5c3V6VkFERDJpcU5sb0xJS0dWK2MxU21STFBn?=
 =?utf-8?B?cWVHMUlvNUdVUkM1QVg0U0JRWngyTjJUS1F4SGF4WGx2ZHU2b2JKZDVRT0tF?=
 =?utf-8?B?MzNZNCthR3lwSlNDUkF0ZnNkSllmdEp1cXNDUEZBc2ZlYTRHb0tEWWZzUHJ1?=
 =?utf-8?B?c1MrdllDZjVUTHpLQWsrUG1XNitjZDlVRHpicW1wRFdhVjhWU2pZVEd6L21U?=
 =?utf-8?B?V2RNemtDcG9MRGhXMysxN25UL2pmSWJiNStjMUYzSkc0N1FhdGtLbG9VemVz?=
 =?utf-8?B?VTFxN05BcW85NVoyWkFUQ0lEOFdJeXRSVTNZZlBieXlhS0V2VVAwYUU0M25V?=
 =?utf-8?B?TnJxV2xxeUk3elRsRmxsYlZySjY4TnA2cWViSFNCVCt0OHhnL0F1blFOTUcr?=
 =?utf-8?B?dHRhbDZWdmNiMnRHK3RLQTBCSm1YT2NtRStza1Y4Q2JoNXF4VnF2MnUzSDNh?=
 =?utf-8?B?N1VDTml2b1h2RmRObkRiRGxQUi9WakM4dWlIYko3MmtXcG5yenRiR0FMeEFo?=
 =?utf-8?B?eWlrcFZUQ1lpS2hEY0o2ekU2NERQRTV5NWpQTmFRcURvNU1tVFNpa2RwcjEx?=
 =?utf-8?B?NE00VGw3c0xXR210ODBLWUpuMzVqdE1sOW1mb0pqdDhIWVVwSHBHa2FwM2hI?=
 =?utf-8?B?eW92anpCb0ZSNWdOZkFWeDFhellzNVRoNHFKYUhjSWNjRlBGNVV0aXZ3NUxy?=
 =?utf-8?B?QXZRWnRORThQSjRVMlJQTS9xRGpDb0lqdVErYWFQLzZrY2J2RVpMeU52WFAv?=
 =?utf-8?B?MGFSUmk4Z0RqSCtjclI4ZXFOUzJSc0hnRjcrK210ZmJTcmhYSm51SnNkTWlv?=
 =?utf-8?B?SFRGRTlKUmo3NFAxRlJodk8xRlhUWHpmcm1Cbm5GMVplTlV4TjNraHJXQkJh?=
 =?utf-8?B?TWxwTENRQTlQMGhyVjBqMUxvSUNYdHZmWGkwbkh5RzU1Nk5jaTJmWU9QRDJQ?=
 =?utf-8?B?NVJEVlNvT2JONGJXNE1YRlhjZEo4ZnZ2MjV1VG01WFU2N2pRb0ZKMWVIaURi?=
 =?utf-8?B?UDZlR2QvMVc1SDRhczNRYTFJbkRDeHR4bWRXdnc5eWp3cHpPTm9paFR0TXE5?=
 =?utf-8?B?Vnp6aTRQdEVUUTZ0TWtja1hiWTNmaCswTHJxMGtsWmloNnZrdEd5MExEN1po?=
 =?utf-8?B?alE4YzA2bVExSTFSRzJYUDN4WkhCN0xYOEFFcWxtUThCYjdJQnY4K2dWd0RB?=
 =?utf-8?B?S25ud2tJTXIybjJ6UjJpZ3ZXNVdudUNYRHdZTllCMHBvY2VVaTRNY1FmU0My?=
 =?utf-8?B?VXdFTnEyK0Q1YjQrVzJ5TmlaNTExM2dOUzdMdVlDenpQNEtJcXJ5UHBhWmc4?=
 =?utf-8?B?ZThHRzlDclpzMlNNMWhseFE5N2o4VlNBd1E1cjd6bXdXRkRyNXBJbUJSRXYv?=
 =?utf-8?B?UVpWQ2Zlc3U4ZmhXUzhOc1ZyYUNOdWlrOHZnMWVBZ2tLUjdOUGE1SHIyeS9U?=
 =?utf-8?B?RkxXeEY5VzlUQkRIT1FZa3EwQ0RoZkV6aE9rZzk4cFloV1ZHTlRmYll1Q3Q2?=
 =?utf-8?B?OE9GaW1MUkZkYVpKVmhmcW5vTVp0Z1NsaUYwY0ExVnU5YkU5NmNuYW5yM2ZQ?=
 =?utf-8?B?aUkwN2l1NjdXYmpGMzV0QWt2ZlhiM3czTzhYLyt2YmFQaWRqSzR4Ykx2UEZm?=
 =?utf-8?Q?TbeRNhtxAjCwQR/TPDjdBtXDr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd0b54e-f55a-400b-4484-08dab718f40f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 06:11:42.7616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1CE0mKe2peur0nu9de+rTql08Jgah8E6twcSFVcb8G2pAss3pTGkJAgly4UxW2uwVor2CJqSrZvP0YiqpT1TFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4512
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62f;
 envelope-from=yajunw@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGkgQWxleCwNCg0KV2l0aCB0aGlzIGNoYW5nZSwgVkhPU1RfVVNFUl9GX1BST1RPQ09MX0ZFQVRV
UkVTIGJpdCB3aWxsIGJlIHNldCB0byBiYWNrZW5kIGZvciB2aXJ0aW8gYmxvY2sgZGV2aWNlIChw
cmV2aW91c2x5IG5vdCkuDQoNCkZyb20gaHR0cHM6Ly93d3cucWVtdS5vcmcvZG9jcy9tYXN0ZXIv
aW50ZXJvcC92aG9zdC11c2VyLmh0bWwgc3BlYzoNCklmIFZIT1NUX1VTRVJfRl9QUk9UT0NPTF9G
RUFUVVJFUyBoYXMgbm90IGJlZW4gbmVnb3RpYXRlZCwgdGhlIHJpbmcgc3RhcnRzIGRpcmVjdGx5
IGluIHRoZSBlbmFibGVkIHN0YXRlLg0KSWYgVkhPU1RfVVNFUl9GX1BST1RPQ09MX0ZFQVRVUkVT
IGhhcyBiZWVuIG5lZ290aWF0ZWQsIHRoZSByaW5nIGlzIGluaXRpYWxpemVkIGluIGEgZGlzYWJs
ZWQgc3RhdGUgYW5kIGlzIGVuYWJsZWQgYnkgVkhPU1RfVVNFUl9TRVRfVlJJTkdfRU5BQkxFIHdp
dGggcGFyYW1ldGVyIDEuDQoNClZob3N0LXVzZXItYmxrIHdvbid0IHNlbmQgb3V0IFZIT1NUX1VT
RVJfU0VUX1ZSSU5HX0VOQUJMRSB0b2RheS4gDQpCYWNrZW5kIGdldHMgVkhPU1RfVVNFUl9GX1BS
T1RPQ09MX0ZFQVRVUkVTIG5lZ290aWF0ZWQgYW5kIGNhbid0IGdldCBWSE9TVF9VU0VSX1NFVF9W
UklOR19FTkFCTEUuDQpWUXMga2VlcCBpbiBkaXNhYmxlZCBzdGF0ZS4NCg0KQ2FuIHlvdSBjaGVj
ayBvbiB0aGlzIHNjZW5hcmlvPw0KDQpUaGFua3MNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IFFlbXUtZGV2ZWwgPHFlbXUtZGV2ZWwtYm91bmNlcyt5YWp1bnc9bnZpZGlhLmNv
bUBub25nbnUub3JnPiBPbiBCZWhhbGYgT2YgQWxleCBCZW5uw6llDQpTZW50OiBUaHVyc2RheSwg
SnVseSAyOCwgMjAyMiA5OjU1IFBNDQpUbzogcWVtdS1kZXZlbEBub25nbnUub3JnDQpDYzogbXN0
QHJlZGhhdC5jb207IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NClN1Ympl
Y3Q6IFtQQVRDSCB2MiAxLzRdIGh3L3ZpcnRpbzogaW5jb3Jwb3JhdGUgYmFja2VuZCBmZWF0dXJl
cyBpbiBmZWF0dXJlcw0KDQpFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5r
cyBvciBhdHRhY2htZW50cw0KDQoNClRoZXJlIGFyZSBzb21lIGV4dHJhIGJpdHMgdXNlZCBvdmVy
IGEgdmhvc3QtdXNlciBjb25uZWN0aW9uIHdoaWNoIGFyZSBoaWRkZW4gZnJvbSB0aGUgZGV2aWNl
IGl0c2VsZi4gV2UgbmVlZCB0byBzZXQgdGhlbSBoZXJlIHRvIGVuc3VyZSB3ZSBlbmFibGUgdGhp
bmdzIGxpa2UgdGhlIHByb3RvY29sIGV4dGVuc2lvbnMuDQoNCkN1cnJlbnRseSBuZXQvdmhvc3Qt
dXNlci5jIGhhcyBpdCdzIG93biBpbnNjcnV0YWJsZSB3YXkgb2YgcGVyc2lzdGluZyB0aGlzIGRh
dGEgYnV0IGl0IHJlYWxseSBzaG91bGQgbGl2ZSBpbiB0aGUgY29yZSB2aG9zdF91c2VyIGNvZGUu
DQoNClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4N
Ck1lc3NhZ2UtSWQ6IDwyMDIyMDcyNjE5MjE1MC4yNDM1MTc1LTctYWxleC5iZW5uZWVAbGluYXJv
Lm9yZz4NCi0tLQ0KIGh3L3ZpcnRpby92aG9zdC11c2VyLmMgfCA5ICsrKysrKysrLQ0KIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBh
L2h3L3ZpcnRpby92aG9zdC11c2VyLmMgYi9ody92aXJ0aW8vdmhvc3QtdXNlci5jIGluZGV4IDc1
YjhkZjIxYTQuLjE5MzZhNDRlODIgMTAwNjQ0DQotLS0gYS9ody92aXJ0aW8vdmhvc3QtdXNlci5j
DQorKysgYi9ody92aXJ0aW8vdmhvc3QtdXNlci5jDQpAQCAtMTQ2MCw3ICsxNDYwLDE0IEBAIHN0
YXRpYyBpbnQgdmhvc3RfdXNlcl9zZXRfZmVhdHVyZXMoc3RydWN0IHZob3N0X2RldiAqZGV2LA0K
ICAgICAgKi8NCiAgICAgYm9vbCBsb2dfZW5hYmxlZCA9IGZlYXR1cmVzICYgKDB4MVVMTCA8PCBW
SE9TVF9GX0xPR19BTEwpOw0KDQotICAgIHJldHVybiB2aG9zdF91c2VyX3NldF91NjQoZGV2LCBW
SE9TVF9VU0VSX1NFVF9GRUFUVVJFUywgZmVhdHVyZXMsDQorICAgIC8qDQorICAgICAqIFdlIG5l
ZWQgdG8gaW5jbHVkZSBhbnkgZXh0cmEgYmFja2VuZCBvbmx5IGZlYXR1cmUgYml0cyB0aGF0DQor
ICAgICAqIG1pZ2h0IGJlIG5lZWRlZCBieSBvdXIgZGV2aWNlLiBDdXJyZW50bHkgdGhpcyBpbmNs
dWRlcyB0aGUNCisgICAgICogVkhPU1RfVVNFUl9GX1BST1RPQ09MX0ZFQVRVUkVTIGJpdCBmb3Ig
ZW5hYmxpbmcgcHJvdG9jb2wNCisgICAgICogZmVhdHVyZXMuDQorICAgICAqLw0KKyAgICByZXR1
cm4gdmhvc3RfdXNlcl9zZXRfdTY0KGRldiwgVkhPU1RfVVNFUl9TRVRfRkVBVFVSRVMsDQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmVhdHVyZXMgfCBkZXYtPmJhY2tlbmRfZmVhdHVy
ZXMsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9nX2VuYWJsZWQpOyAgfQ0KDQot
LQ0KMi4zMC4yDQoNCg0K

