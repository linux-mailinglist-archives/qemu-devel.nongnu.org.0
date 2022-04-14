Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2041F5004A6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:27:07 +0200 (CEST)
Received: from localhost ([::1]:48088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neq8P-0003x8-VL
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1neq6J-0003FR-AI
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:24:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1neq6G-00011f-SO
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649906692; x=1681442692;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h9b7pFuyx3U1NmC/Cu/8QIla9i7uLt1rIRiSIF8fM1Q=;
 b=QeB3tsNHbgd06ZXQFAJ/IStyLCXyfS6hI3IHFzVRvdP2AN1tKbdqG+A8
 OZ9ARYm6FLGtQy36L8m809FB+7Jn6v4cM/me9x5AZxmlB4tDz8m0mc8M0
 4fJej3DvSK3yI7VO2KCMk4vNvTYqlgXtbbJ2wcyHchR8WHy08dmsjAET5
 Ph1vd9kkOJYY5b93IFSbXk+aqx1Vi3pKYcmtqudyEw+s93ctfHoBLwrIb
 OsN/pnVeibUsIAKrlfXv9J3joXgbIn/+DIkJQnSaWra1QtUQBgKBva4Zw
 i79x052yq4dWWT6K8Oealp2efLaPyLX7MexTLk/LHf0zseQu0CReEQYv3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262275070"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="262275070"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 20:24:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="591008428"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 13 Apr 2022 20:24:50 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 20:24:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 20:24:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 20:24:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYvV0cR1i2feREtT2wYZNhaaP6pXoVHvl6wjyzmNhX8/anna1XsZE4gy4kJM5Gjk8oMqTyuaqPQExtkpRUvjCmw67Ok8Thc9oCNKSHFYS2aDQK0o7Z7aATRZNzr/P6XiP/jt8e+MoRNpDR6+P2Bd3AWGVkFU5O9gf/YdSDQ+oMVDoMK8B3cRxaLRvmkf48aWjhiZdksU3ArfQ9TtQP+SKW6mlkZEbjWrLXFqw0fjD2rHusqLgJPsbmy0Kf05YnNwa73W5DLdVAV/JdBUfwyvYB+XmNHMTp2Xp3uOEvejtGhR9UbYgXFa06e8l/ruOK9JcyveBk4TJUhcBZNW2xVvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9b7pFuyx3U1NmC/Cu/8QIla9i7uLt1rIRiSIF8fM1Q=;
 b=VwqthksVH1o5H9/+LERMeNDoSsUENbjAMSVJ26gOeDTtirW4q6qQYCFX0BvyseKnHwv83FgAgrUFm3pyEoeOTp0sH8YtSBEQ/bDguegAGG9B0DVbYpIah+QHF4PtWvE7NE6nLLoOiIFrJiIG2DLJaDvrRdPWs26k5YllUxXKa5h02cOTDTGGZL76xH3rQK/pDIT+/5wvqpgSX1efclzyHmemMEOmwNHC92JG2ZOo/0U1oh55Efv0YFvJkgc66hYxTwzk91x+3HrIkEVfgMvwPwtM2q/YBsQZG42v2ro1nbAoQC12j0G/ruuE4MRdIxvBr9xo0Ig/4zc0kLGxI/BtNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM6PR11MB2763.namprd11.prod.outlook.com (2603:10b6:5:c6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 03:24:47 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3884:3f8a:f1f9:f940]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3884:3f8a:f1f9:f940%3]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 03:24:47 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V2 0/4] COLO net and runstate bugfix/optimization
Thread-Topic: [PATCH V2 0/4] COLO net and runstate bugfix/optimization
Thread-Index: AQHYRXzl+GS3uwjhJkKd6PjaLQ1UUKzuuRwQgAAWu4CAAAMBgA==
Date: Thu, 14 Apr 2022 03:24:47 +0000
Message-ID: <MWHPR11MB003197C7C095FD7A816829D29BEF9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220401034702.687057-1-chen.zhang@intel.com>
 <MWHPR11MB00314CD6EF6407DD7CFB2FC89BEF9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEvE9Hf56dkd4zB0JULr7cG-g0Bafxz4--Xj+C2z5MUkfQ@mail.gmail.com>
