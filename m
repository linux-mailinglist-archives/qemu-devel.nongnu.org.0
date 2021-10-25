Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D61439605
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:19:05 +0200 (CEST)
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meywS-0000iq-4P
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1meyqu-0005i5-LA
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1meyqr-0003o2-Qo
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635163996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OM0+qaupDj8oYkbqupO6cqtTqYCDR5PACjACUOVb7M=;
 b=dDo7utwma+7ltt4Okq6t1az4kaonMwVgRUrq+GMm5/kDpLY682bp8zxSxVco34XiJbslrJ
 kByXdX6mx1Y4TycSe62Ni5yL8IV6v7nHRkW3i84kE9/Z5hk1pt6QNy9Er3VlLmDfAD25/H
 1aA68XGwdVEJRuY/CyAFqJYbcJ9EkVM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-A6Ur8DvlMCCP7G5NgkB0-A-1; Mon, 25 Oct 2021 08:13:14 -0400
X-MC-Unique: A6Ur8DvlMCCP7G5NgkB0-A-1
Received: by mail-wm1-f72.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so3863103wmj.9
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+OM0+qaupDj8oYkbqupO6cqtTqYCDR5PACjACUOVb7M=;
 b=U8lt5sYGLHtHt89R+cqgwK53sIZJ/SCGcXOuFMNv6Uyy/RTP3GhEHRi7SUSVqgXw4M
 VDrwZmTb3HHPj+CG/F4ZE4ko/PxUuee721HylpM00mItokbwl1F6bhtRJ8JEsOTImPBf
 gOrDr3gIDASsAcHWVNl3DlnwgF2179ETU5WBxyW9XMWaAGXiA0RCQnpOU4bJkQcWq9gD
 ji20ErUBQCCEcm/xr/DP9hK3L8Tn918iw6fNCUswKdr9zdTkVwvgCR0KJUVefA5f4rnm
 VBTQLHaYaADYEHQuC16E+28QZu2YVaA4/7JDrDX/W1QTn44+qrDxtInY1Qmjb0PcJ6ID
 ec3w==
X-Gm-Message-State: AOAM5335VqItwpWs4iAvTL6Arh/XmFvP3rPeWlhV6KKLlX4xMWKlrk9Y
 VHOHjuhVNfCxVZzBHcpa2vbkOrnihu82jW8nq1bGfg6NVZ+0rvfUXScIK8r3aXytkn+H0WxXq+o
 eNUfDXoDDqadLFTQ=
X-Received: by 2002:a05:600c:2e48:: with SMTP id
 q8mr33041690wmf.29.1635163993446; 
 Mon, 25 Oct 2021 05:13:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU+/yYwjjlIeDdr/ezab5Kr8zYRikdw8kL1bKXGYiaC2aJUHfy86/WYRE4QpcP0cjsUReR/Q==
X-Received: by 2002:a05:600c:2e48:: with SMTP id
 q8mr33041675wmf.29.1635163993273; 
 Mon, 25 Oct 2021 05:13:13 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id u17sm7233059wrp.93.2021.10.25.05.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 05:13:12 -0700 (PDT)
Message-ID: <308cdd2b-fb99-74ed-8a93-52897d21d25e@redhat.com>
Date: Mon, 25 Oct 2021 14:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 8/9] qapi: Factor out compat_policy_input_ok()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-9-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025052532.3859634-9-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, jsnow@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 07:25, Markus Armbruster wrote:
> The code to check policy for handling deprecated input is triplicated.
> Factor it out into compat_policy_input_ok() before I mess with it in
> the next commit.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/compat-policy.h |  7 +++++
>  qapi/qapi-visit-core.c       | 18 +++++--------
>  qapi/qmp-dispatch.c          | 51 +++++++++++++++++++++++++++---------
>  qapi/qobject-input-visitor.c | 19 +++-----------
>  4 files changed, 55 insertions(+), 40 deletions(-)

> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index 8cca18c891..e29ade134c 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -28,6 +28,40 @@
>  
>  CompatPolicy compat_policy;
>  
> +static bool compat_policy_input_ok1(const char *adjective,
> +                                    CompatPolicyInput policy,
> +                                    ErrorClass error_class,
> +                                    const char *kind, const char *name,
> +                                    Error **errp)
> +{
> +    switch (policy) {
> +    case COMPAT_POLICY_INPUT_ACCEPT:
> +        return true;
> +    case COMPAT_POLICY_INPUT_REJECT:
> +        error_set(errp, error_class, "%s %s %s disabled by policy",
> +                  adjective, kind, name);
> +        return false;
> +    case COMPAT_POLICY_INPUT_CRASH:
> +    default:
> +        abort();

g_assert_not_reached() provides a nicer user experience.

> +    }
> +}
> +
> +bool compat_policy_input_ok(unsigned special_features,
> +                            const CompatPolicy *policy,
> +                            ErrorClass error_class,
> +                            const char *kind, const char *name,
> +                            Error **errp)
> +{
> +    if ((special_features & 1u << QAPI_DEPRECATED)

Matter of taste, I find code using extract() easier to review:

  extract64(special_features, QAPI_DEPRECATED, 1)

> +        && !compat_policy_input_ok1("Deprecated",
> +                                    policy->deprecated_input,
> +                                    error_class, kind, name, errp)) {
> +        return false;
> +    }
> +    return true;
> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


