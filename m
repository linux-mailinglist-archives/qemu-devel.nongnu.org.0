Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5FD4EFF4B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 09:26:35 +0200 (CEST)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naY9Z-0002jg-LR
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 03:26:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1naY7e-0001Hg-Ls
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 03:24:34 -0400
Received: from mga09.intel.com ([134.134.136.24]:23058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1naY7b-0007S8-0s
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 03:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648884271; x=1680420271;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hgQKNXJAnDRem4zWuTFrKAEGf9J4SJBdf12HfBEBt9g=;
 b=eGRYssWPMV3usMH25RIyQe82LxXUp6Wsk2kWlf9oAQRGjtD8K8/sg2C7
 UKMdbpzjVCsbvwniNag5PBNRJq8Yu3IEomJeYV6EgDrrpCOnDbLC3oVH6
 3VAwai/1Uv5BNsXCqsBE1+PwHXqdIS0/Q+T6zFSJwDNldvVz9ppZkniqT
 G9IzE7+tViHpFlaSfYLT0tw5zSrh+A2d04xdHvggwfmMTDRVWFOnCnL3y
 mabvfll2kYrWMmrhidTp4QIjyPFfTnCfRfFNLwVEm/NmqHar+0NjFOJoY
 HtdKvEbmQUSwYT50DLfO4evP175NT1YI7CXxyPYr5k//yPM28G5qtduAf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="259984242"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="259984242"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2022 00:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="640761628"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Apr 2022 00:24:23 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 2 Apr 2022 00:24:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 2 Apr 2022 00:24:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sat, 2 Apr 2022 00:24:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sat, 2 Apr 2022 00:24:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnZNT+qL1X1U19RIuI9rnZby+G2Se2D9UwKcCP5D0APpvY88TCZmXKXCAD5TMNLXSxbcEs2AnMzEpoYprvFtsMvPCpkEFFs0wVl80aNG6j7JyQhbH55HFNtJeIjLngtY4+MIAvVcjLUXG9ykxL2WAdLlI1zncDCVBWuoKYG9cvX4dp8GOKkJiAqLUGAndNYNXvd3pe1qNn5aXU8NLP8MbvDW+8c/Nof+eLVEkftIdDLBuhANYELeTrvBQwxcu0xlD6AS/jgowUYtZfZSgOiN4MJr704yj4WX1rUOcTe4K6MIUwRnqeFiZ96AXpLQlaq4JxGwxXFoLwxR8pMHgVkDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgQKNXJAnDRem4zWuTFrKAEGf9J4SJBdf12HfBEBt9g=;
 b=SAUoXADI1GkM5noNPLuP7Y7Su77EzdD1NHHMO9CCvrPfCrzLlOciQvQHc2Vbf8tIMGuGqBzOnnhpwsPVjEV2QbEdBU/tsvVnZyzAslg2A1A3ldHf2l2kXXH13miE929KWRBOJKPLTghXpV65IhIhv/RZ1dFiz/rBy9JOwUdtJ8Ffd0ISTSK90wN1E42iep71VqQofYyFaEtnGYa4/Puo+w/mTIFHc9j2EeWMPI0FgOkJGCXvYHhipeCBwOTeOoVltl4KC76UYjc61Bzf57MDIS5Kyxr5ZRx0nhkFNnQqnRyu3u8ufIHFiiyIYadOJSSkxcRNtTmnzCC10af5LG+VkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 07:24:21 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::3c5c:b7a7:ca9e:88f5]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::3c5c:b7a7:ca9e:88f5%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 07:24:21 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Topic: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Index: AQHYPOjLkFETw43vekSHA4amP0dz7KzUZd9wgAFwzoCAAcfiYIAACNaAgASh2EA=
Date: Sat, 2 Apr 2022 07:24:20 +0000
Message-ID: <BL1PR11MB5271699ED3A244F52C9D1EA68CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB527635384D3CD8F0FB4232388C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEv4gN4=SzeWroMXdOouxQnzarQX_U5Jv528_fROoYNHyw@mail.gmail.com>
 <BN9PR11MB5276FB0451ABA184476BD4038C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEvpwFpzV44gLjscouLvcFc9-3Y4Qcw05vgX9ZvJha3-7g@mail.gmail.com>
