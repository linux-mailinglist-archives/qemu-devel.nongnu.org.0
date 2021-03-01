Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D2327EAF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:57:56 +0100 (CET)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGi7W-0003pm-Og
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lGi6b-0003Nf-9W
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lGi6X-00010N-EV
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614603411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lzPkJsUfAafUZBvDfBM2bHYjw+ur27Gj05ySjIhqRC4=;
 b=PnOT7uFErTyTtY/BVw6ck99m8zXLwaBnHO3lg6CBnqgRFjPvP/5irnQ/KeXbmQSLc1CY6C
 jJtbBayjMD8tktmkfuBjsgqQiR7dxYNDcPxYNSccsGYD1bJp5LjWozgCXJGwXAJs7dwPdd
 0ov2oXQmSD37xCWwKesgVVMT2/E75i4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-7VRtEZd0PqqWmObtdXg11w-1; Mon, 01 Mar 2021 07:56:43 -0500
X-MC-Unique: 7VRtEZd0PqqWmObtdXg11w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F131801976
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 12:56:43 +0000 (UTC)
Received: from starship (unknown [10.35.206.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD20160C04;
 Mon,  1 Mar 2021 12:56:41 +0000 (UTC)
Message-ID: <dd9b1ebe28be1df2a4b1715f60d451c0c6fb915f.camel@redhat.com>
Subject: Re: [PATCH] KVM: x86: do not fail if software breakpoint has
 already been removed
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Mon, 01 Mar 2021 14:56:40 +0200
In-Reply-To: <20210301111725.18434-1-pbonzini@redhat.com>
References: <20210301111725.18434-1-pbonzini@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="=-WZJVdcirFrL8Wo0v1HuW"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-WZJVdcirFrL8Wo0v1HuW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-03-01 at 12:17 +0100, Paolo Bonzini wrote:
> If kvm_arch_remove_sw_breakpoint finds that a software breakpoint does not
> have an INT3 instruction, it fails.  This can happen if one sets a
> software breakpoint in a kernel module and then reloads it.  gdb then
> thinks the breakpoint cannot be deleted and there is no way to add it
> back.
> 
> Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 0b5755e42b..c8d61daf68 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -4352,8 +4352,13 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
>  {
>      uint8_t int3;
>  
> -    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0) || int3 != 0xcc ||
> -        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
> +    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0)) {
> +        return -EINVAL;
> +    }
> +    if (int3 != 0xcc) {
> +        return 0;
> +    }
> +    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
>          return -EINVAL;
>      }
>      return 0;

There still remains a philosopical question if kvm_arch_remove_sw_breakpoint
should always return 0, since for the usual case of kernel debugging where
a breakpoint is in unloaded module, the above will probably still fail
as paging for this module is removed as well by the kernel.
It is still better though so:

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Note that I managed to make lx-symbols to work in a very stable way
with attached WIP patch I hacked on this Sunday.
I will send a cleaned up version of it to upstream when I have time.

Since I make gdb unload the symbols, it works even without this patch. 

Added Stefano Garzarella to CC as I know that he tried to make this work as well.
https://lkml.org/lkml/2020/10/5/514


Best regards,
	Maxim Levitsky


--=-WZJVdcirFrL8Wo0v1HuW
Content-Disposition: attachment; filename="fix-lx-symbols.diff"
Content-Type: text/x-patch; name="fix-lx-symbols.diff"; charset="UTF-8"
Content-Transfer-Encoding: base64

