Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4D43FF28
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 17:12:29 +0200 (CEST)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgTYR-0001Bc-TK
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 11:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgTXS-0000OL-6O
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:11:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgTXM-0007Ga-3N
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635520277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hmq06UqreoPfeEUDjkLAgJ+x7uGpHz9a0rIS7TFByCk=;
 b=ECmfdV/sOfBWvsDW7H1xeKtgMHm5A7wz4Nw+HGqPSw5TNEqDSI3SiFuHmEp5h6qU4DXfOs
 JsVUgWuo81y+cuiOiTN9VXGD2pHQeT9o6RQSKVrumEF0ZCRebo39KOkvTK84hw4mM2m9vz
 0/AwglMO24VUHbA/SShRlnaQ78IaNt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-1M9vuZCwPGidB1-u3Vljpw-1; Fri, 29 Oct 2021 11:11:14 -0400
X-MC-Unique: 1M9vuZCwPGidB1-u3Vljpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D37431006AA4;
 Fri, 29 Oct 2021 15:11:12 +0000 (UTC)
Received: from redhat.com (ovpn-112-232.phx2.redhat.com [10.3.112.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D46826E73;
 Fri, 29 Oct 2021 15:10:10 +0000 (UTC)
Date: Fri, 29 Oct 2021 10:10:09 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 9/9] qapi: Extend -compat to set policy for unstable
 interfaces
Message-ID: <20211029151009.mv4zqqde6zisywza@redhat.com>
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-10-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028102520.747396-10-armbru@redhat.com>
User-Agent: NeoMutt/20211022
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, philmd@redhat.com, kchamart@redhat.com,
 qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 12:25:20PM +0200, Markus Armbruster wrote:
> New option parameters unstable-input and unstable-output set policy
> for unstable interfaces just like deprecated-input and
> deprecated-output set policy for deprecated interfaces (see commit
> 6dd75472d5 "qemu-options: New -compat to set policy for deprecated
> interfaces").  This is intended for testing users of the management
> interfaces.  It is experimental.
> 
> For now, this covers only syntactic aspects of QMP, i.e. stuff tagged
> with feature 'unstable'.  We may want to extend it to cover semantic
> aspects, or the command line.
> 
> Note that there is no good way for management application to detect
> presence of these new option parameters: they are not visible output
> of query-qmp-schema or query-command-line-options.  Tolerable, because
> it's meant for testing.  If running with -compat fails, skip the test.

Not to mention, once we finish QAPIfying the command line, we could
make sure it is visible through introspection at that time (it may
require tagging the command line option with a feature, if nothing
else makes it pop through).

> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Acked-by: John Snow <jsnow@redhat.com>
> ---
>  qapi/compat.json              |  6 +++++-
>  include/qapi/util.h           |  1 +
>  qapi/qmp-dispatch.c           |  6 ++++++
>  qapi/qobject-output-visitor.c |  8 ++++++--
>  qemu-options.hx               | 20 +++++++++++++++++++-
>  scripts/qapi/events.py        | 10 ++++++----
>  scripts/qapi/schema.py        | 10 ++++++----
>  7 files changed, 49 insertions(+), 12 deletions(-)
> 
> diff --git a/qapi/compat.json b/qapi/compat.json
> index 74a8493d3d..9bc9804abb 100644
> --- a/qapi/compat.json
> +++ b/qapi/compat.json
> @@ -47,9 +47,13 @@
>  #
>  # @deprecated-input: how to handle deprecated input (default 'accept')
>  # @deprecated-output: how to handle deprecated output (default 'accept')
> +# @unstable-input: how to handle unstable input (default 'accept')
> +# @unstable-output: how to handle unstable output (default 'accept')

Missing '(since 6.2)' doc tags on the two new policies.

>  #
>  # Since: 6.0
>  ##
>  { 'struct': 'CompatPolicy',
>    'data': { '*deprecated-input': 'CompatPolicyInput',
> -            '*deprecated-output': 'CompatPolicyOutput' } }
> +            '*deprecated-output': 'CompatPolicyOutput',
> +            '*unstable-input': 'CompatPolicyInput',
> +            '*unstable-output': 'CompatPolicyOutput' } }
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 0cc98db9f9..81a2b13a33 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -13,6 +13,7 @@
>  
>  typedef enum {
>      QAPI_DEPRECATED,
> +    QAPI_UNSTABLE,
>  } QapiSpecialFeature;

> +++ b/qemu-options.hx
> @@ -3641,7 +3641,9 @@ DEFHEADING(Debug/Expert options:)
>  
>  DEF("compat", HAS_ARG, QEMU_OPTION_compat,
>      "-compat [deprecated-input=accept|reject|crash][,deprecated-output=accept|hide]\n"
> -    "                Policy for handling deprecated management interfaces\n",
> +    "                Policy for handling deprecated management interfaces\n"
> +    "-compat [unstable-input=accept|reject|crash][,unstable-output=accept|hide]\n"
> +    "                Policy for handling unstable management interfaces\n",

It may not be machine-introspectible, but at least we can grep --help
output to see when the policy is usable for testing.

>      QEMU_ARCH_ALL)
>  SRST
>  ``-compat [deprecated-input=@var{input-policy}][,deprecated-output=@var{output-policy}]``
> @@ -3659,6 +3661,22 @@ SRST
>          Suppress deprecated command results and events
>  
>      Limitation: covers only syntactic aspects of QMP.
> +
> +``-compat [unstable-input=@var{input-policy}][,unstable-output=@var{output-policy}]``
> +    Set policy for handling unstable management interfaces (experimental):

Once we QAPIfy the command line, this says we would add the 'unstable'
feature flag to '-compat unstable-input'.  How meta ;) And goes along
with your comments earlier in the series about how we may use the
'unstable' feature even without the 'x-' naming prefix, once it is
machine-detectible.

With the doc tweak,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


