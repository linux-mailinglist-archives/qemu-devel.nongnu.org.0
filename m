Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF9C4894B1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:04:35 +0100 (CET)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qbS-0006hF-6B
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:04:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qYj-0004Z2-N2
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:01:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qYe-0000Nw-8i
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641805299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4sdztrKVFC/ImQF7JDEXnu+M8QMgoGnd9rr9E866cas=;
 b=IYRbHehcpu9Lm3K5MfPsZvUHi2x3EOQ65P1acZF89G7i++3elPiMNwx68AIfGbXWNyFBld
 7ik5VIkJyF9npJ0KXqTNW2oaQ6Gp2/spbj+RsTK7TOta5YUDBCi8W2x6JNQCvGThSnuaqr
 va9I3nOO4YzHRfTuxeRHR9KdScmgiyA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-lutqtMTROVSZVMqZXpxUmw-1; Mon, 10 Jan 2022 04:01:38 -0500
X-MC-Unique: lutqtMTROVSZVMqZXpxUmw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y10-20020a056402358a00b003f88b132849so9602334edc.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:01:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4sdztrKVFC/ImQF7JDEXnu+M8QMgoGnd9rr9E866cas=;
 b=5wSyuCYFwQJFtwx+CAmjWlTjU5jZgS6i8fD9Y8ijEOnF83L0McyZiLlYoacXXEr6uf
 JMU3NXBHpmtMIYKqAddhU7Op6gfzlL3cgtjGuW3MLbyUI3vVrUyVNzyD9K7KzG8jl58w
 r36XeB1So6ijw+SznOcyPNhRDLZph2SGLVeXppSoDxtn1hT48kFTRMS1Xt/Y/YMfotz/
 drdORJA/BK1PtD87LYpAPpSryZx6x6RZaAuQojiqZbGmthcFNoJ2d9f7ncYDRspO1gDU
 Z/mefYJOXBLFQPkM3RolYHlAg8WwcHdCNg6PAanb0eEpqP6A3nWVE21abRsMoY+dZx3p
 Lg4w==
X-Gm-Message-State: AOAM531MkAYlMeA6/MNSolrsrTYHuClJRJEOEdecL/y6G0LJD4lj6jyN
 e9cScf7Vis6slD9/zy+GDiGDNyJCF1CzJUMKuUwtuNb7eO6h8oiexM+3c+Lq7CSaUX7saCLIfri
 V6L9CEfpf6E4nNNs=
X-Received: by 2002:a50:d55b:: with SMTP id f27mr7325851edj.168.1641805297240; 
 Mon, 10 Jan 2022 01:01:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/D2cyr6DvC18+Y3Fn9H6XhvjK3h0iKM251PSI7icKywdxsOaVKOwjfPmkh6p60QOrCCWhJg==
X-Received: by 2002:a50:d55b:: with SMTP id f27mr7325832edj.168.1641805297073; 
 Mon, 10 Jan 2022 01:01:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id r8sm3255203edd.39.2022.01.10.01.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:01:36 -0800 (PST)
Message-ID: <552d2d59-9be5-83a1-9871-c140db768d80@redhat.com>
Date: Mon, 10 Jan 2022 10:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 0/5] Clean up error handling in libvhost-user memory
 mapping
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.01.22 07:47, Raphael Norwitz wrote:
> Hey Stefan, Marc-Andre, MST, David -
> 
> As promised here is a series cleaning up error handling in the
> libvhost-user memory mapping path. Most of these cleanups are
> straightforward and have been discussed on the mailing list in threads
> [1] and [2].
> 

A note that we still want the fix in [3] upstream:

[3] https://lkml.kernel.org/r/20211012183832.62603-1-david@redhat.com


-- 
Thanks,

David / dhildenb


