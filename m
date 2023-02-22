Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2A269EC8E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 02:49:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUeER-000816-Pw; Tue, 21 Feb 2023 20:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1pUeEP-00080i-3s
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 20:47:41 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1pUeEM-0004pQ-G8
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 20:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677030458; x=1708566458;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kVEsy9XUWI7g4pY3PnXjkBjBzf9g38++oAxNX+ARPUY=;
 b=ZQUaSCcLkt2kqnAwyL5CzQ9EgsEhoeNLv4BxadHcjplxjCkOEgxiID+M
 djsK4lZt0DveXfDILHEfdqF2tjrzlj8VjMT4+PbIwnFwlyf3XzOWEBE/7
 P1VeCqm7s4nMnT6DT1FR8hP4CoqdfhG5sSdqLhiFV6QidYJQ2AMTQPBw4
 TmPqg/fVK9sHtQqTTKGazSXYSFbSFDtk3ysZ+pjcG3K0ybgHfpkWhmX+L
 mVTHDh+Lt5LQ1ndqjhtqPrJaq56TQW1aBzfo1kG1OxeeV+BEI9TM5zAHo
 ZEfNlQCd2Abl3dZJa24Ng+LaX3LHgW+DZuBGej7DAU55pHk3YByp4nnBa g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="331475973"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="331475973"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 17:47:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="760776134"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="760776134"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Feb 2023 17:47:30 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 17:47:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 17:47:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 21 Feb 2023 17:47:29 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 21 Feb 2023 17:47:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltX1SX4NiyGeczINqvoqrMMhvpJslsXe8DEmJNeFAnm94CuxI4UCq+TWZpY97yPyzHgMcDcM0pyamncbZDXh6Hk+lNdldb3Y2fD+Oac1vSBxu5I4l4oXaT+3vGZThWPITkw5a6t+vmexvYPb63JZHC6vaoHo/CL+uM8LVbCGcnkrWOu48FRutZwUAjTXza2ovKROZOQHumn2SlnRB8wAbyIbAv+yFlylnjFoJMOfqDkc/jK3nwq2bhLYq/56oS//CUE9KpnvOw67sbIyYzynENgOVROueALVS5qPhlz7BzY/FLCGUoXXZf5txAzg9Yg2ZvAByynLJijKdv8mAKdhDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPaG8nglXqKuIPGn1z2sOv3r8Ifm7P/Ugbm9OtWajrU=;
 b=YZSs6yJaDl8k3AzbembNPIwi/Uaw8Zsj/3/NBmISZonZbVBXvwiBnb7c6E2PWB0k035ixk9dy6GtEpCiJj/xilUkM85jwCQnlhKOpLbZl41CbrTPJXK9nqFw/9UO1ljmIUURtntkFkmXwyaEZORreihOWWmHI1kD09GjL3/37blUNhKQUbI+Wrq74qUmVMWeoy4wWVdH+zaJ/BSuGSKf54dEGkBxHHgu/mTBVnKn8O1BlfNfa/Q+4qQmBBbPHHT2yK033HG12kE/RPTdlNRTdbbCev/W+gqbRU7agyn4AclicwH9OQx8ZCq5OIn9scKZBcdn1Ac3saRU1cnlvnpPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by DS7PR11MB7835.namprd11.prod.outlook.com (2603:10b6:8:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 01:47:27 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff%8]) with mapi id 15.20.6111.021; Wed, 22 Feb 2023
 01:47:26 +0000
Date: Tue, 21 Feb 2023 17:47:23 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <qemu-devel@nongnu.org>,
 Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Mike Maslenkin <mike.maslenkin@gmail.com>, "Markus
 Armbruster" <armbru@redhat.com>, Dave Jiang <dave.jiang@intel.com>,
 <alison.schofield@intel.com>
