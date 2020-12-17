Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CE02DCF43
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:13:23 +0100 (CET)
Received: from localhost ([::1]:57514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqHb-0008Ti-DI
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpqCQ-0005CM-1J
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:07:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpqCI-0008FA-GE
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608199664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iv4o6O7wgU95otK7tmhjSnsF9ez0bRUNVYjKan5Yiiw=;
 b=HVuwlPOvHLzg8QSltrqgIZaF5VOAhqgyoZbAvolOtNocgigmG71eJuxo7webQCWbf8EuiB
 xdyAz1i58cbVxRsSDw1fvLsFmtgutZr67lHgfIOu1Qlr6XJAbn97fCVa8hx16In3UOMeT6
 DSlJv54bH8GAi17bez+3y1W34an+N+g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-uaf_0xcGM4WideeAP5ducw-1; Thu, 17 Dec 2020 05:07:43 -0500
X-MC-Unique: uaf_0xcGM4WideeAP5ducw-1
Received: by mail-ed1-f69.google.com with SMTP id y19so11531869edw.16
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 02:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iv4o6O7wgU95otK7tmhjSnsF9ez0bRUNVYjKan5Yiiw=;
 b=a6KpHKis4l2yMmaWfKk+BmduJXutgMIWzleBxJ1TCW4TvKuIb6F+6Tu01oCHsLAGP3
 SYiU1HRp1KcWpHJ0mMa5keDLVfrnlE1vKvOhi8bJeDOa5hcc5Lxx3bn2wN9uBSA4Mr5u
 /Bws5YTnAhP4b0mUi87+fITes62NTknzTd9iU33lL9cdHqEMzhladkPUnOUzMPphZ5QG
 S6Lzt9CkdkcnV7oDGJuAYshW9lgadZxbD6ZjHxAnAhtk0iWWRHFMxuLRNyVhPqwUYLuu
 qVm8PLUSRDG6jd0/LkEvDV2/Gypk4a01o8/nmwYJThxoqgrMQBqBfnygxlqEbZhBDv1p
 qbxA==
X-Gm-Message-State: AOAM5327qiPAu6nStNykA375gqO08x5+Mj21pDMLyzsCALRZDOxZUvc0
 HhER92z5ZEXH/JJ8Zff0tf08yEAw7Zs8KtlyqmsHyucj0ILHuS2rOFm2OU0CUeXD83eWOfx2xXK
 2opaqIIacIvX0l0xqDsD9Dp6u6R2bh4b9fpVeECw7R8Df9Mw7SL21ZtewADHvwVLfDxY=
X-Received: by 2002:aa7:d485:: with SMTP id b5mr36622944edr.214.1608199660598; 
 Thu, 17 Dec 2020 02:07:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyioTXoksT+J3P7+CY8yWprmABJXytS4u7bhQUWXkWqnG92/Vjgi8zfsv5Ku7VtFmjyib1I/g==
X-Received: by 2002:aa7:d485:: with SMTP id b5mr36622918edr.214.1608199660294; 
 Thu, 17 Dec 2020 02:07:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n13sm3402860ejr.93.2020.12.17.02.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 02:07:39 -0800 (PST)
Subject: Re: [PATCH 0/7] scsi: scsi-disk corrupts data
To: Hannes Reinecke <hare@suse.de>
References: <20201116184041.60465-1-hare@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6e1ae80a-0497-9a03-d5fc-dcfd6fd1c275@redhat.com>
Date: Thu, 17 Dec 2020 11:07:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201116184041.60465-1-hare@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 16/11/20 19:40, Hannes Reinecke wrote:
> Hi all,
> 
> a customer of ours reported repeated data corruption in the guest following a command abort.
> After lengthy debugging we found that scsi-disk (and scsi-generic, for that matter) ignores
> the host_status field from SG_IO once a command is aborted. If the command is aborted, SG_IO
> will return with a SCSI status 'GOOD', and host_status 'DID_TIME_OUT'. scsi-disk will now
> ignore the DID_TIME_OUT setting, and just report the SCSI status back to the guest.
> The guest will then assume everything is okay and not retry the command, leading to the data
> corruption.
> 
> This patchset moves the (linux only) SG_ERR host_status codes to generic code as SCSI_HOST
> values, and adds a host_status field to SCSIRequest. With that some drivers like virtio_scsi
> can interpret the host_status code and map it onto it driver-specific status.
> This status is then visible to the guest, which then is able to take appropriate action.
> 
> As usual, comments and reviews are welcome.
> 
> Hannes Reinecke (6):
>    scsi-disk: Add sg_io callback to evaluate status
>    scsi: drop 'result' argument from command_complete callback
>    scsi: Rename linux-specific SG_ERR codes to generic SCSI_HOST error
>      codes
>    scsi: Add mapping for generic SCSI_HOST status to sense codes
>    scsi: split sg_io_sense_from_errno() in two functions
>    scsi: move host_status handling into SCSI drivers
> 
> Paolo Bonzini (1):
>    scsi-disk: convert more errno values back to SCSI statuses
> 
>   hw/scsi/esp-pci.c      |   5 +--
>   hw/scsi/esp.c          |  17 +++++--
>   hw/scsi/lsi53c895a.c   |  17 +++++--
>   hw/scsi/megasas.c      |  15 +++++--
>   hw/scsi/mptsas.c       |  14 +++++-
>   hw/scsi/scsi-bus.c     |   2 +-
>   hw/scsi/scsi-disk.c    |  75 ++++++++++++++++++++-----------
>   hw/scsi/scsi-generic.c |  21 ++++++---
>   hw/scsi/spapr_vscsi.c  |  20 ++++++---
>   hw/scsi/virtio-scsi.c  |  44 ++++++++++++++++--
>   hw/scsi/vmw_pvscsi.c   |  29 +++++++++++-
>   hw/usb/dev-storage.c   |   6 +--
>   hw/usb/dev-uas.c       |   7 ++-
>   include/hw/scsi/esp.h  |   2 +-
>   include/hw/scsi/scsi.h |   5 ++-
>   include/scsi/utils.h   |  29 +++++++-----
>   scsi/qemu-pr-helper.c  |  14 ++++--
>   scsi/utils.c           | 119 ++++++++++++++++++++++++++++++++++++-------------
>   18 files changed, 328 insertions(+), 113 deletions(-)
> 

Queued, thanks.

Paolo


