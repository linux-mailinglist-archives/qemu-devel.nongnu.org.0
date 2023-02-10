Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AFE69212D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:55:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUn0-0005uO-GG; Fri, 10 Feb 2023 09:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <webczat@outlook.com>)
 id 1pQUmy-0005u0-0N
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:54:12 -0500
Received: from mail-bn7nam10olkn2033.outbound.protection.outlook.com
 ([40.92.40.33] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <webczat@outlook.com>)
 id 1pQUmv-00051h-UP
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:54:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yx2xuAfHfcGra6yiuUBKrv6WGoEsnmqvP+mZf6cluT8hyUQQ+nN3kQHHOPDI6HDcgbKBSwvFj5Eyu/znmO9bf71h7Sz3cmCK0fEn/4UTwhAyPwvxxhMd3ZjtEq6vDkle3mYI5MRQm6O0ZnxqX00UmrWRW4e0j87j77g/20hfFiw6cw2EjfYccmrOu5df8JCxrTd0KWKdqdZ46NyoE3sKa7waLJEcCucw0T4sx7rmjvlCEggnUXnM2SC4if3Xnxj83pcJ3RCGtNrLjzoVNt9mo9jEaEnSiLp4c6n3K1DwWMPCSsbtWmKEk+Y52aAKpOWNREMn5Xs2nt7VHbnGRQkfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBVw/YdDcChPx1fqCxllZyHzk/dW4E+JTKmKmb5/mQI=;
 b=UAhOX60rJZ/HM4x0GVdK3IPNFjJnTcDJGd3Mtm69nK4Q3W4DPmgTWFFVgPrXOPN2S6qWbduiXhsl87aU3j2Z3mC7GaLn1CcqFBVSb1htmod2e67YbYIG/QS5eXh7p7txgCiUF0w9qZtPmwMqDQch6LppBeE/YtbE9GX4KCml2ZTNPv4io0oOALFC0XZS8hzIoOPO8owx7tDWnTAwwI5n1TxQca08E8AeUN1HyR0yTa/6Z7Enr83U50mTC6VUnxS63Pqj4Pi3D+VDB20Q7rbdIBjBLkJ6bGgx99BWgOKtYPfjLJizPxEXkT+vL0X6KApyDWxnhxttDL2t5+d0YxIoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBVw/YdDcChPx1fqCxllZyHzk/dW4E+JTKmKmb5/mQI=;
 b=jf/h/sMRjmbav1JEOJYlFWRWsXW6L7C/fU6DCFkHTX+7/ap/ipJxmdOcjrM4In6Qu+uZc7kAZKLM5vFCiLgsXo0OeoNnH2WWVyw8R27DHLR+nn1OYafO1tArzAGtm/IuKuiFj9Zxfuyx46kbWQxIBwq/CgHjobp4fx4HNIAMu47zm+yMmdpXwprE5+RqR9we4Abav0Y0W2UIbMoQso22Za0kSDr8pLTdHp7/3ATYzUu9cTKPnYzQSOBl2JrhHEIhvm+xLn6w9wgwU+8iqSck4499+yFd6e1x5KzFFUhcDCjPOwnFO9foGUOm1wbpBOfmdUdbQ563xkCtzzj8LNeiEw==
Received: from BYAPR12MB3014.namprd12.prod.outlook.com (2603:10b6:a03:d8::11)
 by BL1PR12MB5317.namprd12.prod.outlook.com (2603:10b6:208:31f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 14:49:02 +0000
Received: from BYAPR12MB3014.namprd12.prod.outlook.com
 ([fe80::a666:b29d:dedf:c853]) by BYAPR12MB3014.namprd12.prod.outlook.com
 ([fe80::a666:b29d:dedf:c853%7]) with mapi id 15.20.6086.017; Fri, 10 Feb 2023
 14:49:02 +0000
Message-ID: <BYAPR12MB301412EC9E732167345922F2A0DE9@BYAPR12MB3014.namprd12.prod.outlook.com>
Date: Fri, 10 Feb 2023 15:48:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: qemu-devel@nongnu.org
From: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat@outlook.com>
Subject: Windows 11 guest crashing supposedly in smm after some time of use
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [hthl7LGuFgebNargjdmIZkanjjY26p2X]
X-ClientProxiedBy: BE1P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::20) To BYAPR12MB3014.namprd12.prod.outlook.com
 (2603:10b6:a03:d8::11)
