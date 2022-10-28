Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B8261097E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:05:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHS6-0003p5-Su; Fri, 28 Oct 2022 00:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHS5-0003or-F2
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:41 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHS3-00029S-W3
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:41 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4uPEU030878; Fri, 28 Oct 2022 04:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=gWw0+PU5hEXzF8auXwQ3XTg/muhTSyMmCUtjf3h99Us=;
 b=i6fyQReeP0vXEaLeKCsPx4LD9XYEX6Tbs5+UzZSj1yXuHLGpeunoGDD6cYfyh+a1IjFe
 wZhI2gG3/OM2DS6VE+iRubfQkP7dpVB84Mfsu7kYqNpGLqwuq7rFZVuEoGDrIzavZxIS
 oKZdRlKE9ZSL5b9pB+pseqdyM6+OUV5G3JR7UhZSmynf1p0cKs9w9lHHeHRO1vL/d7n5
 LO4bQELdLuov8KSHvMslkksbTSXxrtd+Qol/CslDhrt8MBEmpFHT0a4q00L0XNSQg4S3
 dKfeu6bXqG5VkEE9nf1w+xFIvg+ftHYlymtpjuT+YaQooMp4vbCHizVa59BykpR8bt2L dg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56h342-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 04:58:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Up/8P78GfcwuySVgsaMqB9XGQE2AhZjM39UBKUyVxY6APdGQpu5+QbX8b8eOsP9+2P1vFhS6s56sqIJmYakEtoFxHkkDIdgmQX0FDi5uvI5IHzhGFFdFrOZqaA0bRXLHq9cmJrwvgD3fbC3HnE82WMp3++vGuczP1302SqOPTXbRWEKtlmptJMyzlQUlT6b+YMWfWk2k5T0RxkLwZ8moeAjwuQ+vMqfGlxZ4pj4GC3BNGgQcUt4DWhC0xzY4Y2v4OyTPG+05Oi6bKmPuL/e+h0kqMqw59TESPHu+HSTuPPVdaBt4wrIGWS2gY4gYCgXcawvUbTGIvMXNB6nO0nUGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWw0+PU5hEXzF8auXwQ3XTg/muhTSyMmCUtjf3h99Us=;
 b=L/GjoESCQiHDbFruQk93jWCUsNH+OmRXIMDpBoFmVVpJCb5+4XjJ+Uvupo656WwqhAxOlL9PvsaZsagNV9lA7vri/iZBAax+QIh3DgK4wr1CblARjlF3XICSQrw/EeTpag6xejSXUJ3S4HNwiZBlfmn+8YAuXaFZTTlRZPDX58B5safaI4ma3aRwUdGjI0c6t6t1i/Huj7p/pKHluk2LY+ravkfmef5Ht9rWlSpZoFPxgL4hDnSHsQIGi8L9o4HXLakODDDtY4hoJIu+EJdSovRd6nwG5FkRUHiFVZbITisiezS4kxPLZBt9ENwQFRqEB8jO5IW7QHQ6X79LYW8ygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:36 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:36 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 11/11] tests/qtest: Enable qtest build on Windows
