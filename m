Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36B85BF18D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:55:04 +0200 (CEST)
Received: from localhost ([::1]:45330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oan4x-0000Js-Ni
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1oakAZ-00017Z-QI
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 16:48:39 -0400
Received: from mga17.intel.com ([192.55.52.151]:8277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1oakAL-0005ri-Ts
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 16:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663706905; x=1695242905;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RtdtziNA7rV1Sj4e0geREcTzkWiFMfL+f9HmvjAfbJU=;
 b=NoTi+Yx3D9XERapMvcppQVNMWaE8uS3Cq40jgT96veQaYgKTdnG1/q2l
 a+KwB3Kt6eVjwfY6BxH/mKZAwkrE+4DNjgOt1cfrsdsk0jCRN1ngqpr16
 xh1D1EcmOdsrN2T5svdlDQx5D4jJdMSO+aeoCKd53G4YNWQn5KsFf7idq
 govndBKyfbWjnsgrRqubYPoCvotWnuHugxOXIHzC66PBaqZ/Kxurh6Gd1
 Zio8oCCNYsHDhy3n+bdIHb9UN8KOJwueQSzsR5YxDJV5aclbQkjP7FwGQ
 gzbjYnFj9hLOehoHJS85ASU14f5uydj3LglEVm/aLIyw2C+g8hLxfNYY/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="280191327"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="280191327"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 13:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="947842583"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2022 13:48:20 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 13:48:20 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 13:48:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 13:48:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 13:48:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMQIq41op7SjtJuxPl1kKCUWJt4EjwIkN2fQu+xpiJoJc2skZwVyQILK0eKQNQAMXGpLUD5t/7Ek0oISHHo9IKX5RvP6N/9BlJcb8LWl/3gZn25rFUA4zz5lqima3tgnCPVCokq44F6alAtUVkHxzufcwzP2xqJ3PHHWIEVLIycaEcsbO5cJ6EdCJr5us9tBFIFBQdXsVwRjyIPoLzLLL9tgLZz1phe3Yxuik1ejusV1/ALzwB8gF5/Os961VVcrlfq/XMgYVoYbf0MCDo5yizUN/T5RgG27Q7zY3DSsQX0Ct18NR3UUZGadVFw8aqehqY4AuQsrc6SJh+h1F9AwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtdtziNA7rV1Sj4e0geREcTzkWiFMfL+f9HmvjAfbJU=;
 b=ewM4nmd7ACgBzi9vhBKNsxiN20by7QNatM+K2+YP4JaWYMappu6gUg18GVEjoLdGl7le07gqkgNsovDJQ1+r8Y498sO5P3YGrirL1R7ZARjfDq3a/x7sOPrb1cPmrXZdOkvE9/pFr1Ls+PWEF8Ts0DPwRYhFo45yhZkewitBwanVD7ChfSoZl312/JejsajHRGBCOGoMW3yqdLCQ5aGPNhL2rY80R5xzVIiNGqa5dzSDohzDxqp5M9nEkSjA2klCdqcXJpr4bPZgS1ZJlMP3NyHyyAcKNZSJ6wT32DdLzZEQagFhKenq7wMtrV69xhvm2fJYCWj5wqZ2HXDxhcW3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:443::14)
 by IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Tue, 20 Sep
 2022 20:48:16 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::8f45:e207:3c54:c488]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::8f45:e207:3c54:c488%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 20:48:16 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Markus Armbruster <armbru@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Kim, Dongwon"
 <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Daniel_P=2EBerrang=E9?= <berrange@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, "Thomas
 Huth" <thuth@redhat.com>
Subject: RE: [PATCH v1 0/3] ui/gtk: Add a new parameter to assign
 connectors/monitors to Guests' windows
Thread-Topic: [PATCH v1 0/3] ui/gtk: Add a new parameter to assign
 connectors/monitors to Guests' windows
Thread-Index: AQHYyixEFxcO1t9f2UaUaMhIP9JCw63ocEWqgABOp2A=
Date: Tue, 20 Sep 2022 20:48:15 +0000
Message-ID: <IA0PR11MB718538F0549024D9D66C2410F84C9@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20220917000731.465003-1-vivek.kasireddy@intel.com>
 <87a66uhytr.fsf@pond.sub.org>
