Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C15F9754
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 06:12:31 +0200 (CEST)
Received: from localhost ([::1]:47434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohk9U-0000MR-OS
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 00:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7282db322c=bin.meng@windriver.com>)
 id 1ohk2M-0004dt-CJ; Mon, 10 Oct 2022 00:05:06 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238]:58942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7282db322c=bin.meng@windriver.com>)
 id 1ohk2J-0003GK-DX; Mon, 10 Oct 2022 00:05:05 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 29A40txf008795; Mon, 10 Oct 2022 04:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jvDkOmeb1/yZERBYmTQ0pnfnU2d81Gvgu5RDl+31E/c=;
 b=TZII8aWp8D93rpPsBj7vXIgnPWit7Etns4IE4KFtCuLUYpHNSp/JWIjLWMJaRfC8m1TE
 djITrQpmSmrlDlQMeA1JiubSnJLCPe48CCQBJL8qKe1yrsVDMzKP37xIDRRstjy6wU5g
 gK/+92gw/RwJ36kP54OPEgQTYM7LxprBN6mCgTX/XyaRFZ4Xel7HHcwcpjt3YR0Hg7Vz
 DIcx2ojkz3vVr24KyX2kGl9ipfOBWxN8Pghdim7SlizWRw//jnUjKZSgHwdNU/PEuJvC
 Xkwp+rlopIUHYmm9/lLJd3Y8avefOUzfXMTIiboUVI7jIp7DNXq3h3iPnugiRC+JRoip VA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs17du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Oct 2022 04:04:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LI7VohA2/Rg1JYPkKmls0FOouvydKd2TW7NUvQvWc19OUzFwD0Dxs4MZ/B3gF+KY6zOqVxxL5iZmGGETVUJ5ZrTm8LDYk93VtZAHi2DZTeJ810sniZg8kLo1Jqf793jpfU1yu3nm6KxwxOYyS8EcAYrKzRuHm9W1FGensj9YoO2xhXicX80ibewHx8bs7gn21v746poKwlEA9oq5faL+wTkA1DCnJ54AZU2u9wd057LGtFLuuZ8mjWTgXnQNxoy6/Xiclsip0DjqnuJJpg7trATnvGK2wUyla+SWTEpVwjCSRYnQWzhIRPzly5CGodMjeIWyLlw8qCpzeXv/GwC7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvDkOmeb1/yZERBYmTQ0pnfnU2d81Gvgu5RDl+31E/c=;
 b=Dcm2dFaaASxCGE0SACVGPnec6mWLRxc6RwN+gAJNMXWUBwfVya2ob9ur4Rb846ExXZCxxeXmm4S44sFi0TI9/kENZfcd0SUlKv4GsJR3uSOJ8Kq9edyYRJICcaP5c4ixBzc4pkd54ru4Rche3PT9v2LyfNcxDUfswnGHKy/cL2K+/xsTp3X0O+SG3zevNqNk5cbVhE4Ha4msYwj1spu85mbpX1UwSVi4d/dYoh5QjkVYPfDOvNJBbHHZ+TUYDa2Fo4xKOqD5hLA9FkNkdtYcBYVwthlkDrRat8qpo/6livUjTDVx7SD4DlnchQc2YJZVeXZqN1DgRdm8ARPlO62daw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.40; Mon, 10 Oct
 2022 04:04:57 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::1c50:83e9:d2fa:ebe9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::1c50:83e9:d2fa:ebe9%8]) with mapi id 15.20.5676.031; Mon, 10 Oct 2022
 04:04:57 +0000
