Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BB3C2196
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:29:25 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mp2-0003WY-4j
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282436cc89=yanfei.xu@windriver.com>)
 id 1m1mnX-00024b-SU
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:27:51 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238]:15338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282436cc89=yanfei.xu@windriver.com>)
 id 1m1mnU-0004yr-UE
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:27:51 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1699E6gp021543
 for <qemu-devel@nongnu.org>; Fri, 9 Jul 2021 09:27:46 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by mx0a-0064b401.pphosted.com with ESMTP id 39pjyhr147-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:27:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHoVwkjuonH4rGTO/YLKE+533i7TUX1xUysMN6mtRtRNnF/7LtLNI3pWWqYozdGL6WtfS7IpZSuYQZRezxAWi/MzXWHSG31jtSA8ewLk2to/OmjoZlyN3k7YwAL7PXXsVUsfuD2vzU+CgA4Tab80XsRCiVnziLB2jJ21L5cXmVmQo6UZT3jihX7wyWVGxWAOdhiy9Nz8JjxJnbNlfd5ujAtYje8pIhk43j0RpTmemgKjwt6LX+4TF8bhpm/8IDIUw+86YAOknSf9M903K08ScTAQEv7ONZW/E4aibWMbSKkFfbkQ2ouHKG4Snaaj7yHco7OPf0FTw7SNGxKrG5RLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3F4wvmaE5lmSnD/ymmy3F5U4Pwk0zXia9sa+96snfw=;
 b=lvtrmLqFxM/tyeyClxoHDwAr6Dv+aPxAagwLGZmLqltWuHoTov4d0CQ3+7SyfYrMWYfHfGkovdyZ/z3tkk7JjhTNg6MIiWA0sKCkR6NYY1zcKP5+KsimAQFx+UUxBbYnJVyrjM+enx3O1ThDTiGxDPRnsc2bHwQQCgamEY5d3ZeZXpIRxGSIBrz6rO+uA1RlG14gA092P6hHcb92gYoJfWQrg+lx1LxDLm42w8WQbfLrrE+/PSvoGMaOAZxjq1/LbfC8CUjZ5kvb0nCcugUQYji4Cw4h5CTwP+g7FRLqvKReZEC1tWGjY/8/TYcABaJtCxKqRox19SsS/b8befe0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3F4wvmaE5lmSnD/ymmy3F5U4Pwk0zXia9sa+96snfw=;
 b=apg+PGQB+B/TTBFOXAHfiO3aie9KxZ9myLYHZCpgHi+y/raVqPEDOP6ulvkTUT+4GGk3nV9rDzST8fII9zJnQi9C1/TuZq5nN0ShzjDmTrkWa1HyX2TB4A+d4LQCc5d4n2P/AJUBTRHWe+TwFyhJjrzHffVXgqSh2xnxfkKaeHQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=windriver.com;
Received: from DM8PR11MB5734.namprd11.prod.outlook.com (2603:10b6:8:31::22) by
 DM5PR1101MB2108.namprd11.prod.outlook.com (2603:10b6:4:53::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.22; Fri, 9 Jul 2021 09:27:44 +0000
Received: from DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::bce8:81f7:f5a1:af19]) by DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::bce8:81f7:f5a1:af19%8]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 09:27:44 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Subject: =?UTF-8?Q?Question=ef=bc=9a_qemux86-64_reboot_hangs_at_=22reboot=3a?=
 =?UTF-8?Q?_machine_restart=22?=
