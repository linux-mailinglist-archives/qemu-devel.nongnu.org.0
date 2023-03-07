Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2436AE552
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZXf-0007i8-2k; Tue, 07 Mar 2023 10:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pZZXc-0007hH-PA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:47:52 -0500
Received: from mail-sn1nam02on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::61a]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pZZXb-0007NM-8n
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:47:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3+ZIcb2+hSeCJ5/JFoaLuYtTjg/MMw6NFzHZtrG0Dv6ZHo/lRZL9v50BXbyi0YIE87rxF7WsxtzLcEuLsLkzvmT3VD+Mu7oWVXDD96DF9plvcEeQHXKOeeQmo+poxwveyVp7nFX3RCKHMyiUZAu2L50xMA12strRdjV4snQgVPUNh8xrxgNHMN4NEMVEZSeTHbkveO6Faoi8hwrb7eDG6g7Jc6yFC8pqsHgOM+2YH0PurC3ZPPzx87ZMS94H4ZHZHUoBDG+bhHEOrv5XQr6jC3VuNJd7LTLo2U9/56UJ9HYs4hQXvnDWnwW9R/xpY1jRnGyaRRcLyEuv5hvf0zskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgsYswK2s7kcD91NomxaKu8Lk2CV9O1fgz9/D7frdMQ=;
 b=ek+ALAmPwkmF4ajxdt6ljRhwM6BdwzWGaQWZmGe+BoOCKOpdPP2kMQtziexWIHqDRZcvCyRLTmQk3wzyWd9z6L10plDrQQBAYERrC5SGF0H5W0F5r3a1+9uXDTUu+sq07qw7zFgyPC7ZHkgOz+dccyfbrvJuZB4APKQFpoGZgLjM38n/Ro4UfjC4g9ckNln4WjoUJwA/xdh9H0c7rLt0GklMnmGLb0pJ6+qoO287BFeogZiM47LZ3pfJmOcOd87PLFVuTiC/C1fbMWiaBIj72lS5TsMcajeBEzM9JR3zX1HH2G0Xe70JYCAaPK8zqhDXqzGVaInz74jY0POdO1ZmOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgsYswK2s7kcD91NomxaKu8Lk2CV9O1fgz9/D7frdMQ=;
 b=pcoZWMbSDpgAjXPXHrV5fIPcm8J07ZIV/tDHRwdtWvnStJFIP12HQMqaOaFbYTMHsuhZpq7w4xD2YbfpWo+oV1aXGAUrYIXAjhDkxtInj7BZFbshEuOCHODEeoNvlCfwtquNF/ipijBSXkajG/3XTV4zssMqyMriaLiqmepsb0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Tue, 7 Mar
 2023 15:47:46 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::7c51:672e:ffe:7b74]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::7c51:672e:ffe:7b74%3]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 15:47:46 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v3 2/2] linux-user: handle netlink flag NLA_F_NESTED
