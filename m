Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD793BF4FD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 07:13:31 +0200 (CEST)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1MLp-0002gh-S3
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 01:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m1MKa-00020M-0E
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 01:12:12 -0400
Received: from mail-dm3nam07on2049.outbound.protection.outlook.com
 ([40.107.95.49]:38496 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m1MKX-00018X-8w
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 01:12:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d86Kfi4Plh4hXv1Mhzn9bey6FzadNo6ceBlZVHXv48VOqijbS9ejp7IX6858xKJNCAm9q4Q/N8leoE+hd+JY3N8eL4T0/cfwr9KVcHIxJAWgiBpJZJAA1MedDoQDDR3wjUaHu+7K9GW04P6CcH0sgwBZ1BDs8aJ5yfez05ToaU37+SZSu5iypL4VlM7BaGvXrc5dEGxz1vPhRF+3gkrm/eHWts/7hGpj5H9U0JDEQMOXya38f120F9SYO05VML1gPuEoOK0f91Fr8VZeVJ0emdY44qz+x0OIDzL3SqvRuQ9wZOIvYmT9VeDbrTEAR+AFmX2Y9GHxQ3tQ8zWX6kS4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJDmipCzweIivKV09bP09ASb5NfRUfMEFfIquh+lluc=;
 b=at0RBKAyZWAvTLXOBqYMtoWH1l4wkXe/3wtcYo3o3kvxmkGfx3GJROWe3+/gRqk7MQFK/eZWwjnbsLD1jO/2E+lAKycF2lO14SsWDp8d8rQ2bjlVIXqASqExEsJkTKwNajr17asNvY/oDYgLzVG3RYPvpPw9nStQD02eF+kwiJOxJ5+gVRhbGT5P0XvaAX//MzjV49VD+FDc/QCGRS98PTJww29uoRjVWYS0kqkWK4CGA03+owuKFnd2wr0BA+ofYA241rQL+jDW8UkniuIIYbu4VLEh1DgKZejpxH942MY3FSUQR7v46BX32JuZfO2lUnyAdfQqQq1+eFx/MMaKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJDmipCzweIivKV09bP09ASb5NfRUfMEFfIquh+lluc=;
 b=GZKhGuhDX7DBmwJJfRFq7nTGjaPWQV845Q42ahHN63lte/cfC+N8P3dRg58n9lrc+QGfVSutv4ywA4+4YvsIr82vIRcfzg4NVPmpcm6/ueyiLtt9pggBCSh63CuISp5tUhm1g/JzTQtQUuVCoNl06jurcTjiVIBowzFHOHzUhzA=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4970.namprd12.prod.outlook.com (2603:10b6:610:67::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 05:12:05 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%9]) with mapi id 15.20.4308.021; Thu, 8 Jul 2021
 05:12:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210702173534.qy7yd4uievvhwave@habkost.net>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm> <162508068941.526217.2563710865841096339@amd.com>
 <20210701104313.5b64a9b4@redhat.com>
 <162517174973.564224.1039189315728194554@amd.com>
 <2952f218-f391-36d5-6331-006d9312cc66@bytedance.com>
 <20210702154322.x2rwhcx7vwg226bx@amd.com>
 <20210702173534.qy7yd4uievvhwave@habkost.net>
Subject: Re: [External] Re: [PATCH] target/i386: Fix cpuid level for AMD
From: Michael Roth <michael.roth@amd.com>
Cc: like.xu@linux.intel.com, armbru@redhat.com, wei.huang2@amd.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>,
 Dr. David Alan Gilbert <dgilbert@redhat.com>, babu.moger@amd.com,
 pbonzini@redhat.com, Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com
