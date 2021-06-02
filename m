Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F479397FA8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:45:52 +0200 (CEST)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHpH-0005Cw-5V
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loHo6-0003uV-Kp
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:44:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loHo4-0003WE-6f
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622605475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T03zX1j7Xj+a8n9mAt4NHTzivR2tnmQyWE59her6X/o=;
 b=FcG3FZKw38i2pdU1ZEmAnd827Oyt6vIljwj7Ni7BlkIZ367hd3p+4EAgXvaDjKDM33x2EL
 O1YzHtjzGzV+BOIBdtOM8apl1xqa+PEV12QlP+7PGCC50SIDBTSkw+RoUBDxuyK3Kt3aSz
 TJ7bdD/C6/8NZzNQheHflKUSE6B1K7c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-D9p7rYhoNf-JXjtP_kjXmQ-1; Tue, 01 Jun 2021 23:44:34 -0400
X-MC-Unique: D9p7rYhoNf-JXjtP_kjXmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 h18-20020a05600c3512b029018434eb1bd8so1607176wmq.2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 20:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T03zX1j7Xj+a8n9mAt4NHTzivR2tnmQyWE59her6X/o=;
 b=QgrVluUob0K5rnPvEgq+AxWvYGtLKzvH5Nm7g6uU/po520YZIjtsb4Y1tIPTzc4sip
 Q4ZdgWChmVzLA0MLWjIWhBd1t8jX0QIMxvmFSp8OmyFPGdSFMkhQi4QwmXnTJejfphTK
 euBhWSbgB6FiafEuS1cfhpZuQE0+TqHqcjexfnpwrGGhSix7n5GXVkIwFSFnrIuAUShx
 BfTLK8uJDdDI+dgLsBfkqTYM70uCqEbdFdUUi48tb0FiJWXZsouz+gXP/dIfInCcr1k8
 vR1iSIJfzM6uv6YAp0IfyLEc1hcPaSMWuVRTdQeIICwqmcKRuEEiubzlp/thPT3U6+pw
 U8RQ==
X-Gm-Message-State: AOAM532/yd0JAbEWNoyJB7To4/arf+AIg0b9GdIxHjr8E3ak2MdeYnbV
 JET/QZSupY8GZCCDZ3ofj1UWmELX18gBB9jHkPXgQnFFwXvQ7Wo2F9Kf6JySnz7G1y6ydtpxnOa
 uln3ffpKakBTMo9M=
X-Received: by 2002:a1c:bc09:: with SMTP id m9mr12632833wmf.143.1622605472928; 
 Tue, 01 Jun 2021 20:44:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCDHmLhLa79+lQTQgLauJFXxReAg7CPc4Tla3BY+RzS+8CvhQd0nBt7O6L80M8OF8MWqf9zg==
X-Received: by 2002:a1c:bc09:: with SMTP id m9mr12632819wmf.143.1622605472735; 
 Tue, 01 Jun 2021 20:44:32 -0700 (PDT)
Received: from thuth.remote.csb (p5791de31.dip0.t-ipconnect.de.
 [87.145.222.49])
 by smtp.gmail.com with ESMTPSA id j101sm5713938wrj.66.2021.06.01.20.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 20:44:32 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ui/vdagent: fix clipboard info memory leak in
 error path
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210601155755.216949-1-stefanha@redhat.com>
 <20210601155755.216949-3-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <67c212eb-2f80-b36c-e169-62f7caee1376@redhat.com>
Date: Wed, 2 Jun 2021 05:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210601155755.216949-3-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/06/2021 17.57, Stefan Hajnoczi wrote:
> If the size of a VD_AGENT_CLIPBOARD_GRAB message is invalid we leak info
> when returning early.
> 
> Thanks to Coverity for spotting this:
> 
> *** CID 1453266:  Resource leaks  (RESOURCE_LEAK)
> /qemu/ui/vdagent.c: 465 in vdagent_chr_recv_clipboard()
> 459             info = qemu_clipboard_info_new(&vd->cbpeer, s);
> 460             if (size > sizeof(uint32_t) * 10) {
> 461                 /*
> 462                  * spice has 6 types as of 2021. Limiting to 10 entries
> 463                  * so we we have some wiggle room.
> 464                  */
>>>>      CID 1453266:  Resource leaks  (RESOURCE_LEAK)
>>>>      Variable "info" going out of scope leaks the storage it points to.
> 465                 return;
> 466             }
> 467             while (size >= sizeof(uint32_t)) {
> 468                 trace_vdagent_cb_grab_type(GET_NAME(type_name, *(uint32_t *)data));
> 469                 switch (*(uint32_t *)data) {
> 470                 case VD_AGENT_CLIPBOARD_UTF8_TEXT:
> 
> Fixes: f0349f4d8947ad32d0fa4678cbf5dbb356fcbda1 ("ui/vdagent: add clipboard support")
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   ui/vdagent.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index a253a8fe63..8fc54d330e 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -456,7 +456,6 @@ static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
>       switch (msg->type) {
>       case VD_AGENT_CLIPBOARD_GRAB:
>           trace_vdagent_cb_grab_selection(GET_NAME(sel_name, s));
> -        info = qemu_clipboard_info_new(&vd->cbpeer, s);
>           if (size > sizeof(uint32_t) * 10) {
>               /*
>                * spice has 6 types as of 2021. Limiting to 10 entries
> @@ -464,6 +463,7 @@ static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
>                */
>               return;
>           }
> +        info = qemu_clipboard_info_new(&vd->cbpeer, s);
>           while (size >= sizeof(uint32_t)) {
>               trace_vdagent_cb_grab_type(GET_NAME(type_name, *(uint32_t *)data));
>               switch (*(uint32_t *)data) {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


