Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80043301788
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:17:21 +0100 (CET)
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3NTM-0002Ix-Jc
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NQ8-0000Li-FC
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:14:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NQ6-0008IS-Py
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611425636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftLog2l3GYpwEDbgj+tSztCJKdCE5n3vzUWIriYpTGs=;
 b=DMqrODQIXTIwEtwxbAJAqcLQUxbqDZYGZOf2BHtWAYn3Bd/dqKvu6xGoJ466QkzGHxQg0R
 mX20wsZb5b8zdwb3pkG1GrhJLGJD6CZ6CiIbED/OyxMTFXQJuS6iqg3fkSLpf3u1Usb5Pi
 H/xmlo/BiaaPp7vwG1jJa8e4rFCeCOY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-joLyb-1cN3CBBBMDVcUJHw-1; Sat, 23 Jan 2021 13:13:54 -0500
X-MC-Unique: joLyb-1cN3CBBBMDVcUJHw-1
Received: by mail-ed1-f71.google.com with SMTP id w4so4820698edu.0
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ftLog2l3GYpwEDbgj+tSztCJKdCE5n3vzUWIriYpTGs=;
 b=o23jsLP1aHARdxxVr5VAD0n0visSIVoVu6TxmanKJFQRSY1aPj0h12IbxQg+xh/imz
 OfjXzjxgnrX6IeyaLXZsZoaM0NUSDkV9OEKAsnO3RdsZRToIbjpCGBekiPZfWO3OjodY
 zk1xH9+NWm2P74JtXF7iCLi9gSaM6PDLP13WFQyDgOeGGsmqdvhPCiFDbMjSPNQ41UIP
 G54P0UF2cmYYhc8oY0+AqAJ9xm8Gq8Rywbtm0jn/XU79tWEiLCvOAVKCidH2noZHTtV4
 mM7QZk2wKmRCGrjH6ehAn/ko7maPLyCooJT2OGfYtzg+2S6O4tf7EngrJpN56f/3H8/E
 D8mg==
X-Gm-Message-State: AOAM532cx8A3XG7Q2VqaWCIo1MtiBYVD2okbluhN8BVLw3cGFLB2bB2M
 PgbtkOlneIiIgzToMCXcd+/lW9ZSg4+n4fkVspdTGr/WVphNo5ownYU9+T/ICLaPxn/PN3zZe1r
 0wxaeyab6CI9nD+s=
X-Received: by 2002:a17:906:6087:: with SMTP id
 t7mr1545423ejj.90.1611425632946; 
 Sat, 23 Jan 2021 10:13:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPwwsCHYWTaDUkvHtskALaYJbvPkTkRW4XSDP/u0dJTKUP3+bdQbDosy5x8HTbjfDEjH4/gQ==
X-Received: by 2002:a17:906:6087:: with SMTP id
 t7mr1545416ejj.90.1611425632800; 
 Sat, 23 Jan 2021 10:13:52 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id v20sm1014701edt.3.2021.01.23.10.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 10:13:52 -0800 (PST)
Subject: Re: [PATCH v3 0/4] meson: Try to clarify TCG / TCI options for new
 users
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122133004.1913923-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cb108017-1c4c-1145-a88c-f03661b6c805@redhat.com>
Date: Sat, 23 Jan 2021 19:13:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122133004.1913923-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/21 14:30, Philippe Mathieu-Daudé wrote:
> Since v2:
> - Included Thomas suggestions
> 
> Some new users get confused between 'TCG' and 'TCI' and enable
> TCI when TCG is better for they needs. Try to clarify it is
> better to not use TCI when native backend is available.
> 
> Note, before Meson, warnings were summarized at the end of
> ./configure. Now they are displayed earlier, and likely
> missed IMHO. No clue how to improve that :/
> 
> Based-on: <20210121095616.1471869-1-philmd@redhat.com>
> 
> Philippe Mathieu-Daudé (4):
>    meson: Explicit TCG backend used
>    meson: Warn when TCI is selected but TCG backend is available
>    configure: Improve TCI feature description
>    configure: Reword --enable-tcg-interpreter as --disable-native-tcg
> 
>   configure   |  5 +++--
>   meson.build | 11 +++++++++--
>   2 files changed, 12 insertions(+), 4 deletions(-)
> 

This will have to be reworked because the TCI option is moved to Meson 
in the pull request I have just sent, but patches 1-3 are good in concept.

Paolo


