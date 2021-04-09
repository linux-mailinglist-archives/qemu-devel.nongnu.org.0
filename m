Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D8E3595CD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:50:17 +0200 (CEST)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUky8-00054W-Mx
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Yanfei.Xu@windriver.com>)
 id 1lUkx5-0004eF-9R
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 02:49:11 -0400
Received: from mail-dm6nam12on2063.outbound.protection.outlook.com
 ([40.107.243.63]:52808 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Yanfei.Xu@windriver.com>)
 id 1lUkx2-0007oL-KG
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 02:49:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbwWuk6eOx6GGBsAI12h7QBdrw512BhW8vk7zy6PZVmg405faPMOLe6+XyKZ6hqHonKAU3SGYl6cWFnsHsrCmaeIyqPrg/vR/Hd7ZqHx6oJyxAhfxy6hDUPOpZUvGh3VmXABOxjFmNceHyU0J9m8jcRPlJRe6DY1OPkermR4Cl/tNkfldsbxfJ99OwCRWJu7U244CHFgyTR7I5YZ0DK8M2jYTlMmPdkKUhP1fKQGj3BtvQXvCalGmPnIzOp43XrRDmiWfi/qAj6+Pev+jbkriDatDjxzlXtgQuhrcs6r8IenojwAOEQvF0c/XiZnXws5t6CIQMcJBY712THOeVKh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6VLzst7zuordi5pTg8vVQDdB1TMAqDe4AVszzKsCO8=;
 b=L1GjHBMYVegeAWy+tRPhxJKEp4ngOrHP0UxhVPiMsZCSaHFfnFHJPQF9G8xfnFCE1lGBszhn+7+3whrsOGxEd9D8Tua5JnoQvtHF8yA9xBo8i1SligbnLnLiGMANDLiMrM23Opzg2YDrf+3zo8oe/sb3ss4/pX0gL9TRK89B8zqpVYwCcL1KCl/kV3BbBYiNH85a60oKjGVg2TNl6UoUj5nn57FZ42zTFqeuI93WoLcqNjndM5I9ktiJji2M9X9nestkzfAMMAW5h75pd9YDs444Qm2FxBWwfgo39j1C799QfNW2PMWzRZWLql/AvnpUmPubQUkyLlBtcU6a+R7PFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6VLzst7zuordi5pTg8vVQDdB1TMAqDe4AVszzKsCO8=;
 b=cNgpguQI0AhwfgHqs845OOGpX+WMS8KmB0UWMvMfTHMfp8BcdSbTEWG5MdnZdOJS0KsdxJw2rVtiifv9Jd1x9gPfB6VbaRkeR4nZAjJls4PA+GfoBCQWXNiZQxs6AY2sjFyJTxDR40vkbh42byEXeMlEuEy8sZJMMFhJxZ3gXYM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 06:49:05 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::551b:e310:2ae4:3011]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::551b:e310:2ae4:3011%6]) with mapi id 15.20.3999.032; Fri, 9 Apr 2021
 06:49:05 +0000
