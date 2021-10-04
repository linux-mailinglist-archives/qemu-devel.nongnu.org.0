Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAC842075F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:36:46 +0200 (CEST)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJSo-0004hs-0L
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ41-0004tm-5r
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ3y-0008Cg-F9
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjYU5cz2y0dGq+dhAQVfGWlPOvLqMZPTP1otInh0ROM=;
 b=dUW5PmEX6oIBRFbLqwF7cp8FW4feiqThA8mi00yAzuLW6XlRvbE9Y/I2tJhnGEzu+SiNeJ
 vP4PWm+FIIqAxpRlkweNcgZnx4JNRCsdbl9c1zLjcD7QsmvNqXWnUQse2atWE/jwN9Gbr8
 sCZZu19NlA2BFnH7/ulyGywNswiPuNc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-r-FAHex5M2OpPCAK8YmGsA-1; Mon, 04 Oct 2021 04:11:04 -0400
X-MC-Unique: r-FAHex5M2OpPCAK8YmGsA-1
Received: by mail-ed1-f71.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so16355209edn.5
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vjYU5cz2y0dGq+dhAQVfGWlPOvLqMZPTP1otInh0ROM=;
 b=xose393xs+pN7aF/lKD5mTQCfupnMUyOfqwlZ/Owk590jMLGTTlMmrnEeY+82Vcdnl
 gHtkLZKOjaAPgVzbJg7J9oETnmqwuxFFduR46aXRGjmliFgnD03b2e12kBt07i9dhoz7
 uxB29KWhRHIBQXDNxqTtk+xPD6eL4y1qdpYQys2LI2XBeC3ru8D0AJCWyoxdGRSNeHOY
 IrkvoSjiVLtnZ6mvDLWDAdAlh9GnHYe/rxbI+us38A6NFRQkU8zicG9rwlvWfmKsVy0y
 jPz/zqzy7NdfMY1k5KpuaGhATpKOFrsazrCBxQQb0soPSHQlkLD6X6vbWiQNOM60z8vM
 FpEg==
X-Gm-Message-State: AOAM5339HxRPHKyf+fKCYcA4mRtlvL7q4rjE7HqXbsYKz0orV3GPn4Lh
 xnpEfKlq5RQ8OJC0yAHjXlvSnm2ynQ06Lsu0L0xTQgSDn+psTvR3IDuVh9AqYn8pzWMrYhdMp6D
 Lb6d+W2rPusD7n/A=
X-Received: by 2002:a50:e043:: with SMTP id g3mr16562255edl.196.1633335063409; 
 Mon, 04 Oct 2021 01:11:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2M4UpxCwd9nP3JrAdk/nNT86mhc/MztbWHvGMl8hJiRsX757o29T7LWjeqTSjTmOaFOJfKQ==
X-Received: by 2002:a50:e043:: with SMTP id g3mr16562244edl.196.1633335063217; 
 Mon, 04 Oct 2021 01:11:03 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r10sm1644073edh.61.2021.10.04.01.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:11:02 -0700 (PDT)
Message-ID: <bef20bd5-7760-3fc7-9914-1eddca800825@redhat.com>
Date: Mon, 4 Oct 2021 10:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 05/22] target/i386/monitor: Return QMP error when SEV
 is disabled in build
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-6-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-6-philmd@redhat.com>
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
> If the management layer tries to inject a secret, it gets an empty
> response in case the binary built without SEV:
> 
>    { "execute": "sev-inject-launch-secret",
>      "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
>    }
>    {
>        "return": {
>        }
>    }
> 
> Make it clearer by returning an error, mentioning the feature is
> disabled:
> 
>    { "execute": "sev-inject-launch-secret",
>      "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
>    }
>    {
>        "error": {
>            "class": "GenericError",
>            "desc": "this feature or command is not currently supported"
>        }
>    }
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/monitor.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 196c1c9e77f..a9f85acd473 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -28,6 +28,7 @@
>   #include "monitor/hmp-target.h"
>   #include "monitor/hmp.h"
>   #include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qerror.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/sev.h"
>   #include "qapi/error.h"
> @@ -743,6 +744,10 @@ void qmp_sev_inject_launch_secret(const char *packet_hdr,
>                                     bool has_gpa, uint64_t gpa,
>                                     Error **errp)
>   {
> +    if (!sev_enabled()) {
> +        error_setg(errp, QERR_UNSUPPORTED);
> +        return;
> +    }
>       if (!has_gpa) {
>           uint8_t *data;
>           struct sev_secret_area *area;
> 

This should be done in the sev_inject_launch_secret stub instead, I 
think.  Or if you do it here, you can remove the "if (!sev_guest)" 
conditional in the non-stub version.

Paolo


