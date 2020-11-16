Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADFD2B4056
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 10:56:55 +0100 (CET)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kebFm-0006em-H9
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 04:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kebEj-0006D8-IG
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 04:55:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kebEi-0007p2-1Q
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 04:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605520547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nepUHhRsNZ0R9OSsrS3ILZyyPUykrS1mWR3OvMx2pT8=;
 b=F1xseGGbZwV3A/gF6fUbfprOqvi/J5rY79RdAZgSb8Lz6FUyvvPz99PLw1lpRdNrLrb7D5
 +o1foxXsOUz7yfuvaJrSp9FFIe/RPdI+NpY/UmlhqI2HOhwPh9dQIRaPArnIA2OmMpTbVa
 3TAKU8yMEAij/3AKZD+Ap9WjLyhu+o0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-OOhNgmVqNjWJ8CIQrtn-BA-1; Mon, 16 Nov 2020 04:55:44 -0500
X-MC-Unique: OOhNgmVqNjWJ8CIQrtn-BA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D74F1800683
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 09:55:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A33D010013D7;
 Mon, 16 Nov 2020 09:55:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 24FC911358BA; Mon, 16 Nov 2020 10:55:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 08/11] qapi/introspect.py: replace 'extra' dict with
 'comment' argument
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-9-jsnow@redhat.com>
Date: Mon, 16 Nov 2020 10:55:42 +0100
In-Reply-To: <20201026194251.11075-9-jsnow@redhat.com> (John Snow's message of
 "Mon, 26 Oct 2020 15:42:48 -0400")
Message-ID: <875z651v8h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> This is only used to pass in a dictionary with a comment already set, so
> skip the runaround and just accept the comment.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index ef469b6c06e..a0978cb3adb 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -76,12 +76,11 @@
>  
>  
>  def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
> -               extra: Optional[Annotations] = None
> -               ) -> Annotated:
> -    if extra is None:
> -        extra = {}
> -    if ifcond:
> -        extra['if'] = ifcond
> +               comment: Optional[str] = None) -> Annotated:
> +    extra: Annotations = {
> +        'if': ifcond,
> +        'comment': comment,
> +    }

Works because _tree_to_qlit() treats 'if': None, 'comment': None exactly
like absent 'if', 'comment'.  Mentioning this in the commit message
wouldn't hurt.

We create even more dicts now.  Okay.

>      return (obj, extra)
>  
>  
> @@ -228,18 +227,18 @@ def _gen_features(cls,
>      def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>                    ifcond: List[str],
>                    features: Optional[List[QAPISchemaFeature]]) -> None:
> -        extra: Optional[Annotations] = None
> +        comment: Optional[str] = None
>          if mtype not in ('command', 'event', 'builtin', 'array'):
>              if not self._unmask:
>                  # Output a comment to make it easy to map masked names
>                  # back to the source when reading the generated output.
> -                extra = {'comment': '"%s" = %s' % (self._name(name), name)}
> +                comment = f'"{self._name(name)}" = {name}'

Drive-by modernization, fine with me.  Aside: many more opportunities; a
systematic hunt is called for.  Not now.

>              name = self._name(name)
>          obj['name'] = name
>          obj['meta-type'] = mtype
>          if features:
>              obj['features'] = self._gen_features(features)
> -        self._trees.append(_make_tree(obj, ifcond, extra))
> +        self._trees.append(_make_tree(obj, ifcond, comment))
>  
>      def _gen_member(self,
>                      member: QAPISchemaObjectTypeMember) -> Annotated:


