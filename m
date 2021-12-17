Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09431478BD9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 13:55:13 +0100 (CET)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myClT-0005JG-LI
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 07:55:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myChq-0003Di-AB
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 07:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myChn-0001RU-W2
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 07:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639745482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWnJ1Zab9I7VDRD+HkFjf5+YVuTT7QFaBJIq53EXQyU=;
 b=QZT8fJz5h860Kg3XVzIZTAKMzUnD2bGmNWQuVtTTh/habZ3DN+ho2fzlzv8ReEf7C8hBDk
 T6fxc0gMSRzhCZHMk6WjxMC5XUKqa0wTXNHGcM4Sx0dIjYhwgGr5GQnehOBfD2P6a0n71+
 48qShrGZGUOsLMba1XERh+RiwtNscQo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-f1buP0NjNJ6C2kPTIFDOxw-1; Fri, 17 Dec 2021 07:51:21 -0500
X-MC-Unique: f1buP0NjNJ6C2kPTIFDOxw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j20-20020a05600c1c1400b00343ad0c4c40so2931552wms.0
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 04:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FWnJ1Zab9I7VDRD+HkFjf5+YVuTT7QFaBJIq53EXQyU=;
 b=nQM2NwbhcVaLIAwh0/E7AuLUwfTYNYWqZtdbgNgfL6UmnuJ4EH7i0zYbtvp14leedc
 PhL+6+YTADr7r+ctrNQVmLamu+qAbRgEX1TZKVj3YoSGqQvYAeUrAiC0gn7CoVsGNYIh
 +0DpamEwSSDMPyVUrtRaQd3pbmp2MNUvm0TZiIqLAK8NLssZP7N8ZR2h7aHtmNBo7lJH
 8i2qvJjK40mAk704sNyxf7hU7/zhbCVNOrOoB3Xb5d94ElsCTmj3Ldr6gZUBryGtD88c
 llCHK6cPnIwYNDl4qlcILwLyMb6sFuGymNajElJzIsj9WWMGtRLIVfXezPNnicTJ751e
 9n0w==
X-Gm-Message-State: AOAM5326wFMensNUbst8t9MKxOvWxc6opZb5KIZ/kMoOGOCzpFCC2rw0
 P7Yoj5TFyqTjiuzdfShKhkzmgHaLWdy9C3plFBzqVrAmlT2t9VUR4D5iJgtMUam04TRlaWLdTIH
 VDj+DrVOjPK08BBM=
X-Received: by 2002:a1c:741a:: with SMTP id p26mr9622094wmc.133.1639745480588; 
 Fri, 17 Dec 2021 04:51:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6wegXW99QZRkvPTAmDoRF2UBKQ4iwPMSjxLSH0BN7EJN6prChoJ8q7dxmR7YfBHb8hQDTHQ==
X-Received: by 2002:a1c:741a:: with SMTP id p26mr9622081wmc.133.1639745480392; 
 Fri, 17 Dec 2021 04:51:20 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n14sm8911602wrf.69.2021.12.17.04.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 04:51:20 -0800 (PST)
Message-ID: <9aed129e-519f-2252-d169-a2a396db6460@redhat.com>
Date: Fri, 17 Dec 2021 13:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 09/37] virtio-gpu: use VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-10-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211009210838.2219430-10-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/21 23:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/display/virtio-gpu-virgl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


