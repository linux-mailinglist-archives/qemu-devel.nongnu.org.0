Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98F56F0307
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 11:07:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prxZw-00073N-3o; Thu, 27 Apr 2023 05:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prxZu-00073F-Mf
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:06:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prxZq-0000Kk-7J
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682586369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=knPFVzHzGbtrZWpiLhNwmasdRnu90HBEUNfsNa8hcX0=;
 b=GzE0FVfKKibp6ioNptZ4F5kE7QUtmaYJHXrMk3Z4bWWUOjNwaNk4VHeCij97h25RaO5nKh
 qaW+szeWom2Yk8xmymGxqXjAjcPkIHamvgW37hp6N6yVL0QRlT4CBqNshVlsaZsduDnR0u
 pG0XkLcZKw6O8bepZpZgW5mbsdR30tk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-5vaGZmfoMWO3t58LY0MQgA-1; Thu, 27 Apr 2023 05:06:05 -0400
X-MC-Unique: 5vaGZmfoMWO3t58LY0MQgA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb2easo2720700f8f.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 02:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682586364; x=1685178364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=knPFVzHzGbtrZWpiLhNwmasdRnu90HBEUNfsNa8hcX0=;
 b=LBDeH3RAukyliUadtfLnrk3L0/KJks/C8svIef2d9dnjXV7aozacUAmL+mfDqZg4LA
 8O05KEI2J5a98QDtWd4sHAcb8Z25F+6OUqdp2QxfCwIU96wLuJnDP8z/MoSibI5L9tys
 JB60fwJQpdKtuD+jckklAs0KJGX8eAsn7K+F7U52ieRjxtaRTlxYd7xWILR2ZbCmYUCG
 x1iU+6LeVZuU/nSmcOM4MoJPzkV3qUCeDnb37bR5smcCDY+4RIbxnuX+Rxpekcc14bzh
 pH5StDdWwD6D/L33bUfoCnkKXaQo3HHOzjLkgWxRXZWs9MfRjuf6J//WOZMXfY30jGZb
 WHLQ==
X-Gm-Message-State: AC+VfDx+S0GfuTc8JLfhOBz+fCjb07bzhWixJnCFp8Q0j+bSeNF5fauJ
 /cZ151JtNDdc61CU3z0ABncctY8V/kbKBO/SsfAqKec5U1rzmzviL5dqbOnSd3SMJPj7TJfT7bV
 onZkjJahA+eWI0Ec=
X-Received: by 2002:a5d:6dc2:0:b0:2f2:9198:f0f with SMTP id
 d2-20020a5d6dc2000000b002f291980f0fmr716304wrz.10.1682586364526; 
 Thu, 27 Apr 2023 02:06:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Ii4zHsHXiea1yj3yZSBEwJahQjhng/d4bosHqvUjP05pG7tUdlJ6ua0puzDrQdgUJYxjScg==
X-Received: by 2002:a5d:6dc2:0:b0:2f2:9198:f0f with SMTP id
 d2-20020a5d6dc2000000b002f291980f0fmr716283wrz.10.1682586364160; 
 Thu, 27 Apr 2023 02:06:04 -0700 (PDT)
Received: from [10.32.181.74] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
 by smtp.googlemail.com with ESMTPSA id
 b2-20020adff902000000b00304aba2cfcbsm1600776wrr.7.2023.04.27.02.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 02:06:03 -0700 (PDT)
Message-ID: <5558862a-7398-3090-d1d2-06ba67c8a2c2@redhat.com>
Date: Thu, 27 Apr 2023 11:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 0/3] Deprecate the qemu-system-i386 binary
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20230425133851.489283-1-thuth@redhat.com>
 <5fc11d22-275d-cc8d-bf9c-f1c015cbee23@redhat.com>
 <ZEoyNt0UtSYRt9Go@redhat.com>
 <CABgObfbqD+C4aME0yApeb_9dWA=22Yz+oi_7ECUtf6A4McHrhA@mail.gmail.com>
 <ZEozZX/eH7BzUrWl@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ZEozZX/eH7BzUrWl@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/27/23 10:33, Daniel P. Berrangé wrote:
> On Thu, Apr 27, 2023 at 10:31:00AM +0200, Paolo Bonzini wrote:
>> On Thu, Apr 27, 2023 at 10:28 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>> I wonder if we should take this a step further and rename qemu-system-x86_64
>>>> to qemu-system-x86!  Distros can if they wish create symlinks to both
>>>> qemu-system-i386 and qemu-system-x86_64.
>>>
>>> I can't help feeling this just creates a new upgrade burden for distros
>>> for no obvious win.
>>
>> We can create the symlinks on install as well during the deprecation
>> period. It doesn't have to be done by distros.
> 
> What's the actual win though ?  Why would anyone want to create guests
> using qemu-system-x86, if both qemu-system-i386 / qemu-system-x86_64
> still exist indefinitely for backwards compat.  What does having a
> qemu-system-x86 add that can't be achieve just though hardlink
> between the two existing binaries ?

That the two existing binaries can also be removed sooner or later.

Even if we add a QMP-only binary, qemu-system-* would be a nicer 
interface for developers and for quick-and-dirty launch of guests 
(including usecases such as kvm-unit-tests).  Libvirt is not even 
available on Windows and I think on any non-Linux system?  So having a 
qemu-system-x86 that has the same defaults as qemu-qmp-x86 is useful for 
developers.

That said, most people are really using qemu-kvm and not 
qemu-system-{i386,x86_64}.  On one hand it'd be nice if qemu-kvm's 
default machine type changed away from "-M pc", on the other hand that 
would have consequences on CLI backwards-compatibility. :(

Paolo


