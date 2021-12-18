Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F6479BC1
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 17:34:39 +0100 (CET)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mycfO-0003My-3f
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 11:34:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myceD-0001re-5c
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:33:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myceA-0007rx-QM
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639845201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7t5H+RB3lYQYx84zMYmSAYgTi0fzJ2i+I9mpju5WRGw=;
 b=CoqLLYoNlW+XnOvP/xik0le9GYT2XWTQarlY/6pjYUTq217RoEvZRni4C9jNRNucPYZLDh
 PL3XVfupjbWsU0mLSZKRzx5hn1k0cowIBrzskS5qH/mR9iL6z6ajEK7xOhfIGwb7YxqaBw
 3aNISyVu9SAKJ9pZQsVYAgJwrdeLQ9E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-O6yHpZU8NBWQvwIsu47wtw-1; Sat, 18 Dec 2021 11:33:18 -0500
X-MC-Unique: O6yHpZU8NBWQvwIsu47wtw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v15-20020adf8b4f000000b001a24c46d6ceso1575722wra.15
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 08:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7t5H+RB3lYQYx84zMYmSAYgTi0fzJ2i+I9mpju5WRGw=;
 b=CBfpsJqID++LHBaqqgGDvrWb0/tVxFyVZ4acRu0FY2wgMkEOqj8VIrhIQqcSPzqVQZ
 +YWW7WdeVGQaN+qJDw/uUQEOjRru+g49FhSU+wrM950cNyblNDcK72ChG6XSpIw9xulT
 11xDOpkDeyFMQSWNLRo5fZf0SqWi0GKsg3N1sBg7ufnlR+/fHHwcKzUPDq6+gt6JsRyo
 kmJT3YqWuib28BlM6NsURbdpCHUyWPByJLb+FISvqCJVUBQyE/8rAujPiRaRcrFQjtpr
 6ViGMCvRMYjD6SjLoccxZ6DGyNNi5wx6Iq/jkUgYzLllp4CJnbZk7jnsx/cY3ZqTnlWV
 ZEYg==
X-Gm-Message-State: AOAM530qVnPyiwhrIK3ONE1HFcqgRAGYha9EUfQ+4qRU55P1GmLBxoE+
 jNrdcgNyJR5uWrrNI1Q0Rq+gQLk0jMlEArSEEM/ZDcy7qLMjFRGnS8vPS/gas4yvRNpP7RBYP83
 4Jq5GvGKVBifH9Kg=
X-Received: by 2002:a5d:6108:: with SMTP id v8mr3862093wrt.661.1639845196973; 
 Sat, 18 Dec 2021 08:33:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz47ERnzrQvU/I0VOlA47aT7/k2/Ymqjq3CxuH9kKhKnlkA65UdiSyGK+rZhTkzqI81ZJWrvg==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr3862084wrt.661.1639845196758; 
 Sat, 18 Dec 2021 08:33:16 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o25sm5174073wms.10.2021.12.18.08.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 08:33:16 -0800 (PST)
Message-ID: <ed66cc5f-cc71-fcf8-3026-6fe775a1c5f8@redhat.com>
Date: Sat, 18 Dec 2021 17:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 00/16] qtest and gitlab-CI improvements
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/15/21 08:33, Thomas Huth wrote:

> ----------------------------------------------------------------
> * Add virtio-net failover test
> * Make qtests a little bit more flexible with regards to reduced configs
> * Move libssh setup from configure to meson.build
> * Run device-crash-test in CI
> * Add jobs for NetBSD and OpenBSD to the CI
> * Test compilation with MSYS2 in the gitlab-ci, too
> * Add new virtio-iommu test
> 
> ----------------------------------------------------------------

> Laurent Vivier (4):
>       qtest/libqos: add a function to initialize secondary PCI buses
>       tests/qtest: add some tests for virtio-net failover
>       tests/libqtest: add some virtio-net failover migration cancelling tests
>       tests/libqtest: add a migration test with two couples of failover devices

On my ASan build directory I'm sometime getting:

Running test qtest-i386/virtio-net-failover
(process:1558675): GLib-CRITICAL **: 16:19:12.556: g_rand_int: assertion
'rand != NULL' failed

From config.log:
# Configured with: '../configure' '--enable-trace-backends=log'
'--cc=clang' '--cxx=clang++' '--extra-cflags=-ggdb' '--enable-debug'
'--enable-sanitizers' '--target-list=i386-softmmu' '--disable-docs'
'--disable-tools'


