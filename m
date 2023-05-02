Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3802D6F3D80
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 08:33:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptjYg-0006Gb-Pk; Tue, 02 May 2023 02:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptjYY-0006GD-3H
 for qemu-devel@nongnu.org; Tue, 02 May 2023 02:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptjYV-0006Ew-So
 for qemu-devel@nongnu.org; Tue, 02 May 2023 02:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683009125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VU8tBp+mE35r4MsBq/FDU5abcFnBi88vTap7sH0jE/0=;
 b=ECsUM3E4G9yK9t5RVweKxM9jEWjdY+JsmcovssrFrM7im+ics5aKq0sA3/vULWIBWH15QD
 NFrN0qZTuhCt99ONMBMc+jg0b84kFxQpnOIkurAFDXnyFtHBdtEzsq5YjW08SnT09hv/m3
 gArVZDkJ0yHrwKdQ2ufaVpWh1gMhzxY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-cjMzYCeyMsaJNPTEYcW6gA-1; Tue, 02 May 2023 02:32:04 -0400
X-MC-Unique: cjMzYCeyMsaJNPTEYcW6gA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f16f50aeb5so10228275e9.3
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 23:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683009123; x=1685601123;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VU8tBp+mE35r4MsBq/FDU5abcFnBi88vTap7sH0jE/0=;
 b=PPe1bUPRDnd1EvsffK5paYEwYcxxNXVS5rAa3JHkS9ZTqufWmRl0uSM8P3Cb5kvDhY
 Dee3OTLOgA2wM5YmlovAS+CD6aASew4bhjZfz/IKfUWzzQMOa16ak9nxbDbC/2Q18u98
 vBbRpvicDrUYKN+u5O2AY8AuelZD80CLsSOVS6trzbVdKBdwRvnob9/NYU+LwAY2rh68
 2crDOnM1/WdLbGXB0jXtd2j1Rq+cxUkdSGp6UKE7bp8WkWnapg+Vg/RbTYLxm1zuZhYb
 z6UlknG8vYH27nSgRn5NfDxdGPdRefPKOCMYdIC1iY4ECO6+liulC7RRWFj/yBoeQJsJ
 ME0w==
X-Gm-Message-State: AC+VfDyvs1u+05gkL2zIa6PgOVnPCZMaFpr5xxzdpWt8iJs6lkvm+6U+
 u6RD4LmTDOGQ8pW2h+2A7TL/NomeorcmworWqvRn8jEkgtxpk1YRqbfj5bs/wdZBapFpA/cmdg5
 YD10dkOTck2cs8p4=
X-Received: by 2002:adf:e991:0:b0:2dd:11b8:8aa9 with SMTP id
 h17-20020adfe991000000b002dd11b88aa9mr12676286wrm.15.1683009122923; 
 Mon, 01 May 2023 23:32:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Feab+ccCL+nhpIzssFVoW9U47lxVKJL0O+N/nvtOY+5iBIPQNMM6UbcY/50a4oNX1BwPeDw==
X-Received: by 2002:adf:e991:0:b0:2dd:11b8:8aa9 with SMTP id
 h17-20020adfe991000000b002dd11b88aa9mr12676273wrm.15.1683009122599; 
 Mon, 01 May 2023 23:32:02 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 z10-20020a5d654a000000b002f22c44e974sm29956529wrv.102.2023.05.01.23.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 23:32:01 -0700 (PDT)
Message-ID: <b5ec2486-04bc-529c-58be-544293e79cef@redhat.com>
Date: Tue, 2 May 2023 08:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] meson: Pass -j option to sphinx
To: Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230428150102.13114-1-farosas@suse.de>
 <87r0s4gc8g.fsf@pond.sub.org> <87pm7nsxxa.fsf@suse.de>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87pm7nsxxa.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/04/2023 19.45, Fabiano Rosas wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> Fabiano Rosas <farosas@suse.de> writes:
>>
>>> Save a bit of build time by passing the number of jobs option to
>>> sphinx.
>>>
>>> We cannot use the -j option from make because meson does not support
>>> setting build time parameters for custom targets. Use nproc instead or
>>> the equivalent sphinx option "-j auto", if that is available.
>>>
>>> Also make sure our plugins support parallelism and report it properly
>>> to sphinx. Particularly, implement the merge_domaindata method in
>>> DBusDomain that is used to merge in data from other subprocesses.
...
>>> diff --git a/docs/meson.build b/docs/meson.build
>>> index f220800e3e..138ec6ce6f 100644
>>> --- a/docs/meson.build
>>> +++ b/docs/meson.build
>>> @@ -10,6 +10,18 @@ if sphinx_build.found()
>>>       SPHINX_ARGS += [ '-W', '-Dkerneldoc_werror=1' ]
>>>     endif
>>>   
>>> +  sphinx_version = run_command(SPHINX_ARGS + ['--version'],
>>> +                               check: true).stdout().split()[1]
>>> +  if sphinx_version.version_compare('>=5.1.2')
>>
>> Where do you get 5.1.2 from?  I have 5.0.2, and -j auto appears to work
>> fine.  The manual page says "Changed in version 1.7: Support auto
>> argument."
>>
> 
> Ouch, I was looking at the readthedocs repository which has a similar
> change.
> 
> So I think we could probably just hardcode the option. Most distros will
> have a more recent sphinx version.
> https://repology.org/project/python:sphinx/versions
> 
> Let me try to figure out what gitlab is using. I know it is less than 4
> because our docs don't show some of the dbus parts

That's the "pages" job in .gitlab-ci.d/buildtest.yml, i.e. the debian-amd64 
container, i.e. Debian 11.

If I get that right (https://packages.debian.org/source/sphinx), this means 
we're using Sphinx v3.4.3 here.

  Thomas


