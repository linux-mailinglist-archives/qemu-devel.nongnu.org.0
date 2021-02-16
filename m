Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A197B31C959
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:06:13 +0100 (CET)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByBI-0007xZ-OL
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBy45-0002HW-33
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:58:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBy43-0002iY-JC
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613473122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3Q7l0H7cw5LUEg/+nZbx/THOEbc9cuwDLI6Fipo5iM=;
 b=K6OAm7xXTB9lV3I2/XUyMtfkxcZ/RWTVMqvMd/aIdz3BT17/Ua6uIICEHDxtt61mn1Vx4K
 7MlvbpvUVMulpWagqtuNZAyW4OgjvUb2oJoc6pMTMRYD6jUdHrHShxCg2LAnTYqSjLIn6K
 DiRgSIs1cCXftqozfAGBHZf+ZE5FzIA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-0DEslenwMi2aK24To79AmQ-1; Tue, 16 Feb 2021 05:58:41 -0500
X-MC-Unique: 0DEslenwMi2aK24To79AmQ-1
Received: by mail-ed1-f70.google.com with SMTP id d3so3685818edk.22
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 02:58:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y3Q7l0H7cw5LUEg/+nZbx/THOEbc9cuwDLI6Fipo5iM=;
 b=ZJ3iplAVdHyiISmIfIFqDVdG1GZIkvjycG0ufZtB1FYMWTeheQoCWequoM8ZpHmWJI
 VHg/FaKo8Ld0wgtPCVTtFpc2o0hWgLv9CQ6QyCCPD+mbXEaj5xlEoU1gN/JchNSJ3EN7
 t9T8S+4vHvxI4nAcBvDyVMJE7mer/VG0dwM83kdA3qjQYQf451h78ZQvtAiNSNwdsn9H
 wol77N6lXUnhHJiE1kImDyGoFpFqotxjPAOZdeIQCHZ2EER+HQnUlaHGqpV+QDrbTmbd
 sSwPyRnw2sC08Ke+h7a6lavOpu6ba2PdVYBZWzCNMRraDSjwEBtpvlTholD+FvrZ9CPJ
 L/PQ==
X-Gm-Message-State: AOAM533FRbP++g1SPvwAZMen+AQnaqCo2MpH+db1bNyrhBvmQfNvdX5h
 CAr22CCZKggwQd0U3e4LbXenPVwHZ8AdFdN8o64xZvmT9Hygrw+l8epV9mp64bKXP2SaqqTIl3r
 CQ30Q/ucr6jZqMx6HU/T0JVxt2g0IoPWAWBBjwxodg0rNzzG5HFSrY4Fe9g9bkajOEfw=
X-Received: by 2002:aa7:db01:: with SMTP id t1mr5854088eds.229.1613473120152; 
 Tue, 16 Feb 2021 02:58:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqDac7FuQxV9U0tCuh3m5IE9VvwcWgXQWtWU03TaVru220drMoK/LJYu3BlzRMbZSU5IhO+w==
X-Received: by 2002:aa7:db01:: with SMTP id t1mr5854080eds.229.1613473119993; 
 Tue, 16 Feb 2021 02:58:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x17sm11418995edq.42.2021.02.16.02.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 02:58:39 -0800 (PST)
Subject: Re: [RFC v19 13/15] i386: slit svm_helper into softmmu and stub-only
 user
To: Claudio Fontana <cfontana@suse.de>
References: <20210216104647.13400-1-cfontana@suse.de>
 <20210216104647.13400-14-cfontana@suse.de>
 <23e42c1d-0757-e5a8-3021-dce536276cf4@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fa2bd6a8-041c-0043-4b3a-dac69a0c0c3d@redhat.com>
Date: Tue, 16 Feb 2021 11:58:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <23e42c1d-0757-e5a8-3021-dce536276cf4@suse.de>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Alex Bennee <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/21 11:52, Claudio Fontana wrote:
> I noticed also a call to cpu_load_efer() in gdbstub.c,
> 
>          case IDX_CTL_EFER_REG:
>              if (env->hflags & HF_CS64_MASK) {
>                  cpu_load_efer(env, ldq_p(mem_buf));
>                  return 8;
>              }
>              cpu_load_efer(env, ldl_p(mem_buf));
>              return 4;
> 
>          }
> 
> Should this somehow restricted for user-mode, as it has the potential to set HF_SVME ?
> 

Yeah, it should.  Likewise for CR0/CR2/CR3/TPR.  Nice catch!

Paolo


