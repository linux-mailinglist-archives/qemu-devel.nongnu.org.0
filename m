Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79D7490B72
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:35:44 +0100 (CET)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9U2p-0001Bc-PA
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:35:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9Tqz-0000or-0y
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 10:23:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9Tqv-0006MA-SK
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 10:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642433005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eptcp3tAvcq5hmKWsJUSp8SYz6a+GwEZa29b9sA+JtM=;
 b=MLWw65fp6D8TEyiEJHi8S90Ucw/7gwh9D9UWJT75lIf6p8rf1CsHQwSB/MnBvLu7uPJCMw
 5EaVThGx2ZCb9u+Jr95rYEF0/XS4WSnY1o+k5aeg4EXmBvMJ/IkPFHHoWrXvimMIz7aj03
 1uGtlbMGrcnoFtorOkRd6OlbsFk4CeI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-2NlF8AZ3O_u__xmmqbee7Q-1; Mon, 17 Jan 2022 10:23:09 -0500
X-MC-Unique: 2NlF8AZ3O_u__xmmqbee7Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 n14-20020a7bcbce000000b003488820f0d9so70545wmi.8
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 07:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eptcp3tAvcq5hmKWsJUSp8SYz6a+GwEZa29b9sA+JtM=;
 b=pD+pt0sN/J2X+9NQ1Xby5T6EzLydT78rXnExg3BssiRtr8cuMry8U9NV61stqIfrQL
 deRAQn6FJLNCyoGDLZVK+115p2mzaE727911koYmPuZo4EOyGQYj2Y3R+bpposuhJBqM
 hilRBjIg/+HWj89LCBIaO5czPlbfwe0/jCLLAJRAur1m45K9GCas5vR8CwYmzMsPCr9O
 WAptaBdCerYraqCyL/0XiYLxabsEO+CQIe4rLiBpYNQU354ROuj1y6hIK7XeAf2k96c1
 +Ghq56UGo4HWGB1Nh28ktS9ESejOC8b7ev5+wqukRKopSwTf7bNoQ6MFftjU6XgU9SIf
 LEwA==
X-Gm-Message-State: AOAM5310OD+vBgVuxDS0tQZYBTPa9oOuW5SxAvAVDCWlYrAcDF8g7G3r
 KWp+YSTnz0L/IjMoIzmkpX9DugVeiHcmQdyreL9x4h7/HKPK8b8XXcjldIKOkHMkAjhldK2BnPS
 piGPfQRzhh84YZaA=
X-Received: by 2002:a5d:591a:: with SMTP id v26mr17775954wrd.557.1642432988540; 
 Mon, 17 Jan 2022 07:23:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyan0rksifvJHIoHblxOJ60zZ1eEn4rTVauXh+dyyVNUHHQkMTF1U9LOQ8Be+iumOxosZj7UQ==
X-Received: by 2002:a5d:591a:: with SMTP id v26mr17775934wrd.557.1642432988357; 
 Mon, 17 Jan 2022 07:23:08 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id t125sm5251214wma.15.2022.01.17.07.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 07:23:07 -0800 (PST)
Message-ID: <32c83624-eb3b-05ea-6fb6-737bd9876db3@redhat.com>
Date: Mon, 17 Jan 2022 16:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 0/9] s390x/pci: zPCI interpretation support
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20220114203849.243657-1-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220114203849.243657-1-mjrosato@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/01/2022 21.38, Matthew Rosato wrote:
> For QEMU, the majority of the work in enabling instruction interpretation
> is handled via new VFIO ioctls to SET the appropriate interpretation and
> interrupt forwarding modes, and to GET the function handle to use for
> interpretive execution.
> 
> This series implements these new ioctls, as well as adding a new, optional
> 'intercept' parameter to zpci to request interpretation support not be used
> as well as an 'intassist' parameter to determine whether or not the
> firmware assist will be used for interrupt delivery or whether the host
> will be responsible for delivering all interrupts.

  Hi Matthew,

would it make sense to create a docs/system/s390x/zpci.rst doc file, too, 
where you could describe such new parameters like 'intassist' and 
'intercept' (or is it 'interp') ? ... otherwise hardly anybody except you 
will know how to use these parameters later...

  Thomas


