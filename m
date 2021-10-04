Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA3D42073C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:22:31 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJF0-0001X5-HM
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ62-00006G-Py
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:13:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ61-0001RO-3T
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnDhtF1ATr+X66DQ/Xxg2LJW4VZx0oJz8BmVOuCxHZY=;
 b=bf993WbuP4US9akAIXhQEuXQmyPpZbTOFgHW8QlB5wcpw1mvA+hDZNwVnnSL6DsVLAF3Vz
 FhYqTZTsmOGLsoxN8HfATbK1jgMlVCEcALGAaJmJHJsqWHqgJXmHnzi8+z759BBmdm6569
 VbmbtW08Q7wpSYbPO5tIjmrwgyQly5Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-8oNBIE6lMhehqdYb1qMB_A-1; Mon, 04 Oct 2021 04:13:11 -0400
X-MC-Unique: 8oNBIE6lMhehqdYb1qMB_A-1
Received: by mail-ed1-f70.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso6468746edt.11
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dnDhtF1ATr+X66DQ/Xxg2LJW4VZx0oJz8BmVOuCxHZY=;
 b=h45TDlLXLFX6tjNCLRYtVSTGYiCLaVSU3C3lblILT0jHADlDlLhFOufVS2YBl5nc+N
 Wz5T/fUDr4TSoExCVHo58NEus1u/QMiF/tyW2v5RePi2GemW7MQXWAV5QFHk1kPR9xm1
 ZhiZ+f8qhAzji0JVT+7fSoUDo1z2oUaOATvTw4HbGtAGDDw3AtnsXc3N27bBsTAvTbL7
 5YVeLXAWxEMkp6FUbbYzvOUiLDBtoS6RQWOvV8fItR4Y0pJvDananMb+SrgrVUC0Nxwb
 g9WQ2jjYroZwpxNE+YeMdA25mit8YCzb48jZzlSZxxkgK/aImOR2BFb+a7nkpdusaT7h
 tMuQ==
X-Gm-Message-State: AOAM53226cF4UVjy+rD5SHqFMofCocfCfVWGq3LvTERIwDhHbjcAsW7D
 /wv6w0G/dg7kODg14D5Dwa+9SHqob75bv+jCczU9n6gn3gq+iE9edI3uh3g+pVY3OtUe3AxM837
 j81cJFvKcqEdZ+vg=
X-Received: by 2002:aa7:da1a:: with SMTP id r26mr5865698eds.229.1633335190403; 
 Mon, 04 Oct 2021 01:13:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv8vCYqFd2dvvuwLaT8aXyPctMi9hMyDS7UrB6lf81VpZZ0rVRJjTpuz2iIYPr95l2n5ZDMA==
X-Received: by 2002:aa7:da1a:: with SMTP id r26mr5865675eds.229.1633335190175; 
 Mon, 04 Oct 2021 01:13:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e1sm6959005edc.45.2021.10.04.01.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:13:09 -0700 (PDT)
Message-ID: <5920c7f9-df55-9fc9-c88c-0ddfa86f7004@redhat.com>
Date: Mon, 4 Oct 2021 10:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 10/22] target/i386/sev: sev_get_attestation_report use
 g_autofree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-11-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-11-philmd@redhat.com>
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
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Removes a whole bunch of g_free's and a goto.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> Reviewed-by: Brijesh Singh <brijesh.singh@amd.com>
> Message-Id: <20210603113017.34922-1-dgilbert@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/sev.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index c88cd808410..aefbef4bb63 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -493,8 +493,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>       struct kvm_sev_attestation_report input = {};
>       SevAttestationReport *report = NULL;
>       SevGuestState *sev = sev_guest;
> -    guchar *data;
> -    guchar *buf;
> +    g_autofree guchar *data = NULL;
> +    g_autofree guchar *buf = NULL;
>       gsize len;
>       int err = 0, ret;
>   
> @@ -514,7 +514,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>       if (len != sizeof(input.mnonce)) {
>           error_setg(errp, "SEV: mnonce must be %zu bytes (got %" G_GSIZE_FORMAT ")",
>                   sizeof(input.mnonce), len);
> -        g_free(buf);
>           return NULL;
>       }
>   
> @@ -525,7 +524,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>           if (err != SEV_RET_INVALID_LEN) {
>               error_setg(errp, "failed to query the attestation report length "
>                       "ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
> -            g_free(buf);
>               return NULL;
>           }
>       }
> @@ -540,7 +538,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>       if (ret) {
>           error_setg_errno(errp, errno, "Failed to get attestation report"
>                   " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
> -        goto e_free_data;
> +        return NULL;
>       }
>   
>       report = g_new0(SevAttestationReport, 1);
> @@ -548,9 +546,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>   
>       trace_kvm_sev_attestation_report(mnonce, report->data);
>   
> -e_free_data:
> -    g_free(data);
> -    g_free(buf);
>       return report;
>   }
>   
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


