Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E5699402
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:12:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSd6P-0000XY-Qo; Thu, 16 Feb 2023 07:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSd6O-0000XO-Ep
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:11:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSd6K-0006YJ-QL
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676549458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cq5OruFNkhwV7aBJ+TWHSrBrrBT45F+gx+L5Nu7PWPA=;
 b=A+GUpS5lBVv7+LXC5CUtgUQYJEKd1vvciIcba2Hq0zPPyIwW7QhbfudouMKwtyV5nYDdi2
 d7Xza2kuCBLFoISZyW1U4BJTuQDxdtKohRHFJ0XBxHB6sAgnSQaCi7B7qykD61gGyXyY8v
 6Z6C+HmjNt5tBenkM9V8mkOHH8PAFZo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-117-NDVSrgUMPKubsVVpO5LscA-1; Thu, 16 Feb 2023 07:10:57 -0500
X-MC-Unique: NDVSrgUMPKubsVVpO5LscA-1
Received: by mail-wr1-f69.google.com with SMTP id
 g8-20020a5d46c8000000b002c54a27803cso217215wrs.22
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cq5OruFNkhwV7aBJ+TWHSrBrrBT45F+gx+L5Nu7PWPA=;
 b=cNgZfzrKLuUDUVqyazgRtX6TuQTBk8Pp+wIKDf/FD0VOFGVym2/C7stdI03hN/Lwir
 dwmowj0TF2MoCxL6pOIBDjCPepNzY5AsW/fUSCL/lfCwdoSwHchP+CN71O8K8K20QI9m
 DTdfX2zcakaROrgZ2MfH5tgX2nZyMB2vi+efDZwOwY9uCDziCCQBv9LOUBwYzA6OCrgT
 0zdWLjuh0BnkU1Hsl+g4x7jesyXTzWI60N/xCKN0JpgxbwJAQuT/hQYJizPeQYbRwJ54
 uNS8uYVN5kDez99HIvKp0z+bZQMC95HRdQ0kPyiupxr0AJq5+GjEZhSuLsDRIgynEJsk
 ed+A==
X-Gm-Message-State: AO0yUKXbtge48tc9Q37ZYBwt0+sfxQ33jmmsDb8sKEblZ6jysoFoFm3m
 cZUeDOGFeqV+yR4XpDSwMua4/qT8mpLesme0PrObwCAdioc/xnKjRQHRGf33U/1zP7EfoRNuPkE
 cb+W0A7Igq2d+k6U=
X-Received: by 2002:a05:6000:1c0b:b0:2c5:51a5:9ef8 with SMTP id
 ba11-20020a0560001c0b00b002c551a59ef8mr1601156wrb.8.1676549456049; 
 Thu, 16 Feb 2023 04:10:56 -0800 (PST)
X-Google-Smtp-Source: AK7set88yAyFxHkeJWygZs5l98aWoCgIjoAuXaqew/XnWkR2c046tNFnV6Fzd3hwD6AZg8NnRvjZqA==
X-Received: by 2002:a05:6000:1c0b:b0:2c5:51a5:9ef8 with SMTP id
 ba11-20020a0560001c0b00b002c551a59ef8mr1601137wrb.8.1676549455714; 
 Thu, 16 Feb 2023 04:10:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:bc00:2acb:9e46:1412:686a?
 (p200300cbc708bc002acb9e461412686a.dip0.t-ipconnect.de.
 [2003:cb:c708:bc00:2acb:9e46:1412:686a])
 by smtp.gmail.com with ESMTPSA id
 p13-20020adfcc8d000000b002c57475c375sm1299979wrj.110.2023.02.16.04.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 04:10:55 -0800 (PST)
Message-ID: <0fe7b18c-507a-2c11-8440-e9e35294b4ba@redhat.com>
Date: Thu, 16 Feb 2023 13:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/2] vhost: Defer filtering memory sections until
 building the vhost memory structure
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-2-david@redhat.com>
 <20230216070037-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230216070037-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16.02.23 13:04, Michael S. Tsirkin wrote:
> On Thu, Feb 16, 2023 at 12:47:51PM +0100, David Hildenbrand wrote:
>> Having multiple devices, some filtering memslots and some not filtering
>> memslots, messes up the "used_memslot" accounting. If we'd have a device
>> the filters out less memory sections after a device that filters out more,
>> we'd be in trouble, because our memslot checks stop working reliably.
>> For example, hotplugging a device that filters out less memslots might end
>> up passing the checks based on max vs. used memslots, but can run out of
>> memslots when getting notified about all memory sections.
>>
>> Further, it will be helpful in memory device context in the near future
>> to know that a RAM memory region section will consume a memslot, and be
>> accounted for in the used vs. free memslots, such that we can implement
>> reservation of memslots for memory devices properly. Whether a device
>> filters this out and would theoretically still have a free memslot is
>> then hidden internally, making overall vhost memslot accounting easier.
>>
>> Let's filter the memslots when creating the vhost memory array,
>> accounting all RAM && !ROM memory regions as "used_memslots" even if
>> vhost_user isn't interested in anonymous RAM regions, because it needs
>> an fd.
>>
>> When a device actually filters out regions (which should happen rarely
>> in practice), we might detect a layout change although only filtered
>> regions changed. We won't bother about optimizing that for now.
> 
> That caused trouble in the past when using VGA because it is playing
> with mappings in weird ways.
> I think we have to optimize it, sorry.

We still filter them out, just later.

>> Note: we cannot simply filter out the region and count them as
>> "filtered" to add them to used, because filtered regions could get
>> merged and result in a smaller effective number of memslots. Further,
>> we won't touch the hmp/qmp virtio introspection output.
>>
>> Fixes: 988a27754bbb ("vhost: allow backends to filter memory sections")
>> Cc: Tiwei Bie <tiwei.bie@intel.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> I didn't review this yet but maybe you can answer:
> will this create more slots for the backend?
> Because some backends are limited in # of slots and breaking them is
> not a good idea.

It restores the handling we had before 988a27754bbb. RAM without an fd 
should be rare for vhost-user setups (where we actually filter) I assume?

-- 
Thanks,

David / dhildenb


