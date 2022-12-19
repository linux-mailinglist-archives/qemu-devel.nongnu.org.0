Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5A650A2B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:34:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DH7-0003Br-Nz; Mon, 19 Dec 2022 05:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGg-0003Aj-Pf
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:13 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGb-0007PI-8o
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:10 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJA0m7O003812; Mon, 19 Dec 2022 10:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=PfnK1WqiGbskdJNSZ6wJnL4YH9zuwz79hhHyJkZEASc=;
 b=VKD4Z+2B9IDPEdjmeccJ25DEVxFt2VaQL+iJ1hVrz6SYlrEyc0W4IQtjf/SPFzBPzzcs
 wV5cG+eXJUoHSQGSe3MvwcCqNkrPAMYonocBbBC2MzgoIX5viZaIu4eK9bZqSBSBsjBc
 xcd385/OKCfYcoTTrVoIi9/UaZfXZc/PGfmJ/inC9itoN9rMGZnFT6mU8Uh9jBprUA9d
 2A4YzcJ3GodgWuDLhfII1+D1qw6vgeMocA1o27hM5DOC2MK7VW1Zs0ehXgV6iC4I71e6
 04x9xgQJKMNncdHSgdQ3q9VpHfc7JqOZ9abTSuqpe6yvSyR/l5CUFK/MkBYr71ZYmYbn OQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh301hdgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:20:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLN4pLeHE9Ur/6S8j1SAtajUfH7pTFkQBPBKbdM1i60y6HwFIj3qgPMoqziwL0fP8dRd57AmnRkDsGJcDPB26iprqq8DQadhqmx3HBqv9O/6WUFegoP5PC19SnVlEafWVk8iXCE5HqSA0KYo1qToNNdMsaAh0lllWoia8R8vavi0Okno2+bUuLfWyDzpPP+gQGiNh8+/HkZop22eT7fzJDhTZCdGxMbHJ/36CGaRdEl/mjVB1Q/ChJQl9R0WmoJ7zsdqM42JgT/r5h15CSbEYV9jZ9DH93vNhXicGMtsRuWVLhkpg5j54jicYkCU70aaHQ/2E9lW72zBPGHl/F8icA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfnK1WqiGbskdJNSZ6wJnL4YH9zuwz79hhHyJkZEASc=;
 b=cqp9/c6brjbj71xZ9fVWcU93ByamrcFYcbBTzX0ILM3MhDP0hv4sI4l1LVSH6cqos7cbx+9rTjww4HVJjmBxIicynuuQYfBG0DUO27tKS88zw3hVxYUh651tIJOeoJFxEPw8s+ZIHLV4mWfs461WFUiNFQ9Ra4HgmbXfb4p2qEGc5paoc7+Pq2cpWZHWeobA08/6YEAI9to3mDSnS/mwOxDyg5p0+Zy7p8Fc2EEGoSobWXrB2VHQACfPkClM79XVVFX6r6Lf3pt/yBJCnhNfrQwEfyipIyZdFBSQ7H3trj0LnHpd0ZYQ1KpEme+w8rZirUednZMZdjMFTUGYTO5DiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:20:44 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:20:44 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Will Cohen <wwcohen@gmail.com>
