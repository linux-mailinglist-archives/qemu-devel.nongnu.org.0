Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FDA2F68BD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:07:45 +0100 (CET)
Received: from localhost ([::1]:56506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0729-0001IE-03
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06oZ-0007DM-SK
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:53:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06oY-0008T2-3a
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610646821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BsG6wao5idF9jFgTqVuCnBF6gUwtN0H7fQqebuvN72U=;
 b=U/q6xm8SoosKb3FpMrlIktb19x+mawZ4gJN/3B565F60gSFXOL23pzJ0n6Xg4vt7clD/kX
 n4yERiWOS3l4RnY1H2amBv7gctmSyt8P/ljCEeQOg4Uu3R2wezZGekeBoeyMK17YDD+pQl
 JctESJdLaOBmzRwyoqywvJvpcbQHONk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-9DI1jrp7Of22NfkjwFxUiQ-1; Thu, 14 Jan 2021 12:53:39 -0500
X-MC-Unique: 9DI1jrp7Of22NfkjwFxUiQ-1
Received: by mail-wr1-f70.google.com with SMTP id o12so2902130wrq.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 09:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BsG6wao5idF9jFgTqVuCnBF6gUwtN0H7fQqebuvN72U=;
 b=Rk9INthy+rqsGi+Isy6iII+J3hHzABI1acD57v5x9OAG5LsErZV4vllLlZa+CsVGh9
 mGbz71pUFoN1jnK+LoncaiJCinnTWPAlkrhUrVNHNSfD+HlIGqPB/vmVW3Rzf5pEM4S6
 4cegnfMJjoDfcETAsBUsNpzhrVVg7nyjp8IG6TjRNvAMlIwiQmbP18reho/CBvNoVONW
 96MejQLrNDzznE+ZvY1pIfZQJTCA/OeyoKvwx4nioRz5VuZj8SzfakBOOtp6HKQK69UT
 Nd8euvFWsaSv38V95zjBLH465vJYP8AHgBfPOe2So05nb2Qjf2PnqEKEKX/Bs5kDuQXq
 YETg==
X-Gm-Message-State: AOAM5324FJ+oQlfDZ0Oonz6/QzdOo68/fwAwi5mLMXHmpw9Qrr1i3GyF
 AKaTUAi8sIDXXa3oCeXieGAVKuclGppYYwJCdOR6/hESPHLaRAlJixFARAsWjk5vga9aFDGe/DA
 sjHJVKfNm82rv0fo=
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr2537535wry.301.1610646818397; 
 Thu, 14 Jan 2021 09:53:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDjg3CGS5+rz2dJ4HHgUfaiFFwWYFNCDBI8AtOWvH2TKGVrKWcNTUHKz9IN1MX29JiVHRCwA==
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr2537525wry.301.1610646818257; 
 Thu, 14 Jan 2021 09:53:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n11sm12673346wra.9.2021.01.14.09.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 09:53:37 -0800 (PST)
Subject: Re: [PATCH v2 08/12] docker: expand debian-amd64 image to include tag
 tools
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-9-alex.bennee@linaro.org>
 <6234da80-d742-fd6f-888c-5d2f5debfea7@redhat.com>
 <20210114175245.GW1643043@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f187737-f2d6-21d6-787e-b4a5ff655c42@redhat.com>
Date: Thu, 14 Jan 2021 18:53:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114175245.GW1643043@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 6:52 PM, Daniel P. Berrangé wrote:
> On Thu, Jan 14, 2021 at 06:50:36PM +0100, Philippe Mathieu-Daudé wrote:
>> Hi Alex,
>>
>> On 1/14/21 5:57 PM, Alex Bennée wrote:
>>> This is going to be helpful when we want to both test the tool
>>> integration and in the case of global generate a xref doc build.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  tests/docker/dockerfiles/debian-amd64.docker | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
>>> index 55075d9fce..a98314757d 100644
>>> --- a/tests/docker/dockerfiles/debian-amd64.docker
>>> +++ b/tests/docker/dockerfiles/debian-amd64.docker
>>> @@ -1,7 +1,7 @@
>>>  #
>>>  # Docker x86_64 target
>>>  #
>>> -# This docker target builds on the debian Stretch base image. Further
>>> +# This docker target builds on the Debian Buster base image. Further
>>>  # libraries which are not widely available are installed by hand.
>>>  #
>>>  FROM qemu/debian10
>>> @@ -14,7 +14,10 @@ RUN apt update && \
>>>  RUN apt update && \
>>>      DEBIAN_FRONTEND=noninteractive eatmydata \
>>>      apt install -y --no-install-recommends \
>>> +        cscope \
>>>          genisoimage \
>>> +        exuberant-ctags \
>>> +        global \
>>
>> This clash with Daniel's series which seems ready (and harder
>> to rebase):
>>
>> 'start using libvirt-ci's "lcitool" for dockerfiles'
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg772839.html
>>
>> Do you mind getting it merged before your patch?
> 
> I don't mind either way. I'll have to get mappings for those three
> packages added to libvirt-ci, so that we pull them in on the other
> non-debian distros too. Aside from that it is no big deal.

Thanks for the quick feedback :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


