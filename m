Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AC53446AE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:07:40 +0100 (CET)
Received: from localhost ([::1]:40190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLDW-0001CU-LK
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOKru-0003HO-1u
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOKrr-00034F-7q
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616420713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7gi58PlUYSJbOuLVA2kjZ+xaD9o/zUCuOIiGJB3nCY=;
 b=J72XtT2++2+St6YhxhoTrc1RR0dk3J2bjPrJOme3w3WTAFwcWcUqmv93fD4V9LQ3KHvdFA
 xRjTa3phRQw6nF2qWjetUEbyFRiCEHkl05I3w9Q1DJYjvfrYQvhLzYEc1a4hf6qxgkWGBy
 5o+T13iAxIJIasVatWGx4QDAsEEfR4w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-_pUubdwIOHS1kSOyRO86zQ-1; Mon, 22 Mar 2021 09:45:11 -0400
X-MC-Unique: _pUubdwIOHS1kSOyRO86zQ-1
Received: by mail-wr1-f69.google.com with SMTP id h21so25834915wrc.19
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A7gi58PlUYSJbOuLVA2kjZ+xaD9o/zUCuOIiGJB3nCY=;
 b=SgQLK+t6QqhGa15iQqle+f05DPdh7YpvCxRRfOPeAtMdiNIWpOEDZ+Ql9AvMXRPLxv
 vSIYA7apznU+vJcxHYanrlHvszw5PftXDRGhSCta8LasH2mSH+6a/0+AnkiYa3PspiOX
 RLzCW15+er1819YB56iIf9nmPcrBh1xAIdN1xEP6uSh1csZ60ZMxrtLznX7REP2u8WoP
 n2/MXBchLgoIPfcHvjm/OUzkUj4FN1ibB+u/9SNHSevgB4LXyVedn00zUTh4dSsyLwr6
 fZKva8q2gBOmtUMLB6fC+hKesu5owFpQbyz4/K8W3tkZNvYzKwyZCDun/NnZt3RSwWp8
 LZcA==
X-Gm-Message-State: AOAM532LNkRhBQx2HIA+lMT8CoYc/qXWiVE+P73KCLRPmL58P5JwVQng
 FNwqZH2HmNoQBtjrFRWx2/irTjMZbC81GTt/+4GoAoGPiKWniM6rIq/df9IvU0vteLeDxQYRkNQ
 SiSDknoGtAIkY2xINOb8zYun4pdWpTmhYoAVE5nbq36VkoUyqPiw5IZq0IZH4SdBixy0=
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr18223451wrz.211.1616420709520; 
 Mon, 22 Mar 2021 06:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH82sQfSK/tbV8siCo2PHp0X5zUwL+JlGxeJ7M/7VhBqH7TZ5kewY5SZH7xGNf6BVewRtY9A==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr18223411wrz.211.1616420709141; 
 Mon, 22 Mar 2021 06:45:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c11sm20873036wrm.67.2021.03.22.06.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:45:08 -0700 (PDT)
Subject: Re: [RFC] accel: add cpu_reset
To: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210322132800.7470-1-cfontana@suse.de>
 <20210322132800.7470-2-cfontana@suse.de>
 <e972fe2e-3871-422c-f85d-baea7066c55b@redhat.com>
 <2019426d-3515-2a87-5b12-cd6d877b0553@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1c5870b0-4ffe-afec-b852-fa895592ecf0@redhat.com>
Date: Mon, 22 Mar 2021 14:45:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2019426d-3515-2a87-5b12-cd6d877b0553@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 14:35, Claudio Fontana wrote:
> On 3/22/21 2:31 PM, Paolo Bonzini wrote:
>> On 22/03/21 14:27, Claudio Fontana wrote:
>>> This surprisingly works without moving cpu_reset() to a specific_ss
>>> module, even though accel-common.c is specific_ss, hw/core/cpu.c is
>>> common_ss. How come the call to accel_reset_cpu works?
>>
>> I don't understand the question.  Why wouldn't it work? :)
>>
>> Paolo
>>
> 
> Heh probably something I forgot or do not understand around the specific_ss / common_ss distinction.
> 
> I was under the (wrong?) impression that we build some tools or components that include common_ss objects, but not specific_ss.
> 
> And maybe I am just wrong, and things are simpler than I expected.

No, all emulators include:

- some parts of common_ss, compiled once per build.  These are files 
that do not use target-specific definitions.  Other sourcesets also 
define once-per-build files, and in fact they end up in common_ss via 
the add_all method of sourcesets; softmmu_ss, for example is added to 
common_ss under the CONFIG_SOFTMMU condition.

- some parts of specific_ss, compiled once per target because these 
files use target-specific definitions.

- the entirety of the respective hw/ and target/ sourcesets.

It is possible to include calls from one sourceset to another (including 
from common to specific) as long as the conditions ensure that the 
symbol is defined.

Paolo


