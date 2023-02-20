Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2169C84C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36d-0008Ar-SK; Mon, 20 Feb 2023 05:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36b-00089O-1j
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:09 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36Z-00009k-6i
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:08 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K9f824020143; Mon, 20 Feb 2023 02:08:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=qVi+cX+axJVFtj52FK6mlqj5ScHeG3UF/5wRyJEMVdk=;
 b=ZTLyq9noDsQ4GyO/7Dr8AkkAnytsAAd2xWWfdLXmD/o8FOHooPOUaf4pKXaqc6z6Lokj
 Q3iUEr3Lr7vGbT4X2egFoL5qTMZxvAOovwuw4EVj7EiduSD9BO+oHzN1SPzfGNOMh+ZZ
 NOvXk0BmGnC6/iOqV1fPaqai8T5Fczprr+slOlSJVcGbcw6twAIpno2V8Ujl81UhxrNU
 /SmVQOq2eB9+HdgeqhixwlVI0NKrsrlXdtcV9naAy0Q6Egi03Itxclcinxhayl+Rfl96
 1MKqPvlY5HyMPdQV4AQ7dafUf7oLA4hz22LyleUYJwgvPWyEOy/W2fz2u3jrIVf/mBgO ZA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2psac0-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glckciW1n/KL5dBKFAXilh9OvyhOlWKN0DTa2qXop0aWwbOnRFJX9vb7ZF54ybsOXVRsquN7XAJj81EdzVj1kJIc1/WvT3zTQdOmflbVUf1Hx0joZz1VKRSGdsIY46YPVkIcnP0KiDdoscnl7HbNenYj4oolrP++WJTU+e62fPPQj64aZNuUyNYgJwN5BKRaU5Pc2eocgP2bX8FLh9ywuuwXGS7Z3NaZDldZaAuZ2yxbsIzlSFTiSItKGkV/DyTbFIlUhtW1kd1qWuUj2pA3tqI47h6GvXnS3sR3XnbhbdepzCJ879LaQAdIZWZjwPa4NmxzRSOdeiOzbM3MZDCPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVi+cX+axJVFtj52FK6mlqj5ScHeG3UF/5wRyJEMVdk=;
 b=X2JvKAdZCfXrDjh48pZYaYBADk2xfyZdfWF2TAONzNDR72ZAHKMZqlFvbDF76gynS7zbT25gdZ2xy4XsWKYE578DR30Rk1GMBPIUeGHfk2axkXUF6lS1ciElEZ2DNIZUBb3uIJdCInDUyUF8hSYR4QJPRmR2F2ssl+xszsoawMe08Rv5+oabToebpe18u2WSXVGA+WTqYzGu0ikA6ASxBHPC9IJ+ihrCJco9UlzZ+DjVuEMhuU/VFK8rek/SWGAC7qsiF6MAwpEPMkko9O+7XvAFzfA2lCdotXU+Psec1RCAMCGcUPPM+zQjf/cR6XsuLnvW5bXuzqgSU6ihsB5SOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 10:08:53 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:53 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 12/16] hw/9pfs: Translate Windows errno to Linux value
