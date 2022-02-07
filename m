Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2AF4ACB63
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 22:38:23 +0100 (CET)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHBiH-0001dJ-Vk
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 16:38:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dwalsh@redhat.com>) id 1nHBg8-00084j-4i
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:36:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dwalsh@redhat.com>) id 1nHBg1-0004dN-Jc
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644269760;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaWEDV4zxU2349juqSwqjbBCZWmkG9am+IdJajsDaDU=;
 b=YoocaYUl6t79fzOLZ+/1+XHLbEv7S9XpnwTt2uLonZbNR/I/vRERBMFk9rl1z0zgzyfWxK
 7OiEZXcpBrYC6ENzsOTCloGSkccXnHA9uyjGqnom8z5377q5kRs/YCcPI1Hpwez2SP1LuO
 LHntd+KzC9jDHCWtEZlA/nb0MWw+i5o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-RjL1c0glNsay0aBaLp4l7Q-1; Mon, 07 Feb 2022 16:34:32 -0500
X-MC-Unique: RjL1c0glNsay0aBaLp4l7Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 t79-20020a37aa52000000b0047ebe27cb48so9548213qke.16
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 13:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:organization
 :in-reply-to:content-transfer-encoding;
 bh=gaWEDV4zxU2349juqSwqjbBCZWmkG9am+IdJajsDaDU=;
 b=2h0odhwMw62t8ag4osZkXe5rfm/GpRVtLWW8nwNPOmMAeBeAGVRCUuQ3u5tfp/iciJ
 dmW6kdpIg+uDz9w1fnP/Rbgo7+6ufUINq8KjBdDCwKlzX0HUKMvnDG9hVKbh8PRGFu3U
 skj903j1TTl+o0LRN/lHm//Qs1asRIz4QDdCXfmSe71dMvj5MvRZ3xLC1Ebk3UuLFp4j
 18T5NQrlZhKFIIJMWclV21XOQWnNE7w+kSySof+Iw5dLanZbAX3YAo3nM45kMKy8yalS
 ZhOFmgJhPBM9pxSYqG7tMbKY5KQ+FdxqGYwbFm8Y1K9b5iYQE14Or/00mtf99Fkh+khy
 cZRQ==
X-Gm-Message-State: AOAM531O2mv1+CextqdpXwZetJwHlszmzX0RLCMo0KaWJEqDgi+T/U8A
 25sNGxpoVgSGGhtFHzOIn+csDJ1NhQyJb1qoThhL8/FD80cYICPIt4fKBhBkAtK7iBKa93I1PRp
 Ix183E4K57xghfDo=
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr1084125qta.405.1644269671738; 
 Mon, 07 Feb 2022 13:34:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQNPytbBNkMlnLICz7YM3DjDUjtTbj/8gkIQ9sZJF/L3uZJe0DEyG6OPK7q1S5rhDSOF4Pqg==
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr1084108qta.405.1644269671475; 
 Mon, 07 Feb 2022 13:34:31 -0800 (PST)
Received: from ?IPV6:2607:fb90:6896:6b2e:7414:dd94:152:4f49?
 ([2607:fb90:6896:6b2e:7414:dd94:152:4f49])
 by smtp.gmail.com with ESMTPSA id s9sm4946988qki.101.2022.02.07.13.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 13:34:30 -0800 (PST)
Message-ID: <c6386449-241b-0f7c-a460-f7e1d68f5a39@redhat.com>
Date: Mon, 7 Feb 2022 16:34:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/9] virtiofsd: Add support for file security context
 at file creation
To: Vivek Goyal <vgoyal@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <YgEZDOcFr80tZGWd@redhat.com> <YgGM6pA2sXEAMa3a@redhat.com>
From: Daniel Walsh <dwalsh@redhat.com>
Organization: Red Hat
In-Reply-To: <YgGM6pA2sXEAMa3a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dwalsh@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dwalsh@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: dwalsh@redhat.com
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/22 16:19, Vivek Goyal wrote:
> On Mon, Feb 07, 2022 at 01:05:16PM +0000, Daniel P. Berrangé wrote:
>> On Wed, Feb 02, 2022 at 02:39:26PM -0500, Vivek Goyal wrote:
>>> Hi,
>>>
>>> This is V5 of the patches. I posted V4 here.
>>>
>>> https://listman.redhat.com/archives/virtio-fs/2022-January/msg00041.html
>>>
>>> These will allow us to support SELinux with virtiofs. This will send
>>> SELinux context at file creation to server and server can set it on
>>> file.
>> I've not entirely figured it out from the code, so easier for me
>> to ask...
>>
>> How is the SELinux labelled stored on the host side ? It is stored
>> directly in the security.* xattr namespace,
> [ CC Dan Walsh ]
>
> I just tried to test the mode where I don't do xattr remapping and try
> to set /proc/pid/attr/fscreate with the context I want to set. It will
> set security.selinux xattr on host.
>
> But write to /proc/pid/attr/fscreate fails if host does not recognize
> the label sent by guest. I am running virtiofsd with unconfined_t but
> it still fails because guest is trying to create a file with
> "test_filesystem_filetranscon_t" and host does not recognize this
> label. Seeing following in audit logs.
>
> type=SELINUX_ERR msg=audit(1644268262.666:8111): op=fscreate invalid_context="unconfined_u:object_r:test_filesystem_filetranscon_t:s0"
>
> So if we don't remap xattrs and host has SELinux enabled, then it probably
> work in very limited circumstances where host and guest policies don't
> conflict. I guess its like running fedora 34 guest on fedora 34 host.
> I suspect that this will see very limited use. Though I have put the
> code in for the sake of completeness.
>
> Thanks
> Vivek
>
>> or is is subject to
>> xattr remapping that virtiofsd already supports.
>>
>> Storing directly means virtiofsd has to run in an essentially
>> unconfined context, to let it do arbitrary  changes on security.*
>> xattrs without being blocked by SELinux) and has risk that guest
>> initiated changes can open holes in the host confinement if
>> the exported FS is generally visible to processes on the host.
>>
>>
>> Using remapping lets virtiofsd be strictly isolated by SELinux
>> policy on the host, and ensures that guest context changes
>> can't open up holes in the host.
>>
>> Both are valid use cases, so I'd ultimately expect us to want
>> to support both, but my preference for a "default" behaviour
>> would be remapping.
>>
>> Regards,
>> Daniel
>> -- 
>> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
>> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
>> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
>>
I had a bug today, where someone tried to run a --privileged container 
with RHEL9 which attempted to place a label onto a volume from the RHEL8 
host and got a MAC_ADMIN avc and the label was denied.

Even unconfined domains are not allowed to place non-understood labels 
on disk.  The problem is when the processes on RHEL8 would look at the 
labeled file, they would just see it as unlabeled_t.



