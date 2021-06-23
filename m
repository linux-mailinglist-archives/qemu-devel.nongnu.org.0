Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F33B1122
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 02:48:52 +0200 (CEST)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvr4U-0000vn-Ka
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 20:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvr3Y-0000GF-A1
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 20:47:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvr3U-0008A3-MU
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 20:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624409267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFCQ7716d+NObjP5Tzfn+F42r8z+5kAToDMbLTvQ+TU=;
 b=aa4PX5di1B0OLf6JhXi4Ngp6DznVzbCV/jrNe2LZdWGuzXTZoPwbvfb0VNdnrWQYDJfaoE
 JdXxFkbuK9LJxDJQM7myJNXGv/029N957Zxoc/xLWYP+JLjgC8aXKV+WdcFpSmRWjt9GhW
 WCOs6CnjcpJozfFumUESRMs5gwvkumA=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-_CeeVFyoPhyfrvAxyu-i6g-1; Tue, 22 Jun 2021 20:47:45 -0400
X-MC-Unique: _CeeVFyoPhyfrvAxyu-i6g-1
Received: by mail-pg1-f200.google.com with SMTP id
 17-20020a630b110000b029022064e7cdcfso202065pgl.10
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 17:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YFCQ7716d+NObjP5Tzfn+F42r8z+5kAToDMbLTvQ+TU=;
 b=RrcyI4LTwKgSsrWuQthtKTjnLy2Q3E6iPsmIKunPuwjVTJEQhHiinVaunCC6LYHEyz
 soQBp24VbszHJZApRM08tkMu7XGAUaBmCo67kfFbs3Pk10SyYiXSkkYZO0EVyLlX+CTn
 DLcbGZW9GAJoDi3U9uKZpJtc7dUVQylo1NgZcwgOWUYsJzgCa0GWvpgU/27a3opRQzgq
 V/Ufk70d3JH7QqisG15W27UiDgbRzLVzpPuxscF3RlGZhc9VRboAKKlsKPvOqen/IAph
 gm8z85cJAELIeKXmxz6yNmxssbDpUaeoW9oTQHyrSNUkuHX9srefnXlzJ8G6ZG6ir9ra
 KjKQ==
X-Gm-Message-State: AOAM5315gbvmeiFyk9NhXyDkV2lxUPJfhGMs3TyLiDqLqzh+VDqsVGIY
 G+uFBj2eCD7azDj7slWGna+BAxDS/t+KhJtUAqCdn2SHAMPkcjt799nnWjlvOEBkMBZfJU/hsNf
 2FCPNvh0qp2eheg8=
X-Received: by 2002:a17:902:da84:b029:126:2a2:cb89 with SMTP id
 j4-20020a170902da84b029012602a2cb89mr8089157plx.6.1624409264953; 
 Tue, 22 Jun 2021 17:47:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXVyljBlIrcQuLjarHA4WGdAmHOHPXW5/Tuf16476re03bTBXLe3fGXqeCT3OPe5SWzrhfrg==
X-Received: by 2002:a17:902:da84:b029:126:2a2:cb89 with SMTP id
 j4-20020a170902da84b029012602a2cb89mr8089144plx.6.1624409264695; 
 Tue, 22 Jun 2021 17:47:44 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x1sm429006pfn.198.2021.06.22.17.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 17:47:44 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
 <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
 <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
 <CABcq3pEXZGoRPGQPB1b1Tb_rDEg5aMFCB+CELAyOjDCyTS1FTQ@mail.gmail.com>
 <07a81543-c262-f153-6414-3d967dde02b2@redhat.com>
 <CAOEp5OeEkJh=5hMKveanMRdR2Mf93SWRuuktVbY6+=BKj6jVLA@mail.gmail.com>
 <9157bf00-299f-993d-dd16-62f13e017a3f@redhat.com> <87o8byqpao.fsf@toke.dk>
 <YNGe3iiZ103ps36n@redhat.com> <87im26qn9q.fsf@toke.dk>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <965bb2c1-64c5-eeb2-6f35-52dd2652d1be@redhat.com>
Date: Wed, 23 Jun 2021 08:47:39 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87im26qn9q.fsf@toke.dk>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/22 下午5:09, Toke Høiland-Jørgensen 写道:
> Daniel P. Berrangé <berrange@redhat.com> writes:
>
>> On Tue, Jun 22, 2021 at 10:25:19AM +0200, Toke Høiland-Jørgensen wrote:
>>> Jason Wang <jasowang@redhat.com> writes:
>>>
>>>> 在 2021/6/22 上午11:29, Yuri Benditovich 写道:
>>>>> On Mon, Jun 21, 2021 at 12:20 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> 在 2021/6/19 上午4:03, Andrew Melnichenko 写道:
>>>>>>> Hi Jason,
>>>>>>> I've checked "kernel.unprivileged_bpf_disabled=0" on Fedora,  Ubuntu,
>>>>>>> and Debian - no need permissions to update BPF maps.
>>>>>> How about RHEL :) ?
>>>>> If I'm not mistaken, the RHEL releases do not use modern kernels yet
>>>>> (for BPF we need 5.8+).
>>>>> So this will be (probably) relevant for RHEL 9. Please correct me if I'm wrong.
>>>> Adding Toke for more ideas on this.
>>> Ignore the kernel version number; we backport all of BPF to RHEL,
>>> basically. RHEL8.4 is up to upstream kernel 5.10, feature-wise.
>>>
>>> However, we completely disable unprivileged BPF on RHEL kernels. Also,
>>> there's upstream commit:
>>> 08389d888287 ("bpf: Add kconfig knob for disabling unpriv bpf by default")
>>>
>>> which adds a new value of '2' to the unprivileged_bpf_disable sysctl. I
>>> believe this may end up being the default on Fedora as well.
>>>
>>> So any design relying on unprivileged BPF is likely to break; I'd
>>> suggest you look into how you can get this to work with CAP_BPF :)
>> QEMU will never have any capabilities. Any resources that required
>> privileges have to be opened by a separate privileged helper, and the
>> open FD then passed across to the QEMU process. This relies on the
>> capabilities checks only being performed at time of initial opening,
>> and *not* on operations performed on the already open FD.
> That won't work for regular map updates either, unfortunately: you still
> have to perform a bpf() syscall to update an element, and that is a
> privileged operation.
>
> You may be able to get around this by using an array map type and
> mmap()'ing the map contents, but I'm not sure how well that will work
> across process boundaries.
>
> If it doesn't, I only see two possibilities: populate the map
> ahead-of-time and leave it in place, or keep the privileged helper
> process around to perform map updates on behalf of QEMU...


Right, and this could be probably done by extending and tracking the RSS 
update via rx filter event.

Thanks


>
> -Toke
>


