Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5D02D0DBF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:06:52 +0100 (CET)
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDPu-00028R-Vo
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDO2-0001Un-IN
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:04:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDNz-0004ua-7B
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:04:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607335490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NYGMZWwBeIh3fFPx69mvYjTdx1z088fxfHeToI+lsX8=;
 b=IUj/WNf5h8IqWTIOYg2z84Hv9lQBHEyKKAIlxidutKotmmyqXc3FpcRUuwERstCHy0B0tT
 kf9Z+L1alyvdKNdvuqCwkaIXbeuvz7wF3DLBEs2HwE8c6/p5vABFyblj54irnClcuEHY6I
 I/KvIc6erd2CSwBb2aGFbDlmayJoaX4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-E2gsAJ8BPP6XSQ9MuvC_bQ-1; Mon, 07 Dec 2020 05:04:48 -0500
X-MC-Unique: E2gsAJ8BPP6XSQ9MuvC_bQ-1
Received: by mail-wr1-f71.google.com with SMTP id j5so2615829wro.12
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 02:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NYGMZWwBeIh3fFPx69mvYjTdx1z088fxfHeToI+lsX8=;
 b=DqfOmZh081EZq92PtZjoRpt6pvXK0BVvJ/YMpgGX8cBPxx0JAdb0RDc6j/ctUlWmtW
 +kJWsGuFJjATbnaoaVDnGJMUEnWS7xcP5jIlu0+1Ki+eoDFMibGqMe09Q9erE2g3aIGI
 LKVYfRtRMBmFuvnfiZX4czE8XCU2HICGlplDrSOiE3fVQFqaqydjd+i/51Z5sZs3FMXA
 I7+yMMCtQ1gF4ISSnt8WV56QdPyQv59FzctjCbJdAKCaAOKlh2/13WCFjx10lKReal0t
 dqO2M6tsxSdgl9f8F9BLOWTQnfRaNwi3IMlniE7jbAVOMoqNcxIiaVieK+dnYYQnOvY3
 IhWg==
X-Gm-Message-State: AOAM530bslTE4hngWlPTXgUIQ8vegIMJsznLh8J9hM/pCYyufVV94qwn
 GoeWH7zAwbnRlzHvhGKGtIVlq3FGb3tARvS/Bf9bRpRaaGwAeNUlwXNNQhith00RCNVUfMZzjmM
 WO7Z3/iUmJSzqj/A=
X-Received: by 2002:a1c:4604:: with SMTP id t4mr16984345wma.17.1607335487739; 
 Mon, 07 Dec 2020 02:04:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxh2IvFXXS0Sn+Z6xWooK0ZB7J3J/ucSwA/Wd5Mn37PSJsH8VDS/ZbIW+jBzvFF1CRvg0hS8w==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr16984316wma.17.1607335487585; 
 Mon, 07 Dec 2020 02:04:47 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id e17sm4403139wrw.84.2020.12.07.02.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 02:04:46 -0800 (PST)
Subject: Re: [PATCH 3/8] gitlab-ci: Add KVM X86 cross-build jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-4-philmd@redhat.com>
 <1048bbc0-7124-3564-4219-aa32ed11a35b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <951882fd-fae0-2dec-5a81-d72adf139511@redhat.com>
Date: Mon, 7 Dec 2020 11:04:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1048bbc0-7124-3564-4219-aa32ed11a35b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 6:20 AM, Thomas Huth wrote:
> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>> Cross-build x86 target with only KVM accelerator enabled.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds-kvm-x86.yml | 6 ++++++
>>  .gitlab-ci.yml                       | 1 +
>>  MAINTAINERS                          | 1 +
>>  3 files changed, 8 insertions(+)
>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml
> 
> We already have a job that tests with KVM enabled and TCG disabled in the
> main .gitlab-ci.yml file, the "build-tcg-disabled" job. So I don't quite see
> the point in adding yet another job that does pretty much the same? Did I
> miss something?

I missed it was x86-specific myself.

> 
>  Thomas
> 


