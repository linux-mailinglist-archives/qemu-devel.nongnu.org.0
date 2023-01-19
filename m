Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA75672FC0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 04:52:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pILxm-0003eV-By; Wed, 18 Jan 2023 22:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pILxk-0003aa-4v
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 22:51:40 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pILxi-0004uX-5O
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 22:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674100298; x=1705636298;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=dFO8kEe7bD0ePjbMqYnxO5WXokIqdv+46yU9giY5H2Y=;
 b=UoaHlzcC/5U/z4HEXS04e4eYZ/yTu3suzPrhwDEAEuUZjVUFzaC8WKWI
 81ONarRRoBxVHHaFcgfAap+R89oTpEcNUVpOZy3TPhCeiDawzI78cZcix
 JOCmB4lF/f2oI0KfWBSOWOsO8kQGLl/+EfrzIogoU0sXnTtP4S8M9ta2c
 K3MJYMHVVN27LXU42a8QCCy62RxXJmFpRj8DYaxO2F7sWraacmc6bk5TC
 vVDPams5SaYv5HJQzUqeTlU6XZ9ZQIp6wUdjvDgBoVCcqc0pH/G7wEGfd
 DKBDjsd9hCP5SYoTR6YUeOyl/drJPOCkRC1mG3mDsnAhRrzl9BT4WiuAH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411424318"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="411424318"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 19:51:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="768029758"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="768029758"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 19:51:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:51:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 19:51:35 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 19:51:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fF3IxwScNjllyll+gesWwhgxp+/bjcI99m2Qi392BvGwUVaOzy/kOm437JjiIpXV+d4BK1S1RBPuLqOoMHyM9lPvmF1if+BAhAGJQ5lJGoUcfhtTRqnvSEE/VpIUzKHo/0JovT2aXWt8rzt8S2c+zYR/qLK6i0YaRrxsX4M7KuXFRU6uZttpBFLxWd6/4fwULeT1mgYi2VVPOUrAAQRr5HctDxav2iGdtsCleMaaTcl2HHXcyhlMYlZw5I457bJ9bpKXRtMq2nj5wKKU77DzeJdXF6WxNnBiXBalStMwAW5HVkRtwItbDzTi/tq4MNVapCtWeG18cijWP3IWIIV/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFO8kEe7bD0ePjbMqYnxO5WXokIqdv+46yU9giY5H2Y=;
 b=X6FIJ2yETS9f+DUNMBsfJR+DO/2d9OBz3OhVIeatAxHEtvbE6G02A1uwOwTyIsg4XB2AIVMA4ACLA8DEud+8M7vqz8oOlrtft3FZcwEyOxhf+0Z6X8xYO2j/9rBKTnJ+Wu3RS/W1ukS9oh1DpL09Z2OLr/VjIUzYdOJRw34O14j6PtJqYBXureGE0FOXqRwoDKY0FNQcGJ1QlLsKESl8MfaxWhLf8+cIIRsV6lvbiUupO2QVX8Zef/ln4JEhCGSG82v08JGAoe46ZbUYMyXpGs9sZGHekFGzYPaE7fJ+KOUi3FyFr0ClN2a8iC3k6/xVxjV6jDp1dRgnGwmNXGA4Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 03:51:33 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3%5]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 03:51:33 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>