Date: Mon, 20 Feb 2023 18:08:11 +0800
Message-Id: <20230220100815.1624266-13-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220100815.1624266-1-bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: b4daa615-844d-4f07-7e16-08db132a7815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VD56L3e6vwMAQvU/bOhZSOEXrAR5UteoMRLEqBnfwFGRymPA6NTDyPEjCWbwRE7Ub4KimjiDi8oiXqiB53542LP60a1yreI5Bzo/Bce2Ogsi6tj8KifsHF+wViTuIitQPlIyhWzAJjiYwQxW0CoXfkgWYvy7NWUhw67MjtlmVlsWOC2qVzji/RmmfDXBsGYYY3lfrZcBm/AHBf3aQeebwBmadjsO10oRqGbMkhH/CO5osHVUwi3P351KrXi7wRphbKm2YkQO5xdO/Aw6E02HOsFYezNojeOUKbfKOf3eudlMQxhrMd17gb3zew+EbYDO2lKeIsyPBtEru5uY/DgLVEn5BLInYZzYhVU58dXFI9T5+DoSFI/R1A2Ktzx0Onw896jDVxs7yGftAUkypt6Rl4EpVvpGQIarUo+3fM9mNX/3X/4xc4jYXQ6gbpLjSu4wzPpE3jqAMaU318SVSlqOHpVSQwXbmajbjuxMT/ZFQ6O0lFkMu4gmhctWPvmjcOLcvHo9MERShaNZeIwmcO056IqQXBmUCegxL38h0M7m6ORxXczphzVx/QvB9G9VLdKbAnAycrBNPpbJRqsE6OQt3fgZbR6mRkzctq4hhQhOnHwtni6OYw4+CK+MDrykWMqWCpHbasaiskTydYsA5cdNrL90BPgOFVMbInozUpobt69yMeDQrt6JPTuM6zw9hOS5ORU85seXrrtuPEM5WBj7dQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199018)(8936002)(83380400001)(5660300002)(41300700001)(86362001)(44832011)(2906002)(4326008)(52116002)(6486002)(6666004)(186003)(26005)(6512007)(1076003)(107886003)(66556008)(8676002)(66946007)(66476007)(316002)(478600001)(2616005)(110136005)(38350700002)(36756003)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TGEvX8HophDEkN/ZqXsKTzZBw9VmtzjhBxGWAukpnPhjZHGv0Yu5mob4slA8?=
 =?us-ascii?Q?laVpnFRJLvlLxUaBo/hxHuoJRVJ0N7oOLvXVbX/2VQ1UNFVlH8780woJUbi8?=
 =?us-ascii?Q?0DR4qKEk0cs3c+8fuZUFNtT2LYfQ3TeDvndap4uMoTv4Fm4aGiGNaXfoavsA?=
 =?us-ascii?Q?ie+99gN6qX84QpDO88clRrw1efZdlp33lIQOoo23iXjFOwmix6UUgFnzhLAg?=
 =?us-ascii?Q?n+RVFp5Nq7ujoS9EvZ5Rh2KiL4FKdQns6HCFDe3sXkj4nhvwlq1D4XcEZV7X?=
 =?us-ascii?Q?0FaZHZ8Xd4DQRQoZuu0fmDwpFciYKs8y5a0tgrjDnfCHcykiQbLGk9Dbh9Xm?=
 =?us-ascii?Q?P8Vo+JyVUJ2UL/FQyjzDysTX4PaCFUgQBz7JqpDNavoXOEWshZIAEKQnYXmi?=
 =?us-ascii?Q?Ek3N06Ib9wL/+SVKrt4LSNH5gnP8w0SxJBuxbHNybgGJ7CXpE9gks9jXq5OW?=
 =?us-ascii?Q?uj/EqVCslBcTF5sKlf55j0B8pKMj47OfljiDOk2KOsbolmxugqjiQxGwBR2K?=
 =?us-ascii?Q?zZdu1lyL54huZCfKjzBHG0noUgLZqMJ/FXNGUtvGwDp9OiJzbixPTklcUAYK?=
 =?us-ascii?Q?f2JhbvNsER4/SFxGBgOzWItPZFkHLg4egrnhnciSb2RZB3TKEohChAxjfdoS?=
 =?us-ascii?Q?nznxGX9gT3j3CwDKKyW95lY68r6P6hvzmGVp4KFZiSUi5TtL1RtHNMjmzMCC?=
 =?us-ascii?Q?+fsoesIlgLiTYmfJhDOqA6+kwzzO7pM/b3N2qEb8q0hGtHdDZqv8Nnaro78T?=
 =?us-ascii?Q?3FGTAcJSZjtDASl3HKW2usIp18WbE+bIXx6umqBSeDdileOsHDQ6ykXX+K3T?=
 =?us-ascii?Q?sG8vERLHeAgkVdTcjGS1PWLL/9GM2DVCZIgK2GyiwSwFhZ/PnLTlDwQwXXxJ?=
 =?us-ascii?Q?X/iCuevFpM2Wt7H0De6EvgxlOpFvIi/e1w3WMRWJoAGOl70h7SwrATKMAzuy?=
 =?us-ascii?Q?LxXFOq0JfXHjr5FI7InUs8UvNECTJRfIydQTJJopWCRPXn1/AAL4sVF4jnd2?=
 =?us-ascii?Q?pkgh3+SYcFhM5/wgARx36i1H2RK3tMkztjGZr7ovi1mF5epLZv3x/ot6EVcF?=
 =?us-ascii?Q?rHj3Da9lFYjR9ZqiUblMXugS91FMfl0sNadHLwNPhfZnWqIQpiS6dsQkGg90?=
 =?us-ascii?Q?93ATLZTe5C5FAo+ElCBdBQvpta8UMJcnXQ3qzoMD9QwrLu99fpQa6IeidPV+?=
 =?us-ascii?Q?lbh5Aea0xnZmSpNDX0nES547ab/YL03tW/agwitLuOgPyDraeEUxR5jNwdFT?=
 =?us-ascii?Q?GLJHzNEI/lu3cWD011JA732yh4JmiqoipXxJ4eB8nQxZGEwc8AoVHWh3NIPc?=
 =?us-ascii?Q?YX8VQaXyIr+X2nISLGGSxXhrjFNe6vGOfhyaNLq/Jg9hlsZfykWGGEBG3Md5?=
 =?us-ascii?Q?m3OWoVDNlmgSjjK7YFH9Q86/KqEq88k3TsBaYQSnQ3pFUCMHEMWJaSQRm5gI?=
 =?us-ascii?Q?Mzlq/HsiplowIs3ZDzakktnFq8iPTXCSZquQuYKV+Pzoa6re31mzCSQNa6t1?=
 =?us-ascii?Q?vrwYp+qirqbKctBRM/6fuqdTn5Zaym/KlVX99UU24ZJDDSs/FlRLWpX549n1?=
 =?us-ascii?Q?eZZPNYuf9Ud0RDsDXKT/ED5Kk5u6RueN/OCXa1SrS3tN5l+JxxKbFO+hMx5F?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4daa615-844d-4f07-7e16-08db132a7815
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:53.0109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhkzLuK10XLYMl1VYoNKSiZlSgzoGWWmXUMIaKg1s4AljZzXixIQ5eF1LAS64Q9h06MQbOp+EHHxI0OLyMCjwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-Proofpoint-ORIG-GUID: DQbSLRGL_i1In3zJTxj9p8vkwVcCB1eP
X-Proofpoint-GUID: DQbSLRGL_i1In3zJTxj9p8vkwVcCB1eP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=767 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200091
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Guohuai Shi <guohuai.shi@windriver.com>