To: qemu-devel@nongnu.org
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Subject: [QUESTION] qemu: how to control the switch of floppy drive
Message-ID: <910b1361-3b9f-ec80-794e-fb335b0ef631@windriver.com>
Date: Fri, 9 Apr 2021 14:48:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by
 SJ0PR13CA0100.namprd13.prod.outlook.com (2603:10b6:a03:2c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend
 Transport; Fri, 9 Apr 2021 06:49:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b00a0f3-01df-4e33-3ab5-08d8fb2390ee
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: <BYAPR11MB2952267AAAEB147626EA272DE4739@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NoYxRim1cEGxAy4+wcOz/UxzaImommK/41+ULnbN7p7LW2VnfJoyZTA/g1q0OuvcileNxXNCNmt5MNhRVLigcaVpJwUSxBhLLAE1HFLIpYB2FOkiHpNH/8OQIKpwkBJtCc85/grpZbvCr/LFhiYDTE06z2PXHf7dgOnUkkHwNqkXiXaghMby2nUaFIEEXrQaldG6wx7LBwoLzzSxz1OEGv4Fs/4Nec4o7rs7Qj1hUAUOMjEbXR+ypu//3Z6dEiGJZX3wvQtu5/nrKdT6m+n+KHB3o47r2o6rYIFk7gd1t2yjXsz1DJhqWx90DogxZLp8BKfgIJunpi8l/dbBpMFB8whOLMHe6Lnbp+G7Yy+shTt15NYeQxL1WctaWeWbkTjH9cJVUTDpu188WtqlHa/mJfkHpVNq0i7oIGT4w923IOMvXn4vJZTfc/wonSmUFSsW23+vvNkp4TAoj7BJHpBXRYXYIgInduZPgbIdNs7bC4kNSGTU5h1cXj/YFQZDIsxrR698NPvystS6wcYs6Qw92ZegzynrzwJoTdwMwPdL6pw6NpViu5rYZY7cFq63dwdpt1uYOSP0IDJAUfVeK96jvPZfWYAG4+ry8c2cP5LtSBVFjvzeLIa7+8YCSnNDurfHdWOCQkKPanbUiv474Kx0wXaSZ5p3/VcRz5T9qBGpZmyhoArtC8j3HjQq0BYcpGgxKlJIJmK4Sd7RhiwL+G0BX/VMGuMFfx0hKaHvtVkrtf6J6HAe81vwA4B7e5EqqTVr3EbX31JeeIYGKl4efjiaGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4241.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(52116002)(38350700001)(8676002)(16526019)(2906002)(26005)(8936002)(6706004)(38100700001)(186003)(16576012)(316002)(478600001)(66556008)(5660300002)(66476007)(6486002)(6916009)(86362001)(2616005)(31686004)(36756003)(6666004)(83380400001)(956004)(66946007)(31696002)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YVptSTRaNk50Y3lCaVJBb0lBQ3Fja1V0UTNsY0lnNThlOWdqY09nYTBwSXNp?=
 =?utf-8?B?TzRvbWhobmJ2UWpRVWVFT1NJT28xTFdlNExsbnRTTnVLMmp6RWd3N3NyV1lj?=
 =?utf-8?B?KzM5eFA3c2loTnA5TW0zMk1tYUw1by8vQlFoZXhUU3d2RFhqLzVzNHg4T1k1?=
 =?utf-8?B?TlJYOWdPYmZlSmJEa1Q2SXQrRWR6RlZVRWZIMG5jR1Bmb0x0enNhZVZzRld0?=
 =?utf-8?B?OVlCMjd6Y3JmaFFEdE4rbERQWVVDMnRNN1ZDejN2c0dQMkFMdkREeVpoUWNm?=
 =?utf-8?B?ZkF1U2ZkSUpJK2tqRkxqYmZxVUZIQjN4ZkFYNjJSdUhESUhCUWlBK2E3WFZB?=
 =?utf-8?B?TjE2a0tORW9sOUFvTkVORDZkYzk0cEpGUkpTUTZaRVVqczhxaDE3TWwwZyt4?=
 =?utf-8?B?WGlub3AyZ1lOQmkrVjEvMG1wanJ0YnBjS3FVeWI2YktrTnhZcFkvbHZEZGps?=
 =?utf-8?B?MkZwQVNCd3pSS1lwZU94RStDQ0dlTmRvWGVISnRBQ2VJNExFcEoyRjBHc0xG?=
 =?utf-8?B?MUhaN1NYNGdOaHpFdmVPeFAzeS9CaHRGME1la2tET1BtNzJRMjJBdHd5bC9R?=
 =?utf-8?B?ZmZibzNmU1c1eEliY0dwck82UjVRSjYwZlNMRk9CdmpsVFZkNmtad2hmR2J1?=
 =?utf-8?B?WDJyUFZUUlZnaEVWM2ZhTnFNdUJJQkdUSzQyL0tsZXgvS2Z2cC9BaTQrbWYw?=
 =?utf-8?B?eXc4TVBVdmdGaTFhdHNmZHRKdDBMMGtKdXpqcjJmUWtMUDNqbkNYWHhRRTl3?=
 =?utf-8?B?VmVaejFBWVYvaFNyb2FGb0ozOTU4eXhlS1RwdkpWRTVhejI2YkY0WEhGNDhX?=
 =?utf-8?B?K05aQ3B3ZVc0ZFg1bGtIQXY2RGM5UlBQOEMyUUlkWkFFY2txTjRoa0hkeUp3?=
 =?utf-8?B?Z29iQ3J5a21jaEpVRW1lc3h6dU0rbFFGYUZaZXp4eHhVNTdQUjU3QmZxYjdn?=
 =?utf-8?B?cUF1Q3A3c2lYajRwT09tVU9qZUdxb2RTNXg3Z1g1OTFrMXFmZ3Q0MGNNVkk4?=
 =?utf-8?B?dmNmSkt2ZndNTEVZTnVucFJNL1psQXU3RFN4cEJPS3ZsQUEwOU5oYlg4OERw?=
 =?utf-8?B?dVpwUzltWEVmM2haZk9ya2F1S2tJQm1MVDhMUjRlVjMrUDVYZ0NjTFh6STJz?=
 =?utf-8?B?NU5jYk9LM3U0SlRDY3ZlbWJYb1hqdWx5N2RVNnM3V1BpRFVuenZCRkk0Snpp?=
 =?utf-8?B?eTMzL2toUGJUUi9FTzAvOU41NFhEdjA0a0hNcm9tdFZJc3BtOUVrM0d2VWlU?=
 =?utf-8?B?RWtoZzRGSmRld2xZU3FweEVTayt4UWkwUThobU5nR2tyUXNraG04ZUlNV3VQ?=
 =?utf-8?B?b0Z6TjFzeGRSMkhTT1U3R3NIZGZMbzlSSkR5WTBaQVl0REpnRUFkOGRjZzVC?=
 =?utf-8?B?TTdHM3VTVXAzWllJcDdiVWwwMDZ1c1ZveFNtRlQwdm82U08wZ2ZyZzhiYnFK?=
 =?utf-8?B?aDJkQzJqbGlQZVJkalRSRkwybVhzT0ZXczU4MmFIYS9WaG5XQSt1RlF4em9E?=
 =?utf-8?B?ZVpQUS8yNlVEajk1RGkwU1RxS2dtM1lJZlJmSVdpMU1TZVFTQnlPV1VBUzRl?=
 =?utf-8?B?SHBCR0pDaDNOSzRWcmZtRUo1aVlrVzZPWWhNSVF4bm00c2lsWWZZR1dBL0lK?=
 =?utf-8?B?aHorRSs4VjZlWEk5dnM2VlNneS8xM0JhYlR3bnBicThBSk8rdzN1Y0hMcmFP?=
 =?utf-8?B?cVVkNHh6cHlROGp3dlA2SndtUDR4Q1hUOExTaDFiWW8wQllOQ0xERk5lcVJ4?=
 =?utf-8?Q?F/TVPAKFTrlA7w8eirajkqfRovHb/BIiOF8gSIS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b00a0f3-01df-4e33-3ab5-08d8fb2390ee
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 06:49:05.0052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gku1fjRb7rg18cPFv65Eax/0ocI/zJmmNFB4BQY3rFkOtXiYSiegrWWj//VkhDVFmD64FxmyKBV+CwBekoxqJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Received-SPF: pass client-ip=40.107.243.63;
 envelope-from=Yanfei.Xu@windriver.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi experts,

How can I disable the floppy controller drive when I boot a VM by qemu-
system-x86_64? I did not specify any arguments about floppy, but after
the qemu boots up, linux always can detect floppy drive and then
modprobe the matched floppy.ko.

qemu version: v5.2

command line:

qemu-system-x86_64 -device virtio-net-
pci,netdev=net0,mac=52:54:00:12:34:02 -netdev
tap,id=net0,ifname=tap0,script=no,downscript=no -object rng-
random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0
-drive file=/path/to/images/qemux86-64
/qemux86-64.ext4,if=virtio,format=raw -usb -device usb-tablet   -cpu
core2duo -enable-kvm -m 512  -pidfile /path/to/pidfile_4167420 -m 512
-snapshot -serial mon:vc -serial null  -kernel /path/to/qemux86-64
/bzImage.bin -append 'root=/dev/vda rw  mem=512M
ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1
printk.time=1'

As I konw BIOS can control the switch of floppy controller on a real
hardware, But how can I do it on qemu? And does the qemu enable that by
default?


Thanks,
Yanfei

