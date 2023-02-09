Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839CA68FCA1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 02:28:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPvjS-0000qT-2n; Wed, 08 Feb 2023 20:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pPvjP-0000q6-Da; Wed, 08 Feb 2023 20:28:11 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pPvjL-0003KK-Dh; Wed, 08 Feb 2023 20:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675906087; x=1707442087;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vXDZ1Ai9Xm2rIUzOiluxcME0BPQJp1QRJMSGG4Cc+gY=;
 b=ISYexMtaGyKWaM1FW5vz8c/DuKGVCMg/MUsyeihFzJhqxfKejhb6FH4p
 /Avf8oQfNtC6C7kcgpUW4B/WiFN84+cEBJAuxOwC6CPhLo5j01S5NBate
 ggOacqqnrYPvjY0gC5PLd0/dq7uMohIByS2Qobs6dKAWySS14Adr+CZxU
 rJ9HUbYlt/fReDJ6/EJzgxOAD5J61lMDD7W1wbN/332GQgqLjoUnkIftc
 h+P1oFBcg0h5hJLhLpCwFJqLYjnUuZ5GoJPYr08TpsF2FVcX8lhSMy/Nt
 Mq0a0GDF5FnxKbbMZGUAuZPD4xScGmRDNMJmvzRm0/Mk/AgtF23JyI6dZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="328629432"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="328629432"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 17:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="810148140"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="810148140"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2023 17:27:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 17:27:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 17:27:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 8 Feb 2023 17:27:56 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 8 Feb 2023 17:27:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDgdxzmqHDFdjVbTEAE9Mr1K699ODUyw5VdOdwXeeWbNcW5ULW0ZrWxyUzBX4WH4QmjwNy7R6+NIzd5ozCMC+Wu6W21jcPCl1ItrLx3QNVmFii/UJMNKo++rQBCFj4H+X1niIpFSii25Pe7O3bc96+7/ByBEdlW88kJFbF+09m+VeFUnMi3p8N5wGLV5COrgslmrvACxfyNi7zDI50xkKfXVW52Y6JgDCr6zliWD+jZA3YCaWkLP4OM58IX0lv7DKjMATq8pTa5+8x24q4beOUDfn9GVMzeMVvMnz7RLusNXzd9wYUPbebtjvQSTXSSG+LX/UvPtvVSLIxVoEgyqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xaD7WYNaiAgDZ7oU5oISMh+5+TZr68Axi4/9YI0ZFU=;
 b=KOao5ZXXQtcjA7TFgPKQ6hDxmmluQmYNzcuViD0M3fgCWwhoYfdLXQm/XcwNWTzKrEa23Zf9Mi8TjeD2BcnKellknvuoxozyNsiNOFp97yuSJ7OIAk/sPiXVptZ2n0SWwXlIV/CBV4VnFQClcRuBaYb4gi5AZo4lVzOj7XvyoGpY/IeRtnka6K1h5hi6BsJSc1zeLnljiRcIkyoqk/v6nk9EVKgBj4CDRL766kutj/LqBHBx3Wu6qrcIhsbbhZtnLAUZ5fTBDX48UPdXgFDYFPuY1xXVo6Pz9B3Bwnkw7olMKMPykTNbE4mhe7chGmitCK9xhagmNj7T4aTf2TK10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by PH7PR11MB6353.namprd11.prod.outlook.com (2603:10b6:510:1ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 01:27:52 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::f42a:63d9:2c7:356a]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::f42a:63d9:2c7:356a%5]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 01:27:52 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Juan Quintela <quintela@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Stefan Berger
 <stefanb@linux.vnet.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Halil
 Pasic" <pasic@linux.ibm.com>, John Snow <jsnow@redhat.com>, David Hildenbrand
 <david@redhat.com>, Fam Zheng <fam@euphon.net>, Thomas Huth
 <thuth@redhat.com>, =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?=
 <berrange@redhat.com>, Laurent Vivier <lvivier@redhat.com>, "Vladimir
 Sementsov-Ogievskiy" <vsementsov@yandex-team.ru>, "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philmd@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Coiby Xu <Coiby.Xu@gmail.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>, Richard Henderson
 <richard.henderson@linaro.org>, Markus Armbruster <armbru@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>
