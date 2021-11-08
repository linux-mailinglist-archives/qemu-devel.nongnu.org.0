Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF224498C1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:50:28 +0100 (CET)
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6ug-0000zD-Ru
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:50:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk6tZ-0008Pn-5A
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk6tU-0008Hx-5O
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636386547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFw9hfJGVsXaNAfDozeYJqDrfqyORV7Zibw8+byrL/Y=;
 b=QeCHCjLTGyw+sR4CQqphZXT44PCrdmA+ljbcaVqZ3kQf9GNAEapGBGhj3L6tFlKhGkMNpv
 0I+nk5zwxnSRoKXn8T5LfpYIJXjYIyMAq4/W1ud/djC5UjhUYA/DtNtRIdNJMffFq+4dNs
 w5i0Vm7EQwUeZLqFzwJcyv4qVW+eNaY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-Qi1jC4peNLKVQ4aHDx-WVA-1; Mon, 08 Nov 2021 10:49:05 -0500
X-MC-Unique: Qi1jC4peNLKVQ4aHDx-WVA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c185-20020a1c35c2000000b003331dc61c6cso4797595wma.6
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZFw9hfJGVsXaNAfDozeYJqDrfqyORV7Zibw8+byrL/Y=;
 b=eGQdYQbYv3KKqMjeHK3iCnYWamrpzpaKeMz9qH/ZpREZQAoOKlJPp6CBSCkm4S5ANN
 3mvAMAaPX5Wlop/Fp4Il0iIn+UyzevZ97a8t28jXARJ6+WIQhGO9XNaK44r9uDJlu463
 PfM7jDQNnG/Is9n2mpBAsEYwVkMp5aIsfo4VAEAHOFJee6DggsVXtjtUXtUfndUHGtDJ
 m5xAD0ISLIR7JMXk9NEK3hub9GaiJNkdkqc8nMmK3n12gktS36lBEBhFQaMuvOu28sON
 wLsS2v8ygZ6TeocTRdBvOmp7KGE6213At5aSgpdLJXnlRWCQp3fb1oBu7c2giU2ByBcy
 r9Rw==
X-Gm-Message-State: AOAM532p1837k+7WbiuWE7VUKafsc2YiTV11LJ4BjaOQKJzSu8ByYwIf
 pexEjLHjqPKGP8Tutr9Jr+0fZBD/D7U3zcH7Q+BkVQ60CORameLL01p2faSRp99B9e8yocOrSdL
 HfuyuDdsOnAGBs3UVpg0PNdhErRGj0mIjkIYyQEmNV20y66M0tfmJ3R3GGrkgIiZ5
X-Received: by 2002:adf:f44e:: with SMTP id f14mr140946wrp.37.1636386543436;
 Mon, 08 Nov 2021 07:49:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhFWr6oA13nc7LJIt2yLpEo6dVTwm52+MvWV7U1TIRbgznPdJ1DEPxn0qed2Mz1tyomkQa1w==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr140922wrp.37.1636386543236;
 Mon, 08 Nov 2021 07:49:03 -0800 (PST)
Received: from [10.201.33.14] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id o2sm18034753wrg.1.2021.11.08.07.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:49:02 -0800 (PST)
Message-ID: <05370fb1-e391-1e03-fd3e-a69996df52fe@redhat.com>
Date: Mon, 8 Nov 2021 16:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] tests/avocado: Remove p7zip binary availability check
To: qemu-devel@nongnu.org
References: <20211106091059.465109-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211106091059.465109-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/21 10:10, Philippe Mathieu-Daudé wrote:
> The single use of the 7z binary has been removed in commit a30e114f3
> ("tests/acceptance: remove Armbian 19.11.3 test for orangepi-pc"),
> we don't need to check for this binary availability anymore.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Based-on: <20211105155354.154864-1-willianr@redhat.com>
> ---
>  tests/avocado/boot_linux_console.py | 7 -------
>  1 file changed, 7 deletions(-)

Patch queued to avocado-next.