From: Bin Meng <bin.meng@windriver.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 2/2] block: Refactor get_tmp_filename()
Date: Mon, 10 Oct 2022 12:04:31 +0800
Message-Id: <20221010040432.3380478-2-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010040432.3380478-1-bin.meng@windriver.com>
References: <20221010040432.3380478-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:100:2d::22) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|PH7PR11MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a4bfcf-8969-4bf5-0192-08daaa7497e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1AqCl08kx7NpM0A51FnZ+FVuq1DWpMHuuxqusnErl4rneJez+4wSKmlxzdWqcl+sjRTd9imzufbQ0xa9S60sF3bkV8PB3uF+mlZWLWk7wgRE3E8IdvbOI38rDBIjnpgTBEwzez2dEUSV7HyNOWcu4Y+WQQIDMsPT60EEmp8IAaUBfKVFAXvM6I1Te6YinQ20n5N2q6tbWY7wstl4KVy9/jea9ealyQzyomsUEHuei3T9guQadMEsHxeR4aCNK+nms7UWeIPi9YO/EE+1SNJ4I1u9uQPrDLOazrkJX8juDEVYrB5Sq25QE44TF+tcsbypopP+1DaM9Nnlx+hzS4e/PX4sl1xrTT7aXaDqtvvwPSJodOYoAG8vUghiJ4LbbKVRVMmOnRTkgfq/sX8PhTfNjz4P+NRx0iw+LxHK9Lcxj/6t0PX7deXZTAKs+nF8DfqN0glKXzAcSCNhqfHaRFFjly4lJbTEaOZAZ4EGM1ARm9F/UDe2GgNbS4eqZ/plLAVvqb3OPVQ00IvAS9aO81+vPSrLc+ZHRqPA5X0sKzEOqzy0P/y6kfsFIm26ysbI9wk08bPIzIJ77p7qBGKi6QhEZR+TmAXg433e31VBvl2x5DyNBM5QPJEP+eQW6d2pomZ+iL112LXrnK+OkEulgqRzP4pPB3wY37eZXJH9PGov7pKz537cQ9/QfonLA0EP82YKH/S+qrduFM54bG9aninlhai9ZI8oDWDxF4I6LVniek6EbeigfG+UaA2+UjtXWq0qe4nwyGLkbWt7W3AkGj00A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39840400004)(376002)(366004)(346002)(396003)(451199015)(54906003)(110136005)(6486002)(66946007)(66556008)(66476007)(478600001)(4326008)(41300700001)(44832011)(8676002)(36756003)(5660300002)(316002)(8936002)(6666004)(38350700002)(38100700002)(26005)(6512007)(2616005)(1076003)(86362001)(6506007)(52116002)(83380400001)(186003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlA5VVdXeUt4ZnVOVTdjcWdBSXJ0bXRUR2t5dE1aWmtoNk03SXBDajlEQlhW?=
 =?utf-8?B?ZjZsUjJFWDdlYzJCVW5YWm9WY3hhNTlweUVYUXBVZG1Yb1lUUDdJNUd2T0J4?=
 =?utf-8?B?eGhzaUpPWHMxNkJKVklJRkl5QkV2ZkhXMUdSY2tpVFRmN0d1SVgwZkg3SmZo?=
 =?utf-8?B?OFhxdU5nSGtBcUhrb0QwRFRlaExvT2g0SnNrR0tVK05Fb2Z4eWFnWmpxaHQx?=
 =?utf-8?B?bEU3KzNSR0dFSXJwUVZxRHNpYUU5L3IxYWpqeXR1MVpYRzJUeU1RMk02aWUv?=
 =?utf-8?B?OE9uMmFsUXcxaHFGRCt1ckdFYmEraW5YWGFmWkJGNS9JWEtTTG1ubHVuQ2k1?=
 =?utf-8?B?N0Z3SEU4M0ZmVWdTejNxY2lCaU1WcjBPUnJwRFZVR29VR25jR1l1RWppZ1Iy?=
 =?utf-8?B?NXVCZUhhODJVbURHblNoVi9MZnRIOEVaMEpUMnZOU1NzSUFmTUdFSTZOd0hR?=
 =?utf-8?B?M2k3djQ5YkZ1WTdhWUI2d3BCU0x1SG81QW9tYmNqQWNiY0M0UW1tZVloWEtQ?=
 =?utf-8?B?b2FDaytaUUVOS3MzdnY1ZWU2V1FsYTNtaFhhZFpUVWEyN0hrOXlTMTFnRE9u?=
 =?utf-8?B?MzVuRVowK3kzRTNwMWtVbEtLWDZIMjZGY2QwUnVnMnA1eVY4MTBqQ2lkWGVB?=
 =?utf-8?B?dnE3REQyQzg3NGUzTms1Wm5YNnhzN2J3VWpGT1RlVVRrTXhNbnVqSnZuYzMr?=
 =?utf-8?B?dXNjM212OXNjcGFLYjVhajBZWUo1VWswYUV6OTZHSDhNdUZjR3V5V0JRdUVJ?=
 =?utf-8?B?U1BnK0xQSHhxRENTOGptczVIKzJ6amJpa3lwdjVnUFFleWJwQytQYkJIUURB?=
 =?utf-8?B?VnRReXNaNEZqTE1WbmgxZ1JVeXgrODBDYWNDVnJyTVU0ZGZjbUJqZjdlNGor?=
 =?utf-8?B?Ty9ZUnIrQ3NvbkVaM3A0VER6K2FLRG8zSGVPZVlmK0RHVldDQlBmODU2aU1B?=
 =?utf-8?B?cDh0SGpreXhodnUrbTFsZ3FqNUhIQkJiUzh2OTNaMDlkb1gxV0NrQUt1aW1x?=
 =?utf-8?B?RzBZcDZPMGo2OExkNGF5TW5wRlZZMzNqQnBzdEpUTlBlaEErbWFaZzZUZXRN?=
 =?utf-8?B?YUxXdTNRcysxY1UxQ1dNNUZCRzBkRzluR1V2RWRTREtSUThVakZkSzVjQ3Jn?=
 =?utf-8?B?dnl6Wk5iQkdDQUtQSUJ3TFhZaUpOMWhLOERiclMxdUkrL0dlY21oSklYa2tH?=
 =?utf-8?B?V1h3dWU2bFN2UGhYSzVqOFh1dEprYjVmTmlTaFEyQjd4ZFFDVlJnN0JKQlFW?=
 =?utf-8?B?ZG5JNlRZdjRYSUw4OGVyWnFyVWtBUVRSM2ZhZDYzdzJTY2NxUU1LK3ZoOVlt?=
 =?utf-8?B?d1ZFSGxyQWdvMjczWWNhS0d0ejkwRmNRY21wZFcvQWxNUmtOUUNleE5DakhB?=
 =?utf-8?B?Um5pbUtJa2JhOWJaK0s5OTZjSGEvb05jb3BKcVRJTXEyNXN4OGdvSnc5V0tE?=
 =?utf-8?B?K3pNZTRqZ3N6V2dtUHNPSXJzdlZYWnBUNS9wbDNONnNwRDBmZFB6U1VMemoz?=
 =?utf-8?B?QnE3dkRkbWZtcTA3a3dDUmlTVHplOG8rUUlxek1aRjR2S281WVlNUndjYUhk?=
 =?utf-8?B?VFI5czhxY2F1anQ3dE9XVGwwd1pzZnMvYWJOeDQwUy9sMXllb1JQc0dhOWxB?=
 =?utf-8?B?Y2hPdGJRNkk1cWNvaXBGNkVPaGZmUkZrdzhqVk1QNHNMZk04a0VUeGVJcHYv?=
 =?utf-8?B?Rk54UDErbWhiZUpBdWJsSGlNWm9zNzBpbWhnbDBNWUg1ZWd3bFd2L1Bna2dr?=
 =?utf-8?B?WnJ5RGpvNDVaNXZMSEdicDJyUVM4ZGhSVHlZMFZKdXkvNTIvY2JsallPZXlU?=
 =?utf-8?B?c1NNSUEyQTMwUXJxK1RpQ01UZ0E3WVR1a3pKOVdRV0NkLzhWczNCYmJNL2Zl?=
 =?utf-8?B?SlhuV2k2NFlEV0RRbTdDbU5zbXZLLzFBNWNwOUJGL2lDRUdySEgrR0Y3SUNI?=
 =?utf-8?B?enpKMHZaUUZQRkQxNm9qeEI3Z0wzOEtMY1VKSVovRHA0N1BMQmRDV3MyUWI0?=
 =?utf-8?B?V0R6WkdpbktLbElQRzB6WTF5b3FsblFUY1hWWUFCKzJyT1NLc2gwRThWWmFT?=
 =?utf-8?B?TVVpRlpRYjA2QVVzK1AwV05weHV4V2NGWm9UcVFCb3dhN1Vtc2R2bW9ybmtE?=
 =?utf-8?B?VlZyOUUvMmNlR2xvMmxWZ25TaHJqQzBnaFU1Z29CWVlvZzJvMCs3MjJVK1h6?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a4bfcf-8969-4bf5-0192-08daaa7497e8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 04:04:56.9870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWXQSE8C6ygRCTS/t21N2Ed29nU/v180Y2F0FH0ohnBCLfrS+fmkar2Xoz/eKLENbYxF41x/L7rQ2fua/IvzDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
X-Proofpoint-ORIG-GUID: MCU1b7lpZW1vQ5G9mUQkmWyRP-LBeCEq
X-Proofpoint-GUID: MCU1b7lpZW1vQ5G9mUQkmWyRP-LBeCEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100022
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=7282db322c=bin.meng@windriver.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At present there are two callers of get_tmp_filename() and they are
inconsistent.

One does:

    /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
    char *tmp_filename = g_malloc0(PATH_MAX + 1);
    ...
    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);

