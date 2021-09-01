Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA9B3FD9FC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:13:38 +0200 (CEST)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQ3d-0002IG-Sb
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLPqu-0007CP-Ow
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:00:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLPqj-00010P-OV
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630501216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHHe+ptzv8jTod3oamjrkEbCi86JHOnRa/kibvVm7Ek=;
 b=d/VJfSE98BR2HYLEQ/GbfjJ6589IrySLYS8wlhK6VBbjaj4efG8IfsSqSk6YhztJpZwuu9
 KJQqFlqpusXl20TY4hViOW8bqIx6rSntfu+dfoMQcI5xfNeNZ4U4M4dybTMeOh3SZq9B5u
 xMG2cowtSWb4/dVXJL+L5tq+4lzZf6I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-QfBeU9-_OoGPrpw8swGeMw-1; Wed, 01 Sep 2021 09:00:15 -0400
X-MC-Unique: QfBeU9-_OoGPrpw8swGeMw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r126-20020a1c4484000000b002e8858850abso991323wma.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 06:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PHHe+ptzv8jTod3oamjrkEbCi86JHOnRa/kibvVm7Ek=;
 b=Zt0j6KkTPNmBI/EsIu8SSs8aZ43cyE8bwD4Oh5Oe/+HkPnOUfnxU05Mlr01blkWjcf
 PmIAawOgNhi9/Fyy+Bz95Cbz+g7tVnC6hVkldg4ZsVXvMpUg69g3krMLp2+zRqdzEQEl
 89l/DRbF2IfbXaqEOIoGuIfuZzu0Yjuex5OihdQB1KK9KHVBrJdkNgzSNNonBdBXtito
 O5D6cUW8+r1BRSFB65GjKybaly6GvhBaE5ASN4khXHDAkF/oxSWm76mr4bv4USC+KE+v
 cSTwzLnAiOK2z2/fImK0l5OxM37jrclyCqaFQUUilSIyuWmWyL/FZ8IGujAWW36Z84T3
 dpXg==
X-Gm-Message-State: AOAM531NfLhoJCh3w0tjYSRawSvDLwSC5w/lgf1NW+fZUxwGO31BDXBC
 0wjMD/txbDXEYz7pvlNY+MaxNHI4PP7zfDaYAllRuSc1sx+DWFRkOGKXvsvblBxvnSJ1IYAofY2
 ABX03dz7HgTNJ1ag=
X-Received: by 2002:a1c:8086:: with SMTP id b128mr9628698wmd.54.1630501214403; 
 Wed, 01 Sep 2021 06:00:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwyAVLP7UI0o0unz2EWyKDfiq2F+rAdBlPEFlATFAlQ24V8lmuVKFIz9FMX3pkXATOysfSZw==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr9628663wmd.54.1630501214066; 
 Wed, 01 Sep 2021 06:00:14 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
 by smtp.gmail.com with ESMTPSA id c9sm19098471wrf.77.2021.09.01.06.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 06:00:13 -0700 (PDT)
Subject: Re: [PATCH] s390x: Replace PAGE_SIZE, PAGE_SHIFT and PAGE_MASK
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210901125800.611183-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <c3bb23a1-2176-5d25-9a97-a971fd807296@redhat.com>
Date: Wed, 1 Sep 2021 15:00:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901125800.611183-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.09.21 14:58, Thomas Huth wrote:
> The PAGE_SIZE macro is causing trouble on Alpine Linux since it
> clashes with a macro from a system header there. We already have
> the TARGET_PAGE_SIZE, TARGET_PAGE_MASK and TARGET_PAGE_BITS macros
> in QEMU anyway, so let's simply replace the PAGE_SIZE, PAGE_MASK
> and PAGE_SHIFT macro with their TARGET_* counterparts.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/572
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


