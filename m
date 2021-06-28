Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA23B6A85
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:42:23 +0200 (CEST)
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxz1K-0000UA-Fi
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxz0L-0007Ci-SN
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxz0J-0005nB-Fr
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624916478;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6F+L8DLvarjHluFQqCrMzDGhh4Y9b+NnLOPJQsZ1j4=;
 b=LnYaGmCa64en6K+VKn9MtsIBySCOWSL071WqE9kGdLRRYs4vjyq+GUYk3jYCglrlzuy1+m
 5d41Fuftof/ArqwwvKvm+I8eTUgRvqrabFP1nrXzZju/4N833gaC6EHbJ/sDK/aYZ4pyF3
 Dj/GKsc4odUXdjZIMHCdUXH3y7YfbRc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-0n6oI045NrO0JIhRkGPbSQ-1; Mon, 28 Jun 2021 17:41:16 -0400
X-MC-Unique: 0n6oI045NrO0JIhRkGPbSQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 y29-20020a056a00181db02903062cdadd92so10086715pfa.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 14:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=u6F+L8DLvarjHluFQqCrMzDGhh4Y9b+NnLOPJQsZ1j4=;
 b=OCQCqgwGYvSuIYdmdVGcUvwOuU7J4liq6b+beCJxYxVWfSteFR/OQS1XcnXzsEZNlx
 7kAbj283ifYpwEbPoEL9fs8ykpWQ8VWe52TB59KUy5e9ajcTcq/sqNvcde9JIDPr2JW4
 OTSfevUCvKSX1/RloMwL4Bcsf3E5qgd/YSuC1KPyinbtX6PhmoirWgm0TUWUiXUcBjir
 kDTDHIrfoqgslN0R/qp9fuJnfucYlHeSjiWinkkWembJSJ9AWseruV/oVQW3Qd/iVXFN
 QlTofqzym1Hb6TTc4dz9/BCm6e/e4yDWipxpf8jsPOF4k5rBbf1/iV8uyDsSXLDZkDdf
 dypA==
X-Gm-Message-State: AOAM533Zgf2a0LI7xaTEl00QGgVpCLygqqwzckFtjUy2ns5W+X25JcAB
 MYEnxWUw1Vv9jZ1KGcpZTiQVNSZSxl+CXwhMwEJ8cTVvv8JYPi6pTIaKpUR9jPvKWxz/cbRBwFw
 EsJBwsLPoG+exVYs=
X-Received: by 2002:a65:5684:: with SMTP id v4mr24249026pgs.218.1624916475811; 
 Mon, 28 Jun 2021 14:41:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxckiz1Bkbn9DiGDTb9yY/vGBDl29bPn8DCbVT3D7AD9awNFb5UHcFLaKmelO6ARglTvwR5DQ==
X-Received: by 2002:a65:5684:: with SMTP id v4mr24249012pgs.218.1624916475608; 
 Mon, 28 Jun 2021 14:41:15 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id o14sm3319101pfg.216.2021.06.28.14.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 14:41:15 -0700 (PDT)
Subject: Re: [PATCH 09/11] python: Update help text on 'make check', 'make
 develop'
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-10-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <e7a566d5-7ef7-1b06-5f04-0cd10ea50057@redhat.com>
Date: Mon, 28 Jun 2021 18:41:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625154540.783306-10-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/25/21 12:45 PM, John Snow wrote:
> Update for visual parity with the other targets.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/Makefile | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/python/Makefile b/python/Makefile
> index 76bb24e671..4ed37c29f0 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -22,10 +22,14 @@ help:
>   	@echo "    These tests use the newest dependencies."
>   	@echo "    Requires: Python 3.x"
>   	@echo ""
> -	@echo "make develop:    Install deps for 'make check', and"
> -	@echo "                 the qemu libs in editable/development mode."
> +	@echo "make check:"
> +	@echo "    Run tests in your *current environment*."
> +	@echo "    Performs no environment setup of any kind."
>   	@echo ""
> -	@echo "make check:      run linters using the current environment."
> +	@echo "make develop:"
> +	@echo "    Install deps needed for for 'make check',"
> +	@echo "    and install the qemu package in editable mode."
> +	@echo "    (Can be used in or outside of a venv.)"
>   	@echo ""
>   	@echo "make pipenv"
>   	@echo "    Creates pipenv's virtual environment (.venv)"


