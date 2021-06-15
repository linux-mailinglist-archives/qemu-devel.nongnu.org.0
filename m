Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F143A8190
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:57:58 +0200 (CEST)
Received: from localhost ([::1]:36326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9Zl-00026v-VO
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9TH-00051q-HS
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9TF-0001Il-Cm
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623765072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0sxtmrjqqn7TC+Kv4ognqwVLyiuXrudgL6MAltCCAM=;
 b=T7Kw7D0RcK78nx80u5vVIxWkQCArmzjd0EM0HHleDoT3II8f3vmhoqQRykPzBa8sYCUxCN
 Qsf+ieXQwVtQrquLpL0t4nzuHcbGgt9AA8udyRtBwXy9Bf2OECfaehQ8B9MYh2zg+O6s37
 diVOvoTqD954TB1z+keHpivcY8QFi/A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-Yf3qxuvSMSa6tCabuC68QA-1; Tue, 15 Jun 2021 09:51:11 -0400
X-MC-Unique: Yf3qxuvSMSa6tCabuC68QA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so1533704wmh.9
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d0sxtmrjqqn7TC+Kv4ognqwVLyiuXrudgL6MAltCCAM=;
 b=H6K84g2eGFZd9yhc7lmM7nZAYSXJyQRtrPYo9IBumckEefTIrcIVcth5HJ17U+2/Ch
 6WgNuvOul/4pTbJNK62eT6ZsO8fpLDRDJPHrVIMfGj2zXYM4XlGKC4Hd9UfcFPE+FvlZ
 wlrIUDpro6+pf5S09ZRkH68kT5JNkv18bLSx4VFdE0e8JSIPdw8/+VmmbQYE65HUv/UQ
 QL13KXmhoLDQUUGnRcVok/iOVSbJgpJj2fbbXhqiCqtqhUf69kp6N3U3QjWeDgjoQeen
 XR69OnelNCxcZv7CohP0b5nhYxYUthGNMroenrQbZZBrxuwkxjNjoTU003M7rBq5LBcB
 jcag==
X-Gm-Message-State: AOAM5335FoeMUzhJ++i8KUmgrSO5Hq5A7rPkMdJKYEwZBN3rDREB5kk3
 FnZth3l7PwBJkZx9GSXDJKMnkE9f1zswtOkUeVbrIiHPf2YU1LBjzX4wgqW3h0uTTKnPXCI1MVU
 e9mTipnMRoedFh2g=
X-Received: by 2002:adf:f387:: with SMTP id m7mr204108wro.98.1623765070295;
 Tue, 15 Jun 2021 06:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8X3YCIBHUwGjZsWHmEyAtfPT5Fk5tkscqoadtOzotX2nDdZOh85uWtHg6/+YPyP2VhnbmBg==
X-Received: by 2002:adf:f387:: with SMTP id m7mr204073wro.98.1623765069981;
 Tue, 15 Jun 2021 06:51:09 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v18sm20561671wrb.10.2021.06.15.06.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:51:09 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] util: Pass file+line to qemu_rec_mutex_unlock_impl
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e71e7127-bbe1-b3b1-16f6-e4fbdea52f1c@redhat.com>
Date: Tue, 15 Jun 2021 15:51:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614233143.1221879-5-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 1:31 AM, Richard Henderson wrote:
> Create macros for file+line expansion in qemu_rec_mutex_unlock
> like we have for qemu_mutex_unlock.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/thread.h    | 10 +++++++++-
>  util/qemu-thread-posix.c |  4 ++--
>  util/qemu-thread-win32.c |  2 +-
>  3 files changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


