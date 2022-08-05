Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC8258A976
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:26:47 +0200 (CEST)
Received: from localhost ([::1]:47602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuXW-0000rZ-93
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJtqW-0002Av-VM
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:42:21 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJtqV-0001x1-Hh
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:42:20 -0400
Received: by mail-ej1-x62a.google.com with SMTP id y13so3979491ejp.13
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jk9HaxNJT3DLdL82BUCJ/ERZ0VWF9ZdlQdBM0+Vtk3s=;
 b=ay/PuE5405gy6g0VSexIQjOP32RtDoyL+DNErgZXI/w4X7T3jGhI3fk1U2qfsyjEXW
 NzogVigQG/409TQIa/16npJIO+kkTjat4+igO1qOWu15nzkhSUOykrZrQ6gc9LKvGRHI
 FgX0F4GZD56rodJjivHLaWFXG0gYxxACTbn3cMthR9UwIi21CyJc0EdlvHmjl/dbgrin
 ZEo212xWgk2GBtOKwN3ejzvAR3PhyH+Fh5b3yfP7HM1LgbmobOwsoTc5e6osSbNMY5Dh
 QXx4pqWbcevlzDeJzd7Lm/VtafBoIHz2B+7eThv7sLZ96b+eO1bE0Gf/9js3Iu3IBkVL
 LfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jk9HaxNJT3DLdL82BUCJ/ERZ0VWF9ZdlQdBM0+Vtk3s=;
 b=7DwR5T53EDOMyt8y4SgZ1yvSdN0HkwHhLIKl9mcROScpyKmBoTvMrJ+t8eYvcZO8N7
 /C33h5b2Nfpp1e+uPL0MwD7m44ifx0Spf4w9u5kDDVSBmPyQwmQMKSvk28EsvDSwbnIQ
 /f2D9CZ4NNWsjVkClI0smfCu5g4VzdMg0DdqMOZRnIeEFNi9wSexxA7Yhjlqt22kBaxl
 W4CyfxPjLa1af4b1LNmkZ7NNf04lirGkzD5WuD9oF0knze4GaX70NPofom7pSeAVT9/C
 ODDTWru+xRL0qHmKelH5Utxk+ROx/XqCw36CA4JrDaQd5Q5BVfdQ2PtV0+Q4DY2i07Ki
 DO8w==
X-Gm-Message-State: ACgBeo2eq/pT+JpjAD98dXszdSjnNb0qK6zRiP7vNALAoGACvcMd75ga
 SSfEj/jXKY/tBglwuSjRHRf1K+xxpI122Q==
X-Google-Smtp-Source: AA6agR41hyu6aTyTAKiiMP5t84biCIeMDE03+SM3ldNo/2w+o7OKL9tBpTsl3OJs7J06d/jAn2rn3A==
X-Received: by 2002:a17:906:4793:b0:730:853a:e3ac with SMTP id
 cw19-20020a170906479300b00730853ae3acmr4820191ejc.652.1659692537147; 
 Fri, 05 Aug 2022 02:42:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 j27-20020a056402239b00b0043d6ece495asm1778463eda.55.2022.08.05.02.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 02:42:16 -0700 (PDT)
Message-ID: <bb7b6dc6-c500-f5f4-b88c-2b04ec1e0afc@redhat.com>
Date: Fri, 5 Aug 2022 11:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Regression in -readconfig [memory] size (was: [PULL 13/27]
 machine: add mem compound property)
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
 <20220512172505.1065394-14-pbonzini@redhat.com> <87czfcof27.fsf@pond.sub.org>
 <87pmhf6nrv.fsf_-_@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87pmhf6nrv.fsf_-_@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/5/22 11:30, Markus Armbruster wrote:
>> This appears to change the meaning of
>>
>>      [memory]
>>        size = "1024"
>>
>> in a -readconfig file from 1024MiB to 8KiB (1024 Bytes rounded up to
>> 8KiB silently).
> No reply so far.
> 
> If we can't fix this, we better mention it in the release notes.
> 
> Can we fix it?
> 

Ugh, I hadn't seen it.  Let me take a look.

Paolo

