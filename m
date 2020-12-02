Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9BA2CC33E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 18:16:52 +0100 (CET)
Received: from localhost ([::1]:59262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkVkJ-0001Xc-G8
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 12:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kkViW-0000m8-VW
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:15:01 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:28523)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kkViT-0006PF-TN
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1606929297; x=1638465297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ngupwuwM+q88CtYo7dXHXvml+gj+JqNKjNgMWag21Fs=;
 b=QKfvYiBJSFl3gNybWjtOVY8qYMN0W6Oah+NH0OPkg6DT4zMJGiMSAXYq
 i4vDt87Q2OSJm4rwHU6PKxRcBMxgi/B89Z7NZW3flmYaF8+dFk7li4MRq
 W/7XtDORrUj9RI6WpPD/hz2YIT2J/80ppVxkdsVcWerlyqFIz7H4Sb56w U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Dec 2020 09:14:55 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 02 Dec 2020 09:14:55 -0800
Received: from nasanexm03d.na.qualcomm.com (10.85.0.91) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 09:14:55 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 2 Dec 2020 09:14:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkY5a2nQ7qvbUuFh5pLwzsv1BuCel8nVpfDBHDrFQm9jYj6qsEAGde7pSzzXV5xV0NYNMZnAL8oiPiVggalfIiARX9esgm3bFDbJ0b8H2Fw8By8FGfOwQTe+E31dktX3Qx9ugi6QF3DGD+bMXDeWxLp+mk5qZ5rTkbUTjY2GHI5/ZlJg8ZxW4VN/AcdjJ1XYnWuLo6CCA+Jdu1oycaxK+cMrVPAvWkff3AcroXoavagV57dtt6B+JrGYqS0f4fC1J3PNGQD5b7SHRW5QGUc+Na7uBNjSRWPvOT14S0WQTJrKI5ZhJAMPZAcp1oDngOccc1U+FH4lZ5i8nDP8rR5D3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngupwuwM+q88CtYo7dXHXvml+gj+JqNKjNgMWag21Fs=;
 b=MiGauZXf5xD8/hi2NzNBrk931OOK31U9f+wAoOGP74qrK33Bvgv9xph+C3xXhfv1T/fmxFYgeqvSx/UKUtiO1R+JCDaYq89ZZpk8f7DjzC+TTqXHpsaCp9aT5CgeiVHqEluB15PjM+lavhfT9ftK0pwrL3k1C0O64/NC1dUT/dVXmJfDl4NHueEKN8r5YmkPBBdynJ7A5yg+6jR3Q01Nu1tnztPxIZzaElCfofy66GFJiJDQYVNYIaYWTE7O3M34F0lzmFWnDBFUwUK6Kx9uVsD5GnzWuz0SwMdPUil4wX1iDf2ZVe8FUHrMOmQBNjDTtQVluN6lriQdVS+2T4Je8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngupwuwM+q88CtYo7dXHXvml+gj+JqNKjNgMWag21Fs=;
 b=CzQcQyrKLXnL0C/9mM6eZKkLawLCu9dPDrVsyy4BQ9vhWSGi5lVsiu59Ew+2PtbYGg2jDN3zIB/EWGaWgnoZEYROOQJGZsJ7NiHj+h56jyy16LNgHNH4tk1tt6yxxzLy9+0IrGrQgASJX5Sqt/gVfff/DVlgjy5z+Ta9EISuBlU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MW4PR02MB7265.namprd02.prod.outlook.com
 (2603:10b6:303:7f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 17:14:53 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6%6]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 17:14:53 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] linux-user/elfload: Fix handling of pure BSS segments
Date: Wed,  2 Dec 2020 09:14:41 -0800
Message-ID: <20201202171441.1327-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118165206.2826-1-steplong@quicinc.com>
References: <20201118165206.2826-1-steplong@quicinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [24.24.203.211]
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (24.24.203.211) by
 SJ0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:a03:333::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 17:14:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7ceb585-8ecd-4813-5eee-08d896e5c8b1
