Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6AB4E9D99
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 19:33:15 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYtEw-0002uf-Do
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 13:33:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYtDH-0000mF-MH
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:31:31 -0400
Received: from [2a00:1450:4864:20::636] (port=43638
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYtDF-0004On-W8
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:31:31 -0400
Received: by mail-ej1-x636.google.com with SMTP id bq8so16209229ejb.10
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N81snXYJ9IZTyxZTHrXE2GeDCnFEWhxMEe92iOQk2RY=;
 b=V/di7e3KUYCSUIqotuPesHktAwa+0YI5pjJtG2t/LMfpiSiIYeH2/yesrtxUelGdQ7
 7x3AzQdjDQfK9PtF2BxJZs4pKCiVvbLYbA3qedu9HhUv7iU+PqHlUZ6weEQl+wH5JQGe
 asGTdi6rvsJhGxB7CHJmvtNyWvj/b155Tas+Cs25EpXhI2OGxTZXPjfA8rLR8PdUQmdA
 6h6eiysBbITgBBIQVKbZA3NHpsDY1mw3TXVthiATYB6OWZLkwBy3159cZpc0QbKTaPAe
 /Qxc3cdyoqmaex4/O1ExdfVViGcByLx+nzyRC6UIN+SnwXKR62wcShSfFIU4iCIyGcyk
 iu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N81snXYJ9IZTyxZTHrXE2GeDCnFEWhxMEe92iOQk2RY=;
 b=x74b/oyU0GPaH6aeTSQEH5xM0RAIqUE5jBJaxhdluW9WTDmDBWDYEmdcL/dthLwNtE
 6/WsRlCCSt4SzxPTr+SjnKIAQHpPtQBgrPy/ojHQjPIMiF2e2LQmmREdv/XqK6mr40GA
 NZN0Cdj2+h0Vyqr1S5HRmmVmDNIW5j1ECOJwh3tioTg90DPyJTHTh2Vxyu4sTQGIvcWS
 CuDEc3w9K9WAUG0ACpx1Gfu8Cve9q6g1tnZ/Tes1/Fhfj4dVJQ0iSGPCoKzM025baXzm
 ZLf3g/FNR+urwmT2nldYudvoV5HjszbwqN1nJeldUAc59ZFdqK1c3GsWaev50DCtshPG
 KOvA==
X-Gm-Message-State: AOAM5330YOVlGFZwvMQGVYUhGjvqQhiQsWastPI5btifkIg8z6YBdw+g
 C9xDtXHg44DXeuYIyvqUpTa8PH3cRwQ=
X-Google-Smtp-Source: ABdhPJxVeb1zVr5eyy6apdR+QK0OjK0YPLs7zXlaZorXJc5DISgn8Imyt4URCZZD84tFUssrxFcDNg==
X-Received: by 2002:a17:906:c253:b0:6e0:592a:49f8 with SMTP id
 bl19-20020a170906c25300b006e0592a49f8mr28065077ejb.707.1648488688462; 
 Mon, 28 Mar 2022 10:31:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1?
 ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.googlemail.com with ESMTPSA id
 e28-20020a170906649c00b006df6dfeb557sm6096651ejm.49.2022.03.28.10.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 10:31:27 -0700 (PDT)
Message-ID: <611a1f01-13ed-1cd2-31cb-8f80023a6b94@redhat.com>
Date: Mon, 28 Mar 2022 19:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 02/15] tests/docker: remove test targets
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <20220328140240.40798-3-pbonzini@redhat.com> <87czi6xbzo.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87czi6xbzo.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 18:44, Alex Bennée wrote:
> 
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   tests/docker/Makefile.include | 18 ------------------
>>   1 file changed, 18 deletions(-)
>>
>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
>> index a6a5a20949..8248cfdb4f 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -99,24 +99,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
>>   			{ echo "You will need to build $(EXECUTABLE)"; exit 1;},\
>>   			"CHECK", "debian-$* exists"))
>>   
>> -# These are test targets
>> -USER_TCG_TARGETS=$(patsubst %-linux-user,qemu-%,$(filter %-linux-user,$(TARGET_DIRS)))
>> -EXEC_COPY_TESTS=$(patsubst %,docker-exec-copy-test-%, $(USER_TCG_TARGETS))
>> -
>> -$(EXEC_COPY_TESTS): docker-exec-copy-test-%:
>> $(DOCKER_FILES_DIR)/empty.docker
> 
> Should probably clean-up the empty.docker while you are at it. It's a
> niche command but I wonder how we would copy new tests now?

You can always document them as an alternative to this patch. :)

Paolo


