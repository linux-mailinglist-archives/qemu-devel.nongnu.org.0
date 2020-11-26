Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434562C5712
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 15:26:36 +0100 (CET)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiIEF-00014M-AC
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 09:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiICt-0008C7-OV
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiICq-0006pw-Qx
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606400708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUKgqdeEP9MqYNYW6nylCEGp8ww7e6C+1m36djMHjBE=;
 b=JlDvplwLD1qlMRe5rxlUNeyBz0IKXbzrXE2bfdBNzQ40EIHwhgVCytZe04O7j7bTKoilKP
 0mvGbaysYgXTstj791DoKxgiBboodoYtwYof26YczEK3BlPYS+Li1dZGFcKnmQI7TR5M6O
 tZWu5qUqfHnfmuk0aQKNWi/biDFhIqo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-FpBc2D1aPM-5fUr7g3mXWQ-1; Thu, 26 Nov 2020 09:25:06 -0500
X-MC-Unique: FpBc2D1aPM-5fUr7g3mXWQ-1
Received: by mail-ed1-f70.google.com with SMTP id g8so1156390edm.7
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 06:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BUKgqdeEP9MqYNYW6nylCEGp8ww7e6C+1m36djMHjBE=;
 b=AWbTpO7yJejVcrfLM4XgTA6V1w7/22EtnE1K9eK+P+H+mldduKS7r78o7dwzoWu5e1
 t6uQNHfC4cH/FeqatSnKrRIHX5VkQgdd05h56zJTdhvYhCVB+qRvAsgg+ir3IcLkfB9p
 Q0fcy3rxVBpczA8TG1WieTnQ5JlhQfLVLNueaAv7EFjnm2AMoJXJL0+wZLLeNZwHjQBt
 4DA9dO/F1ykFrFfhXtpounglM75P8+6nDjmxafdyWSDGupt6cK7T/T3k7DsTGjo5eonM
 WKRavBw/ptQGHFOrdCzqbLILF1kKVUDCRBRHbwtFJQBnzxXu6i7XsNAv+Eb5RRb5n78J
 PQ0Q==
X-Gm-Message-State: AOAM531kK3g6hvdFPHciJjkPmbi/id0axNQ/kD/+ckbPrGk4sAC9rbj+
 OSf5Ws2+nfoML+Sy4o6RzymsYICVKiR7uKbG2lwE3GA/H9Rc3XHsOZl6StcK/CJ1M7aVQwao9cM
 Bo945EM7N3T/NGSg=
X-Received: by 2002:aa7:cd9a:: with SMTP id x26mr2716174edv.226.1606400704879; 
 Thu, 26 Nov 2020 06:25:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcd3Jpww5AvfhXmquKi+6YLj6Bej6rHpPy3F6RBaFGRc6WhrxKF366AEWI3XnU+a1C6Q0CWA==
X-Received: by 2002:aa7:cd9a:: with SMTP id x26mr2716158edv.226.1606400704646; 
 Thu, 26 Nov 2020 06:25:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j10sm3446794edj.97.2020.11.26.06.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 06:25:03 -0800 (PST)
Subject: Re: [PATCH v2 2/6] accel: accel_available() function
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-3-ehabkost@redhat.com>
 <12f82771-9db9-8fcd-ea25-736428d2650a@suse.de>
 <20201126133645.GG2271382@habkost.net>
 <8d90d611-6545-a478-1316-542dc5424b92@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f4f64154-9fbb-36fa-d9cb-e49c8ed06537@redhat.com>
Date: Thu, 26 Nov 2020 15:25:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8d90d611-6545-a478-1316-542dc5424b92@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/20 15:13, Claudio Fontana wrote:
> One option I see is simply to document the behavior where
> accel_available() is declared in accel.h (ie do not use in fast
> path), as well as in accel_find() actually, so that both accel_find()
> and accel_available() are avoided in fast path and avoid being called
> frequently at runtime.
> 
> Another option could be to remove the allocation completely, and use
> for example accel_find(ACCEL_CLASS_NAME("tcg")), or another option
> again would be to remove the allocation and use either a fixed buffer
> + snprintf, or alloca -like builtin code to use the stack, ...
> 
> Not a big deal, but with a general utility and short name like
> accel_available(name) it might be tempting to use this more in the
> future?

I think it's just that the usecase is not that common.  "Is this 
accelerator compiled in the binary" is not something you need after 
startup (or if querying the monitor).

Paolo


