Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9133F46C0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:41:12 +0200 (CEST)
Received: from localhost ([::1]:45388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5W3-0007dn-3G
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI5UO-0006JW-GE
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:39:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI5UN-0007fL-0w
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629707966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w1Oe+m/poeXqQ/9DH39vjyZxdFxl8g7Q3x4gHx/xM0k=;
 b=OO+VTcHL6pSH7HQgSJcQHh2nUZ8a+bxWTWXHZIfy+lHv+Gyi+XXXVVedVe3+IP5kZ0bD24
 pSlPpeXmDtfJlmwRV1RRdQrVDrvSCaDKTrIGv3fMvhm7GuJibep278mG5TBvjX4k6WXGV2
 bfM78zuErZ7QjtWPIlHsRmU+2UoM97I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-HWorPL8vPzCFxtqvOkpe6A-1; Mon, 23 Aug 2021 04:39:24 -0400
X-MC-Unique: HWorPL8vPzCFxtqvOkpe6A-1
Received: by mail-wr1-f72.google.com with SMTP id
 h15-20020adff18f000000b001574654fbc2so1474059wro.10
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 01:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=w1Oe+m/poeXqQ/9DH39vjyZxdFxl8g7Q3x4gHx/xM0k=;
 b=O63GiJBC13pUU6u8AKpsxnd8Eigz8ct6Sm6/N5jgwnPFiCzDDUCN8jaWKhqIpR5NPw
 3/SF8w8T26cYCqks5FHKydcqluZ91MlUjX/31wb+cbJVCw/+JxKGbov1w4AWvAshOcEM
 x4k8FP4IgC9WCPXOdeAlGyhML9X3D3jAHbudWvrg2mBPL4OUL249yXaERsk1pwpebpSq
 +SnysiKo1IMdvpO9dFwvrcWtAjCfP8E9wAtHo2kmvpamEGgkTBHVsirR1hblh2b4JNbN
 o0JtFT7X5KSC7RcYGAeY6eYMP8rase+QDnPK5ITFRkUlvlNGO9/HYh9lflPgOTMXw+nT
 c4gw==
X-Gm-Message-State: AOAM5323xrhs0Quyh6QBnCicsbrsZ8Y9BrZb/dTeuZgjcvJg/BblFd3z
 tz2Gb7JPGEYp+d0bBEsr3kB70IUozrLRpVFO4z2p+qH8JbeZUYkUqh4MpPH8CgZzIdCGG+Rbqd2
 dXUA9L7vRYpiTrHA=
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr473573wrs.175.1629707963584; 
 Mon, 23 Aug 2021 01:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtpZRkYg5jwWGe/FuXco/HvrRlpiWlUyl1BZdBE907x6BxIwSsHBf8vXYLB4PzhkoofoCnYw==
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr473556wrs.175.1629707963443; 
 Mon, 23 Aug 2021 01:39:23 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id b15sm14720905wrq.5.2021.08.23.01.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 01:39:23 -0700 (PDT)
Subject: Re: [PATCH] memory: Have 'info mtree' remove duplicated Address Space
 information
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210820105435.3034561-1-philmd@redhat.com>
 <73fa7b2f-fba2-6af0-5cf4-2066d7f625e5@redhat.com> <YSANtgAah4THaxub@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <04276b00-4700-5a4e-e669-8b86b03e2919@redhat.com>
Date: Mon, 23 Aug 2021 10:39:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSANtgAah4THaxub@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.08.21 22:16, Peter Xu wrote:
> Phil,
> 
> On Fri, Aug 20, 2021 at 12:58:05PM +0200, Philippe Mathieu-Daudé wrote:
>>>    (qemu) info mtree
>>>    address-space: I/O
>>>      0000000000000000-000000000000ffff (prio 0, i/o): io
>>>
>>>    address-space shared 9 times:
>>>      - cpu-memory-0
>>>      - cpu-memory-1
>>>      - cpu-memory-2
>>>      - cpu-memory-3
>>>      - cpu-secure-memory-0
>>>      - cpu-secure-memory-1
>>>      - cpu-secure-memory-2
>>>      - cpu-secure-memory-3
>>>      - memory
> 
> Do you think below would look better?
> 
>     address-space cpu-memory-0:
>     address-space cpu-memory-1:
>     address-space cpu-memory-3:
>     ...
>     address-space memory:
>       [memory ranges]
> 

+1

-- 
Thanks,

David / dhildenb


