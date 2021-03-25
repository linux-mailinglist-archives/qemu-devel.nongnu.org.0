Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C39348E81
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 12:07:21 +0100 (CET)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPNpf-0005wI-PP
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 07:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPNo7-0005Ow-Oi
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPNo3-0000Qg-C7
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616670336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLUKDwz810ihi0JrMTPAqN8liYqC3TwKUnFw3br/BRc=;
 b=U8v2pf/TaClnWnTfVVKw2pybSr/L8tGaYFGpcRJn57vFXZcwttYSTwgYeUibs7yqXjrsjM
 v3cZu1q7RlA7E419NVaYdgnMe8t3cJwJRDQR6AGH8a7YzR+gEvZH+zej9z3UR3YfRn+mjg
 Zh5bLPftb7+2eoBAQXmE9rznD0izqN0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-CMDms5U5OKu43QvB5qavpA-1; Thu, 25 Mar 2021 07:05:35 -0400
X-MC-Unique: CMDms5U5OKu43QvB5qavpA-1
Received: by mail-wr1-f69.google.com with SMTP id m23so2476901wrh.7
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 04:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oLUKDwz810ihi0JrMTPAqN8liYqC3TwKUnFw3br/BRc=;
 b=I+IN6IFmqxaP+LgJ3icxDAJoAgNt0MXJ3/GeXCw3aRSXY3pXtA6a5LWtJBY4mvyGjm
 kIHRfgtidiWLHH++WlNSctnsWV5pvNYa7vBLEwk8fBiPULx+wSX2trwH5FBQ4rAIOAd1
 nypEoNGPNOqkBjUtsT4UHTwcJL+dz0Y3vfR3k+FzaGnQ9HZWCkLOMjLX6eENu3bYzCHL
 MkEOibI07AA+nuHQXP85UtKAHC4HcJ0arqATgXQumZcb6wZJo3PnvBwY0jI6e4/e/ZAw
 8J8/kOxFOh8SePCWOms2nM01RZEC/vLS4t+EKwJzl5xhrhH0LM+0noHt+5KNwb7WuO2q
 f5Fw==
X-Gm-Message-State: AOAM533SmTDgd27samOhN8SQHDukac8vC0JNQ6428hJKBSRGgej0cR/n
 mYvHZiqYCnAYFEAnNgtb8X28FnqqQPput+6xxZfj4tekQY4kVd121lTr4PVoXoA59HvummElejz
 o6YWOE+K0xttbu+E=
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr8114283wro.206.1616670334101; 
 Thu, 25 Mar 2021 04:05:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSFWjCpORVcn3WmmbAj34eXlMWZrQI1tKZQl+TrO6qBTtnSqGIKv8z1UX0b4hrBcOzD6xwvw==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr8114254wro.206.1616670333850; 
 Thu, 25 Mar 2021 04:05:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id 7sm5922069wmk.8.2021.03.25.04.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 04:05:33 -0700 (PDT)
Subject: Re: gitlab-ci: Only build /staging branch?
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
 <8ec8b3b7-12b4-b676-630c-972e7038ec7f@amsat.org>
 <74859ed9-6f93-0b8a-a669-6aef1e164e41@amsat.org>
 <1a70056b-78b4-c4f4-afc2-044aa499e1c7@redhat.com>
 <557c7ccc-ce30-a452-8904-590667298389@amsat.org>
 <CAFEAcA_GGr-BT713cWLbJCvMBdw_gn6+aMdPnb=5iN-eSP9nkw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a70af3b7-4500-edd3-9a85-242783b24b2a@redhat.com>
Date: Thu, 25 Mar 2021 12:05:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_GGr-BT713cWLbJCvMBdw_gn6+aMdPnb=5iN-eSP9nkw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/03/21 11:34, Peter Maydell wrote:
> It needs to be faster. Mostly I do check the gitlab CI pipeline
> status, but in the run-up to getting rc0 out I stopped waiting
> for the gitlab CI job to finish, because I was continually finding
> that I kicked off a run, my local build-tests would complete within
> an hour or so, and the gitlab CI jobs were still pending, barely
> started, etc. Turnaround on testing a merge must be 90 minutes or
> less, especially during release periods, because there are always
> a huge number of merges that arrive for me to test in the last
> couple of days before freeze.

Perhaps we could script it so that if the pipeline passes the merge to 
master is done automatically.

Paolo


