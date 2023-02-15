Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303E698418
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:06:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSN61-0005fs-8U; Wed, 15 Feb 2023 14:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSN5u-0005WA-HH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:05:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSN5s-000184-HE
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676487927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cn766JyuQj3g5+QoX4NwpS2hJ1Swhx5BE+fPfi7bDZ4=;
 b=E2iyeKmiNcPUWrrTqSGQO53uGRpsV8eclkQI2RbwuaSs7MJbpPNajQeDUc7CeYSuuNPYtd
 yqb2vqLMlzP9aoyQjl9HfzkLsj9Qb1KgXydSJtMGCdtsars9dEKIxK2MokTPHc4uxWifJW
 9zBLDGfp8vZWY8xs/x/ms3V76g692fc=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-300-7xwPcRjJNfKGQB-9cGj4Sw-1; Wed, 15 Feb 2023 14:05:25 -0500
X-MC-Unique: 7xwPcRjJNfKGQB-9cGj4Sw-1
Received: by mail-pf1-f197.google.com with SMTP id
 z2-20020a626502000000b0059085684b50so10177808pfb.16
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676487924;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cn766JyuQj3g5+QoX4NwpS2hJ1Swhx5BE+fPfi7bDZ4=;
 b=rnlGJMUAB2ah8xQS932WMSPFvDnJFHND+UEJct9DUYpGWfQ4l0xpbWKfnB7caHFjG5
 O+JqLkSHPphQGGo4JzMET8od1Y8j0PK0hez9O/HwfiAI9Qm+Y1G8EI/HRhb/bk4ES/CD
 lOUAyml+hSCQJXKqXCQ1uwmKOvkexdVSqNeWEiV7JSZkNEAqL5MKVjAgK/nfzvXJ+lKB
 V3K/4A2Bcinna3l/EA5snJlyJK2Svvgqz13VHU/VBEO/6kgnBBKCwW/Iw3vbvG8asKhN
 N5D79fxI+nM8WvH5Vov4pced6ZSbae6jZbEb2lvztYBYgANBaHdheQbSg29h48rD99OC
 9kjg==
X-Gm-Message-State: AO0yUKUWEjaVpmzOvU2lANH/N3gMek/s5vExjVtybgxPVJ1yclyEYivq
 SYfoEB1Wi4iB4PhLkCDkm49YigA5Q/DI9lnLnCqETE1OupuMopMmXrqh1hiSUuLDCepxs42F70U
 g9pAKwpila7i1oS52LzGpreI8bR+YrGQ=
X-Received: by 2002:aa7:9d1d:0:b0:5a8:beb3:d561 with SMTP id
 k29-20020aa79d1d000000b005a8beb3d561mr511806pfp.17.1676487923937; 
 Wed, 15 Feb 2023 11:05:23 -0800 (PST)
X-Google-Smtp-Source: AK7set/rWEg4nmAf6+PKf92Hz/Q7lkj2ZoYf3ZdOm/2EW8gWsdbgxApYRF73ei44FZd8vlQrNUHYmYNgwC2E/uDAf+M=
X-Received: by 2002:aa7:9d1d:0:b0:5a8:beb3:d561 with SMTP id
 k29-20020aa79d1d000000b005a8beb3d561mr511798pfp.17.1676487923600; Wed, 15 Feb
 2023 11:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20230215000011.1725012-1-jsnow@redhat.com>
 <20230215000011.1725012-5-jsnow@redhat.com>
 <87v8k3clhq.fsf@pond.sub.org>
In-Reply-To: <87v8k3clhq.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Feb 2023 14:05:12 -0500
Message-ID: <CAFn=p-bPZYbC7Engmoyjw-w5Z1jC4Fydd5Q0WmvU11PqVFx5cQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] qapi/parser: add QAPIExpression type
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Wed, Feb 15, 2023 at 4:43 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > This patch creates a new type, QAPIExpression, which represents a parsed
> > expression complete with QAPIDoc and QAPISourceInfo.
> >
> > This patch turns parser.exprs into a list of QAPIExpression instead,
> > and adjusts expr.py to match.
> >
> > This allows the types we specify in parser.py to be "remembered" all the
> > way through expr.py and into schema.py. Several assertions around
> > packing and unpacking this data can be removed as a result.
>
> Suggest to add:
>
>   It also corrects a harmless typing error.  Before the patch,
>   check_exprs() allegedly takes a List[_JSONObject].  It actually takes
>   a list of dicts of the form
>
>       {'expr': E, 'info': I, 'doc': D}
>
>   where E is of type _ExprValue, I is of type QAPISourceInfo, and D is
>   of type QAPIDoc.  Key 'doc' is optional.  This is not a _JSONObject!
>   Passes type checking anyway, because _JSONObject is Dict[str, object].
>
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> [...]
>
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index 1b006cdc133..50906e27d49 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -21,6 +21,7 @@
> >      TYPE_CHECKING,
> >      Dict,
> >      List,
> > +    Mapping,
> >      Optional,
> >      Set,
> >      Union,
> > @@ -37,15 +38,24 @@
> >      from .schema import QAPISchemaFeature, QAPISchemaMember
> >
> >
> > -#: Represents a single Top Level QAPI schema expression.
> > -TopLevelExpr = Dict[str, object]
> > -
> >  # Return value alias for get_expr().
> >  _ExprValue = Union[List[object], Dict[str, object], str, bool]
> >
> > -# FIXME: Consolidate and centralize definitions for TopLevelExpr,
> > -# _ExprValue, _JSONValue, and _JSONObject; currently scattered across
> > -# several modules.
> > +
> > +# FIXME: Consolidate and centralize definitions for _ExprValue,
> > +# JSONValue, and _JSONObject; currently scattered across several
> > +# modules.
> > +
> > +
> > +class QAPIExpression(Dict[str, object]):
> > +    # pylint: disable=too-few-public-methods
> > +    def __init__(self,
> > +                 data: Mapping[str, object],
>
> Would @expr be a better name?
>

Linters don't seem to mind the new parameter name. Feel free to make
the substitution if you don't mind "expr" sometimes referring to a
QAPIExpression and sometimes referring to the JSON-y data inside of
it. I am less particular about consistency in my local variable names
than you are, so it's a matter of taste for you specifically.

> > +                 info: QAPISourceInfo,
> > +                 doc: Optional['QAPIDoc'] = None):
> > +        super().__init__(data)
> > +        self.info = info
> > +        self.doc: Optional['QAPIDoc'] = doc
> >
> >
> >  class QAPIParseError(QAPISourceError):
>
> [...]
>
> Regardless,
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>


