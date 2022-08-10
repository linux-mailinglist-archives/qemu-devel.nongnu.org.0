Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2658EAB7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:51:59 +0200 (CEST)
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLjJd-0004u3-G0
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingdong.lu@intel.com>)
 id 1oLjDb-0002De-Eq
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 06:45:47 -0400
Received: from mga12.intel.com ([192.55.52.136]:2808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingdong.lu@intel.com>)
 id 1oLjDY-0007cL-Ud
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 06:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660128340; x=1691664340;
 h=from:to:subject:date:message-id:mime-version;
 bh=9WIRWq78YJWEIoazmpmCh0FGJU8kdGNtZx+q57wyL9g=;
 b=k4/aW3+tAGPfx2VwaaKPVG5ZQaTL0sidjHjPmKr6zKbAjNOdJO8mtHLX
 W6S21NgnTXz4DngDHYh/LK1cB+8BKRIxNySI8SrBJ2z+EvmS4/pCzRNSg
 DkvxzKj33YxcjuWaYcnwGfMJDHGc/L4eHhH3W3gyOQBCTEH1IfOvF3V0n
 DnO6K09WovwddszUL2LMYf5v0245xSA65D/Bp9BZRaoNoOAj4IejBlHkc
 XGwyKjhj+1vv+gFHb4tS86z6dlOdO1Vd1YFqmKq14oAzFACtGtfr7YW6X
 xBjnGcBaYrbyd5fkBGglGyq1sDCFUxvzwjsBRUxZyCT9smyX/e72QRmdp w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="270827710"
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
 d="scan'208,217";a="270827710"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 03:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
 d="scan'208,217";a="781194501"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 10 Aug 2022 03:45:36 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 03:45:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 10 Aug 2022 03:45:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 10 Aug 2022 03:45:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbC0A7ZiCN/qyryRiAc8B4GSC419BgqYkYP7zqAKGdEkOvDLMGPg4mBj1zSnlefhi/jI2MerroneV+oDOzg8aCnZjBJ3CaUxlCI0eji6x9fZbS882yA9Owon0uskHFwb26ZfiuXjbSfzCcEXV+N/izrMrdfDTW393C/xgvjR7dHdrkbKq8y6g4yPTed48XRezoTjozh0SMxJ5bW1F2l+bY0bqTH+AToYwVfsjM4Y+fSftaN7OQzbKn8Pv718fwtpmM8dflKvr6fxXS6eykpB3YQFipPrFSA873LP/75VUgkdWppeuBsPIQTTGw9NcMX0pSJKuJ4jLLuHekhtHsUS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9TZvS9vJBxazDYsa+Y1FauZ3RhQY6An3SdhvK/ZeDk=;
 b=GzsWVDvI9Jh/SpBJYamQzChR6vsYMndPBKTd00hNu7kLTMEs7oz4POhVefI1ACQwTjiOY+ZPq7KJY1WFKkpzHDwF27Vyfe2P5EQ+ObFOvBjZn/8xK8BvkMyXfDprLwSggzt6GKFwEI4dxI+sE0hCCutAxZZuRe9snyRH3zEDXLw1Ss0Av9eu3tD1fTrIwkkMSowKgF7tSfMd7j3imnP4/l15HjX/oNFro3CmFnp0JCo62uCuJujAalJgzpLD/jPcld5VM7aXQt7G9bCOOcYHAO0XoI6qI5SdeVfNS7yuuIJEARKCTRr39pNiJeEMDESjjLAdDBG7QMqwRw/pBojmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18)
 by DM4PR11MB6551.namprd11.prod.outlook.com (2603:10b6:8:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Wed, 10 Aug
 2022 10:45:35 +0000
Received: from MN0PR11MB6109.namprd11.prod.outlook.com
 ([fe80::d529:889d:4cb5:6d6e]) by MN0PR11MB6109.namprd11.prod.outlook.com
 ([fe80::d529:889d:4cb5:6d6e%7]) with mapi id 15.20.5504.017; Wed, 10 Aug 2022
 10:45:34 +0000
From: "Lu, Jingdong" <jingdong.lu@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Shared memory between host and guest
Thread-Topic: Shared memory between host and guest
Thread-Index: AdisnA1F15TtaOZgSn+a4I68uIFVag==
Date: Wed, 10 Aug 2022 10:45:34 +0000
Message-ID: <MN0PR11MB61090F118B8D3977D0EC03FEF0659@MN0PR11MB6109.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5855dd8-3e8a-47a9-fec9-08da7abd7489
x-ms-traffictypediagnostic: DM4PR11MB6551:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bbgjzHXVrkDecavzlmertycaT55U5/PnDmnrCvY1qN6oa7RebPGgzct2hnRl5Nt2AHmYsm8ZzVZ1px2I5CF3/sKe6LDusIS+EAzTjdKNq+ZXzaeCcdMSflLz/mo+S7xtAW/kP0DPCSvIe0REGglfhjwTOcHg/xbC+dfVdBwc73EUaXYjUAKyizDoLs5rLySQFer+T/YSpzM5E2VKRU86hDM283JDVWNRv3eLc8N6wCSGfTUSjyQc/kXbuB83a20tFYZBcxqKbx29AJajILfXhxJmiNqjv8e9cjLStGDCexa/ciMNSbElbNd5sTxRRCISRXlkw+r9uOyhqqM1HG1cFzH63eqqZ7oXhwrbMRAKNekPiGvO2hiPxOgWUoh/C35Pb1jqSCCpTTGPO9P5H8p25tJflwLA7KkTyCkVWXCgPUqQ1q0G/J3o85vP3Ginnqxd5+ume3sfZ0VvIcPvqtTOX4Dxca5ckECE1eNmLuVOm8eSDzujIHQGrlcRjzaNuT8i+qhoHsRZhH04xwDexmVJe3taSkv4NuljK2/3XWLB/KzUOYvEJOrF3Y0RCpwrIkyJDXqKDqOiKsTSXQJRVgCHMr6h06dmwn6WE2LN9cYM7VZjdoglPYYmulb4yaxYtHdk1PFNGCx9+gxhEX40ShWNQZ9jFffNhYoUW86NHNEUyZ1Bm4Zb632B5TmUbiHcMBKt3GF31hhkOftS4wc1doYvTYM6VOpIGqDejdDii/Hael9Fobo6PGg7Q2/Sd6mT6PHjKi3qQPjJpZNfJm/qXPVk452BPYM3I8iIGdXl0pQQ5X8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6109.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(376002)(346002)(136003)(396003)(26005)(8676002)(66946007)(38100700002)(66556008)(66446008)(64756008)(66476007)(82960400001)(9686003)(76116006)(7696005)(2906002)(6506007)(316002)(86362001)(6916009)(55016003)(38070700005)(478600001)(41300700001)(71200400001)(186003)(122000001)(8936002)(83380400001)(4744005)(33656002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZHojFcGT55w8jjDPzu0Ld6ozEgrrmVFSIJpLtIFOZLxGd2BJAwEa2bQxjFcO?=
 =?us-ascii?Q?U1MNNXkiQx2dANugsqS5SqPLl/rBkgu98P4SfOJ4nl9CNsv+sRUTYepWKUEy?=
 =?us-ascii?Q?KJ+EXXf2Rr5AcbTPTgTfz+aGP/rJytie0ochePvMdRCzICr6ZcvKQ6zdvUUt?=
 =?us-ascii?Q?sy21Ap1qW/S9CEBWRGE6CDPbg29Bu1w1Eslq8cmayX1AqmftCbyifWnzfDob?=
 =?us-ascii?Q?mT+zx7nPLIajRil6jmakgMAWOKJMZm3Xj35BV5tD6qSjf+fTkryc19Hp/FU4?=
 =?us-ascii?Q?hw7fODkMBiC/LnxgCBZnOyrcnJou8+mEifEmbrbjSPkF3IP93KVectPSrbjW?=
 =?us-ascii?Q?SYgnp1UFH8v8jLkuuCiYbxraox9mVqHKpwK6y3hi1jb4bRbHzw27LVBIM80E?=
 =?us-ascii?Q?PQcGpBPhDgh7sxI9mW34mUhf7W5KxVM7IQB+MQbBX+t5rSLfT7LEE4TEYAIo?=
 =?us-ascii?Q?pbrWJ7pKRgyojNKfgHWwKXLXWBZ8T+2qblq4BaBNa1pX86r5fbTvMUCv0Vy8?=
 =?us-ascii?Q?bV9OLz4kJajMN2NyiEKdrrR0Y+NIn3QxW4/3ZeG0rkwKcwDYvM/fl5/rOBTF?=
 =?us-ascii?Q?UQymAe1YQNMz3IVcCOE7HGar4OO2Oqv9JzRb67v2nb2ESLZi6RYFRZyhO5EH?=
 =?us-ascii?Q?A7KPbPDeIXMm60ftpsCskqyYa2Pm+09xOpOgKDDQyKS8XcNIMo45Qe62/4S7?=
 =?us-ascii?Q?yfkFNGllwLQ+buzNHAJoscadtAjgWX2jK/0x+xTcilNb6oqJdk1SGa0nkrJW?=
 =?us-ascii?Q?TQuiYK8ssed1k7FIxbMLELGHkyFlLXrB0nDbnX+UDSeSJIW8MNnFFfvWyGvq?=
 =?us-ascii?Q?mh8tH5QMyEY3ItHxiR3ri2ooal4tQoh1CyWZhehWDAet+I0bah/BoBmxVEB8?=
 =?us-ascii?Q?/XEKYwl8Rf18LIZrSbBPeEEeMFISapY7IMAylELTgjcaz5Bu2LcBmKqwLOOW?=
 =?us-ascii?Q?8oJfzif+geTi4YfDtk01QhZUBqg35kx/SQu0rXVsgAFy9zCWViDl4709s1hp?=
 =?us-ascii?Q?lIFuGspIVYz7CxBn86SJL4c05s9zlRp0dRBilE70VWcquU15FONYFnd8etvc?=
 =?us-ascii?Q?lf/E9E7tRXcNtnwdKeRlJRAe8+ujyQQIvI6v283dSZVH61eaqrwsScxvi23L?=
 =?us-ascii?Q?ayChojhlGRNy8KT2DW5uQuWN/VkeIoCOG41Ht2KFwWwmKZrVuYrRFiSQDeb9?=
 =?us-ascii?Q?GhJ5WS2K8niQiizFRWS0pLabVYh+pvhJzsnt1lfm4ye+iXEORk9E3CT0PDBU?=
 =?us-ascii?Q?/EZGHB5kLSAGBsnMD0NWG9B1pEIc5h0YSbPlNp2fQs0wkxBTCwE2cSN9lxHB?=
 =?us-ascii?Q?pkZYIMMpKrIVc6p01smmcRjq5lFVBy9VPIfKGfVmIqAURCR/Tx+ssDI+hmLR?=
 =?us-ascii?Q?kDB5pepEenVERjmetvyO/XBAO86d+qypgOjllUZtxTJUPT/XI6H01zP0HKlH?=
 =?us-ascii?Q?FHE3LLD6dLSCCmYUvzO+6S5wdAPBEHfkA/WuAp+vhNBnzB1TSjsaJlxuKRFd?=
 =?us-ascii?Q?B5AIh2Aztq79O/JmYmTQwxPSA2cUkp6rYFjW6mwPcD6lTulz6t1NQijoilCV?=
 =?us-ascii?Q?h2HTpzVZPHKMfYy3V+6BOi1DywcrkA4kbe0o1Wor?=
Content-Type: multipart/alternative;
 boundary="_000_MN0PR11MB61090F118B8D3977D0EC03FEF0659MN0PR11MB6109namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6109.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5855dd8-3e8a-47a9-fec9-08da7abd7489
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 10:45:34.8798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lYjIOhNrSQHPL4T7itvhXU7y/ibG7xI073E1P4B4d2B6ymzW27vCrMkQ0lsm96KTyrDkMRjFlO1jJpTx9H54+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6551
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=jingdong.lu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

--_000_MN0PR11MB61090F118B8D3977D0EC03FEF0659MN0PR11MB6109namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi experts,

I have some basic questions regarding shared memory between host and guest =
based on QEMU/KVM:

1, Can host and guest share the same block of physical memory? Ivshmem? Is =
it continuous physical memory?

2, More specifically, is there any way to support the following operations?

  1.  Guest starts.
  2.  Host side allocates one block of physical memory like 2MB.
  3.  Host side adds this memory to running guest  memory mapping.
  4.  Both of host and guest can access this shared memory.

Best Regards,
Jingdong

--_000_MN0PR11MB61090F118B8D3977D0EC03FEF0659MN0PR11MB6109namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1384139476;
	mso-list-type:hybrid;
	mso-list-template-ids:-2140401060 67698705 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi experts,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have some basic questions regarding shared memory =
between host and guest based on QEMU/KVM:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1, Can host and guest share the same block of physic=
al memory? Ivshmem? Is it continuous physical memory?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">2, More specifically, is there any way to support th=
e following operations?<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Guest starts.<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"=
margin-left:0in;mso-list:l0 level1 lfo1">Host side allocates one block of p=
hysical memory like 2MB.<o:p></o:p></li><li class=3D"MsoListParagraph" styl=
e=3D"margin-left:0in;mso-list:l0 level1 lfo1">Host side adds this memory to=
 running guest &nbsp;memory mapping.<o:p></o:p></li><li class=3D"MsoListPar=
agraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1">Both of host and =
guest can access this shared memory.<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jingdong<o:p></o:p></p>
</div>
</body>
</html>

--_000_MN0PR11MB61090F118B8D3977D0EC03FEF0659MN0PR11MB6109namp_--