Date: Tue,  7 Mar 2023 16:42:56 +0100
Message-Id: <20230307154256.101528-3-Mathis.Marion@silabs.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307154256.101528-1-Mathis.Marion@silabs.com>
References: <20230307154256.101528-1-Mathis.Marion@silabs.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain
X-ClientProxiedBy: PR3PR09CA0009.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::14) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 3129aaf0-42db-4661-bb8b-08db1f234c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vT7hfoiptPE3GKCDCG5A5N/0s4UONM4obnKcLzrbm76/H1xQD9yOf2UNQqPyrpy2o6Nvr1PqUv+H0CK8LYl6RN4Bd6KYn9Z5BGh3S+PO9eKKuXgv5IYczxBsLfQ06plJivKusMqPRk+GgltLrcwA0DPsLsKSNDnjGoF2f/SNzuYOHBoSbxUmCglf03LHbOdQvWcttFCBKzq7VgwF1J61O91/5X+KrulvAv326ezw2SXFinWcK0M3s4DB4vk/2ysyc7Cg18SWrJo/dqRZnqFH/S0j28TIOVkEFg0XDYy32V7gZ0oJNiJO64WH4CDhZUcRmHPawZlNUIVSjbyfK6+yXyTqQTKEX+l1CUf80TZYfZuN72Lj7I9Ob+FmzY3LAEZW87weI6SJmWfaovsbuYFP6B8DWK58LJuGdEe4gGY03kZdJeQHRy2K1g3RCGELE6UgMxS6b/z2RVx/XojRdkVip+cpfxPUfA0KaGQzrX2M5LW3V2D3pHnkmz2KZCuQYaQAbFZURKJxnFE9z+GKyW5kBeK7hHU2ZdjToI7DCiHv+CPm5RDdIkDqz/+sFJOFy7d4bcgSC6VwhaZcbtAI4nH8hNEz3d+sq2E9BqBNK7O5xCLBi9ow8LyadCA2h9mCK/mqFVomUrzByaL+348Ghvmq6433V+bJAflPj/q4DfovIitmZSfHT//WZN5G3+0NRZ75oSbgDBbqU6rvuCFgruoR6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199018)(38350700002)(5660300002)(36756003)(38100700002)(186003)(6512007)(478600001)(4326008)(52116002)(66476007)(66556008)(66946007)(6506007)(2616005)(41300700001)(8676002)(1076003)(26005)(8936002)(86362001)(6666004)(54906003)(107886003)(316002)(110136005)(2906002)(83380400001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YmFFMzecaVYOf9iuYYFDhwgHVB04qNn9urn1/tAvHdFvuT44f0iCV+wt0FIX?=
 =?us-ascii?Q?dsjTLSOsOx5rqxWQFI8GC0zfb50YG4jVN0Bv8pZFo1r5L+R2Cb9wrJazXM9Y?=
 =?us-ascii?Q?cgBMJpIZGSw5rxGPlE8bo+GuDK/Ek3n6EUN97lNzPaWr9d2oog61RUk4JFdq?=
 =?us-ascii?Q?XAja9wdOonbpwrS6fGOpWNlN7IACvGsrCmduHO6m5gRaTngz7PKM6mHkNTEX?=
 =?us-ascii?Q?RFG2qN79bubuBJaEky+kloOhUvCGzLSRavts+IWkDA2vOBccvzLGhMpwC/8F?=
 =?us-ascii?Q?AeoIyTaorVwwM6kh+u4iucdb0uWqMv9dgMRHRSV0dhTOm+JmBBQV4DDTixl4?=
 =?us-ascii?Q?nc9WOwS76fcywAslvb8KIahuVn16rvjOXr+IMsgwi16kRJQLYJgQ2B7b4JVM?=
 =?us-ascii?Q?PgLzz3iSFoiId/o33wWfDC/65hIYS5+xGnWDg3F4IFzYa08cITD1XlzhgFl1?=
 =?us-ascii?Q?CATPdOew/HETrYrjUste8/+lFIlYZh1uxUtWPY4ObqDcfDKVZ4j0iE/CYCs1?=
 =?us-ascii?Q?6BJcjP6MZ5HJEOSfV9bQDYSLDQ4ckeDZbq0rAJC9NcRcD1u16jx4Z4k6I1ZL?=
 =?us-ascii?Q?tOnuCB5lqVMbd12nO1KPo5Jrfmp3EvJo7kqegZ7c5IBh7xwxg07S27BAANQD?=
 =?us-ascii?Q?zC6ua4kiKJtOjowoJJTWSIr3s3QXmg6wXGpm6kAf4d8/DTCizWSHw4GEQFAH?=
 =?us-ascii?Q?wmdOHpa9t3QYnxHq2u60RpIisLbMjIKP8jnl8aRipnJU/ZmhOvU/8+jLq0se?=
 =?us-ascii?Q?YUH+YJ9GyQN7oWeKAvR3aFkMHQif6vNgqIfTmT7VUByTjzKnJr8TrAZ8Tk6f?=
 =?us-ascii?Q?6sCf9C5yYPtkm3i+TRd+JI7TzEzD6LGG6ifuesUToFdx6EkzWU27JjxYMXr0?=
 =?us-ascii?Q?rYsY4Xk1Nxn4of1vok9SObEuJCvrXBp4DRt49Rn9/lcaMgz1yGLWVp9wGHO8?=
 =?us-ascii?Q?+5GJ923FDInM+gfBbiJI8U1U8/0t3574Oa2Z/OV1E3Jwgfo2QKcQcekP3OT0?=
 =?us-ascii?Q?j4nfrbcPDC1A+mHB3ovXgSuDdYjbloU9C5Lot56hqQxnjajO3zfe+W8w56Dv?=
 =?us-ascii?Q?ndo05l362tTt3x5+0HdZTxP6gr4bDvNPI+yFuPF3/4LDA/7ydGL6y0fqJmZz?=
 =?us-ascii?Q?fQOEiKXpHwsnXAE9yfqZ26c7tTNTsr5KXAwrN7uKqaeabhO3BsDz/k2eMcNy?=
 =?us-ascii?Q?fbMVIzAdZrbF7zuklgs526TTJDaFgbjWGL8TtPWslBii7mw7hzV0mM7UBzAO?=
 =?us-ascii?Q?Pm+X30tsbf53t1zGQ/0RJtcrSZzeL0VmtbTbXo1Jpzc/PNwl2w/IK2expR0W?=
 =?us-ascii?Q?x8towq4NtnW6fF9ZeI32mDHBRBvFl9wXcxV+oyTAPyedUPMfipvwsG+JaoLU?=
 =?us-ascii?Q?gsohz6+IzVhlDRtsTOUzEpQUxmCGATibG7VhOiRyudHAmfqqXuxvDxT6sagw?=
 =?us-ascii?Q?G9RonwTeS+J0QVKIWNjBmeXD9OpC4Qud5msLmQ4HD3SvQL6eI98xR8HWTgrN?=
 =?us-ascii?Q?3aHGov2lz0RQIREkS27d3dlymvEFV/zTTW9SLNtq+jkBKX7+VehgNAJKh4Gy?=
 =?us-ascii?Q?CTNAHlX3mHkK8LSIzfaBurP1fe1fKObJsRkDsKu9?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3129aaf0-42db-4661-bb8b-08db1f234c3f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:47:46.8337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIWJ2EGzz2FbJuTX8sH02bCiAjmp013TtnBaEpDbH3JzruQZy66nMakxsI50XX8GPAH6TcDCK6mibLUxKV0e5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
