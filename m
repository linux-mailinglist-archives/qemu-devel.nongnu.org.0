Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D44A609A69
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:20:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYn-0004uL-Bt; Mon, 24 Oct 2022 00:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompYG-0004KV-Hu
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:59:05 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompYE-0006DE-U2
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:59:04 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4wo6C023768; Sun, 23 Oct 2022 21:58:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=olQOEYv7nNzRorXdnDXFKA4SrIIv6h/+VhWOvsF7C08=;
 b=PSuOuw2KqKcb9qO6jhKWbSYS/BbVe0R2HrWHYZR2UWldDxRdM5AFKoaP45rRIrWoqWSU
 Zy8G1ouAGmoXvuAWxHwPfM8Wgiaw/YdTOBpqEA/ah4lEmHF/XzYX8+8x1qFm0Sfaqy1v
 wxV/D/hzin6ZCMrH36myZDGwD8XNMw/TSLkdSTXRefSQ40POtUkwlR+Tpt8RPa0oH+Q4
 LCcMA9nw8BydYTVOT+GFjRLcWP3ExoCotH9u8/0goDwAYB1THtwWKrBP42zteMFwKMDM
 djX8xyp2aKiEwCMy8F+54AYdRPolmfJHO1EwREBl8Ux/BMfNxaiKxRGqB0mmS29Af1Os yg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kcbt51s1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Oct 2022 21:58:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boy4sqOH5g4fftPigCxTQ3TQgXSFr0oVMlR/j4fHFRH7I9bkXgxFUT8wjbiF2N5ofpzP5UgvS3WkzVtCJV6+9oIXlICicmpCUh30K54t8vY3LtA3eTUXCd+M74BXq+gI48k6LX/smnKoQ5o+mAHkUV9+up7XyBlrHh+Do+DKP2f2W9m/LChW0PZjo7E6pJ6UGz0V6nb6SuC7IQ/CHecyKNn+3HOX+/PYp5p+mZrDykJBsokc7p+aiv2YEYGi8Hid6sydeGlq5LJg0rkvUFRWset55R/9vaXpfX9DsnYwt/0WDfDQNy8VUEaQQcaWVq2cJzO2HUevKwfDljoKve/6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olQOEYv7nNzRorXdnDXFKA4SrIIv6h/+VhWOvsF7C08=;
 b=kwdNF+hT9w45TfLIiSJNgKyRc/vTTfr5ujLb76H9fsAFltaS1gGJa4L1OLjXDuRJN7xdHrV2LzaVrq45MnEwuX5UD14UgZVSH5MOLh9mi+xgmpXqnn8vpbquK+oG2mHKa664secI2kFii74sOF5tfKj7vyaTwYc9a0UZBqHFOOFz7unI161VVrQ9QUISuOivzJ6v/4FSfNu9LI+2YfqfdknZaFKYSWKOTXyLyqkkccWBEq7e8ajcUT4ELvOOWHQZQfvwPu9ZifTRvvcuX4eJBZgKHs0w+wwt1iSIaaVybd7oaNIwPGqoMa3QJ5jCZpGBuMWtP7XVelqUBJuvi4m10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:48 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:48 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Greg Kurz <groug@kaod.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 15/16] tests/qtest: virtio-9p-test: Adapt the case for win32
