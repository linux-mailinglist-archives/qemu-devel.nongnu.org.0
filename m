Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA3A2DD273
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:50:59 +0100 (CET)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptgG-0003Zc-Mx
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kptfH-000398-7O
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:49:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kptfD-0000bB-CK
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608212989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPD4+pl0ZgL1FqN7bWTUgo8IBx9UqikHdaOoN6tCObo=;
 b=LVql6c+Y1xLH7dZDlGpF3EHLd7+gu6KMLc0l3FBI+Wt7UxSMrK3XRKQ3cpENWLEA4oH1bo
 2VyXfsbZKmz8lPcITKDeZAL7NmKSpvsRua7ss9MU0lFoDLaWRAn0N6k1oo//N2VIHieSQZ
 ZUjejeNbmBOB4/9Re3wtQdb/wBzqqL0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-tO5Cc6oWPX-fhiHl1qGsBQ-1; Thu, 17 Dec 2020 08:49:46 -0500
X-MC-Unique: tO5Cc6oWPX-fhiHl1qGsBQ-1
Received: by mail-ed1-f69.google.com with SMTP id u17so13513707edi.18
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 05:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PPD4+pl0ZgL1FqN7bWTUgo8IBx9UqikHdaOoN6tCObo=;
 b=soXPgmNsD9PPl7mV7RGp666qwNImB1LInrV8BYCMxEmIaT1QzTDydOJJO64DPoq7yM
 Xwg4C4qV1i/2D2KYUDLaeuNmyDqQDydfRcq+5XidjwBe43oj6VkRp/mszOXN1kdRRjYx
 bvg5SptO5ksOkGm1OzACG3h/Wly2/RhoM4NerXXKmmIN+nHzaFqMPFQEkv1QG9ezYHcW
 H4GwI3c4ADhVONqAejvdopg+ggV7vby//cRW9CBOayXJipb1FDnnXLXrXATjpUOSZIaL
 T4PHeoVpuNIsiCtg6Uh8TnzNyDXeNw+q0ketXhk1AxQo6IsYYJrZ8SzgDSBL8/eTqHXs
 2tcw==
X-Gm-Message-State: AOAM5320m9DgY6VRSU1fGgyI3q1r5AynmuUcfoC9ZnzG4ds9N2CG/BSk
 R0NEA53lOMXD8Atpvl6GwCsIboc9/RI9MHKJX5UZToT26q6DJr20cyXG8ZAwkKhcCp5DLehuIwP
 zAbiscx5njaPAiRUiKV905wDMyFHdwvNOZc8c3VIkXrH/PhzE2LrUX/6YMk/y2Xv1vPE=
X-Received: by 2002:a17:906:234d:: with SMTP id
 m13mr35552060eja.270.1608212983619; 
 Thu, 17 Dec 2020 05:49:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc7jaqaiAhgf8m8SB/v33kUtzTPqfMeh/C/7frIOdTFJKsaN26ku/QE6ce3/NxCSkpkAvdMw==
X-Received: by 2002:a17:906:234d:: with SMTP id
 m13mr35552044eja.270.1608212983397; 
 Thu, 17 Dec 2020 05:49:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b19sm23335300edx.47.2020.12.17.05.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 05:49:42 -0800 (PST)
To: Hannes Reinecke <hare@suse.de>
References: <20201116183114.55703-1-hare@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] scsi: infinite guest hangs with scsi-disk
Message-ID: <6be19755-7cf5-8dd3-8bdd-168208dd5bc7@redhat.com>
Date: Thu, 17 Dec 2020 14:49:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201116183114.55703-1-hare@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 19:31, Hannes Reinecke wrote:
> Hi all,
> 
> one of our customers reported an infinite guest hang following an FC link loss  when using scsi-disk.
> Problem is that scsi-disk issues SG_IO command with a timeout of UINT_MAX, which essentially signals
> 'no timeout' to the host kernel. So if the command gets lost eg during an unexpected link loss the
> HBA driver will never attempt to abort or return the command. Hence the guest will hang forever, and
> the only way to resolve things is to reboot the host.
> 
> To solve it this patchset adds an 'io_timeout' parameter to scsi-disk and scsi-generic, which allows
> the admin to specify a command timeout for SG_IO request. It is initialized to 30 seconds to avoid the
> infinite hang as mentioned above.
> 
> As usual, comments and reviews are welcome.
> 
> Hannes Reinecke (3):
>    virtio-scsi: trace events
>    scsi: make io_timeout configurable
>    scsi: add tracing for SG_IO commands
> 
>   hw/scsi/scsi-disk.c    |  9 ++++++---
>   hw/scsi/scsi-generic.c | 25 ++++++++++++++++++-------
>   hw/scsi/trace-events   | 13 +++++++++++++
>   hw/scsi/virtio-scsi.c  | 30 +++++++++++++++++++++++++++++-
>   include/hw/scsi/scsi.h |  4 +++-
>   5 files changed, 69 insertions(+), 12 deletions(-)
> 

The UINT_MAX timeout predates me, but I think the idea was to make it 
sort of like NFS's hard option.  Without a timeout you cannot be quite 
sure if/when the command will stay in some buffer of the HBA or the SAN 
or the target, and there could be unintended reordering of writes.

Though I guess at some point you'll anyway restart the VM on another 
host and the same reordering can happen, so I've queued the patch.

Paolo