X-Microsoft-Original-Message-ID: <c0bf0011-a697-da29-c2d2-8c16e9df21cf@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3014:EE_|BL1PR12MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d8a350-b79d-4fac-0553-08db0b75f33a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OKJXuljiUUapafMZ/c9fIcFVIrAOTIT64olREhsMJrF6N83OPKsdlt59R/QONJqEqc6nXJTpSZhIrtCvpioP+0hh/b1BbhRkkFJ9WIZAIo59BHtf3HaZ0NMMn8i57nRuNQXvvfTqZyDX05HeLmbp1rA7N+DNEiAd8ZJbck2AzlHJFpJ0c2CObGVOaWZaAHUEAangBsfF5m8haP9PtoWk9YyTBTHfAoziw56zHnktX2WiWsijoAyX0YjvfjC55WZCNVZfoRazMWgYxCa1bFMd/KjaOGsHvaiKXhmEHCvm2rnFS2l9f92wEdGT9OSyJxjEvOKvUv9YC0wXrKEeDsX1pzZcRnSfQ3VMOYmtzyJnaxyEOYNF5eNEMqYjvNUtgi9ZS1YrtiB+yB9WCFyiw0QQlX0UVUCQk5CMNWil1FHos3aPy5RPFTU/tm5nuFnqBe6EPruPknPfYfpY4uadIvIWDadqTiv8F/CLq9cMkH3+1jrqhwn9Dut4ht7qfQWFJkbmhzdFIRqwMNu6VVHi4a/g7qPH/VONFa6WIPyow1IvP2DzcaCJDNsngmsjDb4Sa5MvLh7ZotEeb6vmG24PGnEaPg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTJDb294M0swN0J3QWZrNGQyMjExNTZXNm4yQk5QWVNHV0ExV2dnKy9FU25I?=
 =?utf-8?B?VG14RDZhbCtITEZEdGFHUGFGakJ6S2N3dGxiRG5YM3JjYnR5eTNWUU9nbmpx?=
 =?utf-8?B?T3V6OVVia0xCVE5IOEhvdC8zU1Jpb2NucFBPZE9UUUJSbTNOdDFEOE01cU1k?=
 =?utf-8?B?b1orK0dnK2c5eWtNTk9ob3gyT1VWelV0Nm1laEplcFdHa3VQVVpzYmplR1Nt?=
 =?utf-8?B?TCtmV3grVEZMZDlxZlc5Y3VoNGl0RnZKdW1nK0IyZUtFdU1OUE9MbHBrOXdD?=
 =?utf-8?B?Vml2WHQyditMblFBSlV4ZTd0cGJMa25PUTJuZDl5NEtTVS9paitNekwyZzJG?=
 =?utf-8?B?R2VjejJ3OVp3RmFjdmg3THZlaUhwdHhNVGxyQ1BISVAwaFlReEJ6K1NObWx2?=
 =?utf-8?B?bE9KYWlQTUpXZUdWdTlISmNGK25zUWdJREFIbTNCK01aYzBIb1ovdFVVamRx?=
 =?utf-8?B?ODZ5YVVkRjhZYlZUc1RScG5iWjBvTEJUTkdjblpRU0xqT3VuMTgzN2o5Yjlu?=
 =?utf-8?B?LzAxaWx1VkhmbFJlMWdSZHdPa2xwNWRncmNqRm5hcktSQitTK01pcmRoNkpy?=
 =?utf-8?B?SmRQTWIyVHJCd0ZJS0lWbVBKdUdtUk5RbUc2a0IycFJEYkVNa1V1dURLK05y?=
 =?utf-8?B?VXBwTCtmY0t4RUlneUtnZ01IRm5lWUI2Q0xRaklRNEtobjdoSlk5dDZLc2tP?=
 =?utf-8?B?Q2ZIKzE2RXpNYVNJck85bDZOTys5SlBpd1NCTTM4MW1BcjBUejdrZTVIeVBl?=
 =?utf-8?B?NTIydkRGYWpsM3FwOFBhbitJL1kyRzY0WkI0YzNkeGtFbmM2SVJXK2g4dnRa?=
 =?utf-8?B?T25Zb2NuWDhTZ1owRTFwZTVjaDNUMGpBNWMwYWY1bWJWaVBZOHlnYXZObEdl?=
 =?utf-8?B?VVlocnNHYW91Q0NraHZpVzN6N1BYYjhYUm1iNFJneXUyaS9BWkw3R1lmSm14?=
 =?utf-8?B?dnBpaWxZNG5adWRldEs3UGZ5ZGQydWh1OVQyV3YrTDNjdTkzZ1YrZ202OVoz?=
 =?utf-8?B?a0c1OUlBNFVDNjBDVzZXcVBxaWVUSVIzU0dYckRCdEJPZTdYdk50cFArR2NU?=
 =?utf-8?B?bHp4Y280Znh6UlYya0g4d3RUNlg4bnJpVmhPQ2hlYW9uSkt0V3o3NUI0TDZE?=
 =?utf-8?B?QkFvQzZ2RkR5SFhVUVJEZVBvUUR2enN1N2lEc0hOTElpVWdwdHROZGN4aklF?=
 =?utf-8?B?OEF1WVI1Y0tqci81SHNDSzdON3A4ZHJ6elY1NlJjR1R2bDE5OThZbUhMclFs?=
 =?utf-8?B?THUzNi9CVGhURGszUWlEa1g3UWZlVkFSWVE1WnJaNzV5aUM0UHl5U01LeXB5?=
 =?utf-8?B?WXJHazhNUzlkMzV3Mm5tc3FkaURvd0prZ25GVTFGaDJIUEVYajVvWkE5MGI1?=
 =?utf-8?B?OXdyTG9OVVVMVTlPSURFejc4QVUvZ1RaanNPT2RwdksvdTVVTXVPdzRZMFZJ?=
 =?utf-8?B?Q2xTaHBDa3lqdkx2MElTMk1PVklWUmlRUGFGSDUrcVUrR09lbStSUVVMNmlv?=
 =?utf-8?B?NWl6MFlwQUpRMHRoTHRrZDlYUWVVQjllclI0cDJRSU5pWFM1YkF1cndTYjlp?=
 =?utf-8?B?Rkx2NklCWXN1VVV4NU5OU05telRPNHRvZ09Ba1FjQlNsZDdxMzFDTVNvdUxz?=
 =?utf-8?B?WHJ3SUJneVZ0RGpqQ0R2ek1qZ2FaRmhJS2p4N25tQjVkOHBveG8wNW4rdUcv?=
 =?utf-8?B?RmpIZ3IwWE40OGQvYkZ0Qng5YVlDOThDeEhZbC9QbVBiQjhZaG9Mdi9BPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d8a350-b79d-4fac-0553-08db0b75f33a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 14:49:02.6708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5317
