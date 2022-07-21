Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34E657C561
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 09:35:31 +0200 (CEST)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEQiY-0008Av-9p
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 03:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEQfr-0006h0-DE
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 03:32:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEQfn-00066S-V3
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 03:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658388758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ggm0oMkCER0eoWCEk9prx5z7e3VAuyVjP9JBcLHbUE=;
 b=LZY1tZJocxxaOyrv8t/sNetIKkOGCe81WfcPiC95CPMNyrh6xNZ3a+trsg72nAjw1P90J+
 bpShxqwQdshN+r7tqg5ZlTtLgQ74831BDLdEBW8ldvrr500o3Msx8NtKIvwfwYGvOyUGKh
 c5y7okq7+utnmqVUjL14o8X9UQO7yMY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-L_UhAO8XMx2zjfjhC2SX3A-1; Thu, 21 Jul 2022 03:32:37 -0400
X-MC-Unique: L_UhAO8XMx2zjfjhC2SX3A-1
Received: by mail-wm1-f70.google.com with SMTP id
 131-20020a1c0289000000b003a32b902668so1018675wmc.9
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 00:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2ggm0oMkCER0eoWCEk9prx5z7e3VAuyVjP9JBcLHbUE=;
 b=pB5WCnv1O+yoYlOpvOHvwP54aQptkRM3EEASw09NVlI2ZA9hS8a3B3/79XMoCafu1X
 ziJL/EcGs2WsSR5IhKqM/xTm3B3wxenOf8OH39yR3VinXa5iZ8QqDwWcbXKk5XDoFFqf
 yKjG0c0cImKzKT/jxVZ4RWbXOKkV+EGSlEfu5zYuAOijkCJPtb2Th1pmJ7v7laY/rPsI
 2VW+0Jzd1Ng8XfK+sqwNWGLVWD56PPqSoKCduHdN9xehbS3TeeGKPWGOcSbT9CUw/GQh
 WAfWfct0UXgjleGdgdaTo4157NQP0NU9ofPPEMHCkJqqwd93ecfOL+H81UrLjGUAZMy7
 NY9Q==
X-Gm-Message-State: AJIora+jcMUI/J/I8QS0WarRzLuBP+CLlgpql8b7VHKkb6FMbgl+d6k/
 NFIPtnWfjEWV6L1okY17IwbcIDBZY8iSfxlegN3Snm46UVPAJUAnBnn2gx/q78l7BGsiCBhYHbY
 PVTItj7UbePeMDkw=
X-Received: by 2002:a5d:584e:0:b0:21d:bca6:234d with SMTP id
 i14-20020a5d584e000000b0021dbca6234dmr32917284wrf.314.1658388756266; 
 Thu, 21 Jul 2022 00:32:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vX1s5+/Xo0UzYWIfNGhHSBGyyPVxZLKW1hcKUgI1aA3R8ZmQFCctICTQ6z7KLSayUrSSAt6A==
X-Received: by 2002:a5d:584e:0:b0:21d:bca6:234d with SMTP id
 i14-20020a5d584e000000b0021dbca6234dmr32917258wrf.314.1658388755876; 
 Thu, 21 Jul 2022 00:32:35 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-217.web.vodafone.de.
 [109.43.179.217]) by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c225400b003a32167b8d4sm4701082wmm.13.2022.07.21.00.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 00:32:35 -0700 (PDT)
Message-ID: <c3dd51c6-16e3-d743-62aa-5831b830803c@redhat.com>
Date: Thu, 21 Jul 2022 09:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] gitlab: show testlog.txt contents when
 cirrus/custom-runner jobs fail
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Ed Maste <emaste@freebsd.org>
References: <20220720165159.2036205-1-berrange@redhat.com>
 <20220720165159.2036205-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220720165159.2036205-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 20/07/2022 18.51, Daniel P. Berrangé wrote:
> When tests fail meson just displays a summary and tells you to look at
> the testlog.txt file for details. The native jobs on shared runners
> publish testlog.txt as an artifact. For the Cirrus jobs and custom
> runner jobs this is not currently possible. The best we can do is cat
> the log contents on failure, to give maintainers a fighting chance
> of diagnosing the problem.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus/build.yml                        |  3 ++-
>   .../custom-runners/centos-stream-8-x86_64.yml        |  2 ++
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml |  2 ++
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml | 12 ++++++++++++
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml   | 12 ++++++++++++
>   5 files changed, 30 insertions(+), 1 deletion(-)
Reviewed-by: Thomas Huth <thuth@redhat.com>


