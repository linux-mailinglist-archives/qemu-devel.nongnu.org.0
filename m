Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAB1681775
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 18:20:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMXou-0000x0-5a; Mon, 30 Jan 2023 12:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pMXoq-0000w4-Cw
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 12:19:48 -0500
Received: from mail-dm3nam02on20608.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::608]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pMXoo-0004iV-Kh
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 12:19:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGh9psYAXqIGIH3AQTdnTRZzBVyuyPaUa9erfSegkJ9krzKZfdA30TkBFMf+h3M/v89ltgXOBQS08eWZjcCEfdldK7Mewis/7CS+nG1XHNg3ciX3kKJwdkZVNn3Lw9nt2Aa7rvcA23lTQoa6sPOC7kRs7k2WfHkMgw4jquiRZ9RxCvpphUGo8MTu4dGuuy2HhfrPCA9dlSuIXEMGphjvl3ol0epaIt5ZpK3WHuTnk5TG2D8YjvW/OgARWR0bi3hazWnze6ccH01UiY6cJOgFUjio5l4DWC9Sugiq/t/+f9MLIkZiYu9FsYASwarXEffueAkRklYHPUoqMdmIQ0hPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arNRaUPZRomFx/eLzmPoXtsThJTfFy55D8hjGRS1yiE=;
 b=RG7GQphOenuN+nVlHv+ipeGxg68lEadx91aBnrJClxyXPhBnA5w44AXjm65YjJzL7OagOFodZB5Z3wALy5K8RQNIG1ecAJlzS0oIv7SmonojpGnf69+SyrjCNetk+pQYwTaMf4LJa6KVoIWOocibWdg9s/prqu8engmEduYbd2pE/QL9ZrjuzC2itN8nwj3KVW5gJjsk+deG23mFw035bYNRC9+11g1FbHBF1lCVBg+kPTBJLvy5u7b2JEp3x8Tplh2djb4sy8OY5Ef2TvxvqykxJuljjbx9sF6lOSy1qLoYNDzY/Wu0lv+kJH9/v8XkY0lXUZvC6E4tMGA0XY43FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arNRaUPZRomFx/eLzmPoXtsThJTfFy55D8hjGRS1yiE=;
 b=GTIPJhJxSzY3uftxbEy1XoQG7/JjlnhwbTdNVNrdCjUXYm6Vq3LHzZtAWh6cXHJ42QksxJvfo/iHQ6HZA6jN8yNS8B/27Ef6CaJG72nKWHgbXTsDLCTsmG/TeT1AAbRWcWcPeT/s+zp2SWcHwOGJ0ETAXvH4onmCl3pil2TXRrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by DS0PR17MB6197.namprd17.prod.outlook.com (2603:10b6:8:d3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22; Mon, 30 Jan 2023 17:14:37 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660%4]) with mapi id 15.20.6043.028; Mon, 30 Jan 2023
 17:14:37 +0000
Date: Mon, 30 Jan 2023 09:37:15 -0500
From: Gregory Price <gregory.price@memverge.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gregory Price <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, alison.schofield@intel.com,
 dave@stgolabs.net, a.manzanares@samsung.com, bwidawsk@kernel.org,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [RFC v4 3/3] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <Y9fWG2Owlqzkd244@memverge.com>
References: <20221128150157.97724-1-gregory.price@memverge.com>
 <20221128150157.97724-4-gregory.price@memverge.com>
 <20230130132451.00002d5b@Huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130132451.00002d5b@Huawei.com>
