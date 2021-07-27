Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2993D83CA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 01:18:29 +0200 (CEST)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8WLD-0001Nh-GI
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 19:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m8WK8-0000hA-Bx
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 19:17:20 -0400
Received: from mail-mw2nam12on2060e.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::60e]:17825
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m8WK4-0002My-Ni
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 19:17:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADD6WXDVj3kYCeMeAPWMQFKlZ5p5Hs1rhxTNjQyhASW1A5rOIL5JL2MObzVPmIte7qQfVozPCEHSMdvl25B4MojF5/5qNjEzcVoDgr0JzKGGRIb+bEcfuD0HDJ7iaHBRh7Rg/HwSklHTdd/eBE4SZC/dkaRU17EmOzB6E3Rne8WlnHqSrB0fil8Nt8FYF67HKRhhBc/PRW9lk8JZ8zt5DmiAkIBRFdeYxRjiXg7bZQSINIF+of9NEBMt6tbIorHBVa1niKV5jtEFwCXsBxC7uajXLXRBTRW7Wq42kmLWX60oAGnqfiBlzxJVPwzCTNJn1aDZfvRfYm8rvXZzcH2wGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3IuqBGGfx095w3kXrja+zl0UEqYcIlUnGWDK1DEarM=;
 b=SXiBxpx4aqGMECJGnQMpyNeM5gP+N/s4+RctoeMtOvqyqiUkkakB6tkEsxEh4xJuLv7NCpbgINm/MyXYt8WvSFLjJ0Setv2P8iimb2PJyx6A2AJvyB2glBIHptKnG7qreMbOFWmPly297Vube/l1Ufwo8T3/poCe5JQ/5g81uf7nlJ8S9oYhj1ustwl4yJmXlaynf+K2cHQjbz2vrbuav+DdT6UtihP2yc/CzKNpIDk1hpAXIT3JHwCaUqqIIacaPfHtBQrKK2bkK5K8SZ3R0vzVBOviTyAymirDf1gZ+Tlirr/PCqsK+xyVWz1tgkkItsfX+ywECzhmrdoV0xwODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3IuqBGGfx095w3kXrja+zl0UEqYcIlUnGWDK1DEarM=;
 b=F3JU/vFDOkTixaeHCQcpfIOqdaQIu7d2ZQWHuA0cTddhpyT8HkupxsIeJ1zFfCXtG8eTQRgI1WfOAcPb0LFieDKZkfCqoEmtjaChfiMOStL1YpBw4+zU1kOHd9KJbz38zWwUHAUlIL+zXh+PsfRPVyMCYW1hgkQupvcz7LQ0dqA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3830.namprd12.prod.outlook.com (2603:10b6:610:2f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 23:12:10 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4373.018; Tue, 27 Jul 2021
 23:12:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.1.0-rc1 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Date: Tue, 27 Jul 2021 18:12:00 -0500
Message-ID: <162742752008.669363.12265618291649844854@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SA9PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:806:20::13) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.1) by
 SA9PR03CA0008.namprd03.prod.outlook.com (2603:10b6:806:20::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Tue, 27 Jul 2021 23:12:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 308264dd-bffa-41cb-4664-08d95153f600
X-MS-TrafficTypeDiagnostic: CH2PR12MB3830:
X-Microsoft-Antispam-PRVS: <CH2PR12MB383033E579399FFFE70E72FA95E99@CH2PR12MB3830.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:67;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zK46N2UCjWdBPNa7LazQKNK6VLBwZz/LBBrEJ2eNueLs6Z5B4uhEluc7Rxx0zEFSjWMWngmAY+UQtrX9qA7lijYJ1GYiOjiO04U2bVMogvn2WfMYGyxBj5Cim5sozg4/u5WjyVKJCyefLhz7Mf89xsbXy6LT4g5jfOzfILUBBgWWLYMMJ85V5rmze14L1p9G1Ngoo1TKEcQy8IvoHooQs4PHzKP3fFF7yL5W0IN9Cnrl99lyKDsOJXW6HqOd2s0b6hWLFwohpdXdhPpBaoetfu1CcC4R+eWSOHiut/osONWE5lhjDEFWfFjpItJNwzEzerzFBYReHlNkQy/eFta87AZ/+eaFFeTytO4zzPXHyt6f+QWVmQtMdSdLrUgSQ5byyrqH4oOuQdh2Q1SrSc6leaRukftWAu6jaTUK2iRQecfVzIbssBtIQZBFdP0jAjHkAz/MVpIheLIjq311MLu1v8vVIf5dDlX5Q9sz8gkuZ4KS8yF99fEqXmtiVaEJ8NczpqjY1Cou7iiNH2rzSOlB3u7kiqiuDn5ic9iiTFvyOhrZIQRi16Xl8RmNu4PwU6cIhbfJCIjAwE71vv57Y138VsQiVt1xD/l+X9r5EJ1tpCufH8mSj7TnVrMQVB+H2sjToxpLPQtejRZEvcLgm9n2VkVfdNUqrmZyuiIXWUHvTjnpsQbSHLb+06OZ7dN/D5jp2PZnCZdS1ZrVypdLu0gFuzjPAzIqYBBIxdROYjYVeNlAjeCGBUVTODSLrUMwmhWj2QAMTl2PxB0/C9mPdQZVFMZ6q17ip/tSfQfeb7mqFghNrkvjFDireikb/P40iivd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(6486002)(316002)(36756003)(4326008)(44832011)(66556008)(52116002)(83380400001)(966005)(8676002)(38350700002)(186003)(478600001)(38100700002)(956004)(86362001)(66574015)(2616005)(2906002)(8936002)(66946007)(26005)(66476007)(6496006)(6916009)(6666004)(5660300002)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3IyaHpnK2twYm5SKzJPMXZFaHlEajMzVzgrU1BwaU9wUUtldFlEc2JjbGZH?=
 =?utf-8?B?RzlaNXhITFcrL0RYNFBIUDFlQU5jM3N6MStLK2VwUFdHUDBjYnRKVDdEelJx?=
 =?utf-8?B?c3ZJUjQvY0ZodlhUb3JETnI0OUpNTTFoMHRNYWNoU2RDcTJHa1hETHRzV0pp?=
 =?utf-8?B?WUorMGVoZWppWHIrSVczcHdYWWZvaG5zZjdtWitldHRWRUhnanRhdzZNYUQz?=
 =?utf-8?B?eVdHY09CQWxoSkdUYWdPQ2Z6MXk2SXJlUDJxdUoxbURybUlLVlZ4aWtxRjhP?=
 =?utf-8?B?ZEtXNXR5TDlYUkFwajhnK1hLalMxL29Sa0hERlVuRTg0RDRQcEhZT2pGZVhm?=
 =?utf-8?B?dnZoWW5aNVFxL0tvNGQzeEN4bmNXSVFUYlE1RlJpNzh0dVg0NWFUSWNIYjVE?=
 =?utf-8?B?aEhCaTFwNXdIc0luVXRwa01STHB3Z20rajJpMEdDdHVLZ0JzU3dlKzBIWStM?=
 =?utf-8?B?ZllsUkwzazhOelBERnRxcGJ0TU9hK1BiYlVFeUFZY0xDSWlrTXN0Qkp4Q3p3?=
 =?utf-8?B?dVBKYWRTL3A1aXY4Q1RIVHpNeDRIMWI1NlQxRnltWTNqYmVNWVhJeHV4MUxV?=
 =?utf-8?B?ZFdGVTlzSGZQT0hPOTlUei9BKzBPS0lPS2ZXZlNBVE9jV21iYnZhQVo3aHNQ?=
 =?utf-8?B?bmk0a0xRUHBqekhiaHpaUXVOb3A1YmpuV0hSQmJxNlAxWG83NDBua01pK0dN?=
 =?utf-8?B?V25XOHovYmpDNE1LdTFqdE5IQk5mOHFRdktPRXFrR1F1LzJrV3lDV0hBYmRB?=
 =?utf-8?B?dFhOanpVaGdFMllIeFBuR2c1dXhxTjF3N1VYalI3VTF5QjRNNERScUxGM25T?=
 =?utf-8?B?VTBwVzBxdkwzR3E0bndHOVhuK2pCVmh6UC8vOUEwQ3Z5UWs2MThma0RVSmdC?=
 =?utf-8?B?YjZ6cFd1SVlWSnhwZkdZdDF1cjBpQStLNFpoQXNSVFoyM0VzR3BNVTdVdFdW?=
 =?utf-8?B?Qk1ZcU51UUtrbXo3djN5dmtkTTRWWVBEaFZIZ0JDTWlYd0NxUjFCU0EvV3R0?=
 =?utf-8?B?SG1QeFZTZnUrbUdpUVRoczRPQ0pYYktwTFQ0OGd3MFpxeTRPQ3cycWVaM0R4?=
 =?utf-8?B?RVRwSC8reElJclVjU0xvTUphS1VJNXJuWUpGYXBkdDBNV0ZRbXZITVRhaGpw?=
 =?utf-8?B?cVFqWFRFYUlmOEhkRSt3NWN5STQyWkMzOHU3YjBhcEE0ZkNyL3l1TU9pU29P?=
 =?utf-8?B?c0IxRE5KaVJwNXJyb0VoQkljaU44a2Y1TVpzaFJFODJnZzZuZ0ptNkdodldQ?=
 =?utf-8?B?S0p5eTQyOFlkbHJIK3VXT0k2VXBUWm41OXZRNVdEdksxR3dhamxoZGt3U0hL?=
 =?utf-8?B?NXM5R24xY2NIQVdGMTZ3ZEVkZlF6V01zc3BwZExDaHFkRHhaNEc4NVQ1eUFV?=
 =?utf-8?B?RGg1VkpNTStvYlJ0aVZWZE1qRnZzdGoxNnpGZlRNQ3VFQU9Gem15TlI4UWdP?=
 =?utf-8?B?bEk2RFZlQVV0SVREc2RwUy9tSFVaOWNub1RyWWloTWJjdGtaN2pOeWl5eG1C?=
 =?utf-8?B?cDkzUFp5L05MS2ZVaDJmSHZPVUMzUGlFcGNNamxDMGVkOEp4MVdJNWxqeVhY?=
 =?utf-8?B?cFVRYWFndFJMR3NRWDJ3T0p5blhtblp6YTMwUHM0VGhQZGc2TzJVZWtxQW1o?=
 =?utf-8?B?dmdoSWZrSjlwVFZDajRuTmRIczhQT1o0dFpNeGxJMHFyNUlUMjRVbitFM2pn?=
 =?utf-8?B?c1BtOFd5VHA3aWszWVBHQ2tSOEduenIwU3llMklnN2gyUkRjUjkreFhuNzlw?=
 =?utf-8?Q?TcXTStuUTsP10ngTIG3S7g5WNYWKNhtRCLxEtVK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308264dd-bffa-41cb-4664-08d95153f600
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 23:12:10.2776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DC6TQhSfJFOkFDyrGYU3z/9znwV/fIH8NO775gckWxxnmAdefsWCK+Vu1JpwIN5f+Tk0DKeAcA+qsKXYBK7Nbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3830
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::60e;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
second release candidate for the QEMU 6.1 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.1.0-rc1.tar.xz
  http://download.qemu-project.org/qemu-6.1.0-rc1.tar.xz.sig

You can help improve the quality of the QEMU 6.1 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.1

Please add entries to the ChangeLog for the 6.1 release below:

  http://wiki.qemu.org/ChangeLog/6.1

Thank you to everyone involved!

Changes since rc0:

f2da205cb4: Update version for v6.1.0-rc1 release (Peter Maydell)
e229a179a5: hw: aspeed_gpio: Fix memory size (Joel Stanley)
b1c2a6bd3d: hw/arm/nseries: Display hexadecimal value with '0x' prefix (Phi=
lippe Mathieu-Daud=C3=A9)
b3d52804c5: target/arm: Add sve-default-vector-length cpu property (Richard=
 Henderson)
ce440581c1: target/arm: Export aarch64_sve_zcr_get_valid_len (Richard Hende=
rson)
dc0bc8e785: target/arm: Correctly bound length in sve_zcr_get_valid_len (Ri=
chard Henderson)
a476b21672: docs: Update path that mentions deprecated.rst (Mao Zhongyi)
845d27a913: hw/intc/armv7m_nvic: for v8.1M VECTPENDING hides S exceptions f=
rom NS (Peter Maydell)
7caad65756: hw/intc/armv7m_nvic: Correct size of ICSR.VECTPENDING (Peter Ma=
ydell)
41487794f5: hw/intc/armv7m_nvic: ISCR.ISRPENDING is set for non-enabled pen=
ding interrupts (Peter Maydell)
d4f6883912: target/arm: Report M-profile alignment faults correctly to the =
guest (Peter Maydell)
0c317eb3dd: target/arm: Add missing 'return's after calling v7m_exception_t=
aken() (Peter Maydell)
888f470f12: target/arm: Enforce that M-profile SP low 2 bits are always zer=
o (Peter Maydell)
953558291e: qemu-options.hx: Fix formatting of -machine memory-backend opti=
on (Peter Maydell)
1b41847afb: hw/arm/smmuv3: Check 31st bit to see if CD is valid (Joe Komlod=
i)
9631a8ab21: tests/qtest/nvme-test: add mmio read test (Klaus Jensen)
49e03457f1: hw/nvme: fix mmio read (Klaus Jensen)
5029de44b5: hw/nvme: fix out-of-bounds reads (Klaus Jensen)
a316aa50e6: hw/nvme: use symbolic names for registers (Klaus Jensen)
5d45edbeac: hw/nvme: split pmrmsc register into upper and lower (Klaus Jens=
en)
5ffbaeed16: hw/nvme: fix controller hot unplugging (Klaus Jensen)
51e90178f7: tests/qtest/nvme-test: add persistent memory region test (Gollu=
 Appalanaidu)
234214734f: hw/nvme: error handling for too many mappings (Padmakar Kalghat=
gi)
b0fde9e861: hw/nvme: unregister controller with subsystem at exit (Klaus Je=
nsen)
cc6fb6bc50: hw/nvme: mark nvme-subsys non-hotpluggable (Klaus Jensen)
5e4f6bcc29: hw/nvme: remove NvmeCtrl parameter from ns setup/check function=
s (Klaus Jensen)
2bf07e788e: tests/unit: Remove unused variable from test_io (Richard Hender=
son)
211364c21e: linux-user/syscall: Remove unused variable from execve (Richard=
 Henderson)
984178d86b: hw/pci-hist/pnv_phb4: Fix typo in pnv_phb4_ioda_write (Richard =
Henderson)
2d758274ee: hw/ppc/spapr_events: Remove unused variable from check_exceptio=
n (Richard Henderson)
79fe9e4313: hw/audio/adlib: Remove unused variable in adlib_callback (Richa=
rd Henderson)
fe4bd9170c: net/checksum: Remove unused variable in net_checksum_add_iov (R=
ichard Henderson)
53645dc4cb: util/selfmap: Discard mapping on error (Richard Henderson)
2521c775bd: accel/tcg: Remove unused variable in cpu_exec (Richard Henderso=
n)
cd1675f8d7: nbd/server: Mark variable unused in nbd_negotiate_meta_queries =
(Richard Henderson)
2f0e10a486: bitops.h: revert db1ffc32dd ("qemu/bitops.h: add bitrev8 implem=
entation") (Mark Cave-Ayland)
c8cf47a946: accel/tcg: Remove unnecessary check on icount_extra in cpu_loop=
_exec_tb() (Peter Maydell)
df3a2de51a: accel/tcg: Don't use CF_COUNT_MASK as the max value of icount_d=
ecr.u16.low (Peter Maydell)
3143577d6a: migration: clear the memory region dirty bitmap when skipping f=
ree pages (Wei Wang)
39675ffffb: migration: Move the yank unregister of channel_close out (Peter=
 Xu)
c6ad5be7ae: migration: Teach QEMUFile to be QIOChannel-aware (Peter Xu)
18711405b5: migration: Introduce migration_ioc_[un]register_yank() (Peter X=
u)
43044ac0ee: migration: Make from_dst_file accesses thread-safe (Peter Xu)
53021ea165: migration: Fix missing join() of rp_thread (Peter Xu)
5e32ffd346: tests/qtest/migration-test.c: use 127.0.0.1 instead of 0 (Dr. D=
avid Alan Gilbert)
15a730e7a3: block/nvme: Fix VFIO_MAP_DMA failed: No space left on device (P=
hilippe Mathieu-Daud=C3=A9)
584af1f1d9: ui/gtk: add a keyboard fifo to the VTE consoles (Volker R=C3=BC=
melin)
d4a1210480: ui: update keycodemapdb submodule commit (Akihiko Odaki)
40a9aadbc9: ui/cocoa: Fix the type of main's argv (Akihiko Odaki)
074c0653c2: ui/egl-headless: Remove a check for CONFIG_OPENGL (Akihiko Odak=
i)
9a6c69d389: ui/spice: Use HAVE_SPICE_GL for OpenGL checks (Akihiko Odaki)
cd6c768f6a: ui/gtk: Fix relative mouse with multiple monitors (Dennis W=C3=
=B6lfing)
0a9487d80a: gitlab-ci: Extract OpenSBI job rules to reusable section (Phili=
ppe Mathieu-Daud=C3=A9)
e90c3c3c87: gitlab-ci: Remove the second superfluous macos task (Thomas Hut=
h)
39ce923732: gitlab: enable a very minimal build with the tricore container =
(Alex Benn=C3=A9e)
c56f1ee668: tests/tcg/configure.sh: add handling for assembler only builds =
(Alex Benn=C3=A9e)
2da42253ef: plugins: Fix physical address calculation for IO regions (Aaron=
 Lindsay)
c2888a679d: plugins/cache: Fixed "function decl. is not a prototype" warnin=
gs (Mahmoud Mandour)
072c444b0d: plugins/cache: limited the scope of a mutex lock (Mahmoud Mando=
ur)
de9fc40f36: plugins/cache: Fixed a bug with destroying FIFO metadata (Mahmo=
ud Mandour)
f7e68c9c99: tcg/plugins: implement a qemu_plugin_user_exit helper (Alex Ben=
n=C3=A9e)
094d278547: contrib/gitdm: add more individual contributor entries. (Alex B=
enn=C3=A9e)
a10f373de4: contrib/gitdm: add a new interns group-map for GSoC/Outreachy w=
ork (Alex Benn=C3=A9e)
a7659cd675: contrib/gitdm: add an explicit academic entry for BU (Alex Benn=
=C3=A9e)
e061e481a6: contrib/gitdm: add group-map for Netflix (Alex Benn=C3=A9e)
efe2165a0f: contrib/gitdm: add domain-map for NVIDIA (Alex Benn=C3=A9e)
3d4fcf4200: contrib/gitdm: add domain-map for Crudebyte (Alex Benn=C3=A9e)
a8d1095a10: contrib/gitdm: un-ironically add a mapping for LWN (Alex Benn=
=C3=A9e)
0e7933e314: contrib/gitdm: add domain-map/group-map for Wind River (Alex Be=
nn=C3=A9e)
061a20d50a: contrib/gitdm: add domain-map for Eldorado (Alex Benn=C3=A9e)
44114d3fda: contrib/gitdm: add domain-map/group-map mappings for Samsung (A=
lex Benn=C3=A9e)
20ddc8ce99: gitdm.config: sort the corporate GroupMap entries (Alex Benn=C3=
=A9e)
200a10279e: contrib/gitdm: add a group mapping for robot scanners (Alex Ben=
n=C3=A9e)
0204e6482b: contrib/gitdm: add domain-map for MontaVista (Alex Benn=C3=A9e)
82585a3100: .mailmap: fix up some broken commit authors (Alex Benn=C3=A9e)
fa3d60953c: contrib/gitdm: add some new aliases to fix up commits (Alex Ben=
n=C3=A9e)
11bdcfcdd2: configure: remove needless if leg (Alex Benn=C3=A9e)
15d9c3cef1: docs: add a section on the generalities of vhost-user (Alex Ben=
n=C3=A9e)
189c099f75: docs: collect the disparate device emulation docs into one sect=
ion (Alex Benn=C3=A9e)
6e52aafbac: gitignore: Update with some filetypes (Viresh Kumar)
cbc94d9702: qom: use correct field name when getting/setting alias properti=
es (Paolo Bonzini)
18fa3ebc45: qapi: introduce forwarding visitor (Paolo Bonzini)
eafadbbbac: gitlab: only let pages be published from default branch (Daniel=
 P. Berrang=C3=A9)
9f04dd7f5a: MAINTAINERS: Add memory_mapping.h and memory_mapping.c to "Memo=
ry API" (David Hildenbrand)
07b315ba92: MAINTAINERS: Add Peter Xu and myself as co-maintainer of "Memor=
y API" (David Hildenbrand)
4ade3ea145: MAINTAINERS: Replace Eduardo as "Host Memory Backends" maintain=
er (David Hildenbrand)
5b8978d804: i386: do not call cpudef-only models functions for max, host, b=
ase (Claudio Fontana)
3407259b20: target/i386: Added consistency checks for CR3 (Lara Lazier)
917ddc27d8: meson: fix dependencies for modinfo #2 (Gerd Hoffmann)
8a13b9bc0f: hw/display: fix virgl reset regression (Marc-Andr=C3=A9 Lureau)
f29d52611c: vl: add virtio-vga-gl to the default_list (Marc-Andr=C3=A9 Lure=
au)
02f9725f3d: hw/display: fail early when multiple virgl devices are requeste=
d (Marc-Andr=C3=A9 Lureau)
dcc5fc2a3a: Revert "qxl: add migration blocker to avoid pre-save assert" (G=
erd Hoffmann)
39b8a183e2: qxl: remove assert in qxl_pre_save. (Gerd Hoffmann)
0848f8aca6: configure: Let --without-default-features disable vhost-kernel =
and vhost-vdpa (Thomas Huth)
bcf0a7dabd: configure: Fix the default setting of the "xen" feature (Thomas=
 Huth)
3a6a1256d4: configure: Allow vnc to get disabled with --without-default-fea=
tures (Thomas Huth)
332008e0b9: configure: Fix --without-default-features propagation to meson =
(Thomas Huth)
ac34711171: meson: fix dependencies for modinfo (Paolo Bonzini)
c10852afb6: configure: Drop obsolete check for the alloc_size attribute (Th=
omas Huth)
d499f196fe: target/i386: Added consistency checks for EFER (Lara Lazier)
213ff024a2: target/i386: Added consistency checks for CR4 (Lara Lazier)
b128b25a5a: target/i386: Added V_INTR_PRIO check to virtual interrupts (Lar=
a Lazier)
40e07370f2: qemu-config: restore "machine" in qmp_query_command_line_option=
s() (Stefan Hajnoczi)
670b359193: usb: fix usb-host dependency check (Gerd Hoffmann)
f288d9932c: chardev-spice: add missing module_obj directive (Paolo Bonzini)
dc2deaba48: hw/display/virtio-gpu: Fix memory leak (CID 1453811) (Philippe =
Mathieu-Daud=C3=A9)
25fc9b79cd: target/hexagon: Drop include of qemu.h (Peter Maydell)
4699a92779: Hexagon (target/hexagon) remove put_user_*/get_user_* (Taylor S=
impson)
955171e441: qemu-img: Add --skip-broken-bitmaps for 'convert --bitmaps' (Er=
ic Blake)
74a4320f30: qemu-img: Fail fast on convert --bitmaps with inconsistent bitm=
ap (Eric Blake)
94075c28ee: iotests: Improve and rename test 291 to qemu-img-bitmap (Eric B=
lake)
c2ffd7549b: accel/tcg: Record singlestep_enabled in tb->cflags (Richard Hen=
derson)
d40c5c7976: accel/tcg: Hoist tb_cflags to a local in translator_loop (Richa=
rd Henderson)
b5cf742841: accel/tcg: Remove TranslatorOps.breakpoint_check (Richard Hende=
rson)
10c37828b2: accel/tcg: Move breakpoint recognition outside translation (Ric=
hard Henderson)
11c1d5f8ca: accel/tcg: Merge tb_find into its only caller (Richard Henderso=
n)
e64cb6c231: target/avr: Implement gdb_adjust_breakpoint (Richard Henderson)
5bc31e9440: hw/core: Introduce CPUClass.gdb_adjust_breakpoint (Richard Hend=
erson)
7b9810ea42: target/i386: Implement debug_check_breakpoint (Richard Henderso=
n)
b00d86bc8b: target/arm: Implement debug_check_breakpoint (Richard Henderson=
)
e3f7c801f1: hw/core: Introduce TCGCPUOps.debug_check_breakpoint (Richard He=
nderson)
258afb487f: accel/tcg: Use CF_NO_GOTO_{TB, PTR} in cpu_exec_step_atomic (Ri=
chard Henderson)
04f5b647ed: accel/tcg: Handle -singlestep in curr_cflags (Richard Henderson=
)
fb95701132: accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain (Richard Henders=
on)
84f1561629: accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR (Richard Hender=
son)
288a5fe980: target/alpha: Drop goto_tb path in gen_call_pal (Richard Hender=
son)
043e35d98c: accel/tcg: Move curr_cflags into cpu-exec.c (Richard Henderson)
78ff82bb1b: accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS (Richard=
 Henderson)
f3e182b100: accel/tcg: Push trace info building into atomic_common.c.inc (R=
ichard Henderson)
785ea711b1: trace: Fold mem-internal.h into mem.h (Richard Henderson)
a754f7f34e: accel/tcg: Expand ATOMIC_MMU_LOOKUP_* (Richard Henderson)
fcff001441: accel/tcg: Remove ATOMIC_MMU_DECLS (Richard Henderson)
48688fafeb: accel/tcg: Fold EXTRA_ARGS into atomic_template.h (Richard Hend=
erson)
e28a866438: accel/tcg: Standardize atomic helpers on softmmu api (Richard H=
enderson)
be9568b4e0: tcg: Rename helper_atomic_*_mmu and provide for user-only (Rich=
ard Henderson)
9ef0c6d6a7: qemu/atomic: Add aligned_{int64,uint64}_t types (Richard Hender=
son)
47345e7124: qemu/atomic: Remove pre-C11 atomic fallbacks (Richard Henderson=
)
952fd6710e: qemu/atomic: Use macros for CONFIG_ATOMIC64 (Richard Henderson)
dadafe6785: vl: Parse legacy default_machine_opts (Jason Andryuk)
461fea9bf1: qemu-config: fix memory leak on ferror() (Paolo Bonzini)
e72f9524fe: qemu-config: never call the callback after an error, fix leak (=
Paolo Bonzini)

