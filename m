Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8D94DC4B7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:21:48 +0100 (CET)
Received: from localhost ([::1]:43296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUoCO-0008WI-OG
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:21:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUoAQ-0007NZ-OW
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUoAO-0007cK-Qz
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647515980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPc2cKY2xBxJbg/ju6vYE+mkZaXJh1fe2W9OvcdZixo=;
 b=DH7unHvTr/a3nz57rZfQ21SNfoO8/I4vWOvsneiEeal3rp8qhiCq2vGz7dlcFClk6KScej
 oAKLF9fbtA16jqkGyLaFW0Q9sO1ivbeVJAtZQ3ib3prs4zxgdylB7Llae2v6m//ullQttB
 El0A8zTT2lKNE/r6knZY+PD+jcXhoxc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-7R_eDCLvPqevZ3Ri_bSfBA-1; Thu, 17 Mar 2022 07:19:37 -0400
X-MC-Unique: 7R_eDCLvPqevZ3Ri_bSfBA-1
Received: by mail-ej1-f69.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso2724597eje.20
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UPc2cKY2xBxJbg/ju6vYE+mkZaXJh1fe2W9OvcdZixo=;
 b=AFiJamNRo11q6QPnGi04U4ABQ3oABNgS4f1/GVwFAZtPvgGbUqE3RjjQWTNysm9EqZ
 bE0FQOmGDkyfrsdFlmZ5bQz8Wdnb/ycN7IUm8O1NNlP22LOBlEYvdlZfDUD30FErySKw
 a/LsphSZ6kwf6L93MCgtV0geapCtHNrvmWkL44iLKUxokqKXdr36aBb9tHv7nGIquWhh
 yniCjWjfE0HOM07WYkel3lHYgw3SHup9fOj3YQtS8ckAkPfjd+xG0D71BPdyd5hELHvD
 YKgMyhv5gR8a4mXvrxlhO17zN/emcg4DUhN2lql0K6t6IuSH9XoULoKgdvuZDrd85L8U
 wPGw==
X-Gm-Message-State: AOAM531+NpuJ5wFds4SuOYKaf0K2STzdJYK6Q3bx5quPC0s7GLs094QI
 LE4/l0Yqd3e+UjKAahg8HUFe9w5Q3E6eA+8NvfJcfodteDie3jLA5Fruom0qhTjvQnMZSuGGfY6
 XzccafEv7/dogl+0=
X-Received: by 2002:a17:906:3042:b0:6cd:20ed:7c5c with SMTP id
 d2-20020a170906304200b006cd20ed7c5cmr3860346ejd.241.1647515976152; 
 Thu, 17 Mar 2022 04:19:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9o0Ht/ZYtOTQfl5eG5xB0TMPa2PKZcgRDk71E6wt7u8+A3GgCAcx1/9eO1akUyhqUeLqRcw==
X-Received: by 2002:a17:906:3042:b0:6cd:20ed:7c5c with SMTP id
 d2-20020a170906304200b006cd20ed7c5cmr3860330ejd.241.1647515975939; 
 Thu, 17 Mar 2022 04:19:35 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170906144200b006ceb8723de9sm2200539ejc.120.2022.03.17.04.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:19:35 -0700 (PDT)
Message-ID: <65323a8d-77b0-e2bd-1805-e2ad1361817d@redhat.com>
Date: Thu, 17 Mar 2022 12:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/14] iotests/remove-bitmap-from-backing: use
 qemu_img_info()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-5-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-5-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:53, John Snow wrote:
> This removes two more usages of qemu_img_pipe() and replaces them with
> calls to qemu_img(), which provides better diagnostic information on
> failure.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/tests/remove-bitmap-from-backing | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


