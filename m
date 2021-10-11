Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088A428DC6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:27:30 +0200 (CEST)
Received: from localhost ([::1]:35954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvKz-0008LR-37
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZvJH-0006Xr-8N
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZvJD-0000G1-Ry
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633958734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIM1vsEjjKFusFrg2dft3P1qmVjzUobCp6J8dREylY8=;
 b=YGCkJX/g+HAbYWz8nqLtlovVRr/raySXELqBDnj/IAnF9wLNLvbQ3xX0HFdlZxYfDChiuP
 9hu4Na/zjpOGmuUawpI54lNvYcPiq2SBcUideTgU1vJjIwvlkhnfZtliMxOLuGv3csZp5F
 BTy8u0eqRRUPK8CsUAdola7+rL0N6zI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-fj7_FmR9Nvm2cROrOk5xyw-1; Mon, 11 Oct 2021 09:25:07 -0400
X-MC-Unique: fj7_FmR9Nvm2cROrOk5xyw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso13302680wrc.2
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 06:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iIM1vsEjjKFusFrg2dft3P1qmVjzUobCp6J8dREylY8=;
 b=E3AwR7eEeAG+GM1ITNNwjqaJ67239et8cYOkCq8DelCpcwBHq3zFvoxZo6EQa6DyUg
 J6pcrYYfekarfvHScwMuhs3C/mIsLBbnEgx79mrqe1IPlwro/w3K+PHc0n/HmgQRj8ZG
 HobCZpzQY1Ua6GzhrLUzC9tqsZU7c+XMW7E66hj1dr5QG77ZJdrX9NCmBRv/KChpqPbA
 ZhSCtdc2vrqJcuxVd/C8l4i9fds8aKgW7A13KOfh54NYejsDKClh+gqnrch7pVuTNUY0
 ohwZNM8gJXqGTefaz9Iw2kx5nYJqjPhdsbo/4+awjy4Eqc//lDftUlJHMl1E/G82awTs
 rQEQ==
X-Gm-Message-State: AOAM532TVEw+zpMhkq7x039ZxL6numW2uYpp6iGx49oTGevKsn4vpo8S
 aP/XD7g5VocvewSFi7OIRkaCgcqbH+uEaAJA/Nn+VFGWCiDLE32piuBOaDc4GytNsn/NbgNmoE8
 zaKpZOubDG9BqHx8=
X-Received: by 2002:adf:f243:: with SMTP id b3mr21120028wrp.60.1633958706177; 
 Mon, 11 Oct 2021 06:25:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+N0sZvaqrhJn7d5/1uoOiLY60THwBfqmSj24PXYejPS+lMWHhwVQ4qtXcMRQLvW7foCCb5g==
X-Received: by 2002:adf:f243:: with SMTP id b3mr21120012wrp.60.1633958706042; 
 Mon, 11 Oct 2021 06:25:06 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id l20sm6227938wmq.42.2021.10.11.06.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 06:25:05 -0700 (PDT)
Message-ID: <ea6b1763-1bb0-5687-f401-4f732092bcf5@redhat.com>
Date: Mon, 11 Oct 2021 15:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] qemu-iotests: flush after every test
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211006092726.383737-1-pbonzini@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211006092726.383737-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.10.21 11:27, Paolo Bonzini wrote:
> This makes it possible to see what is happening, even if the output of
> "make check-block" is not sent to a tty (for example if it is sent to
> grep or tee).
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qemu-iotests/testrunner.py | 1 +
>   1 file changed, 1 insertion(+)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block/

Hanna