Subject: Recall: Announcement of aboring HAXM maintenance
Thread-Topic: Announcement of aboring HAXM maintenance
Thread-Index: AQHZK7lSWpTReASjDUq0plYjqtt/dA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Thu, 19 Jan 2023 03:51:33 +0000
Message-ID: <DM6PR11MB409024D8135D6E552471985687C49@DM6PR11MB4090.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|IA1PR11MB7775:EE_
x-ms-office365-filtering-correlation-id: f2e204df-8c8f-4159-2c23-08daf9d074e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 64Y3oNnLsd6ZICi+sb57KKdSuNgfgxt4TpARXcgqPf5A1WBjrQf8ZFob8kvfwArHzNxwaBSSXC1eqJv5sGBfF8EGOaG7IRcmZkteLrvfrM4/Oor0Ly0JVx97PGmFjn34c9R1lY2XeecTvk+fbr0+s/CElsCHm/aQLVzxENdArG8m1Mz/8Aj4nUjqB7anPqF1o/vMEY1TJtm5k8Ra4Ci+PbBXstIOT1PKcBn66RgF3KcEuh8UKgA10JeUhyngDzD9nVZlF1wVLlcCjSap8VwS3EWxH0E8/Q/LrrasWeVYUNgYRhm68Mb6iosz95am3FXbqrwdrF3CwsL7+PucLmiFZlsQYOznQ32GtAPf7XpgpxUVFTcwQ6qIn5LIzA1B/BtKkhbh7KpACZ1hYEYNKHGH6mDbky485B1UTAtx2T2uwLAiD51ervO2cztGFT427gtRs+IGzt0llzrQkxeiJgAqYnzAh+QrRmhWNepB5u6h+npD2WzKLFPVjxLfJzOTT9Srsx8I601vPYKv7bb+SWl0/FofsJdIP4tO54hva4bycya3zwRTyZEZZynkI1doZ0reaHX2oA5cYVY8Sjw2qfmay4LEAuwH8exsfEs4SV8SLGGyrb70U5ozaOsefONUtoeDvN5OM/DE932FYiH4V65QEzM5EOvIyyoAv5ZiYbpzPBtYTMrplthpGt+YBkFL0UIRJ5J8HtHw+XbOBwAl7sp6dw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(86362001)(33656002)(66556008)(186003)(558084003)(26005)(4270600006)(66476007)(4326008)(76116006)(66946007)(41300700001)(64756008)(66446008)(9686003)(8676002)(6506007)(55016003)(2906002)(71200400001)(110136005)(316002)(38100700002)(7696005)(478600001)(38070700005)(122000001)(82960400001)(52536014)(83380400001)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JsiPMkeclzNnXyMkATkbD7UoME0tn4H5z8sgyV0GR95fyyBUkWvpCGUwEB?=
 =?iso-8859-1?Q?m8Apz0Yyc5SR5xuQLEoYNQmh5X86UdKzYzY3WxBc+QNaGoTYJQi3FwhHoY?=
 =?iso-8859-1?Q?HP5VOyMnNwfANpISIsJzrmsVNn+1oRy32oiBd6ZE9n3zjpQ7jGLPVEHRko?=
 =?iso-8859-1?Q?BUVktDKm6p4ynaOcV6g1WGlbKq0O8MX7rq4j9NtUFdmn4u20ykoQxIUskX?=
 =?iso-8859-1?Q?c2CHQ+bgIjgz7f6J62wpGSkH9/EHQikoDIff3ki6f2cMm0lI5U+P/w8di1?=
 =?iso-8859-1?Q?j4cF2GYlEHdXgMBUfsh0BtMI7/PLtIvdzU6BdkruJfraRtHxP7vQb/nTHa?=
 =?iso-8859-1?Q?B9wC6wOOOEWp0tca8dnh8LC2CEWi/mwCdB+fkONBlFHDtTky3qKYta8Fu5?=
 =?iso-8859-1?Q?ty5+lgL5/JxTl8MbFvxcaJsKJ8Sv9ihbW262pKZ8tkRt9zk4PeY7xu14OI?=
 =?iso-8859-1?Q?YjYwsdcoTGens1fTQAWbrhfbZMrLum/rGRCeqXbKrb3gAO3hRJBp+ZtOhC?=
 =?iso-8859-1?Q?eCRSb93nW0owQgCSA2XQw6RcxFmSS1MXVlDtidW/bT92a3qfpzzS9L/gSu?=
 =?iso-8859-1?Q?cUwLWTjBqt2TIOTvRRscYpyrCKHd+zpnfrA0KAJl7jEPRcWSAmYVTGmg08?=
 =?iso-8859-1?Q?EBvxHyApOUzEi02ppdo3EYhHjhqA6MIgWB76FyqJELGEz7jtdzlZcrASGb?=
 =?iso-8859-1?Q?fymU3ROoj3EiVdMr7sN7I3D79QYrybKY034+MxhXNs8tt2zv4mYI3l0/k0?=
 =?iso-8859-1?Q?O4G7Y7EU++3kyH2a/j0UPYQ0FFpWVZnuEbINyw29X2C8LYjUHoAT33cesA?=
 =?iso-8859-1?Q?4RWpMuhF4xR/hzn6/JXcN4purToaqnWApD3QsGkQnZEtI41aD0V3aslhqD?=
 =?iso-8859-1?Q?kwLP8HLgUHsUmfaBT2B40DLmIbTfB6TR8qRmxjtZmGh+G0/kf+K5oYqF3C?=
 =?iso-8859-1?Q?yUUg6jrGP5DFGMlDG2LgvvWIBfoQUAanOBzV+v7qG4tEPnitOBWkGzPuQZ?=
 =?iso-8859-1?Q?GFSvSCUnUvigyl9oI/GoYnM5zDczISHBHRQ9Z4ngEkZVaGv0k4rGLjSjP+?=
 =?iso-8859-1?Q?Y//7EtVQrjjWuUTqcaacrS26EshOMelQQWGFoDRfAVGXNatMOl9jJQj11Y?=
 =?iso-8859-1?Q?UWC97/qRTnjPc36gEuOUNE+o9V/w6oe00SERVzeir2SNiYF2Fen7fU9ioH?=
 =?iso-8859-1?Q?MFZp3sRRSfeGttrtL2DaDTfKG+jr/FtMO201QLUoUs6WrAIxZnU3pRU06M?=
 =?iso-8859-1?Q?F/VM/Bgi+Zyh6QvNXjCbGM9qMF9lapqJO+9R/q1o+vnva7GLqSU2Dxkyw3?=
 =?iso-8859-1?Q?tvIjDLtcIhBk6yWAiF6IUWrl/EXnKwPcSw5vvj/81ZJCnf2y/5dWoemoAa?=
 =?iso-8859-1?Q?LYFm5QDILDQ6QOz/N7e7DMMEQ4ce1nmhYCM1UB8ryBx8oBI3lKa1TtKrnm?=
 =?iso-8859-1?Q?dNBbmPv+1rAbA2YXI0X9wAHEebo6zFVHqXlDROvNsOM+jPOwmBcujrYF/W?=
 =?iso-8859-1?Q?KXMe0FSUOM7ydFdziEpsokUbU8Nzpz0aKxTh2qQp9GIpC26QY6q5j2WIxR?=
 =?iso-8859-1?Q?A4WuxQ+oP4wZ3v3b6NSwDGqWMBwNS3bFzBQgGTDJjdi6/RaAWfHzMEyl6u?=
 =?iso-8859-1?Q?SXokQdM/cvTXlCyDLLihMkwyOxfwJ7QjUJ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e204df-8c8f-4159-2c23-08daf9d074e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 03:51:33.5567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kN6Y7IsO2q9Clthax421qEb2SUq1twrFJnlEf4AgtY65WekTKVaN4Cf/FhIclSKjquayhAz9RXmQd/PkeJLrRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=wenchao.wang@intel.com;
 helo=mga05.intel.com
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

Wang, Wenchao would like to recall the message, "Announcement of aboring HA=
XM maintenance".=

