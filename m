Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088193B6A95
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:50:03 +0200 (CEST)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxz8k-0005YG-3s
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxz7p-0004nT-1Z
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxz7n-0002cI-BD
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624916942;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyWkcjKyX1bixNGRl3UPSY0zXBpBq59WeWMKwrxNcpY=;
 b=NeqR5FhD6/5ughD+kDKRwain0xMpH7tZzPP/wSM13ZnHufF1UnO+BMZiSQiLnyLUMPhrMa
 iRY9/mEFGgH0d9fcg6q9JJTInoFYxRFt2GwK/pUEvR9eCMpK4nNqztkdWhbEzLzRVHONh/
 Q9CYI/6zS8HsKgcghsUy04tWJaAVfTM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-NmTtTd9jNRKoV08Eg65dSQ-1; Mon, 28 Jun 2021 17:48:59 -0400
X-MC-Unique: NmTtTd9jNRKoV08Eg65dSQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 o9-20020a6561490000b0290226fc371410so11730546pgv.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 14:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=gyWkcjKyX1bixNGRl3UPSY0zXBpBq59WeWMKwrxNcpY=;
 b=MuxhCOFV0sRrDoqq0cv/mnlTmLcxkSsXmuWHlKDug64eOdCOu0Vz7t6Oh/XFrzgLeX
 hNKg7FwRq2HSXPdKARfhuIssB5HuHVi0wsH4ImQIOPehrk74Ug4p5pOWdOzVTgV6YDAv
 FKWbgBmxST2NxeCU65CkL0Yq7GAxKTUccJbd7jVTMWlwIgM65mFh2RWsHnqOHhv/27v/
 SrDib10XTZb+g4V56STVaD00hkEchYLnloaCNA9PqxCVLXURMo74qZI5hEca2FGKW3u9
 SehU1w0ZspR2kMH6g6jUJUfHHZkyea3i/3DLB3tJ5UPFW7iNKodPq/JR09njk+o4nfOs
 tQ+A==
X-Gm-Message-State: AOAM53126LNhoXVi6W3ijudh0nJr7XUE1gXCjtyCfhktWwhcyrlLJ7pV
 CVHYT2nI2OfV6t1HVMASeIFTjwHaWpPc2L5mRVpZNzid9aL4aMQCfU9F7/rCLjNAzfE3+6MJMAK
 xasbi9vkjSmb41Vs=
X-Received: by 2002:a65:61ad:: with SMTP id i13mr25145461pgv.345.1624916938064; 
 Mon, 28 Jun 2021 14:48:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfM2gxgUjbHQhYtZynY8JTLzrQQgDzo573rPOkmj06UAKvj+8ZwJnSyky8goO35dMwz4aVtw==
X-Received: by 2002:a65:61ad:: with SMTP id i13mr25145450pgv.345.1624916937810; 
 Mon, 28 Jun 2021 14:48:57 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id v13sm506819pja.44.2021.06.28.14.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 14:48:57 -0700 (PDT)
Subject: Re: [PATCH 11/11] python: remove auto-generated pyproject.toml file
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-12-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <2f7fb21d-8544-e215-86be-e398f8e7c459@redhat.com>
Date: Mon, 28 Jun 2021 18:48:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625154540.783306-12-jsnow@redhat.com>
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
> For reasons that at-present escape me, pipenv insists on creating a stub
> pyproject.toml file. This file is a nuisance, because its mere presence
> changes the behavior of various tools.
>
> For instance, this stub file will cause "pip install --user -e ." to
> fail in spectacular fashion with misleading errors. "pip install -e ."
> works okay, but for some reason pip does not support editable installs
> to the user directory when using PEP517.
>
> References:
>    https://github.com/pypa/pip/pull/9990
>    https://github.com/pypa/pip/issues/7953
>
> As outlined in ea1213b7ccc, it is still too early for us to consider
> moving to a PEP-517 exclusive package. We must support support older
> distributions, so squash the annoyance for now. (Python 3.6 shipped Dec
> 2016, PEP517 support showed up in pip sometime in 2019 or so.)
>
> Add 'pyproject.toml' to the 'make clean' target, and also delete it
> after every pipenv invocation issued by the Makefile.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/Makefile | 2 ++
>   1 file changed, 2 insertions(+)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/python/Makefile b/python/Makefile
> index 06f78f760a..758ce2c8d8 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -49,6 +49,7 @@ help:
>   pipenv: .venv
>   .venv: Pipfile.lock
>   	@PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev --keep-outdated
> +	rm -f pyproject.toml
>   	@touch .venv
>   
>   check-pipenv: pipenv
> @@ -84,6 +85,7 @@ check-tox:
>   
>   clean:
>   	python3 setup.py clean --all
> +	rm -f pyproject.toml
>   
>   distclean: clean
>   	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/


