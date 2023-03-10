Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3D36B3449
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 03:32:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paSYR-0001le-Qq; Thu, 09 Mar 2023 21:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1paSYP-0001lB-Ad
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:32:21 -0500
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1paSYN-0003R7-1m
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678415539; x=1709951539;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BTvuHZ6TYV0BX1Y+FK44DeHfLAtB5NM91ylrXoAW/H0=;
 b=dBmaeqeRgynMcH083+xqqaVWNTpSGpU3L7pY5hexf2ZgcCFUrYdl8wst
 s0s8uHmEdJ+xdYVsYNSCUxr3WhY4QFlO3udcs69dVVKWUHg6ZNRXrfx1h
 zQR4iHaEzTM31a3oE2L0B9/7NrF1ZoWoDzWYR+ndOEVQ/Q5AhWLpjfDI5
 kk1wbl9ARoJJ5KaPq/w6LyIzlDOT9KpvhiiCnND0MPIcTldLuoG7G7L/3
 QUgEKyqvvHf6pSYS26fQfDXH6Y1bJc9NNNbTxhwSEat8r2lryMVFtn3/z
 ak3QcDosWfk19oKoCkGs0jTIipG87UFWgvyqGIVrAlO9kHPEx6AggwP8C A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364278634"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="364278634"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 18:32:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="1006962099"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="1006962099"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 09 Mar 2023 18:32:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 18:32:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 18:32:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 18:32:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dljWTsva2WXDHB8aO0IXeXusAXux3FTzgi2oXPo0vih2S2GCglykUwdi4S8i4hkTyuUtkYylLAI3gzV6Q5cFgkS16oO0bqObOqSW8qjP5KOA0grVGf3Uk/C7zuOE57se47+CiavHEHAFexWeyW1ZrIXT2XjtUbUkAzpu3v2nWxUGIQp84xtOFcynrgTJfi8slAht6qzu7OP3oga3ndrChRV8VOjd8Pe29xSqBeJqRZHohBsebbWTXPJEZJ90hz/lWXP5RJmb3+TcUnPFVjFQhe/l1OynSodqCI2vVbZoMSXUr8B60LLLn1fEt9cxcQIT3i88It86UK37HKZjDCchRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTvuHZ6TYV0BX1Y+FK44DeHfLAtB5NM91ylrXoAW/H0=;
 b=FlgodVgC4WarPIqv1/5dQXf/eMt/A7HYzfHZvDSvRGwUuLkSgXYqcyy6rgBRibSQQrVBsR9uFbIdfEjglx+5aJLHR7VFO476BALfF8MxVmXGuPY9j532D75r+1cvhYtgm+cMyH4aCLwP6XhI7FW5cJAIwKqgO0eBzEdi7CQ9/fkr+alysA+HvEbZuIRrxBJyzVfkKuOna3ePjXGEuIBGgoTE2RnxSWIXxoiCImeqqdMU7rVbk3qT6KBfBlrfkSYL/3HnqtypDNBAh8e1kjkSeXUxnaDbBSPIcF6HpPtwz7bfmqLuEAVOmor9+VpeM1e088j7VE1sqE6RlfaQJ8bGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:219::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 02:32:13 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::d6fc:3f71:9b08:2883]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::d6fc:3f71:9b08:2883%4]) with mapi id 15.20.6178.017; Fri, 10 Mar 2023
 02:32:13 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Peter Xu <peterx@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>
Subject: RE: [PATCH] intel-iommu: Set status bit after operation completed
Thread-Topic: [PATCH] intel-iommu: Set status bit after operation completed
Thread-Index: AQHZUmkAJvqz/de/VUKAoez6hBj/y67yiciAgAC9meA=
Date: Fri, 10 Mar 2023 02:32:13 +0000
Message-ID: <SJ0PR11MB6744FE6A53BEB85BD7FD452E92BA9@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20230309092319.29229-1-zhenzhong.duan@intel.com>
 <ZAnzkfM8QSth9bXc@x1n>
