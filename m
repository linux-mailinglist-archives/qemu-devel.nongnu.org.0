Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111413891DC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:49:07 +0200 (CEST)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNVS-0004eq-68
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljNT6-00024H-8e
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:46:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljNT1-0001sp-8i
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621435594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=of8rXyLAk2z0NcFFSnT7fG4BWo+UUNbTmGN/Q5bZrqE=;
 b=Jzq10eaTb7HT1CCWhqoDrPIoNBh6p5f0WQzT3yUxhyP4ukcTHGUYbOHwRpaFsCW1hq4Bri
 DoNXGOMufUsuUfsiGypmtfR43OjBeBIXfJ0K0AQNXiNseczKubDGBvv7RNGgi6MSnlY3n7
 kGUvmOjEiBU9lOikATsKs4eJ7UiCZKg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-Z0YzcMOBP4Obz0Eq8AvwjQ-1; Wed, 19 May 2021 10:46:31 -0400
X-MC-Unique: Z0YzcMOBP4Obz0Eq8AvwjQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 y193-20020a1c32ca0000b029014cbf30c3f2so1610916wmy.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 07:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=of8rXyLAk2z0NcFFSnT7fG4BWo+UUNbTmGN/Q5bZrqE=;
 b=Pk5olWBADy+qfB3wXCorXQyXXHe/lGEP8UahIsFlsG96NI+A+boeUQeSmcdoCEjbRr
 VZZUJ18g2yP0BE9muca+mLLiRjsaILD3pKaO5V7B01fR/RZo68cDJu1aaCH8dWYYS+9w
 8jTdcio+ojErhtlBFp0p2nnpvna60iMRLVZWL80JwxmzNXbQ+KqCWWffwfCfz7QPzKzs
 na8eoE4hN7TwdFnuZK6/2ljKosA3lzfkmA2yPi1bF0XFlrhLSQNdfdePvo49MHnq2wdM
 O0S/O5d6YuV/7QHkdxLe4TF4yT74vQW/MfUesBblxBBiO/zDY/eftTzCo+E6Ujurh0q9
 iQoQ==
X-Gm-Message-State: AOAM5322QVyGs4Pw3KQMees6tkjBn1JnVPRaSp4gZppL4vxp6y0d15Bv
 Clxt+x7RYXWfSCil51AHVbDPDRY3x0ZCZDwXwXa7iZ+i5bnbsqvjTEPaeOuSANYKw0zDLuMyhhg
 IrUwGFEox+HfYsGo=
X-Received: by 2002:a05:600c:4ca7:: with SMTP id
 g39mr12071901wmp.1.1621435590309; 
 Wed, 19 May 2021 07:46:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgCBP3NuJ8N2l/WXRPm9I3JU+aTFtxULd5ggoiSYYRMxOIwdJiD8xupwcvRIT89j05i7X/IA==
X-Received: by 2002:a05:600c:4ca7:: with SMTP id
 g39mr12071889wmp.1.1621435590109; 
 Wed, 19 May 2021 07:46:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t17sm18224275wrp.89.2021.05.19.07.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 07:46:29 -0700 (PDT)
Subject: Re: [PATCH 0/3] vl: add -object support back into -readconfig
To: Kevin Wolf <kwolf@redhat.com>
References: <20210518154014.2999326-1-pbonzini@redhat.com>
 <YKUZoU7EIBwhFasL@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <36687456-6b50-affc-9d09-900c74b18eca@redhat.com>
Date: Wed, 19 May 2021 16:46:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKUZoU7EIBwhFasL@merkur.fritz.box>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/21 15:58, Kevin Wolf wrote:
> Am 18.05.2021 um 17:40 hat Paolo Bonzini geschrieben:
>> LXD developers have reported that [object] stanzas have stopped
>> working in configuration files.
>>
>> The problem is that QEMU 6.0 switched the creation of objects from
>> qemu_opts_foreach to a bespoke QTAILQ, in preparation for supporting
>> JSON syntax in -object.  Entries from the configuration file however
>> do not go through object_option_parse, and are thus lost.  Of the many
>> fixes that are possible, I chose one that is slightly more invasive but
>> more consistent with the plans for keyval-ification of options such as
>> -M and -accel.
>>
>> -set was also broken by the same change, but for simplicity I chose
>> not to add it back yet.  However, this series will report the
>> breakage instead of failing silently.
>>
>> The first two patches of this series are thus a reduced version of
>> https://patchew.org/QEMU/20210513162901.1310239-1-pbonzini@redhat.com/
>> ([PATCH 00/14] vl: compound properties for machines and accelerators),
>> with the -set infrastructure removed.  The third is very simple and
>> uses the newly-provided hooks to parse objects from configuration files.
> 
> Looks like this is
> Based-on: <20210518131542.2941207-1-pbonzini@redhat.com>

Just context, but yes it is.

Paolo


