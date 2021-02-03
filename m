Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C730DF0F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:04:34 +0100 (CET)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Kdt-0002wZ-FX
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1l7KcI-0001qW-Qt; Wed, 03 Feb 2021 11:02:54 -0500
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40]:6144 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1l7KcG-0004QS-G6; Wed, 03 Feb 2021 11:02:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maGJIw2yovLLhdDA1qGZLs6+zHhnM9MeMPqycpYLrm5K5ShxOSwkH79eTUnzLiU49c3BsAsbVJaRYURK6vQzQ6wmuz+wYo6cmq45gnXLAY728X34j8lBWZnOlmsCHfDX6+RZHHlIGfm5/vgppyyJdtwSiLTjbGIOIU6Hj/oEjAuwcC1IFDLSHubfp8N5TpfArERzwP4PvozNFBirDH1WCRzNhFG/2bdctbf0raeYuiKdx/qIOPh7faZykgldC81YIuxkdGIj+YLsXoLlr0VcyLvqI6lCGBA2PwB7GSZTl04J0cVJdhIcIUhNJiB3a8KIzJPuS8L+xUVzKB/M/AQbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bI4KWqKEVkG6kP7lAKjGwr5ISkACOXZjkUnL5tGmEZc=;
 b=g3ox9qH/kBAGVWo8i59zbOMZRzkFxpKz+r3lbRg6ncRGUufk87IPJkZrA7/PES+j5+PZsSoYK48mjPqRB4JvrvGuFFwBNhmsMPeV0LAkh97ss3lMAjF/0D734OXfAvcFvcnPAZDjs6fQDg2odjlFUXbiSU/3BAKUQvGA8357z6zfd1/q6oMaOwmDnnPXWoQ3rOpaBIV+lcXrbqR5tX0U+8o5Evx8MUBshKBwahk/ufbBl5YtrLShGiLgmNnsKquLZT51uePZVioh/IKD7MVW2xKt8OOqDT4bP+zSe1XraxQjSYlHrt0qZejjiVZq1aSu6zhVE2UYTAJ8bnhWbuDJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bI4KWqKEVkG6kP7lAKjGwr5ISkACOXZjkUnL5tGmEZc=;
 b=fOd6bUzdQ+sRqYafIGbDOrnDG4m7Hc2qJ3u2OBF6oE1KXrdgNl2gJdP6HeJUpu4Gz+FrTs8SuV69+K1EIf6Giq/OXx501XYK8HYm8hPdWVlWNxLxosahHrN/oZEJwbArCZDFsFbG716O9xpltJk2TCg4tx2gJ3Q/zHUtwbqfZyE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4858.namprd12.prod.outlook.com (2603:10b6:610:67::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Wed, 3 Feb
 2021 16:02:48 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f%3]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 16:02:47 +0000
Date: Wed, 3 Feb 2021 10:02:31 -0600
From: Michael Roth <michael.roth@amd.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 03/12] qga: Replace '--blacklist' command line option by
 '--denylist'
Message-ID: <20210203160231.3rjn5rxjjzcnk7jb@amd.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-4-philmd@redhat.com>
 <20210203100952.GD300990@redhat.com>
 <50e2133b-a6a2-a878-366f-eadcfd453aa@eik.bme.hu>
 <20210203154708.GE5507@merkur.fritz.box>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210203154708.GE5507@merkur.fritz.box>
X-Originating-IP: [165.204.78.25]
X-ClientProxiedBy: SA9PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:806:25::11) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.78.25) by
 SA9PR13CA0216.namprd13.prod.outlook.com (2603:10b6:806:25::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Wed, 3 Feb 2021 16:02:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a5361608-f2a6-4bde-3333-08d8c85d2660
X-MS-TrafficTypeDiagnostic: CH2PR12MB4858:
X-Microsoft-Antispam-PRVS: <CH2PR12MB48581EEAB78E1AFFB10A62D795B49@CH2PR12MB4858.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YmIeaAMn9tWxpxC1g9UuYR1v0sQT1611xbw5YL3tBs/IjCWwpHWWc2zRrF36jz6LHiWrOciiOE7+3Z49ssLWKWUJOw67V8Eqs63zHD943NGzZR31ytNZlKWDWgL8+b6x8YGBNlALQbG1WdlVKFsNiLX/jjNOaNoxneUdICxz68YwAdqOYm4US+1CKyJmpxxZ35YZ7VZirwdzCDxg2tmD4sZE4IRwvxVv6VxBiZYhqTaOmSF6WeynKVRhXMHRKeBXoA/orfeVoR6k5l1witPAVNZZ3AH5+wlcYEUu8Bkvh62IICZXOLe/RaLJhbIgQsVGB3Q9nG1cDL9tFcfknJK5iE0Owlu1Zp1uBS00IvP4eF2UKC8JHYpzZMMkMhUiAmqLqoGkIitleHrNhphb97vLqYF+Rx0uOFv9sRp1hIYYtFgC8hY9ZqfLVpprFpV/DXydEoXWumXnmh8+5Lm0j0Tno9iD0WKZJ0Xv1d/7QaRPFuevNFVEKaiYjUMFel0bb9vRvmMXl/zb6ks1i4K1ZanrZNu/XqvvlfuicEeZOLPK6OteOquTcur/fpH0F6wNYrWaq7pbv1XaAZOLazz3LYvi07yVmVzXkkH7KBw7/vlkl94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(45080400002)(44832011)(16526019)(8676002)(2906002)(7416002)(966005)(6486002)(54906003)(52116002)(478600001)(6496006)(36756003)(1076003)(5660300002)(26005)(2616005)(316002)(186003)(956004)(6666004)(8936002)(4326008)(83380400001)(66556008)(66946007)(6916009)(66476007)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?MnFQe9+nbIjjqq/Tc//uZOwOMCbi9Jp3qpouB6voU8bcJOmCjXGmz5z89d?=
 =?iso-8859-1?Q?N1fA09i0FVrir6p7+SF5Xc1Z7cb770T+dKMWkQgzsKnytCFBTxZJBUS+M2?=
 =?iso-8859-1?Q?Ka7ErDe4gew/MIE/FxBweLbMRb6fhBmivK9uezZnMvTZ8Yct6tz0NJv++Y?=
 =?iso-8859-1?Q?natMxrTCJyK3+G2p2Vvkis92PWY0OJ3FgKvDguDW/2asblBCmw9CJDqnKV?=
 =?iso-8859-1?Q?iZgfCde+mgtz1YaN6wenMQDwx1z0naUAhxkugb29Sr12pTsB46uKY+ziXO?=
 =?iso-8859-1?Q?jZ4zGfZEkm040yJI+JP1X+GasWpjTHqvoCOOFrnFzr6NpmvQxLWMNhsdf2?=
 =?iso-8859-1?Q?iXWXhaaGQa2aDUJGsm6har6Si/4NhK0I1MvF4gfKPulHS4DQMt6pSP5kzZ?=
 =?iso-8859-1?Q?DW6NwuS5iyU0shD/MvddQJwxO+TDNmSLTw4YIDM3pkC0ytjYy4w+Vwz84K?=
 =?iso-8859-1?Q?ss0iYnmI5Vs0fwGzzP1QGLb9jeYyuJx749mQ7cFqNPGboDcu1xjGWv87rG?=
 =?iso-8859-1?Q?DAKqbKMg3qDuP7ZpRdeUii9GqMDLBmJK1ss8O35nV2VFIfdhfEnUoBAXlz?=
 =?iso-8859-1?Q?ldigzWlrufBoINNs3RQ/CM4T3j3/LZmKtDCCtSgKusxyp/gIKz0acGIgCt?=
 =?iso-8859-1?Q?HSLbTmTln0NxCOpuSc5A0yeBX9xUxHOSotHdGhFNwVGZbgNBT/5EkIdX8w?=
 =?iso-8859-1?Q?A4PigFgSh3I4+zJzmLTyxjeZL4cPyMctVISPZErdqM4Dx2cWCWSbMECHyb?=
 =?iso-8859-1?Q?BoG/hWwXrYPkqzJnHd2ql5fZUroqjE9ow4uX9S/Pt8uy5zlulcpJchCtk9?=
 =?iso-8859-1?Q?o+CIcptgZ6pJruiYvCU4BLaaMpJz6hRCCy4yp6+FhuTl1966MZz61bmMf8?=
 =?iso-8859-1?Q?tiVQk7rZfyn2X/NGXfn8FyCtX5pFmJxVXpJva3AQVrnqMC39VJxQueqIdw?=
 =?iso-8859-1?Q?KULiVyjLDgii9PeObgHVuT3hG/7XFN6ociZhNQajUfFdhYyVAUfGNC/ieo?=
 =?iso-8859-1?Q?BRMpSLZtzl3KKMpeuyP7fXyiHYHfHtq0iIwRgVLPlxI/eyg7TiGzIR0Wbd?=
 =?iso-8859-1?Q?s3yMimrfb3ZrxVQV0FhKQ78ej429SmkmdpXOzgOzMRSpMVDzVVBx7PyrV6?=
 =?iso-8859-1?Q?DXQIrcAdMKvBQcxptO9VzZg4YUQUvLomwEiQsiYT0wnzMpZeUnF5t2rId5?=
 =?iso-8859-1?Q?ggD4r0UAqEWJIu6dFRHFohLCzkfKd5OM9pBPM2SraJo4F3lB8bfFztP0nZ?=
 =?iso-8859-1?Q?a1UxhGBdb9RLMlDtW8TaqZAaFZJoft9ze+SPqDuqc7058SKiQ5VPDFfn8f?=
 =?iso-8859-1?Q?Oj4Paop0QwOP5ayPZoFKmnActhmDkw/jzv00umVVY2lpT5TJnFOzPUtSDj?=
 =?iso-8859-1?Q?WfKae0Ej6K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5361608-f2a6-4bde-3333-08d8c85d2660
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 16:02:47.6736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: choURIgX52zzDYe5rHZydt7PuLLkXdzPo/V86EI71ruvxf6UUmnG+xfw2Pk03t19WbfTCATxEo2I38CUze8GNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4858
Received-SPF: softfail client-ip=40.107.236.40;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 04:47:08PM +0100, Kevin Wolf wrote:
> Am 03.02.2021 um 13:45 hat BALATON Zoltan geschrieben:
> > On Wed, 3 Feb 2021, Daniel P. Berrangé wrote:
> > > On Tue, Feb 02, 2021 at 09:58:15PM +0100, Philippe Mathieu-Daudé wrote:
> > > > Follow the inclusive terminology from the "Conscious Language in your
> > > > Open Source Projects" guidelines [*] and replace the word "blacklist"
> > > > appropriately.
> > > > 
> > > > Keep the --blacklist available for backward compatibility.
> > > > 
> > > > [*] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fconscious-lang%2Fconscious-lang-docs%2Fblob%2Fmain%2Ffaq.md&amp;data=04%7C01%7Cmichael.roth%40amd.com%7Cd17bb9d899914df4e04108d8c85b068f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637479640585250068%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=HM%2Fg%2B79VIjp%2BR9bIVBDPkYHHbFa9C3sGMvhomxhJdgE%3D&amp;reserved=0
> > > > 
> > > > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > > ---
> > > >  docs/interop/qemu-ga.rst | 2 +-
> > > >  qga/main.c               | 6 ++++--
> > > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
> > > > index 9a590bf95cb..89596e646de 100644
> > > > --- a/docs/interop/qemu-ga.rst
> > > > +++ b/docs/interop/qemu-ga.rst
> > > > @@ -79,7 +79,7 @@ Options
> > > > 
> > > >    Daemonize after startup (detach from terminal).
> > > > 
> > > > -.. option:: -b, --blacklist=LIST
> > > > +.. option:: -b, --denylist=LIST
> > > > 
> > > >    Comma-separated list of RPCs to disable (no spaces, ``?`` to list
> > > >    available RPCs).
> > > > diff --git a/qga/main.c b/qga/main.c
> > > > index 249fe06e8e5..66177b9e93d 100644
> > > > --- a/qga/main.c
> > > > +++ b/qga/main.c
> > > > @@ -257,7 +257,8 @@ QEMU_COPYRIGHT "\n"
> > > >  #ifdef _WIN32
> > > >  "  -s, --service     service commands: install, uninstall, vss-install, vss-uninstall\n"
> > > >  #endif
> > > > -"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
> > > > +"  --blacklist       backward compatible alias for --denylist (deprecated)\n"
> > > > +"  -b, --denylist    comma-separated list of RPCs to disable (no spaces, \"?\"\n"
> > > 
> > > 
> > > "-b" is a bit odd as a short name now, but i guess that's not the end
> > > of the world.
> > 
> > Maybe -b, --block  or --block-rpc? Not the best but at least preserves
> > consistency with the short option.
> 
> I was thinking about something like --blocked-rpcs, too, so +1 from me
> for your latter option.
> 
> If we're touching these names, let's try to actually make them good, not
> just different. Neither --blacklist nor --denylist actually describe
> well what the option does.

+1 on --blocked-rpcs

> 
> Kevin
> 

