Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661736AE551
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZXe-0007i0-Hg; Tue, 07 Mar 2023 10:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pZZXb-0007fp-KT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:47:51 -0500
Received: from mail-bn8nam12on20618.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::618]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pZZXa-0007NP-2q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:47:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jskh1MIw2qRozHrJFXcVjVPEqeQj/ZYz77tKre4dx406jhI8C3HFbxCSwpgFOVJnhxU/BNXZ8Uf7tlQu10WFZz13AZNVHrjwK35NZMhT+RC1EYo4KUVK+21sfFuRzcz2zTcDu73oFwRBuKx4AmbnAbm8uFRUesuIw0YrYxeqrhTDw4OFkAoilqjWeBWuPFHLa5zcv7LOS7ynvyv5j6ksPfmbM21iCLK+IvxtoXz/A++eKIQPqx3SlEvB3TCytDHUsjhauudylw40zt2HwBL2VEC9zDJJ9cnpbpbharI2mzBX6Qv7Y9s2eQLMVqTC5P7ENBc5omrH1dYdovMI9HtheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQpuBIvlIW95MsPnh3IIqTDUgogcxGssnnbnkuwEmwM=;
 b=CHGoHyY+ZGxF1VUIE2NVSYWTSAzbw9nhXzO6d0pXll7ylA9VZY1K8iQ6chPjT6eLEZRMySk3jfykHU4Mtc7zqJ6sI3IWUsM0e3RjqryKQsHygEkCHrcQdRty16tVrePvilgyw2TrC04J2iwQQqL8av3ryTWO/HCbh1t1W/6pGp6blIZRfE6ElVtL/WRohYueY6C0xjZRvtE2NZRTla3AC9L4s/Ey22RgrtKOorPD2oDDKAPhnLY1EVZ8980eJ9SdGsyfQespwUPvyYCJnFIMo23XukEVq80P6K3oBgVNEK76hXRqEiGyooD5HzwgxRsdCAgF3Z/Grt1lTa7aCbbL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQpuBIvlIW95MsPnh3IIqTDUgogcxGssnnbnkuwEmwM=;
 b=n4Ps+O/4A4goRR4GlmV+tLfgLSco9is/ISp5PuWBnOU24u2EUoCQJTJkqIvgSJSqLSarqUCCcxAnDB0Fk8xdhO7XuNzaiav46rx+wVkoVguYifGhuekGA8ZWrqTSGSGM+l92dxB8LMHQX1DXm6vxj2LGzlsQt71Gf5bR4uil04I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by DS7PR11MB7931.namprd11.prod.outlook.com (2603:10b6:8:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:47:45 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::7c51:672e:ffe:7b74]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::7c51:672e:ffe:7b74%3]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 15:47:45 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v3 1/2] linux-user: fix sockaddr_in6 endianness
