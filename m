Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9D6CEE22
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 17:57:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phY9A-0008EB-Vw; Wed, 29 Mar 2023 11:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1phY98-0008Cl-R6
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:55:34 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1phY96-0004bg-1K
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:55:33 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-536af432ee5so301825437b3.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112; t=1680105327;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5aVFA+I+68jPnv2RjpkDTT3Pax1MwzZBKvdKLU2Sypc=;
 b=qn/Bt33Ko7DaDGX0Xr2k8kKeV7/81h53szxUu8v6TfPKhzYmKzUCbGiSbCIXiFEIFc
 JNtpQwwomDm1V/A52mwNJwjX26xGo/1tzVn7cFszG93/clbIex9yVbwzUIMDDC6Q9Hey
 2z53q+2Lbw2+eH7uiaZfgvENO+XyUO9pN5/okuCgq3G/JycZqdxF6kYxSy1ELcAHA7FF
 TYKYdmVgvqjCdsc/7RNNXdZFvX9QkaDRIOnN/Bmss6jJmNpKSr5OVQYQ1XZZ6bdqj2oT
 8/l+NapjTLTfWeJkUx9ntb9FMV0cmX+S0UXiDj4768MsI1ywKH//NMrG4FoCIHDBlJsP
 64JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680105327;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5aVFA+I+68jPnv2RjpkDTT3Pax1MwzZBKvdKLU2Sypc=;
 b=Q5tptYnwJszMdXw9tZ/o6ikr87qPDyEUV/dfaqJ8pPyukMsa/sPlGQjVijfyh2DTPo
 7ycJtb5N/p/vwmuwv2CSOc6GJGfaZhRFnkMcS9nAO6/xif64fRjU0OavnbN+ZswNUL5M
 AGoTy80frjRqKG/rwG9afBaxq9PDB6o0f8tDiR6TfHx/Jm40UOKmB9iCsSurVC4xu+DQ
 wPgu20VZsrxnO0I/9XUjIsyHxT9jZ3ZHqEcWV9D/6JusoPffgmom/Uk0yirAlC+2e5Bc
 OBmXOu4P+6hkBpQUSMPYYt0fh2GPC9ufDX5wTTdi8EPGfDEiPXCwYi7HkiUinQtX6SMn
 G4Sw==
X-Gm-Message-State: AAQBX9eHxkpiHTMuQ0JbeKy8d0PAoQLQfO3foqGDFCxP10stA7/iBujp
 kbM/wBU2Hot+hiA5O8oxdJbr1A==
X-Google-Smtp-Source: AKy350Yr9BJ+5OXLnjqhyNOxo8o39Fwr189OCQAlphx2B036q4medX5wzsFRi/tmxDJL+Nn4PSeeFQ==
X-Received: by 2002:a0d:fc42:0:b0:544:a053:a826 with SMTP id
 m63-20020a0dfc42000000b00544a053a826mr17545443ywf.49.1680105327557; 
 Wed, 29 Mar 2023 08:55:27 -0700 (PDT)
Received: from [172.16.32.78] ([198.232.126.202])
 by smtp.gmail.com with ESMTPSA id
 cp33-20020a05690c0e2100b00545a08184c6sm3034595ywb.86.2023.03.29.08.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 08:55:27 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------GvkW0wdOrFRDhdT0mwVMsLkg"
Message-ID: <037d00b7-9df9-e888-a4d7-235e6d08f784@landley.net>
Date: Wed, 29 Mar 2023 11:09:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
 <20230320165821.GA4064187@dev-arch.thelio-3990X>
 <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
From: Rob Landley <rob@landley.net>
In-Reply-To: <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
Received-SPF: none client-ip=2607:f8b0:4864:20::1131;
 envelope-from=rob@landley.net; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------GvkW0wdOrFRDhdT0mwVMsLkg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/28/23 12:02, Philippe Mathieu-Daudé wrote:
