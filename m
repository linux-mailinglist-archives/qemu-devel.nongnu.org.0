Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C57847AF78
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:13:16 +0100 (CET)
Received: from localhost ([::1]:43916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKLj-0000SX-3u
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:13:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzCQM-0005Lt-HA
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:45:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzCQI-0001wL-7g
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639982724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewW7ofMxNk81jxj2j8XOJ6qF4KCJe88M4Yu6gr0LiEA=;
 b=gMVMgpc/X+oxTSyoumjLd0VcJGIk85Qzsuh2k4IhaSzek6XPCa+IPVrUHVhe0eJpPkGTm0
 sVc07NLWlyfyC6hhlwqhMDpdoERG/ZBd055/Yn3FER1mmE/QrHYZ9S+cWQKd+RangWn+zT
 uhT/lEGgYTi4peU7irD13d68JuBzppE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-e5H_yACqOj2-P7yPRXYKNw-1; Mon, 20 Dec 2021 01:45:22 -0500
X-MC-Unique: e5H_yACqOj2-P7yPRXYKNw-1
Received: by mail-wm1-f70.google.com with SMTP id
 b83-20020a1c1b56000000b0033283ea5facso2869965wmb.1
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 22:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ewW7ofMxNk81jxj2j8XOJ6qF4KCJe88M4Yu6gr0LiEA=;
 b=Gk8c3XJABTTqM6trhkVIQdnKr5RoVn1gMsYzF6JURShks6rHFByD34H0os7TyVnoQ9
 bmuISrnTG9rOBNztu/dVBJb98h2OSf3rLORmOzFJNLwqXDaJW2plUKTz0Y7qcex+iRjd
 boUqswG9umlbBFaviE2SFXbDL6fGpHkwUJf16OpY3SLaZ56ODh5mwauMO5uUsg40ZDO/
 /dvsyecT9YiKKP2+wS8Deq+D1NdL5TU8R5DB+gy3OPyfizeW/kC9ND02td9f7AwjEhVC
 uxwazxvCb58NPjbHXUNEPbnS5PBgCCVBB2L9TMzzcEpahZ3IGS5I/bkspaoCRde1HsaK
 Juig==
X-Gm-Message-State: AOAM531hBDpRUoN2QduCyDKQNueZgTzH3Z6cxAp7ORhT8QrSqUCkuJy8
 vGSLLRuOFgxJ9IhKO8MhrYxMDQKuetOVOiX+pjIE7wsP7Er1/dUP51cg5tdzwZwq8gEF1Ntien9
 U2dUN7pgHq9qmhzg=
X-Received: by 2002:a5d:5744:: with SMTP id q4mr11523061wrw.698.1639982721333; 
 Sun, 19 Dec 2021 22:45:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXck3o8QZ6+or0xDWEu5RBdXhvCbf6f/fQN+YX09lvKG3GMbAGdZTFgz7tcYbpyfm0TdVqYw==
X-Received: by 2002:a5d:5744:: with SMTP id q4mr11523052wrw.698.1639982721102; 
 Sun, 19 Dec 2021 22:45:21 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id l22sm14627121wmq.2.2021.12.19.22.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 22:45:20 -0800 (PST)
Message-ID: <29292a83-b411-c24a-1378-0c30cf71af29@redhat.com>
Date: Mon, 20 Dec 2021 07:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw: m68k: Add virt compat machine type for 7.0
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211218114340.1856757-1-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211218114340.1856757-1-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/2021 12.43, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
> Based-On: <20211217143948.289995-1-cohuck@redhat.com>
> 
>   hw/m68k/virt.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index 0efa4a45c7f4..78e926a55457 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -304,10 +304,17 @@ type_init(virt_machine_register_types)
>       } \
>       type_init(machvirt_machine_##major##_##minor##_init);
>   
> +static void virt_machine_7_0_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE(7, 0, true)
> +
>   static void virt_machine_6_2_options(MachineClass *mc)
>   {
> +    virt_machine_7_0_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
>   }
> -DEFINE_VIRT_MACHINE(6, 2, true)
> +DEFINE_VIRT_MACHINE(6, 2, false)
>   
>   static void virt_machine_6_1_options(MachineClass *mc)
>   {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