In-Reply-To: <87a66uhytr.fsf@pond.sub.org>
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
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA1PR11MB6346:EE_
x-ms-office365-filtering-correlation-id: d175fcb2-218f-4c3d-bd1d-08da9b497119
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +UqlqV8Qd6j5cIYsBNnfPJOTZvjniD15HENp4b2S6z6OFMTdEIKxyGCThK2Ca/NdiGM0sKZLFOn0lJUeOzPlVV0Nr6I9Nm/RizTrCDPHUhY6w+iuYqMZxekT3+QXNcSW+8SCeM5JAHqHanWQGDqrwNxd+HW/jRdD25erijSKY6HD9Qf8g7faDpCuO3uFtW7TWuiavn0rCzFbNjNKQDtg7mOuzPJ8dxgrA3bO6k3ppFHyF6o99PMkLBzXgEt9M9WpEkY6u2NlB7Bi1aWNJKuiPgqRNA7AYMbb6F8BwHkwvGDuNhcuwFb14wch+5Yn0iv9RkssNqGsUH59tBlAwiFbywA4bqt5sb9IQITDC2G2JfYHmCzrPET2fIFgorogi+M4IuM37S0EbBM2frK9ZBSwEKvI+KngH3YDhQdvuGYcWJUKTr09ih7f6b8P84kxMQVuZcvQl99n7PjVRYWtVpYvxfMYxE1POrmfhjFSl7k0/RsYV90FeyybEz/os/X37hMWlGFrny43sHHnC2OZTbzhte/m2sfQ4yWIe/QCBpKNLmBKV1zMc4oY3vjgkeQCJT5mBiif6Fvu6eos1h3f0LuzF7r5AdAlq/hBSNC706NcMFy8u3aP0pzuQW9E8Jf5JkVmLSiutnXIUdbAYQbWg4W5CZAM3IE6Zgl5sxXoHt+bGvgogQRhFF/wWlwaDlxkmZYdwpZQTQwEDwy7pQFIMH1AF3nc65rVVDeUY/VaFLXOK6OHJ4mPVNy5G07heHcrOawi206sp4YXvVwCUAOALllxJ9bDvWoL4dcVS3sqSsgi4Pc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199015)(7696005)(26005)(9686003)(6506007)(66899012)(38100700002)(38070700005)(478600001)(966005)(4744005)(82960400001)(2906002)(5660300002)(66476007)(66446008)(122000001)(33656002)(86362001)(186003)(55016003)(83380400001)(52536014)(71200400001)(41300700001)(66946007)(4326008)(64756008)(8936002)(66556008)(76116006)(316002)(6916009)(54906003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jPaMJMCTRxthjWNbaKHVMswbYIWrd8o+KrgFvdcHdUzdyf29ItAqiYJ0Ya?=
 =?iso-8859-1?Q?XMoM+Sfd7zP2RvYeuBRXQirux/bIhKPwlYaCCljzySbsZ7gvEw8RWapXML?=
 =?iso-8859-1?Q?3ZTRTzG7VZCwW2a6mgSctqstsN53kxOMMMqa/sH/kBR1LXX1qWjgd751Uz?=
 =?iso-8859-1?Q?w/yHGMUefyBnbpkkoo1xWwMW1gICgJ5tGQWliHsW+MupwLWIPgrHw6LeM5?=
 =?iso-8859-1?Q?lzvIAqS6/yH8DqDYidw0SBhRQKfVn8BpMWF6fn+R5Nqmzg7/ZNNf/dvaqu?=
 =?iso-8859-1?Q?fQua/oJHuGbrmxo7+tMSUNA/re/0CQAKh5/GO2w65PJ1ocK8+SvZ2g8RPl?=
 =?iso-8859-1?Q?MRHz3IwgSgFYqlMitbCI1+dSfwPJcZYtLnd+FPCGCxBCw9YfuAgG5ac0u4?=
 =?iso-8859-1?Q?0JrWHCEH5+C9BHsmFO0sgTJnMIbP9rDovjCHcjbaHqxVo13voUUAsppgep?=
 =?iso-8859-1?Q?eJfHBK8na8y6jU8yPmN8Ay6SJYHzK15guT1dwVb6wkiXsi/xfRzXBDKMWt?=
 =?iso-8859-1?Q?HsXlCTazmS0lGTxd4e8Y+pYw4Y/inr+VkAtR9+8taq8AR3feyf0aO2VqFq?=
 =?iso-8859-1?Q?5qR6uX3wuHJ8OuPS4fzPP42F7DhOmbs13JQzIbIJGlDp7H/mTA1tJRA6B1?=
 =?iso-8859-1?Q?HTC3dirBkr9PILZyN+4wF2hF0h6Guzfxavq/Kp26A4X+kq5k2nQD/i/hV4?=
 =?iso-8859-1?Q?KYa2YQwSy2qGd5jfn3Nfj661vG4xgfAvjqAwSwLHyng2TsjvkFw7rogBIw?=
 =?iso-8859-1?Q?mfNnVns3PKD9sxyMZXEqhp4gZt+4XOOFqP+5AXMhZ25X5UxDSZI8m0Jv7R?=
 =?iso-8859-1?Q?sA0Rhw3SlNGxiaoCNJC1u4C/zum6IGr9M6ARYzLNS4v1NaeEA5wNLNS2fg?=
 =?iso-8859-1?Q?btP9JbA1K9HLJ357mq8ZXqQgyc25OpqNy2Qq1Nqq5jL2R4+zZDTtfAosiS?=
 =?iso-8859-1?Q?3Lgec7u7tlPodouG37/926AHshHcOQivH07XNheJNWynC0ZhsgljL5OWPw?=
 =?iso-8859-1?Q?1Rm93hTSgBp4JknsQpRm9GGtKHxxhRX7BV3qv/kVyKbfbJsTqmZOBeUO9E?=
 =?iso-8859-1?Q?+vPa6fZm5d3omRFPAxLeY1HS8kk+Z1biSDfBv3t2/r8kTn5ndvnmJrvQO4?=
 =?iso-8859-1?Q?rOSDAI/iw8U4DVWV43pCqbjyT0pE63ONpfQ405UIxflEr/UP20FQMyhsVH?=
 =?iso-8859-1?Q?EaxJbFH1YUXBfBajeXS/YTqHxOd8v0yMdeOxZe9MwXt+95ndkmtLYuLGqp?=
 =?iso-8859-1?Q?FZY5bgQarsvX9e3/EYbOt9/AtCzeHlG9vrW3gMRC75blWpHFHgxrz2a6NL?=
 =?iso-8859-1?Q?Y/peoYkRC5IfYRMas2AqNi8MctqMYa3eEUKxKncBlon3o/adaclMVSXleh?=
 =?iso-8859-1?Q?zhD0e8WWRSSXpGxAVtFzUyjXxy8UYAHjllmPVEkhqUrIAyp0/3UC9AFM7F?=
 =?iso-8859-1?Q?j0KFO1jkFZ3K5+U66ogarWJGgo4gsAKjyAjx9Ldx5i21RS44DIH8/NHyES?=
 =?iso-8859-1?Q?0/8Jw2+zs8anBtAl7NooKd+NTUYDFSdsruJGCAQ1YtNgxDTEc0o4dxkULt?=
 =?iso-8859-1?Q?dkMNF2V0h9Bcp4nceLw9j7rcWNO1h3ySHR0A/1BKIqWatyluZZTHgTTQsw?=
 =?iso-8859-1?Q?NAGcjfNBAxxcuWpXobXsANt5D69pPKI/8PmDoa2MpW5lyGC4TuFmG+tA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d175fcb2-218f-4c3d-bd1d-08da9b497119
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 20:48:15.8620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KPt1kJxLZNXQdNhPLLP9KFjTOlSoWD7Sjt+0nDB0mr70wafyvNivV3Qenbt2shdCh+m9zn8/YIKUW+O9s41aD9NeUOSjA1jiQaza1TuS4mM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

> Any overlap with Dongwon Kim's "[PATCH v5 0/2] handling guest multiple
> displays"?
[Kasireddy, Vivek] Yes, there is some overlap but as I mentioned in the cov=
er letter,
this series is intended to replace Dongwon's series dealing with multiple d=
isplays.

>=20
> Message-Id: <20220718233009.18780-1-dongwon.kim@intel.com>
> https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03212.html
[Kasireddy, Vivek] We felt that using monitor numbers for display/VC assign=
ment
would be cumbersome for users. And, given that his series does not take int=
o account
monitor unplug/hotplug events, it's effectiveness would be limited compared=
 to
this one.

Thanks,
Vivek


