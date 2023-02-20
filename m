Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA55369C848
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:10:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36Q-0007yW-FJ; Mon, 20 Feb 2023 05:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36O-0007wO-EP
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:56 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36L-0008TJ-0n
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:56 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K8wx9c029409; Mon, 20 Feb 2023 02:08:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=ILSwItAFJ6CZYebmZ6YZfKqXy6gKIuSf0BhfwTP2B8U=;
 b=V2uDlfddTjUAdUR07kd8yo3T/TLqEzWfOj6UKgM9mk5gQ+5X3owZImfyjTgiWr7rqcYy
 zbVnsRlPEJsuoVcdKBj1ioagTU//bmUjm4AXFAqdmNGRY/gjWd/N9fKkvsq78exm2tZu
 xpZ79FoFNdiBLrJkuJA8xQ8IGr7HLRY0QC+htJ1YyAQ1Ygo97GsoONeKqMUaLIdmCBBH
 fkcEe439lpyJ0oboVeWexCdm5ecPuu66Fzq132KzK69gRP3mAFuQ319lDqs7J2d9Ng0p
 NMToV7eWaTlr/8jJg2FaEPLhtX6nEkOyYZi5j4HqJn1J/ftKVpPhTNCNpkqwWBO0rqPg uA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6sfs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A90LbkZGZ8VXjdQngyoaAkeuDDGGaDAK4upMqt7oeX+8eYc07TIlWBlGk9uWD5+umNsmWzy261ccTVoV7oCgQPYI+6MEx8uVxiLk6mEuU/YcIhsFM/wG/5Jzt9N15Z4WnwZIiag22wRTtzDOXpp0bd5i3NxeAJtgSRDUqENUnpx4I6EXLIsszfWotDHHTOCRW59n35q8gX08meHyJS1TNZ60ljHap6ZPHyeoVbcdUg2uuE+9RSulQvkfroU6dHUBReuTe1JJakGe50WnM7oNqI9x6nuGTBrBuyf9hhTJuChPrvmR8CZQ5fgiulsUjUJTaMCr7CqnWmAU8zQ1hnBfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILSwItAFJ6CZYebmZ6YZfKqXy6gKIuSf0BhfwTP2B8U=;
 b=QVZBdpdQXZK1Mp3/nk/dRU6rhpxGDgEc3UHIOr5zSiH4/oV89Fugp8fLdoWXOkE9zgcRRuv9Yw6R/RrqqPVakwtJDNn0ENCeqpbOKpGfH3nD0aHz49ecatx+quebFKXxNQ0ses9cllzkLEOH+GfpXLSGyKrqMHAvXXMe5M+IhQ8ZcHuGeaR0pMUlKqSsiQJAj1f7eAZK2dc0AK7bzBryaparhJjS9yZ43xNQTz0iNWg0jAjaLi56tq41iFh0aB24F4B4MXWCRmZqoOhbN5rztEpbKr1tf/nTccEkk44vrxHaTw1ig45hk901lZTvqWCD3BDcbkzBxlYgm5yuKtglNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Mon, 20 Feb 2023 10:08:30 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:30 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 00/16] hw/9pfs: Add 9pfs support for Windows
