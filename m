Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1B02C7D0C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 03:57:35 +0100 (CET)
Received: from localhost ([::1]:54336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZNe-0004pg-KG
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 21:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kjZKb-0001en-Ck
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:54:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kjZKZ-0002da-AO
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606704861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OutxGzrlQ89QwrGTFix3qrlm1+y5j8Ef7R7zUBozYyE=;
 b=PHKjDtycLWxKa+FzhbGVmtbNUhpGJwwsZ3AaTpRuZVPVbHtQb0gxjsjp2Wr/t4FOXze27l
 s0cM/Vx4lkXx/8aPgBG/ySXvUKEqDAUYfQIJvoSlKTJAymowU9xZKRjRC3iXFZFjaf8FL/
 7BxscUPCCK6E/MYxLvhGuF8cOQjb2O4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-pHoI9c1INk2sFQVSkLrwpQ-1; Sun, 29 Nov 2020 21:54:20 -0500
X-MC-Unique: pHoI9c1INk2sFQVSkLrwpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C50E80F040;
 Mon, 30 Nov 2020 02:54:19 +0000 (UTC)
Received: from [10.72.13.173] (ovpn-13-173.pek2.redhat.com [10.72.13.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 713885C1BB;
 Mon, 30 Nov 2020 02:54:14 +0000 (UTC)
Subject: Re: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20201119111305.485202-1-andrew@daynix.com>
 <b7a7d4c2-d8ef-d9fe-22c7-fd5c42aef360@redhat.com>
 <CAOEp5OeF8qZ0hbMV3KGZHS0RqTjjefGiFkLdOd2-pU37JZ54Fg@mail.gmail.com>
 <12187c50-94ce-e456-4c48-5497f2f2caee@redhat.com>
 <CAOEp5Oc=v_FPE+ik=X8UnPzOmEHBXRQGYsq1PPkUUCEeecNarA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <eb2f83b5-1eba-1aa9-af3d-0044b8731a91@redhat.com>
Date: Mon, 30 Nov 2020 10:54:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOEp5Oc=v_FPE+ik=X8UnPzOmEHBXRQGYsq1PPkUUCEeecNarA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/27 下午2:06, Yuri Benditovich wrote:
>
>
>     > After some experiments we can see that stripping of debug sections
>     > reduces the size of
>     > ELF from ~45K to ~20K (we tried to strip more but the libbpf
>     fails to
>     > load it, libbpf needs BTF and symbols)
>     > So I suggest to reevaluate the necessity of libbpf.
>     > For this specific BPF it does not present advantage and we
>     hardly can
>     > create some reusable code
>     > related to libbpf, i.e. any further BPF will need its own libbpf
>     wrapper.
>     > The BTF is really good feature and in case some later BPF will
>     need an
>     > access to kernel
>     > structures it will use libbpf loader.
>     > What you think about it?
>
>
>     If we can find a way to use BTF without libbpf, it should be
>     acceptable.
>
> But the point is that the RSS BPF does not need the BTF as it does not 
> use any kernel structures.


Kinds of, it tries to access skb. But yes, it doesn't access any 
metadata of skb.


> When we have, for example, filter BPF that will need the BTF - we'll  
> use libbpf for it.
> Anyway we do not have here any infrastructural code related to libbpf,


Right, so I think we can probably start from a non BTF version without 
libbpf. And adding other features on top.

Thanks