Some of Windows error numbers have different value from Linux ones.
For example, ENOTEMPTY is defined to 39 in Linux, but is defined to
41 in Windows. So deleting a directory from a Linux guest on top
of QEMU from a Windows host complains:

  # rmdir tmp
  rmdir: 'tmp': Unknown error 41

This commit provides error number translation from Windows to Linux.
It can make Linux guest OS happy with the error number when running
on top of QEMU from a Windows host.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 778352b8ec..824ac81ad3 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -72,9 +72,9 @@ static inline int errno_to_dotl(int err)
 {
 #if defined(CONFIG_LINUX)
     /* nothing to translate (Linux -> Linux) */
-#elif defined(CONFIG_DARWIN)
+#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
     /*
-     * translation mandatory for macOS hosts
+     * translation mandatory for different hosts
      *
      * FIXME: Only most important errnos translated here yet, this should be
      * extended to as many errnos being translated as possible in future.
@@ -83,9 +83,17 @@ static inline int errno_to_dotl(int err)
     case ENAMETOOLONG:  return L_ENAMETOOLONG;
     case ENOTEMPTY:     return L_ENOTEMPTY;
     case ELOOP:         return L_ELOOP;
+#ifdef CONFIG_DARWIN
     case ENOATTR:       return L_ENODATA;
     case ENOTSUP        return L_EOPNOTSUPP;
     case EOPNOTSUPP:    return L_EOPNOTSUPP;
+#endif
+#ifdef CONFIG_WIN32
+    case EDEADLK:       return L_EDEADLK;
+    case ENOLCK:        return L_ENOLCK;
+    case ENOSYS:        return L_ENOSYS;
+    case EILSEQ:        return L_EILSEQ;
+#endif
     }
 #else
 #error Missing errno translation to Linux for this host system
-- 
2.25.1


