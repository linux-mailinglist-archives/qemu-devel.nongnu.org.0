Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC467501852
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 18:08:32 +0200 (CEST)
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf21H-00074Y-1p
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 12:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nf1vC-0001Bc-AR
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nf1v8-0001n5-Ue
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649952129;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jSqdnTKFHlDnCz2MDaGZy1/dNYD/lkZi+mkiRMrbdU8=;
 b=XpVWiUcJPYh/vZvjknmWs+rXf2bGuqV551PR3HsFHeuE7rGgy1ynUwIAF3o3Eu9P5qqfU1
 q3S0K918JZnejjo6+o97vPRe5UOiqFGob3sc5IRv29wI6vDMKlPlm69jlfpmDOa3AcvnTk
 0d4Lk+u/I68awPmule8L0wfPb9xlvcE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-clCsDOCoP1CmCpcRrH1dWw-1; Thu, 14 Apr 2022 12:02:08 -0400
X-MC-Unique: clCsDOCoP1CmCpcRrH1dWw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r83-20020a1c4456000000b0038ebc45dbfcso2639733wma.2
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 09:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=jSqdnTKFHlDnCz2MDaGZy1/dNYD/lkZi+mkiRMrbdU8=;
 b=Rlie9GyFDfVqwzGuHCTmhzAbipkleiPk3F2PRRfl1sG/2jNj15twai2s2LpgaZsahG
 7g7rN666XQjRTbIlT2kK5UZM2V7tkMhUAXA0wZ2qA36+NdjptZYy3AAcUplZuxaqKopq
 eDqi3ONso8onQgBDdtRjISr81pUTGBo3DuaL1yI9OGrXAbwDdR8FZUm9s0z7kUUnFjjL
 tFyiFsM9itR6z/+dnRWPUvk2naRwJoBARzadtSmr6TTTXr+idYgHwj7OLeS0UanyWDRX
 r4uG85vWvVuYeUF6jW4bt6Oxwi6R3uQqy9xCC1LFQ/0Ap5UFbIciiKtYNwPoIcHsQ590
 Cxlg==
X-Gm-Message-State: AOAM533UEtC9uZy/9DeklFyTewXVj3jDpugjKv22fzBn1LGIivHdnKOP
 aCCdMtnyl8BBq5R87DQMJsOaktKOvjyAu4OG1/Jysg3ES/Xb+UiS2crzhbSYxCRe46EU64YLyVU
 sCJi8p2ACEyWuTrs=
X-Received: by 2002:a5d:65cf:0:b0:207:a62c:ecc2 with SMTP id
 e15-20020a5d65cf000000b00207a62cecc2mr2468785wrw.55.1649952126701; 
 Thu, 14 Apr 2022 09:02:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuld7OSVO1LXYXkn4tgXX/XFkTI2dgJfJvmPX8WNFZmR4QT8VZ77YVhvqZnppnm81TKnmMfw==
X-Received: by 2002:a5d:65cf:0:b0:207:a62c:ecc2 with SMTP id
 e15-20020a5d65cf000000b00207a62cecc2mr2468771wrw.55.1649952126459; 
 Thu, 14 Apr 2022 09:02:06 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm5983685wmq.12.2022.04.14.09.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:02:05 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/smmuv3: Pass the real perm to returned
 IOMMUTLBEntry in smmuv3_translate()
To: chenxiang <chenxiang66@hisilicon.com>
References: <1649318245-77817-1-git-send-email-chenxiang66@hisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <5436eae2-2af1-b81a-3a06-c834f8f6f835@redhat.com>
Date: Thu, 14 Apr 2022 18:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1649318245-77817-1-git-send-email-chenxiang66@hisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org, linuxarm@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Chenxiang,

On 4/7/22 9:57 AM, chenxiang via wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
>
> In function memory_region_iommu_replay(), it decides to notify() or not
> according to the perm of returned IOMMUTLBEntry. But for smmuv3, the
> returned perm is always IOMMU_NONE even if the translation success.
I think you should precise in the commit message that
memory_region_iommu_replay() always calls the IOMMU MR translate()
callback with flag=IOMMU_NONE and thus, currently, translate() returns
an IOMMUTLBEntry with perm set to IOMMU_NONE if the translation
succeeds, whereas it is expected to return the actual permission set in
the table entry.



> Pass the real perm to returned IOMMUTLBEntry to avoid the issue.
>
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>  hw/arm/smmuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 674623aabe..707eb430c2 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -760,7 +760,7 @@ epilogue:
>      qemu_mutex_unlock(&s->mutex);
>      switch (status) {
>      case SMMU_TRANS_SUCCESS:
> -        entry.perm = flag;
> +        entry.perm = cached_entry->entry.perm;
With that clarification
Reviewed-by: Eric Auger <eric.auger@redhat.com>

the translate() doc in ./include/exec/memory.h states
"
If IOMMU_NONE is passed then the IOMMU must do the
     * full page table walk and report the permissions in the returned
     * IOMMUTLBEntry. (Note that this implies that an IOMMU may not
     * return different mappings for reads and writes.)
"


Thanks

Eric
>          entry.translated_addr = cached_entry->entry.translated_addr +
>                                      (addr & cached_entry->entry.addr_mask);
>          entry.addr_mask = cached_entry->entry.addr_mask;


