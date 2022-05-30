Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1994537626
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 09:58:11 +0200 (CEST)
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvaHy-0000aA-T4
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 03:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvaAq-00028l-Em
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvaAo-0002X2-QK
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653897046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nru7Gl44mheu3lhjgA82SqpEabV6NbndrpFfvEhJ3qE=;
 b=Mjnup/rCVhZrOvvBbmVDujIT6qzUtDxSSrqHZkRsXKYmGC9lA5boutFL6MvZd2FuGxJFD2
 bGyrsZidEwsMiD4XFTKXn8sVO0yal6Wf/zH9NcjPmX4slEpi/dLE0k0XXyOaymduMTvi0s
 JJEP6y/fL+zT1Yk6ntTo/27e0Ljj+IQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-FIHSm3vcPx2B4lejFMp8Xg-1; Mon, 30 May 2022 03:50:44 -0400
X-MC-Unique: FIHSm3vcPx2B4lejFMp8Xg-1
Received: by mail-qk1-f197.google.com with SMTP id
 az40-20020a05620a172800b006a5faff65c8so3887325qkb.7
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 00:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nru7Gl44mheu3lhjgA82SqpEabV6NbndrpFfvEhJ3qE=;
 b=w/9M1Xtv5VbKf4MC+TaTBw9Aq0NXbp7puiHEla9Q6RZpPsGokr6X5ScqwHO2vygIo3
 vXSSHfuM19Hn/Ikn5Idzuf77gJ73jC3Wj2aDbRL1xXljgUbhAu8TKII7rjM/yAgjCTY0
 ccQ3rZHsOKnzcJYDIkJNgZ3xTRKNPBBuhxI5bDISgmzEY54E4m+TavTx9ddquGNdQ5P+
 nihBb8LfKEat8Yyw9jrtjtAmGr7+q1xMKMw2g+4lfatDTDZMf6JZiHmA8FhGnxvWrqAl
 mKE8PiN3hmtbAovNWKORGqGlvUA4tjgQpjQhDh4rO0rcyNxRVLghiFraDzkQ6Q1aazL3
 pzWw==
X-Gm-Message-State: AOAM5339B6xhEMVUqoMvVg78y0VYYavFwjZEeScPx8N14TZXgLpJpZR3
 +dVsct01S50hKwi9RwOQTgO+RlfF9a0KYnO882gNipf4RXy7e2p/mdMdxPhNhDUGFFTJsBtzeql
 q1C03eqWpvLmIUg8=
X-Received: by 2002:ac8:5852:0:b0:304:b65b:ac29 with SMTP id
 h18-20020ac85852000000b00304b65bac29mr132927qth.238.1653897044343; 
 Mon, 30 May 2022 00:50:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9xjPYOv6+eYpsN0eNgb8oldwZaVGyHNK4Yu1aMUdMZ6Y8xcSQ+85XuhlefUUhgpr58S4nTw==
X-Received: by 2002:ac8:5852:0:b0:304:b65b:ac29 with SMTP id
 h18-20020ac85852000000b00304b65bac29mr132914qth.238.1653897044119; 
 Mon, 30 May 2022 00:50:44 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 e11-20020ac8064b000000b002f940c06d93sm6871008qth.16.2022.05.30.00.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 00:50:43 -0700 (PDT)
Message-ID: <33179ad5-e4bd-7fc4-c742-76387042459c@redhat.com>
Date: Mon, 30 May 2022 09:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 28/33] gitlab: introduce a common base job template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-29-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220527153603.887929-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Currently job rules are spread across the various templates
> and jobs, making it hard to understand exactly what runs in
> what scenario. This leads to inconsistency in the rules and
> increased maint burden.
> 
> The intent is that we introduce a common '.base_job_template'
> which will have a general purpose 'rules:' block. No other
> template or job should define 'rules:', but instead they must
> rely on the inherited rules. To allow behaviour to be tweaked,
> rules will be influenced by a number of variables with the
> naming scheme 'QEMU_JOB_nnnn'.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220526110705.59952-2-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/ci-jobs.rst.inc    | 36 ++++++++++++++++++++++++++++++++++-
>   .gitlab-ci.d/base.yml         | 28 +++++++++++++++++++++++++++
>   .gitlab-ci.d/qemu-project.yml |  1 +
>   3 files changed, 64 insertions(+), 1 deletion(-)
>   create mode 100644 .gitlab-ci.d/base.yml

Reviewed-by: Thomas Huth <thuth@redhat.com>


