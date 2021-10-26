Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631C443BA00
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:53:32 +0200 (CEST)
Received: from localhost ([::1]:50566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRZh-0004Gp-U1
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfRSD-0003nV-Rv
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:45:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfRSA-00063L-IL
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635273940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MEDBPjZG35MPbknQQAYjailmZJ/qyWoaE5vap5C7tH8=;
 b=gZY8/ataL1BryDKEvqlD05fHUTvIFkH3Ee+cTXrHAcXvBMbSHZoFTR0U3W5EcBj445RYLE
 Se2AzlhjRSISnD7IbhEMchlsf1/cmW4mBLrKh5YAOM8P9+BE3URT76CgvR13xjRe3w6Txy
 iUDJ6umOo6Nncho23RLJYnqhfr/jE6k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-WhJDUR0OM2qaANgjuehfcQ-1; Tue, 26 Oct 2021 14:45:36 -0400
X-MC-Unique: WhJDUR0OM2qaANgjuehfcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 b79-20020a1c1b52000000b0032328337393so969186wmb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MEDBPjZG35MPbknQQAYjailmZJ/qyWoaE5vap5C7tH8=;
 b=0A98x4aCgfM8jdj7DwHGjOQrEOQwltpZOhi71aVDeEvhvYJO/UsNWl4kW2jO9eYRbM
 kUmvzv7SFYwQipm4CLfH7oedT8PlcwgL/GjpUhpjpfZckCbhXfV+sfO80JX+qQK5SlCF
 kB8Xc/t5t5AaO7JjDY8HT+GZMp4ss7QrNwZNj5Tvun7l4ijp9pRq2y28YQOUh6aJ4iU3
 jCBdT7wz4NmmdlHlUoqUV02Z1SOo+P4dSo5Adrci4OE3f8nVwlVXu+1bZ9c/1ZG2FuU6
 5hqJW1wuZ1waczZ2IjneVi6V4Nx/aCpQIxLEFB/d6+qlJTg/cRf+iU5nUuA0Qveql72e
 NoxQ==
X-Gm-Message-State: AOAM533a0ozfrvmz+N/e60NK0nFumjWWUsEY5K/7aUmNPEKVz1GUIf+p
 +vIzQO3lpBlSaYZyXM7QaGxNa9FB9D9afYuxcCdcSHzPwwDI0qqCAJ3TxHmjlrhHO0PTg2fcQFk
 fHlrfeK+/ksZ+ASE=
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr476118wmq.148.1635273935490; 
 Tue, 26 Oct 2021 11:45:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy37JFPTeQpvu4f1i6tqJw1hDT4EHhlqt+pNUIyBxOEyDv9Gl4+t3BlyhyQ/57D17Jl6cLE+A==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr476093wmq.148.1635273935286; 
 Tue, 26 Oct 2021 11:45:35 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id u13sm20350834wri.50.2021.10.26.11.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:45:34 -0700 (PDT)
Date: Tue, 26 Oct 2021 19:45:32 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 9/9] qapi: Extend -compat to set policy for unstable
 interfaces
