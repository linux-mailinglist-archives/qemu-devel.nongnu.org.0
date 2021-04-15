Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5264036054F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:10:59 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWy1a-0001JN-12
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWxzL-0000gZ-Et
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWxzI-00050y-2B
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618477715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CICt9GKgaBFnG6Cbt8na0RFYpvFcKO6erU6t9BYOVD4=;
 b=Ir2KnMCV+lsOnbPyBSPMmwNDPdN51KIwHfVJ1z8jGtkXS2NoQiOmab1QYjfqUqZ5hK+ooX
 oL/ZBFAo3Z3m3UtI7eWWeJUmjDe2x1X9zFDMGzoWTlcX8ALnjQ0iFoVy5YDVHRO2VKAJfT
 vKHy3idKgobxZwYxFDPkFAOvcd3g2LE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-v0BGViXmP3qUVSGFbDLBWg-1; Thu, 15 Apr 2021 05:08:33 -0400
X-MC-Unique: v0BGViXmP3qUVSGFbDLBWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j4-20020adfe5040000b0290102bb319b87so2437791wrm.23
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 02:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CICt9GKgaBFnG6Cbt8na0RFYpvFcKO6erU6t9BYOVD4=;
 b=fQC6jjTWMXcxcpiP0D+zt7LyCG8am036hWy/qdWpjE5iX3aBJcNWvBllqQRzB4lQD8
 Rm5vIiKtAUUAH+d9zyhk0Mnj4aXHbXvOIWFkdNTSyBRgVxds+iV8nT7a+2/uC9rFEYqY
 GFxI1S4ATusd+fNoj39PKwCrsAXL//8c+0Kbi0KghEibI89gN5kt3XMVZaQeI8SKORVs
 h4ldD/ibQpZBI0nqeoKKsZbHJ5fELlcph7aODyg8lH+Qb531tfE+qzK/KB7WuNiKswVi
 0i1PEjbwZX6pAE2j1XgViebhWM4Lc7G7rUddXy6QveOA43MF/zk/9ryRh6wbZzKcgQCh
 r4uQ==
X-Gm-Message-State: AOAM5324RPg3LV5N2Wz6bI+1IVLMQzgMtskG+aBua98JhtdQJZmN3G0K
 F9+dOKnhj0xR+0J39coeRhrruKsh/LZ+faUjmFupaIbcAZCM6rz5kU/9z3HZev2+oBsV3OGSNou
 yfC4Tnp7rVH9CGns=
X-Received: by 2002:adf:e608:: with SMTP id p8mr2361655wrm.249.1618477712384; 
 Thu, 15 Apr 2021 02:08:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydvKYY9ha5adomnnQPFhBb9jJ6C9dcmHQZKE7fw4b91TGuGU0wswJ3PiYJc2TVEfdK/EWYfA==
X-Received: by 2002:adf:e608:: with SMTP id p8mr2361622wrm.249.1618477712089; 
 Thu, 15 Apr 2021 02:08:32 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c9sm2040561wrr.78.2021.04.15.02.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 02:08:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] util/async: add a human-readable name to BHs for
 debugging
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210414200247.917496-1-stefanha@redhat.com>
 <20210414200247.917496-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2dd1abe3-4061-c45b-cb85-5d3f190b50e2@redhat.com>
Date: Thu, 15 Apr 2021 11:08:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414200247.917496-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, eric.g.ernst@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 10:02 PM, Stefan Hajnoczi wrote:
> It can be difficult to debug issues with BHs in production environments.
> Although BHs can usually be identified by looking up their ->cb()
> function pointer, this requires debug information for the program. It is
> also not possible to print human-readable diagnostics about BHs because
> they have no identifier.
> 
> This patch adds a name to each BH. The name is not unique per instance
> but differentiates between cb() functions, which is usually enough. It's
> done by changing aio_bh_new() and friends to macros that stringify cb.
> 
> The next patch will use the name field when reporting leaked BHs.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/block/aio.h            | 31 ++++++++++++++++++++++++++++---
>  include/qemu/main-loop.h       |  4 +++-
>  tests/unit/ptimer-test-stubs.c |  2 +-
>  util/async.c                   |  9 +++++++--
>  util/main-loop.c               |  4 ++--
>  5 files changed, 41 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


