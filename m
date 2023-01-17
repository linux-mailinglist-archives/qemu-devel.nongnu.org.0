Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B766DBA9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHje6-0007on-Ge; Tue, 17 Jan 2023 05:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHje1-0007kQ-H5
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:56:46 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHjdz-0005a2-U7
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:56:45 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h16so30137781wrz.12
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 02:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4S8k9vz6bwa9Ue4Mxf8rpnGT9zOzK7P1xr/qaZxCpj4=;
 b=jLdapiCf+crLfIvCHFXN1ek/9cZE0FlG0en/oFEtCMKOvHGQJMCdgll/fKCGZF98JK
 a5oczgyv6gJutYKDKzkBzRqN6KKBUfm0hhRV+ZIyOEdmHQGRumK3JN19U2He+G0EH4JL
 PtC/US/ArzUc9eTrM5lo0EwQeaQcRGFe/6TU9ptBRqR8tQ+OX/uolF/Z75dmCtmsTvfr
 0baH7hyhc4eG2FrF16uU6YAnmlSbg+kR2zmhpLCMTG3qMRelGkKZxRrHRiOclwUn136U
 vlLJLfRAzXJaw5ZuBBEtFGLhJ/r8IUE6RR0WXgajvQBAprzrLJL+sLpsryOEES5NqH4w
 021A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4S8k9vz6bwa9Ue4Mxf8rpnGT9zOzK7P1xr/qaZxCpj4=;
 b=lVc7fL53YuYYMP+JEFFMi2o5baAALuYnqT31f81qpJm88LTbT2XQjEFPvu0rM/80kq
 Iur7bZMqIB0+RH8nZ308qOrEJd1rHSJxVtRZXSNMML4SRb+RWMNi1fL20MsgXHf6jUda
 aBH+nMuusNjubmEGgGi5MziE1CzK5di58WEil+VAXog/DbzzGmabCjLkES1ct+3faYY9
 mHn6Qm/sj7ynHFWJQXVybUycMFBQDvUAs43Wp2OBMNZ8zSJHE5OvKogt1JZNc44F2uaO
 mMgHaGDiXv3ncehOO6QknqXOKXbz+CBhwNvQoRF0KjuUcZnmU3YGOCZSqVo4yPEv2Rgt
 kC6A==
X-Gm-Message-State: AFqh2kpYrKQjG5PKMYd0DerEP3f/C36bkRL8VtU6i0q6wJkAxEfCthBF
 YFzLGVuLt1/uvv1/jN9HX2U=
X-Google-Smtp-Source: AMrXdXvSTWFf2NIsddWxEEWTqWf2CgJ3YR/bUEiE86O9HH/nHaHFkEW4javuxfN9Mx6eXusxlFX4ug==
X-Received: by 2002:a5d:4d8d:0:b0:2bd:da99:bb8e with SMTP id
 b13-20020a5d4d8d000000b002bdda99bb8emr2625413wru.52.1673953002313; 
 Tue, 17 Jan 2023 02:56:42 -0800 (PST)
Received: from [192.168.8.108] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 t13-20020adfe10d000000b002b6bcc0b64dsm16139233wrz.4.2023.01.17.02.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 02:56:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <726f2f63-dc74-619e-4cb0-205f9a542b99@xen.org>
Date: Tue, 17 Jan 2023 10:56:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 26/51] hw/xen: Add xen_evtchn device for event channel
 emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-27-dwmw2@infradead.org>
 <ea0a98e2-14e4-620a-60ee-86cfbe76403e@xen.org>
 <8ab2cfafa5636d7f084e8a75d273d7bf7b6b7579.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <8ab2cfafa5636d7f084e8a75d273d7bf7b6b7579.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/01/2023 10:23, David Woodhouse wrote:
> On Tue, 2023-01-17 at 10:00 +0000, Paul Durrant wrote:
>>
>>> @@ -712,6 +717,11 @@ static int kvm_xen_soft_reset(void)
>>>         CPUState *cpu;
>>>         int err;
>>>     
>>> +    err = xen_evtchn_set_callback_param(0);
>>
>> Doesn't this always result in -ENOSYS?
> 
> Hm?
> 
> Even at this point in the series, HVM_PARAM_CALLBACK_TYPE_VECTOR works
> and doesn't result in -ENOSYS.
> 
> But even if xen_evtchn_set_callback_param() *was* a stub that just
> returned -ENOSYS at this point, that would be OK, surely? We add the
> (other) HVM_PARAM_CALLBACK_TYPE_* support later, which warrants
> separate review because of the GSI and iothread lock fun.

I'm just having a hard time seeing why passing 0 to 
xen_evtchn_set_callback_param() does anything useful...

+    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
+    case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
+        struct kvm_xen_hvm_attr xa = {
+            .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
+            .u.vector = (uint8_t)param,
+        };

HVM_PARAM_CALLBACK_TYPE_VECTOR is 2 AFAICT, so it won't hit that case. 
Also, you appear to be passing the unshifted param to kernel anyway.

What is the call trying to achieve?

   Paul


