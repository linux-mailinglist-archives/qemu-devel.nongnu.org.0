Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E82420791
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:48:37 +0200 (CEST)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJeG-0000w5-Ba
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ5W-0007IR-Va
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ5U-000127-B7
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e0UHtQzp8oujg3rZsnhle2eR7E5p5dl5+wOwIQeKhoo=;
 b=hzzwsfmV7ApvfABrJrhBuAvezSFDhKQVJJzpXiM4hRY9Q8K6eHtAgR3EGMrxrSm8UdxuHO
 Wzr/Pno3eJkHzAklfEH9yz+wX1to6YiKjViQ/DSYo/F4d04EH9cY/qkEUj39dcwVTmCHyY
 2778/lrRgcrVLt/AE+qY8UWCv5oBRec=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-uNOzQbKZO8asg6ah9_SVBg-1; Mon, 04 Oct 2021 04:12:36 -0400
X-MC-Unique: uNOzQbKZO8asg6ah9_SVBg-1
Received: by mail-ed1-f71.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so16359506edn.5
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e0UHtQzp8oujg3rZsnhle2eR7E5p5dl5+wOwIQeKhoo=;
 b=hdqOmshJGYgX6mXAAnLAG/xNSpY6fIak7j+F1a/iKKpdFbG+ka6kbaXB4jYuWt4teS
 aAL7YxBff+/oMhcNDZjymtiQWWpw37kHcfrjY5b2J45u6yzHs3slIo19EU9srWcZumJj
 Wbb/EApM/8JFLbLqpbDk5vKnXCBst4gzbYA1NX4iqBg5DBg5GUq3VUZWzCjvL5olL/nn
 erzBAipCapHWsuPLLWv32BFrAqjZIcWSCBaEh/uym/2mASvmk4yeJCyvzrT2pfyrM4CX
 sSt0dslFUButbIT8s3ZpUzKEJEoOPLEBn3pviLAA+fgxrVl7ozfOcPb81LDfDzQfYS1l
 w7Qg==
X-Gm-Message-State: AOAM530Mh/vnFsIqDgBTYe5h4bScdw7I5frQ7qRJWth7Tkj2ZRc1NvGR
 7cmmYvhJGJ5JskyGLLkkGa4FZTy52vFfqAxy81Pi46ON9XCxgoLsfkZbGAET0lf9pKSQy31RCNo
 a8HXP2Kuhp7e590Q=
X-Received: by 2002:a05:6402:450:: with SMTP id
 p16mr16403655edw.162.1633335155218; 
 Mon, 04 Oct 2021 01:12:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznX5n3F5L83hX4XCbBgkS3HW4SPDb/COrH2fP1mwdhedrepAo6IAJoi1jkNUJ4mstKAYwRHQ==
X-Received: by 2002:a05:6402:450:: with SMTP id
 p16mr16403642edw.162.1633335154995; 
 Mon, 04 Oct 2021 01:12:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q6sm6033517ejm.106.2021.10.04.01.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:12:34 -0700 (PDT)
Message-ID: <0890d543-1c65-2594-cbdb-17ae05c2af02@redhat.com>
Date: Mon, 4 Oct 2021 10:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 09/22] target/i386/sev: Mark unreachable code with
 g_assert_not_reached()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-10-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-10-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
> The unique sev_encrypt_flash() invocation (in pc_system_flash_map)
> is protected by the "if (sev_enabled())" check, so is not
> reacheable.
> Replace the abort() call in sev_es_save_reset_vector() by
> g_assert_not_reached() which meaning is clearer.
> 
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/sev-stub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index eb0c89bf2be..4668365fd3e 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -54,7 +54,7 @@ int sev_inject_launch_secret(const char *hdr, const char *secret,
>   
>   int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
>   {
> -    return 0;
> +    g_assert_not_reached();
>   }
>   
>   bool sev_es_enabled(void)
> @@ -68,7 +68,7 @@ void sev_es_set_reset_vector(CPUState *cpu)
>   
>   int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
>   {
> -    abort();
> +    g_assert_not_reached();
>   }
>   
>   SevAttestationReport *
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


