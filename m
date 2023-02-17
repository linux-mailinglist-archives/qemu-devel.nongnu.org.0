Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB43E69B17D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:58:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT42h-0002kQ-1F; Fri, 17 Feb 2023 11:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pT42e-0002hV-MO
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pT42c-0006CV-FI
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676653017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fxPt34nrZPuavKcm7iaVj1yB8nD5qAN79wOAGplqJ+U=;
 b=QYOK9DwJWdNc3/NG/tUpwnRAIT/nJ6gyQH6bFEubFsPVhH5NqYcEwXhCa/pXO5m0C6Ue8o
 iJRCPFk2zTyZOJwKSXpuoygfUvA/zRU8kBk0gxurBn/RpjqTfNNC4Hcs/aFk/xchFViYlS
 gWf6aCa++sOtNOFugwPqWZt9YemTxUw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-UIy1ogvdP72GsvX7jAJC_g-1; Fri, 17 Feb 2023 11:56:55 -0500
X-MC-Unique: UIy1ogvdP72GsvX7jAJC_g-1
Received: by mail-ed1-f72.google.com with SMTP id
 z20-20020a05640235d400b004a26cc7f6cbso2457989edc.4
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 08:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fxPt34nrZPuavKcm7iaVj1yB8nD5qAN79wOAGplqJ+U=;
 b=dlAwr5byJeXoDrLb4HmFvl8K4tfkWOVpb4mE/lbx2eConr1bg75GqtBO/Kww5O0a4s
 nqHWpeHffLCdy7oER7mOWrWtiYslwRDCZxkARY9ML6jbu1wCgSiUeQkQbXDGwVOR3OSw
 NNK7+Y2Vm01otWuA3Fv8xWx+x+Up7mfcYxJSxDafa1pFfH81T+2CUwdhHvaXSpysLO5o
 roMGkHxcKxQ5Ro4KCm4f64QPNDu0kCD3MfopiX8uoAytl8AtoXIG6xcisT5/quwG1pLd
 33Xr4fKhHm4cfvzLGspTYk+Mda8opiIde6qMdUn4S2Sq3h7QjoxRhPFwXWsI/n3yhk8C
 9gEw==
X-Gm-Message-State: AO0yUKXLkxh9F9IKGk1wQ4xhsO3RaR/4pccc2ml0+4XkAOwTXuVcToQG
 J4poaQ0ry2todwBsrJfuvE9cCUiEw+NbnE3joQQE1H2jwoErXWgumE9pY8iV9/iT+QBfU7I44Hg
 gaEe7S1STBx+u7zQ=
X-Received: by 2002:a17:907:2d0f:b0:879:d438:4d1c with SMTP id
 gs15-20020a1709072d0f00b00879d4384d1cmr482899ejc.21.1676653014717; 
 Fri, 17 Feb 2023 08:56:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8wr1SrS1L6I+vNIQrdU6DEeg2rU2MbgqdidJX1cMh2eZLmHk6xCYyJgA+NuoqLeF3rmgmmHA==
X-Received: by 2002:a17:907:2d0f:b0:879:d438:4d1c with SMTP id
 gs15-20020a1709072d0f00b00879d4384d1cmr482864ejc.21.1676653014390; 
 Fri, 17 Feb 2023 08:56:54 -0800 (PST)
Received: from sgarzare-redhat (host-87-11-6-224.retail.telecomitalia.it.
 [87.11.6.224]) by smtp.gmail.com with ESMTPSA id
 w7-20020a17090649c700b0073d796a1043sm2310060ejv.123.2023.02.17.08.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 08:56:53 -0800 (PST)
Date: Fri, 17 Feb 2023 17:56:50 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 "Florescu, Andreea" <fandree@amazon.com>,
 Damien <damien.lemoal@opensource.wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Hanna Reitz <hreitz@redhat.com>, Alberto Faria <afaria@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, gmaglione@redhat.com
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
Message-ID: <20230217165650.g6easy422igaa73e@sgarzare-redhat>
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <20230217162334.b33myqqfzz33634b@sgarzare-redhat>
 <CAJSP0QXDD5uyY5Neccf4WmGyuXwHuefwbToBdZDwegV2XHMnHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJSP0QXDD5uyY5Neccf4WmGyuXwHuefwbToBdZDwegV2XHMnHA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 17, 2023 at 11:53:03AM -0500, Stefan Hajnoczi wrote:
>On Fri, 17 Feb 2023 at 11:23, Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> Hi Stefan,
>>
>> On Fri, Jan 27, 2023 at 10:17:40AM -0500, Stefan Hajnoczi wrote:
>> >Dear QEMU, KVM, and rust-vmm communities,
>> >QEMU will apply for Google Summer of Code 2023
>> >(https://summerofcode.withgoogle.com/) and has been accepted into
>> >Outreachy May 2023 (https://www.outreachy.org/). You can now
>> >submit internship project ideas for QEMU, KVM, and rust-vmm!
>> >
>> >Please reply to this email by February 6th with your project ideas.
>>
>> sorry for being late, if there is still time I would like to propose the
>> following project.
>>
>> Please, let me know if I should add it to the wiki page.
>
>Hi Stefano,
>I have added it to the wiki page:
>https://wiki.qemu.org/Internships/ProjectIdeas/VsockSiblingCommunication

Great, thanks!

>
>I noticed that the project idea describes in words but never gives
>concrete details about what sibling VM communication is and how it
>should work. For someone who has never heard of AF_VSOCK or know how
>addressing works, I think it would help to have more detail: does the
>vhost-user-vsock program need new command-line arguments that define
>sibling VMs, does a { .svm_cid = 2, .svm_port = 1234 } address usually
>talk to a guest but the TO_HOST flag changes the meaning and you wish
>to exploit that, etc? I'm not suggesting making the description much
>longer, but instead tweaking it with more concrete details/keywords so
>someone can research the idea and understand what the tasks will be.

You are right, I will add more details/keywords to make it clearer.

Thanks,
Stefano