In-Reply-To: <ZAnzkfM8QSth9bXc@x1n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|MW4PR11MB7127:EE_
x-ms-office365-filtering-correlation-id: 6bfc8d44-07e6-4974-f192-08db210fa84b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cpYs0Q+O+0kKP92wP2S1ejexhMr9m4tihBXNmhDpwzYrs1kAoMD5k3pJVYDITAuSl7odh8i+B0VJjiClR6cbgIO2Dr7FgJDBorYwJpxXV8wgn0PcthsOr+l4DMnzVUafbj3L1kRE8D4rqGcQk6PcBeD5DQT3zfYM579o7n75djHCD4EiZQ5L+ir332eSfQbrOZZ++S6nicQT2dqPX9KqDAgwVw3XY++0ISvVo2xGlr0xVPy9qoOEhZjjAiFJoGy2Jp8sGs55q7iXmQ1PUZOwd/2XUCZJZVcZvc/evWdrE9FGUEc6ChkI7PUYYDhtGIDNXw5Y0tEKXLtP7O34CIzRvEsgb+3lIux7sMU51nSuvMX4h9dMwH9dyuSZg/YdcLGC798TLnChj6uQAUByBs0hLhLkwWqXTP79YVMmOOezr1FFTDBywMalKpv2l842gh1k2wzr4XjgSqgN1tbfz0H+lYoBcmYPptYxZin+MjeWAMeluxUUjOe1dy8lisvJKoWcOxodmBTXfTZGBRfTtnhjiXM0y7y5QnHi1voopvoNz3FXHo60kwJoyHkrDAfYAbzGt/IhzDvmf/pcMKHxlKS/+ct06eviKoL9q3wkLAn+/NIGXB6onSG1oEx4LITslWzZYAyhxw0WC289UpL8RnbCYPKyz1g5usLnZH2DxPutqpj+PF0HU7uFtyY+AA7Sr4Yj3It5PgnGyg2ILrsnoM5j1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6744.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199018)(76116006)(9686003)(5660300002)(66946007)(38100700002)(186003)(71200400001)(8676002)(66476007)(66556008)(7696005)(64756008)(66446008)(6916009)(33656002)(54906003)(4326008)(316002)(478600001)(86362001)(38070700005)(55016003)(8936002)(41300700001)(122000001)(26005)(6506007)(52536014)(82960400001)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVByUGxadUFxQlA4clIra1U1SGk3Mm90ZXFoc1lzSmFaTWFlSnZzUHJ1VllW?=
 =?utf-8?B?bjN2VEdMckJPTW15a1NJajZMZFlPZFd0V0xOM016UXVmZVhmb01rMkMybTRZ?=
 =?utf-8?B?NjNHQ2FqY2dZSVkvaFFkdjZHY1pXR1NZY1JhVTdETlNKdDRBaTBmQStkRDR2?=
 =?utf-8?B?ZHdhYVk1VEJQM2xzR1huZUREQ2dBMDlFSFNDVnRiWE92UDVNT1pCMTlraVJr?=
 =?utf-8?B?UWtKMStuM3owb0V2SDdOQmdiS2h6TFMvUTh2bW1iajZ3c1NadHNkN29oSGZw?=
 =?utf-8?B?aHpyMnNETVMzSVdUKzRnRUd2dDBNZjdpUHd0Vm9OT3R5Sm9SejZZQ25yZTEr?=
 =?utf-8?B?dUtOT1hZUVhqL0h3NktrS2ovNU0rOFg1ZDQxOFBiMG5KSWxMcTRpaEs4Qita?=
 =?utf-8?B?VkJ5dk5rckNoVlNuYUgrelVSUW5RZjR1dHdQRzBDUHdJUVljSUhmcTdvcXBI?=
 =?utf-8?B?UURBVUI0aDVDcTlWNENnVk8yK1cxbCswU0h2bDFESUlSVWI1NlVnZ0NTNlZR?=
 =?utf-8?B?c2VTLzJBd2VPTjEyVFZhSE1oZURYM1RtOHl6R1orbis4VUVhYXZDQ0U1Y0ZD?=
 =?utf-8?B?a1JWUVJiblVJblBwY3p5dkl6U0NHcWhpdklOTUZBT2VKZnhmcW1CVkpEcTlJ?=
 =?utf-8?B?anppV0VJK3NKcjN0U25yQ2hVUS9iejdyL1UwZll2MkRkdFlicllRbVMrdXo5?=
 =?utf-8?B?WWsrS091YndCcUlCTmlsMk9hM0tNUGs5NTFXV1Q5SUZHbnU0Zi9mVEtCNGl0?=
 =?utf-8?B?RUlsM2VQanppM3RzY3NadUFleW9Pc3IzOEJZdzByZ2hKdHFTdHkyRzVKdFFx?=
 =?utf-8?B?dFBFWHZHWkJpUDcwazVKd3A5WUtMT2s2UkpMdmtaMnZCeGdxdHYxampHdFV3?=
 =?utf-8?B?VTlxMmhxQ01rV2w1RUdFN05UL2lXdjhLOXQ1RXN5Z0ZPK0pWK0V4M0dxaVp6?=
 =?utf-8?B?T0xQVWlxVXZnMC9JWE1ENnJRSk0vOEkrUEU3aVZiK2ZnMUpZYTZScFhRSkVZ?=
 =?utf-8?B?aEo5M3daZHNXRHFGRlJybENCZk1xQ05DYndpSTRlci9BdUlFaTkzYzZIQlVj?=
 =?utf-8?B?akR6ZW5VbXQrM0lqVURGbUhLODJBdVF0MmI5ZWtiZk8ySFM3bSt2c2RKQmpq?=
 =?utf-8?B?MWVIMUFWamthOXFCZXlMNWlESitmMjZmZXVQR2hIYVllSW5EV1Jnc1NtaXkv?=
 =?utf-8?B?Y3oyeUlPMlFXRlcwSVF4Z3ZsWHIzNDBIS3EzT3BHRFJZVEM4dFJwaWRlMStC?=
 =?utf-8?B?YWNkUGwyejVseVVjaVo1N0FPVlJuZ09WaWJERHFFdTJsUU9HTzFjekJYWk9V?=
 =?utf-8?B?T3JsVFR1RXljNmxvS2R3UHBhRzUrTU9xcUpzaVBscnRhK2I3ZUI0WDE5QjFr?=
 =?utf-8?B?c1FHSEphOEt1Ui9EQ2xZRHhpM2pob2RSaS9WcXA5RmVHcmVtS2Z0WUtISktT?=
 =?utf-8?B?WXVtZEVRSDg1aGlaUko2dlZHSlNxbGVvNkdCTG1wcXYwNWRiNEVlSzJPQmZp?=
 =?utf-8?B?cEpHUnBpb2llb3FKQTNWcFNLL0ZkbURTRmh6dUJtMUZoQWErMjVYc1pkcG1L?=
 =?utf-8?B?VW1tZ2g4VnZRdlZoQ1YvVm5Va0tDQ0dpamdsektMUXVtSmk1RHF0eEk3WlFF?=
 =?utf-8?B?aU1HOGRxVXNDSTBrYTByQ1ZKejNOQkpoa2tMNU1Xd2JTT09wK08xZmVzVWw4?=
 =?utf-8?B?cUhsSkkyMkhFend5eU9RS0VGM1hwVUFBT2JBU3BvVmVoOHhKd2FjSk82NkNt?=
 =?utf-8?B?N25JTE9yUzZ4L1BEVFVQUlVjS01ZSi9aY2Z4TXREYUF6U0I5WVB6ZUhqQk54?=
 =?utf-8?B?TFRzY3REK09yMk9VdmxZSnh1aTZZWGpRL0d2TERHM3BoN0JMUzlZU0FJdGE1?=
 =?utf-8?B?NXNtM3ozSjZod3FNTXBYdC9rQmRwVlRBOWg5NFN6MUFoQ0l2SG9XVGE0UVFO?=
 =?utf-8?B?S0lUQTFmZ2VaTTJPNjBDV04wUCtPZy91TzVQamRETnRmOGdPampDNFlsalFD?=
 =?utf-8?B?d3I2RzNSclBOTXpWZFBCbDJkUHpXUm1RcnBNN21pbEE0WjFWK3FaYjdQY2Rn?=
 =?utf-8?B?SUVuZXpQV0EreFRodzFJK0FtcVZTQkxkNXFyUE40ZE5NR2diMzJXVTQxNS92?=
 =?utf-8?Q?KIX6dh7xG54GcysA+cw9uDn5p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfc8d44-07e6-4974-f192-08db210fa84b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 02:32:13.4207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aWQWLw1Od/tZkOpRORk+OZ/Z6+N+2mWBu49f7bKP5jZdvzhYhcXyHj86Yt5hzmkA9ZYIc6xgrAHBx3pqhXsO1EJGXrA4xUz1dMd7cEHBLik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=zhenzhong.duan@intel.com; helo=mga01.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SGkgUGV0ZXINCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUGV0ZXIgWHUg
