Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7578E2C302D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 19:49:54 +0100 (CET)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khdNx-0007Gz-1C
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 13:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1khdMS-0006Tw-Ft
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 13:48:20 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2845)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1khdMN-0005kl-Um
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 13:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1606243695; x=1637779695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EsmswQ5VpCgJlWtEONfAZh8ds7J66ahJ9xH7qTLOWfE=;
 b=TZsW4u8Srl4DgvXRvUCWjl9QbaipN8RUnRRUhiYgVVMhgbtpywfLwHhv
 w5Kz3iVNFibq5Uj+8pzgk0RT7TjZgNr0vwUy4JIvd5alnKGjdSPNP3noF
 D/Bmn01v8zFyTz5H8tOoAZjWZlkg7wvjeBCGBUgkLojLTpJmaY59IU8SA A=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Nov 2020 10:48:12 -0800
X-QCInternal: smtphost
Received: from nasanexm03b.na.qualcomm.com ([10.85.0.98])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 24 Nov 2020 10:48:09 -0800
Received: from nasanexm03d.na.qualcomm.com (10.85.0.91) by
 nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Nov 2020 10:48:08 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 24 Nov 2020 10:48:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmMsRF1HGwA+2PanbZufkpdDY8MM0CDv0TIV89Ss4GGjOQqxE6oF1+pQlDkw4WHH7CRKXHAng9SqW6edXwO+JcGTgvvZEbtWoZTiJSNZ485HWnR5KSkF3s4UDKNKNZ+NfWOrbia2JLcig7gSiJb9K6OdD6VYUTNsxjc4fc9DRXc3GesbgKt8nqkFNC6C/MyD1qE8PzqEY7ZRsx8r945JeogC8r7MtoD0SRitKS4MdZeUA6bbJOkB0Os5ZrF5YvVwrS1TWrVvyNAltwSgLM0qsrb3vL4QA6b1rM9IHg9f93kGQRYTEcfVNsBo0e6ZsQwOCSX2zFXuLkQp13WqJ5QqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6srmQV6EPvdSGEJ66jmu8buDHO3miEfAt94/ha7Tdiw=;
 b=g7AEGLGlFz5HzwN18QPuJUPo2f3NpzlaIKDueGF2GCKbRCvwfUj2TSKYGVZaXtTB0XPbv9ki+MTgdy/9tV23oYWcDTELI0WhDXq9N87aYG2tP1iULHbHkdFa43QZcRtJNHOIYSvLAQ53gDPObBqxuZBjN/rli5K5jth+9cXOd4EHikKCR0fCHFoFBvIch8j7Lr+PIotKhSvoGjwYFqO9mR9SgQ8G793KPN4G7Cp8k7CBpDBPw02Gi831JxjiuKoq78cGRtKUlxH2QUdnS23UtDFugJQdZyTUhVAi+AMjN7bcOgD2GkOd4Skv8p5JY5qN5EF4UCjQSkXW2eFPd16bkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6srmQV6EPvdSGEJ66jmu8buDHO3miEfAt94/ha7Tdiw=;
 b=VHR+LZClZBWP6DHV5LE9eL3OBDTdX3zGUt+y2cleQOHbCLJtiUfGjUVLqiWY/Ci6Wy9S/dlZOEB3R4gkEYPuaJ4ZjaHKMtyFBxzm+rTMLNQSJi+n0qFfY4Od2Z2VNxFTHjMMnWVSJVWXIowwevoxBkp0p78QsytPrR6ll+MkEns=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by CO6PR02MB7780.namprd02.prod.outlook.com
 (2603:10b6:303:ac::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 18:48:07 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6%7]) with mapi id 15.20.3564.028; Tue, 24 Nov 2020
 18:48:07 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: Re: Re: [PATCH] linux-user/elfload: Fix handling of pure BSS segments
