Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4F85AACAD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 12:41:49 +0200 (CEST)
Received: from localhost ([::1]:50306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU47Q-0003qC-M0
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 06:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oU41p-0006Sd-Et
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:36:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:57567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oU41n-0000Ro-AQ
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662114959; x=1693650959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xKMSPScEyZcTslUPuS0MwdeWza0y9WtSl0bbVSgDwLs=;
 b=akASCuhJefNTsWaFbMOAZxn3n5hPKvIqeMdTjfh71z8ExpftVazjUbq2
 70nGAyjeUiPKT9kYNjYE+O7cUjIkmBu9GkLBgd9Gb8wxuK871Tos59tAp
 X/HBgMAXmN174FzqM7gFYWEq8/kh+uckZPN/sXyW0lAeuYC9M6Okmns8u
 FMnCI6HDgFP3w1B6uQN9x9LwHjQlzw/D6V4mRECYoqh2/IX8G++oa5sn+
 y+50efpyjO4DRKCRq1c97u+abG3emfKUEa7JxYsdnrqK9rL8Amy/NWwnc
 iEBvCTxH1vJafeUHI/sVwFlcg9K/Jvb2RPkYQoZPf/PYuhwCD9WImXlra Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="295959795"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="295959795"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 03:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="642862085"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 02 Sep 2022 03:35:55 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 03:35:55 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 03:35:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 03:35:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 03:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HC/3PI8rmTX23K02ZtisqjBgdwP0TQqYMfaeun3TEQgt3AZRSgknqZXyDOA4GIlsMbMfFatRj53KJQ6SADu4FzPmJhFrn741YG0KVsKOAru6hknAJFjSjeN5q7QglOxV0QPKFBkjkgm5vdUENf1mgFPsAZYUNTBHG6/QN5SXzF9cwHkJ3/i8DqeCp7zzRzLctpo1O+gpQZRZHU4tDgyBHsMwyw+8tyiJpaNwl0J49HzK9t+2kReP3LkknQ/uQHH5uogJ629zdf8WL6QiL7F5eJUQTBGNtoiwm/3Srm5JMoMGm2RW5Ld/OcmvNAIgS7m6qQ2wkNvrHo7RUf1mu9o+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKMSPScEyZcTslUPuS0MwdeWza0y9WtSl0bbVSgDwLs=;
 b=AZgnIJ++XLEKktDwuiGpXl5Fv+b9HMOJ6LtSzpx6nbJXOF9E0mc7WbOsgEq5+pU3G28AXKRMcyzBL4DiBdyXDvOKeux4dKrVPzEUq4hcyZjjLwdvt+qZWCYUspXbEMj0f8/wZdNhqaulSgDJWpOD6yk8/aYH0BZ4qW2aQ9Akt6Rk8ujqf4cBHmyN7fFuJFxQ/KaSKsvYzGz5BytI+YXCRYRJbMUCltNn+evFfH1o4RhAGITV4IF5+9GBTtcYi/j2zE+glJyeZCqo55UBo/jlWfsyJoHhJSquf5qnbI7nsm9mgr2Wn2gBUHfr7XKScMAelgvhlHqsofQz90ffLySqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by IA0PR11MB7259.namprd11.prod.outlook.com
 (2603:10b6:208:43c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Fri, 2 Sep
 2022 10:35:45 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d73:edaf:8500:a40d]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d73:edaf:8500:a40d%5]) with mapi id 15.20.5588.012; Fri, 2 Sep 2022
 10:35:45 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "ehabkost@redhat.com" <ehabkost@redhat.com>, "Ma, XiangfeiX"
 <xiangfeix.ma@intel.com>, "Christopherson,, Sean" <seanjc@google.com>
Subject: RE: [PATCH v2] target/i386: Restore TSX features with taa-no
Thread-Topic: [PATCH v2] target/i386: Restore TSX features with taa-no
Thread-Index: AQHYl0S0CMIG806i9EqxnzjCnRg8d619gK4AgAEhGICATZ6C8A==
Date: Fri, 2 Sep 2022 10:35:45 +0000
Message-ID: <MWHPR1101MB2110C6A1C33AB546A37C192E927A9@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220714053631.417152-1-zhenzhong.duan@intel.com>
 <e7ec3a99-2c2c-81b7-9f02-80958dce5fbe@redhat.com>
 <e73117fa-2d90-fe26-a879-f4e77f7b1ea1@intel.com>
