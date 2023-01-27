Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B4467DFA3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 10:05:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLKeN-000504-4s; Fri, 27 Jan 2023 04:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pLKeA-0004vZ-S3
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 04:03:52 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pLKe8-00083E-Ra
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 04:03:46 -0500
Received: by mail-wr1-x436.google.com with SMTP id q10so4328125wrm.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 01:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bv7KWQkUZ0Rx2oz8hrTDrTbihQGV9nGJo5Xum9BrDfA=;
 b=OZwJk3eR2w4OSY/e4BapHd1lyorw3Qu3elS8CfK+3A27xcR6+sHQ7Fmf5b8V3LAHQv
 F5qlX3ZTHIiQ72fFwkEJHOUudDMJx/4sIP8Gli4QG/VLsqp6v/VLWPUvwJwJy3hvbUMj
 Zc6c8hqZDyyZQbN4UwAE7CiNMfI4MZmEhPyyKAJgnRbjb33oZXMF6O4M1QYkgpiECYTP
 q7FvWBynJaf9p/eY1oI8PHGTEhmJFS5xYvZdbNCYJZ7BknB14PPqVQBz9lQL4n78cZzQ
 0uXVFk7oEGPGFQl9/voeaPnt9WyphkAmaPMr/lrgY1ddxsV8tAg7briF7UfInwld9FbP
 krhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bv7KWQkUZ0Rx2oz8hrTDrTbihQGV9nGJo5Xum9BrDfA=;
 b=65oLvY4uOZ56xnLo13uCJlwECU2DagOLPIPC8eNpkIG2WYRskYEZoWoLvN0JwkR8Da
 WOPur5Nuiuu2ZHBW1FzRP7v2IoD3d+ha5vRksny2erso5XCAyrLfweBBw8dDPL48eKZe
 QK/KSgFRUXKyxsWdhL311bSmJeoumW7aJW8KpHEYtzTeNCae1dYwhE+YxOCGnKr1GtVH
 CNjUsfdyrsfvyfiS856IKE/0iiCR19mAD7LrE29GXgzyEUb0hrrJowVbr7VCX8QYaXEB
 NmB+yriAs3WqlPdgXJ4v6GXvCpZpLdOR/KX8M0rjxK2qrIwgE/zOmAX5blRlAFbiUPkO
 OxOw==
X-Gm-Message-State: AFqh2koHgUv81zi6PMdCyHaVGnmPXvrL0JuG/zrZWSMdvXWr4qgEHoTt
 Cux2hGZJt0v7QyAtSC8qigU=
X-Google-Smtp-Source: AMrXdXtc8oQIV58v+TGJVMZXwavuLIoliPQ6sKMKw6h/AfnzacipjGxp1KZ4LgM/ccaZ05696dgq9w==
X-Received: by 2002:a5d:6186:0:b0:2bd:dc24:cade with SMTP id
 j6-20020a5d6186000000b002bddc24cademr28258235wru.16.1674810222919; 
 Fri, 27 Jan 2023 01:03:42 -0800 (PST)
Received: from [192.168.14.147] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adfe707000000b002bfb0c5527esm3438297wrm.109.2023.01.27.01.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 01:03:42 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <818cf8c1-6d2a-1542-8bbd-53616290f2ce@xen.org>
Date: Fri, 27 Jan 2023 09:03:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8 28/58] hw/xen: Implement EVTCHNOP_status
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230120131343.1441939-1-dwmw2@infradead.org>
 <20230120131343.1441939-29-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230120131343.1441939-29-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/01/2023 13:13, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This adds the basic structure for maintaining the port table and reporting
> the status of ports therein.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 104 ++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |   3 ++
>   include/sysemu/kvm_xen.h  |   3 ++
>   target/i386/kvm/xen-emu.c |  20 +++++++-
>   4 files changed, 128 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


