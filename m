Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D24BA3C1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:55:59 +0100 (CET)
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKiCM-0006iA-6K
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:55:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nKhWX-0002Uf-Dx
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nKhWT-0006oc-7X
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645107160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/cZXGNior+ZsJ3e+PrQnLgahobz9IXWhoV+xYGtogyM=;
 b=UpiLx37kzrG2v3G4CKpm0V1dscQXSPqNzrs3h/qVxbV7s42epEZRcrCjgY2Qecc00wR+sk
 8c7bHCTcGzQv5+bJAn7QOzZHJVauARuuzzweVQFw+2hrN3gTde0wIJEL4u1PDQxKukq1jy
 5GCOtXrhbBmSqjkvtHGHbBsuLAUFQrs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-kWfTpNSyOPaKeC909txYSg-1; Thu, 17 Feb 2022 09:12:36 -0500
X-MC-Unique: kWfTpNSyOPaKeC909txYSg-1
Received: by mail-qv1-f71.google.com with SMTP id
 m20-20020a05621402b400b0042bffb6a731so5382389qvv.11
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 06:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/cZXGNior+ZsJ3e+PrQnLgahobz9IXWhoV+xYGtogyM=;
 b=7KFZWFEYRN766oXJQIR0y1ssIhH6YYRdl8ZTWH5iEnsMndPi19wtyTy+vpm4xwABgg
 rBsymrEKK3biRIpwqeNcpHhG0mOVHsWcGKtL8NFaRAIS8QI0XIMaWzoxnNUo8RhCc1Qd
 ylLsFTaC1eLwTHBdO4luvdjJrvWcitJrix9tm46OhH/K9NMSs+n4SsrDrHNVj1/l8e+S
 Z4Sk+jMHGE8xClFHKIXRRjTBDToLQAomGFDx9+GwB4IicZCT3chaak2Ua819b6n5lSDQ
 jIGtsTMNMubW+EcVTGjxCi7ExsMnMEqVwvk3bpWjRhQp3KDgmQzO4r7pULCTjilFmE1D
 Z+zQ==
X-Gm-Message-State: AOAM530n8GB04/KT0NgA/NVYcJ7nRZ4zirffPdis2QfYHuIAwwHYYLaX
 OkgyGww/CDvctFXW7PQVPijZc3pbFvRkjQnggRnOMMtiq1kOxOGXmiYhyVIcDTMjxPzQl2oDufX
 kgwkQuZeM6OoVf94=
X-Received: by 2002:ae9:f80f:0:b0:60d:dca9:d021 with SMTP id
 x15-20020ae9f80f000000b0060ddca9d021mr1278470qkh.53.1645107155360; 
 Thu, 17 Feb 2022 06:12:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ28xbd3gosVH54yFSb3YNcBcISrsFM0+HMmhcisfzw8nknVsLJomqhc3vG1UlAdRabcvprw==
X-Received: by 2002:ae9:f80f:0:b0:60d:dca9:d021 with SMTP id
 x15-20020ae9f80f000000b0060ddca9d021mr1278449qkh.53.1645107155086; 
 Thu, 17 Feb 2022 06:12:35 -0800 (PST)
Received: from sgarzare-redhat (host-95-248-229-156.retail.telecomitalia.it.
 [95.248.229.156])
 by smtp.gmail.com with ESMTPSA id h21sm1706611qtm.23.2022.02.17.06.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 06:12:34 -0800 (PST)
Date: Thu, 17 Feb 2022 15:12:27 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Message-ID: <20220217141227.sk7hfng7raq6xvuh@sgarzare-redhat>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
 <CAJSP0QX6JgCG7UdqaY=G8rc64ZqE912UzM7pQkSMBfzGywHaHg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QX6JgCG7UdqaY=G8rc64ZqE912UzM7pQkSMBfzGywHaHg@mail.gmail.com>
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
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, John Snow <jsnow@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Florescu,
 Andreea" <fandree@amazon.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alex Agache <aagch@amazon.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 02:01:52PM +0000, Stefan Hajnoczi wrote:
