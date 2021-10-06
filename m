Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB38424227
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:06:42 +0200 (CEST)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9RJ-0006dh-4U
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mY948-0008Ho-7g
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:42:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mY943-0003Sf-PX
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633534958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRgrLI/DuPYIUKIHlbhcFq9U1GcZT2KCM2rXPnp/axQ=;
 b=SlxzU9AMgIXC0L75fh31owMA0GENKONWW30NL+tWhkCrW2J+QN0qrxv9aGmaI1ZxQVoW+6
 I+k8M2LpEiAaju8efGGGljlyzyfg3bLqMxgBMXqS5+i1zwEjbHOCg2sC2bmUqvsWIicRmA
 R/POx2DctdJSHTKPJxwF83x1kNMwoYs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-8XXG0p1nNIi-y0XbD086Yw-1; Wed, 06 Oct 2021 11:42:37 -0400
X-MC-Unique: 8XXG0p1nNIi-y0XbD086Yw-1
Received: by mail-wr1-f71.google.com with SMTP id
 m17-20020adffa11000000b00160c1ac74e9so2389329wrr.9
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TRgrLI/DuPYIUKIHlbhcFq9U1GcZT2KCM2rXPnp/axQ=;
 b=Z6ouJsed38eZnPmjg1DB/aEzBA+b7Td5gFgxgzSaVmWDsVP5WPBU+4J3rpIkIRLRcY
 6JZlQXlBRsNS6RTdtSIIbNqreaH+6Owm6V0MO0Ee9JV9nGWnujdGmnXqOGMNCpZEOD4W
 1Y4xPEWGLOqST7W6vVBCBxFka7RrdPJwOOmxpoXRF9o/UdNjTScTKwoQAbkCDPyU7WNn
 MQPytA4YdsnUdb8HTyvZLAMeYALIGSuMlXlznS6OZ06m7VoIWpgc5hM3rRv0DXgK5wsb
 xQ1g1aQnndYwx0Xobe4ejjxHHcYjwFS8gGx7CkrjPOfsWe7Vg0OOB1tdobwLK1KCCTuU
 TkTA==
X-Gm-Message-State: AOAM531kVo3q5x4gBQr2rlDhiwD1cyCLpxdBJjzTp8xZu6JP0KA5IlY9
 GVFTaV2L0gN/xiKwVcS+dsMeB8fVteOMQXTQuOMoNGDRN4oKRH7HE3jW9lXQjAyU4IvfXNDlxiU
 FCZVxpn1pue6sCzY=
X-Received: by 2002:adf:bc42:: with SMTP id a2mr5201401wrh.4.1633534955588;
 Wed, 06 Oct 2021 08:42:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkYdU0jV0G4N3UvDHCUWTzWLINTADdli63Fc5yLNF+22vmSmAQk7wRsQqamcVhP8kcGfDOEQ==
X-Received: by 2002:adf:bc42:: with SMTP id a2mr5201382wrh.4.1633534955385;
 Wed, 06 Oct 2021 08:42:35 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f17sm23037552wru.69.2021.10.06.08.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 08:42:35 -0700 (PDT)
Message-ID: <4f3fa32a-54da-1b5e-e35a-4eece062a7bf@redhat.com>
Date: Wed, 6 Oct 2021 17:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] qemu-iotests: flush after every test
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211006092726.383737-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211006092726.383737-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 11:27, Paolo Bonzini wrote:
> This makes it possible to see what is happening, even if the output of
> "make check-block" is not sent to a tty (for example if it is sent to
> grep or tee).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/qemu-iotests/testrunner.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 4a6ec421ed..b76db57e4c 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -340,6 +340,7 @@ def run_tests(self, tests: List[str]) -> bool:
>              elif res.status == 'not run':
>                  notrun.append(name)
>  
> +            sys.stdout.flush()

Shouldn't we flush stderr too?

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


