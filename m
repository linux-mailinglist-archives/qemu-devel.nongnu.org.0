Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27618649A77
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:53:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4eXu-00016f-RV; Mon, 12 Dec 2022 03:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4eXq-00015R-Vo
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:52:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4eXp-0002yx-DH
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670835136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ry6aSjwwpqjUGAScw3y259OMw3ivgb+B2cfWv50Eyb4=;
 b=VxPByLAGuxSHC26C6DwALExZCfFk2LwfgvhvSUwLxqEDm0ClN0IOviLVV39Tq8PxUzi+bA
 VgDmD8hF4SSw6AXNJBwudov7SfkVOFVgC+KoIahHKBC59btCL5j51/llw9I1lAwb42nAMZ
 iEnfP/pgJirxtFjHoFVj3PnMJBOjtMU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-111-L2T9_dbNNNuPEyxyQ2njfw-1; Mon, 12 Dec 2022 03:52:14 -0500
X-MC-Unique: L2T9_dbNNNuPEyxyQ2njfw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r67-20020a1c4446000000b003d09b0fbf54so3865539wma.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ry6aSjwwpqjUGAScw3y259OMw3ivgb+B2cfWv50Eyb4=;
 b=tc0FEM/m5FDmZV8YmHcU/ylbRXhiG5aq2hfDePPg8wXD1KiZyxHuNPGJlptBpAAt50
 4h3ZSTFw64UclmpXtm+hTEW+6SAIwh2e2WTIRmhdNwDCQG/4N97ZYlFJtQ59EIoccQRp
 0SqFio1jGjBelZpQM9BChzDtrpkF97c0ZrGaw5Jgq2wM7ufobnun8HhKsBh5ar92YIyf
 SeFgIQxgJZoCv09hR50gTSJ0c72ONilfD3irG/yIQBsREZce9jj6RS8miqfFB1v9WeHS
 83sUHumJQ5ut8OTabpElqfMOTPoGuZzvwmDWLoidgr9Uw/yz6ERRNpGIWjsgFt1qgMTq
 sgfg==
X-Gm-Message-State: ANoB5pkyLrDx9wO3u13BZg/R113Q7RuFe8IlEBC4J52a+1NU2VNDdyA4
 yQxpOkINj9RceI3hmYfg+Jaf9Vrjt+nZPrlttqysD0tuc3A/ONkOwqJIt/qpcyzcJteyiUwW8Vk
 BuhhuED7DdaIH+Qw=
X-Received: by 2002:a5d:52cb:0:b0:236:f1a1:b45d with SMTP id
 r11-20020a5d52cb000000b00236f1a1b45dmr8861269wrv.54.1670835133164; 
 Mon, 12 Dec 2022 00:52:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7H7Sr/RVTpYOUrzTT2GVxVqBh+lRnYXfHCHhjBA+LjIxe2WpMpZ1IvCpAr7GnTGXAaKIXI9Q==
X-Received: by 2002:a5d:52cb:0:b0:236:f1a1:b45d with SMTP id
 r11-20020a5d52cb000000b00236f1a1b45dmr8861265wrv.54.1670835132848; 
 Mon, 12 Dec 2022 00:52:12 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 e11-20020a5d500b000000b00241fde8fe04sm8293228wrt.7.2022.12.12.00.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 00:52:12 -0800 (PST)
Message-ID: <5d021127-74a9-7357-5a49-4518855a8101@redhat.com>
Date: Mon, 12 Dec 2022 09:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 06/30] meson: tweak hardening options for Windows
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-7-pbonzini@redhat.com>
 <CAJ+F1CKL9RGT=L=B5E0T6XU1CYEooifThcyUDzJby++fWaBLkQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJ+F1CKL9RGT=L=B5E0T6XU1CYEooifThcyUDzJby++fWaBLkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 12/12/22 09:18, Marc-André Lureau wrote:
>> -  # Disable ASLR for debug builds to allow debugging with gdb
>> -  if get_option('optimization') == '0'
>> -    qemu_ldflags += cc.get_supported_link_arguments('-Wl,--dynamicbase')
>> -  endif
>> +  qemu_ldflags += cc.get_supported_link_arguments('-Wl,--dynamicbase', '-Wl,--high-entropy-va')
>
> What about the comment for disabling ASLR on debug builds?

The problem with that line is that it _enables_ ASLR for debug builds, 
and nobody has complained about gdb since last April...  And nobody has 
complained to Debian or other distros that have enabled the flag for 
years now.

I'll clarify the commit message.

> I wonder if we really have to add those flags ourself. Imho, we can
> leave them to the compiler default or distrib.. I bet most of the deps
> don't use those flags explicitly either.

I think so, at least Firefox does.  In general QEMU tries to do more 
build-time hardening than the average pacakge.

Paolo


