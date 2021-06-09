Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543403A0FBB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 11:34:38 +0200 (CEST)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqubd-0005A5-Dm
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 05:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lquas-0004KU-Sx
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:33:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lquar-0003D2-Ef
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623231228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsydsiqKNRGQisPli3CmOhUTiU3xytqrzAOA1LI2lxA=;
 b=XHjOGCJbci4fgQza3j8eGRI5klTNB2FDzVBzqSsT6sCea4z4nfI21N3VO00pOaFjtl3Pz7
 drvvzLlcvaus/ic5LeIPFxc2WevVRa8EGHEzcu/JDTz3Q374Md62bbqGZfOVo1IoCH++m2
 PVhxtzz2S2oLSjz3eqHuB3Ic+q03Y0U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-VgEmLm9OPlW0eOoFTScwfw-1; Wed, 09 Jun 2021 05:33:47 -0400
X-MC-Unique: VgEmLm9OPlW0eOoFTScwfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 w3-20020a1cf6030000b0290195fd5fd0f2so1720775wmc.4
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 02:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IsydsiqKNRGQisPli3CmOhUTiU3xytqrzAOA1LI2lxA=;
 b=arRXCh5Sdd48T+I3uAeohHEUd23PFE2bmdm8Q7tkg9kQL0YvMpjnFcWo5NXNHNCp27
 Uo6mGR7YQSiKrjan2KNf8N0ZNhlV8Yo0UgIA6uTf+VYAmBe4r/kh+e3k4G9+hjV6okWr
 kUID1b4s3HPrikzwcrNr5s5kjwnPL7xEp8yVTu0TvrVugt5GlKtRbCdVMXRQtGSMjUJe
 JQNnsZpGF8al8TWQJHsNT5Fq1jLSPrNPqkcb5auuEPFS3imw6dM3l6bG5AKg1NW8sj51
 V/hClXlno9KZ+jroK6bypY2vGARjxiU0rEKZ5sBHjIiddmn0juLKrBWdzLJk2YMENWEv
 +k4Q==
X-Gm-Message-State: AOAM530+7m3ZdsnAVjZwcr6zsxFoys0XB1ZEBgcFnNNApHZ4CR7K4rp/
 eRDwHOBBNd+Zvjy8F/1lfH8caFWzhnVcQUGOYq0BE8rtch3m4MaW0w6Cb1j4utVoZuKWVfe0S96
 xgCbSfaM6mXQdsQU8GVMno/8vJSfcbEN+68q1lEq3N6m4/BJMQJ2UbTb3DhAy1sWUqIM=
X-Received: by 2002:a7b:c394:: with SMTP id s20mr21990231wmj.33.1623231226476; 
 Wed, 09 Jun 2021 02:33:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfzhXvQhX1AoW65Y00BDmqFx4hJOjba31eb/ZLO2VMaD/SpAfC85juws8ApL8uaa/2PzVMwA==
X-Received: by 2002:a7b:c394:: with SMTP id s20mr21990209wmj.33.1623231226289; 
 Wed, 09 Jun 2021 02:33:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w23sm5795926wmi.0.2021.06.09.02.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 02:33:45 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] block-copy: streamline choice of copy_range vs.
 read/write
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-2-eesposit@redhat.com>
 <ddc23736-d6ce-cdde-21b8-f809ef65ea65@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8f49c449-583b-8842-9920-dd0dc1196e1f@redhat.com>
Date: Wed, 9 Jun 2021 11:33:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ddc23736-d6ce-cdde-21b8-f809ef65ea65@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/21 10:51, Vladimir Sementsov-Ogievskiy wrote:
>>
>> +    default:
>> [...]
>> +        bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
>> +        ret = bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 
>> 0);
>> +        if (ret < 0) {
>> +            trace_block_copy_read_fail(s, offset, ret);
>> +            *error_is_read = true;
>> +            goto out;
>> +        }
>> +        ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
>> +                            s->write_flags);
>> +        if (ret < 0) {
>> +            trace_block_copy_write_fail(s, offset, ret);
>> +            *error_is_read = false;
>> +            goto out;
>> +        }
>> +out:
>> +        qemu_vfree(bounce_buffer);
> 
> label inside switch operator? Rather unusual. Please, let's avoid it and 
> just keep out: after switch operator.

Agreed with all comments except this one, the bounce_buffer doesn't 
exist in the other cases.

>> +    ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
>> +    if (s->method == t->method) {
>> +        s->method = method;
> 
> you leave another t->s occurrences in the function untouched. It's somehow inconsistent. Could we just use t->s in this patch, and refactor with a follow-up patch (or as preparing patch)? 

Maybe as a first patch, yes.

Paolo


