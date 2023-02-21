Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085369DBCC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:19:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUNrP-0004BN-5g; Tue, 21 Feb 2023 03:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUNrF-0004BA-6F
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:18:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUNrD-0005os-HE
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676967518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CuXPluzChhagxSiy0wQ9vrAanxovku0rlfb4EatUjNM=;
 b=UWD2YcQp3msVUva7NyM37e6gIYBxpheGqtbyNJQDyyCUiC81XJ5HLuET7LmpYGJMhAM5oU
 4NxX2I5jjHiLDhI0M6qMQxKTCY1DRej1FxGRkBxT29yoZ48UztUfV9CfCANQHPZA0s5rQL
 3UstIoTH4U1gGnUHVedKWli42xyBsxM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-K--zWA3yPGOB7nOHx5hwBA-1; Tue, 21 Feb 2023 03:18:37 -0500
X-MC-Unique: K--zWA3yPGOB7nOHx5hwBA-1
Received: by mail-ed1-f71.google.com with SMTP id
 co14-20020a0564020c0e00b004aab4319cedso4394904edb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 00:18:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CuXPluzChhagxSiy0wQ9vrAanxovku0rlfb4EatUjNM=;
 b=alHf0muFF34vfESGXIkrRkoWb6I3JTAYdAUJNwFX7R1SFmSFdPUkKCK7C0GGE0NF6c
 1vZFOu909g3q7bdXlHLWAdmV7vp3nyVF/XXeQeJ4mLXG08d9YXaS98w5EEHgjPTt5yTA
 xPcXL+3Srn/B2kfx4MbNFVa7uyf9bcw5X07JiPyFrA/WCdyyn61cOzg3c5+4t+1U+fQr
 MDxtT5y72BnxYMmC2GmExNgpIE4sa4mTUcWMWCNNMnb3aHFIhTGLNTVzmD0HbvYXKYzN
 ryt6zyEPIkh1Ol1qYjlrsfeGlXyF7vL7dUKTj+vls+JegqEwYMgC3NI7dKm31razwLzv
 H0tA==
X-Gm-Message-State: AO0yUKWyYhqdPhHurg86EGOHtqhD0nkU1rM/issyNesidrt8wBv7JwIJ
 fgXS3TMT31vQwAL2r7T7R+KcuotItjisSGUs1XAlBBxPvwaeXHr5yL/k1ggAVKxH9VyQx4rEThI
 9GgZv2zZJVqiWJIQ=
X-Received: by 2002:a17:907:3f91:b0:8af:5752:26e4 with SMTP id
 hr17-20020a1709073f9100b008af575226e4mr9805968ejc.68.1676967516029; 
 Tue, 21 Feb 2023 00:18:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8BYNhvuNVQBgR1bkhrJENMLqyaYMnAxpIgVnfNDXadAykroHogKs98LqarUHYl9Kfa4W55yA==
X-Received: by 2002:a17:907:3f91:b0:8af:5752:26e4 with SMTP id
 hr17-20020a1709073f9100b008af575226e4mr9805949ejc.68.1676967515774; 
 Tue, 21 Feb 2023 00:18:35 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 kd18-20020a17090798d200b008b2aba5fb22sm5468490ejc.206.2023.02.21.00.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 00:18:35 -0800 (PST)
Message-ID: <55e488cf-0b5f-f1e9-0a15-5d3e8c155abe@redhat.com>
Date: Tue, 21 Feb 2023 09:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] win32: stop mixing SOCKET and file descriptor space
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-4-marcandre.lureau@redhat.com>
 <87r0ukbjfp.fsf@pond.sub.org>
 <CAMxuvaxiN1jYr70k2yK0CUSjo4UQF8DqjPX_COvCdtAWhf3zNw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMxuvaxiN1jYr70k2yK0CUSjo4UQF8DqjPX_COvCdtAWhf3zNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/20/23 16:29, Marc-André Lureau wrote:
>> 7. A Windows SOCKET is also a HANDLE.  Maybe.  I guess.  Docs are
>>     confusing.
>>
> Kind of, but not really. I think a HANDLE is a kind of void*. You need to
> be careful using it appropriately with the right functions. Sometime, a
> HANDLE can work with generic functions, like ReadFile, but you should not
> use a CloseHandle on SOCKET, or registry key..

A Windows SOCKET *is* a file HANDLE except it's always in overlapped 
mode so Windows provides send()/recv() in case you don't want to deal 
with overlapped mode.  But you can use it with ReadFile too (Windows API 
documentation says that is only true sometimes, but Winsock API is 30 
years old and right now you pretty much always can).

However, sockets also has some extra information on the side, so you 
need to close them with closesocket() and CloseHandle() is not enough.

The problem is that close() of something opened with _open_osfhandle() 
*does* do that CloseHandle(), so basically you are closing the handle 
twice.  IIRC there used to be undocumented functions _alloc_osfhnd() and 
similar, but they don't exist anymore (even Wine does not have them), so 
we're stuck; unfortunately this is the reason why QEMU is not already 
doing something like what you have in this patch.

Is this a real bug or is it theoretical?  Do file descriptor and socket 
spaces overlap in practice?

Paolo


