Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E57C31C70F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:57:59 +0100 (CET)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBvF8-0003Hv-Nb
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBvE3-0002r7-U2
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:56:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBvE2-0005mT-Cs
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613462209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6Lo5KZQJKmv7PdK2hrwhgZcqSAWi+dqk46gP3yNxBY=;
 b=KRA1fretenAv94dnaIKNUUsEJQoaJEKvTeBTkEmnthJoSxPhTexgx496ki7BjqM+u2jrLD
 EGA87bb6/7ng0lDQ4JBsfxd0qJz3rNMzo/uA3rIbinaS0fdSrh/wsucdRUByq9VzRFC+82
 dYH86ZGvSdGWWxhewZMWlH5+C1BPozg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-w-H94PbuOYiDmjdl8hUTtA-1; Tue, 16 Feb 2021 02:56:47 -0500
X-MC-Unique: w-H94PbuOYiDmjdl8hUTtA-1
Received: by mail-wm1-f71.google.com with SMTP id x20so10512950wmc.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B6Lo5KZQJKmv7PdK2hrwhgZcqSAWi+dqk46gP3yNxBY=;
 b=YEIg2yd5p3d9gwO3n9mMYLAnWLrrTUqIsW1sorDEnfOiz0TdRJ/t5Grvx4goAq4+wQ
 QLRWbXayYBzGg5kpsMVYI7k5+DsFwa/mZQ2JyYDuviTyr3aEXtkwxukLvNJmaLTKvC7w
 B9W7cP3ROCF/MtOEzTnfGHEjjjyOfq5FDvoABqUUax/nU1qIKNf4OQm24uJOJpkmSNbe
 WYYJ3uwKNHqAEb9N7oxPp5zBggGG7SNQ47WDPAUwvKphN1Hqeqn7ati0xDA+zTF8u0xu
 X59L3B/rLdY7SkMJIMD3cMq+q4TVQJ94VETwytdYcVv4JCbkUnj3v40vage4lu8DDzn0
 MSKg==
X-Gm-Message-State: AOAM530WNy2zjA131CFsdbxj+3xNmK+2ifBn55B76ArdsmQCkZYqatnH
 my782zYNrjAymYHwRzeGFQLEU0LHaDnk6j5V0+wY3kCkf/khYzbLN8AfCm9yPDLVOxo5joTqiXt
 y/lzH9YOtoq8mCoY=
X-Received: by 2002:adf:fdd0:: with SMTP id i16mr22546970wrs.215.1613462206825; 
 Mon, 15 Feb 2021 23:56:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJslf92Ds8rd9y8Jw2UvUX60j9VUrS+++rQDjqpnGFA418Hdp2+7AELqv7PVDOzwt3umSs0w==
X-Received: by 2002:adf:fdd0:: with SMTP id i16mr22546942wrs.215.1613462206651; 
 Mon, 15 Feb 2021 23:56:46 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o124sm2475247wmo.41.2021.02.15.23.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 23:56:46 -0800 (PST)
Subject: Re: [RFC PATCH 02/23] kvm: Switch KVM_CAP_READONLY_MEM to a per-VM
 ioctl()
To: Isaku Yamahata <isaku.yamahata@intel.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, alistair@alistair23.me, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, cohuck@redhat.com,
 mtosatti@redhat.com, xiaoyao.li@intel.com, seanjc@google.com
References: <cover.1613188118.git.isaku.yamahata@intel.com>
 <1c93f5dabe2ef573302ff362c0c6c525bbe8af43.1613188118.git.isaku.yamahata@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0f29a789-9822-3dd8-b827-e5b86b933059@redhat.com>
Date: Tue, 16 Feb 2021 08:56:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1c93f5dabe2ef573302ff362c0c6c525bbe8af43.1613188118.git.isaku.yamahata@intel.com>
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
Cc: kvm@vger.kernel.org, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Isaku,

On 2/16/21 3:12 AM, Isaku Yamahata wrote:
> Switch to making a VM ioctl() call for KVM_CAP_READONLY_MEM, which may
> be conditional on VM type in recent versions of KVM, e.g. when TDX is
> supported.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  accel/kvm/kvm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 47516913b7..351c25a5cb 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2164,7 +2164,7 @@ static int kvm_init(MachineState *ms)
>      }
>  
>      kvm_readonly_mem_allowed =
> -        (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
> +        (kvm_vm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);

Can this check with "recent KVM" be a problem with older ones?

Maybe for backward compatibility we need:

          = (kvm_vm_check_extension(s, KVM_CAP_READONLY_MEM) > 0) ||
            (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);

>      kvm_eventfds_allowed =
>          (kvm_check_extension(s, KVM_CAP_IOEVENTFD) > 0);
> 


