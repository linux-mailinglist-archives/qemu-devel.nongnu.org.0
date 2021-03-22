Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E99343B0D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 08:58:30 +0100 (CET)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOFSG-0003Ye-U2
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 03:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lOFP9-00022n-48
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 03:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lOFP6-0001Tw-Ng
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 03:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616399710;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hztruVF4mejuuV/LmIoB1GaSJGgFI5Eu1b6BoY/FwEE=;
 b=S/k0/Sgz1JHTMhd0y2ij55/RceguP7ifA1yYdAxPQ9DcdBLCNZAS46bhhiajfQT4pVsFkF
 K2p5GSlFw2s2yKSptO2I5mMA8tEoK8Engj8ZpnLEZX3u0ISRrcb+stokZ53iYgE27DR7NC
 28JHrx7KOTLrBrg8LvQT/SKNpZRzkfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-80aQ2DG7MUyDlwD-1N3PfA-1; Mon, 22 Mar 2021 03:55:09 -0400
X-MC-Unique: 80aQ2DG7MUyDlwD-1N3PfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49CEB87A826;
 Mon, 22 Mar 2021 07:55:07 +0000 (UTC)
Received: from [10.64.54.40] (vpn2-54-40.bne.redhat.com [10.64.54.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28692E2E5;
 Mon, 22 Mar 2021 07:55:03 +0000 (UTC)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
 <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
 <CABgObfafUvCAriWa+mFQKL=Js4GGuMrNr3Gw8v2Z+Z=J3xT7XA@mail.gmail.com>
 <fefde0c1-5670-7cd5-4f7c-ab11af6aeb62@linaro.org>
 <CABgObfbG701a-_TB2v7irYe1DpPY-_zExgJ4SPMfyUEJD_2uXw@mail.gmail.com>
 <CABgObfazrLonuARgBUOfOC-13qQ4riKQx14x7uDbWnVba9xzSQ@mail.gmail.com>
 <0cad2de8-1150-be7c-237b-9f3ddea52473@linaro.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <4231d15c-493f-cb3d-39ef-aff40e3618ee@redhat.com>
Date: Mon, 22 Mar 2021 21:54:36 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <0cad2de8-1150-be7c-237b-9f3ddea52473@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: Aldy Hernandez <aldyh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard and Paolo,

On 3/22/21 5:23 AM, Richard Henderson wrote:
> On 3/21/21 11:46 AM, Paolo Bonzini wrote:
>> HRM, what about biting the bullet and making exec-vary.c a C++ source?... Then instead of making it conditional an attribute((alias)), we make it conditional on having a C++ compiler.
> 
> Doesn't help.  The gcc bug I filed talks about c++, because that's the closest analogy.
> 
> But set_preferred_target_page_bits is called *much* later than a constructor. Though still before any use of the variable in question, for which we have an --enable-debug-tcg assertion.
> 

It looks this issue can be avoided after "volatile" is applied to
@target_page. However, I'm not sure if it's the correct fix to have.
If it is, I can post a formal patch so that it can be included.

--- a/exec-vary.c
+++ b/exec-vary.c
-extern const TargetPageBits target_page
+extern const TargetPageBits volatile target_page
      __attribute__((alias("init_target_page")));
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
-extern const TargetPageBits target_page;
+extern const TargetPageBits volatile target_page;


According to the experiments I did, it would be function call
to set_preferred_target_page_bits() is dropped when the machine
is created. The following c files are used in the experiment:

--- a.c ---

static int x;
const extern int VOLATILE y __attribute__((alias("x")));
extern int read_y(void);

void write_x(int val) { x = 1; }
int main(void) { return read_y(); }

--- b.c---

extern const int VOLATILE y;
extern void write_x(int val);

int read_y(void) { write_x(1); return y; }

# gcc a.c b.c -O2 -flto=auto -DVOLATILE= -o a; ./a; echo $?
0
# gdb -nw ./a
(gdb) disassem main
Dump of assembler code for function main:
    0x0000000000400480 <+0>:	adrp	x1, 0x420000 <__libc_start_main@got.plt>
    0x0000000000400484 <+4>:	mov	w2, #0x1                   	// #1
    0x0000000000400488 <+8>:	mov	w0, #0x0                   	// #0
    0x000000000040048c <+12>:	str	w2, [x1, #32]
    0x0000000000400490 <+16>:	ret
End of assembler dump.

# gcc a.c b.c -O2 -flto=auto -DVOLATILE=volatile -o a; ./a; echo $?
1
# gdb -nw ./a
(gdb) disassem main
Dump of assembler code for function main:
    0x0000000000400480 <+0>:	adrp	x1, 0x420000 <__libc_start_main@got.plt>
    0x0000000000400484 <+4>:	mov	w2, #0x1                   	// #1
    0x0000000000400488 <+8>:	adrp	x0, 0x420000 <__libc_start_main@got.plt>
    0x000000000040048c <+12>:	str	w2, [x1, #32]
    0x0000000000400490 <+16>:	ldr	w0, [x0, #32]
    0x0000000000400494 <+20>:	ret


Thanks,
Gavin


