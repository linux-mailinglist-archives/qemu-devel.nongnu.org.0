Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA00340D81
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:47:48 +0100 (CET)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxgR-0003vK-Ex
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxdM-0002Py-FH
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:44:36 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:38526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxdE-0005U5-C9
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:44:31 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so6146118otk.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yc6j7MhZpAOLd1UxZwM1AlC3jnPO4KZgBzi2aLv9CQg=;
 b=x9B6myrST2yXcsBS8TjZai53QNR2/9q+4mezxW99Ugi+eAmrWInpFz1YptvjHJiUpu
 le6jMSlFOuEOF+ncnnGWmHQIZT5lriLK4LsDfMJlSOvTngn0wCq99JlhfWcHc1k24E0K
 YRkCLwEfycWRcscgOYIqRCe3ulV38vfs8Z3PDGWj6VKjVGPJSLZlXZ/a6ifLru2kpl2T
 /Ma+ipKLEQPV1SKbqVDVTQndksEfu+DI5h+CME8RbJLx11ZC9XNFiD0Vt8BkhlrB/YZQ
 JkBmrUQEFPAFKovV55xUUzgX5SiGhDMgZ8e/VIO5auNLtzNF1JQYyXzWv9YSdMwRTwG5
 4LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yc6j7MhZpAOLd1UxZwM1AlC3jnPO4KZgBzi2aLv9CQg=;
 b=tYDsIa8WqUE1smPlUXzLx0CpUC1HTH45MmImsFbMzE925iFU35AutTgVMgIXXVSTCR
 gbrw+obdzzdJq1TlUuXj2TnMOHuZ1Sxqq+4PzUlouz+wao0xdYsamMuIlHFta1uQCs1C
 pughnrsesg7sKO9Kse9qeKY8ZOakefoGnn3CsrNCBKQkPuDR9T5Vet+55nDZz2Mu3WlJ
 o54fWEHm1JwyPnlOzV12qc16obQkLCxU1RCyTd9/ESdOJIDwSjfwwnjq2rRQUpQnqmFV
 m/qqBtbWyZqkFi1TkHFISqIL1T0eevEjxAPoZ8VTgXKkOUBEEjga/dINeAQxcwIotCwj
 EA6Q==
X-Gm-Message-State: AOAM532BFbpMo96G4RJ5FgByCuO28DHse93PMxaQ2ZrIVYuCfMo4JyRI
 rPpjNEs48T8NaFlykN1pGR5vDg==
X-Google-Smtp-Source: ABdhPJw8mY8sOLpZdwz8tGxBY010hrtGMeK5LLVIFMsS/57SCvKB8OHDd94WN4l1K3CW5ahpAQ5Y6g==
X-Received: by 2002:a9d:22e2:: with SMTP id y89mr7896025ota.15.1616093064674; 
 Thu, 18 Mar 2021 11:44:24 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c205sm707733oib.40.2021.03.18.11.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:44:24 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 4/5] hw/core/loader: Add new function
 rom_ptr_for_as()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
