Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBB62FE6FA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:02:04 +0100 (CET)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Wmx-0008H1-FX
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WjJ-0004xE-0R
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:58:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WjH-0008K9-5C
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611223094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igjW7t2PkXJR1M5GI4EOiXlPwiCV+uWunlvY/YwyTD8=;
 b=Cud7qHTTwRQ79+4A/Owdfqih851aQ9p51xlrgh2kkssEZ4mPpGhQDdELNrqJ+iuNcfNx+k
 EGaRjKA3Kg1AekdtrTGj8iEYAOfPnS/QcqtnXVW/QTgJSAqjqvdgfesl8MCeUYDFX6qJ5g
 yk53QNVnaKYwh1JQaKpa1b57xplKiow=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-1ErXrIVUN16IAWuV7tkebg-1; Thu, 21 Jan 2021 04:58:12 -0500
X-MC-Unique: 1ErXrIVUN16IAWuV7tkebg-1
Received: by mail-ed1-f70.google.com with SMTP id a26so832074edx.8
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=igjW7t2PkXJR1M5GI4EOiXlPwiCV+uWunlvY/YwyTD8=;
 b=h5P2ul3cpD73MjKChzw8Sds+YQ0eIE8tPR9eT/RYhS2Mk97O8jSBD0JAKp7yH/QHV8
 Ka8L9PeVgp/rPhhyhUq/f7XyEDVQJxvu07qeQrXjOM9dM0ZoGGy5wXt/FOd4Vzp6zV4o
 LyRqDrSPVlRQQgD6FJllASgO1K7eIAKUDDx07Oq6HhZKcFJ1pVl7WAp/MiXhsEI50++t
 18sU1Cg50dLjVbN6G0vaZ0b/qJ5JBfVOSdwIHIRiIY4ZurVHKna3leNIkd5ObXhJjNwv
 9WtcI8TlgzKTcga+7R+DqOjw5pi4CDsH4qmdzK6Kpz3usmuOjWvYZVFp28IMRTl+PnFO
 354w==
X-Gm-Message-State: AOAM530sj/arCZUxBskxxTO5OBdBxBY5WONUUCfLaCcLkZqthJKakyt1
 AGn8OVHxBc7L8HKSh2IJ5O26UphjuAEtTibZpmMePuyepsv2IyIjKEzKKrIyMao14iLbo3D2zta
 l/zRNlksDhvkXXrA=
X-Received: by 2002:a17:906:e48:: with SMTP id
 q8mr8577378eji.478.1611223091205; 
 Thu, 21 Jan 2021 01:58:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOiXuUmdyVTCiqp/CF60i7CamXnmTTGqVFjcb1nr0hhoqLMU5ZdTc+z/adLLXja4KcpA5vBw==
X-Received: by 2002:a17:906:e48:: with SMTP id
 q8mr8577371eji.478.1611223091023; 
 Thu, 21 Jan 2021 01:58:11 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b26sm2442003edy.57.2021.01.21.01.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 01:58:10 -0800 (PST)
Subject: Re: [PATCH v2 7/8] meson: Display cryto-related information altogether
To: qemu-devel@nongnu.org
References: <20210121095616.1471869-1-philmd@redhat.com>
 <20210121095616.1471869-8-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <11f56452-0134-95eb-d25c-b5efe53dc4fe@redhat.com>
Date: Thu, 21 Jan 2021 10:58:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121095616.1471869-8-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo "crypto" in subject =)

On 1/21/21 10:56 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Daniel P. Berrange <berrange@redhat.com>
> ---
>  meson.build | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)


