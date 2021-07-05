Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD8E3BBE89
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:56:17 +0200 (CEST)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Q1A-0007qG-9k
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0PyM-0004IF-0Q
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:53:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0PyK-0003Ke-5C
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625496799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l01S25CgmqvwWXxo53yZyXtEORPRIS6AZmL6UdRL/B8=;
 b=Um0QNOY3YCvV5jjijfUMlJdn04yJzDh0zHheJr+E/esIZIUf+Y9wwUDyF7YseeC1lMmpcx
 kS57H/NpZF6hvR9J/2q4oj6DS8VKja2VSl3cMhcSV9IpIb+aENodv2aGDnRBnL2n2vVuig
 CjBnmeKWyS6OBRVBoQpwhqrbpjtfWH4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-ssYXNs11Oh2be75GNlWRcw-1; Mon, 05 Jul 2021 10:53:18 -0400
X-MC-Unique: ssYXNs11Oh2be75GNlWRcw-1
Received: by mail-wr1-f69.google.com with SMTP id
 j2-20020a0560001242b029012c82df4dbbso5405363wrx.23
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l01S25CgmqvwWXxo53yZyXtEORPRIS6AZmL6UdRL/B8=;
 b=oUvZoKoK9iNkKtzX/uMpVDPjeewT8zYJJg6tNRCW2rMkVRkOhQsZ/635LY8rUWB2+K
 /qPBtmiDVMpzBAq66ibHZe3XEeCICF6d6LyT2Sw7Foydd4CtPNIaxUn6BzZcQuqWRMhk
 xfg02KBZs032QEU0ygrjFESaDR1mgeNkAmuL62uaU86asZlUMDdknmHkHGcsjdZAQcxQ
 u7cRZK3Jsh2x+WZ4883IYe05dKKrQuc3oRXEM3n3OhQwMzBqm4fIvBiwBJ6rgWNkhyr4
 /txTRf6omchM7B7FchQSAQUmRUzBS4WBoUAKhNIzuJAwMOr04lc+ntyc+PDrD3NETiH9
 tZSw==
X-Gm-Message-State: AOAM531deKPlF7GV5e11ND1jcfEUwhtzOaVwCng45kWSywpbqTezI6sI
 SjuojPzfE8SWWncaNd9MH0RF6Qij15Q8nCNm3k7CltL8CqyPwSeEO1z7pRDapySYsb7Wl7rGEUk
 cnVfzomz/VRUADeI=
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr15245436wmq.138.1625496795457; 
 Mon, 05 Jul 2021 07:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCgU5+MDNXVS4BYtqPVhrINpri6nDBs2763Qna+Iez+b5cuaYsiy74nszFu8hAI8Zyn//UBQ==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr15245420wmq.138.1625496795273; 
 Mon, 05 Jul 2021 07:53:15 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t16sm13315297wrp.44.2021.07.05.07.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 07:53:14 -0700 (PDT)
Subject: Re: [PATCH v2] hw/display: fail early when multiple virgl devices are
 requested
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20210705104218.1161101-1-marcandre.lureau@redhat.com>
 <dd6a8650-0507-49eb-4a13-2c0356b7f3d1@redhat.com>
 <CAJ+F1CLWfv6vdiF33MKCNMQ7k_-1Eg+8dn_RLYnN+CTmdGJmGQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <44c153d6-eb86-ad27-219e-2558884faf20@redhat.com>
Date: Mon, 5 Jul 2021 16:53:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLWfv6vdiF33MKCNMQ7k_-1Eg+8dn_RLYnN+CTmdGJmGQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 1:08 PM, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Jul 5, 2021 at 3:03 PM Philippe Mathieu-Daudé <philmd@redhat.com
> <mailto:philmd@redhat.com>> wrote:
> 
>     On 7/5/21 12:42 PM, marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com> wrote:
>     > From: Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>     >
>     > This avoids failing to initialize virgl and crashing later on, and
>     clear
>     > the user expectations.
>     >
>     > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>     > ---
>     >  hw/display/virtio-gpu-gl.c | 5 +++++
>     >  1 file changed, 5 insertions(+)
>     >
>     > diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
>     > index aea9700d5c..bc55c4767e 100644
>     > --- a/hw/display/virtio-gpu-gl.c
>     > +++ b/hw/display/virtio-gpu-gl.c
>     > @@ -113,6 +113,11 @@ static void
>     virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
>     >      return;
>     >  #endif
>     > 
>     > +    if (!object_resolve_path_type("", TYPE_VIRTIO_GPU_GL, NULL)) {
> 
>     Isn't the condition inverted?
> 
> 
> No, it's easy to misread though. It returns NULL if there are no or
> multiple instances.
> 
> When realize() is reached the first time, we should have only one
> instance, and thus !NULL.

/**
 * object_resolve_path_type:
 * @path: the path to resolve
 * @typename: the type to look for.
 * @ambiguous: returns true if the path resolution failed because of an
 *   ambiguous match
 *
 * This is similar to object_resolve_path.  However, when looking for a
 * partial path only matches that implement the given type are considered.
 ...
 *
 * Returns: The matched object or NULL on path lookup failure.
 */

/**
 * object_resolve_path:
 ...
 * A successful result is only returned if
 * only one match is found.  If more than one match is found, a flag is
 * returned to indicate that the match was ambiguous.
 *
 * Returns: The matched object or NULL on path lookup failure.
 */

OK... but kinda obfuscated.

Could we add some helper to simplify code review, such:

bool object_type_instance_is_singleton(const char *typename);

(or better name)?

>     > +        error_setg(errp, "at most one %s device is permitted",
>     TYPE_VIRTIO_GPU_GL);
>     > +        return;
>     > +    }
>     > +
>     >      if (!display_opengl) {
>     >          error_setg(errp, "opengl is not available");
>     >          return;
>     >
> 
> 
> 
> 
> -- 
> Marc-André Lureau


