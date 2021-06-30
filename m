Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76623B8523
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 16:37:19 +0200 (CEST)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybL5-00088S-02
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 10:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lybJe-0006l1-T3
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lybJc-0001rR-3K
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625063747;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKdLwDWP3LjiSSH8GM4/ORKFGgY3NSzw89aAbuEFwiY=;
 b=O7g7bacqLqFptagEjStqG0zufY8cxKG4AqCxusxTML/bKgD3+kbButbVzFvk5snkDIdQY2
 AoMBcMPBL+wS5aDNvkECWsBKL13xY4hJSnaleCq88MwWM19RwMSyveM0ER3lVykN0mqXHI
 XEkCLVEL3NYRDoGkyinVN4OU/qNUD70=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-W5LJuEAjN7SxRf-6lx1pCA-1; Wed, 30 Jun 2021 10:35:45 -0400
X-MC-Unique: W5LJuEAjN7SxRf-6lx1pCA-1
Received: by mail-pl1-f200.google.com with SMTP id
 a4-20020a1709027e44b02901289b070c11so1261471pln.0
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=nKdLwDWP3LjiSSH8GM4/ORKFGgY3NSzw89aAbuEFwiY=;
 b=dOrdW8MhxCabF73NQ/6QV8lERue8P/zZOY7ignaMlaA9GE2GIeQLospclP1ftqraU9
 B/QVa0mHfWTVp8i9vspFtNm4ZCGQSsxgZ53UZlMR4biecTrl+l3OtAsUAlxRAeUlsAzt
 4lu8kCiWmg6aTloqQNQ5vZPgPxDgMFTAwjYXt4Dsx6EHCSOV4Vcye7lDEuE36Q+y9fD0
 eEkJVmrNK0VCzkYsPF8fnGs0fPmy1yE7BHf8Og2VUizYIjippqOALKK3a8536jQStgDB
 k+gMqUcM/Zw1pM2mVVzSk+5dSib4DLqCiQIzgPQIwPO7e3sc0+0UZ1pbXczukm34h4D+
 aeow==
X-Gm-Message-State: AOAM533/5OLtRiivVrokeQNbj+PF1x4MdrkT8v2nIngQW4YVDFvgRzbI
 CpBlFXwoNX+N/rwAA5dY2MkmW2UsXFuoPcj0ivki8Dv/3BVmHZYhUQnmw6Glk7HiT7+FSqQw3UC
 dZIGWYfXuEYWYm/M=
X-Received: by 2002:a17:902:8d82:b029:120:4377:8e0e with SMTP id
 v2-20020a1709028d82b029012043778e0emr32720151plo.32.1625063744586; 
 Wed, 30 Jun 2021 07:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJkv/Mo2Y/WvjpJwMqDnAWwDeeoF6/HRNfwfZcK0ExmYA1I89NMuZBbpZ5ISmzvxEG2e987Q==
X-Received: by 2002:a17:902:8d82:b029:120:4377:8e0e with SMTP id
 v2-20020a1709028d82b029012043778e0emr32720138plo.32.1625063744345; 
 Wed, 30 Jun 2021 07:35:44 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id b25sm22208614pft.76.2021.06.30.07.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 07:35:43 -0700 (PDT)
Subject: Re: [PATCH v3 01/15] python/qom: Do not use 'err' name at module scope
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-2-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d7976862-49f9-f3fe-9808-d62f5795bec6@redhat.com>
Date: Wed, 30 Jun 2021 11:35:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210629214323.1329806-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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


On 6/29/21 6:43 PM, John Snow wrote:
> Pylint updated to 2.9.0 upstream, adding new warnings for things that
> re-use the 'err' variable. Luckily, this only breaks the
> python-check-tox job, which is allowed to fail as a warning.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> I guess that's good enough evidence that check-pipenv and check-tox both
> have their place :)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/qmp/qom.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py
> index 7ec7843d57..8ff28a8343 100644
> --- a/python/qemu/qmp/qom.py
> +++ b/python/qemu/qmp/qom.py
> @@ -38,8 +38,8 @@
>   
>   try:
>       from .qom_fuse import QOMFuse
> -except ModuleNotFoundError as err:
> -    if err.name != 'fuse':
> +except ModuleNotFoundError as _err:
> +    if _err.name != 'fuse':
>           raise
>   else:
>       assert issubclass(QOMFuse, QOMCommand)


