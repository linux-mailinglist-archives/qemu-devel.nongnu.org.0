Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247230732A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 10:52:59 +0100 (CET)
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l53z0-0001rJ-Lh
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 04:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l53wr-0000WK-02
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 04:50:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l53wk-00010v-UQ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 04:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611827437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VApTZIMKGuP050zPhgxcjE+rQi3LbFjIhI7THIIROJo=;
 b=a+tR4zrFyVRqjr28ertHYSJcR7pCAzetE5gvwawbPO6GDId3gUEmvLdslsd/6U5qx53dwg
 5voE1qQNwmYzYQB+x8kokVzoFJZrv1D5zulRE59bHLHXzb3a5SD6jUFLe5AV2LZJ58x+9v
 9VwE44lGtD89J2uYoet9gVamES7Qs9Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-Y7zASLgFOh2O73OcL0AHRw-1; Thu, 28 Jan 2021 04:50:34 -0500
X-MC-Unique: Y7zASLgFOh2O73OcL0AHRw-1
Received: by mail-ej1-f71.google.com with SMTP id yc16so244095ejb.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 01:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VApTZIMKGuP050zPhgxcjE+rQi3LbFjIhI7THIIROJo=;
 b=ncKTHPAl0j4TTHIQp/n6xL3L7KW+Cyx/rs4MfJ3oJkeaFwjx+DuByujMl+9T8INxaO
 UoF4AzWRVdUReBr0/d58g5ENyLa8rW4gcGsQ6ECtfzX+Ljt1eIndmVihB7PqzucFpadp
 r8OsIQI3SKufdeae7B9E2tzALBaHwOThUnxWUOTtj/DrZlMPeYM2AycoQwqeHrqgysFt
 gbiiu37QJPb3eCR34P0/WB6EcrMOup+LSe8N3KHsdgmspbRthn9Ji8ashjKLDBnaYV/P
 2ayMYp7jLuGCsvYoaJmdc+tyKDdlbWK5AYJT3jOP9h12/OyKN1mt3ix/Dszx2Qaul65Z
 SkXQ==
X-Gm-Message-State: AOAM5323iU+Il0B/KJJ25o0cl6rDYcuZI12HG9ysC0iWa3SD0BBZz8D1
 9XJdIeP0alq6zyKp2si0vHtC/Ddpn/6Cq5QgyDweUllmXwgykIabum1ICCg9lFIeVXzik9lrgfJ
 YOOqvtCsWXhbbqeo=
X-Received: by 2002:a17:906:e28a:: with SMTP id
 gg10mr10114879ejb.11.1611827433552; 
 Thu, 28 Jan 2021 01:50:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbQkAzDE94VIY0aKi+KiIo9XafxLgwMta/hBVUZpt6qAKWKZhE8v6LciZZUnu85048Y1YQLQ==
X-Received: by 2002:a17:906:e28a:: with SMTP id
 gg10mr10114861ejb.11.1611827433328; 
 Thu, 28 Jan 2021 01:50:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w2sm2077567ejn.73.2021.01.28.01.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 01:50:32 -0800 (PST)
Subject: Re: acceptance-system-fedora and acceptance-system-centos failing
 sporadically with timeout?
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <7da911b5-40d3-fd3b-768f-862c07f879ba@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1abd21ac-271d-3e26-b086-ea238be66bd2@redhat.com>
Date: Thu, 28 Jan 2021 10:50:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7da911b5-40d3-fd3b-768f-862c07f879ba@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Alex Bennee <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/21 10:45, Claudio Fontana wrote:
> Hi,
> 
> is it just me, or is the CI sometimes failing with timeout?
> 
> One nice feature that cirrus and travis have is the ability to relaunch one specific test,
> do you know if there is some way to do it in gitlab too?
> 
> I could not find it..
> 
> Fedora:
> https://gitlab.com/hw-claudio/qemu/-/jobs/986936506
> 
> CentOS:
> https://gitlab.com/hw-claudio/qemu/-/jobs/980769080
> 
> 

There's a retry button in the top right corner.

Paolo


