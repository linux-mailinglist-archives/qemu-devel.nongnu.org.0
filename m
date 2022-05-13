Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ABA525D54
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:27:05 +0200 (CEST)
Received: from localhost ([::1]:52240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQdc-00025a-MX
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQZL-0000Rf-1U; Fri, 13 May 2022 04:22:39 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQZG-0000Yw-JR; Fri, 13 May 2022 04:22:36 -0400
Received: by mail-ej1-x62e.google.com with SMTP id kq17so14780862ejb.4;
 Fri, 13 May 2022 01:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/MrMKPRVl38wG3D7rtEYCwGMmefsn/9VsGUAKK5KsYA=;
 b=WYyui/Wz8WxzV99+WCY4resNXZJgo6ecCr4zjCBDbsaBs/4zEdxIzNzsoXXULBr4v7
 X++y/EwOqz7k4Pz0BqwBEmjJewiTmZMP9vIrD3bpPbFc3QwZ7qpRPtu06uQSvL2KahSO
 pih2hKgR2tJ7YTCZzeHQjwP0k1O6BZcsXe5A33BFzxx7xj1GjSTsoFWN7EZsY+YurmH+
 zEMZm7ye3dgyBoaMYjJlty4iRRX9EW9Emoa8NMXJrpda7/hYTIIx2bJz8dq/ZfqdpX23
 DKdK/DLBNrcVJpE4pFTzOdUQ7sbqWcF747JLqIRU5OPQoaSHRtTt6FpbBS455WAWDlFP
 qVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/MrMKPRVl38wG3D7rtEYCwGMmefsn/9VsGUAKK5KsYA=;
 b=sdGFeESxDwrEg8VxxQBVAeDfL8O3O0hdG4skIwtJK1TE/TuS50Z9hnTFSvTfd/bpaH
 lK3F9Z8jJ4DPEZ7QIK+eyLfyg+R9VXJHF+NCkp1aqeCAkXGxk4eQh9J8Tv75DBFFU/vA
 +w1BDhxYWZ8AnKIhFYwx0mfu70ZzcAnGOXI9JERyFaMfny+tAur/JAcHAoN9YdQhKZBe
 osHnciCo+ZLx/R0skaYWhZgqG6/cg+CJpqnSdORgTf+TV4JaqHznrppofW3pm4FCtT0g
 lTUIjJDaa8JM32Q7eZ7NCKcEbwhjXvCcC5n+5ro6oAnrfnT7NAjNfyaG3lkwf0+qljc/
 Azog==
X-Gm-Message-State: AOAM533vx5aeY5AOQlviS4/qizMdTddNWLoOYmLiKtpMJbeS0s1DiT6c
 4AlGjCLN/w6xf2H4Y+ovhFg=
X-Google-Smtp-Source: ABdhPJzUlFxCc7hirpp9ZYZhijfjGg2GnAlbEyN3i7nmL35SH/HjglsHOQQXvevFqFU328xvkSFq1A==
X-Received: by 2002:a17:907:7b8a:b0:6fc:ac8d:3477 with SMTP id
 ne10-20020a1709077b8a00b006fcac8d3477mr3204042ejc.48.1652430152443; 
 Fri, 13 May 2022 01:22:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 s2-20020a170906778200b006f3ef214e1csm516278ejm.130.2022.05.13.01.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:22:31 -0700 (PDT)
Message-ID: <9541f3e7-fa0a-0f05-e5db-18be833f997a@redhat.com>
Date: Fri, 13 May 2022 10:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/7] block: Make bdrv_{pread, pwrite}() return 0 on success
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>
References: <20220512233849.2219275-1-afaria@redhat.com>
 <20220512233849.2219275-4-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220512233849.2219275-4-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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

On 5/13/22 01:38, Alberto Faria wrote:
> 
> @@ -113,7 +113,7 @@ static ssize_t qcow2_crypto_hdr_read_func(QCryptoBlock *block, size_t offset,
>          error_setg_errno(errp, -ret, "Could not read encryption header");
>          return -1;
>      }
> -    return ret;
> +    return buflen;
>  }
>  
>  
> @@ -174,7 +174,7 @@ static ssize_t qcow2_crypto_hdr_write_func(QCryptoBlock *block, size_t offset,
>          error_setg_errno(errp, -ret, "Could not read encryption header");
>          return -1;
>      }
> -    return ret;
> +    return buflen;
>  }
>  
>  static QDict*

As a follow-up you could change the calling convention of readfunc and 
writefunc in crypto/block-luks.c and crypto/block-qcow.c.

More in general, crypto/block-luks.c and crypto/block-qcow.c should be 
annotated for coroutine_fn.  Let's put it on the todo list.

> @@ -88,6 +88,7 @@ static int vhdx_log_peek_hdr(BlockDriverState *bs, VHDXLogEntries *log,
>      if (ret < 0) {
>          goto exit;
>      }
> +    ret = sizeof(VHDXLogEntryHeader);
>      vhdx_log_entry_hdr_le_import(hdr);
>  
>  exit:

The callers only check the return code of vhdx_log_peek_hdr, 
vhdx_log_read_sectors, vhdx_log_write_sectors with ret < 0.  But looking 
at the callers:

- vhdx_log_read_desc propagates ret directly from a successful 
vhdx_log_read_sectors, but its callers don't care about which 
nonnegative result is returned

- vhdx_validate_log_entry might occasionally return ret directly from a 
successful vhdx_log_read_desc or vhdx_log_read_sectors, but 
vhdx_log_search, the caller of vhdx_validate_log_entry, also doesn't 
care about which nonnegative result is returned

- vhdx_log_flush only returns a successful return value from bdrv_flush

- vhdx_log_write propagates ret directly from a successful 
vhdx_log_write_sectors, but vhdx_log_write_and_flush only returns a 
successful return value from vhdx_log_flush

So (perhaps as a separate patch?) you can remove the three assignments 
of ret.


A possible cleanup is missing in vdi_co_pwritev:

>         ret = bdrv_pwrite(bs->file, offset * SECTOR_SIZE, base,
>                           n_sectors * SECTOR_SIZE);
>     }
> 
>     return ret < 0 ? ret : 0;

ret is returned by either bdrv_pwrite or bdrv_co_writev, so it can be 
simplified to just "return ret".


As an aside, while reviewing I noticed this in qcow2_mark_dirty:

     ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, 
incompatible_features),
                       &val, sizeof(val));
     if (ret < 0) {
         return ret;
     }
     ret = bdrv_flush(bs->file->bs);
     if (ret < 0) {
         return ret;
     }

I'm not sure if there are other occurrencies, perhaps you can try using 
Coccinelle to find them and change them to a bdrv_pwrite_sync.

But anyway:

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

