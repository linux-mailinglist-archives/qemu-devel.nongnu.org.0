Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B0E2DA218
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:56:34 +0100 (CET)
Received: from localhost ([::1]:33856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koutV-0005Cu-T7
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kouqM-0001RU-Jf
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:53:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kouqL-00021G-1E
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607979196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwadBAhnxAJ14cOz1YzpGRXsqf9uHr/Cau0UNcHJowI=;
 b=b7Bb5bzdvDlwlg9hQAyFoW4bXf62OBljGG8Yq1nAr1PyddSs3w51NF8CcT2NHY6T0TBisg
 Dx5v4bDweRvtsAgoJKpaYWsSKc5MP2c37aSudK8cYWnKEUbBvThV+rJtva3UWduPjTw/9r
 k1o1MkefXg56XGWUVscX3p4r7Jt7gjw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-JXBM2eSKN8q6a3avGBAUPw-1; Mon, 14 Dec 2020 15:53:14 -0500
X-MC-Unique: JXBM2eSKN8q6a3avGBAUPw-1
Received: by mail-qk1-f198.google.com with SMTP id a68so13449496qke.9
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gwadBAhnxAJ14cOz1YzpGRXsqf9uHr/Cau0UNcHJowI=;
 b=f1krwOOlwSOha6TgIE2mjbCRG+ApuSo0/vhk07wIjLQM/KJod73BP8eaJ41hHID4Km
 q8HuOHutaoIJof937NC1LDEObJiO8C5s7eZ14EiF/UEmsdwHZUgb5BQe+E/V6/8VdMit
 z5uZozhiDoXkwZdEnYqBuohGjLnA2hXYzWsgBpJShEgGaI1GAfwQSR1sLOf0eADqOEii
 xae1wu9gkd7R0v27WuR1mo6tLpcY2BuCsKI9wUO9deibOoNspoIFyUbSiF+Cij2Ku13+
 jDveqPHjp45RNIZJwBup0fCGD4kJGoWK7cNGVtUCKKRPDA08ylnd9h8xmZ5QT7OWKUla
 iEew==
X-Gm-Message-State: AOAM5313RQoZ1Ybiz78seepT1qfJL7kU/seEZkCfq8SnfSjoKdSL4qj6
 j7DA39z/BibG66FP38uwglKA6SIrlTwYpbXcCvCYTJBnpKxKbWvU7Lva4+64Gj3K/CEZiE8sVM+
 CoZL6+R4JVi0joUA=
X-Received: by 2002:ac8:1c1c:: with SMTP id a28mr33671034qtk.121.1607979193601; 
 Mon, 14 Dec 2020 12:53:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtMXOZEXFPorqEq9jIhNTh8z2C7v0N2WIFN4x9aqiwatVvZQwRBgo89M42cchp8NYjDjR3FA==
X-Received: by 2002:ac8:1c1c:: with SMTP id a28mr33671018qtk.121.1607979193459; 
 Mon, 14 Dec 2020 12:53:13 -0800 (PST)
Received: from ?IPv6:2804:14c:483:bb9::1000? ([2804:14c:483:bb9::1000])
 by smtp.gmail.com with ESMTPSA id c28sm8224503qtv.2.2020.12.14.12.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 12:53:13 -0800 (PST)
Subject: Re: [PATCH 2/3] gitlab-ci: Refactor code that show logs of failed
 acceptances
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20201211183827.915232-1-wainersm@redhat.com>
 <20201211183827.915232-3-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Message-ID: <a124f7ea-0c99-cd3b-6764-d37a01177092@redhat.com>
Date: Mon, 14 Dec 2020 17:53:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211183827.915232-3-wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: willianr@redhat.com, alex.bennee@linaro.org, thuth@redhat.com,
 philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/11/20 3:38 PM, Wainer dos Santos Moschetta wrote:
> Replace the code (python) on after_script of the acceptance jobs that
> is currently used to show the logs of failed tests. Instead it is used
> the Avocado's testlogs plug-in which works likewise.
> 
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>   .gitlab-ci.yml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