Date: Mon, 20 Feb 2023 18:07:59 +0800
Message-Id: <20230220100815.1624266-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SA2PR11MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab5b8eb-3e27-46ff-a761-08db132a6a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ux5erxoJ2HGHAcQmkeT0zH+2bXoxGIpOE+7iI0jOloyX71LYeHBZhCzl5CKk2YIk+eqIORJuARPIkfsnKku3Lq0/OxGOLuFGNGBgYYTfbad94lwYIKHDWfDVwXr/3xFDPs7NQCkoJOBfw/ynmsAHeYUTJdWn7gJobbiUNz3PGNGqFkTRup8N4YW/THlKAhS0mc0U+rXV6Ao5Tt+hEd0w9IOTJxUraLDXftIlgnabMc18M1N3yzujtYzaAEZnyHd5DL6MRLPMca/Aa9QXXVH0JZHMbKK6fgn0Dvh2WwuNRA62bfiPJohBdamrgQ72CqDgoZcUtvZmc7e5HPVsZWK9ukAQPd8P+K45RIOIFMQcmho55DMqg5aESs+80f6AYRJ5i8/NSTCHcWrj3L9kvJZprn8P8OIwuF4HnYrgTUbZiAeMMZbUcUKNMCKFuSZFTG/g8oXa65+AOVcZRtnNsDam7oMSs4r0q5t1mqxtbWNt5/Qw7ZKyn7avfwyZZdV5eSlQ/5u3B0NTUL06HbXNYAHNFA+Z7pw3V9V7al9dozVY50AnWZ1uW6yXcrXlxVcdxM5Vgln8wm6P33EEQBrKXxnv4w8LOzsBU+uUFlRkWrE844y3ZKkQ6vU9DV/Zp5vkfV17Yu7qfXJiHMj9bW9vSnUe4OmVPZg+nNmnwQPjibEljQwG/DOt9YxGEMvacHKI3wMesYyPg0lGcva3YmNNaTF+hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39840400004)(136003)(396003)(451199018)(2616005)(66556008)(8676002)(66946007)(83380400001)(66476007)(5660300002)(8936002)(6506007)(6486002)(6666004)(1076003)(6512007)(26005)(186003)(52116002)(36756003)(478600001)(110136005)(316002)(41300700001)(38100700002)(44832011)(38350700002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q294MllVM1loRHJCTC85UkNQME8vZ0g5bVVDc0FReVZOSWVjSVJVWm5aajdS?=
 =?utf-8?B?OXZVc3d2d3VMaU9PRU8rdWxpekxGL2tRSFNTOFFOZlpYL0JFdkFIRXNEcWU1?=
 =?utf-8?B?RDYxUXdWTnJKMDZLNndFSy96OGtPSE9DRGQ2emxmdnpYR2RaY3IybHlXUkFn?=
 =?utf-8?B?R3h0S2x1b0Fwbkx6MnFMdW4xNWwzUGtudytzell1SVNUU0Y5REhZM3FtOVFT?=
 =?utf-8?B?M1FBcytOeldJSkNrM0oyVDMvUGVYZ1N1WFBFSmNzb1o2M3ZhSUU1aFBoZG9O?=
 =?utf-8?B?b044bHlDbUUreTZqNzNqR21WSFdobWhMM05IUFc0Y3FTMEU1L3ZsT2owcU1K?=
 =?utf-8?B?LzY5MlVYMWZJQ3NoWFpwOW5sWjVuc3c3cDNsR3ZOUHAzK0pIMXQ4VnNrWk9J?=
 =?utf-8?B?eG1pVXVTYmtTcmJHUmZQeDJXK0Job0JodElFd1M1Z01obC9MN0RxNWNjeU5l?=
 =?utf-8?B?ejhJRDJ5S05UNitmV2E0RTlMbUQzZ1h0WWVTWXB2c0o1TkVrMzVUYTVhMTd4?=
 =?utf-8?B?VHJOcHBmSjJtNlpuWjJBUmxkWCtuQUtLTGlJTGJxK0VaOXdSM2xlc1U4cEw3?=
 =?utf-8?B?aXdieEFHMzVXcWZRalMyQjFFbW5WVTcxbGU5SkxJaWtpUGJGQzdZUFZSR0pI?=
 =?utf-8?B?QW5ZUStJdWI5NkhDK0dYVzZDY1ZjK1BYSlcwWWswZTdDcVFTSWNzaTdlT00w?=
 =?utf-8?B?bHBHVk5vbk5FRGpHT0dUK0NMNW1MUEoxc0xDS0FnY2t0bVQvMVBsZ1NZWGlz?=
 =?utf-8?B?bFRZV3VYcVEvZDdoK1hkaUEyTHEvZldBMytEN2lpa1AwK3g2UkZpckpOaDF3?=
 =?utf-8?B?KzBWODlCd2FPNVhObDlqcXZoVHc2dG1pM3NSY1ZLN09VY1BOYytPUzhtaENw?=
 =?utf-8?B?bmZYUXZCRDVVemdacnA5Y1JoeWZtS1AxdHFPbnpQbTJFZEZQblljN0IzVDd0?=
 =?utf-8?B?cHVPTDk1Z3NKUTVVdFBPSGxUV3kyMmVGck1GMGdJNUk5cHdGbnhWOW94STFG?=
 =?utf-8?B?MVJJd0VsMWJqQkhTSmVqZXMrZzlQRkNGMXNyNFozdy9UeVk5c3RIcnd1WEwz?=
 =?utf-8?B?RnQ3K3c0MGZXT09TZlN5anQyU1NQUHpZMm5jYXBXb1pONi9Hbi9MeFVGbFNT?=
 =?utf-8?B?VnlneFJxTXFGcU53cXhkb2dCblVQQzNoV2tnY3RLbG9icXFFUzIwdDNERVdu?=
 =?utf-8?B?S25WL2FCc1hUWXdSaFJMYVdvZy8zMFU2bDFDV29SMnBNakhGeEtjS3pMYTln?=
 =?utf-8?B?UTA5NDVFK2J4MFM1Q094K3B5UGZtQ2lzcW9sNnpPTmtEd0JsdmV3SERtRTdy?=
 =?utf-8?B?TWJXYWRvVFZHVFIrTDNpYTloZVNBQmxZQ0ozMlZ2cEpVckwzQ2hGWkV6M1c4?=
 =?utf-8?B?WXkxTGpHMEhEbUljRzkxZE1CNDVIN3ZHQ2psWTdQL25XWld4MVhuZzRFOUov?=
 =?utf-8?B?VHpKWG5QbEpsYXIxVTRSeC92YjcwVldLb3YzMUZlSUloMFFJdlV4M1JreFpn?=
 =?utf-8?B?U3BZZWhwOXRENXdVZUcyRkNoWVF0RkFVMHlyZE5FUjBKd3JoTnFaMC9KdGVD?=
 =?utf-8?B?dE02bGk4UUhLa1hwdXhCMkJqTTdySEtiYkhQejZVUUowQlE4K3BXd0VOclZk?=
 =?utf-8?B?TVh3TklsUmVzaHNUV0NkV1RGd3ZvbG9rZG8zOGlEK2YvM212UWdmb0xyY0Q5?=
 =?utf-8?B?VWlENXY5WTVEc29lWTUvbFJsMldnQlBUbTV1SU04aVRYNTByWlZUaEY5WVJF?=
 =?utf-8?B?eWFkeVNscmRqdG0xMGRQU09lODUyWVZqSExPb1VwWTUxd3BnZXIrYU5sWk5T?=
 =?utf-8?B?ZS9hQzk3OGc2N0Q2aWVhaG9vb3hZL1g2TUtab2RUR1MxRVBpemhLaWdJQy9x?=
 =?utf-8?B?K1B3VUhEUEsxemg0dnh0Rmx4aWpwbXV2VXBlS3BsUWRaOCs3VVVEYnRodmNV?=
 =?utf-8?B?VGFEZlBNTTZXYUg3NkJpMWRVSEloM0dpUkc4aGVxblJDVUFaOUEvYWRBYkhy?=
 =?utf-8?B?QVk1aU1nU3hyOFFHMDR5cU5CZjg5dEJiRkgxSjcrVGYyRnlzdXVDQnRIN2sy?=
 =?utf-8?B?c25kZVk4WVVyRmNVODZReWQ5OVYwNmlwd29HSWVmMDI3ZXl4ZldWa0pMSlgw?=
 =?utf-8?B?VzVuOVhzbm9sbHZmRU8rR0JJbkx1NGUya3BQRDl3WXA0YnpOUGdQV3VWN0xl?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab5b8eb-3e27-46ff-a761-08db132a6a78
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:30.1871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOcfbQA5xK1KCQMjr/+3DQ7p/iCEpzatrCGCVo+wyE11tP9go15KrmNqxLpzcjo12DYaxcVdKZsdaIaWBTVnaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-Proofpoint-ORIG-GUID: SldzKM2bwVlEl8ctnqdl2dGvMtBO4xdq
X-Proofpoint-GUID: SldzKM2bwVlEl8ctnqdl2dGvMtBO4xdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=650 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302200091
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

At present there is no Windows support for 9p file system.
This series adds initial Windows support for 9p file system.

'local' file system backend driver is supported on Windows,
including open, read, write, close, rename, remove, etc.
All security models are supported. The mapped (mapped-xattr)
security model is implemented using NTFS Alternate Data Stream
(ADS) so the 9p export path shall be on an NTFS partition.

'synth' driver is adapted for Windows too so that we can now
run qtests on Windows for 9p related regression testing.

Example command line to test:
  "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device virtio-9p-pci,fsdev=p9,mount_tag=p9fs"

Changes in v5:
- rework Windows specific xxxdir() APIs implementation

Bin Meng (2):
  hw/9pfs: Update helper qemu_stat_rdev()
  hw/9pfs: Add a helper qemu_stat_blksize()

Guohuai Shi (14):
  hw/9pfs: Add missing definitions for Windows
  hw/9pfs: Implement Windows specific utilities functions for 9pfs
  hw/9pfs: Replace the direct call to xxxdir() APIs with a wrapper
  hw/9pfs: Implement Windows specific xxxdir() APIs
  hw/9pfs: Update the local fs driver to support Windows
  hw/9pfs: Support getting current directory offset for Windows
  hw/9pfs: Disable unsupported flags and features for Windows
  hw/9pfs: Update v9fs_set_fd_limit() for Windows
  hw/9pfs: Add Linux error number definition
  hw/9pfs: Translate Windows errno to Linux value
  fsdev: Disable proxy fs driver on Windows
  hw/9pfs: Update synth fs driver for Windows
  tests/qtest: virtio-9p-test: Adapt the case for win32
  meson.build: Turn on virtfs for Windows

 meson.build                           |   10 +-
 fsdev/file-op-9p.h                    |   33 +
 hw/9pfs/9p-linux-errno.h              |  151 +++
 hw/9pfs/9p-local.h                    |    8 +
 hw/9pfs/9p-util.h                     |  139 ++-
 hw/9pfs/9p.h                          |   43 +
 tests/qtest/libqos/virtio-9p-client.h |    7 +
 fsdev/qemu-fsdev.c                    |    2 +
 hw/9pfs/9p-local.c                    |  269 ++++-
 hw/9pfs/9p-synth.c                    |    5 +-
 hw/9pfs/9p-util-win32.c               | 1452 +++++++++++++++++++++++++
 hw/9pfs/9p.c                          |   90 +-
 hw/9pfs/codir.c                       |    2 +-
 fsdev/meson.build                     |    1 +
 hw/9pfs/meson.build                   |    8 +-
 15 files changed, 2155 insertions(+), 65 deletions(-)
 create mode 100644 hw/9pfs/9p-linux-errno.h
 create mode 100644 hw/9pfs/9p-util-win32.c

-- 
2.25.1


