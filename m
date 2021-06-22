Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9573AFC8D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:19:27 +0200 (CEST)
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYoo-0003Tx-PI
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvYUZ-0001tg-Nh
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:58:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvYUV-0003XN-LY
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624337905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRDBXqKPNFJn48LLd/R7v5TOvWhA8imER9fi5k2ZuEc=;
 b=Q39s+79UUnIFZGMNdbpCKvRwmR0pfkfYNcGuP+6XSICxxJeO1plgl+wWkfY4MpEhqZkpGx
 eUjg/dzzyiZ7dXJGZFTlV+zjHxnHe283Qog7wk+Wwp9Gf1bUxVG6D4s9anbnUHruITKCMs
 DmhQrzlx4RowITBpDUZpZF12U3zyABw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-uOhpsrWvOkWv9eccTXMmVw-1; Tue, 22 Jun 2021 00:58:23 -0400
X-MC-Unique: uOhpsrWvOkWv9eccTXMmVw-1
Received: by mail-pg1-f198.google.com with SMTP id
 y1-20020a655b410000b02902235977d00cso4000703pgr.21
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 21:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pRDBXqKPNFJn48LLd/R7v5TOvWhA8imER9fi5k2ZuEc=;
 b=WWlBym3v8IWohGIkt0mE3paZc6ni+5gcMG+/IR1Lxrk8syJR7srpg2HmGN26K5wcAi
 3kRo2gLKq5vm/FRXlC0C+fD1r+Yjm/Cj/ZGNPZXzYxUkutqX8T6E0zyTmBrb/4K0ETe4
 cZPtgi5BX/ax2iI1W5qJI3cb9oryjB1r9o/up65A4LtZrR17ZcAGL6Sfp16bxaYpTjJ+
 jNkAt8stVF3OyKmsqloY56d0a/7X3/nCFXv84QVwHk6/0CtgmCTcveIPYMjd0VnS0bL4
 /MOvowAfoup63cIgO31iJF9t6vlIIxlaUtZPXxFqF4ekZg02KTHNLaUW4pRX+HWgS757
 8mdg==
X-Gm-Message-State: AOAM5310wuu1nxgec2iE619TX8+ri5x9hjoQjJUChNN4adlwnqyTlVIQ
 8D6aQBK3Swvu0fkCLmH4DaK4VxyizflMp6ej6iKQ1s3NxUwTiIfFDZRXtaJF03P2CNG1XoYgNBj
 lgCLc5CZdIR2GN18=
X-Received: by 2002:a63:fa03:: with SMTP id y3mr1946652pgh.389.1624337902018; 
 Mon, 21 Jun 2021 21:58:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGBua5PHiYJjdUFnMwp9LdLTyPSfGdqTglB7FZwdbzjxXmGX5nNiJMw177Nn3JXROj0jJtZQ==
X-Received: by 2002:a63:fa03:: with SMTP id y3mr1946630pgh.389.1624337901722; 
 Mon, 21 Jun 2021 21:58:21 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v21sm790056pju.47.2021.06.21.21.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 21:58:21 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20210609100457.142570-1-andrew@daynix.com>
 <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
 <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
 <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
 <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
 <CABcq3pEXZGoRPGQPB1b1Tb_rDEg5aMFCB+CELAyOjDCyTS1FTQ@mail.gmail.com>
 <07a81543-c262-f153-6414-3d967dde02b2@redhat.com>
 <CAOEp5OeEkJh=5hMKveanMRdR2Mf93SWRuuktVbY6+=BKj6jVLA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9157bf00-299f-993d-dd16-62f13e017a3f@redhat.com>
Date: Tue, 22 Jun 2021 12:58:16 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOEp5OeEkJh=5hMKveanMRdR2Mf93SWRuuktVbY6+=BKj6jVLA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, toke@redhat.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/22 上午11:29, Yuri Benditovich 写道:
> On Mon, Jun 21, 2021 at 12:20 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/6/19 上午4:03, Andrew Melnichenko 写道:
>>> Hi Jason,
>>> I've checked "kernel.unprivileged_bpf_disabled=0" on Fedora,  Ubuntu,
>>> and Debian - no need permissions to update BPF maps.
>>
>> How about RHEL :) ?
> If I'm not mistaken, the RHEL releases do not use modern kernels yet
> (for BPF we need 5.8+).
> So this will be (probably) relevant for RHEL 9. Please correct me if I'm wrong.


Adding Toke for more ideas on this.

