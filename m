Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4BA3A3B6E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 07:37:29 +0200 (CEST)
Received: from localhost ([::1]:49360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrZrD-0000Fu-Nk
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 01:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lrZqJ-00082k-Lf
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 01:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lrZqF-0006qU-Go
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 01:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623389784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKI8kLdAVv2IiNpKnnLXm18h8NOAq5jVe9PXLtDWns8=;
 b=Xmw9EnvDJ9VhTBaMxoPbg+l0niIfIDXRXR/Xm7VSjcjQW51zZU1JxUNnk3DSzmqm1GBuFt
 8QMykAUaKegyQVTi8AnMFxZmvH2F/mp4cl05wqIyymCPwIBd3YEno+qbe2H9Vo0g7VRX+o
 IjEqtOc2h0AjEFynVJczc4jOA00S0H8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-OPF7nkjxPxm6zVeML3KJuw-1; Fri, 11 Jun 2021 01:36:21 -0400
X-MC-Unique: OPF7nkjxPxm6zVeML3KJuw-1
Received: by mail-pg1-f198.google.com with SMTP id
 a10-20020a65418a0000b029021b78388f57so1075417pgq.15
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 22:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pKI8kLdAVv2IiNpKnnLXm18h8NOAq5jVe9PXLtDWns8=;
 b=UeXbcmtUav3tW50ZGsHFZu8YWLSHOI8VWgpbgwTf6uQ/TalkJNRA5GjJ950N9YCEC6
 Bs/IHTxFEJLl8Nq2jvaqQ0RDmFsVfgC5fTT88XbDlXjeFcYwAyW6YrmCBVGrWRUWr0wD
 aXDrCIaph76KGKHpV/Xa59xRmhU3RKE0YkOZN+UqVb23h7bPmN1oY52NOX8SRqTv7m88
 XihvuZHs6YniqQuuVgRZ5SGwUTS2B5XcKXUSUyktSZHsXLGx9WZPdhuljFvdQLc4TrmJ
 mryMXwSo6nux1/20Twhh3V1cDq3mVRAdrXf2dAgHzXvyMIjPMaQN1OUZt8SgdG5mWy9n
 ke8w==
X-Gm-Message-State: AOAM532KhWdB6eCQgp3GtHWv8ehuuFEkWmLSmYsEDWOOiCHlPsGjQgP7
 Q7vR/GCz3GjNd7sgiBYgm7Kp1id8kFBddDkjS04k/PZuYcot6v3QDXdTQoevGDiF/m9HbJQyAZ6
 2Hh3UWz+Hz0UKZCc=
X-Received: by 2002:a17:90b:1bc4:: with SMTP id
 oa4mr2814938pjb.18.1623389780873; 
 Thu, 10 Jun 2021 22:36:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaAzSjtdkuBRiVSUPATGG7o4DW88xj/MEUhSUqxIS2oS/3jXkU8NZc2+oGi476lLGL0dNIqw==
X-Received: by 2002:a17:90b:1bc4:: with SMTP id
 oa4mr2814923pjb.18.1623389780599; 
 Thu, 10 Jun 2021 22:36:20 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r9sm3982366pfq.158.2021.06.10.22.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 22:36:20 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20210609100457.142570-1-andrew@daynix.com>
 <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
 <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
Date: Fri, 11 Jun 2021 13:36:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/10 下午2:55, Yuri Benditovich 写道:
> On Thu, Jun 10, 2021 at 9:41 AM Jason Wang<jasowang@redhat.com>  wrote:
>> 在 2021/6/9 下午6:04, Andrew Melnychenko 写道:
>>> Libvirt usually launches qemu with strict permissions.
>>> To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.
>> A silly question:
>>
>> Kernel had the following permission checks in bpf syscall:
>>
>>          if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
>>                   return -EPERM;
>> ...
>>
>>           err = security_bpf(cmd, &attr, size);
>>           if (err < 0)
>>                   return err;
>>
>> So if I understand the code correctly, bpf syscall can only be done if:
>>
>> 1) unprivileged_bpf is enabled or
>> 2) has the capability  and pass the LSM checks
>>
>> So I think the series is for unprivileged_bpf disabled. If I'm not
>> wrong, I guess the policy is to grant CAP_BPF but do fine grain checks
>> via LSM.
>>
>> If this is correct, need to describe it in the commit log.
>>
>>
>>> Added property "ebpf_rss_fds" for "virtio-net" that allows to
>>> initialize eBPF RSS context with passed program & maps fds.
>>>
>>> Added qemu-ebpf-rss-helper - simple helper that loads eBPF
>>> context and passes fds through unix socket.
>>> Libvirt should call the helper and pass fds to qemu through
>>> "ebpf_rss_fds" property.
>>>
>>> Added explicit target OS check for libbpf dependency in meson.
>>> eBPF RSS works only with Linux TAP, so there is no reason to
>>> build eBPF loader/helper for non-Linux.
>>>
>>> Overall, libvirt process should not be aware of the "interface"
>>> of eBPF RSS, it will not be aware of eBPF maps/program "type" and
>>> their quantity.
>> I'm not sure this is the best. We have several examples that let libvirt
>> to involve. Examples:
>>
>> 1) create TAP device (and the TUN_SETIFF)
>>
>> 2) open vhost devices
>>
>>
>>>    That's why qemu and the helper should be from
>>> the same build and be "synchronized". Technically each qemu may
>>> have its own helper. That's why "query-helper-paths" qmp command
>>> was added. Qemu should return the path to the helper that suits
>>> and libvirt should use "that" helper for "that" emulator.
>>>
>>> qmp sample:
>>> C: { "execute": "query-helper-paths" }
>>> S: { "return": [
>>>        {
>>>          "name": "qemu-ebpf-rss-helper",
>>>          "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
>>>        }
>>>       ]
>>>      }
>> I think we need an example on the detail steps for how libvirt is
>> expected to use this.
> The preliminary patches for libvirt are at
> https://github.com/daynix/libvirt/tree/RSSv1


Will have a look but it would be better if the assumption of the 
management is detailed here to ease the reviewers.

Thanks


>


