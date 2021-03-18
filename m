Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF343403CC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:49:12 +0100 (CET)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqDH-0002MZ-2h
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMqA2-0000ze-A4
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMq9q-0005tM-Ox
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616064337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7LlrHIfvSIxNGtpJ7mGo849oIGzGK10kPleDNGb9M+0=;
 b=e8XuRZ4VjBCMnLMheXNey82AY9p27RDXDtzEtxMh8lF3dBi8iVcD0+hZ6jigWYUVVzrGAZ
 pUsN3MQDBsRM6O/c09zdRDth5YZr0RdNbplrCZsh66BJGl+26Zr6ldWNH0kc061n0+xGcp
 UpCUSTSoCXXq0bO2MT6W9L6AWZSzwJA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-5UHkOMsjMZO9LBYa9fkHxQ-1; Thu, 18 Mar 2021 06:45:33 -0400
X-MC-Unique: 5UHkOMsjMZO9LBYa9fkHxQ-1
Received: by mail-wr1-f70.google.com with SMTP id 9so4331366wrb.16
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7LlrHIfvSIxNGtpJ7mGo849oIGzGK10kPleDNGb9M+0=;
 b=cFOyIUX0pwU1Am0U5ly5y9WPD7uqJL/vATyfIkQvaWuNQz9ITIfK+KoVUlP2jaCDQg
 xY8qiYVSq/cgvkuhAH+mG1vKur+AcF19SB6VsAecU6ZsNr3Q6pyPw3B6Hjq+eCrqi7hM
 TEMMDrjEcjpF0u0k8vp5sXxqLtqcOyrAzCt/Z/kMZo+XjPV9Hs4w5GdjB+XrRW17/dBI
 iTEsy8qcUz0qp0ULuvEboowiswXxJby77ViE3KrqoCkjJdP4vAthP5pe/S/cqQX2t29K
 ERvgg9ZcIVHaspnr8dvf58wxvTTEBbYQYdlLK8XgHm+U1ZETk8If+DJI6rf13TDhPYro
 k6Ug==
X-Gm-Message-State: AOAM533oOQ7Q9I3q3ZLrncYiGdTSvvFQlFc3hE+SGtiqu8Kt+m+DXXGt
 YtygbnZDiaVNPZzkymGHr623CUquaYBSqUbcPmi8TDDQIyZ/XjP6NpJAKgVyiatoO7h3x2uBKEr
 JOYR39kZNX8aE2UE=
X-Received: by 2002:a1c:7704:: with SMTP id t4mr2922823wmi.159.1616064332543; 
 Thu, 18 Mar 2021 03:45:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRqBMYvc1Sy6VhcRlsKorIifoOTIYd7bYXmDAVVm9zQlVnyYuRToVyRQ3lwl++YIL/GaixAg==
X-Received: by 2002:a1c:7704:: with SMTP id t4mr2922807wmi.159.1616064332370; 
 Thu, 18 Mar 2021 03:45:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d13sm2570596wro.23.2021.03.18.03.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 03:45:31 -0700 (PDT)
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <a90be442-97c9-cefc-df6f-655a6387d54d@redhat.com>
 <CAFEAcA_BcRkJHjoRaxQs2ZO=JJqPpvGhHkG2bNJOqh_-EHr_xg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0644d4cb-cfc6-83f0-5887-2bff29cb58c4@redhat.com>
Date: Thu, 18 Mar 2021 11:45:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_BcRkJHjoRaxQs2ZO=JJqPpvGhHkG2bNJOqh_-EHr_xg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 11:40, Peter Maydell wrote:
> On Thu, 18 Mar 2021 at 10:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 18/03/21 11:06, Laurent Vivier wrote:
>>> This also removes the virtio-devices test, I think we should keep the
>>> files, but in the files to disable the PCI part when it is not
>>> available.
>>
>> I think we should just shuffle the targets in the gitlab YAML to bypass
>> the issue.
> 
> Then we'll hit it again later. I'm pretty sure this isn't the
> first time we've run into "some test makes dubious assumptions"...

We can both fix qemu-iotests and CI configuration, but m68k is certainly 
not the culprit here.  And we are going to make more assumptions over 
time, not fewer, in order to keep the CI time at bay.

Paolo