Subject: [PATCH v3 00/17] hw/9pfs: Add 9pfs support for Windows
Date: Mon, 19 Dec 2022 18:20:04 +0800
Message-Id: <20221219102022.2167736-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: ae89be57-e01b-402a-4c48-08dae1aaaf09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 63XmDPqBs+Kr3C7Y+vUOWMO3jkP2kY+udg6PJFNqS+NTfsLNQTNB8IP+7b0CznEDHiRFf6CxMigh2OpOcfk9kazITbGbCm6+S+rj6+DdqhZSKx6sb9HIO5odvQUX4c3Y3dTTWOItCeLzFjpK6KnH5Aig5HcxRXDBfSbCD4mVZEBKh/uCi7ARNx4quP2lowc3RHC/5Ydgjcb8SkfbjR6uw6LXsxJoZwt8MMD1LjIMKYlUUaus3awoGD6S4c2dDS7mi//i74ggcl7p7gHRG3Mf0eYBl7i0X+C97gsVpy0/K8HibCV/wWoyIbcYQuS3ILtrMU27KY2RfeFo4k13OEevBy7dNXQWZsB5IsENhVTZsQek18bUjbfaGZq64WCxVgvc0HW43yJLkMQ6upXGqJZnRzKN4jaGGsAv+NMGKPU5R16odu5tqvjZdIMu2xlcHN3U2D5bcRFA9udbOr9GeVRbgOBJBuWuBK39kUhTL3N1MCOBERiVzdGJNC6UNSaoyA64SQ+We11OIyAEok53SpgKLhRlf9lMBkMxCWWuqa3zGoVo7rUaIGVLBKdwX387DsH54qYXHNMd3OJ1vuek2kecrZgnRy56aH4tvcskDsqiU10nPbRht4bs8egeZ7M1cpZ7ebhKG8r+pL3LokxZdMj80wk0XgjgDbuXhxCGvk4o47d8MkKRL6oTfxtzKc/e5vwVsxBQ6gKJMg/0UfrPJrQ83w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(7416002)(52116002)(316002)(478600001)(54906003)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFo0bE05YmtEUjM1NlYwdng1WGhiM2I0UFE2L2FibDlOYjdtV0VDaEg0dklv?=
 =?utf-8?B?cCs0akJyRVFEOTEwYmk1OE5ZT0s3ZHZhUExUaFdqb280Sm9ZRlNQaXFGczRH?=
 =?utf-8?B?eDVQNlp6c0hzUW4wSFd2Y1V3dGk3cExWV29PRUNhUDRuS1BjQTZMWGZuMDdk?=
 =?utf-8?B?ZFJZWXh3SHBUNHNEeVZjRDdKRTZPRFhwNnIyU25EaCtjSmEvZXVxZnJad0t2?=
 =?utf-8?B?c2Q0QnBNdjh4eHV1bjREWUF5Rk1Ia2JaS2VkK01xbFJRcnFIdmx5MWNHaXRt?=
 =?utf-8?B?TVV2SEFoTDRMSjhMclVPWDJwNkJETzg4eXNoaHRIVWhkWlFoZnMwMzA2S3Yx?=
 =?utf-8?B?MUttS1ZiaHBPNGdJdEVjMkRJNnRsWmI4amE4akdSZ3R5cVhOUnVHTk44d1RM?=
 =?utf-8?B?b1Rpcy9TSWxuVEJ1QlFBZ1cxcnFybFlqcVA3cjNCRE5IamYwaGNRb0M0MmdM?=
 =?utf-8?B?ZmFKY2ZPS0gzYk9qNlh6Q0FaaWp3MVpoRmlmMTRZTkNyY01EYXI0dzRxYTRs?=
 =?utf-8?B?MXpzbmJNcEd1Sld5NytSbXY0NWZ5Z2YvdWlxSERHeThpUlNidDBCT2FsZnRF?=
 =?utf-8?B?SmNJV1Z6WXF0SlBpVmRzZ3hrclR4UG5HbGFaeFNuY1pYRldoS2RFbzg3bXdn?=
 =?utf-8?B?ejhpNWF1bDdXL0ZiSG9STUptSXdpVEpMbFpNVmpMQlRXWEVJVjE5MElkSmNF?=
 =?utf-8?B?dFFlY2I1N2xZWmttcldqdDZGRTZvY2ZwaEZpVjQwd3RBMG1KYnVmamorSjlW?=
 =?utf-8?B?OFlkbndNbVRTRW1rak9qWTkyVm5uK21NU21McGxqdEtZYlZCTnh3TU15dDBm?=
 =?utf-8?B?Y1ZIRkQzWDhONDdsNlpYOXNTYXNnSHBQT3ZrT0huUStnc2lqK0szRWZmcGR3?=
 =?utf-8?B?bVBsRGR4dll0YzZDcVNrN0NXTXp0NzE0c0I3eWNNUFd3UzFoVjlGTW54WEhM?=
 =?utf-8?B?bVVXUDhTMUpHZm5uenBXSWRDVGt2L3U4MHAyRzJEZGY2eHIrdHBRRko0bkRD?=
 =?utf-8?B?d3R0b0NRajdrdW1vSmlOZnREVkNFaWN3VXFvRVV2U3RhZFFzSzI5eElSRDU0?=
 =?utf-8?B?WVV6djRiYUFVa0lyQzRSNGNiRGY0T2ZrMzlPWmY2ckptNFFSVCtpdHdLUHFv?=
 =?utf-8?B?U0ZwQVQreEJ5YzBSNkd0NCtHTWtBeW9xcHVYRXh3ek16YmpOZXZkbHh1cTdZ?=
 =?utf-8?B?Mko4c1N4WjNsaFlVMTVka0Z6QUhiMWtjWUY1R0VpUG4yRWZONlppTTN0Q0l4?=
 =?utf-8?B?OHJGbzY4a29JUlFDRmxBTERXQyt5UHBneDNIMktsVGR1RjVpZWw4emFjczUw?=
 =?utf-8?B?cWM5enNjaVJRcGRWVmFKaE9rdUdxSnZQcENRSmg4NWN5L3JDM2UySVRHeU56?=
 =?utf-8?B?WXRxVEZkTWRhYVEzMFhsS3dNODNzdUNFMklDVDZXRXRKT2JIYzJ2ZDdtL05n?=
 =?utf-8?B?TytsUUV3cGdlSjdkOCtqWStVMzJPdUZ0dmEvSUl5dmJKbTJXYXUrNTZaV0Zm?=
 =?utf-8?B?OUovL3FEdUFkK3hIUlFjaFR2bE52eVVSVEpNMlFlZEVhVHhWZmZmT2lrUjFI?=
 =?utf-8?B?VXF2WXdIcnk4TzhMeG9NS052azJNQ21HeVNZQW40VGViL0ZiSHo4RStLVW5B?=
 =?utf-8?B?OFNoWXBRSjBUUHpkSTV5WURZbjZabWNIQlVsTkhIYkFxU3E3YnpkREZtRVpZ?=
 =?utf-8?B?SnlnUEh6cHdXM2VNTW1vdVJIUlJxWnBQWUNITkp3bVhtMGNnRGFCa01OVGZk?=
 =?utf-8?B?NTJnTXZUanVJMXpkbndaWTZ6cWxVajMrdjVBYll0TDRobVdUbjk2SVFFR3dz?=
 =?utf-8?B?dWtYcXpSODRmdzJ4NTlTVXVEVldnSjJlaklVelNSWldQU0NzVGJsWTQ1T1kw?=
 =?utf-8?B?UVBCSVowRFd1NzBBV2M3OHNBSko0SDlNcng3Y1ZuRHNXR1JiZTEvdGtVQlFw?=
 =?utf-8?B?dmI2QUxRRy9RL3VYRTFyeC82RmFJT3ozUmtyUFMxNlRNcERvRW9IL1g0aWlE?=
 =?utf-8?B?TnF0OGprTmNWZllxaFNqRktVSUVySGlTNCtITFovVWpsWUZFUlIvU2w3L0lD?=
 =?utf-8?B?QkZRNWJPbktTTTBvSzRXdElidDF5ekNPYUY4dlZsNnU2LzdzSU9sSXRlN1N6?=
 =?utf-8?B?ZUJtSVd6Tk5wbUdsWUxvRkRmd1l0L2tTVUprdkhxMFZ4NXBQUE5NRGtOam5O?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae89be57-e01b-402a-4c48-08dae1aaaf09
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:20:44.3980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBemd7Q702bhMiskrfhEOy+gZAJtPzxUZl2uuxuR1bCDVvIRkWMWsZhWPyjO1BFsVTYRRIQT+h0piql6YrtatQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-ORIG-GUID: uieuM0NZFbcgQW5kDcXDS85qka3nGeh7
X-Proofpoint-GUID: uieuM0NZFbcgQW5kDcXDS85qka3nGeh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=489 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212190091
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
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

