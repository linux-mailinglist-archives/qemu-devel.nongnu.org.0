Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EAC4523D6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 02:28:38 +0100 (CET)
Received: from localhost ([::1]:37766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmnH3-0000mR-3L
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 20:28:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmnFg-00005C-Id; Mon, 15 Nov 2021 20:27:12 -0500
Received: from mga12.intel.com ([192.55.52.136]:57226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmnFd-0005eP-Qn; Mon, 15 Nov 2021 20:27:11 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="213629604"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="213629604"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 17:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="604115689"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 15 Nov 2021 17:26:41 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 17:26:41 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 17:26:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 15 Nov 2021 17:26:40 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 15 Nov 2021 17:26:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh0xRbhI8E8ZXzjtWV9sgNVEQt7+ykFDS92AbDqkeGF9LVonwBkEatEbR+Xt+t1/2wDKxKeZp6RNYls9gFHz/UlWM8+AodWSbk/53NwLvYEDYkjK07slgJ5n1W5qhMXghOE1rFQE+XpzUgwWNAPhG99rU6Te7VMaGjeCSPysoqkTUviU+qe07B7zFI1EH0eZJ9ejg8FUTTBsi8igwbDH9oaMy63Z3dokcqQzapQMWzjdi4bZgRDp30Eu+zlMPSA1gQIDpR2VwS86GMuPVMDv8gWmkLf+7F1E9N8YSzbpcezZ7/e9ZBrHRAkCdg9Pyh5EMBIN0cLaxAXRBx5OH6T37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKWvNAsKRUPhIKLPSrc8bnPT4uMX7s7EUeS6UzHOjfk=;
 b=cBtgw6EPfAN/FGxYOfujDNKj8NF5haiFxo6L9CFicqhqpFmDLrTsoZt49ax1FKJZYwSVQYEfcs8nq37GPMVG6asXehFzhHvP0CStRcObwHWj/AIYirKlrs8hipzrXk6xT75fvj+HwHZ2qOUwp5zv4zXO7sZ/h+Jwvu8zV+boHAb6tkbTwqHdgaHLMIiyKtEy8u3PVplDmOoQFPpwAOrsLBdLYccolu4I1lS+8pJWxr/IU7E0BlUfTYSg27IAE3BqeT3EslrYf0Fle1XcGi5kltgSLaqQWxCSsDI9qu7vJWXkjA2ZUdlIiPRKSc7f9bl9hGSHO5ULUP2rnbUjPr1aUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKWvNAsKRUPhIKLPSrc8bnPT4uMX7s7EUeS6UzHOjfk=;
 b=sTGyA55qs6JRBGR5kh20Vv/gPSH5BjRBzfsjzMrJcy0KArtBPQDFaM/Vo6L+y4v2bx7fEzZfKZ3ilRmVFBcn2Xe1VVXmK1q6At+PJNxCNtlzNuyPzPzCSGIvJsLBDyizbHAcVdDd6cjok051WyMEGFSbPU6QTqXz9zpv+StE8CY=
Received: from BL1PR11MB5479.namprd11.prod.outlook.com (2603:10b6:208:317::18)
 by MN2PR11MB3966.namprd11.prod.outlook.com (2603:10b6:208:13f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 01:26:39 +0000
Received: from BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3]) by BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3%7]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 01:26:39 +0000
From: "Qi, Yadong" <yadong.qi@intel.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: RE: [PATCH 2/2] virtio-blk: support BLKSECDISCARD
Thread-Topic: [PATCH 2/2] virtio-blk: support BLKSECDISCARD
Thread-Index: AQHX2dzbzzrtmm1d0kC8epzjRyQo16wEW4WAgAD8ZhA=
Date: Tue, 16 Nov 2021 01:26:39 +0000
Message-ID: <BL1PR11MB5479F9C7E368DF3A8A8D15FCE3999@BL1PR11MB5479.namprd11.prod.outlook.com>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-3-yadong.qi@intel.com>
 <20211115100031.x2qmoi7f5e2rrtbl@steredhat>
In-Reply-To: <20211115100031.x2qmoi7f5e2rrtbl@steredhat>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 046cb9c1-d2df-4691-1d73-08d9a8a0239a
x-ms-traffictypediagnostic: MN2PR11MB3966:
x-microsoft-antispam-prvs: <MN2PR11MB3966DB08C78F5E2209919310E3999@MN2PR11MB3966.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oQgwqJPEYcL/p/lV7uXZkxzmRrYdZCWOCLxGmUtCxe7DRBtuhLBe+sbrQmEX7qP8SRtmNd8nwdTizk8PNA3SFQDOOZgSnYZZUpB6MytIcQPpdkR5BWB+8piM8q/CNrmtwg8Y0ZBREwfFoEVzXoC2V5gGnFIBM3Oz23QyauxGCDuAzCjZfIF02okqGfoIaz4hT60ovjIn16xStUQAS0oEPaf8KjfCqxdzR4VwFjRdH9atJ24m4KdY1PFgQtxeNqkRG7OEiqQ7GyLE4sP2l688XI3aaClIVJDKXp70csKyk5dRsxobu21j/p5WYpi3kr3s+mgHz+n7D3dizLV8Sv/ZocvJhi6UWmUjOyKDjZS0D+EtflvOGvPkmjWu4IyeSdRkatVIUSDSEZV/sI6kOE0/jpWyHRbXeMbtrG2xZKlM8NfE4/v8vJjAhALY2ZxziVcU9mfqrlZztBimF10BEuBrjrnrzxt77xQBAoi8TGADoHZzLkbzmh1tX58QHAyPx7WiBOg0/xLmaxLlDhp2fRJKGTaQf89VGhOa5YKG67+2/qElaTYZ/5l/QQcnhuG2ZHbdv3pOZb3/fLDPpbXbSW8t8nyfNkji91P3K0ylrOgaFZBa0hgIxRAOIfo9Xu6d0OyfSodTVH7jH2ecsAbJ/hk3QCJIcJhXRcHaP0pgikJsJwJiWGA//Dx/HgoFpXq9h2KSOmbzPOKijEUn1uV5R3KodA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5479.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(66946007)(66556008)(66476007)(66446008)(64756008)(6506007)(83380400001)(2906002)(38100700002)(122000001)(55016002)(5660300002)(82960400001)(38070700005)(33656002)(26005)(76116006)(8936002)(71200400001)(6916009)(186003)(508600001)(8676002)(7696005)(86362001)(52536014)(9686003)(54906003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PFRNDvh9G4y1TGtKbeAG/Ewb62pnKb0p8kXBjRvcHo8xDRm0EtRuGL1yK0g5?=
 =?us-ascii?Q?Sn2SG4e2t+IF9oW40O81fLcaJ72jJeBfiBzoL1sRTWW/PgPXVIl1w6ieldhO?=
 =?us-ascii?Q?Rt3FVqoa/17a+YDdlFrXOS7WDC+qLZc0FWCvR4zH0JIQ/RNfHqNkVyr4EAp8?=
 =?us-ascii?Q?fvHGzUB4yhXqWfMhw7wnAIzYj2WrFH3Oinq5LNMFBfsvhTETkUdAs/zq1Zfh?=
 =?us-ascii?Q?U0s8OEnrDJ4GJwXCE9S4v/vVHUndET3JReKYJRPI2JAvqFHxS+Ga7ROVRmoh?=
 =?us-ascii?Q?UNbFWRoKP0BslaRDoGsi5ifX3gubBNsAO07Q6ZD9Pf6Pkb33fV9IW+CR8LW7?=
 =?us-ascii?Q?okhexAIEPC5Jr5yq9GYD/Zzm9A4g1jV3Yjvq90CtPvqrb/0LFgoirS8b35xh?=
 =?us-ascii?Q?ax4aI5QIyDmzcYnl/zkB+mn9bbVVw27bfFGUOzeyAPMMdxDYfARL7v3wXzX8?=
 =?us-ascii?Q?YJN4+gTYyWPUbRaEuzLIGp2ddGwcaM0EkvR4wuWjAOsKVF7zR+CeYne+db7S?=
 =?us-ascii?Q?hZOk1B+i5X9oVzyi6cdV2lZ/Z8CVNCWsAQjA/5JGGXjqWojFrqdMYlJGnDJ8?=
 =?us-ascii?Q?sUIgvO1DWexfFZNEwbOsodDVZ99cqFcCoiJ8xBOH32u9b8IN1l2onC5qNnaV?=
 =?us-ascii?Q?5ZZdutQUFSWHHXtdfFvSUQAhvZ8LVARn9B6bDKY5RVp8vHIL7thDnwRbmr/W?=
 =?us-ascii?Q?KEqyg638lPnLoMjEWwJriiBZ782OIwra+XpEhJADNhRT/HC+FZywo2W6mLfh?=
 =?us-ascii?Q?S5feS7ojreGPy66n9Mher74JfKYoYHnDiHFXtOHNtVtp0s/OVabrUs6xP9+F?=
 =?us-ascii?Q?D67FURUmAHpNAAvX6ypFQIWHeRax7l4YyMtfDagFkbn62494pt/BbaEAffYU?=
 =?us-ascii?Q?Fm32AKMwYI5Z55v01qBqMf/e6HN1vc4wNIGhxayRZHJlY6DZ9loIJ8QT1aNF?=
 =?us-ascii?Q?iBPZ/rJ05TCftU59Z08KbC1OjVTc7HXRLjsBDBJ2PBtMhc4BBuZmBiqSdufY?=
 =?us-ascii?Q?E7rrzaAg118yhJ67D3QuFba9EJ4h8AWsWmx1tITiaCc/r9MlrwykI4AbB7Ps?=
 =?us-ascii?Q?QNguX4Zor/Flf5hTzuc0xtm2zMgIDc6pBcwrGnoH2AdcvjUqnPk28sh1pTpY?=
 =?us-ascii?Q?HZ/nRD8tY5NMbIW1yb6nvrg+AMPWaacYEK4hWMhEVUIdsFIDJw5+AQtePVZg?=
 =?us-ascii?Q?5bgTkH5gWTezqszwtjNFWI7dWBgxXWIo+gVI9R9soyrQouP1vystZoyb7JP8?=
 =?us-ascii?Q?cM/Ml3Zn/cxWZ9zt3ZztU3uQg6HHW2hPS0EiVJnWRYohKc8Bq5LQHSFk5Iuv?=
 =?us-ascii?Q?bXhdTRGIcp2/76vG7GYbbvQxAfBoIRasKctHifwWMmmV+d7Q0R35SaBySakU?=
 =?us-ascii?Q?ccdACo+5cXoL5gw+al6CSfsGfe/dETNAYRRDmhLyH7l4BWVSmA2uP5e9FXhQ?=
 =?us-ascii?Q?RL7nh3TGIru8QVyEIpnAjturYk50XJuvoUSz3/qXkKtTcthgd1mKeJfCtZb/?=
 =?us-ascii?Q?/1Rr+u2NOolW7iFKLPLq+mXmefywkb6UJjZGKpySO+GPUSNJs4A38ZveUcZc?=
 =?us-ascii?Q?bTa2GqoQ+qyw8PtCRG2ddrGmKa1ZLU8Dp+wKzb9ldfdePCvcfpjF8dsGXc2S?=
 =?us-ascii?Q?RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046cb9c1-d2df-4691-1d73-08d9a8a0239a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 01:26:39.4086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hGmV+aO8sFrfGyO2NZFD3D9nwLKprZlyjOCfQ2Lh0nyFQGsgbvzLN8tNHAEDu22UZ8on3b3cZHiuAHUdSMYnZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3966
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yadong.qi@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "Chen, Luhai" <luhai.chen@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang,
 Kai Z" <kai.z.wang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >Add new virtio feature: VIRTIO_BLK_F_SECDISCARD.
