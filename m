Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED9538763F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:14:49 +0200 (CEST)
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwkS-0002lu-7P
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1liwYI-0000KP-4C
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1liwYB-00041z-HS
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1vzvKlMRalAcy8sD32DxCJSFGqYYyzJYKaNF44SwJHM=;
 b=MildcdhKlTF1SHykHwGeAB48Kun0t8WkNHhtDbmsOTX/QT8ddta32CyYvnlju5lpGCGRAi
 m07XrNHwK5O4/L63R0PIw5EU7GJpvPvR8Y/GFrCAJ5vATpIH/UnEtcLvRQuXLUozumV0zp
 fyLtLvezV4p6EOAsJdKadv6p8v37ywI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-lpDUd9MrOFG3UoiQEqt8Og-1; Tue, 18 May 2021 06:02:05 -0400
X-MC-Unique: lpDUd9MrOFG3UoiQEqt8Og-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90AFA1936B60;
 Tue, 18 May 2021 10:02:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6359A687D4;
 Tue, 18 May 2021 10:02:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E29D1113861E; Tue, 18 May 2021 12:02:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 05/21] qapi/parser: Assert lexer value is a string
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-6-jsnow@redhat.com>
Date: Tue, 18 May 2021 12:02:02 +0200
In-Reply-To: <20210511220601.2110055-6-jsnow@redhat.com> (John Snow's message
 of "Tue, 11 May 2021 18:05:45 -0400")
Message-ID: <87lf8c5pid.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
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
> index d620706fffb..ba17f1357ad 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -304,6 +304,7 @@ def get_doc(self, info):
>          cur_doc = QAPIDoc(self, info)
>          self.accept(False)
>          while self.tok == '#':
> +            assert isinstance(self.val, str)  # comment token MUST have str val

What does the comment add to the assertion?  Isn't it all obvious?  Just
wondering; if you genuinely think it isn't, I'm not going to argue.
Except about the long line, which you could easily avoid:

               assert isinstance(self.val, str)  # comment value MUST be str

>              if self.val.startswith('##'):
>                  # End of doc comment
>                  if self.val != '##':


