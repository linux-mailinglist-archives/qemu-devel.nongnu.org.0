Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE7A478DF8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:41:28 +0100 (CET)
Received: from localhost ([::1]:55138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEQJ-0007PA-FL
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:41:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myENB-00053A-J8
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:38:13 -0500
Received: from mail-bn8nam12on2102.outbound.protection.outlook.com
 ([40.107.237.102]:4416 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myEN4-00070Q-IW
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:38:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqN8iSlqHx0WgTmLWYwQg4fv/mrusesh+sgp2He/gTkar98WacxXn2ITMPW/PLM40QuPu7NpH1Sd1ODC/BpZNBiycA8PnIzjfu1ROFNZip5FPZQ/sK58tRuEk9GZg96sc6MizddbzcbP14F5zZ1vca3fuB9GlMRP1bvFMwbwpOnFvyM6H/4huTW6g9s5oxdVAAlP5soyQFFjRH+glKBFoQiIghL7BoBawQNOMv4afJG6SC6I4JSyXdrK3slqBCVmduhhnzayfLqqck2b4U/K78tPIZPOBxg7qdHfGrQIz9AVEMkn0amAnjNIpe/MiuQYNbW0Zc9WZeACZoJeL2oCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f07iEKfczjv5EqP+wNDlpd5IkuiiNkcyYVPQ3JdwVXs=;
 b=jmgt+Qh8Akd22mxsajkxWG0IOh1XQDdIlxMonPY+hLsdOXpBvnQukXDt1SgrXG8L0og/t2mUfEbP3aqkCxC2N2iAXEaTPpobmJcQXQVl/bhu//L+lJuMSy5iNmI4oPb/OHm9QdVHUYnlAXx/d4Ozr5IFEgbIV7Q1rarqYxGYZeAivIFFA39jHhWw4e9R2ZO3CYKsYRHKSFfR89Mmy3T0hztMMBLU19ubIq7vOaeBUDMGzTsCQvlcr11InCWZsxMtURENA1A6ycO6sOI3/gM0UMV6wapjdGoDpcoxUngLOXSZEM1fuUeUhbyXrLa8ycNoe7bl5JNs/sxucN1v9wA1dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f07iEKfczjv5EqP+wNDlpd5IkuiiNkcyYVPQ3JdwVXs=;
 b=nUPZMMR6j7UP0RR/JvRtpCaKiOOF1UXwFQbrUSEwgUeTvyg8dbCO+HIdGYFumPzN9t67NN5LY2Ym27qDPhwPLIaDxSRtV6aylrvUCQzCRMSoHiXuf6apMXle5arAXr3Fq/FGUzUv3SndfSV0c9JI/MXrD9iBUQCl+C8yRGKy2K+hGzaGUYP2PKDg3ePWQfOHlfIjvsIgHleE1cnayPD5dvtC8xj0MBhkYSOERVON6iM/oqcKDudBFGOKdmJDX3zFPIRkztF3C5Ruw5+j8xXNuWAg53MiKqvLUZjc1cdfB64MYM+ur34Qel+I8lIBAL8u3ITt5c8dIHpjwxzXsDYtKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Fri, 17 Dec
 2021 14:38:03 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::6cf1:fa6a:fb65:131]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::6cf1:fa6a:fb65:131%3]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 14:38:03 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/2] Attempt to fix DMA reentrancy issues
