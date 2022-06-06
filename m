Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D153E42F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 13:20:03 +0200 (CEST)
Received: from localhost ([::1]:60282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAmA-0007nt-TU
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 07:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyAjs-0006V1-AV
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyAjq-0006XF-HP
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654514257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OT6bcpYsbEHxM9MHMIB6Lz3HLiSkZQr9MRcqr5uLOJY=;
 b=Nn1acpTsZHraFMWKbbWMJMDO+XvV2AFJVU2tT0+Wx2yZ9LFipQ3aV9BPulQxGJeYd6Oqcg
 aw0fAIRKsS/0S04wxMyPLdNAwHkvjalr9JLfR2LncpwvvT4Hp9TTm+iU7ajDAWaQYX6jGN
 GFM79fy1wy7lz9xGuD4oFHqCG3CG+l4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-s0oAY4baO4uAO0StObGSRA-1; Mon, 06 Jun 2022 07:17:36 -0400
X-MC-Unique: s0oAY4baO4uAO0StObGSRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so7590824wms.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 04:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OT6bcpYsbEHxM9MHMIB6Lz3HLiSkZQr9MRcqr5uLOJY=;
 b=l2feDGs8CbDgjhtAiwGZGtn7p7n2+YYe0n541tuRM6me7+r35dyi296qJBRNeSnHj3
 AvNsroh6nj7jwSkC9nR/7s1DFNQ15bY3cqjx08S1cgOebYIUCbeXAdY7pDKse7fSYnBq
 /9DqgJuxT6o33mUJBqgJlM0Y/4Dy+nHisPWTjVKgUyoy8GKS99uxL8bLVC3PqWE6ySGs
 QHafWQ/POVnZP8t7hh22Z2Wll+8hjyVrmxlP6qokMbE0O77oaXBTAoRlGSN6O3ZynVEz
 t3g5ogY9RrgNpLsnLpnsLuucJy6pFaz/pHo1USYpWTnVSSQy7IeRhz18djJh5g/5Z94N
 I9aQ==
X-Gm-Message-State: AOAM531iaJa+Opf2TxtCFGXc92JzjLblKI27r+1L2e4fhlNM+IheSjZS
 NjyhtJ0BcGJgcLrBWxSUIdmQ2QBpap2VTL7GwyoTasGAvsQPpybrSVdXHlKpkzVDJPxC59/CS/D
 lAOZK/6qoTnrg6Ro=
X-Received: by 2002:a05:600c:2312:b0:397:7647:2ac4 with SMTP id
 18-20020a05600c231200b0039776472ac4mr21913935wmo.125.1654514255507; 
 Mon, 06 Jun 2022 04:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB9sW0yMkHvWlUNtbjrYQlP71KAYBVsLcqBkQxeQgTHaxT5LwFwBzHxMURQTr1art04+wMhg==
X-Received: by 2002:a05:600c:2312:b0:397:7647:2ac4 with SMTP id
 18-20020a05600c231200b0039776472ac4mr21913910wmo.125.1654514255200; 
 Mon, 06 Jun 2022 04:17:35 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b0039c4506bd25sm10005964wmq.14.2022.06.06.04.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 04:17:34 -0700 (PDT)
Date: Mon, 6 Jun 2022 12:17:32 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 kwolf@redhat.com, hreitz@redhat.com, maobibo <maobibo@loongson.cn>
Subject: Re: qemu-iotest 267 got a FPE error when TARGET_PAGE_BITS 16K
Message-ID: <Yp3iTLMVHGEAa6pb@work-vm>
References: <60071e6b-35fd-25c7-225d-5bcf71116afb@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60071e6b-35fd-25c7-225d-5bcf71116afb@loongson.cn>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* gaosong (gaosong@loongson.cn) wrote:
> Hi.
>     I run './tests/qemu-iotests/check -qcow2 267 '  got a FPE error on x86
> host emulation LoongArch , The log is :
> 
> ...
> 
> +../migration/ram.c:2205:9: runtime error: division by zero
> +AddressSanitizer:DEADLYSIGNAL

Interesting.

> +=================================================================
> +==1685462==ERROR: AddressSanitizer: FPE on unknown address 0x556e650eed6e
> (pc 0x556e650eed6e bp 0x7ffcba14ae20 sp 0x7ffcba14adc0 T0)
> +    #0 0x556e650eed6d in ram_save_host_page ../migration/ram.c:2205
> +    #1 0x556e650ef78f in ram_find_and_save_block ../migration/ram.c:2284
> +    #2 0x556e650f53a1 in ram_save_iterate ../migration/ram.c:3010
> +    #3 0x556e64c03aa2 in qemu_savevm_state_iterate
> ../migration/savevm.c:1296
> +    #4 0x556e64c06ccc in qemu_savevm_state ../migration/savevm.c:1580
> +    #5 0x556e64c0d497 in save_snapshot ../migration/savevm.c:2889
> +    #6 0x556e64c29221 in hmp_savevm ../monitor/hmp-cmds.c:1095
> +    #7 0x556e64c41b31 in handle_hmp_command_exec ../monitor/hmp.c:1103
> +    #8 0x556e64c4234c in handle_hmp_command ../monitor/hmp.c:1155
> +    #9 0x556e64c38292 in monitor_command_cb ../monitor/hmp.c:49
> +    #10 0x556e6596ceca in readline_handle_byte ../util/readline.c:411
> +    #11 0x556e64c44b78 in monitor_read ../monitor/hmp.c:1393
> +    #12 0x556e656aa41e in qemu_chr_be_write_impl ../chardev/char.c:201
> +    #13 0x556e656aa4c5 in qemu_chr_be_write ../chardev/char.c:213
> +    #14 0x556e656b1302 in fd_chr_read ../chardev/char-fd.c:72
> +    #15 0x556e652b635f in qio_channel_fd_source_dispatch
> ../io/channel-watch.c:84
> +    #16 0x7f2b425c104d in g_main_context_dispatch
> (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x5204d)
> +    #17 0x556e65949fac in glib_pollfds_poll ../util/main-loop.c:297
> +    #18 0x556e6594a18a in os_host_main_loop_wait ../util/main-loop.c:320
> +    #19 0x556e6594a486 in main_loop_wait ../util/main-loop.c:596
> +    #20 0x556e64b2bb6b in qemu_main_loop ../softmmu/runstate.c:726
> +    #21 0x556e64255a69 in qemu_main ../softmmu/main.c:36
> +    #22 0x556e64255a9e in main ../softmmu/main.c:45
> +    #23 0x7f2b40304082 in __libc_start_main ../csu/libc-start.c:308
> +    #24 0x556e6425597d in _start
> (/root/code/github/qemu/build/qemu-system-loongarch64+0x236e97d)
> +
> +AddressSanitizer can not provide additional info.
> +SUMMARY: AddressSanitizer: FPE ../migration/ram.c:2205 in
> ram_save_host_page
> +==1685462==ABORTING
> 
> ...
> 
> the ram.c
> 
> 2199 static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> 2200 {
> 2201     int tmppages, pages = 0;
> 2202     size_t pagesize_bits =
> 2203         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> 2204     unsigned long hostpage_boundary =
> 2205         QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
> 2206     unsigned long start_page = pss->page;
> 2207     int res;
> ...
> 
> qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;   === >  4096 >> 14
> So  QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);  got a FPE error,
> 
> I am not familar with qcow2,   Could you help me?

This is not qcow2, this is general live migration code.

The problem here is that TARGET_PAGE_BITS is set by the target,
but under emulation we're running with the smaller host page size.
That never happens under kvm, but sounds reasonable I guess for
emulation.

Now, I wonder what the fix is? Should we always send and align to the
larger of host page/target page, rather than always host?

Dave


> Steps to reproduce:
> 
> 1  get code
> 
>     git clone https://github.com/loongson/qemu/tree/tcg-dev
> 
> 2  build
> 
>     ./configure   --disable-rdma --disable-pvrdma --prefix=/usr \
>             --target-list="loongarch64-softmmu"  \
>             --disable-libiscsi --disable-libnfs --disable-libpmem \
>             --disable-glusterfs --enable-libusb --enable-usb-redir \
>             --disable-opengl --disable-xen --enable-spice --enable-werror \
>             --disable-capstone --disable-kvm --enable-debug
> --enable-sanitizers
> 
>     cd build
> 
>     make -j32
> 
> 3  test
> 
>     ./tests/qemu-iotests/check -qcow2 267
> 
> 
> Thanks.
> Song Gao
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


