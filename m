Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB76FB587
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 18:51:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw45A-0007yP-2R; Mon, 08 May 2023 12:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pw450-0007sz-4E
 for qemu-devel@nongnu.org; Mon, 08 May 2023 12:51:19 -0400
Received: from pv50p00im-ztdg10011301.me.com ([17.58.6.40])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pw44x-0003G4-Re
 for qemu-devel@nongnu.org; Mon, 08 May 2023 12:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683564674; bh=ufk/QovqhcAvmbxTzz/rXzW3vYrIR/2qedzH9Rsu+Hg=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=JbLe+xTA9IrQjaGWWW13P8hNypwBSw/ZUzvBIigLRVc6LcKM8wrx1vLKgGwhk0W1V
 qGRz3DtATBGmHURX42qkI5S0z1UwbybhLL2Fxqp73ZiNTcwGAdyZNrTLhivzvDi+PR
 5Csmy+Z9htEXaIPX7W84OC9tI3xvpsWqCXme7BxkqLcA9p0L9rduEnB1TWKWYfGCPD
 p0sUUVgSd2kAM8RWjZ5KsIEluDglVM7wKCy/SSLHmAxNIimlUSnNUxt2qkTv3l9eKW
 1DfE+hn4LbUThAq3xZi8ksHIsdSykb8/9syLG4RtI143jIHFecBKlTTEXzSM4ikGQ+
 ySaKBgiSdeLrA==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id 54885180515;
 Mon,  8 May 2023 16:51:12 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 00/12] simpletrace: refactor and general improvements
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20230508150740.GC581920@fedora>
Date: Mon, 8 May 2023 18:50:58 +0200
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Content-Transfer-Encoding: 7bit
Message-Id: <49EAD96A-8AE2-4F2A-9931-DC026A3F974F@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230504174816.GA581920@fedora>
 <CAFn=p-ZhsUgMrK+w+ibP68q-v093SDEfhqxHsfTtFfS3qxD9ow@mail.gmail.com>
 <20230508150740.GC581920@fedora>
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Proofpoint-GUID: GqfdUgLEGP9aE4_CGu0CAjfVzy1eh-rr
X-Proofpoint-ORIG-GUID: GqfdUgLEGP9aE4_CGu0CAjfVzy1eh-rr
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1030
 mlxlogscore=628 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305080113
Received-SPF: pass client-ip=17.58.6.40; envelope-from=mads@ynddal.dk;
 helo=pv50p00im-ztdg10011301.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


> 
> I was curious how Mads is using simpletrace for an internal (to
> Samsung?) project.
> 

I was just tracing the NVMe emulation to get some metrics. The code is all
upstream or a part of this patchset. The rest is tracing configs.

