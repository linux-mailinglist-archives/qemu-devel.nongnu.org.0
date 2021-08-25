Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FBF3F760C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:41:13 +0200 (CEST)
Received: from localhost ([::1]:56306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt9P-0003JK-G9
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2t-0000Jb-W2
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:24 -0400
Received: from mail-dm6nam10on2122.outbound.protection.outlook.com
 ([40.107.93.122]:65035 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2p-0005W2-UH
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+kiUgQhAChtkVWAA198T5AQkZ7mbWskRQxvs+to4aqXMFCbaiVEtmwsBxeqFU/e8I1YVY0F2DlDXuJeUTRiRmjV2TmSCwnL44XyGauzT5qcGgSWrOtRyTVmGAKIZgFej5XfMthWis2bFMonzGHeu+JlCFLnQANFJqA/69WXZx/Awks1Uaz7ahgoepYithh77CrDZsV6V0BBXuHVH/ls8odfI1bJR1cwFsZLr/GAYCeWlGPvHh/p9RHQOdyVlOClBXx5J962NKwTKztJZ9WNiLNql0d+qD3AMCjVfNnRz3PSZTN1pVBWWH0KxsOx4MtuluYE493NLnl0tDpE/raFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/K0LlkG26vz3DS946wlEBDOprWMRTfAlc0FJqw8l1LE=;
 b=M0F9mIJ7SVKDrXbBhFUuainmfOPQjrNU1+jZpCMHXR6heckikWkm16CWaLlZ7RDlSDsjTempX+IwFXZXd/vyOo9U8gWLUGToDdMTtxGkIOdsonIr+1/FGFyxWJffoUeswGbbbYhYH5FpUvj8IgHZxiNkwbCuH7uddEgwIjaxISK9VzZu81FKYaYApQRMV8xVaKxp4yKha6SMG2y5JqcxI7SOUDJ4++4itLj+RdR3SAuIKumgTkrZu8Zlisy0jyB4SzFhryuhO17Yc/0A+t6RuvslZ2boqJZcUuaJzmSo4Mqqte8FXaKYHkSHqifmx/OIYxgwK9/yNxIV4kF/RdmU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/K0LlkG26vz3DS946wlEBDOprWMRTfAlc0FJqw8l1LE=;
 b=MaSoe5Yd77TmE6J01RSVTvTYTdBcFKK0du4y7XnRUHJL9HAynSG9MnmHO21mCp4hvlus8UlR4WVUCX8WBura1FwLeNoapDUJcPFiParRI1fCQfg88ckz+3mWdVr9iPHwquH9Ux7iA5CqGWiOKz4JEC9DzK0x/mMXJo+qfz9EQCA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4447.namprd03.prod.outlook.com (2603:10b6:805:ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:33:53 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:33:53 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 7/8] MAINTAINERS: Add myself as a reviewer for Device Fuzzing
Date: Wed, 25 Aug 2021 09:33:31 -0400
Message-Id: <20210825133332.44378-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825133332.44378-1-alxndr@bu.edu>
References: <20210825133332.44378-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 13:33:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77c57f44-d021-4e7f-7044-08d967ccfaf5
X-MS-TrafficTypeDiagnostic: SN6PR03MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4447D0ABFEF878457F965781BAC69@SN6PR03MB4447.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wanzWBLNWFPzQtRtfqR0fLcrkaGCPFFEL01vIR8ri2SUVS8PTLeWFe4VW5gjT25i3T+8Hz3AINTvZRdpJYmH/JjY36re4BYzKqjYEIH3h7Zx79eilce15ed/0N8iM2QM1TpqvokCin7jUcPjpbL56WBKhVSMr77tGWQv6zdET5n3sskYEVTkfbzBzGzO/PhuqpWf8V1iJUtG5ZODq/iX2o17O2dnlTTdRnVA5cvZ0yCfQmjTg1zgOOeC6//l5XKReVK2kIZ6+Uc4VlEN8TwLsJ2pXyW3MX1Ble0bBysoKtlJZqPS6wGXL5j8K63U4Kyyrs0NoxDDR/1CujzLIHTPjqPBHznClhppQnYEnow1SodNh4gyrlOo25UfHsSQ/fR6VBPZeiGKGpDPsyeQiQeOTfHUjJf/x5M7ZxRSwixhGQl420TqbuD4FWwN8wOjYWhai6vTOjeTena0ji4M2MBSfyZ1FU5/A07PSkm2Nbx2WXHWh3mMlZ97rPa/aYn+YAYtE8O98RZX8fs62VoibRIsSQDlFp2Pwca+DhZOPzR9R2wba5YPn4gYHSUnGudDlL/NCKgT7OimjvChUpaU+o/k4+jroRdj6Tb92pDfLV4PnTiUjkkX7tQh4RixI/gThReSMJUnpYbo431BAKhwS45g1mdwRqAGTgxKSKfdWsSItoZyO5q35egQFzInGdpApghTnOVI3Nuh2q6TgUwp5FeUBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(75432002)(186003)(1076003)(86362001)(478600001)(4744005)(8936002)(36756003)(6916009)(52116002)(4326008)(6512007)(6666004)(26005)(6486002)(38100700002)(54906003)(66556008)(38350700002)(5660300002)(2906002)(66476007)(316002)(786003)(2616005)(956004)(8676002)(6506007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekNtTk5aZXczZzdSTUpON1BZVXR6aGU5VHp2OG9BNlAzZS9tRURSb1FFQ1Ny?=
 =?utf-8?B?RVpvMXB6TE5WRDFXbFdGbUVsOTlIVVNVeDgydGhPOEN4ZGpwakZZR0VwZm42?=
 =?utf-8?B?WENTOGMxUFhkcy9ndmpkcVVKdDFUWEM5M1JpS2d4TEJFSmtQMXdrNFdyUTVY?=
 =?utf-8?B?a21DNWk2THVqVXpjNG9UV1d4eXVjOVhMTTlaOVRjUGo4NE9obURtMUFDTytR?=
 =?utf-8?B?aHk5cWd3aWdEVWMzNDNReGllUndYYmRMK2hGL2Nmd05vWHlQYTJnWktIeTBR?=
 =?utf-8?B?bGZKcmRBaE95aitCREt1TVVrejQyWTVkcXlsVllYMms3amZVenBIR0ZlblNl?=
 =?utf-8?B?bytaMHFsQjlzZlNydFlPUUM2eEV4dVZhcWx1ZzBDSnJCV0RrU21RZjJaRHYv?=
 =?utf-8?B?ZGxwWGRNVlN5SENmOEdBc2VkTHpjdmVWdE9YOUVZbW9KTXRLMTlrZm11YW84?=
 =?utf-8?B?eEMra3pvU29XMlo2dHhhd050V3hYWHEwRjdKaWdwelBHU1cwTFFsNjFYNmVP?=
 =?utf-8?B?K0JmOUZHT1VCR1lEYk1kOU9obkZKNjRpTndFZWxzbmdSTnoxRG9lNXdTYjlP?=
 =?utf-8?B?eEp4clkydmkzNjA3R0tWWHpmTU1uSEc3c1d2a1lCa3VTMHo3MEJBNEVXRUJI?=
 =?utf-8?B?V0pQY1JYblMwMlVZa01YTDAwTnJRSnJkYXVobnRBMys4L1ZjRkpqYUFPdTVS?=
 =?utf-8?B?MXkyRWxtcW1LSGhDWjA4RDF6am11MUh1SndzVm8xUEUrK0I4dVlqQnRNcXM5?=
 =?utf-8?B?c3BXWmFBYjhkaGtUaXNSZytzUzhsMisxN25nc1VFOUFHZUhkU3c4Z2t5MHVj?=
 =?utf-8?B?bkhFbm1YYWR0NGphN2Z3bHZpdm5IYzFEUm55QW5sVUswc3RsUjBaQndaSER2?=
 =?utf-8?B?MC9SNm5ROEdBMVpYMjFoMkJEQklSYTZFSjhMVjhyNjUyMkFXblY1YWQvQWZ5?=
 =?utf-8?B?bzRUQjlHRWt2Nm0ranJORTNlOTRTNENRbjhVZURFb1czVEcyTmVscUlLSDUx?=
 =?utf-8?B?OUd2SEdYdE5Ia2Q2aEJpbzNGQWI1aitCMysvSXZVMFM2SnlBNXd5WVFZL3pW?=
 =?utf-8?B?Titkakh0UVV4eVNIcXZuWVF5bGZtNkF4d0FiWEREZmR6Tk45OW00ZnE5SU5t?=
 =?utf-8?B?aURFa0FMb1BYL1dmelFiaExxTXZGZGRaOGIzblVJcE9XZS9uVTIwMXQ2Mko0?=
 =?utf-8?B?ZFRoY3FSZHNoNDUzMCtBYnNHTWJLczJFWE1xUnFxVzd1aE1lQnVjK1JLcklZ?=
 =?utf-8?B?L2t4L3A2emlzc2d6L3NMQ016eUxzSTBFdlFkdnI5ZGgvWVRpYkYzU0pZQllm?=
 =?utf-8?B?SWh5NWM1T0loS3NaRzJGYjZmNmZRRmkzS05HMVBVTVRsT0tWcGV4UWc2THV2?=
 =?utf-8?B?RG5KYStDODlHSzY0djg5dlRxOFcvbWVzVXNvWTJaYmtYc1FGL1lIbFhaeGRj?=
 =?utf-8?B?ajZxcmpsRXlXUU45UVZVYXBIRlgxUHRhZVUvOUM4N2hoWHk1bmFWQys1QWVj?=
 =?utf-8?B?UVRJZEFQQXBOdVhJZ1dEN1RLbGpsTncrc2hEdHBnUFVrSm45QW1jang5UGRq?=
 =?utf-8?B?djd2NWZsY0RjUnQ2L3R0WTZRbTNQTnp1YlN2V1NLT242QnEzYWZ1WmdvVXF0?=
 =?utf-8?B?OVhFbjVBaHVreGtHd0QreWN2VXdlOEkyRFJTQ3dJVlZ3cUVvQUpNYXc0K2Fu?=
 =?utf-8?B?dmZEc2xWUXIzamgrR2wxUEFZaEh5NElQQmVYS0wwSjhrRCtlTHJja0xZaGJ4?=
 =?utf-8?Q?zxCEJ0KgSl46c4OLjLKoqI36EaFs7suTnh0/mEF?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c57f44-d021-4e7f-7044-08d967ccfaf5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:33:53.3572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrVn6W/EAJG+lWUJoIrMHnpK4Hf/oVx4A7cegWLK920e55pdgJBvLBWZZSEbE8jH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4447
Received-SPF: pass client-ip=40.107.93.122; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.89, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Darren Kenny <darren.kenny@oracle.com>

Should have done this much sooner given the amount of reviewing I'm
already doing in this area.

Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b3697962c..5bef084ca1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2706,6 +2706,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
+R: Darren Kenny <darren.kenny@oracle.com> 
 S: Maintained
 F: tests/qtest/fuzz/
 F: tests/qtest/fuzz-*test.c
-- 
2.30.2


