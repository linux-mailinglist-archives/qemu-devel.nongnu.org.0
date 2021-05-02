Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC9E370DA2
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:27:07 +0200 (CEST)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDzu-0007ID-E8
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldDxm-0006Z3-Jd
 for qemu-devel@nongnu.org; Sun, 02 May 2021 11:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldDxj-0000tF-4w
 for qemu-devel@nongnu.org; Sun, 02 May 2021 11:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619969090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bk3+s5W4135TkstKBxRO31sFBbPr60psefAgtjAxQo=;
 b=JzEYOaQFPdE8bfh7wGActXygGjNUe8e/YaO1H+FNKNBTBkbPX7TG5FR5yqBXrJ775ni1ud
 bf4ouSK9ILJUzptjiASNZlR7v8eIH+tARegDLQV9xFpilo4CW6JwZp6hXtKwLfsBEiTq1C
 mlNoOoo/ZWmdUMRThyxOCGQFjmDCEwA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-qLJp1QPCNMq6VFqhm8tUeQ-1; Sun, 02 May 2021 11:24:47 -0400
X-MC-Unique: qLJp1QPCNMq6VFqhm8tUeQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 q18-20020adfc5120000b029010c2bdd72adso2425000wrf.16
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 08:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+bk3+s5W4135TkstKBxRO31sFBbPr60psefAgtjAxQo=;
 b=H8y/qwdfzHo49wO3kJfT2aoaU8Aws7c77qO4qkkSwwUI3mSBd3sZTuOUFgcrksTAsf
 uR3WOBrAghIsDM9w67cXqZTjipfvcIENrunJmOnG+Ntr/N1r94XLcknOq8DRbbtp+T7H
 Y7QZSUIn+WvxQywHxfnwK2yIJaWRWmG3c9FB3PCMRdCdYRtnrlRbUdB1dajh03uwourT
 mA+OCUfHv+IU1EOtLcCFsWdqaxmQF6r8DJYL4eRLeqWUR8rbJyKnQ3WFK49EAhBt7mAM
 IS5riGVKH80iKKV69ozYk8sownNNZJcZNkoLlfYbZAzP2Hy85Hugu5Sx9O+oG0o4OE1K
 0fhg==
X-Gm-Message-State: AOAM533uTCDBPdCCuj5185u04NdqfNjQ7s8Oa7fdEHLU9g7C0g5gHERj
 k064stwcm5aqrFBPYRCR0HdKRj1a0sZ0Ln43uyJ50fwe1XvVj3nc+eCM5I3JkLfLA2OHviMHkIQ
 LNFHNHyX5qzbRldQ=
X-Received: by 2002:a7b:c006:: with SMTP id c6mr16891736wmb.129.1619969086299; 
 Sun, 02 May 2021 08:24:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg/j+gMlmxPFwpPRp56eTgl/BJUFfyNNTHRGQiiX7n2c4dKWJTJsLhmiUubVslk9T7dLk9WA==
X-Received: by 2002:a7b:c006:: with SMTP id c6mr16891712wmb.129.1619969086130; 
 Sun, 02 May 2021 08:24:46 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id h13sm4506764wml.26.2021.05.02.08.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 08:24:45 -0700 (PDT)
Subject: Re: [PATCH 0/1] Acceptance Tests: bump Avocado version requirement to
 87.0
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210414161144.1598980-1-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec80a132-969e-1428-51b2-05c94c2447bc@redhat.com>
Date: Sun, 2 May 2021 17:24:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414161144.1598980-1-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 6:11 PM, Cleber Rosa wrote:
> This is being proposed as a separate single patch simply to show
> that no known regressions have been introduced as far as the
> acceptance tests/jobs are related.  CI job:
> 
>    https://gitlab.com/cleber.gnu/qemu/-/pipelines/286347312
> 
> This version (and 86.0) contain improvements that address specific
> QEMU use cases, including:
> 
>  * Fix to the error message given when downloading assets
> 
>  * Asset listing/purging capabilities
> 
> Cleber Rosa (1):
>   Acceptance Tests: bump Avocado version requirement to 87.0
> 
>  tests/requirements.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Ping? This patch should fix the mainstream pipeline error:
https://gitlab.com/qemu-project/qemu/-/jobs/1229752162

(see
https://www.mail-archive.com/qemu-devel@nongnu.org/msg794416.html)


