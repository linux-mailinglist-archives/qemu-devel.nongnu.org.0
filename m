Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA16D52BED6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:49:55 +0200 (CEST)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLvu-00015X-Gy
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nrLtq-00084L-D5
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:47:46 -0400
Received: from mail-mw2nam10on2064.outbound.protection.outlook.com
 ([40.107.94.64]:24416 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nrLto-000861-1c
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:47:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtQU73sL/s/U6afy8tu8oO2cBJT2WMzVdU5clV8aP0obmbhB0zxPyhMlMd/zWuhEKW9r9y6JrTDwBz/oP6zoWgJYM1yhSBeiIiGiX2xCh+ec6TI85ypOns0lDhNCm2Tb+C+wbRyo59xy2zaVxlu7Lfldv5teqdvuo3PY0+C52mSZtec9jQkZWETp3EfZPAo6cH5UhV32M/fweGy7M9IHk6gFfdxvhwpraPT/vNdRkfMq7q3kSfyU1Hzqcr4k5GVVf2iJfGN1qxnE807cWkN7Rr+JuWY5+BesBZCBPOSV8EPVgxZi9zZAt1NTSg2eBSsmuMFbPHST4W4+timTrOFoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dw7IYB7dHBqBbC3hIVyi5rXrHCXZ2qpJMGSBihMyBpE=;
 b=iOE20gBkuxvxlZaCy+QZF6zRnZrhRDD/ktaEkhVWNuHuuQakhuVU+NZ50Tg6kq/leGpw2AhJ5pZ6Hhkyjlzk9AOvpUODctXEaqiAyHVKH5rnjUzxvPAcDMAkr3uTdfe/q/WiXRskVuRSWWJLnO1aRammzS43E5kCLK4HN0wT2ucwvYAC57O7XB1yyLjve7SeeS7OxA1PznRpOXpB70GfvwPdmpSu7Fa6mMXweVzc2IuxLfBiDGPjA9uhlRzwWEpRB5fhlFnFHOkgbppIh13RtYajVUqL0KprNcaSRU3WMteeXoczNxX9qSFF1x3fvHmtzhGXR0Lq+OeYoYlqBDCAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dw7IYB7dHBqBbC3hIVyi5rXrHCXZ2qpJMGSBihMyBpE=;
 b=gzuGMYekJVGEp1bArVCFNgkIPEAgqK4D81v3nHE0JM2RBCoblAkEqiseuyxVo5rJHvWOMls9RZQLImIAZp7bfyFFt5+M3s+A5dQFYym2ERWt52QDCbOeMRLkqDVqYJNSUrvfFvHk8jZ6tTQMYdhCg/cN+6u1ZhPg2io5lueQ0IAI29W6unTwmsAmV+TTSMsyjy/tBDUwGdYEyeq2YkqRQ0AN5z4qJBS725AJV6tInSmi8vTiPFOwgzpYBZshe1VVMghjQRNPRnJtuyUzR+ol7dW/51UsSoHhH/H+A8i6rusy7kkgFYThZ7M8SwoCssoPInVOuiAnA0BRMscarkDGUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1319.namprd12.prod.outlook.com (2603:10b6:903:41::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 15:42:38 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 15:42:38 +0000
Date: Wed, 18 May 2022 12:42:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 5/9] migration/qemu-file: Add qemu_file_get_to_fd()
Message-ID: <20220518154237.GK1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-6-avihaih@nvidia.com>
 <87czgdsohs.fsf@secure.mitica>
 <970f0e4c-19bc-6528-2c4c-9cf7fbd5a789@nvidia.com>
 <87ee0rf43p.fsf@secure.mitica>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ee0rf43p.fsf@secure.mitica>
X-ClientProxiedBy: BL1PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:208:2be::19) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 488abca2-2c6d-46c2-a159-08da38e5098b
X-MS-TrafficTypeDiagnostic: CY4PR12MB1319:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1319EF534EB0F207A08629EAC2D19@CY4PR12MB1319.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tkQhqWNZCBmvNJljmJsw6iL0rIyZQOfrx8hQXisJhgWAtYFe80RUOxaaZ5It7zv98xrhBjq8YuwzNI/qHVZHPOcaNvdzetFFudKigo7/lH79ym+moYUVTSHX9owgmZYFeC4TokMl/7KeZkkEW0K7UL3tDhyFP3nneWhzNdDj/kKiojF8wDCg836NBVTSq6movinr76+lAjLj+2on8XdRoBA/iRnZWDh+/qDYu8N9vGZMWnY2eIjC5BPHzv7YKpLDtawceEafHoe0uC3/xSy//LKpw3B+YRV3xDURVuZxG8n1uznAMbajS9copfF4YYui5H1lKxabFKrNn8uqdcKRYOdS7f6uVHKDYPNlEXXXmkD+IS6KwXQ3y2SguzpbPIKlGdtl0jDPcoO8Rk3PzvcOqV42k56ks8dNnaiR7ppJ4Qg+f2RBd0HuW1jEeFR7OsDvKxojhNSTiuEGTG2Vo5EWzZXOSMWVtqJkYuflwqWodaaB28UCwdGoCCpAjHUQ7Dri0UC8SZwWije0eSoH0PZQOTBG3Afr7KPqxF72PBtNnGMSfWF34P4WV8Chgu6TW2wWMpvrNnVCgkCxPoJ6YgvWukcngJ/+afowiAc3HKM6xvjN58mymPlaPWXLrIK9S0+W/5Up4BGxRt7IVF0qT1tx4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(36756003)(2616005)(54906003)(2906002)(6916009)(6486002)(107886003)(4744005)(86362001)(26005)(8676002)(4326008)(8936002)(66556008)(5660300002)(66476007)(33656002)(66946007)(1076003)(38100700002)(508600001)(6512007)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b18coKgsjzudgGr32xeEIn8K+wuC2n1wQZLqwVdSNZqVzjbKkg3hA9bq+Kaz?=
 =?us-ascii?Q?sEz0NyecERREM85mnV6VUtF0kXaBc20Fk/u4fVG004yPMEx/PRXVVxgSrAty?=
 =?us-ascii?Q?1pC06HPwPfbF6oMI+xHkGAwd/PapqRzzbojoxk7uy1tDNFKVIGdBeGdgpSMn?=
 =?us-ascii?Q?jNOUvfKwr43CE6SLREnnMEld6fB2vC3rIWa31+PGsXm75WZfocpbLP1DqZPQ?=
 =?us-ascii?Q?iX11FvOuYJVjWOXiXb4csuoBqaqB8TfV8SO2gKVoCd3tLlwOjAyJi00rJbZh?=
 =?us-ascii?Q?HFtIIblzgl6KD6Jb36EWy9Dn744U6FyLCYmZCpz2Qjo5bEP43NzMir+kzYDP?=
 =?us-ascii?Q?73C4BnNjr8QHNPSBESuhbfuIT2eMDcdZZFgRMfH7/ekRtOvNrfgzUoQVYK4K?=
 =?us-ascii?Q?gvx4AbMns8wkwBfi5OnIizj7QlknBhvW86IReiccfAz4doNV/lalZ2EzWoN6?=
 =?us-ascii?Q?fzW8fHjUnUCvhcoOCrZ07peXYuD/80HkRZIk9TgmjzehKYIDZ5CGRzVumprL?=
 =?us-ascii?Q?fuKedPos6n0yylUgzOF331EP5gNsLM9HlKpRmbfNB3BWsWMBvsYQLqxUy07j?=
 =?us-ascii?Q?Vc5Yl7/YMQKZDzDJx1+jGhmjiETn1YuoO9jVLMhIXnKIQHIcNSZMvr08AuGC?=
 =?us-ascii?Q?e8KmpNq7IebOlmKk03ZvWSvYBMGDfC+u1HMOaT+OQnByFf1T6XDmp/dijre2?=
 =?us-ascii?Q?fsuFhXU71Fwnn2gr2MdO1qI6tJhEDIjj8xD2XG/HzVGXyWVJrj4PhvKaNlIo?=
 =?us-ascii?Q?OM511+m7tu1Q6k0ID5pKAQYp9cKakQsPNP0jSGnwrJwDLyzXUXFY6RCQqjJS?=
 =?us-ascii?Q?1W5VsS0/XddcfMuxblH66THXr3DHAfZwBYuhrBDFSm9xUKWkUOTpiR0NNQPq?=
 =?us-ascii?Q?g8Wt1WZMNGOR3lJM3+jep3eB+3Xm13KwjuU9Qxe9XtgzxvmEEAFZLJ4M0KEd?=
 =?us-ascii?Q?f7vW61jkmNMZbnsM/ijx66lRuMgNqqQbYDVce7f+41IRNjjPQS9bCPeVKEcK?=
 =?us-ascii?Q?ol/6NWKf4c35++7SE1YuiOpLhnEoQcaoDO2SI76rE+tgXCCnBhojI6gnneeN?=
 =?us-ascii?Q?jHAEReBsNrpExTIWSeaPaIP7LbscHmZ4eA2TOK4nXMLanAK/7sups7rRyQHu?=
 =?us-ascii?Q?koRZSOOKJ40mAIfUjIEhg6TNqgenXi1hUR+Po7hS5gixcaO5yGKaMl5sPCIu?=
 =?us-ascii?Q?Wx2shuidXJUWm7Su+jagFmkasTXdDIdWCma5fsG+KTF/9vp+tlRrVxiNsW86?=
 =?us-ascii?Q?BvxpvWduVb5nhhrORMDMjZmLtFVBTh/NkPbmo0QQwvo4iJULxcBIl7SWoQA9?=
 =?us-ascii?Q?GNhdWMvc71WVRjKSNA5skV3UEyQafK8yvxQo6GAo5fY/uB6SDFxXnOqOkP+7?=
 =?us-ascii?Q?WOc1MVbpw7M3TpO5j6Rtdx6NGNySWvcND9q//6Fp6TLmmt7xe6MJTuBc98Yk?=
 =?us-ascii?Q?eSQ8l5IPYko9upFG3jqglyx5fqfDWOUnbuPmdCBvF8f2ZkoByGSpC+J/MET4?=
 =?us-ascii?Q?eakZcIa50HsM5jXrPyGHNc5JZh3M70+7jbdd+ZRvbCghOlkV/5woKkVN9ufO?=
 =?us-ascii?Q?mF4TKnfj1zrWwx+CVCK05jQLLlW/ei9+BtWyfa+VGQ+z9GPD1paGqg92DSfI?=
 =?us-ascii?Q?wBYqLi32Ds+gtELkHnMQKF/091w/GG05f/Im9aVLGLs4IWHDpU3GUkMGUNCl?=
 =?us-ascii?Q?XZM6hpx2fJ7s7+Xo4WP0ENG9uc/ExEWcbI3O+BWzSt/6sBRU9fhI/YkjKak0?=
 =?us-ascii?Q?nto4f67Arw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488abca2-2c6d-46c2-a159-08da38e5098b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 15:42:38.6721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXoGhiaTFBvb0BkbBVb4f1khfF0f70KF6e4ZB8SGjMx1LN2fNjgzfWK+zQ59ERnI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1319
Received-SPF: softfail client-ip=40.107.94.64; envelope-from=jgg@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 18, 2022 at 01:54:34PM +0200, Juan Quintela wrote:

> >> Is there a really performance difference to just use:
> >>
> >> uint8_t buffer[size];
> >>
> >> qemu_get_buffer(f, buffer, size);
> >> write(fd, buffer, size);
> >>
> >> Or telling it otherwise, what sizes are we talking here?
> >
> > It depends on the device, but It can range from a few MBs to several
> > GBs AFAIK.
> 
> a few MB is ok.
> 
> Several GB on the main migration channel without a single
> header/whatever?

IIRC it iterates in multi-megabyte chunks each which gets a header.

The chunking size is set by the size of the buffer mmap

The overall point is that memcpying GB's is going to be taxing so we
want to eliminate copies on this path, especially copies that result
in more system calls.

We are expecting to look into further optimization down the road here
because even this is still too slow.

Jason

