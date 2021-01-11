Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D940B2F0F4B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 10:41:19 +0100 (CET)
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kythO-0003w1-HQ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 04:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kytg2-00038f-Ja
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:39:54 -0500
Received: from mail-oln040092253086.outbound.protection.outlook.com
 ([40.92.253.86]:6103 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kytfz-0004yN-VA
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:39:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUnpPFYN6gE5M0+UOBSCpCBds0AjNE7sHdY6IdF1XyJey2LcW/s9d/RCh9Iuh+vW/CyMX8eM3rOeTsxdA4GQNH9eHLS80tVgCS9gZRoUQEhKb65N7twTEQgwH0Z6AWfIobPUiDLqBJOZ0tMLIgXXwipUAtVu/dNCz8SGpIV4xKeR38n0dt/izn0+hejWe2QxQQAtjAk69GzuX7NMTv2E5/6TBIr4OGw10i5ccBrxyFqn5yVCWQS8dMI7ZscU+xi/JhZdH1MuwBO2HbwWI/YkvCsuTg8Adl3/QJZhhyMRezx7aGrc8VurjnaKqXyB8IztxezYMm23Ll8W5CcfzyYCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ke1PjGYmJzOnj/HJKFsJef5HvGHC7uQOqMolib8tDtE=;
 b=S37yjpEr+oiq+679u0DJdUiDob5RudANY1YRixeWkeUNwLStl7MH2Pb293uwnjgrICPZ8Y1th9ihPhMy+Ngr2gOYx8TFPzzODdhhHweL0ccAGhn2FaLQTLWs2CZOUT3clMm0GRoO6s1tLpPPeLqG2qLUqcUd+GyWZL3TvnouKA0h+x45r4qzQE4cQ+oktK+RabW54XYbqscyZiltjpVxbqPmXxZyiDnlumkmCilSF1KivIEolmElEWspa+n5KrwfALiiv83UuyO1qQOIUVhe8MlyeK9/DqyGuHlmyAjW5eB7v4TMW103O5Tb73ooakPubRS4kdJwayASh/ah2zNGFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ke1PjGYmJzOnj/HJKFsJef5HvGHC7uQOqMolib8tDtE=;
 b=NgJpF4DlhorE54cBMHRqO8+3T6a4KOEQabHCo8ZfXM1afdPXFRrKCFSzskiDRh8NZL1Pesb0qLb2AzA03ievkD2OzhvQjPDaCz5TaHFeEgBPygf9yAsaCAp2oCv4Cu+JwdofLebwNbSV/pTkgIrqavIzF8EM5hXIn3mSY4rGXKxmrF4bMY7w5Vw7pBAElAMrBuGXq4AWrXltUysByJclgFumnOQ5xBqPz0WieIPEUaPXtLRy7t+oeLSeYPmENJfHL0r6kR+cZcf09R/swqv+46RRXOg7DlqAFlwGCk2SYiMEV8L8B4fMfuSrFOMPQxieYjTMB704cL3feP05N9h9eQ==
Received: from SG2APC01FT054.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::50) by
 SG2APC01HT137.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::381)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 09:39:43 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebd::46) by SG2APC01FT054.mail.protection.outlook.com
 (2a01:111:e400:7ebd::246) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 09:39:43 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:FAB55FF2444BEAF2BDF8F9BE2C4CF0FE982FA439ED69B5D81965B1C94448DE23;
 UpperCasedChecksum:8843631270CA10E5C77E55BCC6145A381C43F44BC060BCCCC762819D7FD3C149;
 SizeAsReceived:8904; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 09:39:43 +0000
Message-ID: <SYCPR01MB35029A99852F6063CC7C644CFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Subject: Re: [PATCH v8 5/7] fuzz: set bits in operand of write/out to zero
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org
Date: Mon, 11 Jan 2021 17:39:30 +0800
In-Reply-To: <d3294c04-28c5-470a-d011-80dc975c7a62@redhat.com>
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <SYCPR01MB3502C84B6346A3E3DE708C7BFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <d3294c04-28c5-470a-d011-80dc975c7a62@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 8bit
X-TMN: [xGmq1Qcu+PLTQbdxfS+MlRxYqYZ3EsBz]
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <babe7c93e4a2f4cd097d65f8fa457c00ef5c6003.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (104.225.148.19) by
 SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 09:39:37 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 79ecf9e7-fc12-4485-f0d4-08d8b614d327
X-MS-TrafficTypeDiagnostic: SG2APC01HT137:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NRjppA/u5aREsqbkNqmj7gOf7jSeI18D4rE5/uvdHiCN0fcixS7cXuu/qOVCZMaxpbskBgWDCF2f2DXS92m+XYkGHhOJRV/A6HV/U5UJTYC26Nn2MbFpqgvtv4Bpm65W15HaFbrQem+L+Cjy1JNDTjHemjwp/EeS+vmgbWY4bfmiw53w0El9O3P3mAn+otlHDeqmTGTN641qn/xFeyNCbIfg/Fhr/0+8OXna19E07wO4NITM8JPi7VcivpcCP23EbFWOHwweR8Ww63asRRvlcXXfesgd9/nn9hj3CxJVvhw=
X-MS-Exchange-AntiSpam-MessageData: duXCweQ/BYWxt5zMsHLaJood2R8IKaQrtCjWtxlc1lyzA5FONR0qOqbQk87JmtV6phL8cO0w//92hfusalpcBH+JhgM6yGkVOnn6KG2GiZ2h3lD1MwEAAylnAh44T2sqSzHUPpSmiGzeD7CuXVVQVg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 09:39:42.9717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ecf9e7-fc12-4485-f0d4-08d8b614d327
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT137
Received-SPF: pass client-ip=40.92.253.86; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: thuth@redhat.com, darren.kenny@oracle.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-01-11 at 10:01 +0100, Philippe Mathieu-Daudé wrote:
> On 1/11/21 7:11 AM, Qiuhao Li wrote:
> > Simplifying the crash cases by opportunistically setting bits in
> > operands of
> > out/write to zero may help to debug, since usually bit one means
> > turn on or
> > trigger a function while zero is the default turn-off setting.
> > 
> > Tested Bug 1908062.
> 
> Please use the full link as reference:
> https://bugs.launchpad.net/qemu/+bug/1908062

Ok, should I submit a new version patch? Or just change the commit
messages and submit this series again?

Thank you.

> 
> (since this series is fully reviewed, can the
> maintainer applying the series do the change
> in place?)
> 
> Thanks,
> 
> Phil.
> 
> > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> > Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> > Tested-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  scripts/oss-fuzz/minimize_qtest_trace.py | 39
> > ++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> 
> 


