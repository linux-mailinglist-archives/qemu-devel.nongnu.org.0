Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465546AD6F1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZQ70-0003mA-Rg; Tue, 07 Mar 2023 00:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pZQ6x-0003lc-AU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:43:43 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pZQ6v-00083l-73
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:43:42 -0500
Received: by mail-pj1-x1031.google.com with SMTP id x34so12203594pjj.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 21:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678167819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JyZwio1/+xEWEzxkU6lojpUS2ztMZWUFHUjMcU1o9Ac=;
 b=o16eilWBr6zovjyWBhZARYVUNpNVmCZ957WBaB90uj7v0ijWyRBXmC7axWu8HUZPyg
 KqtIzrubb7yLJoVYDDZjm8XSUkAGsxsVMF9j0TaooAIhC06dzpsknR7pU+ntUYNBPIYT
 L7y1UFhH7xiji8e84ojd1iOgzmq/UBxzbkvGoVJ+KKxlHycKVg9CHQ1yapCkzDtiCZXd
 furkDTqHtAcgVuaERH1QSL3vMTrnJZHGg9Rl4Gf9Vz1r5GnKsMD0qQf1lZAVUWBPkp7l
 WKFe79gq/A1iq09ibizZAB9etxoUb6KR8vArQ+xrG08rqo9LuI4R39iZlL6K/d//KcJj
 fk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678167819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JyZwio1/+xEWEzxkU6lojpUS2ztMZWUFHUjMcU1o9Ac=;
 b=J5Ve5Z7UoRaGr/ckYoXx99B2AEADG5HJIAu1NHG5LU2podjK20LHEbpsoVBcmJwqHU
 Dw0YR5+y+yM3WZ05+nrIp1zgu/avKwSGf98rFE9JolkfugGF89flaL6ccwAgwjfMuxCg
 Zfe81koluLzBpL3awJfgKct84qRyns4VdXL9yApqtCfkReeFUCpXVynMu1FH44C7VShb
 b59i47EXHtaezsEzBUHhiiUBUGmeXUzem5scYe2xIMeeZRp7hxBYDtbU1kaLK6kHHxMs
 vNEiwerECiooYTxEFx8k2aSY5cSIGPisCLCkMgtirtb1+Jr6dobZAEvWygfT7ddy5txI
 eadQ==
X-Gm-Message-State: AO0yUKU4697beQZhmt5hv36UnsXx742aqqUsELyqH86N08Ir8Q8fRQDs
 h7+9yZO4YiiQzbTsBwl/M3TKTw==
X-Google-Smtp-Source: AK7set89vFW4+ayrW7cytv4tRdqoqnfUXD2/9IyuD77nfB09OVscnz1hGiNeFSav+nWeZHFOSm9Lqg==
X-Received: by 2002:a05:6a20:7d88:b0:cc:a5d6:4471 with SMTP id
 v8-20020a056a207d8800b000cca5d64471mr17965217pzj.58.1678167819311; 
 Mon, 06 Mar 2023 21:43:39 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 s9-20020aa78d49000000b00593baab06dcsm7141652pfe.198.2023.03.06.21.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 21:43:38 -0800 (PST)
Date: Tue, 7 Mar 2023 11:13:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V2] docs: vhost-user: Add Xen specific memory mapping
 support
Message-ID: <20230307054336.uvky5d7q2qqlxdcv@vireshk-i7>
References: <7c3c120bcf2cf023e873800fd3f55239dd302e38.1678100850.git.viresh.kumar@linaro.org>
 <20230306153451.GB51288@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306153451.GB51288@fedora>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 06-03-23, 10:34, Stefan Hajnoczi wrote:
> On Mon, Mar 06, 2023 at 04:40:24PM +0530, Viresh Kumar wrote:
> > +Xen mmap description
> > +^^^^^^^^^^^^^^^^^^^^
> > +
> > ++-------+-------+
> > +| flags | domid |
> > ++-------+-------+
> > +
> > +:flags: 64-bit bit field
> > +
> > +- Bit 0 is set for Xen foreign memory memory mapping.
> > +- Bit 1 is set for Xen grant memory memory mapping.
> > +- Bit 2 is set if the back-end can directly map additional memory (like
> > +  descriptor buffers or indirect descriptors, which aren't part of already
> > +  shared memory regions) without the need of front-end sending an additional
> > +  memory region first.
> 
> I don't understand what Bit 2 does. Can you rephrase this? It's unclear
> to me how additional memory can be mapped without a memory region
> (especially the fd) is sent?

I (somehow) assumed we will be able to use the same file descriptor
that was shared for the virtqueues memory regions and yes I can see
now why it wouldn't work or create problems.

And I need suggestion now on how to make this work.

With Xen grants, the front end receives grant address from the from
guest kernel, they aren't physical addresses, kind of IOMMU stuff.

The back-end gets access for memory regions of the virtqueues alone
initially.  When the back-end gets a request, it reads the descriptor
and finds the buffer address, which isn't part of already shared
regions. The same happens for descriptor addresses in case indirect
descriptor feature is negotiated.

At this point I was thinking maybe the back-end can simply call the
mmap/ioctl to map the memory, using the file descriptor used for the
virtqueues.

How else can we make this work ? We also need to unmap/remove the
memory region, as soon as the buffer is processed as the grant address
won't be relevant for any subsequent request.

Should I use VHOST_USER_IOTLB_MSG for this ? I did look at it and I
wasn't convinced if it was an exact fit. For example it says that a
memory address reported with miss/access fail should be part of an
already sent memory region, which isn't the case here.

> This message modifies the behavior of subsequent
> VHOST_USER_SET_MEM_TABLE and VHOST_USER_ADD_MEM_REG messages. The memory
> region structs can be extended and then VHOST_USER_SET_XEN_MMAP isn't
> needed.
> 
> In other words:
> 
>   When VHOST_USER_PROTOCOL_F_XEN_MMAP is negotiated, each "Memory
>   regions description" and "Single memory region description" has the
>   following additional fields appended:
> 
>   +----------------+-------+
>   | xen_mmap_flags | domid |
>   +----------------+-------+

This looks fine.

-- 
viresh

