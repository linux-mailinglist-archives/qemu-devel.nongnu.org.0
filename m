Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A79F3D87DC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 08:27:07 +0200 (CEST)
Received: from localhost ([::1]:56560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8d21-00065u-Pt
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 02:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m8d18-0005RP-AF
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 02:26:10 -0400
Received: from mga03.intel.com ([134.134.136.65]:63895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m8d13-0004RB-ST
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 02:26:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="212622115"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="212622115"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 23:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="580570355"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2021 23:25:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 23:25:58 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 23:25:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 23:25:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 23:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WL/zw7M+b5RIaU1K9411/Xcl0ys35KCUoPC/DBrp0ofU95wVk98mlStMNtj6tP30iAsOLCJjBchpBvTBieBJUwcCndUXHEjW/8ZndjIqJucTsesF9tAe0BMn54Ganss6L4ea+0eky9U68yBmneayXyQV6mn5pwVj/f5VeTp8844GXAjtj5PZlCshowM8D+/FEiGm+FhWG1BpgISSE2ij7OvcrmWcSPbjURUde+q/OPV4WtBKcfviLjf1k76Loi9dPAPGPO7lmG741wuIgY9fggRjvDy7h/s7F55iz54crXq5QwVg2oFWZhgE3bTGve4kb2qIchiUsvZOOfDs2tSQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8c7Sm4cbvsPOGP0hduetXNiLhJjIJQRT8rqnMjqd+Ck=;
 b=bTAUO6spg05cy+qND+lmZPE04uK0TrRs5/iLROWUIwVZd9kSyWaiFD5aJF1LHGHLPRzY0vFYHQridooFZp2A26zA3+XrIoQjzDR4Co51cKWSCRhaNMF5OzO1ac0kIgTCvPK1+SO7eotuKrqU7fupU8JCPmLxggrPmhttACBAc80ndvSQRfw8XeCj0XQfpH8faBBdEp4CBJbO7qdWRZZ4cv9yfmAjNYIul51VZx7EQtFuxvO6/VJjeqqDv2q1QgXx0nW+I2oxJQz6wM2d1MudAI5G1jy4w61DQ3qK21OiDB4/uLXA8Oi40TxN+FIGoFu7v7lV5bQZ1KAEMHwIHTogIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8c7Sm4cbvsPOGP0hduetXNiLhJjIJQRT8rqnMjqd+Ck=;
 b=HgcLj2BwYSu+guy5SCgy3OkRZadWIX0WIAu2ZwXnhJxkPSp9kTez2wrXKf6Nt/h0Ky0BaS+peNZ6y/NKhDzruHEZK1/CONibmunjVNBzKQtRC6iuLPflBcscRd8TE9lFr45ltQiMFmtnb208IBh7Ih42EopEjasV22O9CKcdxCQ=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 06:25:57 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d4a2:4607:7235:c6f6]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d4a2:4607:7235:c6f6%8]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 06:25:57 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "lizhijian@cn.fujitsu.com"
 <lizhijian@cn.fujitsu.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH 7/7] Optimized the function of fill_connection_key.
Thread-Topic: [PATCH 7/7] Optimized the function of fill_connection_key.
Thread-Index: AQHXYyQTVVpJAW0BlU2ZvMrofI1ElqtYLDbQ
Date: Wed, 28 Jul 2021 06:25:56 +0000
Message-ID: <BN0PR11MB57576E92F0C366C9E86D73FD9BEA9@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
 <1623898035-18533-8-git-send-email-lei.rao@intel.com>