To: qemu-devel@nongnu.org
Message-ID: <fb8ac165-0b49-5094-e036-b98b0c83deed@windriver.com>
Date: Fri, 9 Jul 2021 17:27:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR02CA0147.apcprd02.prod.outlook.com
 (2603:1096:202:16::31) To DM8PR11MB5734.namprd11.prod.outlook.com
 (2603:10b6:8:31::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by
 HK2PR02CA0147.apcprd02.prod.outlook.com (2603:1096:202:16::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 09:27:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19a3537c-e676-4fd5-80c2-08d942bbce94
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2108:
X-Microsoft-Antispam-PRVS: <DM5PR1101MB2108D3C89E9D61DDBBDBBFACE4189@DM5PR1101MB2108.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKlWiN96ciXvxgsV0a4u/SCUPq2aOLClOu7/cFPWcQHC+4M7k361MHC227nTjt2v5MGV4vqhENp3HDu1wuWusOEnqun2UzI0iJ3ZVuoqpFG7TIZ/WfYBrrLlvIp+et3Re1FyyWil96LCEisp4Fj1KUT0N97IAhtVA7kwOwjPBK3LubiWISZoOelzx9e4LQCzCrAQ5YYJvBG/JAZSpntZrgMGo+qmU5NffDWvTc5tg/m/TH0ltm8fPBh1C2YgAEPAyFunN9mAF43HaQcxON74tKPmceljglncMZLD4mLYfP2BzBtcGFdnX3MwPC7keKsUZNmFb0ZxThPGKx/p6iJImlEgbSFwPNd8n6rz0oLN9x+gscwoJ17KbP/buCYUPwScA6ZJFZmvSVcDvhSTMAaRgPVRS4fXnakJ3bnsBRkjDKoqf7a7txRWCLMZOnM1FaqSD4IpkxrECzjdrkei7LqU1eejoxmgVp/8Jk2hKEaDegoqf1wXKGDZxNTdkY7d7wGC1v59QyTQ8YxGM2+pQbs4KQzHgDzDCBheKTexqGIUQCgsfd4zyEqaAVLfmZpjqWVhJoKuRCICFrfKjqSziHpGDTCjSYeHRG3mqBKx7smAAShR5G/zX9SWst/n7ARbYk8sOjvHntQjIIfWQl07kU8DfTo/P76Mx9eBL/3uvUNLnJkxb85e+5NLDTRGx2KQPL1sPkZDXJwH9+Z+pmYvfcBMhVL7qYjNIxvfkB0iyRu9WYjCUs462CFSAls/T6E44kxm9SFdB3Q8xCCubXoeDOG7TO8+gEDpUGeX4YzQpEcXdqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5734.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(136003)(376002)(346002)(6666004)(52116002)(186003)(66476007)(66556008)(36756003)(38350700002)(38100700002)(2616005)(956004)(83380400001)(8936002)(26005)(66946007)(6706004)(316002)(6486002)(31686004)(6916009)(86362001)(31696002)(5660300002)(478600001)(16576012)(2906002)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0g2VVhiOFFaU2FyNEU2eXpiQ0R1d1RoaHZ1Z0N0NDF0Y0ExdGNzbmxrRkU2?=
 =?utf-8?B?L2FUcW5BclhzN0N0WHNPN0wwbWYvcDBoNUFadnFScU5QK3NhNDZzSDk2K1pU?=
 =?utf-8?B?MTU3d1pXMzR1VWZrZCt4U0Z4Nno2NHFDSjVyUkNZVHdJMkRuMTVGdzhZb3J2?=
 =?utf-8?B?anB2bGpDVDJTRWl5K3lsd2lVTjhjOGc0S3V6QjF1ck1wMjZ3WVkrUys5bHZQ?=
 =?utf-8?B?OXhpR2JUTUtxNnNWRy9oRklqWnM0RFRyNVErL3hpWUpWSitxV052dGsyNEty?=
 =?utf-8?B?T3NOb0pwcHk1U01IM0x4QW9tUXJXRzN1Wld1TkRpZDFKdFl0S1lqV2F0Rkt2?=
 =?utf-8?B?aUZ2OGFYSzhRQXRSVVl4dkVJcE16SU8xc1dSbHZpM3BNc1c5Yzd0SXRuNGlB?=
 =?utf-8?B?T25WeEhjb2lKY2pzQlhzckxKU2dVWmhHaUNKUmZPdFhxQmhtMjlJK2QwUXZJ?=
 =?utf-8?B?anlxMDFCMHhlQ0F3QTd0aTZyTFllZjJqaHgxZFhyRVJHMCtQc3p0MnVrNXhx?=
 =?utf-8?B?M2c3MTlBQVJMeHljemVTMEVOd3c1OWx4TjJQa0oyNHJjK1ltTzNkVnpmSGhS?=
 =?utf-8?B?R3VsWGp6YUUwdzFkQnMyVlFHOW8wc09lRDcvbEZod3ovWlBock4xVm4xcHFy?=
 =?utf-8?B?cDJIYktEWjhGMGpLNTFNWWdMOE82RlpjTm80SnZvQ0VxN1l4NVRlVEZKTUN2?=
 =?utf-8?B?WHRmNDVpZmg3UDI3eExpTnV6anBxZ3lMZFhockVBS0x5NUhHTHg0NDZDbnNs?=
 =?utf-8?B?TWZuK3piZGZlYTVabGtpemdWSlZ0UWtqV3U3dzdGYTRCSnZDSnhDam1ldWZM?=
 =?utf-8?B?b3p4UWowdVpJd0t0TFBDWGplclFTRzNmcmppZll3eHRpUU9mcGY1QTl4YnZY?=
 =?utf-8?B?V1ZHeXMrUEcrUHdVMWFKWEUwZjdzelNQNkdPMUVjaTdPZkI3UzNKdUJ4YWZ6?=
 =?utf-8?B?TXpaNDhKR2Yrc2J2WnNodlVaZFZiQ0pkZzVjMW5Wd2lNd2dMOEM5UlJzazlo?=
 =?utf-8?B?RWR3UW45STBqR2NvUlYwQjdibWl6OFRVUVd1STgxQVZQVVBwTGZZMVFZWnlJ?=
 =?utf-8?B?VzdqY2gwQ0IraUJEMFVPNFFKK0xPQS9nNnhOOG81RnFHQkorSkM5VkFpdVFl?=
 =?utf-8?B?c2RPMVEvVW90R2N3KzlaNEo4OVBYeTFSbzRFZWhNYk5jb2VUTVkzbkJ2SWtI?=
 =?utf-8?B?end1RXpBelBHQ1NlZU5SMHdxcGxnRFEwTEhxUko4UmMwaEE2d2RyUlpjQnk3?=
 =?utf-8?B?TDYyeUJzRnFPbndtMDlSS0pvcjkzeG9TL3gzRy9ZSGdSaVVjQ2svYjhVNXQw?=
 =?utf-8?B?V3N4aGZyTFFBekV6Q2FDSUlIanZsYnhTSjlSZHZFdzl2bnc0ZlBLcW9KeURB?=
 =?utf-8?B?L2ROMFhRYW5wZHBWUHl6cHhlM0lndzBSZ3VFT0VLbEZlaHJCbndwcFJMR2hX?=
 =?utf-8?B?SkFadDhFTU5INXovLzRTd3A4YVE0MUxMNEVodS9sZTkrU0R0aHd5a3FHbEcy?=
 =?utf-8?B?VmxMOWZWRVRPTW93bXpYS1ZMSmMvUk1tMkFIWW1aRFV4a1dQNlE3cDlCeU5U?=
 =?utf-8?B?QnpiVXlid0FDSXo4aEMxTG9IS25VYU9FNTJVay9OWjdweGRjV1lkV2F2R09Z?=
 =?utf-8?B?TGlSekUybWJiRGpvdFhrRnR0RS9rUUY0U0hoNlcxZUxvZWVTQndEMDZya2x2?=
 =?utf-8?B?OW9yb3pmVEd0ZWZESGZLRU9sRUgrenJYZWFWaFMvWjZHQmZ4Y2tPOElOZmNE?=
 =?utf-8?Q?Tl6unxa8BwdSmBoQa6W/kSDU2wP5EpBkk1tZJjU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a3537c-e676-4fd5-80c2-08d942bbce94
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5734.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 09:27:44.3245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHjkhFp8Umg+0ZGlxl7Gf1D9piv73drX8RD6f3e1H4Utlt3fRUtqNDXzlOqf8VT9X/fsu6ZaXKf2l68or9OZSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2108
X-Proofpoint-GUID: xq1JLLEtqlv9lnmLpxpGejQInmIag7s6
X-Proofpoint-ORIG-GUID: xq1JLLEtqlv9lnmLpxpGejQInmIag7s6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_04:2021-07-09,
 2021-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 mlxlogscore=756 mlxscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107090047
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=282436cc89=yanfei.xu@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi experts，

When I used qemu6.0 to boot a VM, then I found that it will hang after I
execute "reboot" command. With a long time waiting, It didn't reboot and
leave the message as blow:
------------cut here------------
root@qemux86-64:~# reboot

Broadcast message from root@qemux86-64 (ttyS0) (Fri Jul  9 09:09:31 2021):

The system is going down for reboot NOW!
INIT: Switching to runlevel: 6
INIT: Sending processes configured via /etc/inittab the TERM signal
Stopping syslogd/klogd: stopped syslogd (pid 255)
stopped klogd (pid 258)
done
Deconfiguring network interfaces... ifdown: interface lo not configured
done.
Sending all processes the TERM signal...
Sending all processes the KILL signal...
Unmounting remote filesystems...
Deactivating swap...
Unmounting local filesystems...
[   38.388532] EXT4-fs (vda): re-mounted. Opts: (null)
Rebooting... [   38.534593] reboot: Restarting system
[   38.534844] reboot: machine restart



The command booting VM I used is "

/path/to/qemu-system-x86_64 -device 
virtio-net-pci,netdev=net0,mac=52:54:00:12:35:02 -netdev 
user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23,tftp=/path/to/images/qemux86-64 
-object rng-random,filename=/dev/urandom,id=rng0 -device 
virtio-rng-pci,rng=rng0 -drive 
file=/path/to/core-image-minimal-qemux86-64-20210707062347.rootfs.ext4,if=virtio,format=raw 
-usb -device usb-tablet -cpu IvyBridge -machine q35 -smp 4 -m 256 
-serial mon:stdio -serial null -nographic -kernel 
/path/to/bzImage--5.10.41.bin -append root=/dev/vda rw  reboot=a 
mem=256M ip=dhcp console=ttyS0 console=ttyS1 oprofile.timer=1 
tsc=reliable no_timer_check rcupdate.rcu_expedited=1
"


I also tried the qemu5.2, It still has this issue. Did I miss something? 
Could you please give me some advises? Thanks!



Regards,
Yanfei