Subject: Re: [PATCH 1/6] hw/cxl: Move enum ret_code definition to cxl_device.h
Message-ID: <63f5742b15896_1dd2fc294da@iweiny-mobl.notmuch>
References: <20230217181812.26995-1-Jonathan.Cameron@huawei.com>
 <20230217181812.26995-2-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230217181812.26995-2-Jonathan.Cameron@huawei.com>
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|DS7PR11MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 6932dc37-8ead-4c11-8ea7-08db1476c021
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yzs+0Sh3/MRCyFdA9D64eMWO9vgLQhJ4mJtLSI8NFCuvrp+6LZ0nrsHpJ5bd/Ap7mOelCUGxguVq7mf4R0BL6b21XLjxpA68uKP9gQQbnON5r91TJu/vruF2RL4UfEGtJWbrAWQPb4ZSnmioSDEKvYtjmKxGpzKapKK14uQ6dTWGbDnqU2kGk3hTNJNnBfJqjuFLjEsbc+VhmRaAgSsEyA72goOYu2Cj5Mz+W5uOR8sX6Fdu1LthsZH/G+3XnMgpoeJ/PQ0HNmKEbq55JY2uEn8h3shHJGACV/BMizvG9L6p7BpBilfjEyYLpOPvMf8mc1F7giujGoGkTfqqKntUZMq8y9FRo6oUfobWuWHRCs8AYWMKie3YCDAD0QITKVmg9cpGk5364c0cSbBCW07w1lQ7kgsbxSdaUV2LiFUQJuOTo4PeGBAtp3trYKIy+064yppt8uc6hWYSWryYi00kVZUEdqR+iIKaU9b8HeGMRXb8XzpX6pfvCAI9cosv5dK2iH9njRhJR72x4frw4rOpEY9EpfX7AJ+PhGtx52tez66cN0gSEV/cAgFvqtsc7ses5HmKXdHYajiJ+wg65INj/ofJWTlE1Pnpj/tAng94wBD1EcKtHRA34tcx6Z3hDxXBz4FqSQg/lC4M7tFoG9e1xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199018)(26005)(186003)(6486002)(9686003)(4326008)(66946007)(66556008)(66476007)(8676002)(83380400001)(5660300002)(8936002)(7416002)(6506007)(107886003)(6512007)(6666004)(478600001)(41300700001)(54906003)(316002)(110136005)(38100700002)(4744005)(86362001)(82960400001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RM4KbjOuwsg2kHdtSXQNzupcK1x0tq03sRErK4rwly2ChqVwmA9s+PwJ88Gu?=
 =?us-ascii?Q?1eNDoPMpYo6PRIztnwAIhZGdKiAp22TkMOiIJdXQMk9MZLknRgJugJLY1BRa?=
 =?us-ascii?Q?EWNGMMRGs3IeKIrl2WNTECSEsmMVbnJhSjzgtS/Juj3BhfnArP3qloOeCvyM?=
 =?us-ascii?Q?qqnMpe7wxfmczvJ7SOoiYBklRrPXayW7qYJdKPls2fBQ8kxSf+ESFauK81Qc?=
 =?us-ascii?Q?HUsJPRsBrFT8kJqRozufb+Lhz/dYmGeAOlJHkWXYOq/yYUBvj4dboBMry1pC?=
 =?us-ascii?Q?eC4AarcuhpQFjkA7BZHFejgIM7efhm80Pd5NYgYqDtZQIefMqCsHCVzEd6zh?=
 =?us-ascii?Q?/fdD+bniOl+K2uB1maURROSkGnVn0MAp5idXA9QORYUSAFwikrfUiT359fS/?=
 =?us-ascii?Q?WKqK6b0pgZM7qyyAp6F07hQXrbpBl6CmA93JoldfrZ4FhxvmwzZcWA5yuFEZ?=
 =?us-ascii?Q?Zie4Cd+xxkADQ6aKYQ7kC2b/jHen9ar1Za4+yoAivHe7x+t7sd9dqNhqw1UO?=
 =?us-ascii?Q?qsZupyYgq4BVJRoM8Mrt8aT76ZY8TMELsUIG21jCKG/fjSEdBX7YZOSizCiD?=
 =?us-ascii?Q?u4r+2qtkwkRF5CA/P1aSmwJ6Q2DCQ0rnSVblkja6mKcpc/FDbZB2FPWiiAUp?=
 =?us-ascii?Q?7eBlOCCED72ukg+0LXxeVU3c+8IO4OT094dK/j8UPa+itoYtsIURu651Rcoo?=
 =?us-ascii?Q?7sk4eXeM1lblZwAc/0esSI/y4onVpab0bfop3y4/gOz4Rq6FYrU6p9KqGfsZ?=
 =?us-ascii?Q?lHWV78N2wZA4g4AcN5widpfMBm/EfhQXT/xpL5vGsMKxhdOOMr0ff48xk1dW?=
 =?us-ascii?Q?/x9VaFZd3/m7V/lmiAXZ3oy7rbskUrJB5BqYOIN62FGmF1xqyNzM3nGLXBj8?=
 =?us-ascii?Q?vn8a3EP7NSejuFJUrto0rD51kGN/hetrbk/e7W9MFzs3HmEe8HSV8Zg75raO?=
 =?us-ascii?Q?vQszsC5uOLMuaYY7SyxSvPD0IIoRysWTOqlJJagXRmBPQjdtIe9QjfGYmFZc?=
 =?us-ascii?Q?v2Y+U9Z/d07XZ2etJrkSbSnt3qQjOFKpp7nyraw+jfX37026dVx4rKc5JHgS?=
 =?us-ascii?Q?D42z1mb3ZO8CmiN4orPeFLCrqDaPYPA5rulcLX6aV8DLZrwb6AFAFca9soGB?=
 =?us-ascii?Q?DnPvL4w6QzBSLECzLgHFt3g1qWcXqkPSnCuJdk68lWFAX1eaV+4Y/hyIatvz?=
 =?us-ascii?Q?mbVTnlHaX3pwXAt5O47P7JGuJfZ1BC0AcYYWE/VUUEZbeAijhN4t3GUbu301?=
 =?us-ascii?Q?A3Jdzwa7vc5aikxvTcPpyTPDpRMoxDejiONPO/+zsKKxuh+NmyIoO4TpD/2K?=
 =?us-ascii?Q?46buGKU4o05lupjx4Cyyu/bLX8+gftMOlqDPGUvWDJLCB7H/zvzAG62jqUpf?=
 =?us-ascii?Q?adIhguYLKLyXh6iHBu75oLcphSwd4fXM7/X7fL5Gp90nOaUH/t0mrRxAvWzT?=
 =?us-ascii?Q?tDzASQdpVgKD0AKmeZik1FxQ6tJLaUISc57col97tB58xi5Js6np86qrYA7d?=
 =?us-ascii?Q?sNjpBWU3eAWp6mvNuw2baSsdbzKDKxF/ZYLjk2EDeaY1HQ38oZMOzqC3/AVU?=
 =?us-ascii?Q?tSaKUeqB6khTLGI49tzezTDNVNuDMiRjrzMZvKbI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6932dc37-8ead-4c11-8ea7-08db1476c021
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 01:47:26.7052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cpd4/WPQsbzMTWNOXpcx2ubsHOVMjio+iiTLoAUe7ZIPl5XlI8e1jFSf5ggj8GAp8xRM4MeMS0ifAzZ43tbYAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7835
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=ira.weiny@intel.com;
 helo=mga04.intel.com
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
> Needs tidy up and rename to something more generic now it is
> in a header.

I'm not opposed to this change and patch 2 but I don't see where
CXLRetCode is being used outside of cxl-mailbox-utils.c in this series.

Despite that reservation I think this is a good clarification.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/cxl/cxl-mailbox-utils.c  | 28 ----------------------------
>  include/hw/cxl/cxl_device.h | 28 ++++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 28 deletions(-)
> 