while the other does:

    s->qcow_filename = g_malloc(PATH_MAX);
    ret = get_tmp_filename(s->qcow_filename, PATH_MAX);

As we can see different 'size' arguments are passed. There are also
platform specific implementations inside the function, and the use
of snprintf is really undesirable.

The function name is also misleading. It creates a temporary file,
not just a filename.

Refactor this routine by changing its name and signature to:

    char *create_tmp_file(Error **errp)

and use g_get_tmp_dir() / g_mkstemp() for a consistent implementation.

While we are here, add some comments to mention that /var/tmp is
preferred over /tmp on non-win32 hosts.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v6:
- use g_mkstemp() and stick to use /var/tmp for non-win32 hosts

Changes in v5:
- minor change in the commit message
- add some notes in the function comment block
- add g_autofree for tmp_filename

Changes in v4:
- Rename the function to create_tmp_file() and take "Error **errp" as
  a parameter, so that callers can pass errp all the way down to this
  routine.
- Commit message updated to reflect the latest change

Changes in v3:
- Do not use errno directly, instead still let get_tmp_filename() return
  a negative number to indicate error

Changes in v2:
- Use g_autofree and g_steal_pointer

 include/block/block_int-common.h |  2 +-
 block.c                          | 56 +++++++++++++++++---------------
 block/vvfat.c                    |  7 ++--
 3 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..d7c0a7e96f 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
 }
 
 int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
