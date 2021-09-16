Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4559540D2B8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:56:59 +0200 (CEST)
Received: from localhost ([::1]:53218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQjSE-0004l7-BY
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQjRD-000441-0L
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQjRB-0005fE-GQ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631768153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5Wfh/semwiFtmEmG44GAoLek3ezVzRi2kulU1nUAnE=;
 b=LHDpUvQa6woUndd6wZ0lWTm+U+0fPpPGffs1qd70e1yyYcItTkeETHHV6vN+OMLIRjR2W5
 W0Bk/OEKVWSi6QQAYa00N6vk+QI0UXgxlYV9EoPFFEISdg4y3pWaOtZc3gxzPyrRylGOi+
 8e4vc/9aZz2wEAUHXjJ+RvRrz6hMwuw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-kPEbk_GeNIGDcogIzdMQIQ-1; Thu, 16 Sep 2021 00:55:51 -0400
X-MC-Unique: kPEbk_GeNIGDcogIzdMQIQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so1909841wru.15
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 21:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G5Wfh/semwiFtmEmG44GAoLek3ezVzRi2kulU1nUAnE=;
 b=L3VdOvjJcgsovjB2a3gQEh2TlMlPh/7KqC7YLmMK9HUNaYZ7fq6CV3cI1dVqORxHh+
 cTi3V1Rf/JpzG2ar6ZLQvat4Nh/dB/49/hy1EPqtsAtX4/vmj70UuCDw4dBbrcRJVg/P
 qu1j7QPKQLivqhkEYvIEgq0vxfgFXTkXPZLO969gzwmo4vZ3sUGFe+MYPIm6xiUQULRA
 jeJSLf7gXJzlsZNZ4cGoAeNDCPLlLhkaIkAA9xyNX7QxIDFeanaYoTRybF7xhiX6FEBO
 DoL6Zf5e+2WnWGa+bbonURP9yFItgRFuARU2Wte8pNRD0OQ1W7v7gKmCs4KFZmcqAhWr
 iMWg==
X-Gm-Message-State: AOAM531HJDFQMPWWK7NRUAmxkEKbqQ8Jl01GYEcfcMQba/ygZCP4WiRv
 8+XV2X6fdSnyk3TGKIiBxHQ/1a2YPjl/rhxyRwB0wNVX7q5Ax2pxacTYbI1FOQFh/QrcNMlzOc6
 Ax1+ZiJ6bqJE9ttw=
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr7973644wmm.142.1631768150550; 
 Wed, 15 Sep 2021 21:55:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQhbHHFoM2lmYnV3N6nQ3sryv8psUZvlgIJH6h3IgBdEnV8kPliYJIocYphShKztwPDBgnFw==
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr7973637wmm.142.1631768150370; 
 Wed, 15 Sep 2021 21:55:50 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-144-075.46.114.pool.telefonica.de. [46.114.144.75])
 by smtp.gmail.com with ESMTPSA id b188sm1851627wmd.39.2021.09.15.21.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 21:55:49 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210913182927.1022862-1-philmd@redhat.com>
 <9f52b00e-0189-8f44-96d4-cbb398c4514f@redhat.com>
 <YUBbjbJwpcpxjDmt@redhat.com>
 <574a9927-9a2d-f606-5192-3b66a1847b12@redhat.com>
 <9f2ea524-1718-a454-050f-af558ad380c0@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web PATCH] Gemfile: Add webrick bundle dependency
Message-ID: <ddb8181c-2653-180f-4460-c8626a613101@redhat.com>
Date: Thu, 16 Sep 2021 06:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9f2ea524-1718-a454-050f-af558ad380c0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/09/2021 06.24, Philippe Mathieu-Daudé wrote:
> On 9/16/21 12:27 AM, Paolo Bonzini wrote:
>> On 14/09/21 10:21, Daniel P. Berrangé wrote:
>>> Yes, this is needed to fix Ruby 3.
>>>
>>> I didn't propose it myself as I'm not sure if it in turn breaks people
>>> with Ruby 2.x ?
>>
>> Does it pass the GitLab CI (which uses 2.5)?
> 
> Yes:
> https://gitlab.com/philmd/qemu-web/-/jobs/1594757246#L466
> Installing webrick 1.7.0
> Bundle complete! 5 Gemfile dependencies, 32 gems now installed.

The patch is also not breaking anything for me here (with Ruby 2.5.9). 
Pushed now.

  Thanks,
   Thomas


