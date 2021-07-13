Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5107A3C769E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 20:41:59 +0200 (CEST)
Received: from localhost ([::1]:46498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3NLy-0003Sd-Dq
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 14:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m3NKg-0001ry-8x
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:40:38 -0400
Received: from mail-dm6nam10on2075.outbound.protection.outlook.com
 ([40.107.93.75]:16385 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m3NKd-00062k-Kk
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:40:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMiOSAV4bO54IEcHmOh9+KayMm6ACE4/6XbN1irovNBAk8Njr4Y0N1bNvaJ205bOx1X++RryvXCLjYCR2DtR2VRBGtQTxUEukeWUs3OtmQF1dLcAmIWNAx9AuCmVZ/qmlW/Z3L8cIw29GHLsbJg33yQZ4jfKRd0u7OnNxeq9vWWzlccCUX2BK2CwYBowPS0d1xSfjdp4zQf6uHBqoRroFKusG3c90HJDvXyV8j+hC1dqxK6d9eIcH+/DrkPzuKNu8jc6oFqenK78l1X1MEs4wNhn77+S4XgtUKdpT5WrtCt3ZCNg7hq6LOrJji1eI9Tcd3k/vm34QYc2eRy29d6sRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asN7n5fQoAMQqA5RhSWYOxlHzp13aahzsmdHVuh9tv4=;
 b=VMuyV6E520AFbgEZQ0Nmo64GVXu1g6J2UwaDm92I6xrrKeUtDYIPSYbxVIHzJy/lvcKrkpMUdvVayJkJ/c0XlK/wYxqzZlFLPTgiYj5fSRJHpRuYP8+iEr1rU0dPyoA4J8p3S16CK7MXIRA9q6On+jrEtE57wyNR37FEQ0HTzdbZFHQ2r9ts74X7+zeDkOVn17afx+FphbEqn7HPpDtXinpXOr2Mr8p5HGV6fCS+sfL9TbezeJ3iM9OtLgWc4jYa5qJyMUisDdsXPCLNCQRc28K3RTh5xysgHz1xSpIJE+nEaJxEyR0oR3yBwWPkzgrd7MIKyQX0RjNgWEHpbdo4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asN7n5fQoAMQqA5RhSWYOxlHzp13aahzsmdHVuh9tv4=;
 b=fzD1ABm21cOIH2tNrpg/AdM43J8rXXDNDdtBrRFARWyOxZhD5/aIWlKMQHyQ+Lcc2QiD3ThF3xW3Mc9/jYd0vfqbjSpZP1LfU1B9zMXzZ9bomtAdS6tKemyLSKbMduFZNObWLUL0UL3PKfywMwBZq092cilKsKFJt3A2teYVRXs=
Authentication-Results: daynix.com; dkim=none (message not signed)
 header.d=none;daynix.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3831.namprd12.prod.outlook.com (2603:10b6:610:29::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 18:40:31 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%9]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 18:40:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJ28CFRCW+Z+j2MunL_+PpNc0a1UUPvZ+baW=eopVJ6Odj3zTA@mail.gmail.com>
References: <20210405131420.598273-1-basil@daynix.com>
 <CAJ28CFRCW+Z+j2MunL_+PpNc0a1UUPvZ+baW=eopVJ6Odj3zTA@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga-win: Increase VSS freeze timeout to 60 secs
 instead of 10
From: Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
To: Developers <qemu-devel@nongnu.org>,
 Konstantin Kostiuk <konstantin@daynix.com>
Date: Tue, 13 Jul 2021 13:40:22 -0500
Message-ID: <162620162248.49683.11801775260591979390@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SA9P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::15) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.1) by
 SA9P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 18:40:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e3538d7-237d-45bc-a245-08d9462db102
