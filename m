Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5077026E7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:13:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTJb-0001Lr-P7; Mon, 15 May 2023 04:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pyTJP-0001CX-FW
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:12:07 -0400
Received: from mr85p00im-zteg06011501.me.com ([17.58.23.182])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pyTJM-0002qk-Uc
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1684138323; bh=cHWKCHa/u8Jb3woqk96E7imQsC5hDpOtckfnJPPkwBc=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=TltJnGraUDsfIXU8O761skIGRLvetlZgb3yzgkS9RZpoCcE8J9tl2hUuqmw6uWruD
 co4TCgT+3jbfGhDwlsjU7XVYjf/K7jc/7Gb/0cqREu5migxVr7grHXo90ySaLjHsOS
 Oo4k4QgCsKE4RSuY37mbkJ+zMFjBrOy4IIo8yJHk4nchCZV7i7A3MoYHJID50AH2Zw
 QZcArRwwjuO6gH38UmrZTBE5diMmnTTJ6xHNcz0YbLdIsrVztnzkan0EWbYKwG5qNL
 ufE0k+APBCcaHmZf9DshJ56x+ptoO18JOj6lvyzohYJMjbP19eh0vuRL0QEMpvZtEi
 F43PCZ/ts+CYQ==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-zteg06011501.me.com (Postfix) with ESMTPSA id 034D9480184;
 Mon, 15 May 2023 08:12:01 +0000 (UTC)
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
X-Proofpoint-ORIG-GUID: vlxvKA-jcgHKTLok66chKAp3SQ9h-MPE
X-Proofpoint-GUID: vlxvKA-jcgHKTLok66chKAp3SQ9h-MPE
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=622
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305150072
Received-SPF: pass client-ip=17.58.23.182; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-zteg06011501.me.com
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

