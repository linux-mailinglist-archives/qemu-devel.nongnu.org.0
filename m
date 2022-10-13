Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68585FDB39
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:42:40 +0200 (CEST)
Received: from localhost ([::1]:57572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyTu-0006MB-Uu
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiyIj-0007uW-MV
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiyIg-0005Yl-6U
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665667861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fr3eXh9HRRKbJhOiH0DcmglOLRwlWrsicQg9qT5gOwo=;
 b=CVsy0ZuN/2De6ZKObTpi+K/gurgSkzOaYPIN/9BTbDr9142okclJL5EEZ+QjVEOVLpHZkO
 vLKJyCLIvJU0y/1+pzkr/ZBTAylDt7WWbKL4eLn6DsWjx9r0poy9LYs8Ck5f38HePU8E+q
 H1kpTDxPYFhC+dYy5kWga+NqMelyhW4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-9DqZh0v8MAyjOYqwSMALAA-1; Thu, 13 Oct 2022 09:30:59 -0400
X-MC-Unique: 9DqZh0v8MAyjOYqwSMALAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay12-20020a05600c1e0c00b003c6e18d9aa8so695804wmb.8
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 06:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fr3eXh9HRRKbJhOiH0DcmglOLRwlWrsicQg9qT5gOwo=;
 b=AO0RKKMPBX7qcMp4SIPKB0zSI/wDTxSqX1iZQ9siCK5Ey7jg2oJWFBLsTnHwrpxiyT
 GmfjQDmOSorkbk/jvIA+jiVGWhbZ5QWB4Y+F2vBrsqFsaFhdCu+k3dUWjNsvxsZlu6I2
 +/QEOpV+/tFAC6gZ6PP8kMBmbZsjrVQ/p0w0/zB1yXjZsyvJUyiE7Y9rkyI/Fe0R7Dvr
 F/AQEn0/JTOqznoHtq+evNo55Nwld74U0ql7bY7CS8xLWhHzIVBrEcg21eU7FCk53irB
 iaVKbm6QOfyh7aBHENRwNFSY8ao5QBWQiLsg02UdSa3poiiSl7xDsteAY7xErx7b0Sd7
 UnZw==
X-Gm-Message-State: ACrzQf2p9wASBX2kCYkG3rOlIbdbYblbiIHpOtQMc7MRGoV1/Mnv+S35
 k8TzsIIGGzlS/QMLa5bSW4V4f6i369tmLLCe1WeEJFKkRu9BT2nS5aPLKB3ztOKRLfDSNxFFZ4D
 pjjI2DFwO208k+eU=
X-Received: by 2002:a5d:64aa:0:b0:230:71e5:c540 with SMTP id
 m10-20020a5d64aa000000b0023071e5c540mr13700276wrp.625.1665667857896; 
 Thu, 13 Oct 2022 06:30:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7tehBeYSYOg6YyFGLmT3pyhCbxq+gtuTiN9upXUb/dKPY8SouYpOCNHul0mKOkjcIUG3MUYA==
X-Received: by 2002:a5d:64aa:0:b0:230:71e5:c540 with SMTP id
 m10-20020a5d64aa000000b0023071e5c540mr13700253wrp.625.1665667857639; 
 Thu, 13 Oct 2022 06:30:57 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-38.web.vodafone.de.
 [109.43.176.38]) by smtp.gmail.com with ESMTPSA id
 x1-20020a1c7c01000000b003c6c5a5a651sm4290779wmc.28.2022.10.13.06.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 06:30:56 -0700 (PDT)
Message-ID: <6a8d3ac5-38b2-6bd9-6b6a-92078de58776@redhat.com>
Date: Thu, 13 Oct 2022 15:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] include/hw/scsi/scsi.h: Remove unused
 scsi_legacy_handle_cmdline() prototype
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20221013130500.967432-1-peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221013130500.967432-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/10/2022 15.05, Peter Maydell wrote:
> In commit 1454509726719e0933c80 we removed the function
> scsi_legacy_handle_cmdline() and all of its callers, but forgot to
> delete the prototype from the header function.  Delete the prototype
> too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/scsi/scsi.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
> index 001103488c2..9ad86b25bb4 100644
> --- a/include/hw/scsi/scsi.h
> +++ b/include/hw/scsi/scsi.h
> @@ -187,7 +187,6 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
>                                         BlockdevOnError werror,
>                                         const char *serial, Error **errp);
>   void scsi_bus_legacy_handle_cmdline(SCSIBus *bus);
> -void scsi_legacy_handle_cmdline(void);
>   
>   SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
>                               uint32_t tag, uint32_t lun, void *hba_private);

Reviewed-by: Thomas Huth <thuth@redhat.com>


