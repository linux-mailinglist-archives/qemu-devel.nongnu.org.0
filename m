Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F402D4ADF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:48:43 +0100 (CET)
Received: from localhost ([::1]:53142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5S6-0005OK-NS
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kn4Bd-0003D1-U7
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:27:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kn4Bc-0005x0-5T
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607538455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aLnjxGiLMk+L+55mNPRX5P4SGdOaDO1gZhpC9DqJNXc=;
 b=Pt1x6AMvHI9jBjlO81cS62L/0yEpNUY34LGGPEvGzNHDQJ/sii9KJU5aIN+cXvJ3bnWIGl
 ByJKqPAaHzlKu/DNK87ZRlmDeNb2bcxq/sF5RG53htA24FSm7Mx2u9IOTJ47sAJ8E2V+8G
 f/aTuVMz/7VVcaexmbAEkQhxdlH6YXs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-X_nH_MQ_PNO_viGZ-kWRzw-1; Wed, 09 Dec 2020 13:27:33 -0500
X-MC-Unique: X_nH_MQ_PNO_viGZ-kWRzw-1
Received: by mail-wr1-f71.google.com with SMTP id n13so969261wrs.10
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aLnjxGiLMk+L+55mNPRX5P4SGdOaDO1gZhpC9DqJNXc=;
 b=F6OGWyAFpYPznFnP2fGZD6ESA4PlDvnenSKtzbPTuBua6A2dBslV1kNhpMaI+q0A7s
 zVn2Fpu5FjplMHPE99LQKha6smwVhYu5B8wX3ZIX41LB/ZmU6Y4Es6eVnI6jf6LSENj6
 TlXnj5WmwwJ5UwafJ3MdyGjFenIPFvcbfVHsyomSi8S+4CN952lY/Ijgmid0kQX/lUoh
 RyFrxyouW0b68EccPcukUG3gn752jvtdLDAV0600bLzjTgBTKdT8gpL+ptEDAagCU3UI
 iJ6fiJtPrWtm6iY34e9kQNnS0W7T5nqard+HGK6pO6RnTPN9iPkQxxgd+BC4Rp8ACD5F
 mrVA==
X-Gm-Message-State: AOAM533TDAvOm1X9Cu+tQkQqVLS0Hxd9DmtTsRp46M+omkRb5+AI7qMp
 JQ5+yQDoPk5Mtn3xMXsdTjs/EQ1SkpYHPeEBP7BgbZ/7CD/zDzl1s8kbAw59zLQhw4KV2hx++nH
 QED8cu/35ZXvNqMo=
X-Received: by 2002:a1c:9695:: with SMTP id y143mr4032136wmd.70.1607538452540; 
 Wed, 09 Dec 2020 10:27:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3P62WIJZzyXrbRWo1Fqnfn6MZ+oILefVbd0U/6Gq2cZlmUgazml2Ct7QO5Sf/OixhA4GtNQ==
X-Received: by 2002:a1c:9695:: with SMTP id y143mr4032116wmd.70.1607538452357; 
 Wed, 09 Dec 2020 10:27:32 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id m81sm5201085wmf.29.2020.12.09.10.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 10:27:31 -0800 (PST)
Subject: Re: [PATCH v3] tests/acceptance: test hot(un)plug of ccw devices
To: Cornelia Huck <cohuck@redhat.com>
References: <20201208122843.147186-1-cohuck@redhat.com>
 <07eaa46e-336c-e28f-8904-127eb07d369c@redhat.com>
 <20201209192226.60ed3365.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <007cbe5a-e8ac-0fc4-1284-6e9c9fbd33f4@redhat.com>
Date: Wed, 9 Dec 2020 19:27:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201209192226.60ed3365.cohuck@redhat.com>
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
Cc: patchew-devel@redhat.com, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 7:22 PM, Cornelia Huck wrote:
> On Wed, 9 Dec 2020 19:09:25 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Hi Paolo, Fam,
>>
>> On 12/8/20 1:28 PM, Cornelia Huck wrote:
>>> Hotplug a virtio-net-ccw device, and then hotunplug it again.
>>>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> ---
>>> v2->v3:
>>> - do the dmesg cleanout and waiting for messages properly [Thomas]
>>>
>>> Wainer: I dropped your r-b, as there had been too many changes for
>>>         me to be comfortable with retaining it
>>>
>>> ---
>>>  tests/acceptance/machine_s390_ccw_virtio.py | 24 +++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)  
>>
>> Patchew failed applying this patch... Any idea what got wrong?
>>
>> Switched to a new branch '20201208122843.147186-1-cohuck@redhat.com'
>> Applying: tests/acceptance: test hot(un)plug of ccw devices
>> error: sha1 information is lacking or useless
>> (tests/acceptance/machine_s390_ccw_virtio.py).
>> error: could not build fake ancestor
>> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>> Patch failed at 0001 tests/acceptance: test hot(un)plug of ccw devices
>> When you have resolved this problem, run "git am --continue".
>> If you prefer to skip this patch, run "git am --skip" instead.
>> To restore the original branch and stop patching, run "git am --abort".
>> Failed to apply patch:
>> [PATCH v3] tests/acceptance: test hot(un)plug of ccw devices
>>
>> https://patchew.org/QEMU/20201208122843.147186-1-cohuck@redhat.com/
>>
> 
> Hm, seems I forgot to include the base version, which should be my
> current s390-next branch...

Ah OK, we are good then, thanks!

Phil.


