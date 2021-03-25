Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2CF349549
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:22:41 +0100 (CET)
Received: from localhost ([::1]:39614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRom-0004Nw-Jk
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPRiC-0007CM-SY
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPRhy-0003j8-CV
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616685337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UtrETjYP7fbwS4Qhd9OmDsEJC9j/lwNXArYtChkcPIc=;
 b=BF2g6uje2zFhm2oqHxwv++qkjLkPvD5LgoWpYO+qU0Wl6sPNjKOahDTzDbvRsbNj/ppVM2
 eskW9yVwUgyQC8Rr6yzNDfcpJUzntOpcR9Q2e+av1sKnsk2y7cMgittrzqC2JTJ6dxa10i
 Jsw1c/OUGR9DVyFTNZaWJ8fYmJrieVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-Yjd60pvSMxWizFX1ZgmL3Q-1; Thu, 25 Mar 2021 11:15:34 -0400
X-MC-Unique: Yjd60pvSMxWizFX1ZgmL3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE45187A83E;
 Thu, 25 Mar 2021 15:15:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A41A5C241;
 Thu, 25 Mar 2021 15:15:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0E12911327E1; Thu, 25 Mar 2021 16:15:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 13/19] qapi/expr.py: Consolidate check_if_str calls
 in check_if
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-14-jsnow@redhat.com>
Date: Thu, 25 Mar 2021 16:15:32 +0100
In-Reply-To: <20210325060356.4040114-14-jsnow@redhat.com> (John Snow's message
 of "Thu, 25 Mar 2021 02:03:50 -0400")
Message-ID: <87eeg3s1rf.fsf@dusky.pond.sub.org>
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> This is a small rewrite to address some minor style nits.
>
> Don't compare against the empty list to check for the empty condition, and
> move the normalization forward to unify the check on the now-normalized
> structure.
>
> With the check unified, the local nested function isn't needed anymore
> and can be brought down into the normal flow of the function. With the
> nesting level changed, shuffle the error strings around a bit to get
> them to fit in 79 columns.
>
> Note: although ifcond is typed as Sequence[str] elsewhere, we *know* that
> the parser will produce real, bona-fide lists. It's okay to check
> isinstance(ifcond, list) here.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index ea9d39fcf2..5921fa34ab 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -144,30 +144,26 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
>  
>  def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
>  
> -    def check_if_str(ifcond: object) -> None:
> -        if not isinstance(ifcond, str):
> -            raise QAPISemError(
> -                info,
> -                "'if' condition of %s must be a string or a list of strings"
> -                % source)
> -        if ifcond.strip() == '':
> -            raise QAPISemError(
> -                info,
> -                "'if' condition '%s' of %s makes no sense"
> -                % (ifcond, source))
> -
>      ifcond = expr.get('if')
>      if ifcond is None:
>          return
> +
>      if isinstance(ifcond, list):
> -        if ifcond == []:
> +        if not ifcond:
>              raise QAPISemError(
> -                info, "'if' condition [] of %s is useless" % source)
> -        for elt in ifcond:
> -            check_if_str(elt)
> +                info, f"'if' condition [] of {source} is useless")

Unrelated change from interpolation to formatted string literal.

>      else:
> -        check_if_str(ifcond)
> -        expr['if'] = [ifcond]
> +        # Normalize to a list
> +        ifcond = expr['if'] = [ifcond]
> +
> +    for elt in ifcond:
> +        if not isinstance(elt, str):
> +            raise QAPISemError(info, (
> +                f"'if' condition of {source}"
> +                " must be a string or a list of strings"))
> +        if not elt.strip():
> +            raise QAPISemError(
> +                info, f"'if' condition '{elt}' of {source} makes no sense")

Likewise.

I like formatted string literals, they're often easier to read than
interpolation.  But let's try to keep patches focused on their stated
purpose.

I'd gladly consider a series that convers to formatted strings
wholesale.  But I guess we better finish the typing job, first.

>  
>  
>  def normalize_members(members: object) -> None:


