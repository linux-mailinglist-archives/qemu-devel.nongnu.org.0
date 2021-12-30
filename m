Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C7E4817D7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 01:06:50 +0100 (CET)
Received: from localhost ([::1]:48188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2iy1-0006yR-6b
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 19:06:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2iuT-0006IQ-39
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 19:03:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2iuR-0001ZG-5N
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 19:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640822586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/TewJEjzWTak4OyX/U53nY+JkMnlA1LkYB5taKKqeiI=;
 b=aO6ftz66exr5hqJbqs2zluzAVACF3uIHp+jbzgmNJ4A0spG/kubv023uEcpycaa6+IB+m6
 m+rjilOXtbL4LctNPzSNFn3KTFeIlsmCojGTWM5P2dVphdd1e0AECKAVLlnR7I9QPfw5iK
 zCmGjyAjeX06XcX/D1jbh/JVD2m8Vk8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-6HRpqm3JP2KUOnDc5-cRhA-1; Wed, 29 Dec 2021 19:03:05 -0500
X-MC-Unique: 6HRpqm3JP2KUOnDc5-cRhA-1
Received: by mail-wr1-f72.google.com with SMTP id
 k4-20020adfc704000000b001a32d86a772so1989267wrg.5
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 16:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/TewJEjzWTak4OyX/U53nY+JkMnlA1LkYB5taKKqeiI=;
 b=aDiFUXhmRqaUaS1dRUxa5+XcsD2lpnQoEN0si3DWimjIdx1QcxG0sl3SUxKgvR2Wmc
 p3OLdiTe4oGhnd7J8wvBbjgUrQPPzvT2q70lLYxK3aIj/6HHlFVDL8dmx3fklbJ+9NfE
 rh50tbAfCKIFjMJqI1IDtm8jdnqQEWFeWf22ggMidxKu4CHWMHRdJEa/wWPRp01etlsZ
 K0Y3PxOLCxwBzlWo9f5Xt5sVW/u7SJu9CpYCyv94aqev8cyJCyZSl8wWKP430PfF5VBz
 7GYEFLgD3WdDj7yRkQq25Z/8xhRSwisOkStG9jvFkdAFmpDR1DQfshKj2AjTraZ3mDgV
 ZbNQ==
X-Gm-Message-State: AOAM5339ebWQ4h7+WvLTmTwqVIOW4bSdRyjVuK6bn9icyGBrkbru6nq9
 PrJsA2HuZAnXDlBik1PKlLIeI36PbWudG8gixjKe8SQ8ekzKn0f7aOj9355x6//mlLb+9+Q6/GT
 QgfPJQeyBdZkV2Gg=
X-Received: by 2002:a7b:c844:: with SMTP id c4mr23621916wml.148.1640822584036; 
 Wed, 29 Dec 2021 16:03:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8xh+XdVnX4+lW+IHo6qLtjMB13eLUJYg54GdtV707CJiWAl+5kSkDPVGHTz+rrp/MMgy2gg==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr23621905wml.148.1640822583877; 
 Wed, 29 Dec 2021 16:03:03 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id g187sm21043451wmg.40.2021.12.29.16.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 16:03:03 -0800 (PST)
Message-ID: <46a6112c-bc7a-d76f-ccc1-a921df6add77@redhat.com>
Date: Thu, 30 Dec 2021 01:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: check-python-tox failures
To: Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>
References: <d2112a58-a6bc-ebaa-ad94-60d66f4a3437@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <d2112a58-a6bc-ebaa-ad94-60d66f4a3437@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 05:11, Richard Henderson wrote:
> Hi John,
> 
> This test has been failing for quite a while. While it is allowed to
> fail, can we either fix this or disable it, to allow the ci to go proper
> green?

This job not only fails on the mainstream pipelines, but also on
all forks recently rebased. This is very annoying, I am in favor
of disabling the job until someone figure out what is wrong.

Phil.