Date: Thu, 18 Mar 2021 12:44:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:48 AM, Peter Maydell wrote:
> For accesses to rom blob data before or during reset, we have a
> function rom_ptr() which looks for a rom blob that would be loaded to
> the specified address, and returns a pointer into the rom blob data
> corresponding to that address.  This allows board or CPU code to say
> "what is the data that is going to be loaded to this address?".
> 
> However, this function does not take account of memory region
> aliases.  If for instance a machine model has RAM at address
> 0x0000_0000 which is aliased to also appear at 0x1000_0000, a
> rom_ptr() query for address 0x0000_0000 will only return a match if
> the guest image provided by the user was loaded at 0x0000_0000 and
> not if it was loaded at 0x1000_0000, even though they are the same
> RAM and a run-time guest CPU read of 0x0000_0000 will read the data
> loaded to 0x1000_0000.
> 
> Provide a new function rom_ptr_for_as() which takes an AddressSpace
> argument, so that it can check whether the MemoryRegion corresponding
> to the address is also mapped anywhere else in the AddressSpace and
> look for rom blobs that loaded to that alias.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/loader.h | 31 +++++++++++++++++++
>   hw/core/loader.c    | 75 +++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 106 insertions(+)
> 
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index a9eeea39521..cbfc1848737 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -290,6 +290,37 @@ void rom_transaction_end(bool commit);
>   
>   int rom_copy(uint8_t *dest, hwaddr addr, size_t size);
>   void *rom_ptr(hwaddr addr, size_t size);
> +/**
> + * rom_ptr_for_as: Return a pointer to ROM blob data for the address
> + * @as: AddressSpace to look for the ROM blob in
> + * @addr: Address within @as
> + * @size: size of data required in bytes
> + *
> + * Returns: pointer into the data which backs the matching ROM blob,
> + * or NULL if no blob covers the address range.
> + *
> + * This function looks for a ROM blob which covers the specified range
> + * of bytes of length @size starting at @addr within the address space
> + * @as. This is useful for code which runs as part of board
> + * initialization or CPU reset which wants to read data that is part
> + * of a user-supplied guest image or other guest memory contents, but
> + * which runs before the ROM loader's reset function has copied the
> + * blobs into guest memory.
> + *
> + * rom_ptr_for_as() will look not just for blobs loaded directly to
> + * the specified address, but also for blobs which were loaded to an
> + * alias of the region at a different location in the AddressSpace.
> + * In other words, if a machine model has RAM at address 0x0000_0000
> + * which is aliased to also appear at 0x1000_0000, rom_ptr_for_as()
> + * will return the correct data whether the guest image was linked and
> + * loaded at 0x0000_0000 or 0x1000_0000.  Contrast rom_ptr(), which
> + * will only return data if the image load address is an exact match
> + * with the queried address.
> + *
> + * New code should prefer to use rom_ptr_for_as() instead of
> + * rom_ptr().
> + */
> +void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size);
>   void hmp_info_roms(Monitor *mon, const QDict *qdict);
>   
>   #define rom_add_file_fixed(_f, _a, _i)          \
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 9feca32de98..d3e5f3b423f 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -1383,6 +1383,81 @@ void *rom_ptr(hwaddr addr, size_t size)
>       return rom->data + (addr - rom->addr);
>   }
>   
> +typedef struct FindRomCBData {
> +    size_t size; /* Amount of data we want from ROM, in bytes */
> +    MemoryRegion *mr; /* MR at the unaliased guest addr */
> +    hwaddr xlat; /* Offset of addr within mr */
> +    void *rom; /* Output: rom data pointer, if found */
> +} FindRomCBData;
> +
> +static bool find_rom_cb(Int128 start, Int128 len, const MemoryRegion *mr,
> +                        hwaddr offset_in_region, void *opaque)
> +{
> +    FindRomCBData *cbdata = opaque;
> +    hwaddr alias_addr;
> +
> +    if (mr != cbdata->mr) {
> +        return false;
> +    }
> +
> +    alias_addr = int128_get64(start) + cbdata->xlat - offset_in_region;
> +    cbdata->rom = rom_ptr(alias_addr, cbdata->size);
> +    if (!cbdata->rom) {
> +        return false;
> +    }
> +    /* Found a match, stop iterating */
> +    return true;
> +}
> +
> +void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size)
> +{
> +    /*
> +     * Find any ROM data for the given guest address range.  If there
> +     * is a ROM blob then return a pointer to the host memory
> +     * corresponding to 'addr'; otherwise return NULL.
> +     *
> +     * We look not only for ROM blobs that were loaded directly to
> +     * addr, but also for ROM blobs that were loaded to aliases of
> +     * that memory at other addresses within the AddressSpace.
> +     *
> +     * Note that we do not check @as against the 'as' member in the
> +     * 'struct Rom' returned by rom_ptr(). The Rom::as is the
> +     * AddressSpace which the rom blob should be written to, whereas
> +     * our @as argument is the AddressSpace which we are (effectively)
> +     * reading from, and the same underlying RAM will often be visible
> +     * in multiple AddressSpaces. (A common example is a ROM blob
> +     * written to the 'system' address space but then read back via a
> +     * CPU's cpu->as pointer.) This does mean we might potentially
> +     * return a false-positive match if a ROM blob was loaded into an
> +     * AS which is entirely separate and distinct from the one we're
> +     * querying, but this issue exists also for rom_ptr() and hasn't
> +     * caused any problems in practice.
> +     */
> +    FlatView *fv;
> +    void *rom;
> +    hwaddr len_unused;
> +    FindRomCBData cbdata = {};
> +
> +    /* Easy case: there's data at the actual address */
> +    rom = rom_ptr(addr, size);
> +    if (rom) {
> +        return rom;
> +    }

Should you really have this special case?  Nowhere is this going to verify that 
@addr is in @as.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


> +
> +    RCU_READ_LOCK_GUARD();
> +
> +    fv = address_space_to_flatview(as);
> +    cbdata.mr = flatview_translate(fv, addr, &cbdata.xlat, &len_unused,
> +                                   false, MEMTXATTRS_UNSPECIFIED);
> +    if (!cbdata.mr) {
> +        /* Nothing at this address, so there can't be any aliasing */
> +        return NULL;
> +    }
> +    cbdata.size = size;
> +    flatview_for_each_range(fv, find_rom_cb, &cbdata);
> +    return cbdata.rom;
> +}
> +
>   void hmp_info_roms(Monitor *mon, const QDict *qdict)
>   {
>       Rom *rom;
> 


