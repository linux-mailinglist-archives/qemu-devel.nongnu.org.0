Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6182C5F10D9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:29:33 +0200 (CEST)
Received: from localhost ([::1]:45156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJpM-0003Gw-Ep
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oeJnu-0001tn-KQ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:28:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oeJns-0003wj-6O
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664558878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bokWExh5wyHzz8sYQQBeGqc37cNiipqCwn3o4bL/mEo=;
 b=CnJIXCPWZPVqq6vheTSigCggHk2QfQJWIFVyKIo0VWdrdROB8E5zL1T/E2lkA5yadOZBMh
 dZU7+X70EPBkY1VSamNB6BEaRAzHBA+zpcu9bVYFLNtTyW64TxEfU0qPiZ6Q4CtqgV9GXz
 2QEhxspzvd1eBqDNzIpQ27IuiT97wG0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-Mitqb9x8OdCOHmLPkCX48w-1; Fri, 30 Sep 2022 13:27:56 -0400
X-MC-Unique: Mitqb9x8OdCOHmLPkCX48w-1
Received: by mail-wr1-f70.google.com with SMTP id
 r22-20020adfa156000000b0022cc3018fbaso1793362wrr.2
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 10:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bokWExh5wyHzz8sYQQBeGqc37cNiipqCwn3o4bL/mEo=;
 b=Dl+TQSBHUAL7vEAsBJsmeU2n78413rVq2z2z4t2omnUiO6IfjhE6L8tW9bHclkn56g
 Uz8QAYjerF9vJTdQxhmbZysnjcwJlk1DPAltMGccsrfKYox9kPa2I3JUEB4dUiF/X8po
 FegNUJdGgaIowBpTU5kKPWieCxrlDUbnrSJgQq8pjRBVNtyNeLYbaSUTwBIebk6wowpp
 eu4G1HcLvBodFv1I+4vZ49r2Ap3k22AVQez/X88MCamOHe5GEUXyFzDvMC/atJHS4R8Y
 9RHWusFUsZkYP49Jmvm+cf4gf4iy0qJsmdxYt20IcrzAvl8rl1xz3XV5WXD6IQHnddDx
 ZDvQ==
X-Gm-Message-State: ACrzQf2nwI0nciy6JkMuuOLFp5pdmawmWo4ZCyH+5k2Iq1KxJpen0576
 /4UwPaxTHEBsY95jX8FrgUE8So3GwfolgN/bMyWSznNtrxS0MTdURMrGUA61ilpipd/UtM5Eemb
 W9JXZNIhx1u2xXhs=
X-Received: by 2002:a05:6000:547:b0:218:5f6a:f5db with SMTP id
 b7-20020a056000054700b002185f6af5dbmr6615920wrf.480.1664558875555; 
 Fri, 30 Sep 2022 10:27:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6YAb0yD0xKkzt2JPEvjnqgoEPHpNuZ2U5TwEEMn+lnyJQWmTYT+KULRqQMUx9q5RHXDQoybw==
X-Received: by 2002:a05:6000:547:b0:218:5f6a:f5db with SMTP id
 b7-20020a056000054700b002185f6af5dbmr6615905wrf.480.1664558875314; 
 Fri, 30 Sep 2022 10:27:55 -0700 (PDT)
Received: from [192.168.8.101] (tmo-067-33.customers.d1-online.com.
 [80.187.67.33]) by smtp.gmail.com with ESMTPSA id
 12-20020a05600c240c00b003b4764442f0sm2587658wmp.11.2022.09.30.10.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 10:27:54 -0700 (PDT)
Message-ID: <7249b699-5a4b-a478-bbe1-ad0fe828bdb0@redhat.com>
Date: Fri, 30 Sep 2022 19:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 for-7.2 0/6] Drop libslirp submodule
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20220824151122.704946-1-thuth@redhat.com>
 <30266128.I4sqonfujN@silver>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <30266128.I4sqonfujN@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.583, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/2022 18.50, Christian Schoenebeck wrote:
> On Mittwoch, 24. August 2022 17:11:16 CEST Thomas Huth wrote:
>> At the point in time we're going to release QEMU 7.2, all supported
>> host OS distributions will have a libslirp package available, so
>> there is no need anymore for us to ship the slirp submodule. Thus
>> let's clean up the related tests and finally remove the submodule now.
>>
>> v2:
>> - Added patches to clean up and adapt the tests
>> - Rebased the removal patch to the latest version of the master branch
>>
>> Thomas Huth (6):
>>    tests/docker: Update the debian-all-test-cross container to Debian 11
>>    tests/vm: Add libslirp to the VM tests
>>    tests/lcitool/libvirt-ci: Update the lcitool module to the latest
>>      version
>>    tests: Refresh dockerfiles and FreeBSD vars with lcitool
>>    tests/avocado: Do not run tests that require libslirp if it is not
>>      available
>>    Remove the slirp submodule (i.e. compile only with an external
>>      libslirp)
> 
> And I was wondering (bisecting) why network silently stopped working here.
> 
> While I understand the motivation for this change, it's probably not a user
> friendly situation to just silently decease functionality. As slirp was the
> default networking (i.e. not just some exotic QEMU feature), wouldn't it make
> sense then to make missing libslirp a build-time error by default?

See discussion here:

 
https://lore.kernel.org/qemu-devel/a25c238b-dabd-bf20-9aee-7cda4e422536@redhat.com/

and patch here:

 
https://lore.kernel.org/qemu-devel/20220929163237.1417215-1-marcandre.lureau@redhat.com/

  HTH,
   Thomas


