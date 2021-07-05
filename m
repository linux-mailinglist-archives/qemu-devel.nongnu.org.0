Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EA13BB99A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:48:12 +0200 (CEST)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KGx-0001tm-E4
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0KFR-000135-Fs
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0KFP-0001lG-Re
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625474794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8xk7bpSYjdTEYnCT/kpaRigJNTVc+IE8hJG3mXDyQE=;
 b=WdeEoDTyKnUh5BO1dZ4uZwJuu+fdchO4oSyqCYFm2zg7DhpuKvxlDvkx4FX273vnxNfgsf
 7C9mSlRFgepb7NzDnz74qFOCJRAafZdhsvlqb4YWC/Y+m6oQMoMwbUA6Lz/nTPqt43Lmq4
 WHQmsZ+navULgetmQpq3cQop9hs9bZk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-VKrnclbFO8ax9AChqZG3cA-1; Mon, 05 Jul 2021 04:46:33 -0400
X-MC-Unique: VKrnclbFO8ax9AChqZG3cA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m7-20020a05600c4f47b02901ff81a3bb59so1026474wmq.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 01:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j8xk7bpSYjdTEYnCT/kpaRigJNTVc+IE8hJG3mXDyQE=;
 b=qS8OZNxH6/p+wppVV0lPEv7C4SKxVGjp3TNrXlh+ufWUKjhVXtRthoV47JDjAsi6Gh
 dcYLGLhNU2+wKyptNQoAQ6om97PllrGoGc+O9jOXiGrHmiNVNIJjgpUhPK6k/b+dRxVw
 8hRZVvTCqpW2LxMv7sLi1pUFz7Wf0kTE/XI5HuaakiSDOhEKg8rI0IYAZMSdSscAxxKm
 t0mPIbnBl6vSbKcNm2Xd/SCKaBaA4+mGsWRQaynOkAXTvjegtKIuYt9n79Ey1MsqRkKl
 tvgIDzXUsceltkGg3qv3Q9vt/GrbArWgp5w9BQ/3lhrL13TOxyWRl6NIPEKM2Jin7dUu
 /nJA==
X-Gm-Message-State: AOAM5336B0gQWg8oyEyhBstolq6H+LtK1i1/M+rsK/aI2YnlTchF0ZhE
 cv6ZV/NZ+soccnr6buhKOX3oUkVl/5k8M+W4dR6fdAdZJhJpXGDnAGDBJd5GduHvZmF8Y52Ajnz
 VWkHBVkeBXj7l5jk=
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr14084803wma.111.1625474792747; 
 Mon, 05 Jul 2021 01:46:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy87qWKuROi8VqWemysHe4hFt3SEjpv7KHJxSJ6sWuenpfZggMaV3WIj8Lp/Whp6ZodXsciA==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr14084783wma.111.1625474792527; 
 Mon, 05 Jul 2021 01:46:32 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n12sm11918585wrs.12.2021.07.05.01.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 01:46:32 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Remove /usr/bin/env wrapper from the SHELL
 variable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210705082542.936856-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce2ae677-559c-4e95-2913-4729f43e6110@redhat.com>
Date: Mon, 5 Jul 2021 10:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705082542.936856-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Richard Zak <richard.j.zak@gmail.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 10:25 AM, Thomas Huth wrote:
> The wrapper should not be needed here (it's not the shebang line of
> a shell script), and it is causing trouble on Haiku where "env"
> resides in a different directory.
> 
> Reported-by: Richard Zak <richard.j.zak@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


