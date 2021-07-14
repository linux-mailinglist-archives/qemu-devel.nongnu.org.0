Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933F3C8147
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:18:03 +0200 (CEST)
Received: from localhost ([::1]:51250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3b1m-0001db-C8
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3ayh-0007vY-AJ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3ayf-0005nY-6z
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:14:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626254087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKuiKD+kQhQGZnEX0E3SzOHBi/nZpb3yWApPaLLii10=;
 b=YaytVCL1u6yK/VQSXTdU4LVo4lQX5mqSphsOKISepfp9wlTxhoGBNNqcO4IXkZbkIXvtw6
 vVNzzbsz1sKAvcDO4LK4uwDYzs4x5ghGfqV+889ORRTWaVFlm9VzIFZEezPHmzVyx+ZjJ7
 /liDNFjipIDr893nxZxMWkUJVPSAOu8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-M1SoneOFNrKZRZqx5JWsaQ-1; Wed, 14 Jul 2021 05:14:46 -0400
X-MC-Unique: M1SoneOFNrKZRZqx5JWsaQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so533576wmh.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QKuiKD+kQhQGZnEX0E3SzOHBi/nZpb3yWApPaLLii10=;
 b=aTU2gHIWuwKX8deP0fyc7H9crI7f2Z1j5V2hQ//MX/DBZbRkrDKeaoJ/a9Pqu5WwqK
 BcdfhZhcVp2H+gYSVRVZ8GDfuaDffvhCzKvKb78qy3j6UgMLfgzYXhfJihe2khyNJLG7
 V7brjMwG8SREpRzsG0TJoYrdAf4MYPfpfojE9R2ABpvP74NmQ5zcDwvW/XxKCG2dwOS+
 Cs7l1fhPIkit2xxCKfoWboh+R9w+9T7WStfl53Djz9XcNwIg6z+thyvhg/mUPVMXRAQT
 t0xrnIuO1XruCKm4JT7NxiHA8oRKy2TuMAhddtipZrFwrO9RUJ8aCtHocyk5PLxlJ6RL
 XK5w==
X-Gm-Message-State: AOAM532+PBWKusJxYdu8VB8lSeznOpyBv9Fb3evmWL3Y5JG778yI+oem
 EmXT0s8syAIaw2VCgclvhBcN1K+dldiE+pnsHFQ+tiacai90NyvZrGvCpdIvl9e+ntEDqRDqoOo
 RPMC6epTtAfjegLA=
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr11774310wrz.344.1626254084958; 
 Wed, 14 Jul 2021 02:14:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqEs4H5TxfBHw8rvijc73NJmgbX/kkr4KFsP9ywidaV7A2dgcasyqdnz8l5Zfo1DDbscfCxQ==
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr11774280wrz.344.1626254084693; 
 Wed, 14 Jul 2021 02:14:44 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id v2sm1710049wro.48.2021.07.14.02.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 02:14:44 -0700 (PDT)
Subject: Re: [PATCH 1/4] configure: Fix --without-default-features propagation
 to meson
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210713093155.677589-1-thuth@redhat.com>
 <20210713093155.677589-2-thuth@redhat.com>
 <0ea4b6c5-c0f9-9ce2-a291-9cc1171ed93a@redhat.com>
 <08771faf-4294-74ff-020f-7827aac3ead7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <67514b35-bda8-97a3-ccb6-a6d2d9d0018b@redhat.com>
Date: Wed, 14 Jul 2021 11:14:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <08771faf-4294-74ff-020f-7827aac3ead7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/21 9:35 AM, Thomas Huth wrote:
> On 13/07/2021 18.42, Philippe Mathieu-Daudé wrote:
>> +Alex
>>
>> On 7/13/21 11:31 AM, Thomas Huth wrote:
>>> A typo prevents that many features get disabled when the user
>>> runs "configure" with the --without-default-features switch.
>>>
>>> Reported-by: Cole Robinson <crobinso@redhat.com>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   configure | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/configure b/configure
>>> index 85db248ac1..229ea52516 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -5205,7 +5205,7 @@ if test "$skip_meson" = no; then
>>>           -Ddocs=$docs -Dsphinx_build=$sphinx_build
>>> -Dinstall_blobs=$blobs \
>>>           -Dvhost_user_blk_server=$vhost_user_blk_server
>>> -Dmultiprocess=$multiprocess \
>>>           -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek
>>> -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
>>> -        $(if test "$default_features" = no; then echo
>>> "-Dauto_features=disabled"; fi) \
>>> +        $(if test "$default_feature" = no; then echo
>>> "-Dauto_features=disabled"; fi) \
>>
>> The option should be name plural (default_features)...
> 
> I agree with Markus - the way it is used in the configure script, it's
> rather meant as singular.

OK.

>> What is 'auto_features' used for?
> 
> https://mesonbuild.com/Build-options.html#features

I see, thank you.


