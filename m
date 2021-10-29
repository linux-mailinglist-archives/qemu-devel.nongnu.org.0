Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2275B43FD65
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 15:34:58 +0200 (CEST)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgS24-0002v0-Q2
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 09:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgRyZ-0001Lw-6v
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgRyR-0000PC-IG
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635514267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ubx8f65c/qdHmlUupNqNan9AXmetMXimddwBZBCrEgc=;
 b=iloy7dRHYRezNICKVlboufliaXh50p1tlnO86ZIxo9dF1rbGL2hz1Xu94wGM2bED/0xd6t
 p33PezcYFckrBpg7RXuNkLU3v8aXonLAB1Ay4OeKmagOXjMDVAZyamRZuiw8cuyIZdr2Ab
 6I9Vy3xyuazBjrf6ASzNewutBHXPrdg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-ZdX4tPi9MCGUj2IJuc6l-w-1; Fri, 29 Oct 2021 09:31:04 -0400
X-MC-Unique: ZdX4tPi9MCGUj2IJuc6l-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso3684153wme.5
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 06:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ubx8f65c/qdHmlUupNqNan9AXmetMXimddwBZBCrEgc=;
 b=SwGk4p2hu4G+0Rq46v/+awTpcSdkO6IQpojbkZd1hxdpKxn8m5X6mlJBB5KSPWW20q
 1DLhx+7FcX0zK9/ryDXQDyo3R/6oYFWGI+gl2NhpQjvLfp0gN3yQjtoloFJ+Djud+Xi0
 1O1mWU+4FKQGz3V6+F6Ik2MvZTQeMc2XJd4xBbZx6lpNtmIPmC4m1t4QFXMTXvuyb0is
 FpVaP9wJ9g3m2BCQyB1GSV5vO3hHZMGM2FtEY28TXL+RyHWfmdCQ0pozmqzXFp+Ywm5W
 AMr9HTxRwzYdFxFvwy96315qAQqW28zB96aZIOCNu+BIJ28O2ulvdyi0daV0s8MmpimL
 CeaQ==
X-Gm-Message-State: AOAM530lkPiF+JcF+PN1k/0XDBGwJnJuMXJ7ojoAOnvNSm5sWcCelEZO
 B7xqs7XVUcIFxcXxMXVv0KQqU8BV+P5IDfdL5UFm6fQh4Kwc11mloqh+mqJ1IR0JtIt4Jwrtqqe
 ldl8+xQmTj3h0QpY=
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr14410705wrd.63.1635514263170; 
 Fri, 29 Oct 2021 06:31:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxonFL8kaD6IGS77+CI0ggpIP32VreE6n7CPYgLMOhTtdBRPliOaNYjO9Wb14wrbKKA23ptig==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr14410669wrd.63.1635514262993; 
 Fri, 29 Oct 2021 06:31:02 -0700 (PDT)
Received: from [192.168.20.130] (192.red-83-57-30.dynamicip.rima-tde.net.
 [83.57.30.192])
 by smtp.gmail.com with ESMTPSA id t1sm6477356wre.32.2021.10.29.06.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 06:31:02 -0700 (PDT)
Message-ID: <66af3635-d6ee-d1c1-5511-af12ba816638@redhat.com>
Date: Fri, 29 Oct 2021 15:31:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 5/9] qapi: Generalize struct member policy checking
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028102520.747396-6-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 libvir-list@redhat.com, eblake@redhat.com, kchamart@redhat.com,
 mdroth@linux.vnet.ibm.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 12:25, Markus Armbruster wrote:
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
>  include/qapi/visitor-impl.h   |  6 ++++--
>  include/qapi/visitor.h        | 17 +++++++++++++----
>  qapi/qapi-forward-visitor.c   | 16 +++++++++-------
>  qapi/qapi-visit-core.c        | 22 ++++++++++++----------
>  qapi/qobject-input-visitor.c  | 15 ++++++++++-----
>  qapi/qobject-output-visitor.c |  9 ++++++---
>  qapi/trace-events             |  4 ++--
>  scripts/qapi/visit.py         | 14 +++++++-------
>  8 files changed, 63 insertions(+), 40 deletions(-)

> -static bool qobject_input_deprecated_accept(Visitor *v, const char *name,
> -                                            Error **errp)
> +static bool qobject_input_policy_reject(Visitor *v, const char *name,
> +                                        unsigned special_features,
> +                                        Error **errp)
>  {
> +    if (!(special_features & 1u << QAPI_DEPRECATED)) {
> +        return false;
> +    }
> +
>      switch (v->compat_policy.deprecated_input) {
>      case COMPAT_POLICY_INPUT_ACCEPT:
> -        return true;
> +        return false;
>      case COMPAT_POLICY_INPUT_REJECT:
>          error_setg(errp, "Deprecated parameter '%s' disabled by policy",
>                     name);
> -        return false;
> +        return true;
>      case COMPAT_POLICY_INPUT_CRASH:

Clearer as:

           abort();
       default:
           g_assert_not_reached();

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>      default:
>          abort();