Thanks


>
>
>> Thanks
>>
>>
>>> On Wed, Jun 16, 2021 at 1:18 AM Andrew Melnichenko <andrew@daynix.com
>>> <mailto:andrew@daynix.com>> wrote:
>>>
>>>      Hi,
>>>
>>>          I may miss something.
>>>
>>>          But RSS requires to update the map. This won't work if you
>>>          don't grant
>>>          any permission to qemu.
>>>
>>>          Thanks
>>>
>>>
>>>      Partly - with "kernel.unprivileged_bpf_disabled=0" capabilities is
>>>      not required to update maps.
>>>      With "kernel.unprivileged_bpf_disabled=1" - setting maps will
>>>      fail(without CAP_BPF) and "in-qemu" RSS will be used.
>>>
>>>      On Tue, Jun 15, 2021 at 12:13 PM Jason Wang <jasowang@redhat.com
>>>      <mailto:jasowang@redhat.com>> wrote:
>>>
>>>
>>>          在 2021/6/12 上午12:49, Andrew Melnichenko 写道:
>>>          > Hi,
>>>          >
>>>          >     So I think the series is for unprivileged_bpf disabled.
>>>          If I'm not
>>>          >     wrong, I guess the policy is to grant CAP_BPF but do
>>>          fine grain
>>>          >     checks
>>>          >     via LSM.
>>>          >
>>>          >
>>>          > The main idea is to run eBPF RSS with qemu without any
>>>          permission.
>>>          > Libvirt should handle everything and pass proper eBPF file
>>>          descriptors.
>>>          > For current eBPF RSS, CAP_SYS_ADMIN(bypass some limitations)
>>>          > also required, and in the future may be other permissions.
>>>
>>>
>>>          I may miss something.
>>>
>>>          But RSS requires to update the map. This won't work if you
>>>          don't grant
>>>          any permission to qemu.
>>>
>>>          Thanks
>>>
>>>
>>>          >
>>>          >     I'm not sure this is the best. We have several examples
>>>          that let
>>>          >     libvirt
>>>          >     to involve. Examples:
>>>          >
>>>          >     1) create TAP device (and the TUN_SETIFF)
>>>          >
>>>          >     2) open vhost devices
>>>          >
>>>          >
>>>          > Technically TAP/vhost not related to a particular qemu
>>>          emulator. So common
>>>          > TAP creation should fit any modern qemu. eBPF fds(program
>>>          and maps) should
>>>          > suit the interface for current qemu, g.e. some qemu builds
>>>          may have
>>>          > different map
>>>          > structures or their count. It's necessary that the qemu got fds
>>>          > prepared by the helper
>>>          > that was built with the qemu.
>>>          >
>>>          >     I think we need an example on the detail steps for how
>>>          libvirt is
>>>          >     expected to use this.
>>>          >
>>>          >
>>>          > The simplified workflow looks like this:
>>>          >
>>>          >  1. Libvirt got "emulator" from domain document.
>>>          >  2. Libvirt queries for qemu capabilities.
>>>          >  3. One of the capabilities is "qemu-ebpf-rss-helper"
>>>          path(if present).
>>>          >  4. On NIC preparation Libvirt checks for virtio-net + rss
>>>          configurations.
>>>          >  5. If required, the "qemu-ebpf-rss-helper" called and fds are
>>>          >     received through unix fd.
>>>          >  6. Those fds are for eBPF RSS, which passed to child
>>>          process - qemu.
>>>          >  7. Qemu launched with virtio-net-pci property "rss" and
>>>          "ebpf_rss_fds".
>>>          >
>>>          >
>>>          > On Fri, Jun 11, 2021 at 8:36 AM Jason Wang
>>>          <jasowang@redhat.com <mailto:jasowang@redhat.com>
>>>          > <mailto:jasowang@redhat.com <mailto:jasowang@redhat.com>>>
>>>          wrote:
>>>          >
>>>          >
>>>          >     在 2021/6/10 下午2:55, Yuri Benditovich 写道:
>>>          >     > On Thu, Jun 10, 2021 at 9:41 AM Jason
>>>          Wang<jasowang@redhat.com <mailto:jasowang@redhat.com>
>>>          >     <mailto:jasowang@redhat.com
>>>          <mailto:jasowang@redhat.com>>> wrote:
>>>          >     >> 在 2021/6/9 下午6:04, Andrew Melnychenko 写道:
>>>          >     >>> Libvirt usually launches qemu with strict permissions.
>>>          >     >>> To enable eBPF RSS steering, qemu-ebpf-rss-helper
>>>          was added.
>>>          >     >> A silly question:
>>>          >     >>
>>>          >     >> Kernel had the following permission checks in bpf
>>>          syscall:
>>>          >     >>
>>>          >     >>          if (sysctl_unprivileged_bpf_disabled &&
>>>          !bpf_capable())
>>>          >     >>                   return -EPERM;
>>>          >     >> ...
>>>          >     >>
>>>          >     >>           err = security_bpf(cmd, &attr, size);
>>>          >     >>           if (err < 0)
>>>          >     >>                   return err;
>>>          >     >>
>>>          >     >> So if I understand the code correctly, bpf syscall
>>>          can only be
>>>          >     done if:
>>>          >     >>
>>>          >     >> 1) unprivileged_bpf is enabled or
>>>          >     >> 2) has the capability  and pass the LSM checks
>>>          >     >>
>>>          >     >> So I think the series is for unprivileged_bpf
>>>          disabled. If I'm not
>>>          >     >> wrong, I guess the policy is to grant CAP_BPF but do
>>>          fine grain
>>>          >     checks
>>>          >     >> via LSM.
>>>          >     >>
>>>          >     >> If this is correct, need to describe it in the commit
>>>          log.
>>>          >     >>
>>>          >     >>
>>>          >     >>> Added property "ebpf_rss_fds" for "virtio-net" that
>>>          allows to
>>>          >     >>> initialize eBPF RSS context with passed program &
>>>          maps fds.
>>>          >     >>>
>>>          >     >>> Added qemu-ebpf-rss-helper - simple helper that
>>>          loads eBPF
>>>          >     >>> context and passes fds through unix socket.
>>>          >     >>> Libvirt should call the helper and pass fds to qemu
>>>          through
>>>          >     >>> "ebpf_rss_fds" property.
>>>          >     >>>
>>>          >     >>> Added explicit target OS check for libbpf dependency
>>>          in meson.
>>>          >     >>> eBPF RSS works only with Linux TAP, so there is no
>>>          reason to
>>>          >     >>> build eBPF loader/helper for non-Linux.
>>>          >     >>>
>>>          >     >>> Overall, libvirt process should not be aware of the
>>>          "interface"
>>>          >     >>> of eBPF RSS, it will not be aware of eBPF
>>>          maps/program "type" and
>>>          >     >>> their quantity.
>>>          >     >> I'm not sure this is the best. We have several
>>>          examples that
>>>          >     let libvirt
>>>          >     >> to involve. Examples:
>>>          >     >>
>>>          >     >> 1) create TAP device (and the TUN_SETIFF)
>>>          >     >>
>>>          >     >> 2) open vhost devices
>>>          >     >>
>>>          >     >>
>>>          >     >>>    That's why qemu and the helper should be from
>>>          >     >>> the same build and be "synchronized". Technically
>>>          each qemu may
>>>          >     >>> have its own helper. That's why "query-helper-paths"
>>>          qmp command
>>>          >     >>> was added. Qemu should return the path to the helper
>>>          that suits
>>>          >     >>> and libvirt should use "that" helper for "that"
>>>          emulator.
>>>          >     >>>
>>>          >     >>> qmp sample:
>>>          >     >>> C: { "execute": "query-helper-paths" }
>>>          >     >>> S: { "return": [
>>>          >     >>>        {
>>>          >     >>>          "name": "qemu-ebpf-rss-helper",
>>>          >     >>>          "path":
>>>          "/usr/local/libexec/qemu-ebpf-rss-helper"
>>>          >     >>>        }
>>>          >     >>>       ]
>>>          >     >>>      }
>>>          >     >> I think we need an example on the detail steps for
>>>          how libvirt is
>>>          >     >> expected to use this.
>>>          >     > The preliminary patches for libvirt are at
>>>          >     > https://github.com/daynix/libvirt/tree/RSSv1
>>>          <https://github.com/daynix/libvirt/tree/RSSv1>
>>>          >     <https://github.com/daynix/libvirt/tree/RSSv1
>>>          <https://github.com/daynix/libvirt/tree/RSSv1>>
>>>          >
>>>          >
>>>          >     Will have a look but it would be better if the
>>>          assumption of the
>>>          >     management is detailed here to ease the reviewers.
>>>          >
>>>          >     Thanks
>>>          >
>>>          >
>>>          >     >
>>>          >
>>>