X-MS-TrafficTypeDiagnostic: CH2PR12MB3831:
X-Microsoft-Antispam-PRVS: <CH2PR12MB383184860A8497AB2EA5FCD895149@CH2PR12MB3831.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o+zKCjtIDHmq8FMK++TJ1laJqsrqGl7Sl7TBr7DyLIzJ0EO2eyPGC/dJqGym38G8RDaZLaR6IMnZIaNJe8mg3zPvb9tU4GysK9Xg1UJIQkecIvSphZEcURRp76r9UO6QUdtMh0ildAnktmFcwuHN0QyS3P+0E7MQQx77EdXO+wqmiYWvQo+OMl7JEMozHauAnw9Tnbwsh+j/NSWoOHxxnCh44KNqSPwN7N8U7OHY00ahALJg5LcG8X0wYlnDp2c9dgl/CHoaDN40IoV5UHr7qgjbqUzChj3NyshSkbgMHVGqf6MKH4WmgNbHzwNodkJxU/MA8pgH4VeV7W83/h0TrMRd+pZHHgrdwfWbyQ7GMtFiennUUTnXzy+Eia7yoxGAGBZcwVardHaZwaBfNxWr+1As71GWB2bpPtzVP/A1bEkZcFIGEYL1OpPJgOBgZ4/ImtSyUraiUd/yJbjKF3qeeiVSFMHWMt2WpJV+5052G+vdoEJmhKllR1Z6DWIBWiu2FmQPD4GlIrlXsjqX3GeEi38BeOyPACwViFlIkS8UK717oMucGie9IB17H7SRFLKJudBQquMLzsrQrdZwT34LDqcs5F3Bf6j8l84z5p13HLaPpu0dGVUM55JggXQsJwYxmVpE2QImPqAMD5kT6V8a82pYvnsr5nYy6wbrX7mX/9Xak9U3FkMsyT/92erv131i+cQ0KmRB9tLfCz35M9lqOzOExktOQa5PMO1BFOOAS8gIgQZx7ht+P6HAURB+NB0IBr23RGU/vo4joODOEHpTjvnw8ImsQkH+wGzcDoIMR00ags/tIKf8kD/EXHe50H52GtaEsoLdJBxT3+fd7xZOiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(38350700002)(966005)(53546011)(956004)(186003)(26005)(8676002)(5660300002)(52116002)(6486002)(66556008)(66946007)(66476007)(8936002)(316002)(38100700002)(86362001)(4326008)(2906002)(6496006)(110136005)(83380400001)(36756003)(478600001)(6666004)(2616005)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck8rVjZNZ0tCVS9GZTZUMjBrNnpaeDA0RXN2T0NCV3M3VHlxRE9GQkRBR3c0?=
 =?utf-8?B?RjZ5K2liZFgrT0FPWWRyMUYvUks5MWhKNDBXUExyK0UvTVI5UUVUMXI4MjA2?=
 =?utf-8?B?cmIyd3RBY2dNd3hVWmkyZy9abEVjbENYSEFOY21kYVdFbmpmM1IzWmhDVUxh?=
 =?utf-8?B?TGFHZ3l2SGZyQWRHTlJWL21adXZ3bHI4dnJ1RWJ3OCtybVo4R3RPMW0vdTNR?=
 =?utf-8?B?MDNQdUcrZlN0YWgreXkranNpSDlpckt3UHpZaHpTSE00L2lwbnVTTFdWYUgy?=
 =?utf-8?B?Z1pFcFdmeUZ5Nms1cjBwWVJueklMbk9pcVE2anIrcnpJcytVYzRRSW00L1Q0?=
 =?utf-8?B?SmxGaE1kYXJZR3kvNHlyNkE0aVRBb0RtczVTRk1Xa3Q2MFUzQm1mNFNWL2Ja?=
 =?utf-8?B?cnZZRmRTZWZ5RDRkZFJCWklNUldEUUl1Y3RPbHhMdVd0NjFHalpkSmRGR3Fz?=
 =?utf-8?B?clh1UnduKzVPTDBBTUFuNDVwdVh4Y2s2WDBYWWpKZm96dUFpRmdHZExzWWNX?=
 =?utf-8?B?OGkrQ2hJNHM0SmpMTXNTQmhhVEVQakpDR2ZaVXhoaTRXZTNhalBoY0RqcHVj?=
 =?utf-8?B?VUpRaVNlTUNtRyszMDJubm1qcUpqNVNFa2VLdkN0QTJRN3IyRXJhZDYrZnNL?=
 =?utf-8?B?RlVHWE1pQVhTTUhxTzZVMkc2RExWMUhTaXV0bG1aZEtJcUxPVi9ESjZMci9R?=
 =?utf-8?B?bHF5Q1I0clRTYTkyT3lZd3NZai8waklVSDFjSDcrU01ocVMxVExVYlNxZlpU?=
 =?utf-8?B?cHNuYkJGVDNGbXI0dE9GNmRuK3R3S0pFOGlUOXFxOXFhRXA5WU52VExGVStK?=
 =?utf-8?B?b2JtRG8rSUV0RTl6QW1zS05jMFE3Nm9wNmo1N0xHcnhFa0o2SDF0anZkcTJO?=
 =?utf-8?B?ejYvUXA5c2NWNklyMmJYS2EwWFpsWXdaQ1N1eXpVdTVtNjNBRlpFVjM1bzFq?=
 =?utf-8?B?UXI2cDlWSXB3dVVmZEg1aG13eVZPMVcwaUJVenZ3Vm1sMGZmenhhODRtblRU?=
 =?utf-8?B?TGRuU1R2Y1Fud25Ba21WVVd1M3lVZTh0VlN0bWdXSHlZMmM2TFRFU3B6M1Rm?=
 =?utf-8?B?NVpYWWtqWDRadkQ2RXRHYlQyaGxzS0dtbU5FcnZJVm5TbjVubDFaT2gzcExQ?=
 =?utf-8?B?NytFRWFScy9YQXFHUjB5TC83eE5UaFZYazRsbnpIOURZbysrdjdDUlAxMXQw?=
 =?utf-8?B?TjRpcEc3UTFnUTNHQ2J5OXhNZGs5M0JSUkd0OTBIVlNCY0ZCWFVCZ1lGM2Vh?=
 =?utf-8?B?ajNtQTRWWDEvdUtlcU5QUExCMTZ0YVpOVkdEditNVTNnZ2FROXRLRkQ4aGVD?=
 =?utf-8?B?QnBNMSs1N0FSK0hsbCtvNkhrZzJoVFYxOU5SdkRCcGdWbjQ4TnZkNXU3c3gw?=
 =?utf-8?B?YnN1anJNL3lkbW92c3JwVFlpSVNYR1llS1dQRmMrY0Z0OXUxeXRDV1hGOWw0?=
 =?utf-8?B?UUh6dTcrMkIveDFwUEVOWXNYM09udEFhT0ltRkpHM2VnM0NSOUVGMFVDM2dI?=
 =?utf-8?B?YXVYYUYzMEpHOWxuR1A4T0hEOE9JdzRFM3VaRG53dmJBMWpzQ0lhcjRyd3NB?=
 =?utf-8?B?SUZmbC9UNGtFaE1wMFl4V3NJd1lkVHQzRThVWlJ4NEN5TVVUVmhUcmhYeFJn?=
 =?utf-8?B?a0lweGMxb0NnUUZsZmVxQWtOSTdkS2JjQ3lmWEZGbWR4cTh2bHBYTHBrYTVp?=
 =?utf-8?B?d3hIWTFqRk9ja0V2NTNOdFBSbHEwc2t1TXdmbEZHbnFjZTYrM0pxNDEzY1dj?=
 =?utf-8?Q?6hXu3iPw9pKIDZNvSJs+/rhtahNxozl9I3nPEZ8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3538d7-237d-45bc-a245-08d9462db102
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 18:40:30.9407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQR8+sQJPfDra5WjxjJTTOdg0DVwRhRvxSWveN0L84NDZXcsqpSNw9eFCS3zPRqQo3F9iPJJLcYnW4PJoE8B9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3831
Received-SPF: softfail client-ip=40.107.93.75;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

