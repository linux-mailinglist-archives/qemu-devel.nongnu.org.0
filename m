Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279162B9A94
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:29:02 +0100 (CET)
Received: from localhost ([::1]:44574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfog1-0001WH-5d
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfoca-0007Rs-F6
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:25:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfocY-0003R4-FF
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605810325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJj5guXGjXWVkvCC7TLln8A2LSy781kVRib9AaIC31M=;
 b=h7kWwYDlnZZJ15soEILMX8ajYf/Vk9oTXS2NBA7o81aCqqyehKyPXVmxhFJV+LlwtxEPjc
 OEaD4zAScAalbLJ0WeL01obY7kYYPy9qYwsZkHEoH9aWkKF5BdfFPlWFHH5TZgVpMkM7DQ
 yG3ygrrBhcrZdiGwZrENorWKiOYbOYk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-O8vwSaUZNAy7-B-dAIupTw-1; Thu, 19 Nov 2020 13:25:18 -0500
X-MC-Unique: O8vwSaUZNAy7-B-dAIupTw-1
Received: by mail-ej1-f70.google.com with SMTP id gr9so2493228ejb.19
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YJj5guXGjXWVkvCC7TLln8A2LSy781kVRib9AaIC31M=;
 b=VoKExCeDoUD8bekVwFzk5s2xvyEdjWDQHkQEdHZW1owP/qF26eIqplBG/BgJ/LIaoZ
 A4NGjSnQs23s+3ji+d6S96sD4eXbSWfUuIbWtT7ScO6FbLlJ9tF4yHUHfQXDe56IXKNB
 vov7hGCDKcc3553guVufryAOAVfPpYaUh72IRHLOSIaLrCj2+tGnBeMrlf1eQACBl6yU
 ErCFyJlvM+EUeti7QSZgT1yVWdAsVcGSKxXTgtxUVhJYMXDisD1gUVEcc9AnCDPsi/j3
 hqyHENAwV8ZFzpoubzC7jR5b1Qe4bnf+0VfEchgZ23jj2NdreygEXsteSG2X1xwU5rUg
 IU2w==
X-Gm-Message-State: AOAM531mtAOoJSu35TqTCijpFsiz//tac112P77SW6EmhD/sXjoqHSwX
 8czAJzozpOW9F0eoTqAmpNPFQMQam9ZZoCt2J+nBIdIRA2ceC0EMP5BxSUb4iavGb+QqGQ6aP9S
 jbxaLNejByGIOzgk=
X-Received: by 2002:a50:a105:: with SMTP id 5mr31078639edj.165.1605810317662; 
 Thu, 19 Nov 2020 10:25:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTIljKj/SKKUAeemZ1XIqD8ujN4Mm3cvOSzWI9lKapq6pFAO1XgjqlwG7AJakzA/D92LWgkQ==
X-Received: by 2002:a50:a105:: with SMTP id 5mr31078626edj.165.1605810317509; 
 Thu, 19 Nov 2020 10:25:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h23sm117279edv.69.2020.11.19.10.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 10:25:16 -0800 (PST)
Subject: Re: [PATCH v2 0/8] qom: Use qlit to represent property defaults
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <87eekpbjvt.fsf@dusky.pond.sub.org> <20201119171342.GT1509407@habkost.net>
 <981fb59f-ad67-886c-40e7-6f129997f4c7@redhat.com>
 <20201119175531.GU1509407@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <201edbb0-843d-9be0-af94-cd50d8771a49@redhat.com>
Date: Thu, 19 Nov 2020 19:25:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119175531.GU1509407@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/20 18:55, Eduardo Habkost wrote:
> On Thu, Nov 19, 2020 at 06:23:30PM +0100, Paolo Bonzini wrote:
>> On 19/11/20 18:13, Eduardo Habkost wrote:
>>>> What's left?
>>> Enums.  Enums properties are a mess to implement, and I plan to
>>> tackle them later.
>>>
>>> On all other cases, the external representation of the property
>>> value is similar to the internal representation.  In the case of
>>> enums, the external representation is a string, but the internal
>>> representation is an integer.
>>>
>>
>> I would have expected a string QLit to work with enums, is there a reason
>> why it doesn't?
> 
> It would work, but it would be more inconvenient for callers.
> Right now they use the C enum constant instead of a string.

It matches what you have to do already for compat props, so it's not a 
big deal.  I would say just use strings.

Paolo


