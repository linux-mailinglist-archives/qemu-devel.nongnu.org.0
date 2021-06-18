Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727723AD01E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:13:00 +0200 (CEST)
Received: from localhost ([::1]:39642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luH75-00026L-Bs
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1luH4K-0007Kh-I0
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:10:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1luH4E-0001On-Hh
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624032600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+6lgn0FAzGAoLDBxGAfYTAFmFGow+LWhk+THwMkDSQ=;
 b=COZwbhUc7K0+17zWYm7tSPjPPwrrXAUFpaXbAJgJw2Hh6fSzn8Lhc2W+k0AIAtjmpPXs9e
 peTOda4pmr2MpQF6yyI7tGSgTxYcLZJxcdguDbdnqQrPMg/AMG+aTWu+slMbQzU2tdVbdt
 9KCtNmCFxpbWiahjrcriaI2iBkwwJlk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-gxi9p_f_PEaBaKKWXqloFw-1; Fri, 18 Jun 2021 12:09:59 -0400
X-MC-Unique: gxi9p_f_PEaBaKKWXqloFw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l10-20020a05600c088ab02901d2febdac30so2120575wmp.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 09:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i+6lgn0FAzGAoLDBxGAfYTAFmFGow+LWhk+THwMkDSQ=;
 b=qg2Plqxz2VTD9ekzlMlIKa6D90ay3ePZ/ThBAf137E4GnQzSe/bMmqPQ8ornmT8tV8
 HbAvJ7dEuVwxGLmPoQD5g/SH6aTNyjy9+tsZ9Tk3Gagxd90kN04HPaH43Qy84OkCDzFF
 b4CeQMdhnxT/t0tvXsq8kfJxkuMOBgnkx4rEoT32VlfjRyyN/pa76kSb5XqHwl+bzFZM
 OVoA6N803nKnt62mpkye5zh2RvVOp75vf419J7SDZb4ze17HybCAiXK8g3SCs7mOGj5e
 1iFvv32NyU7aBoobz7682I+DpJxlOh9PW5SgAdmg1XoNy/5+8fJy4NKHyUbEsBr3345B
 ykNw==
X-Gm-Message-State: AOAM530Pg9Q4KV6nS+V4Me3JSXfGoNOZISaTZwtwxKOfr3969ejU5uOn
 0kHu2i9+5czYZ1SV9CGsFXbThoYVDju+1mV5GE/PwnNfiO+u9QQjxWTN9kv4I7xDdOXY8s4WVpY
 Uws1fnLMFUGNBCEE=
X-Received: by 2002:a7b:c38f:: with SMTP id s15mr12647599wmj.16.1624032598138; 
 Fri, 18 Jun 2021 09:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLUaWfYarKclk/pk0whorWc+vh50XluWHjeyONXXmrB3hIuUhUqG7oF0RAGfavqejmIMJJ/w==
X-Received: by 2002:a7b:c38f:: with SMTP id s15mr12647557wmj.16.1624032597881; 
 Fri, 18 Jun 2021 09:09:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c21sm8040006wme.38.2021.06.18.09.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 09:09:57 -0700 (PDT)
Subject: Re: [PATCH v3 02/24] modules: collect module meta-data
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210618045353.2510174-1-kraxel@redhat.com>
 <20210618045353.2510174-3-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <919b1ff3-914b-a9a2-781f-d8ae244d71cf@redhat.com>
Date: Fri, 18 Jun 2021 18:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618045353.2510174-3-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/06/21 06:53, Gerd Hoffmann wrote:
> +def find_command(src, target, compile_commands):
> +    for command in compile_commands:
> +        if command['file'] != src:
> +            continue
> +        if target != '' and command['command'].find(target) == -1:
> +            continue


Did you look into using extract_objects for this instead of looking for 
the target (which works, but yuck :))?

Paolo


