Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF3B49CC25
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:18:40 +0100 (CET)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCj8B-00086Q-UB
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:18:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCj3G-0004nF-D1
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:13:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCj3C-0005aF-PY
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643206407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=klHe426WFgtYm9fF8LbDcZyVKn4G2v19icWJptfjMaw=;
 b=SB4tVt5C/8/Jit4TniLmQW+IazG6ApJ4FwyLjVb9kiGYD6SGqtqoFSmBRgJL9Di6RZxV0F
 dQpSY8vua2ku33yEdRmt48nPpNxFORD8CTTDpYS5lX2NRS/jogxNRQrVY1grLilmI3ehgW
 rTDwVEeASoe7VS8FcKTFM8iqPd5H7w8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-lzKLlx0aOjqpq_T0vsAfKw-1; Wed, 26 Jan 2022 09:13:21 -0500
X-MC-Unique: lzKLlx0aOjqpq_T0vsAfKw-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay8-20020a05600c1e0800b00350de81da56so610539wmb.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 06:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=klHe426WFgtYm9fF8LbDcZyVKn4G2v19icWJptfjMaw=;
 b=z/KQTzvpOCMZu+xoJMIOu8bA6zV81blXKpc98TXA205ltnKIbtHInfrVliBePVMZoA
 LPzheYx2Jow3zXxc/21saP6wW7C1tof+ZsKjwDi5837VDAUb8PDQdMWq+g8IfmB9MY5K
 Z/kJ60ExLCoxUW63nuZ+Wj0+cGambjuoDAxrobmYcZekDP/JDSlFvqzWVqVQvbBei862
 kd/zpRjXExeTJm/oah32kRqSTOwXs7VHAiBqp73qeMY7sVZhBAkJVM/Z/MnPHNJ7XJhr
 I75QF/TSKYF/JXMyb2/VElmuMkpEXC3U7NQz94BThc7fMa4JwRTfNLC5/LPuxhqq6Zy1
 FTnA==
X-Gm-Message-State: AOAM533t9xPKlnkgoWsw4zWhc/R9FiZul3fovmP+QhzCy6QCe5wQd4wz
 wXwehgsJndyHhIoqCJojVSUOgpwnONbyj1hSJBJHAf/kmyqhWrA81xKdj+Z8Soc2JMktwbpajuU
 02Thlp8y9bgAzfk4=
X-Received: by 2002:a1c:29c3:: with SMTP id p186mr7213973wmp.22.1643206399980; 
 Wed, 26 Jan 2022 06:13:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZnZFPz8TLop+5quuCJjkAzKySRXZ885e0DtSLtjPZP7JQDI5Gs1mUoc249k2l3L7gCgACOA==
X-Received: by 2002:a1c:29c3:: with SMTP id p186mr7213927wmp.22.1643206399644; 
 Wed, 26 Jan 2022 06:13:19 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id h4sm23520637wre.0.2022.01.26.06.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 06:13:19 -0800 (PST)
Message-ID: <daa2d5d6-8f57-672a-2ce8-41e8d163d821@redhat.com>
Date: Wed, 26 Jan 2022 15:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 29/33] job.h: assertions in the callers of JobDriver
 funcion pointers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-30-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-30-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   job.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Just curious, why did you remove the assertion in job_co_entry()? 
(Looking at it again, it might have been nicer to swap it with the 
assertion below it, so that `job != NULL` is asserted first, but other 
than that...)

(And since I’m already replying to this patch, might as well point out 
s/funcion/function/ in the subject)

Hanna


