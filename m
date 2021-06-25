Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D6A3B3F57
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:31:24 +0200 (CEST)
Received: from localhost ([::1]:38108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhFE-0002e7-0b
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwhDK-0001oA-Ou
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:29:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwhDJ-0001ER-4q
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624609764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRBnGze4g0dtKLW1zxxYf6sPpKdxfYTPPW5/Acs1WVU=;
 b=EqUF9J3WiHfpIE4UglKfN/UVXBdkErv1U8DzhcZwJvuvdjvlebS8qAX4VdXcW+eW3RmKhW
 7vr33WaSEJg+6UYdgxhJNJJZiITcztkgwhH0c/70rVhtFa4iZxNIk7tHHJcrO45hhAhr7O
 2DVXeiQaLY4kpUTipv6K5c3IAiVO9jE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-dzfn4kS3Ofe98szqUqF4Pg-1; Fri, 25 Jun 2021 04:29:22 -0400
X-MC-Unique: dzfn4kS3Ofe98szqUqF4Pg-1
Received: by mail-ej1-f69.google.com with SMTP id
 k1-20020a17090666c1b029041c273a883dso2854022ejp.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SRBnGze4g0dtKLW1zxxYf6sPpKdxfYTPPW5/Acs1WVU=;
 b=oYHFIbxSogcq2C9snhnmXOxwg1pXV5Sf7bJrqBcCyeK+E3/izSSPfZuoFKeaaxSQpK
 5DsxqKATjTLtRBanZOqJKUsnXI9zj9BiHx6MTPtNsSJQ9blwRleoKYWHSATgNDYYPYrn
 oo10elCsAQsmQJHWwfJyVtQYyPhf48xg+87DpAFhJxoxnXMSgkysQSxhueaUZM7c3HGh
 yRGZsSwlLMOwVGCgUC7NUQrQ/j1RFz/A1G8NtrhN18KWEFSI0dreCrHAgdotQwCfbdKu
 3Bn3ctKDVXNmSCw2e08DB53ac8jAbxKt7eoUcRy+VL8zW7TIS+fY1VfALvDYk0pzaLs2
 pkWA==
X-Gm-Message-State: AOAM530W9UpEPhTokByvYjZxpqw8UuLByZbmDjbNv7eFwOHhxG2oLMTD
 WjwytVu/tlHZPTpM28N8wRcz9JNI42ORIsmue+sfgVyh6r8/DlzgOY2YW7z4tp35IqDetqYGKsz
 d+3R6eKUeLlgNjdc=
X-Received: by 2002:a17:906:69cc:: with SMTP id
 g12mr9644507ejs.550.1624609761823; 
 Fri, 25 Jun 2021 01:29:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN03J1IdTakodKswGrBPnwT2I3Nehhj+Aawq1i2H96vUJ5DJ//vjMRj2jWS4jBDA81o6OR0A==
X-Received: by 2002:a17:906:69cc:: with SMTP id
 g12mr9644496ejs.550.1624609761641; 
 Fri, 25 Jun 2021 01:29:21 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 yd2sm2368640ejb.124.2021.06.25.01.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:29:21 -0700 (PDT)
Subject: Re: [PATCH 09/11] block: try BSD disk size ioctls one after another
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <20210624180423.1322165-10-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6704d2ab-eef5-c0d8-5382-090dc071613b@redhat.com>
Date: Fri, 25 Jun 2021 10:29:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-10-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 20:04, Paolo Bonzini wrote:
> Try all the possible ioctls for disk size as long as they are
> supported, to keep the #if ladder simple.
>
> Extracted and cleaned up from a patch by Joelle van Dyne and
> Warner Losh.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 34 ++++++++++++++++------------------
>   1 file changed, 16 insertions(+), 18 deletions(-)

Thanks, that’s much better.

Reviewed-by: Max Reitz <mreitz@redhat.com>


