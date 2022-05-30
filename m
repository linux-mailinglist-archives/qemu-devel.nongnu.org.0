Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EB553777E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 11:08:33 +0200 (CEST)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvbO4-0000Qd-Gt
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 05:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvbJS-0006iO-P6
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:03:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvbJQ-0005zN-W1
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653901424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtslE/53gQjx4uHTAhdIPdl0Ch4DYe83TCaUKyWwUQU=;
 b=AR30GMi/pVYjUIwrfHRYttEP8/UiNsp8uID+Dv2+32ETg57MePaFppjvPLTDWB6UJR1/7L
 luhi2G+bLhM+DhJlJFLrb5I/l+M6dhmcVrKW8oMzXEgRrNo//hCDZnsgwSBzzuuxMPRIGq
 YYn8lLXkVeNFDkX0OGVgB8BnJDfjKZ0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-RfCYc69SMvyjjbgDOHq8pg-1; Mon, 30 May 2022 05:03:43 -0400
X-MC-Unique: RfCYc69SMvyjjbgDOHq8pg-1
Received: by mail-qk1-f199.google.com with SMTP id
 z13-20020a05620a100d00b006a3870a404bso8277198qkj.17
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 02:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RtslE/53gQjx4uHTAhdIPdl0Ch4DYe83TCaUKyWwUQU=;
 b=JIs6SX3UcWhID5suCug/7DIH+6dbyinFgPq7fzaLlAN4uPtv40TjGonj+LzpKti64W
 Ak500OFRPYtg4jmn7BQEwIw0JnC2vIT5vKsrcvdnGbVVCPRhWuMU7BBPr9UIQmZ8SLoo
 aTb2DkeZ94H6ZAB6rKdLF+8OY0iqKE6h4GIHljYukXo7des8qp+yPerwNcJGr6BOTCZT
 qCVZsI5L/eXjMu8XMLMG4+CUXqfpM2569vcCJ1KXFU2KW4Npj+c8Ga1sMgLwzcGY3nLV
 hQg+j1IakbyXfY7sGG7z8OeXg0WIKDcVCZpFCOm5MhXBm4BXWJFXK3Lxr/6m8Hrrm99H
 pBgA==
X-Gm-Message-State: AOAM531uR9Lt68wfSivokZXW7ioFPvUV+7CGOX/8DyvUvZzXI/p21LHj
 3RW/B3vglf6OF3M8S3qsSu9xyw3aTTf/lsHaqWH6duJqAcjHIfrJesgQP5ZYImKVOU/Dvsk5FWX
 gJmRzc9lNj4OgSOM=
X-Received: by 2002:a37:a285:0:b0:6a5:c3e4:59a1 with SMTP id
 l127-20020a37a285000000b006a5c3e459a1mr12727340qke.346.1653901421745; 
 Mon, 30 May 2022 02:03:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywKCYwAh4FhIdGRPix0b/0eHyDwTeOUAcBZ4Lr7W2wMwTBWU6fvcxA0kH56NPwCakivabRsA==
X-Received: by 2002:a37:a285:0:b0:6a5:c3e4:59a1 with SMTP id
 l127-20020a37a285000000b006a5c3e459a1mr12727317qke.346.1653901421530; 
 Mon, 30 May 2022 02:03:41 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 m21-20020ac84455000000b002f906fc8530sm6973495qtn.46.2022.05.30.02.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 02:03:41 -0700 (PDT)
Message-ID: <07eae71b-9219-850e-7c41-79d91e977ac1@redhat.com>
Date: Mon, 30 May 2022 11:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 03/33] gitlab-ci: add meson JUnit test result into
 report
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220527153603.887929-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 27/05/2022 17.35, Alex Bennée wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>

Please add the patch description that Marc-André provided here:

https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg05797.html

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20220525173411.612224-1-marcandre.lureau@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index dc6d67aacf..b381345dbc 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -44,6 +44,8 @@
>       expire_in: 7 days
>       paths:
>         - build/meson-logs/testlog.txt
> +    reports:
> +      junit: build/meson-logs/testlog.junit.xml
>   
>   .avocado_test_job_template:
>     extends: .common_test_job_template

Reviewed-by: Thomas Huth <thuth@redhat.com>