Date: Tue,  7 Mar 2023 16:42:55 +0100
Message-Id: <20230307154256.101528-2-Mathis.Marion@silabs.com>
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
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|DS7PR11MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e299fb-9220-4abe-b5b4-08db1f234b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6a8296b3v5ls8DRFc8yNNQCdANMrQBE7PIi08WI2CbhZhfbQQ0Uo53nfocSlbEgzJt1LOs8WtIMkmI1qPJ+PXuDvmOQuI8lolPoZHD/ujEA14datM2CsKGLV+XeeDtFA5PXrghnrwMSJBxdxFy+4fgA19aruZdJ337tyLfXqfuABq59jkW3ISjUDcdbFTId6Sufp5Gvhf2T/6ac/0nQ8fkgwFiCAQUdMkj8i8lTv9B4AzCG7m9RKztn88mqc66/UshK10Pnt1UoW+HwOP5BCqcwfVo1XOeM8ymxsEU52Kc0ibwGlyngXBu2eddUMj3vRHF70ofqiWekydFkY3uz7Xxk0V4EjHtTwRaeOp7XRT9VvE5vRuEX4hu3uuS2/piOZuxEKTviODvfkIuZD+jKjJP+uz5GjPjoKJbTyQuUKYCIZWHGssXeX5d+Alhs4rb1H32W/SHn4iaX43yKISXmzfb4wwbZiKR2i6p+KMnP0sGb7sXgHw0JUFiJEjoYG2GcKdBO8f1vAn0HiqGnWTJtqaFOAzMmmi0xvPEZEa/rrIxHVwQcVv+gVaB94A4fHG8H/2q3U8Dywywkiefo+VyWaUWhxi03Gk6nwq7uUHPvKp9JurkuAp05ddzUWfOLsitEIYk/PVbkOMpR2C9A8ix7VvzsHCj84NshpjM0FYwcW2qdEQSu2i1M83xwCsnqDsxcKGH2yGpPdzM0dway46cG2UA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(396003)(366004)(39850400004)(346002)(451199018)(4744005)(478600001)(5660300002)(186003)(26005)(83380400001)(6666004)(107886003)(1076003)(6512007)(6506007)(2616005)(86362001)(36756003)(2906002)(6486002)(52116002)(38100700002)(38350700002)(316002)(41300700001)(66556008)(66476007)(66946007)(8676002)(4326008)(54906003)(110136005)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b88rm0wzgFIp2EzFhBMewtBoe59LkGQ9tMdOweNtB4ZsaLuFWYPBGRp1GzhO?=
 =?us-ascii?Q?P7PCo/tkLIW6FFKPxvc2R4zRBUohNnIObC0+9ueigo6xQoZhnhzkZPOTjG+9?=
 =?us-ascii?Q?Zv3hUqKxwadwchjYZwnAgPcwSXc9kXo8Dg+JoMJRfT59t8NFsQJgrcvGZGdB?=
 =?us-ascii?Q?e03eopKJPXEFYEMaKgj7p7Z31gDPmjzgqIgPba/dGNDzVLkNi3GLE3p1Xmjk?=
 =?us-ascii?Q?3l1/ahwl3Z8PrkzdNwMMp4mDbs/3sSyzXshzDmbl2zi7FrxZ8m8toRsi3siK?=
 =?us-ascii?Q?y+DKlM75BdZ2ncnxrIphSQ0j3krDP4IbZOS2dMQzOyrW7ft90+YOsu3EedmK?=
 =?us-ascii?Q?evMj9ZUrKD0P4MFlL/d5boPqso1e1X8CPYoDePuck/3cEh5ZvFsYRa5vSA9w?=
 =?us-ascii?Q?FjHeACXG2EtaQg3dOUNfaabDnnmw6NTIkUtHwPTd9AoZbd0udK5xiMFnX3Wl?=
 =?us-ascii?Q?5AYxUZJ6o9BD4zoptmFJM+8wrvoVTTH+bW6WJA6iKd+tKJlgyI6Qra1tTNaB?=
 =?us-ascii?Q?SyqK2EB15l4CEmNpc0nMzZWGGIaOuigAhV+ugC5H0YFMR7Oz1SV2FviIQlo7?=
 =?us-ascii?Q?upxh49PrAYdR5ev7Ww+CFK3ck23tH32HEAkXkP+kkNO/ttS9ADeBo+4RvjDz?=
 =?us-ascii?Q?A2e2fMMpCsBqETpni+o+8x/GXqfCSSOlW3NSI/3vYMZMGc+FIU6jo8Pg3vxG?=
 =?us-ascii?Q?GJRFehTaPbowdgCWFP6xaxtY6P4KkJSghhQgCLjMgfkhEBklNqIaj/eETBU/?=
 =?us-ascii?Q?olgLYR6+ls1OsD+HP/K+t45YXgabGxLNbqjrxKluD9WrHAGgRLupSqS66Qgc?=
 =?us-ascii?Q?Ycn7j45CfHP7aEbyYnpI8RtGul8v9lNKzKBu64nwx8n1jY+9eRyWsUqBFoh8?=
 =?us-ascii?Q?/SeL7Dkcaxay7R3xfeEMRuBPKsOQ0Ju4utw29IbobA9BvTRsB/lFNz+jYGWs?=
 =?us-ascii?Q?08gntkJqyakiHZkQqDThZj0BQ60H5C0MPxdwsXfkWueDxorOz9wMW3EPykdT?=
 =?us-ascii?Q?Cu0pyJIZ1+H6xXzPwD73H2LxNO7aq5Zvq6cVumR6T7DbaS94I6NZ8B9dfjED?=
 =?us-ascii?Q?XRzZ3fmw3rHgpy6TQe6mKWQuonOc/DSf5V6YxfyEeKct0WifzhVToCzhr67c?=
 =?us-ascii?Q?0hwWoeMmvxBpSZdavnz3EnqDEmksIuKFysE7DXx5/fFH/2UFFiXgozkGcuN3?=
 =?us-ascii?Q?0+WHYfalf8N06QjsxCObWqyH7JOjn2b8YN1m+B2rNKnZBxjrhXZ+C4maBPp4?=
 =?us-ascii?Q?5c0mD3K6PSJDvtBtZf3bbdvxn6P25dlkAwsISqce/FjeiCxCh3NdFkPa2dQU?=
 =?us-ascii?Q?6AUFUP9uIh51HB4LJTDPD34cSQdbKPVz05kyCXGiClmSl6w6QGqRzd2uIDEH?=
 =?us-ascii?Q?ijgdImCqqZ2P6qrphn5uxvDGJTE8stziZxDvUjWPG9syx2Yo2K8HKAuloMje?=
 =?us-ascii?Q?gSWEX/o8T22AoOBzl6Rg8m/l+edWPr/GGdfwCrMYORN7YmJfjOlF7l/CZzgz?=
 =?us-ascii?Q?b/qJqiFtXjkHJ+1+t4gET4HU86PCnrLYoYsqQO3qhJCj68yf2HkVma0slKlh?=
 =?us-ascii?Q?phGb8Z6/BRP9qN9PbepXoYE5DO5GpBZ53Cz2V4we?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e299fb-9220-4abe-b5b4-08db1f234b6b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:47:45.5358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPiHMWTYXKQGk+SxbDjbN8v/AMc5BMw0KpCy5N3cOoNp91uMmvoUOwEdYgmuTru41ZDcwAxzW7XySvvTnBkRtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7931
