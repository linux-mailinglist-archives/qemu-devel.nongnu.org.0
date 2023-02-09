Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5198C6904C4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:29:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4A2-0001Ah-JE; Thu, 09 Feb 2023 05:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ49y-00019t-ND
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:11 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ49w-000801-6d
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:10 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3195Xvca025397; Thu, 9 Feb 2023 02:28:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=KnewdVkAe2dTBNQnUDWxGse0IHV/Bl/7tgUfC/8rNY4=;
 b=i3GkWzP2gRGE0TZfmD+0x2W0FU+IqIGjEQYei5gEOjiUtwdg661NSjchMq2QC0f2ecKc
 3mwGrZu5RselWhkwdlpHWGQTFTDGNdsvuRvj9Hqc5h8Ttn/E+/xTRDr5vnO5RmR/wwn9
 Zpx6KLlWOQ0k5fgFX/GFcv0H4nTPxdD+ubQ8ws9bhfoVFs7fZglId/OVfS114um4kDOh
 0hghZIcY0snv4c6Fw8SjlWWBZItxPebmG3b+QJtcV0F9wKBJbD7ttiiIWdajs1SQspnh
 XAFvlkn7BoXcOsXQkjt7Oq7jccwE0pOUN9woFFLR4jGn11oFD/EWbnfvi0FZYb4MKhTz bQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqjp1byf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 02:28:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmfT3G4TCRFOV5mVHjPiXw3a1qKIGtVCGpO3lCwd5IYuSnJnW5/G1UFwJ0G7zk0FtXNpwPwCe+4sUmTuUq+WxDkMIewTdBw3FJLr3CrvBAVJrNr3tnQrPzOsHMRa3zk9hUOBzemCA3kbN9IYK6Jwlz8ARlZkMLzpfNCHPly0A5mcVRWG2gYCz83iat88ItOTOld7K8W78ySvgUMzpjRic+iTIJva9vJDgFYlSpY/+tbzCgK4M6oTkboBjPV54cYU1znJumk3YdKOgUtKWbUuKckK/Nq6NzkMjgtDDwQDYdk3GudmWZIAelhTNpW6UsIc+brHdm8sNLjpJWNfwCIYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnewdVkAe2dTBNQnUDWxGse0IHV/Bl/7tgUfC/8rNY4=;
 b=Kiauvtm2sOjqhJ7YDqK2Pp3ux3avdCk82aSNB3cu4wvez/tepCOr9zwEbN52acJ6ssPVlQUJZOtRi5t+ssoayg4BoKhq3076ppmQ7L8FmbFK/9Tf0Ko1QVaS4bgigw6ewdfgqEXiv6bvfuAFT6e7PApsDvv7IYMfY8CFYPhhCiBcr2oMIPKzewjVG7zqld9V5opLcNLRr7VdpVJTXSxxgzqfUHYZtohl1WcR+aNSWbqB/4yW0hPSBHlNVxLUFyGpqeCFPjLRkR7RF1AZJEi1hyUJCR3fklcvAwMbn/AcaM62NO2ITrZ6BsQZRCVJbj5oT7rSOIo7xvrcDZaTj/dm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnewdVkAe2dTBNQnUDWxGse0IHV/Bl/7tgUfC/8rNY4=;
 b=NJ5j/2VWK5SM7FSFxaFWzjzm4lDp8YxLvZwY0ecItkIcfD+o38mtGpTAub7mgDYQdI59XP0FVMAiwZozs6joQbzZ9jNzHoPjx4TCf/8tjP8FnmTvYGFGnln0KCqgD+qV4igZ2lBWz21acnFfcD1SNsCC/bOejWluMrwKLR6ZbBB2R+yeZ/dh1fjwp5Y4m8wxVFEJT3mxiH9+cRPDOKOja339gv7hze2PwgjeiZHy/u0hSt6ABac0x0FNn7FJPdDvkmrj16wmj1dlhD9I667u5hh/GF2ndWlLVxUYlItchTYKtJ4rYmH42oj7dJ+tb/Pu+1dfpC/6dYHn4K7A6J2NEg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BN0PR02MB8240.namprd02.prod.outlook.com (2603:10b6:408:157::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 10:28:02 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:28:02 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v3 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
Date: Thu,  9 Feb 2023 10:27:50 +0000
Message-Id: <20230209102754.81578-3-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230209102754.81578-1-het.gala@nutanix.com>
References: <20230209102754.81578-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|BN0PR02MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea72970-f03a-45b2-9283-08db0a8852a9
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqiNKcXZ1MBtK1JH+VfuoQU6HPe7vjrPSdV0Gpi35hXbmHNaYXslmOrnKu28CAunU/U8pzUg/L/o/qsk++TCGq5yQLXe42rW7T2lUJ1myRarRfi8iMxCASfkuVKmdSaWh2Mw/LBpZeFqFSPBqgHkZmfAGv1YmN2gh+xv8amcVqh8DYRoivFoT6DEtNv3JWEN42Shz8gs26cLUAGDRsGE6iLyjupE+SenLffcJEn4kWmGliH/vXg9tHpPkZsrtjjI98Nrsi/dEknHQcONPpS1wVL0MisHThjZXGVH8KiSQ3kbtkJPJj61XofAPuKipk1xHtc5GmbQf34RsLKxcj3mrRu0MpBmBcC8SrIpXy+FhRFbY9z85kSh8L8s/BrUDRWFQz0Dn1qRE15mlDwstRl+HMnQ7FMCAhuzgRqvVT2mbwVAbS1QEgFFZ4qIYbX8izett3DqcfxqRobAHTqdZLgHxkJs6+g1HMF+HldKJ+M1ZwwLAn6fweaBvOLt7xSqrnmBZbfsjBto8FyYrRBd0CF2SIic+8XiXMG4izWeiIUDCoGUIN8NAydlokXx+VHmJ2WCCl/WkjtlmzJ1qShIX8dGxzBZQ2iPwyp4LTwmzHvVM0HS+9uVU2pikqFyvBdIqokYTFjT+j3b9ginw1q9ouC4VAxVlVMd9N9i1pl1ZxnuR3GvlBDbUj6naoCwJBo1Tat6IniQOGyRLefkHrMhLqGCKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199018)(5660300002)(36756003)(2906002)(44832011)(83380400001)(66476007)(1076003)(38100700002)(38350700002)(2616005)(8676002)(4326008)(6916009)(66946007)(41300700001)(26005)(8936002)(6666004)(66556008)(107886003)(186003)(6512007)(6506007)(316002)(478600001)(86362001)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4xAqbmUpy8Tg62t2ZzcKa5kmdBuAG97oX0D95hiiFW2XpyOq5OjLLv8UgVv9?=
 =?us-ascii?Q?zA7GnM0v5qo+xxZxK9n81sD9jFi7OAfmq0ulxHjydAX2BUds8AUDQLoY18C8?=
 =?us-ascii?Q?j3WcXDIRGULRJ3X5leO0vkTccIj35kgEt+WT5qk0xmDAictGczLaUe7YLlQ7?=
 =?us-ascii?Q?+ZDHTF1IZ0FOKKhL6lo15Czd8bqChlhC43nTlo9WolYDKz2W6BMnka81m3TY?=
 =?us-ascii?Q?4In9Cp1/ROT7OKfOts9xhEHk1B70N46cdnLOQWK+1r+cfKjQ9tyvEks8vgea?=
 =?us-ascii?Q?hNW1y0IRgVaCXmTLdUqCuEUYijRhsQcxHHwefw44XrRdYNorUG/HS22GAnAo?=
 =?us-ascii?Q?JqIzazwS50LGvY8N4KLUYf+Esey6TathDc+yFRJkyiZrcoQynkG44p1edS7Z?=
 =?us-ascii?Q?nXogkb2WePMvFmQB1EsFoFBB420S6xExxHLUAR2k/XwufDe/VgweZOqtuENF?=
 =?us-ascii?Q?t/NJjVrQeEJUs7TiB+kwKxKaNUx0iy0cVE2IKwpU0Mcf9GpBYnZ7GKhVJMJz?=
 =?us-ascii?Q?HkjXixZhWcxNVSps13G77Vz/kKXKavsEXTgnY8j24xeeVef9jE4PKg0WBljp?=
 =?us-ascii?Q?m/VMhRZSd+MYfFd2y6VH0Jf/zqzMB96cSJEWdwaJONfWP8AuQ+cSlQW9P7Cm?=
 =?us-ascii?Q?er+AzUzvi3GQvqt4QEeDHxcRXO1cOiPVtAyRiqfRWSmwTzJWpisnEE2q5ZD9?=
 =?us-ascii?Q?1ust8AUqCibn0fVmj7hItnWq6QqMLfbya4Ufch9GX5ZXsHSR4DARhMuqJ5ZY?=
 =?us-ascii?Q?aeSApamo6oZIVSTgQFBpAxVVSnT3UyuW1vaGLe/VX/DWLbrWITv7gc5bmgIP?=
 =?us-ascii?Q?7LMz46sPi6+NOOIRc1mMYW8RH7qOf8jRiJl6HNPorSCyQJOhaUqsXQARr3Kz?=
 =?us-ascii?Q?y/09K4uM5MeKgg02oMz3qB8Sm9RUyxw5otUtQstk7tj5csQpJm2sPwhrWoyg?=
 =?us-ascii?Q?G2upjWnaO62nrIv4RIiZ0bGthOrej16x+LA8WhBUx+Zrm9GXcRuzsYnIYwIf?=
 =?us-ascii?Q?HEwVJ3nzyxj13FSCQgpAmsCM8sKCoMdAR30TK5dbKdOLhQICxEZbHXoUSbSx?=
 =?us-ascii?Q?hsbWZub9XOkg/gbEke8UGLU+h8ofZFSwYPpj4ZmNdRI2vV/vvOJn8EXg9Mnb?=
 =?us-ascii?Q?Kv0GAMb5mDmq3PacLAzHqHRlrCsnVYUwfpP0zXrTCCxkvoNhUMd9l1WSeUqe?=
 =?us-ascii?Q?ZOcmJUZMwF4LIYtLZUgQ+kiPaNrXIk6rlklXsA8eNmKLGStdJqil4GK5V/nc?=
 =?us-ascii?Q?aOosqWUIBWjOTMtjPUTOqRzjhen5Vyd5NgVz+iIsuwwiOwOPDqKBmxoNWjL1?=
 =?us-ascii?Q?6gmzlrqb5Dp3ywpYrPpLji1LNsLurWZEjLc7retMmqY5kfEumBU75zVnSQf6?=
 =?us-ascii?Q?72CuK75Rt85RnyVdMZjyuWR75qZd9DC9OyIXWzGErRP5h2QCa8YK2lSSVk8i?=
 =?us-ascii?Q?DEF+6cxqO2SkVXanjdp74bzEJlU44gPw4vMlyCCvtSrTlV+tQVxh/h4llvm0?=
 =?us-ascii?Q?M2d5T7kh/9a5wgaDjlYRxJCCLpN4b5L1W7K79kYT9yg6/gqxhs67iz4bXULF?=
 =?us-ascii?Q?BL72slndaKBmIMnHD6hKb+AvMND8u3KqSbzmdp+PHCZG5HnxpbSD6t6M6qeg?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea72970-f03a-45b2-9283-08db0a8852a9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:28:02.3606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMKPLlgt+GkdARpnZGxdMN3jRwzRrm64vjo+XygbYAFnNUEQGrxHxr7ZLxOapLm6HK/GFD2jqxNNPucnz5JoWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8240
