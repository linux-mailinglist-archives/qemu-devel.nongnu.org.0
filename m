Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BEA4D52F7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 21:16:22 +0100 (CET)
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSPCv-0008Pt-6Y
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 15:16:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSPAv-0007JG-Sk; Thu, 10 Mar 2022 15:14:18 -0500
Received: from [2a00:1450:4864:20::32e] (port=46757
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSPAt-0005hI-WC; Thu, 10 Mar 2022 15:14:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so4071832wmp.5; 
 Thu, 10 Mar 2022 12:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2K/OpYAJnCJ0LBCHqCDtZ38b8mUcWaXK6KrIRz0lDr4=;
 b=YrIqXxRL+cXpkMmNINYItLDN5iU4IeN536Bo4M+5Z7pnn6wr0QzaWrR6ed0oABDGWz
 hdrOpRohoK8YJvmYAovs6fvo1z/eOCtqiW0u2IZV2QZO+QyhANz7318NDjDetgB8Opx6
 skE6VOuC60ZO5GgOAkQVDwDvfkuZ4crW9LvdnbL4A7A/EPonzfyb1LmIQqJINp1Q8q0w
 PKcq4+sLfZ9HNYe4d/kQpTPPDhPoJDSYy1P0EMFo8ydiuBQbfOxzrSHRhg0QLX8yFN1K
 LVdY8OxGo05oSkim7P+qJpijiLuaHs/FuHgit+yXcDme7FatIrZe7uLQzHRIH+INFj/w
 b6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2K/OpYAJnCJ0LBCHqCDtZ38b8mUcWaXK6KrIRz0lDr4=;
 b=kA6H2pv0frE0NPUgQFjao/FODxgVqtfEXo0akH4h/Apk6Kp734MDCTG9KcxZR6++W9
 seXVII3ol/7SDheOcxoIFeKdarsB+YHD1AL//5kGHL5LpedocRxy2/QiTeYGLp2tmLSm
 CxP0Qy5s5Vw7zP77hxrUDKt7gh6EZPXkDtjf75C1QTqaSqfi/sdM8u/hU2xfobpcpBuG
 64EEip3r2Vqek8lJu4HgvkZTTVw61wV3v7BDsCWHNcZ5j7SBqR6GkVPEaOulPD2twCYw
 dCU9r25WqOt0bkJ3xrJgOBblIDgc80x1nZ/p0HlmK+IW4F5LMnSD65IbloUhdtVCM8AZ
 5bxQ==
X-Gm-Message-State: AOAM531il6+QUMMgfOBJvLAKI2YWG5E4ZHtl03tDmSEOL4oDWXuZCF27
 BZoFJVbsyioK3R6cvi2mWeU=
X-Google-Smtp-Source: ABdhPJw0rJ2x06trd2Ipw1fUqe1efbFTlukJvA3Y/rv52W5ZBAmYrEzobQPw6J8oSKBtc+wwsUULgw==
X-Received: by 2002:a05:600c:4985:b0:389:cc26:6a68 with SMTP id
 h5-20020a05600c498500b00389cc266a68mr10123653wmp.68.1646943253544; 
 Thu, 10 Mar 2022 12:14:13 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 bi9-20020a05600c3d8900b00389a623c80esm4750130wmb.1.2022.03.10.12.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 12:14:12 -0800 (PST)
Message-ID: <a8997433-dfe6-58f7-d5ca-e0ec3e12b7f1@redhat.com>
Date: Thu, 10 Mar 2022 21:14:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/35] stackless coroutine backend
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
 <Yio4e3FyFHkaZi0B@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yio4e3FyFHkaZi0B@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 18:42, Stefan Hajnoczi wrote:
> There are a lot of details to decide on in the translator tool and
> runtime to optimize the code. I think the way the stack frames are
> organized in this patch series is probably for convenience rather than
> performance.

Yes, sometimes the optimizations are there but mostly because they made 
my job easier.

> Out of curiousity, did you run the perf tests and compare against
> ucontext?

Not quite voluntarily, but I noticed I had to add one 0 to make them run 
for a decent amount of time.  So yeah, it's much faster than siglongjmp.

Paolo

