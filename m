Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E046EA0E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 15:34:44 +0100 (CET)
Received: from localhost ([::1]:44346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKVP-0008NV-F2
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 09:34:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvKUA-0007FK-UR
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:33:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvKU7-0005fI-3I
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639060401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LvH2Xn+1B6EOi9XO5aY05DPO+WZijOOMKIgFZ/rm2NU=;
 b=SVycwN8dYH6xlG9guX4NAHJYTU5eqzsQbjtpgeJxnpqUlcN1gnNd/V91A/lfJZjzb8E/dO
 LbdlpAzTu6lNyrGYJLFsJSgmuee114JTzoWnRtXj0VPVFreMBTz3y3YAtDhAIbcaUb6t9K
 SY0NTJICTAGPQPRzQhgClKpztB3DQRs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-sh-XYzW2Pqmf6vUYOejcpQ-1; Thu, 09 Dec 2021 09:33:20 -0500
X-MC-Unique: sh-XYzW2Pqmf6vUYOejcpQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so2059052wme.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LvH2Xn+1B6EOi9XO5aY05DPO+WZijOOMKIgFZ/rm2NU=;
 b=UktdgV48pIyUD0c9Aq+JdIGEMQrhnspwJxnvugT7sJy+qv/DKS9PB5S5lvzuRvnUjY
 EapFD9E9hlsTDlQGZF0WjamXKbQp+197ph41jzAWl3r00jJAlFU+l4tW0vzG+K6cJjOw
 KearD87Y5CeBV8xW0GCNOB28Dan0oVR4+7NHpzEu0unqIOPJn4FvcILfbDVF1O/OnADA
 +HQpVx09ZB6hAAZoTaGCYUblNb4h0hDcOy8JWGebO8FslwPgL82ITnek/nh0HMH8Fjvd
 G56sAXrsnuGc/Y7wEx6c/q3EvmwFmkmZ9A4+nKyzMv3JZLWURikp5C34KBlZ1DYx0dKm
 F5XA==
X-Gm-Message-State: AOAM531xPrRGKQp3MrQyRol0mkZ0gTEbzHK1QFsJDRubusfSNVfncsON
 FiqIcrw97mf98379MipYJmmKpugldnlvNh++RCwEU1A53u1arlxOdXZT/A09VVQLhavHzlB9/us
 5x3JxFMgLfjxWEUQ=
X-Received: by 2002:adf:f40f:: with SMTP id g15mr7077069wro.536.1639060399140; 
 Thu, 09 Dec 2021 06:33:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxoSNz1xG0h8YwDfZRFwHl8VxaeQLgjyQz9tOA42MnDueOdL+zubcll7f8nCqtwlrTj4SjAg==
X-Received: by 2002:adf:f40f:: with SMTP id g15mr7077040wro.536.1639060398883; 
 Thu, 09 Dec 2021 06:33:18 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id a198sm8813219wme.1.2021.12.09.06.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 06:33:18 -0800 (PST)
Message-ID: <638a610f-5547-d349-ab35-0b3578bdd493@redhat.com>
Date: Thu, 9 Dec 2021 15:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] iotests: multiprocessing!!
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.12.21 13:22, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
>
> Finally, I can not stand it any longer. So, I'm happy to present
> multiprocessing support for iotests test runner.

Thanks, looks great!

Applied to my block-next branch:

https://gitlab.com/hreitz/qemu/-/commits/block-next

Hanna


