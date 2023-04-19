Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735526E7330
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 08:25:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp1E7-0003m7-Ji; Wed, 19 Apr 2023 02:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp1E4-0003ld-VX
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 02:23:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp1E2-00062A-JA
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 02:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681885408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8EHZb7undBtJFI04OxVRLhrjHZ623x1IfNB27b3/z/Q=;
 b=YmFhPCj+q2P1X0462Wv1jR25cCg+/hQUzEWdQRW3FEauVbaf7ZdZLDZW8qHb7x1TP5y+xz
 qe+aGN77QSHw3HIcJHyS0pQRD1U/KLJ+URc5PoEirI8XfouGKKdvLplfs+inCTZ+W4vH/A
 asj7EKoUUNf2EGDw0BzfqsJalRYAtQs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-ZfoReUE9NfmEtj3D5Uz41Q-1; Wed, 19 Apr 2023 02:23:27 -0400
X-MC-Unique: ZfoReUE9NfmEtj3D5Uz41Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg10-20020a05600c3c8a00b003ef7b61e2fdso603598wmb.4
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 23:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681885406; x=1684477406;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8EHZb7undBtJFI04OxVRLhrjHZ623x1IfNB27b3/z/Q=;
 b=W7mD7aSwMFxZkPCX71guKVWM8BVJ/k+lj6/1kZYpnTZ/k66BF771cT8/PGQPhKaRWv
 gIe6xoORXwiutKJuxmkJlnkZT9liB7PfIZ6Ve5zQVMsHCGWunzSaXZlN5Xu/WHudyMux
 bm9nuao2KRWB7StUALkKU/hmK6QVbrKJOe82pkqICMzOCPywHmkIYi4KUA+1ZCqLKyja
 vmK+TvFrfcBO1TQEJPCveFom3qUPKrJuDKVaKOTnKDuxwCmMxJYBPjlaMz/rYIb2t9wG
 MMAI5oefwUmVekZVmeUbyt4vjB4pG3FbG4vwFyDXnEjaqmdr5WY7DM+BkEvcJDHgyo/c
 R6JQ==
X-Gm-Message-State: AAQBX9c8QQ/7j+cfr4h9gef5lRQdw+QfcR+KPCRHvP16qXuv4SJ8+HGj
 fxt/QzOcxA68/0dkeWHqHS7II/6t1Nv7rWH7fpxAwqSG3+Xe7H3bJEqPaPJE6oiDpbHXMklbCKd
 /eriZdL+5WpPU8/I=
X-Received: by 2002:a05:600c:2148:b0:3f1:69cc:475b with SMTP id
 v8-20020a05600c214800b003f169cc475bmr11443935wml.36.1681885406428; 
 Tue, 18 Apr 2023 23:23:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350a/TZDuNmJp9V5vgmY/MOEoMdLAZNP8d/gr/Md1F9diwLVgO4yf0EiV2QOsV7XHZE6pnylJFQ==
X-Received: by 2002:a05:600c:2148:b0:3f1:69cc:475b with SMTP id
 v8-20020a05600c214800b003f169cc475bmr11443913wml.36.1681885406127; 
 Tue, 18 Apr 2023 23:23:26 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-78.web.vodafone.de.
 [109.43.178.78]) by smtp.gmail.com with ESMTPSA id
 k1-20020a056000004100b002f5925c7cabsm14822460wrx.75.2023.04.18.23.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 23:23:25 -0700 (PDT)
Message-ID: <4b9d16e8-a2cb-1c78-7d4a-cdb10adcd522@redhat.com>
Date: Wed, 19 Apr 2023 08:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] .gitlab-ci.d/cirrus: Drop the CI job for compiling with
 FreeBSD 12
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Kyle Evans <kevans@freebsd.org>
References: <20230418160225.529172-1-thuth@redhat.com>
 <CANCZdfpzw10B_cyV0mmbkE94GKTBVJg6BVZ2csjcMCur07nseg@mail.gmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CANCZdfpzw10B_cyV0mmbkE94GKTBVJg6BVZ2csjcMCur07nseg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/04/2023 21.46, Warner Losh wrote:
> 
> 
> On Tue, Apr 18, 2023 at 10:02 AM Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> wrote:
> 
>     FreeBSD 13.0 has been released in April 2021:
> 
>     https://www.freebsd.org/releases/13.0R/announce/
>     <https://www.freebsd.org/releases/13.0R/announce/>
> 
>     According to QEMU's support policy, we stop supporting the previous
>     major release two years after the the new major release has been
>     published. So we can stop testing FreeBSD 12 in our CI now.
> 
> 
> 13.2 was just released this week, and the FreeBSD project will be
> dropping support for 12 by the end of the year. 14.0 is up in late
> string / early summer.
> 
>     Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
> 
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> 
>     ---
>       We should likely also update tests/vm/freebsd ... however, FreeBSD 13
>       seems not to use the serial console by default anymore, so I've got
>       no clue how we could use their images now... Does anybody have any
>       suggestions?
> 
> 
> I should look at this... It should still be using serial console by default...

I did some more tests ... looks like both 
FreeBSD-13.2-RELEASE-amd64-disc1.iso and FreeBSD-13.2-RELEASE-amd64.qcow2 
have serial (and ssh) disabled by default - but there is a 
FreeBSD-13.2-RELEASE-amd64-BASIC-CI.raw image now that has the serial 
console (and ssh) enabled by default, so I think we could use that one for 
our CI tests.

  Thomas