Y29tbWl0IDg2ZjBkNWEwOGE0MDUyODM1MDU4OWVkNTQxMjZmMDZkNGFjMjkzYTgKQXV0aG9yOiBN
YXhpbSBMZXZpdHNreSA8bWxldml0c2tAcmVkaGF0LmNvbT4KRGF0ZTogICBTdW4gRmViIDI4IDIz
OjUyOjA4IDIwMjEgKzAyMDAKCiAgICBnZGI6IHJld29yayBnZGIgZGVidWcgc2NyaXB0CiAgICAK
ICAgIFNpZ25lZC1vZmYtYnk6IE1heGltIExldml0c2t5IDxtbGV2aXRza0ByZWRoYXQuY29tPgoK
ZGlmZiAtLWdpdCBhL3NjcmlwdHMvZ2RiL2xpbnV4L3N5bWJvbHMucHkgYi9zY3JpcHRzL2dkYi9s
aW51eC9zeW1ib2xzLnB5CmluZGV4IDFiZTk3NjNjZjhiYi4uMTNmMjFhZmMyMDU5IDEwMDY0NAot
LS0gYS9zY3JpcHRzL2dkYi9saW51eC9zeW1ib2xzLnB5CisrKyBiL3NjcmlwdHMvZ2RiL2xpbnV4
L3N5bWJvbHMucHkKQEAgLTE3LDYgKzE3LDI0IEBAIGltcG9ydCByZQogCiBmcm9tIGxpbnV4IGlt
cG9ydCBtb2R1bGVzLCB1dGlscwogCitkZWYgc2F2ZV9zdGF0ZSgpOgorICAgICAgICBicmVha3Bv
aW50cyA9IFtdCisgICAgICAgIGlmIGhhc2F0dHIoZ2RiLCAnYnJlYWtwb2ludHMnKSBhbmQgbm90
IGdkYi5icmVha3BvaW50cygpIGlzIE5vbmU6CisgICAgICAgICAgICBmb3IgYnAgaW4gZ2RiLmJy
ZWFrcG9pbnRzKCk6CisgICAgICAgICAgICAgICAgYnJlYWtwb2ludHMuYXBwZW5kKHsnYnJlYWtw
b2ludCc6IGJwLCAnZW5hYmxlZCc6IGJwLmVuYWJsZWR9KQorICAgICAgICAgICAgICAgIGJwLmVu
YWJsZWQgPSBGYWxzZQorCisgICAgICAgIHNob3dfcGFnaW5hdGlvbiA9IGdkYi5leGVjdXRlKCJz
aG93IHBhZ2luYXRpb24iLCB0b19zdHJpbmc9VHJ1ZSkKKyAgICAgICAgcGFnaW5hdGlvbiA9IHNo
b3dfcGFnaW5hdGlvbi5lbmRzd2l0aCgib24uXG4iKQorICAgICAgICBnZGIuZXhlY3V0ZSgic2V0
IHBhZ2luYXRpb24gb2ZmIikKKworICAgICAgICByZXR1cm4geyJicmVha3BvaW50cyI6YnJlYWtw
b2ludHMsICJzaG93X3BhZ2luYXRpb24iOiBzaG93X3BhZ2luYXRpb259CisKK2RlZiBsb2FkX3N0
YXRlKHN0YXRlKToKKyAgICBmb3IgYnJlYWtwb2ludCBpbiBzdGF0ZVsiYnJlYWtwb2ludHMiXToK
KyAgICAgICAgYnJlYWtwb2ludFsnYnJlYWtwb2ludCddLmVuYWJsZWQgPSBicmVha3BvaW50Wydl
bmFibGVkJ10KKyAgICBnZGIuZXhlY3V0ZSgic2V0IHBhZ2luYXRpb24gJXMiICUgKCJvbiIgaWYg
c3RhdGVbInNob3dfcGFnaW5hdGlvbiJdIGVsc2UgIm9mZiIpKQorCiAKIGlmIGhhc2F0dHIoZ2Ri
LCAnQnJlYWtwb2ludCcpOgogICAgIGNsYXNzIExvYWRNb2R1bGVCcmVha3BvaW50KGdkYi5CcmVh
a3BvaW50KToKQEAgLTMwLDI2ICs0OCwzOCBAQCBpZiBoYXNhdHRyKGdkYiwgJ0JyZWFrcG9pbnQn
KToKICAgICAgICAgICAgIG1vZHVsZV9uYW1lID0gbW9kdWxlWyduYW1lJ10uc3RyaW5nKCkKICAg
ICAgICAgICAgIGNtZCA9IHNlbGYuZ2RiX2NvbW1hbmQKIAorICAgICAgICAgICAgIyBtb2R1bGUg
YWxyZWFkeSBsb2FkZWQsIGZhbHNlIGFsYXJtCisgICAgICAgICAgICBpZiBtb2R1bGVfbmFtZSBp
biBjbWQubG9hZGVkX21vZHVsZXM6CisgICAgICAgICAgICAgICAgcmV0dXJuIEZhbHNlCisKICAg
ICAgICAgICAgICMgZW5mb3JjZSB1cGRhdGUgaWYgb2JqZWN0IGZpbGUgaXMgbm90IGZvdW5kCiAg
ICAgICAgICAgICBjbWQubW9kdWxlX2ZpbGVzX3VwZGF0ZWQgPSBGYWxzZQogCiAgICAgICAgICAg
ICAjIERpc2FibGUgcGFnaW5hdGlvbiB3aGlsZSByZXBvcnRpbmcgc3ltYm9sIChyZS0pbG9hZGlu
Zy4KICAgICAgICAgICAgICMgVGhlIGNvbnNvbGUgaW5wdXQgaXMgYmxvY2tlZCBpbiB0aGlzIGNv
bnRleHQgc28gdGhhdCB3ZSB3b3VsZAogICAgICAgICAgICAgIyBnZXQgc3R1Y2sgd2FpdGluZyBm
b3IgdGhlIHVzZXIgdG8gYWNrbm93bGVkZ2UgcGFnZWQgb3V0cHV0LgotICAgICAgICAgICAgc2hv
d19wYWdpbmF0aW9uID0gZ2RiLmV4ZWN1dGUoInNob3cgcGFnaW5hdGlvbiIsIHRvX3N0cmluZz1U
cnVlKQotICAgICAgICAgICAgcGFnaW5hdGlvbiA9IHNob3dfcGFnaW5hdGlvbi5lbmRzd2l0aCgi
b24uXG4iKQotICAgICAgICAgICAgZ2RiLmV4ZWN1dGUoInNldCBwYWdpbmF0aW9uIG9mZiIpCisg
ICAgICAgICAgICBzdGF0ZSA9IHNhdmVfc3RhdGUoKQorICAgICAgICAgICAgY21kLmxvYWRfbW9k
dWxlX3N5bWJvbHMobW9kdWxlKQorICAgICAgICAgICAgbG9hZF9zdGF0ZShzdGF0ZSkKKyAgICAg
ICAgICAgIHJldHVybiBGYWxzZQogCi0gICAgICAgICAgICBpZiBtb2R1bGVfbmFtZSBpbiBjbWQu
bG9hZGVkX21vZHVsZXM6Ci0gICAgICAgICAgICAgICAgZ2RiLndyaXRlKCJyZWZyZXNoaW5nIGFs
bCBzeW1ib2xzIHRvIHJlbG9hZCBtb2R1bGUgIgotICAgICAgICAgICAgICAgICAgICAgICAgICAi
J3swfSdcbiIuZm9ybWF0KG1vZHVsZV9uYW1lKSkKLSAgICAgICAgICAgICAgICBjbWQubG9hZF9h
bGxfc3ltYm9scygpCi0gICAgICAgICAgICBlbHNlOgotICAgICAgICAgICAgICAgIGNtZC5sb2Fk
X21vZHVsZV9zeW1ib2xzKG1vZHVsZSkKKyAgICBjbGFzcyBVbkxvYWRNb2R1bGVCcmVha3BvaW50
KGdkYi5CcmVha3BvaW50KToKKyAgICAgICAgZGVmIF9faW5pdF9fKHNlbGYsIHNwZWMsIGdkYl9j
b21tYW5kKToKKyAgICAgICAgICAgIHN1cGVyKFVuTG9hZE1vZHVsZUJyZWFrcG9pbnQsIHNlbGYp
Ll9faW5pdF9fKHNwZWMsIGludGVybmFsPVRydWUpCisgICAgICAgICAgICBzZWxmLnNpbGVudCA9
IFRydWUKKyAgICAgICAgICAgIHNlbGYuZ2RiX2NvbW1hbmQgPSBnZGJfY29tbWFuZAogCi0gICAg
ICAgICAgICAjIHJlc3RvcmUgcGFnaW5hdGlvbiBzdGF0ZQotICAgICAgICAgICAgZ2RiLmV4ZWN1
dGUoInNldCBwYWdpbmF0aW9uICVzIiAlICgib24iIGlmIHBhZ2luYXRpb24gZWxzZSAib2ZmIikp
CisgICAgICAgIGRlZiBzdG9wKHNlbGYpOgorICAgICAgICAgICAgbW9kdWxlID0gZ2RiLnBhcnNl
X2FuZF9ldmFsKCJtb2QiKQorICAgICAgICAgICAgbW9kdWxlX25hbWUgPSBtb2R1bGVbJ25hbWUn
XS5zdHJpbmcoKQorICAgICAgICAgICAgY21kID0gc2VsZi5nZGJfY29tbWFuZAogCisgICAgICAg
ICAgICBpZiBub3QgbW9kdWxlX25hbWUgaW4gY21kLmxvYWRlZF9tb2R1bGVzOgorICAgICAgICAg
ICAgICAgIHJldHVybiBGYWxzZQorCisgICAgICAgICAgICBzdGF0ZSA9IHNhdmVfc3RhdGUoKQor
ICAgICAgICAgICAgY21kLnVubG9hZF9tb2R1bGVfc3ltYm9scyhtb2R1bGUpCisgICAgICAgICAg
ICBsb2FkX3N0YXRlKHN0YXRlKQogICAgICAgICAgICAgcmV0dXJuIEZhbHNlCiAKIApAQCAtNjQs
OCArOTQsOSBAQCBseC1zeW1ib2xzIGNvbW1hbmQuIiIiCiAgICAgbW9kdWxlX3BhdGhzID0gW10K
ICAgICBtb2R1bGVfZmlsZXMgPSBbXQogICAgIG1vZHVsZV9maWxlc191cGRhdGVkID0gRmFsc2UK
LSAgICBsb2FkZWRfbW9kdWxlcyA9IFtdCisgICAgbG9hZGVkX21vZHVsZXMgPSB7fQogICAgIGJy
ZWFrcG9pbnQgPSBOb25lCisgICAgdWJyZWFrcG9pbnQgPSBOb25lCiAKICAgICBkZWYgX19pbml0
X18oc2VsZik6CiAgICAgICAgIHN1cGVyKEx4U3ltYm9scywgc2VsZikuX19pbml0X18oImx4LXN5
bWJvbHMiLCBnZGIuQ09NTUFORF9GSUxFUywKQEAgLTEyOSwyMSArMTYwLDMyIEBAIGx4LXN5bWJv
bHMgY29tbWFuZC4iIiIKICAgICAgICAgICAgICAgICBmaWxlbmFtZT1tb2R1bGVfZmlsZSwKICAg
ICAgICAgICAgICAgICBhZGRyPW1vZHVsZV9hZGRyLAogICAgICAgICAgICAgICAgIHNlY3Rpb25z
PXNlbGYuX3NlY3Rpb25fYXJndW1lbnRzKG1vZHVsZSkpCisKICAgICAgICAgICAgIGdkYi5leGVj
dXRlKGNtZGxpbmUsIHRvX3N0cmluZz1UcnVlKQotICAgICAgICAgICAgaWYgbW9kdWxlX25hbWUg
bm90IGluIHNlbGYubG9hZGVkX21vZHVsZXM6Ci0gICAgICAgICAgICAgICAgc2VsZi5sb2FkZWRf
bW9kdWxlcy5hcHBlbmQobW9kdWxlX25hbWUpCisgICAgICAgICAgICBzZWxmLmxvYWRlZF9tb2R1
bGVzW21vZHVsZV9uYW1lXSA9IHsibW9kdWxlX2ZpbGUiOiBtb2R1bGVfZmlsZSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtb2R1bGVfYWRkciI6IG1v
ZHVsZV9hZGRyfQogICAgICAgICBlbHNlOgogICAgICAgICAgICAgZ2RiLndyaXRlKCJubyBtb2R1
bGUgb2JqZWN0IGZvdW5kIGZvciAnezB9J1xuIi5mb3JtYXQobW9kdWxlX25hbWUpKQogCisgICAg
ZGVmIHVubG9hZF9tb2R1bGVfc3ltYm9scyhzZWxmLCBtb2R1bGUpOgorICAgICAgICBtb2R1bGVf
bmFtZSA9IG1vZHVsZVsnbmFtZSddLnN0cmluZygpCisKKyAgICAgICAgbW9kdWxlX2ZpbGUgPSBz
ZWxmLmxvYWRlZF9tb2R1bGVzW21vZHVsZV9uYW1lXVsibW9kdWxlX2ZpbGUiXQorICAgICAgICBt
b2R1bGVfYWRkciA9IHNlbGYubG9hZGVkX21vZHVsZXNbbW9kdWxlX25hbWVdWyJtb2R1bGVfYWRk
ciJdCisKKyAgICAgICAgZ2RiLndyaXRlKCJ1bmxvYWRpbmcgQHthZGRyfToge2ZpbGVuYW1lfVxu
Ii5mb3JtYXQoCisgICAgICAgICAgICBhZGRyPW1vZHVsZV9hZGRyLCBmaWxlbmFtZT1tb2R1bGVf
ZmlsZSkpCisgICAgICAgIGNtZGxpbmUgPSAicmVtb3ZlLXN5bWJvbC1maWxlIHtmaWxlbmFtZX0i
LmZvcm1hdCgKKyAgICAgICAgICAgIGZpbGVuYW1lPW1vZHVsZV9maWxlKQorCisgICAgICAgIGdk
Yi5leGVjdXRlKGNtZGxpbmUsIHRvX3N0cmluZz1UcnVlKQorICAgICAgICBkZWwgc2VsZi5sb2Fk
ZWRfbW9kdWxlc1ttb2R1bGVfbmFtZV0KKworCiAgICAgZGVmIGxvYWRfYWxsX3N5bWJvbHMoc2Vs
Zik6CiAgICAgICAgIGdkYi53cml0ZSgibG9hZGluZyB2bWxpbnV4XG4iKQogCi0gICAgICAgICMg
RHJvcHBpbmcgc3ltYm9scyB3aWxsIGRpc2FibGUgYWxsIGJyZWFrcG9pbnRzLiBTbyBzYXZlIHRo
ZWlyIHN0YXRlcwotICAgICAgICAjIGFuZCByZXN0b3JlIHRoZW0gYWZ0ZXJ3YXJkLgotICAgICAg
ICBzYXZlZF9zdGF0ZXMgPSBbXQotICAgICAgICBpZiBoYXNhdHRyKGdkYiwgJ2JyZWFrcG9pbnRz
JykgYW5kIG5vdCBnZGIuYnJlYWtwb2ludHMoKSBpcyBOb25lOgotICAgICAgICAgICAgZm9yIGJw
IGluIGdkYi5icmVha3BvaW50cygpOgotICAgICAgICAgICAgICAgIHNhdmVkX3N0YXRlcy5hcHBl
bmQoeydicmVha3BvaW50JzogYnAsICdlbmFibGVkJzogYnAuZW5hYmxlZH0pCisgICAgICAgIHN0
YXRlID0gc2F2ZV9zdGF0ZSgpCiAKICAgICAgICAgIyBkcm9wIGFsbCBjdXJyZW50IHN5bWJvbHMg
YW5kIHJlbG9hZCB2bWxpbnV4CiAgICAgICAgIG9yaWdfdm1saW51eCA9ICd2bWxpbnV4JwpAQCAt
MTUzLDE1ICsxOTUsMTQgQEAgbHgtc3ltYm9scyBjb21tYW5kLiIiIgogICAgICAgICBnZGIuZXhl
Y3V0ZSgic3ltYm9sLWZpbGUiLCB0b19zdHJpbmc9VHJ1ZSkKICAgICAgICAgZ2RiLmV4ZWN1dGUo
InN5bWJvbC1maWxlIHswfSIuZm9ybWF0KG9yaWdfdm1saW51eCkpCiAKLSAgICAgICAgc2VsZi5s
b2FkZWRfbW9kdWxlcyA9IFtdCisgICAgICAgIHNlbGYubG9hZGVkX21vZHVsZXMgPSB7fQogICAg
ICAgICBtb2R1bGVfbGlzdCA9IG1vZHVsZXMubW9kdWxlX2xpc3QoKQogICAgICAgICBpZiBub3Qg
bW9kdWxlX2xpc3Q6CiAgICAgICAgICAgICBnZGIud3JpdGUoIm5vIG1vZHVsZXMgZm91bmRcbiIp
CiAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICBbc2VsZi5sb2FkX21vZHVsZV9zeW1ib2xzKG1v
ZHVsZSkgZm9yIG1vZHVsZSBpbiBtb2R1bGVfbGlzdF0KIAotICAgICAgICBmb3Igc2F2ZWRfc3Rh
dGUgaW4gc2F2ZWRfc3RhdGVzOgotICAgICAgICAgICAgc2F2ZWRfc3RhdGVbJ2JyZWFrcG9pbnQn
XS5lbmFibGVkID0gc2F2ZWRfc3RhdGVbJ2VuYWJsZWQnXQorICAgICAgICBsb2FkX3N0YXRlKHN0
YXRlKQogCiAgICAgZGVmIGludm9rZShzZWxmLCBhcmcsIGZyb21fdHR5KToKICAgICAgICAgc2Vs
Zi5tb2R1bGVfcGF0aHMgPSBbb3MucGF0aC5leHBhbmR1c2VyKHApIGZvciBwIGluIGFyZy5zcGxp
dCgpXQpAQCAtMTc3LDggKzIxOCwxMyBAQCBseC1zeW1ib2xzIGNvbW1hbmQuIiIiCiAgICAgICAg
ICAgICBpZiBzZWxmLmJyZWFrcG9pbnQgaXMgbm90IE5vbmU6CiAgICAgICAgICAgICAgICAgc2Vs
Zi5icmVha3BvaW50LmRlbGV0ZSgpCiAgICAgICAgICAgICAgICAgc2VsZi5icmVha3BvaW50ID0g
Tm9uZQotICAgICAgICAgICAgc2VsZi5icmVha3BvaW50ID0gTG9hZE1vZHVsZUJyZWFrcG9pbnQo
Ci0gICAgICAgICAgICAgICAgImtlcm5lbC9tb2R1bGUuYzpkb19pbml0X21vZHVsZSIsIHNlbGYp
CisgICAgICAgICAgICBzZWxmLmJyZWFrcG9pbnQgPSBMb2FkTW9kdWxlQnJlYWtwb2ludCgia2Vy
bmVsL21vZHVsZS5jOmRvX2luaXRfbW9kdWxlIiwgc2VsZikKKworICAgICAgICAgICAgaWYgc2Vs
Zi51YnJlYWtwb2ludCBpcyBub3QgTm9uZToKKyAgICAgICAgICAgICAgICBzZWxmLnVicmVha3Bv
aW50LmRlbGV0ZSgpCisgICAgICAgICAgICAgICAgc2VsZi51YnJlYWtwb2ludCA9IE5vbmUKKyAg
ICAgICAgICAgIHNlbGYudWJyZWFrcG9pbnQgPSBVbkxvYWRNb2R1bGVCcmVha3BvaW50KCJrZXJu
ZWwvbW9kdWxlLmM6ZnJlZV9tb2R1bGUiLCBzZWxmKQorCiAgICAgICAgIGVsc2U6CiAgICAgICAg
ICAgICBnZGIud3JpdGUoIk5vdGU6IHN5bWJvbCB1cGRhdGUgb24gbW9kdWxlIGxvYWRpbmcgbm90
IHN1cHBvcnRlZCAiCiAgICAgICAgICAgICAgICAgICAgICAgIndpdGggdGhpcyBnZGIgdmVyc2lv
blxuIikK
--=-WZJVdcirFrL8Wo0v1HuW--


