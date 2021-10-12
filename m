Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0157542A723
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 16:26:26 +0200 (CEST)
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maIjX-000438-KU
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 10:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maIfH-0002Ku-Hk
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:22:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maIfD-0004t8-W5
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634048513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UW2Pl7zz9OhHvw34S9iCkPX/LovqQuIH9slOpqdT/Yw=;
 b=Yqc3o+kbAT/Uemyl+d7Xy5Ixt35nB4Ty4y9ypLTUebuXbjQA+iuodDkIWGGGeENAZISPmE
 FWdZzHQvvkYKQIjSQ34nuR9axaJfgzzEQ/6SvzxOqbHhciggzcxVU8aqVmdlVcUNmhsYPd
 gbZJZeFAGK2nHTR2elEGtwQVOYEaYs4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-wccboEG_MneiSDJS0RDW-w-1; Tue, 12 Oct 2021 10:21:48 -0400
X-MC-Unique: wccboEG_MneiSDJS0RDW-w-1
Received: by mail-ed1-f71.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso59094edf.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 07:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UW2Pl7zz9OhHvw34S9iCkPX/LovqQuIH9slOpqdT/Yw=;
 b=nQcwQ/ReaXktnOVEwDJCmYNsaV6f8d6WxobaoDD+4F2nCFuU5BAAaJu9HQdZOp69C1
 wemhPobufI+e6I96UVioNHgFsLMtfyL3KX4bgIhgjU43CHpEsgYJmkL3tYCB/V4nFyPV
 S/9WL8n6xvMcUEWe2Qyb7+x9OLNJJiIk0o3V5yv6jaYNwuUYlmxS1xgJeOsLkBQdaQaP
 rFr3J73eavSJprQHZTV3dJlyor8sUZKKbgte6vgxre2B6FyqwC9mw6HbnMD8d5/mRA4L
 g5ESsgRoPQhoq8p0svhk5RQNGCbmSdFqoDuWCVSv4/1BMiB+rp/60fxNLNee2mu6Z9x0
 GcUQ==
X-Gm-Message-State: AOAM532jdma0eSYb5pwZy4Dy8XTyd/bazaITWiJo2mFf+lFQEPaKfd7I
 HkSL7MHsFu9KW//TLlyHCNNyXamofT1LTTyhzFsVBMF6XKqy6a/8swS2morxyoUoS8D3J+839io
 o/bPE8HYi1XxUrAI=
X-Received: by 2002:a05:6402:2552:: with SMTP id
 l18mr205575edb.370.1634048507384; 
 Tue, 12 Oct 2021 07:21:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywtBVrWw+N6gFap/M7PWN/DDeOPR8TQUnsolakMtpISffq4zfKUG1dFhudYrTTnT79O8Rydg==
X-Received: by 2002:a05:6402:2552:: with SMTP id
 l18mr205554edb.370.1634048507193; 
 Tue, 12 Oct 2021 07:21:47 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id e7sm6399420edz.95.2021.10.12.07.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 07:21:46 -0700 (PDT)
Subject: Re: [PATCH v2 15/24] configure, meson: move libaio check to
 meson.build
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-16-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <95ae565e-3bbb-e33b-b1c5-42b47c22e431@redhat.com>
Date: Tue, 12 Oct 2021 16:21:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012111302.246627-16-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2021 13.12, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20211007130829.632254-10-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Remove one S-o-b?

> ---
>   block/meson.build |  2 +-
>   configure         | 31 ++++---------------------------
>   meson.build       | 10 ++++++++--
>   meson_options.txt |  2 ++
>   stubs/meson.build |  4 +++-
>   5 files changed, 18 insertions(+), 31 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