Message-ID: <YXhMzNHguAyUlRVR@work-vm>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-10-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211025052532.3859634-10-armbru@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> New option parameters unstable-input and unstable-output set policy
> for unstable interfaces just like deprecated-input and
> deprecated-output set policy for deprecated interfaces (see commit
> 6dd75472d5 "qemu-options: New -compat to set policy for deprecated
> interfaces").  This is intended for testing users of the management
> interfaces.  It is experimental.

So is there no way to mark the option as unstable?

Dave

> For now, this covers only syntactic aspects of QMP, i.e. stuff tagged
> with feature 'unstable'.  We may want to extend it to cover semantic
> aspects, or the command line.
> 
> Note that there is no good way for management application to detect
> presence of these new option parameters: they are not visible output
> of query-qmp-schema or query-command-line-options.  Tolerable, because
> it's meant for testing.  If running with -compat fails, skip the test.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
>  
>  typedef struct QEnumLookup {
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index e29ade134c..c5c6e521a2 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -59,6 +59,12 @@ bool compat_policy_input_ok(unsigned special_features,
>                                      error_class, kind, name, errp)) {
>          return false;
>      }
> +    if ((special_features & (1u << QAPI_UNSTABLE))
> +        && !compat_policy_input_ok1("Unstable",
> +                                    policy->unstable_input,
> +                                    error_class, kind, name, errp)) {
> +        return false;
> +    }
>      return true;
>  }
>  
> diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c
> index b5c6564cbb..74770edd73 100644
> --- a/qapi/qobject-output-visitor.c
> +++ b/qapi/qobject-output-visitor.c
> @@ -212,8 +212,12 @@ static bool qobject_output_type_null(Visitor *v, const char *name,
>  static bool qobject_output_policy_skip(Visitor *v, const char *name,
>                                         unsigned special_features)
>  {
> -    return !(special_features && 1u << QAPI_DEPRECATED)
> -        || v->compat_policy.deprecated_output == COMPAT_POLICY_OUTPUT_HIDE;
> +    CompatPolicy *pol = &v->compat_policy;
> +
> +    return ((special_features & 1u << QAPI_DEPRECATED)
> +            && pol->deprecated_output == COMPAT_POLICY_OUTPUT_HIDE)
> +        || ((special_features & 1u << QAPI_UNSTABLE)
> +            && pol->unstable_output == COMPAT_POLICY_OUTPUT_HIDE);
>  }
>  
>  /* Finish building, and return the root object.
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5f375bbfa6..f051536b63 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3641,7 +3641,9 @@ DEFHEADING(Debug/Expert options:)
>  
>  DEF("compat", HAS_ARG, QEMU_OPTION_compat,
>      "-compat [deprecated-input=accept|reject|crash][,deprecated-output=accept|hide]\n"
> -    "                Policy for handling deprecated management interfaces\n",
> +    "                Policy for handling deprecated management interfaces\n"
> +    "-compat [unstable-input=accept|reject|crash][,unstable-output=accept|hide]\n"
> +    "                Policy for handling unstable management interfaces\n",
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
> +
> +    ``unstable-input=accept`` (default)
> +        Accept unstable commands and arguments
> +    ``unstable-input=reject``
> +        Reject unstable commands and arguments
> +    ``unstable-input=crash``
> +        Crash on unstable commands and arguments
> +    ``unstable-output=accept`` (default)
> +        Emit unstable command results and events
> +    ``unstable-output=hide``
> +        Suppress unstable command results and events
> +
> +    Limitation: covers only syntactic aspects of QMP.
>  ERST
>  
>  DEF("fw_cfg", HAS_ARG, QEMU_OPTION_fwcfg,
> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> index 82475e84ec..27b44c49f5 100644
> --- a/scripts/qapi/events.py
> +++ b/scripts/qapi/events.py
> @@ -109,13 +109,15 @@ def gen_event_send(name: str,
>          if not boxed:
>              ret += gen_param_var(arg_type)
>  
> -    if 'deprecated' in [f.name for f in features]:
> -        ret += mcgen('''
> +    for f in features:
> +        if f.is_special():
> +            ret += mcgen('''
>  
> -    if (compat_policy.deprecated_output == COMPAT_POLICY_OUTPUT_HIDE) {
> +    if (compat_policy.%(feat)s_output == COMPAT_POLICY_OUTPUT_HIDE) {
>          return;
>      }
> -''')
> +''',
> +                         feat=f.name)
>  
>      ret += mcgen('''
>  
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 55f82d7389..b7b3fc0ce4 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -254,9 +254,11 @@ def doc_type(self):
>  
>      def check(self, schema):
>          QAPISchemaEntity.check(self, schema)
> -        if 'deprecated' in [f.name for f in self.features]:
> -            raise QAPISemError(
> -                self.info, "feature 'deprecated' is not supported for types")
> +        for feat in self.features:
> +            if feat.is_special():
> +                raise QAPISemError(
> +                    self.info,
> +                    f"feature '{feat.name}' is not supported for types")
>  
>      def describe(self):
>          assert self.meta
> @@ -726,7 +728,7 @@ class QAPISchemaFeature(QAPISchemaMember):
>      role = 'feature'
>  
>      def is_special(self):
> -        return self.name in ('deprecated')
> +        return self.name in ('deprecated', 'unstable')
>  
>  
>  class QAPISchemaObjectTypeMember(QAPISchemaMember):
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


