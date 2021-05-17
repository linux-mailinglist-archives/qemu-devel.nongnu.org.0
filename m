Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2AB383955
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:13:49 +0200 (CEST)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifsK-0003lS-Pe
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lifl2-0001Gy-SJ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lifky-0003CK-Et
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621267571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46941Y2DOx0TAHcnHKhcAOik62oFB2CPIeh0R7NlCIY=;
 b=aqodAjbVsTLNV/CwQngFnjWr80gvwxUZ2S1pJrFZTP7Zh6cvO9Mpp4yHfyViXo/8bx4Dnh
 rpB3XmcGtncg3tHqufHOwxwmu3MscP7Cz6eTaH5h+0V1QC+nCQA2UdDKcHEyvTGGLbNnqz
 TNxyCVK91Fve+QJarho7eQWZo9DPoTE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-wirduArxO8aGgaRCJfaEKQ-1; Mon, 17 May 2021 12:06:08 -0400
X-MC-Unique: wirduArxO8aGgaRCJfaEKQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so1212827ejw.22
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=46941Y2DOx0TAHcnHKhcAOik62oFB2CPIeh0R7NlCIY=;
 b=mlE8eR1jLl9fBukAprg/kPlkbMNpKA0p3ugM3Z8QqgwHfu0Pp8ryaCyEoazYjr4oVT
 k/DhPPQnUlbz/4VYT8gezS3V04/aYu0KBgs4SDNWf5Ao42I5++Jt0R9MYQzPqsWAfFpB
 mZWxjaCI7jfnKiYc0RXfbGe0aqaT10T8ubMHXG5h/vk1KTtbdVoDkR6DAaXyUhwSZdQL
 epoCS2hClK8+HXG2OlvekirezsFD9RYZRQ9bv1v4vFi5B4CR9HzVfmq4wVhoWE7dQGwC
 15QzYEMB101s3ec34/oUvBCurhxNzekoTKBoVqKeaZj0dNoAd6XLMbCHUUFqnhEl2RhU
 1dHA==
X-Gm-Message-State: AOAM533Fw4DZUBJgXs1HdVm2bhQbqbGdcFZECCx1Qzm0uyiSCUKAbYQH
 fTAefAwtouX+5s05C4ogKGvBj6PzULCLoomOJNxBVBCcbzJ6mrn59wBfdZYvOMFfyzzohVEGcoX
 jwvQWZNcIc48xTdk=
X-Received: by 2002:a17:906:5584:: with SMTP id
 y4mr663753ejp.120.1621267567556; 
 Mon, 17 May 2021 09:06:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVZ6JWmOCKuPaf6xCwt1bvlEUXa4kU63XUUGmgyCPPVraaHYxAoEBK2pH5pOfol8Xde2Uedw==
X-Received: by 2002:a17:906:5584:: with SMTP id
 y4mr663716ejp.120.1621267567308; 
 Mon, 17 May 2021 09:06:07 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id cw12sm2583918ejc.17.2021.05.17.09.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 09:06:06 -0700 (PDT)
Subject: Re: [PATCH 0/5] docs: fix references to files converted to rST
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20210517151702.109066-1-sgarzare@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d7d9eb04-1986-36e0-436f-46d2f54135e0@redhat.com>
Date: Mon, 17 May 2021 18:06:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517151702.109066-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 5:16 PM, Stefano Garzarella wrote:
> Trivial patches that fix references to old files in docs/ converted
> to rST.
> 
> Broken references found running:
> 
>     for f in $(git grep -oh "docs.*txt")
>     do
>         test -f "$f" || echo "$f not exists"
>     done
> 
> Stefano Garzarella (5):
>   docs: fix references to docs/devel/tracing.rst
>   docs: fix references to docs/devel/atomics.rst
>   docs: fix references to docs/devel/build-system.rst
>   docs: fix references to docs/specs/tpm.rst
>   docs: fix references to docs/devel/s390-dasd-ipl.rst

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


