Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FBC2CAD07
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:10:59 +0100 (CET)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBzD-00063G-Kj
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kkByM-0005SU-7o
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:10:02 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:32733)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kkByJ-000464-Su
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:10:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1606853399; x=1638389399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T/QFMuJZBcPc40IUB/tvteXWseuiBgwRNbqDmxo3XI4=;
 b=YDMzy7KroTcNFgDYXYQWD8qA5JAhEjSbqXTQsHy+kZ2IyqoDKnuHiCG0
 VAfUZvnO0mrQEfWdFThmYI/fJuH7zkkJ67V9YwgsiPIQ1mky0+C7LfX3H
 9kz0cyBJ01VETGaHACY5Jjcyg2uijniqYUs4xMQ4qxuXb5qpXUYuNPSRW k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Dec 2020 12:09:56 -0800
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 01 Dec 2020 12:09:56 -0800
Received: from nasanexm03c.na.qualcomm.com (10.85.0.106) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 12:09:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 1 Dec 2020 12:09:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LP0EiiRiV8VpSBRokkgwwlUgOO/n3PtfKRV+VWsVRJS+B+t+yHTqNPRUFv5FnKUpqzl8a7X7+xbV+tPgZpU/NGmnJgUJuG9V0y6au1tlCw9+SfIqjDmDJpPzsjMuWHblqJuZU+/M9bNcG0IzXVsreQdMDmMMGl7hR9X1ivQFtgn86FwyxDVIqNanKL1aPE2YvlTSQPYlsTzelpAT1yJbqhTtA/9ZmgOoZzGkdvFmNTrOjIclbf8TUiV4KXc1VGX+dI7UWG1FxF6ZPi8GMj6MnEqOvnVGJzXxrNssYVkZc6DQF4myQUigwHJEUES9HCWqEgHkglQiD/mQ07hgSyCFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kI5DkaO+hnmSc175dRr4Ojy9EMUik9q+t4o1K4C8Qw=;
 b=oZabI8/ArU4JZ+22yUGDLZTtZb/iC5cTyLBGTx3bjVEm/v0DigT3gXHfRNt3AyOWkonfWaj7b4hGxHekf9+Sp3TWFkLliunq5biIREP+FATjwFYXMVobCEnX/BZFAoi3Jw2VHpCoMWfsQrgXH4TZ6lTiA8vsg9S3Jb73NyFkBu/w0HrFn4GmaQ3Qo+57/RwrbU8KFOjn35Dryag4wX5NjckJG7/2eSh+iSGHO8aWGFBJ4DCPZqhDFpnWw5vnD9RUbBbGlR+ocsOS6no689ywbvm9CkXNXc4K7Z/q2JRc8GOfBkKnCRgIf4EDNU0fnnhxHlNOtyBWHyc2vobv6n5M5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kI5DkaO+hnmSc175dRr4Ojy9EMUik9q+t4o1K4C8Qw=;
 b=ANXyNqEk+vFv+SNrgZvno+DI0SMkH97EMdWgqsXGxx8V9kY5uSrpH+jDpEtFHIExyZEKEKyWx4iWn3dx4OC7Y0ki3mq1GW4yQiAjhfqgtT2aYruldXpPpsK5uCzy9PLSQjy3K1S7dRwhWPPhPFTceMdeVhRMPFYVavjKyVDMSVU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MWHPR0201MB3433.namprd02.prod.outlook.com
 (2603:10b6:301:7c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Tue, 1 Dec
 2020 20:09:54 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6%6]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 20:09:53 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] linux-user/elfload: Fix handling of pure BSS segments
