Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356BD3DF05D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:33:31 +0200 (CEST)
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvU2-0002lB-9i
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAvSc-0001UW-QY; Tue, 03 Aug 2021 10:32:02 -0400
Received: from mail-mw2nam10on2066.outbound.protection.outlook.com
 ([40.107.94.66]:48352 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAvSZ-0006BQ-SG; Tue, 03 Aug 2021 10:32:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4xHJevf4ffCoj7gwXtrXI4liTwhpA/woEw/HX9/SLH0fs69jXbzb2QpeXIuulLinO1S2h3AZFpccYxqkOD7D89gHkP/xwLRDUQzqdut7U+xtt/ar/JDPwZ8JS1ChWfpJzHXmodfofqr6iZIvKWkLJ9UoeD7Kat2doZqQyK3ZG7dGKMDC5u8gDen6gQGI5ohNwyxuJpNzdVeL8d2NBJfV8sQmN9sU4wgWHdA7ZG3TmKLjfZVX8aXgTQYXdRzv8E1BR/dqkDHTLt+tbklgvXH7WUAcKFz2m4z+vPisKsoqfOZVGP2GYnKfJj+IznV1NUColYRd4JJQPiw87h2Sa+zaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQpCl61VGtuSc0G5j5Lm6niRdkwg2E8liy2MG8EX9DU=;
 b=LoN2DEceuNvk9PWMPNpk6s+DY0S3ELAC+7ezuk41vVXjPiESkEWI4208Z3CD5HIIaPgIeOxor8fGfzyx/mFqhfQlcMuTZlmHYRdAq2xuarI2SiBH7DXPQ5t0GdXjFVJJGZNRlrTVlaD/3uNM19cHQ2PZAPa78fnX1XLq4IdN4Se+Flao22ktvb66LwTgIKfzIvxX0Q0Y6k3082U4a9kTyIkSWETldV82nqUVZM0uP9n4tTSCYCJyWCYC8Mn56ttgQREJTKR+i8m9oK2BNP1RROKhPKufdWnLKPqDqXrGB02x0SniU1P80HSLV1oY1AclZ81NNlNRQ65q5eWkRnXFjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQpCl61VGtuSc0G5j5Lm6niRdkwg2E8liy2MG8EX9DU=;
 b=FjaZ01Z7xmZJQSPz3PzoQcG6HTg69R8NTn+XREArGG3UN3eJBfxLHSg/IozVmiJwi25Xy9O2HXDj1PGRltM38LwZb/FD9wLO2krSTYNQnJoltVr3FK/Xxx0qIsKCCKZEMQvHAPRcJ0Cm+y+J1fJGX1p/PWHNkrsQrfN/e68IYSs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3959.namprd12.prod.outlook.com (2603:10b6:610:28::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 3 Aug
 2021 14:31:55 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 14:31:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YP6K1a/ay16KeiAT@redhat.com>
References: <YP6K1a/ay16KeiAT@redhat.com>
Subject: Re: Status of stable release effort ?
From: Michael Roth <michael.roth@amd.com>
Cc: qemu-stable@nongnu.org
To: Daniel P. Berrangé <berrange@redhat.com>, qemu-devel@nongnu.org
Date: Tue, 03 Aug 2021 09:31:44 -0500
Message-ID: <162800110465.1099206.10488782955990913660@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SA0PR11CA0133.namprd11.prod.outlook.com
 (2603:10b6:806:131::18) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SA0PR11CA0133.namprd11.prod.outlook.com (2603:10b6:806:131::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21 via Frontend
 Transport; Tue, 3 Aug 2021 14:31:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd18f67c-ff9b-4a00-0209-08d9568b713a
X-MS-TrafficTypeDiagnostic: CH2PR12MB3959:
X-Microsoft-Antispam-PRVS: <CH2PR12MB395986577D6FAE1E62B0CB6595F09@CH2PR12MB3959.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A7UcISGdIFjp36YjxY5SKZbjiExnAmfXZ7sA4g8jRyBiTixuRYO3mPRwbxy79QPXZraVch6FesQqO3/jrfXneNfsMV83uQ1Z/5xr/jm/S4krZ/J8WLAx+ZRA9ytfSXkocors7axVzPbil9UZLyntdDKyqKfahh0fV+LRTGb3WqdRN17Dyx9hxVYLFc3lKZ+H3OKOAYSGJZMCVFufzWnkQ4O5an5+BJUchA0otYSK80/394ekKErAx4ezxZKEF/zowX+YhVCkJoryhiOp/4r+51hVxV991YJ6+FZZ8X2Yr1jr4lCi655gru+FvJdOXYmTYlmwTCdYHjVJIU0gTtr6uZemBHwfBTN2B+44WfABQCbuuHZzbTtOYq5H8mYzOBSK0i3Qi/uFXb8KSLY+QDdkzWk2qQZK3A5WUIhOmee3HH+RTh+uKQ4I7IY1/BJOOELDH5aFVfucvpUIy7Dpet+32pQiJhvXPf+5pahIchq3NBbSPGV02JKx8sN307QoxZ9wfmskPsGTgkECURbc8DAbuu7OEUSXn82UidElldaIehMseFnfNZKwVTNpb3oxOnz3L4dWGxKPHeI+v5irv+mQ8YwFM6PPiBdBjTZlrqZkfuOobgHYf2mW3yZpLGov3B1iIAeCQMHIKHhOyUQflCHiQDwEwpqpqiAQvCpi1lKyJ22iQL1D7srPmvu/ek6jLpLDRMxFkSVMuBzZrJoLervkaa+/uu+j88RAiqPbzz4fHh0sSX2Nnfi3rEaONB6NXM32XjeYmlN/FQtj6TEf5yCQv1CC/FFhkrmfOeMfwyD9Eq/F5U6Pwv+lSFQa2mVcPsSpYWCZiVZSEbeuIq3+sWPRUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(4326008)(6486002)(86362001)(26005)(52116002)(478600001)(8676002)(8936002)(5660300002)(36756003)(38100700002)(38350700002)(966005)(6496006)(6666004)(44832011)(316002)(66946007)(66556008)(66476007)(2906002)(186003)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFZ3bEFJeXR0SjhseXhDcWhRaVFBbS9MM2pRQzNnQWE4WjNIT2xUcFRJdEt2?=
 =?utf-8?B?NWRqczYzNUoxRWlIdG96bnFzKy9DSXJTS1IrZUlnSlV2dWpzVlAwaUNNNi9K?=
 =?utf-8?B?clhoUTFhRjFKVXY1cHNCMUFTWEQzQ3o2UFhjcUQ4WmNPWmtVTTlmNUxXMDdl?=
 =?utf-8?B?L0lDc0VrZFhya0pGU1VLWGdiSm8rSks5Q0ZBQ1ZWRHBabHMxVUNmQkJVZ0Rt?=
 =?utf-8?B?Vlh3UE0xa01FY0I3eldHSXN0cUJxdEcwTWV3elJnNWM0Vkt3akVXODRtRUpt?=
 =?utf-8?B?a0MwYjlQMW95N0ZRN1psVTZqYmxPNlBid0t2S1NnRjRiR1RRL2tmaXd2ejBv?=
 =?utf-8?B?K0lxRTl2cmVMaWNIOWlvbHM2d28wK2h6Y3hwdElIcStaL0JRMkF4bk03VWRW?=
 =?utf-8?B?em5VbzkvQ05zVVVVTE9hWE5jWUJybW82YUZuemJaMlNpSmNlRHZDbU12d21G?=
 =?utf-8?B?ek5oNGRmYUVPOWp5bzZydlJMM3ZFVnVjWjA4OEtOazl3SG1nSVEwb0ZoeitO?=
 =?utf-8?B?Vm45VUx6RGhlWm1GclhKb2JKUWgyRjV6M1gxYThlMGpOam5hdUZqMGVXdDAz?=
 =?utf-8?B?ZnlGcjlGWjlsalpZWlEyWjZCT1gydkwyM0VUbWExSkNvTytzRXFONUVyTDg4?=
 =?utf-8?B?bkxoMjJZbHdrTGJ3SkZxZUd2TXBMYXBiWGk5MmNhUE4veXcwK2o3elJ4ZDk3?=
 =?utf-8?B?cEZZQWlTQ3dwWHZka0tqVmNGZ0g1MWE4SVBtYkZpemtURVVDMEtPOWN2ZVpp?=
 =?utf-8?B?bnk1MllzeUdJZ1IzR3lobW1xdFVNRDVWd2oydTgyalBLMnJETCtOV0JocHY1?=
 =?utf-8?B?RnluODBPWkxtNkovQnQ2UzNLL013Wm9SZGJ0U2hYRGQzQkY1aUtyeHFkdlg0?=
 =?utf-8?B?NzJMMnlzQW12UDVqM05ldURwK0J4VWs5dmtQVWhvM21qK0xNWXVMUUEyYkVl?=
 =?utf-8?B?V3g2TnpTSWVUSmhVVkY5VUVnTlR2Mk9SU1NHTHl3anlrb3hlaWdFU21RRVE3?=
 =?utf-8?B?Rk92YnlNTzFEZ2cvM0pHbFZLWVJ3RnAwT09yVjY5dkFFWkRRM1ZCb0JFUEUx?=
 =?utf-8?B?ek01RUg1anBHbkZoV0hFd3NrKzhZSmo2QituVndSWDZzMUFUcEFXMHlBMDZm?=
 =?utf-8?B?VnZMWTNmMXYyMGEwdE9NQy9hUDlnQVJvam90UHdLYmMzRVVTTVRUV0c2eFp3?=
 =?utf-8?B?L3ZKQmtpYkI2eDJCKzkxYnRWbGdNbUxQMG5nZmQ0bGZmN3B0c2Z4ZXR5Qlgy?=
 =?utf-8?B?WldJU0RveTNRUlRjVWZEd3ZXRGNHZmFCRWw4OSs4Zitqa3lYdUNPcWo0NkQ1?=
 =?utf-8?B?azN1MTBPTC9jYXNCanFhZjVRY3F3WEtnYkdTcmhLTUJOQi9jaUxwWVVjTzhy?=
 =?utf-8?B?K2dELzlRVkEwWnRsbTBEcHgwYk1BaVNLOUpRY0N0bE5lV3pmY0VWQmFOaUZR?=
 =?utf-8?B?T3NTQ1FzYlZvTVowWmhoRm5CSlJsQ0x6aVpQTTBsVk5ET3NhT1orOS9JcElq?=
 =?utf-8?B?VUZpakx3WUZyNWczRmp0TEtZbEt5eml6eGd5d3JrODd5djMxNnF1MGNJRHpo?=
 =?utf-8?B?OFdZVEpidmE0RCt2djYxMjRsT1VCVXh0eHFJdXc5TUxsSHFPRGdiTnYxcjBR?=
 =?utf-8?B?clhINTEvbm5KNENRY1hRZVBFV1JjVFNtTVJmUXhobVgyZ0VjVWZQSFRValR5?=
 =?utf-8?B?UTY2ZVNtbnR5ekVsaXJOLzNNK0hqUndMdHZYOFFJbll1L045WGZzYTlPZ0ts?=
 =?utf-8?Q?9LAuF59q0TQXcvMvm04GmXilqHxdmO5qhZyVL04?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd18f67c-ff9b-4a00-0209-08d9568b713a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 14:31:55.2483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pYjpaJwKxJRIirUW8l3ttcZnmgAjp5FlhgNVwx3WxjmmeDpFwIJOjZqAJPHGjhLOg+fviNE5iNghjfYmadF6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3959
Received-SPF: softfail client-ip=40.107.94.66;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Quoting Daniel P. Berrang=C3=A9 (2021-07-26 05:13:41)
> We are currently in the final lead up to shipping the 6.1.0 release
>=20
> AFAICT from git tags, the latest stable release was 5.0.1 in Sep 2020
>=20
>    https://gitlab.com/qemu-project/qemu/-/tags
>=20
> There have been many patches sent to qemu-stable each month e.g.
>=20
>   https://lists.nongnu.org/archive/html/qemu-stable/2021-06/threads.html
>=20
> but no 5.1.1, 5.2.1 or 6.0.1 releases IIUC
>=20
> Is QEMU stable still an active effort that we need to CC patches to ?

Hi Daniel,

Long story short: I tossed away my test setup when I switched employers
last year with plans to make better use of the new gitlab infrastructure
and make it easier to swap in different maintainers as-needed, sort of
like what Peter has been working on for qemu mainline. Things ramped up
a bit faster than expected here however and it's been on my queue ever
since.

My plan has been to resume regular stable releases starting with 6.0.1
within the next few weeks, but still need to take a good hard look at the
testing situation and how we can make the process more resilient. I'd
hoped to find time to dig into laying out an overall test plan a bit more
before responding but will find some cycles to do so as I work on getting
the 6.0.1 release together.

I apologize to anyone who spent time curating patches for
qemu-stable@nongu.org, the ones targetted for anything prior to 6.0.1 likel=
y
won't make a stable release, but if there's something I should reconsider
please let me know. And please don't let my poor handling of things affect
the overall process, there have been others in the community that have show=
n
interest helping with stable in the past, but the testing situation has alw=
ays
made it difficult move forward with things, so if that can be improved in t=
hat
regard then I think we could expect the process improve.

Thanks,

Mike

>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>=20
>

