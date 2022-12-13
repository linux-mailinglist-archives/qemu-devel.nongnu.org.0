Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BBA64B0ED
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 09:16:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p50Ks-0001Ca-U7; Tue, 13 Dec 2022 03:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p50GL-0006lU-0k
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:03:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p50GI-0000hF-Ry
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670918617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9nW/2oeUTzZ2HAD5X7f+n944KatKI+CBQcZFmYdBPM=;
 b=Bw0NC09lax9Y23lrMQXIU3Hb51Vghu6iK33Yd/HX3v8FDe6ajRhpWfJopsKqJVDrl+zWQx
 q5SA3GuxPIgBUodH6erBUUKnuqFNa+Qphf/tD5Iie6Kb58r9vzA52l9FRelnqBPFhExIwI
 1fqH8GpdKFdPjfVld+kUwSz/ictIcKA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-jSCOb_coMiGuBrTMb9VVgA-1; Tue, 13 Dec 2022 03:03:36 -0500
X-MC-Unique: jSCOb_coMiGuBrTMb9VVgA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s1-20020adfa281000000b00241f7467851so2760483wra.17
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 00:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k9nW/2oeUTzZ2HAD5X7f+n944KatKI+CBQcZFmYdBPM=;
 b=0YEIhuZei6TqHNuVhZWNnKe2K4tPVtOC3QqL5xpoyx2pbhtvwzDfBeK42UM9J5S3ep
 iSOB0/oCMREB0ZW59GiQA/NV3+stYPEQncXiXuTr3cbRoeIdWlNis+r6QxcA+tRUT34S
 PxPAtPFHeQQkgeGCiJmc4U2WPY+nxymxSAjtKxCP4NWJk1UXMOHNpQwR9aRgFI/Fcgch
 gyoYP2CSLPj61ohI7Ydc2+4tzqmLtdd7afMO60JXuRbbfS0ezwyl1PZdpVUjkgkRia+Z
 9IbSacZ5YCfdmrBPA/7PddwPRPSoru3udg+oIZfdd7mfC4FdIFrlGMaAqdv6DDVvVciP
 68Og==
X-Gm-Message-State: ANoB5pk+3LDaVtwCe3pqS7vX7y3TUBM/POW0ScJBB83Px5HcQU3LmmuG
 ph9cV4tj/s2rAgjE7KbHQn8RVOvPOC5zap/2njsXz7/m0JLeGDYcOJuVLXLnimaI6STXRCjz/48
 uhoj+ANAL/DyqIVA=
X-Received: by 2002:a5d:4402:0:b0:242:3353:26f5 with SMTP id
 z2-20020a5d4402000000b00242335326f5mr10710433wrq.9.1670918615337; 
 Tue, 13 Dec 2022 00:03:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6rjfACyfl6/G27IKqXFGH0X1KlaIP9LFupazRSmxbG+u4RK146olFFSo/AO5tT6p0TbxYkVg==
X-Received: by 2002:a5d:4402:0:b0:242:3353:26f5 with SMTP id
 z2-20020a5d4402000000b00242335326f5mr10710411wrq.9.1670918615124; 
 Tue, 13 Dec 2022 00:03:35 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-131.web.vodafone.de.
 [109.43.178.131]) by smtp.gmail.com with ESMTPSA id
 c13-20020a5d4ccd000000b00228cbac7a25sm10695970wrt.64.2022.12.13.00.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 00:03:34 -0800 (PST)
Message-ID: <8bc3e65d-3f1f-22e5-d56e-2b8bb1a57319@redhat.com>
Date: Tue, 13 Dec 2022 09:03:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH-for-8.0 06/10] hw/virtio: Cache access_is_big_endian
 value in VirtIODevice state
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20221212230517.28872-1-philmd@linaro.org>
 <20221212230517.28872-7-philmd@linaro.org>
 <94c26d02-94d5-ec42-99bf-3fac080e567e@linaro.org>
 <8ed5aab1-402f-9d9b-c70e-5d8082d35d1e@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <8ed5aab1-402f-9d9b-c70e-5d8082d35d1e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/12/2022 08.30, Philippe Mathieu-Daudé wrote:
> On 13/12/22 01:14, Richard Henderson wrote:
>> On 12/12/22 17:05, Philippe Mathieu-Daudé wrote:
>>> The device endianness doesn't change during runtime.
>>
>> What are you talking about?  Of course it does.
> 
> The host CPU certainly does, but the virtio device doesn't... Does it?
> 
> This check only consider the device, not the CPU:
> 
>      bool virtio_access_is_big_endian(VirtIODevice *vdev)
>      {
>      #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
>          return virtio_is_big_endian(vdev);
>      #elif TARGET_BIG_ENDIAN
>          if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>              /*Devices conforming to VIRTIO 1.0 or later are always LE.*/
>              return false;
>          }
>          return true;

Well, this part here means that the endianness can indeed change on the 
device side during runtime. Depending on whether VIRTIO_F_VERSION_1 is 
negotiated or not, the device is little or big endian. Happens on s390x for 
example - for legacy virtio, big endian is used, and for modern virtio, 
little endian is used instead.

  Thomas


