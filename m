Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD794AE214
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 20:17:54 +0100 (CET)
Received: from localhost ([::1]:49246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVzt-0005WH-Dh
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 14:17:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHTFW-0007U1-0S
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:21:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHTFT-0002Cd-QW
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644337305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZE3jukaTSmRSCy80NiUa/hyHw/D0MzK3AnUlxDOFPiE=;
 b=Q5gvE9KCVo3tOB02bW/AjTU0kXGJGnX65SKWKNA8TE+0xQbhQTx5Wr1w5ZImeLYGYS7+xU
 4MpS8zmq0QtYrHIH3RYWwg7s+LuwyJL+e89BfKiAqyq/g8ZTVmGGklvwDhaLqcDH7I5gAf
 jBnx4VV6k2h/0/N+80Yh4fDJVuNDLxQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-FXwkVryKOji7csOnaCnOqA-1; Tue, 08 Feb 2022 11:21:44 -0500
X-MC-Unique: FXwkVryKOji7csOnaCnOqA-1
Received: by mail-ej1-f70.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so5991043ejd.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZE3jukaTSmRSCy80NiUa/hyHw/D0MzK3AnUlxDOFPiE=;
 b=QW6Pb99+p3jqpvfKSCmQnLUzJfjhiykmvZNAxyGDMc8atZLILPhQkD5I9eGF1KP8kd
 YvMzCBS5Xy4DqBjrcMFzwTOXVWKcK7pF04ORL6offJ8lan8OHHuj3xmkRBye+ybQ6NMh
 MFUrc5k3k4no2jhQC3Yu5Nj3nCMzgSgdW1f/G4FOOZGYjQlyTQhbsNuWDvcVnLPnhARf
 NzU3P9mWK45OLJZTYquMWBCABfcr3ui/YjfA1yZxJtTXfU7esgHiLV9C6UPxSibDOW94
 xSb/xwTGr8DT+3rUvnlbn7P6ioxmiu0ICSoxL6ykBj9A3zWM5KQ81mZ3eYCjUBFvLDW4
 H94A==
X-Gm-Message-State: AOAM531XbecpBAIocYmPPBrqC8h/aAjZa+btIUWReKGKOwwxAqndGfuD
 ZINVn7q5zOYzvkzs67NQcYB+2Yw99ZplXmcY7NxCZTlviNb0ihF/kdxWTMcrMv6SXY1rLh31eDU
 18AsuRtlJ6w3UNaw=
X-Received: by 2002:a17:906:58d4:: with SMTP id
 e20mr4283471ejs.769.1644337303409; 
 Tue, 08 Feb 2022 08:21:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNDWAfuo7WZu1TCTCKeCk3canCh3auTsxYItaZzdyk4XK5dhdN9vBL7/ju5K9WT62nXpOspQ==
X-Received: by 2002:a17:906:58d4:: with SMTP id
 e20mr4283459ejs.769.1644337303203; 
 Tue, 08 Feb 2022 08:21:43 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id w22sm4996741ejc.137.2022.02.08.08.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 08:21:42 -0800 (PST)
Message-ID: <90afdf74-ab8a-9bc6-71ef-6c0645566091@redhat.com>
Date: Tue, 8 Feb 2022 17:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Revert "check-block: replace -makecheck with TAP output"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220208124432.84924-1-pbonzini@redhat.com>
 <aba10fdb-c6be-f521-deed-b523bc084073@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <aba10fdb-c6be-f521-deed-b523bc084073@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 15:51, Thomas Huth wrote:
> On 08/02/2022 13.44, Paolo Bonzini wrote:
>> This reverts commit d316859f4e28c74ab8b618895d2a5e0a865d3cf1.  The
>> TAP output is inferior in that it does not include the diff for
>> failed tests.
> 
> What about dumping the output of meson-logs/testlog.txt instead? The 
> diff also shows up there!

It does, but sort of by accident because it's not valid TAP (and in fact 
it continues with a TAP parsing error).

Paolo