Date: Tue, 24 Nov 2020 10:47:54 -0800
Message-ID: <20201124184754.247-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118165206.2826-1-steplong@quicinc.com>
References: <20201118165206.2826-1-steplong@quicinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [24.24.203.211]
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (24.24.203.211) by
 SJ0PR05CA0025.namprd05.prod.outlook.com (2603:10b6:a03:33b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.13 via Frontend
 Transport; Tue, 24 Nov 2020 18:48:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7979b363-4a17-43b8-2a84-08d890a97b7f
X-MS-TrafficTypeDiagnostic: CO6PR02MB7780:
X-Microsoft-Antispam-PRVS: <CO6PR02MB7780FB677B9D43375088188BC7FB0@CO6PR02MB7780.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T+OeXbfQCQsy2vF4jOGiN3sUFFtm2OnzhOMhl7B4/m/WUUiYI2LG26r8gOd9MiaeUm0GQGWizFi5WUyL5jz4XwHJhpe7NRxgpP+PEQXANdqt0HE0gE6H0tX54RY7KRXwm0PMzTGGpMqTtqHGZpoN8qFKJCLPCzBTHhEJFi/WyYAX0HkBgaNINH9pDXYWHL2/8PPHIBRFJmux10IWmoL6zVY/OIX5Y39C3pmQ6hcEe4deg8AVElP+u79Hp7xtljaaFJ3evvOnNo9Nbg+8LJiGkQGEXuyNhKSdpWBFdYaccuPN7lyv3d6Y41w0Elva41uiEWdQlBEP4WZqKZbvTidgJEf7P6xpQ56ooSYWe4zhppYJFdGPLN34JQMmfUuNv5/liik68sHNDH3ot71THKj5cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(376002)(39860400002)(366004)(5660300002)(2906002)(6512007)(52116002)(8936002)(1076003)(4326008)(8676002)(86362001)(6486002)(66476007)(186003)(66946007)(478600001)(2616005)(6506007)(26005)(36756003)(66556008)(956004)(6666004)(16526019)(6916009)(966005)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IGp1NHUKNpYmBnSE+ApsEVizmE1zAwrRn6FC/Gc+xc4DnVwtijbG9gFzEPjH?=
 =?us-ascii?Q?fb9VRSyJEKxvHz6d9kcznqKM9HiCKKOdMBJuTeD2Kc4+tEWGnw6c3966i4S2?=
 =?us-ascii?Q?n91RHvZxifmg77Y/l0szavMVd3ZGVj/kVrcW+tequU+IazAfFRpL5mmBV8o8?=
 =?us-ascii?Q?HFsJ9dEx+QjU227Kh2YDgHQcozY/b/EmxdPFrFEXFuIIo4WBSCYEqKXGZ85z?=
 =?us-ascii?Q?+5yFqfgczJJOzzkK3FCOpxD+OFRGhGclnqLf6lLrO5qxDNQByNQuaDdosQIu?=
 =?us-ascii?Q?7r39NiDw6jyOnzvUyFqdsqGu6VU4Qf0Tn7nRk+rWvoeS0pvuu7PHB6lllKiy?=
 =?us-ascii?Q?KaWL0mQlED1mC0hZ46PxC0dLEE511dFGpmzbF60N+MOnZFehISJi877sKq9l?=
 =?us-ascii?Q?fvzxjOLkM26Mi/IUmOEIPlkJx9T7eej+lCKarPCpHFLDfK/jAI35M6XoJCx2?=
 =?us-ascii?Q?6UPgG8Y//E0Mf57YUCJzsbnZSWCJNTNMT8wYrNhqh/jRTNrnGm3jsJzcIU0G?=
 =?us-ascii?Q?WfkggWKJnM2fVzLKP6HUiB2LVMzWl9WfPbxMfZ4mdjSF5RNDietIgGATfNyt?=
 =?us-ascii?Q?rILz6wWs1/p2MfgdKg4lDrYBf2uEfQU4Z80wvc5gGSWr7RLCHa/ffZ6wBmg5?=
 =?us-ascii?Q?Oluxr7s+Drj61fAzRgIwVDWwOyb1NXucmR87bK6o/rL7alwNBSV2dMrbNXPh?=
 =?us-ascii?Q?ZHH00t9B6UIJOoPBTewGhLGX60ljBvPGj9WTkJ2uqRLTmwTd4uaEs5/HIKDR?=
 =?us-ascii?Q?pkVnFXiFVyhglLueoSXoJz4rVs7npmDshvOYwNpYaW6Rladfr0o/j2/eme0b?=
 =?us-ascii?Q?OLrwOPBYGYRv1uszS4HTzpfD9ZjCbDRQvhtQ/2imwvAlnWyEf5V5VRIxIXpr?=
 =?us-ascii?Q?Uo8hEg0J64dgJEcxk99l/+pa7c5wQfcR+Zas8iNVwCO/ZmMTCXEflmCQiidc?=
 =?us-ascii?Q?c3XwrKeEf7QysysRSzcieC66BqCQ0ThPZYKIzMT5dVuu/xCGKwopRpj3Nc3w?=
 =?us-ascii?Q?SC88?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7979b363-4a17-43b8-2a84-08d890a97b7f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3547.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 18:48:07.2497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhHbVXtkH0o+oJeGwmtgLZ+AVnQsbV1PUS/BHfFC7qlQbgQuyT//JJiDDqXIlg9JD+Kj3kVmhN+bj1Q6RIEBBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7780
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
 laurent@vivier.eu, philippe.mathieu.daude@gmail.com, ben@decadent.org.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter, 

> (a) what does "fails to load" mean here? In the sample binary
> I had, we got a SIGSEGV in zero_bss() when it tried to memset()
> memory that hadn't been mmap()ed. Is that the only failure mode,
> or can this manifest in other ways too?

Apologies for the unclear commit msg. I was also seeing a SIGSEGV in
zero_bss() with the binaries I was generating. I was using LLD to generate
the binaries. The binaries all had LOAD segments with a file size of 0.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=919921 was the thread that
Philippe pointed me to with the requested change that solved my issue.

> (b) The comment immediately before this change says:
>    * Some segments may be completely empty without any backing file
>    * segment, in that case just let zero_bss allocate an empty buffer
>    * for it.
> which is justifying why it was looking at p_filesz and not vaddr_len.
> With this change to the code, the comment becomes stale and needs
> updating.

I'll update the comment and the commit msg if this change makes sense to
everybody.

> (c) After this change, are there still cases where zero_bss()
> needs to do its mmap()/page_set_flags(), or does that become
> unnecessary ?

Maybe someone else can speak to this. But, you might be right. I don't see
this being necessary anymore.

Thanks,
Stephen

