Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052FB69D265
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:54:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUAMJ-00085j-4G; Mon, 20 Feb 2023 12:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUAMG-00085Q-PM
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUAMF-0003Wr-6G
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676915626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHB36tWSKYwcUwW3/c/w5FVuq+x9lYmiQv1LAXG6FEw=;
 b=RMyfvXtB+dLZVPHihTw7z1WW91J5A7UIOlbI+b6URcBJ01W5z8GSg2FZeYrsXLDhNx84HE
 F2PI2lP2ZyJWRfDxAjYLmjtWuGGgG4gcvXfPLzWu1YwdMWNBk3HdlQzE3W1Se9gWazvwgz
 C98bYII8Jp8OwbklOeKRTx/i/fINaYk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-90RFYrqBMtu_84d7py9KAg-1; Mon, 20 Feb 2023 12:53:44 -0500
X-MC-Unique: 90RFYrqBMtu_84d7py9KAg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k20-20020a05600c1c9400b003e2249bd2b4so927951wms.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PHB36tWSKYwcUwW3/c/w5FVuq+x9lYmiQv1LAXG6FEw=;
 b=FHDW3NZs4SboG7SLJNBXqDcqI6IflAz00UKV//DLGqWstpNQEBRVioXKzVTd/uWBmk
 t8q5VS14xfTzh3m38NSwheKP2pnFKCLbHM1tXt+GHjbFbnBF2smiXfMvQmh9sDpQwGPr
 mY/WCL63hO4avAI7UTZD33G1GfqS1WAATTWPnxwcemDBiq3y0yInsZyC7BAPzon9SJlc
 oh8ldMS2ZOWmvOQl2Vn0/BZXmoLVVpplljEm1NZWBum1E+5o+y0XJEX+yIHBNntl72+r
 x+qJ5886ABTe7wSzAYZJeoO09/i21uv7wj1nSR3ctihpWBiabaovVE32tbnHHF6LJp/i
 E6Qw==
X-Gm-Message-State: AO0yUKU79Yptpg4RYm5+9rfJ7cUBIPRXARngo38+F84ovBuygPGmWzJU
 wFsetmUifErFXBgfzk5aS+6Bfo7E4ml8rqcJFtVMfLiSv4HJA5zWAcCLxz6jZaZ41dMvXJJ4wSq
 bVFdNGkOowOH/aPg=
X-Received: by 2002:a05:600c:a694:b0:3df:fa56:7a33 with SMTP id
 ip20-20020a05600ca69400b003dffa567a33mr1598560wmb.26.1676915623048; 
 Mon, 20 Feb 2023 09:53:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/qm1tevMnEln0R+/S5q8svuker8hf8keNXyEoG/chtLFtVfpwwqWIPXKdokzcpai5J+a5AEg==
X-Received: by 2002:a05:600c:a694:b0:3df:fa56:7a33 with SMTP id
 ip20-20020a05600ca69400b003dffa567a33mr1598553wmb.26.1676915622797; 
 Mon, 20 Feb 2023 09:53:42 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 u10-20020a5d514a000000b002c55ed9e314sm654313wrt.64.2023.02.20.09.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 09:53:42 -0800 (PST)
Message-ID: <86be809f-277e-06bb-d969-633106a61467@redhat.com>
Date: Mon, 20 Feb 2023 18:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/7] target/s390x: mem_helper.c cleanups
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: david@redhat.com
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230109201856.3916639-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/01/2023 21.18, Richard Henderson wrote:
> I discovered this old branch sitting around from August.
> I don't think I ever sent it out.
> 
> r~
> 
> Richard Henderson (7):
>    target/s390x: Fix s390_probe_access for user-only
>    target/s390x: Pass S390Access pointer into access_prepare
>    target/s390x: Use void* for haddr in S390Access
>    target/s390x: Tidy access_prepare_nf
>    target/s390x: Remove TLB_NOTDIRTY workarounds
>    target/s390x: Inline do_access_{get,set}_byte
>    target/s390x: Hoist some computation in access_memmove

Thanks, applied to my staging branch now:

  https://gitlab.com/thuth/qemu/-/commits/staging

  Thomas


