Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10F347B216
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:26:43 +0100 (CET)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMQs-00065c-Iy
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:26:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKxK-0002Ru-Hr
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:52:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKxH-0004o0-74
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640015522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PK6CqLqNO44fjRxA0cdMixayW1tdGf2LpNBIt9XXOww=;
 b=ISiSkncBU6aoeduINbdEDV9+vGdbERcj7PqVyLY0YEzk/NKBCdvBBLlD93jzQeXPelpN6C
 wbZN9gB0gm58v4DoC+tVoA7mZUckXQkX3woYF+/uzZiFAk+/CloivyqzgXJL3hlyqhmTQg
 KkGV+6gDJOu7FBbqXxSH1otzFO4rzzc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-P_IjAAYnPBWAS5saUUKmeg-1; Mon, 20 Dec 2021 02:26:36 -0500
X-MC-Unique: P_IjAAYnPBWAS5saUUKmeg-1
Received: by mail-wr1-f69.google.com with SMTP id
 c16-20020adfa310000000b001a2349890e1so3431832wrb.0
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 23:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=PK6CqLqNO44fjRxA0cdMixayW1tdGf2LpNBIt9XXOww=;
 b=U/fXFKit33gs20rVq7jfGKgoW0O5+f/mAHc3Ksecnt4Kw+KW/GVW4CmE5karQAGgWQ
 gWfijK4LfiJ571EGOFw8j2jLJs5/nf+dxofoii0gf85cUCUJO9cBT+struafAB7AGyc3
 aGj9O6no9ZbE5IzkuWTe5GRhN4xJRc+aZHg8u0B9T7J7eW2gAffsvCrmDueuHm6dZ2WE
 h/M02CzOOTewrzDt6YuQyRHKYG1Q7dcLBgONLONF66suvoKlqpq9N933RMh7XyU8P0Kq
 azF51SnmjisKyerxi8eX96OUVqW2A+LDI162eIOcXIBfO3pJL1VasxE23b6yNLDaEWyk
 euOg==
X-Gm-Message-State: AOAM530F0/XwN3usxfZyHQCI3rJdD9HOe1ttoZ71o2D3pSW+u6/uoSTh
 Z0zUq0IGEVIgw8BmS06K33p6eqdOUIBeUngYy4mIT5qIYy3hWp9BzjMARH69KblN80yK4xiUCA+
 zDUMvc6uRYadZDyQ=
X-Received: by 2002:a05:6000:1845:: with SMTP id
 c5mr1467093wri.420.1639985195546; 
 Sun, 19 Dec 2021 23:26:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGw9tjCCDpSPtZUZOotxhIxAJr9Aw/CRI/zlUCKOmpUW0Ocx/Tq+Oym2W7U79e4hNqi/a09A==
X-Received: by 2002:a05:6000:1845:: with SMTP id
 c5mr1466954wri.420.1639985192317; 
 Sun, 19 Dec 2021 23:26:32 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d2sm14593496wra.61.2021.12.19.23.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 23:26:31 -0800 (PST)
Message-ID: <4dfc91ff-1835-e796-772c-0774e089b57b@redhat.com>
Date: Mon, 20 Dec 2021 08:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: build qemu on Monterey?
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org
References: <alpine.DEB.2.22.394.2112182006430.46303@anisinha-lenovo>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2112182006430.46303@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/2021 15.38, Ani Sinha wrote:
> Hi :
> Has anyone tried this? Yes, I know about
> https://wiki.qemu.org/Hosts/Mac
> 
> but I am getting
> 
> $ ./configure --target-list=x86_64-softmmu
> Using './build' as the directory for build output
> Disabling PIE due to missing toolchain support
> 
> ERROR: glib-2.56 gthread-2.0 is required to compile QEMU
> 
> when glib is already installed using brew.
> 
> Any ideas?

1) Check "config.log" to see the exact reason for the failure

2) Check .gitlab-ci.d/cirrus/macos-11.vars to install the same packages on 
your system, maybe that helps...?

  HTH,
   Thomas


