Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0322D1258
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:42:52 +0100 (CET)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGmx-0006IY-CS
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmG1c-0001rw-HM
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:53:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmG1a-0003GI-A6
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607345633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jQXhZcYJDxQ+pyrZJ9955D0Y/b7j+Ci1hyg9wiMJqU=;
 b=B5mNN6ssD+k8xdQceVG3A/oXt1xDCPvwExE0Jo6i1pil8ftFR8M/oq/lmJWRyRInCsV7L7
 ICPVXXqSqRbPvi8nbyB5seKrq0wXUGWiU+8xSsm+DMHdHK/IQcv9zI7wHqivS1wnK00oKX
 lyacLPihPVns0fG0bueqa6bE5hqWXow=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-jpqKp0r4MP-A3D8TQCaJuw-1; Mon, 07 Dec 2020 07:53:52 -0500
X-MC-Unique: jpqKp0r4MP-A3D8TQCaJuw-1
Received: by mail-wm1-f70.google.com with SMTP id a134so4106125wmd.8
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 04:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8jQXhZcYJDxQ+pyrZJ9955D0Y/b7j+Ci1hyg9wiMJqU=;
 b=imK9vN8uFuqXvRrc+TRQlnCzlrW+MAx+BdFTjNaN7Hsno3iWZeIdTxennoVqpBv9Y6
 qoykjvNiBGlP5vbs+5OYDp80RhgABbUvzRdUlNQFrEcKAFfa0a2tb8mFg92BXtH2oeqm
 V1C6117c0tfb5zxLs/PHJWgZpr8EYwH1CqP86zrbI7AyqZaelMoLuAxUmBy8yTMaTNnr
 /AbpPuIvTqI3BHJUZjm64Mge8rIlRpxq4+ABcG87GHDX4v67qkjlpMBIwC2Q1oaoZ00A
 SvkeNc69Cv85BNBk7CvrHlelIpzvF94vQ9+LlfUMbjYO0FsgcVZQ8f9iEwJuXcrRyVbG
 LEtA==
X-Gm-Message-State: AOAM533J3WnwQRFPhHdtRHH/Zq/7P0XZ3tIhloazrMgz5PA2OnjsPfMz
 e2oElTB0eM+nQxKzTLEvVrdLca3kDUIMJcIoMronTpObLauK5sOO5OyKQpXix+VYrkFYkrH7keP
 BqkuTOSnxdFR5Rlg=
X-Received: by 2002:adf:e547:: with SMTP id z7mr16664433wrm.283.1607345630921; 
 Mon, 07 Dec 2020 04:53:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwL3U84FFw+0qFmC+nPsQaUjHyjhjpgeVy6OSntbXqxnSM9myKiFBtd0teG8BcdiMc8S14tKw==
X-Received: by 2002:adf:e547:: with SMTP id z7mr16664424wrm.283.1607345630765; 
 Mon, 07 Dec 2020 04:53:50 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h15sm15059392wrw.15.2020.12.07.04.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 04:53:50 -0800 (PST)
Subject: Re: [PATCH v2 3/5] gitlab-ci: Introduce 'cross_accel_build_job'
 template
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201207112353.3814480-1-philmd@redhat.com>
 <20201207112353.3814480-4-philmd@redhat.com>
 <93d186c0-feea-8e47-2a03-5276fb898bff@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <39d13e9c-1fb4-2fa9-6cf4-01086ad920aa@redhat.com>
Date: Mon, 7 Dec 2020 13:53:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <93d186c0-feea-8e47-2a03-5276fb898bff@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 12:37 PM, Thomas Huth wrote:
> On 07/12/2020 12.23, Philippe Mathieu-Daudé wrote:
>> Introduce a job template to cross-build accelerator specific
>> jobs (enable a specific accelerator, disabling the others).
>>
>> The specific accelerator is selected by the $ACCEL environment
>> variable (default to KVM).
>>
>> Extra options such disabling other accelerators are passed
>> via the $ACCEL_CONFIGURE_OPTS environment variable.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 099949aaef3..d8685ade376 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -13,6 +13,23 @@
>>            xtensa-softmmu"
>>      - make -j$(expr $(nproc) + 1) all check-build
>>  
>> +# Job to cross-build specific accelerators.
>> +#
>> +# Set the $ACCEL variable to select the specific accelerator (default to
>> +# KVM), and set extra options (such disabling other accelerators) via the
>> +# $ACCEL_CONFIGURE_OPTS variable.
>> +.cross_accel_build_job:
>> +  stage: build
>> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>> +  timeout: 30m
>> +  script:
>> +    - mkdir build
>> +    - cd build
>> +    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
>> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
>> +        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
>> +    - make -j$(expr $(nproc) + 1) all check-build
>> +
>>  .cross_user_build_job:
>>    stage: build
>>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> 
> I wonder whether we could also simply use the .cross_user_build_job - e.g.
> by adding a $EXTRA_CONFIGURE_OPTS variable in the "../configure ..." line so
> that the accel-jobs could use that for their --enable... and --disable...
> settings?

Well cross_user_build_job build tools (I'm not sure that desired).

> Anyway, I've got no strong opinion on that one, and I'm also fine if we add
> this new template, so:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks, we can improve on top.


