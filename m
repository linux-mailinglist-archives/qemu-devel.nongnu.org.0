Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E297030C54B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:19:19 +0100 (CET)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yOc-00041L-UV
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6y8j-0004YB-VW
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:02:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6y8e-0004rI-HX
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S282R2v0SwTi2q+IM+4ArMygbMeWTcz46RpxtKWf1tY=;
 b=AMOc5OVrsnZlRqQTiwNnVT2T+A+eOrWTop4PcgAmbygbNB/R9aFUWk76MoXBNwnuaPsKjF
 j1ExIR5MvC3myjfu2Wk1WOvz4AIOctXUJG84LejfWSHfVxx0Aymmt8lEiR/flpr3OW7HiR
 LjYZb1GjduIrcsnOcjQuZED3yKxm+VU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-agOqh1aYPgiUXsRUTjiSvA-1; Tue, 02 Feb 2021 11:02:46 -0500
X-MC-Unique: agOqh1aYPgiUXsRUTjiSvA-1
Received: by mail-wm1-f69.google.com with SMTP id b201so1632547wmb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 08:02:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S282R2v0SwTi2q+IM+4ArMygbMeWTcz46RpxtKWf1tY=;
 b=a2CRrgRLvmdO8bI3KeoTZjCmeGgSxIz47XBiORdlzfVwc0khEnErFn9PdWcXlVnZ/M
 hU5a1jtxw6x+NrGVEK5oGldlZmnsDcvG0TZ7a4doPY3JKxIk3rcNWOJ5LE/EgvOfCV86
 48yCW+OYC8g9/AYcQVV9ds41MADhatgM8U2+lF5dLuML5ZsM1FLYTob3bfQw3TTM8ARE
 xj4dhvAmPtYzuN7wNH3YNKveGyM/HB/on2pF0yZIUpHNkrrT/bWcgiVpQc687OFDdPdv
 6m4AmLaGC4UaJCYxpVotjYc4vLgeJEUncf7l62ZKeyK1u3V3Srp0H1XFax0HT57kzWSQ
 XH0Q==
X-Gm-Message-State: AOAM532oCdE0a93FqpM/gdiwcmxE9TMlo/pzXGG8CO58hEErC9eJF46p
 AMl61Yirl6C7mJal1MrURuYFnU/bb5bZXlHYjKBi/amzwc6Nzw+qOWQ+zgw9T6+OBzv/dPrDjv4
 C0ThKbgn5nuGTEXo=
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr24722687wrq.425.1612281764392; 
 Tue, 02 Feb 2021 08:02:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNJdR4MN4IgA0LHYSN9VRQ4FdsFI0z9i6Y0UMH+iyKra7CGkjWxKY75bc/F99gAtv+FMcWkA==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr24722647wrq.425.1612281764188; 
 Tue, 02 Feb 2021 08:02:44 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id a6sm3676893wmj.27.2021.02.02.08.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 08:02:43 -0800 (PST)
Subject: Re: [PATCH 2/3] i386: Move asserts to separate x86_cpudef_validate()
 function
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>
References: <20210201225404.3941395-1-ehabkost@redhat.com>
 <20210201225404.3941395-3-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ad137c5a-971d-36d1-edfe-b35a66cfb09f@redhat.com>
Date: Tue, 2 Feb 2021 17:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201225404.3941395-3-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Babu Moger <babu.moger@amd.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 11:54 PM, Eduardo Habkost wrote:
> Additional sanity checks will be added to the code, so move the
> existing asserts to a separate function.
> 
> Wrap the whole function in `#ifndef NDEBUG` because the checks
> will become more complex than trivial assert() calls.

How can you build with NDEBUG? See commit 262a69f4282:

    osdep.h: Prohibit disabling assert() in supported builds

    We already have several files that knowingly require assert()
    to work, sometimes because refactoring the code for proper
    error handling has not been tackled yet; there are probably
    other files that have a similar situation but with no comments
    documenting the same.  In fact, we have places in migration
    that handle untrusted input with assertions, where disabling
    the assertions risks a worse security hole than the current
    behavior of losing the guest to SIGABRT when migration fails
    because of the assertion.  Promote our current per-file
    safety-valve to instead be project-wide, and expand it to also
    cover glib's g_assert().

and "qemu/osdep.h":

 /*
  * We have a lot of unaudited code that may fail in strange ways, or
  * even be a security risk during migration, if you disable assertions
  * at compile-time.  You may comment out these safety checks if you
  * absolutely want to disable assertion overhead, but it is not
  * supported upstream so the risk is all yours.  Meanwhile, please
  * submit patches to remove any side-effects inside an assertion, or
  * fixing error handling that should use Error instead of assert.
  */
 #ifdef NDEBUG
 #error building with NDEBUG is not supported
 #endif

IOW no need for the #idef.

> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  target/i386/cpu.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 2bf3ab78056..6285fb00eb8 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5431,17 +5431,25 @@ static void x86_register_cpu_model_type(const char *name, X86CPUModel *model)
>      type_register(&ti);
>  }
>  
> -static void x86_register_cpudef_types(X86CPUDefinition *def)
> +/* Sanity check CPU model definition before registering it */
> +static void x86_cpudef_validate(X86CPUDefinition *def)
>  {
> -    X86CPUModel *m;
> -    const X86CPUVersionDefinition *vdef;
> -
> +#ifndef NDEBUG
>      /* AMD aliases are handled at runtime based on CPUID vendor, so
>       * they shouldn't be set on the CPU model table.
>       */
>      assert(!(def->features[FEAT_8000_0001_EDX] & CPUID_EXT2_AMD_ALIASES));
>      /* catch mistakes instead of silently truncating model_id when too long */
>      assert(def->model_id && strlen(def->model_id) <= 48);
> +#endif
> +}
> +
> +static void x86_register_cpudef_types(X86CPUDefinition *def)
> +{
> +    X86CPUModel *m;
> +    const X86CPUVersionDefinition *vdef;
> +
> +    x86_cpudef_validate(def);
>  
>      /* Unversioned model: */
>      m = g_new0(X86CPUModel, 1);
> 


