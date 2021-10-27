Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E243CEA0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:21:48 +0200 (CEST)
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflgQ-0007H5-9f
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mflLI-0002nI-B4
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mflLD-0006vN-Jv
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635350389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWX4qI2/JH8XuIebtGF2rR6czj/kQFBANTMiRi+ZFs8=;
 b=ZPNAhg7VPeiYMXeQakZoSPb9hbPHmXgMCPFXeeJtT7CJhGbxA6BN/sOWZUxWaWfKpzzDhy
 WmN/lQhKkjNlzEGWYr5ZPTAVrRQwtmWdbytA++FiT+1A+TNFCsVw8CeCz5Vp3UBjNlQ0oR
 faew2ZTQO5p8CNpkOCb2R1UorVDXg/4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-0bxd9PuuNl2yJhS4OXtShw-1; Wed, 27 Oct 2021 11:59:48 -0400
X-MC-Unique: 0bxd9PuuNl2yJhS4OXtShw-1
Received: by mail-ed1-f71.google.com with SMTP id
 g6-20020a056402424600b003dd2b85563bso2764540edb.7
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LWX4qI2/JH8XuIebtGF2rR6czj/kQFBANTMiRi+ZFs8=;
 b=P80e+F/OWRb+r/dzm+nDJe85TuS/2UUa3fHcErUzS/efcbzJk4GUjO5B635P4Y/2UD
 6pburVy7tcGNTRHApkgtEKfAUf/3xg1IinAQZSscV+6BTx5xFCCFqFZK8EAmKzEv/aPQ
 DaPtujM+rgKj7BtbWZLqbwaBwaHwrRBi5pnsZ0KWj2Xw2T1BqMZun3M9rM5iRNfxYPeu
 b5QCVskzVjJi+Zt7QUGVpZIDAT33lmonE5u1hCJUQkeLknNV8HnKvA0HtPDYAOMU9wib
 bDtLc/nuu/vT7YaVZ8RECpUq7UTYcab8hIm+vAAq3UhwQ4un0SZdOXWxbJMNQFW6EVj5
 Dn7A==
X-Gm-Message-State: AOAM531lDo1UDUzDZKmJuUcfQU4Yt5WF7Ve8LzvWLA7c1jkBV2Fd0RxY
 e4UbkuOPY9j8yFjbTjA7D7Y6Q0D5CFsiFt0e6/z2howDM9d9XKIFv3iQNNeDxchzcvs66QNAe+S
 4bdr++njwBX3XyTA=
X-Received: by 2002:a05:6402:2793:: with SMTP id
 b19mr45682378ede.80.1635350386866; 
 Wed, 27 Oct 2021 08:59:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5OF4OT6QUvQUbHBHIAvzlJ7MLdIVGZOtNEv/uMKBrETt8r3/2IsHtqv1wtDwCSHUW12taYA==
X-Received: by 2002:a05:6402:2793:: with SMTP id
 b19mr45682358ede.80.1635350386677; 
 Wed, 27 Oct 2021 08:59:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p26sm243894edu.57.2021.10.27.08.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:59:46 -0700 (PDT)
Message-ID: <4a5fcb6e-2c8a-397b-2e60-95b3c45b05d0@redhat.com>
Date: Wed, 27 Oct 2021 17:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] qtest: fix 'expression is always false' build failure in
 qtest_has_accel()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20211027074542.2607865-1-imammedo@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211027074542.2607865-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/10/21 09:45, Igor Mammedov wrote:
> If KVM is disabled or not present, qtest library build
> may fail with:
>     libqtest.c: In function 'qtest_has_accel':
>        comparison of unsigned expression < 0 is always false
>        [-Werror=type-limits]
>           for (i = 0; i < ARRAY_SIZE(targets); i++) {
> 
> due to empty 'targets' array.
> Fix it by compiling KVM related part only if
> CONFIG_KVM_TARGETS is set.

Another possibility is to add a trailing NULL to the array and change 
the loop to "for (i = 0; targets[i]; i++)".

Paolo


