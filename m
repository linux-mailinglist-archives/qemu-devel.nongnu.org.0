Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC74C3266
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:58:53 +0100 (CET)
Received: from localhost ([::1]:56204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHS8-0001Dl-Jn
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:58:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNHPf-0007ze-Fk
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:56:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNHPd-00039k-05
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645721776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tS/OPBxfR5Sg+4V2cwO2VlzTgOrQwjFkuBuJXapqPNc=;
 b=VKVHNzUBZ6fPGnt7XKLSMrG64CrgZGCkKy62EzJ4ASLuUJzk0nztxXhvFMjN/iPxIqWx0G
 O0NWZgR0Rh+N6XMHsDZseKogAnq7muMkpWEKoTsFd18G/Yx96DCIEm1e0+PaIuX8J+0d1X
 lrxOop1VFduWkFDw/JVknYVqEK7UhAo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-dYWi-nrNMrqEJr1uO1X8tw-1; Thu, 24 Feb 2022 11:56:15 -0500
X-MC-Unique: dYWi-nrNMrqEJr1uO1X8tw-1
Received: by mail-ed1-f72.google.com with SMTP id
 y10-20020a056402358a00b00410deddea4cso977053edc.16
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 08:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tS/OPBxfR5Sg+4V2cwO2VlzTgOrQwjFkuBuJXapqPNc=;
 b=l8XFGUzSOA54oyqVxp2iVluALl+Yj7mg+n8vX27dqoEoflLaBW2iu00RD0+7xfvZ9Z
 zcKQ+AagMDdepeDX7f34u9P8Tl96TGPyy23VqacX2mvM62n4tWyicTsWaGYPFhrL/xZv
 LFMVssl0BEA3LRD9EmJ49UNzp5Y7gnOxnSxHzBgPdHcApO2jecW1rMSDHoV/R0kFhbKa
 bWwSJFQz9xuzSeKYISMIgs8xBYgC5vGVz8L+x3mXWrmfAGT/M6SgeId2JzL8L7M+EbLJ
 TYyJi/l/An/w1PsPoTlxL8KBwRNQ43H24lAqTv6zLSwjOFEvu+hi9itQEm4sbfIc0/0m
 GAsw==
X-Gm-Message-State: AOAM53310OatjHl0pUhE4vmSToJUWUd6CMF0NJm5IX5cIwo5JCvOcByC
 L2U8DUYl0icv2JwCJtSJCqmhhCc4j6CjnC79ol/qFFgJ4DxNn90N4Y5L2PyD4qmBf7xkKbHkbjR
 jx/KecE3NlS0m0+Y=
X-Received: by 2002:a05:6402:2074:b0:410:81bf:ff3b with SMTP id
 bd20-20020a056402207400b0041081bfff3bmr3237687edb.326.1645721773847; 
 Thu, 24 Feb 2022 08:56:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzC9mkPd+a3pK7kETzrAG6lSkAbaaOuLDeLxfhbWDPXj3VmwJaP4ohFt3GPgXidE2xacT89jw==
X-Received: by 2002:a05:6402:2074:b0:410:81bf:ff3b with SMTP id
 bd20-20020a056402207400b0041081bfff3bmr3237672edb.326.1645721773681; 
 Thu, 24 Feb 2022 08:56:13 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id h5sm1591344ejo.124.2022.02.24.08.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 08:56:13 -0800 (PST)
Message-ID: <4ff2d2ec-dce9-2675-345e-fbb400ecb1b9@redhat.com>
Date: Thu, 24 Feb 2022 17:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/qemu-iotests/testrunner: Quote "case not run" lines
 in TAP mode
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220223124353.3273898-1-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220223124353.3273898-1-thuth@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.02.22 13:43, Thomas Huth wrote:
> In TAP mode, the stdout is reserved for the TAP protocol, so we
> have to make sure to mark other lines with a comment '#' character
> at the beginning to avoid that the TAP parser at the other end
> gets confused.
>
> To test this condition, run "configure" for example with:
>
>   --block-drv-rw-whitelist=copy-before-write,qcow2,raw,file,host_device,blkdebug,null-co,copy-on-read
>
> so that iotest 041 will report that some tests are not run due to
> the missing "quorum" driver. Without this change, "make check-block"
> fails since the meson tap parser gets confused by these messages.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/testrunner.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