Date: Tue,  1 Dec 2020 12:09:39 -0800
Message-ID: <20201201200939.19823-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118165206.2826-1-steplong@quicinc.com>
References: <20201118165206.2826-1-steplong@quicinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [24.24.203.211]
X-ClientProxiedBy: BY5PR17CA0054.namprd17.prod.outlook.com
 (2603:10b6:a03:167::31) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (24.24.203.211) by
 BY5PR17CA0054.namprd17.prod.outlook.com (2603:10b6:a03:167::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 1 Dec 2020 20:09:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2190e90c-0cb8-49ee-73e8-08d89635106d
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3433:
X-Microsoft-Antispam-PRVS: <MWHPR0201MB34330FF39CA2C2E04F0ECCB9C7F40@MWHPR0201MB3433.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m1D2GTChEOGHFD0AdRTuf65Y7Nzt+cht1zLVIjdvO8xkwxHqlu9OuzYA+yX+FZnk2HFwCzMLTFWFpiIF68t/v2nndW/SB2VHgArLUQkJiNK81zfjfewAeDzkJg2+9FLdNL3edWSn9390doSRrpTlso/Qyl/ZyUIQ5pckqkhz4Q/OHBI/gVzU492+ygVTVEHRSBaxtaPz2Rc0iJnbaytFBds5kQSqqkjR4UEmMlsRAHQWyw3oqYvWn6KAjBzSH4IJepr3XMF9qVZltmxQ10rVDEj7+zgQyFOacVf+bZ6z/JTXTnafJXfkp2yT6H9/rWEW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(366004)(346002)(396003)(4744005)(4326008)(36756003)(66556008)(6916009)(66476007)(66946007)(478600001)(1076003)(316002)(6666004)(6512007)(52116002)(6506007)(2906002)(26005)(2616005)(5660300002)(8676002)(16526019)(8936002)(186003)(86362001)(956004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?z3xA5RlXdFypsa5oAwfCGq0ZvR39BXQzxIHWktRIGCieDkguoSuB0Dbb0cf2?=
 =?us-ascii?Q?VsotCyleRuKYq2jFoyZ9r7qbSPIl+v63LYqhqMZ6w3ED4GErJaLQ2jeyVsQP?=
 =?us-ascii?Q?ukydJwL3euejnUOscEG8+440q2AmZ3zCExeZO0Bmy5oWOvwbAD8FewqT/dya?=
 =?us-ascii?Q?YIq3TW3XjBAekHADBgq8lCv+zd99x3L8P6dXBVXAM2a3rIhjUb9BvIiYltH1?=
 =?us-ascii?Q?FiIZ/Pd8KltXsdfbYJC5IJiy/FZixpeDNyWZo9wDzmRlpKT20XiF6VwU5QAH?=
 =?us-ascii?Q?2MzWd1+09eR5wdzF//kkyFryQ/iI0jDV+Ss5DHATTGK2yF2qpwWam0sE7+py?=
 =?us-ascii?Q?mAa+zNo/wXKvmJxIVTIIHz+Nu34SCNesE7bBjuwkrLzEXa3c/4s1oLSCk/Ow?=
 =?us-ascii?Q?4nJItfWJLd3SiddpQEYN3biopsPfjccEBZCbg7sd1Uv/xUx7U06VZbOnXWAh?=
 =?us-ascii?Q?eZEp/gC4RaDvz+HSthNpBoC5aKk/m/9tetg9q5H2OxqT7hfnwUZgKyn8MJu9?=
 =?us-ascii?Q?m5YtLpx2f+B2hUIYNMhgsxfvaCdsbL1MXOYGHISOzqFm7tmKgv9Zd4n9fKet?=
 =?us-ascii?Q?AQ6JYgTnA0Kr5t0ADp7PrhmcHMtCvVc+7bZSDX+NZoyRK+SReTA4feH5pRSH?=
 =?us-ascii?Q?hwpH2bTCNVEgJkEvpMLB528poC41yunklXoRZT3aechgduhuDjB+OdyFIHG1?=
 =?us-ascii?Q?UTz8zPwuE0bzzqIZZ2zzemDkUMg93yDyCBtejC0u155no6xA4gvNTH3ShZ/D?=
 =?us-ascii?Q?Ma4leDd8m2NrssSncNnU0+PIIM2MVfgR154xRidkt4ouJH0HSUxyhOKWWjjH?=
 =?us-ascii?Q?EXzBbs1u9tUegyEAWX9U4FPkw5dLTOdrXn2gq/Ob30CNW4A08p7vBBe32vcL?=
 =?us-ascii?Q?EV/vn28EGWYaV0rFIjWIre23k7dAWEs+n5JTpkuK7SNBMEJzkiHsJr0NtQ/E?=
 =?us-ascii?Q?OK2bu27IFADD60o23snKoa5LQBK5wboA8KBJNADNrzOkYei4FjDVg9kvsPlN?=
 =?us-ascii?Q?6t7A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2190e90c-0cb8-49ee-73e8-08d89635106d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3547.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 20:09:52.9594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndZEc7fNucIPVj4LLH1ymouzrtu3+ycBFrP0hOuXeDhP5Zc+jXNaHC+eeXf6rB9WcyErpahOdN9SZwypEIDxaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3433
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

>> Apologies for the unclear commit msg. I was also seeing a SIGSEGV in
>> zero_bss() with the binaries I was generating. I was using LLD to generate
>> the binaries. The binaries all had LOAD segments with a file size of
>> 0.
>
> How hairy is the generation of these binaries? If it's all doable with
> standard gcc/ldd command lines it would be useful to add them as a
> tcg/multiarch test case.

We are linking with an old version of musl. I was able to produce an
ELF with a LOAD segment just for the BSS with the following:

volatile int num;

int main(void) {
    return num;
}

and compiling it with just aarch64-linux-gnu-gcc -fuse-ld=lld -static and
linking with cross compiled musl v1.1.9 on Ubuntu. I tried it with glibc and
it has a bunch of non-BSS variables, so the data section gets created.