Quoting Konstantin Kostiuk (2021-04-22 02:43:25)
> ping

I've been trying to get these queued but I'm hitting an issue where qga
reports:

  failed to load qga-vss.dll: The specified module could not be found.

via LoadLibraryA(QGA_VSS_DLL) returning error code 126. What's weird is
it seems to find qga-vss.dll in the install directory, and you can see it
access it in WinDBG and various trace tools, but somehow it reports not
found. Are you seeing this issue?

I'll debug more this week and try to get these in for rc1, but if you happe=
n
to have more of a clue than me then any insights would be much appreciated.

>=20
> On Mon, Apr 5, 2021 at 4:14 PM Basil Salman <basil@daynix.com> wrote:
>=20
>     Currently Requester freeze times out after 10 seconds, while
>     the default timeout for Writer Freeze is 60 seconds. according to
>     VSS Documentation [1].
>     [1]: https://docs.microsoft.com/en-us/windows/win32/vss/
>     overview-of-processing-a-backup-under-vss
>=20
>     Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1909073
>=20
>     Signed-off-by: Basil Salman <bsalman@daynix.com>
>     Signed-off-by: Basil Salman <basil@daynix.com>
>     ---
>     =C2=A0qga/vss-win32/requester.cpp | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>     diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cp=
p
>     index 5378c55d23..940a2c8f55 100644
>     --- a/qga/vss-win32/requester.cpp
>     +++ b/qga/vss-win32/requester.cpp
>     @@ -18,7 +18,7 @@
>     =C2=A0#include <inc/win2003/vsbackup.h>
>=20
>     =C2=A0/* Max wait time for frozen event (VSS can only hold writes for=
 10
>     seconds) */
>     -#define VSS_TIMEOUT_FREEZE_MSEC 10000
>     +#define VSS_TIMEOUT_FREEZE_MSEC 60000
>=20
>     =C2=A0/* Call QueryStatus every 10 ms while waiting for frozen event =
*/
>     =C2=A0#define VSS_TIMEOUT_EVENT_MSEC 10
>     --
>     2.17.2
>=20
>

