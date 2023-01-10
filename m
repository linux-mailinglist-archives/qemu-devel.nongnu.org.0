Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743BC663ED2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 12:02:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFC89-00019d-KI; Tue, 10 Jan 2023 05:45:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFC87-00018j-5L
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:45:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFC85-0002eU-Uh
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673347515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Wd1rhRA/GK92VbVs5Gpx/a6dcL32K4rUH1wQrAQzQ4=;
 b=VMRhgu+X13J9SE4dIKPRWIU+Uad/9ZhCZAaJJROZxqX4jxFHv5LXD5Crk6KP8KvNXQbgx0
 nNOgGFNzjqjxqjTLI0jiX1TdfotBtW1psp0kFTwq/dVf/AUwSt1cMxhGfe8LY8Kp1RvL7W
 14YGeZrJAxr7toefhRK90hJOXeiAqNw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-WED3uC6vPECFm4X9roqc7A-1; Tue, 10 Jan 2023 05:45:13 -0500
X-MC-Unique: WED3uC6vPECFm4X9roqc7A-1
Received: by mail-qk1-f199.google.com with SMTP id
 de38-20020a05620a372600b0070224de1c6eso8511555qkb.17
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 02:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Wd1rhRA/GK92VbVs5Gpx/a6dcL32K4rUH1wQrAQzQ4=;
 b=6bUUH6SnPmVyC+jkFAxTvKqAZ1Uds4QqeeFvaAaVdWCd6/2zzPpmfVQFUxT/0DaWlH
 MRhJoc2VnYTnmFygaRipyp5Kho7KqPPdlG7X3cDnh+D4j1Kzy046qst2qTZIGqCRjuy/
 eBDxoIFhQE7TXCKOXg8aGxoCvpzDAM0TXd4lX0W8HPIjmY7AfMHQuLqqsQzYWClJ8dw9
 EcnbFk3qBYDlaN2qPD+7CgC68HZwwVCFRNFPHhJBGw4MxhBkufuB60K4HOymkqTTvKh9
 kkzcQI5TsQ5zFR8gCKHMVvKwT9h8NR8Yz9Gf3wKWhwr/1lkUcrVcdlny8KVZ+Y7SGzmT
 4+vw==
X-Gm-Message-State: AFqh2kqv1QDgWlz6D2UXw95edNTllgqYltek1whS7FZiqXx/5qABziND
 queKceZ+0lSXsSjuPKfShauYRZ+qvnp56vK6DlvFJAoejTpi+SBJ07l/IqhzuF64UmjZvmURkY4
 Q3gCZJqSidfACDjE=
X-Received: by 2002:ac8:7450:0:b0:3a7:e599:1ee0 with SMTP id
 h16-20020ac87450000000b003a7e5991ee0mr82269334qtr.63.1673347513454; 
 Tue, 10 Jan 2023 02:45:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMkMZtE8Qlhb9ogtRtov9FtyO8Ecag8e/x4CclYonAgmOYlIQ2F68AvLi66HTVKzp4u8CWpQ==
X-Received: by 2002:ac8:7450:0:b0:3a7:e599:1ee0 with SMTP id
 h16-20020ac87450000000b003a7e5991ee0mr82269305qtr.63.1673347513258; 
 Tue, 10 Jan 2023 02:45:13 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-237.web.vodafone.de.
 [109.43.179.237]) by smtp.gmail.com with ESMTPSA id
 w22-20020a05620a425600b006cbc00db595sm6959690qko.23.2023.01.10.02.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:45:12 -0800 (PST)
Message-ID: <c72d7868-a465-e4c7-855e-e19c7c8acee0@redhat.com>
Date: Tue, 10 Jan 2023 11:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 0/8] Fix win32/msys2 shader compilation & update
 lcitool deps
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, pbonzini@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Ed Maste <emaste@freebsd.org>, kraxel@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230110080246.536056-1-marcandre.lureau@redhat.com>
 <87358ioen0.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87358ioen0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/01/2023 11.41, Alex Bennée wrote:
> 
> marcandre.lureau@redhat.com writes:
> 
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Hi,
>>
>> Fix the shader compilation error on win32/msys2 and convert the related script
>> from perl to python. Drop unneeded dependencies from lcitool project.
> 
> Queued to testing/next, thanks.

Please make sure to fix the permissions (a-x) of the new script in the first 
patch.

  Thanks,
   Thomas


