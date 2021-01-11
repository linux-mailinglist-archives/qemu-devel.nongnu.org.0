Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF542F10C1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:05:40 +0100 (CET)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyv10-0008DZ-KU
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:05:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kyuye-0007Ue-CK
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kyuya-00023N-Au
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610362987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNYueOOzF1SbEw9QNtsfdS5LwjthZJcaMPbWz9ae2ck=;
 b=QkeD+Bp0HjfjhIBlZVhiYUMeMPFIHALUOpDilCozx/6e02aznBvJmeSjKhNd6IxT/XuYVj
 LWMdJc7Nb3cklBgNUDGBAPq72YAJzScWI+GHTjzaCW9Aa6VSmftjpgvf42WQxtd7gzb7CZ
 gcQqEZre3soZ+4ZD0wuDN8Gefq4DKZk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-FWSg-xBEO7SR4JIiEIHp3w-1; Mon, 11 Jan 2021 06:03:01 -0500
X-MC-Unique: FWSg-xBEO7SR4JIiEIHp3w-1
Received: by mail-ej1-f70.google.com with SMTP id n17so4912087eja.23
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 03:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iNYueOOzF1SbEw9QNtsfdS5LwjthZJcaMPbWz9ae2ck=;
 b=CYPaS2HVoskH08tssOfAlerqy6HLaU43KUHwoilEWk60QzcPje2uRdd5my6eIPdqNd
 COtPed/ZUUWPbsqsHNQ5/Eia1HP3EZtkGDnyfr/8LRsso56UN7Jhdnr1TF9IhZdk0pW6
 UBK/B6NMhnluZRk0j6+VbN15FPtJRrGzsQ77TGnymVkJZx8O1+0fz7dTY5OmWVe26KGm
 3fht6oo4bUWFHXce697NTRx8aUz6I6nzWDDkvl12PmBx7vYOHOg8h1LaEGSA7RGziJk5
 y+LAQO9X86Z5lJ5JPnacB4SPln16kQSpaTMJDxY4/Y8+EIlOrw7F/HTkAQwm/OAWvfxV
 UH4w==
X-Gm-Message-State: AOAM532ep/AV4ZlNxlbepx8AxYk47KgoW5aVTTATUeekfjwTQZZUlJZ8
 /wje6A57oPrftUgf8dGT4I+UBV9CcGFP+lhPjFudr4zndaFXCtmswTKBFdVXvOaoHlhv5qf6ssR
 eSHqF9OQQj91Kgqs=
X-Received: by 2002:a17:906:9a07:: with SMTP id
 ai7mr10524994ejc.216.1610362980185; 
 Mon, 11 Jan 2021 03:03:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmeYF9c2VC3iE1HAhnLbRnngoKeWd4IVsxLrHnxAUj3cztGwfzupxQq3uexDXTJIJLqdOvSg==
X-Received: by 2002:a17:906:9a07:: with SMTP id
 ai7mr10524977ejc.216.1610362979993; 
 Mon, 11 Jan 2021 03:02:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lr24sm6860017ejb.41.2021.01.11.03.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 03:02:59 -0800 (PST)
Subject: Re: [RFC] Using gitlab for upstream qemu repo?
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <672b8aa0-2128-23e1-b778-01a4d96b209d@redhat.com>
 <CAFEAcA93iYHz2aXUY+sXwNqwNT3MD0HD6V+JoJJWt+xO9OUZNg@mail.gmail.com>
 <20210111095747.GA43712@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6ed6d8bc-89df-fc7c-b1a9-50afcb518893@redhat.com>
Date: Mon, 11 Jan 2021 12:02:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210111095747.GA43712@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/21 10:57, Stefan Hajnoczi wrote:
> I will send a patch to point .gitmodules at GitLab. In the process of
> doing this I noticed sgabios.git is not yet mirrored on GitLab. After I
> create that repo (and any other missing repos) I will send a qemu.git
> patch series that references the GitLab repos instead of qemu.org repos.
> 
> We can perform the mirroring direction switch that Paolo described above
> independently.

So we have five steps:

1) pointing .gitmodules to GitLab

2) reversing mirroring so that GitLab pushes to qemu.git and not vice versa

3) adding a mirroring rule like (2) for qemu.git and qemu-web.git

4) moving qemu-web.git deployment from qemu.org hooks to GitLab CI.

I can take care of (2), and also (3) once we know it works well.  Once 
Daniel's qemu-web.git CI work lands we can also do (4).

Paolo


