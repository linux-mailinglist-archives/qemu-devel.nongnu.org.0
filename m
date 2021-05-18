Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4F8387508
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:25:40 +0200 (CEST)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livyt-0004A3-65
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livlP-0006xy-Cj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:11:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livlH-0007XI-TK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RydTh/qI9trkRyDj2Dukf81oJBO69m76bQyuguU9NYY=;
 b=YqKlec7r/wvEbFNkrs4HFnK51YOL+NvCxtFAL7Jc4aTfEFZFO/3x/XGXg8MBh+Z7Mr0769
 gKt5x8SSXYMsMIrxQ53D6yOb0q25UFRNGRBkfofwNd8jGHZd8aln7zvSlbLaY5UO06qmcc
 5M7XnKrzpeODpxzAP2InFjOD5v3vl4o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-VPkk5gq6N3OIDouQdk-YHw-1; Tue, 18 May 2021 05:11:32 -0400
X-MC-Unique: VPkk5gq6N3OIDouQdk-YHw-1
Received: by mail-ej1-f71.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so2112048ejw.22
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RydTh/qI9trkRyDj2Dukf81oJBO69m76bQyuguU9NYY=;
 b=tHHKryN+3v9O5DAsdYJoS33EpNNeIPaIUp6z9n6nXPYzxIQtDqv6WCMIMTALug9VUV
 rBEwCLf1j3G03iZ3L+Lw+EOXNB2gbZLYsBXTSHKF2EUrlmRD18GplOqKYysri+uFJ4C5
 HtRcpMcS4oTO6Y+evB6la3DIm8bvnBk4kk6murexDwj8jDi9Ce0lT65FLNtvWhZEldeh
 ABPjK5trwbptfjPnjGPXYmzgkp4T8FzAeF65cUX6rz032OXsYPTf0JtDvF/IDXAdRpF+
 NNr8ttwPFmFj7TrDE3w8Tg7EvKMcUj2lwHdTkLm2TrHxKPvxCTWAnm1grq5e22Ieecpi
 zsyw==
X-Gm-Message-State: AOAM533a3YQ1Q4gLTBVA6BSk3TNLiotgr0l39II07sBLsWAmZLaDz1Ay
 3i2swVzkpNW0dTI4EBkdmUKSffScSKy9EbVenx8PBzijxu2rXk4w9JzIFr8k3x22+m9/41v22x0
 bY+Jt+9Z8qWuCTZQ=
X-Received: by 2002:a17:907:10c7:: with SMTP id
 rv7mr4968183ejb.125.1621329091302; 
 Tue, 18 May 2021 02:11:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkAUI88QyYO/9lZhfxRDq5Wzbujit8lEYMrM8lzJGb4rW0aoLofApNdgajOyfazl+MHmKUdw==
X-Received: by 2002:a17:907:10c7:: with SMTP id
 rv7mr4968170ejb.125.1621329091171; 
 Tue, 18 May 2021 02:11:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r2sm10029164ejc.78.2021.05.18.02.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:11:30 -0700 (PDT)
Subject: Re: [PATCH v2 03/50] target/i386: Unify code paths for IRET
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-4-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a85b8632-5897-a649-d13a-d8dbbd6abe72@redhat.com>
Date: Tue, 18 May 2021 11:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-4-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:12, Richard Henderson wrote:
> In vm86 mode, we use the same helper as real-mode, but with
> an extra check for IOPL.  All non-exceptional paths set EFLAGS.
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


