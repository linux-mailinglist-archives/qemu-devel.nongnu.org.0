Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3A68E5F0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 03:14:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPZxR-0002iN-6d; Tue, 07 Feb 2023 21:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxP-0002hn-Hh
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxN-00040D-Au
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675822388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+v/eLNGra13m0Qhi7WdQ7uC/OmCYsmMNBhIkYCcdyos=;
 b=hdTw5oYAXA+hPF2N0UDBlX6HUad6HtrFSOP7gIpMKCUNds51jwqK97XQ5qLNHEEK+Bx1OG
 1Rg2LLiaJ6d83X32mjNsSqmY5D3njNY/hCV8hRAHNlBPtJCbpNsDWHSoO6AsTFMwoD1aH7
 ezY1HYvaBHKPRwvOBVn1Ccbv3lRvzrA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-zMUXrwStOfK59NzXyhd2kg-1; Tue, 07 Feb 2023 21:13:06 -0500
X-MC-Unique: zMUXrwStOfK59NzXyhd2kg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78D7985A588;
 Wed,  8 Feb 2023 02:13:06 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46C0A1121314;
 Wed,  8 Feb 2023 02:13:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 0/7] qapi: static typing conversion, pt5c
Date: Tue,  7 Feb 2023 21:12:59 -0500
Message-Id: <20230208021306.870657-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This is part five (c), and focuses on sharing strict types between=0D
parser.py and expr.py.=0D
=0D
gitlab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5c=0D
=0D
Every commit should pass with:=0D
 - `isort -c qapi/`=0D
 - `flake8 qapi/`=0D
 - `pylint --rcfile=3Dqapi/pylintrc qapi/`=0D
 - `mypy --config-file=3Dqapi/mypy.ini qapi/`=0D
=0D
Some notes on this series:=0D
=0D
Patches 2 and 3 are almost entirely superseded by patch 5, but I wasn't=0D
as confident that Markus would like patch 5, so these patches aren't=0D
squashed quite as tightly as they could be -- I recommend peeking ahead=0D
at the cover letters before reviewing the actual patch diffs.=0D
=0D
By the end of this series, the only JSON-y types we have left are:=0D
=0D
(A) QAPIExpression,=0D
(B) JSONValue,=0D
(C) _ExprValue.=0D
=0D
The argument I'm making here is that QAPIExpression and JSONValue are=0D
distinct enough to warrant having both types (for now, at least); and=0D
that _ExprValue is specialized enough to also warrant its inclusion.=0D
=0D
(Brutal honesty: my attempts at unifying this even further had even more=0D
hacks and unsatisfying conclusions, and fully unifying these types=0D
should probably wait until we're allowed to rely on some fairly modern=0D
Python versions.)=0D
=0D
John Snow (7):=0D
  qapi/expr: Split check_expr out from check_exprs=0D
  qapi/parser.py: add ParsedExpression type=0D
  qapi/expr: Use TopLevelExpr where appropriate=0D
  qapi/expr: add typing workaround for AbstractSet=0D
  qapi/parser: [RFC] add QAPIExpression=0D
  qapi: remove _JSONObject=0D
  qapi: remove JSON value FIXME=0D
=0D
 scripts/qapi/expr.py   | 282 +++++++++++++++++++----------------------=0D
 scripts/qapi/parser.py |  51 +++++---=0D
 scripts/qapi/schema.py | 105 +++++++--------=0D
 3 files changed, 218 insertions(+), 220 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D


