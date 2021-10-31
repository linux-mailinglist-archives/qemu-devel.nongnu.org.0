Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C9A4410EB
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 22:06:51 +0100 (CET)
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhI2T-0003J8-LX
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 17:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhI0q-0002Wz-L9
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 17:05:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhI0n-0002bf-AB
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 17:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635714303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUVLSrGqdmjnFRWg7SaWeVQGChJGZE5fR7mFkP+2bG0=;
 b=iXsHGyCrqPT3WS9/AREeSEF4VyFyeho1Qrv59XLEjwVzLssu7Ccr3+TKtikvNLeXRyYYWM
 ZV1cM20b8cBnfmYRcmg9dEeeUfNNBVkl7OT9mBqVv2A7E6/tTgmTyRZZIDAjARv6OWc/NJ
 ZU8j9tZD7247gYi0qsr0JLcNNdXUb9g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-jhjmj5xrNHuH3DroacBtCg-1; Sun, 31 Oct 2021 17:05:01 -0400
X-MC-Unique: jhjmj5xrNHuH3DroacBtCg-1
Received: by mail-ed1-f71.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so13723101edl.17
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 14:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cUVLSrGqdmjnFRWg7SaWeVQGChJGZE5fR7mFkP+2bG0=;
 b=w+mQoX7DGwE7ZsoWdBPx5uSPl3MA7PJnUhaKC+ass+w8n0Ot7MxZtU9ZrhqqOX/dsB
 mJ3eiWEtcePV0CUHTE8oJBqnwFFlIOjizNdE0XRJI+kjLGcGbEMpYmTqV5aPO27L5rAk
 GkEnHbobdcTppR03QWRSJpyvF6rH3lBoDlzY/qczibt25rkKvIBop8oSOj3qmz643cIT
 mfeWEd8S3m1UlGCsdJ0ZpLapdkkzS9iRu5XA5ewMfM9+bznWrvimpij1Ob5kF599xFMh
 QGKdbepiajVblM23SisBzYkPaDYjAJah79U+56yOrR0Y14y6q+FiimAXiy/I8bcgZunq
 7GVg==
X-Gm-Message-State: AOAM532HH2usF20txIqDrYzfQis1WKc1SPGgSfD1fNCQd1zhOxbtfv0Q
 jJ/52i62h/j98LiHITj4t1L9mpKm2As+7yE7nnljeZnw0cjHitlt0z+QLctv8XsIIrFfOwRUpTa
 hs0F8XeBQnKsX47M=
X-Received: by 2002:a50:9b4b:: with SMTP id a11mr35131835edj.316.1635714300197; 
 Sun, 31 Oct 2021 14:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaSXP2BFg7c1xRGCGc/jn4mimZ1PhSuqjkTz8Hk0WpO6P3mph+eoegEuiky0iZLMJ8qU0UtA==
X-Received: by 2002:a50:9b4b:: with SMTP id a11mr35131807edj.316.1635714299952; 
 Sun, 31 Oct 2021 14:04:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qb21sm957295ejc.78.2021.10.31.14.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 14:04:59 -0700 (PDT)
Message-ID: <0b3d0211-1bcf-b033-2f15-efcd85bb78aa@redhat.com>
Date: Sun, 31 Oct 2021 22:04:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] build: use "meson test" as the test harness
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211028142826.57327-1-pbonzini@redhat.com>
 <20211028142826.57327-3-pbonzini@redhat.com>
 <60e3154f-16a2-98d9-ec29-e4c6a2291c20@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <60e3154f-16a2-98d9-ec29-e4c6a2291c20@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.592, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/10/21 20:03, Thomas Huth wrote:
> Thanks for the update, this works definitely better than the RFC 
> already. However, I spotted another oddity: "make check-softfloat" now 
> is way slower than before, it takes more than 2 minutes now, while it 
> finished within 20 seconds before your change ...

Hmm, so it does.  "make check" and "make check SPEED=slow" work as 
intended, but "make check-softfloat" includes the slow tests.

What happens is that "make check-softfloat" uses the setup that excludes 
slow tests, but specifying "--suite softfloat" force-includes them 
again.  It makes sense, but in order to keep the same behavior I'll have 
to come up with a different handling of $(SPEED).  Thanks for the test!

Paolo


