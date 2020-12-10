Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1253E2D4F39
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 01:12:18 +0100 (CET)
Received: from localhost ([::1]:41596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn9ZB-0004IZ-5G
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 19:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kn9Wz-0003Fz-N4
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 19:10:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kn9Wx-0004Yz-TJ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 19:10:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607558999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vVPSQ8wwXrlFycG42d7TH1E+2vCy40xiBHZyy+54g04=;
 b=AK8rpxIFTiVeoDiftrsy3njvswZ98vAS3Sdsr3KDyXahtTkSk+gs1610Q3KCdgjiLEnjQl
 E6SKFW5UDCOT7UgWtJTPTvGjH/ugpXESVu3nRzv5iauHdmi+r1F5Wg20C4f/oDEWVdRSfi
 /r5aPiCNEbkKZZnMrikuFjiLzk51a1Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-y4bKQgSfPGqCwckwa4SM0A-1; Wed, 09 Dec 2020 19:09:55 -0500
X-MC-Unique: y4bKQgSfPGqCwckwa4SM0A-1
Received: by mail-ed1-f72.google.com with SMTP id l33so1641030ede.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 16:09:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vVPSQ8wwXrlFycG42d7TH1E+2vCy40xiBHZyy+54g04=;
 b=Yqj9C2K74zmQBKXj++3NuVKx6dRffvv2DirTiw4JSANj6E0ShGY6nDmoiUimsNukba
 OaxKHCqMbPP+PVfU1CXNEexewZYt93jVFAN1YnSffP2gj48mHe1NZjtrGF9WjUWbDjKP
 J/FM8al7AMZG7FhfZ77wDoibQqw1nglULMclGSax5re4oXO7arKMG//iU7YmY8Di4aHT
 ARt0v7tAvQbIVlc2BLSMj75X51gxqa+thWqB6mulI1GJvBQh0kSYYsJzS6CEKb680y8K
 iC4ep1U27PqfMQemurVhxImkoy2+BPAQFFSA07YSZ2OXNsWXongRWAVMi/OseeProbTo
 FAbA==
X-Gm-Message-State: AOAM531kSjnBU38Zwt6OWLVaKOmAhgv+C3p62w27+hUiwf554ovE163n
 O1Fv5FHfgzdLcrt2latdJgN8UtcjmAP31Ke5J284QSVVyzq5Y8qjyDq7LWt8YW6qsOmrSvW/DyQ
 h92t/Ztqeupgcm64=
X-Received: by 2002:a17:906:f9da:: with SMTP id
 lj26mr4053037ejb.467.1607558994567; 
 Wed, 09 Dec 2020 16:09:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+2AqgnAq6cVGwkqGPN35mBZTfjLerZjS+poKhTBbaZWrvnAzz5RaZLqDua4VctdP9WgrGqA==
X-Received: by 2002:a17:906:f9da:: with SMTP id
 lj26mr4053015ejb.467.1607558994377; 
 Wed, 09 Dec 2020 16:09:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id ot18sm2828024ejb.54.2020.12.09.16.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 16:09:53 -0800 (PST)
Subject: Re: [PATCH v2 0/5] SCSI: fix transfer limits for SCSI passthrough
To: qemu-devel@nongnu.org, mlevitsk@redhat.com
References: <160752262015.25926.10971176014472074579@600e7e483b3a>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <29a0d8e6-53a8-e3ab-5bef-c978d79696bf@redhat.com>
Date: Thu, 10 Dec 2020 01:09:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160752262015.25926.10971176014472074579@600e7e483b3a>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, pl@kamp.de, tom.ty89@gmail.com,
 ronniesahlberg@gmail.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/12/20 15:03, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20201209135355.561745-1-mlevitsk@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20201209135355.561745-1-mlevitsk@redhat.com
> Subject: [PATCH v2 0/5] SCSI: fix transfer limits for SCSI passthrough
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
>  From https://github.com/patchew-project/qemu
>   * [new tag]         patchew/20201209135355.561745-1-mlevitsk@redhat.com -> patchew/20201209135355.561745-1-mlevitsk@redhat.com
> Switched to a new branch 'test'
> 77c9000 block/scsi: correctly emulate the VPD block limits page
> 61f49e1 block: use blk_get_max_ioctl_transfer for SCSI passthrough
> 35c66d6 block: add max_ioctl_transfer to BlockLimits
> 08ba263 file-posix: add sg_get_max_segments that actually works with sg
> e9fd749 file-posix: split hdev_refresh_limits from raw_refresh_limits
> 
> === OUTPUT BEGIN ===
> 1/5 Checking commit e9fd7498060c (file-posix: split hdev_refresh_limits from raw_refresh_limits)
> 2/5 Checking commit 08ba263f565d (file-posix: add sg_get_max_segments that actually works with sg)
> 3/5 Checking commit 35c66d636d83 (block: add max_ioctl_transfer to BlockLimits)
> 4/5 Checking commit 61f49e1c953b (block: use blk_get_max_ioctl_transfer for SCSI passthrough)
> 5/5 Checking commit 77c9000b7c30 (block/scsi: correctly emulate the VPD block limits page)
> ERROR: braces {} are necessary for all arms of this statement
> #39: FILE: hw/scsi/scsi-generic.c:204:
> +            if (len < r->buflen)
> [...]
> 
> total: 1 errors, 0 warnings, 28 lines checked
> 
> Patch 5/5 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> The full log is available at
> http://patchew.org/logs/20201209135355.561745-1-mlevitsk@redhat.com/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 

Time for v3?

Paolo


