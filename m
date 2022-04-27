Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9A7511538
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:18:04 +0200 (CEST)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfgJ-0005xo-5E
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njfe7-0004hU-8q
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:15:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njfe4-000770-84
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651058142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+9OPStlHPYeQgJlquPacNLyjiSYyLiXb5GW+sPFPBU=;
 b=FNKw4iVV7bNk7LHqbkbYVHq/eJe4cPCjVftJuCqHN/PIM+YqQ69xKXchuX4S4ueHElntKB
 en9dNPudpcTjkuT//n34NQbajTN6S7IGh80M/FmYaz156v6Tymz+LCVrGi04NG67I+whY5
 r3roKfJimMfdA1S6FqmdOeT5/WfLYdY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-Q4n_9lhuMSeZbirVpO5-IA-1; Wed, 27 Apr 2022 07:15:41 -0400
X-MC-Unique: Q4n_9lhuMSeZbirVpO5-IA-1
Received: by mail-wm1-f69.google.com with SMTP id
 i131-20020a1c3b89000000b00393fbb0718bso1533544wma.0
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A+9OPStlHPYeQgJlquPacNLyjiSYyLiXb5GW+sPFPBU=;
 b=5rBU+4LhTXTUiUXWan0K5+AvhXuwuWjV9uZ90qZ4F7PdgyPTHYCshNzfHq5HKkrR9L
 GM8pqUe8GBSSOHP+ZWngkWqCe2GcxmDlW5X/vZer9EDK9pBQnrFdPQnxz4NtT4NzydOf
 +0N+Wc4zR9aZFuJCuHje9cnsow51wzn9wgzJ6rfU0paJ6aHUYK5M5RudJvueIUbdf9t3
 +XVm0jkX9XaKuq/JPMSmpkcuSGboxqHUdIqE0BNaTxzO+1fHa8QxdTrFFyaGY8Lf3bkd
 4d4gDSYtdzGt1pdKNRVjMDW0V3+PDugHc6du/EyBjzMfPl+PmdwsykWkO26Wdbg1ms9/
 CGow==
X-Gm-Message-State: AOAM533AZuzLj/aMIfGk1INJijTARQ2g7Ox3kjSSdV9m58MnnABq0IVE
 DLKsDofvKSP5OhxV+cqUlt9r4G34wWG1VGmFGLk03gBmZp1011f6uQqGADtfPK1pzVGr5HMB/hr
 4kAeUXll65Qojkmw=
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr34767614wmq.34.1651058140333; 
 Wed, 27 Apr 2022 04:15:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr7/m8IUljjNft62oW5Yo0zwlvi2epQ+G6Ut9/mKSLkuhJF5+UJb/JcniFxTh+STlm00OOaA==
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr34767597wmq.34.1651058140149; 
 Wed, 27 Apr 2022 04:15:40 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 h9-20020adfa4c9000000b0020ae2a771fdsm5514033wrb.72.2022.04.27.04.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 04:15:39 -0700 (PDT)
Message-ID: <b2ba1d12-1f60-5f9a-de45-cc3e2df68b3d@redhat.com>
Date: Wed, 27 Apr 2022 13:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 25/26] tests: replace qemu_set_nonblock()
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-26-marcandre.lureau@redhat.com>
 <1a33c268-6d00-4385-f0d2-84a86b022f63@redhat.com>
 <CAMxuvaye_cx2THfEmk5N3=Z-iqR4=mqa4oGBSg5hCkQdkwMngw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAMxuvaye_cx2THfEmk5N3=Z-iqR4=mqa4oGBSg5hCkQdkwMngw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/04/2022 12.33, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Apr 27, 2022 at 1:41 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 26/04/2022 11.27, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> The call is POSIX-specific. Use the dedicated GLib API.
>>
>> g_unix_set_fd_nonblocking() is also available on Unix-like systems according
>> to its name, I suppose? So what's the advantage of this change?
>>
> 
> This is a preliminary patch before the last patch
> (https://patchew.org/QEMU/20220426092715.3931705-1-marcandre.lureau@redhat.com/20220426092715.3931705-27-marcandre.lureau@redhat.com/)
> 
> We should reserve qemu_socket_set_*block() usage to socket-like fd.

Ok, makes sense now, thanks.

Reviewed-by: Thomas Huth <thuth@redhat.com>

PS: In case you respin, it might make sense to add a sentence à la "We're 
going to limit qemu_set_nonblock() to sockets only" to the commit description.


