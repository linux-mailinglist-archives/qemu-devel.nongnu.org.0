Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B78343E6B4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:58:32 +0200 (CEST)
Received: from localhost ([::1]:42072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8jX-0003Uf-EO
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8gD-0001uS-Gc
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:55:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8gA-0005yZ-Em
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635440101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRwy91hoOt4/yuQPJgXT8cLJnEg9oPIBIzPMGjs5/sE=;
 b=gD3e//4pU8BzekyGk/1rKoDBvZHfc6S7rHd/11W/pSloPcNKlCO8wNYBdfo9FL2c3gkCCC
 J3CAIeqGvqEILUB5R3wRSnDH8MO6z1p5ny1c0gySODr+3P1OC1EM+bbdDAa8dN1+Q1GQ84
 kuBocqdwDJdfcEhrIKkoQ9naB4Uf2AQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-HO0umCVbNJCVHSrbVeqMEg-1; Thu, 28 Oct 2021 12:54:58 -0400
X-MC-Unique: HO0umCVbNJCVHSrbVeqMEg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k126-20020a1ca184000000b003231d0e329bso2885374wme.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DRwy91hoOt4/yuQPJgXT8cLJnEg9oPIBIzPMGjs5/sE=;
 b=cPqmhkL4Dt7mzVhTcbL1+sLQqHneIg5fvQyIqVv6WhZSjM8qvkLkTzr9JAbSvpq5ZU
 Kv+SZPGf5F+OlkC7fcVtA/qQTEZFgWaJY53oYGGORs9pW6yrISPX2pOkdrnm8GGVS+fx
 egzRwAIxRuA0L8bs4gm/rvRtBz0NGG5JJqm44KaX7djdE/Q+BFMd6NFpFxNRCvcPOF9F
 +/9in7B5eEuV7mWMUOhcPr50RoH2hxs51svEwdxhSXElCx/qH5n0J0zshyF+O71YPgWW
 sV97aE8SLTGDth5We0d8ouvqaz7tJAabdHAF/hRJ+4yzg0voIwg4UPd4Aj+5Ja9Owg7u
 R0CA==
X-Gm-Message-State: AOAM530V5rTtal+RcbFBuDo9H0hcahdJvcjq08GO41MrGwcPP8TNBuWZ
 Uy0sNHyGfHw5AJY9m0X3LxIJejrLHJvN+b02qBYojKDOdfq8WqdHKfwtMW21LDeS5le+EV8tqac
 W0MzurMrRl8vw5ns=
X-Received: by 2002:adf:ed84:: with SMTP id c4mr7197375wro.316.1635440097468; 
 Thu, 28 Oct 2021 09:54:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHFi4xhlCkDm2XDSF682GCW8BVgXZFFKt7dd/Z70mN2e9CoJVlZVaODBRKJoi0x8hxJIe5QQ==
X-Received: by 2002:adf:ed84:: with SMTP id c4mr7197345wro.316.1635440097287; 
 Thu, 28 Oct 2021 09:54:57 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n10sm5105218wmq.24.2021.10.28.09.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:54:56 -0700 (PDT)
Message-ID: <447f29f1-7692-3d9d-bba6-87ccd1837cbc@redhat.com>
Date: Thu, 28 Oct 2021 18:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 06/22] monitor: introduce HumanReadableText and HMP
 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-7-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-7-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> This provides a foundation on which to convert simple HMP commands to
> use QMP. The QMP implementation will generate formatted text targeted
> for human consumption, returning it in the HumanReadableText data type.
> 
> The HMP command handler will simply print out the formatted string
> within the HumanReadableText data type. Since this will be an entirely
> formulaic action in the case of HMP commands taking no arguemnts, a

Typo "arguments"

> custom command handler is provided.
> 
> Thus instead of registering a 'cmd' callback for the HMP command, a
> 'cmd_info_hrt' callback is provided, which will simply be a pointer
> to the QMP implementation.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  include/monitor/hmp.h       |  3 +++
>  include/monitor/monitor.h   |  2 ++
>  include/qapi/type-helpers.h | 14 ++++++++++++++
>  monitor/hmp.c               | 31 ++++++++++++++++++++++++++++---
>  monitor/misc.c              | 18 +++++++++++++++++-
>  monitor/monitor-internal.h  |  7 +++++++
>  qapi/common.json            | 11 +++++++++++
>  qapi/meson.build            |  3 +++
>  qapi/qapi-type-helpers.c    | 23 +++++++++++++++++++++++
>  9 files changed, 108 insertions(+), 4 deletions(-)
>  create mode 100644 include/qapi/type-helpers.h
>  create mode 100644 qapi/qapi-type-helpers.c

> +##
> +# @HumanReadableText:
> +#
> +# @human-readable-text: Formatted output intended for humans.
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'struct': 'HumanReadableText',
> +  'data': { 'human-readable-text': 'str' } }
> diff --git a/qapi/meson.build b/qapi/meson.build
> index c356a385e3..c0c49c15e4 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -10,6 +10,9 @@ util_ss.add(files(
>    'string-input-visitor.c',
>    'string-output-visitor.c',
>  ))
> +if have_system
> +  util_ss.add(files('qapi-type-helpers.c'))
> +endif
>  if have_system or have_tools

Eh I was expecting this to be added here, but it seems to build,
so TIL tools don't use HMP.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


>    util_ss.add(files(
>      'qmp-dispatch.c',


