Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C413338C59
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:05:09 +0100 (CET)
Received: from localhost ([::1]:41974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKgXU-0000o3-8Y
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:05:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKgUt-0007wA-LS
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:02:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKgUr-0003Os-7O
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615550543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W5fL5eauZGWBEG4POnH3pFWIClfxU3Zs0wrMQqyBMaY=;
 b=ENZVZLL+fuHP4K0CqyAe+Fnh4w5fQrlEArbx/6TtY1OIrnHsiE80D97T4LNMfgRWk0Ph8o
 M+U04GHbokqid02qylm6N0dd1SaTTk1NBh7iI/aCl9niflp4pehnOwXauTGjthR2KBdwGZ
 IyaTr7XqIW8uP73uv9N3S7h6/y+G2EI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-18NAu45MP3e_K9T74O1fyg-1; Fri, 12 Mar 2021 07:02:22 -0500
X-MC-Unique: 18NAu45MP3e_K9T74O1fyg-1
Received: by mail-wr1-f72.google.com with SMTP id h30so11083452wrh.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 04:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W5fL5eauZGWBEG4POnH3pFWIClfxU3Zs0wrMQqyBMaY=;
 b=rNSZlxwzLxdiLEywHQ4sxhdcSIR5opuHPplRMxcpNHRBEM4LiY6nPSvJPz55Oknbu+
 fIDrgomv1IPOZBw0MDzCTRtT4qJoVDQmQmwl05gyw821op7YkudaHAj8yXa+01KVXiL/
 +A/F+/CmMh6ec6egHyWLLYqcrMkKFt9qjPRyvuMwyM0JzKBR6+6IRPFF9Rkev0y6DUw9
 RiUUnAP0+9zhoCsfqRWl8LC2qaWK9swXyLWiPbUV6eua4JEI+88AbfB+sV8gAhi8spCu
 Pu+zuz4yX4S2d4IMphc85ZxA0tFHEZHAORdZ4nk/sAorqd7vjBqoF5P5ma78ukN9jk5i
 wJOQ==
X-Gm-Message-State: AOAM532MBMx/Yu4GGbHRfF/yMQWz2KlOC+uIB0FrqQVcfEeJJ1lIYBGL
 f172Qq9sImBCJ2JU+T9bOhZffjRfGvI+nhB3p+u2Out8eIlq+++59WKLhjFixCdlexpeNXG8Sgg
 iMHdu3v8okwYzYCYvyBNBbuayCTTlSqLeZEHp5S933M6KZe/ZUS4qSzmWoKsWieDo7i8=
X-Received: by 2002:adf:fb49:: with SMTP id c9mr13926214wrs.72.1615550540631; 
 Fri, 12 Mar 2021 04:02:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/7+1+aq6RJyXGzcHx8fovO8td611jwCpSQnlIGlZ75EKx+3CQhx2BE+LYnvFQ/lfx5Nr1QQ==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr13926189wrs.72.1615550540377; 
 Fri, 12 Mar 2021 04:02:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id c16sm9053934wrs.81.2021.03.12.04.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 04:02:19 -0800 (PST)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
 <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
 <be88d88a-dd9d-547d-9f3d-7444f0f8bbc6@redhat.com>
 <3b7c6a4e-c191-063c-affa-0e179227a633@suse.de>
 <26c2b88b-4c9e-09a0-a1c0-350a01e9a697@redhat.com>
 <d66078f1-9fa0-c3ed-d54c-3d3ada2027e5@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <683d1ccc-503d-3218-2539-a3ed48fee5fb@redhat.com>
Date: Fri, 12 Mar 2021 13:02:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d66078f1-9fa0-c3ed-d54c-3d3ada2027e5@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 12:51, Claudio Fontana wrote:
> seems to me we already have, as the accel class init, fe, for x86/tcg:
> 
> static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
> {
>      AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> 
> #ifndef CONFIG_USER_ONLY
>      acc->cpu_realizefn = tcg_cpu_realizefn;
> #endif /* CONFIG_USER_ONLY */
> 
>      acc->cpu_class_init = tcg_cpu_class_init;
>      acc->cpu_instance_init = tcg_cpu_instance_init;
> }
> 
> acc->cpu_class_init() call would then be the acc->init_cpu call you mention.
> 
> The only thing we seem to be missing is the cc->init_tcg_ops(cc)..

Yes, called by tcg_cpu_class_init or tcg_cpu_instance_init.

Paolo


