Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4290D6E263A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:52:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKmt-0004MB-6t; Fri, 14 Apr 2023 10:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pnKmq-0004LX-Tv
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pnKmp-0000Qr-Fy
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681483946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wh2NeXq3CgPCnajmRszvJaiXuEm/H3oVpo9bdGlKdcM=;
 b=g5cM1SZxpEQySJGNrRBjF/shfzwHwLT1G/6vIQTqDj43qcVNNERckWyEAMoR6YCNkqdHZ3
 YWTHFbpkLC1H4D9wIfrA/Lybt43Mc4hsl8M2g1idPz1w1dgQsdjfSDmItjcW8vAttuh6To
 Yhj8phfSGhCwvGFf4ON8FP7wR3hELiM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-0AcDs9_QPCSNYVxBTPG9SQ-1; Fri, 14 Apr 2023 10:52:25 -0400
X-MC-Unique: 0AcDs9_QPCSNYVxBTPG9SQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d21-20020adfa415000000b002f68de99106so1038493wra.19
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681483944; x=1684075944;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wh2NeXq3CgPCnajmRszvJaiXuEm/H3oVpo9bdGlKdcM=;
 b=ZaBf8MgDm6h0kgOrv3gIIU49OzvQB+XNAz1tBCvRz7Wxv+5gQM+4COBSUrKnpLYzIt
 rqZROeZJachTO9hzc+x5cMtAWCoQHLtmCR/4LfF7IHlkAHfJkqlmELZcvAIvhZBforRo
 gdlGBy8erWGOl2W9h42d6A8g1kZWiKqgNuuzRIuLM43yv7ECpjR/5S3GoqUTAmPEiv8/
 bMorEBQp+eQb67rJESpHqSr4AL782QFxOe2y3z43103zNhL9jYwkHBrFbDkfh9wKnPVR
 jtQhWmNnQUL3GVvQD1oA0/+sQsDAkEF9dTiGGd87vRar+b6nfwcvWWvYOwNeHSznK2Fg
 flvA==
X-Gm-Message-State: AAQBX9f2Krm8kNhAI4X234lu30W11yVfkGuQP9jYyWmCox9mXUFOVK2Y
 mWMexKnqgaco9aYGeQoW+UVRszMiYRQODbdtV8VzzHrqod2pnc0dvI2CGPQv2bxqbouGcq1aqsE
 pBUaWm0/PqSHsNR8=
X-Received: by 2002:a5d:51c7:0:b0:2f6:efcb:5867 with SMTP id
 n7-20020a5d51c7000000b002f6efcb5867mr2116731wrv.41.1681483944170; 
 Fri, 14 Apr 2023 07:52:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZqR+pma+dgHJcLc9ildHwwxMZjVN0fzGLmArGZD8QLp+kw69QsSGmu1nzbuFOzhPxlowuAwQ==
X-Received: by 2002:a5d:51c7:0:b0:2f6:efcb:5867 with SMTP id
 n7-20020a5d51c7000000b002f6efcb5867mr2116719wrv.41.1681483943905; 
 Fri, 14 Apr 2023 07:52:23 -0700 (PDT)
Received: from [192.168.8.105] (tmo-096-44.customers.d1-online.com.
 [80.187.96.44]) by smtp.gmail.com with ESMTPSA id
 z14-20020adff1ce000000b002f28de9f73bsm3692642wro.55.2023.04.14.07.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:52:23 -0700 (PDT)
Message-ID: <c9233c89-4027-fac5-6155-a72e16ae118c@redhat.com>
Date: Fri, 14 Apr 2023 16:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] chardev: Allow setting file chardev input file on the
 command line
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230413150724.404304-1-peter.maydell@linaro.org>
 <20230413150724.404304-3-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230413150724.404304-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.282, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 13/04/2023 17.07, Peter Maydell wrote:
> Our 'file' chardev backend supports both "output from this chardev
> is written to a file" and "input from this chardev should be read
> from a file" (except on Windows). However, you can only set up
> the input file if you're using the QMP interface -- there is no
> command line syntax to do it.
> 
> Add command line syntax to allow specifying an input file
> as well as an output file, using a new 'input-path' suboption.
> 
> The specific use case I have is that I'd like to be able to
> feed fuzzer reproducer input into qtest without having to use
> '-qtest stdio' and put the input onto stdin. Being able to
> use a file chardev like this:
>   -chardev file,id=repro,path=/dev/null,input-path=repro.txt -qtest chardev:repro
> means that stdio is free for use by gdb.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
...
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c5..31d08c60264 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3360,7 +3360,7 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>       "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
>       "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>       "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
> -    "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
> +    "-chardev file,id=id,path=path[,input-file=input-file][,mux=on|off][,logfile=PATH][,logappend=on|off]\n"

s/input-file=/input-path=/

  Thomas


