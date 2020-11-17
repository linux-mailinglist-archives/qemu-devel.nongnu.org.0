Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A62B68CB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:34:03 +0100 (CET)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2za-0003yN-HL
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf2yC-0002qn-0K
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:32:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf2y9-0004jf-NR
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605627152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skD+vE39++X7ruMC2CTEt06xSV+4zvbwGDq/R0H53so=;
 b=XzkYqIVlA37ZLn1vKlOCY14wny2ecZamki0lCoPJOYGynZq9KKT2GVEvuuL64o3WtE1P2+
 LWsIizcFhJzCjUUvGu5iwJcoHZdpnQqMSShtk5OB/whI7uhihpNuEjZyx8pR4dFbLOIDgK
 FBpBABE2j6zCwIrU8DYJSTl5/LN69JM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-3WWgpqWVOlW8Ns9A5JdJBA-1; Tue, 17 Nov 2020 10:32:29 -0500
X-MC-Unique: 3WWgpqWVOlW8Ns9A5JdJBA-1
Received: by mail-wr1-f71.google.com with SMTP id h13so7731801wrr.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 07:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=skD+vE39++X7ruMC2CTEt06xSV+4zvbwGDq/R0H53so=;
 b=OdcfnxIGhCvrGmUxyikZ0/cpO5oa+QcN48IjA0HEf2y3zv6H3XCvSTr2nnowUA3Hmk
 8QzoSNGJjqGmtzDPKRtnBwLQEc76D5OQP6fKyF+J6vMTlRxpdIaPQtfubRPe/0clQkRg
 PYgMZzPVmjbmFzOjIsfwcXftxtiJGNQj732tpynKjyChXPrz4iDk46iMSvX1WujByNzp
 YZyq0hPBkn9bYll0UATlGl8n/i3WJV7VDb1JaEPnAngRqNz6vFHpc4CP4zC6R4nzT08g
 GVv4xmmcR32S3rWLxjeN+8aKr1Q99lvmySGdEMLLFsQDLJSMGvIJxS0HBPqzn1DIsQrS
 4F8Q==
X-Gm-Message-State: AOAM531sTKRAMVixLUUj1MaidkYuTFuOm2ELtczhTyVrt8tB3svRunLy
 W+8ybUc9nGP6bHYtSP3vJvwAySXqeGNN9n8Abm26o0J5akDXAsQ4i0twWT5JVj85XiHMl8bZOk2
 Y2NdJ0QWIBDjkba0=
X-Received: by 2002:a05:6000:1d2:: with SMTP id
 t18mr110346wrx.14.1605627148174; 
 Tue, 17 Nov 2020 07:32:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZY5nhnPjhDh6okNpB6WRWxirpcugnHQw8YIDTOtOA0rZTarFC5fDTpVZY9t28xJXrl/Vc/Q==
X-Received: by 2002:a05:6000:1d2:: with SMTP id
 t18mr110331wrx.14.1605627148000; 
 Tue, 17 Nov 2020 07:32:28 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id x2sm22430720wru.44.2020.11.17.07.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 07:32:27 -0800 (PST)
Subject: Re: [PATCH] buildsys: Help git-diff adding .gitattributes config file
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20201014082209.3712625-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0ee718c8-6f4e-fb90-5e52-7818d5db8bce@redhat.com>
Date: Tue, 17 Nov 2020 16:32:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201014082209.3712625-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 10/14/20 10:22 AM, Philippe Mathieu-Daudé wrote:
> Since commits 0979ed017f0 ("meson: rename .inc.h files to .h.inc")
> and 139c1837db7 ("meson: rename included C source files to .c.inc")
> 'git-diff --function-context' stopped displaying C function context
> correctly.
> We can help git-diff by providing attributes to the .[ch].inc path
> names. See:
> https://git-scm.com/docs/gitattributes#_generating_diff_text
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitattributes | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 .gitattributes
> 
> diff --git a/.gitattributes b/.gitattributes
> new file mode 100644
> index 00000000000..3d2fe2ecda8
> --- /dev/null
> +++ b/.gitattributes
> @@ -0,0 +1,2 @@
> +*.c.inc         diff=c
> +*.h.inc         diff=c
> 


