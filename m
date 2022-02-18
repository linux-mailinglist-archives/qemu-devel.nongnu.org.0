Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC7D4BC313
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 00:56:25 +0100 (CET)
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLD6u-0000ua-AL
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 18:56:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1nLD5c-0008V7-UM; Fri, 18 Feb 2022 18:55:04 -0500
Received: from [2a01:111:f400:7ea9::60b] (port=32435
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1nLD5D-0001tY-BL; Fri, 18 Feb 2022 18:55:03 -0500
Received: from CH0PR02MB8027.namprd02.prod.outlook.com (2603:10b6:610:108::13)
 by MN2PR02MB6685.namprd02.prod.outlook.com (2603:10b6:208:1d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Fri, 18 Feb
 2022 22:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKMYWTlCRIO0r0mt7yhRCXytb6vrHU336VptcwCp4mKkVe6E7jO15c176zrQCby6kuNLwRJSR2onF/r0REWiQYpdAhbbhBjb82UbqDYy52ifGGN1R9FdE9ERem1DqibVhZd8Guhz5nfsiiYxXJmjzfZaxW3EQmd4Iqeu2FtjG5wW7mytYtHZpoZeAwvNmSFLqKI4mJLk8TfCcXCYl4wkefAZka9/shv0+jpTJ4/Vi2J1/rVTESrccZODALeyh1K+gQZ8Km+VphSGQncfh/ZgmU7gBZsro8sqw7wslsXcmqac5H+8GZ8E7eUmaQw7VSx1WgpB6g5Gvs1njDZZ6Ql1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/574YRC021P9YMuvZiJW49bZoNFoEp500MFyFh8mis=;
 b=M1I5KrdUdBK7zmg8aUG58DaTHiW5QHf2isKgeuVv9fGTLO5uBhkTpP5lBdRzFJ6QndnQO1bNmU23uyijZsiJPfFzevd3qJSnChAbN1XRj54LHQWdk9VD28+HRfzeeqvOH4y86m2u9KPf4cXbX/Yloxz4U4NsFYGhQvCi7oPjFLfflQZ30kvN+/3vcv6E0gY02AuAVEaeHRLQ01dYB6dQpxP0pSpIpPZMX72kRRGHmqXIx8dGsYfZ9SnGez+YgzTlIp4BLZQvHE/9i9dGRyXjc31cQ6ORx9nktE8xfh6uTG3Sx8jEdQVmSeAn/jGh1RFh7QLa2PgMhcTctsZcJ6/fWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/574YRC021P9YMuvZiJW49bZoNFoEp500MFyFh8mis=;
 b=PslAfi3q56Xxvvgx5caXIXyE2bJC1/zbKsG4FAbEvLFis6LNA8sZOyIEWOEn2O3/80sUuqROIG9cvK+tJGh8oum2kejrWk96QSbLprDUkA7C69/jK2U1HtrcPRnicpWH5S1NIJE+5ZhveKeBcTAIZaT2+A6T30PGD2mK6AWEX8s=
Received: from DM5PR13CA0022.namprd13.prod.outlook.com (2603:10b6:3:23::32) by
 CH0PR02MB8027.namprd02.prod.outlook.com (2603:10b6:610:108::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Fri, 18 Feb
 2022 22:00:23 +0000
Received: from DM3NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:23::4) by DM5PR13CA0022.outlook.office365.com
 (2603:10b6:3:23::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.8 via Frontend
 Transport; Fri, 18 Feb 2022 22:00:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT043.mail.protection.outlook.com (10.13.4.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.19 via Frontend Transport; Fri, 18 Feb 2022 22:00:22 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 18 Feb 2022 14:00:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 18 Feb 2022 14:00:16 -0800
Received: from [10.23.120.168] (port=55473 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1nLBIW-0001e5-IO; Fri, 18 Feb 2022 14:00:16 -0800
Date: Fri, 18 Feb 2022 23:00:16 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 3/6] hw/misc: Add a model of the Xilinx ZynqMP CRF
Message-ID: <20220218150649.GB7092@toto>
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
 <20220203140141.310870-4-edgar.iglesias@gmail.com>
 <CAFEAcA9joHJr=tekZAV4fUX-y7nHcOq5JHTUFDFDhxpsFr1=ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9joHJr=tekZAV4fUX-y7nHcOq5JHTUFDFDhxpsFr1=ug@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8864b161-27bf-49f4-2a23-08d9f32a0f97
X-MS-TrafficTypeDiagnostic: CH0PR02MB8027:EE_|MN2PR02MB6685:EE_
X-Microsoft-Antispam-PRVS: <CH0PR02MB8027106BBCE15609D2F13CB2C2379@CH0PR02MB8027.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KP/zrI/4qjCgfV4MT45kOLY8C6ioOz2PTDM03aH7Ff40ecdyjD4DPshELIDGRjvIh4ohXpZ5TxxlR3xXL8Jc73j2th854e+qwfzFu8tMLoZG2Nlcl6gqeLrNhksv22VYI8Dz7Jc+6qBgKRXq2RqLbzFwosHQcV1+MiFl2cNBVMqvSTyOD+HqSW3Hn4JgtGTAC1wJsV1aKqNuZYDHBfFsvzecDPkQgTUlwZ7dCshjlyK4eBAh/SqiQ8k59r8laHL7Ec/FevkfmsxuBms2BIkgaHd0x4fEbtLSzqWisaxujJQcdH5g+VuTKIwfRLg43PdFoFW7Y4EMjZJiKZGq2IByXhO2NNOYMaUC+W7ONyt0FiIovtQ4nFOItGIBxsGXw6AMqXgxYZ6vgiaNfHNIj449f0V3WBb2t9A06WovHD9JWZ0eJ8GCYwV7D60uPeMQohq/KteKvOVqqiIHGqtDRk7cb7KacwpjZHMMx2LXLtALRbfR26aRS9rRdLuihJGV0ISv38+8LIHFDfYBv5WsqUUNvquUYlN1hUNBnYQPSolIqo7FlXMQ5j8gJfZKAgCE0ivQnnX7j7i7giXtJwj6GobttLSme0goKVi4Ng/tIFlj3LbIDE4NBIzCIF6dtesh4C39YBSshdAGOhkH3SWInTojX+8zQ2201fOAqo/TBCDnDsD4DJphWbCKcZ8xuOu0IMj8
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(46966006)(40470700004)(36840700001)(4326008)(6916009)(54906003)(356005)(186003)(7416002)(70206006)(5660300002)(9786002)(33716001)(8676002)(2906002)(7636003)(82310400004)(33656002)(70586007)(9686003)(40460700003)(508600001)(26005)(426003)(8936002)(107886003)(47076005)(336012)(36860700001)(316002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 22:00:22.4439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8864b161-27bf-49f4-2a23-08d9f32a0f97
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8027
X-OriginatorOrg: xilinx.com
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7ea9::60b
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7ea9::60b;
 envelope-from=edgar@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: luc@lmichel.fr, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 18, 2022 at 01:37:51PM +0000, Peter Maydell wrote:
> On Thu, 3 Feb 2022 at 14:01, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> >
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add a model of the Xilinx ZynqMP CRF. At the moment this
> > is mostly a stub model.
> >
> > Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> 
> 
> > +#define TYPE_XLNX_ZYNQMP_CRF "xlnx.zynqmp_crf"
> > +
> > +#define XILINX_CRF(obj) \
> > +     OBJECT_CHECK(XlnxZynqMPCRF, (obj), TYPE_XLNX_ZYNQMP_CRF)
> 
> We prefer the OBJECT_DECLARE_SIMPLE_TYPE rather than directly
> defining a cast macro these days. (It also provides a typedef
> for you, among other things.)
> 
> Apart from that, and dropping minimum_version_id_old,
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>

Thanks Peter and Luc for review comments.
Sorry, things have been very busy around here, I'll try to get a new version posted next week addressing all comments I've seen so far.

Best regards,
Edgar 

