Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58DA3936D7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 22:09:58 +0200 (CEST)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmMKL-0005r0-A0
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 16:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lmMJU-00053Y-0b
 for qemu-devel@nongnu.org; Thu, 27 May 2021 16:09:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lmMJR-0005Ix-Bi
 for qemu-devel@nongnu.org; Thu, 27 May 2021 16:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622146139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCQX19/Km4UMiSjh6MMH7/W/hhg+yC8aeoSNFi776+o=;
 b=Xwhi0ZQepQxERzfW5qDBkq2S5Qz/u+ABTln7rrQs31diseKNpq3UGchEfa9qS6kRhdJB/r
 Skqyx63x6krbC6dY09jLoOGOaxePw8B6BPGk5acmtWid+Lh7qmBW0YHP8Z+MO3UE7+G/6/
 swaKYp7wjVa6ftvjTrv1VyiFXdY0jY8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-g0lszqC7Olm-EuqKNv5DGQ-1; Thu, 27 May 2021 16:08:57 -0400
X-MC-Unique: g0lszqC7Olm-EuqKNv5DGQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 da10-20020a056402176ab029038f0fea1f51so881531edb.13
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 13:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YCQX19/Km4UMiSjh6MMH7/W/hhg+yC8aeoSNFi776+o=;
 b=TKnec/if30CJEYDI237EzKiriy9seuVwTNDbnPUlzo/UjnjfCJZ1wWPM366cNfYBBw
 Q0iugpnu2djS5hK16OvnLpL1L4BHkxNtKRcdOqVeahhqsoGL7EJhTlQX41FoyyU6mF48
 TfCGdM+9SxmMvqeMr/Zv4hDk6X5Mt+WQo1X0G0Sng2TtJjueua3d6WcAYLFf10H9FXKX
 2SXRRZf4Lp1CSOP0Rx2LfJyI93kbuDyYamWwhk/QMAenH3h9QQKEmoZDtrb3dAmPX8a+
 TyyT8uq9eP+JChWf0V2sgPEc60FC1z9MfgHX9gDx5oCdkg4PcE5LcJhOX6OAvYhbusRW
 N73w==
X-Gm-Message-State: AOAM532vNN+UGh8yGTzYWF76r+QEijwZ5ad7Zwq9AdIwL7oCMfoElxJ6
 0NXlNo7IihBtdXMT7TfBEiwwvnnYFb+AaO1A2rLaA7XknJrN/W4ImowEg22jUG+w6RVgBEmOV0R
 sijGNe/IZ9fgtNj0=
X-Received: by 2002:a17:906:c010:: with SMTP id
 e16mr5786348ejz.214.1622146136391; 
 Thu, 27 May 2021 13:08:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOKCzf3DoJnM2z1yAsskeftqDNxg4swKwTRHSp65SVr9slwJ+mpdi8tyZ+TpAkhBe9AJ8Ymw==
X-Received: by 2002:a17:906:c010:: with SMTP id
 e16mr5786333ejz.214.1622146136190; 
 Thu, 27 May 2021 13:08:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j1sm1613368edv.14.2021.05.27.13.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 13:08:55 -0700 (PDT)
Subject: Re: [PATCH 3/3] meson: List modules built in summary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210525104648.4060904-1-philmd@redhat.com>
 <20210525104648.4060904-4-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <09ce6543-e41b-99ff-ce4e-7832e626ba38@redhat.com>
Date: Thu, 27 May 2021 22:08:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525104648.4060904-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/05/21 12:46, Philippe Mathieu-Daudé wrote:
> +  k = []
> +    foreach m, _ : list
> +      k += [m]
> +    endforeach
> +  summary_info += {d: ' '.join(k)}

Perhaps:

foreach dir, list : modules
   if list.keys().length() > 0
     summary_info += {dir: ' '.join(list.keys())}
   endif
endforeach

Paolo

> +endforeach
> +summary(summary_info, bool_yn: true, section: 'Modules')
> +


