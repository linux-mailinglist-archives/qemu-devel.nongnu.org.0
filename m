Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDDD3C7B7C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 04:07:36 +0200 (CEST)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3UJD-0006i4-5A
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 22:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2829926e85=yanfei.xu@windriver.com>)
 id 1m3UHa-0004xQ-24; Tue, 13 Jul 2021 22:05:54 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238]:46500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2829926e85=yanfei.xu@windriver.com>)
 id 1m3UHX-0007Mi-G6; Tue, 13 Jul 2021 22:05:53 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16E22Had003997; Wed, 14 Jul 2021 02:05:47 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by mx0a-0064b401.pphosted.com with ESMTP id 39sjdc85hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 02:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoA7vxC9zGuIqh/Mdl84dL9dZSRPVuzjvK6/x1zzN5SwJRve7zc8UBvLQsANKZyIomaB7IjXEWUEjSWZ6cnshv1WQcPCdOqWaPA2sMppoSuhCSXJdvrcezddwOLhGuxw5WsChIhXyA6plLsM1/CyF1u+KUXq5X+qqlMYCjicZJ27Ya764OlImwq3CqgUL2QEaH42nDIjQUxIZ7wqWpXKR7rPtTYNjHn5atxwA/J+YMvzA31GbYDIOdM6akp+b7b8g1zb3YjbeVcei0EWnZBoDPvtCBpqWLtm0URfyggiptoK31579MVWSGArPQQhNDbGF1hUd1SrKgdTtMN35WfrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGJMBBvfsDWG4TjZHgxlz4bi7k4GZyXEgQHCnrTYUg8=;
 b=dy/Rbvj8+mTM+k/+UGBdxDY4VMIzOafnwvVMvXt3xzdUgl2M/ejXRCfmj0ZNuIYmgJpseT3oCgJ62y6/7xARqjETGsSuVvsct//qpAkPYXXpaCbwqOKm4djboOyvsvG0CoOD8DFnxJ0T8+piK5r+XvGHJzOlklMcYp8i6Bsg3qn4KBgqD3s9uBG8MfGtzflQ10AGm34SZZKeUsSL20iyuVjE+HMhOSQ+0/yd/L9u/ZJJFrGLfcZf08FMYyKFXzP9r9CoTHyDIEXZ98Xkh+kJLiZ77Z55HYTr/iFdAo07PQhqqUzUnV7CNWiYANtx4Hji9kepToHjv4yfGr5v91pubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGJMBBvfsDWG4TjZHgxlz4bi7k4GZyXEgQHCnrTYUg8=;
 b=EG4WXAwPTxjH61llR8nniTOjq3Plzjoo66iRNI4wsAmoj7wMAA3JKt5Q3R30+ZTFhMWQekf/9xdyBRnsVf7ul688srs6LhXZwIDPEg5NmG3ALpqMAFhkyHyJHPJfc8IdSURqJOemTq1yM7bfwCwWMSZim8ouypf9S1kUftFv9dg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=windriver.com;
Received: from DM8PR11MB5734.namprd11.prod.outlook.com (2603:10b6:8:31::22) by
 DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21; Wed, 14 Jul 2021 02:05:44 +0000
