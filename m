Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960ED31D906
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:04:17 +0100 (CET)
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLZ2-00057q-Ng
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCLWw-00041T-7y
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:02:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCLWu-0003od-IZ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613563323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h74Qsffjjo4Q7K/sXz+AwUjzcnRafSUwpbCOHP13McM=;
 b=ZRReqXLP+L020DsWQaYqgrQkEDHEn0cTemEMLjKkgKHqFW1GGf4aa0AC5o8IqMawJiQnrt
 uZNNavETLiUU3H2HhZSV85+MxN2ANWMM1muM2JLzTpyD2yoKMo+mJZSHGkCQ2xEc+VfJ+o
 8h+iDIYOH8V1uYVMGmbYdm4RCAeFPQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-nG83FTPzMFWPZhA3IPFI1w-1; Wed, 17 Feb 2021 07:02:02 -0500
X-MC-Unique: nG83FTPzMFWPZhA3IPFI1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEC3A874983;
 Wed, 17 Feb 2021 12:02:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEC1060D06;
 Wed, 17 Feb 2021 12:02:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 51226113860F; Wed, 17 Feb 2021 13:01:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 05/19] qapi/introspect.py: guard against
 ifcond/comment misuse
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-6-jsnow@redhat.com>
Date: Wed, 17 Feb 2021 13:01:59 +0100
In-Reply-To: <20210216021809.134886-6-jsnow@redhat.com> (John Snow's message
 of "Mon, 15 Feb 2021 21:17:55 -0500")
Message-ID: <874kia7vig.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> _tree_to_qlit is called recursively on dict values (isolated from their
> keys); at such a point in generating output it is too late to apply an
> ifcond. Similarly, comments do not necessarily have a "tidy" place they
> can be printed in such a circumstance.
>
> Forbid this usage by renaming "suppress_first_indent" to "dict_value" to
> emphasize that indents are suppressed only for the benefit of dict
> values; then add an assertion assuring we do not pass ifcond/comments
> in this case.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 4749f65ea3c..a7ccda5ab92 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -34,7 +34,7 @@ def _make_tree(obj, ifcond, extra=None):
>      return obj
>  
>  
> -def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
> +def _tree_to_qlit(obj, level=0, dict_value=False):
>  
>      def indent(level):
>          return level * 4 * ' '
> @@ -43,6 +43,12 @@ def indent(level):
>          ifobj, extra = obj
>          ifcond = extra.get('if')
>          comment = extra.get('comment')
> +
> +        # NB: _tree_to_qlit is called recursively on the values of a key:value
> +        # pair; those values can't be decorated with comments or conditionals.
> +        msg = "dict values cannot have attached comments or if-conditionals."

I'm wrapping this comment to conform to PEP 8.

> +        assert not dict_value, msg
> +
>          ret = ''
>          if comment:
>              ret += indent(level) + '/* %s */\n' % comment
> @@ -54,7 +60,7 @@ def indent(level):
>          return ret
>  
>      ret = ''
> -    if not suppress_first_indent:
> +    if not dict_value:
>          ret += indent(level)
>      if obj is None:
>          ret += 'QLIT_QNULL'


