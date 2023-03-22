Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D344C6C5A6F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:33:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7BW-0007ew-E9; Wed, 22 Mar 2023 18:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1pf7BU-0007en-3D
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:43:56 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1pf7BQ-0000dI-TY
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679525033; x=1711061033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fwiDIhyGEje3sU3ZGI8xtPZ/gbySe96bT3wyladWAVo=;
 b=SvBF1h76Lq4eD0xj1i7i2YE3GGNI5CWnKiGi3C0qjtVQPzSJIXVFbZYo
 cKjj/eY9OUks15/c9AhKZqUD8ZfEG0MhVnMY7YDfQhHPJWOegD/X2KXYA
 IKRLWspXho0cjTRERojTVLE9WkjWipwM+ws2djHcd1q6B6WGz8WecGU8i
 oPo6J8y4+/N/QCg0bu7GcgXlslijyxXb5JUu6GsEU4EjyxJwqZwZ4Mk7R
 3k0bVeNSkki5IgKNElkC6zsKLN7a4E534h2fhszivzVDrZyIGh3PvLG3d
 ZJEHl1ny6wKho7LPbm9qss1xnARTWkTCIvKoiq5+wGAsASB0VP1E4H1xe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338065258"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="338065258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 15:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675460071"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="675460071"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 22 Mar 2023 15:10:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 15:10:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 15:10:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 15:10:57 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 15:10:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWcy1NABkFcZJnNyg90SmUSEvzjNW+n1FeR6pjiKWBFxw12QXratFCleqGXJvOmCLMOKBwXk2LniHhFzjVwHow9mREC326vT70CEx7uNn8T0nx8N/dW0VzfzX4D0o3c0HCmMzX+Drsnos+MUMFEWJl+0iSPAkyzZ5SHSYmcTgP89f1ukqFB5yYk6z1Hil24TKzxJ4ynISc1IVnWHfjGUnwcWsLcGlq5DsQRe3sqrRwgj5jUTAGEOql7qsrwyvhRetN0UqJK4U8cE0jiEoYTZYC48o6Biy2Wn885YJxIt9pTDSGawRwAQef+ZVWpjQ8UesXRe7IGh0Lzl/EPnC3YmMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uwscmo1ydSSsrjwd+N+CsxbcHCkHhJ5SJuzfWJhtIRY=;
 b=fSzK8klvS+MZxTHKORYLW0h0dMosLAHj3xTNIfTM04qI4o1OmV5GPbKgmJUwQaF9YNBcbTuhceDMxl48yahVHHgW6513yn3a+drue9ZSaZdxJszfi+/Sls1yHJGyVt6BQtqV3ozT4Krfm1Yas3Z129JoSHIvpjLKyhsRtfNvoSHBWWs5FbCsLfLJA23eSW6Hqz9/q+Uh/QaBfa2sJg4+frxLkRf8zsq2ADltJ3Un/gwgelYjpAUWkVccBv/DLZs33WzfdA+HbiL60U8ijth8mDy1pqeMCtl/zcoiHQUDnLSqW9cTP6dydkVmmGaSdeymieKzcjY62ZxwYs5GpHsFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB5551.namprd11.prod.outlook.com (2603:10b6:5:392::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 22:10:55 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::ffa1:410b:20b3:6233]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::ffa1:410b:20b3:6233%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 22:10:55 +0000
Date: Wed, 22 Mar 2023 15:10:53 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Dan Williams
 <dan.j.williams@intel.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH] hw/acpi/cxl: Drop device-memory support from CFMWS entries
Message-ID: <641b7ced3bc1f_269929449@dwillia2-xfh.jf.intel.com.notmuch>
References: <167937891122.1510933.11055956062467467440.stgit@dwillia2-xfh.jf.intel.com>
 <20230321120147.00003ea7@Huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230321120147.00003ea7@Huawei.com>