To: Eduardo Habkost <ehabkost@redhat.com>
Date: Thu, 08 Jul 2021 00:11:56 -0500
Message-ID: <162572111635.19908.4278294895739120232@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SA0PR11CA0104.namprd11.prod.outlook.com
 (2603:10b6:806:d1::19) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (76.251.165.188) by
 SA0PR11CA0104.namprd11.prod.outlook.com (2603:10b6:806:d1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Thu, 8 Jul 2021 05:12:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28f6dc38-70f2-46f3-8223-08d941ceed44
X-MS-TrafficTypeDiagnostic: CH2PR12MB4970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB497016D5A1D6192377079B7995199@CH2PR12MB4970.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hD2Tk7Cski1psjKRWJ/Q2Lf8kB5m6xzel+P9a/pUjWm3dHPbbMcMUDEsl39vb/+A4wWUrY3mGDK1L5+Kvvx0hUQHmwDWN7onjigtpwEJFl+HNbbAwQYLsP8hkwQfntyyRtWWhCPR47LgjSdMuZ2yYldPSZghG8cL+vRrRiic3leg5bDBGUL0VISbJXCJ8ba2jhkO0eSq5SJy4ywsxSCYconm7yeOGTgesxP3kqVdg/3TV6uTVhUYWMpSTKo0OHBlGGN79YRSbXjtVTJkPeqjO1c0F5KDvbEVCedmNuDaIgr+Nxr38+vGLN24SUowqtLNqb+sbW4mG+GAvZkFWP5lcDsygalESDD2sUnB4hDEt5kol6Pa3ST1YasHqPLDuXOjXd+9U648upFjt7DKhDA9RrdZMg8x3a04bgNvLVU4GWeaUoRXCLca/GnkoACp+Gn6AabmoxCejTAi5mJ2KR6Pn4N9nZ6vXCJKWyLQiuHIQtKqCrJQdXlQtbnojrnSJAUQZgZancuUU+IzfnnRf+OV0goxxkfUrgIoVkG67rtjqwwMG3WDWU371+5SpZ2gAUjJvifmanIj91/L7ZC2Gxh9GUQ7QoiuofSWK5GzdNbGNhYYN13BGBZs2flRmtpyc1eyKNkf8tdUOTvh43+fF4LIehLhi2pp3Jl49FAK6THn5WpF5FB1nPRE4L3I6GaQIqmJhVRjb1kVCLPsY/j5dJPZwWU5VOme1LO0t40+2NJ4B53YeDEg8hlzTV27sFZMM3/AN0iVgny8mK4ANr/M9duDdXfTSvqiOdSaEpgb8uv8E9bYJsqFiHNiOtvq9aSc0UESLLpem6T+K9KWqkLRZGsXgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(53546011)(86362001)(66556008)(66946007)(66476007)(186003)(6916009)(8936002)(956004)(36756003)(83380400001)(26005)(966005)(38100700002)(6666004)(38350700002)(6486002)(54906003)(6496006)(478600001)(44832011)(2906002)(8676002)(4326008)(316002)(2616005)(52116002)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qit6QThJekk0N3EwSUJ3SW5MRm5DRDEzeHNEOGdudExkdENjZnFwQko5bFR2?=
 =?utf-8?B?MktHaGV2eE1oYnl6TUpKM1pvR1lLOTU3aGZwTGRuVVJBUEVvQ3VTalJjUk9w?=
 =?utf-8?B?OGNHVHF2TUQyN2thdWNRWm5KQUM5dEgwMHU5LzVjUEp4L2RPM0M4Y05kUC95?=
 =?utf-8?B?Z1RUWjFod2xlU0FlVGNTNWU2N042aHNtaTdET1ZSNWttekpWeEU1eElGQ3kr?=
 =?utf-8?B?VlUvMUlFTWtwMjY3K1BIWXRPZDBGbVhhTmxVZThzbmpnNnM3Vk03WUQybVo3?=
 =?utf-8?B?OE0rRmxzQkwwWnlITGVCRjA4Zll0Ym5FcWI2VkRQZmtWK1psUWovTy9hMlpy?=
 =?utf-8?B?VUZ5S1JNWmluRDVwQkxFazc1WXdxK25DeWp1VlBxY0RMODRzRGQ1V016UE11?=
 =?utf-8?B?UGJucTRRV1NzTGI5TzVFL05CYU5LTkFyNysySzh6ejVpNDdpYldQNnBHNTVi?=
 =?utf-8?B?MThTcFlnSzBSQy9vTGJYYU9WT29UK1NhRHpTbmhmMERCTkNGckZUcmJ3bVF1?=
 =?utf-8?B?RWtJTjYxU2E4dURPM1psQ2hhVHNxYksvNFZwaG4vcUszNDFhdmFhNXpMbkVj?=
 =?utf-8?B?VjN3alMycWhUUDdBaUxJTFpjbE5FRkZ5cVdhWVdMNlNnUm5rK1NCOHhQc1RM?=
 =?utf-8?B?SUJNOEhXZE95UlRhZUdOMzJpU3o0VndDL0l4c216cFBDeUM2RExkU1ExZTNK?=
 =?utf-8?B?Ni9FdzFNZEtYNklHSTY2aDRIUTNLM041UmlmcHQrSXMxZ2VSYlFWSVdZR0ky?=
 =?utf-8?B?UDZlTmFUZHZkNHhzV0pEbzdHZmgyVUVQaWZvMnltYkVDaE04cDZDNVpoTHpC?=
 =?utf-8?B?ckJ5eHVXdDM4ajMzN3MzbzhsMldad3JkcFFrR1BLeVFYb2VvUXlMZ21QVDly?=
 =?utf-8?B?bENzWjV5Uzl5R1RZL2t0L2RGdFVYUUVyQ0h4QlJ1dGxFNHoxWm1LQ1VIZWtt?=
 =?utf-8?B?OUZqc1ZWOXNFOTRDVlRqR1VaYlZqZStpcm1ROUdqNnNiTUwyREowR2N5UzNv?=
 =?utf-8?B?WmM5Q2ZpMWlpcnlkUWtnMzU0a2tTY2NrLzhGZ1hhTW1XUDhxVS9kblpXOWVj?=
 =?utf-8?B?TVNyVlVXTUp3Q2RGb1lhQTA4bkNnYmQrQ0VjeVVSalF4VkhDRSswYSt2RDh0?=
 =?utf-8?B?dW1WdzEvZmdWRFhTL2xnUzkrOWJKMW80VWhibjE2bVQyOTNIL1EyUWtLa1ph?=
 =?utf-8?B?NXUxRjJJNEZkd2hLL2RpZDNpZEU3QjhoSWlZUFppVVRLNEREVWdGMGFkOTVP?=
 =?utf-8?B?dUMyK2FnallpRkcvTWd6VkJWU3h0TGxPeTZSRVE2WVpZVmo0RTZIVjFFUDFR?=
 =?utf-8?B?a09JeVFNZFViZVUzYXlkRjMvdS9uZGZENkhvK0lwWGsxdkczWXphNnhUcTVN?=
 =?utf-8?B?bkgydXJRenE0NzNWK0l6dEJzbFRiMytlMGVYekxsZjBRUnNQaVdLdnkvZFNm?=
 =?utf-8?B?eUJ5WjBZVmFQS3ZDblhsVG1PcFgyNVQvTkNxMTNNM0podW9Sb1lxQ1RVU0NU?=
 =?utf-8?B?UnpWa3hzSXlpRTA5eklrNUR5VzJhN2FvaXNscUtVYlFBdno0Uk83ODd3WUtZ?=
 =?utf-8?B?cDlVWTVIb0dZUFg4RmovVUZkTGMrdTR2d2FQQ0thOTlONHZpc0ozZlI4ZFYz?=
 =?utf-8?B?SDhPV0U5dnY0aCtXR0JLazhvUmh0ZitWQkR4WGJQL1p5UGIxNXVDaVpKNU0v?=
 =?utf-8?B?c1YwbnM0Mzc5SmtjKyt6cTFMNXJxSmxrNm1XU3R0cEVuNWJya293UDR3d3V3?=
 =?utf-8?Q?owb4YwaXPvCnMaEXBYpxQahl6rPOf3aO0eH5oyL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f6dc38-70f2-46f3-8223-08d941ceed44
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 05:12:05.2102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mr5aztlMAmpNgEuUBWFrL13mIUFwzVnVaZQ75a/ymzylGUP9setH0li/ODAFDBCiyvGaOf46RPebs68535BcFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4970
Received-SPF: softfail client-ip=40.107.95.49;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

Quoting Eduardo Habkost (2021-07-02 12:35:34)
> On Fri, Jul 02, 2021 at 10:43:22AM -0500, Michael Roth wrote:
> > On Fri, Jul 02, 2021 at 01:14:56PM +0800, zhenwei pi wrote:
> > > On 7/2/21 4:35 AM, Michael Roth wrote:
> > > > Quoting Igor Mammedov (2021-07-01 03:43:13)
> > > > > On Wed, 30 Jun 2021 14:18:09 -0500
> > > > > Michael Roth <michael.roth@amd.com> wrote:
> > > > >=20
> > > > > > Quoting Dr. David Alan Gilbert (2021-06-29 09:06:02)
> > > > > > > * zhenwei pi (pizhenwei@bytedance.com) wrote:
> > > > > > > > A AMD server typically has cpuid level 0x10(test on Rome/Mi=
lan), it
> > > > > > > > should not be changed to 0x1f in multi-dies case.
> > > > > > > >=20
> > > > > > > > Fixes: a94e1428991 (target/i386: Add CPUID.1F generation su=
pport
> > > > > > > > for multi-dies PCMachine)
> > > > > > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > > > > >=20
> > > > > > > (Copying in Babu)
> > > > > > >=20
> > > > > > > Hmm I think you're right.  I've cc'd in Babu and Wei.
> > > > > > >=20
> > > > > > > Eduardo: What do we need to do about compatibility, do we nee=
d to wire
> > > > > > > this to machine type or CPU version?
> > > > > >=20
> > > > > > FWIW, there are some other CPUID entries like leaves 2 and 4 th=
at are
> > > > > > also Intel-specific. With SEV-SNP CPUID enforcement, advertisin=
g them to
> > > > > > guests will result in failures when host SNP firmware checks th=
e
> > > > > > hypervisor-provided CPUID values against the host-supported one=
s.
> > > > > >=20
> > > > > > To address this we've been planning to add an 'amd-cpuid-only' =
property
> > > > > > to suppress them:
> > > > > >=20
> > > > > >    https://github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e=
5e58a7da3eff03e21b
> > > > > >=20
> > > > > > My thinking is this property should be off by default, and only=
 defined
> > > > > > either via explicit command-line option, or via new CPU types. =
We're also
> > > > > > planning to add new CPU versions for EPYC* CPU types that set t=
his
> > > > > > 'amd-cpuid-only' property by default:
> > > > > >=20
> > > > > >    https://github.com/mdroth/qemu/commits/new-cpu-types-upstrea=
m
> > > > > It look like having new cpu versions is enough to change behavior=
,
> > > > > maybe keep 'amd-cpuid-only' as internal field and not expose it t=
o users
> > > > > as a property.
> > > >=20
> > > > Hmm, I defined it as a property mainly to make use of
> > > > X86CPUVersionDefinition.props to create new versions of the CPU typ=
es
> > > > with those properties set.
> > > >=20
> > > > There's a patch there that adds X86CPUVersionDefinition.cache_info =
so
> > > > that new cache definitions can be provided for new CPU versions. So
> > > > would you suggest a similar approach here, e.g. adding an
> > > > X86CPUVersionDefinition.amd_cpuid_only field that could be used dir=
ectly
> > > > rather than going through X86CPUVersionDefinition.props?
> > > >=20
> > > > There's also another new "amd-xsave" prop in that series that does =
something
> > > > similar to "amd-cpuid-only", so a little worried about tacking to m=
uch extra
> > > > into X86CPUVersionDefinition. But maybe that one could just be roll=
ed into
> > > > "amd-cpuid-only" since it is basically fixing up xsave-related cpui=
d
> > > > entries for AMD...
> > > >=20
> > > Hi, this patch wants to fix the issue:
> > > AMD CPU (Rome/Milan) should get the cpuid level 0x10, not 0x1F in the=
 guest.
> > > If QEMU reports a 0x1F to guest, guest(Linux) would use leaf 0x1F ins=
tead of
> > > leaf 0xB to get extended topology:
> > >=20
> > > https://github.com/torvalds/linux/blob/master/arch/x86/kernel/cpu/top=
ology.c#L49
> > >=20
> > > static int detect_extended_topology_leaf(struct cpuinfo_x86 *c)
> > > {
> > >     if (c->cpuid_level >=3D 0x1f) {
> > >             if (check_extended_topology_leaf(0x1f) =3D=3D 0)
> > >                     return 0x1f;
> > >     }
> > >=20
> > >     if (c->cpuid_level >=3D 0xb) {
> > >             if (check_extended_topology_leaf(0xb) =3D=3D 0)
> > >                     return 0xb;
> > >     }
> > >=20
> > >     return -1;
> > > }
> > >=20
> > > Because of the wrong cpuid level, the guest gets unexpected topology =
from
> > > leaf 0x1F.
> > >=20
> > > I tested https://github.com/mdroth/qemu/commits/new-cpu-types-upstrea=
m, and
> > > it seems that these patches could not fix this issue.
> >=20
> > Yes, I think your patch would still be needed. The question is whether =
it's
> > okay to change it for existing CPU types, e.g. EPYC-Milan, or only for =
new ones
> > when they set a certain flag/property, like the proposed "amd-cpuid-onl=
y" (which
> > the proposed EPYC-Milan-v2 would set).
>=20
> I tried to answer this in a separate reply in this thread, but
> answering here for visibility:
>=20
> You can safely do it on existing CPU types, because the new
> behavior doesn't introduce host software or hardware requirements
> when enabled.  You just need to disable the new behavior in
> MachineClass.compat_props for older machine types.

Hi Eduardo,

Thanks for the suggestions. Since the CPUID changes no longer rely on
adding new CPU models, I've broken that out as a separate patch here
based on your input:

  https://lists.nongnu.org/archive/html/qemu-devel/2021-07/msg01679.html

Zhenwei, with the above patch I think you can change your patch to use:

  if (!cpu->vendor_cpuid_only || IS_INTEL_CPU(env))
    //add intel-specific range

Let me know if you want me to update and add to my series.

>=20
> --=20
> Eduardo
>=20
>

