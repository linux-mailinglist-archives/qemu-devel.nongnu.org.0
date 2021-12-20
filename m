Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68FF47B3BD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:32:07 +0100 (CET)
Received: from localhost ([::1]:45010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOOE-00068l-10
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:32:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzMVr-0008NR-A0
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 12:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzMVk-00041U-Tk
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 12:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640021500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtughHq2ZhD5Bv6iiwCH05mp84Mo4y1Q3DIdbj6f07M=;
 b=Di1BnEP9wB0uNmc+Ldpg1DZeiaLbf5p9bLsXvxhEUe/x4pKGxvwobEzUu3svAyVxjIqoHF
 M7bBO85q3PScbSNBW6UAoshESv76R2kSU+oKiy7PmcPA126ZxxKfURQrEEq2T1kgO7C1AB
 bR4UVRtnK0QwykDr72xo5d0HGH2SwbM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-9so3voNgOgmwO1BPnT4H9A-1; Mon, 20 Dec 2021 12:31:39 -0500
X-MC-Unique: 9so3voNgOgmwO1BPnT4H9A-1
Received: by mail-ed1-f72.google.com with SMTP id
 y17-20020a056402271100b003f7ef5ca612so8133956edd.17
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 09:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HtughHq2ZhD5Bv6iiwCH05mp84Mo4y1Q3DIdbj6f07M=;
 b=5xFP8gQAQ1+m+7DQPOdOuzoIcdl2ik4ePlOz1N60W1SBNxJPwhuOdW52vtfLFdnDc4
 KPxhccAR6r72VfbE2un8eCOds7e/ma7cBkvubRIfivdOnqN3mXVHJrvBnYuNziEaHF9u
 Detra5JSPWAmWx/uSVWzSJ2ehCaKu/Ve/F9feClbkP7ZM4XM6JcEMs3L6oPR3Kgx3JAk
 jaxr/sxSSN4YSTVqbc0TNZA/keGOeQNWR7CkaOexnJyISwvKmWCpaHsN7lu3PETHeMIY
 yV+mi2WXt4eJ2sypb3raNGxJL4c55uqEUWbwtqaHNOz3pfHI6o4DgD3cYhj/3fCwSxUS
 EIgQ==
X-Gm-Message-State: AOAM530lj+l28HS2gRM6xQTHTmsttvsStlLc8C9EEQCwISsvsyQZ47vf
 NnOID7MHbX5VGM5mNr4Hdmb/H9Rn0XTr8QscEIpXeW3ysK9tXBOSX2AEDYMbBDRSaiW/fUW2ShF
 /lkfk1MaSf6ZFMSc=
X-Received: by 2002:aa7:c78f:: with SMTP id n15mr16858991eds.344.1640021498009; 
 Mon, 20 Dec 2021 09:31:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZRZr1sQ7fqLMHK/+z0Winnp81l9R7l5sl0j/0SkNokO90HXiEynYZcBGNpidQYm9uuc58ag==
X-Received: by 2002:aa7:c78f:: with SMTP id n15mr16858966eds.344.1640021497738; 
 Mon, 20 Dec 2021 09:31:37 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id h7sm7217811edb.89.2021.12.20.09.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 09:31:37 -0800 (PST)
Message-ID: <0a830f15-bdca-02b2-d36d-2063e31c5e75@redhat.com>
Date: Mon, 20 Dec 2021 18:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC] MAINTAINERS: split out s390x sections
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20211220115419.308463-1-cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211220115419.308463-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 12:54, Cornelia Huck wrote:
> Split out some more specialized devices etc., so that we can build
> smarter lists of people to be put on cc: in the future.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> As discussed offlist. Some notes:
> - The new sections have inherited the maintainers of the sections
>   they have been split out of (except where people had already
>   volunteered). That's easy to change, obviously, and I hope that
>   the cc: list already contains people who might have interest in
>   volunteering for some sections.
> - I may not have gotten the F: patterns correct, please double check.
> - I'm also not sure about where in the MAINTAINERS file the new
>   sections should go; if you have a better idea, please speak up.
> - Also, if you have better ideas regarding the sections, please
>   speak up as well :)
> - Pull requests will probably continue the same way as now (i.e.
>   patches picked up at the top level and then sent, except for some
>   things like tcg which may go separately.) Not sure if it would
>   make sense to try out the submaintainer pull request model again,
>   I don't think it made life easier in the past, and now we have
>   the b4 tool to pick patches easily anyway. It might be a good
>   idea to check which of the tree locations should stay, or if we
>   want to have new ones.
> 
> ---
>  MAINTAINERS | 86 ++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 75 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