In-Reply-To: <1623898035-18533-8-git-send-email-lei.rao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1091fc9-0f2d-4ec0-42fe-08d951908f4b
x-ms-traffictypediagnostic: BN9PR11MB5354:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB53540AD1EBC99EE0D92965399BEA9@BN9PR11MB5354.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:164;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ry8WWboCZmbs9vshp9VYpe1nZ3MLREGdlV08/pcDPH5w9aNfaoqydkKHfQk5aq/8DUMl5UcwMaTD2gA/z1OpnXbQjydilQjdSWNLxo96mos1LIrlFhIhTYn7j3AiW8gkSOaMCWg8uI2sAM/UVPpLVzxZVbzdp2xVJnYhMYb3hSop289lI5e6ivJil3DczRPDI59oBpyMR5xGnuE5ASOc8DvjeM1QIAlHyVgmVVnNygGLGYMyB2IYgrop6IiY2/RsHQpctdKiebtZa5UvLi/ZhoIoTcIcLBG/AbcNe4fNCuih8SVQ0SkTbunPjM29qOStge2FyfUVv7jRFsWOdBvxxgVFXmD14ggtQP8cMvKxYN8Xq354AmaaVwBx+71BoQSpHixcrYVaJZL0fGRCP5MdH/JbdWz6nqxnYadvPBLjYuBuziY3nm0Wssv5paSGeQL2c1Qk+zO8/Jz5HPJFJBk7M7nwoBZuxslBqBG8udL/HIp2rp8muwqPoja6Cq7fyXo4/SjZLQZktaHDh0ufZJIzHt399Gnrgwaf5ygVbf3DbA6Ek4FomYjR9eNIwIuysbTLGYnQJ5MjueX0pZUFhQ22p3FQcZ/HDluP1iwKIau2sDbqJgSESswA2tMvtWJ8IGTkQM1M+CHf3xUYzB8fZW8Wgj2WFYYFYar2Z0NHReavagFfr2iw75JIGRj2GkNgZDlybNF4kTDsJFxck4XoYEgMqQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(86362001)(2906002)(55016002)(9686003)(8676002)(71200400001)(8936002)(38070700005)(4326008)(66476007)(7696005)(26005)(110136005)(478600001)(66946007)(6506007)(5660300002)(316002)(38100700002)(53546011)(33656002)(66556008)(122000001)(64756008)(186003)(83380400001)(76116006)(52536014)(66446008)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sdi7BeFKRzukEiUdauz1LRp44hj48uOW7pxCLVJIIqDX9dgLiULu9ekyQ6bn?=
 =?us-ascii?Q?pEPHWsooaHneFdnzzWPAodMbMghF2romjkl7BfTE+n+A5IaVTWp9Ad73oh5x?=
 =?us-ascii?Q?EC8/R6X0+InwaWWA2Umc8Yk5lFgaSzVACJKVxVad2roTy2Q80eQYJ5KEqXLp?=
 =?us-ascii?Q?WkjbHajLP05eAoplKT72oERc+RrRoMrzp5IK1yI2OdJxnil3/oQg+FZpUf+D?=
 =?us-ascii?Q?dt05wGeO/AvfIt3nqQTocMowrqUWulVryK4caifPaOq2o6dz0jAfWp35it/H?=
 =?us-ascii?Q?sDbLZmVq8TcGclIJzxwZ2AC6BUAeBxLk6E/Y4eWvkYJ56uh50lHpUubeB/s0?=
 =?us-ascii?Q?q2fpnbSHB8mHj3uAwotEpCkZYlQ7k7pLfzuPY06lut6M3q5hx+99vSRlFwOp?=
 =?us-ascii?Q?ZtiZkhMpxdrpsPELBc+nnf+t/uOsH8lZlVVUVCGOU/xTAidFymkZUK2TC0Av?=
 =?us-ascii?Q?4oC2dnuDuuO8k9fJOaPTBqUaN8CO+2CfZ+wFMJ5BVVuzvEorp7a+/iKP9FOh?=
 =?us-ascii?Q?5tpwZpUg49Xw5WSyqudmBFVWU+f4QPBUmOWE3xfOVd9sJVvRVEngvicZperV?=
 =?us-ascii?Q?AnVbf2cVOLA+JFFTaxkgW+Xna+aU92FGcA14fbe0JQnreffQhuhw0FkP2MII?=
 =?us-ascii?Q?3MOhaYdGHR2F1s2oKcbmOQ38UAerz5RuSy8y3paE6UBYji7yW51+wPbp7Oji?=
 =?us-ascii?Q?mI2JUnMRwL7MF5Aa7J9Ma12O8dZox8os2YQGqkdpfrvAXIYzXLl80MKkhLWq?=
 =?us-ascii?Q?v0GYWwQY5h9W1s/wcEevPCunpdhOnxc1olY/U3/eX+zokb9lc0TfnKZKNfaa?=
 =?us-ascii?Q?KmB+UhhXdOXrkOEFuCxsvodSZXRnHGRQndJsMEcCe58b/rs6CNa0L9DfzrUC?=
 =?us-ascii?Q?XdAu5qCQamsVwGodoq1IOrcKmnap+OjFtQxeJ2ubtX6lYy7yeTz+K5DynJB2?=
 =?us-ascii?Q?OiCiqRZSCCMhQn9c2SzWbOKbZ/likyh3Iuv1pOIjjLVaQAlzit26PaZDjrb7?=
 =?us-ascii?Q?InptwjEjdVYX+32rc1P8OaQzcgoysmXQUguS+OynQYLoSSRE/IiQAmwnLxjP?=
 =?us-ascii?Q?U0DWcDn2H+ZP4dL2sO55xR7DcpZZonPa/balj5HukUq/H8wOfbMBIPN/hOaw?=
 =?us-ascii?Q?aqN3gZt5qJEARR7bDlalkUwRWjFihVfm39iOZr+SLeFjKetV5Q4oY5Wr6b+h?=
 =?us-ascii?Q?WPqURvbYG2CYKQd1jk/Awpvtl/eMpG8NwHdKjMF79vvOQiVz/tbce685abs0?=
 =?us-ascii?Q?Oz/yPCSS7dhiguFvJYdUKA6VbD93MAi0vS/woixq40NQG+EEDmcGNKyKJrSG?=
 =?us-ascii?Q?hUQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1091fc9-0f2d-4ec0-42fe-08d951908f4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 06:25:57.0133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhbrHrVV27wG3UsWr4jV6MTMtaZah/hZbHi/LXUWds2WuBJiXpepKt5Obc/NUJitlDoy/yUDReSszv4wpKmFXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5354
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "like.xu.linux@gmail.com" <like.xu.linux@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Rao, Lei <lei.rao@intel.com>
> Sent: Thursday, June 17, 2021 10:47 AM
> To: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com; zhang.zhanghailiang@huawei.com;
> quintela@redhat.com; dgilbert@redhat.com; lukasstraub2@web.de
> Cc: like.xu.linux@gmail.com; qemu-devel@nongnu.org; Rao, Lei
> <lei.rao@intel.com>
> Subject: [PATCH 7/7] Optimized the function of fill_connection_key.
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> Remove some unnecessary code to improve the performance of the filter-
> rewriter module.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Looks good to me.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  net/colo-compare.c    |  2 +-
>  net/colo.c            | 31 ++++++++++++-------------------
>  net/colo.h            |  6 +++---
>  net/filter-rewriter.c | 10 +---------
>  4 files changed, 17 insertions(+), 32 deletions(-)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c index
> 4a64a5d..6a1354d 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -264,7 +264,7 @@ static int packet_enqueue(CompareState *s, int
> mode, Connection **con)
>          pkt =3D NULL;
>          return -1;
>      }
> -    fill_connection_key(pkt, &key);
> +    fill_connection_key(pkt, &key, 0);
>=20
>      conn =3D connection_get(s->connection_track_table,
>                            &key,
> diff --git a/net/colo.c b/net/colo.c
> index 3a3e6e8..5e7232c 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -83,19 +83,26 @@ int parse_packet_early(Packet *pkt)
>      return 0;
>  }
>=20
> -void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key, Packet
> *pkt)
> +void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key,
> +                         Packet *pkt, int reverse)
>  {
> +    if (reverse) {
> +        key->src =3D pkt->ip->ip_dst;
> +        key->dst =3D pkt->ip->ip_src;
> +        key->src_port =3D ntohs(tmp_ports & 0xffff);
> +        key->dst_port =3D ntohs(tmp_ports >> 16);
> +    } else {
>          key->src =3D pkt->ip->ip_src;
>          key->dst =3D pkt->ip->ip_dst;
>          key->src_port =3D ntohs(tmp_ports >> 16);
>          key->dst_port =3D ntohs(tmp_ports & 0xffff);
> +    }
>  }
>=20
> -void fill_connection_key(Packet *pkt, ConnectionKey *key)
> +void fill_connection_key(Packet *pkt, ConnectionKey *key, int reverse)
>  {
> -    uint32_t tmp_ports;
> +    uint32_t tmp_ports =3D 0;
>=20
> -    memset(key, 0, sizeof(*key));
>      key->ip_proto =3D pkt->ip->ip_p;
>=20
>      switch (key->ip_proto) {
> @@ -106,29 +113,15 @@ void fill_connection_key(Packet *pkt,
> ConnectionKey *key)
>      case IPPROTO_SCTP:
>      case IPPROTO_UDPLITE:
>          tmp_ports =3D *(uint32_t *)(pkt->transport_header);
> -        extract_ip_and_port(tmp_ports, key, pkt);
>          break;
>      case IPPROTO_AH:
>          tmp_ports =3D *(uint32_t *)(pkt->transport_header + 4);
> -        extract_ip_and_port(tmp_ports, key, pkt);
>          break;
>      default:
>          break;
>      }
> -}
> -
> -void reverse_connection_key(ConnectionKey *key) -{
> -    struct in_addr tmp_ip;
> -    uint16_t tmp_port;
> -
> -    tmp_ip =3D key->src;
> -    key->src =3D key->dst;
> -    key->dst =3D tmp_ip;
>=20
> -    tmp_port =3D key->src_port;
> -    key->src_port =3D key->dst_port;
> -    key->dst_port =3D tmp_port;
> +    extract_ip_and_port(tmp_ports, key, pkt, reverse);
>  }
>=20
>  Connection *connection_new(ConnectionKey *key) diff --git a/net/colo.h
> b/net/colo.h index d91cd24..5f4d502 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -89,9 +89,9 @@ typedef struct Connection {  uint32_t
> connection_key_hash(const void *opaque);  int
> connection_key_equal(const void *opaque1, const void *opaque2);  int
> parse_packet_early(Packet *pkt); -void extract_ip_and_port(uint32_t
> tmp_ports, ConnectionKey *key, Packet *pkt); -void
> fill_connection_key(Packet *pkt, ConnectionKey *key); -void
> reverse_connection_key(ConnectionKey *key);
> +void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key,
> +                         Packet *pkt, int reverse); void
> +fill_connection_key(Packet *pkt, ConnectionKey *key, int reverse);
>  Connection *connection_new(ConnectionKey *key);  void
> connection_destroy(void *opaque);  Connection
> *connection_get(GHashTable *connection_track_table, diff --git
> a/net/filter-rewriter.c b/net/filter-rewriter.c index cb3a96c..bf05023 10=
0644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -279,15 +279,7 @@ static ssize_t
> colo_rewriter_receive_iov(NetFilterState *nf,
>       */
>      if (pkt && is_tcp_packet(pkt)) {
>=20
> -        fill_connection_key(pkt, &key);
> -
> -        if (sender =3D=3D nf->netdev) {
> -            /*
> -             * We need make tcp TX and RX packet
> -             * into one connection.
> -             */
> -            reverse_connection_key(&key);
> -        }
> +        fill_connection_key(pkt, &key, sender =3D=3D nf->netdev);
>=20
>          /* After failover we needn't change new TCP packet */
>          if (s->failover_mode &&
> --
> 1.8.3.1


