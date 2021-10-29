Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C14843FF5F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 17:22:10 +0200 (CEST)
Received: from localhost ([::1]:49744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgThp-0000WJ-IL
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 11:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgTgO-000888-5y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgTgH-0004We-JG
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635520831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FiNF/bP2lleNiMrwOiv3WBy3mxZIPMTfFLIHcGb7YnY=;
 b=KPKDonCsIbSdNsy2vsLmnAl/EHnP/+oC0E1yp9eHcN1MZ4+TQCmseMUClLdjA6SJF7iPz7
 PJTdnrI6LsywGaGghjMHJs7aLT07PVve3JVThYLXQkhWNcCqES7P67lS5VFmrlG2WfRJEK
 ZeXcGE9QJlzOsHODeCCgMowdO3XPThk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-rtoCU9psP5iGrL5XZd96fA-1; Fri, 29 Oct 2021 11:20:28 -0400
X-MC-Unique: rtoCU9psP5iGrL5XZd96fA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FD6D100D686;
 Fri, 29 Oct 2021 15:20:27 +0000 (UTC)
Received: from redhat.com (ovpn-112-232.phx2.redhat.com [10.3.112.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51027604CC;
 Fri, 29 Oct 2021 15:20:26 +0000 (UTC)
Date: Fri, 29 Oct 2021 10:20:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 5/9] qapi: Generalize struct member policy checking
Message-ID: <20211029152024.7x2tiizzswurimdf@redhat.com>
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-6-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028102520.747396-6-armbru@redhat.com>
User-Agent: NeoMutt/20211022
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Thu, Oct 28, 2021 at 12:25:16PM +0200, Markus Armbruster wrote:
> The generated visitor functions call visit_deprecated_accept() and
> visit_deprecated() when visiting a struct member with special feature
> flag 'deprecated'.  This makes the feature flag visible to the actual
> visitors.  I want to make feature flag 'unstable' visible there as
> well, so I can add policy for it.
> 
> To let me make it visible, replace these functions by
> visit_policy_reject() and visit_policy_skip(), which take the member's
> special features as an argument.  Note that the new functions have the
> opposite sense, i.e. the return value flips.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/qapi/qapi-forward-visitor.c
> @@ -246,25 +246,27 @@ static void forward_field_optional(Visitor *v, const char *name, bool *present)
>      visit_optional(ffv->target, name, present);
>  }
>  
> -static bool forward_field_deprecated_accept(Visitor *v, const char *name,
> -                                            Error **errp)
> +static bool forward_field_policy_reject(Visitor *v, const char *name,
> +                                        unsigned special_features,
> +                                        Error **errp)
>  {
>      ForwardFieldVisitor *ffv = to_ffv(v);
>  
>      if (!forward_field_translate_name(ffv, &name, errp)) {
>          return false;

Should this return value be flipped?

>      }
> -    return visit_deprecated_accept(ffv->target, name, errp);
> +    return visit_policy_reject(ffv->target, name, special_features, errp);
>  }
>  
> -static bool forward_field_deprecated(Visitor *v, const char *name)
> +static bool forward_field_policy_skip(Visitor *v, const char *name,
> +                                      unsigned special_features)
>  {
>      ForwardFieldVisitor *ffv = to_ffv(v);
>  
>      if (!forward_field_translate_name(ffv, &name, NULL)) {
>          return false;

and here too?

>      }
> -    return visit_deprecated(ffv->target, name);
> +    return visit_policy_skip(ffv->target, name, special_features);
>  }
>  

Otherwise, the rest of the logic changes for flipped sense look right.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