> >Add new virtio command: VIRTIO_BLK_T_SECDISCARD.
>=20
> Has a proposal been sent out yet to virtio-comment mailing list for discu=
ssing
> these specification changes?
>=20
Not yet. I will draft a proposal to virtio-comment if no big concern of thi=
s patch
From maintainer.
> >
> >diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c index
> >dbc4c5a3cd..7bc3484521 100644
> >--- a/hw/block/virtio-blk.c
> >+++ b/hw/block/virtio-blk.c
> >@@ -536,7 +536,8 @@ static bool virtio_blk_sect_range_ok(VirtIOBlock
> >*dev,  }
> >
> > static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *r=
eq,
> >-    struct virtio_blk_discard_write_zeroes *dwz_hdr, bool is_write_zero=
es)
> >+    struct virtio_blk_discard_write_zeroes *dwz_hdr, bool is_write_zero=
es,
> >+    bool is_secdiscard)
>=20
> Since the function now handles 3 commands, I'm thinking if it's better to=
 pass
> the command directly and then make a switch instead of using 2 booleans.
>=20
Make sense.

> > {
> >     VirtIOBlock *s =3D req->dev;
> >     VirtIODevice *vdev =3D VIRTIO_DEVICE(s); @@ -577,8 +578,8 @@ static
> >uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
> >         goto err;
> >     }
> >
> >+    int blk_aio_flags =3D 0;
>=20
> Maybe better to move it to the beginning of the function.
Sure.