Date: Fri, 28 Oct 2022 12:57:36 +0800
Message-Id: <20221028045736.679903-12-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a417a6-072c-4bb0-7891-08dab8a111f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hyOVeal98dFkgECNwZ8/+9C5FNbjmzB9rNrk0r+WD8ZHw1IA0hvNVfKZnNiqYGXrF4bzBO5vy2UvEFkDCmY94JqNxQi5aZJcxZnklrCD2zpCc2x/yOzQESdvVxG3/cqZ5zj2yPqK9B3JenEI2fehhjctR1bvFyi31wZ1K3OvcwWYYMmqm5wcRqbehziPZ7NPVh/ORB4/phxlb5+dy4gsquMs5JAjK3C9YsfFxwlCKym9FYpMCR0iSt5RFrGdku1ae30xWmb+d+hWKdi/XxntaGULSiSXYkw4edrAQzH+J3Hk21RGaHi8i+3mHxGBbDLixyLX8jrDtsVUZKJMsgRGGM3b3H2+ZOR7POjuUNXpKboAVkg4UEQWk5MutRzPKzfD2R2SUowuZAlPHOpr/+2G3TktJkbGZBA6/cVwn1YQ+DKSo05LWyp+xaMnj+usLQ39QZPGKtmM2ziP6z9wKpyF+XNUUQk8/uhWEkApG19aOVA9VJcSr3psliMj4Z1jtMU8W2TLpFA5+DZ1A1bcG477fYGGij8AyrFrkynC6gIZq9lG8sWcREIIBjwHCEuQh2aRykz032v2qdtWTb8J4AoCw5bXqGJLlPjZcoEonW6glI1Epzr3hN20vBEFsrejYPbqdgKQoO7RGMrxUtWPPHKw6C11/yYyuq0KeZlqfjPdCLcng7VEMI7Kf58TiQbtO8HPEbcaK5TzMNlnwsZLxvtGzdKJ142RMd2Tv67o6F2t+J9oAp8GIdCRZ6BGU1DdGLtXNzrQZkOjvfNrG5aXtiVFWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(4744005)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2hPSkE1YzFYRThpdFdHbmR1dlRPSXVJSnRZRmVEMllXRUo1LzZWUDdYOFNv?=
 =?utf-8?B?bjZ3dVNkYnVPU2I5WkF4R1k0VTRuV0k2VkZQYWdDVHNxODRQdjAzMmNzd3dj?=
 =?utf-8?B?QTk1cGJYN1p3TDM5eWp1SzhhVWZ1UmkycHVDakZqS01DWldUa1d5Rng4QVZW?=
 =?utf-8?B?Tm4rZmJrNHBTQWM3R2Mvc2xvc2FLNmpCeTFxTEpPS0p5TVVDVlhybzJKWTdE?=
 =?utf-8?B?eWk0T0N5MEtNV2p2UlRQSGlRMTJlNjJZb3NiK2M4eGpISWpOdHJONmV5TnYx?=
 =?utf-8?B?TzhrVWFSSVVhSldncnNZaXJaZ1QvcGE5NEV2WGRHYjJKTkRzUWJVVVhqVW11?=
 =?utf-8?B?MDhNNmViS0ZsdVVGR3NMYzU1LzNlamU0Mkxxam5xS2xuQmwwNklsNjh6MGlr?=
 =?utf-8?B?a2dFck5CemM4VVdRMm1IYWxKQzI0bHBEUFZrb0dZOGxNUjdGODNKQXRPYXk0?=
 =?utf-8?B?eTROdlJMRUdMZGtlOHpLbkJIcGVQMGQ0RFNPU1Y3amVuZmQyeWRULzBWS0pH?=
 =?utf-8?B?Z1k2Z2lJbjZ5RU5vRGZXN0dCVVJ4K2YyUnJ0ZmJ6TmdVTnltL2V0cFNZa0lh?=
 =?utf-8?B?cFp1Y3NpOXB6TWRSWmRmZGMzbmxFN0R1YUVReTVSN2ZqVEI3cUZIdzFwUXdh?=
 =?utf-8?B?R3BIUmVJTTBnWUtqamRzKzJPcUhqUTI5bU1NdHlnWHFtMUY2S1daYjNnMkZj?=
 =?utf-8?B?eHliT0dncjJDWTB5VnIxUmJPWTBWTkJGR2dSRUY2SXNFRjNBQWk0S1JUQVgw?=
 =?utf-8?B?QWUzWVJKR2U0SUFnNEF5WW9naGVUOU12a3pCSlc2WEpsMGtqTDdTUVdDbEg5?=
 =?utf-8?B?OGF4VFJwSUR3MnB4eGY5MlN1SXB5bUt3OGEwbEhYcnFFSnJEZlhHTlJZUjc1?=
 =?utf-8?B?ZXpZd3JwY2VHNFNMK1JCbXBxcG8vWElGbmluRU1zUDd3UHJIMHdyWmlvbEE3?=
 =?utf-8?B?QjZTL2l5NkdKSW41U1dIL2hRekUyRUVKMWhCMHBaM1p1SXplRitGOXF3RFU1?=
 =?utf-8?B?WGkrQkcwTTI5dTRCOU5sbjVRSitlUCt0Q05qczMrbmx0YnB2VDhudXVad3Vx?=
 =?utf-8?B?OVEzUXQ3WmxSTzlMVFhJT0tmK3o2MGF0NlZWOU03OUdJMk95aGVjaXBjYTRG?=
 =?utf-8?B?SittOFJYeU5JbkxMakxtMlZZMnhjTGVVb1Zwak9vbDg4ZTRKdFV6aThrNUNC?=
 =?utf-8?B?WTFrZlpUb2pvUG5zZ0JzZnc2cW9rcm9uK3hIemRyZ2Y0QU9jZ3hkRTNZYno5?=
 =?utf-8?B?Qy96TUhvZy9GRlJmL2hxNFVrNm4zbDArSTR0eVRCbVBLTytZLy80ZjQ4ZkpG?=
 =?utf-8?B?aEYyS29sUG44RmV2RjRvYkxTeG5XSkdSY3p1cmRIWTVuOERnc21pTUFyZ2Zm?=
 =?utf-8?B?ZGpLcnFyVkNESC9BbTF3K3RQSkhnSTdkNGlOTWZuYWFMQU1EcjcydWREUUtW?=
 =?utf-8?B?cy82OURSQS93NkZvL1ZadGV2YmNjUktHelJWRmpNQnpnY2c4cUs5VHBLN00w?=
 =?utf-8?B?OXM2Wkc0NjhXRTNka2M2citnUS9nSUR2VmdJRHVBWStKUUxqZWNjR2FVbHJl?=
 =?utf-8?B?NWpIOGNZVWp2VlZyVWVWZm8yQ0FHQkw5Y2k0ZjFvMlkveFluZlYrc3c3eHZ2?=
 =?utf-8?B?NVc4ZjhzZ0xITWh2NHpqeU5MdmJoV0hvMEYvVzZWVXhyOFI0SERDdUU3SUFZ?=
 =?utf-8?B?RjQ1RGRZY3plYUxrbnhnZXlYR2ZXOWJrNEdqN0NIUTdxTXFPVjJzSVRDbkNW?=
 =?utf-8?B?SlFkdHB6LzBvOUNSZnVVbDF1bDN2ejIzVVl5NS9tS2I4WnBQait5ZWJINCtR?=
 =?utf-8?B?dU43cDZQVVpyenBUM0tUdmhGUTNNZ2dtY3c4ZkVqSDdyZjFoeVJaUTJKVngr?=
 =?utf-8?B?T0c5SWFHU1JxK0xsNXpBeTI4K2lvNGZHbjR4REpjZzA1THhuOFFTUjFZMnZx?=
 =?utf-8?B?MlFQYlM2STVLdU93QmVSRTBNT3JDUGVraEtERjZ6d1JhTWdpRVF3MFpSZFFP?=
 =?utf-8?B?RFZPWXBhc1U3ellKeG1jZUtPWW5yMGhSZ1M0VXV4Z3ZJTzJCdDZDM09CY3FM?=
 =?utf-8?B?ejhOb2IrNTNOcXJtYWdybXlSYUdIdE95TWs5SXM0UTMzZTNhblJYZGZnTHkx?=
 =?utf-8?Q?UWiIYFsgVN4mBsonpKyxO681A?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a417a6-072c-4bb0-7891-08dab8a111f1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:36.1159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BIGA/pFWqU7mQGsGELZCzHzYoGlAjneL2geT74a9S1Rhbv0daDPSb8fFvgnvnzDWI/LHxiSNBqP7KbeFBkjIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: I33LnYdFN_fcfssCvfGVUMreRjaBzKt-
X-Proofpoint-ORIG-GUID: I33LnYdFN_fcfssCvfGVUMreRjaBzKt-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=620 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280030
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=7300ee25fa=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
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

Now that we have fixed various test case issues as seen when running
on Windows, let's enable the qtest build on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>

---

Changes in v5:
- Drop patches that are already merged

Changes in v3:
- Drop the host test

Changes in v2:
- new patch: "tests/qtest: Enable qtest build on Windows"

 tests/qtest/meson.build | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c07a5b1a5f..f0ebb5fac6 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,9 +1,3 @@
-# All QTests for now are POSIX-only, but the dependencies are
-# really in libqtest, not in the testcases themselves.
-if not config_host.has_key('CONFIG_POSIX')
-  subdir_done()
-endif
-
 slow_qtests = {
   'ahci-test' : 60,
   'bios-tables-test' : 120,
-- 
2.25.1


