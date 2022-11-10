Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FAF624280
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:42:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6rN-0001CR-Fa; Thu, 10 Nov 2022 07:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ot6rK-0001C1-Bg
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:40:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ot6rI-00068Z-3o
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668084038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GJDmslE5kpRIeRte7cJxqHO6JYkG0L07TgHNDXOjsI=;
 b=gVwnco7PxdUhUpZUfdcLV0c7XxFRydpDShADpo6rxxovIpyWdACJq/nrnFP0fO+Xd+Oupz
 pYSU7eH2/iYgMDydATSyHAX840dVs7mcVswWD8CWMSmFPkf8cqwNOVc/JRjPFESW9eEzHj
 JkpDN13scRxFJvzIpKiw3Z/MmaWiJS8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-ZsJA7ARKP6iJFJ8avQwkNQ-1; Thu, 10 Nov 2022 07:40:37 -0500
X-MC-Unique: ZsJA7ARKP6iJFJ8avQwkNQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 ne36-20020a1709077ba400b007aeaf3dcbcaso639609ejc.6
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 04:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6GJDmslE5kpRIeRte7cJxqHO6JYkG0L07TgHNDXOjsI=;
 b=xOaGNrad+mlTFT/TTx06cLM25ezhyRBJsFfaTgeQkp9t1z9bjhRoUKTOVdzhD/V12x
 f7WpBjFYxf7csoNMFMa8xcyQwpnJw2ks6oIVmviSTsW7+NX4m9IonI5O7oI7fXnSY7Je
 zHcT3+dCGrenNdIrcLCLwzgYKxibQwY+6k2AGq/KYZKxf+4LMhYIcWinMz8D3MVrOtTa
 5jHBIxBEvL+Lp0+gQNhqv4bEXHzrCy2Sz6ytDzDxUcpRl3Ks7M5SlRWNG06fKXb+Sfh3
 E/0umf491Jzi8nlmzeSNiA1ggBghbz9WvzL0nzBUTDoHKkh9N+BliwIa9LGPRPJ68pyh
 hEkg==
X-Gm-Message-State: ACrzQf2ccdUcf5nq9pg9TVfaflrpUMSa6+YG/8ldJckXkWaFW4PGuXUn
 NxwzqXMtafhBP1qeWw5s5SCc4DJlPy/BD68+BNQ9HlD2OddzUAjKuZ/KitZpyUkgndieLw8eePN
 taXEZV1rVCVkFlWk=
X-Received: by 2002:a05:6402:1cc9:b0:456:7669:219b with SMTP id
 ds9-20020a0564021cc900b004567669219bmr2307869edb.221.1668084036114; 
 Thu, 10 Nov 2022 04:40:36 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7SYcRzSsV2Rs1/EU+7abg/+uLahP3r4uuKBvB/CRiKbK7CWiHWX0HPgwzo59vC8aUsK4gCjw==
X-Received: by 2002:a05:6402:1cc9:b0:456:7669:219b with SMTP id
 ds9-20020a0564021cc900b004567669219bmr2307853edb.221.1668084035758; 
 Thu, 10 Nov 2022 04:40:35 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a1709063e5200b007a62215eb4esm7283881eji.16.2022.11.10.04.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 04:40:34 -0800 (PST)
Message-ID: <6ed00204-fc89-0e3a-c128-0b0e8eb3d66b@redhat.com>
Date: Thu, 10 Nov 2022 13:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.2 3/5] block/mirror: Fix NULL s->job in active writes
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, John Snow
 <jsnow@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20221109165452.67927-1-hreitz@redhat.com>
 <20221109165452.67927-4-hreitz@redhat.com> <Y2zqGLunpfbCGElN@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <Y2zqGLunpfbCGElN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10.11.22 13:10, Kevin Wolf wrote:
> Am 09.11.2022 um 17:54 hat Hanna Reitz geschrieben:
>> There is a small gap in mirror_start_job() before putting the mirror
>> filter node into the block graph (bdrv_append() call) and the actual job
>> being created.  Before the job is created, MirrorBDSOpaque.job is NULL.
>>
>> It is possible that requests come in when bdrv_drained_end() is called,
>> and those requests would see MirrorBDSOpaque.job == NULL.  Have our
>> filter node handle that case gracefully.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> This can only happen because bdrv_drained_end() polls, right? So after
> changing that it won't be necessary any more, but this series is for 7.2
> and the drain one isn't, so this is the right thing to do for now.

I was wondering the same, but I haven’t tested it yet.

Hanna