X-Proofpoint-GUID: YYx6DwZ-lxhMMYMN_i97sTRVnuA0bbuF
X-Proofpoint-ORIG-GUID: YYx6DwZ-lxhMMYMN_i97sTRVnuA0bbuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Existing 'migrate' QAPI design enforces transport mechanism, ip address
of destination interface and corresponding port number in the form
of a unified string 'uri' parameter for initiating a migration stream.
This scheme has a significant flaw in it - double encoding of existing
URIs to extract migration info.

The current patch maps QAPI uri design onto well defined MigrateChannel
struct. This modified QAPI helps in preventing multi-level uri
encodings ('uri' parameter is kept for backward compatibility).

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 qapi/migration.json | 129 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 2 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..261a6770e7 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1449,12 +1449,106 @@
 ##
 { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
 
+##
+# @MigrateTransport:
+#
+# The supported communication transport mechanisms for migration
+#
+# @socket: Supported communication type between two devices for migration.
+#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
+#          'fd' already
+#
+# @exec: Supported communication type to redirect migration stream into file.
+#
+# @rdma: Supported communication type to redirect rdma type migration stream.
+#
+# Since 8.0
+##
+{ 'enum': 'MigrateTransport',
+  'data': ['socket', 'exec', 'rdma'] }
+
+##
+# @MigrateSocketAddr:
+#
+# To support different type of socket.
+#
+# Since 8.0
+##
+{ 'struct': 'MigrateSocketAddr',
+  'data': {'data': 'SocketAddress' } }
+
+##
+# @MigrateExecAddr:
+ #
+ # Since 8.0
+ ##
+{ 'struct': 'MigrateExecAddr',
+   'data': {'data': [ 'str' ] } }
+
+##
+# @MigrateRdmaAddr:
+#
+# Since 8.0
+##
+{ 'struct': 'MigrateRdmaAddr',
+   'data': {'data': 'InetSocketAddress' } }
+
+##
+# @MigrateAddress:
+#
+# The options available for communication transport mechanisms for migration
+#
+# Since 8.0
+##
+{ 'union': 'MigrateAddress',
+  'base': { 'transport' : 'MigrateTransport'},
+  'discriminator': 'transport',
+  'data': {
+    'socket': 'MigrateSocketAddr',
+    'exec': 'MigrateExecAddr',
+    'rdma': 'MigrateRdmaAddr' } }
+
+##
+# @MigrateChannelType:
+#
+# The supported options for migration channel type requests
+#
+# @main: Support request for main outbound migration control channel
+#
+# Since 8.0
+##
+{ 'enum': 'MigrateChannelType',
+  'data': [ 'main' ] }
+
+##
+# @MigrateChannel:
+#
+# Information regarding migration Channel-type for transferring packets,
+# source and corresponding destination interface for socket connection
+# and number of multifd channels over the interface.
+#
+# @channeltype: Name of Channel type for transfering packet information
+#
+# @addr: Information regarding migration parameters of destination interface
+#
+# Since 8.0
+##
+{ 'struct': 'MigrateChannel',
+  'data': {
+	'channeltype': 'MigrateChannelType',
+	'addr': 'MigrateAddress' } }
+
 ##
 # @migrate:
 #
 # Migrates the current running guest to another Virtual Machine.
 #
 # @uri: the Uniform Resource Identifier of the destination VM
+#       for migration thread
+#
+# @channel: Struct containing migration channel type, along with all
+#           the details of destination interface required for initiating
+#           a migration stream.
 #
 # @blk: do block migration (full disk copy)
 #
@@ -1479,15 +1573,46 @@
 # 3. The user Monitor's "detach" argument is invalid in QMP and should not
 #    be used
 #
+# 4. The uri argument should have the Uniform Resource Identifier of default
+#    destination VM. This connection will be bound to default network
+#
+# 5. The 'uri' and 'channel' arguments are mutually exclusive; exactly one
+#    of the two should be present.
+#
 # Example:
 #
 # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
 # <- { "return": {} }
 #
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channel": { "channeltype": "main",
+#                        "addr": { "transport": "socket",
+#                                  "data": { "type": "inet",
+#                                            "host": "10.12.34.9",
+#                                            "port": "1050" } } } } }
+# <- { "return": {} }
+#
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channel": { "channeltype": "main",
+#                       "addr": { "transport": "exec",
+#                                 "data": [ "/bin/nc", "-U",
+#                                           "/some/sock" ] } } } }
+# <- { "return": {} }
+#
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channel": { "channeltype": "main",
+#                       "addr": { "transport": "rdma",
+#                                 "data": { "host": "10.12.34.9",
+#                                           "port": "1050" } } } } }
+# <- { "return": {} }
+#
 ##
 { 'command': 'migrate',
-  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
-           '*detach': 'bool', '*resume': 'bool' } }
+  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
+           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
 
 ##
 # @migrate-incoming:
-- 
2.22.3


