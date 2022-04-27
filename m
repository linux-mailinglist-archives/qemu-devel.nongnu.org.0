Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13214511BE2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 17:28:46 +0200 (CEST)
Received: from localhost ([::1]:39412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njjau-0000OZ-UH
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 11:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njjZv-0007GI-GL
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njjZt-0000B6-1Z
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651073260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWPJI3GaP+EemnN1bohfLW5L2SIRlKZhScApda+umvM=;
 b=c+Td9xCQ8SVD7R3f7TAoWahB6tJJMy9HE5+vLpZ/R81kwP1tCw46LiTDPbYIDHNcRrzaMj
 8EBhe7P/o72V9ljvQC4OGBLJpRLeEU7J6cf2iuwgZ/uB7d6wMvsEMIQhd21DNTtjj4FFBj
 1Si3ttlbr3QZksoUcyhHzSDQzWcLmf8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-5ii8olzEMfWWDdmegXYCmg-1; Wed, 27 Apr 2022 11:27:38 -0400
X-MC-Unique: 5ii8olzEMfWWDdmegXYCmg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so2962487wme.5
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 08:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:references:cc:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=mWPJI3GaP+EemnN1bohfLW5L2SIRlKZhScApda+umvM=;
 b=olnIRGAOXBomiKAVBas8OsKzzQI1fW3k0/H3xZyz0n7gI+INUSVkPUjHngfR8Jt7YW
 w11/2i3ULOHxeHBp1jdikGACgEkahfnUAwoOCpBaMoveDOkc5IypK1qZ7OGrS9DqDk7C
 m+ko8yuc1Ev+LxeQzxG4fQT2cMXpACIcpJgKQ8t1eikRPqPA5AJ0GZhKa64HU8VEJbb5
 yK7l/gi9ATDEY0VfpzkqfJGJPBWlPAEwQMAOaDXFK5hHLx2CmvE9qcdzi827yYG5QRRq
 W07qNr8r/ebpeWxXyxHidVnfQKCqfgdmV5MpBuKW6nI+KKCfSsH78tHAuP/EqeN93Kc6
 eR+Q==
X-Gm-Message-State: AOAM530i4f4GkGsr1YWvtbTb/jyYrH6Il8QaGz28k8vbtA4y9xjAK6ut
 l9ny8PpMR5EaY1SOgkhRdfFwJbvcRFdRF0QTCm5JR9YQAD487FhjCycvJVGL8sO3Mfcm/c4NJUa
 R73JdFSk2ZKVZJSU=
X-Received: by 2002:a1c:e916:0:b0:38e:ac96:f477 with SMTP id
 q22-20020a1ce916000000b0038eac96f477mr36175011wmc.160.1651073257755; 
 Wed, 27 Apr 2022 08:27:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXcrH2krqbyc5aJWCsbmfrh8a9LtDx7A/EaJib4meUuP7AZGmp2ulxlWdgF2g2rPk/kKkMiQ==
X-Received: by 2002:a1c:e916:0:b0:38e:ac96:f477 with SMTP id
 q22-20020a1ce916000000b0038eac96f477mr36174992wmc.160.1651073257526; 
 Wed, 27 Apr 2022 08:27:37 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c1d0b00b00393fbabdddfsm1831839wms.36.2022.04.27.08.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 08:27:37 -0700 (PDT)
Message-ID: <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
Date: Wed, 27 Apr 2022 17:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Rob Landley <rob@landley.net>, QEMU Developers <qemu-devel@nongnu.org>
References: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: serial hang in qemu-system-ppc64 -M pseries
In-Reply-To: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/04/2022 12.26, Rob Landley wrote:
> When I cut and paste 80-ish characters of text into the Linux serial console, it
> reads 16 characters and stops. When I hit space, it reads another 16 characters,
> and if I keep at it will eventually catch up without losing data. If I type,
> every character shows up immediately.

That "16" certainly comes from VTERM_BUFSIZE in hw/char/spapr_vty.c in the 
QEMU sources, I think.

> (On other qemu targets and kernels I can cut and paste an entire uuencoded
> binary and it goes through just fine in one go, but this target hangs with big
> pastes until I hit keys.)
> 
> Is this a qemu-side bug, or a kernel-side bug?
> 
> Kernel config attached (linux 5.18-rc3 or thereabouts), qemu invocation is:
> 
> qemu-system-ppc64 -M pseries -vga none -nographic -no-reboot -m 256 -kernel
> vmlinux -initrd powerpc64leroot.cpio.gz -append "panic=1 HOST=powerpc64le
> console=hvc0"

Which version of QEMU are you using? Which frontend (GTK or terminal?) ... 
this rings a distant bell, but I thought we had fixed these issues long ago 
in the past... e.g.:

https://yhbt.net/lore/all/1380113886-16845-10-git-send-email-mdroth@linux.vnet.ibm.com/

https://git.qemu.org/?p=qemu.git;a=commitdiff;h=8a273cbe53221d28

... but maybe my memory also just fails and this has never been properly fixed.

  Thomas


