Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353C36EBA65
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 18:43:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqGJ1-00005q-To; Sat, 22 Apr 2023 12:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqGIz-00005T-HW
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:41:45 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqGIx-0003IB-BI
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:41:44 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1a9253d4551so26609275ad.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682181702; x=1684773702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QuhRFh/qfOU1tOhKtUTPEfBGwg8R0VJ8KiNscqBnm5c=;
 b=L91KPYs7/FDfvzhuSD8tHIWKqwYpJ05lytmrCcxgLPU5Qq2yMPq0/+1UvBOCJkExO5
 ny2QX0fkZ/SuyhGDhFPFIMB16sscOebFoYyfQZPvaO5xuPDvYb6WnP9pStVbY4eacyuD
 FRmP4XuLnC9f9jLHPFKa+wX2+ptX90cUHJ1Z8TbXPiJUZJPWHytrVtmj2jJMzM2v1E85
 i1hVK2xhT0fmYWaBMU5OEgo8exvVie3ENvlKLEe7TJFgKhOHpGVAy+fEqDyiw15VdK1I
 wDkLAh775GGleobAPyUI4wUcPqHGbej2mgbkE3l3kGnEX3Cyt2DjS0aW66VO1I86s+Q3
 LfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682181702; x=1684773702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QuhRFh/qfOU1tOhKtUTPEfBGwg8R0VJ8KiNscqBnm5c=;
 b=aAVVEWu6pBGftg0MVe+KGqrAN9vf+HCB5PTJHuWVsL0+tduYwNS3YLf5U8+/3VkPIu
 uFGwFXCuFjk9SfRfz4TcQKNVP8WT3Cjrk/fFNX+nDqkDssVQClTXgn/PSgtVGmRxTWtA
 X0AzXOQi7UMusTjFj+X3mKoO1ZuVjZBX2qELb5tX2tCk7HpBRELgfJfA2vAJLcDQYPMm
 BYvuOpjCFrkyUQcAlYqVrLtB78qBzg2qs66xpn7ACpbhm5PNhpZiFK/m+pucEprVkpDD
 /Py0x0W0bZAgY83K1ZGzqvKn6IR9Z4X9kx0IW6+nHCCta2A4VNOSfiEApgiNFUCLJI35
 tk7w==
X-Gm-Message-State: AAQBX9c4TjIJPktodwI3GccCizbaeLePUIxv8tggcjbyniuYaEKmp2kE
 Du6gYgAycqecDY8d/DwdLsU=
X-Google-Smtp-Source: AKy350adHDDwetADHpbt2RfFV/n5T8x7KPyEqyWK+A6m9Kw7W892S6TwuoITsr7f14VJ8hst/bk13w==
X-Received: by 2002:a17:903:64e:b0:1a6:a2df:4700 with SMTP id
 kh14-20020a170903064e00b001a6a2df4700mr8585783plb.9.1682181701654; 
 Sat, 22 Apr 2023 09:41:41 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a170902ed4100b001a6ebc39fd9sm4168918plb.309.2023.04.22.09.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 09:41:41 -0700 (PDT)
Message-ID: <3204858e-89f4-261c-0863-49aeb28600cf@gmail.com>
Date: Sun, 23 Apr 2023 01:41:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 00/13] gfxstream + rutabaga_gfx: a surprising delight
 or startling epiphany?
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@linaro.org,
 david@redhat.com, stefanha@redhat.com, kraxel@redhat.com,
 marcandre.lureau@redhat.com, dmitry.osipenko@collabora.com,
 ray.huang@amd.com, alex.bennee@linaro.org
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <CAJSP0QVrxSgFJFqPd=iBfBoV9brL2v6d6P+4E7BmGYAxwEYPmw@mail.gmail.com>
 <CAAfnVB=n8CJ7cL9kS84TMu1+hBrnWUYhaXAw7jhBPEra_EdgwQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAAfnVB=n8CJ7cL9kS84TMu1+hBrnWUYhaXAw7jhBPEra_EdgwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.047, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2023/04/22 8:54, Gurchetan Singh wrote:
> On Fri, Apr 21, 2023 at 9:02 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> On Thu, 20 Apr 2023 at 21:13, Gurchetan Singh
>> <gurchetansingh@chromium.org> wrote:
>>>
>>> From: Gurchetan Singh <gurchetansingh@google.com>
>>>
>>> Rationale:
>>>
>>> - gfxstream [a] is good for the Android Emulator/upstream QEMU
>>>    alignment
>>> - Wayland passhthrough [b] via the cross-domain context type is good
>>>    for Linux on Linux display virtualization
>>> - rutabaga_gfx [c] sits on top of gfxstream, cross-domain and even
>>>    virglrenderer
>>> - This series ports rutabaga_gfx to QEMU
>>
>> What rutabaga_gfx and gfxstream? Can you explain where they sit in the
>> stack and how they build on or complement virtio-gpu and
>> virglrenderer?
> 
> rutabaga_gfx and gfxstream are both libraries that implement the
> virtio-gpu protocol.  There's a document available in the Gitlab issue
> to see where they fit in the stack [a].
> 
> gfxstream grew out of the Android Emulator's need to virtualize
> graphics for app developers.  There's a short history of gfxstream in
> patch 10.  It complements virglrenderer in that it's a bit more
> cross-platform and targets different use cases -- more detail here
> [b].  The ultimate goal is ditch out-of-tree kernel drivers in the
> Android Emulator and adopt virtio, and porting gfxstream to QEMU would
> speed up that transition.

I wonder what is motivation for maintaining gfxstream instead of 
switching to virglrenderer/venus.

> 
> rutabaga_gfx is a much smaller Rust library that sits on top of
> gfxstream and even virglrenderer, but does a few extra things.  It
> implements the cross-domain context type, which provides Wayland
> passthrough.  This helps virtio-gpu by providing more modern display
> virtualization.  For example, Microsoft for WSL2 also uses a similar
> technique [c], but I believe it is not virtio-based nor open-source.

The guest side components of WSLg are open-source, but the host side is 
not: https://github.com/microsoft/wslg
It also uses DirectX for acceleration so it's not really portable for 
outside Windows.

> With this, we can have the same open-source Wayland passthrough
> solution on crosvm, QEMU and even Fuchsia [d].  Also, there might be
> an additional small Rust context type for security-sensitive use cases
> in the future -- rutabaga_gfx wouldn't compile its gfxstream bindings
> (since it's C++ based) in such cases.
> 
> Both gfxstream and rutabaga_gfx are a part of the virtio spec [e] now too.
> 
> [a] https://gitlab.com/qemu-project/qemu/-/issues/1611
> [b] https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04271.html
> [c] https://www.youtube.com/watch?v=EkNBsBx501Q
> [d] https://fuchsia-review.googlesource.com/c/fuchsia/+/778764
> [e] https://github.com/oasis-tcs/virtio-spec/blob/master/device-types/gpu/description.tex#L533
> 
>>
>> Stefan

