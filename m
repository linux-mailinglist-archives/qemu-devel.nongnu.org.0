Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19143B60D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:49:30 +0200 (CEST)
Received: from localhost ([::1]:37310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOhd-00034M-H5
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfObV-0006fF-Mp
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfObT-0002QL-MI
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635262986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QteN6VB0yZPNR5dOE4qSwTVJB0x79MhAeexotvLFJbU=;
 b=VHe6fry0XObIzAU8c6/Uug63ujQ4v4txHiGmy7dgfkku27caqBZd2JFDFq3jPYUxruscd/
 VGdsHcJelIjtJuXsOqHZ37u7iYfW5vusLQvlkc5lTY+KYhSXtFTgNR/h+rtElmZ2sYCl+n
 Id40v3VnSKt2joS7oLaz4e5yLq/2SlU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-gl2EEZkBMkm3zdz-RGbBfg-1; Tue, 26 Oct 2021 11:43:05 -0400
X-MC-Unique: gl2EEZkBMkm3zdz-RGbBfg-1
Received: by mail-wm1-f70.google.com with SMTP id
 b79-20020a1c1b52000000b0032328337393so811511wmb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QteN6VB0yZPNR5dOE4qSwTVJB0x79MhAeexotvLFJbU=;
 b=uA7NlyNfSDFlv++Gr8BSj33xQrV39yXjyQliHpWQ6jpNVQwuJ0fSXlyiF4TdRwDt21
 XU3IO1bf+slP9eJvEsGVckFUYrZ6ESth+qvXwExREz+1DM3ykaCdwrj2/9hRw1u3dDhd
 G9Y+XJ6Kj4lRvfcJRtByndFPwbCZJk1p7mkih9YCFd76pdHbnTgEYo9R0k/MDZHDeuSt
 iGTeTs2JdO9vOspG2kiTVTW5fy4HR4NN8b7vJGaz3vroPulaiHoLD2rfYHyiMTogMjML
 lfnvyEBoaa+MoFzAkbe/kMBb+zlyLHw8mhlU7hE3p9NdUzXsDzVhQNaIxrIdt3+u/5vi
 mtnQ==
X-Gm-Message-State: AOAM531+6bVFNpHPCw6hlftJ8POWW6Xhfko0ZrkLOxAO6mhTpWpuox7g
 0maQe868OjtcFvQ2BXLX+N1il7zd6ADUON7+v4r3IqZnmpJsDQ1w0HHzsXEih5h7CqdBjpdb28q
 ddsYsYypL8lJJfU0=
X-Received: by 2002:a05:600c:4150:: with SMTP id
 h16mr11650219wmm.78.1635262984118; 
 Tue, 26 Oct 2021 08:43:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDBHMk0N1Lj2FLIJBAeTdmmHXzjYGHhJ59d6cTe6+br9/GGrM+NSqtKvtaL5MXy406hPduog==
X-Received: by 2002:a05:600c:4150:: with SMTP id
 h16mr11650181wmm.78.1635262983868; 
 Tue, 26 Oct 2021 08:43:03 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r15sm13946451wru.9.2021.10.26.08.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:43:03 -0700 (PDT)
Message-ID: <d62aead1-4217-1091-4bd6-d81c0c217903@redhat.com>
Date: Tue, 26 Oct 2021 17:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/9] qapi: Generalize struct member policy checking
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025052532.3859634-6-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 libvir-list@redhat.com, jsnow@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 07:25, Markus Armbruster wrote:
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

> diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
> index 71b24a4429..fda485614b 100644
> --- a/qapi/qobject-input-visitor.c
> +++ b/qapi/qobject-input-visitor.c
> @@ -662,16 +662,21 @@ static void qobject_input_optional(Visitor *v, const char *name, bool *present)
>      *present = true;
>  }
>  
> -static bool qobject_input_deprecated_accept(Visitor *v, const char *name,
> -                                            Error **errp)
> +static bool qobject_input_policy_reject(Visitor *v, const char *name,
> +                                        unsigned special_features,
> +                                        Error **errp)
>  {
> +    if (!(special_features && 1u << QAPI_DEPRECATED)) {

Unreachable =) Proof than extract() is safer :P

> +        return false;
> +    }


