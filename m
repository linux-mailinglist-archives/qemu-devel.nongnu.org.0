Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61ED324472
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:14:25 +0100 (CET)
Received: from localhost ([::1]:33992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzc8-0004bN-LM
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEzTx-0006ab-07
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:05:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEzTr-0006Cs-5r
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614193549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWLfMWuqSMfLOJwJ3WwL1QErVBJDcqj1v/NxZGGa/Bc=;
 b=iwdhnKs+MsehllZFSp1vz41QmUa7awEGPd5UZ/sBqPuyTlF7Vt4YMwbU4Ba8DsGVwoMQMn
 FoZmJdXKmlMjnwYbVdT+2XbAiax78A3hdGHEbQ5msLJduGKCr8TTI6fIBzOz7TrV/wFDnZ
 pvASDUm4XG8P/CFCUtD4S0AYXGtH1QY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-sCVsvxJvMdKiOUIiuJFvwg-1; Wed, 24 Feb 2021 14:05:45 -0500
X-MC-Unique: sCVsvxJvMdKiOUIiuJFvwg-1
Received: by mail-wr1-f70.google.com with SMTP id c9so1454653wrq.18
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KWLfMWuqSMfLOJwJ3WwL1QErVBJDcqj1v/NxZGGa/Bc=;
 b=pIvLcHY2bpCtRU67H5g3M/rZrbh4iFOTxePnYhbt8oCqH/6k/p6y9kbs99JCfP352U
 STX8zzoMaeHsgmpFrfjbbeajsk6Vp/1Mz+EHFXKVr/WfyMumoJKDLOh1MYbGoMdoeCXo
 71ZtnTn7zlYT1Vtm1JFD5uG4IbkRfFy6YIaqNlwRWunNNcOpN3YKLAhx4sBNGoJDy3Zy
 GpMNs3WYhVfssOSq9tIOU53EXSzH77RXC+9ejaLCdzzDTTcd+HYGsCPaS/amNoFDLqpY
 QngiUvKuxUc1wQgDoBOIybOrcu1iCBzpi524dJ9AnfxM2BZxu3RkqKZfDIsXVUHh0rBN
 xOCg==
X-Gm-Message-State: AOAM532DmnG95L6q3Sx1AW1mHhq0pECPpV9cKY72hUrcbRye33q/A9Nb
 aE8dABKO4rIdGCA5gGL77Rn+xG7GtpSxyhLK4xmf0vQvJNoNTikmSAWa9QXIVGvTrJUxBWUlfgn
 4DNaJ9A2+fCkoEpY=
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr3325584wrn.17.1614193544706; 
 Wed, 24 Feb 2021 11:05:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7zot1fjvj5NywiIGC2vtY0K/OckLZPQXZDowN+kCGX7hBr/9/a2wOmPIH4fkYPegtD7WuSg==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr3325566wrn.17.1614193544488; 
 Wed, 24 Feb 2021 11:05:44 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d15sm5320739wrb.43.2021.02.24.11.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 11:05:43 -0800 (PST)
Subject: Re: [PATCH 00/11] scsi-generic: error handling overhaul
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210224182453.587731-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2489ec0c-0a2a-ee19-2ad5-182fb9b20d90@redhat.com>
Date: Wed, 24 Feb 2021 20:05:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224182453.587731-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: hare@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 7:24 PM, Paolo Bonzini wrote:
> This series is mostly a refresh of Hannes's patches at
> https://patchew.org/QEMU/20201116184041.60465-1-hare@suse.de/, which
> haven't been applied yet because they broke the testsuite.
> 
> In addition to Hannes's introduction of host status in the SCSI
> subsystem, which survives mostly in patches 3 and 6-10, I am also changing
> scsi_handle_rw_error to always pass down guest-recoverable sense codes,
> even if rerror=stop/werror=stop.  Without this change, [rw]error=stop are
> mostly unusable because the guest will stop even for unit attention sense.
> 
> Paolo
> 
> Supersedes: <20201116184041.60465-1-hare@suse.de>
> 
> Hannes Reinecke (5):
>   scsi: drop 'result' argument from command_complete callback
>   scsi: Rename linux-specific SG_ERR codes to generic SCSI_HOST error
>     codes
>   scsi: Add mapping for generic SCSI_HOST status to sense codes
>   scsi: inline sg_io_sense_from_errno() into the callers.
>   scsi: move host_status handling into SCSI drivers
> 
> Paolo Bonzini (5):
>   scsi-disk: move scsi_handle_rw_error earlier
>   scsi-disk: do not complete requests early for rerror/werror=ignore
>   scsi: introduce scsi_sense_from_errno()
>   scsi-disk: pass SCSI status to scsi_handle_rw_error
>   scsi-disk: pass guest recoverable errors through even for rerror=stop

$ b4 am 20210224182453.587731-1-pbonzini@redhat.com
Grabbing thread from lore.kernel.org/qemu-devel
Analyzing 11 messages in the thread
---
  ERROR: missing [11/11]!
---
Total patches: 10
---
WARNING: Thread incomplete!

I suppose this is OK ;)

patchew is stuck too:
Only 10 patches received!
https://patchew.org/QEMU/20210224182453.587731-1-pbonzini@redhat.com/


