Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259FC6E7126
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 04:39:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poxiU-0000DV-WE; Tue, 18 Apr 2023 22:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1poxiS-0000Cn-LX
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 22:38:40 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1poxiQ-00025r-2J
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 22:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681871918; x=1713407918;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mCq62SaSguMPD6VvhQls59EXRVdtzZXJ3FlryP8WxhU=;
 b=RQASIVSehEUiWo5czJQCSC2foF4zbNmTKMUTjJ6mjgLwRsdl2pM9LU3O
 UeyWyKyznYWYR7uTmHcfjd8TLCOUZpI2p/OWBUeBsQ6FOXbkgFCzRHITP
 OEfs8xNSnSJI9kQaOx8UltA0IAq11DUOu66CF/DOTud/QRge+K7zcy44N
 MjEv4VucJKr53oncn5Kxuu882mSHLmqnYD5eG1u4LG2oP3alFlh7ro2z5
 mPXlHK1UEH8h4JmPE7FbmYGWxyzEzG/Ek2u0N/9p+WRJm1WW2sI1leJX7
 sDhnp9saL+rIlB51pHfTEwHFW0zrL+jpg1gFKwKXXJV81S28qK5epoJUk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="329508582"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="329508582"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 19:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="691320909"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="691320909"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 18 Apr 2023 19:38:30 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 19:38:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 19:38:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 19:38:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2BfGLusJyXZX3K0SIIHHc+D6rz85zBrCaxHoZRLxxYfOGee8tgxe/Dq40GlqDpECAbLcmP4Xkv/cLwymN5H7ZRiqC4/226rIgjzKsJomv7TPJMQxFwStck5cTxEHqTBrhn9NLNqUIqB6BhD8prN3lM/gZ7tHRriFo6/5gbguM4Uy3B/jQ5+QdchkgAEplaf1xhZ/NwDJzjYbJw+OJqSIMEfCceEpt8l8g7Stu/VbsGrhsl/UkvGJlH3OOzLStYecBcu+Tk9xxttcQtrbh99DIBB8BaRkCAtu/PMc1BHPYXbgavAtAtkkE/fRukpBovLypVvNHBiTTzlRjM2WddbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCq62SaSguMPD6VvhQls59EXRVdtzZXJ3FlryP8WxhU=;
 b=UZ6NyfkJQOpv64zW/yDwVlxDJt8gjJWgxjGlsMPI05AgJc8mlLebuVGE2P1nnBJg9syqxx2RxUWhujZ9x7GxJ8XiLKR1aKcfDCTdFcuQKmMWkBZJOF518GW5mu0dt4EJgtnyBMIz0t7erImz6Q6pfMh9gWlrkqgQAbG91+3v/1+LV2FzizShRmcB/EZtRlX7B3DDdWJczECwxTsyHWXv2/lmQzscbtsVt11lQAYgft9xJeQlLgReeSn0SSMoy3aeovXNmjOARTwjSRM51tirFdHclRc1zhKm+KsXhfSgfdHwG4ar070r2CiSwjqco+ASNPSe82saaWzP0NS/CzBZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 19 Apr
 2023 02:38:28 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::da0a:8aab:d75b:55f1]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::da0a:8aab:d75b:55f1%3]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 02:38:27 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>
Subject: RE: [PATCH v3] memory: Optimize replay of guest mapping
Thread-Topic: [PATCH v3] memory: Optimize replay of guest mapping
Thread-Index: AQHZbfjI94liGDBCM0eWIuFA1iYcJK8w4QeAgAA+JACAANPyQA==
Date: Wed, 19 Apr 2023 02:38:26 +0000
Message-ID: <SJ0PR11MB6744AADC581774FBEFFD458992629@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20230413110019.48922-1-zhenzhong.duan@intel.com>
 <CAFEAcA9VsB7+yXG6XiyRAJ4TaUJVFAu4h-rT9ZN=+o5fu0S2cw@mail.gmail.com>
 <ZD6hhnUNVoHhIdgi@x1n>