In-Reply-To: <CACGkMEvpwFpzV44gLjscouLvcFc9-3Y4Qcw05vgX9ZvJha3-7g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3aa70c85-b4f8-4b67-2573-08da1479ce3d
x-ms-traffictypediagnostic: MN2PR11MB4663:EE_
x-microsoft-antispam-prvs: <MN2PR11MB46630A3FAF3634A857F43DF48CE39@MN2PR11MB4663.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vtNdsWjSvc9ZtpPWk/DxuCm5AC2eMcgf9fmo4TJ8Q2qlYK/rM/keTViH13130eLep+gwGAbJpKLNKDrSE5py3pEirw6Rhyz8xRpB0CA1x9ZJdBWDmCqvW99qYv8Y8JSFXXGBsCzRpylGZ0DY7sWWh6CZQ22EYW9m3RE/2uVQCKHIMzC3oyHmlgmEchGwMcYuhObAE5O+kBlTf10I3lfixavpIMHUr+0UU5e3cic3gS1NXclC+fXex1FGNkCPFdI4FVBudJCogBxb0IQiVr2uXAKHzML6unw03VfDWg3s9X6UKAAtuuG5kjp23w4XP2iZ6jQUN3izD577uL4J/Hn6j3myELZY42/Gdb+iD4yXqjIdi25qpCBQURYQ1GSUZdHy7FEH9KLsCxUYPuUKLAVnYX9pjvnG2yjCKMuFBOUmTC9ooA9ZNX7zFOdfB+WeZeuhFO7fXZLksfFVu5tGOJCKbgOptaYXGvha0mK7BRQhS4AT/vb7KvAmViOSyyogU54BeuOPrUkhRlsaF1IQPuDTk9D2i2FoyGk0xlDtvtPaFmg64lRViVN6OmH2WmjWtXtysdE8Cf2G3bGLMnjLCqoy7pbiN/MgxLZL9rITNWYb9+rlTMRpuZ2uPBxNzrYMeBrJfUKoEmg392IxbUWiqaHosw/+ilJ3jXMuLu0PWtMkSkCglbOZ2HdWhs/obh+1wpz03oZ96+fDCGfWL9iem/k3jXBtLjS8pr3xuDdg/ccAUif8T1yUinqbBbBOfaSFm3LvTH3lec37E+ZLvxmrqoVX9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(38100700002)(52536014)(8936002)(38070700005)(5660300002)(71200400001)(2906002)(6506007)(33656002)(7696005)(9686003)(53546011)(83380400001)(55016003)(82960400001)(122000001)(86362001)(508600001)(76116006)(66556008)(66446008)(66476007)(66946007)(64756008)(966005)(54906003)(6916009)(316002)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZExVNDhLTXJNL1hqdkRZcW5EN3QzcmVZZ0tndThoTko0WkJSbzlneHdqcXY3?=
 =?utf-8?B?bTVHQkt4YmJJUmErYXRMSmtpTC92dldWQzE0OXp1K00vWW1aMHRHQVUzMy9H?=
 =?utf-8?B?a1ZySG15MnM3M1BYTHJIZjN0RFRZMVd4WFB5ak4wMEVlbVMzSVJjSzhKVEdZ?=
 =?utf-8?B?WmYwTnJzbzh6N052eWRpdlhJL3pNTHZCdmxPbjB3Y2lNcTBIaVlHZ2ZYdDNz?=
 =?utf-8?B?UlI1K1dUK3pnSkd3Y2hYSWlMY2lDMUxqTXJqdDBhNXdtWjlmS3Zjb2JCSm85?=
 =?utf-8?B?czVvRTRDNE9DbXlQazY5cUVLQnNVVDE4SEdCUmV4U3ZzUjIxQnUwRGszMTY5?=
 =?utf-8?B?SmRxb2ZWc0ZCdVNFbjE4RXBBa2hNUzliNUZlSlpXVkdrU28vYUgweHZkbXFr?=
 =?utf-8?B?TjdpMkZadXB2QXBpSWFwUnBDYVBPTkV0RXRMYmJpYlA2Rk4yai82TkZEVTZy?=
 =?utf-8?B?cU4xbWhhZnc4RTB4eEJiUlRSUHhmdXZLR2taclE1TDk4RDlCVzVEdlFQV0Jv?=
 =?utf-8?B?RE9tSGFXRWJGRmFIVitRNmFmTklVazc3Sld2Zi9ndUlHWFNLbUhSQlJldEdL?=
 =?utf-8?B?elBDTWF0VDhjeE5lczlVbUN0YUhWTFdzK21HU0RQSjZsMmtheHZ3R1ZpZzZP?=
 =?utf-8?B?SEE3QWRuWVh6NVZlNVE1MEJ2ZjZra2FsRlJLTEtjc040R0dZOWhSVnpwbG5i?=
 =?utf-8?B?NWN4Tm91bjIwNVBJSHVhMmtCTUR4Sk5TNHNyeDFKYi9VUlYrMmZYM3ZjNHJ0?=
 =?utf-8?B?eXQvZjUrZzN0TStOOVpOL0ZoQmplOHJ6ckUrbDNOK0o0VjlIdEFrK0FGUVpi?=
 =?utf-8?B?dmpiNHc4cmJqZ0pLandRa21yYk8yV3lXQkpYRW5USENZU2ZVcHhLbms5amRR?=
 =?utf-8?B?WTNvYmpOL0oydVA3TGVxZW5yb0s2c2I0dXVuZitPa3MyTFdkRGJEaHU3V0ZF?=
 =?utf-8?B?Y2tTM1IrSks4YmtTOFROWlM0eGlRTTFqV3J4WllweElYM1ByWENHamRaSGNx?=
 =?utf-8?B?T21TaWt4LzZ3WHZpdG5zdGV0WEY5VHcwdHRESy9jaFhManpZSUNTcHBxVmRp?=
 =?utf-8?B?RG1jbXN2QTkzRkM4SkZUNTVUQjJRSEF3L2VXSmIxZVpKcGozWTNSQUV3c0Rv?=
 =?utf-8?B?a094cmNCK3ZIajNhV2V6T3BjbmFyQ1VWUmFqVlZQUnZkSTRaZ0lRK3F5V3o0?=
 =?utf-8?B?c21uckJoaHlJRTdzWmtEb3BFc2lIa0pWc3pCUFBtMnozZk1VRGlpMUxMNlpt?=
 =?utf-8?B?SVN3bzB4eEpKSmhXSFRpUGlwdnRaR0E2dmpzZ0gxSUgydE9EK3QxREFuQ3Fy?=
 =?utf-8?B?L0laSXBmbHB4ZjdrV3pOSEV3Z2ovenVVdWx5V3UrWG1jZkpkKzk3Q2lFNXk1?=
 =?utf-8?B?WWRLdExnYmJGSjYyaUNZQUNQYVFEcjlUNkJLQjFwOEpmWFpUS3FvdXZQMzV6?=
 =?utf-8?B?OGpvVWZtcGM5aWhCWFFvS3BXZjZzS3FablRFYy8zNVhqWXR0cGlFUWtya2lK?=
 =?utf-8?B?cWFnN09sSUtKVEtVeVFCU1p3azY2M0E5K1JYQ0JXN244M1RrLzd1Q1ZSMitT?=
 =?utf-8?B?d2tBaE1rR3hTcHFObVIydVFWT0lweDBHOTB2Ykt4OG5rRFU2Q2RET0NNcEVI?=
 =?utf-8?B?QmdwUk5ueGh6bmp2OXRSMmFvVEs5U2lTNGpEOEpCbUJYZUo2WkV3cHlWNUly?=
 =?utf-8?B?aUVzcjFUZGI2R0xXd1N5OHplazk0M1VOc3pNMEtEKzB6Z0pwdm1vZUlHTFBB?=
 =?utf-8?B?NUFSclIyKzIyKzBKRG10YytSdXprSDhIbkZtS2U2aHBlREttcWxvUEMyV0Fp?=
 =?utf-8?B?clNjOGNHK3p5ZmJCWWZOdkdKcmlXNitVZENxbUl5bk0ySlpXdmU1NU00K3pH?=
 =?utf-8?B?bDZLZlIyWGdNTTE4dFZpY2t3R1hnKzVIcHRTR3B0Qm1adldWSldhTEN6Zm9R?=
 =?utf-8?B?K1RIV0pIcnk4REtTVFlNVkQ2YkxIVWVCWE40WVJWZ1V2eHMrMmVJeUpNcVJJ?=
 =?utf-8?B?NDcyZFBXcUFFK0xTSXV2Vk9lV1A5RVZ0Q21KYm5lUXVKREFLc3NZWHZXUWxs?=
 =?utf-8?B?UGt4Y2x2aWNMR3BDUzlUQmpmdEhVTldGMTRBR3FSVUtsVmtFUytmN2FqMDFU?=
 =?utf-8?B?dDRMcDVLK3RuNUJHa3dTUlFraWlydkJrWk5zYXRrTENkRkVHTG9GNkpYMTdo?=
 =?utf-8?B?THRyU25rQmxCa3dpZUl3bC9YVmEvTUppNmxRZjZsQ3VtS3hTVjNPcktSOW0v?=
 =?utf-8?B?YUhjY2E1cTNmZ3Npb2FoamNGNEltZGR5MWVHT1ZjNlNCbkdYbWJoc3lod0dr?=
 =?utf-8?B?T05XSmNKZTNMMEZsSktreldCWHVxanRtM3EvdFFNZzQ1WXhacUY2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa70c85-b4f8-4b67-2573-08da1479ce3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2022 07:24:20.8964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PN7VO8xUr+dnUc/TmXvakxAaiGzO58HohjhiNqvxySQq8+V6BVTiFzdlrT31b1KHNKROymmZAPo2DKu+hbPFFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=kevin.tian@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIE1hcmNoIDMwLCAyMDIyIDQ6MzIgUE0NCj4gDQo+IE9uIFdlZCwgTWFyIDMwLCAyMDIyIGF0
