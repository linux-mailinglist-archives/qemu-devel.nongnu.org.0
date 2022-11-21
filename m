Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED92632DE2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 21:25:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxDKo-0004Y8-Dy; Mon, 21 Nov 2022 15:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1oxDKl-0004Xm-CB
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 15:24:03 -0500
Received: from mail-bn8nam11on2100.outbound.protection.outlook.com
 ([40.107.236.100] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1oxDKj-00046A-R5
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 15:24:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXsS5bTPZZOLUZLzT0zQ9Fw5kqR3dKfHDzp9LopaVQGlKEOVIdtVEnq4B17n0iGw9/aZjf3EynrOOqOLL9mAlft68svaI6mPSMnJLDCAGVLMUML0zge91KAabKz/L47DDfvoJesEzKm7NTl9tRVfiGbqRfbeH5L8LZLB09bBr4yEp4NYUkFhJUIpDrSEh+8iwB3a4aInW+8E0dFQL7hBZCizq0K0gdrVXtXD4caH/X+6jg3UOqQYMqHccsgwyu7vjjXvasqGW64DYLfTrq1V6mY8BEviDL/Ylc8ncIU/mYT+G9S9vYhLMSdPhIV8DBWW20tXyv7VTbhLTYpjFI9iGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bxb4qACmfCCvS/NTQTSHvzYS/N/uoAJsXx4/KAu5v40=;
 b=NZFa5wNxA9N7sFczTNcDXhwTyII6+aTV+hx4hFZJtOtZZMMyMqx5aHzSobungn8roLUKD73lGVYBvzR+UfifSXkUh3DXRTW5OYfoE3jfGlhZwY/23n4raMFbjsDooWXL6V62BOZAIbOivSixt9NS4hZxyzcKdt6XHFwt3WfJiZraNU032xdL/h+c8N985YMsOgvc1KFC4/EVjuL9CVVhzgOa7Z6NV2Nmxa/6F7nJ86zR2eAelcUhh5A38zbMUqb0CAU9/6maI0u0dOt/hyGs/4PQwqZ+B7HZi/9FwLPM/6/EffTbVz817imthyAGMlX4iXTBw6RabKYaqPsryqPinA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bxb4qACmfCCvS/NTQTSHvzYS/N/uoAJsXx4/KAu5v40=;
 b=dpkRJZ30fmBPXogP6ENlIslsi0sAFYlnbFdHWEVJmjgAzEN9atxgUg/7zBURv/J1Ny/gd+FOYb023D3sRbR89VvW5T+wkAkRQmGftLoHQHq3CtdPBagtomwcygSbw3fwl9UrNqWMSqZy2D0QxMvqk3V0+75HRHKxh/tGP/gji+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 CH0PR01MB7020.prod.exchangelabs.com (2603:10b6:610:109::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.9; Mon, 21 Nov 2022 20:18:55 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281%3]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 20:18:55 +0000
Date: Mon, 21 Nov 2022 15:18:40 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Plugin Memory Callback Debugging
Message-ID: <Y3vdIHJrR1k1lmf8@strawberry.localdomain>
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878rkbalba.fsf@linaro.org>
X-ClientProxiedBy: CH0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:610:b1::17) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|CH0PR01MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 07496d9a-7959-40ff-391c-08dacbfd9cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uwSEqqzV5QAH+xOH00EDL1ui43kRmv7J9W22fmnO5NwX7MaDbnw4MXZbH8nkQI1Dbv/YEzmnPrhiwWttd+p8f/CnMw6SaHXgBQZnAGfuCvIJ2nSCWapveqwKnsOPUzH/vHp31Wz+HZc8autdAmQGm/a/IhxCi7qyu60125Qf20cvT9cCsguih5a1QwYBg3v7PWf925gf2yLOtkOXNflM5qib4gNPFJH16HcF3/JkGR3m2uReBbCqEm2pPzWvmQ/W83DQsteETfn7Fa7LSatvYvK/fDJGeMaIC2ham5kW2MJiKbVYXdaFGCWdeGM5WjQ/DZbgOr9AN1N/131SVuzsGt3lXuMrMz1nS2rDR2bqN72r4Did9ySCX2ChyTnJ1iY4fV29le7VgNFG8qGOi2tLkLq/b3BnTrHve1UZ8Rf8SizO5C/GiU3QuHlr0oGw9/ctDMCXA/lxaqAp7tDoPaMxD/i2otxqUMPpFTPrZCdSt+7bvOVlZPJtdm0BPdul0KJPzJLxSQvPk+qSYOCd0nQ6rXwQeXPLrD3dd4XfedPfNXyf5bhC+GjrXGS9TIRuucvu/VRRi6D/JSwzhwMBFZ/u4w6WBP+9LcUZzE7O0LLgUGK3Kgt/nTa+OufHHpqCfg1o3hpFgUrmJfmoOLZcktXM1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199015)(6486002)(3480700007)(66574015)(86362001)(38100700002)(2906002)(8676002)(54906003)(478600001)(4326008)(66556008)(6916009)(316002)(66946007)(8936002)(5660300002)(66476007)(41300700001)(186003)(9686003)(6512007)(6666004)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ynIRwxmW1L56BGsUWE9eicpmZb9M4L7jRO98LnRrF87wRkDnzAxbshuEFz?=
 =?iso-8859-1?Q?NsuigVaoBksliNlVq8Z0IYvAhrtSUuwmgPzxQC/+n1t71gshq0+O9SBJML?=
 =?iso-8859-1?Q?mdJpy77RCMghRZYMBwdRhUru5I6jdcviVOL8XV8Jp0UDHtYSBdblvn+FqX?=
 =?iso-8859-1?Q?AIVHUV6eJd4LMUsjo/Wf1IL9s3LFFV2P9oGjB6sZljVa7CgH33i5S26HPv?=
 =?iso-8859-1?Q?ztFhwvdzpCd4kslNMJTTr5DpUHgsTVSpGMTVRnm5amMlkPsFWrxi0mqqbi?=
 =?iso-8859-1?Q?kyj0XIzFbmtpCyM0cN6QlcevD8WD+lUXcbTuP/4Eaiuwo+AnAOgSFlyxhc?=
 =?iso-8859-1?Q?GmYui6r+Xj0e5lTqiVH1UXtTJ424JTrUN3u2mn+T7uHPz1zzmfpYXM22gk?=
 =?iso-8859-1?Q?J/HjC4WZoz5VZ8Kfru4rNtqrVX9YlGXayKUPedbSPlD2st+fO4G7LtiXsC?=
 =?iso-8859-1?Q?qMK8k0bk5DWRAHDPDo7ZlkqeZJvAQKEvsv6SmJ/8Y51m1xxkQJmARdRJTI?=
 =?iso-8859-1?Q?8d1on0VK381PdZn3AVqGltYRgfB7yqLr243cedlpGFUejekWyKFrTELK+q?=
 =?iso-8859-1?Q?ZpaKMzDAUDmrpXJ6ou2zA5NyjTLA5Snlh0GnzKYQv+CcvUBKcfoNas3Ioq?=
 =?iso-8859-1?Q?cQhlygAfEUYp0aNOEdclrggu+zmdc4lpg4zEWqisJQLdi2L5rKGhP0mldM?=
 =?iso-8859-1?Q?kHK/0P/o3BnchBqlyoL7QTCRaiff+YU4SiGKMl6nCAWVva8Ueyu8sQxIcb?=
 =?iso-8859-1?Q?tTrClbGlMEnE/MpnyJfsS0A/G2CizHmdIlxyE2qnsbcoDduIoav3b1RFSx?=
 =?iso-8859-1?Q?b2c6Zdc+stT/n5EoWodk4GEVB+vT0nSTfAUjrJBHpHV+1TyVwDjThjeg68?=
 =?iso-8859-1?Q?wzIQVJwKEs7v23yKVszFI16njlRHvZ2BQHcJW5WnX1flgPKi2TxuOoiVM1?=
 =?iso-8859-1?Q?Vwu440uO9oHSb5RhHsPDvesrVcxrzYCI4uh/CHm55b6OqUV2TB9BpNi5XU?=
 =?iso-8859-1?Q?Zi96W2TtRsTD0uVDO0lu9lVd/d4BDIOjdJW9FYNMP4q+CLYzmvf1NdEtU7?=
 =?iso-8859-1?Q?Jndu4RfVf8mWDHcbmujSFcnolO1TEt8/wdq4HYXocEQ+0rRiJzLnF3giw5?=
 =?iso-8859-1?Q?GuGMegVYaG9qj8RXCudZGi+C64Rtn5GFEgT7JxcSFpwRa+aqxOA5puUY7g?=
 =?iso-8859-1?Q?OH40nM3hh/QaVKMm5UpXO+Xd4nkR03NuthjeEDHZtVwm3UbRKW9VDawqKe?=
 =?iso-8859-1?Q?Jczdon5eMwLV+bG9HqTLaaIUgg8wiVMbbjk2UMaW+OYbh+5eiVKd7im4Ed?=
 =?iso-8859-1?Q?JCHPjJwGYyk9Zu4Q7Uk/1ySZqbtieW4CKb6nzvEEzcmS8A3NaqcG05Rvya?=
 =?iso-8859-1?Q?FCwfoI4lsKa8/1/dVNFXa2MkS88WOAg0978kgKKKDea2GZ9/Sic4Q70WDc?=
 =?iso-8859-1?Q?s3ZRClSNiO5Eu15qNb5xIMrgdFTenpeigiW02ZMHhXdwCxtZRDtBp5zjwo?=
 =?iso-8859-1?Q?X+mfUxijCupumJ2rjmy2vAXNJrWruZJEZ3WlMBUd3pV7klPsoaHRBJeyr/?=
 =?iso-8859-1?Q?sr7hu0q0wooRaiFiJfQkfOlBiKW3VAof483NjKcmRjn7pSG2qW3yRqPGwN?=
 =?iso-8859-1?Q?XFzo36u29njLkWuqp1+9sP4UNXEUVjyTacIgbr7Ynailnfl4ZdedSl7Pnk?=
 =?iso-8859-1?Q?X5dBPixr6C8bvGojHug=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07496d9a-7959-40ff-391c-08dacbfd9cda
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 20:18:55.5111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkDHTJ7lwgfwyXbG0Zg6eF17VE+vP7jViX7Iu/7Z9hXUiilTusINKdRqJW77FC8KLdNakaRYkxAyFhhKMI5IaN7T7fY08nQqLg8qNCyNM55rBSogkhytfSQPI++cUXXF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7020
Received-SPF: pass client-ip=40.107.236.100;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Nov 15 22:36, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > I believe the code *should* always reset `cpu->plugin_mem_cbs` to NULL at the
> > end of an instruction/TB's execution, so its not exactly clear to me how this
> > is occurring. However, I suspect it may be relevant that we are calling
> > `free_dyn_cb_arr()` because my plugin called `qemu_plugin_reset()`.
> 
> Hmm I'm going to have to remind myself about how this bit works.

When is it expected that cpu->plugin_mem_cbs is reset to NULL if it is
set for an instruction? Is it guaranteed it is reset by the end of the
tb? If I were to put an assertion in cpu_tb_exec() just after the call
to tcg_qemu_tb_exec(), should cpu->plugin_mem_cbs always be NULL there?

In my debugging, I *think* I'm seeing a tb set cpu->plugin_mem_cbs
for an instruction, and then not reset it to NULL. I'm wondering if its
getting optimized away or something, but want to make sure I've got my
assumptions correct about how this is intended to be working.

Thanks!

-Aaron