X-MS-TrafficTypeDiagnostic: MW4PR02MB7265:
X-Microsoft-Antispam-PRVS: <MW4PR02MB7265F2A9C3A93B881597C6A8C7F30@MW4PR02MB7265.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xteiH9TsyeFD7CpdymCIyaYoaCXic+MyK0jzaTufC4qnLhWcpbX7lkoCFUQHQa5FpxqaCYjG5MO+bmAiR0X26NV2TMcgChgExx2z4GDqNsLt4uT7AweGVswxMaL/c1QjHud58EP3zL10Br+aBCRoVH652gCIUQcVFNWOFOPNJuROf2O+CakNJr7g1s6DyFMSws5a5ckEP4f4weXn8pJRLlB/SW1vI9C64aqsw7qnhYl5hWwxVdPa3SUhyv3QE9eICSvlBOvJmiH8o52b5GecMYNkSv7l1/pir+z4dA1D51hwEuqPPpVyI4y1S1yX+yU0IOfTyHn3cgvXoN/+GvLNXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(39860400002)(376002)(346002)(6486002)(5660300002)(66476007)(36756003)(66946007)(66556008)(8936002)(956004)(6666004)(4744005)(1076003)(8676002)(478600001)(86362001)(2906002)(26005)(6512007)(186003)(4326008)(16526019)(6916009)(2616005)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Tn9vEooyq8ZSOXIUl/CatwASFX8FZZ3sJmFDRhnu0N4EmsF1HbXsKB+wwboa?=
 =?us-ascii?Q?Cw0C2xJrKKU/0ap8xXyuZwfbp+k+L/WlOGnuvLWx0A7KTS+cOP1ff6n9p7mX?=
 =?us-ascii?Q?sgn3mHi/UAHKzkoEavp+jgYZ6nfFAKJxf+Zv59dusDZm2+8252rMVkmT+PZa?=
 =?us-ascii?Q?mCA95KqvG4/AVjiSm1OfqacqUG75Q/mMREsek7ckbIzmayuXChCfaLgfqI8X?=
 =?us-ascii?Q?nQZIFrwnSfVUVBr/zw4oMm0tY/2HoqphMbgChVFSFDo3ZjjcL1ihjiBbSAgh?=
 =?us-ascii?Q?wK+q+jOWyT2ovAG5N2LseJ7c9w+irCsDEJpsmJEPqXkNfnfvO7lWKmtoCvWy?=
 =?us-ascii?Q?GOhjdz7r0/gaGX9s1zeLDccMZiMMylP5DrHV/5QibzgS8bRLZzuSEK/eX2xz?=
 =?us-ascii?Q?395f6HcgmG0lj8HeB0AbgQAdqCAeLJG05rR0XPwCio8Yqg+9FFrteqPXpwnN?=
 =?us-ascii?Q?/W3gtLATc/87BCOYxoFvAk08I//NXzRautuy20mPCXrQodns8Xt8hZ3Rjqmt?=
 =?us-ascii?Q?+Ij+QZZUytlL9SfYHL1D5cy8lMnIG/RUw2uyuNPxViouG1E7sHXLwFT2B/U5?=
 =?us-ascii?Q?RDaO2gxRZUyk+UcBGpYepportSD37LjiaH6HxqQb1tvyzLmFjMftCPuyZawD?=
 =?us-ascii?Q?UzmartqS/hofx0fhSHshA5bGFwVFsgk8+MfeJGYjKdMDWzKbv9q/3mMIvKy0?=
 =?us-ascii?Q?gzFSQZYqirLLCsOlATo8auuqHpCiFpis6IoUvV2sEJX4zeE3jLLt1QGXDOZq?=
 =?us-ascii?Q?MPK5/vvekPPWYjdv5xl1EBczoIpZmSdfp3AUO8wNenHlPhtYaAnbZLvs/PkP?=
 =?us-ascii?Q?rn8tnimFTJKa2G1HLYLHdVIv7NUajyJYWDEAdqLQm4fq4GnT3PxVzvda8ZKs?=
 =?us-ascii?Q?NYztyZMHG8ZLeN6QXvhT55diM5pbFwcQrCYFMQR3dOxFT+maLW1GpTfSNVzC?=
 =?us-ascii?Q?39YzNd+19HNDrnm2hxj/hqYm10kfn/pYjjsOtfzMhJFndxPwx4dt1gAUqphV?=
 =?us-ascii?Q?dX4s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ceb585-8ecd-4813-5eee-08d896e5c8b1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3547.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 17:14:53.5177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBr8ZhyDIalMwO/i7Q9JaKC9YtdZnIvEnfTNyClipM+fqiIXRxL0yTqncpZZvgkkWYpA8xq5+v9cECmqxg3tlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7265
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.39; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, mjt@tls.msk.ru,
 laurent@vivier.eu, alex.bennee@linaro.org, philippe.mathieu.daude@gmail.com,
 ben@decadent.org.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Bennee <alex.bennee@linaro.org> writes:

> Hmm I tried the following patch but evidently there is more to be done
> to convince it:

> collect2: fatal error: cannot find 'ld'

Oh, I'm using ld.lld-10. aarch64-linux-gnu-gcc -B/usr/lib/llvm-10/bin works for
me. You'll have to get the necessary packages for lld-10 and point gcc to
where it lives.

