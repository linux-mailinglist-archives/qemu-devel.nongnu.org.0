Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECED31C7D5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 10:12:25 +0100 (CET)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBwP9-0003DO-Go
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 04:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBwNN-0002fx-LR
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:10:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBwNL-00052I-H9
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613466630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I5kPceagEJ/4507Z04nP8K9j2x59ij3BFV0SrTn/nw0=;
 b=Uv3fFkMtOG1va4q0cAC3noG23FA+LNsY1Ne6XOF39d4PgT7SMDoJGJs26Zukgr2xuq3DfV
 1wNuJtcwCMNKTRZfgeDgoYzLFHIxwodeaOE2GZ54n8ESqhF1EcXgmqT9pyJD5AL7LEUyyM
 WYJ2fVbCYxr11qBF78t3lcqIezFUKew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-KpEhISKBOvCdCXdqdLDl9g-1; Tue, 16 Feb 2021 04:10:27 -0500
X-MC-Unique: KpEhISKBOvCdCXdqdLDl9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED8C9C73A0;
 Tue, 16 Feb 2021 09:10:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6CBA5C6AB;
 Tue, 16 Feb 2021 09:10:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 34E43113865F; Tue, 16 Feb 2021 10:10:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 17/19] qapi/introspect.py: Type _gen_tree variants as
 Sequence[str]
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-18-jsnow@redhat.com>
Date: Tue, 16 Feb 2021 10:10:25 +0100
In-Reply-To: <20210216021809.134886-18-jsnow@redhat.com> (John Snow's message
 of "Mon, 15 Feb 2021 21:18:07 -0500")
Message-ID: <87v9asnzsu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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

> Optional[List] is clunky; an empty sequence can more elegantly convey
> "no variants". By downgrading "List" to "Sequence", we can also accept
> tuples; this is useful for the empty tuple specifically, which we may
> use as a default parameter because it is immutable.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 649225988d1..e4d31a59503 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -247,13 +247,13 @@ def _use_type(self, typ: QAPISchemaType) -> str:
>          return self._name(typ.name)
>  
>      @staticmethod
> -    def _gen_features(features: List[QAPISchemaFeature]
> +    def _gen_features(features: Sequence[QAPISchemaFeature]
>                        ) -> List[Annotated[str]]:
>          return [Annotated(f.name, f.ifcond) for f in features]
>  
>      def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
>                    ifcond: Sequence[str],
> -                  features: Optional[List[QAPISchemaFeature]]) -> None:
> +                  features: Sequence[QAPISchemaFeature] = ()) -> None:
>          """
>          Build and append a SchemaInfo object to self._trees.
>  
> @@ -261,7 +261,8 @@ def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
>          :param mtype: The entity's meta-type.
>          :param obj: Additional entity fields, as appropriate for the meta-type.
>          :param ifcond: Sequence of conditionals that apply to this entity.
> -        :param features: Optional features field for SchemaInfo.
> +        :param features: Optional, The features field for SchemaInfo.

Downcase "The".

> +                         Will be omitted from the output if empty.
>          """
>          comment: Optional[str] = None
>          if mtype not in ('command', 'event', 'builtin', 'array'):
> @@ -298,7 +299,7 @@ def _gen_variant(self, variant: QAPISchemaVariant
>  
>      def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>                             json_type: str) -> None:
> -        self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
> +        self._gen_tree(name, 'builtin', {'json-type': json_type}, [])
>  
>      def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
>                          ifcond: Sequence[str],
> @@ -316,7 +317,7 @@ def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
>                           element_type: QAPISchemaType) -> None:
>          element = self._use_type(element_type)
>          self._gen_tree('[' + element + ']', 'array', {'element-type': element},
> -                       ifcond, None)
> +                       ifcond)
>  
>      def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>                                 ifcond: Sequence[str],

Marginal by itself.  Might be worth it as part of a more general move
away from Optional[List[...]].  See also next patch.


