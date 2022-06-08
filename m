Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45B5429DE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 10:53:15 +0200 (CEST)
Received: from localhost ([::1]:40366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyrR9-0000dD-35
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 04:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nyrNR-0008JR-6p
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 04:49:21 -0400
Received: from mga04.intel.com ([192.55.52.120]:14256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nyrNM-0008RB-Qh
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 04:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654678156; x=1686214156;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s1HzB9v/i88eMitrsSQB4VkNb4KSy9vGTLw+46V+N2s=;
 b=XKaq2gV4fAllF51JaslAvSjclk0P/VyUcS7AA7PTQN+aQBP0ALnNNR3D
 CRft8SgppAj36ublFEQ9defvSmQpYdwFkSzTqf0hDGdZoWn2UWb21OL2l
 njlOkQRUNSir704+q5y690sJQ4/HpMj9L4GgdX9Zfj2jT3ZR8FN/YtSr4
 BUyaSV87KL+pqxBFIWHqbq7YAy0aeKmpiU9WNpOvsCZvwzXbEZTcvzhBj
 Fq11wZy9/ipf+QE/QBWEVskU8KdpPDt4l6VY+6jPkw7Hum3075fCApD1M
 1/l4tlS4a/0CBsL05EEqtWknZKd9uzIZgNrmotneu43rXRoaRe5OqcFI8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="275584371"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="275584371"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 01:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="826839795"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2022 01:49:11 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 01:49:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 8 Jun 2022 01:49:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 8 Jun 2022 01:49:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrgTAOmqw9rTn76psKJajTm9ID9yC0edoN/XCiEwGGhvgibHYlHHQzuI386fz4ATVA4vCuhBhKbTezRNQB06JnlBWOrfO98xx2VhwpGTIpxlZrj3xicCQ/qwXdIDppy1NkfyW2oJSIiky5WHzgS1fiUaTU+LIjXM9QHc9jhOaOAJgdF9FszyMRWFLGUP/hFeqGHdFxphSuuS2jUOpH/sNQReKourbM6PKTmy70XtxrfJP+cpt7SewLa31hTxHmFBdeh9+n/PF30cZMv6Wrkse1B5/oz2B0pEV7hNlO8eRNgvfsaKX1Eon5xmVd1UKqRkBixRmq1uhDE6SzOVA5/kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWeESOu5/r0IOv+BNZbD+AJAHxTJoey+ZTnofrJHHhQ=;
 b=O70HSJ81Q8brxgxuftZwdkdctR7BGEanoVTgEQk8nGvbh3mN0GZlM670mhmG61rqBmlKRWWPVQYrRN1Cd+Ubf4YVA2Ci+vnt5IXz0om1l5LHjY8lIjuOhE7VeEozJV2prVgoIsdk+Af/CwENO40DehSpRuBU5LJlEOfjiHTZZ1pW0w1GSkfWziuGAS9pHvdBDeMIU90Zhf7WfZpmf6DbLyZJhF18+ScklpyuA6W6bGY6QU7geobQ0YYzoNOfRnQFjCo9ESq6V7y1KpCwk4W9cmaKp73h85xtDi2BmMmKdA7Jy4j9ulp2RpikGy3ulcm3NyGO73yCk1ikpd+P2OPp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CY4PR11MB1672.namprd11.prod.outlook.com (2603:10b6:910:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Wed, 8 Jun
 2022 08:49:09 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d%7]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 08:49:08 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Juan Quintela <quintela@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, Leonardo
 Bras <leobras@redhat.com>
Subject: RE: [PATCH v7 01/13] multifd: Document the locking of
 MultiFD{Send/Recv}Params
Thread-Topic: [PATCH v7 01/13] multifd: Document the locking of
 MultiFD{Send/Recv}Params
Thread-Index: AQHYdNvSSUqJ3su8MUuwpe3I6pwVOq1FPWaw
Date: Wed, 8 Jun 2022 08:49:08 +0000
Message-ID: <MWHPR11MB0031BA225F3B79FBC2CA305E9BA49@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-2-quintela@redhat.com>
In-Reply-To: <20220531104318.7494-2-quintela@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ecc3e84-c6b2-4bc7-1f61-08da492bc03d
x-ms-traffictypediagnostic: CY4PR11MB1672:EE_
x-microsoft-antispam-prvs: <CY4PR11MB1672446D811F4D72C0B63CAF9BA49@CY4PR11MB1672.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ea5wkeK9mugkK28Qa4MMxc2evy9khnF93vTWe7+RwKOHKqinrZOBzBrttJboZnmfV6cuFrkT6oq3J4wOTtsXCHqlzR/ru+YWyShaC/Ar+2qH0bVAhhRAJTOyl04fG07Dg0ghgmTV73lfAOd8qjgDzNfyoif1JeVeSSxYVz/p/5UHV4XzuTfVUGLrlX9JpPizLkA6VhaEi3LzMqtthRQU5Ko5dqmenVZ12KZzeI+S0sV3lLpowfXi8pJ7i3txDsxgTTniY9YGKxAk5JtKX6mRM3fp4MT130KNR68gKolXYCzCQVgJlFcsmyF2EBznFMQPM5W7946+pLHHITcz0ed8y/bR6WePMqKd9TcFioOPqdpCjFkh6Zg8XCS2VpYOitqyb8v6lYaMu0LGL5c/oiQhX0l0Jh/b72TkkVIxQ+15DzqNDCD+5VeC1aPbZ1knlpOJCxod33sbjn/jTYXsVBhVEB1AXuMLBett6S35BTBhn8V/S1xCmsIKMJ1pqgoz7nJAqzpEqeWxTpmG0IwrlNIUqEj6gseiJCLHfplqd8DEifhViBtk1zHMejqZxSqY+mlXiBqeVll/xF3H5PJVWenD71vAvqrtgiy2u0gEFy0fjSaCN0XqbCDN9staENgIEGEkzZmT3vdvCSFvUzvWyShhI6GAhTL+MZ9hbLvX0T2qt/CZIbtwYbvzRrbecqa59CZ9e0Giv67pQixxdMRukiDK+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7696005)(53546011)(5660300002)(52536014)(4326008)(66946007)(82960400001)(76116006)(8676002)(64756008)(66476007)(66556008)(66446008)(71200400001)(38070700005)(83380400001)(508600001)(8936002)(86362001)(122000001)(6506007)(9686003)(186003)(110136005)(316002)(54906003)(38100700002)(55016003)(33656002)(2906002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tHDGh9hVjPnbwOBYZcApK7UGHyaDI6W7vECcmU/omoI1rLBkcsCRYkcemt?=
 =?iso-8859-1?Q?zNkm/MwiFVO/nNbmlPMZeZSogRiODQleGbLh1yc+7/x7LvD7PrMIa+xobU?=
 =?iso-8859-1?Q?rzeOJE5e6+BPpVYqOkpIiYPzNvFio5klncmoT9WOTPfi5+jBarj/hNuh5W?=
 =?iso-8859-1?Q?HXOa5aY2cJb4IgtwUANzgHIw8bInq/W7MsXBIIVr1Prk0RPoH1srU1aXJU?=
 =?iso-8859-1?Q?+OyPfZW8c+CW5SVdTP1QJxv8YAsFacmZ/Ebkl5BfsedhoLv3kixCgOQbAS?=
 =?iso-8859-1?Q?yNqK1IugHWBHwen7Z3SvQmDxpPRkAJc+cXQ9/KyFlfMCxiTKXzAzzyJu59?=
 =?iso-8859-1?Q?sbCe5iA+8ZXvJ6S6UZea8RFQ7Ue3Pz2tKvhufZQh3Sv2BcKdKHbex35Qmn?=
 =?iso-8859-1?Q?mu9Nn26wkzrL8Q8BF6b3d/axAR/GcbPAnarKfjjKbhAub5ETaf+AY4+KYb?=
 =?iso-8859-1?Q?Stls42xn86bL6kRB4mEKlDoVkKI9JLZM9DEFXwaQdi2AGV1eatG2acinmr?=
 =?iso-8859-1?Q?IT98oYj7bhOx/dWJsdOPv30X17NW+xx9LBDuTCni6y1FST+eA2gbkvGYhq?=
 =?iso-8859-1?Q?hCXQifOJffAhGi0hCU5DPq+z1HKl8Gymk6rFdz4dVh9KjWxn9rxOYVYZ1G?=
 =?iso-8859-1?Q?P54XTuFXsPlcTmGC+yTxEcAQIGGoRUt9xVtzTWWhMrhwcr6uOnEd5o3EoW?=
 =?iso-8859-1?Q?uH6zen26W8pVKKDA39A41iJSRZBCTw7ArF2qwdwvTKxDmn8VJZ0HjevhNV?=
 =?iso-8859-1?Q?gBKtvqrEiSuPg4ZbcNtyaiJVSn1s4hg6Sx0w3gMJsL37Gqpfi8ROMJR5Ks?=
 =?iso-8859-1?Q?E31v8WMVugcEpsc33aGWbqGMIeEC1YNPdwVdaAMq3+cpf/7LUGeKrrGjGN?=
 =?iso-8859-1?Q?UBjRBgrzjE1Nnm0w5KFFXRtPmtHCWxmg10dL5gk3ho0yT6ZbY5siJTG4Pm?=
 =?iso-8859-1?Q?gxBR8gknfdsx7NFdBH4isGFKzjMVaAyzsAz8yDE/39KPUIlWwTt2Y52LTi?=
 =?iso-8859-1?Q?20xYHyR5dFCoktOA0NcQwsnvGT3MUGAFhBZk4NBB1n4A6axK6XLqpRV/Z9?=
 =?iso-8859-1?Q?CkGVbm6tygAit8N8rd3z7Cl1I9DP2X6OK9d1Uu7wX4sVyo+oUvGAxi/KZt?=
 =?iso-8859-1?Q?VKEs+uKkxz8WamJmRA7xCUDR4ZKfZjTMZhIN+Gsjkcb5xRZuaboItpkqgB?=
 =?iso-8859-1?Q?dD80D4C8uNUESX03H5pWXtbI9a2SJhU/DZO0JnoGWfB/WoJCfVESGyTrgS?=
 =?iso-8859-1?Q?gRwDBo8e/DfxvgvHOnegbPC2o7a5TvkSXeRJhOYqKW7RwcNdDfI12JM0Ap?=
 =?iso-8859-1?Q?BI/BIqlp1axPnS7AL8Wew+K2JjNKQTB/wcWaHiKaWsToCB9ntpFuQQ3j7t?=
 =?iso-8859-1?Q?ULxo2D4w7zISOeJEZfkPQKnPhqg9/b+rY2Q8pzJJj5kkUDT2BLDi6ANU1d?=
 =?iso-8859-1?Q?yEhy2WQQgUObK+h0x6wlxWs7rIEfCrY6uT6RJt8WAk7b7c4vJ440hADOMl?=
 =?iso-8859-1?Q?qt3e7/jNAHR3iK0Bjuo+AkvsJ5Bk9OXAM8vr3s6zo/jxfUNN3TA20hvknc?=
 =?iso-8859-1?Q?jV+KhoDkvnJn5ShA/R5r/qfm3jy/yuvTJjBMnLE6HQtIUdOw7x3O0KWFGJ?=
 =?iso-8859-1?Q?0KaHT0aprVZxKn2p+ksf+EnxU58P7YU0b1kBqavsXUlKrkX3rFAAE6FbaI?=
 =?iso-8859-1?Q?mCNDTiL2pO3lCm21JgGMEFj2olwfKHJzb4LHx+BeaYz4T3G3UTFAF42bzo?=
 =?iso-8859-1?Q?cShg4MZpOQyu/eXqUwkiB1kAtnlYhJydpu939f5M02Ns0wgQS7+muar/kz?=
 =?iso-8859-1?Q?ADoggk2m2A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecc3e84-c6b2-4bc7-1f61-08da492bc03d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 08:49:08.3530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dBaOdy5ZmQFCi21BTJWawXZFuil2/XBOx+icqe4FUoz1sGqwW1tW3QNzptDHDJ4jr7epghuFJ0h1x4jF9AvZZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1672
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> From: Qemu-devel <qemu-devel-
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Juan Quintela
> Sent: Tuesday, May 31, 2022 6:43 PM
> To: qemu-devel@nongnu.org
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>; Philippe Mathieu-
> Daud=E9 <f4bug@amsat.org>; Yanan Wang <wangyanan55@huawei.com>; Dr.
> David Alan Gilbert <dgilbert@redhat.com>; Juan Quintela
> <quintela@redhat.com>; Eduardo Habkost <eduardo@habkost.net>; Peter
> Xu <peterx@redhat.com>; Leonardo Bras <leobras@redhat.com>
> Subject: [PATCH v7 01/13] multifd: Document the locking of
> MultiFD{Send/Recv}Params
>=20
> Reorder the structures so we can know if the fields are:
> - Read only
> - Their own locking (i.e. sems)
> - Protected by 'mutex'
> - Only for the multifd channel
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h | 90 ++++++++++++++++++++++++++-------------------
>  1 file changed, 53 insertions(+), 37 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h index
> 4d8d89e5e5..345cfdb50c 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -65,7 +65,9 @@ typedef struct {
>  } MultiFDPages_t;
>=20
>  typedef struct {
> -    /* this fields are not changed once the thread is created */
> +    /* Fiields are only written at creating/deletion time */

S/Fiields/Fields

Thanks
Chen

> +    /* No lock required for them, they are read only */
> +
>      /* channel number */
>      uint8_t id;
>      /* channel thread name */
> @@ -74,39 +76,47 @@ typedef struct {
>      QemuThread thread;
>      /* communication channel */
>      QIOChannel *c;
> -    /* sem where to wait for more work */
> -    QemuSemaphore sem;
> -    /* this mutex protects the following parameters */
> -    QemuMutex mutex;
> -    /* is this channel thread running */
> -    bool running;
> -    /* should this thread finish */
> -    bool quit;
>      /* is the yank function registered */
>      bool registered_yank;
> +    /* packet allocated len */
> +    uint32_t packet_len;
> +    /* multifd flags for sending ram */
> +    int write_flags;
> +
> +    /* sem where to wait for more work */
> +    QemuSemaphore sem;
> +    /* syncs main thread and channels */
> +    QemuSemaphore sem_sync;
> +
> +    /* this mutex protects the following parameters */
> +    QemuMutex mutex;
> +    /* is this channel thread running */
> +    bool running;
> +    /* should this thread finish */
> +    bool quit;
> +    /* multifd flags for each packet */
> +    uint32_t flags;
> +    /* global number of generated multifd packets */
> +    uint64_t packet_num;
>      /* thread has work to do */
>      int pending_job;
> -    /* array of pages to sent */
> +    /* array of pages to sent.
> +     * The owner of 'pages' depends of 'pending_job' value:
> +     * pending_job =3D=3D 0 -> migration_thread can use it.
> +     * pending_job !=3D 0 -> multifd_channel can use it.
> +     */
>      MultiFDPages_t *pages;
> -    /* packet allocated len */
> -    uint32_t packet_len;
> +
> +    /* thread local variables. No locking required */
> +
>      /* pointer to the packet */
>      MultiFDPacket_t *packet;
> -    /* multifd flags for sending ram */
> -    int write_flags;
> -    /* multifd flags for each packet */
> -    uint32_t flags;
>      /* size of the next packet that contains pages */
>      uint32_t next_packet_size;
> -    /* global number of generated multifd packets */
> -    uint64_t packet_num;
> -    /* thread local variables */
>      /* packets sent through this channel */
>      uint64_t num_packets;
>      /* non zero pages sent through this channel */
>      uint64_t total_normal_pages;
> -    /* syncs main thread and channels */
> -    QemuSemaphore sem_sync;
>      /* buffers to send */
>      struct iovec *iov;
>      /* number of iovs used */
> @@ -120,7 +130,9 @@ typedef struct {
>  }  MultiFDSendParams;
>=20
>  typedef struct {
> -    /* this fields are not changed once the thread is created */
> +    /* Fiields are only written at creating/deletion time */
> +    /* No lock required for them, they are read only */
> +
>      /* channel number */
>      uint8_t id;
>      /* channel thread name */
> @@ -129,31 +141,35 @@ typedef struct {
>      QemuThread thread;
>      /* communication channel */
>      QIOChannel *c;
> +    /* packet allocated len */
> +    uint32_t packet_len;
> +
> +    /* syncs main thread and channels */
> +    QemuSemaphore sem_sync;
> +
>      /* this mutex protects the following parameters */
>      QemuMutex mutex;
>      /* is this channel thread running */
>      bool running;
>      /* should this thread finish */
>      bool quit;
> +    /* multifd flags for each packet */
> +    uint32_t flags;
> +    /* global number of generated multifd packets */
> +    uint64_t packet_num;
> +
> +    /* thread local variables. No locking required */
> +
> +    /* pointer to the packet */
> +    MultiFDPacket_t *packet;
> +    /* size of the next packet that contains pages */
> +    uint32_t next_packet_size;
> +    /* packets sent through this channel */
> +    uint64_t num_packets;
>      /* ramblock host address */
>      uint8_t *host;
> -    /* packet allocated len */
> -    uint32_t packet_len;
> -    /* pointer to the packet */
> -    MultiFDPacket_t *packet;
> -    /* multifd flags for each packet */
> -    uint32_t flags;
> -    /* global number of generated multifd packets */
> -    uint64_t packet_num;
> -    /* thread local variables */
> -    /* size of the next packet that contains pages */
> -    uint32_t next_packet_size;
> -    /* packets sent through this channel */
> -    uint64_t num_packets;
>      /* non zero pages recv through this channel */
>      uint64_t total_normal_pages;
> -    /* syncs main thread and channels */
> -    QemuSemaphore sem_sync;
>      /* buffers to recv */
>      struct iovec *iov;
>      /* Pages that are not zero */
> --
> 2.35.3
>=20


