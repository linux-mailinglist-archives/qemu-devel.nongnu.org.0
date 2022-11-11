Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25E1625509
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:15:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOtu-0001Ja-3y; Fri, 11 Nov 2022 02:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otOtn-0001IA-Kw
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:56:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otOtm-0004QK-1e
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668153385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IV+KApyUvL231HPFD2hipqxuULFrlkXRZNLYoetf848=;
 b=H01zgxZesIg5TrmuB010XpipshhxEJvy3bOH39Mrn9vVq7xepaAEGbzSdtT9vA/Az2GJAT
 OK+xygmePjaBnkMqezLPIvtF9/pEEVI6hKfVwIAm0NPYif4Nqv9lBqNIrFZdBWX3UmaX3l
 9RF2AA4IvHIXfN0dTyh4dI765XwZGz0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-3FGIrq59NBicvvqUtOJbPA-1; Fri, 11 Nov 2022 02:56:24 -0500
X-MC-Unique: 3FGIrq59NBicvvqUtOJbPA-1
Received: by mail-qk1-f198.google.com with SMTP id
 bk30-20020a05620a1a1e00b006fb2378c857so3399237qkb.18
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IV+KApyUvL231HPFD2hipqxuULFrlkXRZNLYoetf848=;
 b=wkzYDaPgjH5pCFQDdPEgd2huCwiFC4VR+lh/CYMLv4T0ZmVoaPEP9OHGxmTFVc5eYP
 YxnyxZKf0y+5ycDr7O0XeQTQtgZaK4meRcUqf1F/coZsL2bPt4dA7IoJ15qZxH1tBkY/
 1zQbWB4nRUyHlCgFCKv2voi2Ebx/NBV8bGpOtw2cwmU1CYGWCOabrHrqvQGi6zVTBIPH
 k+eRBxsBYE0TBu9ijBZMS5nDAn9wBc4ox+DYBJXA+1PvSA1xVYkCpFr3qNIVo6mUKLtA
 b4JLRoIeo2bd8qu6d/iECaaoKNnrkve6kjNgo+B6WuICJas1glVrxuf1gAuKFPEtSaQ2
 XI/g==
X-Gm-Message-State: ANoB5plmtmvNnpKdiw+OCLZqqEaNcDKKMQVIzshq16tWqitk6aMDewjf
 bFQJcAIOmJ1ZhMv7BWkIeK31VkWyob1nCIV3cOzxihLjNGSa2kubYr9sbR93gxxB+DY3/R9EMs6
 hjiTCEvAVLpmjRa4=
X-Received: by 2002:a05:620a:1213:b0:6f9:fe9f:3335 with SMTP id
 u19-20020a05620a121300b006f9fe9f3335mr207197qkj.201.1668153383760; 
 Thu, 10 Nov 2022 23:56:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4M7kPEpNXBbR1CRd1s3CflIyRpzOEgbB5OhvGhay5Q+ykmTuKJxD6/yGsjYhDft46bNOGhfA==
X-Received: by 2002:a05:620a:1213:b0:6f9:fe9f:3335 with SMTP id
 u19-20020a05620a121300b006f9fe9f3335mr207188qkj.201.1668153383546; 
 Thu, 10 Nov 2022 23:56:23 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a05620a409500b006fa4a81e895sm1102846qko.67.2022.11.10.23.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 23:56:22 -0800 (PST)
Message-ID: <b3d98826-7727-fa12-a302-47194cd24f85@redhat.com>
Date: Fri, 11 Nov 2022 08:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 13/18] tests: add migration tests of TLS with x509
 credentials
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-14-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220310171821.3724080-14-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/03/2022 18.18, Daniel P. Berrangé wrote:
> This validates that we correctly handle migration success and failure
> scenarios when using TLS with x509 certificates. There are quite a few
> different scenarios that matter in relation to hostname validation.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
[...]
> +static void
> +test_migrate_tls_x509_finish(QTestState *from,
> +                             QTestState *to,
> +                             void *opaque)
> +{
> +    TestMigrateTLSX509Data *data = opaque;
> +
> +    test_tls_cleanup(data->keyfile);
> +    unlink(data->cacert);
> +    unlink(data->servercert);
> +    unlink(data->serverkey);
> +    unlink(data->clientcert);
> +    unlink(data->clientkey);
> +    rmdir(data->workdir);
> +
> +    g_free(data->workdir);
> +    g_free(data->keyfile);
> +    g_free(data);
> +}

  Hi Daniel!

FYI, this seems to create a test failure with Clang 15 from Fedora 37:

https://gitlab.com/thuth/qemu/-/jobs/3304199277#L3761

Looks like data->clientcert has to be checked for NULL before unlink is 
called with it?

  Thomas


