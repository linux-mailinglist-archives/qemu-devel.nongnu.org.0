Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E7D2D7A5C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:00:56 +0100 (CET)
Received: from localhost ([::1]:47568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkql-00015r-IY
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knkfF-0004dh-8T
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:49:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knkfC-0005u5-Py
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607701737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aEff4xEd1UJmHUWO+sXAtjxBriJ0+K8vr6oi8rTEmmM=;
 b=bx8f5LcIvoKfAONCRSV86/uCmF5vV6Um89xteJ5AbfvZSYB3OmxrCKTE8pklbvX12KAb1q
 i2NBEVE+3qAbfjr+Qe20oBxsE9/gykaZzW4U0Ut2T3k8xB7Qwh5amOb7eJcv4wEplmJM8L
 960D/1pi1t519j/JSMc+4TQ04THt4TE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-_ue1V2I9O_GSSf9chl3UZQ-1; Fri, 11 Dec 2020 10:48:55 -0500
X-MC-Unique: _ue1V2I9O_GSSf9chl3UZQ-1
Received: by mail-wm1-f72.google.com with SMTP id h68so3438280wme.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aEff4xEd1UJmHUWO+sXAtjxBriJ0+K8vr6oi8rTEmmM=;
 b=N1ExsfByjbS/rToDf43ZFWLGHuDbqH4hfCuifNWdBg7rPU1mDpmLitCjVqgxSo0355
 kvdq/DHg8onsL/PP8UWB/BEL5aptb0Ad94F27OKffnhqbUFG1VEpE517XlYAbSaVu98i
 TK3Ev4VM0g420HXaCJV+rC8JMObdxG6VAvuxLtlRdpisjTRVwVEuHv8aPMXMyDXDxvQM
 jdu9EkawlcCjxvUbx9aJBRBjflAzQ3Sh6XKtdhY6ForySFqaSKf+EizmsU0M8uac6Hl3
 V23+1QFYolArnpvHosYgHPXABjek+id4OYFjBaKhP+TrC7MZCuhU5abP477SIuxVypjt
 MYQw==
X-Gm-Message-State: AOAM531mRDWxulG1Hf5Dpb6VAV4/5iXvQyu81nhTJ53D1a3CQMxQLEed
 6P+lKfp3AjTGUJc1z2FETwlFWL+zCleucfQRsClZlwLg19CxPE6uChYRymTp/fi+Edg1K9IjbTM
 gcuNcZvOdrgjzLU0=
X-Received: by 2002:a1c:9949:: with SMTP id b70mr14465352wme.85.1607701733827; 
 Fri, 11 Dec 2020 07:48:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzN9qgoRYBsUkAllxbAJW4aRg8ikbHttDf/vdPHT6g9ZTEKTS5pIKGyeLwgvngq0mUQR9xMeA==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr14465331wme.85.1607701733604; 
 Fri, 11 Dec 2020 07:48:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b73sm16600310wmb.0.2020.12.11.07.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 07:48:52 -0800 (PST)
Subject: Re: [PATCH] docs: Build and install all the docs in a single manual
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201210203549.379-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fd4a1215-5337-4984-d469-369a26d6a5c2@redhat.com>
Date: Fri, 11 Dec 2020 16:48:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210203549.379-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 21:35, Peter Maydell wrote:
> When we first converted our documentation to Sphinx, we split it into
> multiple manuals (system, interop, tools, etc), which are all built
> separately.  The primary driver for this was wanting to be able to
> avoid shipping the 'devel' manual to end-users.  However, this is
> working against the grain of the way Sphinx wants to be used and
> causes some annoyances:
>   * Cross-references between documents become much harder or
>     possibly impossible
>   * There is no single index to the whole documentation
>   * Within one manual there's no links or table-of-contents info
>     that lets you easily navigate to the others
>   * The devel manual doesn't get published on the QEMU website
>     (it would be nice to able to refer to it there)
> 
> Merely hiding our developer documentation from end users seems like
> it's not enough benefit for these costs.  Combine all the
> documentation into a single manual (the same way that the readthedocs
> site builds it) and install the whole thing.  The previous manual
> divisions remain as the new top level sections in the manual.
> 
>   * The per-manual conf.py files are no longer needed
>   * The man_pages[] specifications previously in each per-manual
>     conf.py move to the top level conf.py
>   * docs/meson.build logic is simplified as we now only need to run
>     Sphinx once for the HTML and then once for the manpages5B
>   * The old index.html.in that produced the top-level page with
>     links to each manual is no longer needed
> 
> Unfortunately this means that we now have to build the HTML
> documentation into docs/manual in the build tree rather than directly
> into docs/; otherwise it is too awkward to ensure we install only the
> built manual and not also the dependency info, stamp file, etc.  The
> manual still ends up in the same place in the final installed
> directory, but anybody who was consulting documentation from within
> the build tree will have to adjust where they're looking.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Sounds good!

I thought I had sent my reviewed-by in November.  If I didn't...


>     man_pages = {
> -    'interop' : {
>           'qemu-ga.8': (have_tools ? 'man8' : ''),
>           'qemu-ga-ref.7': 'man7',
>           'qemu-qmp-ref.7': 'man7',
> -    },
> -    'tools': {
>           'qemu-img.1': (have_tools ? 'man1' : ''),
>           'qemu-nbd.8': (have_tools ? 'man8' : ''),
>           'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
>           'qemu-trace-stap.1': (config_host.has_key('CONFIG_TRACE_SYSTEMTAP') ? 'man1' : ''),
>           'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''),
>           'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
> -    },
> -    'system': {
>           'qemu.1': 'man1',
>           'qemu-block-drivers.7': 'man7',
>           'qemu-cpu-models.7': 'man7'
> -    },
>     }

... perhaps my only suggestion is to sort these by section and 
secondarily by name.  But no need to repost---or even to do it, in fact.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