>=20
> >
> >-        blk_aio_pdiscard(s->blk, sector << BDRV_SECTOR_BITS, bytes, 0,
> >+        if (is_secdiscard) {
> >+            blk_aio_flags |=3D BDRV_REQ_SECDISCARD;
> >+        }
> >+
> >+        blk_aio_pdiscard(s->blk, sector << BDRV_SECTOR_BITS, bytes,
> >+                         blk_aio_flags,
> >                          virtio_blk_discard_write_zeroes_complete, req)=
;
> >     }
> >
> >@@ -622,6 +628,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq
> *req, MultiReqBuffer *mrb)
> >     unsigned out_num =3D req->elem.out_num;
> >     VirtIOBlock *s =3D req->dev;
> >     VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> >+    bool is_secdiscard =3D false;
> >
> >     if (req->elem.out_num < 1 || req->elem.in_num < 1) {
> >         virtio_error(vdev, "virtio-blk missing headers"); @@ -722,6
> >+729,9 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req,
> MultiReqBuffer *mrb)
> >      * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch sta=
tement,
> >      * so we must mask it for these requests, then we will check if it =
is set.
> >      */
> >+    case VIRTIO_BLK_T_SECDISCARD & ~VIRTIO_BLK_T_OUT:
> >+        is_secdiscard =3D true;
> >+        __attribute__((fallthrough));
>=20
> We can use QEMU_FALLTHROUGH here.
Sure.

>=20
> >
> >         err_status =3D virtio_blk_handle_discard_write_zeroes(req, &dwz=
_hdr,
> >-                                                            is_write_ze=
roes);
> >+                                                            is_write_ze=
roes,
> >+
> >+ is_secdiscard);


> >
> >+    if (blk_get_flags(conf->conf.blk) & BDRV_O_SECDISCARD)
> >+        virtio_add_feature(&s->host_features,
> >VIRTIO_BLK_F_SECDISCARD);
> >+    else
> >+        virtio_clear_feature(&s->host_features,
> >+ VIRTIO_BLK_F_SECDISCARD);
> >+
>=20
> IIUC here we set or not the feature if BDRV_O_SECDISCARD is set.
>=20
> Should we keep it disabled if "secdiscard" is false? (e.g. to avoid migra=
tion
> problems)
Yes, BDRV_O_SECDISCARD=3D(secdiscard=3D=3D"on") ? 1 : 0;

>=20
> Otherwise what is the purpose of the "secdiscard" property?
I cannot find a good method to detect whether host device support BLKSECDIS=
CARD.
So I add this "secdiscard" property to explicitly enable this feature.

Best Regard
Yadong
>=20
> Thanks,
> Stefano