X-ClientProxiedBy: BYAPR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:a03:100::36) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|DS0PR17MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 836c208d-143d-418f-162c-08db02e576d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: To7qAv4+6bTKbKSQjjAWrl7bZFyfLfDG+8+4scE8Vw8zPwcu4zrmLf/7jsIoAQ9muCW5Szp7sRwJFr4bpKeLyDbR1locTUhCTzsoGlXpMVZMQsu7Oa63N+P4lY0ejf1NulnBX2Fgtr84MwfABPGW2TMBGJec4botYsk/q3NTqr73CgLgSez6k/qzLpOmV5UtJgZxm/yv3ggpMdVx9yhW+2pCuSZUYd0PVTYDhRB0pLiEzfTCuCk5NZXy9o+tlKdfTqQ7+yZ4KztIpALlyWSfOFEQ0qlygAcNiz25kZzeQc7IQ13R4Wlw6BPj8CjFSa9jwX378gbANk03M84UyOEIvxDjbbOtUVlSsHa3RkkGDG1555BsRmq0l6n9RAlZPIz2OYf/cQRiRetHupQLylkPJO8no5a7lxaeyksJzA77WtlAjU4XfpXSiNR2zBESrEZL1EMsgP1NuWYc1hufCpTcXhoiff3B6psR2tr5s10uEzHR2WHVfWBFa6C3dZbpOOz0o0NCJPc9gB8cSCXSMrw88U2KOpje2th42Ffd5sO8Avnfeo14BzbZx0uK5mhTGEGfDh8vLHFtusId8GJKYWrC/Cy3LoFgNeqTyMPeaRLm6QNJKFhcY224CW0oAHsHwKeYTIugFNOs7c1aG/wI33CCMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39840400004)(396003)(346002)(366004)(136003)(451199018)(2906002)(44832011)(7416002)(86362001)(26005)(6486002)(6666004)(6506007)(5660300002)(66946007)(478600001)(8676002)(38100700002)(66556008)(41300700001)(66476007)(2616005)(6512007)(186003)(6916009)(316002)(8936002)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?99dLINNtH7QMQ+8FUHO5sWSMAWIYJDG3UxGTM+ZfHOzo0Y8MmxHKRlDS5yLX?=
 =?us-ascii?Q?WyIOpcnSFF9r/vwwhGeqB9E8q70iBDB2Hjl8pTp1+i5Nhf1Wr9leJ8d+llRE?=
 =?us-ascii?Q?rzvqhofWd5Ho/vBeRFimsWb9Z0S8XO9pLGwq/djNghxOse8u/NEPfaXUXknh?=
 =?us-ascii?Q?sEESq70vJohorOQj8eAIULwXvdrZX3VWJLnXrk40jg95o525eRtzLDsjoHkn?=
 =?us-ascii?Q?Hk8oihEVVjkRkRXeM0L05bEx7+U9Uz3IjJuXl44NdUL+usEyGhVK+UtRY4qK?=
 =?us-ascii?Q?RwV5jel914mr+w9Ze3Bjg7UB4AX3wJ6LjWIDChk4YBlPJKnqZUbTdPA3dPsi?=
 =?us-ascii?Q?wT3cQDAjhYUhp15nVXopj1jni3NBCWLnUvG87/kCsaLAWYtBFyRGkbRKy9Ab?=
 =?us-ascii?Q?zcEXPDSP2kNduxP9TVN+7mFo235QvV19o4KhlOvJO5+tGYLFcK4dxAXJhTjw?=
 =?us-ascii?Q?9/JsNIzHKj3wL/OUrDizXB6vmnKA6eJ/N/tDYpB6AYi0uRG7lmZCqbYlvk2V?=
 =?us-ascii?Q?DQ4qNZQxASQUcvvqEJataUnKrpt7x5BX8AJbPgzw4H2pZ0Mc5+Z1KBB6VBZ6?=
 =?us-ascii?Q?EOfwd/w/5mpFBZLTNgZIEI0EWPc5oOZVpd6Hw3koUSG0FdTO/LYqyxBacpHB?=
 =?us-ascii?Q?5fng4/PCqYubbz0SGG2+I7Zs35Ce6Vc42fNJQWoQKI5ug/WDjrDK242lw8Ht?=
 =?us-ascii?Q?tj/Ry8q58UfXqxSm9ERDCgLxAbBZwa3lKMPmlYqz5PvYByAOwhuhwoS1kOlz?=
 =?us-ascii?Q?hLYaC5h5h59Cqk8sVeV7RYgviGG4NtJERO2mXGhIvV7IMKilDw4y+Fs45Itl?=
 =?us-ascii?Q?N8Q7t6wBOZJYuiEOz/uBqAvC6HSiVMq6HpgfLXKOWDjLXQ7ygy+V5oL+f8r/?=
 =?us-ascii?Q?9UXKYwoPmdYc+KU9ZsbXYa7MlYzevoiji8Aab0HXa2xxGmDa0qSYW5eCQ1Zv?=
 =?us-ascii?Q?tLU+eHhawItNmD7hnkNdkM/IWmL4MVwvrIjE5FJXAE/TXuoJclLDAY5bW18D?=
 =?us-ascii?Q?H/zdsM3smgvPeCA4mD5lI3jb5RAZqbP9GX+q4ehIaoBnycvt6MMBTmyvBmfX?=
 =?us-ascii?Q?4xxovWC2zOV+ymxPDFQabmEaEOkv6rFHhxdghDhMTcUrcdLgRV+aWHoNgk46?=
 =?us-ascii?Q?BqZOrTasB4x2OhE+FGWAdTiDQXbtsZoC5DAU7gqvz5vGWnMk5cJ7zGVRdfhy?=
 =?us-ascii?Q?QI+rjqo67nqCLqxYYFelCZy172Zr+S8gWjl5CgxdxtbeQ9u4EhjYBFz+fGPV?=
 =?us-ascii?Q?70CSbN8kmGyl3Pmh+fjYhvolhR+cGRUgIKPJF0WsCdRPujxDTv2EkLOBT0ae?=
 =?us-ascii?Q?VHMnvU4GY2f1YAJ4MGKVe+qjmEDuYUk5Ym/t38TxdCEa2uNptIv5hZpIHlPf?=
 =?us-ascii?Q?BtXxYLG7Xuxpi8mliZfSCKV56Eq5GQd06hvko9fHXovfc+IY2t8XrDIuOKv5?=
 =?us-ascii?Q?QlResXJlfOyffh/SihsV9uoK8eT1OOb7eKZhfLfN/PixhNnjBwgITOdvo8dl?=
 =?us-ascii?Q?DIHkIAu/vFwSO8bf+p1zbIJPHxbcPUCmJGrU5Fu+K11Bx/OjSkJ6in7ydoxH?=
 =?us-ascii?Q?xAP3v0+zNoczEgNT6qPh6srPpp0WQ4o96z6b+6cfybr4UkzEoQiJsSOMBrwQ?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836c208d-143d-418f-162c-08db02e576d6
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 17:14:36.9752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpuYKV/KGoIFrp9XUAEyObnIY7NV81Hxv08j9wbyGbNBmofCHjbWUNz4UnBkwsFtukc3cZAgesHWzPa9mcLO9Gs2kvvK6hi0UbOcLG+nLPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR17MB6197
Received-SPF: none client-ip=2a01:111:f400:7e83::608;
 envelope-from=gregory.price@memverge.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

On Mon, Jan 30, 2023 at 01:24:51PM +0000, Jonathan Cameron wrote:
> 
> > diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> > index e59ba22387..6893f54e28 100644
> > --- a/tests/qtest/cxl-test.c
> > +++ b/tests/qtest/cxl-test.c
> > @@ -40,32 +40,46 @@
> >    "-device cxl-rp,id=rp2,bus=cxl.1,chassis=0,slot=2 " \
> >    "-device cxl-rp,id=rp3,bus=cxl.1,chassis=0,slot=3 "
> >  
> > -#define QEMU_T3D \
> > +#define QEMU_T3D_DEPRECATED \
> >    "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
> > -  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
> > +  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M " \
> >    "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 "
> >  
> > +#define QEMU_T3D_PMEM \
> > +  "-object memory-backend-file,id=m0,mem-path=%s,size=256M " \
> > +  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M " \
> > +  "-device cxl-type3,bus=rp0,persistent-memdev=cxl-m0,lsa=lsa0,id=pmem0 "
> naming mismatch. I've fixed up with mem0 as the device name. 
> The naming isn't totally consistent so I may tweak this some more before
> sending for upstream.
> 
>

ack

