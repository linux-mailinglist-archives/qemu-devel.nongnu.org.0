Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD5366173
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 23:17:00 +0200 (CEST)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYxjw-0004fJ-2P
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 17:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lYxin-0004DT-Vk
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 17:15:49 -0400
Received: from mail-mw2nam12on2060.outbound.protection.outlook.com
 ([40.107.244.60]:10393 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lYxik-0004DA-Kr
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 17:15:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGZTfAMgfNhGBnmST44CvAzZDGbi+2WCdQvROoSjmyZYes1BkyoNUvo1cfY4/tnA7RhvQPI7rpyTrc0oj/mEHPPCQ+YSRVdcuyjIBBqBpzpZOtJlV9eFC/xZpbH5rlx1Plg6/44krFxm7rxWYP0JZncjZT92/JFosnEJbU7xYS8jXSzv85Lwa+lfxA+U3wjk32fntfWZ+nyPX0JE9iW/957zrF77y9ITA/mNb9sZ8tgYQrRblsG+ezs3vNoJn4MiVYnUd1eLoP8gE1zYXrCjf1CBhgFNK1v+A6aIitkXwe142qJOj5rjtjLSdPmUVlE0r/cVZ2c6sdEy857wgA/HBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0MC6ilJHGJ1ahkssx4PhiOFAXixH5lhuYbqZ4fIfpQ=;
 b=bLCeZa7orPGpId9gvAIXxLpdEzTEnPdbjOYjSx5T44XXn45YKqKPjvCIMhslclKmlC4DuJCIK6ejrs4z+6jnhpB6nIP2+XsFbRSbxiaK3CZKtcNWnPdHI/YpZqSdeqOolGThr+49jKk3+g3rTSc96rxGuJg/Q3JQzDrDhzeEKeoKrt1ldViiWyvrt71BUBDuQb70oLFEdVTFylSbH7I44Kx3SexOMcmguIj4oUAKT/PpNHB+3mZMlCIl7vHMndZzviJNDYhGg1l0BOEGv92H20Ko2Cm/KVImRhZls/olZNa0F6HNkLL8dEOgrPJ+0iOFk95OGzkvdGcrGCAaAQIpRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0MC6ilJHGJ1ahkssx4PhiOFAXixH5lhuYbqZ4fIfpQ=;
 b=EKyp0ufzPckjNXEwQGu5pa83aoI3pGhhJHm480xNWudSvKqdged6bpNpGxcq/ZvEZNJBwIlAEYkld5FEiLsIp5B8Iv+tVoEUKjnK5UneuTeRmmyRR7UHoV/xPB7U+pMM3lZdj/V6lDf82Fd5SpbsIYJ2EwaZMk67Ncqfgi6CVAA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3845.namprd12.prod.outlook.com (2603:10b6:610:29::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.23; Tue, 20 Apr
 2021 21:00:36 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::929:2a80:f737:86fa%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 21:00:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.0.0-rc4 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Apr 2021 16:00:29 -0500
Message-ID: <161895242935.457779.1922093097237292290@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [76.251.165.188]
X-ClientProxiedBy: SA9PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:806:24::12) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (76.251.165.188) by
 SA9PR13CA0097.namprd13.prod.outlook.com (2603:10b6:806:24::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Tue, 20 Apr 2021 21:00:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 651dab32-7e20-4016-653a-08d9043f580d
X-MS-TrafficTypeDiagnostic: CH2PR12MB3845:
X-Microsoft-Antispam-PRVS: <CH2PR12MB384560A80168F58FBA6FCFBB95489@CH2PR12MB3845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bQhTfvcfASpvZ9XIhxi69PP2Y4NE/q5mylDuH/EXZpGTLGm4+F8rxBbq3T+r97z6ykGtYNyBopiWi/Lj0R3yXp4SbPAxAdBCH6KZktrgi1XjVQ/FBfth+L7ydku1e/kNiGbHFOMvqsxDTlWRHaA1k0/K3N4f7uMa1otaMp3d6ifwh1RRpG920s1ppxADtLvhU7dYRO9BpGSrlBt8PB3ZQverERVhopF7zyXX0nWmK5To4DKKIUJE7N7SoikEPexcI6dDdefZKhPGXETb2cjGTnzs6RS0RgdltxQrUi2GMDaIqOMvR1c67PYtWwPGaOyxwsMulNHm1/2SMyYeBnuBdRR29ohzfhkDLbeNIhJOmPEt4ibthtrCsPjCphzpm5SDUSWomK8ZRo2YWtXmdW3S5TomtN1dVow5JcO0mkLDQyOHrXHKe9z8Oo81qacCWlfcLfhpx69MjHbmeNFlk8qbJXLyLv1cD0ZR0U2IFMoXXiLAQsqNQL1ncbB/4f76cyIFBkc/kiX9ZMauyIsORbgWM+dYWZmN/ogILWU5wPyX0z39ERBjElGMWAeg/nqxrUl5A/VtzsRRD/5yflwdCyBGvV8VM9fjazk3u95QJF6c1KRSheSe9fULzkVgWtdK2K8ZsoqGCWMTRhqxa+7BfCJ44pTbiCX6ZfpRSfD0g9SS5zaIrfYiQUVwyIJIQ1Ll8ZMIa6lzijz/c/6+JtIDyVnzByBF5onBPVQi75O+WVEr6Js=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(316002)(38350700002)(38100700002)(8936002)(26005)(6666004)(86362001)(2906002)(83380400001)(16526019)(2616005)(186003)(956004)(8676002)(36756003)(6916009)(66946007)(6496006)(6486002)(52116002)(5660300002)(66476007)(966005)(66574015)(4326008)(44832011)(66556008)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QUMrb0h6eThNZzIxeGVSb1drR3FGZkluaTY0V2NnMGJ3YVBUZFNSR2MvM09E?=
 =?utf-8?B?Y0tKV0JiekR5eDdVMjVDM1oweXZDczlwRm5CalA1KzFNK2ZBaHJHM1Vnd2xH?=
 =?utf-8?B?SlB4a2RsVnI1N29xckpURzNGV05wQ1NoOWwxdHl4NDhTNlpjZnlwNG1ZSTVh?=
 =?utf-8?B?K1RQUnF6UEZUVC9FaWNjZTZQN2pVTWxpdGJUTDh5ZmNOWGk1WmFRV3QxY3RX?=
 =?utf-8?B?enVhRytoSHJGNGJVcUxMVXVaQnEwdlBheGtKUUNMUjgzYUJ4aTVwY2cxMXhx?=
 =?utf-8?B?S0xobVFuU1hhUS9seWd2V3FVY3FlVjF0U2ErZ2hXSjNSbUlISUpJUm1tNjhK?=
 =?utf-8?B?WDhmWW0wUXpMV3Jrdm9NQjZsTGRjREZjSXkvWnpHR09QYy9xU2grUE53dEVj?=
 =?utf-8?B?UWo1eUdjbXlBcU1McHhXa1NJQ1lGUDdLTFYvb0ppLzB3dk90a3dKa1M1U0lZ?=
 =?utf-8?B?bG5WMjNab1lJdXJjYmhYamFkc2ZMNEVQNVl5Q2padFJSZTJUTEJDRVlBZnhD?=
 =?utf-8?B?bHFwYTVaUGFIQ0NDZWwvWDBoTy9KMnRMQ3VZZkU0Qmg4YjNaWVZDNk5reU1K?=
 =?utf-8?B?ZkIrTWozdU5sa0lBK0xGVlEvQ1FZU0pLenRvUVF1VDhpdDZndHBrQ053T3pB?=
 =?utf-8?B?Z3RVSlhWWjVaeGFFTG9Nd1BleU5aMlUyTUdMT0dLTWRxYmNNVXBQQWllWHRE?=
 =?utf-8?B?UmozUXlNWVpRVW5KMW5WRkQyeWpGZ2xiMVBkSmRaS281RXduTmhEeW90eFVn?=
 =?utf-8?B?ekNocmkvV1ZnZFNxY1BVaFh3OExJVnFHYzZySnVBeFQ4OEFiU1puSXBPQUEz?=
 =?utf-8?B?eWZYOE1jK3VGUzgyV0daUGttdVplaUcvOFNRUzJsaEpQWklFRmJMdXVJM0I4?=
 =?utf-8?B?R3VWMHZnQ2hEWUxHZHdicmpVS3NkM1FYSHdtMllHL3E4YXB6SXVCVFRwc0x1?=
 =?utf-8?B?UGh0U0Myc0VuTHVIU3RjRWVIVVBmYUFQekxubW02dzlmYnJBK2RJekpvb0FO?=
 =?utf-8?B?dlV5R3pFeHM2Q05YSmg4SWxtVEpkWXVXOWJObEZsUk0xelVDZE8yY3BwSnh3?=
 =?utf-8?B?UnJPUmZ1VlZxOUpCYzcxOTFzTXp5cTZpSUJ2NnV5VUxDZWVhTWJIbnVpVkNZ?=
 =?utf-8?B?WktnVUQxT3d1akFRVkxtaTA3cWVqZkNqaWZmWC9Wek5IRkU3V1JDOE9ucTJC?=
 =?utf-8?B?cjhEQWRJY0ppSVF4bHE5L1BWcHlTdGxNWUdkaUJkc2xKb203SWFtY1Y3Qjlu?=
 =?utf-8?B?U056Ukh3ZUdOUVFia0J0WUxNMUpqY0xQMnl4QWg5bjZWZnRGZ2Yxc2VYVDRI?=
 =?utf-8?B?VDkrd3hLTERrcWhmV01iYzJ1UllYWnB1L1dGU0hweldKSFlRVkI0S2NaeEtI?=
 =?utf-8?B?bElISDZTdXExbWlKbWdkbVBEcllFbHR2dERoRVhSaGMwQ08xQzdNSmM4bVFj?=
 =?utf-8?B?VnFwRHliUGo5YkYvR1lwYXBJQ1ZLdW1qRzNUTTFYNGhqUW8vYTBxTWdDRmhE?=
 =?utf-8?B?MHliSHVQdjluM0FBVkxLdld2TXRkV3BkdlBTaFZPeUpFYzFla255V2x0aUVO?=
 =?utf-8?B?SUFrRGptV1BTTzN2dCtyRys1TlBPM0hPRHd3aTB0MSthK3p2a244cE1PODRF?=
 =?utf-8?B?MjJPQ25ybTJRTXhaQ2V2ZFY2VGpIVGU1Wjk2MUFubTNETVhkVkovbVZJZ21P?=
 =?utf-8?B?MzY4UFNMQ3l0UmhuN0xQeVBVcERwVFVqUFF4MlhnSTZhc0JMcDdLck5wdXBX?=
 =?utf-8?Q?d0+rQTv9GEMLCRKWEbg56IuOwlbyUPPLOuRJ0nO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651dab32-7e20-4016-653a-08d9043f580d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 21:00:35.7803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gK1EDcRb7g+4/0Cs0q+H1izIBTiHFOUVBECNvnTz9V546DAFOy5MOlk7nniohwNLCXafEYZG4QhxL6Fj6W0zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3845
Received-SPF: softfail client-ip=40.107.244.60;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
fifth release candidate for the QEMU 6.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.0.0-rc4.tar.xz
  http://download.qemu-project.org/qemu-6.0.0-rc4.tar.xz.sig

A note from the maintainer:

  We had to roll an rc4 because of a few late-breaking bugs; we hope
  to be able to release 6.0 next week, on the 27th.

You can help improve the quality of the QEMU 6.0 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.0

Please add entries to the ChangeLog for the 6.0 release below:

  http://wiki.qemu.org/ChangeLog/6.0

Thank you to everyone involved!

Changes since rc3:

b1cffefa1b: Update version for v6.0.0-rc4 release (Peter Maydell)
bac9b87bd2: qga: fix guest-get-disks regression (Marc-Andr=C3=A9 Lureau)
ef71c1bc81: target/mips/rel6_translate: Change license to GNU LGPL v2.1 (or=
 later) (Philippe Mathieu-Daud=C3=A9)
e11ce6c065: migration: Deprecate redundant query-migrate result @blocked (M=
arkus Armbruster)
3791642c8d: mptsas: Remove unused MPTSASState 'pending' field (CVE-2021-339=
2) (Michael Tokarev)
0c5393a134: Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target=
-arm-20210417' into staging (Peter Maydell)
277aed998a: accel/tcg: avoid re-translating one-shot instructions (Alex Ben=
n=C3=A9e)
c57b27ea89: target/arm: drop CF_LAST_IO/dc->condjump check (Alex Benn=C3=A9=
e)
330ef14e6e: hw/arm/armsse: Make SSE-300 use Cortex-M55 (Peter Maydell)
1df0878cff: hw/arm/armsse: Give SSE-300 its own Property array (Peter Mayde=
ll)
ec63ca2d35: include/qemu/osdep.h: Move system includes to top (Peter Maydel=
l)
875df03b22: osdep: protect qemu/osdep.h with extern "C" (Paolo Bonzini)
af1bb59c07: osdep: include glib-compat.h before other QEMU headers (Paolo B=
onzini)

