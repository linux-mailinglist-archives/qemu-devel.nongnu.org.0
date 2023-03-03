Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0A6A9233
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:12:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0Vd-0000vp-33; Fri, 03 Mar 2023 03:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pY0VY-0000pg-AJ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:11:16 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pY0VW-0004Ty-Kn
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:11:16 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so5357631pjb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677831073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4fvhd/CjcSxSDcDRaW2+sffBUEEjHgUO/YNJh3LIGeo=;
 b=HWRZF9hxScmW5iNVhnA8nAdnjUV6HaZ4NNs9hVYHU4ExCJm/ruch/KRQ4C4Ir4XSB6
 0b8wdSB4PvAEP97c2UBGYBVjqrNhs5YRPgq4FI2lNbjlhPeYnXWBcrFxNroCEncx4myB
 kXoDLNq1NYfiv1HAoW0xj1dUKeckHkBa1AnTIlvodsUO6gD+xKyhi994UetnvuKmBrmY
 udRlWHSFPGGxmjgx1ME2tLZB61VRW3Ybo05M4NscauQHokML6kT35W5Oi2fnwWK2Nzsi
 JeJ9+adFdCr0tcdYwmM7s6nKd9iombVLXAfxd2jX1wbY3laZJQI1V5Nae7DRnAa3yPkj
 KGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677831073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fvhd/CjcSxSDcDRaW2+sffBUEEjHgUO/YNJh3LIGeo=;
 b=ArpDCsK0ZDt0hKtrxh5tQkyktWCshtjppXYNgS6hqzdV6d/0elpGu4cTPw/dyJWigo
 Ack5/J1jpIFQ8eB61WeBjvuXO5oUC5+13DiIx3dYfIYHtpHhZwO91u7IYYb25sGbAc37
 d9doJSPMEbXpOhMpe12q3NKxVI6EPz8S1HtMjb0xXDxkhzQMwEjXfClqj0XtPV0aOWhi
 Usv8Q5Kcg5yS+liVXeeIrHm5N6CkYSu1ohQ6RR7BBcXW8z3oMEsWSA3HXeYOqURtCTMA
 rBY2A3SUUva7bbMbxJOplbB3TK8RJmU0d5pdMsQGxA/H1H3gMrrvxvsUuNoqKO4WZ07v
 9JAw==
X-Gm-Message-State: AO0yUKW4KkiGv7/2A6Z+YemjRwrAnu71UeMcXB1Dkb1/qXOn1wTwYV5c
 LhYNW4nFsuU1R4Gd2glns6uXLA==
X-Google-Smtp-Source: AK7set9pwBoUqmQ648WFuJ9eNFtOCWgufbD4voyt0olq5F6HoZcChJO6380uERtNwEr//sigsXtTHg==
X-Received: by 2002:a17:902:e745:b0:19c:eaab:653d with SMTP id
 p5-20020a170902e74500b0019ceaab653dmr5095605plf.15.1677831072831; 
 Fri, 03 Mar 2023 00:11:12 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170902aa4a00b0019e8915b1b5sm915163plr.105.2023.03.03.00.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:11:12 -0800 (PST)
Date: Fri, 3 Mar 2023 13:41:10 +0530
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
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
 mapping support
Message-ID: <20230303081110.e6waldur3i7lzl6e@vireshk-i7>
References: <Y/9zkDAS4odz93GM@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/9zkDAS4odz93GM@fedora>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102c.google.com
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

On 01-03-23, 10:47, Stefan Hajnoczi wrote:
> Resend - for some reason my email didn't make it out.

How about this (will send a formal patch later).

Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Tue Feb 21 14:36:30 2023 +0530

    docs: vhost-user: Add Xen specific memory mapping support

    The current model of memory mapping at the back-end works fine where a
    standard call to mmap() (for the respective file descriptor) is enough
    before the front-end can start accessing the guest memory.

    There are other complex cases though where the back-end needs more
    information and simple mmap() isn't enough. For example Xen, a type-1
    hypervisor, currently supports memory mapping via two different methods,
    foreign-mapping (via /dev/privcmd) and grant-dev (via /dev/gntdev). In
    both these cases, the back-end needs to call mmap() and ioctl(), and
    need to pass extra information via the ioctl(), like the Xen domain-id
    of the guest whose memory we are trying to map.

    Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
    the back-end know about the additional memory mapping requirements.
    When this feature is negotiated, the front-end can send the
    'VHOST_USER_SET_XEN_MMAP' message type to provide the additional
    information to the back-end.

    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/interop/vhost-user.rst | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3f18ab424eb0..8be5f5eae941 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -258,6 +258,24 @@ Inflight description

 :queue size: a 16-bit size of virtqueues

+Xen mmap description
+^^^^^^^^^^^^^^^^^^^^
+
++-------+-------+
+| flags | domid |
++-------+-------+
+
+:flags: 64-bit bit field
+
+- Bit 0 is set for Xen foreign memory memory mapping.
+- Bit 1 is set for Xen grant memory memory mapping.
+- Bit 2 is set if the back-end can directly map additional memory (like
+  descriptor buffers or indirect descriptors, which aren't part of already
+  shared memory regions) without the need of front-end sending an additional
+  memory region first.
+
+:domid: a 64-bit Xen hypervisor specific domain id.
+
 C structure
 -----------

@@ -867,6 +885,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_XEN_MMAP             17

 Front-end message types
 -----------------------
@@ -1422,6 +1441,23 @@ Front-end message types
   query the back-end for its device status as defined in the Virtio
   specification.

+``VHOST_USER_SET_XEN_MMAP``
+  :id: 41
+  :equivalent ioctl: N/A
+  :request payload: Xen mmap description
+  :reply payload: N/A
+
+  When the ``VHOST_USER_PROTOCOL_F_XEN_MMAP`` protocol feature has been
+  successfully negotiated, this message is submitted by the front-end to set the
+  Xen hypervisor specific memory mapping configurations at the back-end.  These
+  configurations should be used to mmap memory regions, virtqueues, descriptors
+  and descriptor buffers. The front-end must send this message before any
+  memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_TABLE`` or
+  ``VHOST_USER_ADD_MEM_REG`` message types. The front-end can send this message
+  multiple times, if different mmap configurations are required for different
+  memory regions, where the most recent ``VHOST_USER_SET_XEN_MMAP`` must be used
+  by the back-end to map any newly shared memory regions.
+

 Back-end message types
 ----------------------

-- 
viresh