-int get_tmp_filename(char *filename, int size);
+char *create_tmp_file(Error **errp);
 void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
                                       QDict *options);
 
diff --git a/block.c b/block.c
index 582c205307..8eeaa5623e 100644
--- a/block.c
+++ b/block.c
@@ -860,35 +860,42 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
 
 /*
  * Create a uniquely-named empty temporary file.
- * Return 0 upon success, otherwise a negative errno value.
+ * Return the actual file name used upon success, otherwise NULL.
+ * This string should be freed with g_free() when not needed any longer.
+ *
+ * Note: creating a temporary file for the caller to (re)open is
+ * inherently racy. Use g_file_open_tmp() instead whenever practical.
  */
-int get_tmp_filename(char *filename, int size)
+char *create_tmp_file(Error **errp)
 {
-#ifdef _WIN32
-    char temp_dir[MAX_PATH];
-    /* GetTempFileName requires that its output buffer (4th param)
-       have length MAX_PATH or greater.  */
-    assert(size >= MAX_PATH);
-    return (GetTempPath(MAX_PATH, temp_dir)
-            && GetTempFileName(temp_dir, "qem", 0, filename)
-            ? 0 : -GetLastError());
-#else
     int fd;
     const char *tmpdir;
-    tmpdir = getenv("TMPDIR");
-    if (!tmpdir) {
+    g_autofree char *filename = NULL;
+
+    tmpdir = g_get_tmp_dir();
+#ifndef _WIN32
+    /*
+     * See commit 69bef79 ("block: use /var/tmp instead of /tmp for -snapshot")
+     *
+     * This function is used to create temporary disk images (like -snapshot),
+     * so the files can become very large. /tmp is often a tmpfs where as
+     * /var/tmp is usually on a disk, so more appropriate for disk images.
+     */
+    if (!g_strcmp0(tmpdir, "/tmp")) {
         tmpdir = "/var/tmp";
     }
-    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
-        return -EOVERFLOW;
-    }
-    fd = mkstemp(filename);
+#endif
+
+    filename = g_strdup_printf("%s/vl.XXXXXX", tmpdir);
+    fd = g_mkstemp(filename);
     if (fd < 0) {
-        return -errno;
+        error_setg_errno(errp, -errno, "Could not open temporary file '%s'",
+                         filename);
+        return NULL;
     }
     close(fd);
-    return 0;
-#endif
+
+    return g_steal_pointer(&filename);
 }
 
 /*
@@ -3714,8 +3721,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
                                                    QDict *snapshot_options,
                                                    Error **errp)
 {
-    /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
-    char *tmp_filename = g_malloc0(PATH_MAX + 1);
+    g_autofree char *tmp_filename = NULL;
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
@@ -3734,9 +3740,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     }
 
     /* Create the temporary image */
-    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "Could not get temporary filename");
+    tmp_filename = create_tmp_file(errp);
+    if (!tmp_filename) {
         goto out;
     }
 
@@ -3770,7 +3775,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
 
 out:
     qobject_unref(snapshot_options);
-    g_free(tmp_filename);
     return bs_snapshot;
 }
 
diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683..f9bf8406d3 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3146,10 +3146,9 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
 
     array_init(&(s->commits), sizeof(commit_t));
 
-    s->qcow_filename = g_malloc(PATH_MAX);
-    ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "can't create temporary file");
+    s->qcow_filename = create_tmp_file(errp);
+    if (!s->qcow_filename) {
+        ret = -ENOENT;
         goto err;
     }
 
-- 
2.25.1


