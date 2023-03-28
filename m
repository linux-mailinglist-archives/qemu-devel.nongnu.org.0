Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0546CB7E1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 09:21:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph3cz-0003vv-Cy; Tue, 28 Mar 2023 03:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ph3cu-0003vb-Uw
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 03:20:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ph3cs-0004u3-RZ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 03:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679988013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSpCRyfdwdMKGA75ZoaRNiWJsGVh33ES/DNX8ajjdCA=;
 b=QE/EFj9ZDgRLfcEcrGGAiwQLfemVXnSOAInnqUqH9CrVf36uyBPBLY9r+fPORQE0SaWgjx
 lO/tYOEfQIL+TfPJ9Spz8ZDgK3q9XjVpSkg3XJIDJAafxbiivRo/ZHYHX5rEFUBwfsmXph
 moHZX6dtiIw+VgDAFfFPq66RFT787u8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-I6vzBQNVORKrShHadngBmw-1; Tue, 28 Mar 2023 03:20:11 -0400
X-MC-Unique: I6vzBQNVORKrShHadngBmw-1
Received: by mail-qk1-f197.google.com with SMTP id
 206-20020a370cd7000000b007467b5765d2so5259211qkm.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 00:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679988011;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NSpCRyfdwdMKGA75ZoaRNiWJsGVh33ES/DNX8ajjdCA=;
 b=pCldH+fOJbbiRnoC7DZR8e36N7Ij4OTLtsEtYg4hm8m07p2vcanPbuXqbx3pk+ddQL
 2P/bEy6tEtFzShEu87Q/m2Req+lNEOlKQOPCZDL6OC/wNgJ235Du0bcrKBUm5SOirrYI
 2Qq//X4R/QyLcO0JdH07ei6lXuPMnsx6YBca/+X7Aaromep+i2jQz+S1FP48nn5CDb/p
 cKVs2L78ShGCqPjmLlD9HCygP/cwNX7wJXOis8ffEr8bEsV1D8p/6u940Ln+dBUekH7p
 B0yqrAoCw4QKrd0E3oQtgoPERQNy4PbqF7UfY252/BNy4kgZZ8whWTD7U4DldK5CfS5p
 56mA==
X-Gm-Message-State: AO0yUKWpijuPd+tPtVlX6AY6ghnrLuNzQ3BPljdLgcasV7QJzDFM8MCc
 phvTnK0b3ZQnPZC3DABiZDlYX/tr0z2QKr/270Tgx+AX5BSFWv75MTunteU3Jm24cST4CL6/z6M
 f5i4u0FBNX5u1AWo=
X-Received: by 2002:a05:622a:215:b0:3e3:5f85:631b with SMTP id
 b21-20020a05622a021500b003e35f85631bmr23623907qtx.66.1679988011140; 
 Tue, 28 Mar 2023 00:20:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set888J3Yke8lTIwi1BfhFg5XXX9s/DFi527AkJSYYzRip4Tv98xHapLQrssVcvaz6965nuN5eA==
X-Received: by 2002:a05:622a:215:b0:3e3:5f85:631b with SMTP id
 b21-20020a05622a021500b003e35f85631bmr23623891qtx.66.1679988010857; 
 Tue, 28 Mar 2023 00:20:10 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-113.web.vodafone.de.
 [109.43.179.113]) by smtp.gmail.com with ESMTPSA id
 q21-20020ac87355000000b003e387a2fbdfsm7345518qtp.0.2023.03.28.00.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 00:20:10 -0700 (PDT)
Message-ID: <98a65e35-9c56-df86-66ed-f949c1fb9c96@redhat.com>
Date: Tue, 28 Mar 2023 09:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>,
 qemu-devel <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>,
 "Borntraeger, Christian" <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, fiuczy@linux.ibm.com,
 Halil Pasic <pasic@linux.ibm.com>, nsg@linux.ibm.com,
 "P. Berrange, Daniel" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230327133525.50318-1-imbrenda@linux.ibm.com>
 <20230327133525.50318-2-imbrenda@linux.ibm.com>
 <CABgObfYK_cVCS5x-JYY78KTdrhTnPU+fiK5QRnRTrd+EWMn3bw@mail.gmail.com>
 <87cz4t5tuo.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v5 1/1] util/async-teardown: wire up
 query-command-line-options
In-Reply-To: <87cz4t5tuo.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 28/03/2023 07.26, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> I am honestly not a fan of adding a more complex option,.just because
>> query-command-line-options only returns the square holes whereas here we
>> got a round one.
>>
>> Can we imagine another functionality that would be added to -teardown? If
>> not, it's not a good design. If it works, I would add a completely dummy
>> (no suboptions) group "async-teardown" and not modify the parsing at all.
> 
> Does v2 implement your suggestion?
> Message-Id: <20230320131648.61728-1-imbrenda@linux.ibm.com>
> 
> I dislike it, because it makes query-command-line-options claim
> -async-teardown has an option argument with unknown keys, which is
> plainly wrong, and must be treated as a special case.  Worse, a new kind
> of special case.

I agree with Markus, it sounds like a bad idea to create a new special case 
for this.

Paolo, what do you think of my "-run-with" suggestion here:

 
https://lore.kernel.org/qemu-devel/3237c289-b8c2-6ea2-8bfb-7eeed637efc7@redhat.com/

I still think that this is a good idea, even if it is a "grab-bag" as Markus 
said, it would give us a place where we could wire future similar options, 
too, without running into this problem here again and again.

> Can we have a QMP command, so libvirt can use query-qmp-schema?

Question is whether this could be toggled during runtime...? Or did you mean 
a command that just queries the setting of the option, e.g. 
"query-async-teardown" which then reports whether it is enabled or not?

> In case QMP becomes functional too late for the command to actually
> work: make it always fail for now.  It can still serve as a witness for
> -async-teardown.  If we rework QEMU startup so that QMP can do
> everything the CLI can do, we'll make the QMP command work.

Adding non-working functions sounds ugly... Anyway, we're slowly running out 
of time for QEMU 8.0 ... if we can't find an easy solution, I think we 
should rather postpone this to the next cycle instead of rushing unfinished 
stuff now.

  Thomas


