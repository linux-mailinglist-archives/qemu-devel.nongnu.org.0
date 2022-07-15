Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FD0575889
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 02:11:51 +0200 (CEST)
Received: from localhost ([::1]:38746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC8vt-0003Dc-MA
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 20:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tina.zhang@intel.com>)
 id 1oC8uR-0001mF-Fe
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 20:10:19 -0400
Received: from mga12.intel.com ([192.55.52.136]:48869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tina.zhang@intel.com>)
 id 1oC8uO-0006V6-81
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 20:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657843816; x=1689379816;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hsRcNWpuHSeSl6MQR5XSUYAATZj2iuG41H8nInuZYA8=;
 b=Y9AgMTOs9FFSK+5/G6JmwpbWRGSBH4naS5paJyYSvzEiMlRUJUTXpkUP
 oJUfv7pVPGqmpOBRcGppbuPJFyOutpA9fjPlDzPP92A5Usutw25L386un
 G4GQ4vSrKr3QMJl1+2JsWpbzuJHu+hpes5GrGcvKCCmq+Vbh+rZO1k6QX
 fb8XUKzMMbmhxCK4J7iq9WVF+FLzWUwG7wECUljp4+Isp/+qGnWMj6cas
 EUcNYnIFSD+/Ygm+zoAKZmGRJCydDRdmMD4ixROZHK6EEatx104wTmMMH
 /6Xdz3ON0gPSLCj0BR8QO2M5QANMcaT6Zw8NNylItOXsi+ejFNyU5UM85 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="265452506"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; d="scan'208";a="265452506"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 17:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; d="scan'208";a="738465656"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2022 17:09:25 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Jul 2022 17:09:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 14 Jul 2022 17:09:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 14 Jul 2022 17:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk6t82dq/dcLEbQyfFS7jJgwZAi6Ln6h4BWT/+kXFH+KCwYVnka4rmh7RVBz3jDVgx0v6eUB3920wWrnP8S4s7HFG/ZfzxEdBo45vDkJoUJnQloy1YxVfLW0sCDAgkrlPKelUu6TdPFH2N9CYjW6nq/LcNxXhEC3umfuoWKbu5dccixHpu+JGvlWnbArRi/be6+Mr54apaKo6j/sKgO6jJdjbzaAS57ejsvty9J07Q6HefTIzbpC49YxcfaBBwBeA5XqDoeHTaIpVuxEGrpf/XdYRaOCh/HestmCQ2ZFTYcMpestFDP+Dim7+k2qTeoZVdlFVFlRZ7jC73ZL02wReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpwvgvYw9iQaeTL8kqN1c1HuV3MZVQCaP3Whqh1m0pM=;
 b=TTKsoFH6C9drQREUVCTEgwQYzl7eORlwNs8u+tEFV206YNxYwzQcuUHK41uEoEn8yRgEPnvuaVphpC230RyENyj4HQVW/bSLpxF26/JYXTM1Esa/mLtCE7GZo4AcDPbhC5S8aYddIr6i+y+9fxzjnZ5IPHpd25KoAIAEBILz3QvhqgStWiq+h5/+VQ3WXaPtKaRwH+7ajRwjJktYVgTPIB9gLSGNDmMYUsfopRWPwmkYvv+Cz051KeNw1oX3O0dy6VsQ89rWRqC6NfRftyFttFGQV5kPuSSfgTmEgRDXffQj/h57QlMkpX4d0W+K5lbktaIxnl8wi5o/wPM4KWP0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5881.namprd11.prod.outlook.com (2603:10b6:303:19d::14)
 by DM8PR11MB5574.namprd11.prod.outlook.com (2603:10b6:8:39::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 15 Jul
 2022 00:09:23 +0000
Received: from MW5PR11MB5881.namprd11.prod.outlook.com
 ([fe80::d0ee:e2f8:e7b0:e24a]) by MW5PR11MB5881.namprd11.prod.outlook.com
 ([fe80::d0ee:e2f8:e7b0:e24a%4]) with mapi id 15.20.5438.012; Fri, 15 Jul 2022
 00:09:23 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, "eric.auger@redhat.com"
 <eric.auger@redhat.com>
CC: "mst@redhat.com" <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] hw/virtio/virtio-iommu: Enforce power-of-two notify for
 both MAP and UNMAP
