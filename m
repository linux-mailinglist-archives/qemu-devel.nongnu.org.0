Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C43C2AF022
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:56:03 +0100 (CET)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcojK-0004hd-HT
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcoi6-00043e-Vk
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:54:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcoi4-0001iJ-Mg
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605095683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOacHf3jSxbq79uqm04+cc7EIxgwvAwPR2wOJugL044=;
 b=GUgs0kcWfBcx6RuR0A2Ut0QK4+5YIP/maT3YPeVxZqwHAHQ8+78ZuHV2qhAPwoBOQMSu03
 oCGahpyhFygBv0XS5SzzkWi1pMJqdpTtKh784IbjoezZkIBlGHjWPyeAXrkiYV53KgMhG4
 NULEigwXYzjDAC4kLcU4k302uMppW8E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-NGN917EAM96KWkWSZ7mrwA-1; Wed, 11 Nov 2020 06:54:42 -0500
X-MC-Unique: NGN917EAM96KWkWSZ7mrwA-1
Received: by mail-wm1-f71.google.com with SMTP id u207so806904wmu.4
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 03:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NOacHf3jSxbq79uqm04+cc7EIxgwvAwPR2wOJugL044=;
 b=ZK6KXdt4iOp16gBIPxZbmsvmM6fMmH0p4ao22Mqm93EALGwPOvRNIhW/cY2/bhZmVh
 mDuFpt0PhmtYMJB9PHPRLMf980g8+EO0vxCAhlvWHQA18e1aD4JgYt9r8fFJtaq8LYka
 ul0nsajN0DIbOkdG1IwJ/pc4VXKALe5nuNMNXzyjXRPVzzG2ZOhAWxrkuB7NMimK7sVr
 iC26Uhxe46DXu9nVOmGHEM0H3ZtOpS4Z1BygLsX9cJt/b+jLHrFDF2V0dfSaSWN700bo
 rQJCmtEKo3jvE6zaOVTsiekB8LbS04sjC2CT2TckFEo2VFiFr3OVgw0cwsKAK5zrexjn
 hy/g==
X-Gm-Message-State: AOAM53237oYI6NeE79TUlj7KdjuE6KYH1rYe5Gx1RGDhUOIHqlqDB3PA
 ivHpMipAoP7SlOxIWMomhaQkoiOCgZQZgUo6kYhhUMhySC2HwNiaXB2E+5pyZxPRCWan3X5/y4Q
 bq87VQIZhCsgFJuE=
X-Received: by 2002:a7b:c247:: with SMTP id b7mr3584317wmj.97.1605095680976;
 Wed, 11 Nov 2020 03:54:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxa4+IVnFea96Mug3aT7sh80HUCNvRG/pfIOP/HyZu3eBM+4kVhBaxPU2Nk9f9WIGS1k07xRQ==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr3584282wmj.97.1605095680740;
 Wed, 11 Nov 2020 03:54:40 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id x6sm2395045wmc.48.2020.11.11.03.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 03:54:40 -0800 (PST)
Subject: Re: [PATCH 1/3] meson: move vhost_user_blk_server to meson.build
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201110171121.1265142-1-stefanha@redhat.com>
 <20201110171121.1265142-2-stefanha@redhat.com>
 <ad4be626-c950-6131-adc3-369f9a405ad4@redhat.com>
 <d064bee7-7a46-761b-97e2-71df8fba6bab@redhat.com>
Message-ID: <c23c7d03-4165-bf11-e730-ffcc53ebd718@redhat.com>
Date: Wed, 11 Nov 2020 12:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d064bee7-7a46-761b-97e2-71df8fba6bab@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> On 11/11/20 10:41 AM, Philippe Mathieu-Daudé wrote:
>> On 11/10/20 6:11 PM, Stefan Hajnoczi wrote:
>>> The --enable/disable-vhost-user-blk-server options were implemented in
>>> ./configure. There has been confusion about them and part of the problem
>>> is that the shell syntax used for setting the default value is not easy
>>> to read. Move the option over to meson where the conditions are easier
>>> to understand:
>>>
>>>   have_vhost_user_blk_server = (targetos == 'linux')
>>>
>>>   if get_option('vhost_user_blk_server').enabled()
>>>       if targetos != 'linux'
>>>           error('vhost_user_blk_server requires linux')
>>>       endif
>>>   elif get_option('vhost_user_blk_server').disabled() or not have_system
>>>       have_vhost_user_blk_server = false
>>>   endif
>>
>> Something is odd:
>>
>> $ ../configure --disable-system --enable-vhost-user-blk-server
> 
> I failed when pasting, this misses '--disable-tools' to make sense.
> 
> We define in meson.build:
> 
>   have_block = have_system or have_tools
> 
> Maybe this is the one you want instead of have_system?

This snippet seems to fix:

-- >8 --
--- a/meson.build
+++ b/meson.build
@@ -751,6 +751,10 @@

 has_statx = cc.links(statx_test)

+if 'CONFIG_VHOST_USER' in config_host and not (have_system or have_tools)
+    error('vhost-user does not make sense without system or tools
support enabled')
+endif
+
 have_vhost_user_blk_server = (targetos == 'linux' and
     'CONFIG_VHOST_USER' in config_host)

---

$ ../configure --disable-system --enable-vhost-user-blk-server
../source/qemu/meson.build:755:4: ERROR: Problem encountered: vhost-user
does not make sense without system or tools support enabled

I'll send a patch.

Phil.


