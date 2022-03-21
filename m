Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E874E3290
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:08:11 +0100 (CET)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQCA-0002pV-En
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:08:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nWQAr-0001R5-2a
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:06:49 -0400
Received: from [2607:f8b0:4864:20::635] (port=36519
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nWQAp-0004R3-Ie
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:06:48 -0400
Received: by mail-pl1-x635.google.com with SMTP id q5so4681023plg.3
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2bnfXbBF+GtABV7TekdcS8ywNlhlzjjtfwzNNUAvbZU=;
 b=YhQl6a0dmNzIoS/RJf/U72upVEm129lZRy+fpmrRDWlj2gC8kVoCCiHOd7F+Qn8w0c
 t317CBAL13gk3J/sEwp3XNVf/QMVST0JJIol+7dwwF1CEWjK74P+QguUpCICkZAoIBJT
 EOYh4d0IkyNf6lJu/IOZYQgr+37wq6EUoyZ75NtBpWWhz+mTD/NUX4YMJ0n8nrqx5zPM
 ZQr5YS3raBcA4r9aFcrUzsRotxCj0PlJXgTbrbcoWEEL0+uqcIUtRAuoLmr7W6vo2imG
 UNgCIYcWgt8dryUF/gRgqQkutzAg6kBVhU5vd/TSsCErCSuLD2q2kuGOjVB/sq0IfX+h
 DLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2bnfXbBF+GtABV7TekdcS8ywNlhlzjjtfwzNNUAvbZU=;
 b=sfsZ7AKXjql19bZ8jL3g30fPS3sIxmh2D6IJwxuGLHUZnZPol4A4AWmRGTZe8CHtAq
 4B6OX8gtjgX2CE16q0QpCOU9812pqUzpGXAGggMN6pq3tSLjGto3jngQsk7Gwp/xhJVh
 Ym7RKZRLbPTsnrg4Y3DQVfSmdVs3bBAYNwJR7UBrY/317HU0hI3maiY0SRAl1Vxj/cuF
 f1hi7i383ht43kRzeEDnKLVX+atUA8LkQPoqFF6mpdunzQ75THMTMaK32qB3+RZGtoyl
 21hPBgo0oXr83rQJMQulw4JkFUx18vGrLoq29bSRcCI9ziy9e2L6+lHoxuU2yRUPAu0Y
 RC9A==
X-Gm-Message-State: AOAM5323yHq1EnITnCQ15xEzTXKB5ERlulP/5SRdyXgN4XIsY2YfwfUM
 1raAPajoLBwb4+n5wT23RgY=
X-Google-Smtp-Source: ABdhPJziEg0hHHZvKpi0xSAoMLh2Nnte4eWxjp0cNaoW2ym1Y2QGelYCN+v4wvy9wRuu4urkFcdLnA==
X-Received: by 2002:a17:903:22ca:b0:154:5625:e0 with SMTP id
 y10-20020a17090322ca00b00154562500e0mr7564482plg.15.1647900405473; 
 Mon, 21 Mar 2022 15:06:45 -0700 (PDT)
Received: from localhost ([192.55.54.52]) by smtp.gmail.com with ESMTPSA id
 u126-20020a637984000000b0038147b4f53esm15129971pgc.93.2022.03.21.15.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 15:06:45 -0700 (PDT)
Date: Mon, 21 Mar 2022 15:06:43 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Message-ID: <20220321220643.GA76113@ls.amr.corp.intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
 <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Philippe Mathieu-Daud??? <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 04:54:51PM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> On 3/18/2022 10:07 PM, Philippe Mathieu-Daudé wrote:
> > Hi,
> > 
> > On 17/3/22 14:58, Xiaoyao Li wrote:
> > > TDX VM needs to boot with Trust Domain Virtual Firmware (TDVF). Unlike
> > > that OVMF is mapped as rom device, TDVF needs to be mapped as private
> > > memory. This is because TDX architecture doesn't provide read-only
> > > capability for VMM, and it doesn't support instruction emulation due
> > > to guest memory and registers are not accessible for VMM.
> > > 
> > > On the other hand, OVMF can work as TDVF, which is usually configured
> > > as pflash device in QEMU. To keep the same usage (QEMU parameter),
> > > introduce ram_mode to pflash for TDVF. When it's creating a TDX VM,
> > > ram_mode will be enabled automatically that map the firmware as RAM.
> > > 
> > > Note, this implies two things:
> > > ?? 1. TDVF (OVMF) is not read-only (write-protected).
> > > 
> > > ?? 2. It doesn't support non-volatile UEFI variables as what pflash
> > > ???????? supports that the change to non-volatile UEFI variables won't get
> > > ???????? synced back to backend vars.fd file.
> > > 
> > > Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> > > ---
> > > ?? hw/block/pflash_cfi01.c | 25 ++++++++++++++++++-------
> > > ?? hw/i386/pc_sysfw.c?????????? | 14 +++++++++++---
> > > ?? 2 files changed, 29 insertions(+), 10 deletions(-)
> > 
> > If you don't need a pflash device, don't use it: simply map your nvram
> > region as ram in your machine. No need to clutter the pflash model like
> > that.
> 
> I know it's dirty to hack the pflash device. The purpose is to make the user
> interface unchanged that people can still use
> 
> 	-drive if=pflash,format=raw,unit=0,file=/path/to/OVMF_CODE.fd
>         -drive if=pflash,format=raw,unit=1,file=/path/to/OVMF_VARS.fd
> 
> to create TD guest.

For the compatibility for qemu command line, you don't have to modify pflash
device.  Don't instantiate pflash at pc_system_flash_create(), and at
pc_system_firmware_init(), you can retrieve necessary parameters, and then
populate memory.  Although it's still hacky, it would be cleaner a bit.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