X-ClientProxiedBy: BY5PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:180::34) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB5551:EE_
X-MS-Office365-Filtering-Correlation-Id: f023591f-4de3-4a08-16a5-08db2b224ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8FJMw15pq0bg6brVHQwg7/Kt7P0kpNXVqKIrIJGeBbDT6zr+E9rxBvjicDrZg4Bv8UdMQk+pMM840//eSgyAaC4JKbcasasAgFdvMiwRt0alZAkkl0eYwd6+k5ElowymHpyALhnfA5HUgKXDUmFehnp8mYmTi0zdET5YRQ2fXiKUBHgr1WRWnX5hGVAzKJebJ+efCxw6uX4EZoyonlNU5jchr6OGAexYsm3/6LddMdHAQvm5q/TxBTvZqg139YVYMSL6dIcPMsUIdYAZCJwlIImAJqm5P5GdPq5nYBCQc3FsBA6hJgQfwOEBtbvG0DghbTYFPSuDpaMjcEoll4av043fBzWHeqbPNi1ud1MFaMmk5IrBW1N09OnU6T6vWxzoSVzE1j327zeG3WJMKcWSO2Zf4H/W8EEulQ9CeP2F9NKCDRXr1yVUf3B3KzGW79I/TKX4yDYJw6qqsN8zv/rNRg55YcXsukw51y9jtb9W9Bs3nnjWAmyzx68B+MUKsNyN9hzouwFMkvtrZ5csAjhBrRB/JoMNivYau8vnWp3sNSweIUPqvYKk1W/Bl1JRkhX7gd8dBbOm5Ux7a37fWsFnnUBu+KilN7zGdyQvxi1WVo3UTkW45d5adejN7XFDHab
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199018)(6512007)(41300700001)(186003)(6486002)(4326008)(966005)(83380400001)(478600001)(8676002)(316002)(110136005)(66946007)(66556008)(66476007)(6506007)(9686003)(26005)(8936002)(5660300002)(38100700002)(2906002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lUCGl3vGDaiczFZdpj2mj5w9bhJbWFizJJa7tSAGiWYpHYtHn9UlAPWv7XHa?=
 =?us-ascii?Q?R5gzvJbsUFo6h8B+7uceuc1qZQvvi9UZqv4ZyziQjn+dB2xKMAScoMjJwEuU?=
 =?us-ascii?Q?/53Nj6GruN5+okZT6qKY2eVrGgyTxuj3zUfTkJ2OkmLZ4mxVX5ENnu9HaLqD?=
 =?us-ascii?Q?qnjuCEuJIPCo5pTF5udBOq8tF7hC8eJuJeVJUlstpeylyxhGw2U1EMDJZJxO?=
 =?us-ascii?Q?Qwmx76kTnqtxb4DvxFwBBqYbDaJNxUf7v6eEh22iISqM2UbVlWXUQh8cnqhN?=
 =?us-ascii?Q?QxG4sl2twEZmFFh+xKjLRRjro5XS/OY0+Od3amZK0s27QuaNvFrMNxxzoQR1?=
 =?us-ascii?Q?VCFehza6B20heUu+d7nw5CuGyC/qrtuAo5nPv1pTtqZRTITsyKZHJtWyw9nq?=
 =?us-ascii?Q?t5uAQy5vSaoeCUAJGiUNnXcsRv+5ZnhhNzNFtU5cF53OyQWz4h2dmclCPSSm?=
 =?us-ascii?Q?Up5guqFjxljNXTVVk2UbswGwhZZDuarMhZRViO8qTRzrIoDnIqFbsHrbPZJB?=
 =?us-ascii?Q?KuCMfEu/Zblnr5ws60Cv1nrkPWwz4pvs7f9Oks2rT8QitrXz/L2Jo4LuqxvU?=
 =?us-ascii?Q?ywhOWyNAEv7TKSXC5pjA/d4JQL0okBuaWwiEXHV9GsqfwZsaVwZLb4VyW2D6?=
 =?us-ascii?Q?Zb3/OCNR6kTWDbzDY0I6p81RF6+h1eN2kFNdmBvUCHPsdSmziC+IYpS1lDLy?=
 =?us-ascii?Q?H4c+sDeuhbJZUn0t294n92yh2QSn68IG+Sg/9v1VTrRCdCQ5XW3pRzlYyeCn?=
 =?us-ascii?Q?aLbaaZBlb5AlyYGU1aDfFVSUrhZETczLsP2ZGdMSg03znxbznMWoNTSEbZJ3?=
 =?us-ascii?Q?Sz59dgcFotXuFjZ5UWYjI5mD9BCJpdXG2oPZytvWK4owUWWiwt+Kv7+Ev2zn?=
 =?us-ascii?Q?ckS8wsLpNw027r+vDYWCjJ9gdOaq8iVPS0Uje2j1pXNDe1C+Mx1EeXL6IaCs?=
 =?us-ascii?Q?CVmTMlM0v6FnxQdE53DHmQcQE5BHM3KTj5sC4BHzyZ7NE/75wHE86XV7fVee?=
 =?us-ascii?Q?5zEdRHeQzQcAUTRUqXE3V7TxPOm6fzakIIybQTDJ2+Te3nFvzWhTwBQlNzWM?=
 =?us-ascii?Q?Meejn+FnYRttju1+1hZ8VYysqJFbdjU0BojYpy/beJLLtQxmjEU/lP8jq055?=
 =?us-ascii?Q?t9CQzme1UB1MlLmJqZj7txJ3Cm9tHUoRipDnbhDlnMnhiD563sFQ0dqja3RI?=
 =?us-ascii?Q?dy/GV1ddSDmtW/eCoUe45RnIcAq+R3inxqAXMLF1EcOY8CpcPcSqH2lqbfID?=
 =?us-ascii?Q?7DmKA4xyKOk9ER5kgq6PxKMR9qGa9OuNliRIF2ff7NgiN/20x0jo+SQ/gP6t?=
 =?us-ascii?Q?8rrvgmiX8X3C17AJQbcZCr8OYWZQVqHD3vc9rWI4KnwM/2ENoLOuYerf01G6?=
 =?us-ascii?Q?moQEPrcSt0jrWXru/v2S3JhVq9QGuXKGgj98rDHQK1N6JSdrnaZG4enf9G+U?=
 =?us-ascii?Q?5Iau8n4cgaDmMWQziHKSOl3FCD79yYLKs+YLD5HMiHokblNrAWbRweXE7npK?=
 =?us-ascii?Q?ProA3lzywIbPxky1V/l8X8I6kIgkjDFcP0N7e/g9aRGHZiowMfw6ZNqnKyAq?=
 =?us-ascii?Q?Yam04JuaZrsPSGIp5e/1pB0dDoBDInNOsEl+7N4qkj2fMlLosyaVOsr2Q59l?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f023591f-4de3-4a08-16a5-08db2b224ec7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 22:10:55.5610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGr88sduuSzbtVRU6MafjOaqs95Gy+Ilj2IFwfSzt2HhK2phXrYhGbNs+nM8Zk1wIHwz+UI+hyzaaHfQl1zJ+lxUuFsjv7lFm4tj0D4x9hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5551
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=dan.j.williams@intel.com; helo=mga04.intel.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Jonathan Cameron wrote:
> On Mon, 20 Mar 2023 23:08:31 -0700
> Dan Williams <dan.j.williams@intel.com> wrote:
> 
> > While it was a reasonable idea to specify no window restricitions at the
> > outset of the CXL emulation support, it turns out that in practice a
> > platform will never follow the QEMU example of specifying simultaneous
> > support for HDM-H and HDM-D[B] in a single window.
> > 
> > HDM-D mandates extra bus cycles for host/device bias protocol, and HDM-DB
> > mandates extra bus cycles for back-invalidate protocol, so hardware must
> > be explicitly prepared for device-memory unlike host-only memory
> > (HDM-H).
> > 
> > In preparation for the kernel dropping support for windows that do not
> > select between device and host-only memory, move QEMU exclusively to
> > declaring host-only windows.
> > 
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Hi Dan,
> 
> Can we have some spec references? I think the Protocol tables in
> appendix C would work for that - but more specific examples called
> out from them would be good.

I presume our messages crossed in the ether:

https://lore.kernel.org/linux-cxl/641a018ed7fb8_269929455@dwillia2-xfh.jf.intel.com.notmuch/

...but yes, if I was still committed to this change, which I am not at
this point, some references from Appendix C and "3.3.11 Forward Progress
and Ordering Rules would be appropriate".

> I'm also not totally convinced it isn't a host implementation detail
> - key here is that host bridge's are still part of the host so can
> do impdef stuff as long as they look correct to CXL side and to
> host side.
> 
> Time for some wild implementation conjecturing.
> 
> Imagine a host that has host bridges of above average smartness.
> Those host bridges have HDM decoders (this doesn't work if not)
> 
> Host is using a single HPA window for HDM-D[B] and HDM-H.
> The host bridge knows the target is HDM-H - it can get that form
> the HDM decoder Target Type bit etc.  The HB can send (to the
> rest of the Host) whatever replies are necessary / fill in extra
> info to make it look like HDM-D[B] to the host interconnect protocol.
> 
> (after some fun with a white board we think you can make this efficient
>  by potentially making the Host bridge HDM decoder setup visible to
>  other parts of the host - relatively easy give lots of time allowed
>  for a decoder commit).
> 
> Why would you do this?  Limited HPA space availability on the host
> and wanting to be very flexible about use of the CXL windows.

Limited HPA space and fewer decode rules at the root level indeed sounds
compelling.

> Obviously this is all moot if there is a constraint we can point to
> in a specification.

At this time I don't have such a reference.

> BTW. I'm carrying a patch (it's on the gitlab tree) that I haven't
> posted yet that lets you configure this restriction at runtime as
> a similar potential host implementation restriction occurs for
> PMEM vs Volatile.  That is also needed to exercise the fun corners of
> QTG etc.

Sounds good.

