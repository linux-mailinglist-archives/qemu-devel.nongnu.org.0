Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C872EB399
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 20:47:00 +0100 (CET)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwsIF-0007CU-9Z
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 14:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwsFs-0006ek-Ka
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:44:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwsFq-0006kB-3W
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609875869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0vgsQoqvTQUA4WPjEWBVGISbNwt4yTcHvaZ1w1+OuVY=;
 b=ZVaVVAvwTmS9RRHAEMX6qCVDillcOr4aQ6e5nxE32UbILh0BrbGzFqEmuKGh1/CEh8tBSH
 4rnRhQqT14vt1mS6ZC6OnSeI4ypzEI8QqHL10hxItObGeG2gucYSExZFtV59S5ANQR6P0+
 Th4arXQTOB3tUhqiN4kEWWmshPxhlmI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-zMiC1wqHP_q12RWSdbdwVg-1; Tue, 05 Jan 2021 14:44:26 -0500
X-MC-Unique: zMiC1wqHP_q12RWSdbdwVg-1
Received: by mail-wm1-f72.google.com with SMTP id b184so69609wmh.6
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 11:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0vgsQoqvTQUA4WPjEWBVGISbNwt4yTcHvaZ1w1+OuVY=;
 b=FsMw9o/bR0ui1mRof1GFZ1UqVjYGD5AaksyT3vjcFGNQ6IIKzlV0stRdmogl2/GFxz
 Duhf10GyoVr+eA/tr2Z5C6go9U7StxcoaBR8P+ivIVpVmUILvipgz79IjcSPM5VHMRPP
 kzssF3rdjYeQd3N49rYzIhN/hIAX3P3B5/yYo93BTfYhTv97EtfzyV3MZh1jjrIY4mhf
 kfokao1gNohz1Hir82kJEfhK8jlJJSWi7f0eha5nBulJUqvBN4vvZMxOAKWJ4gnN/rXB
 +wVqOcrqiSB0ypOdhHCGGehkgdsutDbGZKMfFd1BUPVz+O7wNQMk+qBiNpyMhDQStM/b
 s2YQ==
X-Gm-Message-State: AOAM532hAgcej9vI4IYLuVU7jxDHas1ZgRg6RF6rQGBc4GMB7tWfg+9Z
 x6hUs3JOEVRfi5kMZatikkuZ4zi8mWMNpQtgb6D4MYpquxai14UazYrRlVLpEo5qLa6io8wkKBZ
 G1gzFL71SlER9n0I=
X-Received: by 2002:adf:a29d:: with SMTP id s29mr1062427wra.272.1609875865149; 
 Tue, 05 Jan 2021 11:44:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsxtANu100iblEgmlONC87hgri1684NaIYVp45co6KoeBfrKwIixBg9D++HfNcri8G2iZCMg==
X-Received: by 2002:adf:a29d:: with SMTP id s29mr1062411wra.272.1609875864976; 
 Tue, 05 Jan 2021 11:44:24 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id f14sm249499wme.14.2021.01.05.11.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 11:44:24 -0800 (PST)
Subject: Re: [PATCH 2/2] tracetool: fix "PRI" macro decoding
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210105191721.120463-1-lvivier@redhat.com>
 <20210105191721.120463-3-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <05a63a0f-dee5-68b6-5bba-7c74b55ddc99@redhat.com>
Date: Tue, 5 Jan 2021 20:44:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105191721.120463-3-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 8:17 PM, Laurent Vivier wrote:
> macro is not reset after use, so the format decoded is always the
> one of the first "PRI" in the format string.
> 
> For instance:
> 
>   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, \
>                         uint32_t flags) "dev: %p offset: %"PRIu32" \
>                         size: %"PRIu32" flags: 0x%"PRIx32
> 
> generates:
> 
>   printf("%d@%d vhost_vdpa_set_config dev: %p offset: %u size: %u \
>           flags: 0x%u\n", pid(), gettimeofday_ns(), dev, offset, \
>           size, flags)
> 
> for the "flags" parameter, we can see a "0x%u" rather than a "0x%x"
> because the first macro was "PRIu32" (for offset).
> 
> In the loop, macro becomes "PRIu32PRIu32PRIx32", and c_macro_to_format()
> returns always macro[3] ('u' in this case). This patch resets macro after
> the format has been decoded.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/tracetool/format/log_stap.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
> index b486beb67239..3e1186ae9cc2 100644
> --- a/scripts/tracetool/format/log_stap.py
> +++ b/scripts/tracetool/format/log_stap.py
> @@ -54,6 +54,7 @@ def c_fmt_to_stap(fmt):
>              else:
>                  if state == STATE_MACRO:
>                      bits.append(c_macro_to_format(macro))
> +                    macro = ""
>                  state = STATE_LITERAL
>          elif fmt[i] == ' ' or fmt[i] == '\t':
>              if state == STATE_MACRO:

What about the 'else' case?


