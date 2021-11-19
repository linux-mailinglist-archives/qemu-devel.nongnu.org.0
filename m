Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7B45677B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 02:31:25 +0100 (CET)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnskO-0003pV-H4
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 20:31:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mnshH-0001eh-Kn; Thu, 18 Nov 2021 20:28:12 -0500
Received: from mga11.intel.com ([192.55.52.93]:61140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mnshE-0001Xp-4n; Thu, 18 Nov 2021 20:28:11 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="231815434"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="231815434"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 17:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="455578948"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga006.jf.intel.com with ESMTP; 18 Nov 2021 17:28:05 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 18 Nov 2021 17:28:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 18 Nov 2021 17:28:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 18 Nov 2021 17:28:04 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 18 Nov 2021 17:28:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8OZsFy06OvO1xYuL+eXCxbZ6Q4wC++ZWqtXXG2igKNV8XSjajN28gjpf5i32rjZQIW6QxuiydwmNYjXoGqjazxjpJ9+bDkRL/g0CGx/LmFo4D18PmSLz1VNrE2QCYpXHrPyjmUaFxWt6LledlmzaI6QeF+1NHlgEOye0Udc4UaeEAaVvIz3KxJMUG3QLS3cGTgf1q3PYUdogrDzotZgYuWKhkCxochx8XQbIaBYT/eyJPfAs4k3wZCuAJ1megFYQI/3Nid2nJxdPJQuW36Gxq3AFpAsS1qDtQcs2a5YD9u112UUvXSAYWpsm/erEoNXHPSCHe1a/e0Xq++K2V9yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+k9UuiQ7GpiR0jLC5iACQhHx7oD7D2Xflyq+8hRumAo=;
 b=Hyhs+GHzy6IeuyWbTnMi6LW4MUIj5BWdKAKS9oFrLZajCvBdVhAWGhbhxqOCMFA4i079gFKegY5IySBQdt61ZaOpMLWgjvt2Rq5795BUJrHFBFWbyn2otsfqYgFXwSgJJXxs46EzSnSf/W8sXRLTfhZgl353CKsCENOUcPomDe/7gfIFEGy9gLo9L6fNRvYNpVZptG6/GiBzfBBKAfWogVJF5SoYKBkzTWBIJ83ZrKSjn4/ruiDOX+tQD8S+/yNSA675e/dst6CrzDc2eg3SUuRqNSJZk4IBuCkOE6+VbZHEwqSkEDCWpbaMjZhnAsacDPDLJNuXqlnewaaOCg6GUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k9UuiQ7GpiR0jLC5iACQhHx7oD7D2Xflyq+8hRumAo=;
 b=E1ZQ0DiW6LuL5t1am5MEom//ENyPplwxurPzgVBzqBHm+9jGyI57ysZpor7QREx3arKl9Sk6DUDJl65bpmqTNIQ5LPsLtk1uwZBoVX3qzSmMF2C9juS5TYvIFwDYwHTnvCUvW4IyThO3BpSDecS198JVR55+JkPYbCF4aBKeo0w=
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5654.namprd11.prod.outlook.com (2603:10b6:8:33::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.13; Fri, 19 Nov 2021 01:28:03 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::9c4d:5c63:9fdd:53da]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::9c4d:5c63:9fdd:53da%4]) with mapi id 15.20.4669.016; Fri, 19 Nov 2021
 01:28:03 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH] docs/COLO-FT.txt: Drop deprecated 'props' from object-add
 in COLO docs
Thread-Topic: [PATCH] docs/COLO-FT.txt: Drop deprecated 'props' from
 object-add in COLO docs
Thread-Index: AQHX3DRm60w+EFjD9kuOKjq3yxRIpqwI2JbigAE2mSA=
Date: Fri, 19 Nov 2021 01:28:03 +0000
Message-ID: <DM8PR11MB564096B34CE6F411D573D384FD9C9@DM8PR11MB5640.namprd11.prod.outlook.com>
References: <1637209041-15080-1-git-send-email-lei.rao@intel.com>
 <878rxmx8jn.fsf@dusky.pond.sub.org>
