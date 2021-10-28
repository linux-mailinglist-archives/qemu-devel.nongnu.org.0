Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6B43E6BA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:00:18 +0200 (CEST)
Received: from localhost ([::1]:47792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8lE-0007ST-SH
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8hL-0002TY-2R
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8h9-00064R-CS
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635440161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8uv77CgBz66coJyjM5P3A9OvsbLYNl5MDvrikcKveFg=;
 b=IfZrfTqgfgFE8tO7HjXdDA5cbatFhXYuvd0hB9NZLarlOZVBVoaDnre2bhibfGrJROLoPD
 Q87Ddif0JF7bhfxGjFKKTDo0eltYeKkuJmxTc9J+U2cfsm1kK0ZO9y5tQrj/CDilbSHx7T
 lPHff7ZSiyzArXM3WcLyA/CNSQKEoEM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-SPQE0roeONCV_Qh20GOf6w-1; Thu, 28 Oct 2021 12:56:00 -0400
X-MC-Unique: SPQE0roeONCV_Qh20GOf6w-1
Received: by mail-wm1-f71.google.com with SMTP id
 l21-20020a05600c4f1500b0032cd163619cso2159290wmq.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8uv77CgBz66coJyjM5P3A9OvsbLYNl5MDvrikcKveFg=;
 b=SLR2lf/if42awHnPRdVvxN0WeDOLin0VC2z1FuC71srlTeQ6TT92B1lOa8Gq5LEncq
 zhOR7+4CuPrqjzO/qzAe6DWy1ePqskTxv4eIvtyl+qoCw57XrYfjcmDncoccYjmi95e9
 thTs4v9IWEQ8U3jp7nVv9Qu5rJXDBIpXyvvQM2i8gkwMq9Fr5xoos0PyLM4wGIoX4nR+
 f2eriq+5HIeHFSNawBEA8Q68Wa5UoX9YgGY/6EenyHE7IHdiqRCWM3305ni+a3GH10fD
 rXFSlekZjKpHE56LUyec2CmOYAfZ9QTW1e6HbYClfH+C3jgRn8G8Pf3WscNmBq1TaHhZ
 3x5Q==
X-Gm-Message-State: AOAM531o9i+Cgo9sO/b6X1gJ8cF8z16SeZFcOEwnloqpxytpgb5z05N/
 iTyeGK9PFEQNqmWyWUCIVB8Q5eXjK9jw94pcBUP48YJCMqAc9bfjPgbx1RbmSfQbT6O3n4P+5Vk
 om0l841Har3QNVV4=
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr2084037wmd.184.1635440159438; 
 Thu, 28 Oct 2021 09:55:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFig6WVtZlP1RTOXKJ0+2rvnWfZzf+L+gJ/Cw/NNdS5ZEc4FlWLgysaccsh8IpVoe5hTLyqw==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr2084001wmd.184.1635440159276; 
 Thu, 28 Oct 2021 09:55:59 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m8sm3507014wri.33.2021.10.28.09.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:55:58 -0700 (PDT)
Message-ID: <40af9528-1734-f758-11e3-f8cf51118017@redhat.com>
Date: Thu, 28 Oct 2021 18:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 10/22] qapi: introduce x-query-roms QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-11-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-11-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info roms" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hmp-commands-info.hx |  2 +-
>  hw/core/loader.c     | 39 ++++++++++++++++++++++-----------------
>  monitor/misc.c       |  1 +
>  qapi/machine.json    | 12 ++++++++++++
>  4 files changed, 36 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


