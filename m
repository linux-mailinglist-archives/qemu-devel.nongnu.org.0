Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E74E8E5C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 08:50:14 +0200 (CEST)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYjCf-000426-G0
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 02:50:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nYjAJ-0002lJ-K4
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 02:47:48 -0400
Received: from mga01.intel.com ([192.55.52.88]:61117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nYjAB-0000BA-VO
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 02:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648450061; x=1679986061;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dJ8AjCAuOP5JGW+f1nMgvZtF8i/+2S4FlQRDNevdfFM=;
 b=eAEp0SSHQlZv6a2gTkCIEQZ2kwtYjE28I1I0NDXwIjqyS0OjAWXymjx5
 JBSU6ZQsBwwyGsSN2WSlhY0DzMQ2BTND2sIVc+QV1xRpl0h4Gn8Tmi4g+
 qHn2i1nIQ5YwVGAABTDK9GYCLFkLt69asQRwuuJrfcw3COG0c02YYM6TG
 XfHumGJKnnbLd7+tzWiFUGOorqf2j9HAFGH+mTFEI+wfY3l46P08QP6Ui
 Jn0jQuMOlbA/uViONPqaQGXQTAo3UDz42QdpCk6DP+eD5gIAW+DdKLsFP
 4MkrZcYDaynYBGhnQDXuiZv00Vje4Yz9Oq+wtfxR6DU9FsBbwcVPkA1h4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="283812889"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; d="scan'208";a="283812889"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2022 23:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; d="scan'208";a="517848257"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 27 Mar 2022 23:47:13 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 27 Mar 2022 23:47:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 27 Mar 2022 23:47:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 27 Mar 2022 23:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNyLQXAUIfTjT+fUJx3G3XmdzrFkBAZ5K566eRvaVOV103ZLoO9nvZbh4lx04GBkan570iEnu/majm/749ZgVxNHLQEHMJDudNbI+1FlpZkArL3m1rZ5I7UORzvQ2hQm+ueQG1/Mg6jcBUQ/UEzpBzruojLXkJnng6+62KTkfyPIimACucexPVyUYc8OiN1vrBbmjTLl65YNAt23xcbdwPJJTEkxlux5CMK3aXeETj0HfStKJsvjP4Ca3KBI07pOlK7C6C5KrMAlBF1Gurntf+JIfahChWAgsXBlJ3IFXXzsZgQQyZmj3x7Z3LkOhP8SexXKskEpqbR9KHRKgqzDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ8AjCAuOP5JGW+f1nMgvZtF8i/+2S4FlQRDNevdfFM=;
 b=VickJV9R4MwDLnR0xj5TTBOEXsmoUeqdx1vxCuYHjgMQzbZ3mnietC3hMS7wIXiaGQk1TNN2oBUiYiLdNb+K5cYWk5RDOUh78vrnNQncRdsS0wAEUCT+dQw6V5V86NLNdJvMJT6ux77YtXiVtlg0YxXOWMc7smn/AJvAyaJTy2oaZIHmeriaWPbd+4YpBCYCLnAR6C09RxYaFiDP1njB/DR1+KqJqc+5VYy0eAG7LSjxfgiZ2M3VyrBjYIA+xS52vbFZ43/8GEj0Bg8nn71CXCeScCN5E3RSBdEJ7tcvZv+YB+9CFqGSsOhJOaAip9kMuhYCV0L/Re+ZyXPrJb/gqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BL3PR11MB5714.namprd11.prod.outlook.com (2603:10b6:208:351::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Mon, 28 Mar
 2022 06:47:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 06:47:11 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Topic: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Index: AQHYPOjLkFETw43vekSHA4amP0dz7KzOPTaQgAXgw4CAAD9wkA==
Date: Mon, 28 Mar 2022 06:47:11 +0000
Message-ID: <BN9PR11MB52767EA8BF5EA39488D149408C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtr5byTaRFQT-ut6=ziyOTKBgne_Xa2qu4Nu9Z7sDDmBg@mail.gmail.com>
In-Reply-To: <CACGkMEtr5byTaRFQT-ut6=ziyOTKBgne_Xa2qu4Nu9Z7sDDmBg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0047ce54-732e-455d-66f4-08da1086c93a
x-ms-traffictypediagnostic: BL3PR11MB5714:EE_
x-microsoft-antispam-prvs: <BL3PR11MB571402AA9B8370CB9DF0813C8C1D9@BL3PR11MB5714.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r8NEVlET4Tz9qfF0mb7n9AkoGeJUzHlgE6RrqxhfjoKV+7+rKvE8l+n88TnfSrOExz/EXAUAYXtI2POtdw4yfDG+3uqv0oPVt+8QAv3Tyc9M+GaNYUABdF7oe6S27j/5qy8MAe3yBMK5eAXWKSJy5pXIqEKeg5VzBdRm5KIe2fo3gpoenrjYE8JVd0aafRjlBc8i79hVC2yX9Q5TKBHX+dA+/NNZhRbMOKB5TBS/QqqINWqNGI3ZcJUveCLdq6VuyUaVyYDrWdWBWN3QXU3hZ/Xr1xY8AniWlHZledheTiJqvlgTs/nwLe4wKoRpoq+9jmXbO7MMrG4qeD8DwIa+EpzyjnAszINMAxHQdE9NPwWSu3Y3UGLNzFKqengOKLRj+ecdtK6sPX+22zf4Fd879xUDW2Qz8DlazjwQ7Wcyf8zFlBLKhi8Ux86OdV9grz6Al7ehtHYe9SF8d8hx0OX6nNTEb+KblB8i9Xp+hUXSOCq1ykcIU/x4yawA+EzXRONVocG4/rkmBIBEf4RxbAim7/OPJPQWQMS9eVfKXAiKSZKZu3GweCqQQeE9m4j2KHsxeYBg+3RpDDxmHIPe5lh2sDnZe6UiCllLfYUyA9/F2hwo778IE7v3cc8MvBFMra1CcOIsbLHGPEb1Iugok5qF2xipVtW1kfFTxVRDd70nZJ1R0nDUK/u+eHFYKe638zCfev7KwOHN5mULyG0XkE245b/TArGuAfz3MbVtkIMxVXCP75q6NNXPskz9Wn4RVg5azIfvUyDiftzpN1V3SdmXWfQxH+Yoisykz9NjVyqDTJc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(8936002)(52536014)(6506007)(7696005)(86362001)(316002)(38100700002)(71200400001)(53546011)(5660300002)(82960400001)(508600001)(186003)(26005)(122000001)(76116006)(966005)(4326008)(8676002)(83380400001)(33656002)(64756008)(54906003)(66946007)(6916009)(66556008)(55016003)(66476007)(9686003)(2906002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eE9JRlN6eWI1UWJRcVUvbkdRUVlEd1lsY3ZuOU9rTGo3b1FzSHozbU0zMEV5?=
 =?utf-8?B?UHUrNVdra0Jnc2ZadGo1SlVnZDNVMU5rTzZQMlNzS1dWckRnR0lKd0hYeDM0?=
 =?utf-8?B?aUI5Z1FFTzlYUzhIY2FNdUt6eDlLL0RzZzBSSkcxZnBkeUtBeXNxanNGRjlr?=
 =?utf-8?B?VXFpNENsZFRUYW0rTk9kaTRIRFBUQS9ubHFLLzEyUHNHMVA3bHNQeExFQk5G?=
 =?utf-8?B?bDhDT2Nlalg0a1BjMi9lQ1RLZEZtSm1BRTk3ZElaallVQktvaXM4d29HSXpj?=
 =?utf-8?B?T1c5aWJSWXJTczNwYUd4VmpGTGk2c0g4Tk0xWVFNQjExSXZnWlgxREdmM0Fr?=
 =?utf-8?B?a09oZXdCTkdoSnUyUitFTVdLMkdUZEpGSmFaYlBEWTR2Y1dZSHhCUEVuMVNV?=
 =?utf-8?B?N0VIZUhQRk11UXFhQmtVTjErN21RSHc2Ry9xUG5wV21PVUZLR2JJdU1mNjFp?=
 =?utf-8?B?bWR2U1R6T0EwMTRQUVFiOW9lT1ArNGNuNjNCMUJHZzU3NnN0NFpZV0x3NC85?=
 =?utf-8?B?dGNROGRxWlh1aFU4YUZNNmV4NEZiYW0zVUZBL3lDekh2Qm1hemw5Nm9GYUg2?=
 =?utf-8?B?Q3JOSWRoL2FCMzFMd1hkRFRwR25pUW80Yi84dVNEZjdZWjhvbVBqOW5Sd3No?=
 =?utf-8?B?S056NklqbDBHZ1NGZFI1NGkwbHgvcnlsWWtTb3JRL2tjelNyWER4U2VNb2Ru?=
 =?utf-8?B?eHkxeUhzTFRrdUprRWJZWmRaOTg0bG9sazlzbHhGZFdGS05NOFA5SEo4VER4?=
 =?utf-8?B?dG8ydVJjMzBYSjFmcWZUdEdIYm9WMXd3dDhNSmErOENkaDU0RnMyVHFNYVpQ?=
 =?utf-8?B?VEJjak5uemRlTW5KZ3hvUWQ5SFpZbHZ0dWhIUmhaSGhmS3kyYWd4TGFCNlBx?=
 =?utf-8?B?T3Rnd0MxVE44MWtLdEhwcng0amk5MkpieWxPQkJGNE9MWEJZNm1zSDdoQnZ3?=
 =?utf-8?B?a0Vsb3Z0V1dsUVRWQzhlT056VlJsak1DSm5QWmJLRy91dlZJS1RSTkt2ekJ1?=
 =?utf-8?B?OFh0YXhhQ1VnWjF6NU5FYllCOFhDMFZsTlNuMEVKRmM5bDNTUXpwNjA0Q0Qw?=
 =?utf-8?B?Y2J1VDhvN3ZtcHFXSDlMNERPNkRTWnhRSW5TaUdUTlZsMkpDaHJwcElrSWNw?=
 =?utf-8?B?MTlEZVI2Y0VoaTl5cTZWelNJT3FDWWV1ejVJNVVqeG1pRHN1Z3NEV3NQWHdL?=
 =?utf-8?B?elpDUHhzNnR6a1d6RFNhQ0ppQ29MQWV6ZnJNZGFlUms5Vm5hUS9GRkc3Skc4?=
 =?utf-8?B?dEk5WHhIWjhLYlBxaytLY0dsRWZFU2JFc3hDUTVqNGY5eXZWWmx3eHozMndp?=
 =?utf-8?B?RkhMLzEySlczd1IrMmNqdEZ6TmpEeStBaURxa1g2cFVGR0o0TU4vTVNvOG5n?=
 =?utf-8?B?RytHeHBWb2l6cEtaamQ2aG9lTTMrTGJjRE1zeHJtWXRNTmtacGpKQmNUTW9Y?=
 =?utf-8?B?Rng1dk1tUFQwQkdJMGNMVHc3cUplblVaK0FGdVNPNmdoa2dzejdnczRmNllU?=
 =?utf-8?B?K0czTE90U1IzMCs2QVlPTXVXYjFyNldVL1NYQU1kTTh0T2xXM3hyREdsbWJy?=
 =?utf-8?B?ZUM2MjFHeG5xVHphU3JHWU9IQThZZ1BEeFAxMHRNQ2Q2Y3BMTE10UFNkWWhR?=
 =?utf-8?B?cEZOWXFrV3UzeVRnUU5BdWxLc0F4LzhnTTUrYXA0RWVEajQyWFh4eDN3aTd6?=
 =?utf-8?B?OERxOVo5M0VlNUdGenpLZHY5eVV0YThCTzF4elkwTVdzeHo2MkpFNWdPOURk?=
 =?utf-8?B?WkVTN0xUbUNCS1J4NkZYM2FQMjF0SXR4MEl5VzllUHZuVmdpWkxvajM5eWYr?=
 =?utf-8?B?UklCcFhuQVpoU09PTzBteEJKdjRGNnJ1a0RyeW8vaDhyVUQ5NmVyTzdPMzAx?=
 =?utf-8?B?M1oramp3Y1U0ajhmTURUQ2FhR0FnTzV4Q3NRRXpKVUsrTWwzeUVSbTZzSzBG?=
 =?utf-8?B?M3F5cWM1MXNTM2tCa2RmcXhubjNzOTk4VThIM091RHZGOXlEV1JxdmVhMUdF?=
 =?utf-8?B?bE44VmZ6SWI3QVBuMEtMamJnVGcwRkMrYU9uaC9HZjlJaTFyTnI0ZHEzYmkw?=
 =?utf-8?B?cUxtanNhMGFCMzFNdXJpN1Jjak4wMUZhQkhSMHRUSXJscytZRE9oM0pMNnZv?=
 =?utf-8?B?UU16VjdWTFBuMnRzYzdta1BvRlNwblEzc3llU0tXZi90eDdPeE9qNGtTaVdX?=
 =?utf-8?B?aUFoYjB6eVFadUdCVDNjcTM3QnJhby9mSFBBaFQzdkhKdGVNWXA4TFhDU2hM?=
 =?utf-8?B?ZjBpRVcwbUIvNzhmZnZCMEtIbCtOWlRZYUJLeGRYWEtnaVFZN29PdUdrY2RD?=
 =?utf-8?B?dk0raUZSeVA5cFpORkRwSVVCUW15OCsyTjZXQ202WTdSaTNkRmIwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0047ce54-732e-455d-66f4-08da1086c93a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 06:47:11.3106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VN1NB0AQYjZF9OfRDPYYEMdB4URHxq6GmRnVozLxzr/K1/08a8dDTCwPGomijQO/v9qjI62iT2dIc1hU5aiJpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5714
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=kevin.tian@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBNb25kYXks
IE1hcmNoIDI4LCAyMDIyIDEwOjMxIEFNDQo+IA0KPiBPbiBUaHUsIE1hciAyNCwgMjAyMiBhdCA0
OjU0IFBNIFRpYW4sIEtldmluIDxrZXZpbi50aWFuQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4g
PiA+IEZyb206IEphc29uIFdhbmcNCj4gPiA+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMjEsIDIwMjIg
MTo1NCBQTQ0KPiA+ID4NCj4gPiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlIEVDQVBfUEFTSUQgdmlh
ICJ4LXBhc2lkLW1vZGUiLiBCYXNlZCBvbiB0aGUNCj4gPiA+IGV4aXN0aW5nIHN1cHBvcnQgZm9y
IHNjYWxhYmxlIG1vZGUsIHdlIG5lZWQgdG8gaW1wbGVtZW50IHRoZSBmb2xsb3dpbmcNCj4gPiA+
IG1pc3NpbmcgcGFydHM6DQo+ID4gPg0KPiA+ID4gMSkgdGFnIFZUREFkZHJlc3NTcGFjZSB3aXRo
IFBBU0lEIGFuZCBzdXBwb3J0IElPTU1VL0RNQQ0KPiB0cmFuc2xhdGlvbg0KPiA+ID4gICAgd2l0
aCBQQVNJRA0KPiA+ID4gMikgdGFnIElPVExCIHdpdGggUEFTSUQNCj4gPg0KPiA+IGFuZCBpbnZh
bGlkYXRlIGRlc2MgdG8gZmx1c2ggUEFTSUQgaW90bGIsIHdoaWNoIHNlZW1zIG1pc3NpbmcgaW4g
dGhpcyBwYXRjaC4NCj4gDQo+IEl0IGV4aXN0ZWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24sIGJ1
dCBpdCBsb29rcyBsaWtlIGl0IHdpbGwgYmUgdXNlZA0KPiBvbmx5IGZvciB0aGUgZmlyc3QgbGV2
ZWwgcGFnZSB0YWJsZSB3aGljaCBpcyBub3Qgc3VwcG9ydGVkIHJpZ2h0IG5vdy4NCj4gU28gSSBk
ZWxldGVkIHRoZSBjb2Rlcy4NCg0KWW91IGFyZSByaWdodC4gQnV0IHRoZXJlIGlzIGFsc28gUEFT
SUQtYmFzZWQgZGV2aWNlIFRMQiBpbnZhbGlkYXRlIGRlc2NyaXB0b3INCndoaWNoIGlzIG9ydGhv
Z29uYWwgdG8gMXN0IHZzLiAybmQgbGV2ZWwgdGhpbmcuIElmIHdlIGRvbid0IHdhbnQgdG8gYnJl
YWsgdGhlDQpzcGVjIHdpdGggdGhpcyBzZXJpZXMgdGhlbiB0aGVyZSB3aWxsIG5lZWQgYSB3YXkg
dG8gcHJldmVudCB0aGUgdXNlciBmcm9tDQpzZXR0aW5nIGJvdGggImRldmljZS1pb3RsYiIgYW5k
ICJ4LXBhc2lkLW1vZGUiIHRvZ2V0aGVyLg0KDQo+IA0KPiA+DQo+ID4gPiAzKSBQQVNJRCBjYWNo
ZSBhbmQgaXRzIGZsdXNoDQo+ID4gPiA0KSBGYXVsdCByZWNvcmRpbmcgd2l0aCBQQVNJRA0KPiA+
ID4NCj4gPiA+IEZvciBzaW1wbGljaXR5Og0KPiA+ID4NCj4gPiA+IDEpIFBBU0lEIGNhY2hlIGlz
IG5vdCBpbXBsZW1lbnRlZCBzbyB3ZSBjYW4gc2ltcGx5IGltcGxlbWVudCB0aGUgUEFTSUQNCj4g
PiA+IGNhY2hlIGZsdXNoIGFzIGEgbm9wLg0KPiA+ID4gMikgRmF1bHQgcmVjb3JkaW5nIHdpdGgg
UEFTSUQgaXMgbm90IHN1cHBvcnRlZCwgTkZSIGlzIG5vdCBjaGFuZ2VkLg0KPiA+ID4NCj4gPiA+
IEFsbCBvZiB0aGUgYWJvdmUgaXMgbm90IG1hbmRhdG9yeSBhbmQgY291bGQgYmUgaW1wbGVtZW50
ZWQgaW4gdGhlDQo+ID4gPiBmdXR1cmUuDQo+ID4NCj4gPiBQQVNJRCBjYWNoZSBpcyBvcHRpb25h
bCwgYnV0IGZhdWx0IHJlY29yZGluZyB3aXRoIFBBU0lEIGlzIHJlcXVpcmVkLg0KPiANCj4gQW55
IHBvaW50ZXIgaW4gdGhlIHNwZWMgdG8gc2F5IHNvbWV0aGluZyBsaWtlIHRoaXM/IEkgdGhpbmsg
c3RpY2tpbmcNCj4gdG8gdGhlIE5GUiB3b3VsZCBiZSBzdWZmaWNpZW50Lg0KDQpJIGRpZG4ndCBy
ZW1lbWJlciBhbnkgcGxhY2UgaW4gc3BlYyBzYXlpbmcgdGhhdCBmYXVsdCByZWNvcmRpbmcgd2l0
aCBQQVNJRCBpcw0Kbm90IHJlcXVpcmVkIHdoZW4gUEFTSUQgY2FwYWJpbGl0eSBpcyBleHBvc2Vk
LiBJZiB0aGVyZSBpcyBjZXJ0YWluIGZhdWx0DQp0cmlnZ2VyZWQgYnkgYSByZXF1ZXN0IHdpdGgg
UEFTSUQsIHdlIGRvIHdhbnQgdG8gcmVwb3J0IHRoaXMgaW5mb3JtYXRpb24NCnVwd2FyZC4gDQoN
CmJ0dyBjYW4geW91IGVsYWJvcmF0ZSB3aHkgTkZSIG1hdHRlcnMgdG8gUEFTSUQ/IEl0IGlzIGp1
c3QgYWJvdXQgdGhlDQpudW1iZXIgb2YgZmF1bHQgcmVjb3JkaW5nIHJlZ2lzdGVyLi4uDQoNCj4g
DQo+ID4gSSdtIGZpbmUgd2l0aCBhZGRpbmcgaXQgaW5jcmVtZW50YWxseSBidXQgd2FudCB0byBj
bGFyaWZ5IHRoZSBjb25jZXB0IGZpcnN0Lg0KPiANCj4gWWVzLCB0aGF0J3MgdGhlIHBsYW4uDQo+
IA0KDQpJIGhhdmUgb25lIG9wZW4gd2hpY2ggcmVxdWlyZXMgeW91ciBpbnB1dC4NCg0KV2hpbGUg
aW5jcmVtZW50YWxseSBlbmFibGluZyB0aGluZ3MgZG9lcyBiZSBhIGNvbW1vbiBwcmFjdGljZSwg
b25lIHdvcnJ5DQppcyB3aGV0aGVyIHdlIHdhbnQgdG8gY3JlYXRlIHRvbyBtYW55IGNvbnRyb2wg
a25vYnMgaW4gdGhlIHN0YWdpbmcgcHJvY2Vzcw0KdG8gY2F1c2UgY29uZnVzaW9uIHRvIHRoZSBl
bmQgdXNlci4NCg0KRWFybGllciB3aGVuIFlpIHByb3Bvc2VkIFFlbXUgY2hhbmdlcyBmb3IgZ3Vl
c3QgU1ZBIFsxXSBoZSBhaW1lZCBmb3IgYQ0KY29hcnNlLWdyYWluZWQga25vYiBkZXNpZ246DQot
LQ0KICBJbnRlbCBWVC1kIDMuMCBpbnRyb2R1Y2VzIHNjYWxhYmxlIG1vZGUsIGFuZCBpdCBoYXMg
YSBidW5jaCBvZiBjYXBhYmlsaXRpZXMNCiAgcmVsYXRlZCB0byBzY2FsYWJsZSBtb2RlIHRyYW5z
bGF0aW9uLCB0aHVzIHRoZXJlIGFyZSBtdWx0aXBsZSBjb21iaW5hdGlvbnMuDQogIFdoaWxlIHRo
aXMgdklPTU1VIGltcGxlbWVudGF0aW9uIHdhbnRzIHNpbXBsaWZ5IGl0IGZvciB1c2VyIGJ5IHBy
b3ZpZGluZw0KICB0eXBpY2FsIGNvbWJpbmF0aW9ucy4gVXNlciBjb3VsZCBjb25maWcgaXQgYnkg
Ingtc2NhbGFibGUtbW9kZSIgb3B0aW9uLiBUaGUNCiAgdXNhZ2UgaXMgYXMgYmVsb3c6DQogICAg
Ii1kZXZpY2UgaW50ZWwtaW9tbXUseC1zY2FsYWJsZS1tb2RlPVsibGVnYWN5InwibW9kZXJuIl0i
DQoNCiAgICAtICJsZWdhY3kiOiBnaXZlcyBzdXBwb3J0IGZvciBTTCBwYWdlIHRhYmxlDQogICAg
LSAibW9kZXJuIjogZ2l2ZXMgc3VwcG9ydCBmb3IgRkwgcGFnZSB0YWJsZSwgcGFzaWQsIHZpcnR1
YWwgY29tbWFuZA0KICAgIC0gIGlmIG5vdCBjb25maWd1cmVkLCBtZWFucyBubyBzY2FsYWJsZSBt
b2RlIHN1cHBvcnQsIGlmIG5vdCBwcm9wZXINCiAgICAgICBjb25maWd1cmVkLCB3aWxsIHRocm93
IGVycm9yDQotLQ0KDQpXaGljaCB3YXkgZG8geW91IHByZWZlciB0bz8NCg0KWzFdIGh0dHBzOi8v
bGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIwLTAyL21zZzAyODA1Lmh0
bWwNCg0KVGhhbmtzDQpLZXZpbg0K