Received-SPF: pass client-ip=40.92.40.33; envelope-from=webczat@outlook.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hello.

I have windows11 installed on a vm. This vm generally works properly, 
but then might crash unexpectedly at any point, this includes situation 
like logging onto the system and leaving it intact for like an hour or 
less. This can be reproduced by waiting long enough but there is no 
single known action causing it.

What could be the problem?


Configuration and error details:

My host is a msi vector gp76 laptop with intel core i7 12700h, 32gb of 
memory, host os is fedora linux 37 with custom compiled linux kernel 
(fedora patches). Current kernel version is 6.1.10 but when I installed 
the vm it was 6.0 or less, don't quite remember exactly, and this bug 
was present. Not sure if bios is up to date, but microcode is, if that 
matters.

Hardware virtualization enabled, nested virtualization enabled in module 
params for kvm_intel.

For vm using libvirt, qemu 7.0.0. Virtual machine is q35, smm enabled, 
processor model set to host, firmware is uefi with secureboot and 
preenrolled keys, tpm is enabled. Most/all hyperv enlightenments are 
enabled.

Using virtio for what I can including virtio-scsi, virtio-input, 
virtio-net, virtio-balloon, etc... installed windows drivers for all of 
these things.

Guest is windows 11 pro 64 bit.

What crashes is qemu itself, not that the guest is bsod'ing.

Below is the link containing libvirt qemu log, containing the full qemu 
command line and also the crash messages. Note virtualization is 
disabled in vm even though nested virtualization enabled on host, and 
hyperv not installed on windows, so it's likely not the cause.

https://gist.github.com/webczat/1f224e7ecdc17c5c26316e0121f4ed43


