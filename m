Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5954F0CC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 07:54:29 +0200 (CEST)
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o24w6-0004EV-2s
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 01:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o24pq-0002jV-JZ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 01:48:02 -0400
Received: from mga03.intel.com ([134.134.136.65]:8864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o24pn-000477-Hg
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 01:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655444875; x=1686980875;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1NO4vqUNfbSmG7PrFRqPrVjgG9mf8KfBJ9HbBb+xHSg=;
 b=CjEElowDHZxmLAjosyYGWK4SsamkfnnNldATn5G+owdUxCo9eQb8Bn1I
 4CENjy0RPtBp8L7Sp+btEl9QQRfPKCz89hb4DtIm6/nw8RBILtiP3LL0/
 yPoVxAuVFbACKCqu9VS4elkFryDls/KXInqLkKrYg0mhBipkbkEUMpyIn
 2/8N8qkun+yDJswchZfJyu4P25M5tEmmosEtJqoEBKP5ffKU/miNA7v91
 wF+LnXOlMsFZXPEmNGrg2TR14APt3yqvaqEo58wN57LKPgAnPfvAOivQL
 Czsq84MxNLGS1UUz/yeNd0RjSB/5KiiWRLjKKR/dd+ZH0BIS9qc1pFOLK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280458788"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="280458788"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 22:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583916031"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga007.jf.intel.com with ESMTP; 16 Jun 2022 22:47:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 16 Jun 2022 22:47:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 16 Jun 2022 22:47:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 16 Jun 2022 22:47:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHbeuYyYVicDlsDmZq20VnnvSNCDe/79cbPrapQRxpGlcZNxcSHrw+r52+GHTWDWjg3I5cUpiS/iIDXjLX7QDychEIbio5F1Z77nxLzt9PIzzKfC2DjZ8nBJsNLCFZe9ldfV1gjAewK8rmPuObUT05BmoqPYXhdq4MIVNG6M9aqyl9Yz09zq6uxS+AgE/gKx3WBAkr90rRRnDuvJipEOLKx8Sc3+A6VNJd9XK7egDAWxIJ4R4asnZpp/S1qYKmVSQXEd/oSh8P6u9cJgRNdaOyEG+oHZ5vH0tu/gssOMf8uiVs6n97il4LVNVZyH2BzHpVZ3NgCBFkem2kf5aDrW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NO4vqUNfbSmG7PrFRqPrVjgG9mf8KfBJ9HbBb+xHSg=;
 b=e8aO6WQmGUIQyq5AIhgtr/ATs5Wi3FOzMm/FrIllcQ1/LlOUTGIJC0FrD2JHDNhESfcJ95pZYrjss4OAEAKfR7+CICSGDubEsv5XZ1wR8ZhYk0kZvpFYWpEJEPcrzfPGRQ16OYAHXf3UirTGJD75Y74c3Hzc3GsIp4gVxhkrYpEuORWabpjfa+wia0a83XxQAad/jO+S/kZicLxU80d7oIYgqmim4FkjmpQo4Q5f0f5fu/rnRqtXRBlX8ucN8Njxk0wIk/rvXQPE7w/Xqt6ZYUtYetTund7iPROlPEoBT6m0llUEGg/Y4YRRYnqk1ltlCmL8gyP9cOzJR6EvXMFRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by BN6PR11MB1716.namprd11.prod.outlook.com
 (2603:10b6:404:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 05:47:46 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::7958:c658:d5:5e22]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::7958:c658:d5:5e22%6]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 05:47:46 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "eric.auger@redhat.com"
 <eric.auger@redhat.com>
