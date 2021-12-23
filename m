Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA5B47E27E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:42:27 +0100 (CET)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0MUM-0005KM-Bl
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:42:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n0MQ5-0001K1-6T
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:38:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n0MQ3-0002wr-85
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640259478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MVvUNOfggJu3v+Zkk5uXmA7t+SI6cG4ju5zklh2btg4=;
 b=CsZyeTH7ThRFeMJXRqVVRkg3HuiQH0o/Ppd0bao87s+6Ny5tSMlb37KZUn8vHvCyf+Gd9F
 6fcpHyuZaWOQ/EIp1qVJkEGgURtGDA1grnPWY6Npvj4I2LFhJs0PX1nmYvxRaJgElD67OK
 6AL0TFNUoLnfQ8oYIgFmMu5DJIqmUus=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-hzSehasfOyutvdn8gv1zog-1; Thu, 23 Dec 2021 06:37:57 -0500
X-MC-Unique: hzSehasfOyutvdn8gv1zog-1
Received: by mail-ed1-f72.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso4272944edt.20
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MVvUNOfggJu3v+Zkk5uXmA7t+SI6cG4ju5zklh2btg4=;
 b=kwJbgIhWFeerCxdOo6ohhex3BM6B+OVjEdcxO60L6tYQO9HL5EuKENZectudVXK2lz
 XndsaBmCZffrkTywGB6rzw/Wb/i/rEUanDKwI/xZthyUUzLpjLcYOKvcSu/TjTuLwnO+
 lnrQbXJbtjnyWjVwx4MMHPPiPyCRCP659TXE6COJq/XGTAIXoM/VvayF0aARZsF4jhkW
 PrGmcl71+VRDa/3OLdca9r/++KX/NiMkmTsI5spHXaQX8QCGSL9oh9imPgidd9v4Nl6U
 GmmW52sjeb4eQfUK8olRs7tm6RY45czlUx9cQ1D9jfYUd0XrIFX5ucLO3Jvi/eEYHjOQ
 CadQ==
X-Gm-Message-State: AOAM530wuz6sNBx8Bt6wtq53/lMXp+u9w4xmELDW6pXPZ4+XFI7+gUtk
 zT9wSr3Xnx5zK9oSkuoYpd0Z58KIJV+c6WbILAwBGRdgGg3xEcdyx7c+jscbAPFF461Dp9pwnNU
 63uclX7n8QIqciEU=
X-Received: by 2002:aa7:d906:: with SMTP id a6mr1692560edr.363.1640259476750; 
 Thu, 23 Dec 2021 03:37:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypNlcaStmdMn2tL9fot7laifiJD3aJL2ozK5ccPha143ZfskVfe6gedHxajoD0DDFxBq1ILg==
X-Received: by 2002:aa7:d906:: with SMTP id a6mr1692543edr.363.1640259476624; 
 Thu, 23 Dec 2021 03:37:56 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id v8sm1900832edt.10.2021.12.23.03.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 03:37:56 -0800 (PST)
Message-ID: <1a57508f-5fda-0f9d-027a-b1fd943680bc@redhat.com>
Date: Thu, 23 Dec 2021 12:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 11/14] block_job_query: remove atomic read
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-12-eesposit@redhat.com>
 <6982e901-c03f-6b90-b226-77814804c00d@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <6982e901-c03f-6b90-b226-77814804c00d@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18/12/2021 13:07, Vladimir Sementsov-Ogievskiy wrote:
> 04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
>> Not sure what the atomic here was supposed to do, since job.busy
>> is protected by the job lock.
> 
> In block_job_query() it is protected only since previous commit. So, 
> before previous commit, atomic read make sense.

To me it doesn't really, because it is protected with job_lock/unlock in 
job.c, and here is read with an atomic. But maybe I am missing something.

> Hmm. but job_lock() is still a no-op at this point. So, actually, it 
> would be more correct to drop this qatomic_read after patch 14.
> 

Will do.

Thank you,
Emanuele


