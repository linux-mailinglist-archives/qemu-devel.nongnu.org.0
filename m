Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28013A79EB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:16:00 +0200 (CEST)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt5At-0006Ec-Mu
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lt58u-0005VV-3T
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:13:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lt58r-00053T-Sl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623748432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1H/inNAocEE0bpfWY3m/BLoj0NMhQ1UpRiVDRVcthw=;
 b=YHgTx2EDDnG94yJpUhaYvBaJuwbZvh3pH/AB4sB1U90GbS7Z/iIChYUQxxytQ9Q+2vOSdK
 v4AOoMtPqYg+cBdBW0ChVi48bKcGToiGYgU8aWxav1pv0625RGzPpr27wsWz4vXa62RrL5
 urrXOVDgpnGlzT1U53XqWsjun748kY0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-Nc6vokmSM4KR59f_G0CI9A-1; Tue, 15 Jun 2021 05:13:49 -0400
X-MC-Unique: Nc6vokmSM4KR59f_G0CI9A-1
Received: by mail-pl1-f200.google.com with SMTP id
 s23-20020a170902b197b029011aafb8fbadso2245881plr.19
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 02:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=V1H/inNAocEE0bpfWY3m/BLoj0NMhQ1UpRiVDRVcthw=;
 b=SFVxRSFou+8f/0jiZM8KSGHK/wL+WIwQcA12a0qURpG3FZw/q7ZKfuGCFxXNcTgHGn
 T4YGgH8bmc4gkImP8msll35M1wwWOUM0S3ce9335hbXo/Qu/YeBfxn+RQ5WZn25m6cPX
 GlKP6xkJtiU0d/Qao7nEJHzbZUh5jiQQnUXnduhlZi0DBvs3SLvFa6AG8mdKQvg4z9Nk
 /UEsXvP0OrZ2mcasF9vb/rij5R3c/RNbmhI+Hnoe5nxkddOoBPVOzwRONxngfB1GDJgD
 pVcWX/Byr/lBrFLscfiWflWLmWjddehJW5Ux4cbHXOVprxKv+g7NUEc8SXTfz0djrovi
 k3gA==
X-Gm-Message-State: AOAM531deLlg2y9V3+KW5sDFW2fuwLzwknDTKQVRYd4xgdd8qhXYyAWr
 923/jfHlLnDDtNtf4Y7Mkti16ZjSVPw4HND/jdMS+r8YDCUjnZLR3IcBKZl4xY5mPL2XMYk49V8
 DxNOU5u8EzQZzZw4=
X-Received: by 2002:a17:902:ea92:b029:103:a022:c545 with SMTP id
 x18-20020a170902ea92b0290103a022c545mr3132728plb.43.1623748428678; 
 Tue, 15 Jun 2021 02:13:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrAn6c4lowVt5xkOIwnEY25oA/BtsGPI9e0tXpECNLnNL4ttVSEgWpmEXn18yYLDs1Q35Mtg==
X-Received: by 2002:a17:902:ea92:b029:103:a022:c545 with SMTP id
 x18-20020a170902ea92b0290103a022c545mr3132697plb.43.1623748428385; 
 Tue, 15 Jun 2021 02:13:48 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p11sm14591071pfo.126.2021.06.15.02.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 02:13:47 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Andrew Melnichenko <andrew@daynix.com>
References: <20210609100457.142570-1-andrew@daynix.com>
 <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
 <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
Date: Tue, 15 Jun 2021 17:13:38 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/12 上午12:49, Andrew Melnichenko 写道:
> Hi,
>
>     So I think the series is for unprivileged_bpf disabled. If I'm not
>     wrong, I guess the policy is to grant CAP_BPF but do fine grain
>     checks
>     via LSM.
>
>
> The main idea is to run eBPF RSS with qemu without any permission.
> Libvirt should handle everything and pass proper eBPF file descriptors.
> For current eBPF RSS, CAP_SYS_ADMIN(bypass some limitations)
> also required, and in the future may be other permissions.


I may miss something.

But RSS requires to update the map. This won't work if you don't grant 
any permission to qemu.

Thanks


