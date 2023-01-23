Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6106776DF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJseE-00054X-Kk; Mon, 23 Jan 2023 03:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJseC-00054E-Q4
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJseB-0002U2-6Y
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674464266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ichrWNX8Qcfv9LQCT4WpG418h8ezqohOM52/kYhhY4=;
 b=UTV4HwBAyd4x3f7gMizp5E+ItrZHPij7FUQjMVI+IgkUTUwI4aZGz1ZEHQFSNcrR+Z27UT
 Jdwor2SFgRBpQ4lBdgsfpPlYbxjbeW5ZNwzyGpBLycyuky2LjWBSOY2PVdkXaBm7Jiw8hI
 3q9t9gkBLRyoMZVgqOFsNwQtswL4KSM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-6wl92PF7OPWF0qvsGCzc2A-1; Mon, 23 Jan 2023 03:57:44 -0500
X-MC-Unique: 6wl92PF7OPWF0qvsGCzc2A-1
Received: by mail-wm1-f70.google.com with SMTP id
 m7-20020a05600c4f4700b003d971a5e770so7182933wmq.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 00:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ichrWNX8Qcfv9LQCT4WpG418h8ezqohOM52/kYhhY4=;
 b=WR/6kiE/R/G00ovcTTH1EAZ9Kjm4UAQbzU9ZdVrB+NhJV3M0z31/yZt1nKEZdRJ/+K
 LiSg55BtcZ7G2efrbxlpTsYeXPM8iVd2V+G5X2N+KA5NAG5ECSoPI4g4C4v+0iJ7vV3O
 7FlkWMLf8rpK/tGgPHOA+pcEtejgwQuqnd4qDl13DDJdBVHUqivPvpA4A9LUk7Szp9D5
 kb0ZFaULUfCE9LMYqryO8sfyH/FhIrN0b7a7X/kK5r3hFltrHixPGFDiyR0J2nBUr9bH
 hpSULPvTp39zNwSnBLokhBl51W4MBI5BW5ceW0hfMVOsroYq0jgePGVSQkQj6Io7l4Xf
 pq1A==
X-Gm-Message-State: AFqh2koixTGp3XqLGpoU+zGsMfrtrphL4A0w8WTt6xfZEAzodKbGx492
 kkBd/oUMYJugxFO2Yo39CGYY3xnTv+XFkHIQZx/tdHWnqe+z1gZcjIjTVo0kUHI0BalqiPquKLx
 FplvLaUYg+XU4daI=
X-Received: by 2002:a05:600c:1613:b0:3d0:2485:c046 with SMTP id
 m19-20020a05600c161300b003d02485c046mr22883965wmn.27.1674464263340; 
 Mon, 23 Jan 2023 00:57:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuuLyBD7UPs/moGK7ePWHFpHGmebVXivIstDOsPch6Y/7NchRIDEvrQ5f4pLyAfzEr6/TFufQ==
X-Received: by 2002:a05:600c:1613:b0:3d0:2485:c046 with SMTP id
 m19-20020a05600c161300b003d02485c046mr22883949wmn.27.1674464262958; 
 Mon, 23 Jan 2023 00:57:42 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:1100:65a0:c03a:142a:f914?
 (p200300cbc704110065a0c03a142af914.dip0.t-ipconnect.de.
 [2003:cb:c704:1100:65a0:c03a:142a:f914])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003db30be4a54sm10609645wms.38.2023.01.23.00.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 00:57:42 -0800 (PST)
Message-ID: <338cbc9a-4eea-a76c-8042-98372fb70854@redhat.com>
Date: Mon, 23 Jan 2023 09:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Igor Mammedov <imammedo@redhat.com>, yc-core@yandex-team.ru
References: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v0 0/4] backends/hostmem: add an ability to specify
 prealloc timeout
In-Reply-To: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 20.01.23 14:47, Daniil Tatianin wrote:
> This series introduces new qemu_prealloc_mem_with_timeout() api,
> which allows limiting the maximum amount of time to be spent on memory
> preallocation. It also adds prealloc statistics collection that is
> exposed via an optional timeout handler.
> 
> This new api is then utilized by hostmem for guest RAM preallocation
> controlled via new object properties called 'prealloc-timeout' and
> 'prealloc-timeout-fatal'.
> 
> This is useful for limiting VM startup time on systems with
> unpredictable page allocation delays due to memory fragmentation or the
> backing storage. The timeout can be configured to either simply emit a
> warning and continue VM startup without having preallocated the entire
> guest RAM or just abort startup entirely if that is not acceptable for
> a specific use case.

The major use case for preallocation is memory resources that cannot be 
overcommitted (hugetlb, file blocks, ...), to avoid running out of such 
resources later, while the guest is already running, and crashing it.

Allocating only a fraction "because it takes too long" looks quite 
useless in that (main use-case) context. We shouldn't encourage QEMU 
users to play with fire in such a way. IOW, there should be no way 
around "prealloc-timeout-fatal". Either preallocation succeeded and the 
guest can run, or it failed, and the guest can't run.

... but then, management tools can simply start QEMU with "-S", start an 
own timer, and zap QEMU if it didn't manage to come up in time, and 
simply start a new QEMU instance without preallocation enabled.

The "good" thing about that approach is that it will also cover any 
implicit memory preallocation, like using mlock() or VFIO, that don't 
run in ordinary per-hostmem preallocation context. If setting QEMU up 
takes to long, you might want to try on a different hypervisor in your 
cluster instead.


I don't immediately see why we want to make our preallcoation+hostmem 
implementation in QEMU more complicated for such a use case.

-- 
Thanks,

David / dhildenb