>On Mon, 14 Feb 2022 at 07:11, Jason Wang <jasowang@redhat.com> wrote:
>>
>> On Fri, Jan 28, 2022 at 11:47 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> >
>> > Dear QEMU, KVM, and rust-vmm communities,
>> > QEMU will apply for Google Summer of Code 2022
>> > (https://summerofcode.withgoogle.com/) and has been accepted into
>> > Outreachy May-August 2022 (https://www.outreachy.org/). You can now
>> > submit internship project ideas for QEMU, KVM, and rust-vmm!
>> >
>> > If you have experience contributing to QEMU, KVM, or rust-vmm you can
>> > be a mentor. It's a great way to give back and you get to work with
>> > people who are just starting out in open source.
>> >
>> > Please reply to this email by February 21st with your project ideas.
>> >
>> > Good project ideas are suitable for remote work by a competent
>> > programmer who is not yet familiar with the codebase. In
>> > addition, they are:
>> > - Well-defined - the scope is clear
>> > - Self-contained - there are few dependencies
>> > - Uncontroversial - they are acceptable to the community
>> > - Incremental - they produce deliverables along the way
>> >
>> > Feel free to post ideas even if you are unable to mentor the project.
>> > It doesn't hurt to share the idea!
>>
>> Implementing the VIRTIO_F_IN_ORDER feature for both Qemu and kernel
>> (vhost/virtio drivers) would be an interesting idea.
>>
>> It satisfies all the points above since it's supported by virtio spec.
>>
>> (Unfortunately, I won't have time in the mentoring)
>
>Thanks for this idea. As a stretch goal we could add implementing the
>packed virtqueue layout in Linux vhost, QEMU's libvhost-user, and/or
>QEMU's virtio qtest code.
>
>Stefano: Thank you for volunteering to mentor the project. Please
>write a project description (see template below) and I will add this
>idea:
>

I wrote a description of the project below. Let me know if there is 
anything to change.

Thanks,
Stefano



=== VIRTIO_F_IN_ORDER support for virtio devices ===

'''Summary:''' Implement VIRTIO_F_IN_ORDER feature for QEMU and Linux
(vhost/virtio drivers)

The VIRTIO spec defines a feature bit (VIRTIO_F_IN_ORDER) that devices
and drivers can negotiate when they are able to use descriptors in the
same order in which they have been made available.

This feature could allow to simplify the implementation and develop
optimizations to increase performance. For example, when
VIRTIO_F_IN_ORDER is negotiated, it may be easier to create batch of
buffers and reduce the amount of notification needed between devices
and drivers.

Currently the devices and drivers available on Linux and QEMU do not
support this feature. An implementation is available in DPDK for the
virtio-net driver.

The project could start with implementation for a single device/driver
in QEMU and Linux, then generalize it into the virtio core for split
and packed virtqueue layouts.

If time allows we could develop the support for packed virtqueue layout
in Linux vhost, QEMU's libvhost-user, and/or QEMU's virtio qtest code.

'''Links:'''
* [https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html VIRTIO spec 1.1]
** [https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html#x1-470009 "In-order use of descriptors" section for split virtqueues]
* [https://github.com/oasis-tcs/virtio-spec Source code for the VIRTIO spec]
* [https://mails.dpdk.org/archives/dev/2018-July/106069.html Patches that introduced VIRTIO_F_IN_ORDER in DPDK]
* [https://lists.oasis-open.org/archives/virtio/201803/msg00048.html Patch that introduced VIRTIO_F_IN_ORDER in VIRTIO spec]
* [https://patchew.org/QEMU/1533833677-27512-1-git-send-email-i.maximets@samsung.com/ Incomplete implementation proposed for QEMU]

'''Details:'''
* Skill level: intermediate
* Language: C
* Mentor: Stefano Garzarella <sgarzare@redhat.com>
** IRC/Matrix nick: sgarzare (OFTC/matrix.org)
* Suggested by: Jason Wang <jasowang@redhat.com>