>
>     I'm not sure this is the best. We have several examples that let
>     libvirt
>     to involve. Examples:
>
>     1) create TAP device (and the TUN_SETIFF)
>
>     2) open vhost devices
>
>
> Technically TAP/vhost not related to a particular qemu emulator. So common
> TAP creation should fit any modern qemu. eBPF fds(program and maps) should
> suit the interface for current qemu, g.e. some qemu builds may have 
> different map
> structures or their count. It's necessary that the qemu got fds 
> prepared by the helper
> that was built with the qemu.
>
>     I think we need an example on the detail steps for how libvirt is
>     expected to use this.
>
>
> The simplified workflow looks like this:
>
>  1. Libvirt got "emulator" from domain document.
>  2. Libvirt queries for qemu capabilities.
>  3. One of the capabilities is "qemu-ebpf-rss-helper" path(if present).
>  4. On NIC preparation Libvirt checks for virtio-net + rss configurations.
>  5. If required, the "qemu-ebpf-rss-helper" called and fds are
>     received through unix fd.
>  6. Those fds are for eBPF RSS, which passed to child process - qemu.
>  7. Qemu launched with virtio-net-pci property "rss" and "ebpf_rss_fds".
>
>
> On Fri, Jun 11, 2021 at 8:36 AM Jason Wang <jasowang@redhat.com 
> <mailto:jasowang@redhat.com>> wrote:
>
>
>     在 2021/6/10 下午2:55, Yuri Benditovich 写道:
>     > On Thu, Jun 10, 2021 at 9:41 AM Jason Wang<jasowang@redhat.com
>     <mailto:jasowang@redhat.com>>  wrote:
>     >> 在 2021/6/9 下午6:04, Andrew Melnychenko 写道:
>     >>> Libvirt usually launches qemu with strict permissions.
>     >>> To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.
>     >> A silly question:
>     >>
>     >> Kernel had the following permission checks in bpf syscall:
>     >>
>     >>          if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
>     >>                   return -EPERM;
>     >> ...
>     >>
>     >>           err = security_bpf(cmd, &attr, size);
>     >>           if (err < 0)
>     >>                   return err;
>     >>
>     >> So if I understand the code correctly, bpf syscall can only be
>     done if:
>     >>
>     >> 1) unprivileged_bpf is enabled or
>     >> 2) has the capability  and pass the LSM checks
>     >>
>     >> So I think the series is for unprivileged_bpf disabled. If I'm not
>     >> wrong, I guess the policy is to grant CAP_BPF but do fine grain
>     checks
>     >> via LSM.
>     >>
>     >> If this is correct, need to describe it in the commit log.
>     >>
>     >>
>     >>> Added property "ebpf_rss_fds" for "virtio-net" that allows to
>     >>> initialize eBPF RSS context with passed program & maps fds.
>     >>>
>     >>> Added qemu-ebpf-rss-helper - simple helper that loads eBPF
>     >>> context and passes fds through unix socket.
>     >>> Libvirt should call the helper and pass fds to qemu through
>     >>> "ebpf_rss_fds" property.
>     >>>
>     >>> Added explicit target OS check for libbpf dependency in meson.
>     >>> eBPF RSS works only with Linux TAP, so there is no reason to
>     >>> build eBPF loader/helper for non-Linux.
>     >>>
>     >>> Overall, libvirt process should not be aware of the "interface"
>     >>> of eBPF RSS, it will not be aware of eBPF maps/program "type" and
>     >>> their quantity.
>     >> I'm not sure this is the best. We have several examples that
>     let libvirt
>     >> to involve. Examples:
>     >>
>     >> 1) create TAP device (and the TUN_SETIFF)
>     >>
>     >> 2) open vhost devices
>     >>
>     >>
>     >>>    That's why qemu and the helper should be from
>     >>> the same build and be "synchronized". Technically each qemu may
>     >>> have its own helper. That's why "query-helper-paths" qmp command
>     >>> was added. Qemu should return the path to the helper that suits
>     >>> and libvirt should use "that" helper for "that" emulator.
>     >>>
>     >>> qmp sample:
>     >>> C: { "execute": "query-helper-paths" }
>     >>> S: { "return": [
>     >>>        {
>     >>>          "name": "qemu-ebpf-rss-helper",
>     >>>          "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
>     >>>        }
>     >>>       ]
>     >>>      }
>     >> I think we need an example on the detail steps for how libvirt is
>     >> expected to use this.
>     > The preliminary patches for libvirt are at
>     > https://github.com/daynix/libvirt/tree/RSSv1
>     <https://github.com/daynix/libvirt/tree/RSSv1>
>
>
>     Will have a look but it would be better if the assumption of the
>     management is detailed here to ease the reviewers.
>
>     Thanks
>
>
>     >
>