In-Reply-To: <CACGkMEvE9Hf56dkd4zB0JULr7cG-g0Bafxz4--Xj+C2z5MUkfQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94e5c92a-f9ef-4d79-e9a0-08da1dc653fb
x-ms-traffictypediagnostic: DM6PR11MB2763:EE_
x-microsoft-antispam-prvs: <DM6PR11MB2763081B4F89F822A80025929BEF9@DM6PR11MB2763.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w2xRAFIqqCRSPIcx/swv56fgn+pD3GVgabiQHvOZgBRYEOGUjamSOL5yASLOb8Gw4f+Aj+OCpkua8LxP0YO8F2e8Pr9TFoTphCxmK9q10RTo4FZx8IN9+02vpDocwTlC7WkXT0oGHGJHQGVqQu4pOmlBWa5pimhmgOG3HgGfj/8sxvg2PCri9qzlzBTnc7tDy0jNmsO7/dQD+9GqKFzmVKxR+d1yatkSFJd/FMv5e5mfgzTrSylu3sxtM+e6lvPJiA4u9MHRMyckTU+9B30Wjr5MBQu3EZDZKDlK3l+5aUADL/FuNpHPf8weKLxJLzm+j2Vm1KYoGEo1sUU4WRCxIPsO5Duv8ZTCzWsmYKy+PRQMShZGeEupijInUmDQ0nBQXrzOfp6rum/zBpve6lAyYQB5Nod3ZrLz1vkPK/8ybv0UD4avgnLCaaZAk9xJMsd87HoOceYUeQvSa3OUuYnpUlbDm8HnrBXgV5WcyEW7IHxJ8IVGraZq8oAz9DfGjGhnjjrXeMGDmcvNouUAO1iLBkomnk1RBgq/8ntr9TeF0kIEk8kB09ebz5Z0dbI/OkaeQLlHZDQLHoNnFwcdDsuv84ocnPznMDrvhNpAbZ+Y01lvkmhFMdJgIKA984jhjurQ/+9ykDnT5K8Amwr5G88+Ec3OmhmheXPzJydwMw3jtXFjIkAH6NgdWKzOMO5UQqdaGX4lGB007PrnbJSUqlVDlw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(76116006)(33656002)(508600001)(122000001)(4326008)(38070700005)(7696005)(316002)(8676002)(66946007)(66446008)(66556008)(64756008)(66476007)(8936002)(52536014)(9686003)(6506007)(54906003)(53546011)(71200400001)(38100700002)(5660300002)(2906002)(86362001)(83380400001)(26005)(186003)(82960400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFIxT1ZhLzJ5b0tSczBJT1VJNGF6bVdlVWpDb3gzc0RzbDdvaWtwblQrdHI4?=
 =?utf-8?B?ekc2ZWorbnJaSG5tOHAxSmpuemg0QUppOUxpclhYOGdLSURzSC9xZmVtKzQ5?=
 =?utf-8?B?QmVBSUM0ME5zTUdzZ3NiUFRqZVo2YVptNTBad005ZTFSc0Z5L3QzMHBrWHBk?=
 =?utf-8?B?MTVrS2szeTFBWUhRYVlnd21DUjdnZXRURUdNWkZicXRyRkxCZTV6amZpKzFR?=
 =?utf-8?B?VDQ0NUJ4OWc4YTZLTlR3clhJdUlnWFNwVURwU1Zha0tMMHdUMUhveGdENmVz?=
 =?utf-8?B?VC82ditJU2R2MDdZUWJ1U2RpeFVValRyUHFxS2FMdnp6R05CZVdSVytrNUhD?=
 =?utf-8?B?NXFla1BzMnBxUWJSQXR6dk1Bd2Rab3BvNDc5WVpmd2o4N0JydUZpWlZuYkJJ?=
 =?utf-8?B?UCtuMTFIcnFFUGQrVXhxNnFJaWlqUWJyck5sMmorT3N6U3VFVXFDVkdadW9a?=
 =?utf-8?B?R21ycUhSL0VLMEdTSHpnc2hVeEVsS09UakpHS3NObXBVWDI1eUpuT2FNMVZM?=
 =?utf-8?B?Z0VhWGJpTGQrUFJ1cHBvZmVPN3dVQTNocFptTVN0TzBtV0pjSTZkVCs4YUt2?=
 =?utf-8?B?Z1FKdUNxQ0pYWUI5OU9Ha3dBa1p5L0FTemMwTUtXbGJWL2JBc0xKSU1yYlQy?=
 =?utf-8?B?RFliN0x3M3V5KzQ2RHF4dnBFSnMzaXVwbk1hbEhKaXVUazMrTDNiMzlrazc3?=
 =?utf-8?B?bFlNUHhsR3BqcWhMTE9wcWNBNUdmSWJITytpZFZjL2daZVdsKzdNdytRT2ta?=
 =?utf-8?B?WTJ4dVE3cWFjZHdMRTZwQmkvVzhmUEZZdlBpWXhDRjUxL1NhRjRQWWJwRkht?=
 =?utf-8?B?ZDlWeG10YjZrbUdCVEo2VC9NUnJIMlNJdUtKNXh3YmJVQkJtWGR6c3k2aXQ2?=
 =?utf-8?B?TUVaM0ZSa25VVFF2WmxWSGZhdWZrOGdmLzBhSDY4M3dZY0d1ZndxdWM0dXBh?=
 =?utf-8?B?RFNKNnZZbzV5K1ppSEFqcmFoWXlXWktEOVNmVUVIOVl6eGNzZjBtUklZYWhj?=
 =?utf-8?B?YnIvb2lIenZ3SUpQY2ZoYitmL1EyWXNXejk0S1hidTJCWDNmczNtV2pSaDUy?=
 =?utf-8?B?amVLMDByREZrSUYrb0VPVlhTRUF4WStsV1dObTNXNk92disvdTdmK0NWVFZU?=
 =?utf-8?B?YTJURERvTkVwVW1TbWdaaEgzRVA2d1RWSFRVY29mWnJXdEJ0N1l5WVVMZlZQ?=
 =?utf-8?B?UUFxUm9OVnNJMTBvWmllMmlCcDIwMHZmMFcrcDF6VkxRWlVuUjBIajdNcEJ5?=
 =?utf-8?B?VGlQaktiNDUvdk16MlZ3WUVGbEZFV1doZjBvNFhuTjRQbzlZMTdSU0gwWWdv?=
 =?utf-8?B?bHdaWlZwMW1PanQyNFhvZEQ0Z0FQTU5VblhXT1Yxa21mUWZBU3h1djl4K3o1?=
 =?utf-8?B?VlZ2R3dBeGU5STV0aTNpYk9wQnNNaWpxTFoxMWptWGlJVExIUDFZUStCYnlE?=
 =?utf-8?B?SWxrdXZ6UVhCTW5VekJhYjZtK1MvNTVwdmxQdHVBR1ZCdzYvamJyYjB3SDQ1?=
 =?utf-8?B?VHE5MGVtUHZWNTR3dVh2VklGV3FVdDhRTU0vQW5GaUhBd0syTnBHK0lvbmYy?=
 =?utf-8?B?dUU1cUVENkpwb0xZQnF2U1Vud1FrM0dscHc4MEhzM1grUlUyTUl1VjhMR0FG?=
 =?utf-8?B?Y2N0c0FWSkVEM2hKeHY1YitWZW9PTC9HVE5IZEtyaHRhbjdmNXR4bDhMTG1x?=
 =?utf-8?B?VTA1R0I4a3RLRFdXWDYvVWVUQWxFT2FFU3IxcmtCMHdjcUMwQnpwLy9EaVlS?=
 =?utf-8?B?UjlzZG1vQnFvOUkvMnVuV3VLTDdSb0tlOExXajkrZlNLb2ZKTkhWb1BmdTFa?=
 =?utf-8?B?RnpDYlhmSzIvVDkvQUpKSktYbzM3NFlXcHRsKzR3WmdyMytabU10aEpBM1ow?=
 =?utf-8?B?RjhnVVdyY3VXOU9xdm5XUDN6bGtUUVZsQktmbTI2RFJhVzdDSVZuSkpXVEtD?=
 =?utf-8?B?MnQzNWRUT2tBc0V3cmNsMVhBTkQxNjV0VUdVcVZlTUozdWxmc2NtVHYxREdV?=
 =?utf-8?B?RW5kTkJMQitXZ25Zem9kYlpSWWE2ckxTa2xld0RFZUFDa253NDZKU3pJV293?=
 =?utf-8?B?RytiODJHR2Q2cjBHWlBVNUVBQW9LcVpDZDIwcmFJQjRlOWJhajBsY21sNFdN?=
 =?utf-8?B?YTlpa3VseXRnREluL1hkOC9qYW4vWG9jMlNoUVhIYWZ6NzNGdFZ5RUYwaEsy?=
 =?utf-8?B?cFV1Um1aV28zMjhUM1ppL0VtWFpwcUxrSHVoS3UvNDhHQ0I0YWJyMThvRjFT?=
 =?utf-8?B?SzJWV2ZEeUIzUWJPeEFKZXl2clpkdmwyd0dQQjBkeitQOXBIZGJjaUtML29O?=
 =?utf-8?B?YkQ4OWpVS2I3RDI5Nk9UUzVjWHFKTkFVRU5OejJVcmUxdmUyQWFjQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e5c92a-f9ef-4d79-e9a0-08da1dc653fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 03:24:47.4688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V6A1edYHwNskNWAtvM/MNbaZWmtjijuG78PPmkHOoSvGtgvKqkXtOloDHdaAB7twXd+CD0UxUOTY0Z21GUc2CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2763
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDE0LCAyMDIyIDExOjEy
IEFNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IENjOiBMaSBa
aGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4gZGV2
ZWxAbm9uZ251Lm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAwLzRdIENPTE8gbmV0IGFu
ZCBydW5zdGF0ZSBidWdmaXgvb3B0aW1pemF0aW9uDQo+IA0KPiBPbiBUaHUsIEFwciAxNCwgMjAy
MiBhdCA5OjUyIEFNIFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gd3JvdGU6
DQo+ID4NCj4gPiBObyB1cGRhdGUgZm9yIGEgd2hpbGUuIFBpbmcuLi4NCj4gPg0KPiA+IFRoYW5r
cw0KPiA+IENoZW4NCj4gDQo+IEhpOg0KPiANCj4gSXQncyBuZWFyIHRvIHJlbGVhc2UsIEkgdGhp
bmsgd2UgY2FuIHF1ZXVlIHRoaXMgZm9yIDcuMT8NCg0KU3VyZS4gSSBmb3Jnb3QgdG8gYWRkICJm
b3IgNy4xIiB0YWcuDQoNClRoYW5rcw0KQ2hlbg0KDQo+IA0KPiBUaGFua3MNCj4gDQo+ID4NCj4g
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBaaGFuZywgQ2hlbiA8
Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+ID4gPiBTZW50OiBGcmlkYXksIEFwcmlsIDEsIDIwMjIg
MTE6NDcgQU0NCj4gPiA+IFRvOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgTGkg
Wmhpamlhbg0KPiA+ID4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4gPiA+IENjOiBaaGFu
ZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4gPiA+IGRl
dmVsQG5vbmdudS5vcmc+DQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggVjIgMC80XSBDT0xPIG5ldCBh
bmQgcnVuc3RhdGUgYnVnZml4L29wdGltaXphdGlvbg0KPiA+ID4NCj4gPiA+IFRoaXMgc2VyaWVz
IGZpeCBzb21lIENPTE8gcmVsYXRlZCBpc3N1ZXMgaW4gaW50ZXJuYWwgc3RyZXNzIHRlc3Rpbmcu
DQo+ID4gPg0KPiA+ID4gIC0gVjI6DQo+ID4gPiAgICAgLSBBZGQgbW9yZSBjb21tZW50cyBpbiBw
YXRjaCAyLzQgY29tbWl0IGxvZy4NCj4gPiA+DQo+ID4gPiBaaGFuZyBDaGVuICg0KToNCj4gPiA+
ICAgc29mdG1tdS9ydW5zdGF0ZS5jOiBhZGQgUnVuU3RhdGVUcmFuc2l0aW9uIHN1cHBvcnQgZm9y
bSBDT0xPIHRvDQo+ID4gPiAgICAgUFJFTEFVTkNIDQo+ID4gPiAgIG5ldC9jb2xvOiBGaXggYSAi
ZG91YmxlIGZyZWUiIGNyYXNoIHRvIGNsZWFyIHRoZSBjb25uX2xpc3QNCj4gPiA+ICAgbmV0L2Nv
bG8uYzogTm8gbmVlZCB0byB0cmFjayBjb25uX2xpc3QgZm9yIGZpbHRlci1yZXdyaXRlcg0KPiA+
ID4gICBuZXQvY29sby5jOiBmaXggc2VnbWVudGF0aW9uIGZhdWx0IHdoZW4gcGFja2V0IGlzIG5v
dCBwYXJzZWQNCj4gPiA+IGNvcnJlY3RseQ0KPiA+ID4NCj4gPiA+ICBuZXQvY29sby1jb21wYXJl
LmMgICAgfCAgMiArLQ0KPiA+ID4gIG5ldC9jb2xvLmMgICAgICAgICAgICB8IDExICsrKysrKysr
Ky0tDQo+ID4gPiAgbmV0L2ZpbHRlci1yZXdyaXRlci5jIHwgIDIgKy0NCj4gPiA+ICBuZXQvdHJh
Y2UtZXZlbnRzICAgICAgfCAgMSArDQo+ID4gPiAgc29mdG1tdS9ydW5zdGF0ZS5jICAgIHwgIDEg
Kw0KPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gPiA+DQo+ID4gPiAtLQ0KPiA+ID4gMi4yNS4xDQo+ID4NCg0K

