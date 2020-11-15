Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A291D2B3552
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 15:35:35 +0100 (CET)
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keJ7u-0005KG-MK
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 09:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keJ75-0004th-Ci
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 09:34:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keJ70-0000o4-Ju
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 09:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605450876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCFU4oE7mEUNLMkewQKl/TPUVmO2mfCNKZlSR7AgKOk=;
 b=L9xmgFWIJO7jL3jFn3YOMY/lkKzBiim+0e7Kvl9b6e+ZFe0TiFN0Mtw0LJrogtllGD4rpb
 3U7a6bl1yEuqEAG8HbjGhhfE5+kg9uWt8oq88ayz7pq3WCsFwxo8OHA82BTtQMjW3RXKlD
 rfNnUCya41bI16nX41Y5LWCiU7BvaqE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-Bn6gl11ZMaWCYw4Sk0BJzA-1; Sun, 15 Nov 2020 09:34:33 -0500
X-MC-Unique: Bn6gl11ZMaWCYw4Sk0BJzA-1
Received: by mail-wm1-f71.google.com with SMTP id a134so7412732wmd.8
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 06:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DjnR36RFC3kks8ZKKSrLXuw/KWwCf4ByHRjWPvjd32A=;
 b=cuxUbDK1dIGtZWQhEU3b6aPlhGXxNA7Ia3ubrPQB9jTpXqAkmjbXKtwF8Z3/hzrbOM
 Vd6MMhulY4kB6EmMG8cZPo8hH8X4Z+KTyt4ECtsiAB+vQXcGViGi9fjS6vrWM8F601/R
 YvRWT1UPDNVY4aVV2YRMUGuOCkZNE+Ceh6GeGoqQlmefoOO6x557kKtv9oIo4Q6EbJvf
 63MwNR++SmhlQghL45UxWohX97E61E6qLRrr6ETY99zLfpqcpD0WEzbafS+pAyKxRPBR
 f/A8ya5WlIj6HWVG/a9fbKuiuovpAggE/gokDyCyo/+xYb7D1Wvsf0Xj9coT9vEWMoNV
 ggig==
X-Gm-Message-State: AOAM530RmaObUUh1yzIHnPUFUJuwkKVz6NHy8ohlrT4CUx6xmNXIrrzj
 H1XDwjlbHpnji5Y5VlT2cqACCasaNF4/mWtFaV5aen0K4e6Ajo2F0plR5bciWBPrgMLSnt+QD+J
 wtgr+g6rI1In8c9w=
X-Received: by 2002:a5d:4084:: with SMTP id o4mr14037749wrp.278.1605450872158; 
 Sun, 15 Nov 2020 06:34:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzU/RDPRRg1f7WixeVWk4U/bTkRZgBj2/II3v4cZq26HGvR+Frb7jwdVLdM7w12u01KNyw15A==
X-Received: by 2002:a5d:4084:: with SMTP id o4mr14037727wrp.278.1605450871986; 
 Sun, 15 Nov 2020 06:34:31 -0800 (PST)
Received: from [192.168.10.118] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id k22sm16009618wmi.34.2020.11.15.06.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2020 06:34:30 -0800 (PST)
Subject: Re: [PATCH 3/4] configure: Add a proper check for sys/ioccom.h and
 use it in tpm_ioctl.h
To: Thomas Huth <thuth@redhat.com>, luoyonggang@gmail.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20201114165137.15379-1-thuth@redhat.com>
 <20201114165137.15379-4-thuth@redhat.com>
 <CAE2XoE9yU4S=N5eQKaY6NHCVFOQPg+WQFiv05SbrtrUUMWmMQg@mail.gmail.com>
 <44c43a8c-2b10-a951-6aaa-813a7db325a2@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50de5469-11eb-0ee6-44dc-d5cc67b4f8b6@redhat.com>
Date: Sun, 15 Nov 2020 15:34:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <44c43a8c-2b10-a951-6aaa-813a7db325a2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 08:01:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
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
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-level <qemu-devel@nongnu.org>, David CARLIER <devnexen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/11/20 15:00, Thomas Huth wrote:
> On 14/11/2020 17.56, 罗勇刚(Yonggang Luo) wrote:
>> Can we check this in meson.build?
> 
> That would be nicer, indeed, but I did not spot a place where I could add my
> code there ... all the other HAVE_xxx_H symbols are added in the configure
> script.

There is one similar test, it was split in two:

has_gettid = cc.has_function('gettid')
...
config_host_data.set('CONFIG_GETTID', has_gettid)

but there's no particular reason for that.  You can just add

config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_headers('sys/ioccom.h'))

in the config-host.h section of meson.build?.

Paolo

>> On Sun, Nov 15, 2020 at 12:53 AM Thomas Huth <thuth@redhat.com
>> <mailto:thuth@redhat.com>> wrote:
>>>
>>> On Solaris and Haiku, the _IO() macros are defined in <sys/ioccom.h>.
>>> Add a proper check for this header to our configure scripts, and
>>> make sure to include the header in tpm_ioctl.h to fix a build failure
>>> on Solaris and Haiku.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>

>>> +#########################################
>>> +# sys/ioccom.h check
>>> +have_sys_ioccom_h=no
>>> +if check_include "sys/ioccom.h" ; then
>>> +  have_sys_ioccom_h=yes
>>> +fi



Paolo


