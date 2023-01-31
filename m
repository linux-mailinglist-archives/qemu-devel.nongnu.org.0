Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398F6682C06
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:57:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDj-0007Y0-5i; Tue, 31 Jan 2023 06:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMpDL-0007B3-PR
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:54:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMpDK-0002Sb-Ad
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675166053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Op2cGS2I8jxRJUQlFoQgdVREAiR/oEK5vCO4WcS+YUg=;
 b=dzZ3YQMFUzt0/C//7xqrvCV8/DgoPMBJPAYbQsqCibkmbNkppJqr692cf+mlsd5gBfg/nE
 Q2oprHwCO5nHpT4DJ502CIK1KQ3ScMgQpGC9Hb4G/BqhJ1kUWEzW25gSNh7Eqgaj5tQ5wx
 5dKR4fHwm/Jw6L/AIEZhoaHfM4qCJh4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-aKxFNut_MPuQANrAj2pzbA-1; Tue, 31 Jan 2023 06:54:12 -0500
X-MC-Unique: aKxFNut_MPuQANrAj2pzbA-1
Received: by mail-qk1-f197.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so8859947qkl.9
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 03:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Op2cGS2I8jxRJUQlFoQgdVREAiR/oEK5vCO4WcS+YUg=;
 b=QEgQH2bZbOAXubGCiqMLWh3KMsQtMogaRt+LCzlEcFScSspEC9TciiqnD3bZ6C0dCW
 SQDErrMb8NnOHKp+BwYXLC59+GFfRWT0ia8DHaxWG0ZvxGb8+5TQKKYnt1kDGgGhRcxp
 Eo8ru8wcOAjHc4yMfLkf0CNt87bmjzrA6zgYPmydHZeT1Hqa+flXawTp+B74CK0t3Nsz
 uqnK2NGpxZ2T1ZJeIaZ4WZOMf+zARh2G80npetQNbb5vZluxOHC4JT7mRXLT5IkOP8Ll
 8HI932vVhvv8TbQGbDuvYWpI/qW63WlzeT/d0yzUFgd5OBJNYqSDIe7lqzpFP7GkkbY/
 a17Q==
X-Gm-Message-State: AFqh2krTcWeGv+pbgUxpOBpq1+POe6sltcr5y61OobGX4vXgEAyIH3C1
 M5UDv1QOLT4aFEax3KM1H/czwtzjAoHmw6OYQzT8lu0SZUvEphM4+MZ4OupH8eqyTvkt+Fk32gm
 iPB6ddULGY96IUjQ=
X-Received: by 2002:ac8:53c6:0:b0:3a5:d1a:8f1d with SMTP id
 c6-20020ac853c6000000b003a50d1a8f1dmr82633705qtq.27.1675166051748; 
 Tue, 31 Jan 2023 03:54:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXstoYo5tjZ3CfCCCROgQp3ifaxVq7+AzFDmJizRt/rgBm9Rjs2ZM8juguJ6IEWSesgNhas9FA==
X-Received: by 2002:ac8:53c6:0:b0:3a5:d1a:8f1d with SMTP id
 c6-20020ac853c6000000b003a50d1a8f1dmr82633676qtq.27.1675166051561; 
 Tue, 31 Jan 2023 03:54:11 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 u4-20020a376004000000b006fc3fa1f589sm9894732qkb.114.2023.01.31.03.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 03:54:11 -0800 (PST)
Message-ID: <a8740746-dceb-8f66-c0f5-6e5af7f97ab5@redhat.com>
Date: Tue, 31 Jan 2023 12:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 6/9] tests/qtest/libqos/e1000e: Export macreg functions
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>
References: <20230130140809.78262-1-akihiko.odaki@daynix.com>
 <20230130140809.78262-7-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230130140809.78262-7-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 30/01/2023 15.08, Akihiko Odaki wrote:
> They will be useful for igb testing.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/libqos/e1000e.c | 12 ------------
>   tests/qtest/libqos/e1000e.h | 12 ++++++++++++
>   2 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