IDQ6MDIgUE0gVGlhbiwgS2V2aW4gPGtldmluLnRpYW5AaW50ZWwuY29tPiB3cm90ZToNCj4gPg0K
PiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gPiA+IFNlbnQ6
IFR1ZXNkYXksIE1hcmNoIDI5LCAyMDIyIDEyOjQ5IFBNDQo+ID4gPg0KPiA+ID4gT24gTW9uLCBN
YXIgMjgsIDIwMjIgYXQgMzowMyBQTSBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
DQo+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiA+IEZyb206IEphc29uIFdhbmcNCj4gPiA+ID4g
PiBTZW50OiBNb25kYXksIE1hcmNoIDIxLCAyMDIyIDE6NTQgUE0NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+ICsgICAgLyoNCj4gPiA+ID4gPiArICAgICAqIHZ0ZC1zcGVjIHYzLjQgMy4xNDoNCj4gPiA+
ID4gPiArICAgICAqDQo+ID4gPiA+ID4gKyAgICAgKiAiIiINCj4gPiA+ID4gPiArICAgICAqIFJl
cXVlc3RzLXdpdGgtUEFTSUQgd2l0aCBpbnB1dCBhZGRyZXNzIGluIHJhbmdlIDB4RkVFeF94eHh4
DQo+IGFyZQ0KPiA+ID4gPiA+ICsgICAgICogdHJhbnNsYXRlZCBub3JtYWxseSBsaWtlIGFueSBv
dGhlciByZXF1ZXN0LXdpdGgtUEFTSUQgdGhyb3VnaA0KPiA+ID4gPiA+ICsgICAgICogRE1BLXJl
bWFwcGluZyBoYXJkd2FyZS4gSG93ZXZlciwgaWYgc3VjaCBhIHJlcXVlc3QgaXMNCj4gcHJvY2Vz
c2VkDQo+ID4gPiA+ID4gKyAgICAgKiB1c2luZyBwYXNzLXRocm91Z2ggdHJhbnNsYXRpb24sIGl0
IHdpbGwgYmUgYmxvY2tlZCBhcyBkZXNjcmliZWQNCj4gPiA+ID4gPiArICAgICAqIGluIHRoZSBw
YXJhZ3JhcGggYmVsb3cuDQo+ID4gPiA+DQo+ID4gPiA+IFdoaWxlIFBBU0lEK1BUIGlzIGJsb2Nr
ZWQgYXMgZGVzY3JpYmVkIGluIHRoZSBiZWxvdyBwYXJhZ3JhcGgsIHRoZQ0KPiA+ID4gPiBwYXJh
Z3JhcGggaXRzZWxmIGFwcGxpZXMgdG8gYWxsIHNpdHVhdGlvbnM6DQo+ID4gPiA+DQo+ID4gPiA+
ICAgMSkgUFQgKyBub1BBU0lEDQo+ID4gPiA+ICAgMikgdHJhbnNsYXRpb24gKyBub1BBU0lEDQo+
ID4gPiA+ICAgMykgUFQgKyBQQVNJRA0KPiA+ID4gPiAgIDQpIHRyYW5zbGF0aW9uICsgUEFTSUQN
Cj4gPiA+ID4NCj4gPiA+ID4gYmVjYXVzZS4uLg0KPiA+ID4gPg0KPiA+ID4gPiA+ICsgICAgICoN
Cj4gPiA+ID4gPiArICAgICAqIFNvZnR3YXJlIG11c3Qgbm90IHByb2dyYW0gcGFnaW5nLXN0cnVj
dHVyZSBlbnRyaWVzIHRvIHJlbWFwDQo+IGFueQ0KPiA+ID4gPiA+ICsgICAgICogYWRkcmVzcyB0
byB0aGUgaW50ZXJydXB0IGFkZHJlc3MgcmFuZ2UuIFVudHJhbnNsYXRlZCByZXF1ZXN0cw0KPiA+
ID4gPiA+ICsgICAgICogYW5kIHRyYW5zbGF0aW9uIHJlcXVlc3RzIHRoYXQgcmVzdWx0IGluIGFu
IGFkZHJlc3MgaW4gdGhlDQo+ID4gPiA+ID4gKyAgICAgKiBpbnRlcnJ1cHQgcmFuZ2Ugd2lsbCBi
ZSBibG9ja2VkIHdpdGggY29uZGl0aW9uIGNvZGUgTEdOLjQgb3INCj4gPiA+ID4gPiArICAgICAq
IFNHTi44Lg0KPiA+ID4gPg0KPiA+ID4gPiAuLi4gaWYgeW91IGxvb2sgYXQgdGhlIGRlZmluaXRp
b24gb2YgTEdOLjQgb3IgU0dOLjg6DQo+ID4gPiA+DQo+ID4gPiA+IExHTi40OiAgV2hlbiBsZWdh
Y3kgbW9kZSAoUlRBRERSX1JFRy5UVE09MDBiKSBpcyBlbmFibGVkLA0KPiBoYXJkd2FyZQ0KPiA+
ID4gPiAgICAgICAgIGRldGVjdGVkIGFuIG91dHB1dCBhZGRyZXNzIChpLmUuIGFkZHJlc3MgYWZ0
ZXIgcmVtYXBwaW5nKSBpbiB0aGUNCj4gPiA+ID4gICAgICAgICBpbnRlcnJ1cHQgYWRkcmVzcyBy
YW5nZSAoMHhGRUV4X3h4eHgpLiBGb3IgVHJhbnNsYXRlZCByZXF1ZXN0cyBhbmQNCj4gPiA+ID4g
ICAgICAgICByZXF1ZXN0cyB3aXRoIHBhc3MtdGhyb3VnaCB0cmFuc2xhdGlvbiB0eXBlIChUVD0x
MCksIHRoZSBvdXRwdXQNCj4gPiA+ID4gICAgICAgICBhZGRyZXNzIGlzIHRoZSBzYW1lIGFzIHRo
ZSBhZGRyZXNzIGluIHRoZSByZXF1ZXN0DQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBsYXN0IHNlbnRl
bmNlIGluIHRoZSBmaXJzdCBwYXJhZ3JhcGggYWJvdmUganVzdCBoaWdobGlnaHRzIHRoZSBmYWN0
DQo+IHRoYXQNCj4gPiA+ID4gd2hlbiBpbnB1dCBhZGRyZXNzIG9mIFBUIGlzIGluIGludGVycnVw
dCByYW5nZSB0aGVuIGl0IGlzIGJsb2NrZWQgYnkNCj4gTEdOLjQNCj4gPiA+ID4gb3IgU0dOLjgg
ZHVlIHRvIG91dHB1dCBhZGRyZXNzIGFsc28gaW4gaW50ZXJydXB0IHJhbmdlLg0KPiA+ID4gPg0K
PiA+ID4gPiA+ICsgICAgICogIiIiDQo+ID4gPiA+ID4gKyAgICAgKg0KPiA+ID4gPiA+ICsgICAg
ICogV2UgZW5hYmxlIHBlciBhcyBtZW1vcnkgcmVnaW9uIChpb21tdV9pcl9mYXVsdCkgZm9yIGNh
dGNoaW5nDQo+ID4gPiA+ID4gKyAgICAgKiB0aGUgdHJhbmxzYXRpb24gZm9yIGludGVycnVwdCBy
YW5nZSB0aHJvdWdoIFBBU0lEICsgUFQuDQo+ID4gPiA+ID4gKyAgICAgKi8NCj4gPiA+ID4gPiAr
ICAgIGlmIChwdCAmJiBhcy0+cGFzaWQgIT0gUENJX05PX1BBU0lEKSB7DQo+ID4gPiA+ID4gKyAg
ICAgICAgbWVtb3J5X3JlZ2lvbl9zZXRfZW5hYmxlZCgmYXMtPmlvbW11X2lyX2ZhdWx0LCB0cnVl
KTsNCj4gPiA+ID4gPiArICAgIH0gZWxzZSB7DQo+ID4gPiA+ID4gKyAgICAgICAgbWVtb3J5X3Jl
Z2lvbl9zZXRfZW5hYmxlZCgmYXMtPmlvbW11X2lyX2ZhdWx0LCBmYWxzZSk7DQo+ID4gPiA+ID4g
KyAgICB9DQo+ID4gPiA+ID4gKw0KPiA+ID4gPg0KPiA+ID4gPiBHaXZlbiBhYm92ZSB0aGlzIHNo
b3VsZCBiZSBhIGJ1ZyBmaXggZm9yIG5vcGFzaWQgZmlyc3QgYW5kIHRoZW4gYXBwbHkgaXQNCj4g
PiA+ID4gdG8gcGFzaWQgcGF0aCB0b28uDQo+ID4gPg0KPiA+ID4gQWN0dWFsbHksIG5vcGFzaWQg
cGF0aCBwYXRjaGVzIHdlcmUgcG9zdGVkIGhlcmUuDQo+ID4gPg0KPiA+ID4gaHR0cHM6Ly93d3cu
bWFpbC1hcmNoaXZlLmNvbS9xZW11LQ0KPiBkZXZlbEBub25nbnUub3JnL21zZzg2Nzg3OC5odG1s
DQo+ID4gPg0KPiA+ID4gVGhhbmtzDQo+ID4gPg0KPiA+DQo+ID4gQ2FuIHlvdSBlbGFib3JhdGUg
d2h5IHRoZXkgYXJlIGhhbmRsZWQgZGlmZmVyZW50bHk/DQo+IA0KPiBJdCdzIGJlY2F1c2UgdGhh
dCBwYXRjaCBpcyBmb3IgdGhlIGNhc2Ugd2hlcmUgcGFzaWQgbW9kZSBpcyBub3QNCj4gaW1wbGVt
ZW50ZWQuIFdlIG1pZ2h0IG5lZWQgaXQgZm9yIC1zdGFibGUuDQo+IA0KDQpTbyB3aWxsIHRoYXQg
cGF0Y2ggYmUgcmVwbGFjZWQgYWZ0ZXIgdGhpcyBvbmUgZ29lcyBpbj8gQnkgYW55IG1lYW5zDQp0
aGUgbmV3IGlvbW11X2lyX2ZhdWx0IHJlZ2lvbiBjb3VsZCBiZSBhcHBsaWVkIHRvIGJvdGggbm9w
YXNpZA0KYW5kIHBhc2lkIGkuZS4gbm8gbmVlZCB0b2dnbGUgaXQgd2hlbiBhZGRyZXNzIHNwYWNl
IGlzIHN3aXRjaGVkLg0KDQpUaGFua3MNCktldmluDQo=

