Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35852A47C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:14:25 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxxw-0005Nj-MK
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqxeS-0006HH-WD
 for qemu-devel@nongnu.org; Tue, 17 May 2022 09:54:17 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqxeN-0001fP-A2
 for qemu-devel@nongnu.org; Tue, 17 May 2022 09:54:13 -0400
Received: by mail-ed1-x52f.google.com with SMTP id eg11so8690790edb.11
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MkDvTIV/3EID0XQH3w2iUU+VlbIE5bY2ysMzmF8esOY=;
 b=NMCdL/EVpSQLC4iGHD7mB8QRxyMDPoheef/UffnTTGIn9AFHJMDxu6ZR1KIiv3UnF7
 SZKQZK8ohK1izzWq0sR8XkRgCdEO5h1rAmSD6+Cqf8JJoukSsNUmt4KeKClcLbdnGoRj
 Wac/vy0pyeNP5XlCnhE1jqDNxHmzyhac31wylG5kjxMy6seCfCt1X8OUf/ZDuYRnunHN
 u+W6Ov2r6IMJD55FWE7b4yicJ9xenk6SSkFkS9w8nVeecjBXo9rmCb1UJzVlL4y46CGd
 TCEzJ+cQW5DcMut0P2mXbi9/G2fQQShwWx/dkeHCJc/T25z3vzowzUVM9Cf7sl6nsICr
 X+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MkDvTIV/3EID0XQH3w2iUU+VlbIE5bY2ysMzmF8esOY=;
 b=an89VkMRVOBtU2/5HSpz5HTn6FB/dZ+M0zSYl7OyNSHb1Yt4m3jAy4HGa727eQFrLe
 t/GIqmyqQzAX0q0yLAA0vgOEYG/G6kBPB4y5VCIUjjIjAG9yZpuIUHrqnSNTRtDX0vLR
 rYXwkXTab77aiWEIk4LODl0L9wCqB7js+NWrziUVnhvoPm3v8utrv6rHSH7zhgMpHs7h
 bTI3qzFmGP9toERW+8JNUtuAim67NdKriajU1+F5DVJnR55we83qg+bvOuB5fbwHzxKo
 5prvAuJ2M1MkSKjhElMOUSn9zKr12B78yzC1Bda/WyYat+y6+fFwL6MxZXtvTapq1edo
 1ePg==
X-Gm-Message-State: AOAM530jCmzC1wM/Wf/dzH/JgRQe4++pXw/j744wzlDN4KdclEPN1kSo
 8462df6ZvW/oBc6xx4J8F1o=
X-Google-Smtp-Source: ABdhPJysolnXD0oyYlhO1MkQglBHEuZgok3+6mymhhsHH0qZt48IySoqFvlrnUNxc5M0tMVjlq4bXA==
X-Received: by 2002:aa7:de8a:0:b0:42a:b51a:554c with SMTP id
 j10-20020aa7de8a000000b0042ab51a554cmr9780004edv.318.1652795648900; 
 Tue, 17 May 2022 06:54:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 e10-20020a170906748a00b006f3ef214e08sm1120723ejl.110.2022.05.17.06.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 06:54:08 -0700 (PDT)
Message-ID: <fb522282-c750-2652-2e27-87c68819100b@redhat.com>
Date: Tue, 17 May 2022 15:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Accelerating non-standard disk types
Content-Language: en-US
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "alexis.lescout@nutanix.com" <alexis.lescout@nutanix.com>,
 Felipe Franciosi <felipe@nutanix.com>, "mst@redhat.com" <mst@redhat.com>
References: <20220516173831.GB13284@raphael-debian-dev>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220516173831.GB13284@raphael-debian-dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/22 19:38, Raphael Norwitz wrote:
> [1] Keep using the SCSI translation in QEMU but back vDisks with a
> vhost-user-scsi or vhost-user-blk backend device.
> [2] Implement SATA and IDE emulation with vfio-user (likely with an SPDK
> client?).
> [3] We've also been looking at your libblkio library. From your
> description in
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg06146.html  it
> sounds like it may definitely play a role here, and possibly provide the
> nessesary abstractions to back I/O from these emulated disks to any
> backends we may want?

First of all: have you benchmarked it?  How much time is spent on MMIO 
vs. disk I/O?

Of the options above, the most interesting to me is to implement a 
vhost-user-blk/vhost-user-scsi backend in QEMU, similar to the NVMe one, 
that would translate I/O submissions to virtqueue (including polling and 
the like) and could be used with SATA.

For IDE specifically, I'm not sure how much it can be sped up since it 
has only 1 in-flight operation.  I think using KVM coalesced I/O could 
provide an interesting boost (assuming instant or near-instant reply 
from the backend).  If all you're interested in however is not really 
performance, but rather having a single "connection" to your back end, 
vhost-user is certainly an option.

Paolo