Date: Fri, 17 Dec 2021 09:37:48 -0500
Message-Id: <20211217143750.50641-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0305.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::10) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a8703c0-ca31-40bc-5121-08d9c16ad4ae
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:EE_
X-Microsoft-Antispam-PRVS: <SA2PR03MB5724028F8A7A030417735306BA789@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5X5P2IS8gmVbokid7LLwzTPDTMz00W0XWUqbK6TIsF0jhHG/YTN807sjebOK92srh7bPbSXOndv/eTSg0COaqBLBynxVWEW8Hrm7ah79sfu+C/wngVlLredvMs50VGPB42VaDnzaWeh0cALBlfsI1eYqi/rPnj6XwegQDlEw2T2vYZM1UGNHkUPA/MNG2SDPmybPsriOOEVu11wBfY7C2UxzwIVS0l79zGUtNkUVcFL7OFvlquZ8QNFSXXN9CfDJiD6NMl0PugWjb8OsUE/9VM61Em3Tg5n+78/kX6HVPq7XPuS7leOf/ou5vYRD3tqzwLSsZD+wj+rBuJDPNK62gFkjDPuIkZdGwc+qblNqRyswBuAAOSkN6SIsowUgXJLCZANIhAOGkX74nfihz6/Bf9qEXq9gJn2jtx3ZYlRoOgSoxoNe/PvxW421cz1Chrvz5aJ//L+5fP5iQre1o2N73lO3yOElwMuUFD10hbl2XtdrPGEQBoOX6NffwouS3XI+T1jd2E2yt3bj3zb9XAjYfTp91yMIaYnsuxDNMknZrKD93/IfurTr6lIZD56+aYinobPdF4UNVW3QetGsBILUOWNEv+CJ5a1+gj7lps7gjPM/WZmCaFZfTVWP+Jb1IaMXumgGl/FLImzmAK+I0X48TUZrKf7Jbfjq9S0luENoLqyMINb3b21jG06ZgwgpqV92
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(66476007)(1076003)(4326008)(316002)(6512007)(36756003)(786003)(7416002)(54906003)(66556008)(26005)(5660300002)(66946007)(75432002)(83380400001)(8936002)(508600001)(38350700002)(45080400002)(38100700002)(86362001)(52116002)(186003)(6916009)(6486002)(2616005)(6506007)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXNwY2h3cW4zRERSckZVb3hhVkZHekRJUnIzYTBCMlF0dzUxZTVWc2RCUk90?=
 =?utf-8?B?NDVsSjhPNUd2U0RJSnFWQnpiL2EvTUExZTNMd3JZQy9HUnNBcVUrcDBFVlRX?=
 =?utf-8?B?aUhGSWpqSiswcXRTVm9iUmJTTGM1YWxQNTJwUDBRNVB3VTZTUDg0KzFtMjRH?=
 =?utf-8?B?Z2lic0NNeE9YbXBLT2M3MTN4TTFsZkpCL1NrSE4wLzBKaXZBU2VqWFZuYzQ0?=
 =?utf-8?B?VUMxa240ZWxON2tSVm5ta1hyczkrUWl3cEZEN2dCYmdVZnd3U2txQTZqZGda?=
 =?utf-8?B?RklPL1ZMYldob3hFKzE2R0hrRHBWcVRMUDBwMUxIN0tZWkVqZnM1ZC9BdDVp?=
 =?utf-8?B?YmRTd2ZGN2JzWm0rSk1VSmdVYTNMZnNwSm1vZU85RUJGSDZlZzdVMnVSZ1lv?=
 =?utf-8?B?U25JUFBCUllocWFUenBmOUtiZHhvL0FOYnVKQWN4RHR0L3ZneXo0T3lOL1BH?=
 =?utf-8?B?VFhuS1ExYWRFck1MTGhIakU1aXdNWDhjdDJhNEd4ek1jbW5IMjM5ak9UY2l1?=
 =?utf-8?B?bkdrZVVtVjA4dDZGN0h1eCtRZWdDd3JBa0JPSVRwTWh6eWtOL2J2MXRML1ZJ?=
 =?utf-8?B?WVdqbzQ4dUFkTHRUcHlWRUVzLzFJeStKTjArdTZTYisyR3VDN2lzbnpGQ05Y?=
 =?utf-8?B?a2M3N2ZGSWNHbEdHQ3RTb1UzNW1WQTJ6ZnpCKzJRanhjVDE4VkxHTExkd1Ba?=
 =?utf-8?B?dUZVTHlxTnA4UysrR1R4eFNsMEhLUllPMTdNRktnSDB3WlcvTWlaVWhZOUkv?=
 =?utf-8?B?UEpxenplRnlEeUp5aml0dkhFQTRHZWNDdll0cDhVNUhOZmNHaHd3SnVsbDMz?=
 =?utf-8?B?VEZna0hheU9NY3JDUmdFL0pTSE1wZjVpNHlnMmxsa2NoWW1iaGJlc1pIbFky?=
 =?utf-8?B?TTJpeXVnY2RNR2g2S2lFN2owd3k0K3Z1NFNsUHc1cy9YejdKK3lRcHhlVDNZ?=
 =?utf-8?B?NE5jTTNmS1pxSzBhK3JBTWVuWnJpNnYyVlZzdVMwOUZGN3k3YVR0WC9ISWdM?=
 =?utf-8?B?Z0tnbEh4dEdrbXpGbHV0em5LR1dmSDFCUE9sNWhHSGJMTDZVMmJMalhUTHZy?=
 =?utf-8?B?LzlFYUlEWGx4K1ZyZmprbVhUVlc2VmM1bFBBcDBRbThqU0k3TTZzcENHSmMr?=
 =?utf-8?B?RkNPQVFsTmVoNE1zWDBvTUZZMkJMdFZ4YlhiMVA4U01BVkZjVFpYcjg3Qy9P?=
 =?utf-8?B?K0M4dmFxUHpaUVBhODg1Z0JQNmJnemZSZ1dVR2VZeDZSSEg4QmxkbFFLWjI2?=
 =?utf-8?B?S2ltWFVCY2FHb2VDNmgxcE9ONkZIQkV1YkZLMDZiVjd5bE9pZE82dnZhOXhH?=
 =?utf-8?B?eFljd1VzSUhCRmRKbUVwQjd3QVp6elVzcnUzQWdVdXhDU0l1RmF4d0JkQnlx?=
 =?utf-8?B?NmpLR3k3V0ZFYTJEK2tXSVhoZGQrcitMNjBLbTh6MWRJNFZFS2xHQ3hCR2Fh?=
 =?utf-8?B?NE1CaklLM094ZW5acDlBRWV2bXFQZXk5dXdrWUlhUkFDejN1UW00SlBCSnkr?=
 =?utf-8?B?R3czdi9jVm0wZ08rSTJ0aENjaXJHQVBJOE9GdjZ2QzU0QlNrZ05Ma1MwQXky?=
 =?utf-8?B?eCttbjBoWnM4dDJFbXl1VTFKQWM3YzVKYWpvYitNeDR4NkVGaWp0UTNzVjlH?=
 =?utf-8?B?bTlNOHNEaGE5bEJTZTloSTQzcG9uRnNvMUlWc3JnUmRObmRHR3JRNGZpRDhr?=
 =?utf-8?B?Rm1GZDllNTdBdW1kTlZ6b1JoRGNHQVlCZkFybTNtai84Nzg1MUdwSnBRQjY1?=
 =?utf-8?B?VHpuNTA2UENLNXpCMSszd2Q1QnhOWjArVVJWVC9seVVZNllYQTBMaTZOQ252?=
 =?utf-8?B?Nmo5SUxwZHdNYWlLZWZkZ3dzbUMzbkZPenVZMnJwa3BPa290Si9VdVduQnIx?=
 =?utf-8?B?RzlINUd0OE0xdTl1VXMwOTlDNSs2YmZOTnllaTliT2JkZENJQXViQ0FCdjdp?=
 =?utf-8?B?bklLYTFGNmVwaWVmcmtlRVpCdlNFdmRqQ2FxTEh6dDdoL0xRNkdKMUVITlIr?=
 =?utf-8?B?U3FnMW42Q0x2RzFRWXN1Q2x6RXl6bDFqbkR2dE1NL0E1ZFRNTHZqRC9FbmF6?=
 =?utf-8?B?NWFXWDNESFAzZHR3Smt2N0JtS0VzZXZxMVhndz09?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8703c0-ca31-40bc-5121-08d9c16ad4ae
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 14:38:03.3500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dcK7T56Uz1Mr7tlGRfAzwUP011sbIapZmI9TpJI4b3WXhEhOAECzxb9wwYqGUcC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.237.102; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's my shot at fixing dma-reentracy issues. This patch adds a flag to
the DeviceState, which is set/checked when we call an accessor
associated with the device's IO MRs.

The problem, in short, as I understand it: For the vast majority of
cases, we want to prevent a device from accessing it's own PIO/MMIO
regions over DMA.

V2: Try to fix reentrancies initiated by DMA accesses in BHs

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Li Qiang <liq3ea@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Bandan Das <bsd@redhat.com>
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Cc: Darren Kenny <darren.kenny@oracle.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>


Alexander Bulekov (2):
  memory: fix dma-reentrancy issues at the MMIO level
  memory: set engaged_in_io when a device calls DMA APIs

 include/hw/pci/pci.h   |  6 +++++-
 include/hw/qdev-core.h |  1 +
 softmmu/dma-helpers.c  |  2 ++
 softmmu/memory.c       | 15 +++++++++++++++
 softmmu/trace-events   |  1 +
 5 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.33.0


