Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282094D2EA9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 13:04:43 +0100 (CET)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRv3Z-0007hs-W1
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 07:04:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRuxu-0004XG-V9
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:58:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRuxr-0005hc-Pb
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646827126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BiXMtQLX8bzCb1dD+c0hiAsDLhGGZ+S5BrnJfXzNTQw=;
 b=SeIAL3DdADMz2vb/qtMDaSKajBLEC9SwX7OQCj0DrUbe37RMBlnNXgEeiATprBIoWh2yPA
 36L5XaoCtMqwOIx/T2dD7MWG+wCABx7lfAJiQDYPsJJ3q3Wru2Cg3bHaw2PMeNuLmNFnyU
 n3Q4MexURclVHrMDVqjV/oqYSPJ5E2M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-1hIKyN2WMxG-xyqqHfVKow-1; Wed, 09 Mar 2022 06:58:45 -0500
X-MC-Unique: 1hIKyN2WMxG-xyqqHfVKow-1
Received: by mail-wm1-f72.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso706385wmq.6
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:58:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BiXMtQLX8bzCb1dD+c0hiAsDLhGGZ+S5BrnJfXzNTQw=;
 b=R5SWgf/XBN87JbShtA7cptULGLJoIuyLqberJk6ZEikycsFb+8HvYrsTYPLWjjKzQi
 6987hUy8c26FjYaRM8BmqadJLSpScvTsV+I9cd1Cg6MGyeW/p3s5QmVYmW1k4+g2QtVi
 xj2pkyVxKXDk7sGUlZSw4kx/r3dDq2FI3aOOytL24iu3+y2QHAjXL+DNjcRAckOtLRg+
 qbGYMp5AkxlJH6Ricn9RdwzcSC9yG07bJdKImcVkm74wsLbFJxqfPjai1l1HAVokex/S
 whys5fDNkPD4yEf4xWDS7YIx7YZLiiYE+HunLB+yh9r86lNa79oODe0YLrHDpVv7mtbs
 E3VQ==
X-Gm-Message-State: AOAM531bw561BD9J6qOg+8tOnlSuMKGXTAjeI0BjknQCx7eZRQ76VxKR
 1AiKYRwylJa1xq0wHfchEfFUB6C+AwOQ/F/SuQ4DpgCkRQR2S9txbtUVAC+rSyLLXQerB/gdQPp
 qDHl1DdH7+aHjrxA=
X-Received: by 2002:a5d:52c8:0:b0:1ed:e591:be70 with SMTP id
 r8-20020a5d52c8000000b001ede591be70mr15683897wrv.436.1646827124372; 
 Wed, 09 Mar 2022 03:58:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydelGB9disK4/cU1ljwaex1cWzmV54SpFxAyq6d3EhzP5SwX2KYc1fZqk6ryHutnPioaxLXw==
X-Received: by 2002:a5d:52c8:0:b0:1ed:e591:be70 with SMTP id
 r8-20020a5d52c8000000b001ede591be70mr15683888wrv.436.1646827124134; 
 Wed, 09 Mar 2022 03:58:44 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b00389ab9a53c8sm1615977wmc.36.2022.03.09.03.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 03:58:43 -0800 (PST)
Message-ID: <b05317e1-3659-2dce-4582-58bc6ca4a79b@redhat.com>
Date: Wed, 9 Mar 2022 12:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v7 22/22] gitlab-ci: Support macOS 12 via cirrus-run
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-23-philippe.mathieu.daude@gmail.com>
 <f2898408-5082-7121-2496-fb296c48244d@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <f2898408-5082-7121-2496-fb296c48244d@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2022 11.24, Philippe Mathieu-Daudé wrote:
> Hi Alex, Thomas, Daniel,
> 
> Could you ack this patch?

Basically fine for me, but can we really run additional cirrus-ci jobs by 
default? IIRC the parallel execution of those were quite limited for the 
free tier, so did you look close that we don't run into additional timeouts 
yet, due to delayed cirrus-ci jobs?

  Thomas


> On 7/3/22 00:17, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Add support for macOS 12 build on Cirrus-CI, similarly to commit
>> 0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run"),
>> but with the following differences:
>>   - Enable modules (configure --enable-modules)
>>   - Do not run softfloat3 tests (make check-softfloat)
>>   - Run Aarch64 qtests instead of x86_64 ones
>>
>> Generate the vars file by calling 'make lcitool-refresh'.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++
>>   .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
>>   tests/lcitool/refresh             |  1 +
>>   3 files changed, 33 insertions(+)
>>   create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars


