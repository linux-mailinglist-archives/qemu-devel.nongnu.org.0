Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61CC36A022
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 10:35:29 +0200 (CEST)
Received: from localhost ([::1]:39670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laDlA-0000mb-7d
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 04:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laDja-0000Lz-Dv
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 04:33:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laDjX-0002wb-Hs
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 04:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619253226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wsi/7To8LSsfdzRgQZ5NREzJYU3T/K33McxB9k9EhEo=;
 b=XB4WjdLAXiOgHO5R6MeWSoKMGtRZS7Sd0/T+y124Y0haqLa2CumdRM5TDPiuJIWGLXFv+l
 y5LeLisrPk6CkxC/nWOasLCToIcikpoEYEfRuMSmJWXoAfD5q458AAA1ysG5G/3WRs2VD4
 Wlt/QsRTZeawrodTmPAZjbdfWI6usx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-dI-ePkOrPQaYG8aR2L8lqg-1; Sat, 24 Apr 2021 04:33:41 -0400
X-MC-Unique: dI-ePkOrPQaYG8aR2L8lqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05B07343A3;
 Sat, 24 Apr 2021 08:33:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0E1F5C6AB;
 Sat, 24 Apr 2021 08:33:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 437D1113525D; Sat, 24 Apr 2021 10:33:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 05/22] qapi/parser: Assert lexer value is a string
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-6-jsnow@redhat.com>
Date: Sat, 24 Apr 2021 10:33:38 +0200
In-Reply-To: <20210422030720.3685766-6-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Apr 2021 23:07:03 -0400")
Message-ID: <87k0os9j4t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> The type checker can't narrow the type of the token value to string,
> because it's only loosely correlated with the return token.
>
> We know that a token of '#' should always have a "str" value.
> Add an assertion.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index f519518075e..c75434e75a5 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -303,6 +303,7 @@ def get_doc(self, info):
>          cur_doc = QAPIDoc(self, info)
>          self.accept(False)
>          while self.tok == '#':
> +            assert isinstance(self.val, str), "Expected str value"
>              if self.val.startswith('##'):
>                  # End of doc comment
>                  if self.val != '##':

The second operand of assert provides no additional information.  Please
drop it.


