Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B8402B03
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:47:45 +0200 (CEST)
Received: from localhost ([::1]:42404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcO0-00035D-A1
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNcLS-0001GC-ML; Tue, 07 Sep 2021 10:45:07 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNcLP-0005Qc-SX; Tue, 07 Sep 2021 10:45:06 -0400
Received: by mail-wm1-x336.google.com with SMTP id g135so7047825wme.5;
 Tue, 07 Sep 2021 07:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4cUyB+jjoicc+6VKMgElRtmAYhSjhZwvIUpwcJJpYdg=;
 b=ZkoomSacSjML/EzdisQAdxzmbh8RfKLNxX0Qv7uBObtYmsumh1SvU7v+z7Jr80KQiQ
 +8gn7VWi3EX2laxo8Udu01qaO4P8p/bPvIV4Be7f+6BzCvq20obf1GnPjoSwo+nl3vU7
 0HmDbMSBy15SaoFdpvikatyhAM4VWSJnG7UG4awEn2B1fYPCcz2s7i4lN5iB0DswaOPV
 iGrxJiO4Unaufg6bNGzEAbUMJZTyqOWGpuHK+OVXVEYD5C1o+EoRn2kaRjL6YsEW7SES
 DpWzOQXqf3LcJO7oiLDzOxpN00sPMFAmc7ip1G3qaSPY0OAXtu6ZuwFRaAdKuK8GCT8O
 eo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4cUyB+jjoicc+6VKMgElRtmAYhSjhZwvIUpwcJJpYdg=;
 b=aDdc9a3g7vCVcP3EtlYnfoT9maqWAuqawDQkuBv37rPxn4O9ZHjvQbeRIi/0IEEKvh
 fH34lM7JlVSZMVOQJ75LI+chnZdlqZlN2NprSXximG/MvYPd8+qFS9VBi90wfkRSrC7S
 LPIieC94jc8H8xGeLzGGejZpQ6z/5pwSpQUMBHpUTBoqvZUCYqSP4etUnIN/exdJKsdN
 GNujncKtLIL3vaH3RMSuEFy07bhvA2XbZLP0bSxkxuBxfw1YK5yKxz5+5NAMQqZ967FN
 iHqbo8GHKeWVs1Ma98gADGE0patzr4Vl9A6mrwnA5oI7NFp1ZncMzNAdZ9zLMvj6S7sv
 5kDA==
X-Gm-Message-State: AOAM532ElbfQzp3usyDSVFomREH+upnm0XdcecRl2TKAM/PP8u02An8w
 l80h3RpTaENE85JU1SwYKHo=
X-Google-Smtp-Source: ABdhPJzaCtHJl244QhwigsJ4LNSlZN4ewcTIdqmjzRXAYrjQKTWU8JoHeXvGsr5nugu1wHekODLqKQ==
X-Received: by 2002:a05:600c:3543:: with SMTP id
 i3mr4450228wmq.2.1631025901748; 
 Tue, 07 Sep 2021 07:45:01 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id i11sm2133229wrb.48.2021.09.07.07.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 07:45:00 -0700 (PDT)
Subject: Re: [PATCH 0/4] hw/block/pflash_cfi01: Remove
 pflash_cfi01_get_memory()
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210307222625.347268-1-f4bug@amsat.org>
 <6f13948a-1a33-1eb3-90d0-106afbb2caf8@redhat.com>
 <CAFEAcA_nMogdN-Q7Z7S=5BY6RWKDq0jnHya5BaoUe+6n8oKWYQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <db4abdf8-bbc7-ae63-a7a7-8496a4ed8dbd@amsat.org>
Date: Tue, 7 Sep 2021 16:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_nMogdN-Q7Z7S=5BY6RWKDq0jnHya5BaoUe+6n8oKWYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 1:08 PM, Peter Maydell wrote:
> On Mon, 15 Mar 2021 at 11:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> On 07/03/21 23:26, Philippe Mathieu-Daudé wrote:
>>> TYPE_PFLASH_CFI01 is a TYPE_SYS_BUS_DEVICE which registers its romd
>>> MemoryRegion with sysbus_init_mmio(), so we can use the generic
>>> sysbus_mmio_get_region() to get the region, no need for a specific
>>> pflash_cfi01_get_memory() helper.
>>>
>>> First replace the few pflash_cfi01_get_memory() uses by
>>> sysbus_mmio_get_region(), then remove the now unused helper.
>>
>> Why is this an improvement?  You're replacing nice and readable code
>> with an implementation-dependent function whose second argument is a
>> magic number.  The right patch would _add_ more of these helpers, not
>> remove them.
> 
> I agree that sysbus_mmio_get_region()'s use of arbitrary
> integers is unfortunate (we should look at improving that
> to use usefully named regions I guess), but I don't see
> why pflash_cfi01 should expose its MemoryRegion to users
> in a different way to every other sysbus device.

It is used that way (x86/pc):

        if (i == 0) {
            flash_mem = pflash_cfi01_get_memory(system_flash);
            pc_isa_bios_init(rom_memory, flash_mem, size);

            /* Encrypt the pflash boot ROM */
            if (sev_enabled()) {
                flash_ptr = memory_region_get_ram_ptr(flash_mem);
                flash_size = memory_region_size(flash_mem);
                /*
                 * OVMF places a GUIDed structures in the flash, so
                 * search for them
                 */
                pc_system_parse_ovmf_flash(flash_ptr, flash_size);

                ret = sev_es_save_reset_vector(flash_ptr, flash_size);

The problems I see:

- pflash_cfi01_get_memory() doesn't really document what it returns,
  simply an internal MemoryRegion* in pflash device. Neither we
  document this is a ROMD device providing a RAM buffer initialized
  by qemu_ram_alloc().

- to update the flash content, we get the internal buffer via
  memory_region_get_ram_ptr(). If the pflash implementation is
  changed (.i.e. reworked to expose a MR container) we break
  everything.

- memory_region_get_ram_ptr() doesn't do any check on the MR type,
  it simply calls qemu_map_ram_ptr(mr->ram_block, offset).

I agree with Peter pflash_cfi01_get_memory() has nothing special.

Now what if we want a safer function to access pflash internal
buffer, I'd prefer we use an explicit function such:

  /**
   * pflash_cfi01_get_ram_ptr_size: Return information on eventual RAMBlock
   *                                associated with the device
   *
   * @pfl: the flash device being queried.
   * @ptr: optional pointer to hold the ram address associated with the
RAMBlock
   * @size: optional pointer to hold length of the RAMBlock
   * Return %true on success, %false on failure.
   */
  bool pflash_cfi01_get_ram_ptr_size(PFlashCFI01 *pfl,
                                     void **ptr, uint64_t *size);

Thoughts?