PHBldGVyeEByZWRoYXQuY29tPg0KPlNlbnQ6IFRodXJzZGF5LCBNYXJjaCA5LCAyMDIzIDEwOjU2
IFBNDQo+VG86IER1YW4sIFpoZW56aG9uZyA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPg0KPkNj
OiBxZW11LWRldmVsQG5vbmdudS5vcmc7IG1zdEByZWRoYXQuY29tOyBqYXNvd2FuZ0ByZWRoYXQu
Y29tOw0KPnBib256aW5pQHJlZGhhdC5jb207IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7
IGVkdWFyZG9AaGFia29zdC5uZXQ7DQo+bWFyY2VsLmFwZmVsYmF1bUBnbWFpbC5jb20NCj5TdWJq
ZWN0OiBSZTogW1BBVENIXSBpbnRlbC1pb21tdTogU2V0IHN0YXR1cyBiaXQgYWZ0ZXIgb3BlcmF0
aW9uIGNvbXBsZXRlZA0KPg0KPkhpLCBaaGVuemhvbmcsDQo+DQo+T24gVGh1LCBNYXIgMDksIDIw
MjMgYXQgMDU6MjM6MTlQTSArMDgwMCwgWmhlbnpob25nIER1YW4gd3JvdGU6DQo+PiBBY2NvcmRp
bmcgdG8gU0RNIDExLjQuNC4yIEdsb2JhbCBTdGF0dXMgUmVnaXN0ZXI6DQo+PiAiVGhpcyBmaWVs
ZCBpcyBjbGVhcmVkIGJ5IGhhcmR3YXJlIHdoZW4gc29mdHdhcmUgc2V0cyB0aGUgU1JUUCBmaWVs
ZA0KPj4gaW4gdGhlIEdsb2JhbCBDb21tYW5kIHJlZ2lzdGVyLiBUaGlzIGZpZWxkIGlzIHNldCBi
eSBoYXJkd2FyZSB3aGVuDQo+PiBoYXJkd2FyZSBjb21wbGV0ZXMgdGhlIOKAmFNldCBSb290IFRh
YmxlIFBvaW50ZXLigJkgb3BlcmF0aW9uIHVzaW5nIHRoZQ0KPj4gdmFsdWUgcHJvdmlkZWQgaW4g
dGhlIFJvb3QgVGFibGUgQWRkcmVzcyByZWdpc3RlciINCj4+DQo+PiBGb2xsb3cgYWJvdmUgc3Bl
YyB0byBjbGVhciB0aGVuIHNldCBSVFBTIGFmdGVyIGZpbmlzaCBhbGwgd29ya3MsIHRoaXMNCj4+
IHdheSBoZWxwcyBhdm9pZGluZyBwb3RlbnRpYWwgcmFjZSB3aXRoIGd1ZXN0IGtlcm5lbC4gVGhv
dWdoIGxpbnV4DQo+PiBrZXJuZWwgaXMgc2luZ2xlIHRocmVhZGVkIGluIHdyaXRpbmcgR0NNRF9S
RUcgYW5kIGNoZWNraW5nIEdTVFNfUkVHLg0KPj4NCj4+IFNhbWUgcmVhc2lvbiBmb3IgR1NUU19S
RUcuVEVTDQo+DQo+SXMgdGhpcyBhIHJlYWwgYnVnPyAgT3IsIHdoZW4gaXQnbGwgbWFrZSBhIGRp
ZmZlcmVuY2UgdG8gdGhlIGd1ZXN0Pw0KTm90IGEgcmVhbCBidWcsIGp1c3QgZm9yIHJvYnVzdG5l
c3MuIFNvcnJ5LCBJIHNob3VsZCBoYXZlIG1hZGUgaXQgY2xlYXIgaW4gY29tbWVudHMuDQoNCkkg
dGhpbmsgaXQgbWF5IGJyZWFrIHdpdGggc3BlY2lhbCBkZXNpZ25lZCBndWVzdCBPUywNCkUueDog
SW1hZ2luZSBhIGd1ZXN0IHdyaXRlIEdDTURfUkVHIGFuZCBzdGFydCBhIG5ldyB0aHJlYWQgdG8g
ZG8gZnVydGhlciB3b3JrLg0KTmV3IHRocmVhZCBmaW5kIHN0YXR1cyBiaXQgaW4gR1RTX1JFRyBz
ZXQgYW5kIGdvIGFoZWFkLCBidXQgdGhlIGFkZHJlc3Mgc3BhY2Ugc3dpdGNoDQptYXkgbm90IGZp
bmlzaCB5ZXQgaWYgZ3Vlc3QgbWVtb3J5IGlzIGJpZywgd2hpY2ggbWF5IHRyaWdnZXIgYSBwb3Rl
bnRpYWwgcmFjZS4NCg0KT3JpZ2luYWwgY29kZSBsaXZlcyBmb3IgYSBsb25nIGhpc3Rvcnkgc28g
aXQgbG9va3MgYWxsIHRoZSBwcmFjdGljZWQgb3MgYXJlbid0IGRlc2lnbmVkIGFzIGFib3ZlLg0K
DQpUaGFua3MNClpoZW56aG9uZw0KDQoNCg0K

