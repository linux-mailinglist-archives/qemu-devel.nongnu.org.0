Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3872FC07F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:02:30 +0100 (CET)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xCv-0001IL-14
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w8Y-0005sH-84
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:53:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w8V-00042R-Jn
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frHiTKF7DLTEck1gxcFRrZDGzKitpy+njSLsW7VDR7E=;
 b=KNgAx2G6heZk/mhRxaI690BlqClbHfJ/jLhHMnIOQy3ARbhe4xspH7tr4W/ihRMQm2xRLq
 Js5rtFUSXoaN2cy1NobZBruH0mRiwpxOtoJX88It6y2PqSZWbXhTdW+ptmecuwxLFbJh+S
 ryAjVuz7LlY6sXgpQWrRdI/Wb4zU9rI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-1ZTWMyghPIq-zqr3GP8XfA-1; Tue, 19 Jan 2021 13:53:49 -0500
X-MC-Unique: 1ZTWMyghPIq-zqr3GP8XfA-1
Received: by mail-ed1-f70.google.com with SMTP id k5so9827849edk.15
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=frHiTKF7DLTEck1gxcFRrZDGzKitpy+njSLsW7VDR7E=;
 b=Gn2SHmPLZF7XnJskNKEd6Om/d3qI2Fx6Pmy/MeT5OU1C46rw3DccdCmtf99MfXI1vb
 jdtdQa4mt+G/1RaJKCkaBZQ3z2h3L9+oNvRh3ErQy56dR5YhTIRtIGGzVhYZybcxdzgn
 LUHlrce08IsXATxiPvATTziWhUGawxGmg5UkkyVjTQkrhJxmJHcSkWy0cXdJfeE6aAvx
 BneKk8+rH5biQ3eRrFA659z4bZZh/WqzX6UnjeYnNSjzsoNEXvl8k6fcPfAGmHuEz1yN
 fUDCCFlt5SzPJX8Z+QCVQFmTtF060gZI/imI0q2AALgMFoppxu3g1u5/v6uhJsfbpiVo
 tcfg==
X-Gm-Message-State: AOAM532Z0xaZG22BvQlc8KCRjuUqklP1B87umeZrEjmDRTciVQdDHt36
 4gXpm3SWa5Hq3lq0QRZF6PbzrsKruWnK1slVDEs1d0vqLDRJaWwPV2GnJ/CnWbUN57kil0YdIB7
 CcCru/onpdWlmzYA=
X-Received: by 2002:a17:906:5618:: with SMTP id
 f24mr3860880ejq.517.1611082427710; 
 Tue, 19 Jan 2021 10:53:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/POnREhX2Tvk4sKefieKMZovDdpNDYVLLIf8I9mI+UwY/YdHH8hr9wdX6/hqTxsC1/dV3ew==
X-Received: by 2002:a17:906:5618:: with SMTP id
 f24mr3860876ejq.517.1611082427585; 
 Tue, 19 Jan 2021 10:53:47 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q22sm9622587ejx.3.2021.01.19.10.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 10:53:46 -0800 (PST)
Subject: Re: [PATCH 7/9] meson: Do not configure audio if system-mode is not
 selected
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20210119185005.880322-1-philmd@redhat.com>
 <20210119185005.880322-8-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <166ad408-aa3c-7050-d586-6893f80d3560@redhat.com>
Date: Tue, 19 Jan 2021 19:53:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119185005.880322-8-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to Cc Gerd, adding him.

On 1/19/21 7:50 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  configure   | 6 ++++++
>  meson.build | 4 +++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 9f016b06b54..a15bdfb6ef3 100755
> --- a/configure
> +++ b/configure
> @@ -2324,6 +2324,12 @@ if test -z "$want_tools"; then
>      fi
>  fi
>  
> +##########################################
> +# Disable features only meaningful for system-mode emulation
> +if test "$softmmu" = "no"; then
> +    audio_drv_list=""
> +fi
> +
>  ##########################################
>  # Some versions of Mac OS X incorrectly define SIZE_MAX
>  cat > $TMPC << EOF
> diff --git a/meson.build b/meson.build
> index 575e34d88ac..e6c6d1518ef 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2425,7 +2425,9 @@
>  # TODO: add back version
>  summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
>  summary_info += {'curl support':      curl.found()}
> -summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
> +if have_system
> +  summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
> +endif
>  summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
>  summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
>  summary_info += {'VirtFS support':    have_virtfs}
> 


