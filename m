Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3E43A4782
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 19:10:40 +0200 (CEST)
Received: from localhost ([::1]:52466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkg3-0003JX-Tj
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 13:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrken-0002cM-5e
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:09:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrkej-0005JB-NT
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623431355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNTbN+oGtcqm2EAIFz+GPRVSRl8P2ijGdqYSMGPvAu8=;
 b=OQr7xxevSCQ9dViGNxUs18lXy6aU2i+yJ1yOnkAFulxvRPonnnFZ9tEuraE2y1HKtQxRUI
 M78yD7f9EOrVkXXbIj41XxoMn9dInh/o5j/SxpPI508lJOAnmDqu9S68whCodLoz+ALw2L
 LsYiStGh2GIC+47O/nJzpgW82kixe7M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-bsc0gmodMMWlFzJ4tPhHqw-1; Fri, 11 Jun 2021 13:09:12 -0400
X-MC-Unique: bsc0gmodMMWlFzJ4tPhHqw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso2913326wrh.12
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 10:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SNTbN+oGtcqm2EAIFz+GPRVSRl8P2ijGdqYSMGPvAu8=;
 b=UVXSVhYGHeqFGxkZ9Ew1hDp4Tg3giNPRIRSuj1fyxfaBMk20zbSAnDb5T9MGxSDQKF
 tfEEZJ2b/C3R8Q+E5pykPUiSWM8m94I66WwA3/wF3no/2RJhdAPCtkgoAgZ5he/jEJc5
 5Wslb+Xr8a03TpqDHY43ftzLRJGq88Be80GPabYio2evUrSxrerg9PYiagDgUVdxF4vu
 Pyamu1RCU5knLU7q7kGHVqlbTADQa4UsaydY2NGuKpVExm9pYE10r6QDNMkEIwMl9xWn
 hQ4RU/yXn9i4gB+n1wEtPbA78xEoi2QPRPVw9NYckyx5dvAoCWqKmtSQKIVKd1xO43EX
 LfqQ==
X-Gm-Message-State: AOAM531YHJ3wmh7Ks97qb9YGh/y025Zq+1vE2EKxicssTMwmz40tO6jp
 I1xO/QJhR0AavSYyGUi6ZNsGG5RXIqJ9FWWpesExIc/VnRjbQgZaTZCGOrL5bPYq9bzzXxNzw4n
 uW9dC9ZpBTNLPBlpcJ4l5paZZyV4ClYKK0AgPolY6r4emH2N6dDA4oZoA982OoQGZvt0=
X-Received: by 2002:a5d:6d05:: with SMTP id e5mr5331330wrq.154.1623431351285; 
 Fri, 11 Jun 2021 10:09:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze4CacQBQ19PPPCIjSbk6k6kFyqIkBL64vnIYAWnZ7gH1zHCnVuBD77D1cKjUJWjZLdI7AVQ==
X-Received: by 2002:a5d:6d05:: with SMTP id e5mr5331302wrq.154.1623431351030; 
 Fri, 11 Jun 2021 10:09:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 25sm12817635wmk.20.2021.06.11.10.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 10:09:10 -0700 (PDT)
Subject: Re: [PATCH] configure: map x32 to cpu_family x86_64 for meson
To: David Michael <fedora.dm0@gmail.com>, qemu-devel@nongnu.org
References: <878s3jrzm0.fsf@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5053818c-2986-ef8d-9acc-f7dc3d0d3c39@redhat.com>
Date: Fri, 11 Jun 2021 19:09:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <878s3jrzm0.fsf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/21 14:28, David Michael wrote:
> The meson.build file defines supported_cpus which does not contain
> x32, and x32 is not one of meson's stable built-in values:
> https://mesonbuild.com/Reference-tables.html#cpu-families
> 
> Signed-off-by: David Michael <fedora.dm0@gmail.com>
> ---
> 
> Hi,
> 
> QEMU fails to build for x32 due to that cpu_family not being defined in
> supported_cpus.  Can something like this be applied?
> 
> Alternatively, maybe it could be added to supported_cpus and accepted
> everywhere that matches x86 in meson.build, but upstream meson does not
> define a CPU type for x32.
> 
> Thanks.
> 
> David
Queued, thanks.

Paolo

>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 8dcb9965b2..4478f3889a 100755
> --- a/configure
> +++ b/configure
> @@ -6384,7 +6384,7 @@ if test "$skip_meson" = no; then
>           i386)
>               echo "cpu_family = 'x86'" >> $cross
>               ;;
> -        x86_64)
> +        x86_64|x32)
>               echo "cpu_family = 'x86_64'" >> $cross
>               ;;
>           ppc64le)
> 


