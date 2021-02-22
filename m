Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF725321AA2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:58:53 +0100 (CET)
Received: from localhost ([::1]:51952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECfk-0005I0-P3
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lECef-0004UO-Og
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:57:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lECed-0002bG-Ar
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614005861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=gS1ApF1KCge+nI6LIalH9O6mFUxQ33f9ei0/diNcMi0=;
 b=fzyq6jesRK6yKYldMYTU95KTjrk/avO6qpEu9N25GcqRe0KChRgurkWsA+ZkksNAY/5usH
 wGeksYc4PFZaTHtyI1TNRhDaBShtd0fD6+g+UH/KlstD+RCOgtjpGQpHCOy11feTQzxz4C
 CnwGSGXQWVNcUeO6Ir7twMpSqbijoZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-gWnh8reKPw63MSbFL0kyZA-1; Mon, 22 Feb 2021 09:57:37 -0500
X-MC-Unique: gWnh8reKPw63MSbFL0kyZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43DE1E6100;
 Mon, 22 Feb 2021 14:57:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D16C31349A;
 Mon, 22 Feb 2021 14:57:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 60508113860F; Mon, 22 Feb 2021 15:57:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: A brief look at deprecating our JSON extensions over RFC 8259
Date: Mon, 22 Feb 2021 15:57:22 +0100
Message-ID: <875z2knoa5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use JSON in several external interfaces:

* QMP

* The guest agent's QMP

* QAPIfied command line options when the option argument starts with
  '{'

* The block layer's pseudo-protocol "json:" (which can get embedded in
  image headers)

I *think* that's all.

The JSON parser we use for these interfaces supports extensions over RFC
8259.  Quoting json-lexer.c:

    - Extra escape sequence in strings:
      0x27 (apostrophe) is recognized after escape, too

    - Single-quoted strings:
      Like double-quoted strings, except they're delimited by %x27
      (apostrophe) instead of %x22 (quotation mark), and can't contain
      unescaped apostrophe, but can contain unescaped quotation mark.

    - Interpolation, if enabled:
      The lexer accepts %[A-Za-z0-9]*, and leaves rejecting invalid
      ones to the parser.

Ignore interpolation; it's never enabled at external interfaces.

This leaves single-quotes strings and the escape sequence to go with
them.

I disabled them as an experiment.  Some 20 iotests, a qtest and two unit
tests explode.

The unit test testing the JSON parser is of course excused.

The remaining qtest and the unit test could perhaps be dismissed as
atypical use of QEMU from C.  The iotests less so, I think.

I looked at some iotest failures, and quickly found single-quoted
strings used with all external interfaces except for qemu-ga's QMP.

We could certainly tidy up the tests to stick to standard JSON.
However, the prevalence of single-quoted strings in iotests makes me
suspect that they are being used in the field as well.  Deprecating the
extension is likely more trouble than it's worth.

Opinions?


