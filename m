Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C56A3212B0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:06:59 +0100 (CET)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7B6-0001i8-EM
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1lE79o-0001Be-7R
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 04:05:32 -0500
Received: from mail-bn7nam10on2083.outbound.protection.outlook.com
 ([40.107.92.83]:34110 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1lE79l-0007UM-EB
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 04:05:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWId/pNGmbHJ/NHS2hy0BFGlZz6HCKr2LjvEzAMU9IgZBv+Cmj3IT8wjvdbtkNaH7dxkxcZgzyIlcOzSIKCriYtk8Mhq/6DtOgtSd8I5dBiy6NnVgywAR7AUWTMU+TscfJm5XpjSlwHJxI0i+tJqB59Wm75/8E49TBDQzh0hxFVuECPkiHLxN15nxI52+DGxFGl8yWvFLHW0l0UOQEOEhhcGD82p9GC/1y4Aqs3lUD8IbiGp7Bki1cBtMkPonBv9+UQ3T46stg9keEJzIwK4zWBikY4x3KScJrmUY9qfb6kvAZvGAuRaq1mwb3J3WuUssUJftJkPrGz09RNWTW8whw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGq1rYE63JmCdgcbLdYQPocf1814fIUuBVpdN6rba2I=;
 b=fzGkv1nFBOFyz0ncQF3S6YFcKOM+8NQvczlY5VmPoD5p/NmfXC6ZMP5Dpm/TXt0jB/ju7f2T7b7KrY77C+YBPJw5Io2p+EtJ+/FHUI4tqQt/2TfjszFSm2g78IMSnCCoSMYLfvdt2J6KGfev134MPQOAm2DTITJRpDngRoKjJfAil7padAy+z14rDVr2psRZ545cKNymrCjIMAmAp4k/iUJQWWRU8wCAzvgD5PM9yPlo5cwmkMhHFxiyM403wW4Q7I093TtBmlErIyMgJpqKAG+0bdotaAEXMPfTvW9TW3Cv+5XFLfnlUBy55zzm7jsfsgbU2vvcuyxNsgEoSzaKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amsat.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGq1rYE63JmCdgcbLdYQPocf1814fIUuBVpdN6rba2I=;
 b=WD6gm8ccl5v6NHoTgATTQWELWAP0hmR4dFN5bT4GDpr+MQj+8NAuWVUiUySA0oTOy3X9OSuzuaRtXUu7ldFYN0D3vk0XsZNsS9YJQa02FmRwbtwH8xBidQSh0FezOlMXBmZgrAbhzRsmHbZ3pnpMjIDzePAQN9z1nZYg3aGKUgE=
Received: from MN2PR01CA0011.prod.exchangelabs.com (2603:10b6:208:10c::24) by
 CH2PR02MB6678.namprd02.prod.outlook.com (2603:10b6:610:a4::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.29; Mon, 22 Feb 2021 08:50:24 +0000
Received: from BL2NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:10c:cafe::99) by MN2PR01CA0011.outlook.office365.com
 (2603:10b6:208:10c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:50:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT041.mail.protection.outlook.com (10.152.77.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:50:24 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:50:23 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:50:23 -0800
Received: from [10.71.117.207] (port=54149 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1lE6v9-0006qm-HJ; Mon, 22 Feb 2021 00:50:23 -0800
Date: Mon, 22 Feb 2021 09:50:24 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PULL v1 3/3] target/cris: Plug leakage of TCG temporaries
Message-ID: <20210222084924.GB22843@toto>
References: <20210222083324.331908-1-edgar.iglesias@gmail.com>
 <20210222083324.331908-4-edgar.iglesias@gmail.com>
 <39885acc-a692-cd6c-c0bf-46e3193a4d7b@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39885acc-a692-cd6c-c0bf-46e3193a4d7b@amsat.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d0d15be-5d46-4fd7-5dc4-08d8d70ee503
X-MS-TrafficTypeDiagnostic: CH2PR02MB6678:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6678FBA148590C22D82BF741C2819@CH2PR02MB6678.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWxFkM5fv/Fjs2SWEy+idbipKCuKuEz8SM88VjHZ+CPVn+z0LHNqmRCgMrGFiHrY5VyoAqXuNfkZ8d9/2TsdIN3zE0n1R6F07x+ykvL2jr2AOCF9FjTQDEZjT/1wp2g+nMD+mTU4ZiwSJJXz3/2H8oZYWa/dqNonE2WJGh07cVbhjqltyvbCK1NPA5WYLOd8oyN0pjuRrpQ8y9Z1V6lmlcB+kAPW75TEA6IccmInlnsy6YsYVLqwaenmsASJTxOwlPDM7wKPTDx5J6fz/KGiN8M8Ij606E89iRUJol3TLLl80xO/fP+WgIFU1aSYvHjf45wEOBS7TtgtT5MjaUxIhw78Rxb+1Ks1ZwPS11ARmQz5hRuFHJstnXnyEnsh6CmGnv7x9rZIs0TvTVwK3kcG6Zo1Xn5V+hXzhjAHcC2/I3tQY+vyHDB74SFt/QkXaUc8eWBAJgK67aKiKX3+KYoXD3Aik73e6fpYRNyKe73iwD57IXANJv8frDCEAFrE+6UOEOQhxXg3ETkGaJMCz7vf3DOPTFF0LNnKGTej12MXWa8JKJ6cil4off50kAt8Hd3/zOK1gyBgKmrKW6UowlujC1vf3xNDF/ucHsBTpE7fCz7xWVmt8EpQxDU41afdvy2gIUO9VgCNf2SOYcaie5XrnFZe/BbU93Az7QQMJeetuhs=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(7916004)(396003)(376002)(39860400002)(136003)(346002)(46966006)(36840700001)(356005)(4326008)(8936002)(426003)(9786002)(66574015)(8676002)(33656002)(6916009)(70206006)(47076005)(316002)(53546011)(70586007)(7636003)(9686003)(4744005)(336012)(186003)(83380400001)(36906005)(478600001)(82740400003)(33716001)(82310400003)(36860700001)(54906003)(1076003)(2906002)(26005)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:50:24.3239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0d15be-5d46-4fd7-5dc4-08d8d70ee503
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6678
Received-SPF: pass client-ip=40.107.92.83; envelope-from=edgar@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 stefans@axis.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 09:41:16AM +0100, Philippe Mathieu-Daudé wrote:
> Hi Edgar,
> 
> On 2/22/21 9:33 AM, Edgar E. Iglesias wrote:
> > From: Stefan Sandstrom <stefans@axis.com>
> > 
> > Add and fix deallocation of temporary TCG registers in CRIS code
> > generation.
> > 
> > Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc
> 
> Out of curiosity, what is this Change-Id?

It came with Stefan's patch, Stefan?

Cheers,
Edgar


> 
> > Signed-off-by: Stefan Sandström <stefans@axis.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Message-Id: <20210219124416.28178-1-stefans@axis.com>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target/cris/translate.c         | 124 ++++++++++++++++++++++----------
> >  target/cris/translate_v10.c.inc |  70 ++++++++++++------
> >  2 files changed, 135 insertions(+), 59 deletions(-)

