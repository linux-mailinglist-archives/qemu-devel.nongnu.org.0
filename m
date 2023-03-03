Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1DE6A9CD4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:11:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8vt-0000Ol-Uu; Fri, 03 Mar 2023 12:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8vh-0000IP-70
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:10:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8vb-0000LS-QT
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677863442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXznozcde4JNECCbDoo2s84D2fzTy4iRNIr6fiWmvYw=;
 b=fGo5MRDM/+mXj681R/bzLmW4mpIWU498WrEfa5Jn7i+uGiWqZlI7m/kfKEPy/bNh1fskJe
 BryDmlewhANN86jKhIBxmZDaqJl6xIASny6anl98ve7yNgMuhkWU7pgaONaxlsVCxiAVZB
 LgR55PEwlTmd7TydaIXliQG5OHbxvB0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-_y2mnkgEOdmlFGLSFDTOCQ-1; Fri, 03 Mar 2023 12:10:41 -0500
X-MC-Unique: _y2mnkgEOdmlFGLSFDTOCQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z6-20020a05600c220600b003e222c9c5f4so1184892wml.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fXznozcde4JNECCbDoo2s84D2fzTy4iRNIr6fiWmvYw=;
 b=pVc46TmCrB1wDmbkS2zCoGjdj0kveSBLzDg02yrSzco3HLzpPKAE4Vef/UaozsSbQW
 WudKEur4H/ea0Z2Fh88jDlYZ2qgsRIgF+fJqHYbfAuqdsSofbNMVfHXbHVjmpUR2IDam
 aXAURCJmgtBsHaB0PA9z0jkjsixRHlXI8Ut5w17twGVdCI2IUkYZTXWeeWpo4FkYHco/
 3QuP4f0DCQhC9eFVxPg3F0IbHHIzLqXxZjCa8VxSeq3yd7zmEGnKlPhjGn8S0pGayHsb
 8vWJDQ0SQ1vwQGw1FidkSNYpz4NjS0rI63Q6He0ioLkaJ4pTw/XkEmG7XfbLis2hwb3Q
 5g6w==
X-Gm-Message-State: AO0yUKV0Co8WhCUGESuB4KDBKJe0rc1qZlKFodezDwSgcXaokN9J+MN4
 jt2Ylhl8uj4gF78MlkdA0jBM1JrFjQj+3RKpPybX4AdG3AqymQ5OcCfWBxr2i9ZLz3wAeOwHVrV
 IDWDOK5H3Np9nMK4=
X-Received: by 2002:a05:600c:1548:b0:3e2:1f00:bff7 with SMTP id
 f8-20020a05600c154800b003e21f00bff7mr1814565wmg.12.1677863440463; 
 Fri, 03 Mar 2023 09:10:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+8CTCnbc8TI/Q5+lt+uWdk3vV1NSC2dILVc9OrqzhTd4ZoCArbBRrTKmbhCcQyZ+W4oN/EdA==
X-Received: by 2002:a05:600c:1548:b0:3e2:1f00:bff7 with SMTP id
 f8-20020a05600c154800b003e21f00bff7mr1814547wmg.12.1677863440158; 
 Fri, 03 Mar 2023 09:10:40 -0800 (PST)
Received: from [192.168.8.103] (tmo-099-97.customers.d1-online.com.
 [80.187.99.97]) by smtp.gmail.com with ESMTPSA id
 he11-20020a05600c540b00b003daf7721bb3sm6769064wmb.12.2023.03.03.09.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 09:10:39 -0800 (PST)
Message-ID: <38bcd702-231f-cdde-cc97-ae72d8ec796d@redhat.com>
Date: Fri, 3 Mar 2023 18:10:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 0/8] iotests: make meson aware of individual I/O tests
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230303160727.3977246-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230303160727.3977246-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/03/2023 17.07, Daniel P. Berrangé wrote:
> To just repeat the patch 5 description...
> 
> Currently meson registers a single test that invokes an entire group of
> I/O tests, hiding the test granularity from meson. There are various
> downsides of doing this
> 
>   * You cannot ask 'meson test' to invoke a single I/O test
>   * The meson test timeout can't be applied to the individual
>     tests
>   * Meson only gets a pass/fail for the overall I/O test group
>     not individual tests
>   * Meson can't show the time of individual I/O tests, so we
>     can't see why 4-5 are consuming the bulk of the time
>     and ripe for optimization
>   * If a CI job gets killed by the GitLab timeout, we don't
>     get visibility into how far through the I/O tests
>     execution got.
> 
> This is not really specific to the I/O tests, the problem is common
> to any case of us running a test which is in fact another test
> harness which runs many tests. It would be nice to have meson have
> the full view of all tests run. Adapting the I/O tests is as easy
> win in this respect.
> 
> This switches meson to perform test discovery by invoking 'check' in
> dry-run mode. It then registers one meson test case for each I/O
> test. Parallel execution remains disabled since the I/O tests do not
> use self contained execution environments and thus conflict with
> each other.

Series
Tested-by: Thomas Huth <thuth@redhat.com>