In-Reply-To: <878rxmx8jn.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f96a2174-f6b8-4123-cc64-08d9aafbd50d
x-ms-traffictypediagnostic: DM8PR11MB5654:
x-microsoft-antispam-prvs: <DM8PR11MB5654DCB194CCED1C8822F33DFD9C9@DM8PR11MB5654.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:287;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e8OpghsjvvJE6RHcGn8EESv26SRqePJ+Jp1QfGN+32L4wp8QmtfCIOa4keWiEdjmJlXqTUICHM9ip1RObpfQTjE7aNSuLhMX8kN9ZJBR1LZqV9N9S2lzBV16uObZjv0NSAyHL4Ne2EUBABgRfgd9Kk3XFfy8CKLyyoufEGPkhHRfjzvltrLC2r3x5Lnf47rECUTgrXBnVN3r/npAv18kGVUs02I7hX3O2eYGbzVRi1Qllwk5RIWVFIZT0JvHlyWgXwMbFhB0GLOm9HEyKk9P68ZXcGPrzPvcRN3pTY0rGeZCrSXKB8W6J97Mxb9/rphw8qXfniaT9rCgS2yrh40ByPpzqpc9i6t9TcCkT6G2enYPZKDl9jYXOp+u9Je4qIC48pM7b1HEZguQAWXG2Dno7jGs8/5azsF1U2wKmVW8JA07UUe8+L7NW2nmMMqSoZ5Ub6kpS0iAn5eVnuU31k2HINpOH+JYvNgLLRg7GXmi1MgvdcR6ILygSVGRKEx035VQ1xiRRQmf2MEkTB72FNkOILJ8jHrVwAmcjBdaIIh6j4rBlPS/X5E6KKiCsCjC5jUj6cjIKVwhO6odoIECZy57v1jRlNhEckRn9vwwp6bUzp0Uhg4t4LYZQfAcGLp07a8riPFQOnz8MvKzl0KG61qYiSLv+aNg0x1baHf/rqdN9tWkem/fFloTOHGGb4G+K+T1AbBADYz0fkaCsbs9kaNdWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(53546011)(508600001)(26005)(8936002)(316002)(8676002)(55016002)(86362001)(66946007)(33656002)(6506007)(5660300002)(71200400001)(54906003)(122000001)(64756008)(66476007)(6916009)(66556008)(9686003)(186003)(4326008)(2906002)(66446008)(83380400001)(76116006)(38070700005)(7696005)(38100700002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?WE5veUZ4UWRoVTBXRWxCSStTaGlPZXZpNnpDTmQ2Uzg4R0tFZDczeUNy?=
 =?iso-2022-jp?B?WEZVbUtDRGNLcStoNnM3dTk4Vk53aUtzMld2TFVXSGVhNUk4MnZoWFZw?=
 =?iso-2022-jp?B?SDBPT21CRzJtV2U1b0FEenJXUDI1bHduNU0xSW9DMXFTRHdLOFpReUR0?=
 =?iso-2022-jp?B?dTZURllrNmdzL2RaeGl1VytyeVFnY1BLdER3dm5LM0Z6WWdKaHc4OEdC?=
 =?iso-2022-jp?B?d1p3MWIwdFp1UTFGOCsrUldmVDlRdzdHMDl2aVZmNGtmVXpGOEJTTUti?=
 =?iso-2022-jp?B?QUFHeiswOGhXOXl4d3Rwb1BJVmhQLzRVU0RVcEpIWFludHR2azl3VjV3?=
 =?iso-2022-jp?B?OWdrKzRvYVhpRGNvK012SEFvbUorL3JmY3J1dmYyTUlNQ29aNkxYd0M3?=
 =?iso-2022-jp?B?ZGhBcDFaam1IQitUaTBaQmRucUhuRm92MmNhcURvbTRCWW0xTFo2c3hk?=
 =?iso-2022-jp?B?cHNUVXBnNXU4K3V3SGlRbGRrS3o3MmpuRU4vaFNoWXg3b0l4ckI2cFZv?=
 =?iso-2022-jp?B?aE5PR3V3U1pQbGdKNm4vYUJFUWhPTkQreEN6YldrNVFqUGxEeTRxbi9i?=
 =?iso-2022-jp?B?RU5oVVlxOHJKckRjNHJQNmlBekVVVUVVM2E3L1RVY0dzcjVDQXAwZWpB?=
 =?iso-2022-jp?B?bE53eVkwZjJOa0k5eExMTm83UnhUQVo0dHFmVklPMUdFSm90ODFvNXN4?=
 =?iso-2022-jp?B?ZlZjcDRvRGI4Wnh3dmhJdG1VQzhzU1prZFhGbVEva2dkR2VDcVpkRit3?=
 =?iso-2022-jp?B?QndjUlhuWk9lbnBhR244cndEaUVtS3F1R004M2psbkk2aEdKYlFjVDdM?=
 =?iso-2022-jp?B?alNqcWVLaXUyeS90Y0F5S2NDRkQrZUJjbHZEU3FwRnY1dXF4dGkvbFVU?=
 =?iso-2022-jp?B?d21leTd1TERZcG02UDVmN3FKTi9kcDFDZzhSd1FvdDJHOTBtYVBiZWo5?=
 =?iso-2022-jp?B?NlVwRkRKMXdrVmN2OUxtekMyQmFvbk1DQVpQUW9WSnU4MVJaVkxna0tn?=
 =?iso-2022-jp?B?YlpjMzVMSFBWbWxkai9zVVpsbUtJYSsvTk84UzFLSHF0V0RYMmtyQmV5?=
 =?iso-2022-jp?B?WU5SU1BPN2ZjeHVzZHo5d1Jvc3VKWTI3bjhSL1FibC84U0hXT09Ob3lO?=
 =?iso-2022-jp?B?ZGY1MmwycUxKc3dXbHhQWmFtelVLckdBa0RXcG1hdGlYM25pbTZBa0FD?=
 =?iso-2022-jp?B?UmFpQzkxeFRhUzdVTmVjbkpqcG1MR0VmWk9CMndzN3Y3a09sdU5QZlNG?=
 =?iso-2022-jp?B?NmdtREFpMEszN2FqUFJVeEpZbFVnZ3R6c2NPZUI0T3c1RkphUHBLUjNT?=
 =?iso-2022-jp?B?VE5ETkY0WDNseWNKWGZteDJKVnlrTng3cU5NLy82dXpVV3B3OHowZkNK?=
 =?iso-2022-jp?B?cnFPMk9Ja3RVR0R6R1d1WmMrVGdOZjNtNm0rZWMyWWhqYWFLbzJTMVBZ?=
 =?iso-2022-jp?B?b2VJZmpqNmpjYWUxZ1c1YzNSN0k1LzVVdjl3MW1tbHRDY25OZ2Jldmtk?=
 =?iso-2022-jp?B?V2M3RlB2MGhNQnVNSFNOQTNaT2grS0htMERUaGVCOFNYM1BTZDdkTmMw?=
 =?iso-2022-jp?B?dWFlN25qamlNR1VJNUZ1d0h3RS80RmJZY2w5UnFtVS80SEN5dWFya0JK?=
 =?iso-2022-jp?B?MFBNQk9lWklRd0RlZE84SWFYRTVkZ0g2RTBLakQxRUsxazNZNjFaV0hX?=
 =?iso-2022-jp?B?RWlJdkl1anJGMGR5dFVnVkNLVmJ2eVBZck9kZ3hqL3krUzNUeExoRWdo?=
 =?iso-2022-jp?B?cTNlKzFUTWRDSER6czBNOWtnaXRmYWxNdjR1Qm85OFVhWWpWSVN6R1No?=
 =?iso-2022-jp?B?eU1kTUVzV2I2Um1hK3RPeS8wcUVmKzZ2cHhPU1BjZmJLNHdHSVM0WXcz?=
 =?iso-2022-jp?B?SEswMXFTNk41N0xVeU5RWHREcjNnMmp0eVdlYTVpd1gvS0pEK1lsTmhT?=
 =?iso-2022-jp?B?RjI4SGJaWitUNWZ5eS9LSFFjUGtOTGdvWnhzOWpwN1o3aFpZUGRXc2JW?=
 =?iso-2022-jp?B?TGZURXhzUlExYmh5T0JoQVoyMDFKRGluYVlyM1Z0K1AwS0p5Tk5QSHlW?=
 =?iso-2022-jp?B?RlAxZzVVby9ycmxqVjAxK2ZtQ2tTUUxPVlBHSWh3bWsrY0ZHdzJxNUZD?=
 =?iso-2022-jp?B?ZGp5QXpFSXErQXExTE9zSU5oMzhkYW1yRThySmIzV2lFZHhGM00zQnY4?=
 =?iso-2022-jp?B?RDFSVjhDYXJqekh3SWkxMml0cTRvSlFEMXNaYXIwYWE1bkhSdWJpWmI0?=
 =?iso-2022-jp?B?ckhicnBySTIrZ093UTk4OXJnQWxtTitGLy9YNTA3cmVhcmcraG5PNTFo?=
 =?iso-2022-jp?B?OGRzTisxZFdXa3hPWTBsdWNnTGdsdW16c2c9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96a2174-f6b8-4123-cc64-08d9aafbd50d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 01:28:03.6286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJHtguU2pfPIb/ZMF+j+V6IoqTYP96Oy5gcAfvc60CsVU1DuBgNz2PFklAVJbbjekZJJHou8lUE7hF4oztAmSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5654
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=lei.rao@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Zhang,
 Chen" <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OK=1B$B!$=1B(Ball files you mentioned will be modified in the next patch.

Thanks,
Lei.

-----Original Message-----
From: Markus Armbruster <armbru@redhat.com>=20
Sent: Thursday, November 18, 2021 2:50 PM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; zhang.zhanghailiang@huawei.com; qui=
ntela@redhat.com; dgilbert@redhat.com; qemu-trivial@nongnu.org; qemu-devel@=
nongnu.org
Subject: Re: [PATCH] docs/COLO-FT.txt: Drop deprecated 'props' from object-=
add in COLO docs

"Rao, Lei" <lei.rao@intel.com> writes:

> From: "Rao, Lei" <lei.rao@intel.com>
>
> With the removal of deprecated 'props' from object-add in the commit=20
> of "50243407457a9fb0ed17b9a9ba9fc9aee09495b1", we also should update=20
> COLO's documents.

We should've done this right when we deprecated it.  Not your fault, and be=
tter late than never.

Recommend to quote commits like

    in commit 5024340745 "qapi/qom: Drop deprecated 'props' from
    object-add" (v6.0.0)

I have

    [alias]
            whatis =3D "!f() { git --no-pager show -s --pretty=3D\"tformat:=
%h \"%s\" (`git dc $1 | sed 's/~.*//;s/%/%%/g'`, %cd)\" --date=3Dshort $1; =
}; f"