Base-commit: 562d4af32ec2213061f844b3838223fd7711b56a

Bin Meng (5):
  qemu/xattr.h: Exclude <sys/xattr.h> for Windows
  hw/9pfs: Drop unnecessary *xattr wrapper API declarations
  hw/9pfs: Replace the direct call to xxxat() APIs with a wrapper
  hw/9pfs: update helper qemu_stat_rdev()
  hw/9pfs: Add a helper qemu_stat_blksize()

Guohuai Shi (12):
  hw/9pfs: Add missing definitions for Windows
  hw/9pfs: Implement Windows specific utilities functions for 9pfs
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

 meson.build                           |  10 +-
 fsdev/file-op-9p.h                    |  33 +
 hw/9pfs/9p-linux-errno.h              | 151 ++++
 hw/9pfs/9p-local.h                    |   8 +
 hw/9pfs/9p-util.h                     | 137 +++-
 hw/9pfs/9p.h                          |  43 ++
 include/qemu/xattr.h                  |   4 +-
 tests/qtest/libqos/virtio-9p-client.h |   7 +
 fsdev/qemu-fsdev.c                    |   2 +
 hw/9pfs/9p-local.c                    | 386 ++++++++++-
 hw/9pfs/9p-synth.c                    |   5 +-
 hw/9pfs/9p-util-win32.c               | 963 ++++++++++++++++++++++++++
 hw/9pfs/9p.c                          |  90 ++-
 hw/9pfs/codir.c                       |   2 +-
 fsdev/meson.build                     |   1 +
 hw/9pfs/meson.build                   |   8 +-
 16 files changed, 1759 insertions(+), 91 deletions(-)
 create mode 100644 hw/9pfs/9p-linux-errno.h
 create mode 100644 hw/9pfs/9p-util-win32.c

-- 
2.25.1


