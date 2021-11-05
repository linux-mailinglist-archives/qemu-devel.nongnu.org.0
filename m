Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF094466F5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:25:54 +0100 (CET)
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj22L-0006uE-JV
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mj1wY-0006zi-57
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:19:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mj1wO-0000KF-5N
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636129183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDNbqPJ8a/Az0zn+2YxIGgzz/QKquWqg/kHPO/ej/5w=;
 b=QZmDY0uJJXj5gToBeKYvBbmqkAdorKhTaLCYe86A+bnzorPoHm5BT2q0IcjygyvC2T4O1u
 /l1ILpS3ZojHbWPRU9QIXtFWfLPi/BDB6R76OQTiw8PZIGZA8Yus83a3htHa9Cc6oqXElX
 VvO0aZ/3LPE4w8m9dQifCNc0m9J9SW8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-P_Bw5ME5NLSaVPn_IEpnBQ-1; Fri, 05 Nov 2021 12:19:41 -0400
X-MC-Unique: P_Bw5ME5NLSaVPn_IEpnBQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r6-20020a1c4406000000b0033119c22fdbso3475806wma.4
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TDNbqPJ8a/Az0zn+2YxIGgzz/QKquWqg/kHPO/ej/5w=;
 b=vFEGazx1E066mSecWI7eSsV9MBciHZfsFeN+38IhBEClYj/j/ch2sWUp0KrcMe/qHH
 oYG+zAdHoZHryrbXTnHZnvhdC6oVvgAiCijZa/+Mg8b1/J8Ja4or13anSzqhM6hFhWJz
 bHQ0pbCc6rzMpPDIgfA8LFbNfLg98nSkSKZZI8ghgiZd2P3wlIMpeFNP7AKP/38Bt8OJ
 d/KFsgp41gCBsUwmYK056cAMI0QeQAHhxU7+on+wZRM3bnHiDK1DG6IpERPTgFb1EZwJ
 67ndTdy8br+5HNsfTQMbCjC6H4OuvHTwSaCXuf01NYJP7Au5uVS9uw75UwYzJ9GbznGv
 9RfQ==
X-Gm-Message-State: AOAM531ClaF0X9e6kGaUISClz0YvVJceO8GdwDyt4LpFojayy65wFmnt
 ydwlhIzmyG/0/ezrHAKzaSTW0TMoS/ooHkIF7J/7zWlPrhSZqZJTf3UNjtdh5/vBIXkTqCQ4H9z
 b1kD6Vp0lsq+SX54=
X-Received: by 2002:a05:600c:3b1b:: with SMTP id
 m27mr22998886wms.125.1636129180722; 
 Fri, 05 Nov 2021 09:19:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGKQUSLiBkMz3I03hupOnicpHVHGC7ZU5r13H2XIax7vjELGWpccLkNDnze4K62elnC217SQ==
X-Received: by 2002:a05:600c:3b1b:: with SMTP id
 m27mr22998852wms.125.1636129180530; 
 Fri, 05 Nov 2021 09:19:40 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v185sm11590507wme.35.2021.11.05.09.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:19:40 -0700 (PDT)
Message-ID: <4f8f6425-7b5f-644c-6b80-bd5432d08015@redhat.com>
Date: Fri, 5 Nov 2021 17:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211105155354.154864-2-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 16:53, Willian Rampazzo wrote:
> This introduces a new `make` target, `check-avocado`, and adds a
> deprecation message about the `check-acceptance` target. This is
> a preparation for renaming the `tests/acceptance` folder to
>  `tests/avocado`.
> 
> The plan is to remove the call to the `check-avocado` target one
> or two months after the release and leave the warning to force
> people to move to the new `check-avocado` target.
> 
> Later, the `check-acceptance` target can be removed. The intent
> is to avoid a direct impact during the current soft freeze.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  docs/about/deprecated.rst | 13 +++++++++++++
>  tests/Makefile.include    | 17 ++++++++++++-----
>  2 files changed, 25 insertions(+), 5 deletions(-)

Typo "target" in subject (no need to respin).

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