Received-SPF: permerror client-ip=2a01:111:f400:7ea9::61a;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=0.001, MIME_BASE64_TEXT=1.741,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RnJvbTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1hcmlvbkBzaWxhYnMuY29tPgoKTmV3ZXIga2Vy
bmVsIHZlcnNpb25zIHJlcXVpcmUgdGhpcyBmbGFnIHRvIGJlIHByZXNlbnQgY29udHJhcnkgdG8g
b2xkZXIKb25lcy4gRGVwZW5kaW5nIG9uIHRoZSBsaWJubCB2ZXJzaW9uIGl0IGlzIGFkZGVkIG9y
IG5vdC4KClR5cGljYWxseSB3aGVuIHVzaW5nIHJ0bmxfbGlua19pbmV0Nl9zZXRfYWRkcl9nZW5f
bW9kZSwgdGhlIG5ldGxpbmsKcGFja2V0IGdlbmVyYXRlZCBtYXkgY29udGFpbiB0aGUgZm9sbG93
aW5nIGF0dHJpYnV0ZToKCndpdGggbGlibmwgMy40CgogIHtubGFfbGVuPTE2LCBubGFfdHlwZT1J
RkxBX0FGX1NQRUN9LAogIFsKICAgIHtubGFfbGVuPTEyLCBubGFfdHlwZT1BRl9JTkVUNn0sCiAg
ICBbe25sYV9sZW49NSwgbmxhX3R5cGU9SUZMQV9JTkVUNl9BRERSX0dFTl9NT0RFfSwgSU42X0FE
RFJfR0VOX01PREVfTk9ORV0KICBdCgp3aXRoIGxpYm5sIDMuNwoKICB7bmxhX2xlbj0xNiwgbmxh
X3R5cGU9TkxBX0ZfTkVTVEVEfElGTEFfQUZfU1BFQ30sCiAgWwogICAge25sYV9sZW49MTIsIG5s
YV90eXBlPU5MQV9GX05FU1RFRHxBRl9JTkVUNn0sCiAgICBbe25sYV9sZW49NSwgbmxhX3R5cGU9
SUZMQV9JTkVUNl9BRERSX0dFTl9NT0RFfSwgSU42X0FERFJfR0VOX01PREVfTk9ORV1dCiAgXQoK
TWFza2luZyB0aGUgdHlwZSBpcyBsaWtlbHkgbmVlZGVkIGluIG90aGVyIHBsYWNlcy4gT25seSB0
aGUgYWJvdmUgY2FzZXMKYXJlIGltcGxlbWVudGVkIGluIHRoaXMgcGF0Y2guCgpTaWduZWQtb2Zm
LWJ5OiBNYXRoaXMgTWFyaW9uIDxtYXRoaXMubWFyaW9uQHNpbGFicy5jb20+Ci0tLQogbGludXgt
dXNlci9mZC10cmFucy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvZmQtdHJhbnMuYyBiL2xp
bnV4LXVzZXIvZmQtdHJhbnMuYwppbmRleCA0ODUyYTc1ZDlkLi5jMDRhOTdjNzNhIDEwMDY0NAot
LS0gYS9saW51eC11c2VyL2ZkLXRyYW5zLmMKKysrIGIvbGludXgtdXNlci9mZC10cmFucy5jCkBA
IC0xMzU5LDcgKzEzNTksNyBAQCBzdGF0aWMgYWJpX2xvbmcgdGFyZ2V0X3RvX2hvc3RfZm9yX2Vh
Y2hfcnRhdHRyKHN0cnVjdCBydGF0dHIgKnJ0YXR0ciwKIAogc3RhdGljIGFiaV9sb25nIHRhcmdl
dF90b19ob3N0X2RhdGFfc3BlY19ubGF0dHIoc3RydWN0IG5sYXR0ciAqbmxhdHRyKQogewotICAg
IHN3aXRjaCAobmxhdHRyLT5ubGFfdHlwZSkgeworICAgIHN3aXRjaCAobmxhdHRyLT5ubGFfdHlw
ZSAmIE5MQV9UWVBFX01BU0spIHsKICAgICBjYXNlIEFGX0lORVQ2OgogICAgICAgICByZXR1cm4g
dGFyZ2V0X3RvX2hvc3RfZm9yX2VhY2hfbmxhdHRyKE5MQV9EQVRBKG5sYXR0ciksIG5sYXR0ci0+
bmxhX2xlbiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0
YXJnZXRfdG9faG9zdF9kYXRhX2luZXQ2X25sYXR0cik7CkBAIC0xMzc1LDcgKzEzNzUsNyBAQCBz
dGF0aWMgYWJpX2xvbmcgdGFyZ2V0X3RvX2hvc3RfZGF0YV9saW5rX3J0YXR0cihzdHJ1Y3QgcnRh
dHRyICpydGF0dHIpCiB7CiAgICAgdWludDMyX3QgKnUzMjsKIAotICAgIHN3aXRjaCAocnRhdHRy
LT5ydGFfdHlwZSkgeworICAgIHN3aXRjaCAocnRhdHRyLT5ydGFfdHlwZSAmIE5MQV9UWVBFX01B
U0spIHsKICAgICAvKiB1aW50MzJfdCAqLwogICAgIGNhc2UgUUVNVV9JRkxBX01UVToKICAgICBj
YXNlIFFFTVVfSUZMQV9UWFFMRU46Ci0tIAoyLjM5LjIKCg==