in my ~/.gitconfig, so I can run

    $ git whatis 50243407457a9fb0ed17b9a9ba9fc9aee09495b1
    5024340745 qapi/qom: Drop deprecated 'props' from object-add (v6.0.0-rc=
0, 2021-03-19)

> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Same issue in docs/system/authz.rst, docs/throttle.txt, and docs/tools/qemu=
-nbd.rst.  Care to fix it there as well?

Also...

> ---
>  docs/COLO-FT.txt | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt index=20
> 8d6d53a..fd5ffcc 100644
> --- a/docs/COLO-FT.txt
> +++ b/docs/COLO-FT.txt
> @@ -289,11 +289,11 @@ Wait until disk is synced, then:
>  {'execute': 'human-monitor-command', 'arguments':{ 'command-line':=20
> 'drive_add -n buddy=20
> driver=3Dreplication,mode=3Dprimary,file.driver=3Dnbd,file.host=3D127.0.0=
.2,fi
> le.port=3D9999,file.export=3Dparent0,node-name=3Dreplication0'}}
>  {'execute': 'x-blockdev-change', 'arguments':{ 'parent':=20
> 'colo-disk0', 'node': 'replication0' } }
> =20

... I'd like us to use double quotes in examples, not single quotes.
QMP supports single quotes as an extension over JSON.  Best to avoid it.
Separate patch, of course.

Same in docs/block-replication.txt.

[...]