> On 20/3/23 17:58, Nathan Chancellor wrote:
>> On Wed, Mar 08, 2023 at 12:33:38AM +0100, Philippe Mathieu-Daudé wrote:
>>> On 23/2/23 17:19, Jiaxun Yang wrote:
>>>> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
>>>> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use PCI_HOST_BRIDGE's
>>>> accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
>>>>
>>>> However CFGADDR as a ISD internal register is not controled by MByteSwap
>>>> bit, it follows endian of all other ISD register, which means it ties to
>>>> little endian.
>>>>
>>>> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to disable
>>>> endian-swapping.
>>>>
>>>> This should fix some recent reports about poweroff hang.
>>>>
>>>> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> ---
>>>>    hw/pci-host/gt64120.c | 18 ++++++------------
>>>>    1 file changed, 6 insertions(+), 12 deletions(-)
>>>
>>> So this works on little-endian hosts, but fails on
>>> big-endian ones :(
>>>
>>> I.e. on Linux we have early_console_write() -> prom_putchar()
>>> looping:
>>>
>>> IN: prom_putchar
>>> 0x8010fab8:  lbu	v0,0(v1)
>>> 0x8010fabc:  andi	v0,v0,0x20
>>> 0x8010fac0:  beqz	v0,0x8010fab8
>>> 0x8010fac4:  andi	v0,a0,0xff
>>>
>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>> ...
>>>
>> 
>> Is there going to be a new version of this patch or a different solution
>> to the poweroff hang then? I am still seeing that with tip of tree QEMU
>> and I see 8.0.0-rc0 has been tagged; I would hate for this to end up in
>> a release version.
> 
> I couldn't work a fix, however I ran our (new) tests on merge
> commit 3db29dcac2 which is before the offending commit 145e2198d749,
> and they fail. So I suppose Malta on big-endian host is badly broken
> since quite some time. Thus clearly nobody tests/runs Malta there.

I test/run malta with the mips and mipsel binaries at
https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/ but I'm still
locally applying the first patch I saw to fix this (attached) until upstream
sorts itself out.

Works fine for me. Somebody said it was the wrong fix but I don't remember why...

Rob
--------------GvkW0wdOrFRDhdT0mwVMsLkg
Content-Type: text/x-patch; charset=UTF-8; name="blah.patch"
Content-Disposition: attachment; filename="blah.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2h3L3BjaS1ob3N0L2d0NjQxMjAuYyBiL2h3L3BjaS1ob3N0L2d0NjQx
MjAuYwppbmRleCBmMjI2ZDAzNDIwLi4zNmVkMDFjNjE1IDEwMDY0NAotLS0gYS9ody9wY2kt
aG9zdC9ndDY0MTIwLmMKKysrIGIvaHcvcGNpLWhvc3QvZ3Q2NDEyMC5jCkBAIC0zMjAsMTMg
KzMyMCw2IEBAIHN0YXRpYyB2b2lkIGd0NjQxMjBfaXNkX21hcHBpbmcoR1Q2NDEyMFN0YXRl
ICpzKQogCiBzdGF0aWMgdm9pZCBndDY0MTIwX3VwZGF0ZV9wY2lfY2ZnZGF0YV9tYXBwaW5n
KEdUNjQxMjBTdGF0ZSAqcykKIHsKLSAgICAvKiBJbmRleGVkIG9uIE1CeXRlU3dhcCBiaXQs
IHNlZSBUYWJsZSAxNTg6IFBDSV8wIENvbW1hbmQsIE9mZnNldDogMHhjMDAgKi8KLSAgICBz
dGF0aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzICpwY2lfaG9zdF9jb25mX29wc1tdID0gewot
ICAgICAgICAmcGNpX2hvc3RfY29uZl9iZV9vcHMsICZwY2lfaG9zdF9jb25mX2xlX29wcwot
ICAgIH07Ci0gICAgc3RhdGljIGNvbnN0IE1lbW9yeVJlZ2lvbk9wcyAqcGNpX2hvc3RfZGF0
YV9vcHNbXSA9IHsKLSAgICAgICAgJnBjaV9ob3N0X2RhdGFfYmVfb3BzLCAmcGNpX2hvc3Rf
ZGF0YV9sZV9vcHMKLSAgICB9OwogICAgIFBDSUhvc3RTdGF0ZSAqcGhiID0gUENJX0hPU1Rf
QlJJREdFKHMpOwogCiAgICAgbWVtb3J5X3JlZ2lvbl90cmFuc2FjdGlvbl9iZWdpbigpOwpA
QCAtMzM5LDIyICszMzIsMTMgQEAgc3RhdGljIHZvaWQgZ3Q2NDEyMF91cGRhdGVfcGNpX2Nm
Z2RhdGFfbWFwcGluZyhHVDY0MTIwU3RhdGUgKnMpCiAgICAgICogLSBUYWJsZSAxNjogMzIt
Yml0IFBDSSBUcmFuc2FjdGlvbiBFbmRpYW5lc3MKICAgICAgKiAtIFRhYmxlIDE1ODogUENJ
XzAgQ29tbWFuZCwgT2Zmc2V0OiAweGMwMAogICAgICAqLwotICAgIGlmIChtZW1vcnlfcmVn
aW9uX2lzX21hcHBlZCgmcGhiLT5jb25mX21lbSkpIHsKLSAgICAgICAgbWVtb3J5X3JlZ2lv
bl9kZWxfc3VicmVnaW9uKCZzLT5JU0RfbWVtLCAmcGhiLT5jb25mX21lbSk7Ci0gICAgICAg
IG9iamVjdF91bnBhcmVudChPQkpFQ1QoJnBoYi0+Y29uZl9tZW0pKTsKLSAgICB9Ci0gICAg
bWVtb3J5X3JlZ2lvbl9pbml0X2lvKCZwaGItPmNvbmZfbWVtLCBPQkpFQ1QocGhiKSwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGNpX2hvc3RfY29uZl9vcHNbcy0+cmVnc1tHVF9Q
Q0kwX0NNRF0gJiAxXSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgcywgInBjaS1jb25m
LWlkeCIsIDQpOwotICAgIG1lbW9yeV9yZWdpb25fYWRkX3N1YnJlZ2lvbl9vdmVybGFwKCZz
LT5JU0RfbWVtLCBHVF9QQ0kwX0NGR0FERFIgPDwgMiwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmcGhiLT5jb25mX21lbSwgMSk7Ci0KICAgICBpZiAobWVt
b3J5X3JlZ2lvbl9pc19tYXBwZWQoJnBoYi0+ZGF0YV9tZW0pKSB7CiAgICAgICAgIG1lbW9y
eV9yZWdpb25fZGVsX3N1YnJlZ2lvbigmcy0+SVNEX21lbSwgJnBoYi0+ZGF0YV9tZW0pOwog
ICAgICAgICBvYmplY3RfdW5wYXJlbnQoT0JKRUNUKCZwaGItPmRhdGFfbWVtKSk7CiAgICAg
fQogICAgIG1lbW9yeV9yZWdpb25faW5pdF9pbygmcGhiLT5kYXRhX21lbSwgT0JKRUNUKHBo
YiksCi0gICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV9ob3N0X2RhdGFfb3BzW3MtPnJl
Z3NbR1RfUENJMF9DTURdICYgMV0sCisgICAgICAgICAgICAgICAgICAgICAgICAgIChzLT5y
ZWdzW0dUX1BDSTBfQ01EXSAmIDEpID8gJnBjaV9ob3N0X2RhdGFfbGVfb3BzCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogJnBjaV9o
b3N0X2RhdGFfYmVfb3BzLAogICAgICAgICAgICAgICAgICAgICAgICAgICBzLCAicGNpLWNv
bmYtZGF0YSIsIDQpOwogICAgIG1lbW9yeV9yZWdpb25fYWRkX3N1YnJlZ2lvbl9vdmVybGFw
KCZzLT5JU0RfbWVtLCBHVF9QQ0kwX0NGR0RBVEEgPDwgMiwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmcGhiLT5kYXRhX21lbSwgMSk7CkBAIC0xMjA3LDYg
KzExOTEsMTEgQEAgc3RhdGljIHZvaWQgZ3Q2NDEyMF9yZWFsaXplKERldmljZVN0YXRlICpk
ZXYsIEVycm9yICoqZXJycCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0
X3N5c3RlbV9pbygpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfREVW
Rk4oMTgsIDApLCBUWVBFX1BDSV9CVVMpOwogCisgICAgbWVtb3J5X3JlZ2lvbl9pbml0X2lv
KCZwaGItPmNvbmZfbWVtLCBPQkpFQ1QocGhiKSwgJnBjaV9ob3N0X2NvbmZfbGVfb3BzLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICBzLCAicGNpLWNvbmYtaWR4IiwgNCk7CisgICAg
bWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9uX292ZXJsYXAoJnMtPklTRF9tZW0sIEdUX1BD
STBfQ0ZHQUREUiA8PCAyLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZwaGItPmNvbmZfbWVtLCAxKTsKKwogICAgIHBjaV9jcmVhdGVfc2ltcGxlKHBoYi0+
YnVzLCBQQ0lfREVWRk4oMCwgMCksICJndDY0MTIwX3BjaSIpOwogCiAgICAgLyoK

--------------GvkW0wdOrFRDhdT0mwVMsLkg--