In-Reply-To: <e73117fa-2d90-fe26-a879-f4e77f7b1ea1@intel.com>
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
x-ms-office365-filtering-correlation-id: f368a114-dec3-41bc-4057-08da8ccee4bc
x-ms-traffictypediagnostic: IA0PR11MB7259:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sj70Shi9bM4qdcDqmKiOOBqdeW5g9TrL3uG4bFQ1pcdSTEaTurvsPtNPqjoWBwzvxwjB5cxl9yRj1fNcmor00n6duNtsV02+YCFJVLyi7hbor2l/IunF3iTu8Iwn2lFULMI9Fg/P+ncAfv2yO04fIcercBpS88LOBkJwR+kITd7/ylf/hBxtUphWtNcs282CpKY3kU3pki+8mDOKbmJeOnFFbjbKvAmumgZPbXnfscsZZg0yJZZIJKgL3CrMgU0d0ljQupr1MoiRXLyh0pwuxUkXpj7BN8VLhu2gY4pbJDHxBP/+sUBz+cCwW4YJuF15LwBdcUy/SIO+EYE/LsO5n+hiXG+oPb52p44lCqwsHibrIjKCCtirPnxmhLAX5y5bZCjLzvrFoxqLfIBTpY/MjFeSpm36K/3CctjPVSNzmO4F1w7hvCpinvzBYul4Fm0DVjew5n2gjuyTWQTEf7iSU6tyBlBbk/JOYu7Hfopi/6xXZCmKFvt3BMPSOQHDqcainD13Bpz3mIEBNE/6AuHUG1QPRvVIaAJ3IIOha1MqgaaVJwTVIxw1KxxrYC8yJaaVf6EkABZyixFohrtyS7AgG+N9k+4CEYIH+f8u0C6XjsCfbXyw8gqiEBefctVwrBhs9uRnMCTwSWdyj5cCAll461byiwaZvCQ5vgALKfNwwGUkQ0nTqjh7ewyeDrS0v2toJJUcbJZNCTl/g87kyQfrom2ZEoCG836TmfjNZV0oHGDGQaMOcCpDegPMjyn+4FfQuvKSkSTZIyUuxWzK0xWGQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(346002)(39860400002)(396003)(83380400001)(82960400001)(38070700005)(38100700002)(122000001)(55016003)(76116006)(66946007)(66556008)(66476007)(64756008)(66446008)(8676002)(110136005)(54906003)(4326008)(316002)(2906002)(52536014)(5660300002)(8936002)(53546011)(6506007)(7696005)(26005)(9686003)(186003)(71200400001)(478600001)(41300700001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjRuMC94Y2t0anBGanJUTDhPYUtvOGV6Q2FqOXJSeDZPbmFNY1J3aFhtZEFa?=
 =?utf-8?B?RGpKdE8xcWJyUlZKQUFhRHZXQkcxclZPaVVVL3BxblhnSC9yNm5LeFVWQ2tC?=
 =?utf-8?B?VStrb1VkaXV5dzZpN285Y2F5WnM4WnhPVHpYRTZYQWh3S2VSNkdtdGJDZ3hy?=
 =?utf-8?B?Mi9UUUJ6Z0xsY1Q1azRacm5MdjdCWVBkQnlrWjBBZWVGdGEwSmllUy80OGhI?=
 =?utf-8?B?bURRR1RnMFVzZThsV0I0WUg5WTBKMmRnRncrYmtaMTMyT3hFc2NzQXdpaEhr?=
 =?utf-8?B?bDBSbUxqODhnOWxqTGw5b0IyN2lIbEw0MnJIL0lPVU9ra2JkOG14UURxaGsx?=
 =?utf-8?B?dVhqQmRaUUF5V1JneCtxNjhMYTExWUVWMlBwRjZhY0VrTXllQkZwVisrWlJZ?=
 =?utf-8?B?ZmpDQnlNUTEvWHMzL2xoQWxMWFFtMjQwejlKeFUzT3pjUkgvNXp0TkYxYU5r?=
 =?utf-8?B?Y1pqU21XT0szRW1IVk9MVnBnSmMveE9keTRjVjNoMXV1MW1pZ09vcU9Gbm1V?=
 =?utf-8?B?QjlQVE4vamUyN0xEbGFuallwd2UrY2dyUGlia1EwMUtMWG1kays1MHlmdDR1?=
 =?utf-8?B?cVNrU0cvblEwN0xOWlErY2U2eVBOaTgxK2c4aVh5dndnSDE3MHpTck14UEFY?=
 =?utf-8?B?ZTducThwbEFOVFE5QTdPa1RFcklTSExKNlp3eHBUNFQvSm9GckVtSmQ5anVV?=
 =?utf-8?B?UmkzOUk4Q3hvVDRjZjEzaUF2NDJDd2FVS3hQcGF5dFhVNWFSZEZBOGJXK2dV?=
 =?utf-8?B?UVozOFd1VXI1SFllSXIzZlNqNWgwc2JTNjBqeE1JcHo2b2pDcVozMStwRzJo?=
 =?utf-8?B?VHRFMFJzeDlVcFMwa1doZ1NxVEMzWWxFZjRuQVVjaFRkSHRtaGNNUUIxU0Rn?=
 =?utf-8?B?NUFCMW10Vi91RFAvd2xuOHN2bFcydWIxUElEb3pDa2c1YjArVi8zVmhKZlFo?=
 =?utf-8?B?QmxzVUd2bzZOZUFFTVdYWnJsbGRLZFNJUkpiYmlsTzZBUTM5bm5raVphVjBC?=
 =?utf-8?B?WFlocEo4TmxMSnNXZXFZcWJlOXVyT0VhbDdKMjJLY2JEYXBvazRYTXJnQlFC?=
 =?utf-8?B?a24wb0x5YUhZYXhZMEQ1YUZ2aS9PWnRaNy91QjRQVHZOemZ1ODF1NDVWK2ov?=
 =?utf-8?B?YlhUaGhQbFgwN0cyb3puVlp3NEl2aHo0YWsvNHIyb1RtMzRvdTJnQmZ6VmMr?=
 =?utf-8?B?VE5VSlRHdEkzVXFLRU1PVlNzZ3E0SG5HSmM3RVVMYW5SMWsxL2lpcWlGc01V?=
 =?utf-8?B?N2l2Qmtoc1g3RkNLUGtUNEVTQUJ2NEN4QjRnMTZXTGdwcFQ3SWdSelljZVlF?=
 =?utf-8?B?eDh1OERVRlFPWG9vbDZ4Sks0L3N5QWVJdktpYVZqOUlDb004bmszTGR3RGh3?=
 =?utf-8?B?Sk9jWVJpSVBockNJc3ZGeTJoQlpzVHFaRDliVzlleWJjQmJYZW1BRXZRMFUx?=
 =?utf-8?B?a0VOWUt4bmNoYldXN0xUSlR6WnlTNlZaalNiQ2I3dFI2VEJkc2dpUUlaT1RL?=
 =?utf-8?B?ZzdxTE5PbGcwYU9TQWVKLzJJdE1yR051bng5T0wrQnZHRnVyYkRnYlp3a1NS?=
 =?utf-8?B?SjF6TUZLWXNPZUVKWHZOY2REUHYwb2ovWEU5b09tSFozcndqaGVLS1FXTW9N?=
 =?utf-8?B?VUFRdmY3REdKcTRoR3J4MTVUSGJ3OVFoWmVkSjdnOGE1RjJ4MkcxRTZORkU2?=
 =?utf-8?B?Q2lHeVBIeXRCNVQ1Mit1WHJ3Ym96NjV6N0lwSlVKNjZkZlAvTGVBZEUxR2hw?=
 =?utf-8?B?OStwRVpYdWRwV05QeDdYbVUvZ0RQVDF3clJpQXNXZUh3NURWdU55YjFwQ3pu?=
 =?utf-8?B?UUlLRTVVaWxhcmVVZmJFZzhZK3pPSkF4eFg2UFhxVHRKTE9UWmRTNG1LMW55?=
 =?utf-8?B?c0RZR3JqcmNHczAveUw0d0JQN3J6WWtXcXJEMjdrZi9ZQ1d6MWFkZ0swMEZ6?=
 =?utf-8?B?UXdOUXpOcTVpaExmZHBOcEdJdTk0TVlBRFhPRThQSm9IZEIrcTVQMVorZzdr?=
 =?utf-8?B?dHF0eW9EbE9nWHc0ell3Z0lRZ05YYWNHc21adHR0NkhkMFdhUGhoWEs5Y09X?=
 =?utf-8?B?N0pPbVl3YmRSL3c0Ylh4ajRlK0hnemJEQnJGcXJDUXFNZUNZM1REbmdCdGo4?=
 =?utf-8?Q?vQzB6JoHDVTSht/FqiGcBHjS1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f368a114-dec3-41bc-4057-08da8ccee4bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 10:35:45.4728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tFP16k04WIdBhiYOkCqNo/gnEAwW8GjooOm9H3o5NZNQnckdq9kNqVAHajkjLWp+v8VUxxsSyJl+cdvTRLlbVARu47LBm0oDKt/sZ7XWQl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
X-OriginatorOrg: intel.com
Received-SPF: permerror client-ip=192.55.52.115;
 envelope-from=zhenzhong.duan@intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TZW50OiBGcmlkYXksIEp1bHkgMTUsIDIwMjIgOToxNCBBTQ0K
PlRvOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsgRHVhbiwgWmhlbnpob25n
DQo+PHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPkNj
OiBlaGFia29zdEByZWRoYXQuY29tOyBNYSwgWGlhbmdmZWlYIDx4aWFuZ2ZlaXgubWFAaW50ZWwu
Y29tPjsNCj5DaHJpc3RvcGhlcnNvbiwsIFNlYW4gPHNlYW5qY0Bnb29nbGUuY29tPg0KPlN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjJdIHRhcmdldC9pMzg2OiBSZXN0b3JlIFRTWCBmZWF0dXJlcyB3aXRo
IHRhYS1ubw0KPg0KPk9uIDcvMTQvMjAyMiAzOjU5IFBNLCBQYW9sbyBCb256aW5pIHdyb3RlOg0K
Pj4gT24gNy8xNC8yMiAwNzozNiwgWmhlbnpob25nIER1YW4gd3JvdGU6DQo+Pj4gT24gSUNYLTJT
MiBob3N0LCB3aGVuIHJ1biBMMiBndWVzdCB3aXRoIGJvdGggTDEvTDIgdXNpbmcNCj4+PiBJY2Vs
YWtlLVNlcnZlci12Mw0KPj4+IG9yIGFib3ZlLCB3ZSBnb3QgYmVsb3cgd2FybmluZzoNCj4+Pg0K
Pj4+ICJ3YXJuaW5nOiBob3N0IGRvZXNuJ3Qgc3VwcG9ydCByZXF1ZXN0ZWQgZmVhdHVyZTogTVNS
KDEwQUgpLnRhYS1ubw0KPj4+IFtiaXQgOF0iDQo+Pj4NCj4+PiBUaGlzIGlzIGJlY2F1c2UgTDEg
S1ZNIGRvZXNuJ3QgZXhwb3NlIHRhYS1ubyB0byBMMiBpZiBSVE0gaXMNCj4+PiBkaXNhYmxlZCwg
dGhlbiBzdGFydGluZyBMMiBxZW11IHRyaWdnZXJzIHRoZSB3YXJuaW5nLg0KPj4+DQo+Pj4gRml4
IGl0IGJ5IHJlc3RvcmluZyBUU1ggZmVhdHVyZXMgaW4gSWNlbGFrZS1TZXJ2ZXItdjMsIHdoaWNo
IG1heSBhbHNvDQo+Pj4gaGVscCBndWVzdCBwZXJmb3JtYW5jZSBpZiBob3N0IGlzbid0IHN1c2Nl
cHRpYmxlIHRvIFRTWCBBc3luYyBBYm9ydA0KPj4+IChUQUEpIHZ1bG5lcmFiaWxpdGllcy4NCj4+
Pg0KPj4+IEZpeGVzOiBkOTY1ZGMzNTU5MmQgKCJ0YXJnZXQvaTM4NjogQWRkIEFSQ0hfQ0FQQUJJ
TElUSUVTIHJlbGF0ZWQgYml0cw0KPj4+IGludG8gSWNlbGFrZS1TZXJ2ZXIgQ1BVIG1vZGVsIikN
Cj4+PiBUZXN0ZWQtYnk6IFhpYW5nZmVpIE1hIDx4aWFuZ2ZlaXgubWFAaW50ZWwuY29tPg0KPj4+
IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+
DQo+Pj4gLS0tDQo+Pj4gdjI6IFJld3JpdGUgY29tbWl0IG1lc3NhZ2UNCj4+DQo+PiBXaHkgd291
bGRuJ3QgdGhlIGZpeCBiZSAoaW4gYW4gSWNlbGFrZS1TZXJ2ZXItdjQgbW9kZWwpIHRvIHJlbW92
ZSB0YWEtbm8/DQo+DQo+UHJvZHVjdGlvbiBJY2VsYWtlIHNpbGljb24gc2hvdWxkIGhhdmUgdGhl
IHRhYS1ubyBzZXQsIHRoYXQncyB0aGUgcmVhc29uIHRhYS1ubw0KPndhcyBhZGRlZCBpbiB2MyBt
b2RlbC4NCj4NCj5XaGVuIHRhYS1ubyBwcmVzZW50cywgaXQncyBzYWZlIHRvIGJyaW5nIFRTWCBm
ZWF0dXJlcyBiYWNrLg0KPg0KPkknbSB3b25kZXJpbmcgaWYgd2UgbmVlZCBhIG5ldyB2ZXJzaW9u
ICh2NykgZm9yIHRoaXMgY2hhbmdlLg0KDQpQaW5nLiBBbnkgZnVydGhlciBzdWdnZXN0aW9uIG9u
IHdoaWNoIHdheSB0byBnbyBhaGVhZD8gVGhhbmtzDQoNClpoZW56aG9uZw0K