In-Reply-To: <ZD6hhnUNVoHhIdgi@x1n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|PH7PR11MB6881:EE_
x-ms-office365-filtering-correlation-id: ea074b3a-00e8-4f88-5c39-08db407f2776
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kyr9l1szaqhZeM1h2s2rNwvqbiwFpMj9SvlZDvAXqtAb6hQQMGTA1Tc6X900xKd87RbjfPyc7eAn4g8/0dj/rENyoyZvuHRV25uMSj/jvn8XWS1IUELFGyrleJVD6C73M4tJ9S5JikE1tkBxipaibwMpQLa/FZqGzRzgGuh8CFoKWd+xWkekuroqGT6ZaCl2xCoKLQzNpo0etzOxPcz5vQ7Eosjh8sM+89Pv9llOpOOJQqICh6ZqJLjWUue782cGRc4Ufi5DD3PKiFvgNKMOj/QbqmIKs+yZ/E9gaaZ3/U/PspZjGcBgOY9q3eV8NsBzmf7FSF647OcmN6tGY/I5YqXwtB/aOIEJYnPRNFJWxTc+oY2XWEy5ZihCMV2JcWffLN617GYeDdl5rKdrnbOQv7FnoUjZS9epY/CDqhzqWi+eS0eIQLgFlp+hlRR7vJBxkZytW2d3/AurIdkAFLzMzboro5OgbByiLfnvAAhyJY+SGESSRBzYxjbxzS0DSB8iD+aMQKNZmaf64D3xnp7YBC9MmdTKI3ucqdZKY/6c9STU+aiWznUVY6kI1Qh4s6xz1S14jg/pf8wUME9xDRlAh2sdvwrzuzI8TQRcoVaEwkEeW+DW0MBbmoT2N4ZhG2Th
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6744.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199021)(478600001)(66446008)(52536014)(5660300002)(122000001)(7416002)(38100700002)(86362001)(55016003)(33656002)(38070700005)(8676002)(4326008)(82960400001)(8936002)(41300700001)(66476007)(2906002)(64756008)(66556008)(66946007)(54906003)(83380400001)(76116006)(110136005)(316002)(9686003)(71200400001)(186003)(26005)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjdvSk1BYzMxY09KT09ZTForKzJBN2x3U1pJRWtKdENmaWxZY1Q4UjczaWJY?=
 =?utf-8?B?UENleXhKQXNHbG16bGlFeXFodTFRZUtxRWJqRzFnR0I4Z01WaHczZVNxWCtn?=
 =?utf-8?B?WmVGTFVPOUQ5M2xzQlIwWHlUN1VZZ2NJSlppYmdqVnZsWmtCZUpqYTcwZEIx?=
 =?utf-8?B?bkUzZzQrRm5xb1BibVNWVThFQm9JSjZVbnd0YTBaYmRjVnZIT3BiWnoxOXdO?=
 =?utf-8?B?Z2x2bTk5MkxGdXZCQWV3WWxBWGE4QnJDQUxON2hHRkJKbm5QRmlqV0JLM3p4?=
 =?utf-8?B?M2ZqOEI0eHhONk9OS01jSmFtNDVvT3pMUjRZVEhZVlV3dUJIa01jUUZJeS95?=
 =?utf-8?B?N2djRDgvZzhqOHdwUkxyaUphVVJKK0ljMDVqM2tmZHFNdGRSejh2SDNvSEND?=
 =?utf-8?B?UjRMa0piTlFaMmlQNXdlUXJmK1VzMk5ydjV0cEZmdUxMbTBIQXBISUpyT1Zy?=
 =?utf-8?B?TkNXZDFPaXlVSUkvMHNGczNjZ3VwcmpoM0YyYVk2Sk1CQVNrQ2VsVzQzT1Ba?=
 =?utf-8?B?UGF0RFJST1M1dXE3UnArNG9HMDRUVTNLQ2czNFhEN3ZTbTlUSFJ1VFY5UlQr?=
 =?utf-8?B?NDRGejZkNUpTekMwNVlmRWZvUU45RnlDMlJDYzZhSnBzeVJaaHpHL2kxRDJ5?=
 =?utf-8?B?K1BsQWRxRCtLUlJQQVlrMlBRUm9MMzNlWml1ZFAvWTd0MnhsUGFyREFteWtQ?=
 =?utf-8?B?MFB0bGNRNzhuNnk0dlhiVTZKYnJDM3B5anpaY1E5NStOSXZCL281b2RPM1VQ?=
 =?utf-8?B?SXJBMVV3L0l1MC8vNGxUV09LRWNMdCtycEYvNDVhMlpiY0IzR1kzZ29UU2hX?=
 =?utf-8?B?Qit6b2tTWUtHRWVXMllJWXFhZGZ3dGdXNktKSlRBd3dEN283UTdiN05JMitz?=
 =?utf-8?B?WEIzeUp1d0prTDh1VFcwbnR4by9CRzdibWlpUm8zbHkrQkhObDhjdUZobGtS?=
 =?utf-8?B?VGdSaGhwK0xMMEJpZDVWd1Fad3RyNWpaR2lxNlZ6ZkpkRVViQUcrQk1oY3Nq?=
 =?utf-8?B?QlQ5c0NtYkJ6YUU4VlNYRlFNRnRhOEs0amZObXpLN0hIUit1QjU4aTFCVzhG?=
 =?utf-8?B?VXVEQTI2YVdLbHAwRkF0QVo3ZUpIL3BFcjEwb2NOdFZzdFNpTWJOdFpxQTVE?=
 =?utf-8?B?OSs2eUpvTTJrL3Vaa1F4eWxoRExHYU42aTAvL1RjLzNxUzFkQ0Foamk1eEFX?=
 =?utf-8?B?RUhzL0dySUkvNlQzcitJQm1YRjcxVjN4NnBSNnpaTXJFVHQ1RHIxbCtPMjlo?=
 =?utf-8?B?QmY3NGtFbG9jRkNHMHlHdGRyMVoxcGFCRTg1aHVISC8xVFhoektISXhTdURq?=
 =?utf-8?B?cEpOeEtUc1AvY0hVdFlpL202aGRnaGpNTnJSMTduRnpaWmJTbzVVTWhKNlRt?=
 =?utf-8?B?QjVIYXdmek43MllJYUo1NmFpdVcrNG9RMlB2dGRVallQMmwrU3lIUzRXN21U?=
 =?utf-8?B?Yk41aHh0TVNscWFSdFlacWIvQThwZk8wZjU5cmFLd2xTZnNxblliMWdROWIz?=
 =?utf-8?B?UHRwR3crYytobnlHcTF1bHVYMmZiSkY5ZmJMYlNHc1djYlJ3SjBKenBweXZn?=
 =?utf-8?B?d2NuVW0xK0pPL1lHeFB5MlF3U3pwQUx5Qlc0UVBUVk9SZHg4S2d6bld4V3pC?=
 =?utf-8?B?NTFoMG5ZRENUb3ZBcU9la25MdU1ZcnNMc3J5MkhEMVltV3hXVlhERzd4TUxL?=
 =?utf-8?B?VmNsTDlwMGVla1NVZS9mSTl1K2ZPQXJNUm85b2ZMRDgrazhnL1JlV1lJVjA4?=
 =?utf-8?B?SFlnWis4eGE1dWh6VE4rclBHSXBkT1pKQ2RSUzdITldTdE02MDMxSFlLRDdE?=
 =?utf-8?B?L2daMHB6VEoxNmxWVFBXd2dORWd6MUlhR3hDWWs3ckR4cGt6NE9xUTRqN0hQ?=
 =?utf-8?B?Y0lERjRRTTh1Z3IxT3FXd285MERuMTlLa3FsMVlnMkFKZS8xK1k2Z0FMSytE?=
 =?utf-8?B?ZENNZ3czenRJVEpRdzdCb0ZabytQeHFBMklOdzFwVGNXTkhIdC9Ud1BmelAy?=
 =?utf-8?B?T1hpbnlGTXlRWGxVSWZadksrbmlEOHdPU3JSU1VHaEcvMmtmVGtheklWOUl2?=
 =?utf-8?B?RVp2VHRQRHJsTlpMYTFvUkVEVjRIZ2F2bk95anZrYlhEL1V3cS9YUHFobW9x?=
 =?utf-8?Q?GOJ/mbA0TJga479YqfACTGbdU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea074b3a-00e8-4f88-5c39-08db407f2776
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 02:38:26.9830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1Rb+TOqt23hmtqzURmjkRAHsxx4JwnMivw4MorStTScrgfgbWeFJpNu5/PvmCT4rCHJBWIDLQx8HuBpPm3ZkXYqod5Wmn5yi97dZBNRpBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=zhenzhong.duan@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBQZXRlciBYdSA8cGV0ZXJ4QHJl
ZGhhdC5jb20+DQo+U2VudDogVHVlc2RheSwgQXByaWwgMTgsIDIwMjMgOTo1NiBQTQ0KPlRvOiBQ
ZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+Q2M6IER1YW4sIFpoZW56
aG9uZyA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPjsgcWVtdS0NCj5kZXZlbEBub25nbnUub3Jn
OyBtc3RAcmVkaGF0LmNvbTsgamFzb3dhbmdAcmVkaGF0LmNvbTsNCj5tYXJjZWwuYXBmZWxiYXVt
QGdtYWlsLmNvbTsgcGJvbnppbmlAcmVkaGF0LmNvbTsNCj5yaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnOyBlZHVhcmRvQGhhYmtvc3QubmV0OyBkYXZpZEByZWRoYXQuY29tOw0KPnBoaWxtZEBs
aW5hcm8ub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSCB2M10gbWVtb3J5OiBPcHRpbWl6ZSByZXBs
YXkgb2YgZ3Vlc3QgbWFwcGluZw0KPg0KPk9uIFR1ZSwgQXByIDE4LCAyMDIzIGF0IDExOjEzOjU3
QU0gKzAxMDAsIFBldGVyIE1heWRlbGwgd3JvdGU6DQo+PiBPbiBUaHUsIDEzIEFwciAyMDIzIGF0
IDEyOjEyLCBaaGVuemhvbmcgRHVhbg0KPjx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+IHdyb3Rl
Og0KPj4gPg0KPj4gPiBPbiB4ODYsIHRoZXJlIGFyZSB0d28gbm90aWZpZXJzIHJlZ2lzdGVyZWQg
ZHVlIHRvIHZ0ZC1pciBtZW1vcnkNCj4+ID4gcmVnaW9uIHNwbGl0dGluZyB0aGUgZW50aXJlIGFk
ZHJlc3Mgc3BhY2UuIER1cmluZyByZXBsYXkgb2YgdGhlDQo+PiA+IGFkZHJlc3Mgc3BhY2UgZm9y
IGVhY2ggbm90aWZpZXIsIHRoZSB3aG9sZSBhZGRyZXNzIHNwYWNlIGlzIHNjYW5uZWQNCj4+ID4g
d2hpY2ggaXMgdW5uZWNlc3NhcnkuIFdlIG9ubHkgbmVlZCB0byBzY2FuIHRoZSBzcGFjZSBiZWxv
bmcgdG8NCj4+ID4gbm90aWZpZXIgbW9uaXRvcmVkIHNwYWNlLg0KPj4gPg0KPj4gPiBXaGlsZSBv
biB4ODYgSU9NTVUgbWVtb3J5IHJlZ2lvbiBzcGFucyBvdmVyIGVudGlyZSBhZGRyZXNzIHNwYWNl
LA0KPj4gPiBidXQgb24gc29tZSBvdGhlciBwbGF0Zm9ybXMoZS5nLiBhcm0gbXBzMy1hbjU0Nyks
IElPTU1VIG1lbW9yeQ0KPj4gPiByZWdpb24gaXMgb25seSBhIHdpbmRvdyBpbiB0aGUgd2hvbGUg
YWRkcmVzcyBzcGFjZS4gdXNlciBjb3VsZA0KPj4gPiByZWdpc3RlciBhIG5vdGlmaWVyIHdpdGgg
YXJiaXRyYXJ5IHNjb3BlIGJleW9uZCBJT01NVSBtZW1vcnkgcmVnaW9uLg0KPj4gPiBUaG91Z2gg
aW4gY3VycmVudCBpbXBsZW1lbnRhdGlvbiByZXBsYXkgaXMgb25seSB0cmlnZ2VyZWQgYnkgVkZJ
Tw0KPj4gPiBhbmQgZGlydHkgcGFnZSBzeW5jIHdpdGggbm90aWZpZXJzIGRlcml2ZWQgZnJvbSBt
ZW1vcnkgcmVnaW9uDQo+PiA+IHNlY3Rpb24sIGJ1dCB0aGlzIGlzbid0IGd1YXJhbnRlZWQgaW4g
dGhlIGZ1dHVyZS4NCj4+ID4NCj4+ID4gU28sIHdlIHJlcGxheSB0aGUgaW50ZXJzZWN0aW9uIHBh
cnQgb2YgSU9NTVUgbWVtb3J5IHJlZ2lvbiBhbmQgSU9NTVUNCj4+ID4gbm90aWZpZXIgaW4gbWVt
b3J5X3JlZ2lvbl9pb21tdV9yZXBsYXkoKS4NCj4+ID4NCj4+ID4gU2lnbmVkLW9mZi1ieTogWmhl
bnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4NCj4+ID4gLS0tDQo+PiA+IHYz
OiBGaXggYXNzZXJ0IGZhaWx1cmUgb24gbXBzMy1hbjU0Nw0KPj4gPiB2MjogQWRkIGFuIGFzc2Vy
dCBwZXIgUGV0ZXINCj4+ID4gVGVzdGVkIG9uIHg4NiB3aXRoIGEgbmV0IGNhcmQgcGFzc2VkIHRv
IGd1ZXN0KGt2bS90Y2cpLCBwaW5nL3NzaCBwYXNzLg0KPj4gPiBBbHNvIGRpZCBzaW1wbGUgYm9v
dHVwIHRlc3Qgd2l0aCBtcHMzLWFuNTQ3DQo+PiA+DQo+PiA+ICBody9pMzg2L2ludGVsX2lvbW11
LmMgfCAyICstDQo+PiA+ICBzb2Z0bW11L21lbW9yeS5jICAgICAgfCA1ICsrKy0tDQo+PiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+ID4NCj4+
ID4gZGlmZiAtLWdpdCBhL2h3L2kzODYvaW50ZWxfaW9tbXUuYyBiL2h3L2kzODYvaW50ZWxfaW9t
bXUuYyBpbmRleA0KPj4gPiBhNjI4OTY3NTljNzguLmZhYWRlN2RlZjg2NyAxMDA2NDQNCj4+ID4g
LS0tIGEvaHcvaTM4Ni9pbnRlbF9pb21tdS5jDQo+PiA+ICsrKyBiL2h3L2kzODYvaW50ZWxfaW9t
bXUuYw0KPj4gPiBAQCAtMzg1MCw3ICszODUwLDcgQEAgc3RhdGljIHZvaWQNCj52dGRfaW9tbXVf
cmVwbGF5KElPTU1VTWVtb3J5UmVnaW9uICppb21tdV9tciwgSU9NTVVOb3RpZmllciAqbikNCj4+
ID4gICAgICAgICAgICAgICAgICAuZG9tYWluX2lkID0gdnRkX2dldF9kb21haW5faWQocywgJmNl
LCB2dGRfYXMtPnBhc2lkKSwNCj4+ID4gICAgICAgICAgICAgIH07DQo+PiA+DQo+PiA+IC0gICAg
ICAgICAgICB2dGRfcGFnZV93YWxrKHMsICZjZSwgMCwgfjBVTEwsICZpbmZvLCB2dGRfYXMtPnBh
c2lkKTsNCj4+ID4gKyAgICAgICAgICAgIHZ0ZF9wYWdlX3dhbGsocywgJmNlLCBuLT5zdGFydCwg
bi0+ZW5kLCAmaW5mbywNCj4+ID4gKyB2dGRfYXMtPnBhc2lkKTsNCj4+ID4gICAgICAgICAgfQ0K
Pj4gPiAgICAgIH0gZWxzZSB7DQo+PiA+ICAgICAgICAgIHRyYWNlX3Z0ZF9yZXBsYXlfY2VfaW52
YWxpZChidXNfbiwgUENJX1NMT1QodnRkX2FzLT5kZXZmbiksDQo+PiA+IGRpZmYgLS1naXQgYS9z
b2Z0bW11L21lbW9yeS5jIGIvc29mdG1tdS9tZW1vcnkuYyBpbmRleA0KPj4gPiBiMWE2Y2FlNmY1
ODMuLmY3YWY2OTE5OTFkZSAxMDA2NDQNCj4+ID4gLS0tIGEvc29mdG1tdS9tZW1vcnkuYw0KPj4g
PiArKysgYi9zb2Z0bW11L21lbW9yeS5jDQo+PiA+IEBAIC0xOTI1LDcgKzE5MjUsNyBAQCB2b2lk
DQo+PiA+IG1lbW9yeV9yZWdpb25faW9tbXVfcmVwbGF5KElPTU1VTWVtb3J5UmVnaW9uICppb21t
dV9tciwNCj5JT01NVU5vdGlmaWVyICpuKSAgew0KPj4gPiAgICAgIE1lbW9yeVJlZ2lvbiAqbXIg
PSBNRU1PUllfUkVHSU9OKGlvbW11X21yKTsNCj4+ID4gICAgICBJT01NVU1lbW9yeVJlZ2lvbkNs
YXNzICppbXJjID0NCj5JT01NVV9NRU1PUllfUkVHSU9OX0dFVF9DTEFTUyhpb21tdV9tcik7DQo+
PiA+IC0gICAgaHdhZGRyIGFkZHIsIGdyYW51bGFyaXR5Ow0KPj4gPiArICAgIGh3YWRkciBhZGRy
LCBlbmQsIGdyYW51bGFyaXR5Ow0KPj4gPiAgICAgIElPTU1VVExCRW50cnkgaW90bGI7DQo+PiA+
DQo+PiA+ICAgICAgLyogSWYgdGhlIElPTU1VIGhhcyBpdHMgb3duIHJlcGxheSBjYWxsYmFjaywg
b3ZlcnJpZGUgKi8gQEANCj4+ID4gLTE5MzUsOCArMTkzNSw5IEBAIHZvaWQNCj5tZW1vcnlfcmVn
aW9uX2lvbW11X3JlcGxheShJT01NVU1lbW9yeVJlZ2lvbiAqaW9tbXVfbXIsDQo+SU9NTVVOb3Rp
ZmllciAqbikNCj4+ID4gICAgICB9DQo+PiA+DQo+PiA+ICAgICAgZ3JhbnVsYXJpdHkgPSBtZW1v
cnlfcmVnaW9uX2lvbW11X2dldF9taW5fcGFnZV9zaXplKGlvbW11X21yKTsNCj4+ID4gKyAgICBl
bmQgPSBNSU4obi0+ZW5kLCBtZW1vcnlfcmVnaW9uX3NpemUobXIpKTsNCj4+ID4NCj4+ID4gLSAg
ICBmb3IgKGFkZHIgPSAwOyBhZGRyIDwgbWVtb3J5X3JlZ2lvbl9zaXplKG1yKTsgYWRkciArPSBn
cmFudWxhcml0eSkgew0KPj4gPiArICAgIGZvciAoYWRkciA9IG4tPnN0YXJ0OyBhZGRyIDwgZW5k
OyBhZGRyICs9IGdyYW51bGFyaXR5KSB7DQo+PiA+ICAgICAgICAgIGlvdGxiID0gaW1yYy0+dHJh
bnNsYXRlKGlvbW11X21yLCBhZGRyLCBJT01NVV9OT05FLCBuLQ0KPj5pb21tdV9pZHgpOw0KPj4g
PiAgICAgICAgICBpZiAoaW90bGIucGVybSAhPSBJT01NVV9OT05FKSB7DQo+PiA+ICAgICAgICAg
ICAgICBuLT5ub3RpZnkobiwgJmlvdGxiKTsNCj4+DQo+Pg0KPj4gVGhlIGRvY3VtZW50YXRpb24g
Zm9yIHRoZSByZXBsYXkgbWV0aG9kIG9mIElPTU1VTWVtb3J5UmVnaW9uQ2xhc3MNCj4+IHNheXM6
DQo+PiAgICAgICogVGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24gb2YgbWVtb3J5X3JlZ2lvbl9p
b21tdV9yZXBsYXkoKSBpcyB0bw0KPj4gICAgICAqIGNhbGwgdGhlIElPTU1VIHRyYW5zbGF0ZSBt
ZXRob2QgZm9yIGV2ZXJ5IHBhZ2UgaW4gdGhlIGFkZHJlc3Mgc3BhY2UNCj4+ICAgICAgKiB3aXRo
IGZsYWcgPT0gSU9NTVVfTk9ORSBhbmQgdGhlbiBjYWxsIHRoZSBub3RpZmllciBpZiB0cmFuc2xh
dGUNCj4+ICAgICAgKiByZXR1cm5zIGEgdmFsaWQgbWFwcGluZy4gSWYgdGhpcyBtZXRob2QgaXMg
aW1wbGVtZW50ZWQgdGhlbiBpdA0KPj4gICAgICAqIG92ZXJyaWRlcyB0aGUgZGVmYXVsdCBiZWhh
dmlvdXIsIGFuZCBtdXN0IHByb3ZpZGUgdGhlIGZ1bGwgc2VtYW50aWNzDQo+PiAgICAgICogb2Yg
bWVtb3J5X3JlZ2lvbl9pb21tdV9yZXBsYXkoKSwgYnkgY2FsbGluZyBAbm90aWZpZXIgZm9yIGV2
ZXJ5DQo+PiAgICAgICogdHJhbnNsYXRpb24gcHJlc2VudCBpbiB0aGUgSU9NTVUuDQo+Pg0KPj4g
VGhpcyBjb21taXQgY2hhbmdlcyB0aGUgZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiBzbyBpdCdzIG5v
IGxvbmdlciBkb2luZw0KPj4gdGhpcyBmb3IgZXZlcnkgcGFnZSBpbiB0aGUgYWRkcmVzcyBzcGFj
ZS4gSWYgdGhlIGNoYW5nZSBpcyBjb3JyZWN0LCB3ZQ0KPj4gc2hvdWxkIHVwZGF0ZSB0aGUgZG9j
IGNvbW1lbnQgdG9vLg0KPj4NCj4+IE9kZGx5LCB0aGUgZG9jIGNvbW1lbnQgZm9yIG1lbW9yeV9y
ZWdpb25faW9tbXVfcmVwbGF5KCkgaXRzZWxmIGRvZXNuJ3QNCj4+IHZlcnkgY2xlYXJseSBzdGF0
ZSB3aGF0IGl0cyBzZW1hbnRpY3MgYXJlOyBpdCBjb3VsZCBwcm9iYWJseSBiZQ0KPj4gaW1wcm92
ZWQuDQo+Pg0KPj4gQW55d2F5LCB0aGlzIGNoYW5nZSBpcyBPSyBmb3IgdGhlIFRDRyB1c2Ugb2Yg
aW9tbXUgbm90aWZpZXJzLCBiZWNhdXNlDQo+PiB0aGF0IGRvZXNuJ3QgY2FyZSBhYm91dCByZXBs
YXkuDQo+DQo+U2luY2UgdGhlIG5vdGlmaWVyIGNvbnRhaW5zIHRoZSByYW5nZSBpbmZvcm1hdGlv
biBJJ2Qgc2F5IHRoZSBjaGFuZ2Ugc2hvdWxkbid0DQo+YWZmZWN0IGFueSBjYWxsZXIgYnV0IG9u
bHkgYSBwdXJlIHBlcmZvcm1hbmNlIGRpZmZlcmVuY2UuICBJbmRlZWQgaXQnbGwgYmUgbmljZXIN
Cj50aGUgZG9jdW1lbnRhdGlvbiBjYW4gYmUgdXBkYXRlZCB0b28uICBUaGFua3MsDQo+DQo+LS0N
Cj5QZXRlciBYdQ0KVGhhbmtzIFBldGVyIE1heWRlbGwgYW5kIFBldGVyIFh1J3MgY29tbWVudHMs
IHdpbGwgYWRkIGRvYyB1cGRhdGUuDQpNYXkgSSBhc2sgaWYgaXQncyBwcmVmZXJyZWQgdG8gYWRk
IGRvYyB1cGRhdGUgdG8gdGhpcyBwYXRjaCBvciBhIHNlcGFyYXRlIHBhdGNoPw0KDQpSZWdhcmRz
DQpaaGVuemhvbmcNCg==

