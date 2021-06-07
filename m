Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862AC39DDBB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:34:34 +0200 (CEST)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFOj-0006f0-CR
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFN4-00058X-NV
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFN3-0004lz-0V
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623072768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bu1rJYAmMm2THcwnF2uzt6Ypq9rSlKlSaOfOes/Wdbw=;
 b=azQCJlLbOv+axq6+yfDiMQWkvaXYQFNvm5UNrLMYhhjFT5X17LL2z3wuJMY+vrP5zbwOHU
 ReR/uazP+IxohG8LWusLqjv4aGXZukAvcg7p5Dw2ky5Cs29yvxiG5LlCWkn4xgzdiBS1ps
 1luw4Iv7CuShKF1lA4q3c2sZP8ZQLWs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-E0XkAucBOO6Ftxeysf2N0Q-1; Mon, 07 Jun 2021 09:32:46 -0400
X-MC-Unique: E0XkAucBOO6Ftxeysf2N0Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so6824342wmn.9
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bu1rJYAmMm2THcwnF2uzt6Ypq9rSlKlSaOfOes/Wdbw=;
 b=GOBdzsx17wDgM1a/WxBmYMO9yWqvJ26T27NjNVuEgQ8Bj+8E3u+R4WIMDsSaTIM7w/
 wp5IoQr0Gz1kvjk29zW41lHU3+qNbuK1t3WBmO3xTxfpcR3O2Ywl7OBjyZmtSDe0gRBO
 sf//9KDzbjDwUHJFUC1NyakdGeKkKuWpigJ8Oo1e7Dm4jrBTdV/6g9g7POh0vdgQ3sdr
 maLZCyDpj51GjKlhbg6s8Iy07BHQ7quQuBheeere3E3MnrfHZEZ5YyW3rzlNCQS6KvDu
 euOuSj8a+EPRX0mwdxB3zPgH3Fi2vSVnm5wnMDpyQlMOwpYRjekKAVJ0qYE7MEJz3hkq
 Cygg==
X-Gm-Message-State: AOAM530VV06EVSO6AFxXUgbQatVRE/pavS1WFzfI2wVdRNT0F31Fvr0H
 Sb2CVsAD5PqX7b8fmb3KLaZaDa7XNsr35uiqlZKdSRUW0GzYZYbjwr6lKKSyO8n5qk+KoGHmJue
 NM5wyWnBBxWBMfno=
X-Received: by 2002:adf:f748:: with SMTP id z8mr17940860wrp.115.1623072765864; 
 Mon, 07 Jun 2021 06:32:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbiRcSdSRkTKvhSNZBKQDTPh94DZ6A9LJIu1mFXaWlgaPVLJqJ88k0CysGHNToAtBpAtWsQA==
X-Received: by 2002:adf:f748:: with SMTP id z8mr17940845wrp.115.1623072765726; 
 Mon, 07 Jun 2021 06:32:45 -0700 (PDT)
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de.
 [217.87.87.121])
 by smtp.gmail.com with ESMTPSA id s62sm17917975wms.13.2021.06.07.06.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:32:45 -0700 (PDT)
Subject: Re: [PATCH v16 07/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for TCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a0d40145-f6e2-6c98-05d4-8b37ae1f9d65@redhat.com>
Date: Mon, 7 Jun 2021 15:32:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-8-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, only run these tests if TCG
> is built into the QEMU binary.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-8-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