Received: from DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::bce8:81f7:f5a1:af19]) by DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::bce8:81f7:f5a1:af19%8]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 02:05:43 +0000
Subject: =?UTF-8?Q?Re=3a_Question=ef=bc=9a_qemux86-64_reboot_hangs_at_=22reb?=
 =?UTF-8?Q?oot=3a_machine_restart=22?=
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: qemu-devel@nongnu.org, qemu-discuss@nongnu.org
References: <fb8ac165-0b49-5094-e036-b98b0c83deed@windriver.com>
Message-ID: <c1e23f92-d4e7-2977-d544-71ebed3bdf47@windriver.com>
Date: Wed, 14 Jul 2021 10:05:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <fb8ac165-0b49-5094-e036-b98b0c83deed@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To DM8PR11MB5734.namprd11.prod.outlook.com
 (2603:10b6:8:31::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by
 SJ0PR13CA0187.namprd13.prod.outlook.com (2603:10b6:a03:2c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.12 via Frontend
 Transport; Wed, 14 Jul 2021 02:05:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f914e85e-edbd-437d-cedd-08d9466be326
X-MS-TrafficTypeDiagnostic: DM6PR11MB4595:
X-Microsoft-Antispam-PRVS: <DM6PR11MB45951FB781044CE73F07B495E4139@DM6PR11MB4595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 26Y8nCsUzqH3ATSJ5QWwgKfc/dV4Brde9AB/UiI5zIE2Kp+GuPKT5pFroK2wGQRZLLs3ofDylIXEHdECajcoN/5oVnXy6hba/seq0xqNdRBG3Hzi4z3uvOUGd0X48Gmvymlx1MFBQeVdrU5JsDSLTgftOq+0BuzjruCezIjSst0oClxPwl0SjC4a5pa96ypHYWyj4pdjQSWe5LhXmiyfAfXLB5WV+8V7jDCTTVqgcx5XE31RP8NcxnDey/qwgftrBD5cjXLQUzZEsl5mbQzdRkylV5dqBBeupSNP7Fg7FUedoX2AoohoLOdEE/HHEA9DKxIWmMqyM2RleAHWKGpaGYnUKoZsobLMuXfyR2gBuDvVuRAouc/sKgzRfVk2uQlZrCP4Thdo4IlSf+jtTqda7r1YKouMfp537O3q4ed1+3Bqx+HeY9al56vb4EAthRshT0rkLAEtLIRmTexID8LsJm6lGkJ31qYqQbcu9UHoqHG7D81uskJhzO4685GSJq/rl4dmS0hcEmDjy7wtyANUnW6pshP2IDWK1S97TDKbg2GK2myjAHqSE/3TJgTx+6y9VjshjVpaKF8xwEyGnFCkefNoyqpX4R9Rwv8tachHEmFQLx+mAtCKMaVNjQ1uOWQOk61qRGZgdZP8f12VJUD+xyC4anz2W5u4rKjbQnxd5mAANjBUqlyopjaI2YsnGqN/WmDZCWR07XH44swXBOzCiYPzbvU5cTGEcIIcd4ZhunBh/1svwSxEEnUz31zbNhs1WYiwRCWcLR3thEmP5CyVBk63Np+He7AkdfIeCklPsgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5734.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39830400003)(366004)(66946007)(450100002)(31686004)(66476007)(5660300002)(86362001)(2616005)(956004)(66556008)(31696002)(6706004)(83380400001)(26005)(53546011)(16576012)(478600001)(186003)(6666004)(36756003)(316002)(52116002)(6486002)(38350700002)(2906002)(38100700002)(8936002)(78286007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWIrem5WTTkya2xraitoaVg2Y0V4TzJPRnpGK3psM29ZN295WTQvSWxwZmJH?=
 =?utf-8?B?Y3pBV3pqTFlXOFFFODQycTBJSkZiWWpuU2I1Y1JIK0lIazNIdnIwcndwVVQ1?=
 =?utf-8?B?V0tZUFUxMFJ2V2VVSDk4YVlBWFRSQTlCckVqUk1taW1JcHB0MmJWSVB5cmJG?=
 =?utf-8?B?L3FnZitiektzTjRZZ0Y5ZDNuTUtUN1I1cVJQSWFPaE4zWDhMME9wRVdJQTZr?=
 =?utf-8?B?R09LYnNlZGk5WWw1RG80cGI5OGlIN0xPcmdJZDJwVmlnQjNITjlnRkdyUDYv?=
 =?utf-8?B?RkYyQkJQVFdTK2dyN3ZEbkFtOEJGTndVQ252TWFmalQraWJpSUxuQmJBNGZi?=
 =?utf-8?B?K2FoeCttbzFnZ0lJWi9SQjRGZWIyNkQ1amtmazJPSVhwT3RDYmEycjduc2lY?=
 =?utf-8?B?c2dVYzM4dFRpNXZPT0tteDJxT3F5T1M3Z3RJWVZVWFYza2MwQ01VajVRWURC?=
 =?utf-8?B?bWZPc3FrZXhTNDRDU25ma0U4REQ3Ky9lYzlXclljZ0l3WDBPS1VFdm00M3dI?=
 =?utf-8?B?YWw3NzhDQ3hBUDBsQzE4R3FTOWpZdlJJd01jYllld3I0K2habzJUalpxOE5M?=
 =?utf-8?B?SlVYek1HTUdabkQyUFBsQkJMSFI2SkJiVWpiMGZlQWx5em11WTZubElvZjEz?=
 =?utf-8?B?S3IrdHRPRFNOcmk5NW44OGIvSkx1MVczamYvMXJBdkYreVJmNlJ5SVlCZkRy?=
 =?utf-8?B?V3ljZWxNaklCcUZmQTZhU0lWWWJtdUdRcWZWZStLcHBXOVZoZUh6MEpmMXFI?=
 =?utf-8?B?ejlvNURHeEVSUEtRZ2ZGcGxha3VVeXhHclVDUnBnbDlSNk1BRDRINUM5UytV?=
 =?utf-8?B?a3E2Smx3b0RmNEx5eUpNR1UxV2xTN2cvZzJpZDBvODhSTlpNY2pOSXFvYUsv?=
 =?utf-8?B?U3BoY3BKU3QvNmhmODExejhyS0wvaHhveXF0RVdGNS9ETnkrcXJsNmlYdldm?=
 =?utf-8?B?VnlvQ0lLOGVPOXhIemtXMGZsZ0hYUjNwSFJaTnVqVEYySCsrTWlOb3k5aWVL?=
 =?utf-8?B?d25kV2ZmL29jQXR2NWZVd2E1alFqY242MDBwZ29WVnZEMzIzSVZXcG1wbWRX?=
 =?utf-8?B?UHRGczNKT01URkx4NUhXZU9ZWFRnL2JmVEtNK3FmTGtGbmcyZGdydjhacGNj?=
 =?utf-8?B?bUlDVnVPOEEyK1FsNTR6M01HRldGalQ5S1NObUdyVStBUkt0c0h1VEhuM0Nx?=
 =?utf-8?B?V21KR1BhMUs3eitQUVdiOFdDemNMRlNpejdFK2JRKzA4ZCtMZkR4MGtxcjRF?=
 =?utf-8?B?WVFrSUhvem1aRkhSajc5VWRDZVZjSnk5blpBRDJjYjJtSmU2VnVaR0JqT0Q3?=
 =?utf-8?B?NjAyYXROTmo1bGlUUEZiN0tySVUycFdIejlidkFJMWpyU00weXN5dVJTUXRY?=
 =?utf-8?B?QklqZWZNeTFobkNsSHZkY1RCVEJnWXRUS1l5VzEycHRQbUlVVU9qTlZsLzZa?=
 =?utf-8?B?UTVHVzRtRWxvVlJneTlPbVdhYmNtM0VXUnFLTWtJWHl1Z2N1R2MyZXBYK2pP?=
 =?utf-8?B?Rk1QOGhPanFKb1FHMzVIcGE2VHl6bjJ1ejZvaU9jMytvMnUrcDIzUWtuNjk0?=
 =?utf-8?B?bnV3NWFkb3hkc3FqUnJkeFd2YjJCVlVLQjdDRDZ3U3lmb3dIOFNnMTN3RHpW?=
 =?utf-8?B?TnVDbjYvZmxDV21nRGVEcDRINDdUQmdJQW5QYUFjYm81WmlrTlRqZ1czUk9U?=
 =?utf-8?B?ZExBem1BbDk3K2JGU0tXRk9abDJYT1pQUE1jdlpKVHhBLy82WnViWlMxbnNR?=
 =?utf-8?Q?MQOUdeouKuH9qigeTf6KdPHSWXNXJkER3WiiXCa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f914e85e-edbd-437d-cedd-08d9466be326
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5734.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 02:05:43.7296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZxkdHuw9sz2VT9hHqDNPRX1mVkiuqLMG8+EDRXes5oozJ+l9MY4Vf0V+mwBapNuEbbih2m/Rgrn2OKw9ioMLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
X-Proofpoint-ORIG-GUID: 8vmSx3VJ0A_PcVKDk6Kbbmi1vd-YXnWH
X-Proofpoint-GUID: 8vmSx3VJ0A_PcVKDk6Kbbmi1vd-YXnWH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_12:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 clxscore=1011 adultscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140008
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=2829926e85=yanfei.xu@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.368,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Gentle ping.

Add qemu-discuss@nongnu.org

On 7/9/21 5:27 PM, Xu, Yanfei wrote:
> Hi experts，
> 
> When I used qemu6.0 to boot a VM, then I found that it will hang after I
> execute "reboot" command. With a long time waiting, It didn't reboot and
> leave the message as blow:
> ------------cut here------------
> root@qemux86-64:~# reboot
> 
> Broadcast message from root@qemux86-64 (ttyS0) (Fri Jul  9 09:09:31 2021):
> 
> The system is going down for reboot NOW!
> INIT: Switching to runlevel: 6
> INIT: Sending processes configured via /etc/inittab the TERM signal
> Stopping syslogd/klogd: stopped syslogd (pid 255)
> stopped klogd (pid 258)
> done
> Deconfiguring network interfaces... ifdown: interface lo not configured
> done.
> Sending all processes the TERM signal...
> Sending all processes the KILL signal...
> Unmounting remote filesystems...
> Deactivating swap...
> Unmounting local filesystems...
> [   38.388532] EXT4-fs (vda): re-mounted. Opts: (null)
> Rebooting... [   38.534593] reboot: Restarting system
> [   38.534844] reboot: machine restart
> 
> 
> 
> The command booting VM I used is "
> 
> /path/to/qemu-system-x86_64 -device 
> virtio-net-pci,netdev=net0,mac=52:54:00:12:35:02 -netdev 
> user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23,tftp=/path/to/images/qemux86-64 
> -object rng-random,filename=/dev/urandom,id=rng0 -device 
> virtio-rng-pci,rng=rng0 -drive 
> file=/path/to/core-image-minimal-qemux86-64-20210707062347.rootfs.ext4,if=virtio,format=raw 
> -usb -device usb-tablet -cpu IvyBridge -machine q35 -smp 4 -m 256 
> -serial mon:stdio -serial null -nographic -kernel 
> /path/to/bzImage--5.10.41.bin -append root=/dev/vda rw  reboot=a 
> mem=256M ip=dhcp console=ttyS0 console=ttyS1 oprofile.timer=1 
> tsc=reliable no_timer_check rcupdate.rcu_expedited=1
> "
> 
> 
> I also tried the qemu5.2, It still has this issue. Did I miss something? 
> Could you please give me some advises? Thanks!
> 
> 
> 
> Regards,
> Yanfei
> 

