Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C444DA8B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:33:32 +0100 (CET)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlD10-0002Ln-9a
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:33:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCza-0001dl-3a
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCzW-0005Z5-TC
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636648317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1tU56rs5tve0TkrOkM3Lr3dB457u1yjTLvAZd8CyFH4=;
 b=F74YdNvsdMplVB9bWDlsyGKgFolIx5VRcLxGaiX2ITaXAQvVItmPdtiqgLrzP9vLpIoxbc
 8k8ezYwKbpsDTlWffoNzwCy/ijvbwxaplyapT9SGOvZjIqPhNFfzZmJphrGgKBSqgZlUQS
 bJwciAGtIJ3JViTvqYIRBYDp+kEcN68=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-TLSaJ8GSMU6_q0GsG5eb7g-1; Thu, 11 Nov 2021 11:31:56 -0500
X-MC-Unique: TLSaJ8GSMU6_q0GsG5eb7g-1
Received: by mail-wm1-f72.google.com with SMTP id
 67-20020a1c0046000000b0032cd88916e5so2962195wma.6
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 08:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1tU56rs5tve0TkrOkM3Lr3dB457u1yjTLvAZd8CyFH4=;
 b=8Fz4VW/LfTWtPZDBVDh0GeJRi7u0T9vSeG7xZTnFf1DZVXz61k17PlODUW1j68JFHY
 YRLt7gr6uo9sFOUxfjF1ve4rUKHHdXAFTaBueLvuDAMh74bPsLN12mwLmyK1zHVJhmd9
 So0SSTAbODTzAUmPcHueA/V4CJRD4/iNNSx6sJ4MzASnUBQr3THC31uVZnwm3d28qxD+
 iEEAiYHwSnF2qfH4xuVGuvj1JqHlyHpDSNF7/LKFeYlilZlqB6D+E3D6k9hUH5eL0sk6
 fjNYt3izFIm1rZPQX+9KhiYS5g3qbwunDlAUwWbMN4Aanvx8M0x/EOLJc1rRDgkJ2GqL
 00YA==
X-Gm-Message-State: AOAM5321Aywd8fpeibO94kKUQqV3jLyw7XXLs72B2NgFWanBLl6DLEvi
 0fmXx08NmChccywfNpQNux3arHXGWMypRhNhQGT98KuZWa0NXNpgXrfJIRUb+ODMv1uNw+2MOI2
 VXEkvAY9YtetzWUA=
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr10129906wrz.215.1636648315167; 
 Thu, 11 Nov 2021 08:31:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxT00AewSKgQhNblZ4vzUG7IdLtAArqoDzYQ5sL+HCWB/kaN2k7VbKmuGK0OwlwThJmTo5hCw==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr10129876wrz.215.1636648314968; 
 Thu, 11 Nov 2021 08:31:54 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j8sm3267400wrh.16.2021.11.11.08.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 08:31:54 -0800 (PST)
Message-ID: <237bec88-8e2c-de85-bb09-c2da34153935@redhat.com>
Date: Thu, 11 Nov 2021 17:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/5] kvm: add support for KVM_GUESTDBG_BLOCKIRQ
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-6-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211111110604.207376-6-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mlevitsk@redhat.com, cohuck@redhat.com, alex.bennee@linaro.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 12:06, Paolo Bonzini wrote:
> From: Maxim Levitsky <mlevitsk@redhat.com>
> 
> Use the KVM_GUESTDBG_BLOCKIRQ debug flag if supported. 
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> [Extracted from Maxim's patch into a separate commit. - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


