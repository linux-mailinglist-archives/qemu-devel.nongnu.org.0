Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9687C36E004
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:58:40 +0200 (CEST)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqKV-0005RI-MT
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbpxH-00066i-Ng
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbpx4-0004kR-E1
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619638463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=laUx6DMpA+Wp0v5UndTwoc6RlF+pIwqmyGI1kLxWG8o=;
 b=cNBQ4qetP/c9qZ6w2zEf7zkrsn1d4AD8bdSSfJUtp6afPYRbpvRVJzhvNhgTQjCvDISQU5
 /zRf6oVgp3Vh7HFgldjFxCSWvifRIWZfReV/BMhTB2n4JJVvRRJT8qL16Pn9d8Q9YCAcr6
 PlZwa17GGVYhqjolqeDE84cvSzawwG8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-fW_rQW-mNsS1oD0dq9Sq8g-1; Wed, 28 Apr 2021 15:34:21 -0400
X-MC-Unique: fW_rQW-mNsS1oD0dq9Sq8g-1
Received: by mail-wr1-f69.google.com with SMTP id
 q18-20020adfc5120000b029010c2bdd72adso4940132wrf.16
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=laUx6DMpA+Wp0v5UndTwoc6RlF+pIwqmyGI1kLxWG8o=;
 b=oU1Y6DTNsDSfW6XwsM7C/Q+3wLMd2zlyOhhVjP7yb+5wei1ZAk22hTjtWgoYbsm0HB
 /JENIoEBA6Xdd42GX2avCYZzTqMnYq4IuCSxE8SKWYXQYEbU4rK/N0lUs/H+OjSGFbH8
 PiTYKvNFfmjHXS+gJbk4MhL6hhHXBP86N+aK6sL8lMdskkCO/W6xhJpqLNt8yLFU+wS6
 EGcaH34uH8yHZVpzw9QhI54rAVy3Uua2zDFmxul00HUFuKyTzXEEwjNl0LEM0oCXt2yc
 6+d6NEvV203VEuQWAPdlmEu9gZHUYatLgTY4eHff7d4zlJYNdU//x+W2PZD4694ng9NG
 Xw7g==
X-Gm-Message-State: AOAM532hpZ4ZYvSrkq6plHg+vomXivDaEbvOotYzgbocSqgVwBkyglnz
 9O4n2TOMcRFaszXwtdxeQk0Uk+K/n70h+/cSRay77rJxJNnBuRf0hXA/3IabhIOoBvkXd15r72Z
 2LiuqJtAY6LVrz6s=
X-Received: by 2002:adf:df09:: with SMTP id y9mr12522675wrl.282.1619638460125; 
 Wed, 28 Apr 2021 12:34:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPz3HXD8D+UymH3GL/euj7z6qPSCDziTUIdTILocCTLIzgeuh8y3D4I3YEwYYb4aVwhq0vbg==
X-Received: by 2002:adf:df09:: with SMTP id y9mr12522649wrl.282.1619638459955; 
 Wed, 28 Apr 2021 12:34:19 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d14sm1028564wrp.12.2021.04.28.12.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 12:34:19 -0700 (PDT)
Subject: Re: [PATCH 2/2] util/meson: Build iov/hexdump/buffer_is_zero with
 virtiofsd
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-3-philmd@redhat.com>
 <e06f3f24-9ff2-bf3c-91c4-178af60c6c59@linaro.org>
 <160e4c85-e8c0-304d-7151-1040f8d310ba@redhat.com>
 <a4dabeaf-4df8-2779-f028-3d135fe84bef@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3e3fabf2-9fed-6d15-51b3-eb0c284852ac@redhat.com>
Date: Wed, 28 Apr 2021 21:34:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a4dabeaf-4df8-2779-f028-3d135fe84bef@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 9:24 PM, Richard Henderson wrote:
> On 4/28/21 10:56 AM, Philippe Mathieu-Daudé wrote:
>> Are you suggesting to remove the 'if have_block' check? This makes build
>> a the files pointlessly for user-mode-only builds...
> 
> But since the objects are not included in the binary, I don't care.
> 
> The build system is already too complex, and building a couple of extra
> small files makes only milliseconds of difference.

Maybe for libqemuutil.a (this does make a difference with the Python
QAPI generated files - another series).

I'll wait if we get to a consensus about what exactly is virtiofsd,
then revisit this series.

Thanks!

Phil.