Subject: RE: [PATCH] virtio-iommu: Fix the partial copy of probe request
Thread-Topic: [PATCH] virtio-iommu: Fix the partial copy of probe request
Thread-Index: AQHYgguB6dHv851LMkWunTT2iWA5m61TFy7A
Date: Fri, 17 Jun 2022 05:47:45 +0000
Message-ID: <MWHPR1101MB21103E12143DABC165C248CE92AF9@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220617034348.3162918-1-zhenzhong.duan@intel.com>
 <20220617012642-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220617012642-mutt-send-email-mst@kernel.org>
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
x-ms-office365-filtering-correlation-id: 840f5525-7b2c-40fa-06da-08da5024e776
x-ms-traffictypediagnostic: BN6PR11MB1716:EE_
x-microsoft-antispam-prvs: <BN6PR11MB1716D49FC9966DC8697EADFF92AF9@BN6PR11MB1716.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M9XSpHT4kKw7QZYv8NF7ScxBnD4HuwUR5+tztjV+VivzPGKGF+td4cLYkyBGaH68SzHaXjVmVQeQTnhPpqtLBhDespvxn72bipKQJRRqZi3mVWPfgnuavY33Y0odM3PSRp+o0RQWNjKCrPuM2nu6ttzceu2NkgdTPd+paGP32bk+DV9w6o/A1jzQG/77o7KIwzCTOThiqAiqi6y2Z9N8U3nccBrIDXOT2lHPmIrDOUgnxK4Hr8nTBpchDbZx0xAR1w74H84OJAqY3k9LQwdQQgQA1OPElJumU5k/cDYx3aGzgfFX68lOY0QCBVmBat5bKUw5N7rbIUJ5TGYcJCyF4cJRVdIUXyG9AvZed+RYyu8q357sGKEINIbs9x3mzvFSRgX0tdEv+kIcWyU3hCB55Ycu7xGrAgn7owhMOyWoF15pAC3N4CxE1utm4UjtITZ6gb1pf9Z2BmbEn3ZY35IAN7K9u26JB57OP+wkgiOizhY7wlOGUtIeyrdoNDBz11L2ST+aG6+3pJ0pC0hRFD5NMqNczpOtPH1AUNmSvUL9AiY+8I49RhsYxJHcbImLsYV8YVki6rh/kZNOPloWNdHaPxxhz5QAoJW5ODZlqNCzEwTKq42oE0bmaWGJSJRDcaLo1cSU2x5LR9Bp0ZOnZAfdMXsdSAhueAN6jLtNPvjU7o3b5kirkApd+Ii1rKmBDFQ24bcf3tATJFdHMDsnHZClKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(186003)(6506007)(4326008)(26005)(8676002)(55016003)(76116006)(71200400001)(508600001)(316002)(7696005)(6916009)(54906003)(4744005)(66476007)(66946007)(38070700005)(33656002)(52536014)(2906002)(64756008)(122000001)(9686003)(82960400001)(66556008)(5660300002)(66446008)(86362001)(8936002)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0E6Q26R3oaA77gunyq5LSeFgMq4GLsacsHnn4DykojapunTgXyJ680Skes3t?=
 =?us-ascii?Q?1lOm0mw0hMdn/OdR/YVmz6NLvvXNoXFhd2QofkoKH8UYokOVk7UzxfJ4GhbI?=
 =?us-ascii?Q?dKV79WTkrjCBxXIKO9sRYqf83T9MZ4WRPpHstmWw6rA88iCKqQr2su5se1AJ?=
 =?us-ascii?Q?cubQ3Z2oJz04M4xChBdnOjLulLqWltygDdbjeVecMAsMI9kc6HS7PBC4LPCl?=
 =?us-ascii?Q?VQ1x2No6kVsVn2kuzOMSmFDGszDFoWBUy+E9SqjxOOYKh4l+jQxPBbaaVIWp?=
 =?us-ascii?Q?0YUxRC9ZvSngrH8Iasy34Q2X2TKgut+MGmDgoNWUjvI3x9HBN4LFbYPvcOh1?=
 =?us-ascii?Q?0vLIpHsE9cotjh7oP6BVtHvcnGo+nm9lcVahJ69LK0rEJfNE1aqeuHSszmO7?=
 =?us-ascii?Q?7kdQldXP98qnORCwJzLeSY9hlO/uRJmpc+4EgR/fhl1mKfAwzQp1kLNNWd+l?=
 =?us-ascii?Q?sSJ2qMuE9xetqzot9t8pKxRtzmP9ghH/DDQ9A22XcXbDXUdLqi3ml2kXFPek?=
 =?us-ascii?Q?gnEI8o0ki2OSE2slTIOlOA0anCUprpF/Uu+g3gNOH2gHElpe9KlqBAHVToi1?=
 =?us-ascii?Q?2JbI1EfGaHyOk42OvLDtlMOw8szhLPo0Zh3XK6s82mPf8XGIZmE/676hsbmm?=
 =?us-ascii?Q?cIEvvpkbzD/UuhaxwcB8Orc3euGOn9a7EtYqFHGcbAdI/TBWZWNa/g3TbMs/?=
 =?us-ascii?Q?r2uozJcxtC5jFb09S+FAdtNeZRj6dGZCdy/vGV7ic4yxs0XcfcQB6smeXJSS?=
 =?us-ascii?Q?BzYuPytQSOHX86Upy8y5NhFm3Ey8XrIa4uJuOD68lr8T788BCkV8FQdtHzEd?=
 =?us-ascii?Q?TPxl35tzYn5xRCBLkSzb0WrDbZ9I2uzB2zccYgJs02LigTrArdVhu9s9IRBq?=
 =?us-ascii?Q?gijJ9y90pHxQy9a7kTTwB2eAzlgU53gLdoGzzaI00IdCRDwoTSWgm9uX9pDB?=
 =?us-ascii?Q?Sc4THiQrMCcIA+W3j9u2RDWY5MpFyDS8nd8UkST/mbAdyue0t+HWhJ2NKECc?=
 =?us-ascii?Q?PWkHdLrVqUEiOmn6ewuwLNb0ingDyArYyMEKOSozTXoviY+hOGW2CJ8orFhS?=
 =?us-ascii?Q?zZQuMlMfPsQlM+4cviUj4AAGdbUPs/YX5ivi3S3ympbq4wLInHEU2HvyH7uP?=
 =?us-ascii?Q?JxWgN7JHYftoX+UQbTaZnuSvo+6eQAQc0JR2y5miBP3kh82rGnfIeUphNQwC?=
 =?us-ascii?Q?bFHZcvbhoEekTKEyaAodPc3ivkdSedNBQUf7Hh13Rw4Hx3CqE2bKDXc083wm?=
 =?us-ascii?Q?BFiid19u1QR9nrX0wpEnhMOJOcY8EWItFPHSMvJT9ImxbKHRWYgd8/P19YRD?=
 =?us-ascii?Q?VB4IPz59dZoHyzPYbbvG9gvCNtYi/H4x/S96GO8D5LZjXVRFJk9Yu/FgAsz/?=
 =?us-ascii?Q?hYikrq8zch/Uw06I2LU5uqA8ETY0K/muRFE55gz4t/VxA53MnH+jhK/DfYbT?=
 =?us-ascii?Q?wexs5g/c3BSEvSJLhSswQ7V1/iiZTMkh6xtnt3DW3M9SNxWVhfnDxl5kGbR5?=
 =?us-ascii?Q?HEXIohQz3FeSUEmYD0tUqGTABwvBAchzioPxKz6PkXHX6PBy41JbCOfpmIoT?=
 =?us-ascii?Q?kcPYfOCJ7bcc3gnvaFpw8hBpVHCLdTB6p+bZl4AzPcaBjf14w7rhi5AlN2JA?=
 =?us-ascii?Q?RCQW0HFPHaK2Vk+oCUAkaaJmp++Gg7FIWFc55+f0DUjFUndQg1kPvqiWPzNW?=
 =?us-ascii?Q?xEN6oE/1x1po5cXxKziVPNEzj+Oa9yAKSLcxYrtDdws1zWhsN9vQ1YQ7NAFH?=
 =?us-ascii?Q?ky4aU92b1kszCvYunhP4UzUoqLa2ARU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840f5525-7b2c-40fa-06da-08da5024e776
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 05:47:45.8038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MR7tjKOJq6BIMLUNFKlemjwnpx/19ltShEjneQJdvGEXKyPL+tr00eCfbi05BSMCh6DaRziG+wTyKuwzZuBibwGgqaVs8VsQt2pGhHJm154=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1716
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=zhenzhong.duan@intel.com; helo=mga03.intel.com
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



>-----Original Message-----
>From: Michael S. Tsirkin <mst@redhat.com>
>Sent: Friday, June 17, 2022 1:31 PM
>To: Duan, Zhenzhong <zhenzhong.duan@intel.com>
>Cc: qemu-devel@nongnu.org; eric.auger@redhat.com
>Subject: Re: [PATCH] virtio-iommu: Fix the partial copy of probe request
>
>On Fri, Jun 17, 2022 at 11:43:48AM +0800, Zhenzhong Duan wrote:
>> The structure of probe request doesn't include the tail, this lead to
>> a few field is missed to be copied. Currently this isn't an issue as
>> those missed field belong to reserved field, just in case reserved
>> field will be used in the future.
>>
>> By this chance, also remove a few useless code.
>
>I think this code is there to future proof in case more fields are added.
>Please just post a bugfix patch. Also a Fixes tag can't hurt.

Got it, will do.

Thanks
Zhenzhong

