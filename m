Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D751821F644
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 17:38:46 +0200 (CEST)
Received: from localhost ([::1]:46932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvN13-0001La-W0
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 11:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1jvN0C-0000eT-6A
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 11:37:52 -0400
Received: from pv50p00im-ztdg10022001.me.com ([17.58.6.58]:57733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1jvN0A-0004Gn-Mg
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 11:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1594741062;
 bh=1QIZKv2B2Wtoi6nJZAnvSwh+xld20WJrSceSLD/W9OQ=;
 h=Content-Type:From:Date:Subject:Message-Id:To;
 b=qVZnCfLetaqHUnQxcHY2MjSOnsBwcnFn9nfLGgWVeZupXO15FTy50U7Eao3x90oaG
 xLTrQsSXcTlSWlZ6/1B1OOuHC9Fs2EHKIbEQuyxFRN69qDGUBxmwMuxYl/QhxQcU7A
 vVeXrCb21w08z5HHUeVsIFmSubRQ1MokwqfPqt4jlg4dD3sYMKKitcGl++aelzlTlp
 i4n7EQzvyR04sUCN/A1us9PiKYvJxHmT0Qjg2Sac1QCgj7edMKeJwnFXfYeS5TAtAH
 3AZFQmJBLki8/n1hxHgmKKPZ9dU1ovZ5afmfrSZNFJ1acHTj8XRKrR5HUfgxy4k6Ol
 0agXRpVyz/twg==
Received: from [192.168.50.83] (unknown [223.166.236.161])
 by pv50p00im-ztdg10022001.me.com (Postfix) with ESMTPSA id C0C8FA04F1
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 15:37:41 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 14 Jul 2020 23:37:38 +0800
Subject: How does the TB chaining works?
Message-Id: <677CC4AB-A8CA-4A8D-9295-CAFFE518C171@icloud.com>
To: QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: iPhone Mail (17E262)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-14_05:2020-07-14,
 2020-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=413 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2004280000 definitions=main-2007140115
Received-SPF: pass client-ip=17.58.6.58;
 envelope-from=shen.mengjiao3@icloud.com; helo=pv50p00im-ztdg10022001.me.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 11:37:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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


I just see the current TB=E2=80=99s code pointer given to prologue which wor=
ks as function call. But how to jump to the next TB to execution instead exi=
t the execution and entry the prologue again?


