Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E431342E86
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 18:10:01 +0100 (CET)
Received: from localhost ([::1]:33428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNf6t-0004IU-Na
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 13:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNf3e-0002Uw-Hq
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 13:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNf3a-00074L-1k
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 13:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616259991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkI9l3f+FlH7vevFK+TVLMOyEs/A1FxcjP/kdlkbnZw=;
 b=MUTtPol4mZKuOR48vJ1e1vsrcrIESAdrK2f2AV+EutuBwyAd2F4T9CYP4W5Dadg1CNSmKJ
 REBY4OsuGwetNlk1l5GLt/dT49aXAGL1yq/Ry9JGSiZALKc874YtdeUDWZpbN3zyTDkC7n
 twoL4hXU5Gli7mNglww+3naO7+Hg5Js=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-TCBI1hExNA-IdlkPVw6Dsw-1; Sat, 20 Mar 2021 13:06:29 -0400
X-MC-Unique: TCBI1hExNA-IdlkPVw6Dsw-1
Received: by mail-ed1-f72.google.com with SMTP id h2so24620581edw.10
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 10:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dkI9l3f+FlH7vevFK+TVLMOyEs/A1FxcjP/kdlkbnZw=;
 b=ZgJzhVMDJ8pkxxLQXkavq5R2Opr3qINSxo3olABN7ThJ+srolZkL3p8pR9w0/VSKp/
 EWSjs9I2hTlm4KbsR7ZkRd0JZ4d2bqNMkWJAfJTDH6pNAGTIiFpN/RATiG3jRD+YVy84
 omFcLe4DuHhYqjhLu2ILLlfF3Zq8yd3Am1gemjJhOx/3w3hontm9Ns3TXnlph7QSGIjU
 FReV2UiiIrqhGG5mVhsIWCFYPU3zQNiC5PnnMmBQxC2cSaa39/0M+ITqfiCBQVatV2cR
 u4146ThEpxApa+hIpJ3sBB+7K17kyXl0k7WpnjyfzMLXHg0KK9t+tmXwgZGOWrZnWov9
 4T0w==
X-Gm-Message-State: AOAM533HgRF5HafJUiakRGXiJf2SVHz+D0o0fFeNb57u0PJcy92wLW2n
 DZajYjziYNfruxvH7EdKoE9XgnOlWnPnMAx1Rrm8axjuBOSwFyQ2Fn/8aRQmjRVmbdVXOdqGWpb
 WpYtmluTuBiMUi7Y=
X-Received: by 2002:a05:6402:440d:: with SMTP id
 y13mr16513938eda.316.1616259988310; 
 Sat, 20 Mar 2021 10:06:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKlwSgcbcIznLDhJVFA8j33axw7gxPwmhfexqpAKgp6YNYYMimTW3uTWVW7/2zZp/jhMlxeQ==
X-Received: by 2002:a05:6402:440d:: with SMTP id
 y13mr16513904eda.316.1616259988012; 
 Sat, 20 Mar 2021 10:06:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cy5sm6505171edb.46.2021.03.20.10.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 10:06:27 -0700 (PDT)
Subject: Re: [PATCH] meson: Propagate gnutls dependency to migration
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
References: <20210320164730.33285-1-jrtc27@jrtc27.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <87f34651-8726-398e-31bb-3df7e8fac0dd@redhat.com>
Date: Sat, 20 Mar 2021 18:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210320164730.33285-1-jrtc27@jrtc27.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/03/21 17:47, Jessica Clarke wrote:
> Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
> for softmmu configs, which pull in migration's use of gnutls.
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>   migration/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/meson.build b/migration/meson.build
> index 9645f44005..6fa2f8745d 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -24,7 +24,7 @@ softmmu_ss.add(files(
>     'savevm.c',
>     'socket.c',
>     'tls.c',
> -))
> +), gnutls)
>   
>   softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
>   softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
> 

Hi, can you explain in the commit message the compilation failure that 
is being fixed here?

Paolo


