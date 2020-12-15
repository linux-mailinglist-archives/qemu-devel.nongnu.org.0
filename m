Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E006B2DAC6F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:57:58 +0100 (CET)
Received: from localhost ([::1]:54364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8xq-0001T3-0V
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kp8tY-0005Cz-E9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kp8tN-0002g0-T2
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608033199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+46GJ4hQItpM5SL6yEFtJVZYSDGI0b1Ld6rqvXu/te8=;
 b=CrKwOHBcg+jMhtpp9FITAI9c91QJoEiiyzenDWQ1MLGnxsq5T3ZjfBFSuc2T4TAu+RuE28
 647Y3XWhYi7O5I+/FGwNxdRPj75dHZMVz0B47rwSB5vIBJSJgq+WdagvfShiYxh5eWOXoX
 9TNEvytVXOLDNfiPVP6TpQz2ZXZe9n8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-Wp8NE02CPPuR69j_IN8KDQ-1; Tue, 15 Dec 2020 06:53:17 -0500
X-MC-Unique: Wp8NE02CPPuR69j_IN8KDQ-1
Received: by mail-ed1-f70.google.com with SMTP id r16so9855871eds.13
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+46GJ4hQItpM5SL6yEFtJVZYSDGI0b1Ld6rqvXu/te8=;
 b=jD3kNhSPgrCngIRcriDATgV/A0yHVSKyn4bGApVnFVPXXu7qRGZmJR7cjlbl8A/i8p
 PGZbcNvnnmjXgnH0n8YGLintSQuF40Wh3VAnmfHfO3xDGRvhG1cGMcR0uYTFQDqigEyB
 vfaBJYCWu/pxTibLdLhuJmIcAO7gBcRuk0/NOSBVsyHbmzLOrfPlc8pp35RRaSNDKjeO
 B7Uj/90V8ry5gMCpxIWb4HAgOyzXcjV3aocJAnpjqNNsmJi/UWkvKQweuGVZdgurIdZo
 mR8mxV7A/SF1RK+aJB2ALSlzsPX9NJaILCVoHgv2YpOWIS6KCNQlC7KbUa6xDjo1K9fd
 x3rQ==
X-Gm-Message-State: AOAM5321Af8H63uB5VX1K62k3J/2PIIcUGbjMURwSy+N/CpQPMnlu7Of
 2Awz8VRBKaicmZiVMi0CTAlL3bHSn1xadwtqYYzzOTyp6s9KNrSaSC1Ou/fFT7M+zb0W89Q19K5
 mtChXo6iJ3b2V87M=
X-Received: by 2002:a17:907:1009:: with SMTP id
 ox9mr5112369ejb.37.1608033196403; 
 Tue, 15 Dec 2020 03:53:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFVSgMeMP+zV9l+Kdi8rsr8Tkz1ZnvRUElRzNA/9osAQURv7d8ltsmqJWtxZi+k6L4xC899g==
X-Received: by 2002:a17:907:1009:: with SMTP id
 ox9mr5112351ejb.37.1608033196115; 
 Tue, 15 Dec 2020 03:53:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lc18sm1207444ejb.77.2020.12.15.03.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 03:53:15 -0800 (PST)
Subject: Re: [PATCH 1/3] util/qemu-timer: Make timer_free() imply timer_del()
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20201214203050.6993-1-peter.maydell@linaro.org>
 <20201214203050.6993-2-peter.maydell@linaro.org>
 <CAFEAcA-U_S62AwsLjwOTOpJm+dxJ-k6CB2HN7nMa+npRcHMzLA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cc8ff905-0830-2ba1-1ec0-3f336625e269@redhat.com>
Date: Tue, 15 Dec 2020 12:53:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-U_S62AwsLjwOTOpJm+dxJ-k6CB2HN7nMa+npRcHMzLA@mail.gmail.com>
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
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/20 12:44, Peter Maydell wrote:
> 
>> +static inline void timer_free(QEMUTimer *ts)
>> +{
>> +
>> +    if (ts->expire_time != -1) {
>> +        timer_del(ts);
>> +    }
>> +    g_free(ts);
>> +}
> I was thinking about this again this morning, and I'm not sure
> this is thread-safe.

It may not be thread-safe in principle, but any code that calls 
timer_mod, and isn't itself protected by a lock against timer_free, will 
be racing against the g_free immediately after.  That is, that code 
could run after g_free and have a use-after-free bug.

But yes, I agree it is also an unnecessary optimization.  It's better 
done in timer_del_locked, and removed from timer_mod_anticipate_ns. 
Since you are at it, you may also want to push the call to 
timer_del_locked down from timer_mod_ns and timer_mod_anticipate_ns to 
their callee, timer_mod_ns_locked.

Thanks,

Paolo


