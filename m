Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71A4B4F46
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:49:47 +0100 (CET)
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZrW-0002Pm-Sw
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:49:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nJZqU-0001AV-75
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:48:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nJZqQ-0003m7-EW
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644839317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DAU1V9PjadYHsz+MS0nCr09B0ouxSodDBOpNbCwLlT4=;
 b=VJyN7S/M8ArXHth3HZ0NIV4wAeWhyVDouE0DcKeEn5P3IfS3VMd12Rq0TI15J7FJZy2NJW
 FXAf83QJmItrkh/2ioNFcyJGwjeYDZ6ViH4ktGXSCKetUIYGp0wCcnjY2JZqhW0EgcVrE4
 ojv15kpD4ujPO4t8/QVX1YsuNS8nLCo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-Aqz_bKEFNCSVIA9qtD6JQg-1; Mon, 14 Feb 2022 06:48:34 -0500
X-MC-Unique: Aqz_bKEFNCSVIA9qtD6JQg-1
Received: by mail-qv1-f69.google.com with SMTP id
 m20-20020a05621402b400b0042bffb6a731so11368355qvv.11
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 03:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DAU1V9PjadYHsz+MS0nCr09B0ouxSodDBOpNbCwLlT4=;
 b=DK//3gBdUuVizfQehKMedQyZ2tc2pKvHD+rwTgs7/TgozZ0CI+57KwyjysfwJ8j1hB
 CtMD6d+yTMjxMi9+k+hwg0H7nEwQaaw7JfRmaBpYB7oqCgINGSu3CYSpy51nmIxPUbPs
 sWptySHn4B2EJfouZ8rQtkodC3yeFsIsopuPeptxTUf9NuiXrSzuW4L67qp1K8mBNeZp
 CvQd4l3ttL6vYmo8iHR8p8XpHmOLzZ81qHZcWmFGRZ4zYGWAG/f0CuOmX13YZXB+OSel
 0DUE98nct8PnXIArg1rluu8YgRf3nCg+If/GKu+VlJOnJVHGR8S+DQsh5f1Kvd67C5p0
 dppw==
X-Gm-Message-State: AOAM532tXzHUc7S6Ka3y5sxubUU+jHYs0iij/ISU2ASwSXW5ey0KMEEo
 RBNTTFKWMzqDoQUgjBr4X5e/dveXSfZBZYkX2gBID6HYq0XcxpMQKOedGHd23FJl4JC98dh9ROu
 r0dcnH6eV31TY1Wc=
X-Received: by 2002:a05:620a:10aa:: with SMTP id
 h10mr6732813qkk.36.1644839313727; 
 Mon, 14 Feb 2022 03:48:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzG+/SNlmMcw5kQF0ct454DFF7SsZ8w10fg2ajvXlYZDkX6Dyiz5Z4BHkpeaNBNol3by4XN2g==
X-Received: by 2002:a05:620a:10aa:: with SMTP id
 h10mr6732806qkk.36.1644839313519; 
 Mon, 14 Feb 2022 03:48:33 -0800 (PST)
Received: from step1g3 (host-95-248-229-156.retail.telecomitalia.it.
 [95.248.229.156])
 by smtp.gmail.com with ESMTPSA id x21sm3224474qtp.67.2022.02.14.03.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 03:48:32 -0800 (PST)
Date: Mon, 14 Feb 2022 12:48:25 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Message-ID: <20220214114825.pi44m7mqyqvvtt52@step1g3>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sergio Lopez <slp@redhat.com>, kvm <kvm@vger.kernel.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Florescu, Andreea" <fandree@amazon.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alex Agache <aagch@amazon.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 03:11:20PM +0800, Jason Wang wrote:
>On Fri, Jan 28, 2022 at 11:47 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> Dear QEMU, KVM, and rust-vmm communities,
>> QEMU will apply for Google Summer of Code 2022
>> (https://summerofcode.withgoogle.com/) and has been accepted into
>> Outreachy May-August 2022 (https://www.outreachy.org/). You can now
>> submit internship project ideas for QEMU, KVM, and rust-vmm!
>>
>> If you have experience contributing to QEMU, KVM, or rust-vmm you can
>> be a mentor. It's a great way to give back and you get to work with
>> people who are just starting out in open source.
>>
>> Please reply to this email by February 21st with your project ideas.
>>
>> Good project ideas are suitable for remote work by a competent
>> programmer who is not yet familiar with the codebase. In
>> addition, they are:
>> - Well-defined - the scope is clear
>> - Self-contained - there are few dependencies
>> - Uncontroversial - they are acceptable to the community
>> - Incremental - they produce deliverables along the way
>>
>> Feel free to post ideas even if you are unable to mentor the project.
>> It doesn't hurt to share the idea!
>
>Implementing the VIRTIO_F_IN_ORDER feature for both Qemu and kernel
>(vhost/virtio drivers) would be an interesting idea.
>
>It satisfies all the points above since it's supported by virtio spec.

Yep, I agree!

>
>(Unfortunately, I won't have time in the mentoring)

I can offer my time to mentor this idea.

Thanks,
Stefano