Received-SPF: permerror client-ip=2a01:111:f400:fe5b::618;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

RnJvbTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1hcmlvbkBzaWxhYnMuY29tPgoKVGhlIHNpbjZf
c2NvcGVfaWQgZmllbGQgdXNlcyB0aGUgaG9zdCBieXRlIG9yZGVyLCBzbyB0aGVyZSBpcyBhCmNv
bnZlcnNpb24gdG8gYmUgbWFkZSB3aGVuIGhvc3QgYW5kIHRhcmdldCBlbmRpYW5uZXNzIGRpZmZl
ci4KClNpZ25lZC1vZmYtYnk6IE1hdGhpcyBNYXJpb24gPG1hdGhpcy5tYXJpb25Ac2lsYWJzLmNv
bT4KLS0tCiBsaW51eC11c2VyL3N5c2NhbGwuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4
LXVzZXIvc3lzY2FsbC5jCmluZGV4IDI0N2UyMDU3MmQuLmJhZmE3N2QzNTMgMTAwNjQ0Ci0tLSBh
L2xpbnV4LXVzZXIvc3lzY2FsbC5jCisrKyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCkBAIC0xNzEz
LDYgKzE3MTMsMTEgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyB0YXJnZXRfdG9faG9zdF9zb2Nr
YWRkcihpbnQgZmQsIHN0cnVjdCBzb2NrYWRkciAqYWRkciwKIAlsbGFkZHIgPSAoc3RydWN0IHRh
cmdldF9zb2NrYWRkcl9sbCAqKWFkZHI7CiAJbGxhZGRyLT5zbGxfaWZpbmRleCA9IHRzd2FwMzIo
bGxhZGRyLT5zbGxfaWZpbmRleCk7CiAJbGxhZGRyLT5zbGxfaGF0eXBlID0gdHN3YXAxNihsbGFk
ZHItPnNsbF9oYXR5cGUpOworICAgIH0gZWxzZSBpZiAoc2FfZmFtaWx5ID09IEFGX0lORVQ2KSB7
CisgICAgICAgIHN0cnVjdCBzb2NrYWRkcl9pbjYgKmluNmFkZHI7CisKKyAgICAgICAgaW42YWRk
ciA9IChzdHJ1Y3Qgc29ja2FkZHJfaW42ICopYWRkcjsKKyAgICAgICAgaW42YWRkci0+c2luNl9z
Y29wZV9pZCA9IHRzd2FwMzIoaW42YWRkci0+c2luNl9zY29wZV9pZCk7CiAgICAgfQogICAgIHVu
bG9ja191c2VyKHRhcmdldF9zYWRkciwgdGFyZ2V0X2FkZHIsIDApOwogCi0tIAoyLjM5LjIKCg==

