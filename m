Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F156C3310AD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:21:49 +0100 (CET)
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGlY-00082S-V5
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJGBJ-0001hL-9E
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:44:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJGBG-0006Mj-B2
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615211057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hX6CKg2UlHIyYp9NWqb5qX6ObQHHkCNYnPOpQUFBO4=;
 b=fiIpJRiyPhak+ldZ7kcw+POahupI/OCA/OviUdUlJ9rUR/0ZQrQ3JjbW6qt6PfXpAoCVv8
 ZKB3Mxp+gMrMxpp05sCZ2lqvPfV6bmRMcaZPsrWLHXoFXIIbhgg/rAzjg1A+92OWwMbEF8
 5J7GXZrCMa3+Ku/ldK3Ryq5X2u34dUA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-Uo3hGkq3PrW2eWQFRlT1Ww-1; Mon, 08 Mar 2021 08:44:13 -0500
X-MC-Unique: Uo3hGkq3PrW2eWQFRlT1Ww-1
Received: by mail-wm1-f72.google.com with SMTP id v5so4981936wml.9
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:44:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2hX6CKg2UlHIyYp9NWqb5qX6ObQHHkCNYnPOpQUFBO4=;
 b=Sn9DjQXhkvEJMzYZZEi2zCp9iQicEO9l6YTyGKP7DVFKTRJ2SjE0y8pS+0fXOP3RfK
 Lu6m/yIOaQFZQbtIxIj/R0ywjB23sPLzumA11toW4T9sCFFOuDcGVEj0AgLzDs9CPZUG
 sVvQqe80AwDuOug+5OOVPIGSYwyyWUemf7n/qYdIJI+D9w7meSSZ4xs95o5yEfMKaJHm
 V0fpVO1eVJW/Yso6fXaZmtFrGA3tuc/KXHr+OxzhloCR1FNx5MHyw9Z2ac2JkuJhnIsS
 nLuo2nRpejJfa5gsvX4rxDb1anXveuzHx/YASbZg1kcVSfM//YOy9GT1ntOOdIp1WPfw
 JIaw==
X-Gm-Message-State: AOAM530s9MKOCATMsYlWP2HGWOszAI26AvvGCvKwyHk9osPsRxKhtI1K
 xY0WulUMaELr0VkAdVLcI9uhzhKGcTJBwjjxb7ZfHobAaapNufv7CGBm8+CDnaod/p0jtY4NuR1
 UNrNTKaIFwAZZ8YSpyDy8IXff8saz/h3SOkpO3dkFWFhhTc98xbfREuMEUzQcvPuPfBQ=
X-Received: by 2002:a1c:7519:: with SMTP id o25mr22281676wmc.103.1615211052472; 
 Mon, 08 Mar 2021 05:44:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylWoQqA76iSJMaEFbYJXqpJb+2fS+U+WFsBLlt4xevTh2YzUnNogqqYsR+zy25kBKUgBFvpw==
X-Received: by 2002:a1c:7519:: with SMTP id o25mr22281656wmc.103.1615211052182; 
 Mon, 08 Mar 2021 05:44:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y8sm18926924wmi.46.2021.03.08.05.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 05:44:11 -0800 (PST)
Subject: Re: [qemu-web RFC PATCH] _download/source.html: show the GPG
 fingerprint for releases
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20210308111649.14898-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <764b8f00-d582-45da-d18a-a130be0fc427@redhat.com>
Date: Mon, 8 Mar 2021 14:44:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308111649.14898-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/21 12:16, Alex Bennée wrote:
> +          managers key, fingerprint:
> +          <pre><code>CEAC C9E1 5534 EBAB B82D  3FA0 3353 C9CE F108 B584</code></pre>.
> +          Alternatively stay on the bleeding edge with the
> +	  <a href="https://gitlab.com/qemu-project/qemu">git repository!</a></p>
>   	<h2>Build instructions</h2>
>   
>   	{% for release in site.data.releases offset: 0 limit: 1 %}
>   	<p>To download and build QEMU {{release.branch}}.{{release.patch}}:</p>
>   <pre>wgethttps://download.qemu.org/qemu-{{release.branch}}.{{release.patch}}.tar.xz
> +# optional verify signature
> +wget https://download.qemu.org/qemu-{{release.branch}}.{{release.patch}}.tar.xz.sig
> +gpg --output qemu-{{release.branch}}.{{release.patch}}.tar.xz --verify qemu-{{release.branch}}.{{release.patch}}.tar.xz.sig
> +# extract and build

Maybe add some <b> to either the comments or the commands?

(For reference, the result is visible at 
https://bonzini.gitlab.io/qemu-web/download/#source).

Paolo


