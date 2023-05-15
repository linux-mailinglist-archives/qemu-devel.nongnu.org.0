Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED8A7026E8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:13:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTJe-0001a8-Ix; Mon, 15 May 2023 04:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pyTJP-0001Cy-Ju
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:12:09 -0400
Received: from mr85p00im-hyfv06011401.me.com ([17.58.23.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pyTJM-0002qc-3n
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1684138320; bh=cHWKCHa/u8Jb3woqk96E7imQsC5hDpOtckfnJPPkwBc=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=PrJedPo1yIeN+ITO3pZW20qVnY1fRFN/6yUDUfl9KMh9AgOLgjO47IZY2fLlKLnUs
 F63kVoOaevfLHoJUBLmzKpxSyaON6hkxb4yVfLrnCpBSU6WIbI7l9nb1egFhgk2h85
 Zsb6zMKUmvDNze89ngVCOq7xO1cQRrzQTyjsQJQBuEYhj+m/aOqXFBaLCwZ5/21ToC
 UGdd1znOiZ9k7lO1O7Jp/54sRm8iz2mtY2QA5vUqpOjt/P+wzcxuxGklmrSpyEtqUi
 Ip+Oyq+HSpg8vjnP9NOKCCaMy3hWkacgeB50LVcgZm/6mx+QFhDJzPoiVKzAjms0Aw
 D2WI/MGh74HLA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-hyfv06011401.me.com (Postfix) with ESMTPSA id 8DF64357AC9F;
 Mon, 15 May 2023 08:11:59 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 06/12] simpletrace: Simplify construction of tracing
 methods
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20230509144045.GI1008478@fedora>
Date: Mon, 15 May 2023 10:11:16 +0200
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <08629BBF-426E-4C22-90B8-98E119AB7714@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-7-mads@ynddal.dk> <20230509144045.GI1008478@fedora>
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Proofpoint-GUID: SY0UFy5mlx_W4Tjf-anKDaYomVlF8J_i
X-Proofpoint-ORIG-GUID: SY0UFy5mlx_W4Tjf-anKDaYomVlF8J_i
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-14=5F01:2022-01-14=5F01,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=622 spamscore=0 malwarescore=0 clxscore=1030 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305150072
Received-SPF: pass client-ip=17.58.23.191; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-hyfv06011401.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


>=20
> This is nice but breaking existing analysis scripts should be avoided.
>=20
> I suggest preserving the Analyzer class the way it is and adding a new
> Analyzer2 class that follows the new method signature for trace event
> methods.

You're right. This has too large effects on the API.

I could go along with adding an Analyzer2 class. Should we mark Analyzer =
as
deprecated then? We could make __init__ emit a warning, and say new =
features are
only added to Analyzer2, but not put an exact EOL-date on Analyzer. I =
would
rather not maintain two parallel implementations of the same.

Let me know what you think.=