Subject: RE: [PULL 28/30] multifd: Fix flush of zero copy page send request
Thread-Topic: [PULL 28/30] multifd: Fix flush of zero copy page send request
Thread-Index: AQHZOo93pEsyahZS1EeHD4x7aKRmsq7F1NGA
Date: Thu, 9 Feb 2023 01:27:52 +0000
Message-ID: <SJ0PR11MB67440DCD9ABD1087E59456FF92D99@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20230207005650.1810-1-quintela@redhat.com>
 <20230207005650.1810-29-quintela@redhat.com>
In-Reply-To: <20230207005650.1810-29-quintela@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|PH7PR11MB6353:EE_
x-ms-office365-filtering-correlation-id: 4580b311-bee9-4c76-1a62-08db0a3cdcbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: maTwJ+vrr0DryFQ2dzB8ECU/jRp/ylOMmd0W5sy7/E9t2o0qCkG5DIOJBSSo+W6t4DyCP9Y+mEN+vZ6c2Yw0ZK55UIuSIppZbvfLuAOMkk5UIrmAiuuLSSUea8ve49LU+TT4WrXpkE89fyH/MjdOsFgNODd53T9ZOxgfbCNhjBklT999Zk8GqyCixDyT3g7Y+bn4PRCgGwsnaRWg23XQA1a9oStddnJXrIttJYyY2dTN4pPYwQ1Tc59vOqQQrDJ7Fkog4M9WGSccwiryjvorpG/OooSVkiGYDcXloOozBovszwbil9OEcLbkmxC7MShoGYUpt/NVZBkro5ELa99+99HpjmRcIwpx9sD8Dx0/5wCQ8CirVVgGdBfK1qxmUE02vtAYqSXVosvBXosVoJyT9F0xVTEBvuxHu9GCEsD0/2+hoB7Nk7D/08Yqd15gGHOol7v9Nw6lQk73HeAP7GnaZmawtEjcCZVceSo/tR0/WboF9qFWLUlJMqthnCCKDpcaDApsiROtOrkaa6PNCCvC32bdjn58E/Rs0uDO81u98MnGgMmqVCXhbc+Lnpoi7WGTt0HJVAKy0/QAEaxV/VI6lHS1amgQAnoqQWrlOjYnKk5aAJKb/FnhmcWrlSJErZRcMvF4T9IDYVcmRWHSQrEtnyyB/RemeLhM3KIwVv0WyW+tcH53kxwb7ei0FIpClUey
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6744.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199018)(7416002)(5660300002)(7406005)(8936002)(2906002)(83380400001)(122000001)(52536014)(66946007)(82960400001)(186003)(316002)(26005)(38100700002)(6506007)(54906003)(41300700001)(76116006)(66556008)(64756008)(66476007)(8676002)(66446008)(86362001)(4326008)(478600001)(55016003)(71200400001)(7696005)(38070700005)(110136005)(9686003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3p1yl40VmFb43Wn6XdmL7Hv9+gdAl3O52Bdd1pYHzX/ohhbC8z2GrfUk+l?=
 =?iso-8859-1?Q?8aSFJ7HGvhBJGrsF5hp+qkL+cmGsCZVw1T5gzyu3Q77uynql6OrhPWzY6s?=
 =?iso-8859-1?Q?wd9LxA1vk44n1BV84Z11PewWoysLQNPt+D7ZGlGQlBSLNClsUCV0Yw+C1I?=
 =?iso-8859-1?Q?7NrHfhUIgMNs3RmTsAqOkUil4WkucoWSuydQB8lxckVGylhAIMY66MbZk3?=
 =?iso-8859-1?Q?3oU9xlhGMp80FZbs+/QZE0jvd67s3DI8UQXxEXl08wQNQfIH0FubIXYaSu?=
 =?iso-8859-1?Q?8dSBsO0cMMm38dlaCWwc0N7qIwsT2qPpUzpqidFFRNFiMr8WMAloWwqgFm?=
 =?iso-8859-1?Q?oVIHUa56h75/I83aGCHX+4p6Wc0/8L7C4W1gYVLFP9yMxZR7cYGCJW7gGG?=
 =?iso-8859-1?Q?oltHa/CNrmUKa1hIbgCxTuWXbrOJPDB2EuAR0xxdsUwAuFCkWuntZu3d72?=
 =?iso-8859-1?Q?f2q5EmBg5hnms1MrWAI0Sjm9JCN6taFZJg0hw6pGMI7g8iuAMshaYfVbzt?=
 =?iso-8859-1?Q?J0XcrSbyTfIZHOYFr3rXe/PQ9/l0Cmw4WCcRLcOrv8T0NeGPNsg0naUr65?=
 =?iso-8859-1?Q?qNOotM4XQI3GGELFPclOCKdpa27vvCRFHkCviIUACf2/KMEC14pcZ59iHO?=
 =?iso-8859-1?Q?uCHuOaTHBIKozYYjS/DOvZlqDMzpE+0wFXATPBGkwjO01DU5hwpAp4gohO?=
 =?iso-8859-1?Q?TN+k5jGhOurkJ51w6oWjQtqXKxo4sJp/MTTy/G6ThdMYF9WDMnx641v5xc?=
 =?iso-8859-1?Q?jfBLeBmtPKaW+Jj9Tcf7uXpZZHntqsCZ4kxwKkA81C6LpBLasLph8zkjxe?=
 =?iso-8859-1?Q?cg9kjMgFWqt6cIMrtWIW7o4GuhNHi4mDm7dGWGp1HIxIP1Rm7fpVneOL85?=
 =?iso-8859-1?Q?DEStuapF0OGsn8lrXRf16XDmMVXNQJmcHsWn/jIUBQDjaj6ADNVnbmfV5U?=
 =?iso-8859-1?Q?wcdrCU4uiR+dIAmC03bOiq4PHOxA2TmGS4hFci+QD+gmtncbqC9qNjEYky?=
 =?iso-8859-1?Q?9SOM/qaauCKLSgR4QvY+VdfQAtpana8zu4ZuGTK4GkvPPGVzng4ur/vOW9?=
 =?iso-8859-1?Q?7t8hnQOhV/fJSiufTq8+uxkUoz69G1QLrOKUyAn/o3emy5V5AYXWWmOxz0?=
 =?iso-8859-1?Q?xn0RSTMWVfSWKwsR/1REVi09DUYIUPAWENAGm/SNLYOYehB13l+xkdSxAV?=
 =?iso-8859-1?Q?a/TmcYTEVkQ85XVolYWIdzVzEGLx6/ZemUk65gCU0G7MZDA0JFvUuE0Wxa?=
 =?iso-8859-1?Q?DtcLelsyOR1xqe4U37xUI8viJRYrSa4bC9sz8m+CSZqpmRpy73J7yGXHWK?=
 =?iso-8859-1?Q?6nATWXsqj/+It4RD5oGDkDK+anf9S1x+COjewpJsNRMoii2q6qAKxqYmnW?=
 =?iso-8859-1?Q?e1BGZu897lHAZpMcLFiuIVFzT63+BZBwOY21CwknWXQvO2pIJcz/3Ev+CH?=
 =?iso-8859-1?Q?WfuQKdZXR5x2EDC9VOZ7wXCefOnsKECtu0Ewy4+KJnicakOUFMHr9vb2EN?=
 =?iso-8859-1?Q?IsAnNMoZIi1FsJtlDOx6VRpa+4yDQK5/0RVSUj5xB4TJqXytWTsY5SvzQ4?=
 =?iso-8859-1?Q?6Gjk4OqqMtYBlhGgJ9uINTsZ32nSP3kfdznFxPUvjZzq07yoofZgg0pNs7?=
 =?iso-8859-1?Q?2KYkxELu2n7WKkkUfynob/cl1DHu0iIznK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4580b311-bee9-4c76-1a62-08db0a3cdcbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 01:27:52.0531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SxtafJbHFSZKjmQgzQw04jDpkxmLZj/nyXYu7eRH4aeLmWFcEXzHCp8zs8YHEEgiyUlEY1AqHOsgn3n3h4nzF17t5URfijtSjQpg+dr7Pcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6353
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=zhenzhong.duan@intel.com; helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Hi Juan,

>-----Original Message-----
>From: Juan Quintela <quintela@redhat.com>
>Sent: Tuesday, February 7, 2023 8:57 AM
>To: qemu-devel@nongnu.org
>Cc: qemu-block@nongnu.org; Stefan Berger <stefanb@linux.vnet.ibm.com>;
>Stefan Hajnoczi <stefanha@redhat.com>; Halil Pasic <pasic@linux.ibm.com>;
>John Snow <jsnow@redhat.com>; David Hildenbrand <david@redhat.com>;
>Fam Zheng <fam@euphon.net>; Thomas Huth <thuth@redhat.com>; Daniel P.
>Berrang=E9 <berrange@redhat.com>; Laurent Vivier <lvivier@redhat.com>;
>Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>; qemu-
>s390x@nongnu.org; Christian Borntraeger <borntraeger@linux.ibm.com>;
>Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>; Michael S. Tsirkin
><mst@redhat.com>; Juan Quintela <quintela@redhat.com>; Philippe
>Mathieu-Daud=E9 <philmd@linaro.org>; Dr. David Alan Gilbert
><dgilbert@redhat.com>; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>;
>Coiby Xu <Coiby.Xu@gmail.com>; Ilya Leoshkevich <iii@linux.ibm.com>;
>Eduardo Habkost <eduardo@habkost.net>; Yanan Wang
><wangyanan55@huawei.com>; Richard Henderson
><richard.henderson@linaro.org>; Markus Armbruster <armbru@redhat.com>;
>Paolo Bonzini <pbonzini@redhat.com>; Alex Williamson
><alex.williamson@redhat.com>; Eric Blake <eblake@redhat.com>; Eric
>Farman <farman@linux.ibm.com>; Duan, Zhenzhong
><zhenzhong.duan@intel.com>
>Subject: [PULL 28/30] multifd: Fix flush of zero copy page send request
>
>From: Zhenzhong Duan <zhenzhong.duan@intel.com>
>
>Make IO channel flush call after the inflight request has been drained in
>multifd thread, or else we may missed to flush the inflight request.
>
>Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>Reviewed-by: Juan Quintela <quintela@redhat.com>
>Signed-off-by: Juan Quintela <quintela@redhat.com>
>---
> .../x86_64-quintela-devices.mak               |    7 +
> .../x86_64-quintela2-devices.mak              |    6 +
> migration/multifd.c                           |    8 +-
> migration/multifd.c.orig                      | 1274 +++++++++++++++++
> 4 files changed, 1291 insertions(+), 4 deletions(-)  create mode 100644
>configs/devices/x86_64-softmmu/x86_64-quintela-devices.mak
> create mode 100644 configs/devices/x86_64-softmmu/x86_64-quintela2-
>devices.mak
> create mode 100644 migration/multifd.c.orig
>
Just back from vacation, hoping it's not too late to report: x86_64-quintel=
a-devices.mak x86_64-quintela2-devices.mak and multifd.c.orig might be unre=
lated to this patch?

Thanks
Zhenzhong