Date: Mon, 24 Oct 2022 12:57:58 +0800
Message-Id: <20221024045759.448014-16-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024045759.448014-1-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: caf3e498-6f05-4ab5-7875-08dab57c6ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mce+lUuj1iGQpRAauiBt1Y7Ic5QzBW4bAz9H1f6uKja6qBQcsoh8e7AYyXDhEABLoopRHQN0sIQycnNOeySfPo7JfyXOrLrNZKqgbdhia52RIuYYDJFI6JmyVLgLDYUvcZa5h01ZicAHL+D+27w+0MPjs8qPFcJ/zq7cNy7t0rUoZSSxRxIizdVtoS2Tlyy7kI2FMxoua0BsqE+6Om0vaNCWHNbvSiBYs8HpF1xMWHrzAa+5dNCDSeppAEgdryBVOMdEwo/VeAXhAxqszDV8U6oTImcUa91uZvwr1I3OhgcBjn/n2w641GQaXCXxdV8yGR7B301MIQEeUICoPqNp+S2b+omvaMDgIoIj+mq/wu+eBLsz4poMJNkh7yx3iKTL1Ry0t+pdUh69B+kZeL5BAaslaU8n2yFpPOeRWQma4G0ndCj+iElRpkUtZDI99bQqNsg7N4W2KTS2HNg+mO1cEGIs3GTRnADxoD1/vxlnyyoDIQZZtPQ49nmVqbN9Lu+uDgGakzsz/ymv45bROf9lrT2rHGhqKl4AmpLrljfoH0aC+pjEsCojxkfAcgxDRYMZ+pFQhqMlvVkmZS9VPLFNNJ6cDdVzlmIvu9E73TxHqf6lw3AhBfHYLpdVrPyEhopQWaZ9Tpt863Cf4vhdGZFgBVYOigAO6F/+QJiISA1QbaXDjTBf7AaLtYpPdPR8kX7b5JbFBFeJnKt5kQoy/lmoLDF7izh99w7oUB5xtoszqiPgspwPY3ly8WXjnl+QhO53mMskYwC3RyaM/RwGpT3plA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(44832011)(2906002)(4744005)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cc+IZzSGQQDXSGdYWb/9W1YfYghZxrzDhC6WAKYXlmVu2Z7lbn864rfbxpSg?=
 =?us-ascii?Q?9M892Pz5RGAHB1+9qDPP3n66sMbWJIlIEeZOhkHTFX865rJ2/BQqNcAOpAdn?=
 =?us-ascii?Q?cHG0l5BhHmjA0ok5jEEL9F4FtpHznc3eL1KS/WbJ5XOmYOU2Ict+G61cAvBa?=
 =?us-ascii?Q?//lF91SCGH+8A6WGuG/bciyISU1yGKvn/i+3SqgdzOR69mQsn+u93cTSBPI5?=
 =?us-ascii?Q?yxSSh3lbmGOXAjKPueA0o7omL7L5KPvxM0fL3lA+9g/XU6d+efqe8q0nyyDh?=
 =?us-ascii?Q?nbvh9SeFYPX+sb8Y5HazfiTWzbARm/SVLQrcftjoNScLpG0jeebuUu67S7Gj?=
 =?us-ascii?Q?z5NBIfb1Eq+4P7nTkDgZRZEuEAuDUVC83IKxR0/EiqhcCVmexFipoKRdKJXx?=
 =?us-ascii?Q?EQ4TfX3aaRaaOkObSuVo6pkRQ2UhzFrR3+n0LtO1JDShhHPT2y5rkxpu5IHA?=
 =?us-ascii?Q?2JUNifgYoCQpUZf23PHBvzz4uXV5Pep+20DO2cCg2ZEp5SZCuI/83yHRks+p?=
 =?us-ascii?Q?eyLLqg7SMrBc794/gQ98I2oSf6dNKcKPRx5RA6kHzr5I9aLC1ojJ1KYURYmp?=
 =?us-ascii?Q?aT6f81hQfEBP4P+ILIoAm7sY+UxThH7cT3bscEz9ThmhpzWI2R9+IfovfjhS?=
 =?us-ascii?Q?vwsdBRh2Tk9gNGK+uA29NH/vUv0SjQ/OPXoQlfeUJlTB+ouI9vCBRzb8VCx0?=
 =?us-ascii?Q?yCf7B1AlS3uyaCNaaLYL3VWGTi95VV3W5bB8zcsMh5SKQqDabQi7us7n78Ny?=
 =?us-ascii?Q?VueiZRTV3+X39ERSISFhQgaueHEGVCnqnXpHesgRoIbhE6e/TEXAtRxhGiu7?=
 =?us-ascii?Q?OlyesRWiAWb19lfSlv9oMmujnbIE5TUhqmYqplehCCNEV26s/8etj/LNt29j?=
 =?us-ascii?Q?7nJEI1910/OHjYYXLJF7PJQrD1W1L0FNkRmhZsaVXOlIBzauc8Eb5evPnWle?=
 =?us-ascii?Q?oPABG9Ypg1Pv+1C6DGbud1vch3Ev1Hk0VZIL85wkBY4xg+mrnBK/dE1Uqnb2?=
 =?us-ascii?Q?80mLGGUNEmu3eOu7UkCbok4T20dVm2QMZ54QpEPdKrSo+LNVTwwBUttV4RFe?=
 =?us-ascii?Q?4Npj5PFfJFbMt75s7yyO06NsPQfXGydg9ExbxM639ptL1bh9og8cpsXwruaj?=
 =?us-ascii?Q?mB9osCAcl6u92Oxio6bdo3AaoJAHidTvTUEeZmLZO9UBNnLMPL7z/ajWpJpx?=
 =?us-ascii?Q?r7G7BxMB6Euswrw5XSoed5i5LjkPKioptD5ZVGJ2M4xV7sXSiY9I01er3/oj?=
 =?us-ascii?Q?8kWDA46BLrbEbVgRPte6K28IjGo83xeiPWA0nbbDKJqV/JCfluhLLB56aeAk?=
 =?us-ascii?Q?Ty/1Zm7Lnrq9m3AnI9W4t5ExIzOtUl3L3siv7H7pv4syRdaNdPevfStz8TOm?=
 =?us-ascii?Q?qWMzVRgFwK4ur6pBVjwvbGIbzFQ220TRG8tu55puwwRPCt8SHG/RcOMzdT/H?=
 =?us-ascii?Q?JkfeGauZLJhaEvim5/zJIQ73tddj63AEMjhsji+Vjt/k3a8OwGHB4OO874jg?=
 =?us-ascii?Q?TmFvOJLLgO0rNwGZkVfTo+RQti6V+KqO8LOca6QG0vbOY9u+/LeyB7Id02C+?=
 =?us-ascii?Q?szao11Y5ZJ7njQT+cTGzQE7fEu9Iy8G2ntQtUX9+FPlmHKuv/gdw4jt/zqIp?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf3e498-6f05-4ab5-7875-08dab57c6ffc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:48.7766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zG7yF9Nt+STGNqjoiwQIeXY8hirdybqvSv/4PO+e1CEAXguOzOOjpg67mcoo0llpZb+eqYbAA53VYjmsnu7k0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: 7rDIQaoP_blqt-L1pXPlIiQvfAUoFh1g
X-Proofpoint-GUID: 7rDIQaoP_blqt-L1pXPlIiQvfAUoFh1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Windows does not provide the getuid() API. Let's create a local
one and return a fixed value 0 as the uid for testing.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/virtio-9p-test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 25305a4cf7..e81e3e3709 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -34,6 +34,13 @@ static uint32_t genfid(void)
     return fid_generator++;
 }
 
+#ifdef CONFIG_WIN32
+static uint32_t getuid(void)
+{
+    return 0;
+}
+#endif
+
 /**
  * Splits the @a in string by @a delim into individual (non empty) strings
  * and outputs them to @a out. The output array @a out is NULL terminated.
-- 
2.25.1


