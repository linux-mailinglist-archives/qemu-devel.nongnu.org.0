Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E572AE05D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:58:12 +0100 (CET)
Received: from localhost ([::1]:45020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZmN-00029K-6j
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kcZjy-000119-9t
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:55:42 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:54453)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kcZjv-0003Ny-Mc
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1605038139; x=1636574139;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=jef7AVaFT3+7uMyJWamQD+zPtBpOfTnSqaVGMt3emC8=;
 b=qxLYIZBk/9zhgFS7/W1OYLfhd1ZJ/motZIG1e+kCREVV1uBaEZXPCzok
 bJDzTK7ZYEW6qsvxImJeH9TpAwyD3Blf7jHvFk08q2II5+bgqkKhtsIGH
 clA3cHUDizctHwZ2SIF/d5xYJTIb+/fMUOJn3is/cFlught5KxRrF7vJ9 s=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Nov 2020 11:55:35 -0800
X-QCInternal: smtphost
Received: from nasanexm03c.na.qualcomm.com ([10.85.0.106])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 10 Nov 2020 11:55:35 -0800
Received: from nasanexm03e.na.qualcomm.com (10.85.0.48) by
 nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 11:55:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 10 Nov 2020 11:55:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXboookuPLEnB/3F55N3Nez7U9o3uhFPIgL5yIJUGohUne9XVRDmWaLyv5fut7DBP4HkZWtiilIEzijUcskQpH1Cg69fAqFAP0RfFXbmYYKT20tgk7CtqbhBfoV6CKZVdAkhgaDmkEYS18cILwUV+4LonIXqmFbaP41bpu/pFl9J884Hfx91n4U+RTrn1aN+UjVQ0R5RFoRsOGMthQ/fz2QyyPhmlHIrVnUpES4n9Bs7utrVugzpgXI+LE9c7xxhWWdJ3lC2tzBTIteUn4HWjV7Mx4RIbFK/TCvpX6ZvUW+hYSQbZxS2zqVMApIjjG+aicRLnkd9VZ0Mqc3uzkLPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jef7AVaFT3+7uMyJWamQD+zPtBpOfTnSqaVGMt3emC8=;
 b=UZxEWxF9fi63FsECagVE73JLwTXKnWUI9YgWcpQ0PlUhiIYZjHbZfnoHg3BIW2MHjULYRC2hv7ORKCEQTq5sYQurcDCtS+wctiB52mAppV7ISjQMsO+DFzhgrRcx/OsHYqP7Jirp/jaGkJ1Vs7in0X8K/QhQLNWn4OAp//mCCysw+XQw+XQ/rOPMlEEiktj7hQXxV5E7gkIua6oJSl/YgsrygQFIYfzLZCXtpHKWcZDp4/sbrPBrs/V97S6qsiqz64FwK66tB4AUo4E95iGEhFSlQSAcRajcpNR1HvpGlMS61K2VxhEE5qvTAPdPUdiVYYAx+1tb4yTfCXqy9hfYrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jef7AVaFT3+7uMyJWamQD+zPtBpOfTnSqaVGMt3emC8=;
 b=ER3+s9fiNT3K3xdC8ZvySQjG2kx8KCZ9pqXwQfaQ/XgmgIYyOZdieoGWd5bm1rqKix2wI91lYjwBZLezG+uvD4O764R0HSESPG7rsaAMNfhGirpAHJo7fdWXPhFbTxtDfjNssj7aUv7C4LQ0l5dX0AURUUvdMvwRUvA6+K26n8g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MW2PR02MB3820.namprd02.prod.outlook.com
 (2603:10b6:907:c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Tue, 10 Nov
 2020 19:55:29 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::dda2:8e04:fb37:ea4c]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::dda2:8e04:fb37:ea4c%7]) with mapi id 15.20.3477.038; Tue, 10 Nov 2020
 19:55:29 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 00/81] target/arm: Implement SVE2
Date: Tue, 10 Nov 2020 11:55:13 -0800
Message-ID: <20201110195513.340-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918183751.2787647-1-richard.henderson@linaro.org>
References: <20200918183751.2787647-1-richard.henderson@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [24.24.203.211]
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (24.24.203.211) by
 SJ0PR03CA0113.namprd03.prod.outlook.com (2603:10b6:a03:333::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Tue, 10 Nov 2020 19:55:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d97568f-c698-46ae-6f66-08d885b29297
X-MS-TrafficTypeDiagnostic: MW2PR02MB3820:
X-Microsoft-Antispam-PRVS: <MW2PR02MB3820360615A1F437FB0A1DA4C7E90@MW2PR02MB3820.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6KM+5Y616uO4v7c364zpCk10yacISmoI5IqVMBy0RY8vf2RGslrm6gFsBTpag4vVtc6Owo+Wdv2ue856emU4M426DK1ukf5uzS16IQhkEK8tjq5Q2w35DELRkCxMuHYLriVwCcKsTmiDCSfVfhRkq4NGF3f+WWoIJxeuK1l7Gt+2kzU6Vh3+6rI6t2I4iVSdOX/G6GMtz+Z7ft11BTV+zM4eOmzkL/aGjE8uFWQ/AW970+cc12dc50zKI0oxJlrgmUho1ABZSSym/lEMOh3R2iYNr/7XZbyjFR0DDm3Ph6Q7dcFhoJxLu15sNDEOGOIq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(39860400002)(376002)(366004)(1076003)(6666004)(66946007)(6486002)(5660300002)(478600001)(52116002)(2616005)(26005)(316002)(6512007)(4270600006)(6506007)(558084003)(8676002)(16526019)(186003)(36756003)(956004)(86362001)(6916009)(2906002)(8936002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: FLU9rHkosG86OlSY3PBTx49Gp4ekVFf4UxztLU038WSh0u36vVCsaIKkfvDTZCiFWMG8kdNMiHyJELxhCxHFQSIfz2QzsVeufMuFdPHFWr0OVJe2PyHcR6b7ZSK/LfqNRkTlGvoVHfFv9VmAU9qWs97pyVhgj3FXHUE11/LeUY6hzqzmcqyZpd0+cLSdH8NMqOZxk2ESXG3eLmYjwWN0N3Zm66TsrFMi6BcD+lvkxlyn8J7P601uoh1FGw5cRPMotfL/6K2Mn6+Beb6cwwBdAP+RN8Sd76LQSRC8YblxpEa1VX6xqL0G8Lvnol/HCKUIotg6ho8u4KzuvPL98+lpVJiwulY5DCrz6NXUR76FQoOgZKP01BWCLX+LSkqcm4x2nrOgBkmQwWDSLI+0rIboWsi7VaOFPXMaDpAyj1Xd8LwKdW536Wf/VxuXpzRipNvIIg0P96RcLAkeYseuUlXsOlcYl+SV7MCt5mXKL5DfCV/MGGFNGMqWZ3pNEEWzmzDmlOVXF+54bVfiQ2Cp1GwUq3KLGmPzA9CldEJIq/nPGg1d+r2Bwo8DK3HUGO/IGoV2y87mxmeSZn0BddQ3/bbD8IYK0YQGVFWlhQRUYzhSGGZqq0qQUczcknaevdRDGUuubHjydA6XAxx3Qvox6lNtIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d97568f-c698-46ae-6f66-08d885b29297
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3547.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 19:55:29.1431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eq/gb5dUI67qggXRaT+WGf5h5uFVhlDYr3Y3IfuNUsDnL8NK5zuHtQ3xzBbRXLVemWUp5xst2whgXuQuT/tbwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3820
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.38; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 14:55:36
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard, what's the plan to get this patch series into master?

Thanks,
Stephen