Thread-Topic: [PATCH] hw/virtio/virtio-iommu: Enforce power-of-two notify for
 both MAP and UNMAP
Thread-Index: AQHYl2gExLRYw9Cd4UOkvUjycJdB7a1+jkNw
Date: Fri, 15 Jul 2022 00:09:23 +0000
Message-ID: <MW5PR11MB5881B65DFAC3710620AB0C0D898B9@MW5PR11MB5881.namprd11.prod.outlook.com>
References: <20220714095418.261387-1-jean-philippe@linaro.org>
In-Reply-To: <20220714095418.261387-1-jean-philippe@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e600b7b1-8104-4a64-235d-08da65f645bf
x-ms-traffictypediagnostic: DM8PR11MB5574:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q2bLnQdJN8a9F5OXj5E2zc9waqZs8vXA+q6bQU/ggUpXmfvOFtBXDlLbWg/QC8QCeIxxgjhjV9iXB20Y2hYTE4orcouop5Byo7HBcYb1HE+kEN0+Bs6yC8aQ6GRBROpBVt36VVcXR3P5QhCe4vbQQpSel9pyHgYLgeEbd2PY2y4eVi71Edn0QXK3uCV5L1anyGf2a4Hp+P8N8KSVXQJ3Pbps36ST9NnJ0eW09DdlQHsX+70efFbcbRWOSVXSczpJCNo3ZX851qoOUfbxbaOH6zQO3cqqC3C4XKzceyNkdFDUwgFXxjWPOUdaY0mED5Np5ZGBS9UNJ+C4GVEHthBpgAZL7fJ298PLijMkXg2ZfUbaEI2kNWmoFLUWAAB+0yvlveqHWedJPD2LUf2TU+FmTInxWVu9CN9jkNX02aauO6lDppiNvUZuvTbp1mHPBHM23T0GPHDoOOICCnqm3DJqI5LLhgVVjtV8cfP+rp72og8AMgV7e6p0qYanr2t1rs547cZrOzgWSsjRnWu39j4v8QqVbprX4DcOhipDdNjdecDmRtOsgXgF+/ZM0W/WMMwm4iFEnCvE5nKG2egIoY/x/EHLbzJ/enf7b49/xzGXsGBOKBEuFhQNuzW3GeUEsKk74f8opxHgrKRWc1Vf0Z5nv4F8C/KMO14vLQAMiKMIsJkQP67FHb0FL+pI/uKB7+o0MjF9m/zFYFAHQH0nuIMkV+pr5h2KJ+khpZ64ICTpPkNiU377RdV5jJdeVUh7HyBOypkmEJn/M85QldfoM7iJQiTU2LJm+oBkDaznKs4kZswLHHVQyTqViPkC/B7jicLfn4bgNs71sk9j+DDHrlF45w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5881.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(39860400002)(376002)(346002)(136003)(8936002)(122000001)(186003)(83380400001)(55016003)(66946007)(66476007)(38070700005)(66556008)(38100700002)(478600001)(82960400001)(33656002)(4326008)(41300700001)(53546011)(110136005)(71200400001)(6506007)(2906002)(64756008)(54906003)(86362001)(52536014)(7696005)(316002)(26005)(66446008)(5660300002)(9686003)(8676002)(76116006)(9126006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JM8LKQQNHTYMhS/gN9qkn2f0BagJtEOaQ3wHPd4hpJS2gxGJH+ViVr/BCw6r?=
 =?us-ascii?Q?UqdzInhLUoGDkOzwJaay2HiUotXFzZDf8R05LTU7bMVGl7Xl3yTFkG5ZrAiO?=
 =?us-ascii?Q?+L+Rw0YWb2fmQuh8WfXSwUQ6yqWlZffZLYgMBPy6KKYtm+nHMuO8DLPnBqDv?=
 =?us-ascii?Q?ffEzegwIy7gUyA1oYf8Ur2PNa85kaj1mHNSIPK2o5fG9D5/2ri5pJ9iqkbC2?=
 =?us-ascii?Q?uK4x6+aAtoN23UlLeYvSCy/9Cms1sOey46nZL3TRGs/ZLUGs72vteYf3PE7x?=
 =?us-ascii?Q?rZEdwapbzsOejOfsKsrk8eYpdfb3/UKXy+RpYVoZFl+kmTD8xgHOWKYHRuUT?=
 =?us-ascii?Q?Mx/EGxfOauAJy8ky/muzhwQKUsMSsyDdypckKque6UKlYawcfe3Vh4UP9FwC?=
 =?us-ascii?Q?PRMed46ckI7rQG1PF9CPboAn6nXen5NK8rrQKzaAU87ztS6bX4qFuH/BtV8D?=
 =?us-ascii?Q?LnsH1e5pL26A8WpqL59unVlhXH1XbZ+STguSxKRMxYrTe3z6JxrDxQ06/O/5?=
 =?us-ascii?Q?lqJiy6Wg+ILeVasBMfwdwOnmUX7SSuKezD7yQZPiE7h0bha93mqeUJjNdNFu?=
 =?us-ascii?Q?WKGHOTE/rudgY0wLDciYkGD1q+B+o/8/QUgN9mIoCFpkMdb+DWTTEk4rshXI?=
 =?us-ascii?Q?STxpxh/i29ZED2iTtUtYex48tBdHVn23ia8Bu6njC7HUNM5IE6Sr1AVvvVJl?=
 =?us-ascii?Q?z/AVstCXQKGohzPRRA2gB2+BJ82DTMWm82GEweTMBOi8EvXFJYrz+5Jn8sTb?=
 =?us-ascii?Q?KUpuntng7YLIxPLAvIHtLGbHDwtgQnpnsl3Lfw7luelvzb5qXkjtQuFHM9ie?=
 =?us-ascii?Q?IqvPZOeYa+G2E6d6ab1jzT/WdqQ2uGjv2c7lC7KAuf1OkXPVNa2G/Ye0rEfZ?=
 =?us-ascii?Q?tZbn7vC8IZGkZfgB9GnNgTggFp+XPxsb3fwndd6p1PG8ztt2Xxa8PXfgVyHt?=
 =?us-ascii?Q?u809MNCY7f6BYT39Lcf1VK9IFfCThiY0cVYiAy4DYPDVdlFECgItVVLF1esQ?=
 =?us-ascii?Q?n6G0ELFwxd/pFKsMpct4xtWXjlPmd6FPAh+b8HJiV2QfDWy3zh7MaChmP7lp?=
 =?us-ascii?Q?Web5gPWjV/MksdC2qGwAHnJrm5BKB5EYqOEa88ALUxq5O0Z+59BAEAoN4djE?=
 =?us-ascii?Q?1xUXyJgmJl29fqU+svzHpR29MO99q66PzA5thYYD/stH2jmzOZEj+fQ9+RIQ?=
 =?us-ascii?Q?oOdFSsB8VXReQg9e0APOd99824vuZgXiPt+9GsFrtlafSoExkXqXsOTOJpXl?=
 =?us-ascii?Q?jsfG6w/2QyWPohbxY4csw893JNxDTP8rC36iJFLLcZBa4pixaYwat3DbEJ6v?=
 =?us-ascii?Q?YOQUKglspO08WxXzakPVJpkPkrJYO86H1ovO4lBY9yBwWVCI/oLsDN9U6HGz?=
 =?us-ascii?Q?H47eX4YbXuJtCg7sLjV+jKwgBbrnl3T634lYemiLG3UpOfrTL/veGx76D9MS?=
 =?us-ascii?Q?oBN08mGGnVEiE7eVjh5L0KHbDt/vtDhbJybJ2iAwu+T61W6N+Zg3uAU2vMz/?=
 =?us-ascii?Q?K2CxlaAgsIdfv/s57m840b62Y+e/Z+30uesbZ7yHkLrL8rhb9XU/KTNHwWY0?=
 =?us-ascii?Q?zXq1bvbeICDINXZyvrBI4j63za7WeMT3C/LmiwBp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5881.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e600b7b1-8104-4a64-235d-08da65f645bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 00:09:23.2704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NsEkf1enBLd7EIflrr14vC1FkWF+OLdrbL2fbJ+x3gObPii1aHp4qeKhvprkTGH1DRU2kpN3SBAQTbX9/xsf2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5574
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=tina.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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



> -----Original Message-----
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Sent: Thursday, July 14, 2022 5:54 PM
> To: eric.auger@redhat.com
> Cc: mst@redhat.com; qemu-devel@nongnu.org; Jean-Philippe Brucker
> <jean-philippe@linaro.org>; Zhang, Tina <tina.zhang@intel.com>
> Subject: [PATCH] hw/virtio/virtio-iommu: Enforce power-of-two notify for
> both MAP and UNMAP
>=20
> Currently we only enforce power-of-two mappings (required by the QEMU
> notifier) for UNMAP requests. A MAP request not aligned on a power-of-two
> may be successfully handled by VFIO, and then the corresponding UNMAP
> notify will fail because it will attempt to split that mapping. Ensure MA=
P and
> UNMAP notifications are consistent.
>=20
> Fixes: dde3f08b5cab ("virtio-iommu: Handle non power of 2 range
> invalidations")
> Reported-by: Tina Zhang <tina.zhang@intel.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/virtio/virtio-iommu.c | 44 +++++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
> 281152d338..f3ecbc71af 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -197,6 +197,29 @@ static gint interval_cmp(gconstpointer a,
> gconstpointer b, gpointer user_data)
>      }
>  }
>=20
> +static void virtio_iommu_notify_map_unmap(IOMMUMemoryRegion *mr,
> +                                          IOMMUTLBEvent *event,
> +                                          hwaddr virt_start, hwaddr
> +virt_end) {
> +    uint64_t delta =3D virt_end - virt_start;
> +
> +    event->entry.iova =3D virt_start;
> +    event->entry.addr_mask =3D delta;
> +
> +    if (delta =3D=3D UINT64_MAX) {
> +        memory_region_notify_iommu(mr, 0, *event);
> +    }
> +
> +    while (virt_start !=3D virt_end + 1) {
> +        uint64_t mask =3D dma_aligned_pow2_mask(virt_start, virt_end,
> + 64);
> +
> +        event->entry.addr_mask =3D mask;
> +        event->entry.iova =3D virt_start;
> +        memory_region_notify_iommu(mr, 0, *event);
> +        virt_start +=3D mask + 1;

Hi Jean,=20

We also need to increase the event->translated_addr for the map request her=
e.

Thanks,
Tina

> +    }
> +}
> +
>  static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr
> virt_start,
>                                      hwaddr virt_end, hwaddr paddr,
>                                      uint32_t flags) @@ -215,19 +238,16 @=
@ static void
> virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
>=20
>      event.type =3D IOMMU_NOTIFIER_MAP;
>      event.entry.target_as =3D &address_space_memory;
> -    event.entry.addr_mask =3D virt_end - virt_start;
> -    event.entry.iova =3D virt_start;
>      event.entry.perm =3D perm;
>      event.entry.translated_addr =3D paddr;
>=20
> -    memory_region_notify_iommu(mr, 0, event);
> +    virtio_iommu_notify_map_unmap(mr, &event, virt_start, virt_end);
>  }
>=20
>  static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr,
> hwaddr virt_start,
>                                        hwaddr virt_end)  {
>      IOMMUTLBEvent event;
> -    uint64_t delta =3D virt_end - virt_start;
>=20
>      if (!(mr->iommu_notify_flags & IOMMU_NOTIFIER_UNMAP)) {
>          return;
> @@ -239,22 +259,8 @@ static void
> virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
>      event.entry.target_as =3D &address_space_memory;
>      event.entry.perm =3D IOMMU_NONE;
>      event.entry.translated_addr =3D 0;
> -    event.entry.addr_mask =3D delta;
> -    event.entry.iova =3D virt_start;
> -
> -    if (delta =3D=3D UINT64_MAX) {
> -        memory_region_notify_iommu(mr, 0, event);
> -    }
>=20
> -
> -    while (virt_start !=3D virt_end + 1) {
> -        uint64_t mask =3D dma_aligned_pow2_mask(virt_start, virt_end, 64=
);
> -
> -        event.entry.addr_mask =3D mask;
> -        event.entry.iova =3D virt_start;
> -        memory_region_notify_iommu(mr, 0, event);
> -        virt_start +=3D mask + 1;
> -    }
> +    virtio_iommu_notify_map_unmap(mr, &event, virt_start, virt_end);
>  }
>=20
>  static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer valu=
e,
> --
> 2.36.1


