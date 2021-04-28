Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05B836D9FA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:00:27 +0200 (CEST)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblfu-0002XE-RF
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lblXD-0002hE-4u
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lblX7-000786-6V
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619621479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5UVnzr3otyLygfTMQs43mdwu2iWIZCyu67yAj8n1NY=;
 b=Gg74fsAp2WAiqpLMdwR3kFgdQgjGEuMI9Wa1F5gUtoynGXgFy2mCZNInWBJio1Z1Rz5vyu
 xQKpw9E6rZraqROHM6t06tGI7xo3jCge5CsNQBDybrOoTiV5xH822wD1wPtOT0d1ifFmSW
 c1X63rJOLvM9lOtncxUFmLaKwHh5PMU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-UYKK2wcBPGWBzwhvT5ADNw-1; Wed, 28 Apr 2021 10:51:15 -0400
X-MC-Unique: UYKK2wcBPGWBzwhvT5ADNw-1
Received: by mail-wr1-f71.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso220756wre.8
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g5UVnzr3otyLygfTMQs43mdwu2iWIZCyu67yAj8n1NY=;
 b=YbeYhZUqo2BqZt7Au/TLMsY8FErb5KrvaLxOvlgRUhkk9xrJSelxSvzR8dX1HRk8V5
 AFDB6Enb0oDeWMUbNmLU59kMica8KQuvDD64gyRC0nTVXigAyOT3hWMyeYNPI/TPw+RL
 3eO9k5a3mztjSACA7/beDGco4LPlPFxlfDhmYrriumQLa8ZR7vjLPU2XgEsCUyvJPVIQ
 Xq244o08NoLipkRITYnylSC6Q6z18vPCKbFNKpzq0HYlJ570bFXK6bJ+7BTIp+kyp5Uk
 jv6KxemG7lS6267xKda2VrSp8zH852VWtfyMX9oD05TnmCppaCVbR851kLl1Rbc7Z+Ch
 qQIw==
X-Gm-Message-State: AOAM5337y8HvqEyBe9aCcgUxVIlK7yL4Vl7HpzdO5nZD3WvGP1I4tFHR
 fccLCSpLAI+ipOtJdbyCzjW4Si2xCE8X7QmSxx2AGT+rRANjPkGz/oLPlKUfyfqPGV6mH91nKip
 sxqpMIxScz1o+10A=
X-Received: by 2002:a5d:5141:: with SMTP id u1mr36840539wrt.207.1619621474873; 
 Wed, 28 Apr 2021 07:51:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpK9tCAeR/cYyTSnIJ0XbTRNebsXcXUlnzjTsVI3cCYGmm85KlrQHSXILOJoq1iSWYdWgT0Q==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr36840521wrt.207.1619621474737; 
 Wed, 28 Apr 2021 07:51:14 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i11sm243503wrp.56.2021.04.28.07.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:51:14 -0700 (PDT)
Subject: Re: [PATCH] tools/meson.build: Error on enabling virtiofsd and
 have_system is false
To: Connor Kuehl <ckuehl@redhat.com>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
References: <20210428133507.52066-1-ma.mandourr@gmail.com>
 <e1059890-79ab-eae6-1db1-5c4033f7b584@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <55319a65-1f67-f767-3091-cd3207c8c949@redhat.com>
Date: Wed, 28 Apr 2021 16:51:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e1059890-79ab-eae6-1db1-5c4033f7b584@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: pbonzini@redhat.com, dgilbert@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 3:56 PM, Connor Kuehl wrote:
> On 4/28/21 8:35 AM, Mahmoud Mandour wrote:
>> Previously, on configuring with --enable-virtiofsd and specifying
>> a target list that does not contain a full-system emulation target,
>> a spurious error message is emitted. This patch introduces a
>> meaningful error message for such case.
>>
>> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>> ---
>>  tools/meson.build | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 3e5a0abfa2..f6a4ced2f4 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -5,7 +5,9 @@ have_virtiofsd = (targetos == 'linux' and
>>      'CONFIG_VHOST_USER' in config_host)
>>  
>>  if get_option('virtiofsd').enabled()
>> -  if not have_virtiofsd
>> +  if not have_system
>> +    error('virtiofsd requires full-system emulation target(s)')
> 
> I am not entirely sure if this is true. The error message before this
> patch is applied is:
> 
> 	../tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd
> 	requires libcap-ng-devel and seccomp-devel
> 
> From what I know about virtiofsd, I know it definitely depends on those
> two things.
> 
> Is it possible that the error here is that the top-level meson.build is
> not properly collecting the seccomp and libcap-ng dependencies if the
> configure invocation doesn't require a system emulation target?

This series should fix your problems:
https://patchew.org/QEMU/20210428144813.417170-1-philmd@redhat.com/


