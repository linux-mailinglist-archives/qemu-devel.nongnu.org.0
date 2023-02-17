Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A76769ACED
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 14:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT152-0008Jh-Qj; Fri, 17 Feb 2023 08:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT14p-0008J1-Ff
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 08:47:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT14n-0002pl-Aj
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 08:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NV1+KkcBb35+xZP15Xazh5vsZZnqqwBc9RR+t5xzvJk=;
 b=Ati9KCwDmwyBoOQM5P9/Tee1G/xePV8e8FE+JrpiqAsdfLaG8Gm84GGY5UWQk3YTLnJIUa
 intkbx4GMYHLHiuDJk+sDD4Bhowv780rW7cwOXMC8RW8iLym+doGdGrls0FwJU7v2/vPsE
 wcYpyTgB0RhCYgY5vhOMtt1wc14eBbE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-LNWcjIVKNnGFDQVcnN63Zg-1; Fri, 17 Feb 2023 08:46:58 -0500
X-MC-Unique: LNWcjIVKNnGFDQVcnN63Zg-1
Received: by mail-qk1-f200.google.com with SMTP id
 y4-20020a05620a0e0400b007389d2f57f3so39305qkm.21
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 05:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NV1+KkcBb35+xZP15Xazh5vsZZnqqwBc9RR+t5xzvJk=;
 b=JKIOB+dHFQPj4atRRtVTK8tENc+Mxv/d4cCfR8bXw3SCBRnGWrSSJCZvLlDWPAMrtT
 C0ayzKNt/GblADjClHXfIsVq02nSLkHftBJWQ7OhQWpZVDHjMPMPEjVeiUE/876Et57w
 DFlfiecreLx1EhJ6yaDIYrqkxc4TT87TxUmoaeW9g8zDJiVr2/Mf/3WXdHRj2bnWIGkZ
 wXAhncke+95wThD1sDLfctXjf/rv2BT7eoD8v/3ZaNeqBpIEoH5mYzG8eJA/ljByLXUF
 UMUZQ7773Rl47pgYhQTSN3SusQbqogZT2CjnFcLz6jiQktdxUhxNrMkT/E8fwcq83Qrx
 rY8g==
X-Gm-Message-State: AO0yUKU82io72GmKP1Mk85S92FADncAVRTRL4L73zoQREbnyzrtonW16
 q0DJCj6SLb5ELz4ph77owVXT0dtwAO34eygOgHuAFqWPVl5+aYGPNG1I118fw0eTdKCsR9JXejv
 BbxLIOTemxXa1oSc=
X-Received: by 2002:a05:622a:64c:b0:3b8:6d57:93ab with SMTP id
 a12-20020a05622a064c00b003b86d5793abmr780909qtb.0.1676641618085; 
 Fri, 17 Feb 2023 05:46:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/NSQhJfoml4dmScJQjbn3vjS9c3tQRZWVYUjHYf71YIlHRP1hW1tD0ChY7iXhH671PzTRDlA==
X-Received: by 2002:a05:622a:64c:b0:3b8:6d57:93ab with SMTP id
 a12-20020a05622a064c00b003b86d5793abmr780878qtb.0.1676641617849; 
 Fri, 17 Feb 2023 05:46:57 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-32.web.vodafone.de.
 [109.43.176.32]) by smtp.gmail.com with ESMTPSA id
 cp6-20020a05622a420600b003b9bc00c2f1sm3088287qtb.94.2023.02.17.05.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 05:46:57 -0800 (PST)
Message-ID: <ffe372fc-2842-bb64-6c0c-42dcd68da775@redhat.com>
Date: Fri, 17 Feb 2023 14:46:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <Y+9m6g0MAEfFNUYC@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Proposed way forward Re: [PATCH v2 0/7] Python: Drop support for
 Python 3.6
In-Reply-To: <Y+9m6g0MAEfFNUYC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/02/2023 12.37, Daniel P. Berrangé wrote:
...
> The long life enterprise distros are the pain point in unlocking the
> new of python features. So the proposal is that, at a minimum, we
> augment the current policy with words to the effect that:
> 
>    * For long life cycle distributions, QEMU will follow normal
>      policy for platform level dependancies / native code. For
>      Python modules, QEMU may choose to require a newer versions
>      than are available from the distribution package manager.

Sounds reasonable to me. But I think we still should also add a sentence 
where we limit the total amount of time that we promise to support a 
long-term distro. Otherwise we'll also get problems with other way too 
backlevel native code dependencies at one point in time.

I just sent a patch for discussion, shortly before I noticed your mail here. 
Feel free to grab the ideas from there into your patch (if you're planning 
to send one), or let me know if I should try to include the Python-related 
sentences in mine.

  Thomas


