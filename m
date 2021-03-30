Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027FE34EA57
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:24:36 +0200 (CEST)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFIJ-0003HW-1k
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRFHW-0002ao-BY
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:23:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRFHT-0004cm-6z
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617114222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIafL+l3VUsjhJuhxgf7tgsy5FR/cdTJQsdYs2Zs0wA=;
 b=DTaiaO75551x+fvycNlLw+w5Q3hM5nn6r2SicevW2QWotkiKivdeQGRcg57Mqssqu8khbn
 RlIYwRisdRGXTbpVZpC77oQkneMvbuJrHOAhPerajqx7fCbJ4dxiuujXhA4HsXyjhbCfA3
 SgBu+bOEJ646zzjcs6IGI+1C7EGPJbs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-AJOyN5ERMWiALvbRZR-Bbw-1; Tue, 30 Mar 2021 10:23:40 -0400
X-MC-Unique: AJOyN5ERMWiALvbRZR-Bbw-1
Received: by mail-wr1-f72.google.com with SMTP id s10so10471751wre.0
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 07:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VIafL+l3VUsjhJuhxgf7tgsy5FR/cdTJQsdYs2Zs0wA=;
 b=ATirGNMwVKuBbprN2VCUIY55dSfV/IJ8F+A4k29FIxqepNbGv6xF13sWHAbKg4l/62
 T6i7i6zeKOhYqbNzI6dI8U/TSw+FKpmji6LbPpiedc33VonKGOwQZoRqPfsqOSY5JTJ6
 1CaMeM9ewUbKKbEFLSVCdmlJyeIiEN0zp46NxkTuNTd9xinO+ES/HXcj/bcjrkL0XsSc
 1Naf/ZzfNWTwpFIacn0O+J9f+d+sMyPrA1fP1okjSD0FybESoKWqu/VLpZUXUUYGOSu7
 RDlWFLi4qmRU9w3PnDaBqqE45FaqbYAg+Jf6aSZrVRplxvmXZ7XKEhQeOsLbaED0IhBb
 NxZA==
X-Gm-Message-State: AOAM532XS5OQb42u9UUN+NVS5/AE0Hu6RY+q6jkyv5RnQDemV/HDf0IU
 ih2bfq2GMThKtKHI3/uuKP6PjGwB9dBiydhi3wRZsvavN0vUP9rRgN9d7gDJbBtXMkU69kCJtVL
 qPL21Ew48x9JTjKQ=
X-Received: by 2002:adf:cf11:: with SMTP id o17mr34380973wrj.391.1617114219083; 
 Tue, 30 Mar 2021 07:23:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzifY0GciWIRw53ykDEK7iew17gntZrl6ma6pCn41kal+CzXQ1YP/Icz9upZil9l3w31/66ag==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr34380956wrj.391.1617114218899; 
 Tue, 30 Mar 2021 07:23:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w22sm4054547wmi.22.2021.03.30.07.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 07:23:37 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain> <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <YGMyIxXn6QgBJNqJ@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <35487f46-f373-9da5-8833-d3f0704b3a8b@redhat.com>
Date: Tue, 30 Mar 2021 16:23:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGMyIxXn6QgBJNqJ@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/21 16:13, Stefan Hajnoczi wrote:
> On Tue, Mar 30, 2021 at 01:55:48PM +0200, Thomas Huth wrote:
>> On 30/03/2021 13.19, Daniel P. Berrangé wrote:
>>> On Mon, Mar 29, 2021 at 03:10:36PM +0100, Stefan Hajnoczi wrote:
>>>> Hi,
>>>> I wanted to follow up with a summary of the CI jobs:
>>>>
>>>> 1. Containers & Containers Layer2 - ~3 minutes/job x 39 jobs
>>>> 2. Builds - ~50 minutes/job x 61 jobs
>>>> 3. Tests - ~12 minutes/job x 20 jobs
>>>> 4. Deploy - 52 minutes x 1 job
>>
>> I hope that 52 was just a typo ... ?
> 
> No, but I think Dan already found this issue a little while ago. The
> deploy job uses "make install":
> 
>    # Prepare for GitLab pages deployment. Anything copied into the
>    # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
>    pages:
>      image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
>      stage: test
>      needs:
>        - job: build-tools-and-docs-debian
>      script:
>        - mkdir -p public
>        # HTML-ised source tree
>        - make gtags
>        - htags -anT --tree-view=filetree -m qemu_init
>            -t "Welcome to the QEMU sourcecode"
>        - mv HTML public/src
>        # Project documentation
>        - make -C build install DESTDIR=$(pwd)/temp-install
>        - mv temp-install/usr/local/share/doc/qemu/* public/
>      artifacts:
>        paths:
>          - public
> 
> Do we have/need a docs-only install target?

The problem is that after "git clone" the artifacts from the previous 
stage are stale.  We can use the "NINJA=:" hack/workaround on the make 
command line that we already use for tests.

Paolo


