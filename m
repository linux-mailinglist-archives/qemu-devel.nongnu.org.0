Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779AB338832
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:04:26 +0100 (CET)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdia-0001rQ-Js
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdgD-0000Wi-UW
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:01:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdg5-0000Do-Iu
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yT7FXFPxlNRo9HvdMKrYimjLQLYhxNZxqYUtJo1fKbM=;
 b=h/f7/8t1gAniO3wcs0lf2RPKpccZGBguAfWOS4Jdti3abXURVsnyd6QER11/2Wu+CnZy+n
 b+FWSPG8qVupix46cfqf5jz7TOaOt4MmoXU+noC/nCmK2komG0rrIOh8UBwsg/j2HTfcxP
 SXD0yYHSrHUPDqoACd+SSXzSrchSIYc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-q9CCblZXOiCUTBVPh3gbmA-1; Fri, 12 Mar 2021 04:01:47 -0500
X-MC-Unique: q9CCblZXOiCUTBVPh3gbmA-1
Received: by mail-wm1-f69.google.com with SMTP id l16so2941680wmc.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yT7FXFPxlNRo9HvdMKrYimjLQLYhxNZxqYUtJo1fKbM=;
 b=AmGWLR+C+meDp9iAU8Hgao6ylOPH7VcvEz3HyfTqbu7g9GbX/VT1dMv123HYu+T2kX
 9HPjDhdwC7EXjwRaarUMwL98iGiPdyK0+Aj13TGW0JbvvSN6NKnBj++0ggeWFHoqNxE0
 3a3/AnrgnkJPC7vZjgs3dRDBII9cQywwRJL2vi6NnFERMUT2Qrrbk4oH4Wx386OT4wDF
 7mVp9FMGn6H3cqzJ/cQgiR5VGLEBFnpnPlXXKQSovbpmwHb1CsYInKY+1WGWjwT6iFFy
 b/jYtY0r1g41r8TeQFd+hTsPR0afMO/AkIKjrefvM2aTyGBBQlLY3RnDMjSKBnYfZdwg
 FdJw==
X-Gm-Message-State: AOAM532ZvPQkBtL2CwZboL+NfEYbhTNjIzsOqkkiYHpTPxI/xwTn51cu
 rk+P8LgpurcPTynbxmNDCwFDxHrbUdwa8W3qsw090NNnRpJJDE0JM/GyGgPVcdKsYXLA3koxMwF
 PNLhMW5CEUXTAyNA=
X-Received: by 2002:a5d:6411:: with SMTP id z17mr12569248wru.119.1615539706158; 
 Fri, 12 Mar 2021 01:01:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcKcNbKMTbyvXa4AO3NlqewY1Abai4hAVwCipx49UOEfOZ8TU9cA+w0EE0rphlgeHPmPg8CA==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr12569209wru.119.1615539705851; 
 Fri, 12 Mar 2021 01:01:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id a75sm1451735wme.10.2021.03.12.01.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:01:45 -0800 (PST)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: Andrew Jones <drjones@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
 <651baead-dcc3-c0ef-f5dd-cda36c8d6599@redhat.com>
 <20210312084816.pnenjcbdjzwu3z54@kamzik.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c36e5524-7eaf-16a7-5362-f992fe3a8383@redhat.com>
Date: Fri, 12 Mar 2021 10:01:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210312084816.pnenjcbdjzwu3z54@kamzik.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 09:48, Andrew Jones wrote:
>> I think we definitely need the additional data section here: For KVM on
>> POWER, it would be good to know whether it's KVM-HV or KVM-PR, for KVM on
>> MIPS it would be good to know whether it's KVM_VM_MIPS_VZ or KVM_VM_MIPS_TE,
>> for KVM on x86 whether it's the AMD flavor or Intel, ...
>
> Could also pre-expand all of these and list them individually.

That seems worse (in general) because in a lot of cases you don't care; 
the basic query-accels output should match the argument to "-accel".

Paolo


