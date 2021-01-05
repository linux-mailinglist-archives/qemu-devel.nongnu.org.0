Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACA02EB224
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:11:08 +0100 (CET)
Received: from localhost ([::1]:51746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqnT-00026R-KL
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwqmF-00018s-JU
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:09:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwqm7-00045S-Hn
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609870181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TE00O/hBJEJed1l9AiByyou3X1WoJJGN3KHFRFtT6Fk=;
 b=g39Cae0n3UG20pHDwjDKY7C1Opx7Nk97lq7wcn/E8wEyocbDfa3yjfFspVyAjnhfz2krye
 vYCOBhQQskvrfizjjcAour54c4Xlq9+g9FSn5x3+9EMnUvAOrrLweTGwoxpoDHUCBmBhRC
 v5oPJ4e/GtTkXmCu47SOWi6n9mfFyag=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-dYc3y7QuOom3gcl6xzEQNw-1; Tue, 05 Jan 2021 13:09:39 -0500
X-MC-Unique: dYc3y7QuOom3gcl6xzEQNw-1
Received: by mail-wm1-f69.google.com with SMTP id s130so152086wme.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 10:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TE00O/hBJEJed1l9AiByyou3X1WoJJGN3KHFRFtT6Fk=;
 b=cjvFZN/ibxmeUWO+w0zH8xDLm/ZI0p6MKrfQSWRQA2dbYRCF4pJE5yKaKjNgRCHJ4w
 dRcEZZCzGDIQ74WMHWR8tA3T3HdHhqsVRqJKo3StHO90/+mAbvj3boVE6P2Njt3nPkbt
 Tvz8/4W1STpszOU89y1aov/RoNpNaj3BRaOrsn9L6XDmJHDZRr6tJG1/Yc1QB6plXJaR
 MrOktQvQgrwqSjQUoHKhkbGXVMjS27Bo2NBfxrWicQaaaXP7OBI6QetIb2moGZ4LsRW3
 pbUCSUvV6AZaOnA9DAonHGCna0gLGqeeveW+yXmZK6rmw4samR/VGrwFQzdkoNDnkyES
 33Fg==
X-Gm-Message-State: AOAM530kuSe5YEdo98VxdgwAvxFOlf6mUfkyI7FrQARu7kUIHap5AuDb
 9EYdBcP3Uf4NNmHkv/rdGqj1MzBTHUAMMKhZr93gTVpkAy4hnFhap8J5NUHfuEvJa2KvSxrGcvt
 e3wRiUZxeWd/sAXQ=
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr306022wmi.143.1609870178101; 
 Tue, 05 Jan 2021 10:09:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhpZg+qmF+gwW89U14p9rXfip1zlEpdKVsrPJ4vJO4IMx99LzOfeDMIOYVjlRkBzOP/bgoBg==
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr306011wmi.143.1609870177959; 
 Tue, 05 Jan 2021 10:09:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b10sm378137wmj.5.2021.01.05.10.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 10:09:37 -0800 (PST)
Subject: Re: [PATCH 1/1] vl.c: do not execute trace_init_backends() before
 daemonizing
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210105180325.536160-1-danielhb413@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6637b86c-d0f9-4253-2f04-3ceec1a6edc2@redhat.com>
Date: Tue, 5 Jan 2021 19:09:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210105180325.536160-1-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/21 19:03, Daniel Henrique Barboza wrote:
> +    /*
> +     * The trace backend must be initialized before daemonizing.

after, not before. :)

With this fixed,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> +     * trace_init_backends() will call st_init(), which will create the
> +     * trace thread in the parent, and also register st_flush_trace_buffer()
> +     * in atexit(). This function will force the parent to wait for the
> +     * writeout thread to finish, which will not occur, and the parent
> +     * process will be left in the host.
> +     */
> +    if (!trace_init_backends()) {
> +        exit(1);
> +    }
> +    trace_init_file();
> +


